@interface WFParameter(WFVariableMenuProvider)
- (id)clearButtonMenuItemWithVariable:()WFVariableMenuProvider parameterState:setVariableHandler:;
- (id)variableMenuElementsWithVariable:()WFVariableMenuProvider parameterState:variableProvider:variableUIDelegate:setVariableHandler:;
- (uint64_t)shouldShowVariable:()WFVariableMenuProvider allowedVariableTypes:variableProvider:variableUIDelegate:;
@end

@implementation WFParameter(WFVariableMenuProvider)

- (id)clearButtonMenuItemWithVariable:()WFVariableMenuProvider parameterState:setVariableHandler:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    v11 = @"Clear Variable";
LABEL_7:
    id v15 = objc_alloc(MEMORY[0x263F85438]);
    v16 = (void *)[objc_alloc(MEMORY[0x263F851A8]) initWithSystemColor:2];
    v17 = [MEMORY[0x263F852F8] clearBackground];
    v18 = (void *)[v15 initWithSymbolName:@"xmark" symbolColor:v16 background:v17];

    v19 = WFLocalizedString(v11);
    id v20 = objc_alloc(MEMORY[0x263F879B8]);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __105__WFParameter_WFVariableMenuProvider__clearButtonMenuItemWithVariable_parameterState_setVariableHandler___block_invoke;
    v23[3] = &unk_264BFD2A8;
    id v24 = v10;
    v21 = (void *)[v20 initWithTitle:v19 icon:v18 isDestructive:1 handler:v23];

    goto LABEL_8;
  }
  uint64_t v12 = [a1 defaultSerializedRepresentation];
  v13 = (void *)v12;
  if (v9 && !v12 || (int v14 = [a1 allowsMultipleValues], v13, v14))
  {
    v11 = @"Clear";
    goto LABEL_7;
  }
  v21 = 0;
LABEL_8:

  return v21;
}

- (uint64_t)shouldShowVariable:()WFVariableMenuProvider allowedVariableTypes:variableProvider:variableUIDelegate:
{
  id v9 = a3;
  id v10 = a5;
  if (![a4 containsObject:v9]) {
    goto LABEL_17;
  }
  if (![v9 isEqualToString:*MEMORY[0x263F874E0]])
  {
    if (([v9 isEqualToString:*MEMORY[0x263F874E8]] & 1) != 0
      || ([v9 isEqualToString:*MEMORY[0x263F874F0]] & 1) != 0
      || ([v9 isEqualToString:*MEMORY[0x263F874F8]] & 1) != 0
      || ([v9 isEqualToString:*MEMORY[0x263F87500]] & 1) != 0
      || ([v9 isEqualToString:*MEMORY[0x263F87508]] & 1) != 0)
    {
      uint64_t v12 = 1;
      goto LABEL_18;
    }
    if ([v9 isEqualToString:*MEMORY[0x263F87518]])
    {
      v13 = [v10 availableVariableNames];
LABEL_16:
      int v14 = v13;
      uint64_t v12 = [v13 count] != 0;

      goto LABEL_18;
    }
    if ([v9 isEqualToString:*MEMORY[0x263F87510]])
    {
      v13 = [v10 workflowInputClasses];
      goto LABEL_16;
    }
LABEL_17:
    uint64_t v12 = 0;
    goto LABEL_18;
  }
  unsigned int v11 = [v10 hasAvailableActionOutputVariables];
  if (a6) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
LABEL_18:

  return v12;
}

