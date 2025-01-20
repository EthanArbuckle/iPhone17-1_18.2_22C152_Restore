@interface RoutePlanningAddStopCell
- (BOOL)isEnabled;
- (RoutePlanningAddStopCell)init;
- (void)_setEnabled:(BOOL)a3;
- (void)_updateConstraints;
- (void)_updateFonts;
- (void)_updateIconImage;
- (void)setEnabled:(BOOL)a3;
- (void)setIconViewTag:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoutePlanningAddStopCell

- (RoutePlanningAddStopCell)init
{
  v67.receiver = self;
  v67.super_class = (Class)RoutePlanningAddStopCell;
  v2 = [(RoutePlanningAddStopCell *)&v67 initWithStyle:0 reuseIdentifier:0];
  if (v2)
  {
    v3 = +[UIColor tertiarySystemFillColor];
    [(RoutePlanningAddStopCell *)v2 setBackgroundColor:v3];

    [(RoutePlanningAddStopCell *)v2 setAccessibilityIdentifier:@"RoutePlanningAddStopCell"];
    v4 = objc_opt_new();
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(RoutePlanningAddStopCell *)v2 contentView];
    [v5 addSubview:v4];

    uint64_t v6 = objc_opt_new();
    iconView = v2->_iconView;
    v2->_iconView = (UIImageView *)v6;

    [(UIImageView *)v2->_iconView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v2->_iconView setContentMode:1];
    v8 = [(RoutePlanningAddStopCell *)v2 traitCollection];
    v9 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleTitle2 weight:v8 compatibleWithTraitCollection:UIFontWeightBold];
    v10 = +[UIImageSymbolConfiguration configurationWithFont:v9];
    [(UIImageView *)v2->_iconView setPreferredSymbolConfiguration:v10];

    [(UIImageView *)v2->_iconView setAccessibilityIdentifier:@"RoutePlanningAddStopCellIconView"];
    [v4 addSubview:v2->_iconView];
    uint64_t v11 = objc_opt_new();
    titleLabel = v2->_titleLabel;
    v2->_titleLabel = (UILabel *)v11;

    [(UILabel *)v2->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v2->_titleLabel setAccessibilityIdentifier:@"RoutePlanningAddStopCellTitleLabel"];
    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"[RoutePlanning] Add Stop" value:@"localized string not found" table:0];
    [(UILabel *)v2->_titleLabel setText:v14];

    [(RoutePlanningAddStopCell *)v2 _updateFonts];
    v15 = [(RoutePlanningAddStopCell *)v2 contentView];
    [v15 addSubview:v2->_titleLabel];

    if (sub_1000BBB44(v2) == 5) {
      double v16 = 13.0;
    }
    else {
      double v16 = 20.0;
    }
    uint64_t v17 = sub_1000BBB44(v2);
    double v18 = 14.0;
    if (v17 == 5) {
      double v18 = 9.0;
    }
    double v19 = v16 + v18 * 2.0;
    v20 = [v4 widthAnchor];
    uint64_t v21 = [v20 constraintEqualToConstant:v19];
    imageContainerViewWidthConstraint = v2->_imageContainerViewWidthConstraint;
    v2->_imageContainerViewWidthConstraint = (NSLayoutConstraint *)v21;

    v23 = [(UIImageView *)v2->_iconView widthAnchor];
    uint64_t v24 = [v23 constraintEqualToConstant:v16];
    iconViewWidthConstraint = v2->_iconViewWidthConstraint;
    v2->_iconViewWidthConstraint = (NSLayoutConstraint *)v24;

    v26 = [(UIImageView *)v2->_iconView heightAnchor];
    uint64_t v27 = [v26 constraintEqualToConstant:v16];
    iconViewHeightConstraint = v2->_iconViewHeightConstraint;
    v2->_iconViewHeightConstraint = (NSLayoutConstraint *)v27;

    v63 = [v4 leadingAnchor];
    v64 = [(RoutePlanningAddStopCell *)v2 contentView];
    v62 = [v64 leadingAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v68[0] = v61;
    v59 = [v4 topAnchor];
    v60 = [(RoutePlanningAddStopCell *)v2 contentView];
    v58 = [v60 topAnchor];
    v56 = [v59 constraintEqualToAnchor:v58];
    v68[1] = v56;
    v54 = [v4 bottomAnchor];
    v55 = [(RoutePlanningAddStopCell *)v2 contentView];
    v53 = [v55 bottomAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v68[2] = v52;
    v68[3] = v2->_imageContainerViewWidthConstraint;
    v51 = [(UIImageView *)v2->_iconView centerXAnchor];
    v50 = [v4 centerXAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v68[4] = v49;
    v48 = [(UIImageView *)v2->_iconView centerYAnchor];
    v57 = v4;
    v47 = [v4 centerYAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v68[5] = v46;
    v68[6] = v2->_iconViewWidthConstraint;
    v68[7] = v2->_iconViewHeightConstraint;
    v45 = [(UILabel *)v2->_titleLabel leadingAnchor];
    v44 = [v4 trailingAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v68[8] = v43;
    v41 = [(UILabel *)v2->_titleLabel topAnchor];
    v42 = [(RoutePlanningAddStopCell *)v2 contentView];
    v40 = [v42 topAnchor];
    v39 = [v41 constraintEqualToAnchor:v40];
    v68[9] = v39;
    v29 = [(UILabel *)v2->_titleLabel bottomAnchor];
    v30 = [(RoutePlanningAddStopCell *)v2 contentView];
    v31 = [v30 bottomAnchor];
    v32 = [v29 constraintEqualToAnchor:v31];
    v68[10] = v32;
    v33 = [(UILabel *)v2->_titleLabel trailingAnchor];
    v34 = [(RoutePlanningAddStopCell *)v2 contentView];
    v35 = [v34 trailingAnchor];
    v36 = [v33 constraintEqualToAnchor:v35 constant:-10.0];
    v68[11] = v36;
    v37 = +[NSArray arrayWithObjects:v68 count:12];
    +[NSLayoutConstraint activateConstraints:v37];

    [(RoutePlanningAddStopCell *)v2 _setEnabled:1];
    [(RoutePlanningAddStopCell *)v2 _updateConstraints];
    [(RoutePlanningAddStopCell *)v2 _updateIconImage];
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_100A7D4CC;
    v65[3] = &unk_1012E5D08;
    v66 = v2;
    +[UIView performWithoutAnimation:v65];
  }
  return v2;
}

- (void)setIconViewTag:(int64_t)a3
{
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RoutePlanningAddStopCell;
  [(RoutePlanningAddStopCell *)&v13 traitCollectionDidChange:v4];
  v5 = [v4 preferredContentSizeCategory];
  uint64_t v6 = [(RoutePlanningAddStopCell *)self traitCollection];
  v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    [(RoutePlanningAddStopCell *)self _updateFonts];
    [(RoutePlanningAddStopCell *)self _updateConstraints];
  }
  [v4 displayScale];
  double v9 = v8;
  v10 = [(RoutePlanningAddStopCell *)self traitCollection];
  [v10 displayScale];
  double v12 = vabdd_f64(v9, v11);

  if (v12 > 2.22044605e-16) {
    [(RoutePlanningAddStopCell *)self _updateIconImage];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3) {
    -[RoutePlanningAddStopCell _setEnabled:](self, "_setEnabled:");
  }
}

- (void)_setEnabled:(BOOL)a3
{
  self->_enabled = a3;
  if (a3)
  {
    id v4 = +[UIColor systemBlueColor];
    [(UIImageView *)self->_iconView setTintColor:v4];

    +[UIColor systemBlueColor];
  }
  else
  {
    v5 = +[UIColor tertiaryLabelColor];
    [(UIImageView *)self->_iconView setTintColor:v5];

    +[UIColor tertiaryLabelColor];
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->_titleLabel setTextColor:v6];
}

- (void)_updateFonts
{
  id v5 = [(RoutePlanningAddStopCell *)self traitCollection];
  v3 = [v5 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityLarge];
  id v4 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v3];
  [(UILabel *)self->_titleLabel setFont:v4];
}

- (void)_updateConstraints
{
  v3 = [(RoutePlanningAddStopCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, UIContentSizeCategoryExtraExtraExtraLarge);

  uint64_t v6 = sub_1000BBB44(self);
  double v7 = 30.0;
  if (v5 == NSOrderedAscending) {
    double v7 = 20.0;
  }
  if (v6 == 5) {
    double v8 = 13.0;
  }
  else {
    double v8 = v7;
  }
  uint64_t v9 = sub_1000BBB44(self);
  double v10 = 14.0;
  if (v9 == 5) {
    double v10 = 9.0;
  }
  [(NSLayoutConstraint *)self->_imageContainerViewWidthConstraint setConstant:v8 + v10 * 2.0];
  [(NSLayoutConstraint *)self->_iconViewWidthConstraint setConstant:v8];
  iconViewHeightConstraint = self->_iconViewHeightConstraint;

  [(NSLayoutConstraint *)iconViewHeightConstraint setConstant:v8];
}

- (void)_updateIconImage
{
  id v5 = +[GEOFeatureStyleAttributes addStopStyleAttributes];
  v3 = [(RoutePlanningAddStopCell *)self traitCollection];
  [v3 displayScale];
  id v4 = +[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v5, 0, 0);
  [(UIImageView *)self->_iconView setImage:v4];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_iconViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageContainerViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_iconView, 0);
}

@end