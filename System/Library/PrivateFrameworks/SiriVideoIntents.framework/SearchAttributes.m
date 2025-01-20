@interface SearchAttributes
+ (BOOL)supportsSecureCoding;
- (SearchAttributes)initWithCoder:(id)a3;
- (SearchAttributes)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation SearchAttributes

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SearchAttributes)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_22BD4ADA0();
  }
  sub_22BD4ADA0();
  if (a5) {
    sub_22BD4ADA0();
  }
  return (SearchAttributes *)SearchAttributes.init(identifier:display:pronunciationHint:)();
}

- (SearchAttributes)initWithCoder:(id)a3
{
  return (SearchAttributes *)SearchAttributes.init(coder:)(a3);
}

@end