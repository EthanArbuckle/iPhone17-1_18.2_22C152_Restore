@interface NWCHourlyForecastPrecipitationViewBuilder
- (CLKDevice)device;
- (NWCHourlyForecastPrecipitationViewBuilder)initWithDevice:(id)a3;
- (id)createHourlyForecastView;
@end

@implementation NWCHourlyForecastPrecipitationViewBuilder

- (NWCHourlyForecastPrecipitationViewBuilder)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NWCHourlyForecastPrecipitationViewBuilder;
  v6 = [(NWCHourlyForecastPrecipitationViewBuilder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (id)createHourlyForecastView
{
  v3 = [NWCHourlyForecastPrecipitationView alloc];
  v4 = [(NWCHourlyForecastPrecipitationViewBuilder *)self device];
  id v5 = [(NWCHourlyForecastView *)v3 initWithDevice:v4];

  return v5;
}

- (CLKDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
}

@end