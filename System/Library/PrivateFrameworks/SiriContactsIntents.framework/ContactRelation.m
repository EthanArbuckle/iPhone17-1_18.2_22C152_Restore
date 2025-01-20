@interface ContactRelation
+ (BOOL)supportsSecureCoding;
- (ContactRelation)initWithCoder:(id)a3;
- (ContactRelation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation ContactRelation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ContactRelation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (ContactRelation *)ContactRelation.init(identifier:display:pronunciationHint:)();
}

- (ContactRelation)initWithCoder:(id)a3
{
  return (ContactRelation *)ContactRelation.init(coder:)(a3);
}

@end