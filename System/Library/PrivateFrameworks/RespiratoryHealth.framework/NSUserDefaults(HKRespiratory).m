@interface NSUserDefaults(HKRespiratory)
+ (id)hkrp_respiratoryDefaults;
@end

@implementation NSUserDefaults(HKRespiratory)

+ (id)hkrp_respiratoryDefaults
{
  id v0 = objc_alloc(MEMORY[0x263EFFA40]);
  v1 = (void *)[v0 initWithSuiteName:*MEMORY[0x263F09F70]];

  return v1;
}

@end