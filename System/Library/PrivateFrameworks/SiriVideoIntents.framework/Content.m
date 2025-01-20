@interface Content
+ (BOOL)supportsSecureCoding;
- (Content)initWithCoder:(id)a3;
- (Content)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation Content

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Content)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_22BD4ADA0();
  }
  sub_22BD4ADA0();
  if (a5) {
    sub_22BD4ADA0();
  }
  return (Content *)Content.init(identifier:display:pronunciationHint:)();
}

- (Content)initWithCoder:(id)a3
{
  return (Content *)Content.init(coder:)(a3);
}

@end