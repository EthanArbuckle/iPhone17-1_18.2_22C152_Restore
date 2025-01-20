@interface UndoMedsIntentResponse
- (UndoMedsIntentResponse)init;
- (UndoMedsIntentResponse)initWithBackingStore:(id)a3;
- (UndoMedsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (UndoMedsIntentResponse)initWithCoder:(id)a3;
- (UndoMedsIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation UndoMedsIntentResponse

- (int64_t)code
{
  v2 = self;
  int64_t v5 = UndoMedsIntentResponse.code.getter();

  return v5;
}

- (void)setCode:(int64_t)a3
{
  v3 = self;
  UndoMedsIntentResponse.code.setter(a3);
}

- (UndoMedsIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v4 = a4;
  return (UndoMedsIntentResponse *)UndoMedsIntentResponse.init(code:userActivity:)(a3, a4);
}

- (UndoMedsIntentResponse)init
{
  return (UndoMedsIntentResponse *)UndoMedsIntentResponse.init()();
}

- (UndoMedsIntentResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  return (UndoMedsIntentResponse *)UndoMedsIntentResponse.init(coder:)(a3);
}

- (UndoMedsIntentResponse)initWithBackingStore:(id)a3
{
  id v3 = a3;
  return (UndoMedsIntentResponse *)UndoMedsIntentResponse.init(backingStore:)(a3);
}

- (UndoMedsIntentResponse)initWithPropertiesByName:(id)a3
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
  return (UndoMedsIntentResponse *)UndoMedsIntentResponse.init(propertiesByName:)(v6);
}

@end