@interface PUOneUpCropButton
+ (CGRect)frameForWindow:(id)a3;
+ (CGSize)_size;
- (BOOL)_portrait;
- (BOOL)applyEDRBoost;
- (BOOL)isBeingTouched;
- (BOOL)isEnabled;
- (BOOL)loadedDefaultAspectRatio;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)presentingMenu;
- (BOOL)targeted;
- (CGSize)_aspectRatioSizeForAspectRatio:(unint64_t)a3;
- (PUOneUpCropButton)init;
- (PUOneUpCropButtonDelegate)delegate;
- (PXEDRGainView)gainView;
- (UIVisualEffectView)visualEffectView;
- (_PUOneUpCropUIButton)button;
- (id)_actionForAspectRatio:(unint64_t)a3;
- (id)_aspectRatioMenu;
- (id)_aspectRatioMenuActions;
- (id)_backgroundEffectsWithBrightness:(double)a3;
- (id)_createButton;
- (id)_identifierForAspectRatio:(unint64_t)a3;
- (id)largeContentTitle;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (unint64_t)_defaultAspectRatio;
- (unint64_t)cachedDefaultAspectRatio;
- (void)_didTapButton:(id)a3;
- (void)_setDefaultAspectRatio:(unint64_t)a3;
- (void)layoutSubviews;
- (void)oneUpCropUIButton:(id)a3 menuPresentedDidChange:(BOOL)a4;
- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5;
- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5;
- (void)presentMenu;
- (void)setApplyEDRBoost:(BOOL)a3;
- (void)setButton:(id)a3;
- (void)setCachedDefaultAspectRatio:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setGainView:(id)a3;
- (void)setLoadedDefaultAspectRatio:(BOOL)a3;
- (void)setPresentingMenu:(BOOL)a3;
- (void)setTargeted:(BOOL)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation PUOneUpCropButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gainView, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLoadedDefaultAspectRatio:(BOOL)a3
{
  self->_loadedDefaultAspectRatio = a3;
}

- (BOOL)loadedDefaultAspectRatio
{
  return self->_loadedDefaultAspectRatio;
}

- (void)setCachedDefaultAspectRatio:(unint64_t)a3
{
  self->_cachedDefaultAspectRatio = a3;
}

- (unint64_t)cachedDefaultAspectRatio
{
  return self->_cachedDefaultAspectRatio;
}

- (void)setGainView:(id)a3
{
}

- (PXEDRGainView)gainView
{
  return self->_gainView;
}

- (void)setButton:(id)a3
{
}

- (_PUOneUpCropUIButton)button
{
  return self->_button;
}

- (void)setVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (BOOL)applyEDRBoost
{
  return self->_applyEDRBoost;
}

- (BOOL)targeted
{
  return self->_targeted;
}

- (BOOL)presentingMenu
{
  return self->_presentingMenu;
}

- (void)setDelegate:(id)a3
{
}

- (PUOneUpCropButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUOneUpCropButtonDelegate *)WeakRetained;
}

