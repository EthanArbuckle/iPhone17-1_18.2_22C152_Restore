@interface LaunchAppIntentResponse
- (LaunchAppIntentResponse)init;
- (LaunchAppIntentResponse)initWithBackingStore:(id)a3;
- (LaunchAppIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (LaunchAppIntentResponse)initWithCoder:(id)a3;
- (LaunchAppIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation LaunchAppIntentResponse

- (int64_t)code
{
  return LaunchAppIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (LaunchAppIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (LaunchAppIntentResponse *)LaunchAppIntentResponse.init(code:userActivity:)(a3, a4);
}

- (LaunchAppIntentResponse)init
{
  return (LaunchAppIntentResponse *)LaunchAppIntentResponse.init()();
}

- (LaunchAppIntentResponse)initWithCoder:(id)a3
{
  return (LaunchAppIntentResponse *)LaunchAppIntentResponse.init(coder:)(a3);
}

- (LaunchAppIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (LaunchAppIntentResponse *)LaunchAppIntentResponse.init(backingStore:)(a3);
}

- (LaunchAppIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_23785B640();
  }
  else {
    uint64_t v3 = 0;
  }
  return (LaunchAppIntentResponse *)LaunchAppIntentResponse.init(propertiesByName:)(v3);
}

@end