@interface SetGeoFenceIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (SetGeoFenceIntent)init;
- (SetGeoFenceIntent)initWithCoder:(id)a3;
- (SetGeoFenceIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (SetGeoFenceIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation SetGeoFenceIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (SetGeoFenceIntent)init
{
  return (SetGeoFenceIntent *)SetGeoFenceIntent.init()();
}

- (SetGeoFenceIntent)initWithCoder:(id)a3
{
  return (SetGeoFenceIntent *)SetGeoFenceIntent.init(coder:)(a3);
}

- (SetGeoFenceIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1D463F8C8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SetGeoFenceIntent *)SetGeoFenceIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (SetGeoFenceIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    sub_1D463F868();
  }
  return (SetGeoFenceIntent *)SetGeoFenceIntent.init(domain:verb:parametersByName:)();
}

@end