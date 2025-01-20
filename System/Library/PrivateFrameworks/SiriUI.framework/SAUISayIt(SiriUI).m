@interface SAUISayIt(SiriUI)
- (uint64_t)siriui_ignoresMuteSwitch;
- (void)siriui_setIgnoresMuteSwitch:()SiriUI;
@end

@implementation SAUISayIt(SiriUI)

- (void)siriui_setIgnoresMuteSwitch:()SiriUI
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setProperty:v2 forKey:@"SiriUISAUISayItIgnoresMuteSwitch"];
}

- (uint64_t)siriui_ignoresMuteSwitch
{
  v1 = [a1 propertyForKey:@"SiriUISAUISayItIgnoresMuteSwitch"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

@end