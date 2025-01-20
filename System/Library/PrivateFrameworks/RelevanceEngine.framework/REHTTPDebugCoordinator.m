@interface REHTTPDebugCoordinator
- (REHTTPDebugCoordinator)initWithSimulator:(id)a3;
- (id)_createContentItemWithTitle:(id)a3 content:(id)a4;
- (id)_createHTMLTableFromDictionary:(id)a3;
- (id)_createHTMLTableRowFromArray:(id)a3 itemElementTag:(id)a4;
- (id)_createTableWithItems:(id)a3 itemFormatBlock:(id)a4 valueBlock:(id)a5;
- (id)_linkElementForTableItem:(id)a3 paths:(id)a4;
- (id)_linkToPaths:(id)a3;
- (id)_stringElementForObject:(id)a3;
- (id)_stringForObject:(id)a3;
- (id)_urlFromPaths:(id)a3;
- (void)generateDiagnosticsForPaths:(id)a3 completion:(id)a4;
@end

@implementation REHTTPDebugCoordinator

- (REHTTPDebugCoordinator)initWithSimulator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REHTTPDebugCoordinator;
  v6 = [(REHTTPDebugCoordinator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_simulator, a3);
  }

  return v7;
}

- (id)_urlFromPaths:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(RETrainingSimulator *)self->_simulator relevanceEngineName];
  v6 = [@"/" stringByAppendingString:v5];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      v12 = v6;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v6 = objc_msgSend(v12, "stringByAppendingPathComponent:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);

        ++v11;
        v12 = v6;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_linkElementForTableItem:(id)a3 paths:(id)a4
{
  id v6 = a4;
  id v7 = [(REHTTPDebugCoordinator *)self _stringElementForObject:a3];
  uint64_t v8 = [(REHTTPDebugCoordinator *)self _urlFromPaths:v6];

  uint64_t v9 = +[REHTMLElement link:v8 title:&stru_26CFA57D0];

  uint64_t v10 = [v9 addChild:v7];

  return v10;
}

- (id)_linkToPaths:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastObject];
  id v6 = REDisplayStringForPropertyName(v5);

  id v7 = [(REHTTPDebugCoordinator *)self _urlFromPaths:v4];

  uint64_t v8 = +[REHTMLElement link:v7 title:v6];

  return v8;
}

- (id)_stringForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (__CFString *)v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (CFTypeID TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(v3)))
    {
      int v6 = [v3 BOOLValue];
      id v7 = @"NO";
      if (v6) {
        id v7 = @"YES";
      }
      id v4 = v7;
    }
    else
    {
      id v4 = [v3 description];
    }
  }
  uint64_t v8 = v4;
  uint64_t v9 = [MEMORY[0x263F089D8] stringWithString:v4];
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
    0,
    0,
    [v9 length]);
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
    0,
    0,
    [v9 length]);
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
    0,
    0,
    [v9 length]);
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"<br>", 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", @"\t", @"&#9;",
    0,
    0,
    [v9 length]);
  uint64_t v10 = (void *)[v9 copy];

  return v10;
}

- (id)_stringElementForObject:(id)a3
{
  id v3 = [(REHTTPDebugCoordinator *)self _stringForObject:a3];
  id v4 = +[REHTMLElement elementWithHTMLString:v3];

  return v4;
}

