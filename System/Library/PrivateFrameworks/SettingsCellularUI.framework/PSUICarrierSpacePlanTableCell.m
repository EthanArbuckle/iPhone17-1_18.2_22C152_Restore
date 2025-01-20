@interface PSUICarrierSpacePlanTableCell
+ (id)checkIcon;
+ (id)spacerIcon;
- (BOOL)canBeChecked;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PSUICarrierSpacePlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)accessoryText;
- (id)detailText;
- (id)primaryText;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setChecked:(BOOL)a3;
@end

@implementation PSUICarrierSpacePlanTableCell

+ (id)checkIcon
{
  v2 = (void *)checkIcon_check;
  if (!checkIcon_check)
  {
    v3 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:*MEMORY[0x263F83570]];
    v4 = [v3 fontDescriptorWithSymbolicTraits:2];

    v5 = [MEMORY[0x263F81708] fontWithDescriptor:v4 size:0.0];
    v6 = [MEMORY[0x263F82818] configurationWithFont:v5 scale:2];
    uint64_t v7 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark" withConfiguration:v6];
    v8 = (void *)checkIcon_check;
    checkIcon_check = v7;

    v2 = (void *)checkIcon_check;
  }
  return v2;
}

+ (id)spacerIcon
{
  v3 = (void *)spacerIcon_spacer;
  if (!spacerIcon_spacer)
  {
    v4 = [a1 checkIcon];
    v5 = v4;
    if (v4)
    {
      [v4 size];
      UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
      uint64_t v6 = UIGraphicsGetImageFromCurrentImageContext();
      uint64_t v7 = (void *)spacerIcon_spacer;
      spacerIcon_spacer = v6;

      UIGraphicsEndImageContext();
    }

    v3 = (void *)spacerIcon_spacer;
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSUICarrierSpacePlanTableCell;
  -[PSUICarrierSpacePlanTableCell sizeThatFits:](&v6, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4 + -12.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (PSUICarrierSpacePlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)PSUICarrierSpacePlanTableCell;
  return [(PSTableCell *)&v6 initWithStyle:3 reuseIdentifier:a4 specifier:a5];
}

- (BOOL)canBeChecked
{
  v2 = [(PSTableCell *)self specifier];
  double v3 = [v2 propertyForKey:@"PSUICellularCellCanBeChecked"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (id)primaryText
{
  v2 = [(PSTableCell *)self specifier];
  double v3 = [v2 propertyForKey:@"PSUICellularCellPrimaryText"];

  return v3;
}

- (id)detailText
{
  v2 = [(PSTableCell *)self specifier];
  double v3 = [v2 propertyForKey:@"PSUICellularCellDetailText"];

  return v3;
}

- (id)accessoryText
{
  return 0;
}

- (void)setChecked:(BOOL)a3
{
  uint64_t v3 = (int)*MEMORY[0x263F5FE50];
  if (*((unsigned char *)&self->super.super.super.super.super.isa + v3) != a3)
  {
    BOOL v4 = a3;
    objc_super v6 = [(PSTableCell *)self specifier];
    uint64_t v7 = [NSNumber numberWithBool:v4];
    [v6 setProperty:v7 forKey:@"PSUICellularCellIsChecked"];

    *((unsigned char *)&self->super.super.super.super.super.isa + v3) = v4;
    v8 = objc_opt_class();
    if (v4) {
      [v8 checkIcon];
    }
    else {
    v9 = [v8 spacerIcon];
    }
    [(PSTableCell *)self setIcon:v9];

    [(PSUICarrierSpacePlanTableCell *)self setNeedsLayout];
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PSUICarrierSpacePlanTableCell;
  [(PSTableCell *)&v18 refreshCellContentsWithSpecifier:a3];
  BOOL v4 = [(PSTableCell *)self specifier];
  double v5 = [v4 propertyForKey:@"PSUICellularCellIsChecked"];

  if (v5 && [v5 BOOLValue])
  {
    objc_super v6 = [(id)objc_opt_class() checkIcon];
    uint64_t v7 = 1;
  }
  else
  {
    objc_super v6 = [(id)objc_opt_class() spacerIcon];
    uint64_t v7 = 0;
  }
  [(PSTableCell *)self setIcon:v6];

  [(PSUICarrierSpacePlanTableCell *)self setChecked:v7];
  v8 = [(PSUICarrierSpacePlanTableCell *)self primaryText];
  v9 = [(PSUICarrierSpacePlanTableCell *)self textLabel];
  [v9 setText:v8];

  CGSize v10 = [(PSUICarrierSpacePlanTableCell *)self detailText];
  v11 = [(PSUICarrierSpacePlanTableCell *)self detailTextLabel];
  [v11 setText:v10];

  BOOL v12 = [(PSUICarrierSpacePlanTableCell *)self canBeChecked];
  v13 = [(PSTableCell *)self titleLabel];
  [v13 setEnabled:v12];

  v14 = [(PSUICarrierSpacePlanTableCell *)self detailTextLabel];
  [v14 setEnabled:v12];

  v15 = [(PSUICarrierSpacePlanTableCell *)self accessoryText];
  if ([v15 length])
  {
    id v16 = objc_alloc(MEMORY[0x263F828E0]);
    v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v17 setText:v15];
    [v17 sizeToFit];
    [(PSUICarrierSpacePlanTableCell *)self setAccessoryView:v17];
  }
}

@end