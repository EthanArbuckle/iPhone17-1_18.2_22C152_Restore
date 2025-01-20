@interface GetContactIntent
+ (BOOL)shouldSkipDefaultSchemaCheck;
- (GetContactIntent)init;
- (GetContactIntent)initWithCoder:(id)a3;
- (GetContactIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (GetContactIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation GetContactIntent

+ (BOOL)shouldSkipDefaultSchemaCheck
{
  return 1;
}

- (GetContactIntent)init
{
  return (GetContactIntent *)GetContactIntent.init()();
}

- (GetContactIntent)initWithCoder:(id)a3
{
  return (GetContactIntent *)GetContactIntent.init(coder:)(a3);
}

- (GetContactIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
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
  return (GetContactIntent *)GetContactIntent.init(identifier:backingStore:)(v5, v7, a4);
}

- (GetContactIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  if (a5) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (GetContactIntent *)GetContactIntent.init(domain:verb:parametersByName:)();
}

@end