- (void)generateDiagnosticsForPaths:(id)a3 completion:(id)a4
{
  uint64_t v157 = *MEMORY[0x263EF8340];
  id v118 = a3;
  id v5 = (void (**)(id, id, __CFString *))a4;
  if (v5)
  {
    v107 = v5;
    int v6 = RELogForDomain(21);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v118 componentsJoinedByString:@"->"];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_21E6E6000, v6, OS_LOG_TYPE_INFO, "Loading diagnostics for object path %@", (uint8_t *)&buf, 0xCu);
    }
    v108 = [(RETrainingSimulator *)self->_simulator encodedObjectAtPath:v118];
    v109 = [v108 dataUsingEncoding:4];
    uint64_t v8 = RELogForDomain(21);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[REHTTPDebugCoordinator generateDiagnosticsForPaths:completion:]((uint64_t)v108, v8);
    }

    uint64_t v9 = [v118 lastObject];
    REDisplayStringForPropertyName(v9);
    v110 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[__CFString integerValue](v110, "integerValue"));
    uint64_t v11 = [v10 stringValue];
    int v106 = [v11 isEqualToString:v110];

    if (v109
      && ([MEMORY[0x263F08900] JSONObjectWithData:v109 options:4 error:0],
          (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v119 = v12;
        v13 = [MEMORY[0x263EFF9A0] dictionary];
        long long v149 = 0u;
        long long v150 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        long long v14 = [v119 keyEnumerator];
        uint64_t v16 = [v14 countByEnumeratingWithState:&v147 objects:&buf count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v148;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v148 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v147 + 1) + 8 * i);
              if (REPropertyIsInternalAttribute(v19, v15))
              {
                v20 = [v119 objectForKeyedSubscript:v19];
                v21 = REPropertyNameFromInternalAttribute(v19);
                [v13 setObject:v20 forKeyedSubscript:v21];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v147 objects:&buf count:16];
          }
          while (v16);
        }

        v104 = (void *)[v13 copy];
        v22 = [v104 objectForKeyedSubscript:@"type"];
        int v23 = [v22 isEqualToString:@"table"];

        if (v23)
        {
          id v121 = [(REHTTPDebugCoordinator *)self _createHTMLTableFromDictionary:v119];
        }
        else
        {
          long long v145 = 0u;
          long long v146 = 0u;
          long long v143 = 0u;
          long long v144 = 0u;
          id v115 = v119;
          v69 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v115, "count"));
          long long v149 = 0u;
          long long v150 = 0u;
          long long v147 = 0u;
          long long v148 = 0u;
          v70 = [v115 keyEnumerator];
          uint64_t v72 = [v70 countByEnumeratingWithState:&v147 objects:&buf count:16];
          if (v72)
          {
            uint64_t v73 = *(void *)v148;
            do
            {
              for (uint64_t j = 0; j != v72; ++j)
              {
                if (*(void *)v148 != v73) {
                  objc_enumerationMutation(v70);
                }
                v75 = *(void **)(*((void *)&v147 + 1) + 8 * j);
                if ((REPropertyIsInternalAttribute(v75, v71) & 1) == 0) {
                  [v69 addObject:v75];
                }
              }
              uint64_t v72 = [v70 countByEnumeratingWithState:&v147 objects:&buf count:16];
            }
            while (v72);
          }

          objc_msgSend(v69, "sortUsingSelector:");
          id v112 = (id)[v69 copy];

          uint64_t v117 = [v112 countByEnumeratingWithState:&v143 objects:v153 count:16];
          if (v117)
          {
            id v121 = 0;
            uint64_t v113 = *(void *)v144;
            do
            {
              for (uint64_t k = 0; k != v117; ++k)
              {
                if (*(void *)v144 != v113) {
                  objc_enumerationMutation(v112);
                }
                uint64_t v77 = *(void *)(*((void *)&v143 + 1) + 8 * k);
                v78 = [v118 arrayByAddingObject:v77];
                v124 = [(REHTTPDebugCoordinator *)self _linkToPaths:v78];
                v79 = [v115 objectForKeyedSubscript:v77];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v80 = v79;
                  v81 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v80, "count"));
                  long long v149 = 0u;
                  long long v150 = 0u;
                  long long v147 = 0u;
                  long long v148 = 0u;
                  v82 = [v80 keyEnumerator];
                  uint64_t v84 = [v82 countByEnumeratingWithState:&v147 objects:&buf count:16];
                  if (v84)
                  {
                    uint64_t v85 = *(void *)v148;
                    do
                    {
                      for (uint64_t m = 0; m != v84; ++m)
                      {
                        if (*(void *)v148 != v85) {
                          objc_enumerationMutation(v82);
                        }
                        v87 = *(void **)(*((void *)&v147 + 1) + 8 * m);
                        if ((REPropertyIsInternalAttribute(v87, v83) & 1) == 0) {
                          [v81 addObject:v87];
                        }
                      }
                      uint64_t v84 = [v82 countByEnumeratingWithState:&v147 objects:&buf count:16];
                    }
                    while (v84);
                  }

                  [v81 sortUsingSelector:sel_compare_];
                  v88 = (void *)[v81 copy];

                  uint64_t v89 = MEMORY[0x263EF8330];
                  v141[0] = MEMORY[0x263EF8330];
                  v141[1] = 3221225472;
                  v141[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke;
                  v141[3] = &unk_2644BE6F0;
                  v141[4] = self;
                  id v142 = v78;
                  v138[0] = v89;
                  v138[1] = 3221225472;
                  v138[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_2;
                  v138[3] = &unk_2644BE6F0;
                  id v139 = v80;
                  v140 = self;
                  v90 = [(REHTTPDebugCoordinator *)self _createTableWithItems:v88 itemFormatBlock:v141 valueBlock:v138];
                }
                else
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    *(void *)&long long buf = 0;
                    *((void *)&buf + 1) = &buf;
                    uint64_t v155 = 0x2020000000;
                    uint64_t v156 = 0;
                    v135[0] = MEMORY[0x263EF8330];
                    v135[1] = 3221225472;
                    v135[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_3;
                    v135[3] = &unk_2644BE718;
                    p_long long buf = &buf;
                    v135[4] = self;
                    id v136 = v78;
                    v90 = [(REHTTPDebugCoordinator *)self _createTableWithItems:v79 itemFormatBlock:v135 valueBlock:0];

                    _Block_object_dispose(&buf, 8);
                  }
                  else
                  {
                    v91 = +[REHTMLElement div];
                    v92 = [(REHTTPDebugCoordinator *)self _stringElementForObject:v79];
                    v90 = [v91 addChild:v92];
                  }
                }
                v93 = [(REHTTPDebugCoordinator *)self _createContentItemWithTitle:v124 content:v90];
                if (v121)
                {
                  uint64_t v94 = [v121 append:v93];

                  id v121 = (id)v94;
                }
                else
                {
                  id v121 = v93;
                }
              }
              uint64_t v117 = [v112 countByEnumeratingWithState:&v143 objects:v153 count:16];
            }
            while (v117);
          }
          else
          {
            id v121 = 0;
          }
        }
        if (v106)
        {
          id v95 = v119;
          long long v147 = 0u;
          long long v148 = 0u;
          long long v149 = 0u;
          long long v150 = 0u;
          v96 = REEncodeIdentificationProperites();
          uint64_t v97 = [v96 countByEnumeratingWithState:&v147 objects:&buf count:16];
          if (v97)
          {
            uint64_t v98 = *(void *)v148;
LABEL_110:
            uint64_t v99 = 0;
            while (1)
            {
              if (*(void *)v148 != v98) {
                objc_enumerationMutation(v96);
              }
              v100 = [v95 objectForKeyedSubscript:*(void *)(*((void *)&v147 + 1) + 8 * v99)];
              if (v100) {
                break;
              }
              if (v97 == ++v99)
              {
                uint64_t v97 = [v96 countByEnumeratingWithState:&v147 objects:&buf count:16];
                if (v97) {
                  goto LABEL_110;
                }
                goto LABEL_116;
              }
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_120;
            }
            v101 = [MEMORY[0x263F089D8] stringWithString:v100];
            objc_msgSend(v101, "replaceOccurrencesOfString:withString:options:range:", @"&", @"&amp;",
              0,
              0,
              [v101 length]);
            objc_msgSend(v101, "replaceOccurrencesOfString:withString:options:range:", @"<", @"&lt;",
              0,
              0,
              [v101 length]);
            objc_msgSend(v101, "replaceOccurrencesOfString:withString:options:range:", @">", @"&gt;",
              0,
              0,
              [v101 length]);
            objc_msgSend(v101, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"<br>", 0, 0, objc_msgSend(v101, "length"));
            objc_msgSend(v101, "replaceOccurrencesOfString:withString:options:range:", @"\t", @"&#9;",
              0,
              0,
              [v101 length]);
            v24 = (__CFString *)[v101 copy];
          }
          else
          {
LABEL_116:

            v100 = 0;
LABEL_120:
            v24 = &stru_26CFA57D0;
          }
        }
        else
        {
          v24 = v110;
        }
        v107[2](v107, v121, v24);

        goto LABEL_22;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v105 = v12;
        if ([v105 count])
        {
          v25 = [v105 firstObject];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            long long v133 = 0u;
            long long v134 = 0u;
            long long v131 = 0u;
            long long v132 = 0u;
            obuint64_t j = v105;
            uint64_t v116 = [obj countByEnumeratingWithState:&v131 objects:v152 count:16];
            if (v116)
            {
              id v120 = 0;
              uint64_t v123 = 0;
              uint64_t v114 = *(void *)v132;
              do
              {
                for (uint64_t n = 0; n != v116; ++n)
                {
                  if (*(void *)v132 != v114) {
                    objc_enumerationMutation(obj);
                  }
                  id v28 = *(id *)(*((void *)&v131 + 1) + 8 * n);
                  v29 = [MEMORY[0x263EFF9A0] dictionary];
                  long long v149 = 0u;
                  long long v150 = 0u;
                  long long v147 = 0u;
                  long long v148 = 0u;
                  v30 = [v28 keyEnumerator];
                  uint64_t v32 = [v30 countByEnumeratingWithState:&v147 objects:&buf count:16];
                  if (v32)
                  {
                    uint64_t v33 = *(void *)v148;
                    do
                    {
                      for (iuint64_t i = 0; ii != v32; ++ii)
                      {
                        if (*(void *)v148 != v33) {
                          objc_enumerationMutation(v30);
                        }
                        v35 = *(void **)(*((void *)&v147 + 1) + 8 * ii);
                        if (REPropertyIsInternalAttribute(v35, v31))
                        {
                          v36 = [v28 objectForKeyedSubscript:v35];
                          v37 = REPropertyNameFromInternalAttribute(v35);
                          [v29 setObject:v36 forKeyedSubscript:v37];
                        }
                      }
                      uint64_t v32 = [v30 countByEnumeratingWithState:&v147 objects:&buf count:16];
                    }
                    while (v32);
                  }

                  v122 = (void *)[v29 copy];
                  v38 = [v122 objectForKeyedSubscript:@"type"];
                  int v39 = [v38 isEqualToString:@"table"];

                  if (v39)
                  {
                    v40 = [(REHTTPDebugCoordinator *)self _createHTMLTableFromDictionary:v28];
                  }
                  else
                  {
                    id v41 = v28;
                    v42 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v41, "count"));
                    long long v149 = 0u;
                    long long v150 = 0u;
                    long long v147 = 0u;
                    long long v148 = 0u;
                    v43 = [v41 keyEnumerator];
                    uint64_t v45 = [v43 countByEnumeratingWithState:&v147 objects:&buf count:16];
                    if (v45)
                    {
                      uint64_t v46 = *(void *)v148;
                      do
                      {
                        for (uint64_t jj = 0; jj != v45; ++jj)
                        {
                          if (*(void *)v148 != v46) {
                            objc_enumerationMutation(v43);
                          }
                          v48 = *(void **)(*((void *)&v147 + 1) + 8 * jj);
                          if ((REPropertyIsInternalAttribute(v48, v44) & 1) == 0) {
                            [v42 addObject:v48];
                          }
                        }
                        uint64_t v45 = [v43 countByEnumeratingWithState:&v147 objects:&buf count:16];
                      }
                      while (v45);
                    }

                    [v42 sortUsingSelector:sel_compare_];
                    v49 = (void *)[v42 copy];

                    uint64_t v50 = MEMORY[0x263EF8330];
                    v128[0] = MEMORY[0x263EF8330];
                    v128[1] = 3221225472;
                    v128[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_4;
                    v128[3] = &unk_2644BE740;
                    v128[4] = self;
                    id v129 = v118;
                    uint64_t v130 = v123;
                    v127[0] = v50;
                    v127[1] = 3221225472;
                    v127[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_5;
                    v127[3] = &unk_2644BE6F0;
                    v127[4] = self;
                    v127[5] = v41;
                    v40 = [(REHTTPDebugCoordinator *)self _createTableWithItems:v49 itemFormatBlock:v128 valueBlock:v127];
                  }
                  id v51 = v28;
                  long long v147 = 0u;
                  long long v148 = 0u;
                  long long v149 = 0u;
                  long long v150 = 0u;
                  v52 = REEncodeIdentificationProperites();
                  uint64_t v53 = [v52 countByEnumeratingWithState:&v147 objects:&buf count:16];
                  if (v53)
                  {
                    uint64_t v54 = *(void *)v148;
                    while (2)
                    {
                      for (uint64_t kk = 0; kk != v53; ++kk)
                      {
                        if (*(void *)v148 != v54) {
                          objc_enumerationMutation(v52);
                        }
                        v56 = [v51 objectForKeyedSubscript:*(void *)(*((void *)&v147 + 1) + 8 * kk)];
                        if (v56)
                        {

                          v58 = [(REHTTPDebugCoordinator *)self _stringForObject:v56];
                          v59 = [NSNumber numberWithUnsignedInteger:v123];
                          v60 = [v59 stringValue];
                          v151 = v60;
                          v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v151 count:1];
                          v62 = [v118 arrayByAddingObjectsFromArray:v61];
                          v57 = [(REHTTPDebugCoordinator *)self _linkElementForTableItem:v58 paths:v62];

                          goto LABEL_63;
                        }
                      }
                      uint64_t v53 = [v52 countByEnumeratingWithState:&v147 objects:&buf count:16];
                      if (v53) {
                        continue;
                      }
                      break;
                    }
                  }

                  v57 = 0;
LABEL_63:
                  v63 = [(REHTTPDebugCoordinator *)self _createContentItemWithTitle:v57 content:v40];

                  if (v120)
                  {
                    uint64_t v64 = [v120 append:v63];

                    id v120 = (id)v64;
                  }
                  else
                  {
                    id v120 = v63;
                  }

                  ++v123;
                }
                uint64_t v116 = [obj countByEnumeratingWithState:&v131 objects:v152 count:16];
              }
              while (v116);
            }
            else
            {
              id v120 = 0;
            }
          }
          else
          {
            v126[0] = MEMORY[0x263EF8330];
            v126[1] = 3221225472;
            v126[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_6;
            v126[3] = &unk_2644BE768;
            v126[4] = self;
            v102 = [(REHTTPDebugCoordinator *)self _createTableWithItems:v105 itemFormatBlock:v126 valueBlock:0];
            id v120 = [(REHTTPDebugCoordinator *)self _createContentItemWithTitle:0 content:v102];
          }
          v103 = v110;
          if (v106)
          {

            v103 = &stru_26CFA57D0;
          }
          v110 = v103;
          ((void (*)(void (**)(id, id, __CFString *), id))v107[2])(v107, v120);
        }
        else
        {
          id v120 = +[REHTMLElement div];
          v107[2](v107, v120, v110);
        }
      }
      else
      {
        v65 = +[REHTMLElement div];
        v66 = [(REHTTPDebugCoordinator *)self _stringElementForObject:v12];
        v67 = [v65 addChild:v66];
        v68 = [(REHTTPDebugCoordinator *)self _createContentItemWithTitle:0 content:v67];

        v107[2](v107, v68, v110);
      }
    }
    else
    {
      v107[2](v107, 0, v110);
    }
    v24 = v110;
