@interface SearchHomeTipView
- (SearchHomeTipView)initWithFrame:(CGRect)a3;
- (UIButton)closeButton;
- (UIFont)defaultTitleFont;
- (UIFont)maxSupportedTitleFont;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (UIStackView)metadataStackView;
- (double)arrowBase;
- (double)arrowHeight;
- (double)arrowOffset;
- (void)setCloseButton:(id)a3;
- (void)setDefaultTitleFont:(id)a3;
- (void)setMaxSupportedTitleFont:(id)a3;
- (void)setMetadataStackView:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setupConstraints;
- (void)setupSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUI;
@end

@implementation SearchHomeTipView

- (SearchHomeTipView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SearchHomeTipView;
  v3 = -[SearchHomeTipView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleBody weight:UIFontWeightSemibold];
    [(SearchHomeTipView *)v3 setDefaultTitleFont:v4];

    [(SearchHomeTipView *)v3 setupSubviews];
  }
  return v3;
}

- (double)arrowHeight
{
  return 13.0;
}

- (double)arrowBase
{
  return 26.0;
}

- (double)arrowOffset
{
  return 0.0;
}

- (void)setupSubviews
{
  [(SearchHomeTipView *)self setShowBubbleIndicator:1];
  [(SearchHomeTipView *)self setCornerRadius:13.0];
  v3 = +[UIColor lightGrayColor];
  v4 = [(SearchHomeTipView *)self backgroundView];
  [v4 setBackgroundColor:v3];

  [(SearchHomeTipView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = objc_alloc((Class)UIStackView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
  [(SearchHomeTipView *)self setMetadataStackView:v9];

  v10 = [(SearchHomeTipView *)self metadataStackView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(SearchHomeTipView *)self metadataStackView];
  [v11 setAxis:1];

  v12 = [(SearchHomeTipView *)self metadataStackView];
  [v12 setDistribution:2];

  v13 = [(SearchHomeTipView *)self metadataStackView];
  [v13 setAlignment:1];

  v14 = [(SearchHomeTipView *)self metadataStackView];
  [v14 setSpacing:0.0];

  v15 = [(SearchHomeTipView *)self metadataStackView];
  [v15 setAccessibilityIdentifier:@"SearchHomeToolTipView"];

  v16 = [(SearchHomeTipView *)self metadataStackView];
  [(SearchHomeTipView *)self addSubview:v16];

  id v17 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(SearchHomeTipView *)self setTitleLabel:v17];

  v18 = [(SearchHomeTipView *)self titleLabel];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(SearchHomeTipView *)self titleLabel];
  [v19 setNumberOfLines:0];

  v20 = +[UIColor labelColor];
  v21 = [(SearchHomeTipView *)self titleLabel];
  [v21 setTextColor:v20];

  v22 = +[NSBundle mainBundle];
  v23 = [v22 localizedStringForKey:@"[Search Home] Search Tip Title" value:@"localized string not found" table:0];
  v24 = [(SearchHomeTipView *)self titleLabel];
  [v24 setText:v23];

  v25 = [(SearchHomeTipView *)self metadataStackView];
  v26 = [(SearchHomeTipView *)self titleLabel];
  [v25 addArrangedSubview:v26];

  id v27 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  [(SearchHomeTipView *)self setSubtitleLabel:v27];

  v28 = [(SearchHomeTipView *)self subtitleLabel];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

  v29 = [(SearchHomeTipView *)self subtitleLabel];
  [v29 setNumberOfLines:0];

  v30 = +[UIColor secondaryLabelColor];
  v31 = [(SearchHomeTipView *)self subtitleLabel];
  [v31 setTextColor:v30];

  v32 = +[NSBundle mainBundle];
  v33 = [v32 localizedStringForKey:@"[Search Home] Search Tip Subtitle" value:@"localized string not found" table:0];
  v34 = [(SearchHomeTipView *)self subtitleLabel];
  [v34 setText:v33];

  v35 = [(SearchHomeTipView *)self metadataStackView];
  v36 = [(SearchHomeTipView *)self subtitleLabel];
  [v35 addArrangedSubview:v36];

  v37 = +[UIButton buttonWithType:0];
  [(SearchHomeTipView *)self setCloseButton:v37];

  v38 = [(SearchHomeTipView *)self closeButton];
  [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

  v39 = [(SearchHomeTipView *)self closeButton];
  v40 = +[UIImage systemImageNamed:@"xmark"];
  [v39 setImage:v40 forState:0];

  v41 = [(SearchHomeTipView *)self closeButton];
  [v41 setUserInteractionEnabled:0];

  v42 = [(SearchHomeTipView *)self closeButton];
  [v42 setAccessibilityIdentifier:@"SearchHomeToolTipCloseButton"];

  v43 = [(SearchHomeTipView *)self closeButton];
  LODWORD(v44) = 1148846080;
  [v43 setContentHuggingPriority:0 forAxis:v44];

  v45 = [(SearchHomeTipView *)self closeButton];
  LODWORD(v46) = 1148846080;
  [v45 setContentCompressionResistancePriority:0 forAxis:v46];

  v47 = +[UIColor secondaryLabelColor];
  v48 = [(SearchHomeTipView *)self closeButton];
  [v48 setTintColor:v47];

  v49 = [(SearchHomeTipView *)self closeButton];
  [v49 _setTouchInsets:-10.0, -10.0, -10.0, -10.0];

  v50 = [(SearchHomeTipView *)self closeButton];
  [(SearchHomeTipView *)self addSubview:v50];

  [(SearchHomeTipView *)self setupConstraints];

  [(SearchHomeTipView *)self updateUI];
}

- (void)setupConstraints
{
  v28 = [(SearchHomeTipView *)self closeButton];
  id v27 = [v28 topAnchor];
  v26 = [(SearchHomeTipView *)self topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26 constant:20.0];
  v29[0] = v25;
  v24 = [(SearchHomeTipView *)self closeButton];
  v23 = [v24 trailingAnchor];
  v22 = [(SearchHomeTipView *)self trailingAnchor];
  v21 = [v23 constraintEqualToAnchor:v22 constant:-10.0];
  v29[1] = v21;
  v20 = [(SearchHomeTipView *)self metadataStackView];
  v19 = [v20 leadingAnchor];
  v18 = [(SearchHomeTipView *)self leadingAnchor];
  id v17 = [v19 constraintEqualToAnchor:v18 constant:10.0];
  v29[2] = v17;
  v16 = [(SearchHomeTipView *)self metadataStackView];
  v14 = [v16 trailingAnchor];
  v15 = [(SearchHomeTipView *)self closeButton];
  v13 = [v15 leadingAnchor];
  v3 = [v14 constraintEqualToAnchor:v13];
  v29[3] = v3;
  v4 = [(SearchHomeTipView *)self metadataStackView];
  id v5 = [v4 topAnchor];
  objc_super v6 = [(SearchHomeTipView *)self topAnchor];
  v7 = [v5 constraintEqualToAnchor:v6 constant:20.0];
  v29[4] = v7;
  v8 = [(SearchHomeTipView *)self metadataStackView];
  id v9 = [v8 bottomAnchor];
  v10 = [(SearchHomeTipView *)self bottomAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:-10.0];
  v29[5] = v11;
  v12 = +[NSArray arrayWithObjects:v29 count:6];
  +[NSLayoutConstraint activateConstraints:v12];
}

- (void)updateUI
{
  v3 = [(SearchHomeTipView *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  id v5 = [(SearchHomeTipView *)self backgroundView];
  if (v4 == (id)2) {
    +[UIColor secondarySystemGroupedBackgroundColor];
  }
  else {
  objc_super v6 = +[UIColor whiteColor];
  }
  [v5 setBackgroundColor:v6];

  v7 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleHeadline weight:0 contentSizeCategory:0 symbolicTraits:0.0];
  v8 = [(SearchHomeTipView *)self titleLabel];
  [v8 setFont:v7];

  id v10 = +[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:UIFontTextStyleSubheadline weight:0 contentSizeCategory:0x8000 symbolicTraits:0.0];
  id v9 = [(SearchHomeTipView *)self subtitleLabel];
  [v9 setFont:v10];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SearchHomeTipView;
  [(SearchHomeTipView *)&v11 traitCollectionDidChange:v4];
  id v5 = [(SearchHomeTipView *)self traitCollection];
  id v6 = [v5 userInterfaceStyle];
  if (v6 == [v4 userInterfaceStyle])
  {
    v7 = [(SearchHomeTipView *)self traitCollection];
    v8 = [v7 preferredContentSizeCategory];
    id v9 = [v4 preferredContentSizeCategory];
    NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v8, v9);

    if (v10 == NSOrderedSame) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  [(SearchHomeTipView *)self updateUI];
LABEL_6:
}

- (UIStackView)metadataStackView
{
  return self->_metadataStackView;
}

- (void)setMetadataStackView:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (UIFont)defaultTitleFont
{
  return self->_defaultTitleFont;
}

- (void)setDefaultTitleFont:(id)a3
{
}

- (UIFont)maxSupportedTitleFont
{
  return self->_maxSupportedTitleFont;
}

- (void)setMaxSupportedTitleFont:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSupportedTitleFont, 0);
  objc_storeStrong((id *)&self->_defaultTitleFont, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);

  objc_storeStrong((id *)&self->_metadataStackView, 0);
}

@end