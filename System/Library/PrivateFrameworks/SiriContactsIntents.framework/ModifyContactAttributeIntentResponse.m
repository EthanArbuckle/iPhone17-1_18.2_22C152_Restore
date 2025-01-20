@interface ModifyContactAttributeIntentResponse
- (ModifyContactAttributeIntentResponse)init;
- (ModifyContactAttributeIntentResponse)initWithBackingStore:(id)a3;
- (ModifyContactAttributeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (ModifyContactAttributeIntentResponse)initWithCoder:(id)a3;
- (ModifyContactAttributeIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation ModifyContactAttributeIntentResponse

- (int64_t)code
{
  return ModifyContactAttributeIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (ModifyContactAttributeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (ModifyContactAttributeIntentResponse *)ModifyContactAttributeIntentResponse.init(code:userActivity:)(a3, a4);
}

- (ModifyContactAttributeIntentResponse)init
{
  return (ModifyContactAttributeIntentResponse *)ModifyContactAttributeIntentResponse.init()();
}

- (ModifyContactAttributeIntentResponse)initWithCoder:(id)a3
{
  return (ModifyContactAttributeIntentResponse *)ModifyContactAttributeIntentResponse.init(coder:)(a3);
}

- (ModifyContactAttributeIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (ModifyContactAttributeIntentResponse *)ModifyContactAttributeIntentResponse.init(backingStore:)(a3);
}

- (ModifyContactAttributeIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  return (ModifyContactAttributeIntentResponse *)ModifyContactAttributeIntentResponse.init(propertiesByName:)(v3);
}

@end