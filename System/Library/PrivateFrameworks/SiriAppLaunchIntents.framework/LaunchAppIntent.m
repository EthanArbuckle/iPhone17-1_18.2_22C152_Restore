@interface LaunchAppIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (LaunchAppIntent)init;
- (LaunchAppIntent)initWithCoder:(id)a3;
- (LaunchAppIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (LaunchAppIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation LaunchAppIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (LaunchAppIntent)init
{
  return (LaunchAppIntent *)LaunchAppIntent.init()();
}

- (LaunchAppIntent)initWithCoder:(id)a3
{
  return (LaunchAppIntent *)LaunchAppIntent.init(coder:)(a3);
}

- (LaunchAppIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (LaunchAppIntent *)LaunchAppIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (LaunchAppIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_23785B640();
  }
  return (LaunchAppIntent *)LaunchAppIntent.init(domain:verb:parametersByName:)();
}

@end