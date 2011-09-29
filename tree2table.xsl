<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:output indent="yes"/>

  <xsl:template match="/">
    <table border="1">
      <!-- Each leaf node maps to a <tr>. -->
      <xsl:apply-templates mode="tr" select="//*[not(*)]"/>
    </table>
  </xsl:template> 

  <xsl:template mode="tr" match="*">
    <xsl:variable name="td-nodes" as="element()+">
      <xsl:apply-templates mode="get-children" select="."/>
    </xsl:variable>
    <tr>
      <xsl:apply-templates mode="td" select="$td-nodes/."/>
    </tr>
  </xsl:template>

          <!-- The <td> children for a <tr> consist of the current leaf node itself
               and, if it's the first child, its parent, applied recursively up the tree. -->
          <xsl:template mode="get-children" match="*">
            <!-- Always include the current node -->
            <xsl:sequence select="."/>
            <!-- Only process the parent if this node is the first child -->
            <xsl:if test="not(preceding-sibling::*)">
              <xsl:apply-templates mode="get-children" select=".."/>
            </xsl:if>
          </xsl:template>

          <!-- Stop at, and exclude, the document element -->
          <xsl:template mode="get-children" match="/*"/>


  <xsl:template mode="td" match="*">
    <!-- The rowspan value of each <td> is the count of the
         current node's descendant-or-self leaf nodes. -->
    <td rowspan="{count(descendant-or-self::*[not(*)])}">
      <xsl:value-of select="@val"/>
    </td>
  </xsl:template>
   
</xsl:stylesheet>
