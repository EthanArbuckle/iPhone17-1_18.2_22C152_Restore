@interface SAUIDialogPunchout
+ (id)dialogPunchout;
- (SAUIAssistantUtteranceView)utteranceView;
- (SAUIButton)buttonView;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setButtonView:(id)a3;
- (void)setUtteranceView:(id)a3;
@end

@implementation SAUIDialogPunchout

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"DialogPunchout";
}

+ (id)dialogPunchout
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIButton)buttonView
{
  return (SAUIButton *)AceObjectAceObjectForProperty(self, @"buttonView");
}

- (void)setButtonView:(id)a3
{
}

- (SAUIAssistantUtteranceView)utteranceView
{
  return (SAUIAssistantUtteranceView *)AceObjectAceObjectForProperty(self, @"utteranceView");
}

- (void)setUtteranceView:(id)a3
{
}

@end