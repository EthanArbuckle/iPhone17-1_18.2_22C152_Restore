@interface PlayLiveServiceIntent
- (PlayLiveServiceIntent)init;
- (PlayLiveServiceIntent)initWithCoder:(id)a3;
- (PlayLiveServiceIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (PlayLiveServiceIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation PlayLiveServiceIntent

- (PlayLiveServiceIntent)init
{
  return (PlayLiveServiceIntent *)PlayLiveServiceIntent.init()();
}

- (PlayLiveServiceIntent)initWithCoder:(id)a3
{
  return (PlayLiveServiceIntent *)PlayLiveServiceIntent.init(coder:)(a3);
}

- (PlayLiveServiceIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (PlayLiveServiceIntent *)PlayLiveServiceIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (PlayLiveServiceIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_22BD4ACF0();
  }
  return (PlayLiveServiceIntent *)PlayLiveServiceIntent.init(domain:verb:parametersByName:)();
}

@end