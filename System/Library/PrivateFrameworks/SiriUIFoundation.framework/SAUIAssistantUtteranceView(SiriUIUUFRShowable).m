@interface SAUIAssistantUtteranceView(SiriUIUUFRShowable)
- (id)_uufrShownRequestedByInstrumentationManager:()SiriUIUUFRShowable;
@end

@implementation SAUIAssistantUtteranceView(SiriUIUUFRShowable)

- (id)_uufrShownRequestedByInstrumentationManager:()SiriUIUUFRShowable
{
  v5.receiver = a1;
  v5.super_class = (Class)&off_26D9C2A60;
  v2 = objc_msgSendSuper2(&v5, sel__uufrShownRequestedByInstrumentationManager_);
  v3 = [a1 dialogIdentifier];
  [v2 setDialogIdentifier:v3];

  return v2;
}

@end