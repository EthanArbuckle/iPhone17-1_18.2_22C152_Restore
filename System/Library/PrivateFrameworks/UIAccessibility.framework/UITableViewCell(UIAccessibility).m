@interface UITableViewCell(UIAccessibility)
- (uint64_t)accessibilityTableViewCellText;
@end

@implementation UITableViewCell(UIAccessibility)

- (uint64_t)accessibilityTableViewCellText
{
  return 0;
}

@end