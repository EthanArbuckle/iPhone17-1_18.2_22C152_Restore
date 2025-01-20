@interface NavShareETACell
- (BOOL)isStandaloneSharingSuggestion;
- (MSPSharedTripContact)contact;
- (NavShareETACell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NavShareETACellDelegate)delegate;
- (double)heightForWidth:(double)a3;
- (unint64_t)sharingState;
- (void)_updateCapabilityContent;
- (void)_updateContactContent;
- (void)_updateFonts;
- (void)_updateSharingContent;
- (void)_updateSharingRingAnimated:(BOOL)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)layoutSubviews;
- (void)setCapabilityType:(unint64_t)a3 serviceName:(id)a4;
- (void)setContact:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsStandaloneSharingSuggestion:(BOOL)a3;
- (void)setSharingState:(unint64_t)a3 animated:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateConfigurationUsingState:(id)a3;
@end

@implementation NavShareETACell

- (NavShareETACell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v128.receiver = self;
  v128.super_class = (Class)NavShareETACell;
  v4 = [(NavShareETACell *)&v128 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(NavShareETACell *)v4 setAccessibilityIdentifier:v6];

    v127 = +[UIBackgroundConfiguration listCellConfiguration];
    [v127 setCornerRadius:10.0];
    [(NavShareETACell *)v4 setBackgroundConfiguration:v127];
    v7 = [(NavShareETACell *)v4 contentView];
    [v7 setAccessibilityIdentifier:@"NavShareETACellContent"];

    uint64_t v8 = +[CAShapeLayer layer];
    circleLayer = v4->_circleLayer;
    v4->_circleLayer = (CAShapeLayer *)v8;

    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 60.0, 60.0, 60.0);
    id v10 = objc_claimAutoreleasedReturnValue();
    -[CAShapeLayer setPath:](v4->_circleLayer, "setPath:", [v10 CGPath]);

    id v11 = +[UIColor clearColor];
    -[CAShapeLayer setFillColor:](v4->_circleLayer, "setFillColor:", [v11 CGColor]);

    id v12 = +[UIColor systemBlueColor];
    -[CAShapeLayer setStrokeColor:](v4->_circleLayer, "setStrokeColor:", [v12 CGColor]);

    [(CAShapeLayer *)v4->_circleLayer setLineWidth:2.0];
    v13 = [(NavShareETACell *)v4 contentView];
    v14 = [v13 layer];
    [v14 insertSublayer:v4->_circleLayer atIndex:0];

    [(CAShapeLayer *)v4->_circleLayer setOpacity:0.0];
    [(CAShapeLayer *)v4->_circleLayer setStrokeEnd:0.0];
    uint64_t v15 = objc_opt_new();
    imageBackgroundView = v4->_imageBackgroundView;
    v4->_imageBackgroundView = (UIView *)v15;

    [(UIView *)v4->_imageBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(UIView *)v4->_imageBackgroundView layer];
    [v17 setCornerRadius:27.0];

    v18 = [(UIView *)v4->_imageBackgroundView layer];
    [v18 setMasksToBounds:1];

    v19 = +[UIColor tertiarySystemFillColor];
    [(UIView *)v4->_imageBackgroundView setBackgroundColor:v19];

    [(UIView *)v4->_imageBackgroundView setAccessibilityIdentifier:@"ImageBackgroundView"];
    v20 = [(NavShareETACell *)v4 contentView];
    [v20 addSubview:v4->_imageBackgroundView];

    uint64_t v21 = objc_opt_new();
    leadingImageView = v4->_leadingImageView;
    v4->_leadingImageView = (UIImageView *)v21;

    [(UIImageView *)v4->_leadingImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(UIImageView *)v4->_leadingImageView layer];
    [v23 setCornerRadius:27.0];

    v24 = +[UIColor systemBlueColor];
    [(UIImageView *)v4->_leadingImageView setTintColor:v24];

    [(UIImageView *)v4->_leadingImageView setAccessibilityIdentifier:@"LeadingImageView"];
    [(UIImageView *)v4->_leadingImageView setAccessibilityIgnoresInvertColors:1];
    [(UIView *)v4->_imageBackgroundView addSubview:v4->_leadingImageView];
    uint64_t v25 = objc_opt_new();
    badgeImageView = v4->_badgeImageView;
    v4->_badgeImageView = (UIImageView *)v25;

    [(UIImageView *)v4->_badgeImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v4->_badgeImageView setContentMode:1];
    [(UIImageView *)v4->_badgeImageView setAccessibilityIdentifier:@"BadgeImageView"];
    v27 = [(NavShareETACell *)v4 contentView];
    [v27 addSubview:v4->_badgeImageView];

    v28 = objc_opt_new();
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v28 setAccessibilityIdentifier:@"TextContainer"];
    v29 = [(NavShareETACell *)v4 contentView];
    [v29 addSubview:v28];

    uint64_t v30 = objc_opt_new();
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v30;

    [(UILabel *)v4->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_titleLabel setNumberOfLines:2];
    [(UILabel *)v4->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    [v28 addSubview:v4->_titleLabel];
    uint64_t v32 = objc_opt_new();
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v32;

    [(UILabel *)v4->_subtitleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4->_subtitleLabel setAccessibilityIdentifier:@"SubtitleLabel"];
    v34 = v28;
    [v28 addSubview:v4->_subtitleLabel];
    uint64_t v35 = objc_opt_new();
    smsLabel = v4->_smsLabel;
    v4->_smsLabel = (UILabel *)v35;

    [(UILabel *)v4->_smsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v37 = +[UIColor systemGreenColor];
    [(UILabel *)v4->_smsLabel setTextColor:v37];

    LODWORD(v38) = 1148846080;
    [(UILabel *)v4->_smsLabel setContentCompressionResistancePriority:1 forAxis:v38];
    LODWORD(v39) = 1148846080;
    [(UILabel *)v4->_smsLabel setContentCompressionResistancePriority:0 forAxis:v39];
    LODWORD(v40) = 1148846080;
    [(UILabel *)v4->_smsLabel setContentHuggingPriority:1 forAxis:v40];
    LODWORD(v41) = 1148846080;
    [(UILabel *)v4->_smsLabel setContentHuggingPriority:0 forAxis:v41];
    [(UILabel *)v4->_smsLabel setAccessibilityIdentifier:@"SMSLabel"];
    v42 = [(NavShareETACell *)v4 contentView];
    [v42 addSubview:v4->_smsLabel];

    v43 = [v28 centerYAnchor];
    v44 = [(NavShareETACell *)v4 contentView];
    v45 = [v44 centerYAnchor];
    uint64_t v46 = [v43 constraintEqualToAnchor:v45];
    textCenterConstraint = v4->_textCenterConstraint;
    v4->_textCenterConstraint = (NSLayoutConstraint *)v46;

    v48 = [(UILabel *)v4->_titleLabel centerYAnchor];
    v49 = [(NavShareETACell *)v4 contentView];
    v50 = [v49 centerYAnchor];
    uint64_t v51 = [v48 constraintEqualToAnchor:v50];
    titleCenterConstraint = v4->_titleCenterConstraint;
    v4->_titleCenterConstraint = (NSLayoutConstraint *)v51;

    v53 = [v34 trailingAnchor];
    v54 = [(UILabel *)v4->_smsLabel leadingAnchor];
    uint64_t v55 = [v53 constraintEqualToAnchor:v54 constant:-16.0];
    textTrailingConstrant = v4->_textTrailingConstrant;
    v4->_textTrailingConstrant = (NSLayoutConstraint *)v55;

    v125 = [(UIView *)v4->_imageBackgroundView leadingAnchor];
    v126 = [(NavShareETACell *)v4 contentView];
    v124 = [v126 leadingAnchor];
    v123 = [v125 constraintEqualToAnchor:v124 constant:12.0];
    v129[0] = v123;
    v122 = [(UIView *)v4->_imageBackgroundView widthAnchor];
    v121 = [v122 constraintEqualToConstant:54.0];
    v129[1] = v121;
    v119 = [(UIView *)v4->_imageBackgroundView centerYAnchor];
    v120 = [(NavShareETACell *)v4 contentView];
    v118 = [v120 centerYAnchor];
    v117 = [v119 constraintEqualToAnchor:v118];
    v129[2] = v117;
    v116 = [(UIView *)v4->_imageBackgroundView heightAnchor];
    v115 = [v116 constraintEqualToConstant:54.0];
    v129[3] = v115;
    v114 = [(UIImageView *)v4->_leadingImageView leadingAnchor];
    v113 = [(UIView *)v4->_imageBackgroundView leadingAnchor];
    v112 = [v114 constraintEqualToAnchor:v113];
    v129[4] = v112;
    v111 = [(UIImageView *)v4->_leadingImageView trailingAnchor];
    v110 = [(UIView *)v4->_imageBackgroundView trailingAnchor];
    v109 = [v111 constraintEqualToAnchor:v110];
    v129[5] = v109;
    v108 = [(UIImageView *)v4->_leadingImageView topAnchor];
    v107 = [(UIView *)v4->_imageBackgroundView topAnchor];
    v106 = [v108 constraintEqualToAnchor:v107];
    v129[6] = v106;
    v105 = [(UIImageView *)v4->_leadingImageView bottomAnchor];
    v104 = [(UIView *)v4->_imageBackgroundView bottomAnchor];
    v103 = [v105 constraintEqualToAnchor:v104];
    v129[7] = v103;
    v102 = [(UIImageView *)v4->_badgeImageView trailingAnchor];
    v101 = [(UIView *)v4->_imageBackgroundView trailingAnchor];
    v100 = [v102 constraintEqualToAnchor:v101 constant:2.0];
    v129[8] = v100;
    v99 = [(UIImageView *)v4->_badgeImageView bottomAnchor];
    v98 = [(UIView *)v4->_imageBackgroundView bottomAnchor];
    v96 = [v99 constraintEqualToAnchor:v98 constant:2.0];
    v129[9] = v96;
    v95 = [(UIImageView *)v4->_badgeImageView widthAnchor];
    v94 = [v95 constraintEqualToConstant:20.0];
    v129[10] = v94;
    v93 = [(UIImageView *)v4->_badgeImageView heightAnchor];
    v92 = [v93 constraintEqualToConstant:20.0];
    v129[11] = v92;
    v90 = [(UILabel *)v4->_smsLabel trailingAnchor];
    v91 = [(NavShareETACell *)v4 contentView];
    v88 = [v91 trailingAnchor];
    v87 = [v90 constraintEqualToAnchor:v88 constant:-16.0];
    v129[12] = v87;
    v85 = [(UILabel *)v4->_smsLabel centerYAnchor];
    v86 = [(NavShareETACell *)v4 contentView];
    v84 = [v86 centerYAnchor];
    v83 = [v85 constraintEqualToAnchor:v84];
    v129[13] = v83;
    v82 = [v34 leadingAnchor];
    v81 = [(UIView *)v4->_imageBackgroundView trailingAnchor];
    v80 = [v82 constraintEqualToAnchor:v81 constant:10.0];
    v129[14] = v80;
    v129[15] = v4->_textTrailingConstrant;
    v79 = [(UILabel *)v4->_titleLabel leadingAnchor];
    v78 = [v34 leadingAnchor];
    v77 = [v79 constraintEqualToAnchor:v78];
    v129[16] = v77;
    v76 = [(UILabel *)v4->_titleLabel trailingAnchor];
    v75 = [v34 trailingAnchor];
    v74 = [v76 constraintEqualToAnchor:v75];
    v129[17] = v74;
    v73 = [(UILabel *)v4->_titleLabel topAnchor];
    v72 = [v34 topAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v129[18] = v71;
    v129[19] = v4->_titleCenterConstraint;
    v97 = [(UILabel *)v4->_subtitleLabel leadingAnchor];
    v70 = [v34 leadingAnchor];
    v69 = [v97 constraintEqualToAnchor:v70];
    v129[20] = v69;
    v68 = [(UILabel *)v4->_subtitleLabel trailingAnchor];
    v57 = v34;
    v89 = v34;
    v58 = [v34 trailingAnchor];
    v59 = [v68 constraintEqualToAnchor:v58];
    v129[21] = v59;
    v60 = [(UILabel *)v4->_subtitleLabel topAnchor];
    v61 = [(UILabel *)v4->_titleLabel bottomAnchor];
    v62 = [v60 constraintEqualToAnchor:v61];
    v129[22] = v62;
    v63 = [(UILabel *)v4->_subtitleLabel bottomAnchor];
    v64 = [v57 bottomAnchor];
    v65 = [v63 constraintEqualToAnchor:v64];
    v129[23] = v65;
    v66 = +[NSArray arrayWithObjects:v129 count:24];
    +[NSLayoutConstraint activateConstraints:v66];

    [(NavShareETACell *)v4 _updateFonts];
    [(NavShareETACell *)v4 _updateContactContent];
    [(NavShareETACell *)v4 _updateCapabilityContent];
    [(NavShareETACell *)v4 setSharingState:0 animated:0];
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NavShareETACell;
  id v4 = a3;
  [(NavShareETACell *)&v8 traitCollectionDidChange:v4];
  v5 = [(NavShareETACell *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  id v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    [(NavShareETACell *)self _updateFonts];
    [(NavShareETACell *)self setNeedsUpdateConfiguration];
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)NavShareETACell;
  [(NavShareETACell *)&v6 layoutSubviews];
  [(UIView *)self->_imageBackgroundView frame];
  double v4 = v3 + -3.0;
  [(UIView *)self->_imageBackgroundView frame];
  -[CAShapeLayer setPosition:](self->_circleLayer, "setPosition:", v4, v5 + -3.0);
}

- (void)setContact:(id)a3
{
  id v5 = a3;
  unint64_t v6 = self->_contact;
  unint64_t v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    id v9 = (id)v7;
    unsigned __int8 v8 = [(id)v6 isEqual:v7];

    unint64_t v7 = (unint64_t)v9;
    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_contact, a3);
      [(NavShareETACell *)self _updateContactContent];
      unint64_t v7 = (unint64_t)v9;
    }
  }
}

