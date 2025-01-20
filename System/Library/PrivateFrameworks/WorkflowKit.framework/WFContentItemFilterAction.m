@interface WFContentItemFilterAction
- (BOOL)canHandleInputOfContentClasses:(id)a3 withSupportedClasses:(id)a4;
- (BOOL)hasMultipleFilterConditions;
- (BOOL)inputRequired;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (NSArray)disallowedVariableTypesForTableTemplate;
- (WFContentPredicate)contentPredicate;
- (WFContentQuery)query;
- (_WFContentSlice)slice;
- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)inputParameterKey;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionInputWithContext:(id)a3;
- (id)localizedDescriptionResultWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)localizedParameterSummaryStringForFilter;
- (id)localizedParameterSummaryStringForFilterWithFilterConditions;
- (id)localizedParameterSummaryStringForFilterWithMultipleFilterConditions;
- (id)localizedParameterSummaryStringForFind;
- (id)localizedParameterSummaryStringForFindWithFilterConditions;
- (id)localizedParameterSummaryStringForFindWithMultipleFilterConditions;
- (id)localizedPluralDescriptionWithContext:(id)a3;
- (id)parameterDefinitions;
- (id)parameterStateForKey:(id)a3;
- (id)parameterSummary;
- (id)possibleStatesForEnumeration:(id)a3;
- (id)sortablePropertyDisplayNames;
- (id)sortablePropertyNames;
- (id)swift_rowForContentPropertyName:(id)a3;
- (int64_t)tableTemplateCompoundType;
- (int64_t)tableTemplateRowCount;
- (unint64_t)mode;
- (unint64_t)parameterCollapsingBehavior;
- (void)initializeParameters;
- (void)runAsynchronouslyWithInput:(id)a3;
- (void)runFilterWithInput:(id)a3 query:(id)a4;
- (void)setTableTemplateCompoundType:(int64_t)a3;
- (void)updateCompoundParameterVisibility;
- (void)wasAddedToWorkflow:(id)a3;
- (void)wasRemovedFromWorkflow:(id)a3;
@end

@implementation WFContentItemFilterAction

- (int64_t)tableTemplateRowCount
{
  v2 = self;
  int64_t v3 = WFContentItemFilterAction.tableTemplateRowCount.getter();

  return v3;
}

- (int64_t)tableTemplateCompoundType
{
  v2 = self;
  int64_t v3 = WFContentItemFilterAction.tableTemplateCompoundType.getter();

  return v3;
}

- (void)setTableTemplateCompoundType:(int64_t)a3
{
  v4 = self;
  WFContentItemFilterAction.tableTemplateCompoundType.setter(a3);
}

- (id)swift_rowForContentPropertyName:(id)a3
{
  uint64_t v4 = sub_1C8532658();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  v9 = (void *)WFContentItemFilterAction.row(forContentPropertyName:)(v8);

  swift_bridgeObjectRelease();
  return v9;
}

- (WFContentPredicate)contentPredicate
{
  v2 = self;
  id v3 = WFContentItemFilterAction.contentPredicate.getter();

  return (WFContentPredicate *)v3;
}

- (BOOL)canHandleInputOfContentClasses:(id)a3 withSupportedClasses:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(WFContentItemFilterAction *)self inputRequired])
  {
    v53.receiver = self;
    v53.super_class = (Class)WFContentItemFilterAction;
    BOOL v8 = [(WFAction *)&v53 canHandleInputOfContentClasses:v6 withSupportedClasses:v7];
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v9 = v7;
    uint64_t v35 = [v9 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (v35)
    {
      uint64_t v10 = *(void *)v50;
      id v39 = v7;
      id v40 = v6;
      v38 = v9;
      uint64_t v34 = *(void *)v50;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v50 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v36 = v11;
          uint64_t v12 = *(void *)(*((void *)&v49 + 1) + 8 * v11);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id v13 = v6;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v55 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v46;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v46 != v16) {
                  objc_enumerationMutation(v13);
                }
                v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
                if ([v18 isSubclassOfClass:v12])
                {
                  v19 = [(WFAction *)self contentItemClass];
                  if (v19 != (objc_class *)objc_opt_class()
                    || v18 != objc_opt_class() && v18 != objc_opt_class())
                  {
                    if ((v20 = [(WFAction *)self contentItemClass],
                          uint64_t v21 = objc_opt_class(),
                          v22 = [(WFAction *)self contentItemClass],
                          v22 != (objc_class *)objc_opt_class())
                      && v20 != (objc_class *)v21
                      || v18 != objc_opt_class() && v18 != objc_opt_class())
                    {
LABEL_57:

                      BOOL v8 = 1;
                      id v7 = v39;
                      id v6 = v40;
                      goto LABEL_58;
                    }
                  }
                }
                else if (v12 == objc_opt_class() {
                       && v18 != objc_opt_class()
                }
                       && v18 != objc_opt_class()
                       && v18 != objc_opt_class()
                       && v18 != objc_opt_class()
                       && v18 != objc_opt_class()
                       && v18 != objc_opt_class()
                       && v18 != objc_opt_class()
                       && v18 != objc_opt_class())
                {
                  v23 = [(WFAction *)self contentItemClass];
                  if (v23 != (objc_class *)objc_opt_class()
                    || v18 != objc_opt_class() && v18 != objc_opt_class())
                  {
                    if ((v24 = [(WFAction *)self contentItemClass],
                          uint64_t v25 = objc_opt_class(),
                          v26 = [(WFAction *)self contentItemClass],
                          v26 != (objc_class *)objc_opt_class())
                      && v24 != (objc_class *)v25
                      || v18 != objc_opt_class() && v18 != objc_opt_class())
                    {
                      long long v43 = 0u;
                      long long v44 = 0u;
                      long long v41 = 0u;
                      long long v42 = 0u;
                      id obj = [v18 allSupportedTypes];
                      uint64_t v27 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
                      if (v27)
                      {
                        uint64_t v28 = v27;
                        uint64_t v29 = *(void *)v42;
                        while (2)
                        {
                          for (uint64_t i = 0; i != v28; ++i)
                          {
                            if (*(void *)v42 != v29) {
                              objc_enumerationMutation(obj);
                            }
                            v31 = *(void **)(*((void *)&v41 + 1) + 8 * i);
                            objc_opt_class();
                            if (objc_opt_isKindOfClass() & 1) != 0 && ([v31 isDeclared])
                            {

                              goto LABEL_57;
                            }
                          }
                          uint64_t v28 = [obj countByEnumeratingWithState:&v41 objects:v54 count:16];
                          if (v28) {
                            continue;
                          }
                          break;
                        }
                      }
                    }
                  }
                }
                ++v17;
              }
              while (v17 != v15);
              uint64_t v32 = [v13 countByEnumeratingWithState:&v45 objects:v55 count:16];
              uint64_t v15 = v32;
            }
            while (v32);
          }

          uint64_t v11 = v36 + 1;
          id v7 = v39;
          id v6 = v40;
          id v9 = v38;
          uint64_t v10 = v34;
        }
        while (v36 + 1 != v35);
        uint64_t v35 = [v38 countByEnumeratingWithState:&v49 objects:v56 count:16];
      }
      while (v35);
    }

    BOOL v8 = 0;
  }
