@interface PSUICellularPlanOptionTableCell
+ (int64_t)cellStyle;
- (BOOL)canBeChecked;
- (BOOL)canReload;
- (PSUIBadgeView)badgeView;
- (PSUIBadgeView)centeredBadgeView;
- (PSUICellularPlanOptionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)centeredNameLabel;
- (UILabel)nameLabel;
- (UILabel)numberLabel;
- (id)detailTextLabel;
- (id)textLabel;
- (void)_setBadge:(id)a3 andLabel:(id)a4 andPhoneNumber:(id)a5;
- (void)_setCenteredBadge:(id)a3 andLabel:(id)a4;
- (void)_setCenteredText:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setCellEnabled:(BOOL)a3;
- (void)setCenteredBadgeView:(id)a3;
- (void)setCenteredNameLabel:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNumberLabel:(id)a3;
@end

@implementation PSUICellularPlanOptionTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSUICellularPlanOptionTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v96.receiver = self;
  v96.super_class = (Class)PSUICellularPlanOptionTableCell;
  v4 = [(PSUICellularPlanOptionTableCell *)&v96 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v95.receiver = v4;
    v95.super_class = (Class)PSUICellularPlanOptionTableCell;
    v6 = [(PSUICellularPlanOptionTableCell *)&v95 textLabel];
    [v6 setText:@"ABC"];

    v94.receiver = v5;
    v94.super_class = (Class)PSUICellularPlanOptionTableCell;
    v7 = [(PSUICellularPlanOptionTableCell *)&v94 detailTextLabel];
    [v7 setText:@"XYZ"];

    v93.receiver = v5;
    v93.super_class = (Class)PSUICellularPlanOptionTableCell;
    v8 = [(PSUICellularPlanOptionTableCell *)&v93 textLabel];
    [v8 removeFromSuperview];

    v92.receiver = v5;
    v92.super_class = (Class)PSUICellularPlanOptionTableCell;
    v9 = [(PSUICellularPlanOptionTableCell *)&v92 detailTextLabel];
    [v9 removeFromSuperview];

    v91.receiver = v5;
    v91.super_class = (Class)PSUICellularPlanOptionTableCell;
    v10 = [(PSUICellularPlanOptionTableCell *)&v91 textLabel];
    [v10 setHidden:1];

    v90.receiver = v5;
    v90.super_class = (Class)PSUICellularPlanOptionTableCell;
    v11 = [(PSUICellularPlanOptionTableCell *)&v90 detailTextLabel];
    [v11 setHidden:1];

    v12 = objc_alloc_init(PSUIBadgeView);
    badgeView = v5->_badgeView;
    v5->_badgeView = v12;

    v14 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    [v14 addSubview:v5->_badgeView];

    v15 = [(PSUIBadgeView *)v5->_badgeView leadingAnchor];
    v16 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    v17 = [v16 layoutMarginsGuide];
    v18 = [v17 leadingAnchor];
    v19 = [v15 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    v20 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    nameLabel = v5->_nameLabel;
    v5->_nameLabel = v20;

    uint64_t v89 = *MEMORY[0x263F83570];
    v22 = objc_msgSend(MEMORY[0x263F81708], "preferredFontForTextStyle:");
    [(UILabel *)v5->_nameLabel setFont:v22];

    [(UILabel *)v5->_nameLabel setNumberOfLines:0];
    [(UILabel *)v5->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    [v23 addSubview:v5->_nameLabel];

    v24 = [(UILabel *)v5->_nameLabel firstBaselineAnchor];
    v25 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    v26 = [v25 topAnchor];
    v27 = [v24 constraintEqualToSystemSpacingBelowAnchor:v26 multiplier:1.0];
    [v27 setActive:1];

    v28 = [(UILabel *)v5->_nameLabel leadingAnchor];
    v29 = [(PSUIBadgeView *)v5->_badgeView trailingAnchor];
    v30 = [MEMORY[0x263F82770] defaultMetrics];
    [v30 scaledValueForValue:4.0];
    v31 = objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29);
    [v31 setActive:1];

    v32 = [(PSUIBadgeView *)v5->_badgeView centerYAnchor];
    v33 = [(UILabel *)v5->_nameLabel centerYAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v34 setActive:1];

    v35 = [(UILabel *)v5->_nameLabel trailingAnchor];
    v36 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    v37 = [v36 layoutMarginsGuide];
    v38 = [v37 trailingAnchor];
    v39 = [v35 constraintLessThanOrEqualToAnchor:v38];
    [v39 setActive:1];

    v40 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    numberLabel = v5->_numberLabel;
    v5->_numberLabel = v40;

    v42 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [(UILabel *)v5->_numberLabel setFont:v42];

    [(UILabel *)v5->_numberLabel setNumberOfLines:0];
    [(UILabel *)v5->_numberLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v43 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UILabel *)v5->_numberLabel setTextColor:v43];

    v44 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    [v44 addSubview:v5->_numberLabel];

    v45 = [(UILabel *)v5->_numberLabel firstBaselineAnchor];
    v46 = [(UILabel *)v5->_nameLabel lastBaselineAnchor];
    v47 = [v45 constraintEqualToSystemSpacingBelowAnchor:v46 multiplier:1.0];
    [v47 setActive:1];

    v48 = [(UILabel *)v5->_numberLabel leadingAnchor];
    v49 = [(PSUIBadgeView *)v5->_badgeView leadingAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    [v50 setActive:1];

    v51 = [(UILabel *)v5->_numberLabel trailingAnchor];
    v52 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    v53 = [v52 layoutMarginsGuide];
    v54 = [v53 trailingAnchor];
    v55 = [v51 constraintLessThanOrEqualToAnchor:v54];
    [v55 setActive:1];

    v56 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    v57 = [v56 bottomAnchor];
    v58 = [(UILabel *)v5->_numberLabel lastBaselineAnchor];
    v59 = [v57 constraintEqualToSystemSpacingBelowAnchor:v58 multiplier:1.0];
    [v59 setActive:1];

    v60 = objc_alloc_init(PSUIBadgeView);
    centeredBadgeView = v5->_centeredBadgeView;
    v5->_centeredBadgeView = v60;

    v62 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    [v62 addSubview:v5->_centeredBadgeView];

    v63 = [(PSUIBadgeView *)v5->_centeredBadgeView leadingAnchor];
    v64 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    v65 = [v64 layoutMarginsGuide];
    v66 = [v65 leadingAnchor];
    v67 = [v63 constraintEqualToAnchor:v66];
    [v67 setActive:1];

    v68 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    centeredNameLabel = v5->_centeredNameLabel;
    v5->_centeredNameLabel = v68;

    v70 = [MEMORY[0x263F81708] preferredFontForTextStyle:v89];
    [(UILabel *)v5->_centeredNameLabel setFont:v70];

    [(UILabel *)v5->_centeredNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v71 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    [v71 addSubview:v5->_centeredNameLabel];

    v72 = [(UILabel *)v5->_centeredNameLabel leadingAnchor];
    v73 = [(PSUIBadgeView *)v5->_centeredBadgeView trailingAnchor];
    v74 = [MEMORY[0x263F82770] defaultMetrics];
    [v74 scaledValueForValue:4.0];
    v75 = objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73);
    [v75 setActive:1];

    v76 = [(UILabel *)v5->_centeredNameLabel trailingAnchor];
    v77 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    v78 = [v77 layoutMarginsGuide];
    v79 = [v78 trailingAnchor];
    v80 = [v76 constraintLessThanOrEqualToAnchor:v79];
    [v80 setActive:1];

    v81 = [(UILabel *)v5->_centeredNameLabel centerYAnchor];
    v82 = [(PSUICellularPlanOptionTableCell *)v5 contentView];
    v83 = [v82 centerYAnchor];
    v84 = [v81 constraintEqualToAnchor:v83];
    [v84 setActive:1];

    v85 = [(PSUIBadgeView *)v5->_centeredBadgeView centerYAnchor];
    v86 = [(UILabel *)v5->_centeredNameLabel centerYAnchor];
    v87 = [v85 constraintEqualToAnchor:v86];
    [v87 setActive:1];
  }
  return v5;
}

