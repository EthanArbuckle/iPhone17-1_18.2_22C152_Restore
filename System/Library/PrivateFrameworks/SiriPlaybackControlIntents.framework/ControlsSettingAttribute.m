@interface ControlsSettingAttribute
+ (BOOL)supportsSecureCoding;
- (ControlsSettingAttribute)initWithCoder:(id)a3;
- (ControlsSettingAttribute)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation ControlsSettingAttribute

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ControlsSettingAttribute)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_232A68588();
  }
  sub_232A68588();
  if (a5) {
    sub_232A68588();
  }
  return (ControlsSettingAttribute *)ControlsSettingAttribute.init(identifier:display:pronunciationHint:)();
}

- (ControlsSettingAttribute)initWithCoder:(id)a3
{
  return (ControlsSettingAttribute *)ControlsSettingAttribute.init(coder:)(a3);
}

@end