LABEL_58:

  return v8;
}

- (void)runFilterWithInput:(id)a3 query:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(WFAction *)self contentItemClass];
  id v9 = [(WFAction *)self contentPermissionRequestor];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__WFContentItemFilterAction_runFilterWithInput_query___block_invoke;
  v10[3] = &unk_1E65577A0;
  v10[4] = self;
  [v7 generateCollectionByEvaluatingQuery:v6 forContentItemClass:v8 permissionRequestor:v9 completionHandler:v10];
}

void __54__WFContentItemFilterAction_runFilterWithInput_query___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  if ([(WFContentItemFilterAction *)self mode])
  {
    v5 = [(WFContentItemFilterAction *)self query];
    [(WFContentItemFilterAction *)self runFilterWithInput:v4 query:v5];
  }
  else
  {
    id v6 = [(WFAction *)self contentItemClass];
    id v7 = [(WFContentItemFilterAction *)self query];
    BOOL v8 = [(WFAction *)self contentPermissionRequestor];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__WFContentItemFilterAction_runAsynchronouslyWithInput___block_invoke;
    v9[3] = &unk_1E6557778;
    v9[4] = self;
    [(objc_class *)v6 runQuery:v7 withItems:0 permissionRequestor:v8 completionHandler:v9];
  }
}

void __56__WFContentItemFilterAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = (void *)MEMORY[0x1E4F5A830];
  id v7 = a3;
  id v6 = [v5 collectionWithItems:a2];
  [*(id *)(a1 + 32) setOutput:v6];

  [*(id *)(a1 + 32) finishRunningWithError:v7];
}

- (unint64_t)mode
{
  id v3 = [(WFContentItemFilterAction *)self inputParameterKey];
  id v4 = [(WFContentItemFilterAction *)self parameterStateForKey:v3];

  if ([(objc_class *)[(WFAction *)self contentItemClass] hasLibrary])
  {
    v5 = [v4 value];
    int v6 = [v5 isEqualToString:@"Library"];

    unint64_t v7 = v6 ^ 1u;
  }
  else
  {
    unint64_t v7 = 1;
  }

  return v7;
}

- (_WFContentSlice)slice
{
  unint64_t v3 = *MEMORY[0x1E4F5AB10];
  unint64_t v4 = *(void *)(MEMORY[0x1E4F5AB10] + 8);
  v5 = [(WFAction *)self parameterValueForKey:@"WFContentItemLimitNumber" ofClass:objc_opt_class()];
  uint64_t v6 = [v5 integerValue];

  unint64_t v7 = [(WFAction *)self parameterValueForKey:@"WFContentItemLimitEnabled" ofClass:objc_opt_class()];
  int v8 = [v7 BOOLValue];

  if (v8) {
    unint64_t v9 = v6;
  }
  else {
    unint64_t v9 = v4;
  }
  if (v8) {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v10 = v3;
  }
  result.var1 = v9;
  result.var0 = v10;
  return result;
}

