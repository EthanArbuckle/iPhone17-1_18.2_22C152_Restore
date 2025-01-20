@interface NWCHourlyForecastTemperatureView
- (id)topLabelTextFromConditions:(id)a3;
@end

@implementation NWCHourlyForecastTemperatureView

- (id)topLabelTextFromConditions:(id)a3
{
  id v4 = a3;
  v5 = [(NWCHourlyForecastView *)self formatter];
  v6 = [v4 objectForKeyedSubscript:*MEMORY[0x263F86050]];

  v7 = [v5 formattedWithDegreeSymbol:v6 style:1 fallbackStyle:0];

  return v7;
}

@end