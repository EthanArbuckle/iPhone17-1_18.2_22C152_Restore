@interface ICQUsageDetailHeader
+ (double)usageDetailHeaderHeight;
- (ICQUsageDetailHeader)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setLabelTextAndIconWithSpecifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation ICQUsageDetailHeader

+ (double)usageDetailHeaderHeight
{
  int v2 = PSIsiPad();
  double result = 88.0;
  if (v2) {
    return 118.0;
  }
  return result;
}

- (ICQUsageDetailHeader)initWithFrame:(CGRect)a3
{
  v52[1] = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)ICQUsageDetailHeader;
  v3 = -[ICQUsageDetailHeader initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    horizontalStack = v3->_horizontalStack;
    v3->_horizontalStack = (UIStackView *)v4;

    [(UIStackView *)v3->_horizontalStack setAlignment:3];
    uint64_t v6 = objc_opt_new();
    verticalStack = v3->_verticalStack;
    v3->_verticalStack = (UIStackView *)v6;

    [(UIStackView *)v3->_verticalStack setAxis:1];
    LODWORD(v8) = 1148846080;
    [(UIStackView *)v3->_verticalStack setContentHuggingPriority:1 forAxis:v8];
    [(UIStackView *)v3->_verticalStack setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_horizontalStack setTranslatesAutoresizingMaskIntoConstraints:0];
    id v9 = objc_alloc(MEMORY[0x263F828E0]);
    double v10 = *MEMORY[0x263F001A8];
    double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = (UILabel *)v14;

    [(UILabel *)v3->_nameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = PreferencesTableViewHeaderFont();
    [(UILabel *)v3->_nameLabel setFont:v16];

    v17 = PreferencesTableViewHeaderColor();
    [(UILabel *)v3->_nameLabel setTextColor:v17];

    v18 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v3->_nameLabel setBackgroundColor:v18];

    [(UIStackView *)v3->_verticalStack addArrangedSubview:v3->_nameLabel];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
    versionLabel = v3->_versionLabel;
    v3->_versionLabel = (UILabel *)v19;

    [(UILabel *)v3->_versionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = PreferencesTableViewHeaderFont();
    [(UILabel *)v3->_versionLabel setFont:v21];

    v22 = PreferencesTableViewHeaderColor();
    [(UILabel *)v3->_versionLabel setTextColor:v22];

    v23 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v3->_versionLabel setBackgroundColor:v23];

    [(UIStackView *)v3->_verticalStack addArrangedSubview:v3->_versionLabel];
    uint64_t v24 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
    sizeLabel = v3->_sizeLabel;
    v3->_sizeLabel = (UILabel *)v24;

    [(UILabel *)v3->_sizeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = PreferencesTableViewHeaderFont();
    [(UILabel *)v3->_sizeLabel setFont:v26];

    v27 = PreferencesTableViewHeaderColor();
    [(UILabel *)v3->_sizeLabel setTextColor:v27];

    v28 = [MEMORY[0x263F825C8] clearColor];
    [(UILabel *)v3->_sizeLabel setBackgroundColor:v28];

    [(UIStackView *)v3->_verticalStack addArrangedSubview:v3->_sizeLabel];
    uint64_t v29 = objc_opt_new();
    appIcon = v3->_appIcon;
    v3->_appIcon = (UIImageView *)v29;

    [(UIImageView *)v3->_appIcon setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v31) = 1148846080;
    [(UIImageView *)v3->_appIcon setContentHuggingPriority:1 forAxis:v31];
    LODWORD(v32) = 1148846080;
    [(UIImageView *)v3->_appIcon setContentHuggingPriority:0 forAxis:v32];
    [(UIStackView *)v3->_horizontalStack addArrangedSubview:v3->_appIcon];
    [(UIStackView *)v3->_horizontalStack addArrangedSubview:v3->_verticalStack];
    [(UIStackView *)v3->_horizontalStack setSpacing:15.0];
    [(ICQUsageDetailHeader *)v3 addSubview:v3->_horizontalStack];
    v33 = _NSDictionaryOfVariableBindings(&cfstr_VerticalstackH.isa, v3->_verticalStack, v3->_horizontalStack, 0);
    v34 = [(UIStackView *)v3->_horizontalStack leadingAnchor];
    v35 = [(ICQUsageDetailHeader *)v3 leadingAnchor];
    uint64_t v36 = [v34 constraintEqualToAnchor:v35];
    leadingMargin = v3->_leadingMargin;
    v3->_leadingMargin = (NSLayoutConstraint *)v36;

    [(NSLayoutConstraint *)v3->_leadingMargin setActive:1];
    v38 = (void *)MEMORY[0x263F08938];
    v39 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"H:[_horizontalStack]-|" options:0 metrics:0 views:v33];
    [v38 activateConstraints:v39];

    v40 = (void *)MEMORY[0x263F08938];
    v51 = @"topPadding";
    v41 = NSNumber;
    int v42 = PSIsiPad();
    double v43 = 19.0;
    if (v42) {
      double v43 = 29.0;
    }
    v44 = [v41 numberWithDouble:v43];
    v52[0] = v44;
    v45 = [NSDictionary dictionaryWithObjects:v52 forKeys:&v51 count:1];
    v46 = [v40 constraintsWithVisualFormat:@"V:|-(topPadding)-[_horizontalStack]-|" options:0 metrics:v45 views:v33];
    [v40 activateConstraints:v46];

    v47 = [(ICQUsageDetailHeader *)v3 heightAnchor];
    [(id)objc_opt_class() usageDetailHeaderHeight];
    v48 = objc_msgSend(v47, "constraintEqualToConstant:");
    [v48 setActive:1];
  }
  return v3;
}

