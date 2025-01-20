@interface SBAmbientDefaults
- (void)_bindAndRegisterDefaults;
@end

@implementation SBAmbientDefaults

- (void)_bindAndRegisterDefaults
{
  id v3 = [NSString stringWithUTF8String:"qiChargingIdleTimerDuration"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"SBAmbientQiChargingIdleTimerDuration" toDefaultValue:&unk_1ED89ECA8 options:1];
}

@end