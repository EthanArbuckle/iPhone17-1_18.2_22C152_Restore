@interface InAppSearchCriteria
+ (BOOL)supportsSecureCoding;
- (InAppSearchCriteria)initWithCoder:(id)a3;
- (InAppSearchCriteria)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation InAppSearchCriteria

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (InAppSearchCriteria)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_23785B6B0();
  }
  sub_23785B6B0();
  if (a5) {
    sub_23785B6B0();
  }
  return (InAppSearchCriteria *)InAppSearchCriteria.init(identifier:display:pronunciationHint:)();
}

- (InAppSearchCriteria)initWithCoder:(id)a3
{
  return (InAppSearchCriteria *)InAppSearchCriteria.init(coder:)(a3);
}

@end