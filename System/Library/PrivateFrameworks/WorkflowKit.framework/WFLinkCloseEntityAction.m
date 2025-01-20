@interface WFLinkCloseEntityAction
- (id)entityParameterName;
- (id)overrideLabelsByParameter;
- (id)parameterSummary;
@end

@implementation WFLinkCloseEntityAction

- (id)parameterSummary
{
  v11.receiver = self;
  v11.super_class = (Class)WFLinkCloseEntityAction;
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
    v8 = WFLocalizedStringResourceWithKey(@"Close ${target}", @"Close ${target}");
    v9 = [(WFActionParameterSummary *)v7 initWithString:v8];
  }
  return v9;
}

- (id)overrideLabelsByParameter
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFLinkCloseEntityAction *)self entityParameterName];
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = [(WFLinkEntityAction *)self entityName];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      v7 = [(WFLinkEntityAction *)self entityName];
      v8 = [v7 key];
      uint64_t v9 = [v8 length];

      if (v9)
      {
        v10 = [(WFLinkCloseEntityAction *)self entityParameterName];
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

- (id)entityParameterName
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"entity";
  v6[1] = @"target";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  v4 = [(WFLinkEntityAction *)self actualEntityParameterNameFromPossibleNames:v3];

  return v4;
}

@end