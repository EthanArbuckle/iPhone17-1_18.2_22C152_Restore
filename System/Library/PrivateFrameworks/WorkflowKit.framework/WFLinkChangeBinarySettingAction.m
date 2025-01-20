@interface WFLinkChangeBinarySettingAction
- (id)overrideDefaultValuesByParameter;
- (id)overrideLabelsByParameter;
- (id)parameterSummary;
@end

@implementation WFLinkChangeBinarySettingAction

- (id)overrideLabelsByParameter
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"changeOperation";
  v2 = WFLocalizedStringResourceWithKey(@"Operation (changeOperation)", @"Operation");
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)overrideDefaultValuesByParameter
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v4 = @"changeOperation";
  v5[0] = @"enable";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

- (id)parameterSummary
{
  v2 = [WFActionParameterSummary alloc];
  v3 = WFLocalizedStringResourceWithKey(@"${changeOperation} ${setting}", @"${changeOperation} ${setting}");
  v4 = [(WFActionParameterSummary *)v2 initWithString:v3];

  return v4;
}

@end