- (BOOL)canReload
{
  return 1;
}

- (BOOL)canBeChecked
{
  return 1;
}

- (void)_setCenteredBadge:(id)a3 andLabel:(id)a4
{
  badgeView = self->_badgeView;
  id v10 = a4;
  id v7 = a3;
  [(PSUIBadgeView *)badgeView setHidden:1];
  [(UILabel *)self->_nameLabel setHidden:1];
  [(UILabel *)self->_numberLabel setHidden:1];
  [(PSUIBadgeView *)self->_centeredBadgeView setHidden:0];
  [(UILabel *)self->_centeredNameLabel setHidden:0];
  [(PSUIBadgeView *)self->_badgeView setText:v7];
  [(UILabel *)self->_nameLabel setText:v10];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"PLACEHOLDER_PHONE_NUMBER" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  [(UILabel *)self->_numberLabel setText:v9];

  [(PSUIBadgeView *)self->_centeredBadgeView setText:v7];
  [(UILabel *)self->_centeredNameLabel setText:v10];
}

- (void)_setCenteredText:(id)a3
{
  badgeView = self->_badgeView;
  id v7 = a3;
  [(PSUIBadgeView *)badgeView setHidden:1];
  [(UILabel *)self->_nameLabel setHidden:1];
  [(UILabel *)self->_numberLabel setHidden:1];
  [(PSUIBadgeView *)self->_centeredBadgeView setHidden:1];
  [(UILabel *)self->_centeredNameLabel setHidden:0];
  [(UILabel *)self->_nameLabel setText:v7];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"PLACEHOLDER_PHONE_NUMBER" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  [(UILabel *)self->_numberLabel setText:v6];

  [(UILabel *)self->_centeredNameLabel setText:v7];
}

