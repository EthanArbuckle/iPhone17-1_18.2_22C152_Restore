@interface NWCFiveHourForecastPrecipitationView
- (NWMPrecipitationFormatter)formatter;
- (id)_setupViewBuilderForDevice:(id)a3;
- (id)dataFormatter;
- (void)setFormatter:(id)a3;
@end

@implementation NWCFiveHourForecastPrecipitationView

- (id)_setupViewBuilderForDevice:(id)a3
{
  id v3 = a3;
  v4 = [[NWCHourlyForecastPrecipitationViewBuilder alloc] initWithDevice:v3];

  return v4;
}

- (id)dataFormatter
{
  id v3 = [(NWCFiveHourForecastPrecipitationView *)self formatter];

  if (!v3)
  {
    v4 = objc_opt_new();
    [(NWCFiveHourForecastPrecipitationView *)self setFormatter:v4];
  }

  return [(NWCFiveHourForecastPrecipitationView *)self formatter];
}

- (NWMPrecipitationFormatter)formatter
{
  return self->_formatter;
}

- (void)setFormatter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end