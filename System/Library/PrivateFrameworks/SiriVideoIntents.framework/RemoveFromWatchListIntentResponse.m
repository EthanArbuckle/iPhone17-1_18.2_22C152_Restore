@interface RemoveFromWatchListIntentResponse
- (RemoveFromWatchListIntentResponse)init;
- (RemoveFromWatchListIntentResponse)initWithBackingStore:(id)a3;
- (RemoveFromWatchListIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (RemoveFromWatchListIntentResponse)initWithCoder:(id)a3;
- (RemoveFromWatchListIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation RemoveFromWatchListIntentResponse

- (int64_t)code
{
  return RemoveFromWatchListIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (RemoveFromWatchListIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (RemoveFromWatchListIntentResponse *)RemoveFromWatchListIntentResponse.init(code:userActivity:)(a3, a4);
}

- (RemoveFromWatchListIntentResponse)init
{
  return (RemoveFromWatchListIntentResponse *)RemoveFromWatchListIntentResponse.init()();
}

- (RemoveFromWatchListIntentResponse)initWithCoder:(id)a3
{
  return (RemoveFromWatchListIntentResponse *)RemoveFromWatchListIntentResponse.init(coder:)(a3);
}

- (RemoveFromWatchListIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (RemoveFromWatchListIntentResponse *)RemoveFromWatchListIntentResponse.init(backingStore:)(a3);
}

- (RemoveFromWatchListIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_22BD4ACF0();
  }
  else {
    uint64_t v3 = 0;
  }
  return (RemoveFromWatchListIntentResponse *)RemoveFromWatchListIntentResponse.init(propertiesByName:)(v3);
}

@end