@interface PHContactTableViewCell
+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3;
+ (UIEdgeInsets)tableViewContentInset;
+ (double)avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3;
+ (double)avatarLayoutGuideWidthAnchorLayoutConstraintConstant:(id)a3;
+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3;
+ (id)actionButtonImageForActionType:(id)a3;
+ (id)imageForActionType:(id)a3;
- (BOOL)hasAvatarView;
- (BOOL)tapTargets;
- (CNAvatarViewController)avatarViewController;
- (NSDirectionalEdgeInsets)rootViewLayoutMargins;
- (NSString)actionType;
- (NUIContainerGridView)gridView;
- (NUIContainerStackView)subtitleStackView;
- (TPAccessoryButton)actionButton;
- (TUFeatureFlags)featureFlags;
- (UIImage)actionButtonImage;
- (UIImageView)subtitleImageView;
- (UILayoutGuide)avatarLayoutGuide;
- (double)avatarLayoutGuideHeightAnchorLayoutConstraintConstant;
- (double)avatarLayoutGuideLeadingAnchorLayoutConstraintConstant;
- (double)avatarLayoutGuideWidthAnchorLayoutConstraintConstant;
- (double)subtitleLabelLeadingLayoutConstraintConstant;
- (id)actionButtonTappedHandler;
- (id)loadRootViewAndContentViews;
- (void)_updateLayout;
- (void)actionButtonTapped:(id)a3;
- (void)commonInit;
- (void)setActionButton:(id)a3;
- (void)setActionButtonImage:(id)a3;
- (void)setActionButtonTappedHandler:(id)a3;
- (void)setActionType:(id)a3;
- (void)setAvatarViewController:(id)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setGridView:(id)a3;
- (void)setHasAvatarView:(BOOL)a3;
- (void)setSubtitleStackView:(id)a3;
- (void)setTapTargets:(BOOL)a3;
- (void)updateFontsAndLayoutMetrics;
- (void)updateRootView;
@end

@implementation PHContactTableViewCell

+ (double)avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  return 16.0;
}

+ (double)avatarLayoutGuideWidthAnchorLayoutConstraintConstant:(id)a3
{
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  double result = 45.0;
  if (IsAccessibilityCategory) {
    return 0.0;
  }
  return result;
}

+ (double)titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:(id)a3
{
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  double result = 10.0;
  if (IsAccessibilityCategory) {
    return 0.0;
  }
  return result;
}

+ (UIEdgeInsets)separatorInsetForContentSizeCategory:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)TUFeatureFlags);
  double v6 = 0.0;
  if (([v5 phoneRecentsAvatarsEnabled] & 1) == 0)
  {
    [a1 avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:v4];
    double v6 = v7 + 0.0;
  }
  [a1 avatarLayoutGuideWidthAnchorLayoutConstraintConstant:v4];
  double v9 = v8;
  [a1 titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:v4];
  double v11 = v6 + v9 + v10;

  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v11;
  result.right = v14;
  result.bottom = v13;
  result.left = v15;
  result.top = v12;
  return result;
}

+ (UIEdgeInsets)tableViewContentInset
{
  id v2 = objc_alloc_init((Class)TUFeatureFlags);
  if ([v2 phoneRecentsAvatarsEnabled]) {
    double v3 = -12.0;
  }
  else {
    double v3 = 0.0;
  }

  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v7;
  return result;
}

+ (id)imageForActionType:(id)a3
{
  id v3 = a3;
  if ([CNActionTypeAudioCall isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage favoritesAudioGlyphImage];
LABEL_13:
    double v5 = (void *)v4;
    goto LABEL_14;
  }
  if ([CNActionTypeMail isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage favoritesMailGlyphImage];
    goto LABEL_13;
  }
  if ([CNActionTypeMessage isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage favoritesMessageGlyphImage];
    goto LABEL_13;
  }
  if ([CNActionTypeTTYCall isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage favoritesTTYDirectGlyphImage];
    goto LABEL_13;
  }
  if ([CNActionTypeTTYRelayCall isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage favoritesTTYRelayGlyphImage];
    goto LABEL_13;
  }
  if ([CNActionTypeVideoCall isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage favoritesVideoGlyphImage];
    goto LABEL_13;
  }
  double v5 = 0;
LABEL_14:

  return v5;
}

