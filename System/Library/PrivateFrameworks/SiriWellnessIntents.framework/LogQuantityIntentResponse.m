@interface LogQuantityIntentResponse
- (LogQuantityIntentResponse)init;
- (LogQuantityIntentResponse)initWithBackingStore:(id)a3;
- (LogQuantityIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (LogQuantityIntentResponse)initWithCoder:(id)a3;
- (LogQuantityIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation LogQuantityIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t v5 = LogQuantityIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  LogQuantityIntentResponse.code.setter(a3);
}

- (LogQuantityIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (LogQuantityIntentResponse *)LogQuantityIntentResponse.init(code:userActivity:)(a3, a4);
}

- (LogQuantityIntentResponse)init
{
  return (LogQuantityIntentResponse *)LogQuantityIntentResponse.init()();
}

- (LogQuantityIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (LogQuantityIntentResponse *)LogQuantityIntentResponse.init(coder:)(a3);
}

- (LogQuantityIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (LogQuantityIntentResponse *)LogQuantityIntentResponse.init(backingStore:)(a3);
}

- (LogQuantityIntentResponse)initWithPropertiesByName:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (LogQuantityIntentResponse *)LogQuantityIntentResponse.init(propertiesByName:)(v6);
}

@end