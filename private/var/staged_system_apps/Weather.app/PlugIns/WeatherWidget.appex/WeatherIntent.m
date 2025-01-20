@interface WeatherIntent
- (WeatherIntent)init;
- (WeatherIntent)initWithCoder:(id)a3;
- (WeatherIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (WeatherIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation WeatherIntent

- (WeatherIntent)init
{
  return (WeatherIntent *)WeatherIntent.init()();
}

- (WeatherIntent)initWithCoder:(id)a3
{
  return (WeatherIntent *)WeatherIntent.init(coder:)(a3);
}

- (WeatherIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10012CA40();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (WeatherIntent *)WeatherIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (WeatherIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_10012C990();
  }
  return (WeatherIntent *)WeatherIntent.init(domain:verb:parametersByName:)();
}

@end