- (void)oneUpCropUIButton:(id)a3 menuPresentedDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  if (a4)
  {
    v6 = (void *)MEMORY[0x1E4F903D8];
    v7 = objc_msgSend(MEMORY[0x1E4F903D8], "quickCropTipID", a3);
    [v6 setTipActionPerformed:v7];
  }
  [(PUOneUpCropButton *)self setPresentingMenu:v4];
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  v6 = [MEMORY[0x1E4FB1AD0] effectWithPreview:v5];
  v7 = (void *)MEMORY[0x1E4FB1AE0];
  [(PUOneUpCropButton *)self frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(PUOneUpCropButton *)self frame];
  v16 = objc_msgSend(v7, "shapeWithRoundedRect:cornerRadius:", v9, v11, v13, v15, CGRectGetHeight(v20) * 0.5);
  v17 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v6 shape:v16];

  return v17;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  v6 = (void *)MEMORY[0x1E4FB1AD8];
  id v7 = a5;
  [(PUOneUpCropButton *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [v7 identifier];

  v17 = objc_msgSend(v6, "regionWithRect:identifier:", v16, v9, v11, v13, v15);

  return v17;
}

- (id)largeContentTitle
{
  return PULocalizedString(@"PHOTOEDIT_QUICK_CROP_BUTTON");
}

- (id)_actionForAspectRatio:(unint64_t)a3
{
  BOOL v5 = [(PUOneUpCropButton *)self _portrait];
  switch(a3)
  {
    case 0uLL:
      v6 = PULocalizedString(@"PHOTOEDIT_QUICK_CROP_FULLSCREEN_TITLE");
      id v7 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v8 = [v7 userInterfaceIdiom];

      if (v8)
      {
        double v9 = @"ipad.landscape";
        double v10 = @"ipad";
      }
      else
      {
        double v9 = @"iphone.landscape";
        double v10 = @"iphone";
      }
      goto LABEL_9;
    case 1uLL:
      v6 = PULocalizedString(@"PHOTOEDIT_CROP_ASPECT_RATIO_ORIGINAL");
      double v11 = @"photo";
      break;
    case 2uLL:
      v6 = PULocalizedString(@"PHOTOEDIT_CROP_ASPECT_RATIO_SQUARE");
      double v11 = @"square";
      break;
    case 3uLL:
      [(PUOneUpCropButton *)self _aspectRatioSizeForAspectRatio:3];
      double v12 = PULocalizedString(@"PHOTOEDIT_QUICK_CROP_WIDESCREEN_TITLE");
      double v13 = PXLocalizedStringFromInteger();
      PXLocalizedStringFromInteger();
      v19 = v18 = v13;
      v6 = PUStringWithValidatedFormat();

      double v9 = @"rectangle.ratio.16.to.9";
      double v10 = @"rectangle.ratio.9.to.16";
LABEL_9:
      if (v5) {
        double v9 = v10;
      }
      double v11 = v9;
      break;
    default:
      double v11 = 0;
      v6 = 0;
      break;
  }
  double v14 = objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:", v11, v18, v19);
  if (!v14)
  {
    double v14 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"rectangle.portrait"];
  }
  objc_initWeak(&location, self);
  double v15 = (void *)MEMORY[0x1E4FB13F0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __43__PUOneUpCropButton__actionForAspectRatio___block_invoke;
  v20[3] = &unk_1E5F2E7F8;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a3;
  v16 = [v15 actionWithTitle:v6 image:v14 identifier:0 handler:v20];
  if ([(PUOneUpCropButton *)self _defaultAspectRatio] == a3) {
    [v16 setState:1];
  }
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);

  return v16;
}

void __43__PUOneUpCropButton__actionForAspectRatio___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setDefaultAspectRatio:*(void *)(a1 + 40)];
}

- (id)_aspectRatioMenuActions
{
  v9[4] = *MEMORY[0x1E4F143B8];
  v3 = [(PUOneUpCropButton *)self _actionForAspectRatio:0];
  BOOL v4 = [(PUOneUpCropButton *)self _actionForAspectRatio:1];
  BOOL v5 = [(PUOneUpCropButton *)self _actionForAspectRatio:2];
  v6 = [(PUOneUpCropButton *)self _actionForAspectRatio:3];
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v6;
  v9[3] = v5;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];

  return v7;
}

- (id)_aspectRatioMenu
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E4FB16B8];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  double v10 = __37__PUOneUpCropButton__aspectRatioMenu__block_invoke;
  double v11 = &unk_1E5F29218;
  objc_copyWeak(&v12, &location);
  v3 = [v2 elementWithUncachedProvider:&v8];
  BOOL v4 = (void *)MEMORY[0x1E4FB1970];
  v14[0] = v3;
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v14, 1, v8, v9, v10, v11);
  v6 = [v4 menuWithTitle:&stru_1F06BE7B8 image:0 identifier:0 options:0 children:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v6;
}

void __37__PUOneUpCropButton__aspectRatioMenu__block_invoke(uint64_t a1, void (**a2)(void, void))
{
  v3 = (id *)(a1 + 32);
  BOOL v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained _aspectRatioMenuActions];
  v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CBF0];
  }
  a2[2](v4, v7);
}

