@interface PSUIConvertedCellularPlanTableCell
+ (int64_t)cellStyle;
- (BOOL)canBeChecked;
- (BOOL)canReload;
- (PSUIConvertedCellularPlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)descriptionLabel;
- (UILabel)numberLabel;
- (UILabel)statusLabel;
- (id)detailTextLabel;
- (id)textLabel;
- (void)_setLabel:(id)a3 andDescription:(id)a4;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDescriptionLabel:(id)a3;
- (void)setNumberLabel:(id)a3;
- (void)setStatusLabel:(id)a3;
@end

@implementation PSUIConvertedCellularPlanTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSUIConvertedCellularPlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v74.receiver = self;
  v74.super_class = (Class)PSUIConvertedCellularPlanTableCell;
  v4 = [(PSUIConvertedCellularPlanTableCell *)&v74 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v73.receiver = v4;
    v73.super_class = (Class)PSUIConvertedCellularPlanTableCell;
    v6 = [(PSUIConvertedCellularPlanTableCell *)&v73 textLabel];
    [v6 removeFromSuperview];

    v72.receiver = v5;
    v72.super_class = (Class)PSUIConvertedCellularPlanTableCell;
    v7 = [(PSUIConvertedCellularPlanTableCell *)&v72 detailTextLabel];
    [v7 removeFromSuperview];

    [(PSUIConvertedCellularPlanTableCell *)v5 setAccessoryType:1];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = v8;

    uint64_t v10 = *MEMORY[0x263F83570];
    v11 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    [(UILabel *)v5->_statusLabel setFont:v11];

    [(UILabel *)v5->_statusLabel setNumberOfLines:1];
    v12 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UILabel *)v5->_statusLabel setTextColor:v12];

    [(UILabel *)v5->_statusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(PSUIConvertedCellularPlanTableCell *)v5 contentView];
    [v13 addSubview:v5->_statusLabel];

    LODWORD(v14) = 1148846080;
    [(UILabel *)v5->_statusLabel setContentCompressionResistancePriority:0 forAxis:v14];
    LODWORD(v15) = 1148846080;
    [(UILabel *)v5->_statusLabel setContentHuggingPriority:0 forAxis:v15];
    v16 = [(UILabel *)v5->_statusLabel trailingAnchor];
    v17 = [(PSUIConvertedCellularPlanTableCell *)v5 contentView];
    v18 = [v17 layoutMarginsGuide];
    v19 = [v18 trailingAnchor];
    v20 = [v16 constraintEqualToAnchor:v19];
    [v20 setActive:1];

    v21 = [(UILabel *)v5->_statusLabel centerYAnchor];
    v22 = [(PSUIConvertedCellularPlanTableCell *)v5 contentView];
    v23 = [v22 layoutMarginsGuide];
    v24 = [v23 centerYAnchor];
    v25 = [v21 constraintEqualToAnchor:v24];
    [v25 setActive:1];

    v26 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    numberLabel = v5->_numberLabel;
    v5->_numberLabel = v26;

    v28 = [MEMORY[0x263F81708] preferredFontForTextStyle:v10];
    [(UILabel *)v5->_numberLabel setFont:v28];

    [(UILabel *)v5->_numberLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v5->_numberLabel setNumberOfLines:0];
    [(UILabel *)v5->_numberLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v29 = [(PSUIConvertedCellularPlanTableCell *)v5 contentView];
    [v29 addSubview:v5->_numberLabel];

    LODWORD(v30) = 1148846080;
    [(UILabel *)v5->_numberLabel setContentCompressionResistancePriority:1 forAxis:v30];
    v31 = [(UILabel *)v5->_numberLabel topAnchor];
    v32 = [(PSUIConvertedCellularPlanTableCell *)v5 contentView];
    v33 = [v32 layoutMarginsGuide];
    v34 = [v33 topAnchor];
    v35 = [v31 constraintEqualToAnchor:v34];
    [v35 setActive:1];

    v36 = [(UILabel *)v5->_numberLabel leadingAnchor];
    v37 = [(PSUIConvertedCellularPlanTableCell *)v5 contentView];
    v38 = [v37 layoutMarginsGuide];
    v39 = [v38 leadingAnchor];
    v40 = [v36 constraintEqualToAnchor:v39];
    [v40 setActive:1];

    v41 = [(UILabel *)v5->_numberLabel trailingAnchor];
    v42 = [(UILabel *)v5->_statusLabel leadingAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    [v43 setActive:1];

    v44 = [(UILabel *)v5->_numberLabel trailingAnchor];
    v45 = [(PSUIConvertedCellularPlanTableCell *)v5 contentView];
    v46 = [v45 layoutMarginsGuide];
    v47 = [v46 trailingAnchor];
    v48 = [v44 constraintLessThanOrEqualToAnchor:v47];
    [v48 setActive:1];

    v49 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = v49;

    v51 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [(UILabel *)v5->_descriptionLabel setFont:v51];

    [(UILabel *)v5->_descriptionLabel setNumberOfLines:0];
    [(UILabel *)v5->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v52 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UILabel *)v5->_descriptionLabel setTextColor:v52];

    v53 = [(PSUIConvertedCellularPlanTableCell *)v5 contentView];
    [v53 addSubview:v5->_descriptionLabel];

    LODWORD(v54) = 1148846080;
    [(UILabel *)v5->_descriptionLabel setContentCompressionResistancePriority:1 forAxis:v54];
    v55 = [(UILabel *)v5->_descriptionLabel leadingAnchor];
    v56 = [(PSUIConvertedCellularPlanTableCell *)v5 contentView];
    v57 = [v56 layoutMarginsGuide];
    v58 = [v57 leadingAnchor];
    v59 = [v55 constraintEqualToAnchor:v58];
    [v59 setActive:1];

    v60 = [(UILabel *)v5->_descriptionLabel bottomAnchor];
    v61 = [(PSUIConvertedCellularPlanTableCell *)v5 contentView];
    v62 = [v61 layoutMarginsGuide];
    v63 = [v62 bottomAnchor];
    v64 = [v60 constraintEqualToAnchor:v63];
    [v64 setActive:1];

    v65 = [(UILabel *)v5->_descriptionLabel firstBaselineAnchor];
    v66 = [(UILabel *)v5->_numberLabel lastBaselineAnchor];
    v67 = [v65 constraintEqualToSystemSpacingBelowAnchor:v66 multiplier:1.0];
    [v67 setActive:1];

    v68 = [(UILabel *)v5->_descriptionLabel widthAnchor];
    v69 = [(UILabel *)v5->_numberLabel widthAnchor];
    v70 = [v68 constraintEqualToAnchor:v69];
    [v70 setActive:1];
  }
  return v5;
}

