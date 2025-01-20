@interface UGCUserInformationCell
- (BOOL)wantsButtonShapes;
- (UGCUserInformationCell)initWithEmphasis:(int64_t)a3;
- (UGCUserInformationCellDelegate)delegate;
- (UGCUserInformationViewModel)viewModel;
- (UIColor)primaryColor;
- (UIColor)secondaryColor;
- (UIFont)primaryFont;
- (UIFont)secondaryFont;
- (id)_createPrimaryLabelWithEmail:(id)a3 location:(id)a4;
- (id)_createUserInfoLabelWithEmail:(id)a3 location:(id)a4;
- (id)_inlineRatingsDisclosureStringWithFont:(id)a3 attributes:(id)a4;
- (int64_t)emphasis;
- (void)_didTapLegalAttribution;
- (void)_setupConstraints;
- (void)_setupSubviews;
- (void)_updateAppearance;
- (void)_updatePrimaryLabel;
- (void)_updateSecondaryLabel;
- (void)setDelegate:(id)a3;
- (void)setOverallFont:(id)a3 overallColor:(id)a4;
- (void)setPrimaryColor:(id)a3;
- (void)setPrimaryFont:(id)a3;
- (void)setSecondaryColor:(id)a3;
- (void)setSecondaryFont:(id)a3;
- (void)setViewModel:(id)a3;
- (void)setWantsButtonShapes:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateLayoutMarginsForIsInsetGrouped:(BOOL)a3;
@end

@implementation UGCUserInformationCell

- (UGCUserInformationCell)initWithEmphasis:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)UGCUserInformationCell;
  v4 = -[UGCPOIEnrichmentEditorCell initWithFrame:](&v8, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    [(UGCUserInformationCell *)v4 setAccessibilityIdentifier:v6];

    v4->_emphasis = a3;
    [(UGCUserInformationCell *)v4 _setupSubviews];
    [(UGCUserInformationCell *)v4 _setupConstraints];
  }
  return v4;
}

