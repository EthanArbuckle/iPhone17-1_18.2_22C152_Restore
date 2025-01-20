@interface DeviceQuery
+ (BOOL)supportsSecureCoding;
- (DeviceQuery)initWithCoder:(id)a3;
- (DeviceQuery)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation DeviceQuery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DeviceQuery)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_1D463F8C8();
  }
  sub_1D463F8C8();
  if (a5) {
    sub_1D463F8C8();
  }
  return (DeviceQuery *)DeviceQuery.init(identifier:display:pronunciationHint:)();
}

- (DeviceQuery)initWithCoder:(id)a3
{
  return (DeviceQuery *)DeviceQuery.init(coder:)(a3);
}

@end