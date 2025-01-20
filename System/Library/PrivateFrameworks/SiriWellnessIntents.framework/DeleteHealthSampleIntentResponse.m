@interface DeleteHealthSampleIntentResponse
- (DeleteHealthSampleIntentResponse)init;
- (DeleteHealthSampleIntentResponse)initWithBackingStore:(id)a3;
- (DeleteHealthSampleIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (DeleteHealthSampleIntentResponse)initWithCoder:(id)a3;
- (DeleteHealthSampleIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation DeleteHealthSampleIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t v5 = DeleteHealthSampleIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  DeleteHealthSampleIntentResponse.code.setter(a3);
}

- (DeleteHealthSampleIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (DeleteHealthSampleIntentResponse *)DeleteHealthSampleIntentResponse.init(code:userActivity:)(a3, a4);
}

- (DeleteHealthSampleIntentResponse)init
{
  return (DeleteHealthSampleIntentResponse *)DeleteHealthSampleIntentResponse.init()();
}

- (DeleteHealthSampleIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (DeleteHealthSampleIntentResponse *)DeleteHealthSampleIntentResponse.init(coder:)(a3);
}

- (DeleteHealthSampleIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (DeleteHealthSampleIntentResponse *)DeleteHealthSampleIntentResponse.init(backingStore:)(a3);
}

- (DeleteHealthSampleIntentResponse)initWithPropertiesByName:(id)a3
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
  return (DeleteHealthSampleIntentResponse *)DeleteHealthSampleIntentResponse.init(propertiesByName:)(v6);
}

@end