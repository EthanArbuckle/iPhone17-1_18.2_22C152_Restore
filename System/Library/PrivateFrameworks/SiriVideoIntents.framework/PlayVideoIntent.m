@interface PlayVideoIntent
- (PlayVideoIntent)init;
- (PlayVideoIntent)initWithCoder:(id)a3;
- (PlayVideoIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (PlayVideoIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation PlayVideoIntent

- (PlayVideoIntent)init
{
  return (PlayVideoIntent *)PlayVideoIntent.init()();
}

- (PlayVideoIntent)initWithCoder:(id)a3
{
  return (PlayVideoIntent *)PlayVideoIntent.init(coder:)(a3);
}

- (PlayVideoIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (PlayVideoIntent *)PlayVideoIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (PlayVideoIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_22BD4ACF0();
  }
  return (PlayVideoIntent *)PlayVideoIntent.init(domain:verb:parametersByName:)();
}

@end