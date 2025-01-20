@interface WFTemperatureUnitChangeRequest
- (int)temperatureUnit;
- (void)setTemperatureUnit:(int)a3;
- (void)startWithService:(id)a3;
@end

@implementation WFTemperatureUnitChangeRequest

- (void)startWithService:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(WFTemperatureUnitChangeRequest *)self temperatureUnit];
  id v6 = [(WFTask *)self identifier];
  [v4 replaceTemperatureUnitWith:v5 identifier:v6];
}

- (int)temperatureUnit
{
  return self->_temperatureUnit;
}

- (void)setTemperatureUnit:(int)a3
{
  self->_temperatureUnit = a3;
}

@end