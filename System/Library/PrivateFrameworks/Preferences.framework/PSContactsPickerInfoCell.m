@interface PSContactsPickerInfoCell
- (PSContactsPickerInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
@end

@implementation PSContactsPickerInfoCell

- (PSContactsPickerInfoCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v46[7] = *MEMORY[0x1E4F143B8];
  v45.receiver = self;
  v45.super_class = (Class)PSContactsPickerInfoCell;
  v5 = [(PSTableCell *)&v45 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(PSContactsPickerInfoCell *)v5 contentView];
    id v8 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [v8 setFont:v9];

    [v8 setNumberOfLines:0];
    v10 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_PICKER_ONLY_AUTHORIZATION");
    [v8 setText:v10];

    [v7 addSubview:v8];
    id v11 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43878]];
    [v11 setFont:v12];

    v13 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [v11 setTextColor:v13];

    [v11 setNumberOfLines:0];
    v14 = PS_LocalizedStringForSystemPolicy(@"CONTACTS_PICKER_ONLY_DESCRIPTION");
    [v11 setText:v14];

    [v7 addSubview:v11];
    v15 = [(PSContactsPickerInfoCell *)v6 contentView];
    v16 = [v15 layoutMarginsGuide];

    v34 = (void *)MEMORY[0x1E4F28DC8];
    v44 = [v8 topAnchor];
    v33 = v7;
    v43 = [v7 topAnchor];
    v42 = [v44 constraintEqualToSystemSpacingBelowAnchor:v43 multiplier:2.0];
    v46[0] = v42;
    v41 = [v8 leadingAnchor];
    v39 = [v16 leadingAnchor];
    v38 = [v41 constraintEqualToAnchor:v39];
    v46[1] = v38;
    v40 = v8;
    v37 = [v8 trailingAnchor];
    v36 = [v16 trailingAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v46[2] = v35;
    v31 = [v11 topAnchor];
    v30 = [v8 bottomAnchor];
    v29 = [v31 constraintEqualToSystemSpacingBelowAnchor:v30 multiplier:1.0];
    v46[3] = v29;
    v28 = [v11 leadingAnchor];
    v32 = v16;
    v27 = [v16 leadingAnchor];
    v17 = [v28 constraintEqualToAnchor:v27];
    v46[4] = v17;
    v18 = [v11 trailingAnchor];
    v19 = [v16 trailingAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v46[5] = v20;
    [v7 bottomAnchor];
    v22 = v21 = v6;
    v23 = [v11 bottomAnchor];
    v24 = [v22 constraintEqualToSystemSpacingBelowAnchor:v23 multiplier:2.0];
    v46[6] = v24;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:7];
    [v34 activateConstraints:v25];

    v6 = v21;
  }
  return v6;
}

@end