@interface GetVolumeLevelIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (GetVolumeLevelIntent)init;
- (GetVolumeLevelIntent)initWithCoder:(id)a3;
- (GetVolumeLevelIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (GetVolumeLevelIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation GetVolumeLevelIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (GetVolumeLevelIntent)init
{
  return (GetVolumeLevelIntent *)GetVolumeLevelIntent.init()();
}

- (GetVolumeLevelIntent)initWithCoder:(id)a3
{
  return (GetVolumeLevelIntent *)GetVolumeLevelIntent.init(coder:)(a3);
}

- (GetVolumeLevelIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (GetVolumeLevelIntent *)GetVolumeLevelIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (GetVolumeLevelIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_232A684F8();
  }
  return (GetVolumeLevelIntent *)GetVolumeLevelIntent.init(domain:verb:parametersByName:)();
}

@end