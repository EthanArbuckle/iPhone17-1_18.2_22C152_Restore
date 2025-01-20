@interface PSAccountsClientListCell
+ (int64_t)cellStyle;
- (BOOL)canReload;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSAccountsClientListCell

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
  v11.super_class = (Class)PSAccountsClientListCell;
  id v4 = a3;
  [(PSTableCell *)&v11 refreshCellContentsWithSpecifier:v4];
  v5 = [(PSAccountsClientListCell *)self textLabel];
  v6 = [v4 name];
  [v5 setText:v6];

  v7 = [(PSAccountsClientListCell *)self detailTextLabel];
  v8 = [v4 propertyForKey:@"cellSubtitleText"];

  [v7 setText:v8];
  v9 = [(PSAccountsClientListCell *)self detailTextLabel];
  v10 = [MEMORY[0x1E4F428B8] grayColor];
  [v9 setTextColor:v10];

  [(PSAccountsClientListCell *)self setNeedsLayout];
}

@end