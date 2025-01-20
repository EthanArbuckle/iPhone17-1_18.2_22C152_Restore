@interface LogBloodPressureIntentResponse
- (LogBloodPressureIntentResponse)init;
- (LogBloodPressureIntentResponse)initWithBackingStore:(id)a3;
- (LogBloodPressureIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (LogBloodPressureIntentResponse)initWithCoder:(id)a3;
- (LogBloodPressureIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation LogBloodPressureIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t v5 = LogBloodPressureIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  LogBloodPressureIntentResponse.code.setter(a3);
}

- (LogBloodPressureIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (LogBloodPressureIntentResponse *)LogBloodPressureIntentResponse.init(code:userActivity:)(a3, a4);
}

- (LogBloodPressureIntentResponse)init
{
  return (LogBloodPressureIntentResponse *)LogBloodPressureIntentResponse.init()();
}

- (LogBloodPressureIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (LogBloodPressureIntentResponse *)LogBloodPressureIntentResponse.init(coder:)(a3);
}

- (LogBloodPressureIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (LogBloodPressureIntentResponse *)LogBloodPressureIntentResponse.init(backingStore:)(a3);
}

- (LogBloodPressureIntentResponse)initWithPropertiesByName:(id)a3
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
  return (LogBloodPressureIntentResponse *)LogBloodPressureIntentResponse.init(propertiesByName:)(v6);
}

@end