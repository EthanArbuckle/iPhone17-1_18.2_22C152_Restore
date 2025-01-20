@interface SeekTimeIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SeekTimeIntent)init;
- (SeekTimeIntent)initWithCoder:(id)a3;
- (SeekTimeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SeekTimeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SeekTimeIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SeekTimeIntent)init
{
  return (SeekTimeIntent *)SeekTimeIntent.init()();
}

- (SeekTimeIntent)initWithCoder:(id)a3
{
  return (SeekTimeIntent *)SeekTimeIntent.init(coder:)(a3);
}

- (SeekTimeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (SeekTimeIntent *)SeekTimeIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SeekTimeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (SeekTimeIntent *)SeekTimeIntent.init(domain:verb:parametersByName:)();
}

@end