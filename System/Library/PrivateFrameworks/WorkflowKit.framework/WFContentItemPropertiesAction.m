@interface WFContentItemPropertiesAction
+ (BOOL)outputIsExemptFromTaintTrackingInheritance;
- (BOOL)inputRequired;
- (BOOL)setParameterState:(id)a3 forKey:(id)a4;
- (id)contentDestinationWithError:(id *)a3;
- (id)inputParameterKey;
- (id)localizedDefaultOutputNameWithContext:(id)a3;
- (id)localizedDescriptionResultWithContext:(id)a3;
- (id)localizedDescriptionSummaryWithContext:(id)a3;
- (id)localizedKeywordsWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)outputContentClasses;
- (id)outputMeasurementUnitType;
- (id)parameterDefinitions;
- (id)parameterSummary;
- (id)properties;
- (id)selectedProperty;
- (void)finishWithItems:(id)a3 property:(id)a4 coercionPerformed:(BOOL)a5;
- (void)runAsynchronouslyWithInput:(id)a3;
@end

@implementation WFContentItemPropertiesAction

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (void)finishWithItems:(id)a3 property:(id)a4 coercionPerformed:(BOOL)a5
{
  id v8 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke;
  v11[3] = &unk_1E654F248;
  BOOL v13 = a5;
  id v12 = v8;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke_3;
  v10[3] = &unk_1E65577A0;
  v10[4] = self;
  id v9 = v8;
  [a3 transformItemsAndFlattenUsingBlock:v11 completionHandler:v10];
}

void __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 40))
  {
    id v7 = *(id *)(a1 + 32);
  }
  else
  {
    id v7 = [(id)objc_opt_class() supportedPropertyForProperty:*(void *)(a1 + 32)];
  }
  id v8 = v7;
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke_2;
    v9[3] = &unk_1E6557C60;
    id v10 = v6;
    [v8 getValuesForObject:v5 completionHandler:v9];
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

void __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setOutput:a2];
  [*(id *)(a1 + 32) finishRunningWithError:v6];
}

uint64_t __76__WFContentItemPropertiesAction_finishWithItems_property_coercionPerformed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self parameterValueForKey:@"WFContentItemPropertyName" ofClass:objc_opt_class()];
  id v6 = [(objc_class *)[(WFAction *)self contentItemClass] propertyForName:v5];
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F5A848];
    id v8 = [v4 items];
    id v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
    if ([v7 contentItems:v8 haveContentProperties:v9])
    {
    }
    else
    {
      id v10 = [v4 items];
      v11 = [v10 valueForKey:@"class"];
      id v12 = [(WFContentItemAction *)self inputContentClasses];
      BOOL v13 = [v11 firstObjectCommonWithArray:v12];

      if (!v13)
      {
        v14 = [(WFAction *)self contentItemClass];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __60__WFContentItemPropertiesAction_runAsynchronouslyWithInput___block_invoke;
        v15[3] = &unk_1E654F220;
        v15[4] = self;
        id v16 = v6;
        [v4 generateCollectionByCoercingToItemClass:v14 completionHandler:v15];

        goto LABEL_8;
      }
    }
    [(WFContentItemPropertiesAction *)self finishWithItems:v4 property:v6 coercionPerformed:0];
  }
  else
  {
    [(WFAction *)self finishRunningWithError:0];
  }
LABEL_8:
}

void __60__WFContentItemPropertiesAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  uint64_t v7 = [v9 numberOfItems];
  id v8 = *(void **)(a1 + 32);
  if (v7) {
    [v8 finishWithItems:v9 property:*(void *)(a1 + 40) coercionPerformed:1];
  }
  else {
    [v8 finishRunningWithError:v6];
  }
}

- (id)parameterDefinitions
{
  v24[2] = *MEMORY[0x1E4F143B8];
  v3 = [(WFContentItemAction *)self defaultProperty];
  id v4 = [v3 name];

  id v5 = objc_opt_new();
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 setValue:v7 forKey:@"Class"];

  [v5 setValue:@"WFContentItemPropertyName" forKey:@"Key"];
  id v8 = WFLocalizedStringResourceWithKey(@"Detail (ContentItemProperties)", @"Detail");
  [v5 setValue:v8 forKey:@"Label"];

  id v9 = [(WFContentItemPropertiesAction *)self properties];
  id v10 = objc_msgSend(v9, "if_compactMap:", &__block_literal_global_14258);
  [v5 setValue:v10 forKey:@"Items"];

  v11 = [(WFContentItemPropertiesAction *)self properties];
  id v12 = objc_msgSend(v11, "if_compactMap:", &__block_literal_global_229);
  [v5 setValue:v12 forKey:@"ItemDisplayNames"];

  if (v4)
  {
    BOOL v13 = +[WFStringSubstitutableState serializedRepresentationFromValue:v4];
    [v5 setValue:v13 forKey:@"DefaultValue"];
  }
  else
  {
    [v5 setValue:0 forKey:@"DefaultValue"];
  }
  v14 = objc_opt_new();
  v15 = (objc_class *)objc_opt_class();
  id v16 = NSStringFromClass(v15);
  [v14 setValue:v16 forKey:@"Class"];

  v17 = [(WFContentItemPropertiesAction *)self inputParameterKey];
  [v14 setValue:v17 forKey:@"Key"];

  v18 = [(objc_class *)[(WFAction *)self contentItemClass] localizedFilterDescription];
  [v14 setValue:v18 forKey:@"Label"];

  v19 = [(objc_class *)[(WFAction *)self contentItemClass] localizedFilterDescription];
  [v14 setValue:v19 forKey:@"Placeholder"];

  v20 = [[WFParameterDefinition alloc] initWithDictionary:v5];
  v24[0] = v20;
  v21 = [[WFParameterDefinition alloc] initWithDictionary:v14];
  v24[1] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

  return v22;
}

