@interface ContentSearch
+ (BOOL)supportsSecureCoding;
- (ContentSearch)initWithCoder:(id)a3;
- (ContentSearch)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation ContentSearch

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ContentSearch)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_22BD4ADA0();
  }
  sub_22BD4ADA0();
  if (a5) {
    sub_22BD4ADA0();
  }
  return (ContentSearch *)ContentSearch.init(identifier:display:pronunciationHint:)();
}

- (ContentSearch)initWithCoder:(id)a3
{
  return (ContentSearch *)ContentSearch.init(coder:)(a3);
}

@end