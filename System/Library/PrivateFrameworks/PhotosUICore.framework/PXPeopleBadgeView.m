@interface PXPeopleBadgeView
- (CGRect)clippingRect;
- (PXPeopleBadgeViewConfiguration)userData;
- (PXPeopleBadgeViewDelegate)badgeViewDelegate;
- (UIButton)checkmarkCircle;
- (UIButton)checkmarkView;
- (UIButton)favoriteButton;
- (UIButton)legacyFavoriteBackground;
- (UIButton)legacyFavoriteButton;
- (UIButton)legacyUnfavoriteButton;
- (UIButton)unfavoriteButton;
- (UIColor)currentTintColor;
- (UIImageSymbolConfiguration)checkmarkConfiguration;
- (UIImageSymbolConfiguration)favoriteConfiguration;
- (UIImageSymbolConfiguration)largeConfiguration;
- (UIImageSymbolConfiguration)smallConfiguration;
- (UIImageSymbolConfiguration)unfavoriteConfiguration;
- (id)_checkmarkConfiguration;
- (id)_createHeartBadgeWithDisplayScale:(double)a3 isFavorite:(BOOL)a4;
- (id)_currentTintColor;
- (id)_favoriteConfiguration;
- (id)_largeConfiguration;
- (id)_smallConfiguration;
- (id)_unfavoriteConfiguration;
- (void)_createCheckmarkBadgeWithDisplayScale:(double)a3;
- (void)_createFavoriteBadgeWithDisplayScale:(double)a3;
- (void)_createLegacyDisabledFavoriteBadgeWithDisplayScale:(double)a3;
- (void)_createLegacyDisabledUnfavoriteBadgeWithDisplayScale:(double)a3;
- (void)_createLegacyEnabledFavoriteBadgeWithDisplayScale:(double)a3;
- (void)_createLegacyEnabledUnfavoriteBadgeWithDisplayScale:(double)a3;
- (void)_createUnfavoriteBadgeWithDisplayScale:(double)a3;
- (void)_hideAllViews;
- (void)favoriteTapped:(id)a3;
- (void)layoutSubviews;
- (void)setBadgeViewDelegate:(id)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setUserData:(id)a3;
- (void)unfavoriteTapped:(id)a3;
@end

@implementation PXPeopleBadgeView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkConfiguration, 0);
  objc_storeStrong((id *)&self->_unfavoriteConfiguration, 0);
  objc_storeStrong((id *)&self->_favoriteConfiguration, 0);
  objc_storeStrong((id *)&self->_largeConfiguration, 0);
  objc_storeStrong((id *)&self->_smallConfiguration, 0);
  objc_storeStrong((id *)&self->_currentTintColor, 0);
  objc_storeStrong((id *)&self->_unfavoriteButton, 0);
  objc_storeStrong((id *)&self->_favoriteButton, 0);
  objc_storeStrong((id *)&self->_checkmarkCircle, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_legacyUnfavoriteButton, 0);
  objc_storeStrong((id *)&self->_legacyFavoriteBackground, 0);
  objc_storeStrong((id *)&self->_legacyFavoriteButton, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_destroyWeak((id *)&self->_badgeViewDelegate);
}

- (UIImageSymbolConfiguration)checkmarkConfiguration
{
  return self->_checkmarkConfiguration;
}

- (UIImageSymbolConfiguration)unfavoriteConfiguration
{
  return self->_unfavoriteConfiguration;
}

- (UIImageSymbolConfiguration)favoriteConfiguration
{
  return self->_favoriteConfiguration;
}

- (UIImageSymbolConfiguration)largeConfiguration
{
  return self->_largeConfiguration;
}

- (UIImageSymbolConfiguration)smallConfiguration
{
  return self->_smallConfiguration;
}

- (UIColor)currentTintColor
{
  return self->_currentTintColor;
}

- (UIButton)unfavoriteButton
{
  return self->_unfavoriteButton;
}