LABEL_22:

    id v5 = v107;
  }
}

id __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 arrayByAddingObject:v4];
  int v6 = [v2 _linkElementForTableItem:v4 paths:v5];

  return v6;
}

id __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v4 = [*(id *)(a1 + 40) _stringElementForObject:v3];

  return v4;
}

id __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = REEncodeIdentificationProperites();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
          if (v10)
          {
            v12 = (void *)v10;

            v13 = *(void **)(a1 + 32);
            long long v14 = *(void **)(a1 + 40);
            long long v15 = [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) - 1];
            uint64_t v16 = [v15 stringValue];
            uint64_t v17 = [v14 arrayByAddingObject:v16];
            uint64_t v11 = [v13 _linkElementForTableItem:v4 paths:v17];

            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v11 = objc_msgSend(*(id *)(a1 + 32), "_stringElementForObject:", v3, (void)v19);
LABEL_13:

  return v11;
}

id __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_4(void *a1, void *a2)
{
  v13[2] = *MEMORY[0x263EF8340];
  v2 = (void *)a1[4];
  id v3 = (void *)a1[5];
  id v4 = NSNumber;
  uint64_t v5 = a1[6];
  id v6 = a2;
  uint64_t v7 = [v4 numberWithUnsignedInteger:v5];
  uint64_t v8 = [v7 stringValue];
  v13[0] = v8;
  v13[1] = v6;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];
  uint64_t v10 = [v3 arrayByAddingObjectsFromArray:v9];
  uint64_t v11 = [v2 _linkElementForTableItem:v6 paths:v10];

  return v11;
}

