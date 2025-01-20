@interface Device
+ (BOOL)supportsSecureCoding;
- (Device)initWithCoder:(id)a3;
- (Device)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
- (NSString)description;
@end

@implementation Device

- (Device)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_232A68588();
  }
  sub_232A68588();
  if (a5) {
    sub_232A68588();
  }
  return (Device *)Device.init(identifier:display:pronunciationHint:)();
}

- (NSString)description
{
  v2 = self;
  Device.description.getter();

  v3 = (void *)sub_232A68558();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Device)initWithCoder:(id)a3
{
  return (Device *)Device.init(coder:)(a3);
}

@end