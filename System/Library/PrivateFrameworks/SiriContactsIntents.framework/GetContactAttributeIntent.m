@interface GetContactAttributeIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (GetContactAttributeIntent)init;
- (GetContactAttributeIntent)initWithCoder:(id)a3;
- (GetContactAttributeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (GetContactAttributeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation GetContactAttributeIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (GetContactAttributeIntent)init
{
  return (GetContactAttributeIntent *)GetContactAttributeIntent.init()();
}

- (GetContactAttributeIntent)initWithCoder:(id)a3
{
  return (GetContactAttributeIntent *)GetContactAttributeIntent.init(coder:)(a3);
}

- (GetContactAttributeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (GetContactAttributeIntent *)GetContactAttributeIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (GetContactAttributeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (GetContactAttributeIntent *)GetContactAttributeIntent.init(domain:verb:parametersByName:)();
}

@end