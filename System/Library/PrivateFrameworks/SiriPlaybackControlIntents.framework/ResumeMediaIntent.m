@interface ResumeMediaIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (ResumeMediaIntent)init;
- (ResumeMediaIntent)initWithCoder:(id)a3;
- (ResumeMediaIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (ResumeMediaIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation ResumeMediaIntent

- (ResumeMediaIntent)init
{
  return (ResumeMediaIntent *)ResumeMediaIntent.init()();
}

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (ResumeMediaIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (ResumeMediaIntent *)ResumeMediaIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (ResumeMediaIntent)initWithCoder:(id)a3
{
  return (ResumeMediaIntent *)ResumeMediaIntent.init(coder:)(a3);
}

- (ResumeMediaIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (ResumeMediaIntent *)ResumeMediaIntent.init(domain:verb:parametersByName:)();
}

@end