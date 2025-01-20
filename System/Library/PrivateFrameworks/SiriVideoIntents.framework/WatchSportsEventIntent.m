@interface WatchSportsEventIntent
- (WatchSportsEventIntent)init;
- (WatchSportsEventIntent)initWithCoder:(id)a3;
- (WatchSportsEventIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (WatchSportsEventIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation WatchSportsEventIntent

- (WatchSportsEventIntent)init
{
  return (WatchSportsEventIntent *)WatchSportsEventIntent.init()();
}

- (WatchSportsEventIntent)initWithCoder:(id)a3
{
  return (WatchSportsEventIntent *)WatchSportsEventIntent.init(coder:)(a3);
}

- (WatchSportsEventIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_22BD4ADA0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (WatchSportsEventIntent *)WatchSportsEventIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (WatchSportsEventIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_22BD4ACF0();
  }
  return (WatchSportsEventIntent *)WatchSportsEventIntent.init(domain:verb:parametersByName:)();
}

@end