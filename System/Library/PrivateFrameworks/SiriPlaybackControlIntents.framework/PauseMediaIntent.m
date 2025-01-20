@interface PauseMediaIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (PauseMediaIntent)init;
- (PauseMediaIntent)initWithCoder:(id)a3;
- (PauseMediaIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (PauseMediaIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation PauseMediaIntent

- (PauseMediaIntent)init
{
  return (PauseMediaIntent *)PauseMediaIntent.init()();
}

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (PauseMediaIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (PauseMediaIntent *)PauseMediaIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (PauseMediaIntent)initWithCoder:(id)a3
{
  return (PauseMediaIntent *)PauseMediaIntent.init(coder:)(a3);
}

- (PauseMediaIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (PauseMediaIntent *)PauseMediaIntent.init(domain:verb:parametersByName:)();
}

@end