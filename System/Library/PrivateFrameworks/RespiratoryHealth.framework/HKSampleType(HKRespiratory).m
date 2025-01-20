@interface HKSampleType(HKRespiratory)
+ (uint64_t)hkrp_heartRateType;
+ (uint64_t)hkrp_oxygenSaturationType;
@end

@implementation HKSampleType(HKRespiratory)

+ (uint64_t)hkrp_heartRateType
{
  return [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09E38]];
}

+ (uint64_t)hkrp_oxygenSaturationType
{
  return [MEMORY[0x263F0A658] quantityTypeForIdentifier:*MEMORY[0x263F09E88]];
}

@end