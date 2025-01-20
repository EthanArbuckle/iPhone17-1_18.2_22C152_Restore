@interface SCLUnlockCountTableViewCell
- (SCLUnlockCountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (id)attributedStringForUnlockCount:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation SCLUnlockCountTableViewCell

- (SCLUnlockCountTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)SCLUnlockCountTableViewCell;
  v5 = [(PSTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(SCLUnlockCountTableViewCell *)v5 detailTextLabel];
    [v7 setHidden:1];

    v8 = [(SCLUnlockCountTableViewCell *)v6 textLabel];
    [v8 setNumberOfLines:0];
  }
  return v6;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SCLUnlockCountTableViewCell;
  id v4 = a3;
  [(PSTableCell *)&v8 refreshCellContentsWithSpecifier:v4];
  v5 = objc_msgSend(v4, "propertyForKey:", *MEMORY[0x263F60308], v8.receiver, v8.super_class);

  v6 = [(SCLUnlockCountTableViewCell *)self textLabel];
  v7 = [(SCLUnlockCountTableViewCell *)self attributedStringForUnlockCount:v5];
  [v6 setAttributedText:v7];
}

- (id)attributedStringForUnlockCount:(id)a3
{
  v29[2] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08A30];
  id v4 = a3;
  uint64_t v5 = [v3 localizedStringFromNumber:v4 numberStyle:1];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v24 = [v6 localizedStringForKey:@"DAILY_UNLOCK_COUNT" value:&stru_26E283B80 table:@"StringsDict"];

  v7 = NSString;
  uint64_t v8 = [v4 integerValue];

  v9 = objc_msgSend(v7, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v24, @"%lu", 0, v8);
  uint64_t v27 = *MEMORY[0x263F814F0];
  uint64_t v10 = v27;
  v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
  v29[0] = v11;
  uint64_t v28 = *MEMORY[0x263F81500];
  uint64_t v12 = v28;
  v13 = [MEMORY[0x263F1C550] tableCellGrayTextColor];
  v29[1] = v13;
  v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v27 count:2];

  v15 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9 attributes:v14];
  v16 = (void *)v5;
  uint64_t v17 = [v9 rangeOfString:v5];
  uint64_t v19 = v18;
  v25[0] = v10;
  v20 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F1D2B0]];
  v25[1] = v12;
  v26[0] = v20;
  v21 = [MEMORY[0x263F1C550] whiteColor];
  v26[1] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

  objc_msgSend(v15, "setAttributes:range:", v22, v17, v19);

  return v15;
}

@end