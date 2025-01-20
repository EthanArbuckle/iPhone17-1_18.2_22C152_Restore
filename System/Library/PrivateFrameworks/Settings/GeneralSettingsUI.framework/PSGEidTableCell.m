@interface PSGEidTableCell
+ (int64_t)cellStyle;
- (PSGEidTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation PSGEidTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSGEidTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)PSGEidTableCell;
  v4 = [(PSGEidTableCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F5FBC0] appearance];
    v6 = [v5 altTextColor];
    v7 = v6;
    if (!v6)
    {
      v7 = [MEMORY[0x263F825C8] secondaryLabelColor];
    }
    v8 = [(PSGEidTableCell *)v4 detailTextLabel];
    [v8 setTextColor:v7];

    if (!v6) {
    v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
    }
    v10 = [(PSGEidTableCell *)v4 detailTextLabel];
    [v10 setFont:v9];

    v11 = [(PSGEidTableCell *)v4 detailTextLabel];
    [v11 setNumberOfLines:0];
  }
  return v4;
}

@end