id __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:a2];
  id v4 = [v2 _stringElementForObject:v3];

  return v4;
}

uint64_t __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _stringElementForObject:a2];
}

- (id)_createContentItemWithTitle:(id)a3 content:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = +[REHTMLElement div];
    uint64_t v8 = [v7 elementByAddingClass:@"section"];

    uint64_t v9 = [v8 addChild:v5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = +[REHTMLElement div];
  uint64_t v11 = [v10 elementByAddingClass:@"content-item"];

  if (v9)
  {
    uint64_t v12 = [v11 addChild:v9];

    uint64_t v11 = (void *)v12;
  }
  if (v6)
  {
    uint64_t v13 = [v11 addChild:v6];

    uint64_t v11 = (void *)v13;
  }

  return v11;
}

- (id)_createHTMLTableRowFromArray:(id)a3 itemElementTag:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[REHTMLElement htmlElementWithTag:@"tr" content:0];
  if (_createHTMLTableRowFromArray_itemElementTag__onceToken != -1) {
    dispatch_once(&_createHTMLTableRowFromArray_itemElementTag__onceToken, &__block_literal_global_37);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      uint64_t v13 = v7;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v21 + 1) + 8 * v12);
        if (objc_msgSend(v14, "hasPrefix:", @"0x", (void)v21))
        {
          BOOL v15 = 1;
        }
        else
        {
          uint64_t v16 = [v14 stringByTrimmingCharactersInSet:_createHTMLTableRowFromArray_itemElementTag__NumericCharacterSet];
          BOOL v15 = [v16 length] == 0;
        }
        uint64_t v17 = +[REHTMLElement htmlElementWithTag:v6 content:v14];
        v18 = v17;
        if (v15)
        {
          uint64_t v19 = [v17 elementByAddingClass:@"monospaced"];

          v18 = (void *)v19;
        }
        uint64_t v7 = [v13 addChild:v18];

        ++v12;
        uint64_t v13 = v7;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v7;
}

