@interface SetSubtitleStateIntentResponse
- (SetSubtitleStateIntentResponse)init;
- (SetSubtitleStateIntentResponse)initWithBackingStore:(id)a3;
- (SetSubtitleStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SetSubtitleStateIntentResponse)initWithCoder:(id)a3;
- (SetSubtitleStateIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SetSubtitleStateIntentResponse

- (int64_t)code
{
  return sub_232A4D894();
}

- (void)setCode:(int64_t)a3
{
}

- (SetSubtitleStateIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SetSubtitleStateIntentResponse *)SetSubtitleStateIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SetSubtitleStateIntentResponse)init
{
  return (SetSubtitleStateIntentResponse *)SetSubtitleStateIntentResponse.init()();
}

- (SetSubtitleStateIntentResponse)initWithCoder:(id)a3
{
  return (SetSubtitleStateIntentResponse *)SetSubtitleStateIntentResponse.init(coder:)(a3);
}

- (SetSubtitleStateIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SetSubtitleStateIntentResponse *)SetSubtitleStateIntentResponse.init(backingStore:)(a3);
}

- (SetSubtitleStateIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SetSubtitleStateIntentResponse *)SetSubtitleStateIntentResponse.init(propertiesByName:)(v3);
}

@end