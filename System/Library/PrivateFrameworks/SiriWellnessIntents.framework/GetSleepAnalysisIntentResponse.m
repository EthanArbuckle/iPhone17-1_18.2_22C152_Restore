@interface GetSleepAnalysisIntentResponse
- (GetSleepAnalysisIntentResponse)init;
- (GetSleepAnalysisIntentResponse)initWithBackingStore:(id)a3;
- (GetSleepAnalysisIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (GetSleepAnalysisIntentResponse)initWithCoder:(id)a3;
- (GetSleepAnalysisIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation GetSleepAnalysisIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t SleepAnalysisIntent = GetSleepAnalysisIntentResponse.code.getter();

  return SleepAnalysisIntent;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  GetSleepAnalysisIntentResponse.code.setter(a3);
}

- (GetSleepAnalysisIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (GetSleepAnalysisIntentResponse *)GetSleepAnalysisIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetSleepAnalysisIntentResponse)init
{
  return (GetSleepAnalysisIntentResponse *)GetSleepAnalysisIntentResponse.init()();
}

- (GetSleepAnalysisIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (GetSleepAnalysisIntentResponse *)GetSleepAnalysisIntentResponse.init(coder:)(a3);
}

- (GetSleepAnalysisIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (GetSleepAnalysisIntentResponse *)GetSleepAnalysisIntentResponse.init(backingStore:)(a3);
}

- (GetSleepAnalysisIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetSleepAnalysisIntentResponse *)GetSleepAnalysisIntentResponse.init(propertiesByName:)(v6);
}

@end