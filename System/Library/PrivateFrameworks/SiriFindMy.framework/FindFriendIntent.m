@interface FindFriendIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (FindFriendIntent)init;
- (FindFriendIntent)initWithCoder:(id)a3;
- (FindFriendIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (FindFriendIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation FindFriendIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (FindFriendIntent)init
{
  return (FindFriendIntent *)FindFriendIntent.init()();
}

- (FindFriendIntent)initWithCoder:(id)a3
{
  return (FindFriendIntent *)FindFriendIntent.init(coder:)(a3);
}

- (FindFriendIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1D463F8C8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (FindFriendIntent *)FindFriendIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (FindFriendIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_1D463F868();
  }
  return (FindFriendIntent *)FindFriendIntent.init(domain:verb:parametersByName:)();
}

@end