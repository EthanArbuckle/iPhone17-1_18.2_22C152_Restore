@interface Account
+ (BOOL)supportsSecureCoding;
- (Account)initWithCoder:(id)a3;
- (Account)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation Account

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Account)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_25C8EC170();
  }
  sub_25C8EC170();
  if (a5) {
    sub_25C8EC170();
  }
  return (Account *)Account.init(identifier:display:pronunciationHint:)();
}

- (Account)initWithCoder:(id)a3
{
  return (Account *)Account.init(coder:)(a3);
}

@end