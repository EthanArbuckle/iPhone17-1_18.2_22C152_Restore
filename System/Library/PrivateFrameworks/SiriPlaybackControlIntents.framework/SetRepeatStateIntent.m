@interface SetRepeatStateIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SetRepeatStateIntent)init;
- (SetRepeatStateIntent)initWithCoder:(id)a3;
- (SetRepeatStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SetRepeatStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SetRepeatStateIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetRepeatStateIntent)init
{
  return (SetRepeatStateIntent *)SetRepeatStateIntent.init()();
}

- (SetRepeatStateIntent)initWithCoder:(id)a3
{
  return (SetRepeatStateIntent *)SetRepeatStateIntent.init(coder:)(a3);
}

- (SetRepeatStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (SetRepeatStateIntent *)SetRepeatStateIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SetRepeatStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (SetRepeatStateIntent *)SetRepeatStateIntent.init(domain:verb:parametersByName:)();
}

@end