- (WFContentQuery)query
{
  v24[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(WFAction *)self parameterValueForKey:@"WFContentItemSortProperty" ofClass:objc_opt_class()];
  unint64_t v4 = WFLocalizedContentPropertyPossibleValueMarker(@"Random");
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F5A890] randomSortDescriptor];
  }
  else
  {
    unint64_t v7 = [(objc_class *)[(WFAction *)self contentItemClass] allProperties];
    int v8 = [(WFAction *)self parameterValueForKey:@"WFContentItemSortProperty" ofClass:objc_opt_class()];
    unint64_t v9 = [v7 objectMatchingKey:@"name" value:v8];

    unint64_t v10 = WFLocalizedContentPropertyPossibleValueMarker(@"Z to A");
    v24[0] = v10;
    uint64_t v11 = WFLocalizedContentPropertyPossibleValueMarker(@"Biggest First");
    v24[1] = v11;
    uint64_t v12 = WFLocalizedContentPropertyPossibleValueMarker(@"Latest First");
    v24[2] = v12;
    id v13 = WFLocalizedContentPropertyPossibleValueMarker(@"Longest First");
    v24[3] = v13;
    uint64_t v14 = WFLocalizedContentPropertyPossibleValueMarker(@"Descending");
    v24[4] = v14;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:5];

    uint64_t v16 = [(WFAction *)self parameterValueForKey:@"WFContentItemSortOrder" ofClass:objc_opt_class()];
    int v17 = [v15 containsObject:v16];

    if (v9)
    {
      uint64_t v6 = [MEMORY[0x1E4F5A890] sortDescriptorWithProperty:v9 ascending:v17 ^ 1u comparator:0];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  v18 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v6, 0);

  v19 = [(WFContentItemFilterAction *)self contentPredicate];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F5A888]) initWithPredicate:v19];
  [v20 setSortDescriptors:v18];
  uint64_t v21 = [(WFContentItemFilterAction *)self slice];
  objc_msgSend(v20, "setSlice:", v21, v22);

  return (WFContentQuery *)v20;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  unint64_t v4 = objc_msgSend(a4, "value", a3);
  int v5 = WFLocalizedContentPropertyPossibleValue(v4);

  return v5;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(WFContentItemFilterAction *)self parameterStateForKey:@"WFContentItemSortProperty"];
  int v5 = [v4 value];

  if (!v5)
  {
    unint64_t v9 = 0;
    goto LABEL_18;
  }
  uint64_t v6 = [(objc_class *)[(WFAction *)self contentItemClass] allProperties];
  unint64_t v7 = [v6 objectMatchingKey:@"name" value:v5];
  if (v7)
  {
    id v8 = v7;

    goto LABEL_6;
  }
  unint64_t v10 = [(objc_class *)[(WFAction *)self contentItemClass] allProperties];
  id v8 = [v10 objectMatchingKey:@"displayName" value:v5];

  if (v8)
  {
LABEL_6:
    uint64_t v11 = (void *)[v8 propertyClass];
    uint64_t v12 = WFLocalizedContentPropertyPossibleValueMarker(@"Ascending");
    v24[0] = v12;
    id v13 = WFLocalizedContentPropertyPossibleValueMarker(@"Descending");
    v24[1] = v13;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

    if (([v8 hasPossibleValues] & 1) == 0)
    {
      if (([v11 isSubclassOfClass:objc_opt_class()] & 1) != 0
        || [v11 isSubclassOfClass:objc_opt_class()])
      {
        uint64_t v15 = WFLocalizedContentPropertyPossibleValueMarker(@"A to Z");
        v23[0] = v15;
        uint64_t v16 = WFLocalizedContentPropertyPossibleValueMarker(@"Z to A");
        v23[1] = v16;
        int v17 = v23;
      }
      else if (([v11 isSubclassOfClass:objc_opt_class()] & 1) != 0 {
             || ([v11 isSubclassOfClass:objc_opt_class()] & 1) != 0
      }
             || [v11 isSubclassOfClass:objc_opt_class()])
      {
        uint64_t v15 = WFLocalizedContentPropertyPossibleValueMarker(@"Smallest First");
        v22[0] = v15;
        uint64_t v16 = WFLocalizedContentPropertyPossibleValueMarker(@"Biggest First");
        v22[1] = v16;
        int v17 = v22;
      }
      else if ([v11 isSubclassOfClass:objc_opt_class()])
      {
        uint64_t v15 = WFLocalizedContentPropertyPossibleValueMarker(@"Oldest First");
        v21[0] = v15;
        uint64_t v16 = WFLocalizedContentPropertyPossibleValueMarker(@"Latest First");
        v21[1] = v16;
        int v17 = v21;
      }
      else
      {
        if (![v11 isSubclassOfClass:objc_opt_class()]) {
          goto LABEL_16;
        }
        uint64_t v15 = WFLocalizedContentPropertyPossibleValueMarker(@"Shortest First");
        v20[0] = v15;
        uint64_t v16 = WFLocalizedContentPropertyPossibleValueMarker(@"Longest First");
        v20[1] = v16;
        int v17 = v20;
      }
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];

      uint64_t v14 = (void *)v18;
    }
LABEL_16:
    unint64_t v9 = objc_msgSend(v14, "if_map:", &__block_literal_global_470);

    goto LABEL_17;
  }
  unint64_t v9 = 0;
LABEL_17:

LABEL_18:
  return v9;
}

WFStringSubstitutableState *__58__WFContentItemFilterAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v2];

  return v3;
}

