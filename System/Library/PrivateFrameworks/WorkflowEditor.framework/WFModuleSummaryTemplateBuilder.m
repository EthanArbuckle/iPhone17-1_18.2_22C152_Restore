@interface WFModuleSummaryTemplateBuilder
+ (BOOL)formatString:(id)a3 containsParameterKey:(id)a4;
+ (id)slotsForMultipleParameterState:(id)a3 inParameter:(id)a4;
- (NSArray)formatItems;
- (NSArray)parameterKeys;
- (NSString)formatString;
- (WFModuleSummaryTemplateBuilder)initWithFormatString:(id)a3;
- (id)buildContentWithParameters:(id)a3 editableParameters:(id)a4 parameterStates:(id)a5 variableBeingEdited:(id)a6;
- (id)contentByEnumeratingSummaryWithParameterSlotBuilder:(id)a3;
- (void)itemizeFormatStringIfNeeded;
- (void)setFormatItems:(id)a3;
- (void)setParameterKeys:(id)a3;
@end

@implementation WFModuleSummaryTemplateBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formatItems, 0);
  objc_storeStrong((id *)&self->_parameterKeys, 0);
  objc_storeStrong((id *)&self->_formatString, 0);
}

- (void)setFormatItems:(id)a3
{
}

- (NSArray)formatItems
{
  return self->_formatItems;
}

- (void)setParameterKeys:(id)a3
{
}

- (NSString)formatString
{
  return self->_formatString;
}

- (id)buildContentWithParameters:(id)a3 editableParameters:(id)a4 parameterStates:(id)a5 variableBeingEdited:(id)a6
{
  v27 = self;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v14 = v9;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "key", v27);
        [v13 setObject:v19 forKey:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v16);
  }

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __116__WFModuleSummaryTemplateBuilder_buildContentWithParameters_editableParameters_parameterStates_variableBeingEdited___block_invoke;
  v28[3] = &unk_264BFD028;
  id v29 = v13;
  id v30 = v10;
  id v31 = v11;
  v32 = v27;
  id v33 = v12;
  id v21 = v12;
  id v22 = v11;
  id v23 = v10;
  id v24 = v13;
  v25 = [(WFModuleSummaryTemplateBuilder *)v27 contentByEnumeratingSummaryWithParameterSlotBuilder:v28];

  return v25;
}

id __116__WFModuleSummaryTemplateBuilder_buildContentWithParameters_editableParameters_parameterStates_variableBeingEdited___block_invoke(id *a1, void *a2)
{
  v52[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [a1[4] objectForKeyedSubscript:v3];
  if (![v4 conformsToProtocol:&unk_26E814400])
  {
    v5 = getWFGeneralLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v47 = "-[WFModuleSummaryTemplateBuilder buildContentWithParameters:editableParameters:parameterStates:variableBeing"
            "Edited:]_block_invoke";
      __int16 v48 = 2114;
      id v49 = v3;
      _os_log_impl(&dword_23490C000, v5, OS_LOG_TYPE_FAULT, "%s Did not find matching parameter for ${%{public}@}", buf, 0x16u);
    }
    goto LABEL_30;
  }
  v5 = v4;
  int v37 = [a1[5] containsObject:v5];
  v6 = [a1[6] objectForKey:v3];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_29;
    }
    if ([v5 allowsMultipleValues])
    {
      if (v6)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v7 = [(id)objc_opt_class() slotsForMultipleParameterState:v6 inParameter:v5];
          if (v7) {
            goto LABEL_21;
          }
        }
      }
      v13 = [v5 moduleSummarySlotForState:0];
      id v14 = v13;
      if (v13)
      {
        uint64_t v15 = [v13 identifier];
        uint64_t v16 = [v15 identifierBySettingArrayIndex:0];
        [v14 setIdentifier:v16];

        v52[0] = v14;
        uint64_t v17 = (void *)MEMORY[0x263EFF8C0];
        v18 = v52;
LABEL_18:
        v7 = [v17 arrayWithObjects:v18 count:1];
        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v19 = [v5 moduleSummarySlotForState:v6];
      id v14 = (void *)v19;
      if (v19)
      {
        uint64_t v51 = v19;
        uint64_t v17 = (void *)MEMORY[0x263EFF8C0];
        v18 = &v51;
        goto LABEL_18;
      }
    }
    v7 = 0;
LABEL_20:

    if (v7) {
      goto LABEL_21;
    }
LABEL_29:

