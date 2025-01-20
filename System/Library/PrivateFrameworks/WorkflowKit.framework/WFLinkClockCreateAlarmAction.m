@interface WFLinkClockCreateAlarmAction
- (id)overrideDefaultValuesByParameter;
- (id)overrideLabelsByParameter;
@end

@implementation WFLinkClockCreateAlarmAction

- (id)overrideDefaultValuesByParameter
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"name";
  v2 = WFLocalizedStringWithKey(@"AlarmDefaultValue", @"Alarm");
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)overrideLabelsByParameter
{
  return 0;
}

@end