- (UIButton)favoriteButton
{
  return self->_favoriteButton;
}

- (UIButton)checkmarkCircle
{
  return self->_checkmarkCircle;
}

- (UIButton)checkmarkView
{
  return self->_checkmarkView;
}

- (UIButton)legacyUnfavoriteButton
{
  return self->_legacyUnfavoriteButton;
}

- (UIButton)legacyFavoriteBackground
{
  return self->_legacyFavoriteBackground;
}

- (UIButton)legacyFavoriteButton
{
  return self->_legacyFavoriteButton;
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PXPeopleBadgeViewConfiguration)userData
{
  return self->_userData;
}

- (void)setBadgeViewDelegate:(id)a3
{
}

- (PXPeopleBadgeViewDelegate)badgeViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_badgeViewDelegate);
  return (PXPeopleBadgeViewDelegate *)WeakRetained;
}

- (id)_checkmarkConfiguration
{
  v13[2] = *MEMORY[0x1E4F143B8];
  checkmarkConfiguration = self->_checkmarkConfiguration;
  if (!checkmarkConfiguration)
  {
    v4 = (void *)MEMORY[0x1E4FB1830];
    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    v13[0] = v5;
    v6 = [(PXPeopleBadgeView *)self _currentTintColor];
    v13[1] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v4 configurationWithPaletteColors:v7];

    v9 = [(PXPeopleBadgeView *)self _largeConfiguration];
    v10 = [v9 configurationByApplyingConfiguration:v8];
    v11 = self->_checkmarkConfiguration;
    self->_checkmarkConfiguration = v10;

    checkmarkConfiguration = self->_checkmarkConfiguration;
  }
  return checkmarkConfiguration;
}

- (id)_unfavoriteConfiguration
{
  v13[2] = *MEMORY[0x1E4F143B8];
  unfavoriteConfiguration = self->_unfavoriteConfiguration;
  if (!unfavoriteConfiguration)
  {
    v4 = (void *)MEMORY[0x1E4FB1830];
    v5 = [MEMORY[0x1E4FB1618] systemGray2Color];
    v13[0] = v5;
    v6 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
    v13[1] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v4 configurationWithPaletteColors:v7];

    v9 = [(PXPeopleBadgeView *)self _smallConfiguration];
    v10 = [v9 configurationByApplyingConfiguration:v8];
    v11 = self->_unfavoriteConfiguration;
    self->_unfavoriteConfiguration = v10;

    unfavoriteConfiguration = self->_unfavoriteConfiguration;
  }
  return unfavoriteConfiguration;
}

- (id)_favoriteConfiguration
{
  v13[2] = *MEMORY[0x1E4F143B8];
  favoriteConfiguration = self->_favoriteConfiguration;
  if (!favoriteConfiguration)
  {
    v4 = (void *)MEMORY[0x1E4FB1830];
    v5 = [(PXPeopleBadgeView *)self _currentTintColor];
    v13[0] = v5;
    v6 = [MEMORY[0x1E4FB1618] tertiarySystemGroupedBackgroundColor];
    v13[1] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v4 configurationWithPaletteColors:v7];

    v9 = [(PXPeopleBadgeView *)self _largeConfiguration];
    v10 = [v9 configurationByApplyingConfiguration:v8];
    v11 = self->_favoriteConfiguration;
    self->_favoriteConfiguration = v10;

    favoriteConfiguration = self->_favoriteConfiguration;
  }
  return favoriteConfiguration;
}

- (id)_largeConfiguration
{
  largeConfiguration = self->_largeConfiguration;
  if (!largeConfiguration)
  {
    v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:3 scale:29.0];
    v5 = self->_largeConfiguration;
    self->_largeConfiguration = v4;

    largeConfiguration = self->_largeConfiguration;
  }
  return largeConfiguration;
}

