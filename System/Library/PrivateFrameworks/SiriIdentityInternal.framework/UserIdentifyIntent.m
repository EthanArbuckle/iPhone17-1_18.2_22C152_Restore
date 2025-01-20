@interface UserIdentifyIntent
- (UserIdentifyIntent)init;
- (UserIdentifyIntent)initWithCoder:(id)a3;
- (UserIdentifyIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (UserIdentifyIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation UserIdentifyIntent

- (UserIdentifyIntent)init
{
  return (UserIdentifyIntent *)UserIdentifyIntent.init()();
}

- (UserIdentifyIntent)initWithCoder:(id)a3
{
  return (UserIdentifyIntent *)UserIdentifyIntent.init(coder:)(a3);
}

- (UserIdentifyIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_25C8EC170();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (UserIdentifyIntent *)UserIdentifyIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (UserIdentifyIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_25C8EC110();
  }
  return (UserIdentifyIntent *)UserIdentifyIntent.init(domain:verb:parametersByName:)();
}

@end