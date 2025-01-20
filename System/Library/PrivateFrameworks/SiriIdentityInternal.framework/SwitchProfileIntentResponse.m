@interface SwitchProfileIntentResponse
- (SwitchProfileIntentResponse)init;
- (SwitchProfileIntentResponse)initWithBackingStore:(id)a3;
- (SwitchProfileIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SwitchProfileIntentResponse)initWithCoder:(id)a3;
- (SwitchProfileIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SwitchProfileIntentResponse

- (int64_t)code
{
  return SwitchProfileIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (SwitchProfileIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SwitchProfileIntentResponse *)SwitchProfileIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SwitchProfileIntentResponse)init
{
  return (SwitchProfileIntentResponse *)SwitchProfileIntentResponse.init()();
}

- (SwitchProfileIntentResponse)initWithCoder:(id)a3
{
  return (SwitchProfileIntentResponse *)SwitchProfileIntentResponse.init(coder:)(a3);
}

- (SwitchProfileIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SwitchProfileIntentResponse *)SwitchProfileIntentResponse.init(backingStore:)(a3);
}

- (SwitchProfileIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_25C8EC110();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SwitchProfileIntentResponse *)SwitchProfileIntentResponse.init(propertiesByName:)(v3);
}

@end