- (id)parameterDefinitions
{
  v124[6] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(WFContentItemFilterAction *)self sortablePropertyNames];
  unint64_t v4 = [(WFContentItemFilterAction *)self sortablePropertyDisplayNames];
  int v5 = [(objc_class *)[(WFAction *)self contentItemClass] localizedTypeDescription];
  uint64_t v6 = [(objc_class *)[(WFAction *)self contentItemClass] localizedPluralTypeDescription];
  int v65 = [v5 isEqualToString:v6];

  BOOL v76 = [v3 count] == 0;
  v83 = (void *)MEMORY[0x1E4F1CA48];
  unint64_t v7 = [WFParameterDefinition alloc];
  v122[0] = @"Class";
  id v8 = (objc_class *)objc_opt_class();
  v94 = NSStringFromClass(v8);
  v123[0] = v94;
  v123[1] = @"WFContentItemFilter";
  v122[1] = @"Key";
  v122[2] = @"ContentItemClass";
  v93 = NSStringFromClass([(WFAction *)self contentItemClass]);
  v123[2] = v93;
  v122[3] = @"DisallowedVariableTypes";
  v92 = [(WFContentItemFilterAction *)self disallowedVariableTypesForTableTemplate];
  v123[3] = v92;
  v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v123 forKeys:v122 count:4];
  v90 = -[WFParameterDefinition initWithDictionary:](v7, "initWithDictionary:");
  v124[0] = v90;
  unint64_t v9 = [WFParameterDefinition alloc];
  v120[0] = @"Class";
  unint64_t v10 = (objc_class *)objc_opt_class();
  v89 = NSStringFromClass(v10);
  v121[0] = v89;
  v120[1] = @"Label";
  v88 = WFLocalizedStringResourceWithKey(@"Sort by (ContentItemFilter)", @"Sort by");
  v121[1] = v88;
  v120[2] = @"Description";
  v87 = [[WFContentItemFilterActionParameterDescription alloc] initWithContentItemClass:[(WFAction *)self contentItemClass] field:2];
  v121[2] = v87;
  v120[3] = @"DisallowedVariableTypes";
  v119[0] = @"Ask";
  v119[1] = @"Variable";
  v86 = [MEMORY[0x1E4F1C978] arrayWithObjects:v119 count:2];
  v121[3] = v86;
  v121[4] = @"WFContentItemSortProperty";
  v120[4] = @"Key";
  v120[5] = @"Placeholder";
  v85 = WFLocalizedStringResourceWithKey(@"None", @"None");
  v121[5] = v85;
  v121[6] = MEMORY[0x1E4F1CC38];
  v120[6] = @"AlwaysShowsButton";
  v120[7] = @"Items";
  WFLocalizedContentPropertyPossibleValueMarker(@"Random");
  v82 = v96 = v3;
  v81 = objc_msgSend(v3, "arrayByAddingObject:");
  v121[7] = v81;
  v120[8] = @"ItemDisplayNames";
  v80 = WFLocalizedContentPropertyPossibleValueMarker(@"Random");
  WFLocalizedContentPropertyPossibleValue(v80);
  v79 = v95 = v4;
  v78 = objc_msgSend(v4, "arrayByAddingObject:");
  v121[8] = v78;
  v120[9] = @"Hidden";
  v77 = [NSNumber numberWithBool:v76];
  v121[9] = v77;
  v75 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v121 forKeys:v120 count:10];
  v74 = -[WFParameterDefinition initWithDictionary:](v9, "initWithDictionary:");
  v124[1] = v74;
  uint64_t v11 = [WFParameterDefinition alloc];
  v117[0] = @"Class";
  uint64_t v12 = (objc_class *)objc_opt_class();
  v73 = NSStringFromClass(v12);
  v118[0] = v73;
  v117[1] = @"Label";
  v72 = WFLocalizedStringResourceWithKey(@"Order (ContentItemFilter)", @"Order");
  v118[1] = v72;
  v117[2] = @"Description";
  v71 = [[WFContentItemFilterActionParameterDescription alloc] initWithContentItemClass:[(WFAction *)self contentItemClass] field:3];
  v118[2] = v71;
  v117[3] = @"DisallowedVariableTypes";
  v116[0] = @"Ask";
  v116[1] = @"Variable";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:2];
  v117[4] = @"Key";
  v70 = (void *)v13;
  v118[3] = v13;
  v118[4] = @"WFContentItemSortOrder";
  v69 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v118 forKeys:v117 count:5];
  v68 = -[WFParameterDefinition initWithDictionary:](v11, "initWithDictionary:");
  v124[2] = v68;
  uint64_t v14 = [WFParameterDefinition alloc];
  v114[0] = @"Class";
  uint64_t v15 = (objc_class *)objc_opt_class();
  v67 = NSStringFromClass(v15);
  v115[0] = v67;
  v114[1] = @"Label";
  v64 = WFLocalizedStringResourceWithKey(@"Limit (ContentItemFilter)", @"Limit");
  v115[1] = v64;
  v114[2] = @"Description";
  v63 = [[WFContentItemFilterActionParameterDescription alloc] initWithContentItemClass:[(WFAction *)self contentItemClass] field:0];
  v115[2] = v63;
  v115[3] = MEMORY[0x1E4F1CC28];
  v114[3] = @"DefaultValue";
  v114[4] = @"Key";
  v115[4] = @"WFContentItemLimitEnabled";
  v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:5];
  v60 = -[WFParameterDefinition initWithDictionary:](v14, "initWithDictionary:");
  v124[3] = v60;
  uint64_t v16 = [WFParameterDefinition alloc];
  v112[0] = @"Class";
  int v17 = (objc_class *)objc_opt_class();
  v59 = NSStringFromClass(v17);
  v113[0] = v59;
  v112[1] = @"Label";
  v58 = WFLocalizedStringResourceWithKey(@"Get (ContentItemFilter)", @"Get");
  v113[1] = v58;
  v112[2] = @"Description";
  uint64_t v57 = [[WFContentItemFilterActionParameterDescription alloc] initWithContentItemClass:[(WFAction *)self contentItemClass] field:1];
  v113[2] = v57;
  v113[3] = @"WFContentItemLimitNumber";
  v112[3] = @"Key";
  v112[4] = @"StepperNoun";
  v61 = self;
  if (v65)
  {
    uint64_t v18 = NSString;
    v19 = @"%d Items";
    v20 = [@"%d Items" stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    uint64_t v21 = [v18 stringWithFormat:@"%@ (Pluralization)", v20];

    uint64_t v22 = WFLocalizedStringResourceWithKey(v21, @"%d Items");
  }
  else
  {
    uint64_t v22 = [(objc_class *)[(WFAction *)self contentItemClass] countDescription];
  }
  v56 = (void *)v22;
  v113[4] = v22;
  v112[5] = @"StepperPrefix";
  v66 = WFLocalizedStringResourceWithKey(@"Get (ContentItemFilter)", @"Get");
  v113[5] = v66;
  v113[6] = &unk_1F23172B0;
  v112[6] = @"DefaultValue";
  v112[7] = @"RequiredResources";
  v109[0] = @"WFResourceClass";
  v109[1] = @"WFParameterKey";
  v110[0] = @"WFParameterRelationResource";
  v110[1] = @"WFContentItemLimitEnabled";
  v109[2] = @"WFParameterValue";
  v110[2] = MEMORY[0x1E4F1CC38];
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:v109 count:3];
  v111 = v55;
  v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
  v113[7] = v54;
  objc_super v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:8];
  long long v52 = [(WFParameterDefinition *)v16 initWithDictionary:v53];
  v124[4] = v52;
  v23 = [WFParameterDefinition alloc];
  v107[0] = @"Class";
  v24 = (objc_class *)objc_opt_class();
  long long v51 = NSStringFromClass(v24);
  v108[0] = v51;
  v108[1] = @"WFCompoundType";
  v107[1] = @"Key";
  v107[2] = @"Items";
  long long v50 = [&unk_1F23172C8 stringValue];
  v106[0] = v50;
  long long v49 = [&unk_1F23172E0 stringValue];
  v106[1] = v49;
  uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];
  v108[2] = v25;
  v107[3] = @"ItemDisplayNames";
  v26 = WFLocalizedStringResourceWithKey(@"Any (find/filter)", @"Any");
  v105[0] = v26;
  uint64_t v27 = WFLocalizedStringResourceWithKey(@"All (find/filter)", @"All");
  v105[1] = v27;
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v105 count:2];
  v108[3] = v28;
  v107[4] = @"DefaultValue";
  uint64_t v29 = [&unk_1F23172C8 stringValue];
  v108[4] = v29;
  v107[5] = @"DisallowedVariableTypes";
  v30 = +[WFParameter allInsertableVariableTypes];
  v31 = [v30 allObjects];
  v108[5] = v31;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:v107 count:6];
  v33 = [(WFParameterDefinition *)v23 initWithDictionary:v32];
  v124[5] = v33;
  uint64_t v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:6];
  v84 = [v83 arrayWithArray:v34];

  LODWORD(v31) = [(objc_class *)[(WFAction *)v61 contentItemClass] hasLibrary];
  uint64_t v35 = [WFParameterDefinition alloc];
  if (v31)
  {
    v103[0] = @"Class";
    uint64_t v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    v104[0] = v37;
    v104[1] = @"WFContentItemInputParameter";
    v103[1] = @"Key";
    v103[2] = @"Label";
    v38 = [[WFContentItemFilterActionParameterDescription alloc] initWithContentItemClass:[(WFAction *)v61 contentItemClass] field:4];
    v104[2] = v38;
    v103[3] = @"Placeholder";
    id v39 = [[WFContentItemFilterActionParameterDescription alloc] initWithContentItemClass:[(WFAction *)v61 contentItemClass] field:4];
    v104[3] = v39;
    v103[4] = @"Items";
    v102 = @"Library";
    id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v102 count:1];
    v104[4] = v40;
    v103[5] = @"ItemDisplayNames";
    long long v41 = WFLocalizedStringResourceWithKey(@"Library (WFContentItemInputParameter)", @"Library");
    v101 = v41;
    long long v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v101 count:1];
    v104[5] = v42;
    v104[6] = @"Library";
    v103[6] = @"DefaultValue";
    v103[7] = @"DisallowedVariableTypes";
    v100[0] = @"CurrentDate";
    v100[1] = @"Ask";
    long long v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:2];
    v104[7] = v43;
    long long v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:8];
    long long v45 = [(WFParameterDefinition *)v35 initWithDictionary:v44];
    long long v46 = v84;
    [v84 addObject:v45];
  }
  else
  {
    v98[0] = @"Class";
    long long v47 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v47);
    v99[0] = v37;
    v99[1] = @"WFContentItemInputParameter";
    v98[1] = @"Key";
    v98[2] = @"Label";
    v38 = [[WFContentItemFilterActionParameterDescription alloc] initWithContentItemClass:[(WFAction *)v61 contentItemClass] field:4];
    v99[2] = v38;
    v98[3] = @"Placeholder";
    id v39 = [[WFContentItemFilterActionParameterDescription alloc] initWithContentItemClass:[(WFAction *)v61 contentItemClass] field:4];
    v99[3] = v39;
    v98[4] = @"DisallowedVariableTypes";
    v97[0] = @"CurrentDate";
    v97[1] = @"Ask";
    id v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v97 count:2];
    v99[4] = v40;
    long long v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:v98 count:5];
    long long v42 = [(WFParameterDefinition *)v35 initWithDictionary:v41];
    long long v46 = v84;
    [v84 addObject:v42];
  }

  return v46;
}

