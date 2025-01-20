@interface GetBloodPressureIntentResponse
- (GetBloodPressureIntentResponse)init;
- (GetBloodPressureIntentResponse)initWithBackingStore:(id)a3;
- (GetBloodPressureIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (GetBloodPressureIntentResponse)initWithCoder:(id)a3;
- (GetBloodPressureIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation GetBloodPressureIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t BloodPressureIntent = GetBloodPressureIntentResponse.code.getter();

  return BloodPressureIntent;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  GetBloodPressureIntentResponse.code.setter(a3);
}

- (GetBloodPressureIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (GetBloodPressureIntentResponse *)GetBloodPressureIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetBloodPressureIntentResponse)init
{
  return (GetBloodPressureIntentResponse *)GetBloodPressureIntentResponse.init()();
}

- (GetBloodPressureIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (GetBloodPressureIntentResponse *)GetBloodPressureIntentResponse.init(coder:)(a3);
}

- (GetBloodPressureIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (GetBloodPressureIntentResponse *)GetBloodPressureIntentResponse.init(backingStore:)(a3);
}

- (GetBloodPressureIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetBloodPressureIntentResponse *)GetBloodPressureIntentResponse.init(propertiesByName:)(v6);
}

@end