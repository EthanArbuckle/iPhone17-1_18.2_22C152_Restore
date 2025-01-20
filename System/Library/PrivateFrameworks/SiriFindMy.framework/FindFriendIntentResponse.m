@interface FindFriendIntentResponse
- (FindFriendIntentResponse)init;
- (FindFriendIntentResponse)initWithBackingStore:(id)a3;
- (FindFriendIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4;
- (FindFriendIntentResponse)initWithCoder:(id)a3;
- (FindFriendIntentResponse)initWithPropertiesByName:(id)a3;
- (int64_t)code;
- (void)setCode:(int64_t)a3;
@end

@implementation FindFriendIntentResponse

- (int64_t)code
{
  return FindFriendIntentResponse.code.getter();
}

- (void)setCode:(int64_t)a3
{
}

- (FindFriendIntentResponse)initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v6 = a4;
  return (FindFriendIntentResponse *)FindFriendIntentResponse.init(code:userActivity:)(a3, a4);
}

- (FindFriendIntentResponse)init
{
  return (FindFriendIntentResponse *)FindFriendIntentResponse.init()();
}

- (FindFriendIntentResponse)initWithCoder:(id)a3
{
  return (FindFriendIntentResponse *)FindFriendIntentResponse.init(coder:)(a3);
}

- (FindFriendIntentResponse)initWithBackingStore:(id)a3
{
  id v4 = a3;
  return (FindFriendIntentResponse *)FindFriendIntentResponse.init(backingStore:)(a3);
}

- (FindFriendIntentResponse)initWithPropertiesByName:(id)a3
{
  if (a3) {
    uint64_t v3 = sub_1D463F868();
  }
  else {
    uint64_t v3 = 0;
  }
  return (FindFriendIntentResponse *)FindFriendIntentResponse.init(propertiesByName:)(v3);
}

@end