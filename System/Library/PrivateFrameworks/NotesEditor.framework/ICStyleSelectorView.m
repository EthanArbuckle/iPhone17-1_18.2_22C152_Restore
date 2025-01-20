@interface ICStyleSelectorView
- (CGSize)intrinsicContentSize;
- (id)accessibilityLabel;
- (int64_t)accessibilityContainerType;
@end

@implementation ICStyleSelectorView

- (CGSize)intrinsicContentSize
{
  double v2 = 380.0;
  double v3 = 256.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (id)accessibilityLabel
{
  double v2 = [MEMORY[0x263F086E0] mainBundle];
  double v3 = [v2 localizedStringForKey:@"Format Menu" value:&stru_26C10E100 table:0];

  return v3;
}

@end