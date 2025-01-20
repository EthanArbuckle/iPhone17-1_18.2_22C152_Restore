@interface WFWeatherDataServiceParserV1(ParseNextHour)
+ (id)dateFormatter;
@end

@implementation WFWeatherDataServiceParserV1(ParseNextHour)

+ (id)dateFormatter
{
  if (dateFormatter_onceToken != -1) {
    dispatch_once(&dateFormatter_onceToken, &__block_literal_global);
  }
  v2 = (void *)dateFormatter_dateFormatter;
  return v2;
}

@end