- (CGSize)_aspectRatioSizeForAspectRatio:(unint64_t)a3
{
  double v4 = 1.0;
  double v5 = 1.0;
  switch(a3)
  {
    case 0uLL:
      double v4 = *MEMORY[0x1E4F1DB30];
      double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      break;
    case 1uLL:
      v6 = [(PUOneUpCropButton *)self delegate];
      [v6 oneUpCropButtonOriginalAspectRatio:self];
      double v4 = v7;
      double v5 = v8;

      break;
    case 2uLL:
      break;
    case 3uLL:
      BOOL v9 = [(PUOneUpCropButton *)self _portrait];
      if (v9) {
        double v4 = 9.0;
      }
      else {
        double v4 = 16.0;
      }
      if (v9) {
        double v5 = 16.0;
      }
      else {
        double v5 = 9.0;
      }
      break;
    default:
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PUOneUpCropButton.m" lineNumber:361 description:@"Code which should be unreachable has been reached"];

      abort();
  }
  double v10 = v4;
  double v11 = v5;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_setDefaultAspectRatio:(unint64_t)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  double v5 = -[PUOneUpCropButton _identifierForAspectRatio:](self, "_identifierForAspectRatio:");
  v6 = [(PUOneUpCropButton *)self _userDefaults];
  [v6 setObject:v5 forKey:@"PUOneUpCropButtonDefaultAspectRatioKey"];

  [(PUOneUpCropButton *)self setCachedDefaultAspectRatio:a3];
  [(PUOneUpCropButton *)self setLoadedDefaultAspectRatio:1];
  double v7 = (void *)MEMORY[0x1E4F56658];
  BOOL v9 = @"aspectRatio";
  v10[0] = v5;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v7 sendEvent:@"com.apple.photos.CPAnalytics.quickCrop.aspectRatioChanged" withPayload:v8];
}

- (unint64_t)_defaultAspectRatio
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(PUOneUpCropButton *)self loadedDefaultAspectRatio])
  {
    return [(PUOneUpCropButton *)self cachedDefaultAspectRatio];
  }
  [(PUOneUpCropButton *)self setLoadedDefaultAspectRatio:1];
  double v4 = [(PUOneUpCropButton *)self _userDefaults];
  double v5 = [v4 objectForKey:@"PUOneUpCropButtonDefaultAspectRatioKey"];

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = v5;

    if (v6) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v6 = [(PUOneUpCropButton *)self _identifierForAspectRatio:0];
LABEL_11:
  for (unint64_t i = 0; i != 4; ++i)
  {
    double v8 = [(PUOneUpCropButton *)self _identifierForAspectRatio:i];
    if ([v8 isEqualToString:v6])
    {
      [(PUOneUpCropButton *)self setCachedDefaultAspectRatio:i];

      goto LABEL_18;
    }
  }
  BOOL v9 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Quick crop failed to restore aspect ratio with identifier %@", (uint8_t *)&v10, 0xCu);
  }

  [(PUOneUpCropButton *)self setCachedDefaultAspectRatio:0];
  unint64_t i = 0;
LABEL_18:

  return i;
}

- (id)_identifierForAspectRatio:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"PUOneUpCropButtonAspectRatioFullscreen";
  }
  else {
    return off_1E5F22500[a3 - 1];
  }
}

- (BOOL)_portrait
{
  v3 = [(PUOneUpCropButton *)self delegate];
  [v3 oneUpCropButtonBoundingSize:self];
  double v5 = v4;
  double v7 = v6;

  return v5 < v7;
}

- (id)_backgroundEffectsWithBrightness:(double)a3
{
  v15[5] = *MEMORY[0x1E4F143B8];
  double v4 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:30.0];
  double v5 = (void *)MEMORY[0x1E4FB1EF8];
  double v6 = objc_msgSend(MEMORY[0x1E4FB1618], "blackColor", v4);
  double v7 = [v5 effectCompositingColor:v6 withMode:1010 alpha:0.12];
  v15[1] = v7;
  double v8 = (void *)MEMORY[0x1E4FB1620];
  BOOL v9 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUQuickCropButtonLuminanceMap");
  int v10 = [v8 colorEffectLuminanceMap:v9 blendingAmount:0.7];
  v15[2] = v10;
  id v11 = [MEMORY[0x1E4FB1620] colorEffectSaturate:2.8];
  v15[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4FB1620] colorEffectBrightness:a3];
  v15[4] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:5];

  return v13;
}