- (id)_smallConfiguration
{
  smallConfiguration = self->_smallConfiguration;
  if (!smallConfiguration)
  {
    v4 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:1 scale:29.0];
    v5 = self->_smallConfiguration;
    self->_smallConfiguration = v4;

    smallConfiguration = self->_smallConfiguration;
  }
  return smallConfiguration;
}

- (id)_currentTintColor
{
  currentTintColor = self->_currentTintColor;
  if (!currentTintColor)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E4FB1618];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__PXPeopleBadgeView__currentTintColor__block_invoke;
    v8[3] = &unk_1E5DC25C8;
    objc_copyWeak(&v9, &location);
    v5 = [v4 colorWithDynamicProvider:v8];
    v6 = self->_currentTintColor;
    self->_currentTintColor = v5;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    currentTintColor = self->_currentTintColor;
  }
  return currentTintColor;
}

id __38__PXPeopleBadgeView__currentTintColor__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained tintColor];

  return v2;
}

- (void)setClippingRect:(CGRect)a3
{
  if (!CGRectEqualToRect(a3, *MEMORY[0x1E4F1DB10]))
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PXPeopleBadgeView.m" lineNumber:221 description:@"Clipping isn't supported"];
  }
}

- (void)setUserData:(id)a3
{
  id v9 = (PXPeopleBadgeViewConfiguration *)a3;
  id v5 = self->_userData;
  if (v5 == v9)
  {
  }
  else
  {
    v6 = v5;
    char v7 = [(PXPeopleBadgeViewConfiguration *)v5 isEqual:v9];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_userData, a3);
      v8 = [(PXPeopleBadgeViewConfiguration *)v9 badgeViewDelegate];
      [(PXPeopleBadgeView *)self setBadgeViewDelegate:v8];

      [(PXPeopleBadgeView *)self _hideAllViews];
      switch([(PXPeopleBadgeViewConfiguration *)v9 state])
      {
        case 1:
          [(PXPeopleBadgeViewConfiguration *)v9 displayScale];
          -[PXPeopleBadgeView _createLegacyEnabledFavoriteBadgeWithDisplayScale:](self, "_createLegacyEnabledFavoriteBadgeWithDisplayScale:");
          break;
        case 2:
          [(PXPeopleBadgeViewConfiguration *)v9 displayScale];
          -[PXPeopleBadgeView _createLegacyDisabledFavoriteBadgeWithDisplayScale:](self, "_createLegacyDisabledFavoriteBadgeWithDisplayScale:");
          break;
        case 3:
          [(PXPeopleBadgeViewConfiguration *)v9 displayScale];
          -[PXPeopleBadgeView _createLegacyEnabledUnfavoriteBadgeWithDisplayScale:](self, "_createLegacyEnabledUnfavoriteBadgeWithDisplayScale:");
          break;
        case 4:
          [(PXPeopleBadgeViewConfiguration *)v9 displayScale];
          -[PXPeopleBadgeView _createLegacyDisabledUnfavoriteBadgeWithDisplayScale:](self, "_createLegacyDisabledUnfavoriteBadgeWithDisplayScale:");
          break;
        case 5:
          [(PXPeopleBadgeViewConfiguration *)v9 displayScale];
          -[PXPeopleBadgeView _createCheckmarkBadgeWithDisplayScale:](self, "_createCheckmarkBadgeWithDisplayScale:");
          break;
        case 6:
          [(PXPeopleBadgeViewConfiguration *)v9 displayScale];
          -[PXPeopleBadgeView _createFavoriteBadgeWithDisplayScale:](self, "_createFavoriteBadgeWithDisplayScale:");
          break;
        case 7:
          [(PXPeopleBadgeViewConfiguration *)v9 displayScale];
          -[PXPeopleBadgeView _createUnfavoriteBadgeWithDisplayScale:](self, "_createUnfavoriteBadgeWithDisplayScale:");
          break;
        default:
          break;
      }
    }
  }
}

- (void)unfavoriteTapped:(id)a3
{
  id v4 = [(PXPeopleBadgeView *)self badgeViewDelegate];
  [v4 unfavoriteTappedForBadgeView:self];
}

