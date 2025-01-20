@interface HKCountrySet(SleepApneaNotifications)
+ (id)localAvailabilityForSleepApneaNotifications;
@end

@implementation HKCountrySet(SleepApneaNotifications)

+ (id)localAvailabilityForSleepApneaNotifications
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F0A288]) initWithCountryBitmasks:&unk_26DAF2660 compatibilityVersion:1 contentVersion:2 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+SleepApneaNotifications.m" lineNumber:42 description:@"Local generated country set should never be nil"];
  }
  return v4;
}

@end