- (NSArray)disallowedVariableTypesForTableTemplate
{
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (id)sortablePropertyDisplayNames
{
  id v2 = [(objc_class *)[(WFAction *)self contentItemClass] allProperties];
  unint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sortable = YES"];
  unint64_t v4 = [v2 filteredArrayUsingPredicate:v3];
  int v5 = objc_msgSend(v4, "if_map:", &__block_literal_global_65861);

  return v5;
}

uint64_t __57__WFContentItemFilterAction_sortablePropertyDisplayNames__block_invoke(uint64_t a1, void *a2)
{
  return [a2 localizedName];
}

- (id)sortablePropertyNames
{
  id v2 = [(objc_class *)[(WFAction *)self contentItemClass] allProperties];
  unint64_t v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"sortable = YES"];
  unint64_t v4 = [v2 filteredArrayUsingPredicate:v3];
  int v5 = [v4 valueForKey:@"name"];

  return v5;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  v30[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v7 isEqualToString:@"WFCompoundType"]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v29.receiver = self;
    v29.super_class = (Class)WFContentItemFilterAction;
    if (![(WFAction *)&v29 setParameterState:v6 forKey:v7]) {
      goto LABEL_8;
    }
    [(WFAction *)self nameUpdated];
    id v8 = [(WFContentItemFilterAction *)self parameterStateForKey:@"WFContentItemSortOrder"];
    unint64_t v10 = [(WFContentItemFilterAction *)self parameterStateForKey:@"WFContentItemSortProperty"];
    uint64_t v11 = [(WFAction *)self parameterForKey:@"WFContentItemSortOrder"];
    uint64_t v12 = v11;
    if (v10)
    {
      uint64_t v13 = [v10 value];
      uint64_t v14 = WFLocalizedContentPropertyPossibleValueMarker(@"Random");
      objc_msgSend(v12, "setHidden:", objc_msgSend(v13, "isEqualToString:", v14));
    }
    else
    {
      [v11 setHidden:1];
    }
    [v12 reloadPossibleStates];
    if ([v7 isEqualToString:@"WFContentItemSortProperty"])
    {
      uint64_t v16 = [v12 possibleStates];
      char v17 = [v16 containsObject:v8];

      if ((v17 & 1) == 0)
      {
        uint64_t v28 = WFLocalizedContentPropertyPossibleValueMarker(@"Z to A");
        v30[0] = v28;
        uint64_t v27 = WFLocalizedContentPropertyPossibleValueMarker(@"Biggest First");
        v30[1] = v27;
        v26 = WFLocalizedContentPropertyPossibleValueMarker(@"Latest First");
        v30[2] = v26;
        uint64_t v18 = WFLocalizedContentPropertyPossibleValueMarker(@"Longest First");
        v30[3] = v18;
        v19 = WFLocalizedContentPropertyPossibleValueMarker(@"Descending");
        v30[4] = v19;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:5];
        uint64_t v21 = [v8 value];
        uint64_t v25 = [v20 containsObject:v21];

        uint64_t v22 = [v12 possibleStates];
        v23 = [v22 objectAtIndexedSubscript:v25];
        [(WFContentItemFilterAction *)self setParameterState:v23 forKey:@"WFContentItemSortOrder"];
      }
    }

