@interface SkipTimeIntentResponse
- (SkipTimeIntentResponse)init;
- (SkipTimeIntentResponse)initWithBackingStore:(id)a3;
- (SkipTimeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SkipTimeIntentResponse)initWithCoder:(id)a3;
- (SkipTimeIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SkipTimeIntentResponse

- (int64_t)code
{
  return sub_232A4B3B4();
}

- (void)setCode:(int64_t)a3
{
}

- (SkipTimeIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SkipTimeIntentResponse *)SkipTimeIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SkipTimeIntentResponse)init
{
  return (SkipTimeIntentResponse *)SkipTimeIntentResponse.init()();
}

- (SkipTimeIntentResponse)initWithCoder:(id)a3
{
  return (SkipTimeIntentResponse *)SkipTimeIntentResponse.init(coder:)(a3);
}

- (SkipTimeIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SkipTimeIntentResponse *)SkipTimeIntentResponse.init(backingStore:)(a3);
}

- (SkipTimeIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SkipTimeIntentResponse *)SkipTimeIntentResponse.init(propertiesByName:)(v3);
}

@end