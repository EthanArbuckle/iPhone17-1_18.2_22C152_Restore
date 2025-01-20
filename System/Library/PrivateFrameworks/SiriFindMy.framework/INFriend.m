@interface INFriend
+ (BOOL)supportsSecureCoding;
- (INFriend)initWithCoder:(id)a3;
- (INFriend)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation INFriend

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INFriend)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_1D463F8C8();
  }
  sub_1D463F8C8();
  if (a5) {
    sub_1D463F8C8();
  }
  return (INFriend *)INFriend.init(identifier:display:pronunciationHint:)();
}

- (INFriend)initWithCoder:(id)a3
{
  return (INFriend *)INFriend.init(coder:)(a3);
}

@end