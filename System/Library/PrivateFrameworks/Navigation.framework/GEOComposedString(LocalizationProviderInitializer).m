@interface GEOComposedString(LocalizationProviderInitializer)
+ (uint64_t)initialize;
@end

@implementation GEOComposedString(LocalizationProviderInitializer)

+ (uint64_t)initialize
{
  return +[MNStringLocalizationProvider initLocalizationProvider];
}

@end