LABEL_15:
    [(WFContentItemFilterAction *)self updateCompoundParameterVisibility];
    [(WFAction *)self reloadAuxiliaryButton];
    BOOL v15 = 1;
    goto LABEL_16;
  }
  id v8 = [v6 value];
  uint64_t v9 = [v8 integerValue];
  if ([(WFContentItemFilterAction *)self tableTemplateCompoundType] != v9)
  {
    [(WFContentItemFilterAction *)self setTableTemplateCompoundType:v9];
    goto LABEL_15;
  }

LABEL_8:
  BOOL v15 = 0;
LABEL_16:

  return v15;
}

- (id)parameterStateForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"WFCompoundType"])
  {
    int v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFContentItemFilterAction tableTemplateCompoundType](self, "tableTemplateCompoundType"));
    id v6 = [v5 stringValue];

    id v7 = [(WFVariableSubstitutableParameterState *)[WFStringSubstitutableState alloc] initWithValue:v6];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFContentItemFilterAction;
    id v7 = [(WFAction *)&v9 parameterStateForKey:v4];
  }

  return v7;
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFContentItemFilterAction;
  [(WFAction *)&v4 wasRemovedFromWorkflow:a3];
  [(WFAction *)self nameUpdated];
}

- (void)wasAddedToWorkflow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFContentItemFilterAction;
  [(WFAction *)&v4 wasAddedToWorkflow:a3];
  [(WFAction *)self nameUpdated];
}

- (BOOL)hasMultipleFilterConditions
{
  return [(WFContentItemFilterAction *)self tableTemplateRowCount] > 1;
}

- (void)updateCompoundParameterVisibility
{
  id v3 = [(WFAction *)self parameterForKey:@"WFCompoundType"];
  objc_msgSend(v3, "setHidden:", -[WFContentItemFilterAction hasMultipleFilterConditions](self, "hasMultipleFilterConditions") ^ 1);
}

