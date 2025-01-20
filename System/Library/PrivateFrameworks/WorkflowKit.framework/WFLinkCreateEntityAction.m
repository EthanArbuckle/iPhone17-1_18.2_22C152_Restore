@interface WFLinkCreateEntityAction
- (Class)overrideTypeDescriptions;
- (id)overrideLabelsByParameter;
@end

@implementation WFLinkCreateEntityAction

- (id)overrideLabelsByParameter
{
  return 0;
}

- (Class)overrideTypeDescriptions
{
  v12.receiver = self;
  v12.super_class = (Class)WFLinkCreateEntityAction;
  v3 = [(WFLinkEntityAction *)&v12 overrideTypeDescriptions];
  if (!v3)
  {
    v4 = [(WFAppIntentExecutionAction *)self metadata];
    v5 = [v4 outputType];

    if (v5)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
    id v7 = v6;

    v8 = [v7 identifier];

    v9 = (void *)MEMORY[0x1E4F72C48];
    v10 = [(WFAction *)self appBundleIdentifier];
    v3 = (objc_class *)objc_msgSend(v9, "wf_descriptionClassForEntityType:appBundleIdentifier:", v8, v10);
  }
  return v3;
}

@end