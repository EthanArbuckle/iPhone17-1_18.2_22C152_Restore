@interface AddSpeakerIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (AddSpeakerIntent)init;
- (AddSpeakerIntent)initWithCoder:(id)a3;
- (AddSpeakerIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (AddSpeakerIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation AddSpeakerIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (AddSpeakerIntent)init
{
  return (AddSpeakerIntent *)AddSpeakerIntent.init()();
}

- (AddSpeakerIntent)initWithCoder:(id)a3
{
  return (AddSpeakerIntent *)AddSpeakerIntent.init(coder:)(a3);
}

- (AddSpeakerIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (AddSpeakerIntent *)AddSpeakerIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (AddSpeakerIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (AddSpeakerIntent *)AddSpeakerIntent.init(domain:verb:parametersByName:)();
}

@end