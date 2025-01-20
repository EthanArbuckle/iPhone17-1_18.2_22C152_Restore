@interface PSUICellularDataUsageSortOptionsHeaderTableViewCell
- (PSUICellularDataUsageSortOptionsHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)changeSortTapped:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSUICellularDataUsageSortOptionsHeaderTableViewCell

- (PSUICellularDataUsageSortOptionsHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PSUICellularDataUsageSortOptionsHeaderTableViewCell;
  v9 = [(PSTableCell *)&v29 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  if (v9)
  {
    uint64_t v10 = *MEMORY[0x263F835B8];
    v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    v12 = [(PSTableCell *)v9 titleLabel];
    [v12 setFont:v11];

    v13 = [MEMORY[0x263F825C8] systemBlueColor];
    v14 = [(PSTableCell *)v9 valueLabel];
    [v14 setTextColor:v13];

    v15 = [MEMORY[0x263F81708] preferredFontForTextStyle:v10];
    v16 = [(PSTableCell *)v9 valueLabel];
    [v16 setFont:v15];

    v17 = [(PSTableCell *)v9 valueLabel];
    [v17 setUserInteractionEnabled:1];

    v18 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v9 action:sel_changeSortTapped_];
    [v18 setNumberOfTapsRequired:1];
    v19 = [(PSTableCell *)v9 valueLabel];
    [v19 addGestureRecognizer:v18];

    v20 = [(PSTableCell *)v9 valueLabel];
    [v20 setNumberOfLines:0];

    v21 = [(PSTableCell *)v9 valueLabel];
    LODWORD(v22) = 1144750080;
    [v21 setContentCompressionResistancePriority:0 forAxis:v22];

    v23 = [(PSTableCell *)v9 valueLabel];
    v24 = [v23 widthAnchor];
    v25 = [(PSUICellularDataUsageSortOptionsHeaderTableViewCell *)v9 contentView];
    v26 = [v25 widthAnchor];
    v27 = [v24 constraintEqualToAnchor:v26 multiplier:0.4];
    [v27 setActive:1];

    [(PSUICellularDataUsageSortOptionsHeaderTableViewCell *)v9 refreshCellContentsWithSpecifier:v8];
  }

  return v9;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v19.receiver = self;
  v19.super_class = (Class)PSUICellularDataUsageSortOptionsHeaderTableViewCell;
  [(PSTableCell *)&v19 refreshCellContentsWithSpecifier:a3];
  v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v5 = [v4 BOOLForKey:0x26D414C60];

  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = v6;
  if (v5)
  {
    id v8 = [v6 localizedStringForKey:@"APPS_BY_NAME" value:&stru_26D410CA0 table:@"Cellular"];
    v9 = [(PSTableCell *)self titleLabel];
    [v9 setText:v8];

    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = v10;
    v12 = @"SORT_BY_USAGE";
  }
  else
  {
    v13 = [v6 localizedStringForKey:@"APPS_BY_USAGE" value:&stru_26D410CA0 table:@"Cellular"];
    v14 = [(PSTableCell *)self titleLabel];
    [v14 setText:v13];

    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = v10;
    v12 = @"SORT_BY_NAME";
  }
  v15 = [v10 localizedStringForKey:v12 value:&stru_26D410CA0 table:@"Cellular"];
  v16 = [(PSTableCell *)self valueLabel];
  [v16 setText:v15];

  v17 = [MEMORY[0x263F825C8] systemBlueColor];
  v18 = [(PSTableCell *)self valueLabel];
  [v18 setTextColor:v17];
}

- (void)changeSortTapped:(id)a3
{
  v3 = objc_msgSend(MEMORY[0x263EFFA40], "standardUserDefaults", a3);
  uint64_t v4 = [v3 BOOLForKey:0x26D414C60] ^ 1;

  int v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 setBool:v4 forKey:0x26D414C60];

  v6 = MEMORY[0x263EF83A0];
  dispatch_async(v6, &__block_literal_global_22);
}

void __72__PSUICellularDataUsageSortOptionsHeaderTableViewCell_changeSortTapped___block_invoke()
{
  id v0 = [MEMORY[0x263F08A00] defaultCenter];
  [v0 postNotificationName:*MEMORY[0x263F67F20] object:0];
}

@end