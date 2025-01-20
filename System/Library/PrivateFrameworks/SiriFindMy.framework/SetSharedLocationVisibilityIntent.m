@interface SetSharedLocationVisibilityIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SetSharedLocationVisibilityIntent)init;
- (SetSharedLocationVisibilityIntent)initWithCoder:(id)a3;
- (SetSharedLocationVisibilityIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SetSharedLocationVisibilityIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SetSharedLocationVisibilityIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetSharedLocationVisibilityIntent)init
{
  return (SetSharedLocationVisibilityIntent *)SetSharedLocationVisibilityIntent.init()();
}

- (SetSharedLocationVisibilityIntent)initWithCoder:(id)a3
{
  return (SetSharedLocationVisibilityIntent *)SetSharedLocationVisibilityIntent.init(coder:)(a3);
}

- (SetSharedLocationVisibilityIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (SetSharedLocationVisibilityIntent *)SetSharedLocationVisibilityIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SetSharedLocationVisibilityIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_1D463F868();
  }
  return (SetSharedLocationVisibilityIntent *)SetSharedLocationVisibilityIntent.init(domain:verb:parametersByName:)();
}

@end