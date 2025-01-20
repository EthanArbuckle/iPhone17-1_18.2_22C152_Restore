@interface WFLinkSafariCreatePrivateTabAction
- (id)localizedCategoryWithContext:(id)a3;
- (id)localizedNameWithContext:(id)a3;
- (id)overrideLabelsByParameter;
- (id)parameterSummary;
@end

@implementation WFLinkSafariCreatePrivateTabAction

- (id)overrideLabelsByParameter
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"name";
  v2 = WFLocalizedStringResourceWithKey(@"Tab Name", @"Tab Name");
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)localizedCategoryWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"SafariSubcategoryTabs", @"Tabs");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)localizedNameWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"WFLinkSafariCreatePrivateTabAction - Action Name", @"Create New Private Tab");
  v5 = [v3 localize:v4];

  return v5;
}

- (id)parameterSummary
{
  v2 = [WFActionParameterSummary alloc];
  id v3 = WFLocalizedStringResourceWithKey(@"Create new private tab", @"Create new private tab");
  v4 = [(WFActionParameterSummary *)v2 initWithString:v3];

  return v4;
}

@end