@interface TranslatePhraseIntent
- (BOOL)supportsBSXPCSecureCoding;
- (TranslatePhraseIntent)init;
- (TranslatePhraseIntent)initWithCoder:(id)a3;
- (TranslatePhraseIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (TranslatePhraseIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation TranslatePhraseIntent

- (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (TranslatePhraseIntent)init
{
  return (TranslatePhraseIntent *)TranslatePhraseIntent.init()();
}

- (TranslatePhraseIntent)initWithCoder:(id)a3
{
  return (TranslatePhraseIntent *)TranslatePhraseIntent.init(coder:)(a3);
}

- (TranslatePhraseIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_236FB2930();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (TranslatePhraseIntent *)TranslatePhraseIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (TranslatePhraseIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_236FB28E0();
  }
  return (TranslatePhraseIntent *)TranslatePhraseIntent.init(domain:verb:parametersByName:)();
}

@end