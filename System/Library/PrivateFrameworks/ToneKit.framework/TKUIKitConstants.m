@interface TKUIKitConstants
+ (UIColor)defaultTableViewCellTextColor;
+ (UIColor)groupedTableCellBackgroundColor;
+ (UIColor)groupedTableHeaderFooterTextColor;
+ (int64_t)defaultStyleForTableViewCellsWithDetailText;
@end

@implementation TKUIKitConstants

+ (int64_t)defaultStyleForTableViewCellsWithDetailText
{
  return 1;
}

+ (UIColor)defaultTableViewCellTextColor
{
  return (UIColor *)[MEMORY[0x263F1C550] _labelColor];
}

+ (UIColor)groupedTableCellBackgroundColor
{
  return (UIColor *)[MEMORY[0x263F1C550] tableCellGroupedBackgroundColor];
}

+ (UIColor)groupedTableHeaderFooterTextColor
{
  if (objc_opt_respondsToSelector()) {
    [MEMORY[0x263F1C550] _groupTableHeaderFooterTextColor];
  }
  else {
  v2 = [MEMORY[0x263F1C550] colorWithRed:0.42745098 green:0.42745098 blue:0.447058824 alpha:1.0];
  }

  return (UIColor *)v2;
}

@end