@interface ContactAttribute
+ (BOOL)supportsSecureCoding;
- (ContactAttribute)initWithCoder:(id)a3;
- (ContactAttribute)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation ContactAttribute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ContactAttribute)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (ContactAttribute *)ContactAttribute.init(identifier:display:pronunciationHint:)();
}

- (ContactAttribute)initWithCoder:(id)a3
{
  return (ContactAttribute *)ContactAttribute.init(coder:)(a3);
}

@end