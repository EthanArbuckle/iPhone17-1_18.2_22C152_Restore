@interface SetAudioLanguageIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SetAudioLanguageIntent)init;
- (SetAudioLanguageIntent)initWithCoder:(id)a3;
- (SetAudioLanguageIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SetAudioLanguageIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SetAudioLanguageIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetAudioLanguageIntent)init
{
  return (SetAudioLanguageIntent *)SetAudioLanguageIntent.init()();
}

- (SetAudioLanguageIntent)initWithCoder:(id)a3
{
  return (SetAudioLanguageIntent *)SetAudioLanguageIntent.init(coder:)(a3);
}

- (SetAudioLanguageIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_232A68588();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SetAudioLanguageIntent *)SetAudioLanguageIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SetAudioLanguageIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (SetAudioLanguageIntent *)SetAudioLanguageIntent.init(domain:verb:parametersByName:)();
}

@end