- (void)_setupSubviews
{
  [(UGCUserInformationCell *)self setPreservesSuperviewLayoutMargins:1];
  id v3 = objc_alloc((Class)UIImageView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v7 = [v3 initWithFrame:CGRectMake(0, y, width, height)];
  userImageView = self->_userImageView;
  self->_userImageView = v7;

  [(UIImageView *)self->_userImageView setAccessibilityIdentifier:@"UserImageView"];
  [(UGCUserInformationCell *)self addSubview:self->_userImageView];
  v9 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  userNameLabel = self->_userNameLabel;
  self->_userNameLabel = v9;

  [(UILabel *)self->_userNameLabel setNumberOfLines:0];
  if (MapsFeature_IsEnabled_ARPCommunityID()) {
    +[UGCFontManager userInfoPrimaryLabelFontCommunityID];
  }
  else {
  v11 = +[UGCFontManager userInfoPrimaryLabelFont];
  }
  [(UILabel *)self->_userNameLabel setFont:v11];

  if (MapsFeature_IsEnabled_ARPCommunityID()) {
    +[UIColor secondaryLabelColor];
  }
  else {
  v12 = +[UIColor labelColor];
  }
  [(UILabel *)self->_userNameLabel setTextColor:v12];

  [(UILabel *)self->_userNameLabel setAccessibilityIdentifier:@"UserNameLabel"];
  [(UILabel *)self->_userNameLabel setAdjustsFontForContentSizeCategory:1];
  [(UGCUserInformationCell *)self addSubview:self->_userNameLabel];
  v13 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  userInfoLabel = self->_userInfoLabel;
  self->_userInfoLabel = v13;

  [(UILabel *)self->_userInfoLabel setNumberOfLines:0];
  v15 = +[UIColor secondaryLabelColor];
  [(UILabel *)self->_userInfoLabel setTextColor:v15];

  [(UILabel *)self->_userInfoLabel setAccessibilityIdentifier:@"UserInfoLabel"];
  [(UGCUserInformationCell *)self addSubview:self->_userInfoLabel];
  if (self->_emphasis == 1)
  {
    id v16 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_didTapLegalAttribution"];
    [(UGCUserInformationCell *)self addGestureRecognizer:v16];
    MURegisterForButtonShapeEnablementChanges();
  }

  [(UGCUserInformationCell *)self updateLayoutMarginsForIsInsetGrouped:0];
}

- (void)_setupConstraints
{
  id v3 = [objc_alloc((Class)MUCompositionalStackLayoutGroup) initWithAxis:1];
  userInfoLabel = self->_userInfoLabel;
  v21[0] = self->_userNameLabel;
  v21[1] = userInfoLabel;
  v5 = +[NSArray arrayWithObjects:v21 count:2];
  [v3 setArrangedLayoutItems:v5];

  [v3 setSpacing:1.0];
  id v6 = [objc_alloc((Class)MUCompositionalStackLayoutGroup) initWithAxis:0];
  [v6 setAlignment:2];
  [v6 setAlignmentBoundsContent:1];
  LODWORD(v7) = 1112276992;
  [v6 setAlignmentFittingSizePriority:v7];
  [v6 setSpacing:16.0];
  if (self->_emphasis == 1 && MapsFeature_IsEnabled_ARPCommunityID())
  {
    id v20 = v3;
    objc_super v8 = +[NSArray arrayWithObjects:&v20 count:1];
    [v6 setArrangedLayoutItems:v8];

    id v9 = objc_alloc((Class)MUCompositionalStackLayout);
    v10 = [(UGCUserInformationCell *)self layoutMarginsGuide];
    id v11 = [v9 initWithContainer:v10 group:v6];

    id v19 = v11;
    id v12 = +[NSArray arrayWithObjects:&v19 count:1];
    +[NSLayoutConstraint _mapsui_activateLayouts:v12];
  }
  else
  {
    id v11 = [objc_alloc((Class)MUSizeLayout) initWithItem:self->_userImageView size:34.0, 34.0];
    v18[0] = self->_userImageView;
    v18[1] = v3;
    v13 = +[NSArray arrayWithObjects:v18 count:2];
    [v6 setArrangedLayoutItems:v13];

    id v14 = objc_alloc((Class)MUCompositionalStackLayout);
    v15 = [(UGCUserInformationCell *)self layoutMarginsGuide];
    id v12 = [v14 initWithContainer:v15 group:v6];

    v17[0] = v11;
    v17[1] = v12;
    id v16 = +[NSArray arrayWithObjects:v17 count:2];
    +[NSLayoutConstraint _mapsui_activateLayouts:v16];
  }
}

- (void)setViewModel:(id)a3
{
  id v5 = a3;
  if ((-[UGCUserInformationViewModel isEqual:](self->_viewModel, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_viewModel, a3);
    [(UGCUserInformationCell *)self _updateAppearance];
  }
}

- (void)_updateAppearance
{
  id v3 = [(UGCUserInformationViewModel *)self->_viewModel userIcon];
  [(UIImageView *)self->_userImageView setImage:v3];

  [(UGCUserInformationCell *)self _updatePrimaryLabel];

  [(UGCUserInformationCell *)self _updateSecondaryLabel];
}

- (void)_updatePrimaryLabel
{
  int64_t emphasis = self->_emphasis;
  if (emphasis == 1)
  {
    id v6 = [(UGCUserInformationViewModel *)self->_viewModel userEmail];
    v4 = [(UGCUserInformationViewModel *)self->_viewModel userCurrentLocation];
    id v5 = [(UGCUserInformationCell *)self _createPrimaryLabelWithEmail:v6 location:v4];
    [(UILabel *)self->_userNameLabel setText:v5];
  }
  else
  {
    if (emphasis) {
      return;
    }
    id v6 = [(UGCUserInformationViewModel *)self->_viewModel userName];
    -[UILabel setText:](self->_userNameLabel, "setText:");
  }
}

- (void)_updateSecondaryLabel
{
  id v3 = [(UGCUserInformationCell *)self secondaryFont];
  [(UILabel *)self->_userInfoLabel setFont:v3];

  v4 = [(UGCUserInformationCell *)self secondaryFont];
  id v5 = [(UGCUserInformationCell *)self secondaryColor];
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  double v7 = v6;
  if (v4) {
    [v6 setObject:v4 forKeyedSubscript:NSFontAttributeName];
  }
  if ([(UGCUserInformationCell *)self wantsButtonShapes] && UIAccessibilityButtonShapesEnabled()) {
    [v7 setObject:&off_1013A9058 forKeyedSubscript:NSUnderlineStyleAttributeName];
  }
  if (v5) {
    [v7 setObject:v5 forKeyedSubscript:NSForegroundColorAttributeName];
  }
  int64_t emphasis = self->_emphasis;
  if (emphasis == 1)
  {
    uint64_t v14 = [(UGCUserInformationCell *)self _inlineRatingsDisclosureStringWithFont:v4 attributes:v7];
  }
  else if (emphasis)
  {
    uint64_t v14 = 0;
  }
  else
  {
    id v9 = [(UGCUserInformationViewModel *)self->_viewModel userEmail];
    v10 = [(UGCUserInformationViewModel *)self->_viewModel userCurrentLocation];
    id v11 = [(UGCUserInformationCell *)self _createUserInfoLabelWithEmail:v9 location:v10];

    if ([v11 length])
    {
      id v12 = objc_alloc((Class)NSAttributedString);
      id v13 = [v7 copy];
      id v15 = [v12 initWithString:v11 attributes:v13];
    }
    else
    {
      id v15 = 0;
    }

    uint64_t v14 = (uint64_t)v15;
  }
  id v16 = (id)v14;
  [(UILabel *)self->_userInfoLabel setAttributedText:v14];
}

- (void)_didTapLegalAttribution
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained userInformationCellDidSelectLegalAttribution:self];
}

