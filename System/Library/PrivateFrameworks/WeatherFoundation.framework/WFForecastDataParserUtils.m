@interface WFForecastDataParserUtils
+ (id)ascendingTimeComparator;
+ (id)stringFromKeyPath:(id)a3;
@end

@implementation WFForecastDataParserUtils

+ (id)ascendingTimeComparator
{
  return &__block_literal_global_4;
}

BOOL __52__WFForecastDataParserUtils_ascendingTimeComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 valueForComponent:@"WFWeatherForecastDateComponent"];
  v6 = [v4 valueForComponent:@"WFWeatherForecastDateComponent"];

  v7 = [v5 laterDate:v6];
  BOOL v8 = v7 == v5;

  return v8;
}

+ (id)stringFromKeyPath:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = (void *)MEMORY[0x263F089D8];
    v5 = [v3 objectAtIndexedSubscript:0];
    v6 = [v4 stringWithFormat:@"[ %@", v5];

    if ((unint64_t)[v3 count] >= 2)
    {
      unint64_t v7 = 1;
      do
      {
        BOOL v8 = [v3 objectAtIndexedSubscript:v7];
        [v6 appendFormat:@" → %@", v8];

        ++v7;
      }
      while (v7 < [v3 count]);
    }
    [v6 appendString:@" ]"];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end