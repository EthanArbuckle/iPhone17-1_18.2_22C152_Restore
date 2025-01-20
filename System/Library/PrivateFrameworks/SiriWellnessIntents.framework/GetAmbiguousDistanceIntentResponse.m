@interface GetAmbiguousDistanceIntentResponse
- (GetAmbiguousDistanceIntentResponse)init;
- (GetAmbiguousDistanceIntentResponse)initWithBackingStore:(id)a3;
- (GetAmbiguousDistanceIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (GetAmbiguousDistanceIntentResponse)initWithCoder:(id)a3;
- (GetAmbiguousDistanceIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation GetAmbiguousDistanceIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t AmbiguousDistanceIntent = GetAmbiguousDistanceIntentResponse.code.getter();

  return AmbiguousDistanceIntent;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  GetAmbiguousDistanceIntentResponse.code.setter(a3);
}

- (GetAmbiguousDistanceIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (GetAmbiguousDistanceIntentResponse *)GetAmbiguousDistanceIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetAmbiguousDistanceIntentResponse)init
{
  return (GetAmbiguousDistanceIntentResponse *)GetAmbiguousDistanceIntentResponse.init()();
}

- (GetAmbiguousDistanceIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (GetAmbiguousDistanceIntentResponse *)GetAmbiguousDistanceIntentResponse.init(coder:)(a3);
}

- (GetAmbiguousDistanceIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (GetAmbiguousDistanceIntentResponse *)GetAmbiguousDistanceIntentResponse.init(backingStore:)(a3);
}

- (GetAmbiguousDistanceIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetAmbiguousDistanceIntentResponse *)GetAmbiguousDistanceIntentResponse.init(propertiesByName:)(v6);
}

@end