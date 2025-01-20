@interface WFTypes
+ (id)WeatherDescriptions;
@end

@implementation WFTypes

+ (id)WeatherDescriptions
{
  if (WeatherDescriptions_onceToken != -1) {
    dispatch_once(&WeatherDescriptions_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)WeatherDescriptions_WeatherDescriptions;
  return v2;
}

void __30__WFTypes_WeatherDescriptions__block_invoke()
{
  v0 = (void *)WeatherDescriptions_WeatherDescriptions;
  WeatherDescriptions_WeatherDescriptions = (uint64_t)&unk_26CD64FA0;
}

@end