- (void)setCapabilityType:(unint64_t)a3 serviceName:(id)a4
{
  id v12 = a4;
  if (self->_capabilityType != a3
    || (v6 = self->_serviceName, v7 = (unint64_t)v12, unsigned __int8 v8 = v12, v7 | v6)
    && (unsigned __int8 v9 = [(id)v6 isEqual:v7],
        (id)v7,
        (id)v6,
        unsigned __int8 v8 = v12,
        (v9 & 1) == 0))
  {
    self->_capabilityType = a3;
    sub_100ACAE20();
    id v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    serviceName = self->_serviceName;
    self->_serviceName = v10;

    [(NavShareETACell *)self _updateCapabilityContent];
    unsigned __int8 v8 = v12;
  }
}

- (void)setSharingState:(unint64_t)a3 animated:(BOOL)a4
{
  if (self->_sharingState != a3)
  {
    BOOL v4 = a4;
    self->_sharingState = a3;
    [(NavShareETACell *)self _updateSharingContent];
    [(NavShareETACell *)self _updateSharingRingAnimated:v4];
  }
}

- (void)setIsStandaloneSharingSuggestion:(BOOL)a3
{
  if (self->_isStandaloneSharingSuggestion != a3)
  {
    self->_isStandaloneSharingSuggestion = a3;
    [(NavShareETACell *)self _updateSharingContent];
  }
}

