@interface GetAmbiguousDistanceIntent
- (GetAmbiguousDistanceIntent)init;
- (GetAmbiguousDistanceIntent)initWithCoder:(id)a3;
- (GetAmbiguousDistanceIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5;
- (GetAmbiguousDistanceIntent)initWithIdentifier:(id)a3 backingStore:(id)a4;
@end

@implementation GetAmbiguousDistanceIntent

- (GetAmbiguousDistanceIntent)init
{
  return (GetAmbiguousDistanceIntent *)GetAmbiguousDistanceIntent.init()();
}

- (GetAmbiguousDistanceIntent)initWithCoder:(id)a3
{
  id v3 = a3;
  return (GetAmbiguousDistanceIntent *)GetAmbiguousDistanceIntent.init(coder:)(a3);
}

- (GetAmbiguousDistanceIntent)initWithIdentifier:(id)a3 backingStore:(id)a4
{
  id v4 = a3;
  id v5 = a4;
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v6;

    uint64_t v10 = v8;
    uint64_t v11 = v9;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  return (GetAmbiguousDistanceIntent *)GetAmbiguousDistanceIntent.init(identifier:backingStore:)(v10, v11, a4);
}

- (GetAmbiguousDistanceIntent)initWithDomain:(id)a3 verb:(id)a4 parametersByName:(id)a5
{
  id v5 = a3;
  id v6 = a4;
  id v7 = a5;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v8;
  uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = v9;
  if (a5)
  {
    uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v11 = (GetAmbiguousDistanceIntent *)GetAmbiguousDistanceIntent.init(domain:verb:parametersByName:)(v16, v17, v19, v20, v13);

  return v11;
}

@end