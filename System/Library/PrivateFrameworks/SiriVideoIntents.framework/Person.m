@interface Person
+ (BOOL)supportsSecureCoding;
- (Person)initWithCoder:(id)a3;
- (Person)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation Person

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Person)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_22BD4ADA0();
  }
  sub_22BD4ADA0();
  if (a5) {
    sub_22BD4ADA0();
  }
  return (Person *)Person.init(identifier:display:pronunciationHint:)();
}

- (Person)initWithCoder:(id)a3
{
  return (Person *)Person.init(coder:)(a3);
}

@end