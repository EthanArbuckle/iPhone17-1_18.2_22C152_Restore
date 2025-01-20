@interface NWCFiveHourForecastTemperatureView
- (NWMTemperatureFormatter)formatter;
- (id)_setupViewBuilderForDevice:(id)a3;
- (id)dataFormatter;
- (void)setFormatter:(id)a3;
@end

@implementation NWCFiveHourForecastTemperatureView

- (void).cxx_destruct
{
}

- (id)_setupViewBuilderForDevice:(id)a3
{
  id v3 = a3;
  v4 = [[NWCHourlyForecastTemperatureViewBuilder alloc] initWithDevice:v3];

  return v4;
}

- (id)dataFormatter
{
  id v3 = [(NWCFiveHourForecastTemperatureView *)self formatter];

  if (!v3)
  {
    v4 = +[NWMTemperatureFormatter autoupdatingSharedFormatter];
    [(NWCFiveHourForecastTemperatureView *)self setFormatter:v4];
  }

  return [(NWCFiveHourForecastTemperatureView *)self formatter];
}

- (NWMTemperatureFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

@end