- (void)initializeParameters
{
  v9.receiver = self;
  v9.super_class = (Class)WFContentItemFilterAction;
  [(WFAction *)&v9 initializeParameters];
  id v3 = [(WFContentItemFilterAction *)self parameterStateForKey:@"WFContentItemSortProperty"];
  objc_super v4 = [(WFAction *)self parameterForKey:@"WFContentItemSortOrder"];
  [v4 setDataSource:self];
  if (v3)
  {
    int v5 = [v3 value];
    id v6 = WFLocalizedContentPropertyPossibleValueMarker(@"Random");
    objc_msgSend(v4, "setHidden:", objc_msgSend(v5, "isEqualToString:", v6));
  }
  else
  {
    [v4 setHidden:1];
  }
  if ([(objc_class *)[(WFAction *)self contentItemClass] hasLibrary])
  {
    id v7 = [(WFContentItemFilterAction *)self inputParameterKey];
    id v8 = [(WFAction *)self parameterForKey:v7];

    objc_msgSend(v8, "setContentItemClass:", -[WFAction contentItemClass](self, "contentItemClass"));
  }
  [(WFContentItemFilterAction *)self updateCompoundParameterVisibility];
}

- (id)inputParameterKey
{
  return @"WFContentItemInputParameter";
}

- (BOOL)inputRequired
{
  return [(objc_class *)[(WFAction *)self contentItemClass] hasLibrary] ^ 1;
}

- (unint64_t)parameterCollapsingBehavior
{
  return 2;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  int v5 = [(objc_class *)[(WFAction *)self contentItemClass] localizedPluralFilterDescriptionWithContext:v4];

  return v5;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  id v4 = a3;
  int v5 = WFLocalizedStringResourceWithKey(@"filter|sort|find|search|library", @"filter|sort|find|search|library");
  id v6 = [v4 localize:v5];
  id v7 = [v6 componentsSeparatedByString:@"|"];

  if ([(objc_class *)[(WFAction *)self contentItemClass] hasLibrary])
  {
    id v8 = WFLocalizedStringResourceWithKey(@"get (Find/Filter search keyword)", @"get");
    objc_super v9 = [v4 localize:v8];
    uint64_t v10 = [v7 arrayByAddingObject:v9];

    id v7 = (void *)v10;
  }

  return v7;
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  id v4 = a3;
  int v5 = [(WFContentItemFilterAction *)self localizedPluralDescriptionWithContext:v4];
  if ([(WFContentItemFilterAction *)self tableTemplateRowCount] < 2)
  {
    id v7 = NSString;
    id v8 = @"WFContentItemFilterAction - Description result";
    objc_super v9 = @"The %@ that match the criteria.";
  }
  else
  {
    int64_t v6 = [(WFContentItemFilterAction *)self tableTemplateCompoundType];
    id v7 = NSString;
    if (v6)
    {
      id v8 = @"WFContentItemFilterAction - All description result";
      objc_super v9 = @"The %@ that match all of the criteria.";
    }
    else
    {
      id v8 = @"WFContentItemFilterAction - Any description result";
      objc_super v9 = @"The %@ that match any of the criteria.";
    }
  }
  uint64_t v10 = WFLocalizedStringResourceWithKey(v8, v9);
  uint64_t v11 = [v4 localize:v10];
  uint64_t v12 = objc_msgSend(v7, "localizedStringWithFormat:", v11, v5);

  return v12;
}

- (id)localizedDescriptionInputWithContext:(id)a3
{
  id v4 = a3;
  int v5 = [(WFContentItemFilterAction *)self localizedPluralDescriptionWithContext:v4];
  int v6 = [(objc_class *)[(WFAction *)self contentItemClass] hasLibrary];
  id v7 = NSString;
  if (v6)
  {
    id v8 = @"WFContentItemFilterAction - Library description input";
    objc_super v9 = @"If provided, the action will search through the %@ passed as input.";
  }
  else
  {
    id v8 = @"WFContentItemFilterAction - Description input";
    objc_super v9 = @"The %@ to filter through.";
  }
  uint64_t v10 = WFLocalizedStringResourceWithKey(v8, v9);
  uint64_t v11 = [v4 localize:v10];

  uint64_t v12 = objc_msgSend(v7, "localizedStringWithFormat:", v11, v5);

  return v12;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4 = a3;
  int v5 = [(WFContentItemFilterAction *)self localizedPluralDescriptionWithContext:v4];
  int v6 = [(objc_class *)[(WFAction *)self contentItemClass] hasLibrary];
  id v7 = NSString;
  if (v6)
  {
    id v8 = WFLocalizedStringResourceWithKey(@"WFContentItemFilterAction - Library description summary", @"Searches for the %@ in your library that match the given criteria.");
    objc_super v9 = [v4 localize:v8];
  }
  else
  {
    id v8 = WFLocalizedStringResourceWithKey(@"WFContentItemFilterAction - Description summary", @"Given a list of %@, this action returns the %@ that match the given criteria.");
    objc_super v9 = [v4 localize:v8];

    uint64_t v12 = v5;
  }
  uint64_t v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v5, v12);

  return v10;
}

- (id)localizedPluralDescriptionWithContext:(id)a3
{
  id v4 = a3;
  int v5 = [(objc_class *)[(WFAction *)self contentItemClass] localizedPluralFilterDescriptionWithContext:v4];

  if ([(objc_class *)[(WFAction *)self contentItemClass] canLowercaseTypeDescription])
  {
    uint64_t v6 = [v5 localizedLowercaseString];

    int v5 = (void *)v6;
  }
  return v5;
}

