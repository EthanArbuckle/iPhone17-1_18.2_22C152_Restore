@interface SetShuffleStateIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SetShuffleStateIntent)init;
- (SetShuffleStateIntent)initWithCoder:(id)a3;
- (SetShuffleStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SetShuffleStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SetShuffleStateIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetShuffleStateIntent)init
{
  return (SetShuffleStateIntent *)SetShuffleStateIntent.init()();
}

- (SetShuffleStateIntent)initWithCoder:(id)a3
{
  return (SetShuffleStateIntent *)SetShuffleStateIntent.init(coder:)(a3);
}

- (SetShuffleStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (SetShuffleStateIntent *)SetShuffleStateIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SetShuffleStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (SetShuffleStateIntent *)SetShuffleStateIntent.init(domain:verb:parametersByName:)();
}

@end