@interface LiveService
+ (BOOL)supportsSecureCoding;
- (LiveService)initWithCoder:(id)a3;
- (LiveService)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation LiveService

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LiveService)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_22BD4ADA0();
  }
  sub_22BD4ADA0();
  if (a5) {
    sub_22BD4ADA0();
  }
  return (LiveService *)LiveService.init(identifier:display:pronunciationHint:)();
}

- (LiveService)initWithCoder:(id)a3
{
  return (LiveService *)LiveService.init(coder:)(a3);
}

@end