- (void)setName:(id)a3
{
}

- (void)setLabelTextAndIconWithSpecifier:(id)a3
{
  id v27 = a3;
  uint64_t v4 = [v27 name];
  v5 = [v4 uppercaseString];
  [(UILabel *)self->_nameLabel setText:v5];

  uint64_t v6 = [v27 propertyForKey:@"SIZE_VALUE"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v8 = v27;
  if (isKindOfClass)
  {
    id v9 = [v27 propertyForKey:@"SIZE_TITLE"];
    double v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      double v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v11 = [v12 localizedStringForKey:@"SIZE" value:&stru_26DFF2C90 table:@"Usage Statistics"];
    }
    double v13 = NSString;
    uint64_t v14 = objc_msgSend(MEMORY[0x263F086F0], "stringFromByteCount:countStyle:", objc_msgSend(v6, "longLongValue"), 2);
    v15 = [v13 stringWithFormat:@"%@ %@", v11, v14];
    [(UILabel *)self->_sizeLabel setText:v15];

    double v8 = v27;
  }
  v16 = [v8 propertyForKey:@"VERSION"];
  uint64_t v17 = [v16 length];
  if (v17)
  {
    v18 = NSString;
    uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v20 = [v19 localizedStringForKey:@"VERSION" value:&stru_26DFF2C90 table:@"Usage Statistics"];
    v21 = [v18 stringWithFormat:@"%@ %@", v20, v16];
    p_versionLabel = &self->_versionLabel;
    [(UILabel *)self->_versionLabel setText:v21];
  }
  else
  {
    p_versionLabel = &self->_versionLabel;
    [(UILabel *)self->_versionLabel setText:0];
  }
  [(UILabel *)*p_versionLabel setHidden:v17 == 0];
  v23 = (void *)MEMORY[0x263F827E8];
  uint64_t v24 = [v27 identifier];
  v25 = [MEMORY[0x263F82B60] mainScreen];
  [v25 scale];
  v26 = objc_msgSend(v23, "_applicationIconImageForBundleIdentifier:format:scale:", v24, 2);
  [(UIImageView *)self->_appIcon setImage:v26];
}

- (void)layoutSubviews
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_leadingMargin, 0);
  objc_storeStrong((id *)&self->_verticalStack, 0);
  objc_storeStrong((id *)&self->_horizontalStack, 0);
  objc_storeStrong((id *)&self->_appIcon, 0);
  objc_storeStrong((id *)&self->_sizeLabel, 0);
  objc_storeStrong((id *)&self->_versionLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
}

@end