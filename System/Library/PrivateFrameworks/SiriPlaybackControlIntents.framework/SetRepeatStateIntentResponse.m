@interface SetRepeatStateIntentResponse
- (SetRepeatStateIntentResponse)init;
- (SetRepeatStateIntentResponse)initWithBackingStore:(id)a3;
- (SetRepeatStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetRepeatStateIntentResponse)initWithCoder:(id)a3;
- (SetRepeatStateIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetRepeatStateIntentResponse

- (int64_t)code
{
  return sub_232A531AC();
}

- (void)setCode:(int64_t)a3
{
}

- (SetRepeatStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SetRepeatStateIntentResponse *)SetRepeatStateIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetRepeatStateIntentResponse)init
{
  return (SetRepeatStateIntentResponse *)SetRepeatStateIntentResponse.init()();
}

- (SetRepeatStateIntentResponse)initWithCoder:(id)a3
{
  return (SetRepeatStateIntentResponse *)SetRepeatStateIntentResponse.init(coder:)(a3);
}

- (SetRepeatStateIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SetRepeatStateIntentResponse *)SetRepeatStateIntentResponse.init(backingStore:)(a3);
}

- (SetRepeatStateIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SetRepeatStateIntentResponse *)SetRepeatStateIntentResponse.init(propertiesByName:)(v3);
}

@end