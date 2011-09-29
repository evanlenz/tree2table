This short XSLT script converts an XML tree structure into
an HTML table that uses @rowspan values to "nest" descendants
to the right.

Example input:

```xml
<root val="root">
  <a val="123">
    <b val="xyz">
      <c val="456"/>
      <c val="789"/>
    </b>
    <b val="abc">
      <c val="def">
        <d val="mno"/>
        <d val="pqr"/>
      </c>
    </b>
  </a>
  <a val="321">
    <b val="654">
      <c val="987"/>
      <c val="ghi"/>
      <c val="jkl"/>
    </b>
  </a>
</root>
```

Corresponding output:

<table border="1">
   <tr>
      <td rowspan="7">root</td>
      <td rowspan="4">123</td>
      <td rowspan="2">xyz</td>
      <td rowspan="1">456</td>
   </tr>
   <tr>
      <td rowspan="1">789</td>
   </tr>
   <tr>
      <td rowspan="2">abc</td>
      <td rowspan="2">def</td>
      <td rowspan="1">mno</td>
   </tr>
   <tr>
      <td rowspan="1">pqr</td>
   </tr>
   <tr>
      <td rowspan="3">321</td>
      <td rowspan="3">654</td>
      <td rowspan="1">987</td>
   </tr>
   <tr>
      <td rowspan="1">ghi</td>
   </tr>
   <tr>
      <td rowspan="1">jkl</td>
   </tr>
</table>


Source of output:

```xml
<table border="1">
   <tr>
      <td rowspan="7">root</td>
      <td rowspan="4">123</td>
      <td rowspan="2">xyz</td>
      <td rowspan="1">456</td>
   </tr>
   <tr>
      <td rowspan="1">789</td>
   </tr>
   <tr>
      <td rowspan="2">abc</td>
      <td rowspan="2">def</td>
      <td rowspan="1">mno</td>
   </tr>
   <tr>
      <td rowspan="1">pqr</td>
   </tr>
   <tr>
      <td rowspan="3">321</td>
      <td rowspan="3">654</td>
      <td rowspan="1">987</td>
   </tr>
   <tr>
      <td rowspan="1">ghi</td>
   </tr>
   <tr>
      <td rowspan="1">jkl</td>
   </tr>
</table>
```
