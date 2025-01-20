@interface NDOWarrantySubTextCell
+ (int64_t)cellStyle;
- (NDOWarrantySubTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation NDOWarrantySubTextCell

+ (int64_t)cellStyle
{
  return 3;
}

- (NDOWarrantySubTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)NDOWarrantySubTextCell;
  v4 = [(NDOWarrantySubTextCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(NDOWarrantySubTextCell *)v4 textLabel];
    [v6 setNumberOfLines:0];

    v7 = [(NDOWarrantySubTextCell *)v5 detailTextLabel];
    [v7 setNumberOfLines:2];

    v8 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    v9 = [(NDOWarrantySubTextCell *)v5 detailTextLabel];
    [v9 setFont:v8];
  }
  return v5;
}

@end