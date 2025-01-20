@interface RemoveFromWatchListIntent
- (RemoveFromWatchListIntent)init;
- (RemoveFromWatchListIntent)initWithCoder:(id)a3;
- (RemoveFromWatchListIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (RemoveFromWatchListIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation RemoveFromWatchListIntent

- (RemoveFromWatchListIntent)init
{
  return (RemoveFromWatchListIntent *)RemoveFromWatchListIntent.init()();
}

- (RemoveFromWatchListIntent)initWithCoder:(id)a3
{
  return (RemoveFromWatchListIntent *)RemoveFromWatchListIntent.init(coder:)(a3);
}

- (RemoveFromWatchListIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (RemoveFromWatchListIntent *)RemoveFromWatchListIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (RemoveFromWatchListIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_22BD4ACF0();
  }
  return (RemoveFromWatchListIntent *)RemoveFromWatchListIntent.init(domain:verb:parametersByName:)();
}

@end