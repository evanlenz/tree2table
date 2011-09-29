declare variable $input := doc("input.xml");

declare function local:get-children($node as element()) {
  $node | (if (not($node/preceding-sibling::*)) then local:get-children($node/parent::*)
                                                else ())
};

<table border="1">{
  for $leaf in $input//*[not(*)] return
  <tr>{
    for $child in local:get-children($leaf) return
    <td rowspan="{count($child/descendant-or-self::*[not(*)])}">{
      text{$child/@val}
    }</td>
  }</tr>
}</table>
