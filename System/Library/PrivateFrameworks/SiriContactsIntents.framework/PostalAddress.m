@interface PostalAddress
+ (BOOL)supportsSecureCoding;
- (PostalAddress)initWithCoder:(id)a3;
- (PostalAddress)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation PostalAddress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PostalAddress)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  return (PostalAddress *)PostalAddress.init(identifier:display:pronunciationHint:)();
}

- (PostalAddress)initWithCoder:(id)a3
{
  return (PostalAddress *)PostalAddress.init(coder:)(a3);
}

@end