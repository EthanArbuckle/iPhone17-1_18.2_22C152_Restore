@interface AddToWatchListIntent
- (AddToWatchListIntent)init;
- (AddToWatchListIntent)initWithCoder:(id)a3;
- (AddToWatchListIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (AddToWatchListIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation AddToWatchListIntent

- (AddToWatchListIntent)init
{
  return (AddToWatchListIntent *)AddToWatchListIntent.init()();
}

- (AddToWatchListIntent)initWithCoder:(id)a3
{
  return (AddToWatchListIntent *)AddToWatchListIntent.init(coder:)(a3);
}

- (AddToWatchListIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (AddToWatchListIntent *)AddToWatchListIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (AddToWatchListIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_22BD4ACF0();
  }
  return (AddToWatchListIntent *)AddToWatchListIntent.init(domain:verb:parametersByName:)();
}

@end