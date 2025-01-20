@interface TPSSubscriptionPickerCell
+ (int64_t)cellStyle;
- (TPBadgeView)badgeView;
- (TPBadgeView)centeredBadgeView;
- (TPSSubscriptionPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UILabel)centeredNameLabel;
- (UILabel)nameLabel;
- (UILabel)numberLabel;
- (void)_setBadge:(id)a3 andLabel:(id)a4 andPhoneNumber:(id)a5;
- (void)_setCenteredBadge:(id)a3 andLabel:(id)a4;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setBadgeView:(id)a3;
- (void)setCenteredBadgeView:(id)a3;
- (void)setCenteredNameLabel:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNumberLabel:(id)a3;
@end

@implementation TPSSubscriptionPickerCell

+ (int64_t)cellStyle
{
  return 3;
}

- (TPSSubscriptionPickerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v93[14] = *MEMORY[0x1E4F143B8];
  v92.receiver = self;
  v92.super_class = (Class)TPSSubscriptionPickerCell;
  v4 = [(TPSSubscriptionPickerCell *)&v92 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FADA00]) initWithTitle:&stru_1F40BEF98 theme:7];
    badgeView = v4->_badgeView;
    v4->_badgeView = (TPBadgeView *)v5;

    v7 = [(TPSSubscriptionPickerCell *)v4 contentView];
    v8 = [(TPSSubscriptionPickerCell *)v4 badgeView];
    [v7 addSubview:v8];

    [(TPBadgeView *)v4->_badgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(TPSSubscriptionPickerCell *)v4 badgeView];
    v10 = [v9 leadingAnchor];
    v11 = [(TPSSubscriptionPickerCell *)v4 contentView];
    v12 = [v11 layoutMarginsGuide];
    v13 = [v12 leadingAnchor];
    v91 = [v10 constraintEqualToAnchor:v13];

    v14 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v14;

    uint64_t v16 = *MEMORY[0x1E4FB28C8];
    v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v4->_nameLabel setFont:v17];

    [(UILabel *)v4->_nameLabel setNumberOfLines:2];
    [(UILabel *)v4->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v18 = [(TPSSubscriptionPickerCell *)v4 contentView];
    [v18 addSubview:v4->_nameLabel];

    v19 = [(UILabel *)v4->_nameLabel firstBaselineAnchor];
    v20 = [(TPSSubscriptionPickerCell *)v4 contentView];
    v21 = [v20 topAnchor];
    v90 = [v19 constraintEqualToSystemSpacingBelowAnchor:v21 multiplier:1.0];

    v22 = [(UILabel *)v4->_nameLabel leadingAnchor];
    v23 = [(TPSSubscriptionPickerCell *)v4 badgeView];
    v24 = [v23 trailingAnchor];
    v25 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    [v25 scaledValueForValue:4.0];
    v89 = objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24);

    v26 = [(TPSSubscriptionPickerCell *)v4 badgeView];
    v27 = [v26 centerYAnchor];
    v28 = [(UILabel *)v4->_nameLabel centerYAnchor];
    v88 = [v27 constraintEqualToAnchor:v28];

    v29 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    numberLabel = v4->_numberLabel;
    v4->_numberLabel = v29;

    v31 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    [(UILabel *)v4->_numberLabel setFont:v31];

    [(UILabel *)v4->_numberLabel setNumberOfLines:2];
    [(UILabel *)v4->_numberLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UILabel *)v4->_numberLabel setTextColor:v32];

    v33 = [(TPSSubscriptionPickerCell *)v4 contentView];
    [v33 addSubview:v4->_numberLabel];

    v34 = [(UILabel *)v4->_numberLabel firstBaselineAnchor];
    v35 = [(UILabel *)v4->_nameLabel lastBaselineAnchor];
    v87 = [v34 constraintEqualToSystemSpacingBelowAnchor:v35 multiplier:1.0];

    v36 = [(UILabel *)v4->_numberLabel leadingAnchor];
    v37 = [(TPSSubscriptionPickerCell *)v4 badgeView];
    v38 = [v37 leadingAnchor];
    v86 = [v36 constraintEqualToAnchor:v38];

    v39 = [(UILabel *)v4->_numberLabel trailingAnchor];
    v40 = [(TPSSubscriptionPickerCell *)v4 contentView];
    v41 = [v40 layoutMarginsGuide];
    v42 = [v41 trailingAnchor];
    v85 = [v39 constraintLessThanOrEqualToAnchor:v42];

    v43 = [(TPSSubscriptionPickerCell *)v4 contentView];
    v44 = [v43 bottomAnchor];
    v45 = [(UILabel *)v4->_numberLabel lastBaselineAnchor];
    v84 = [v44 constraintEqualToSystemSpacingBelowAnchor:v45 multiplier:1.0];

    uint64_t v46 = [objc_alloc(MEMORY[0x1E4FADA00]) initWithTitle:&stru_1F40BEF98 theme:7];
    centeredBadgeView = v4->_centeredBadgeView;
    v4->_centeredBadgeView = (TPBadgeView *)v46;

    v48 = [(TPSSubscriptionPickerCell *)v4 contentView];
    v49 = [(TPSSubscriptionPickerCell *)v4 centeredBadgeView];
    [v48 addSubview:v49];

    [(TPBadgeView *)v4->_centeredBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    v50 = [(TPSSubscriptionPickerCell *)v4 centeredBadgeView];
    v51 = [v50 leadingAnchor];
    v52 = [(TPSSubscriptionPickerCell *)v4 contentView];
    v53 = [v52 layoutMarginsGuide];
    v54 = [v53 leadingAnchor];
    v83 = [v51 constraintEqualToAnchor:v54];

    v55 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    centeredNameLabel = v4->_centeredNameLabel;
    v4->_centeredNameLabel = v55;

    v57 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v16];
    [(UILabel *)v4->_centeredNameLabel setFont:v57];

    [(UILabel *)v4->_centeredNameLabel setNumberOfLines:2];
    [(UILabel *)v4->_centeredNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v58 = [(TPSSubscriptionPickerCell *)v4 contentView];
    [v58 addSubview:v4->_centeredNameLabel];

    v59 = [(UILabel *)v4->_centeredNameLabel centerYAnchor];
    v60 = [(TPSSubscriptionPickerCell *)v4 contentView];
    v61 = [v60 centerYAnchor];
    v82 = [v59 constraintEqualToAnchor:v61];

    v62 = [(UILabel *)v4->_centeredNameLabel leadingAnchor];
    v63 = [(TPSSubscriptionPickerCell *)v4 centeredBadgeView];
    v64 = [v63 trailingAnchor];
    v65 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    [v65 scaledValueForValue:4.0];
    v81 = objc_msgSend(v62, "constraintEqualToAnchor:constant:", v64);

    v66 = [(TPSSubscriptionPickerCell *)v4 centeredBadgeView];
    v67 = [v66 centerYAnchor];
    v68 = [(UILabel *)v4->_centeredNameLabel centerYAnchor];
    v80 = [v67 constraintEqualToAnchor:v68];

    v69 = [(UILabel *)v4->_nameLabel trailingAnchor];
    v70 = [(TPSSubscriptionPickerCell *)v4 contentView];
    v71 = [v70 trailingAnchor];
    v79 = [v69 constraintLessThanOrEqualToAnchor:v71];

    v72 = [(UILabel *)v4->_centeredNameLabel trailingAnchor];
    v73 = [(TPSSubscriptionPickerCell *)v4 contentView];
    v74 = [v73 trailingAnchor];
    v75 = [v72 constraintLessThanOrEqualToAnchor:v74];

    v76 = (void *)MEMORY[0x1E4F28DC8];
    v93[0] = v91;
    v93[1] = v90;
    v93[2] = v89;
    v93[3] = v88;
    v93[4] = v87;
    v93[5] = v86;
    v93[6] = v85;
    v93[7] = v84;
    v93[8] = v83;
    v93[9] = v82;
    v93[10] = v81;
    v93[11] = v80;
    v93[12] = v79;
    v93[13] = v75;
    v77 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:14];
    [v76 activateConstraints:v77];
  }
  return v4;
}

