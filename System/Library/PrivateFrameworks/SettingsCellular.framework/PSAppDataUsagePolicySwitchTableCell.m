@interface PSAppDataUsagePolicySwitchTableCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSAppDataUsagePolicySwitchTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = [v4 dataUsageString];
  [v4 setProperty:v5 forKey:*MEMORY[0x263F602C8]];

  v6.receiver = self;
  v6.super_class = (Class)PSAppDataUsagePolicySwitchTableCell;
  [(PSSubtitleSwitchTableCell *)&v6 refreshCellContentsWithSpecifier:v4];
}

@end