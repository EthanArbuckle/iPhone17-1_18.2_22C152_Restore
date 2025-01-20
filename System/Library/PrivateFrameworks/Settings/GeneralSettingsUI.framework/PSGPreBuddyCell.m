@interface PSGPreBuddyCell
- (PSGPreBuddyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIImage)transferingImage;
@end

@implementation PSGPreBuddyCell

- (PSGPreBuddyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v59.receiver = self;
  v59.super_class = (Class)PSGPreBuddyCell;
  v4 = [(PSGPreBuddyCell *)&v59 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(PSGPreBuddyCell *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(PSTableCell *)v5 titleLabel];
    [v6 setHidden:1];

    v7 = [(PSGPreBuddyCell *)v5 detailTextLabel];
    [v7 setHidden:1];

    v8 = objc_opt_new();
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setAxis:1];
    v9 = [(PSGPreBuddyCell *)v5 contentView];
    [v9 addSubview:v8];

    v10 = [v8 topAnchor];
    v11 = [(PSGPreBuddyCell *)v5 contentView];
    v12 = [v11 topAnchor];
    v13 = [v10 constraintEqualToAnchor:v12 constant:15.0];
    [v13 setActive:1];

    v14 = [v8 leadingAnchor];
    v15 = [(PSGPreBuddyCell *)v5 contentView];
    v16 = [v15 leadingAnchor];
    v17 = [v14 constraintEqualToAnchor:v16 constant:24.0];
    [v17 setActive:1];

    v18 = [v8 trailingAnchor];
    v19 = [(PSGPreBuddyCell *)v5 contentView];
    v20 = [v19 trailingAnchor];
    v21 = [v18 constraintEqualToAnchor:v20 constant:-24.0];
    [v21 setActive:1];

    v22 = [v8 bottomAnchor];
    v23 = [(PSGPreBuddyCell *)v5 contentView];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24 constant:-25.0];
    [v25 setActive:1];

    v26 = [MEMORY[0x263F53C50] sharedConnection];
    LODWORD(v24) = [v26 effectiveBoolValueForSetting:*MEMORY[0x263F53710]];

    id v27 = objc_alloc_init(MEMORY[0x263EFB210]);
    v28 = objc_msgSend(v27, "aa_primaryAppleAccount");
    int v29 = PSUsedByManagedAccount();
    BOOL v30 = v24 == 2 && v28 == 0;
    if (v30 || v29)
    {
      v36 = objc_opt_new();
      [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
      v51 = PSG_LocalizedStringForReset(@"PREBUDDY_MANAGED");
      [v36 setText:v51];

      v52 = (void *)MEMORY[0x263F81708];
      uint64_t v53 = *MEMORY[0x263F835F0];
      v54 = +[PSGResetOrEraseListController maximumSupportedContentSizeCategory];
      v55 = [v52 _preferredFontForTextStyle:v53 maximumContentSizeCategory:v54];
      [v36 setFont:v55];

      v56 = [MEMORY[0x263F825C8] labelColor];
      [v36 setTextColor:v56];

      [v36 setTextAlignment:1];
      [v36 setNumberOfLines:0];
      [v8 addArrangedSubview:v36];
    }
    else
    {
      id v58 = v27;
      v31 = (void *)MEMORY[0x263F81708];
      uint64_t v32 = *MEMORY[0x263F83570];
      v33 = +[PSGResetOrEraseListController maximumSupportedContentSizeCategory];
      v34 = [v31 _preferredFontForTextStyle:v32 maximumContentSizeCategory:v33];
      v35 = [v34 fontDescriptor];
      v36 = [v35 fontDescriptorWithSymbolicTraits:2];

      id v37 = objc_alloc(MEMORY[0x263F82828]);
      v38 = [(PSGPreBuddyCell *)v5 transferingImage];
      v39 = (void *)[v37 initWithImage:v38];

      [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v39 setContentMode:4];
      [v8 addArrangedSubview:v39];
      [v8 setCustomSpacing:v39 afterView:15.0];
      v40 = objc_opt_new();
      [v40 setTranslatesAutoresizingMaskIntoConstraints:0];
      v41 = PSG_LocalizedStringForReset(@"PREBUDDY_LABEL");
      [v40 setText:v41];

      v42 = [MEMORY[0x263F81708] fontWithDescriptor:v36 size:0.0];
      [v40 setFont:v42];

      v43 = [MEMORY[0x263F825C8] labelColor];
      [v40 setTextColor:v43];

      [v40 setTextAlignment:1];
      [v40 setNumberOfLines:0];
      [v8 addArrangedSubview:v40];
      [v8 setCustomSpacing:v40 afterView:15.0];
      v44 = objc_opt_new();
      [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
      v45 = PSG_LocalizedStringForReset(@"PREBUDDY_TEXT");
      [v44 setText:v45];

      v46 = (void *)MEMORY[0x263F81708];
      uint64_t v47 = *MEMORY[0x263F835F0];
      v48 = +[PSGResetOrEraseListController maximumSupportedContentSizeCategory];
      v49 = [v46 _preferredFontForTextStyle:v47 maximumContentSizeCategory:v48];
      [v44 setFont:v49];

      v50 = [MEMORY[0x263F825C8] labelColor];
      [v44 setTextColor:v50];

      id v27 = v58;
      [v44 setTextAlignment:1];
      [v44 setNumberOfLines:0];
      [v8 addArrangedSubview:v44];
    }
  }
  return v5;
}

- (UIImage)transferingImage
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  int v3 = objc_msgSend(v2, "sf_hasHardwareHomeButton");

  v4 = [MEMORY[0x263F82670] currentDevice];
  char v5 = objc_msgSend(v4, "sf_isiPod");

  if (v5)
  {
    v6 = @"iPod";
  }
  else
  {
    v7 = [MEMORY[0x263F82670] currentDevice];
    int v8 = objc_msgSend(v7, "sf_isiPad");

    v6 = @"iPhone";
    if (v8) {
      v6 = @"iPad";
    }
  }
  v9 = @"Modern";
  if (v3) {
    v9 = @"Classic";
  }
  v10 = [NSString stringWithFormat:@"%@%@", v9, v6];
  v11 = (void *)MEMORY[0x263F827E8];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v11 imageNamed:v10 inBundle:v12];
  v14 = [v13 imageWithRenderingMode:2];

  return (UIImage *)v14;
}

@end