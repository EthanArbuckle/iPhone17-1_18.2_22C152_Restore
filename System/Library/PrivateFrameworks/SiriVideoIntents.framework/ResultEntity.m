@interface ResultEntity
+ (BOOL)supportsSecureCoding;
- (ResultEntity)initWithCoder:(id)a3;
- (ResultEntity)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation ResultEntity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ResultEntity)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_22BD4ADA0();
  }
  sub_22BD4ADA0();
  if (a5) {
    sub_22BD4ADA0();
  }
  return (ResultEntity *)ResultEntity.init(identifier:display:pronunciationHint:)();
}

- (ResultEntity)initWithCoder:(id)a3
{
  return (ResultEntity *)ResultEntity.init(coder:)(a3);
}

@end