- (BOOL)canReload
{
  return 1;
}

- (BOOL)canBeChecked
{
  return 0;
}

- (void)_setLabel:(id)a3 andDescription:(id)a4
{
  id v6 = a4;
  [(UILabel *)self->_numberLabel setText:a3];
  if ([v6 length]) {
    [(UILabel *)self->_descriptionLabel setText:v6];
  }
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PSUIConvertedCellularPlanTableCell;
  [(PSTableCell *)&v22 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:*MEMORY[0x263F5FFF0]];
  id v6 = +[PSUICellularPlanManagerCache sharedInstance];
  v7 = [v6 planFromReference:v5];

  if (v7)
  {
    v8 = [v4 propertyForKey:*MEMORY[0x263F60290]];
    v9 = +[PSUICoreTelephonyCallCache sharedInstance];
    uint64_t v10 = [v7 phoneNumber];
    v11 = [v9 localizedPhoneNumber:v10 context:v8];

    if ([v7 transferredStatus] == 4)
    {
      v12 = NSString;
      v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v14 = [v13 localizedStringForKey:@"CONVERTED_TO_ESIM" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
      double v15 = [v12 stringWithFormat:v14];
    }
    else
    {
      v13 = [v7 transferredToDeviceDisplayName];
      uint64_t v16 = [v13 length];
      v17 = NSString;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      double v14 = v18;
      if (v16)
      {
        v19 = [v18 localizedStringForKey:@"TRANSFERRED_TO_@" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
        objc_msgSend(v17, "stringWithFormat:", v19, v13);
      }
      else
      {
        v19 = [v18 localizedStringForKey:@"TRANSFERRED" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
        objc_msgSend(v17, "stringWithFormat:", v19, v21);
      double v15 = };
    }
    if ([v4 hasValidGetter])
    {
      v20 = [v4 performGetter];
      if (v20)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(UILabel *)self->_statusLabel setText:v20];
        }
      }
    }
    [(PSUIConvertedCellularPlanTableCell *)self _setLabel:v11 andDescription:v15];
    [(PSUIConvertedCellularPlanTableCell *)self setNeedsLayout];
  }
}

- (id)textLabel
{
  return 0;
}

- (id)detailTextLabel
{
  return 0;
}

- (UILabel)numberLabel
{
  return self->_numberLabel;
}

- (void)setNumberLabel:(id)a3
{
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
}

@end