+ (id)actionButtonImageForActionType:(id)a3
{
  id v3 = a3;
  if ([CNActionTypeAudioCall isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage recentsAudioCallImage];
LABEL_10:
    double v5 = (void *)v4;
    goto LABEL_11;
  }
  if ([CNActionTypeMail isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage mailActionImage];
    goto LABEL_10;
  }
  if ([CNActionTypeMessage isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage messagesActionImage];
    goto LABEL_10;
  }
  if ([CNActionTypeTTYCall isEqualToString:v3]
    || [CNActionTypeTTYRelayCall isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage TTYActionImage];
    goto LABEL_10;
  }
  if ([CNActionTypeVideoCall isEqualToString:v3])
  {
    uint64_t v4 = +[UIImage recentsVideoCallImage];
    goto LABEL_10;
  }
  double v5 = 0;
LABEL_11:

  return v5;
}

- (TUFeatureFlags)featureFlags
{
  featureFlags = self->_featureFlags;
  if (!featureFlags)
  {
    uint64_t v4 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    double v5 = self->_featureFlags;
    self->_featureFlags = v4;

    featureFlags = self->_featureFlags;
  }

  return featureFlags;
}

- (void)commonInit
{
  actionType = self->_actionType;
  self->_actionType = 0;

  uint64_t v4 = [(PHContactTableViewCell *)self featureFlags];
  self->_tapTargets = [v4 recentsCallTapTargetsEnabled];

  v5.receiver = self;
  v5.super_class = (Class)PHContactTableViewCell;
  [(PHTableViewCell *)&v5 commonInit];
}

