@interface VIFeatureFlags
+ (BOOL)isVisualLookUpDawnDomainsCPEnabled;
+ (BOOL)isVisualLookUpDawnDomainsEnabled;
@end

@implementation VIFeatureFlags

+ (BOOL)isVisualLookUpDawnDomainsEnabled
{
  return 1;
}

+ (BOOL)isVisualLookUpDawnDomainsCPEnabled
{
  return MEMORY[0x1F40C9FB0]("VisualIntelligenceVisualSearch", "ConsumerProduct");
}

@end