LABEL_30:
    id obj = 0;
    goto LABEL_31;
  }
  v7 = [v5 moduleSummarySlotsForState:v6];
  v8 = [v7 firstObject];
  id v9 = [v8 contentAttributedString];
  BOOL v10 = [v9 length] != 0;

  if (WFShouldShowAddButtonForParameter(v5, v10, v6, [v7 count]))
  {
    id v11 = +[WFSlotTemplateSlot addingSlotWithKey:@"_array_add_"];
    uint64_t v12 = [v7 arrayByAddingObject:v11];

    v7 = (void *)v12;
  }
  if (!v7) {
    goto LABEL_29;
  }
LABEL_21:
  v32 = v4;
  long long v36 = v5;
  id v33 = v3;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v7;
  uint64_t v20 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v35 = *(void *)v43;
    uint64_t v22 = *MEMORY[0x263F814A0];
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v43 != v35) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        objc_msgSend(v24, "setEnabled:", objc_msgSend(v24, "isEnabled") & v37);
        v25 = [v24 identifier];
        v26 = [v36 key];
        v27 = [v25 identifierBySettingParameterKey:v26];
        [v24 setIdentifier:v27];

        v28 = [v24 contentAttributedString];
        id v29 = [v24 contentAttributedString];
        uint64_t v30 = [v29 length];
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __116__WFModuleSummaryTemplateBuilder_buildContentWithParameters_editableParameters_parameterStates_variableBeingEdited___block_invoke_2;
        v38[3] = &unk_264BFD000;
        v38[4] = v24;
        id v39 = a1[5];
        v40 = v36;
        id v41 = a1[8];
        objc_msgSend(v28, "enumerateAttribute:inRange:options:usingBlock:", v22, 0, v30, 0, v38);
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v21);
  }

  v4 = v32;
  id v3 = v33;
  v5 = v36;
LABEL_31:

  return obj;
}

void __116__WFModuleSummaryTemplateBuilder_buildContentWithParameters_editableParameters_parameterStates_variableBeingEdited___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v4 = v9;
  if (isKindOfClass)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = v9;
    if ([v5 isEnabled]) {
      uint64_t v7 = [*(id *)(a1 + 40) containsObject:*(void *)(a1 + 48)];
    }
    else {
      uint64_t v7 = 0;
    }
    [v6 setEnabled:v7];
    v8 = [v6 variable];
    [v6 setSelected:v8 == *(void **)(a1 + 56)];

    v4 = v9;
  }
}

- (id)contentByEnumeratingSummaryWithParameterSlotBuilder:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void *))a3;
  [(WFModuleSummaryTemplateBuilder *)self itemizeFormatStringIfNeeded];
  v5 = [(WFModuleSummaryTemplateBuilder *)self formatItems];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id obj = [(WFModuleSummaryTemplateBuilder *)self formatItems];
    uint64_t v8 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v14 = [(NSArray *)self->_parameterKeys objectAtIndex:v10];
            uint64_t v15 = v4[2](v4, v14);
            [v7 addObjectsFromArray:v15];

            ++v10;
          }
          else
          {
            [v7 addObject:v13];
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)itemizeFormatStringIfNeeded
{
  id v3 = [(WFModuleSummaryTemplateBuilder *)self formatString];
  if ([v3 length])
  {
    v4 = [(WFModuleSummaryTemplateBuilder *)self formatItems];
    uint64_t v5 = [v4 count];

    if (!v5)
    {
      uint64_t v6 = objc_opt_new();
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = objc_msgSend(MEMORY[0x263F08AE8], "_intents_sharedFormatRegularExpression");
      uint64_t v22 = 0;
      uint64_t v23 = &v22;
      uint64_t v24 = 0x3010000000;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      v25 = &unk_234BA41F7;
      uint64_t v9 = [v3 length];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      uint64_t v16 = __61__WFModuleSummaryTemplateBuilder_itemizeFormatStringIfNeeded__block_invoke;
      uint64_t v17 = &unk_264BFCFD8;
      long long v21 = &v22;
      id v10 = v3;
      id v18 = v10;
      id v11 = v6;
      id v19 = v11;
      id v12 = v7;
      id v20 = v12;
      objc_msgSend(v8, "enumerateMatchesInString:options:range:usingBlock:", v10, 0, 0, v9, &v14);
      uint64_t v13 = objc_msgSend(v10, "substringFromIndex:", v23[5] + v23[4], v14, v15, v16, v17);
      if ([v13 length]) {
        [v11 addObject:v13];
      }
      [(WFModuleSummaryTemplateBuilder *)self setFormatItems:v11];
      [(WFModuleSummaryTemplateBuilder *)self setParameterKeys:v12];

      _Block_object_dispose(&v22, 8);
    }
  }
}

