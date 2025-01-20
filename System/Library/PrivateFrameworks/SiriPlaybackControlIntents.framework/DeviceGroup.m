@interface DeviceGroup
+ (BOOL)supportsSecureCoding;
- (DeviceGroup)initWithCoder:(id)a3;
- (DeviceGroup)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
- (NSString)description;
@end

@implementation DeviceGroup

- (NSString)description
{
  v2 = self;
  DeviceGroup.description.getter();

  v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DeviceGroup)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_232A68588();
  }
  sub_232A68588();
  if (a5) {
    sub_232A68588();
  }
  return (DeviceGroup *)DeviceGroup.init(identifier:display:pronunciationHint:)();
}

- (DeviceGroup)initWithCoder:(id)a3
{
  return (DeviceGroup *)DeviceGroup.init(coder:)(a3);
}

@end