- (id)createStateForParameter:(id)a3 fromSerializedRepresentation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 key];
  int v9 = [v8 isEqualToString:@"WFContentItemSortOrder"];

  if (v9)
  {
    uint64_t v10 = WFLocalizedContentPropertyPossibleValueMarker(v7);

    v14.receiver = self;
    v14.super_class = (Class)WFContentItemFilterAction;
    uint64_t v11 = [(WFAction *)&v14 createStateForParameter:v6 fromSerializedRepresentation:v10];
    id v7 = (id)v10;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFContentItemFilterAction;
    uint64_t v11 = [(WFAction *)&v13 createStateForParameter:v6 fromSerializedRepresentation:v7];
  }

  return v11;
}

- (id)localizedParameterSummaryStringForFilterWithMultipleFilterConditions
{
  if ([(WFContentItemFilterAction *)self tableTemplateCompoundType]) {
    id v2 = @"FIND_FILTER_TITLE_FORMAT_FILTER_ALL";
  }
  else {
    id v2 = @"FIND_FILTER_TITLE_FORMAT_FILTER_ANY";
  }
  id v3 = WFLocalizedStringResourceWithKey(v2, @"Filter ${WFContentItemInputParameter} where ${WFCompoundType} of the following are true");
  return v3;
}

- (id)localizedParameterSummaryStringForFilterWithFilterConditions
{
  return WFLocalizedStringResourceWithKey(@"Filter ${WFContentItemInputParameter} where ", @"Filter ${WFContentItemInputParameter} where ");
}

- (id)localizedParameterSummaryStringForFilter
{
  return WFLocalizedStringResourceWithKey(@"Filter ${WFContentItemInputParameter}", @"Filter ${WFContentItemInputParameter}");
}

- (id)localizedParameterSummaryStringForFindWithMultipleFilterConditions
{
  if ([(WFContentItemFilterAction *)self tableTemplateCompoundType]) {
    id v2 = @"FIND_FILTER_TITLE_FORMAT_FIND_ALL";
  }
  else {
    id v2 = @"FIND_FILTER_TITLE_FORMAT_FIND_ANY";
  }
  id v3 = WFLocalizedStringResourceWithKey(v2, @"Find ${WFContentItemInputParameter} where ${WFCompoundType} of the following are true");
  return v3;
}

- (id)localizedParameterSummaryStringForFindWithFilterConditions
{
  return WFLocalizedStringResourceWithKey(@"Find ${WFContentItemInputParameter} where", @"Find ${WFContentItemInputParameter} where");
}

- (id)localizedParameterSummaryStringForFind
{
  return WFLocalizedStringResourceWithKey(@"Find ${WFContentItemInputParameter}", @"Find ${WFContentItemInputParameter}");
}

- (id)parameterSummary
{
  id v3 = [(WFAction *)self workflow];
  if (v3) {
    BOOL v4 = [(WFContentItemFilterAction *)self tableTemplateRowCount] > 0;
  }
  else {
    BOOL v4 = 0;
  }

  if ([(objc_class *)[(WFAction *)self contentItemClass] hasLibrary])
  {
    int v5 = [(WFContentItemFilterAction *)self inputParameterKey];
    id v6 = [(WFContentItemFilterAction *)self parameterStateForKey:v5];

    id v7 = [v6 variable];

    if (v4)
    {
      if ([(WFContentItemFilterAction *)self hasMultipleFilterConditions])
      {
        if (v7) {
          [(WFContentItemFilterAction *)self localizedParameterSummaryStringForFilterWithMultipleFilterConditions];
        }
        else {
          [(WFContentItemFilterAction *)self localizedParameterSummaryStringForFindWithMultipleFilterConditions];
        }
      }
      else if (v7)
      {
        [(WFContentItemFilterAction *)self localizedParameterSummaryStringForFilterWithFilterConditions];
      }
      else
      {
        [(WFContentItemFilterAction *)self localizedParameterSummaryStringForFindWithFilterConditions];
      }
    }
    else if (v7)
    {
      [(WFContentItemFilterAction *)self localizedParameterSummaryStringForFilter];
    }
    else
    {
      [(WFContentItemFilterAction *)self localizedParameterSummaryStringForFind];
    uint64_t v9 = };
    uint64_t v10 = (void *)v9;
  }
  else
  {
    if (v4)
    {
      if ([(WFContentItemFilterAction *)self hasMultipleFilterConditions]) {
        [(WFContentItemFilterAction *)self localizedParameterSummaryStringForFilterWithMultipleFilterConditions];
      }
      else {
      uint64_t v8 = [(WFContentItemFilterAction *)self localizedParameterSummaryStringForFilterWithFilterConditions];
      }
    }
    else
    {
      uint64_t v8 = [(WFContentItemFilterAction *)self localizedParameterSummaryStringForFilter];
    }
    uint64_t v10 = (void *)v8;
  }
  uint64_t v11 = [[WFActionParameterSummary alloc] initWithString:v10];

  return v11;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFContentItemFilterAction;
  int v5 = [(WFAction *)&v14 localizedNameWithContext:v4];
  uint64_t v6 = [(WFAction *)self workflow];
  if (v6)
  {
    id v7 = (void *)v6;
    uint64_t v8 = [(WFContentItemFilterAction *)self tableTemplateRowCount];

    if (v8 >= 1)
    {
      uint64_t v9 = NSString;
      uint64_t v10 = WFLocalizedStringResourceWithKey(@"%@ Where", @"%@ Where");
      uint64_t v11 = [v4 localize:v10];
      uint64_t v12 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v5);

      int v5 = (void *)v12;
    }
  }

  return v5;
}

@end