- (void)_updateFonts
{
  double v3 = [(NavShareETACell *)self traitCollection];
  BOOL v4 = [v3 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2 compatibleWithTraitCollection:v4];
  [(UILabel *)self->_titleLabel setFont:v5];

  unint64_t v6 = [(NavShareETACell *)self traitCollection];
  unint64_t v7 = [v6 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  unsigned __int8 v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v7];
  [(UILabel *)self->_subtitleLabel setFont:v8];

  id v11 = [(NavShareETACell *)self traitCollection];
  unsigned __int8 v9 = [v11 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraLarge];
  id v10 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline compatibleWithTraitCollection:v9];
  [(UILabel *)self->_smsLabel setFont:v10];
}

- (void)_updateContactContent
{
  double v3 = [(NavShareETACell *)self contact];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 displayName];
    [(UILabel *)self->_titleLabel setText:v5];

    unint64_t v6 = +[UIColor labelColor];
    [(UILabel *)self->_titleLabel setTextColor:v6];

    objc_initWeak(&location, self);
    unint64_t v7 = +[MapsUIImageCache sharedCache];
    unsigned __int8 v8 = [v4 contact];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100D8CE30;
    v15[3] = &unk_101300178;
    objc_copyWeak(&v17, &location);
    id v16 = v4;
    [v7 getImageForContact:v8 size:v15 completion:54.0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    unsigned __int8 v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"[SharedETA] Open Contacts" value:@"localized string not found" table:0];
    [(UILabel *)self->_titleLabel setText:v10];

    id v11 = +[UIColor systemBlueColor];
    [(UILabel *)self->_titleLabel setTextColor:v11];

    id v12 = +[UIImageSymbolConfiguration configurationWithPointSize:30.0];
    v13 = +[UIImage systemImageNamed:@"person.crop.circle.fill" withConfiguration:v12];
    v14 = [v13 imageWithRenderingMode:2];
    [(UIImageView *)self->_leadingImageView setImage:v14];

    [(UIImageView *)self->_leadingImageView setContentMode:4];
  }
}

