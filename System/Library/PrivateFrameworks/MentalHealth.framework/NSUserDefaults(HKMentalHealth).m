@interface NSUserDefaults(HKMentalHealth)
+ (id)hkmh_mentalHealthDefaults;
@end

@implementation NSUserDefaults(HKMentalHealth)

+ (id)hkmh_mentalHealthDefaults
{
  v0 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.private.health.mental-health"];
  return v0;
}

@end