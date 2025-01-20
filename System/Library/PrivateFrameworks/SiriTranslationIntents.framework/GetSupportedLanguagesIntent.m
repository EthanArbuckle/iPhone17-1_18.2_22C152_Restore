@interface GetSupportedLanguagesIntent
- (GetSupportedLanguagesIntent)init;
- (GetSupportedLanguagesIntent)initWithCoder:(id)a3;
- (GetSupportedLanguagesIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (GetSupportedLanguagesIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation GetSupportedLanguagesIntent

- (GetSupportedLanguagesIntent)init
{
  return (GetSupportedLanguagesIntent *)GetSupportedLanguagesIntent.init()();
}

- (GetSupportedLanguagesIntent)initWithCoder:(id)a3
{
  return (GetSupportedLanguagesIntent *)GetSupportedLanguagesIntent.init(coder:)(a3);
}

- (GetSupportedLanguagesIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (GetSupportedLanguagesIntent *)GetSupportedLanguagesIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (GetSupportedLanguagesIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_236FB28E0();
  }
  return (GetSupportedLanguagesIntent *)GetSupportedLanguagesIntent.init(domain:verb:parametersByName:)();
}

@end