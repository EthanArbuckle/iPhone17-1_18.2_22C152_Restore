@interface WFLinkSafariChangeReaderModeStateAction
- (id)localizedCategoryWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)overrideDefaultValuesByParameter;
- (id)parameterOverrides;
- (id)parameterSummary;
@end

@implementation WFLinkSafariChangeReaderModeStateAction

- (id)parameterOverrides
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)WFLinkSafariChangeReaderModeStateAction;
  v2 = [(WFOverridableLinkAction *)&v11 parameterOverrides];
  v3 = (void *)[v2 mutableCopy];

  v15 = @"ItemDisplayNames";
  v4 = WFLocalizedStringResourceWithKey(@"Hide (changeOperation)", @"Hide");
  v14[0] = v4;
  v5 = WFLocalizedStringResourceWithKey(@"Show (changeOperation)", @"Show");
  v14[1] = v5;
  v6 = WFLocalizedStringResourceWithKey(@"Toggle (changeOperation)", @"Toggle");
  v14[2] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  v16[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  WFAddEntriesToDictionary(v3, @"changeOperation", v8);

  v12 = @"Hidden";
  uint64_t v13 = MEMORY[0x1E4F1CC38];
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  WFAddEntriesToDictionary(v3, @"setting", v9);

  return v3;
}

- (id)overrideDefaultValuesByParameter
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)WFLinkSafariChangeReaderModeStateAction;
  v2 = [(WFLinkChangeBinarySettingAction *)&v6 overrideDefaultValuesByParameter];
  v7 = @"setting";
  v8[0] = @"reader";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  v4 = objc_msgSend(v2, "if_dictionaryByAddingEntriesFromDictionary:", v3);

  return v4;
}

- (id)localizedNameWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"WFLinkSafariChangeReaderModeStateAction - Action Name", @"Show/Hide Reader in Safari");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"SafariSubcategorySafariReader", @"Safari Reader");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)parameterSummary
{
  v2 = [WFActionParameterSummary alloc];
  id v3 = WFLocalizedStringResourceWithKey(@"${changeOperation} Safari Reader", @"${changeOperation} Safari Reader");
  v4 = [(WFActionParameterSummary *)v2 initWithString:v3];

  return v4;
}

@end