void __61__WFModuleSummaryTemplateBuilder_itemizeFormatStringIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
     + *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  v4 = *(void **)(a1 + 32);
  id v5 = a2;
  objc_msgSend(v4, "substringWithRange:", v3, objc_msgSend(v5, "range") - v3);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if ([v16 length]) {
    [*(id *)(a1 + 40) addObject:v16];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v5 rangeAtIndex:1];
  uint64_t v9 = objc_msgSend(v6, "substringWithRange:", v7, v8);
  id v10 = *(void **)(a1 + 40);
  id v11 = [MEMORY[0x263EFF9D0] null];
  [v10 addObject:v11];

  [*(id *)(a1 + 48) addObject:v9];
  uint64_t v12 = [v5 range];
  uint64_t v14 = v13;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  *(void *)(v15 + 32) = v12;
  *(void *)(v15 + 40) = v14;
}

- (NSArray)parameterKeys
{
  [(WFModuleSummaryTemplateBuilder *)self itemizeFormatStringIfNeeded];
  parameterKeys = self->_parameterKeys;
  return parameterKeys;
}

- (WFModuleSummaryTemplateBuilder)initWithFormatString:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFModuleSummaryTemplateBuilder;
  id v5 = [(WFModuleSummaryTemplateBuilder *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    formatString = v5->_formatString;
    v5->_formatString = (NSString *)v6;

    uint64_t v8 = v5;
  }

  return v5;
}

+ (id)slotsForMultipleParameterState:(id)a3 inParameter:(id)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v23 = a4;
  uint64_t v6 = [v5 variable];

  if (v6)
  {
    uint64_t v7 = [v23 moduleSummarySlotForState:0];
    uint64_t v8 = [v5 variable];
    [v7 populateWithVariable:v8];

    if (v7)
    {
      v31[0] = v7;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  uint64_t v7 = [v5 parameterStates];
  if (![v7 count] && !objc_msgSend(v23, "isRangedSizeArray"))
  {
LABEL_13:
    id v9 = 0;
    goto LABEL_16;
  }
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __77__WFModuleSummaryTemplateBuilder_slotsForMultipleParameterState_inParameter___block_invoke;
  v24[3] = &unk_264BFD050;
  id v10 = v23;
  id v25 = v10;
  uint64_t v26 = &v27;
  id v11 = objc_msgSend(v7, "if_compactMap:", v24);
  if ([v10 isRangedSizeArray])
  {
    unint64_t v12 = [v10 arraySizeRangeForCHSWidgetFamily:3];
    if ([v11 count] < v12)
    {
      uint64_t v13 = [v11 count];
      uint64_t v14 = [MEMORY[0x263EFF980] arrayWithCapacity:v12 - v13];
      uint64_t v15 = [v11 count];
      if (v15 < (uint64_t)v12)
      {
        do
        {
          id v16 = [v10 moduleSummarySlotForState:0];
          uint64_t v17 = [v16 identifier];
          id v18 = [v17 identifierBySettingArrayIndex:v15];
          [v16 setIdentifier:v18];

          objc_msgSend(v16, "setEnabled:", v15 == objc_msgSend(v11, "count"));
          [v14 addObject:v16];

          ++v15;
        }
        while (v12 != v15);
      }
      id v19 = [MEMORY[0x263EFF8C0] arrayWithArray:v11];
      uint64_t v20 = [v19 arrayByAddingObjectsFromArray:v14];

      id v11 = (void *)v20;
    }
  }
  if (WFShouldShowAddButtonForParameter(v10, *((unsigned __int8 *)v28 + 24) != 0, v5, [v11 count]))
  {
    long long v21 = +[WFSlotTemplateSlot addingSlotWithKey:@"_array_add_"];
    id v9 = [v11 arrayByAddingObject:v21];
  }
  else
  {
    id v9 = v11;
  }

  _Block_object_dispose(&v27, 8);
LABEL_16:

  return v9;
}

id __77__WFModuleSummaryTemplateBuilder_slotsForMultipleParameterState_inParameter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) moduleSummarySlotForState:a2];
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = [v6 identifierBySettingArrayIndex:a3];
  [v5 setIdentifier:v7];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v8 = [v5 contentAttributedString];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 length] != 0;
  }
  return v5;
}

+ (BOOL)formatString:(id)a3 containsParameterKey:(id)a4
{
  id v5 = NSString;
  id v6 = a3;
  uint64_t v7 = [v5 stringWithFormat:@"${%@}", a4];
  LOBYTE(v5) = [v6 containsString:v7];

  return (char)v5;
}

@end