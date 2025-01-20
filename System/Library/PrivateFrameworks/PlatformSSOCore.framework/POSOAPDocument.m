@interface POSOAPDocument
+ (id)definition;
- (NSString)description;
- (POSOAPEnvelope)Envelope;
- (id)XMLStringWithOptions:(unint64_t)a3;
- (void)_XMLAttributeStringWithPrefix:(id)a3 name:(id)a4 value:(id)a5 options:(unint64_t)a6 appendingToString:(id)a7;
- (void)_XMLAttributesStringWithComplexType:(id)a3 options:(unint64_t)a4 appendingToString:(id)a5;
- (void)_XMLQualifiedNameForNamespace:(id)a3 elementName:(id)a4 options:(unint64_t)a5 appendingToString:(id)a6;
- (void)_XMLStringWithComplexType:(id)a3 options:(unint64_t)a4 appendingToString:(id)a5;
- (void)_XMLStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)setEnvelope:(id)a3;
@end

@implementation POSOAPDocument

+ (id)definition
{
  v2 = objc_opt_new();
  [v2 addElementWithName:@"Envelope" namespaceURI:@"http://www.w3.org/2003/05/soap-envelope" type:objc_opt_class()];
  return v2;
}

- (NSString)description
{
  return (NSString *)+[POXSComplexTypeDefinition descriptionForValue:self];
}

- (id)XMLStringWithOptions:(unint64_t)a3
{
  v5 = [MEMORY[0x263F089D8] string];
  [(POSOAPDocument *)self _XMLStringWithOptions:a3 appendingToString:v5];
  return v5;
}

- (void)_XMLQualifiedNameForNamespace:(id)a3 elementName:(id)a4 options:(unint64_t)a5 appendingToString:(id)a6
{
  id v10 = a4;
  id v8 = a6;
  v9 = +[POXSNamespaces prefixForNamespaceURI:a3];
  if ([v9 length])
  {
    [v8 appendString:v9];
    [v8 appendString:@":"];
  }
  [v8 appendString:v10];
}

- (void)_XMLAttributeStringWithPrefix:(id)a3 name:(id)a4 value:(id)a5 options:(unint64_t)a6 appendingToString:(id)a7
{
  id v13 = a3;
  id v10 = a4;
  id v11 = a7;
  id v12 = a5;
  [v11 appendString:@" "];
  if ([v13 length])
  {
    [v11 appendString:v13];
    if (![v10 length]) {
      goto LABEL_6;
    }
    [v11 appendString:@":"];
  }
  else if (![v10 length])
  {
    goto LABEL_6;
  }
  [v11 appendString:v10];
LABEL_6:
  [v11 appendString:@"=\""];
  [v11 appendString:v12];

  [v11 appendString:@"\""];
}

- (void)_XMLAttributesStringWithComplexType:(id)a3 options:(unint64_t)a4 appendingToString:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v28 = a5;
  +[POXSDefinitions definitionForType:objc_opt_class()];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v33 = long long v41 = 0u;
  obuint64_t j = [v33 attributes];
  uint64_t v7 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  v31 = v6;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v12 = objc_msgSend(v6, "valueForKey:", v11, v28);
        if (v12)
        {
          id v13 = [v33 isSpecifiedKeyForAttributeName:v11];
          if (!v13
            || ([v6 valueForKey:v13],
                v14 = objc_claimAutoreleasedReturnValue(),
                int v15 = [v14 BOOLValue],
                v14,
                v15))
          {
            v16 = +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", [v33 typeForName:v11]);
            v17 = [v33 namespaceForAttributeName:v11];
            v18 = [v16 stringFromValue:v12];
            if (v18)
            {
              v19 = +[POXSNamespaces prefixForNamespaceURI:v17];
              [(POSOAPDocument *)self _XMLAttributeStringWithPrefix:v19 name:v11 value:v18 options:a4 appendingToString:v28];

              id v6 = v31;
            }
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v8);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v20 = [v33 namespaces];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
  v22 = v28;
  if (v21)
  {
    uint64_t v23 = v21;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v20);
        }
        uint64_t v26 = *(void *)(*((void *)&v34 + 1) + 8 * j);
        v27 = +[POXSNamespaces prefixForNamespaceURI:](POXSNamespaces, "prefixForNamespaceURI:", v26, v28);
        [(POSOAPDocument *)self _XMLAttributeStringWithPrefix:@"xmlns" name:v27 value:v26 options:a4 appendingToString:v22];
      }
      uint64_t v23 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v23);
  }
}

