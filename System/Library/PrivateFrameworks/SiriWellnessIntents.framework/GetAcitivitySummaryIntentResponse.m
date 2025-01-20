@interface GetAcitivitySummaryIntentResponse
- (GetAcitivitySummaryIntentResponse)init;
- (GetAcitivitySummaryIntentResponse)initWithBackingStore:(id)a3;
- (GetAcitivitySummaryIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (GetAcitivitySummaryIntentResponse)initWithCoder:(id)a3;
- (GetAcitivitySummaryIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation GetAcitivitySummaryIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t AcitivitySummaryIntent = GetAcitivitySummaryIntentResponse.code.getter();

  return AcitivitySummaryIntent;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  GetAcitivitySummaryIntentResponse.code.setter(a3);
}

- (GetAcitivitySummaryIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (GetAcitivitySummaryIntentResponse *)GetAcitivitySummaryIntentResponse.init(code:userActivity:)(a3, a4);
}

- (GetAcitivitySummaryIntentResponse)init
{
  return (GetAcitivitySummaryIntentResponse *)GetAcitivitySummaryIntentResponse.init()();
}

- (GetAcitivitySummaryIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (GetAcitivitySummaryIntentResponse *)GetAcitivitySummaryIntentResponse.init(coder:)(a3);
}

- (GetAcitivitySummaryIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (GetAcitivitySummaryIntentResponse *)GetAcitivitySummaryIntentResponse.init(backingStore:)(a3);
}

- (GetAcitivitySummaryIntentResponse)initWithPropertiesByName:(id)a3
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
  return (GetAcitivitySummaryIntentResponse *)GetAcitivitySummaryIntentResponse.init(propertiesByName:)(v6);
}

@end