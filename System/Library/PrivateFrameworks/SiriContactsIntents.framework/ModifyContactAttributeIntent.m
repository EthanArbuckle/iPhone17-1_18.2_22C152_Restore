@interface ModifyContactAttributeIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (ModifyContactAttributeIntent)init;
- (ModifyContactAttributeIntent)initWithCoder:(id)a3;
- (ModifyContactAttributeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (ModifyContactAttributeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation ModifyContactAttributeIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (ModifyContactAttributeIntent)init
{
  return (ModifyContactAttributeIntent *)ModifyContactAttributeIntent.init()();
}

- (ModifyContactAttributeIntent)initWithCoder:(id)a3
{
  return (ModifyContactAttributeIntent *)ModifyContactAttributeIntent.init(coder:)(a3);
}

- (ModifyContactAttributeIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (ModifyContactAttributeIntent *)ModifyContactAttributeIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (ModifyContactAttributeIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (ModifyContactAttributeIntent *)ModifyContactAttributeIntent.init(domain:verb:parametersByName:)();
}

@end