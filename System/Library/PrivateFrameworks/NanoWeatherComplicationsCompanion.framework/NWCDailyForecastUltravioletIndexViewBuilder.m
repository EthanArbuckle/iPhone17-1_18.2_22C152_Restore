@interface NWCDailyForecastUltravioletIndexViewBuilder
- (CLKDevice)device;
- (NWCDailyForecastUltravioletIndexViewBuilder)initWithDevice:(id)a3;
- (id)createDailyForecastView;
@end

@implementation NWCDailyForecastUltravioletIndexViewBuilder

- (NWCDailyForecastUltravioletIndexViewBuilder)initWithDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NWCDailyForecastUltravioletIndexViewBuilder;
  v6 = [(NWCDailyForecastUltravioletIndexViewBuilder *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_device, a3);
  }

  return v7;
}

- (id)createDailyForecastView
{
  v3 = [NWCDailyForecastUltravioletIndexView alloc];
  v4 = [(NWCDailyForecastUltravioletIndexViewBuilder *)self device];
  id v5 = [(NWCDailyForecastUltravioletIndexView *)v3 initWithDevice:v4];

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