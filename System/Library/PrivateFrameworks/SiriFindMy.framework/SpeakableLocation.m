@interface SpeakableLocation
+ (BOOL)supportsSecureCoding;
- (SpeakableLocation)initWithCoder:(id)a3;
- (SpeakableLocation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation SpeakableLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SpeakableLocation)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_1D463F8C8();
  }
  sub_1D463F8C8();
  if (a5) {
    sub_1D463F8C8();
  }
  return (SpeakableLocation *)SpeakableLocation.init(identifier:display:pronunciationHint:)();
}

- (SpeakableLocation)initWithCoder:(id)a3
{
  return (SpeakableLocation *)SpeakableLocation.init(coder:)(a3);
}

@end