- (id)loadRootViewAndContentViews
{
  v24.receiver = self;
  v24.super_class = (Class)PHContactTableViewCell;
  id v3 = [(PHDoubleLineTableViewCell *)&v24 loadRootViewAndContentViews];
  [(PHContactTableViewCell *)self setAccessoryType:4];
  uint64_t v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  subtitleImageView = self->_subtitleImageView;
  self->_subtitleImageView = v4;

  double v6 = +[UIColor dynamicTertiaryLabelColor];
  [(UIImageView *)self->_subtitleImageView setTintColor:v6];

  [(UIImageView *)self->_subtitleImageView setUserInteractionEnabled:0];
  [(UIImageView *)self->_subtitleImageView setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  id v7 = objc_alloc((Class)NUIContainerStackView);
  double v8 = [(PHContactTableViewCell *)self subtitleImageView];
  v28[0] = v8;
  double v9 = [(PHTableViewCell *)self subtitleLabel];
  v28[1] = v9;
  double v10 = +[NSArray arrayWithObjects:v28 count:2];
  double v11 = (NUIContainerStackView *)[v7 initWithArrangedSubviews:v10];
  subtitleStackView = self->_subtitleStackView;
  self->_subtitleStackView = v11;

  [(NUIContainerStackView *)self->_subtitleStackView setAlignment:3];
  id v13 = objc_alloc((Class)NUIContainerGridView);
  double v14 = [(PHTableViewCell *)self titleLabel];
  v26 = v14;
  double v15 = +[NSArray arrayWithObjects:&v26 count:1];
  v27[0] = v15;
  v25 = self->_subtitleStackView;
  v16 = +[NSArray arrayWithObjects:&v25 count:1];
  v27[1] = v16;
  v17 = +[NSArray arrayWithObjects:v27 count:2];
  v18 = (NUIContainerGridView *)[v13 initWithArrangedSubviewRows:v17];
  gridView = self->_gridView;
  self->_gridView = v18;

  [(NUIContainerGridView *)self->_gridView setVerticalAlignment:3];
  [(NUIContainerGridView *)self->_gridView setLayoutMarginsRelativeArrangement:1];
  [(NUIContainerGridView *)self->_gridView setBaselineRelativeArrangement:1];
  if ([(PHContactTableViewCell *)self tapTargets])
  {
    id v20 = objc_alloc_init((Class)TPAccessoryButton);
    [(PHContactTableViewCell *)self setActionButton:v20];

    v21 = [(PHContactTableViewCell *)self actionButton];
    [v21 addTarget:self action:"actionButtonTapped:" forControlEvents:64];
  }
  v22 = self->_gridView;

  return v22;
}

- (void)updateRootView
{
  if (self->_hasAvatarView)
  {
    id v3 = [(NUIContainerGridView *)self->_gridView arrangedSubviewInColumnAtIndex:0 rowAtIndex:0];
  }
  else
  {
    id v3 = 0;
  }
  uint64_t v4 = [(CNAvatarViewController *)self->_avatarViewController view];
  double v6 = v4;
  if (v4)
  {
    LODWORD(v5) = 1148846080;
    [v4 setContentCompressionResistancePriority:0 forAxis:v5];
    LODWORD(v7) = 1148846080;
    [v6 setContentCompressionResistancePriority:1 forAxis:v7];
    LODWORD(v8) = 1148846080;
    [v6 setContentHuggingPriority:0 forAxis:v8];
    LODWORD(v9) = 1148846080;
    [v6 setContentHuggingPriority:1 forAxis:v9];
    gridView = self->_gridView;
    if (v3)
    {
      [(NUIContainerGridView *)self->_gridView replaceArrangedSubview:v6 inColumnAtIndex:0 rowAtIndex:0];
    }
    else
    {
      v15[0] = v6;
      v15[1] = v6;
      double v12 = +[NSArray arrayWithObjects:v15 count:2];
      id v13 = [(NUIContainerGridView *)gridView insertColumnAtIndex:0 withArrangedSubviews:v12];
    }
    BOOL v11 = 1;
    [(NUIContainerGridView *)self->_gridView setAlignment:1 forView:v6 inAxis:0];
    [(NUIContainerGridView *)self->_gridView setAlignment:3 forView:v6 inAxis:1];
    goto LABEL_11;
  }
  if (v3)
  {
    [(NUIContainerGridView *)self->_gridView removeColumnAtIndex:0];
    BOOL v11 = 0;
LABEL_11:
    self->_hasAvatarView = v11;
  }
  [v3 removeFromSuperview];
  [(PHContactTableViewCell *)self setPreservesSuperviewLayoutMargins:1];
  double v14 = [(PHContactTableViewCell *)self gridView];
  [v14 setPreservesSuperviewLayoutMargins:1];
}

- (void)actionButtonTapped:(id)a3
{
  uint64_t v4 = [(PHContactTableViewCell *)self actionButtonTappedHandler];

  if (v4)
  {
    double v5 = [(PHContactTableViewCell *)self actionButtonTappedHandler];
    v5[2]();
  }
}

- (void)setActionButtonTappedHandler:(id)a3
{
  self->_actionButtonTappedHandler = objc_retainBlock(a3);

  _objc_release_x1();
}

- (void)updateFontsAndLayoutMetrics
{
  v3.receiver = self;
  v3.super_class = (Class)PHContactTableViewCell;
  [(PHTableViewCell *)&v3 updateFontsAndLayoutMetrics];
  [(PHContactTableViewCell *)self _updateLayout];
}

- (void)_updateLayout
{
  objc_super v3 = [(PHTableViewCell *)self subtitleLabel];
  [v3 effectiveFirstBaselineOffsetFromTop];
  -[NUIContainerStackView setCustomFirstBaselineOffsetFromTop:](self->_subtitleStackView, "setCustomFirstBaselineOffsetFromTop:");

  [(PHDoubleLineTableViewCell *)self subtitleLabelFirstBaselineLayoutConstraintConstant];
  -[NUIContainerGridView setRowSpacing:](self->_gridView, "setRowSpacing:");
  uint64_t v4 = [(PHContactTableViewCell *)self featureFlags];
  unsigned __int8 v5 = [v4 phoneRecentsAvatarsEnabled];

  double v6 = 10.0;
  if ((v5 & 1) == 0) {
    [(PHTableViewCell *)self titleLabelLeadingLayoutConstraintConstant];
  }
  [(NUIContainerGridView *)self->_gridView setColumnSpacing:v6];
  [(PHContactTableViewCell *)self subtitleLabelLeadingLayoutConstraintConstant];
  -[NUIContainerStackView setSpacing:](self->_subtitleStackView, "setSpacing:");
  if ((uint64_t)[(NUIContainerGridView *)self->_gridView numberOfColumns] >= 2)
  {
    double v7 = [(CNAvatarViewController *)self->_avatarViewController view];
    [v7 setMinimumLayoutSize:45.0, 45.0];

    double v8 = [(CNAvatarViewController *)self->_avatarViewController view];
    [v8 setMaximumLayoutSize:45.0, 45.0];

    id v11 = [(PHContactTableViewCell *)self traitCollection];
    id v9 = [v11 isPreferredContentSizeCategoryAccessible];
    double v10 = [(NUIContainerGridView *)self->_gridView columnAtIndex:0];
    [v10 setHidden:v9];
  }
}

- (NSDirectionalEdgeInsets)rootViewLayoutMargins
{
  v20.receiver = self;
  v20.super_class = (Class)PHContactTableViewCell;
  [(PHDoubleLineTableViewCell *)&v20 rootViewLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  [(PHContactTableViewCell *)self avatarLayoutGuideLeadingAnchorLayoutConstraintConstant];
  double v10 = v9;
  id v11 = [(PHContactTableViewCell *)self featureFlags];
  unsigned int v12 = [v11 phoneRecentsAvatarsEnabled];

  if (v12)
  {
    [(PHContactTableViewCell *)self avatarLayoutGuideLeadingAnchorLayoutConstraintConstant];
    double v14 = v13;
    double v6 = 12.0;
    double v4 = 12.0;
  }
  else
  {
    double v15 = +[UITraitCollection _currentTraitCollection];
    unsigned int v16 = [v15 isPreferredContentSizeCategoryAccessible];

    if (v16) {
      double v14 = 0.0;
    }
    else {
      double v14 = v8;
    }
  }
  double v17 = v4;
  double v18 = v10;
  double v19 = v6;
  result.trailing = v14;
  result.bottom = v19;
  result.leading = v18;
  result.top = v17;
  return result;
}

- (void)setActionType:(id)a3
{
  id v4 = a3;
  actionType = self->_actionType;
  id v16 = v4;
  if (v4)
  {
    unsigned __int8 v6 = [(NSString *)actionType isEqualToString:v4];
    id v4 = v16;
    if (v6) {
      goto LABEL_7;
    }
  }
  else if (!actionType)
  {
    goto LABEL_7;
  }
  double v7 = (NSString *)[v4 copy];
  double v8 = self->_actionType;
  self->_actionType = v7;

  double v9 = [(id)objc_opt_class() imageForActionType:v16];
  double v10 = [(PHContactTableViewCell *)self subtitleImageView];
  [v10 setImage:v9];

  if ([(PHContactTableViewCell *)self tapTargets])
  {
    id v11 = [(id)objc_opt_class() actionButtonImageForActionType:v16];
    [(PHContactTableViewCell *)self setActionButtonImage:v11];

    unsigned int v12 = [(PHContactTableViewCell *)self actionButton];
    double v13 = [(PHContactTableViewCell *)self actionButtonImage];
    [v12 configureForImage:v13];

    double v14 = [(PHContactTableViewCell *)self actionButton];
    [v14 sizeToFit];

    double v15 = [(PHContactTableViewCell *)self actionButton];
    [(PHContactTableViewCell *)self setAccessoryView:v15];
  }
LABEL_7:

  _objc_release_x1();
}

- (void)setAvatarViewController:(id)a3
{
  double v5 = (CNAvatarViewController *)a3;
  p_avatarViewController = &self->_avatarViewController;
  if (self->_avatarViewController != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_avatarViewController, a3);
    [(PHContactTableViewCell *)self updateRootView];
    p_avatarViewController = (CNAvatarViewController **)[(PHContactTableViewCell *)self updateFontsAndLayoutMetrics];
    double v5 = v7;
  }

  _objc_release_x1(p_avatarViewController, v5);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PHContactTableViewCell;
  [(PHContactTableViewCell *)&v7 setEditing:a3 animated:a4];
  unsigned __int8 v6 = [(PHContactTableViewCell *)self avatarViewController];
  [v6 setThreeDTouchEnabled:!v4];
}

- (double)avatarLayoutGuideHeightAnchorLayoutConstraintConstant
{
  return 45.0;
}

- (double)avatarLayoutGuideLeadingAnchorLayoutConstraintConstant
{
  double v3 = objc_opt_class();
  BOOL v4 = [(PHContactTableViewCell *)self traitCollection];
  double v5 = [v4 preferredContentSizeCategory];
  [v3 avatarLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:v5];
  double v7 = v6;

  return v7;
}

- (double)avatarLayoutGuideWidthAnchorLayoutConstraintConstant
{
  double v3 = objc_opt_class();
  BOOL v4 = [(PHContactTableViewCell *)self traitCollection];
  double v5 = [v4 preferredContentSizeCategory];
  [v3 avatarLayoutGuideWidthAnchorLayoutConstraintConstant:v5];
  double v7 = v6;

  return v7;
}

- (double)subtitleLabelLeadingLayoutConstraintConstant
{
  id v2 = [(PHTableViewCell *)self subtitleLabel];
  double v3 = [v2 font];
  BOOL v4 = [v3 fontDescriptor];
  double v5 = [v4 objectForKey:UIFontDescriptorTextStyleAttribute];

  if (v5)
  {
    double v6 = +[UIFontMetrics metricsForTextStyle:v5];
    [v6 scaledValueForValue:4.0];
    double v8 = v7;
  }
  else
  {
    double v8 = 4.0;
  }

  return v8;
}

- (id)actionButtonTappedHandler
{
  return self->_actionButtonTappedHandler;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (CNAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (BOOL)tapTargets
{
  return self->_tapTargets;
}

- (void)setTapTargets:(BOOL)a3
{
  self->_tapTargets = a3;
}

- (UIImageView)subtitleImageView
{
  return self->_subtitleImageView;
}

- (NUIContainerStackView)subtitleStackView
{
  return self->_subtitleStackView;
}

- (void)setSubtitleStackView:(id)a3
{
}

- (UILayoutGuide)avatarLayoutGuide
{
  return self->_avatarLayoutGuide;
}

- (BOOL)hasAvatarView
{
  return self->_hasAvatarView;
}

- (void)setHasAvatarView:(BOOL)a3
{
  self->_hasAvatarView = a3;
}

- (NUIContainerGridView)gridView
{
  return self->_gridView;
}

- (void)setGridView:(id)a3
{
}

- (TPAccessoryButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (UIImage)actionButtonImage
{
  return self->_actionButtonImage;
}

- (void)setActionButtonImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtonImage, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_gridView, 0);
  objc_storeStrong((id *)&self->_avatarLayoutGuide, 0);
  objc_storeStrong((id *)&self->_subtitleStackView, 0);
  objc_storeStrong((id *)&self->_subtitleImageView, 0);
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong(&self->_actionButtonTappedHandler, 0);

  objc_storeStrong((id *)&self->_featureFlags, 0);
}

@end