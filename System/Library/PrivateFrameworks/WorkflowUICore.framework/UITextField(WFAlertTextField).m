@interface UITextField(WFAlertTextField)
+ (uint64_t)usesSuggestions;
- (id)alertAutocapitalizationType;
- (id)alertClearButtonMode;
- (id)alertReturnKeyType;
- (uint64_t)alertTextInputMode;
- (uint64_t)setAlertAutocapitalizationType:()WFAlertTextField;
- (uint64_t)setAlertClearButtonMode:()WFAlertTextField;
- (uint64_t)setAlertReturnKeyType:()WFAlertTextField;
- (uint64_t)suggestions;
- (void)setSuggestions:()WFAlertTextField;
@end

@implementation UITextField(WFAlertTextField)

- (uint64_t)setAlertReturnKeyType:()WFAlertTextField
{
  uint64_t v4 = WFReturnKeyTypeFromString(a3);
  return [a1 setReturnKeyType:v4];
}

- (id)alertReturnKeyType
{
  uint64_t v1 = [a1 returnKeyType];
  return WFReturnKeyTypeFromType(v1);
}

- (uint64_t)setAlertAutocapitalizationType:()WFAlertTextField
{
  uint64_t v4 = WFAutocapitalizationTypeFromString(a3);
  return [a1 setAutocapitalizationType:v4];
}

- (id)alertAutocapitalizationType
{
  unint64_t v1 = [a1 autocapitalizationType];
  return WFAutocapitalizationTypeFromType(v1);
}

- (uint64_t)setAlertClearButtonMode:()WFAlertTextField
{
  uint64_t v4 = WFClearButtonModeFromString(a3);
  return [a1 setClearButtonMode:v4];
}

- (id)alertClearButtonMode
{
  unint64_t v1 = [a1 clearButtonMode];
  return WFClearButtonModeFromMode(v1);
}

- (uint64_t)alertTextInputMode
{
  return 0;
}

- (void)setSuggestions:()WFAlertTextField
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = getWFGeneralLogObject();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 136315138;
    v2 = "-[UITextField(WFAlertTextField) setSuggestions:]";
    _os_log_impl(&dword_2352F5000, v0, OS_LOG_TYPE_ERROR, "%s You tried to set suggestions on a text field that doesn't support it. You should check +usesSuggestions first.", (uint8_t *)&v1, 0xCu);
  }
}

- (uint64_t)suggestions
{
  return 0;
}

+ (uint64_t)usesSuggestions
{
  return 0;
}

@end