- (void)_updateCapabilityContent
{
  unint64_t capabilityType = self->_capabilityType;
  if (capabilityType - 2 >= 2)
  {
    if (capabilityType == 4)
    {
      uint64_t v6 = MapsAppBundleId;
      unint64_t v7 = [(NavShareETACell *)self traitCollection];
      [v7 displayScale];
      unsigned __int8 v8 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v6, 0);
      [(UIImageView *)self->_badgeImageView setImage:v8];
    }
    else
    {
      [(UIImageView *)self->_badgeImageView setImage:0];
    }
  }
  else
  {
    BOOL v4 = [(NavShareETACell *)self traitCollection];
    [v4 displayScale];
    id v5 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.MobileSMS", 0);
    [(UIImageView *)self->_badgeImageView setImage:v5];
  }
  if (self->_capabilityType == 2 && self->_serviceName)
  {
    -[UILabel setText:](self->_smsLabel, "setText:");
    double v9 = -16.0;
  }
  else
  {
    [(UILabel *)self->_smsLabel setText:0];
    double v9 = 0.0;
  }
  textTrailingConstrant = self->_textTrailingConstrant;

  [(NSLayoutConstraint *)textTrailingConstrant setConstant:v9];
}

- (void)_updateSharingContent
{
  unint64_t v3 = [(NavShareETACell *)self sharingState];
  if (v3 - 2 < 2)
  {
    [(NSLayoutConstraint *)self->_titleCenterConstraint setActive:0];
    [(NSLayoutConstraint *)self->_textCenterConstraint setActive:1];
    unint64_t v7 = +[NSBundle mainBundle];
    unsigned __int8 v8 = [v7 localizedStringForKey:@"[Shared Trip] Already Sharing" value:@"localized string not found" table:0];
    [(UILabel *)self->_subtitleLabel setText:v8];

    uint64_t v6 = +[UIColor systemRedColor];
    goto LABEL_8;
  }
  if (v3 == 1)
  {
    [(NSLayoutConstraint *)self->_titleCenterConstraint setActive:0];
    [(NSLayoutConstraint *)self->_textCenterConstraint setActive:1];
    double v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"[Shared Trip] Just Started" value:@"localized string not found" table:0];
    [(UILabel *)self->_subtitleLabel setText:v10];

    uint64_t v6 = +[UIColor secondaryLabelColor];
    goto LABEL_8;
  }
  if (v3) {
    return;
  }
  if (self->_isStandaloneSharingSuggestion)
  {
    [(NSLayoutConstraint *)self->_titleCenterConstraint setActive:0];
    [(NSLayoutConstraint *)self->_textCenterConstraint setActive:1];
    BOOL v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"[Shared Trip] Start Sharing" value:@"localized string not found" table:0];
    [(UILabel *)self->_subtitleLabel setText:v5];

    uint64_t v6 = +[UIColor systemBlueColor];
