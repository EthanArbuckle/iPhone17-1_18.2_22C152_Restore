@interface MatchedMedName
+ (BOOL)supportsSecureCoding;
- (MatchedMedName)initWithCoder:(id)a3;
- (MatchedMedName)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation MatchedMedName

+ (BOOL)supportsSecureCoding
{
  return _convertBoolToObjCBool(_:)() & 1;
}

- (MatchedMedName)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  id v5 = a3;
  id v6 = a4;
  id v7 = a5;
  if (a3)
  {
    uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v20 = v8;

    uint64_t v21 = v19;
    uint64_t v22 = v20;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
  }
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v9;
  if (a5)
  {
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v10;

    uint64_t v15 = v13;
    uint64_t v16 = v14;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  v12 = (MatchedMedName *)MatchedMedName.init(identifier:display:pronunciationHint:)(v21, v22, v17, v18, v15, v16);

  return v12;
}

- (MatchedMedName)initWithCoder:(id)a3
{
  id v3 = a3;
  return (MatchedMedName *)MatchedMedName.init(coder:)(a3);
}

@end