@interface TranslationResultItem
+ (BOOL)supportsSecureCoding;
- (TranslationResultItem)initWithCoder:(id)a3;
- (TranslationResultItem)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5;
@end

@implementation TranslationResultItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TranslationResultItem)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  if (a3) {
    sub_236FB2930();
  }
  sub_236FB2930();
  if (a5) {
    sub_236FB2930();
  }
  return (TranslationResultItem *)TranslationResultItem.init(identifier:display:pronunciationHint:)();
}

- (TranslationResultItem)initWithCoder:(id)a3
{
  return (TranslationResultItem *)TranslationResultItem.init(coder:)(a3);
}

@end