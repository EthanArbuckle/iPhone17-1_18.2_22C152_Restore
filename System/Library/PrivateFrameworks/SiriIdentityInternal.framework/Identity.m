@interface Identity
+ (BOOL)supportsSecureCoding;
- (Identity)initWithCoder:(id)a3;
- (Identity)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation Identity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Identity)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_25C8EC170();
  }
  sub_25C8EC170();
  if (a5) {
    sub_25C8EC170();
  }
  return (Identity *)Identity.init(identifier:display:pronunciationHint:)();
}

- (Identity)initWithCoder:(id)a3
{
  return (Identity *)Identity.init(coder:)(a3);
}

@end