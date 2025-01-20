@interface HKKeyValueDomain(MentalHealth)
+ (id)hkmh_mentalHealthSyncedDefaultsDomainWithHealthStore:()MentalHealth;
@end

@implementation HKKeyValueDomain(MentalHealth)

+ (id)hkmh_mentalHealthSyncedDefaultsDomainWithHealthStore:()MentalHealth
{
  v3 = (objc_class *)MEMORY[0x263F0A470];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithCategory:0 domainName:@"com.apple.private.health.mental-health" healthStore:v4];

  return v5;
}

@end