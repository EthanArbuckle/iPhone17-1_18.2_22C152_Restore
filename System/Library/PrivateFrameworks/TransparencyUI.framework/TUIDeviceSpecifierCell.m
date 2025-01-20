@interface TUIDeviceSpecifierCell
+ (int64_t)cellStyle;
- (id)blankIcon;
- (id)getLazyIcon;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation TUIDeviceSpecifierCell

- (id)blankIcon
{
  if (blankIcon_onceToken != -1) {
    dispatch_once(&blankIcon_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)blankIcon__blankIcon;
  return v2;
}

void __35__TUIDeviceSpecifierCell_blankIcon__block_invoke()
{
  v3.height = 40.0;
  v3.width = 29.0;
  UIGraphicsBeginImageContextWithOptions(v3, 0, 0.0);
  uint64_t v0 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v1 = (void *)blankIcon__blankIcon;
  blankIcon__blankIcon = v0;
}

- (id)getLazyIcon
{
  CGSize v3 = [TUIDeviceImage alloc];
  v7.receiver = self;
  v7.super_class = (Class)TUIDeviceSpecifierCell;
  id v4 = [(PSTableCell *)&v7 getLazyIcon];
  v5 = -[TUIDeviceImage initWithCGImage:](v3, "initWithCGImage:", [v4 CGImage]);

  return v5;
}

+ (int64_t)cellStyle
{
  return 3;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)TUIDeviceSpecifierCell;
  id v4 = a3;
  [(PSTableCell *)&v22 refreshCellContentsWithSpecifier:v4];
  v5 = [(TUIDeviceSpecifierCell *)self textLabel];
  v6 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  [v5 setFont:v6];

  objc_super v7 = [(TUIDeviceSpecifierCell *)self textLabel];
  v8 = [MEMORY[0x263F1C550] labelColor];
  [v7 setTextColor:v8];

  v9 = [(TUIDeviceSpecifierCell *)self textLabel];
  v10 = [v4 propertyForKey:*MEMORY[0x263F602D0]];
  [v9 setText:v10];

  v11 = [(TUIDeviceSpecifierCell *)self textLabel];
  [v11 setLineBreakMode:0];

  v12 = [(TUIDeviceSpecifierCell *)self textLabel];
  [v12 setNumberOfLines:0];

  v13 = [(TUIDeviceSpecifierCell *)self detailTextLabel];
  v14 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
  [v13 setFont:v14];

  v15 = [(TUIDeviceSpecifierCell *)self detailTextLabel];
  v16 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v15 setTextColor:v16];

  v17 = [(TUIDeviceSpecifierCell *)self detailTextLabel];
  v18 = [v4 propertyForKey:*MEMORY[0x263F602C8]];

  [v17 setText:v18];
  v19 = [(TUIDeviceSpecifierCell *)self detailTextLabel];
  [v19 setLineBreakMode:0];

  v20 = [(TUIDeviceSpecifierCell *)self detailTextLabel];
  [v20 setNumberOfLines:0];

  v21 = [(TUIDeviceSpecifierCell *)self imageView];
  [v21 setContentMode:2];

  [(TUIDeviceSpecifierCell *)self setNeedsLayout];
}

@end