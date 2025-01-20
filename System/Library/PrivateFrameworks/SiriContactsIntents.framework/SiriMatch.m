@interface SiriMatch
+ (BOOL)supportsSecureCoding;
- (SiriMatch)initWithCoder:(id)a3;
- (SiriMatch)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation SiriMatch

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SiriMatch)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (SiriMatch *)SiriMatch.init(identifier:display:pronunciationHint:)();
}

- (SiriMatch)initWithCoder:(id)a3
{
  return (SiriMatch *)SiriMatch.init(coder:)(a3);
}

@end