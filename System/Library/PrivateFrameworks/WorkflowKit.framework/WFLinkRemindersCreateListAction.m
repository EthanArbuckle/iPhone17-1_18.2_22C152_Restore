@interface WFLinkRemindersCreateListAction
- (id)localizedNameWithContext:(id)a3;
- (id)overrideLabelsByParameter;
@end

@implementation WFLinkRemindersCreateListAction

- (id)overrideLabelsByParameter
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"name";
  v2 = WFLocalizedStringResourceWithKey(@"List Name", @"List Name");
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)localizedNameWithContext:(id)a3
{
  id v3 = a3;
  v4 = WFLocalizedStringResourceWithKey(@"Create List", @"Create List");
  v5 = [v3 localize:v4];

  return v5;
}

@end