- (void)favoriteTapped:(id)a3
{
  id v4 = [(PXPeopleBadgeView *)self badgeViewDelegate];
  [v4 favoriteTappedForBadgeView:self];
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PXPeopleBadgeView;
  [(PXPeopleBadgeView *)&v13 layoutSubviews];
  [(PXPeopleBadgeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIButton setFrame:](self->_legacyFavoriteBackground, "setFrame:");
  -[UIButton setFrame:](self->_legacyFavoriteButton, "setFrame:", v4, v6, v8, v10);
  -[UIButton setFrame:](self->_legacyUnfavoriteButton, "setFrame:", v4, v6, v8, v10);
  -[UIButton setFrame:](self->_checkmarkView, "setFrame:", v4, v6, v8, v10);
  -[UIButton setFrame:](self->_checkmarkCircle, "setFrame:", v4, v6, v8, v10);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __35__PXPeopleBadgeView_layoutSubviews__block_invoke;
  v12[3] = &__block_descriptor_64_e16_v16__0__UIView_8l;
  *(double *)&v12[4] = v4;
  *(double *)&v12[5] = v6;
  *(double *)&v12[6] = v8;
  *(double *)&v12[7] = v10;
  v11 = (void (**)(void *, UIButton *))_Block_copy(v12);
  v11[2](v11, self->_favoriteButton);
  v11[2](v11, self->_unfavoriteButton);
}

void __35__PXPeopleBadgeView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
}

- (void)_hideAllViews
{
  [(UIButton *)self->_legacyFavoriteButton setHidden:1];
  [(UIButton *)self->_legacyFavoriteBackground setHidden:1];
  [(UIButton *)self->_legacyUnfavoriteButton setHidden:1];
  [(UIButton *)self->_checkmarkView setHidden:1];
  [(UIButton *)self->_checkmarkCircle setHidden:1];
  [(UIButton *)self->_favoriteButton setHidden:1];
  unfavoriteButton = self->_unfavoriteButton;
  [(UIButton *)unfavoriteButton setHidden:1];
}

- (id)_createHeartBadgeWithDisplayScale:(double)a3 isFavorite:(BOOL)a4
{
  BOOL v6 = !a4;
  if (a4) {
    double v7 = @"heart.fill";
  }
  else {
    double v7 = @"heart";
  }
  double v8 = &selRef_favoriteTapped_;
  if (v6) {
    double v8 = &selRef_unfavoriteTapped_;
  }
  double v9 = *v8;
  double v10 = (void *)MEMORY[0x1E4FB14D0];
  v11 = [MEMORY[0x1E4FB1818] systemImageNamed:v7];
  v12 = [v10 systemButtonWithImage:v11 target:self action:v9];

  objc_super v13 = [(PXPeopleBadgeView *)self _smallConfiguration];
  [v12 setPreferredSymbolConfiguration:v13 forImageInState:0];

  v14 = [MEMORY[0x1E4FB1618] whiteColor];
  [v12 setTintColor:v14];

  [v12 setContentHorizontalAlignment:5];
  [v12 setContentVerticalAlignment:1];
  v15 = [v12 layer];
  [v15 setRasterizationScale:a3];

  return v12;
}

- (void)_createUnfavoriteBadgeWithDisplayScale:(double)a3
{
  unfavoriteButton = self->_unfavoriteButton;
  if (!unfavoriteButton)
  {
    double v5 = [(PXPeopleBadgeView *)self _createHeartBadgeWithDisplayScale:0 isFavorite:a3];
    BOOL v6 = self->_unfavoriteButton;
    self->_unfavoriteButton = v5;

    [(PXPeopleBadgeView *)self addSubview:self->_unfavoriteButton];
    unfavoriteButton = self->_unfavoriteButton;
  }
  -[UIButton setHidden:](unfavoriteButton, "setHidden:", 0, a3);
  double v7 = self->_unfavoriteButton;
  [(UIButton *)v7 setUserInteractionEnabled:1];
}

