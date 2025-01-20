@interface SignedDuration
+ (BOOL)supportsSecureCoding;
- (SignedDuration)initWithCoder:(id)a3;
- (SignedDuration)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation SignedDuration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SignedDuration)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_232A68588();
  }
  sub_232A68588();
  if (a5) {
    sub_232A68588();
  }
  return (SignedDuration *)SignedDuration.init(identifier:display:pronunciationHint:)();
}

- (SignedDuration)initWithCoder:(id)a3
{
  return (SignedDuration *)SignedDuration.init(coder:)(a3);
}

@end