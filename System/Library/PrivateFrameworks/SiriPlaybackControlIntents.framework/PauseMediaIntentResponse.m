@interface PauseMediaIntentResponse
- (PauseMediaIntentResponse)init;
- (PauseMediaIntentResponse)initWithBackingStore:(id)a3;
- (PauseMediaIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (PauseMediaIntentResponse)initWithCoder:(id)a3;
- (PauseMediaIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation PauseMediaIntentResponse

- (PauseMediaIntentResponse)init
{
  return (PauseMediaIntentResponse *)PauseMediaIntentResponse.init()();
}

- (void)setCode:(int64_t)a3
{
}

- (int64_t)code
{
  return sub_23281B01C();
}

- (PauseMediaIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (PauseMediaIntentResponse *)PauseMediaIntentResponse.init(backingStore:)(a3);
}

- (PauseMediaIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (PauseMediaIntentResponse *)PauseMediaIntentResponse.init(code:userActivity:)(a3, a4);
}

- (PauseMediaIntentResponse)initWithCoder:(id)a3
{
  return (PauseMediaIntentResponse *)PauseMediaIntentResponse.init(coder:)(a3);
}

- (PauseMediaIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (PauseMediaIntentResponse *)PauseMediaIntentResponse.init(propertiesByName:)(v3);
}

@end