@interface AddToWatchListIntentResponse
- (AddToWatchListIntentResponse)init;
- (AddToWatchListIntentResponse)initWithBackingStore:(id)a3;
- (AddToWatchListIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (AddToWatchListIntentResponse)initWithCoder:(id)a3;
- (AddToWatchListIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation AddToWatchListIntentResponse

- (int64_t)code
{
  return AddToWatchListIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (AddToWatchListIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (AddToWatchListIntentResponse *)AddToWatchListIntentResponse.init(code:userActivity:)(a3, a4);
}

- (AddToWatchListIntentResponse)init
{
  return (AddToWatchListIntentResponse *)AddToWatchListIntentResponse.init()();
}

- (AddToWatchListIntentResponse)initWithCoder:(id)a3
{
  return (AddToWatchListIntentResponse *)AddToWatchListIntentResponse.init(coder:)(a3);
}

- (AddToWatchListIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (AddToWatchListIntentResponse *)AddToWatchListIntentResponse.init(backingStore:)(a3);
}

- (AddToWatchListIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_22BD4ACF0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (AddToWatchListIntentResponse *)AddToWatchListIntentResponse.init(propertiesByName:)(v3);
}

@end