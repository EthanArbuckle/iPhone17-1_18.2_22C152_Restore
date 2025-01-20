@interface WeatherIntentResponse
- (WeatherIntentResponse)init;
- (WeatherIntentResponse)initWithBackingStore:(id)a3;
- (WeatherIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (WeatherIntentResponse)initWithCoder:(id)a3;
- (WeatherIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation WeatherIntentResponse

- (int64_t)code
{
  return WeatherIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (WeatherIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (WeatherIntentResponse *)WeatherIntentResponse.init(code:userActivity:)(a3, a4);
}

- (WeatherIntentResponse)init
{
  return (WeatherIntentResponse *)WeatherIntentResponse.init()();
}

- (WeatherIntentResponse)initWithCoder:(id)a3
{
  return (WeatherIntentResponse *)WeatherIntentResponse.init(coder:)(a3);
}

- (WeatherIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (WeatherIntentResponse *)WeatherIntentResponse.init(backingStore:)(a3);
}

- (WeatherIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_100053E88();
  }
  else {
    uint64_t v3 = 0;
  }
  return (WeatherIntentResponse *)WeatherIntentResponse.init(propertiesByName:)(v3);
}

@end