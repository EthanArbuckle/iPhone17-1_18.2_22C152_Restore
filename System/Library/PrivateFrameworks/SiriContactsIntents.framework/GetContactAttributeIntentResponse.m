@interface GetContactAttributeIntentResponse
- (GetContactAttributeIntentResponse)init;
- (GetContactAttributeIntentResponse)initWithBackingStore:(id)a3;
- (GetContactAttributeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (GetContactAttributeIntentResponse)initWithCoder:(id)a3;
- (GetContactAttributeIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation GetContactAttributeIntentResponse

- (int64_t)code
{
  return GetContactAttributeIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (GetContactAttributeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (GetContactAttributeIntentResponse *)GetContactAttributeIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetContactAttributeIntentResponse)init
{
  return (GetContactAttributeIntentResponse *)GetContactAttributeIntentResponse.init()();
}

- (GetContactAttributeIntentResponse)initWithCoder:(id)a3
{
  return (GetContactAttributeIntentResponse *)GetContactAttributeIntentResponse.init(coder:)(a3);
}

- (GetContactAttributeIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (GetContactAttributeIntentResponse *)GetContactAttributeIntentResponse.init(backingStore:)(a3);
}

- (GetContactAttributeIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (GetContactAttributeIntentResponse *)GetContactAttributeIntentResponse.init(propertiesByName:)(v3);
}

@end