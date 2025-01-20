@interface SkipTimeIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SkipTimeIntent)init;
- (SkipTimeIntent)initWithCoder:(id)a3;
- (SkipTimeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SkipTimeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SkipTimeIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SkipTimeIntent)init
{
  return (SkipTimeIntent *)SkipTimeIntent.init()();
}

- (SkipTimeIntent)initWithCoder:(id)a3
{
  return (SkipTimeIntent *)SkipTimeIntent.init(coder:)(a3);
}

- (SkipTimeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (SkipTimeIntent *)SkipTimeIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SkipTimeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (SkipTimeIntent *)SkipTimeIntent.init(domain:verb:parametersByName:)();
}

@end