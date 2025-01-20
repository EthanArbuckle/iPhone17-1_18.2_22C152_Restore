@interface AgeDateTime
+ (BOOL)supportsSecureCoding;
- (AgeDateTime)initWithCoder:(id)a3;
- (AgeDateTime)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation AgeDateTime

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AgeDateTime)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (AgeDateTime *)AgeDateTime.init(identifier:display:pronunciationHint:)();
}

- (AgeDateTime)initWithCoder:(id)a3
{
  return (AgeDateTime *)AgeDateTime.init(coder:)(a3);
}

@end