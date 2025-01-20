@interface SwitchProfileIntent
- (SwitchProfileIntent)init;
- (SwitchProfileIntent)initWithCoder:(id)a3;
- (SwitchProfileIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SwitchProfileIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SwitchProfileIntent

- (SwitchProfileIntent)init
{
  return (SwitchProfileIntent *)SwitchProfileIntent.init()();
}

- (SwitchProfileIntent)initWithCoder:(id)a3
{
  return (SwitchProfileIntent *)SwitchProfileIntent.init(coder:)(a3);
}

- (SwitchProfileIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (SwitchProfileIntent *)SwitchProfileIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SwitchProfileIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_25C8EC110();
  }
  return (SwitchProfileIntent *)SwitchProfileIntent.init(domain:verb:parametersByName:)();
}

@end