- (id)variableMenuElementsWithVariable:()WFVariableMenuProvider parameterState:variableProvider:variableUIDelegate:setVariableHandler:
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v82 = a4;
  id v107 = a5;
  id v13 = a6;
  id v104 = a7;
  if (objc_msgSend((id)objc_msgSend(a1, "stateClass"), "instancesRespondToSelector:", sel_initWithVariable_))
  {
    int v14 = [a1 supportedVariableTypes];
  }
  else
  {
    int v14 = 0;
  }
  v86 = objc_msgSend(v107, "availableVariableNames", v82);
  v93 = [MEMORY[0x263EFF980] array];
  id v15 = [MEMORY[0x263EFF980] array];
  v105 = v15;
  id v106 = v12;
  v84 = v14;
  id v85 = v13;
  v96 = a1;
  if ([a1 shouldShowVariable:*MEMORY[0x263F874E0] allowedVariableTypes:v14 variableProvider:v107 variableUIDelegate:v13])
  {
    id v16 = objc_alloc(MEMORY[0x263F85438]);
    v17 = [MEMORY[0x263F851A8] colorWithSystemColor:1];
    v18 = [MEMORY[0x263F852F8] clearBackground];
    uint64_t v19 = [v16 initWithSymbolName:@"wand.and.stars" symbolColor:v17 background:v18];

    uint64_t v20 = WFLocalizedString(@"Select Variable");
    id v21 = objc_alloc(MEMORY[0x263F879B8]);
    v128[0] = MEMORY[0x263EF8330];
    v128[1] = 3221225472;
    v128[2] = __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke;
    v128[3] = &unk_264BFD790;
    id v129 = v14;
    id v130 = v13;
    id v22 = v107;
    id v131 = v22;
    id v23 = v104;
    id v132 = v23;
    v99 = (void *)v20;
    id v101 = (id)v19;
    v97 = (void *)[v21 initWithTitle:v20 subtitle:0 icon:v19 handler:v128];
    objc_msgSend(v93, "addObject:");
    id v24 = objc_alloc_init(MEMORY[0x263F86FD8]);
    [v24 setVariableProvider:v22];
    [v24 setUserDefinedVariableNames:v86];
    v25 = [v22 availableOutputActions];
    [v24 setOutputActions:v25];

    v26 = [v83 containedVariables];
    [v24 setCurrentVariables:v26];

    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    v94 = v24;
    obuint64_t j = [v24 suggestedVariables];
    uint64_t v27 = [obj countByEnumeratingWithState:&v124 objects:v136 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v125;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v125 != v29) {
            objc_enumerationMutation(obj);
          }
          v31 = *(void **)(*((void *)&v124 + 1) + 8 * i);
          id v32 = v12;
          id v33 = v31;
          v34 = v33;
          if (v33 == v32)
          {
            unsigned int v35 = 1;
          }
          else
          {
            unsigned int v35 = 0;
            if (v12 && v33) {
              unsigned int v35 = [v32 isEqual:v33];
            }
          }

          id v36 = objc_alloc(MEMORY[0x263F879B8]);
          v37 = [v34 name];
          v38 = [v34 icon];
          v122[0] = MEMORY[0x263EF8330];
          v122[1] = 3221225472;
          v122[2] = __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_3;
          v122[3] = &unk_264BFDA98;
          id v39 = v23;
          v122[4] = v34;
          id v123 = v39;
          v40 = (void *)[v36 initWithTitle:v37 subtitle:0 icon:v38 state:v35 handler:v122];

          id v15 = v105;
          [v105 addObject:v40];

          id v12 = v106;
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v124 objects:v136 count:16];
      }
      while (v28);
    }

    id v13 = v85;
    a1 = v96;
  }
  uint64_t v41 = *MEMORY[0x263F874F0];
  uint64_t v98 = *MEMORY[0x263F874E8];
  v135[0] = *MEMORY[0x263F874E8];
  uint64_t v92 = v41;
  v135[1] = v41;
  uint64_t v90 = *MEMORY[0x263F87500];
  uint64_t v91 = *MEMORY[0x263F874F8];
  v135[2] = *MEMORY[0x263F874F8];
  v135[3] = v90;
  uint64_t v42 = *MEMORY[0x263F87518];
  uint64_t v89 = *MEMORY[0x263F87508];
  v135[4] = *MEMORY[0x263F87508];
  uint64_t v87 = v42;
  v135[5] = v42;
  uint64_t v88 = *MEMORY[0x263F87510];
  v135[6] = *MEMORY[0x263F87510];
  [MEMORY[0x263EFF8C0] arrayWithObjects:v135 count:7];
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  id v102 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v43 = [v102 countByEnumeratingWithState:&v118 objects:v134 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v119;
    uint64_t v95 = *(void *)v119;
    do
    {
      uint64_t v46 = 0;
      uint64_t v100 = v44;
      do
      {
        if (*(void *)v119 != v45) {
          objc_enumerationMutation(v102);
        }
        uint64_t v47 = *(void *)(*((void *)&v118 + 1) + 8 * v46);
        if ([a1 shouldShowVariable:v47 allowedVariableTypes:v14 variableProvider:v107 variableUIDelegate:v13])
        {
          if (v47 == v98 || v47 == v92 || v47 == v91 || v47 == v90 || v47 == v89)
          {
            v63 = objc_opt_new();
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();
          }
          else
          {
            if (v47 != v88)
            {
              if (v47 != v87) {
                goto LABEL_46;
              }
              long long v116 = 0u;
              long long v117 = 0u;
              long long v114 = 0u;
              long long v115 = 0u;
              id v48 = v86;
              uint64_t v49 = [v48 countByEnumeratingWithState:&v114 objects:v133 count:16];
              if (v49)
              {
                uint64_t v50 = v49;
                uint64_t v51 = *(void *)v115;
                do
                {
                  for (uint64_t j = 0; j != v50; ++j)
                  {
                    if (*(void *)v115 != v51) {
                      objc_enumerationMutation(v48);
                    }
                    uint64_t v53 = *(void *)(*((void *)&v114 + 1) + 8 * j);
                    v54 = (void *)[objc_alloc(MEMORY[0x263F86F80]) initWithName:v53 variableProvider:v107 aggrandizements:0];
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v55 = [v12 name];
                      unsigned int v56 = [v55 isEqualToString:v53];
                    }
                    else
                    {
                      unsigned int v56 = 0;
                    }
                    id v57 = objc_alloc(MEMORY[0x263F879B8]);
                    v58 = [v54 name];
                    v59 = [v54 icon];
                    v111[0] = MEMORY[0x263EF8330];
                    v111[1] = 3221225472;
                    v111[2] = __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_4;
                    v111[3] = &unk_264BFDA98;
                    id v60 = v104;
                    id v112 = v54;
                    id v113 = v60;
                    id v61 = v54;
                    v62 = (void *)[v57 initWithTitle:v58 subtitle:0 icon:v59 state:v56 handler:v111];

                    id v15 = v105;
                    [v105 addObject:v62];

                    id v12 = v106;
                  }
                  uint64_t v50 = [v48 countByEnumeratingWithState:&v114 objects:v133 count:16];
                }
                while (v50);
                int v14 = v84;
                id v13 = v85;
LABEL_44:
                uint64_t v45 = v95;
                a1 = v96;
              }

              uint64_t v44 = v100;
              goto LABEL_46;
            }
            v63 = (void *)[objc_alloc(MEMORY[0x263F86E80]) initWithVariableProvider:v107 aggrandizements:0];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v70 = [v12 name];
              v71 = [v63 name];
              char isKindOfClass = [v70 isEqualToString:v71];
            }
            else
            {
              char isKindOfClass = 0;
            }
          }
          id v65 = objc_alloc(MEMORY[0x263F879B8]);
          v66 = [v63 name];
          v67 = [v63 icon];
          v108[0] = MEMORY[0x263EF8330];
          v108[1] = 3221225472;
          v108[2] = __142__WFParameter_WFVariableMenuProvider__variableMenuElementsWithVariable_parameterState_variableProvider_variableUIDelegate_setVariableHandler___block_invoke_5;
          v108[3] = &unk_264BFDA98;
          id v68 = v104;
          id v109 = v63;
          id v110 = v68;
          id v48 = v63;
          v69 = (void *)[v65 initWithTitle:v66 subtitle:0 icon:v67 state:isKindOfClass & 1 handler:v108];

          [v93 addObject:v69];
          goto LABEL_44;
        }
LABEL_46:
        ++v46;
      }
      while (v46 != v44);
      uint64_t v72 = [v102 countByEnumeratingWithState:&v118 objects:v134 count:16];
      uint64_t v44 = v72;
    }
    while (v72);
  }

  v73 = [MEMORY[0x263EFF980] array];
  if ([v93 count])
  {
    v74 = (void *)[objc_alloc(MEMORY[0x263F879C0]) initWithMenuElements:v93];
    [v73 addObject:v74];
  }
  if ([v15 count])
  {
    v75 = (void *)[objc_alloc(MEMORY[0x263F879C0]) initWithMenuElements:v15];
    [v75 setStyle:2];
    v76 = @"Variables…";
    v77 = @"Variables… (user defined + suggested)";
    v78 = WFCurrentBundle();
    v79 = [v78 localizedStringForKey:@"Variables… (user defined + suggested)" value:@"Variables…" table:0];

    id v12 = v106;
    [v75 setTitle:v79];

    [v75 setOnlyDisplayTitleWhenCollapsed:1];
    [v73 addObject:v75];
  }
  if ([v73 count]) {
    id v80 = v73;
  }
  else {
    id v80 = 0;
  }

  return v80;
}

@end