@interface LogGenericMedicationsIntentResponse
- (LogGenericMedicationsIntentResponse)init;
- (LogGenericMedicationsIntentResponse)initWithBackingStore:(id)a3;
- (LogGenericMedicationsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (LogGenericMedicationsIntentResponse)initWithCoder:(id)a3;
- (LogGenericMedicationsIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation LogGenericMedicationsIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t v5 = LogGenericMedicationsIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  LogGenericMedicationsIntentResponse.code.setter(a3);
}

- (LogGenericMedicationsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (LogGenericMedicationsIntentResponse *)LogGenericMedicationsIntentResponse.init(code:userActivity:)(a3, a4);
}

- (LogGenericMedicationsIntentResponse)init
{
  return (LogGenericMedicationsIntentResponse *)LogGenericMedicationsIntentResponse.init()();
}

- (LogGenericMedicationsIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (LogGenericMedicationsIntentResponse *)LogGenericMedicationsIntentResponse.init(coder:)(a3);
}

- (LogGenericMedicationsIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (LogGenericMedicationsIntentResponse *)LogGenericMedicationsIntentResponse.init(backingStore:)(a3);
}

- (LogGenericMedicationsIntentResponse)initWithPropertiesByName:(id)a3
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
  return (LogGenericMedicationsIntentResponse *)LogGenericMedicationsIntentResponse.init(propertiesByName:)(v6);
}

@end