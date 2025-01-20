@interface WFLinkDeleteEntityAction
+ (id)overrideInputParameterNames;
- (BOOL)deletesInput;
- (Class)contentItemClass;
- (id)entityParameterName;
- (id)itemsBeingDeleted;
- (id)overrideEntityName;
- (id)overrideLabelsByParameter;
- (id)parameterSummary;
@end

@implementation WFLinkDeleteEntityAction

- (id)parameterSummary
{
  v11.receiver = self;
  v11.super_class = (Class)WFLinkDeleteEntityAction;
  uint64_t v3 = [(WFLinkAction *)&v11 parameterSummary];
  v4 = [(WFAppIntentExecutionAction *)self metadata];
  uint64_t v5 = [v4 actionConfiguration];
  uint64_t v6 = v5 | v3;

  if (v6)
  {
    v9 = (WFActionParameterSummary *)(id)v3;
  }
  else
  {
    v7 = [WFActionParameterSummary alloc];
    v8 = WFLocalizedStringResourceWithKey(@"Delete ${entities}", @"Delete ${entities}");
    v9 = [(WFActionParameterSummary *)v7 initWithString:v8];
  }
  return v9;
}

- (id)itemsBeingDeleted
{
  uint64_t v3 = [(WFAction *)self processedParameters];
  v4 = [(WFLinkDeleteEntityAction *)self entityParameterName];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__WFLinkDeleteEntityAction_itemsBeingDeleted__block_invoke;
  v11[3] = &unk_1E654F440;
  v11[4] = self;
  v8 = objc_msgSend(v7, "if_compactMap:", v11);

  v9 = [MEMORY[0x1E4F5A830] collectionWithItems:v8];

  return v9;
}

id __45__WFLinkDeleteEntityAction_itemsBeingDeleted__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [v3 valueType];
    uint64_t v5 = [*(id *)(a1 + 32) bundleIdentifier];
    uint64_t v6 = [*(id *)(a1 + 32) bundleIdentifier];
    id v7 = objc_msgSend(v4, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", v3, v5, v6, 0);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (Class)contentItemClass
{
  v2 = [(WFLinkAction *)self inputDictionary];
  id v3 = [v2 objectForKeyedSubscript:@"Types"];

  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }
  id v5 = v4;

  uint64_t v6 = [v5 firstObject];

  if (v6) {
    Class v7 = NSClassFromString(v6);
  }
  else {
    Class v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (BOOL)deletesInput
{
  return 1;
}

- (id)overrideLabelsByParameter
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFLinkDeleteEntityAction *)self entityParameterName];
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = [(WFLinkEntityAction *)self entityName];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      Class v7 = [(WFLinkEntityAction *)self entityName];
      v8 = [v7 key];
      uint64_t v9 = [v8 length];

      if (v9)
      {
        v10 = [(WFLinkDeleteEntityAction *)self entityParameterName];
        v14 = v10;
        objc_super v11 = [(WFLinkEntityAction *)self entityName];
        v15[0] = v11;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

        goto LABEL_7;
      }
    }
    else
    {
    }
  }
  v12 = 0;
LABEL_7:
  return v12;
}

- (id)overrideEntityName
{
  v2 = [(WFLinkEntityAction *)self overrideTypeDescriptions];
  if (v2)
  {
    v2 = [(objc_class *)v2 pluralTypeDescription];
  }
  return v2;
}

- (id)entityParameterName
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"entity";
  v6[1] = @"entities";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [(WFLinkEntityAction *)self actualEntityParameterNameFromPossibleNames:v3];

  return v4;
}

+ (id)overrideInputParameterNames
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"entity";
  v4[1] = @"entities";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

@end