uint64_t __53__WFContentItemPropertiesAction_parameterDefinitions__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 localizedName];
}

uint64_t __53__WFContentItemPropertiesAction_parameterDefinitions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 name];
}

- (id)outputMeasurementUnitType
{
  v2 = [(WFContentItemPropertiesAction *)self selectedProperty];
  v3 = [v2 measurementUnitType];

  return v3;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentItemPropertiesAction *)self selectedProperty];

  if (v5)
  {
    id v6 = [(WFContentItemPropertiesAction *)self selectedProperty];
    uint64_t v7 = [v6 localizedName];
LABEL_5:
    id v9 = (void *)v7;
    goto LABEL_6;
  }
  id v8 = [(WFAction *)self outputDictionary];
  id v6 = [v8 objectForKey:@"OutputName"];

  if (v6)
  {
    uint64_t v7 = [v4 localize:v6];
    goto LABEL_5;
  }
  v11 = [(objc_class *)[(WFAction *)self contentItemClass] localizedPluralFilterDescriptionWithContext:v4];
  id v12 = [v11 localizedCapitalizedString];

  BOOL v13 = NSString;
  v14 = WFLocalizedStringResourceWithKey(@"WFContentItemPropertiesAction - Action Output Name", @"Details of %@");
  v15 = [v4 localize:v14];
  id v9 = objc_msgSend(v13, "localizedStringWithFormat:", v15, v12);

  id v6 = 0;
LABEL_6:

  return v9;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFContentItemPropertiesAction;
  BOOL v7 = [(WFAction *)&v9 setParameterState:a3 forKey:v6];
  if (v7 && [v6 isEqualToString:@"WFContentItemPropertyName"]) {
    [(WFAction *)self outputDetailsUpdated];
  }

  return v7;
}

- (id)selectedProperty
{
  v3 = [(WFAction *)self parameterStateForKey:@"WFContentItemPropertyName"];
  id v4 = [v3 value];

  id v5 = [(objc_class *)[(WFAction *)self contentItemClass] propertyForName:v4];

  return v5;
}

- (id)outputContentClasses
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v3 = [(WFContentItemPropertiesAction *)self selectedProperty];
  id v4 = v3;
  if (v3)
  {
    v18[0] = [v3 valueItemClass];
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  }
  else
  {
    id v6 = objc_opt_new();
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    BOOL v7 = [(WFContentItemPropertiesAction *)self properties];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "valueItemClass"));
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    id v5 = [v6 array];
  }
  return v5;
}

- (id)inputParameterKey
{
  return @"WFInput";
}

- (BOOL)inputRequired
{
  return 1;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)WFContentItemPropertiesAction;
  id v3 = a3;
  id v4 = [(WFAction *)&v10 localizedKeywordsWithContext:v3];
  id v5 = WFLocalizedStringResourceWithKey(@"property|properties|fetch", @"property|properties|fetch");
  id v6 = objc_msgSend(v3, "localize:", v5, v10.receiver, v10.super_class);

  BOOL v7 = [v6 componentsSeparatedByString:@"|"];

  uint64_t v8 = [v4 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (id)localizedDescriptionResultWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFContentItemPropertiesAction *)self selectedProperty];
  id v6 = [v5 localizedName];
  if ([v6 length])
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = WFLocalizedStringResourceWithKey(@"The piece of information", @"The piece of information");
    id v7 = [v4 localize:v8];
  }
  return v7;
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(objc_class *)[(WFAction *)self contentItemClass] localizedPluralFilterDescriptionWithContext:v4];
  if ([(objc_class *)[(WFAction *)self contentItemClass] canLowercaseTypeDescription])
  {
    uint64_t v6 = [v5 localizedLowercaseString];

    id v5 = (void *)v6;
  }
  id v7 = NSString;
  uint64_t v8 = WFLocalizedStringResourceWithKey(@"Gets a specific piece of information from the %@ passed into the action.", @"Gets a specific piece of information from the %@ passed into the action.");
  uint64_t v9 = [v4 localize:v8];
  objc_super v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, v5);

  return v10;
}

- (id)parameterSummary
{
  v2 = [WFActionParameterSummary alloc];
  id v3 = WFLocalizedStringResourceWithKey(@"Get ${WFContentItemPropertyName} from ${WFInput}", @"Get ${WFContentItemPropertyName} from ${WFInput}");
  id v4 = [(WFActionParameterSummary *)v2 initWithString:v3];

  return v4;
}

- (id)localizedNameWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFAction *)self definition];
  uint64_t v6 = [v5 name];

  if (v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)WFContentItemPropertiesAction;
    id v7 = [(WFAction *)&v14 localizedNameWithContext:v4];
  }
  else
  {
    uint64_t v8 = WFLocalizedStringResourceWithKey(@"WFContentItemPropertiesAction - Action Name", @"Get Details of %@");
    uint64_t v9 = [(objc_class *)[(WFAction *)self contentItemClass] localizedPluralFilterDescriptionWithContext:v4];
    objc_super v10 = [v9 localizedCapitalizedString];

    v11 = NSString;
    id v12 = [v4 localize:v8];
    id v7 = objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
  }
  return v7;
}

- (id)properties
{
  v2 = [(objc_class *)[(WFAction *)self contentItemClass] allProperties];
  id v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"gettable = YES"];
  id v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end