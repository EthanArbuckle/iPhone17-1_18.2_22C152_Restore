@interface SetRoomDimmingStateIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SetRoomDimmingStateIntent)init;
- (SetRoomDimmingStateIntent)initWithCoder:(id)a3;
- (SetRoomDimmingStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SetRoomDimmingStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SetRoomDimmingStateIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetRoomDimmingStateIntent)init
{
  return (SetRoomDimmingStateIntent *)SetRoomDimmingStateIntent.init()();
}

- (SetRoomDimmingStateIntent)initWithCoder:(id)a3
{
  return (SetRoomDimmingStateIntent *)SetRoomDimmingStateIntent.init(coder:)(a3);
}

- (SetRoomDimmingStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_232A68588();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SetRoomDimmingStateIntent *)SetRoomDimmingStateIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SetRoomDimmingStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (SetRoomDimmingStateIntent *)SetRoomDimmingStateIntent.init(domain:verb:parametersByName:)();
}

@end