- (void)_setCenteredBadge:(id)a3 andLabel:(id)a4
{
  badgeView = self->_badgeView;
  id v8 = a4;
  id v7 = a3;
  [(TPBadgeView *)badgeView setHidden:1];
  [(UILabel *)self->_nameLabel setHidden:1];
  [(UILabel *)self->_numberLabel setHidden:1];
  [(TPBadgeView *)self->_centeredBadgeView setHidden:0];
  [(UILabel *)self->_centeredNameLabel setHidden:0];
  [(TPBadgeView *)self->_badgeView setTitle:v7];
  [(UILabel *)self->_nameLabel setText:v8];
  [(UILabel *)self->_numberLabel setText:@"+1 (123) 456-7890"];
  [(TPBadgeView *)self->_centeredBadgeView setTitle:v7];

  [(UILabel *)self->_centeredNameLabel setText:v8];
}

- (void)_setBadge:(id)a3 andLabel:(id)a4 andPhoneNumber:(id)a5
{
  badgeView = self->_badgeView;
  id v9 = a5;
  id v11 = a4;
  id v10 = a3;
  [(TPBadgeView *)badgeView setHidden:0];
  [(UILabel *)self->_nameLabel setHidden:0];
  [(UILabel *)self->_numberLabel setHidden:0];
  [(TPBadgeView *)self->_centeredBadgeView setHidden:1];
  [(UILabel *)self->_centeredNameLabel setHidden:1];
  [(TPBadgeView *)self->_badgeView setTitle:v10];
  [(UILabel *)self->_nameLabel setText:v11];
  [(UILabel *)self->_numberLabel setText:v9];

  [(TPBadgeView *)self->_centeredBadgeView setTitle:v10];
  [(UILabel *)self->_centeredNameLabel setText:v11];
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)TPSSubscriptionPickerCell;
  id v4 = a3;
  [(PSTableCell *)&v10 refreshCellContentsWithSpecifier:v4];
  uint64_t v5 = objc_msgSend(v4, "propertyForKey:", *MEMORY[0x1E4F93210], v10.receiver, v10.super_class);

  v6 = objc_msgSend(v5, "tps_localizedShortLabel");
  id v7 = [v5 label];
  id v8 = objc_msgSend(v5, "tps_localizedPhoneNumber");
  id v9 = TPSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v12 = "-[TPSSubscriptionPickerCell refreshCellContentsWithSpecifier:]";
    __int16 v13 = 2112;
    v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1E4DD4000, v9, OS_LOG_TYPE_DEFAULT, "%s : Received badge: %@, label: %@, phoneNumber: %@", buf, 0x2Au);
  }

  if ([v8 length]) {
    [(TPSSubscriptionPickerCell *)self _setBadge:v6 andLabel:v7 andPhoneNumber:v8];
  }
  else {
    [(TPSSubscriptionPickerCell *)self _setCenteredBadge:v6 andLabel:v7];
  }
  [(TPSSubscriptionPickerCell *)self setNeedsLayout];
}

- (TPBadgeView)badgeView
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

- (TPBadgeView)centeredBadgeView
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