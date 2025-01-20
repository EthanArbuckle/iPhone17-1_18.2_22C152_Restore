@interface NWCHourlyForecastPrecipitationView
- (id)topLabelTextFromConditions:(id)a3;
@end

@implementation NWCHourlyForecastPrecipitationView

- (id)topLabelTextFromConditions:(id)a3
{
  id v4 = a3;
  v5 = [(NWCHourlyForecastView *)self formatter];
  v6 = [v5 formattedChanceOfPrecipitation:v4 style:1 shouldIncludePercentSymbol:1];

  return v6;
}

@end