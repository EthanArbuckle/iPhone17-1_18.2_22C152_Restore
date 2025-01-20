@interface GetHealthQuantityIntentResponse
- (GetHealthQuantityIntentResponse)init;
- (GetHealthQuantityIntentResponse)initWithBackingStore:(id)a3;
- (GetHealthQuantityIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (GetHealthQuantityIntentResponse)initWithCoder:(id)a3;
- (GetHealthQuantityIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation GetHealthQuantityIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t HealthQuantityIntent = GetHealthQuantityIntentResponse.code.getter();

  return HealthQuantityIntent;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  GetHealthQuantityIntentResponse.code.setter(a3);
}

- (GetHealthQuantityIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (GetHealthQuantityIntentResponse *)GetHealthQuantityIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetHealthQuantityIntentResponse)init
{
  return (GetHealthQuantityIntentResponse *)GetHealthQuantityIntentResponse.init()();
}

- (GetHealthQuantityIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (GetHealthQuantityIntentResponse *)GetHealthQuantityIntentResponse.init(coder:)(a3);
}

- (GetHealthQuantityIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (GetHealthQuantityIntentResponse *)GetHealthQuantityIntentResponse.init(backingStore:)(a3);
}

- (GetHealthQuantityIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetHealthQuantityIntentResponse *)GetHealthQuantityIntentResponse.init(propertiesByName:)(v6);
}

@end