- (void)_createFavoriteBadgeWithDisplayScale:(double)a3
{
  favoriteButton = self->_favoriteButton;
  if (!favoriteButton)
  {
    double v5 = [(PXPeopleBadgeView *)self _createHeartBadgeWithDisplayScale:1 isFavorite:a3];
    BOOL v6 = self->_favoriteButton;
    self->_favoriteButton = v5;

    [(PXPeopleBadgeView *)self addSubview:self->_favoriteButton];
    favoriteButton = self->_favoriteButton;
  }
  -[UIButton setHidden:](favoriteButton, "setHidden:", 0, a3);
  double v7 = self->_favoriteButton;
  [(UIButton *)v7 setUserInteractionEnabled:1];
}

- (void)_createCheckmarkBadgeWithDisplayScale:(double)a3
{
  if (!self->_checkmarkView)
  {
    double v5 = (void *)MEMORY[0x1E4FB14D0];
    BOOL v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark.circle.fill"];
    double v7 = [v5 systemButtonWithImage:v6 target:0 action:0];
    checkmarkView = self->_checkmarkView;
    self->_checkmarkView = v7;

    double v9 = self->_checkmarkView;
    double v10 = [(PXPeopleBadgeView *)self _checkmarkConfiguration];
    [(UIButton *)v9 setPreferredSymbolConfiguration:v10 forImageInState:0];

    v11 = [(UIButton *)self->_checkmarkView layer];
    LODWORD(v12) = 1045220557;
    [v11 setShadowOpacity:v12];
    objc_msgSend(v11, "setShadowOffset:", 0.0, 1.0);
    [v11 setShadowRadius:3.0];
    [v11 setShouldRasterize:1];
    [v11 setRasterizationScale:a3];
    [(PXPeopleBadgeView *)self addSubview:self->_checkmarkView];
  }
  if (!self->_checkmarkCircle)
  {
    objc_super v13 = (void *)MEMORY[0x1E4FB14D0];
    v14 = objc_msgSend(MEMORY[0x1E4FB1818], "systemImageNamed:", @"circle", a3);
    v15 = [v13 systemButtonWithImage:v14 target:0 action:0];
    checkmarkCircle = self->_checkmarkCircle;
    self->_checkmarkCircle = v15;

    v17 = self->_checkmarkCircle;
    v18 = [(PXPeopleBadgeView *)self _largeConfiguration];
    [(UIButton *)v17 setPreferredSymbolConfiguration:v18 forImageInState:0];

    v19 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIButton *)self->_checkmarkCircle setTintColor:v19];

    [(PXPeopleBadgeView *)self addSubview:self->_checkmarkCircle];
  }
  -[UIButton setHidden:](self->_checkmarkView, "setHidden:", 0, a3);
  v20 = self->_checkmarkCircle;
  [(UIButton *)v20 setHidden:0];
}

- (void)_createLegacyDisabledUnfavoriteBadgeWithDisplayScale:(double)a3
{
  [(PXPeopleBadgeView *)self _createLegacyEnabledUnfavoriteBadgeWithDisplayScale:a3];
  legacyUnfavoriteButton = self->_legacyUnfavoriteButton;
  [(UIButton *)legacyUnfavoriteButton setUserInteractionEnabled:0];
}

