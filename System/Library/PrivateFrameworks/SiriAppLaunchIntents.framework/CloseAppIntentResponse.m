@interface CloseAppIntentResponse
- (CloseAppIntentResponse)init;
- (CloseAppIntentResponse)initWithBackingStore:(id)a3;
- (CloseAppIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (CloseAppIntentResponse)initWithCoder:(id)a3;
- (CloseAppIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation CloseAppIntentResponse

- (int64_t)code
{
  return CloseAppIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (CloseAppIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (CloseAppIntentResponse *)CloseAppIntentResponse.init(code:userActivity:)(a3, a4);
}

- (CloseAppIntentResponse)init
{
  return (CloseAppIntentResponse *)CloseAppIntentResponse.init()();
}

- (CloseAppIntentResponse)initWithCoder:(id)a3
{
  return (CloseAppIntentResponse *)CloseAppIntentResponse.init(coder:)(a3);
}

- (CloseAppIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (CloseAppIntentResponse *)CloseAppIntentResponse.init(backingStore:)(a3);
}

- (CloseAppIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_23785B640();
  }
  else {
    uint64_t v3 = 0;
  }
  return (CloseAppIntentResponse *)CloseAppIntentResponse.init(propertiesByName:)(v3);
}

@end