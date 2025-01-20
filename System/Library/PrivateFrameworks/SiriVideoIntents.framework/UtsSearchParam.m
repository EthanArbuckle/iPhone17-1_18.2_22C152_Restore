@interface UtsSearchParam
+ (BOOL)supportsSecureCoding;
- (UtsSearchParam)initWithCoder:(id)a3;
- (UtsSearchParam)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation UtsSearchParam

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UtsSearchParam)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_22BD4ADA0();
  }
  sub_22BD4ADA0();
  if (a5) {
    sub_22BD4ADA0();
  }
  return (UtsSearchParam *)UtsSearchParam.init(identifier:display:pronunciationHint:)();
}

- (UtsSearchParam)initWithCoder:(id)a3
{
  return (UtsSearchParam *)UtsSearchParam.init(coder:)(a3);
}

@end