(: This is the same script using Carrot instead of XSLT :)

^  (/) := <table>{^tr(//*[not(*)])}</table>;
^tr(*) := <tr>{^get-children(.)/^td(.)}</tr>;
^td(*) := <td rowspan="{count(descendant-or-self::*[not(*)])}">{text{@val}}</td>;

^get-children(*) := . | (if (not(preceding-sibling::*)) then ^get-children(parent::*)
                                                        else ());
