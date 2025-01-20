@interface DeepLaunchIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (DeepLaunchIntent)init;
- (DeepLaunchIntent)initWithCoder:(id)a3;
- (DeepLaunchIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (DeepLaunchIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation DeepLaunchIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (DeepLaunchIntent)init
{
  return (DeepLaunchIntent *)DeepLaunchIntent.init()();
}

- (DeepLaunchIntent)initWithCoder:(id)a3
{
  return (DeepLaunchIntent *)DeepLaunchIntent.init(coder:)(a3);
}

- (DeepLaunchIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_23785B6B0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (DeepLaunchIntent *)DeepLaunchIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (DeepLaunchIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_23785B640();
  }
  return (DeepLaunchIntent *)DeepLaunchIntent.init(domain:verb:parametersByName:)();
}

@end