- (id)_createButton
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v3 = [_PUOneUpCropUIButton alloc];
  double v4 = -[_PUOneUpCropUIButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_PUOneUpCropUIButton *)v4 setDelegate:self];
  if (_createButton_onceToken != -1) {
    dispatch_once(&_createButton_onceToken, &__block_literal_global_1930);
  }
  double v5 = PULocalizedString(@"PHOTOEDIT_QUICK_CROP_BUTTON");
  if (![v5 length]) {
    goto LABEL_8;
  }
  double v6 = +[PUOneUpSettings sharedInstance];
  if ([v6 quickCropUseSymbol])
  {

LABEL_8:
    double v14 = [MEMORY[0x1E4FB1830] configurationWithPointSize:7 weight:14.0];
    double v15 = [MEMORY[0x1E4FB1818] systemImageNamed:@"crop" withConfiguration:v14];
    [(_PUOneUpCropUIButton *)v4 setImage:v15 forState:0];
    goto LABEL_9;
  }
  int v7 = _createButton_simulateLongLocalizedStrings;

  if (v7) {
    goto LABEL_8;
  }
  double v8 = *MEMORY[0x1E4FB09B8];
  BOOL v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:10.5 weight:*MEMORY[0x1E4FB09B8]];
  +[PUOneUpCropButton _size];
  double v11 = v10 + -18.0;
  uint64_t v19 = *MEMORY[0x1E4FB06F8];
  v20[0] = v9;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  objc_msgSend(v5, "boundingRectWithSize:options:attributes:context:", 0, v12, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double Width = CGRectGetWidth(v22);

  if (Width > v11) {
    goto LABEL_8;
  }
  double v14 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:v8];
  [(_PUOneUpCropUIButton *)v4 setTitle:v5 forState:0];
  double v15 = [(_PUOneUpCropUIButton *)v4 titleLabel];
  [v15 setFont:v14];
  [v15 setAdjustsFontSizeToFitWidth:1];
  [v15 setMinimumScaleFactor:0.7];
  -[_PUOneUpCropUIButton setContentEdgeInsets:](v4, "setContentEdgeInsets:", 0.0, 9.0, 0.0, 9.0);
LABEL_9:

  v16 = [MEMORY[0x1E4FB1618] whiteColor];
  [(_PUOneUpCropUIButton *)v4 setTintColor:v16];

  v17 = [(PUOneUpCropButton *)self _aspectRatioMenu];
  [(_PUOneUpCropUIButton *)v4 setMenu:v17];

  [(_PUOneUpCropUIButton *)v4 addTarget:self action:sel__didTapButton_ forControlEvents:64];
  return v4;
}

void __34__PUOneUpCropButton__createButton__block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  _createButton_simulateLongLocalizedStrings = [v0 BOOLForKey:@"NSDoubleLocalizedStrings"];
}

- (void)_didTapButton:(id)a3
{
  [(PUOneUpCropButton *)self _aspectRatioSizeForAspectRatio:[(PUOneUpCropButton *)self _defaultAspectRatio]];
  double v5 = v4;
  double v7 = v6;
  id v8 = [(PUOneUpCropButton *)self delegate];
  objc_msgSend(v8, "oneUpCropButton:didSelectAspectRatio:", self, v5, v7);
}

- (void)setTargeted:(BOOL)a3
{
  if (self->_targeted != a3)
  {
    BOOL v3 = a3;
    self->_targeted = a3;
    id v5 = [(PUOneUpCropButton *)self delegate];
    [v5 oneUpCropButton:self pointerTargetDidChange:v3];
  }
}

- (void)setPresentingMenu:(BOOL)a3
{
  if (self->_presentingMenu != a3)
  {
    BOOL v3 = a3;
    self->_presentingMenu = a3;
    id v5 = [(PUOneUpCropButton *)self delegate];
    [v5 oneUpCropButton:self menuPresentedDidChange:v3];
  }
}

- (void)setApplyEDRBoost:(BOOL)a3
{
  if (self->_applyEDRBoost != a3)
  {
    if (a3)
    {
      id v5 = [MEMORY[0x1E4F90300] sharedInstance];
      [v5 chromeButtonsEDRBoost];
      -[PXEDRGainView setEdrGain:](self->_gainView, "setEdrGain:");
    }
    else
    {
      gainView = self->_gainView;
      [(PXEDRGainView *)gainView setEdrGain:0.0];
    }
  }
}

