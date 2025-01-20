@interface INFriendLocation
+ (BOOL)supportsSecureCoding;
- (INFriendLocation)initWithCoder:(id)a3;
- (INFriendLocation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation INFriendLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INFriendLocation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_1D463F8C8();
  }
  sub_1D463F8C8();
  if (a5) {
    sub_1D463F8C8();
  }
  return (INFriendLocation *)INFriendLocation.init(identifier:display:pronunciationHint:)();
}

- (INFriendLocation)initWithCoder:(id)a3
{
  return (INFriendLocation *)INFriendLocation.init(coder:)(a3);
}

@end