- (void)setPrimaryFont:(id)a3
{
}

- (UIFont)primaryFont
{
  return [(UILabel *)self->_userNameLabel font];
}

- (void)setSecondaryFont:(id)a3
{
  id v5 = (UIFont *)a3;
  if (self->_secondaryFont != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_secondaryFont, a3);
    [(UGCUserInformationCell *)self _updateSecondaryLabel];
    id v5 = v6;
  }
}

- (UIFont)secondaryFont
{
  secondaryFont = self->_secondaryFont;
  if (secondaryFont)
  {
    id v3 = secondaryFont;
  }
  else
  {
    id v3 = +[UGCFontManager userInfoSecondaryLabelFont];
  }

  return v3;
}

- (UIColor)primaryColor
{
  return [(UILabel *)self->_userNameLabel textColor];
}

- (void)setPrimaryColor:(id)a3
{
}

- (UIColor)secondaryColor
{
  secondaryColor = self->_secondaryColor;
  if (secondaryColor)
  {
    id v3 = secondaryColor;
  }
  else
  {
    id v3 = +[UIColor secondaryLabelColor];
  }

  return v3;
}

- (void)setSecondaryColor:(id)a3
{
  id v5 = (UIColor *)a3;
  if (self->_secondaryColor != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_secondaryColor, a3);
    [(UGCUserInformationCell *)self _updateSecondaryLabel];
    id v5 = v6;
  }
}

- (void)setWantsButtonShapes:(BOOL)a3
{
  if (self->_wantsButtonShapes != a3)
  {
    self->_wantsButtonShapes = a3;
    [(UGCUserInformationCell *)self _updateSecondaryLabel];
  }
}

- (id)_createUserInfoLabelWithEmail:(id)a3 location:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = objc_opt_new();
  if ([v6 length]) {
    [v7 addObject:v6];
  }
  if ([v5 length]) {
    [v7 addObject:v5];
  }
  objc_super v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@" • " value:@"localized string not found" table:0];
  v10 = [v7 componentsJoinedByString:v9];

  return v10;
}

