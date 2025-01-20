@interface MODataAccessInfoCell
- (MODataAccessInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation MODataAccessInfoCell

- (MODataAccessInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v52[7] = *MEMORY[0x263EF8340];
  id v8 = a5;
  v51.receiver = self;
  v51.super_class = (Class)MODataAccessInfoCell;
  v9 = [(PSTableCell *)&v51 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    v11 = [(MODataAccessInfoCell *)v9 contentView];
    id v12 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [v12 setFont:v13];

    [v12 setNumberOfLines:0];
    v14 = v11;
    [v11 addSubview:v12];
    id v15 = objc_alloc_init(MEMORY[0x263F828E0]);
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83580]];
    [v15 setFont:v16];

    v17 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [v15 setTextColor:v17];

    [v15 setNumberOfLines:0];
    v18 = v14;
    [v14 addSubview:v15];
    v19 = [v8 objectForKeyedSubscript:@"MOTitle"];
    [v12 setText:v19];

    v20 = [v8 objectForKeyedSubscript:@"MOBody"];
    [v15 setText:v20];

    v21 = [(MODataAccessInfoCell *)v10 contentView];
    v22 = [v21 layoutMarginsGuide];

    v40 = (void *)MEMORY[0x263F08938];
    v50 = [v12 topAnchor];
    v39 = v14;
    v49 = [v14 topAnchor];
    v48 = [v50 constraintEqualToSystemSpacingBelowAnchor:v49 multiplier:2.0];
    v52[0] = v48;
    v47 = [v12 leadingAnchor];
    v45 = [v22 leadingAnchor];
    v44 = [v47 constraintEqualToAnchor:v45];
    v52[1] = v44;
    v46 = v12;
    v43 = [v12 trailingAnchor];
    v42 = [v22 trailingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v52[2] = v41;
    v37 = [v15 topAnchor];
    v36 = [v12 bottomAnchor];
    v35 = [v37 constraintEqualToSystemSpacingBelowAnchor:v36 multiplier:1.0];
    v52[3] = v35;
    v34 = [v15 leadingAnchor];
    v38 = v22;
    v33 = [v22 leadingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v52[4] = v32;
    v23 = [v15 trailingAnchor];
    v24 = [v22 trailingAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v52[5] = v25;
    v26 = [v18 bottomAnchor];
    [v15 bottomAnchor];
    v28 = id v27 = v8;
    v29 = [v26 constraintEqualToSystemSpacingBelowAnchor:v28 multiplier:2.0];
    v52[6] = v29;
    v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:7];
    [v40 activateConstraints:v30];

    id v8 = v27;
  }

  return v10;
}

@end