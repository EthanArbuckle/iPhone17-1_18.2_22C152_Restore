@interface WatchSportsEventIntentResponse
- (WatchSportsEventIntentResponse)init;
- (WatchSportsEventIntentResponse)initWithBackingStore:(id)a3;
- (WatchSportsEventIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (WatchSportsEventIntentResponse)initWithCoder:(id)a3;
- (WatchSportsEventIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation WatchSportsEventIntentResponse

- (int64_t)code
{
  return WatchSportsEventIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (WatchSportsEventIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (WatchSportsEventIntentResponse *)WatchSportsEventIntentResponse.init(code:userActivity:)(a3, a4);
}

- (WatchSportsEventIntentResponse)init
{
  return (WatchSportsEventIntentResponse *)WatchSportsEventIntentResponse.init()();
}

- (WatchSportsEventIntentResponse)initWithCoder:(id)a3
{
  return (WatchSportsEventIntentResponse *)WatchSportsEventIntentResponse.init(coder:)(a3);
}

- (WatchSportsEventIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (WatchSportsEventIntentResponse *)WatchSportsEventIntentResponse.init(backingStore:)(a3);
}

- (WatchSportsEventIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_22BD4ACF0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (WatchSportsEventIntentResponse *)WatchSportsEventIntentResponse.init(propertiesByName:)(v3);
}

@end