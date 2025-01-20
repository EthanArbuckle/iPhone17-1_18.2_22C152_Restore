@interface SkipContentIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SkipContentIntent)init;
- (SkipContentIntent)initWithCoder:(id)a3;
- (SkipContentIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SkipContentIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SkipContentIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SkipContentIntent)init
{
  return (SkipContentIntent *)SkipContentIntent.init()();
}

- (SkipContentIntent)initWithCoder:(id)a3
{
  return (SkipContentIntent *)SkipContentIntent.init(coder:)(a3);
}

- (SkipContentIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (SkipContentIntent *)SkipContentIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SkipContentIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (SkipContentIntent *)SkipContentIntent.init(domain:verb:parametersByName:)();
}

@end