- (void)_XMLStringWithComplexType:(id)a3 options:(unint64_t)a4 appendingToString:(id)a5
{
  uint64_t v121 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v10 = +[POXSDefinitions definitionForType:objc_opt_class()];
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  obuint64_t j = [v10 elements];
  uint64_t v98 = [obj countByEnumeratingWithState:&v115 objects:v120 count:16];
  if (v98)
  {
    uint64_t v97 = *(void *)v116;
    id v92 = v8;
    v93 = v10;
    v103 = self;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v116 != v97) {
          objc_enumerationMutation(obj);
        }
        uint64_t v100 = v11;
        id v12 = *(void **)(*((void *)&v115 + 1) + 8 * v11);
        id v13 = [v12 elementName];
        uint64_t v14 = [v8 valueForKey:v13];

        v101 = (void *)v14;
        if (v14)
        {
          v109 = v12;
          uint64_t v15 = [v12 elementName];
          uint64_t v16 = [v10 typeForName:v15];
          v105 = +[POXSDefinitions definitionForType:v16];
          v99 = (void *)v15;
          v17 = [v10 isSpecifiedKeyForElementName:v15];
          if (v17
            && ([v8 valueForKey:v17],
                v18 = objc_claimAutoreleasedReturnValue(),
                int v19 = [v18 BOOLValue],
                v18,
                !v19))
          {
            v31 = v105;
          }
          else
          {
            v96 = v17;
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              if (isKindOfClass)
              {
                v20 = v101;
                uint64_t v21 = v109;
                if ([v10 flattenMultiValueElementWithName:v99])
                {
                  int v94 = 0;
                }
                else
                {
                  [v9 appendString:@"<"];
                  long long v38 = [v109 namespaceURI];
                  long long v39 = [v109 elementName];
                  [(POSOAPDocument *)self _XMLQualifiedNameForNamespace:v38 elementName:v39 options:a4 appendingToString:v9];

                  [v9 appendString:@">"];
                  int v94 = 1;
                }
              }
              else
              {
                int v94 = 0;
                v20 = v101;
                uint64_t v21 = v109;
              }
              long long v113 = 0u;
              long long v114 = 0u;
              long long v111 = 0u;
              long long v112 = 0u;
              id v106 = v20;
              uint64_t v110 = [v106 countByEnumeratingWithState:&v111 objects:v119 count:16];
              if (!v110) {
                goto LABEL_49;
              }
              uint64_t v107 = *(void *)v112;
              while (1)
              {
                for (uint64_t i = 0; i != v110; ++i)
                {
                  if (*(void *)v112 != v107) {
                    objc_enumerationMutation(v106);
                  }
                  long long v41 = *(void **)(*((void *)&v111 + 1) + 8 * i);
                  id v42 = v21;
                  uint64_t v43 = objc_opt_class();
                  if (isKindOfClass)
                  {
                    uint64_t v44 = [v105 elementForValue:v41];

                    v45 = [v44 elementName];
                    uint64_t v46 = [v105 typeForName:v45];

                    id v42 = v44;
                  }
                  else
                  {
                    uint64_t v46 = v43;
                  }
                  [v9 appendString:@"<"];
                  v47 = [v42 namespaceURI];
                  v48 = [v42 elementName];
                  [(POSOAPDocument *)self _XMLQualifiedNameForNamespace:v47 elementName:v48 options:a4 appendingToString:v9];

                  v49 = +[POXSDefinitions definitionForType:v46];
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v52 = v9;
                      if (v41)
                      {
                        [v9 appendString:@">"];
                        v53 = [v49 stringFromValue:v41];
                        [v9 appendString:v53];

LABEL_38:
                        [v9 appendString:@"</"];
                        v54 = [v42 namespaceURI];
                        v55 = [v42 elementName];
                        [(POSOAPDocument *)self _XMLQualifiedNameForNamespace:v54 elementName:v55 options:a4 appendingToString:v9];

                        v52 = v9;
                        v56 = @">";
                      }
                      else
                      {
                        v56 = @"/>";
                      }
                      [v52 appendString:v56];
                      goto LABEL_47;
                    }
LABEL_43:
                    [v9 appendString:@"/>"];
                    goto LABEL_47;
                  }
                  [(POSOAPDocument *)self _XMLAttributesStringWithComplexType:v41 options:a4 appendingToString:v9];
                  v50 = [v49 elements];
                  uint64_t v51 = [v50 count];

                  if (v51)
                  {
                    [v9 appendString:@">"];
                    [(POSOAPDocument *)self _XMLStringWithComplexType:v41 options:a4 appendingToString:v9];
                    goto LABEL_38;
                  }
                  v57 = [v49 contentPropertyName];

                  if (!v57) {
                    goto LABEL_43;
                  }
                  v58 = +[POXSDefinitions definitionForType:v46];
                  v59 = [v58 contentPropertyName];
                  v104 = v58;
                  uint64_t v60 = [v58 typeForName:v59];
                  v61 = [v41 valueForKey:v59];
                  v62 = +[POXSDefinitions definitionForType:v60];
                  v63 = [v62 stringFromValue:v61];
                  if (v63)
                  {
                    [v9 appendString:@">"];
                    [v9 appendString:v63];
                    [v9 appendString:@"</"];
                    v64 = [v42 namespaceURI];
                    [v42 elementName];
                    v102 = v59;
                    v65 = v62;
                    v66 = v61;
                    v68 = unint64_t v67 = a4;
                    [(POSOAPDocument *)v103 _XMLQualifiedNameForNamespace:v64 elementName:v68 options:v67 appendingToString:v9];

                    a4 = v67;
                    v61 = v66;
                    v62 = v65;
                    v59 = v102;

                    self = v103;
                    v69 = @">";
                  }
                  else
                  {
                    v69 = @"/>";
                  }
                  [v9 appendString:v69];

LABEL_47:
                  uint64_t v21 = v109;
                }
                uint64_t v110 = [v106 countByEnumeratingWithState:&v111 objects:v119 count:16];
                if (!v110)
                {
LABEL_49:

                  if (v94)
                  {
                    [v9 appendString:@"</"];
                    v70 = [v21 namespaceURI];
                    v71 = [v21 elementName];
                    [(POSOAPDocument *)self _XMLQualifiedNameForNamespace:v70 elementName:v71 options:a4 appendingToString:v9];

                    [v9 appendString:@">"];
                  }
                  v31 = v105;
                  id v8 = v92;
                  goto LABEL_52;
                }
              }
            }
            objc_opt_class();
            v22 = v105;
            if (objc_opt_isKindOfClass())
            {
              [v9 appendString:@"<"];
              uint64_t v23 = [v109 namespaceURI];
              uint64_t v24 = [v109 elementName];
              [(POSOAPDocument *)self _XMLQualifiedNameForNamespace:v23 elementName:v24 options:a4 appendingToString:v9];

              [(POSOAPDocument *)self _XMLAttributesStringWithComplexType:v101 options:a4 appendingToString:v9];
              v25 = [v105 elements];
              uint64_t v26 = [v25 count];

              if (v26)
              {
                [v9 appendString:@">"];
                [(POSOAPDocument *)self _XMLStringWithComplexType:v101 options:a4 appendingToString:v9];
                [v9 appendString:@"</"];
                v27 = [v109 namespaceURI];
                id v28 = [v109 elementName];
                [(POSOAPDocument *)self _XMLQualifiedNameForNamespace:v27 elementName:v28 options:a4 appendingToString:v9];

                v29 = v9;
                v30 = @">";
              }
              else
              {
                v78 = [v105 contentPropertyName];

                if (v78)
                {
                  v79 = [v105 contentPropertyName];
                  uint64_t v80 = [v105 typeForName:v79];
                  v81 = [v101 valueForKey:v79];
                  v82 = +[POXSDefinitions definitionForType:v80];
                  v83 = [v82 stringFromValue:v81];
                  id v8 = v92;
                  if (v83)
                  {
                    [v9 appendString:@">"];
                    [v9 appendString:v83];
                    [v9 appendString:@"</"];
                    v84 = [v109 namespaceURI];
                    v85 = [v109 elementName];
                    [(POSOAPDocument *)v103 _XMLQualifiedNameForNamespace:v84 elementName:v85 options:a4 appendingToString:v9];

                    v22 = v105;
                    v86 = @">";
                  }
                  else
                  {
                    v86 = @"/>";
                  }
                  [v9 appendString:v86];

                  v31 = v22;
                  goto LABEL_52;
                }
                v29 = v9;
                v30 = @"/>";
              }
              [v29 appendString:v30];
              v31 = v105;
              v17 = v96;
              id v8 = v92;
              goto LABEL_54;
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v32 = [v105 elementForValue:v101];
              v33 = [v32 namespaceURI];
              long long v34 = [v32 elementName];
              [v9 appendString:@"<"];
              [(POSOAPDocument *)self _XMLQualifiedNameForNamespace:v33 elementName:v34 options:a4 appendingToString:v9];
              [(POSOAPDocument *)self _XMLAttributesStringWithComplexType:v101 options:a4 appendingToString:v9];
              v31 = +[POXSDefinitions definitionForType:](POXSDefinitions, "definitionForType:", [v32 type]);

              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v35 = [v31 elements];
                uint64_t v36 = [v35 count];

                if (v36)
                {
                  [v9 appendString:@">"];
                  long long v37 = v103;
                  [(POSOAPDocument *)v103 _XMLStringWithComplexType:v101 options:a4 appendingToString:v9];
                  goto LABEL_66;
                }
              }
              objc_opt_class();
              char v87 = objc_opt_isKindOfClass();
              v88 = @"/>";
              if (v87)
              {
                uint64_t v89 = [v31 stringFromValue:v101];
                if (v89)
                {
                  v90 = (void *)v89;
                  [v9 appendString:@">"];
                  [v9 appendString:v90];

                  long long v37 = v103;
LABEL_66:
                  [v9 appendString:@"</"];
                  [(POSOAPDocument *)v37 _XMLQualifiedNameForNamespace:v33 elementName:v34 options:a4 appendingToString:v9];
                  v88 = @">";
                }
                else
                {
                  v88 = @"/>";
                }
              }
              [v9 appendString:v88];

              id v10 = v93;
            }
            else
            {
              v72 = +[POXSDefinitions definitionForType:v16];
              v73 = [v72 stringFromValue:v101];
              if (v73)
              {
                [v9 appendString:@"<"];
                v74 = [v109 namespaceURI];
                v75 = [v109 elementName];
                [(POSOAPDocument *)self _XMLQualifiedNameForNamespace:v74 elementName:v75 options:a4 appendingToString:v9];

                [v9 appendString:@">"];
                [v9 appendString:v73];
                [v9 appendString:@"</"];
                v76 = [v109 namespaceURI];
                v77 = [v109 elementName];
                [(POSOAPDocument *)self _XMLQualifiedNameForNamespace:v76 elementName:v77 options:a4 appendingToString:v9];

                [v9 appendString:@">"];
              }

              v31 = v105;
LABEL_52:
              id v10 = v93;
            }
            v17 = v96;
          }
LABEL_54:

          self = v103;
        }

        uint64_t v11 = v100 + 1;
      }
      while (v100 + 1 != v98);
      uint64_t v91 = [obj countByEnumeratingWithState:&v115 objects:v120 count:16];
      uint64_t v98 = v91;
    }
    while (v91);
  }
}

- (void)_XMLStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v8 = v6;
  if ((a3 & 1) == 0)
  {
    [v6 appendString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
    id v7 = v8;
  }
  [(POSOAPDocument *)self _XMLStringWithComplexType:self options:a3 appendingToString:v7];
}

- (POSOAPEnvelope)Envelope
{
  return self->_Envelope;
}

- (void)setEnvelope:(id)a3
{
}

- (void).cxx_destruct
{
}

@end