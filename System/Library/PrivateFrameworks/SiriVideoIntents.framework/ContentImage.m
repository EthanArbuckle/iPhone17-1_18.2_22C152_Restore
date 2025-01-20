@interface ContentImage
+ (BOOL)supportsSecureCoding;
- (ContentImage)initWithCoder:(id)a3;
- (ContentImage)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation ContentImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ContentImage)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_22BD4ADA0();
  }
  sub_22BD4ADA0();
  if (a5) {
    sub_22BD4ADA0();
  }
  return (ContentImage *)ContentImage.init(identifier:display:pronunciationHint:)();
}

- (ContentImage)initWithCoder:(id)a3
{
  return (ContentImage *)ContentImage.init(coder:)(a3);
}

@end