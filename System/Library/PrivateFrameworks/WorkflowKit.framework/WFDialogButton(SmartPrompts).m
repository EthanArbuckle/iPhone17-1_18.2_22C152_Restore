@interface WFDialogButton(SmartPrompts)
- (id)smartPromptIntentButton;
@end

@implementation WFDialogButton(SmartPrompts)

- (id)smartPromptIntentButton
{
  id v2 = objc_alloc(MEMORY[0x1E4FB4960]);
  v3 = [a1 identifier];
  v4 = [a1 title];
  v5 = (void *)[v2 initWithIdentifier:v3 displayString:v4];

  return v5;
}

@end