uint64_t __70__REHTTPDebugCoordinator__createHTMLTableRowFromArray_itemElementTag___block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"1234567890.-+"];
  uint64_t v1 = _createHTMLTableRowFromArray_itemElementTag__NumericCharacterSet;
  _createHTMLTableRowFromArray_itemElementTag__NumericCharacterSet = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (id)_createHTMLTableFromDictionary:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = [v4 keyEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (REPropertyIsInternalAttribute(v12, v8))
        {
          uint64_t v13 = [v4 objectForKeyedSubscript:v12];
          long long v14 = REPropertyNameFromInternalAttribute(v12);
          [v5 setObject:v13 forKeyedSubscript:v14];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v9);
  }

  BOOL v15 = (void *)[v5 copy];
  v35 = v15;
  uint64_t v16 = [v15 objectForKeyedSubscript:@"sortable"];
  int v17 = [v16 BOOLValue];

  v18 = +[REHTMLElement htmlElementWithTag:@"table" content:0];
  uint64_t v19 = v18;
  if (v17)
  {
    uint64_t v20 = [v18 elementByAddingClasses:&unk_26CFCD6F8];

    uint64_t v19 = (void *)v20;
  }
  long long v21 = +[REHTMLElement htmlElementWithTag:@"thead" content:0];
  long long v22 = [v4 objectForKeyedSubscript:@"header"];
  long long v23 = [(REHTTPDebugCoordinator *)self _createHTMLTableRowFromArray:v22 itemElementTag:@"th"];
  long long v24 = [v21 addChild:v23];

  v34 = [v19 addChild:v24];

  v25 = +[REHTMLElement htmlElementWithTag:@"tbody" content:0];
  uint64_t v26 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", 0);
  v27 = [v4 objectForKeyedSubscript:v26];

  if (v27)
  {
    uint64_t v28 = 1;
    do
    {
      v29 = [(REHTTPDebugCoordinator *)self _createHTMLTableRowFromArray:v27 itemElementTag:@"td"];
      v30 = [v25 addChild:v29];

      v31 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v28);
      v27 = [v4 objectForKeyedSubscript:v31];

      ++v28;
      v25 = v30;
    }
    while (v27);
  }
  else
  {
    v30 = v25;
  }
  uint64_t v32 = [v34 addChild:v30];

  return v32;
}

