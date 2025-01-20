@interface NWCFiveHourForecastWindView
- (id)_setupViewBuilderForDevice:(id)a3;
- (id)dataFormatter;
@end

@implementation NWCFiveHourForecastWindView

- (id)_setupViewBuilderForDevice:(id)a3
{
  id v3 = a3;
  v4 = [[NWCHourlyForecastWindViewBuilder alloc] initWithDevice:v3];

  return v4;
}

- (id)dataFormatter
{
  return 0;
}

@end