- (void)_createLegacyEnabledUnfavoriteBadgeWithDisplayScale:(double)a3
{
  legacyUnfavoriteButton = self->_legacyUnfavoriteButton;
  if (!legacyUnfavoriteButton)
  {
    BOOL v6 = (void *)MEMORY[0x1E4FB14D0];
    double v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"heart.circle.fill"];
    double v8 = [v6 systemButtonWithImage:v7 target:self action:sel_unfavoriteTapped_];
    double v9 = self->_legacyUnfavoriteButton;
    self->_legacyUnfavoriteButton = v8;

    double v10 = self->_legacyUnfavoriteButton;
    v11 = [(PXPeopleBadgeView *)self _unfavoriteConfiguration];
    [(UIButton *)v10 setPreferredSymbolConfiguration:v11 forImageInState:0];

    double v12 = [(UIButton *)self->_legacyUnfavoriteButton layer];
    LODWORD(v13) = 1045220557;
    [v12 setShadowOpacity:v13];
    objc_msgSend(v12, "setShadowOffset:", 0.0, 1.0);
    [v12 setShadowRadius:3.0];
    [v12 setShouldRasterize:1];
    [v12 setRasterizationScale:a3];
    [(PXPeopleBadgeView *)self addSubview:self->_legacyUnfavoriteButton];

    legacyUnfavoriteButton = self->_legacyUnfavoriteButton;
  }
  -[UIButton setHidden:](legacyUnfavoriteButton, "setHidden:", 0, a3);
  v14 = self->_legacyUnfavoriteButton;
  [(UIButton *)v14 setUserInteractionEnabled:1];
}

- (void)_createLegacyDisabledFavoriteBadgeWithDisplayScale:(double)a3
{
  [(PXPeopleBadgeView *)self _createLegacyEnabledFavoriteBadgeWithDisplayScale:a3];
  [(UIButton *)self->_legacyFavoriteButton setAlpha:0.4];
  legacyFavoriteButton = self->_legacyFavoriteButton;
  [(UIButton *)legacyFavoriteButton setUserInteractionEnabled:0];
}

- (void)_createLegacyEnabledFavoriteBadgeWithDisplayScale:(double)a3
{
  if (!self->_legacyFavoriteBackground)
  {
    double v5 = (void *)MEMORY[0x1E4FB14D0];
    BOOL v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"circle.fill"];
    double v7 = [v5 systemButtonWithImage:v6 target:0 action:0];
    legacyFavoriteBackground = self->_legacyFavoriteBackground;
    self->_legacyFavoriteBackground = v7;

    double v9 = self->_legacyFavoriteBackground;
    double v10 = [(PXPeopleBadgeView *)self _largeConfiguration];
    [(UIButton *)v9 setPreferredSymbolConfiguration:v10 forImageInState:0];

    v11 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(UIButton *)self->_legacyFavoriteBackground setTintColor:v11];

    [(PXPeopleBadgeView *)self addSubview:self->_legacyFavoriteBackground];
  }
  if (!self->_legacyFavoriteButton)
  {
    double v12 = (void *)MEMORY[0x1E4FB14D0];
    double v13 = [MEMORY[0x1E4FB1818] systemImageNamed:@"heart.circle.fill"];
    v14 = [v12 systemButtonWithImage:v13 target:self action:sel_favoriteTapped_];
    legacyFavoriteButton = self->_legacyFavoriteButton;
    self->_legacyFavoriteButton = v14;

    v16 = self->_legacyFavoriteButton;
    v17 = [(PXPeopleBadgeView *)self _favoriteConfiguration];
    [(UIButton *)v16 setPreferredSymbolConfiguration:v17 forImageInState:0];

    v18 = [(UIButton *)self->_legacyFavoriteButton layer];
    LODWORD(v19) = 1045220557;
    [v18 setShadowOpacity:v19];
    objc_msgSend(v18, "setShadowOffset:", 0.0, 1.0);
    [v18 setShadowRadius:3.0];
    [v18 setShouldRasterize:1];
    [v18 setRasterizationScale:a3];
    [(PXPeopleBadgeView *)self addSubview:self->_legacyFavoriteButton];
  }
  [(UIButton *)self->_legacyFavoriteBackground setHidden:0];
  [(UIButton *)self->_legacyFavoriteButton setHidden:0];
  [(UIButton *)self->_legacyFavoriteButton setAlpha:1.0];
  v20 = self->_legacyFavoriteButton;
  [(UIButton *)v20 setUserInteractionEnabled:1];
}

@end