@interface DBSContentDisplayModeTableCell
+ (int64_t)cellStyle;
- (DBSContentDisplayModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation DBSContentDisplayModeTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (DBSContentDisplayModeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)DBSContentDisplayModeTableCell;
  v4 = [(DBSContentDisplayModeTableCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F825C8] systemGrayColor];
    v6 = [(DBSContentDisplayModeTableCell *)v4 detailTextLabel];
    [v6 setTextColor:v5];

    v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
    v8 = [(DBSContentDisplayModeTableCell *)v4 detailTextLabel];
    [v8 setFont:v7];

    v9 = [(DBSContentDisplayModeTableCell *)v4 detailTextLabel];
    [v9 setNumberOfLines:0];
  }
  return v4;
}

@end