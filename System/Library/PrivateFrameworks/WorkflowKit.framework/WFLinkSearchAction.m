@interface WFLinkSearchAction
- (id)localizedNameWithContext:(id)a3;
- (id)overrideLabelsByParameter;
- (id)parameterOverrides;
- (id)parameterSummary;
@end

@implementation WFLinkSearchAction

- (id)parameterOverrides
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)WFLinkSearchAction;
  v2 = [(WFOverridableLinkAction *)&v10 parameterOverrides];
  v3 = (void *)[v2 mutableCopy];
  v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  v6 = v5;

  v11 = @"Prompt";
  v7 = WFLocalizedStringWithKey(@"What do you want to search for? (searchPhrase)", @"What do you want to search for?");
  v12[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  WFAddEntriesToDictionary(v6, @"searchPhrase", v8);

  return v6;
}

- (id)overrideLabelsByParameter
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v5 = @"searchPhrase";
  v2 = WFLocalizedStringResourceWithKey(@"Text (searchPhrase)", @"Text");
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)parameterSummary
{
  v3 = NSString;
  v4 = WFLocalizedString(@"Search ${searchPhrase} in %@");
  id v5 = [(WFOverridableLinkAction *)self appName];
  v6 = objc_msgSend(v3, "localizedStringWithFormat:", v4, v5);

  v7 = [[WFActionParameterSummary alloc] initWithLocalizedString:v6];
  return v7;
}

- (id)localizedNameWithContext:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  v6 = WFLocalizedStringResourceWithKey(@"WFLinkSearchAction - Action Name", @"Search in %@");
  v7 = [v5 localize:v6];

  v8 = [(WFOverridableLinkAction *)self appName];
  v9 = objc_msgSend(v4, "localizedStringWithFormat:", v7, v8);

  return v9;
}

@end