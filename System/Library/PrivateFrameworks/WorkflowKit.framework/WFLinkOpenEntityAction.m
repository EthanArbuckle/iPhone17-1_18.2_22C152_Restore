@interface WFLinkOpenEntityAction
+ (id)overrideInputParameterNames;
- (id)entityParameterName;
- (id)overrideLabelsByParameter;
- (id)parameterSummary;
@end

@implementation WFLinkOpenEntityAction

- (id)parameterSummary
{
  v19.receiver = self;
  v19.super_class = (Class)WFLinkOpenEntityAction;
  uint64_t v3 = [(WFLinkAction *)&v19 parameterSummary];
  v4 = [(WFAppIntentExecutionAction *)self metadata];
  uint64_t v5 = [v4 actionConfiguration];
  uint64_t v6 = v5 | v3;

  if (v6)
  {
    v16 = (WFActionParameterSummary *)(id)v3;
  }
  else
  {
    if ([(WFLinkEntityAction *)self isUniqueEntity])
    {
      v7 = WFLocalizedStringResourceWithKey(@"Open %@", @"Open %@");
      v8 = [(WFLinkEntityAction *)self entityMetadata];
      v9 = [v8 displayRepresentation];
      v10 = [v9 name];
      v11 = [v10 localizedStringWithPluralizationNumber:&unk_1F2316710 forLocaleIdentifier:0];

      v12 = NSString;
      v13 = [(WFAction *)self defaultLocalizationContext];
      v14 = [v13 localize:v7];
      v15 = objc_msgSend(v12, "localizedStringWithFormat:", v14, v11);

      v16 = [[WFActionParameterSummary alloc] initWithLocalizedString:v15];
    }
    else
    {
      v17 = [WFActionParameterSummary alloc];
      v7 = WFLocalizedStringResourceWithKey(@"Open ${target}", @"Open ${target}");
      v16 = [(WFActionParameterSummary *)v17 initWithString:v7];
    }
  }
  return v16;
}

- (id)overrideLabelsByParameter
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(WFLinkOpenEntityAction *)self entityParameterName];
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
        v10 = [(WFLinkOpenEntityAction *)self entityParameterName];
        v14 = v10;
        v11 = [(WFLinkEntityAction *)self entityName];
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

+ (id)overrideInputParameterNames
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"entity";
  v4[1] = @"target";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];
  return v2;
}

@end