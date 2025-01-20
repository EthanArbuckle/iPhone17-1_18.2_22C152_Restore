@interface TUIReportToAppleSpecifierCell
+ (int64_t)cellStyle;
- (id)attributedStringForSystemImageNamed:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation TUIReportToAppleSpecifierCell

+ (int64_t)cellStyle
{
  return 3;
}

- (id)attributedStringForSystemImageNamed:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F1C370];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v6 = [MEMORY[0x263F1C6C8] configurationWithPointSize:4 weight:3 scale:10.0];
  v7 = [MEMORY[0x263F1C6B0] systemImageNamed:v4 withConfiguration:v6];

  v8 = [MEMORY[0x263F1C550] secondaryLabelColor];
  v9 = [v7 imageWithTintColor:v8];
  [v5 setImage:v9];

  v10 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v5];

  return v10;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v59[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_6 != -1) {
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_6, &__block_literal_global_6);
  }
  id v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_6;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_DEBUG)) {
    -[TUIReportToAppleSpecifierCell refreshCellContentsWithSpecifier:]((uint64_t)self, v5);
  }
  v56.receiver = self;
  v56.super_class = (Class)TUIReportToAppleSpecifierCell;
  [(PSTableCell *)&v56 refreshCellContentsWithSpecifier:v4];
  v6 = [(TUIReportToAppleSpecifierCell *)self textLabel];
  [v6 setText:0];

  v7 = [v4 propertyForKey:*MEMORY[0x263F602C8]];
  v8 = [(TUIReportToAppleSpecifierCell *)self detailTextLabel];
  v9 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D280]];
  [v8 setFont:v9];

  v10 = [(TUIReportToAppleSpecifierCell *)self detailTextLabel];
  v11 = [MEMORY[0x263F1C550] secondaryLabelColor];
  [v10 setTextColor:v11];

  v12 = [(TUIReportToAppleSpecifierCell *)self detailTextLabel];
  [v12 setLineBreakMode:0];

  v13 = [(TUIReportToAppleSpecifierCell *)self detailTextLabel];
  [v13 setNumberOfLines:0];

  v14 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\t"];
  v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@"\n"];
  v16 = objc_opt_new();
  v55 = v7;
  int v17 = [v7 isEqual:*MEMORY[0x263F80D90]];
  v18 = [(TUIReportToAppleSpecifierCell *)self attributedStringForSystemImageNamed:@"person.crop.circle"];
  [v16 appendAttributedString:v18];

  [v16 appendAttributedString:v14];
  id v19 = objc_alloc(MEMORY[0x263F086A0]);
  v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = v20;
  if (v17)
  {
    v22 = objc_msgSend(v20, "localizedStringForKey:value:table:", @"APPLE_ID_WITH_PEER_STRING", &stru_270C3F140);
    v23 = (void *)[v19 initWithString:v22];
    [v16 appendAttributedString:v23];

    [v16 appendAttributedString:v15];
    v24 = [(TUIReportToAppleSpecifierCell *)self attributedStringForSystemImageNamed:@"key"];
    [v16 appendAttributedString:v24];

    [v16 appendAttributedString:v14];
    id v25 = objc_alloc(MEMORY[0x263F086A0]);
    v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"PUBLIC_KEYS_WITH_PEER_STRING" value:&stru_270C3F140 table:@"Localizable"];
    v28 = (void *)[v25 initWithString:v27];
    [v16 appendAttributedString:v28];

    [v16 appendAttributedString:v15];
    v29 = [(TUIReportToAppleSpecifierCell *)self attributedStringForSystemImageNamed:@"network"];
    [v16 appendAttributedString:v29];

    [v16 appendAttributedString:v14];
    id v30 = objc_alloc(MEMORY[0x263F086A0]);
    v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v32 = v31;
    v33 = @"NETWORK_LOGS_STRING";
  }
  else
  {
    v34 = [v20 localizedStringForKey:@"APPLE_ID_STRING" value:&stru_270C3F140 table:@"Localizable"];
    v35 = (void *)[v19 initWithString:v34];
    [v16 appendAttributedString:v35];

    [v16 appendAttributedString:v15];
    v36 = [(TUIReportToAppleSpecifierCell *)self attributedStringForSystemImageNamed:@"key"];
    [v16 appendAttributedString:v36];

    [v16 appendAttributedString:v14];
    id v37 = objc_alloc(MEMORY[0x263F086A0]);
    v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v39 = [v38 localizedStringForKey:@"PUBLIC_KEYS_MESSAGES_STRING" value:&stru_270C3F140 table:@"Localizable"];
    v40 = (void *)[v37 initWithString:v39];
    [v16 appendAttributedString:v40];

    [v16 appendAttributedString:v15];
    v41 = [(TUIReportToAppleSpecifierCell *)self attributedStringForSystemImageNamed:@"network"];
    [v16 appendAttributedString:v41];

    [v16 appendAttributedString:v14];
    id v42 = objc_alloc(MEMORY[0x263F086A0]);
    v43 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v44 = [v43 localizedStringForKey:@"NETWORK_LOGS_STRING" value:&stru_270C3F140 table:@"Localizable"];
    v45 = (void *)[v42 initWithString:v44];
    [v16 appendAttributedString:v45];

    [v16 appendAttributedString:v15];
    v46 = [(TUIReportToAppleSpecifierCell *)self attributedStringForSystemImageNamed:@"iphone.gen2"];
    [v16 appendAttributedString:v46];

    [v16 appendAttributedString:v14];
    id v30 = objc_alloc(MEMORY[0x263F086A0]);
    v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v32 = v31;
    v33 = @"DEVICE_IDENTIFIERS_STRING";
  }
  v47 = [v31 localizedStringForKey:v33 value:&stru_270C3F140 table:@"Localizable"];
  v48 = (void *)[v30 initWithString:v47];
  [v16 appendAttributedString:v48];

  v49 = objc_opt_new();
  id v50 = objc_alloc(MEMORY[0x263F1C388]);
  v51 = (void *)[v50 initWithTextAlignment:4 location:MEMORY[0x263EFFA78] options:25.0];
  v59[0] = v51;
  v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v59 count:1];
  [v49 setTabStops:v52];

  [v49 setAlignment:4];
  [v49 setFirstLineHeadIndent:0.0];
  uint64_t v57 = *MEMORY[0x263F1C268];
  v58 = v49;
  v53 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  objc_msgSend(v16, "addAttributes:range:", v53, 0, objc_msgSend(v16, "length"));

  v54 = [(TUIReportToAppleSpecifierCell *)self detailTextLabel];
  [v54 setAttributedText:v16];

  [(TUIReportToAppleSpecifierCell *)self setNeedsLayout];
}

uint64_t __66__TUIReportToAppleSpecifierCell_refreshCellContentsWithSpecifier___block_invoke()
{
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_6 = (uint64_t)os_log_create("com.apple.Transparency", "ui");
  return MEMORY[0x270F9A758]();
}

- (void)refreshCellContentsWithSpecifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  v3 = "-[TUIReportToAppleSpecifierCell refreshCellContentsWithSpecifier:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_260338000, a2, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)&v2, 0x16u);
}

@end