@interface GetContactIntentResponse
- (GetContactIntentResponse)init;
- (GetContactIntentResponse)initWithBackingStore:(id)a3;
- (GetContactIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (GetContactIntentResponse)initWithCoder:(id)a3;
- (GetContactIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation GetContactIntentResponse

- (int64_t)code
{
  return GetContactIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (GetContactIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (GetContactIntentResponse *)GetContactIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetContactIntentResponse)init
{
  return (GetContactIntentResponse *)GetContactIntentResponse.init()();
}

- (GetContactIntentResponse)initWithCoder:(id)a3
{
  return (GetContactIntentResponse *)GetContactIntentResponse.init(coder:)(a3);
}

- (GetContactIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (GetContactIntentResponse *)GetContactIntentResponse.init(backingStore:)(a3);
}

- (GetContactIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (GetContactIntentResponse *)GetContactIntentResponse.init(propertiesByName:)(v3);
}

@end