- (void)presentMenu
{
  id v3 = [(PUOneUpCropButton *)self button];
  v2 = [v3 contextMenuInteraction];
  objc_msgSend(v2, "_presentMenuAtLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (BOOL)isBeingTouched
{
  v2 = [(PUOneUpCropButton *)self button];
  char v3 = [v2 isBeingTouched];

  return v3;
}

- (BOOL)isEnabled
{
  v2 = [(PUOneUpCropButton *)self button];
  char v3 = [v2 isUserInteractionEnabled];

  return v3;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUOneUpCropButton *)self button];
  [v4 setUserInteractionEnabled:v3];
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)PUOneUpCropButton;
  [(PUOneUpCropButton *)&v19 layoutSubviews];
  [(PUOneUpCropButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(PUOneUpCropButton *)self visualEffectView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  uint64_t v12 = [(PUOneUpCropButton *)self button];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  double v13 = [(PUOneUpCropButton *)self gainView];
  objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);

  v20.origin.x = v4;
  v20.origin.y = v6;
  v20.size.width = v8;
  v20.size.height = v10;
  CGFloat v14 = CGRectGetHeight(v20) * 0.5;
  double v15 = [(PUOneUpCropButton *)self gainView];
  v16 = [v15 layer];
  [v16 setCornerRadius:v14];

  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  CGFloat v17 = CGRectGetHeight(v21) * 0.5;
  v18 = [(PUOneUpCropButton *)self layer];
  [v18 setCornerRadius:v17];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)PUOneUpCropButton;
  BOOL v7 = -[PUOneUpCropButton pointInside:withEvent:](&v13, sel_pointInside_withEvent_, a4);
  [(PUOneUpCropButton *)self bounds];
  if (!CGRectIsEmpty(v15))
  {
    PXEdgeInsetsInvert();
    PXEdgeInsetsInsetRect();
    if (v7)
    {
      return 1;
    }
    else
    {
      v14.CGFloat x = x;
      v14.CGFloat y = y;
      return CGRectContainsPoint(*(CGRect *)&v8, v14);
    }
  }
  return v7;
}

- (PUOneUpCropButton)init
{
  v25.receiver = self;
  v25.super_class = (Class)PUOneUpCropButton;
  v2 = [(PUOneUpCropButton *)&v25 init];
  double v3 = v2;
  if (v2)
  {
    [(PUOneUpCropButton *)v2 setOverrideUserInterfaceStyle:2];
    double v4 = [(PUOneUpCropButton *)v3 layer];
    [v4 setMasksToBounds:1];

    uint64_t v5 = *MEMORY[0x1E4F39EA8];
    double v6 = [(PUOneUpCropButton *)v3 layer];
    [v6 setCornerCurve:v5];

    BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v3];
    [(PUOneUpCropButton *)v3 addInteraction:v7];
    [(PUOneUpCropButton *)v3 setShowsLargeContentViewer:1];
    id v8 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(PUOneUpCropButton *)v3 addInteraction:v8];

    id v9 = objc_alloc(MEMORY[0x1E4FB1F00]);
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
    visualEffectView = v3->_visualEffectView;
    v3->_visualEffectView = (UIVisualEffectView *)v14;

    v16 = +[PUOneUpSettings sharedInstance];
    [v16 quickCropBackgroundBrightness];
    CGFloat v17 = -[PUOneUpCropButton _backgroundEffectsWithBrightness:](v3, "_backgroundEffectsWithBrightness:");
    [(UIVisualEffectView *)v3->_visualEffectView setBackgroundEffects:v17];

    [(PUOneUpCropButton *)v3 addSubview:v3->_visualEffectView];
    uint64_t v18 = [(PUOneUpCropButton *)v3 _createButton];
    button = v3->_button;
    v3->_button = (_PUOneUpCropUIButton *)v18;

    [(PUOneUpCropButton *)v3 addSubview:v3->_button];
    uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F91240]), "initWithFrame:", v10, v11, v12, v13);
    gainView = v3->_gainView;
    v3->_gainView = (PXEDRGainView *)v20;

    CGRect v22 = [(PXEDRGainView *)v3->_gainView layer];
    [v22 setMasksToBounds:1];

    v23 = [(PXEDRGainView *)v3->_gainView layer];
    [v23 setCornerCurve:v5];

    [(PUOneUpCropButton *)v3 addSubview:v3->_gainView];
  }
  return v3;
}

+ (CGSize)_size
{
  long long v8 = *MEMORY[0x1E4F1DB30];
  long long v7 = *MEMORY[0x1E4FB2E10];
  uint64_t v6 = 0;
  long long v4 = v8;
  long long v5 = v7;
  +[PUPhotoEditLayoutSupport currentDeviceButtonSize:&v8 offset:&v7 zoomedSize:&v4 zoomedOffset:&v5 normalScreenWidth:&v6];
  double v3 = *((double *)&v8 + 1);
  double v2 = *(double *)&v8;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGRect)frameForWindow:(id)a3
{
  long long v7 = 0u;
  long long v8 = 0u;
  [a3 bounds];
  +[PUPhotoEditLayoutSupport getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:inRTL:](PUPhotoEditLayoutSupport, "getTopLeadingButtonFrame:topTrailingButtonFrame:inBounds:inRTL:", 0, &v7, 0);
  double v4 = *((double *)&v7 + 1);
  double v3 = *(double *)&v7;
  double v6 = *((double *)&v8 + 1);
  double v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

@end