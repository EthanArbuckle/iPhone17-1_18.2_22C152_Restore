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
    sub_232A68588();
  }
  sub_232A68588();
  if (a5) {
    sub_232A68588();
  }
  return (DeviceQuery *)DeviceQuery.init(identifier:display:pronunciationHint:)();
}

- (DeviceQuery)initWithCoder:(id)a3
{
  return (DeviceQuery *)DeviceQuery.init(coder:)(a3);
}

@end