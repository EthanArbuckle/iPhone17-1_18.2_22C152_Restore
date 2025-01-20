@interface SAUISayIt(SiriUIFoundationAdditions)
- (uint64_t)sruif_ignoresMuteSwitch;
- (uint64_t)sruif_usefulUserResultType;
- (void)sruif_setIgnoresMuteSwitch:()SiriUIFoundationAdditions;
@end

@implementation SAUISayIt(SiriUIFoundationAdditions)

- (void)sruif_setIgnoresMuteSwitch:()SiriUIFoundationAdditions
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 setProperty:v2 forKey:@"SiriUISAUISayItIgnoresMuteSwitch"];
}

- (uint64_t)sruif_ignoresMuteSwitch
{
  v1 = [a1 propertyForKey:@"SiriUISAUISayItIgnoresMuteSwitch"];
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (uint64_t)sruif_usefulUserResultType
{
  return 1;
}

@end