LABEL_8:
    id v12 = (id)v6;
    [(UILabel *)self->_subtitleLabel setTextColor:v6];

    return;
  }
  [(NSLayoutConstraint *)self->_textCenterConstraint setActive:0];
  [(NSLayoutConstraint *)self->_titleCenterConstraint setActive:1];
  subtitleLabel = self->_subtitleLabel;

  [(UILabel *)subtitleLabel setText:0];
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v10 = a3;
  BOOL v4 = [(NavShareETACell *)self backgroundConfiguration];
  id v5 = [v4 updatedConfigurationForState:v10];

  uint64_t v6 = [(NavShareETACell *)self traitCollection];
  id v7 = [v6 userInterfaceStyle];

  if (([v10 isHighlighted] & 1) != 0 || objc_msgSend(v10, "isSelected"))
  {
    if (v7 == (id)2) {
      +[UIColor tertiarySystemGroupedBackgroundColor];
    }
    else {
    uint64_t v8 = +[UIColor systemLightMidGrayColor];
    }
  }
  else
  {
    uint64_t v8 = +[UIColor secondarySystemGroupedBackgroundColor];
  }
  double v9 = (void *)v8;
  [v5 setBackgroundColor:v8];

  [(NavShareETACell *)self setBackgroundConfiguration:v5];
}

