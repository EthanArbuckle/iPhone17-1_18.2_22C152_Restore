@interface PSSubtitleSwitchTableCell
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSSubtitleSwitchTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (BOOL)canReload
{
  return 1;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PSSubtitleSwitchTableCell;
  id v4 = a3;
  [(PSSwitchTableCell *)&v11 refreshCellContentsWithSpecifier:v4];
  v5 = [(PSSubtitleSwitchTableCell *)self textLabel];
  v6 = [v4 name];
  [v5 setText:v6];

  v7 = [(PSSubtitleSwitchTableCell *)self detailTextLabel];
  v8 = [v4 propertyForKey:@"cellSubtitleText"];
  [v7 setText:v8];

  v9 = [v4 propertyForKey:@"cellSubtitleColor"];

  if (v9)
  {
    v10 = [(PSSubtitleSwitchTableCell *)self detailTextLabel];
    [v10 setTextColor:v9];
  }
  [(PSSubtitleSwitchTableCell *)self setNeedsLayout];
}

@end