- (void)_setBadge:(id)a3 andLabel:(id)a4 andPhoneNumber:(id)a5
{
  badgeView = self->_badgeView;
  id v9 = a5;
  id v11 = a4;
  id v10 = a3;
  [(PSUIBadgeView *)badgeView setHidden:0];
  [(UILabel *)self->_nameLabel setHidden:0];
  [(UILabel *)self->_numberLabel setHidden:0];
  [(PSUIBadgeView *)self->_centeredBadgeView setHidden:1];
  [(UILabel *)self->_centeredNameLabel setHidden:1];
  [(PSUIBadgeView *)self->_badgeView setText:v10];
  [(UILabel *)self->_nameLabel setText:v11];
  [(UILabel *)self->_numberLabel setText:v9];

  [(PSUIBadgeView *)self->_centeredBadgeView setText:v10];
  [(UILabel *)self->_centeredNameLabel setText:v11];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PSUICellularPlanOptionTableCell;
  [(PSTableCell *)&v19 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:*MEMORY[0x263F60290]];
  v6 = [v4 propertyForKey:*MEMORY[0x263F5FFE8]];
  id v7 = +[PSUICoreTelephonySubscriberCache sharedInstance];
  uint64_t v8 = [v7 shortLabel:v5];
  id v9 = (void *)v8;
  id v10 = &stru_26D410CA0;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  id v11 = v10;

  if (v6)
  {
    v12 = NSString;
    v13 = [v6 userLabel];
    v14 = [v13 label];
    v15 = [v12 stringWithFormat:@"%@", v14];

    v16 = +[PSUICoreTelephonyCallCache sharedInstance];
    v17 = [v6 phoneNumber];
    v18 = [v16 localizedPhoneNumber:v17 context:v5];

    if ([v18 length]) {
      [(PSUICellularPlanOptionTableCell *)self _setBadge:v11 andLabel:v15 andPhoneNumber:v18];
    }
    else {
      [(PSUICellularPlanOptionTableCell *)self _setCenteredBadge:v11 andLabel:v15];
    }
    -[PSUICellularPlanOptionTableCell setCellEnabled:](self, "setCellEnabled:", [v6 isSelected]);
  }
  else
  {
    v15 = [v4 name];
    [(PSUICellularPlanOptionTableCell *)self _setCenteredText:v15];
  }

  [(PSUICellularPlanOptionTableCell *)self setNeedsLayout];
}

- (void)setCellEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[PSUICellularPlanOptionTableCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  v5 = [(PSUICellularPlanOptionTableCell *)self badgeView];
  [v5 setEnabled:v3];

  v6 = [(PSUICellularPlanOptionTableCell *)self nameLabel];
  [v6 setEnabled:v3];

  id v7 = [(PSUICellularPlanOptionTableCell *)self numberLabel];
  [v7 setEnabled:v3];

  uint64_t v8 = [(PSUICellularPlanOptionTableCell *)self centeredBadgeView];
  [v8 setEnabled:v3];

  id v9 = [(PSUICellularPlanOptionTableCell *)self centeredNameLabel];
  [v9 setEnabled:v3];

  id v10 = [(PSUICellularPlanOptionTableCell *)self contentView];
  id v12 = v10;
  double v11 = 0.5;
  if (v3) {
    double v11 = 1.0;
  }
  [v10 setAlpha:v11];
}

- (id)textLabel
{
  return 0;
}

- (id)detailTextLabel
{
  return 0;
}

- (PSUIBadgeView)badgeView
{
  return (PSUIBadgeView *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setBadgeView:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)numberLabel
{
  return self->_numberLabel;
}

- (void)setNumberLabel:(id)a3
{
}

- (PSUIBadgeView)centeredBadgeView
{
  return self->_centeredBadgeView;
}

- (void)setCenteredBadgeView:(id)a3
{
}

- (UILabel)centeredNameLabel
{
  return self->_centeredNameLabel;
}

- (void)setCenteredNameLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centeredNameLabel, 0);
  objc_storeStrong((id *)&self->_centeredBadgeView, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end