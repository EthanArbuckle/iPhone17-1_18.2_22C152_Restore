@interface MoveSpeakerIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (MoveSpeakerIntent)init;
- (MoveSpeakerIntent)initWithCoder:(id)a3;
- (MoveSpeakerIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (MoveSpeakerIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation MoveSpeakerIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (MoveSpeakerIntent)init
{
  return (MoveSpeakerIntent *)MoveSpeakerIntent.init()();
}

- (MoveSpeakerIntent)initWithCoder:(id)a3
{
  return (MoveSpeakerIntent *)MoveSpeakerIntent.init(coder:)(a3);
}

- (MoveSpeakerIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (MoveSpeakerIntent *)MoveSpeakerIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (MoveSpeakerIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (MoveSpeakerIntent *)MoveSpeakerIntent.init(domain:verb:parametersByName:)();
}

@end