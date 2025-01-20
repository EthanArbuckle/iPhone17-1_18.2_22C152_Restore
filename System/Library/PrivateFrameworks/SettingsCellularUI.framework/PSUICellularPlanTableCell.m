@interface PSUICellularPlanTableCell
+ (int64_t)cellStyle;
- (BOOL)canBeChecked;
- (BOOL)canReload;
- (PSUIBadgeView)badgeView;
- (PSUIBadgeView)centeredBadgeView;
- (PSUICellularPlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)centeredNameLabel;
- (UILabel)nameLabel;
- (UILabel)numberLabel;
- (UILabel)statusLabel;
- (id)detailTextLabel;
- (id)textLabel;
- (void)_setBadge:(id)a3 andLabel:(id)a4 andPhoneNumber:(id)a5;
- (void)_setCenteredBadge:(id)a3 andLabel:(id)a4;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setCenteredBadgeView:(id)a3;
- (void)setCenteredNameLabel:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNumberLabel:(id)a3;
- (void)setStatusLabel:(id)a3;
@end

@implementation PSUICellularPlanTableCell

+ (int64_t)cellStyle
{
  return 3;
}

- (PSUICellularPlanTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v107.receiver = self;
  v107.super_class = (Class)PSUICellularPlanTableCell;
  v4 = [(PSUICellularPlanTableCell *)&v107 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v106.receiver = v4;
    v106.super_class = (Class)PSUICellularPlanTableCell;
    v6 = [(PSUICellularPlanTableCell *)&v106 textLabel];
    [v6 setText:@"ABC"];

    v105.receiver = v5;
    v105.super_class = (Class)PSUICellularPlanTableCell;
    v7 = [(PSUICellularPlanTableCell *)&v105 detailTextLabel];
    [v7 setText:@"XYZ"];

    v104.receiver = v5;
    v104.super_class = (Class)PSUICellularPlanTableCell;
    v8 = [(PSUICellularPlanTableCell *)&v104 textLabel];
    [v8 removeFromSuperview];

    v103.receiver = v5;
    v103.super_class = (Class)PSUICellularPlanTableCell;
    v9 = [(PSUICellularPlanTableCell *)&v103 detailTextLabel];
    [v9 removeFromSuperview];

    v102.receiver = v5;
    v102.super_class = (Class)PSUICellularPlanTableCell;
    v10 = [(PSUICellularPlanTableCell *)&v102 textLabel];
    [v10 setHidden:1];

    v101.receiver = v5;
    v101.super_class = (Class)PSUICellularPlanTableCell;
    v11 = [(PSUICellularPlanTableCell *)&v101 detailTextLabel];
    [v11 setHidden:1];

    [(PSUICellularPlanTableCell *)v5 setAccessoryType:1];
    v12 = objc_alloc_init(PSUIBadgeView);
    badgeView = v5->_badgeView;
    v5->_badgeView = v12;

    v14 = [(PSUICellularPlanTableCell *)v5 contentView];
    [v14 addSubview:v5->_badgeView];

    v15 = [(PSUIBadgeView *)v5->_badgeView leadingAnchor];
    v16 = [(PSUICellularPlanTableCell *)v5 contentView];
    v17 = [v16 layoutMarginsGuide];
    v18 = [v17 leadingAnchor];
    v19 = [v15 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    v20 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    nameLabel = v5->_nameLabel;
    v5->_nameLabel = v20;

    uint64_t v100 = *MEMORY[0x263F83570];
    v22 = objc_msgSend(MEMORY[0x263F81708], "preferredFontForTextStyle:");
    [(UILabel *)v5->_nameLabel setFont:v22];

    [(UILabel *)v5->_nameLabel setNumberOfLines:0];
    [(UILabel *)v5->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(PSUICellularPlanTableCell *)v5 contentView];
    [v23 addSubview:v5->_nameLabel];

    v24 = [(UILabel *)v5->_nameLabel firstBaselineAnchor];
    v25 = [(PSUICellularPlanTableCell *)v5 contentView];
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

    v35 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    numberLabel = v5->_numberLabel;
    v5->_numberLabel = v35;

    v37 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
    [(UILabel *)v5->_numberLabel setFont:v37];

    [(UILabel *)v5->_numberLabel setNumberOfLines:0];
    [(UILabel *)v5->_numberLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v38 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UILabel *)v5->_numberLabel setTextColor:v38];

    v39 = [(PSUICellularPlanTableCell *)v5 contentView];
    [v39 addSubview:v5->_numberLabel];

    v40 = [(UILabel *)v5->_numberLabel firstBaselineAnchor];
    v41 = [(UILabel *)v5->_nameLabel lastBaselineAnchor];
    v42 = [v40 constraintEqualToSystemSpacingBelowAnchor:v41 multiplier:1.0];
    [v42 setActive:1];

    v43 = [(UILabel *)v5->_numberLabel leadingAnchor];
    v44 = [(PSUIBadgeView *)v5->_badgeView leadingAnchor];
    v45 = [v43 constraintEqualToAnchor:v44];
    [v45 setActive:1];

    v46 = [(UILabel *)v5->_numberLabel trailingAnchor];
    v47 = [(PSUICellularPlanTableCell *)v5 contentView];
    v48 = [v47 layoutMarginsGuide];
    v49 = [v48 trailingAnchor];
    v50 = [v46 constraintLessThanOrEqualToAnchor:v49];
    [v50 setActive:1];

    v51 = [(PSUICellularPlanTableCell *)v5 contentView];
    v52 = [v51 bottomAnchor];
    v53 = [(UILabel *)v5->_numberLabel lastBaselineAnchor];
    v54 = [v52 constraintEqualToSystemSpacingBelowAnchor:v53 multiplier:1.0];
    [v54 setActive:1];

    v55 = objc_alloc_init(PSUIBadgeView);
    centeredBadgeView = v5->_centeredBadgeView;
    v5->_centeredBadgeView = v55;

    v57 = [(PSUICellularPlanTableCell *)v5 contentView];
    [v57 addSubview:v5->_centeredBadgeView];

    v58 = [(PSUIBadgeView *)v5->_centeredBadgeView leadingAnchor];
    v59 = [(PSUICellularPlanTableCell *)v5 contentView];
    v60 = [v59 layoutMarginsGuide];
    v61 = [v60 leadingAnchor];
    v62 = [v58 constraintEqualToAnchor:v61];
    [v62 setActive:1];

    v63 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    centeredNameLabel = v5->_centeredNameLabel;
    v5->_centeredNameLabel = v63;

    v65 = [MEMORY[0x263F81708] preferredFontForTextStyle:v100];
    [(UILabel *)v5->_centeredNameLabel setFont:v65];

    [(UILabel *)v5->_centeredNameLabel setNumberOfLines:0];
    [(UILabel *)v5->_centeredNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v66 = [(PSUICellularPlanTableCell *)v5 contentView];
    [v66 addSubview:v5->_centeredNameLabel];

    v67 = [(UILabel *)v5->_centeredNameLabel centerYAnchor];
    v68 = [(PSUICellularPlanTableCell *)v5 contentView];
    v69 = [v68 centerYAnchor];
    v70 = [v67 constraintEqualToAnchor:v69];
    [v70 setActive:1];

    v71 = [(UILabel *)v5->_centeredNameLabel leadingAnchor];
    v72 = [(PSUIBadgeView *)v5->_centeredBadgeView trailingAnchor];
    v73 = [MEMORY[0x263F82770] defaultMetrics];
    [v73 scaledValueForValue:4.0];
    v74 = objc_msgSend(v71, "constraintEqualToAnchor:constant:", v72);
    [v74 setActive:1];

    v75 = [(PSUIBadgeView *)v5->_centeredBadgeView centerYAnchor];
    v76 = [(UILabel *)v5->_centeredNameLabel centerYAnchor];
    v77 = [v75 constraintEqualToAnchor:v76];
    [v77 setActive:1];

    v78 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    statusLabel = v5->_statusLabel;
    v5->_statusLabel = v78;

    v80 = [MEMORY[0x263F81708] preferredFontForTextStyle:v100];
    [(UILabel *)v5->_statusLabel setFont:v80];

    [(UILabel *)v5->_statusLabel setNumberOfLines:0];
    v81 = [MEMORY[0x263F825C8] systemGrayColor];
    [(UILabel *)v5->_statusLabel setTextColor:v81];

    [(UILabel *)v5->_statusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v82 = [(PSUICellularPlanTableCell *)v5 contentView];
    [v82 addSubview:v5->_statusLabel];

    v83 = [(UILabel *)v5->_statusLabel centerYAnchor];
    v84 = [(PSUICellularPlanTableCell *)v5 contentView];
    v85 = [v84 centerYAnchor];
    v86 = [v83 constraintEqualToAnchor:v85];
    [v86 setActive:1];

    v87 = [(UILabel *)v5->_statusLabel trailingAnchor];
    v88 = [(PSUICellularPlanTableCell *)v5 contentView];
    v89 = [v88 layoutMarginsGuide];
    v90 = [v89 trailingAnchor];
    v91 = [v87 constraintEqualToAnchor:v90];
    [v91 setActive:1];

    LODWORD(v92) = 1148846080;
    [(UILabel *)v5->_statusLabel setContentCompressionResistancePriority:0 forAxis:v92];
    v93 = [(UILabel *)v5->_statusLabel leadingAnchor];
    v94 = [(UILabel *)v5->_nameLabel trailingAnchor];
    v95 = [v93 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v94 multiplier:1.0];
    [v95 setActive:1];

    v96 = [(UILabel *)v5->_statusLabel leadingAnchor];
    v97 = [(UILabel *)v5->_centeredNameLabel trailingAnchor];
    v98 = [v96 constraintGreaterThanOrEqualToSystemSpacingAfterAnchor:v97 multiplier:1.0];
    [v98 setActive:1];
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
  v22.receiver = self;
  v22.super_class = (Class)PSUICellularPlanTableCell;
  [(PSTableCell *)&v22 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:*MEMORY[0x263F5FFF0]];
  v6 = +[PSUICellularPlanManagerCache sharedInstance];
  id v7 = [v6 planFromReference:v5];

  v8 = [v4 propertyForKey:*MEMORY[0x263F60290]];
  id v9 = +[PSUICoreTelephonySubscriberCache sharedInstance];
  uint64_t v10 = [v9 shortLabel:v8];
  id v11 = (void *)v10;
  v12 = &stru_26D410CA0;
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v13 = v12;

  v14 = NSString;
  v15 = [v7 userLabel];
  v16 = [v15 label];
  v17 = [v14 stringWithFormat:@"%@", v16];

  v18 = +[PSUICoreTelephonyCallCache sharedInstance];
  v19 = [v7 phoneNumber];
  v20 = [v18 localizedPhoneNumber:v19 context:v8];

  if ([v20 length]) {
    [(PSUICellularPlanTableCell *)self _setBadge:v13 andLabel:v17 andPhoneNumber:v20];
  }
  else {
    [(PSUICellularPlanTableCell *)self _setCenteredBadge:v13 andLabel:v17];
  }

  if ([v4 hasValidGetter])
  {
    v21 = [v4 performGetter];
    if (v21)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(UILabel *)self->_statusLabel setText:v21];
      }
    }
  }
  [(PSUICellularPlanTableCell *)self setNeedsLayout];
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
  return self->_badgeView;
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

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
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
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
}

@end