- (id)_createTableWithItems:(id)a3 itemFormatBlock:(id)a4 valueBlock:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = (void (**)(id, void))a4;
  uint64_t v9 = (void (**)(id, void))a5;
  uint64_t v10 = +[REHTMLElement div];
  uint64_t v11 = [v10 elementByAddingClass:@"content-table"];

  unint64_t v30 = [v7 count];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v7;
  uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v33)
  {
    uint64_t v32 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        uint64_t v13 = v11;
        if (*(void *)v35 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        BOOL v15 = +[REHTMLElement div];
        uint64_t v16 = [v15 elementByAddingClass:@"table-item"];

        int v17 = v8[2](v8, v14);
        v18 = +[REHTMLElement div];
        uint64_t v19 = [v18 elementByAddingClass:@"item-key"];
        uint64_t v20 = [v19 addChild:v17];

        long long v21 = [v16 addChild:v20];

        if (v9)
        {
          uint64_t v22 = v9[2](v9, v14);
          if (v22)
          {
            long long v23 = (void *)v22;
            long long v24 = +[REHTMLElement div];
            v25 = [v24 elementByAddingClass:@"item-value"];
            uint64_t v26 = [v25 addChild:v23];

            uint64_t v27 = [v21 addChild:v26];

            long long v21 = (void *)v27;
          }
        }
        uint64_t v11 = [v13 addChild:v21];
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v33);
  }

  if (v30 <= 2)
  {
    uint64_t v28 = [v11 elementByAddingClass:@"two-column"];

    uint64_t v11 = (void *)v28;
  }

  return v11;
}

- (void).cxx_destruct
{
}

- (void)generateDiagnosticsForPaths:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_DEBUG, "Received json %@", (uint8_t *)&v2, 0xCu);
}

@end