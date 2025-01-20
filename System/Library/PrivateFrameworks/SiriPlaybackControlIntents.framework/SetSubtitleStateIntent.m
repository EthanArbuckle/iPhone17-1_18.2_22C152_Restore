@interface SetSubtitleStateIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SetSubtitleStateIntent)init;
- (SetSubtitleStateIntent)initWithCoder:(id)a3;
- (SetSubtitleStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SetSubtitleStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SetSubtitleStateIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetSubtitleStateIntent)init
{
  return (SetSubtitleStateIntent *)SetSubtitleStateIntent.init()();
}

- (SetSubtitleStateIntent)initWithCoder:(id)a3
{
  return (SetSubtitleStateIntent *)SetSubtitleStateIntent.init(coder:)(a3);
}

- (SetSubtitleStateIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (SetSubtitleStateIntent *)SetSubtitleStateIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SetSubtitleStateIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (SetSubtitleStateIntent *)SetSubtitleStateIntent.init(domain:verb:parametersByName:)();
}

@end