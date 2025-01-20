@interface VolumeLevel
+ (BOOL)supportsSecureCoding;
- (VolumeLevel)initWithCoder:(id)a3;
- (VolumeLevel)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation VolumeLevel

- (VolumeLevel)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_232A68588();
  }
  sub_232A68588();
  if (a5) {
    sub_232A68588();
  }
  return (VolumeLevel *)VolumeLevel.init(identifier:display:pronunciationHint:)();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VolumeLevel)initWithCoder:(id)a3
{
  return (VolumeLevel *)VolumeLevel.init(coder:)(a3);
}

@end