- (id)_createPrimaryLabelWithEmail:(id)a3 location:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = objc_opt_new();
  if ([v5 length]) {
    [v7 addObject:v5];
  }
  if ([v6 length]) {
    [v7 addObject:v6];
  }
  objc_super v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@" • " value:@"localized string not found" table:0];
  v10 = [v7 componentsJoinedByString:v9];

  return v10;
}

- (id)_inlineRatingsDisclosureStringWithFont:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(UGCUserInformationViewModel *)self->_viewModel legalDisclosureString];
  id v9 = [v8 length];

  if (v9)
  {
    v10 = +[NSBundle mainBundle];
    v23 = [v10 localizedStringForKey:@"%@ %@ [Legal attribution badge format]" value:@"localized string not found" table:0];

    id v11 = [objc_alloc((Class)NSAttributedString) initWithString:v23 attributes:v7];
    id v12 = objc_alloc((Class)NSAttributedString);
    id v13 = [(UGCUserInformationViewModel *)self->_viewModel legalDisclosureString];
    id v14 = [v12 initWithString:v13 attributes:v7];

    id v15 = objc_alloc_init((Class)NSTextAttachment);
    id v16 = +[UIImageSymbolConfiguration configurationWithFont:v6 scale:1];
    v17 = +[UIImage systemImageNamed:@"chevron.forward"];
    v18 = [v17 imageWithConfiguration:v16];
    id v19 = [v18 imageWithRenderingMode:2];
    [v15 setImage:v19];

    id v20 = +[NSAttributedString attributedStringWithAttachment:v15];
    v21 = +[NSAttributedString localizedAttributedStringWithFormat:options:](NSAttributedString, "localizedAttributedStringWithFormat:options:", v11, 2, v14, v20);
  }
  else
  {
    v21 = objc_opt_new();
  }

  return v21;
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)UGCUserInformationCell;
  id v4 = a3;
  [(UGCUserInformationCell *)&v9 traitCollectionDidChange:v4];
  id v5 = [(UGCUserInformationCell *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8) {
    [(UGCUserInformationCell *)self _updateFonts];
  }
}

- (UGCUserInformationCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCUserInformationCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)emphasis
{
  return self->_emphasis;
}

- (UGCUserInformationViewModel)viewModel
{
  return self->_viewModel;
}

- (BOOL)wantsButtonShapes
{
  return self->_wantsButtonShapes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryColor, 0);
  objc_storeStrong((id *)&self->_secondaryFont, 0);
  objc_storeStrong((id *)&self->_userInfoLabel, 0);
  objc_storeStrong((id *)&self->_userNameLabel, 0);

  objc_storeStrong((id *)&self->_userImageView, 0);
}

- (void)setOverallFont:(id)a3 overallColor:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  [(UGCUserInformationCell *)self setPrimaryFont:v6];
  [(UGCUserInformationCell *)self setSecondaryFont:v6];

  [(UGCUserInformationCell *)self setPrimaryColor:v7];
  [(UGCUserInformationCell *)self setSecondaryColor:v7];
}

- (void)updateLayoutMarginsForIsInsetGrouped:(BOOL)a3
{
  if (a3)
  {
    double v4 = 0.0;
    double v5 = 16.0;
    double v6 = 16.0;
  }
  else
  {
    if (MapsFeature_IsEnabled_ARPCommunityID()) {
      double v5 = 0.0;
    }
    else {
      double v5 = 12.0;
    }
    if (MapsFeature_IsEnabled_ARPCommunityID()) {
      double v4 = 32.0;
    }
    else {
      double v4 = 0.0;
    }
    double v6 = 4.0;
  }

  -[UGCUserInformationCell setDirectionalLayoutMargins:](self, "setDirectionalLayoutMargins:", v5, v4, v6, 0.0);
}

@end