- (double)heightForWidth:(double)a3
{
  id v5 = [(UILabel *)self->_smsLabel text];
  id v6 = [v5 length];

  if (v6)
  {
    -[UILabel sizeThatFits:](self->_smsLabel, "sizeThatFits:", a3, 78.0);
    double v8 = v7 + 16.0 + 16.0;
  }
  else
  {
    double v8 = 16.0;
  }
  double v9 = a3 + -76.0 - v8;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v9, 78.0);
  double v11 = v10;
  id v12 = [(UILabel *)self->_subtitleLabel text];
  if ([v12 length])
  {
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v9, 78.0);
    double v14 = ceil(v13);
  }
  else
  {
    double v14 = 0.0;
  }

  return fmax(ceil(v11) + 32.0 + v14, 78.0);
}

- (void)_updateSharingRingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(NavShareETACell *)self sharingState];
  if (v5 - 2 < 2)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(CAShapeLayer *)self->_circleLayer setStrokeEnd:1.0];
    LODWORD(v7) = 1.0;
    [(CAShapeLayer *)self->_circleLayer setOpacity:v7];
    +[CATransaction commit];
    circleLayer = self->_circleLayer;
LABEL_6:
    [(CAShapeLayer *)circleLayer removeAnimationForKey:@"drawCircleAnimation"];
    return;
  }
  if (v5 != 1)
  {
    if (v5) {
      return;
    }
    [(CAShapeLayer *)self->_circleLayer setOpacity:0.0];
    circleLayer = self->_circleLayer;
    goto LABEL_6;
  }
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(CAShapeLayer *)self->_circleLayer setStrokeEnd:0.0];
  LODWORD(v8) = 1.0;
  [(CAShapeLayer *)self->_circleLayer setOpacity:v8];
  +[CATransaction commit];
  double v9 = +[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  id v12 = v9;
  double v10 = 1.5;
  if (!v3) {
    double v10 = 0.0;
  }
  [v9 setDuration:v10];
  [v12 setToValue:&off_1013AB998];
  double v11 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v12 setTimingFunction:v11];

  [v12 setDelegate:self];
  [v12 setFillMode:kCAFillModeBoth];
  [v12 setRemovedOnCompletion:0];
  [(CAShapeLayer *)self->_circleLayer addAnimation:v12 forKey:@"drawCircleAnimation"];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    unint64_t v5 = [(NavShareETACell *)self delegate];
    [v5 cellDidFinishRingAnimation:self];
  }
  circleLayer = self->_circleLayer;

  [(CAShapeLayer *)circleLayer setDelegate:0];
}

- (NavShareETACellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NavShareETACellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MSPSharedTripContact)contact
{
  return self->_contact;
}

- (unint64_t)sharingState
{
  return self->_sharingState;
}

- (BOOL)isStandaloneSharingSuggestion
{
  return self->_isStandaloneSharingSuggestion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_textTrailingConstrant, 0);
  objc_storeStrong((id *)&self->_titleCenterConstraint, 0);
  objc_storeStrong((id *)&self->_textCenterConstraint, 0);
  objc_storeStrong((id *)&self->_smsLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_badgeImageView, 0);
  objc_storeStrong((id *)&self->_leadingImageView, 0);
  objc_storeStrong((id *)&self->_imageBackgroundView, 0);

  objc_storeStrong((id *)&self->_circleLayer, 0);
}

@end