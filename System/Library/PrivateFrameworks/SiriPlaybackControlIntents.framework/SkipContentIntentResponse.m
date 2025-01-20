@interface SkipContentIntentResponse
- (SkipContentIntentResponse)init;
- (SkipContentIntentResponse)initWithBackingStore:(id)a3;
- (SkipContentIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (SkipContentIntentResponse)initWithCoder:(id)a3;
- (SkipContentIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation SkipContentIntentResponse

- (int64_t)code
{
  return sub_232A4C458();
}

- (void)setCode:(int64_t)a3
{
}

- (SkipContentIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (SkipContentIntentResponse *)SkipContentIntentResponse.init(code:userActivity:)(a3, a4);
}

- (SkipContentIntentResponse)init
{
  return (SkipContentIntentResponse *)SkipContentIntentResponse.init()();
}

- (SkipContentIntentResponse)initWithCoder:(id)a3
{
  return (SkipContentIntentResponse *)SkipContentIntentResponse.init(coder:)(a3);
}

- (SkipContentIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (SkipContentIntentResponse *)SkipContentIntentResponse.init(backingStore:)(a3);
}

- (SkipContentIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_232A684F8();
  }
  else {
    uint64_t v3 = 0;
  }
  return (SkipContentIntentResponse *)SkipContentIntentResponse.init(propertiesByName:)(v3);
}

@end