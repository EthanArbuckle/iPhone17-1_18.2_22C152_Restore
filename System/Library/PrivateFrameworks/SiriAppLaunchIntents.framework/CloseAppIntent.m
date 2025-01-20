@interface CloseAppIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (CloseAppIntent)init;
- (CloseAppIntent)initWithCoder:(id)a3;
- (CloseAppIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (CloseAppIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation CloseAppIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (CloseAppIntent)init
{
  return (CloseAppIntent *)CloseAppIntent.init()();
}

- (CloseAppIntent)initWithCoder:(id)a3
{
  return (CloseAppIntent *)CloseAppIntent.init(coder:)(a3);
}

- (CloseAppIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (CloseAppIntent *)CloseAppIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (CloseAppIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_23785B640();
  }
  return (CloseAppIntent *)CloseAppIntent.init(domain:verb:parametersByName:)();
}

@end