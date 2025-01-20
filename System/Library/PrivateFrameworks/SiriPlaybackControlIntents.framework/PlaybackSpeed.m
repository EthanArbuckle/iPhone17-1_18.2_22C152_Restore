@interface PlaybackSpeed
+ (BOOL)supportsSecureCoding;
- (PlaybackSpeed)initWithCoder:(id)a3;
- (PlaybackSpeed)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation PlaybackSpeed

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PlaybackSpeed)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_232A68588();
  }
  sub_232A68588();
  if (a5) {
    sub_232A68588();
  }
  return (PlaybackSpeed *)PlaybackSpeed.init(identifier:display:pronunciationHint:)();
}

- (PlaybackSpeed)initWithCoder:(id)a3
{
  return (PlaybackSpeed *)PlaybackSpeed.init(coder:)(a3);
}

@end