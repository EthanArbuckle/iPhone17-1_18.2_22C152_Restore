@interface PSGMatterServiceCell
+ (int64_t)cellStyle;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSGMatterServiceCell

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSGMatterServiceCell;
  [(PSTableCell *)&v6 refreshCellContentsWithSpecifier:a3];
  v4 = [(PSTableCell *)self titleLabel];
  [v4 setNumberOfLines:0];

  v5 = [(PSGMatterServiceCell *)self detailTextLabel];
  [v5 setNumberOfLines:0];
}

@end