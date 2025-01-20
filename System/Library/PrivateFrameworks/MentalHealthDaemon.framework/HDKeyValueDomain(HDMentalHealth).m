@interface HDKeyValueDomain(HDMentalHealth)
+ (id)hdmh_mentalHealthSyncedDefaultsDomainWithProfile:()HDMentalHealth;
@end

@implementation HDKeyValueDomain(HDMentalHealth)

+ (id)hdmh_mentalHealthSyncedDefaultsDomainWithProfile:()HDMentalHealth
{
  id v3 = a3;
  uint64_t v4 = HDEntityCategoryForKeyValueCategory();
  id v5 = objc_alloc(MEMORY[0x263F43218]);
  v6 = (void *)[v5 initWithCategory:v4 domainName:*MEMORY[0x263F54F98] profile:v3];

  return v6;
}

@end