@interface VUIDownloadButton
- (BOOL)_hasTextForNotDownloadState;
- (BOOL)isForLibrary;
- (BOOL)observingDownloadProgress;
- (BOOL)showsTextInDownloadedState;
- (BOOL)usesDefaultConfiguration;
- (BOOL)wasCanceled;
- (BOOL)wasDeleted;
- (CAShapeLayer)backdropMaskingLayer;
- (CAShapeLayer)backgroundMaskingLayer;
- (CGSize)_imageSizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSString)notDownloadStateText;
- (UIColor)keyBackgroundColor;
- (UIColor)saturatedTintColor;
- (UIImage)connectingImage;
- (UIImage)downloadedImage;
- (UIImage)downloadingImage;
- (UIImage)expiredDownloadImage;
- (UIImage)notDownloadedImage;
- (UIImageSymbolConfiguration)primarySymbolConfiguration;
- (UIView)backgroundView;
- (UIViewController)presentingViewController;
- (VUICircularProgress)progressIndicator;
- (VUIDownloadButton)initWithAssetController:(id)a3 type:(unint64_t)a4;
- (VUIDownloadButton)initWithDownloadButtonViewModel:(id)a3 isForLibrary:(BOOL)a4 type:(unint64_t)a5 textLayout:(id)a6;
- (VUIDownloadButton)initWithMediaEntity:(id)a3 type:(unint64_t)a4;
- (VUIDownloadButton)initWithPlayable:(id)a3 type:(unint64_t)a4 textLayout:(id)a5;
- (VUIDownloadButtonActionHandler)actionHandler;
- (VUIDownloadButtonViewModel)viewModel;
- (VUISeasonDownloadDataSourceProvider)seasonDownloadDataSourceProvider;
- (VUITextLayout)textLayout;
- (id)_buttonPropertiesForState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6;
- (id)_downloadedImage;
- (id)_expiredDownloadImage;
- (id)_imageForDownloadState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6;
- (id)_notDownloadedImage;
- (id)_pausedImage;
- (id)downloadStateChangeHandler;
- (id)initTVShowDownloadButtonWithType:(unint64_t)a3;
- (void)_clearMasks;
- (void)_configureProgressIndicatorWithProperties:(id)a3;
- (void)_insertProgressIndicatorWithFrame:(CGRect)a3;
- (void)_layoutProgressIndicator;
- (void)_setImage:(id)a3;
- (void)_setTitleWithProperties:(id)a3;
- (void)_setupDownloadButton;
- (void)_startObservingDownloadProgress:(id)a3;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopObservingDownloadProgress:(id)a3;
- (void)_stopObservingViewModel:(id)a3;
- (void)_updateButtonToConnectingWithProperties:(id)a3;
- (void)_updateButtonToDownloadedWithProperties:(id)a3;
- (void)_updateButtonToDownloadingWithProperties:(id)a3;
- (void)_updateButtonToEnqueuedWithProperties:(id)a3;
- (void)_updateButtonToNotDownloadedWithProperties:(id)a3;
- (void)_updateButtonToState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6;
- (void)_updateButtonToState:(unint64_t)a3 oldState:(unint64_t)a4;
- (void)_updateDownloadProgress:(double)a3 animated:(BOOL)a4;
- (void)_updateImageViewTintColorWithDownloadState:(unint64_t)a3;
- (void)_updateMaskForProgressLayer;
- (void)configureActionHandler;
- (void)configureWithLayoutProperties;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)revertTintColor;
- (void)saturateTintColorAndBackgroundColor;
- (void)setActionHandler:(id)a3;
- (void)setBackdropMaskingLayer:(id)a3;
- (void)setBackgroundMaskingLayer:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setConnectingImage:(id)a3;
- (void)setDownloadStateChangeHandler:(id)a3;
- (void)setDownloadedImage:(id)a3;
- (void)setDownloadingImage:(id)a3;
- (void)setExpiredDownloadImage:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIsForLibrary:(BOOL)a3;
- (void)setKeyBackgroundColor:(id)a3;
- (void)setNotDownloadStateText:(id)a3;
- (void)setNotDownloadedImage:(id)a3;
- (void)setObservingDownloadProgress:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setPrimarySymbolConfiguration:(id)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setSaturatedTintColor:(id)a3;
- (void)setScrolledNonUberPercentage:(double)a3;
- (void)setSeasonDownloadDataSourceProvider:(id)a3;
- (void)setShowsTextInDownloadedState:(BOOL)a3;
- (void)setTextLayout:(id)a3;
- (void)setTintColor:(id)a3;
- (void)setUsesDefaultConfiguration:(BOOL)a3;
- (void)setViewModel:(id)a3;
- (void)setWasCanceled:(BOOL)a3;
- (void)setWasDeleted:(BOOL)a3;
- (void)updateWithAssetController:(id)a3;
- (void)updateWithPlayable:(id)a3 textLayout:(id)a4;
- (void)vui_didMoveToWindow;
@end

@implementation VUIDownloadButton

- (VUIDownloadButton)initWithPlayable:(id)a3 type:(unint64_t)a4 textLayout:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VUIDownloadButton;
  v10 = [(VUIButton *)&v17 initWithType:a4 interfaceStyle:1];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_textLayout, a5);
    [(VUIDownloadButton *)v11 _setupDownloadButton];
    v12 = +[VUIDownloadButtonViewModel viewModelWithVideosPlayable:v8];
    [(VUIDownloadButton *)v11 setViewModel:v12];
    objc_initWeak(&location, v11);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __54__VUIDownloadButton_initWithPlayable_type_textLayout___block_invoke;
    v14[3] = &unk_1E6DF4400;
    objc_copyWeak(&v15, &location);
    [(VUIButton *)v11 setSelectActionHandler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v11;
}

void __54__VUIDownloadButton_initWithPlayable_type_textLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained actionHandler];
  objc_msgSend(v1, "performAction:confirmBeforeStopDownloading:", objc_msgSend(WeakRetained, "isForLibrary"), 0);
}

- (VUIDownloadButton)initWithDownloadButtonViewModel:(id)a3 isForLibrary:(BOOL)a4 type:(unint64_t)a5 textLayout:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VUIDownloadButton;
  v12 = [(VUIButton *)&v18 initWithType:a5 interfaceStyle:1];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_textLayout, a6);
    [(VUIDownloadButton *)v13 _setupDownloadButton];
    [(VUIDownloadButton *)v13 setIsForLibrary:v8];
    [(VUIDownloadButton *)v13 setViewModel:v10];
    objc_initWeak(&location, v13);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __82__VUIDownloadButton_initWithDownloadButtonViewModel_isForLibrary_type_textLayout___block_invoke;
    v15[3] = &unk_1E6DF4400;
    objc_copyWeak(&v16, &location);
    [(VUIButton *)v13 setSelectActionHandler:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __82__VUIDownloadButton_initWithDownloadButtonViewModel_isForLibrary_type_textLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained actionHandler];
  objc_msgSend(v1, "performAction:confirmBeforeStopDownloading:", objc_msgSend(WeakRetained, "isForLibrary"), 0);
}

- (VUIDownloadButton)initWithAssetController:(id)a3 type:(unint64_t)a4
{
  v6 = +[VUIDownloadButtonViewModel viewModelWithAssetController:a3];
  v7 = [(VUIDownloadButton *)self initWithDownloadButtonViewModel:v6 isForLibrary:1 type:a4 textLayout:0];

  return v7;
}

- (VUIDownloadButton)initWithMediaEntity:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 assetController];
  BOOL v8 = [(VUIDownloadButton *)self initWithAssetController:v7 type:a4];
  id v9 = v8;
  if (v8)
  {
    id v10 = [(VUIDownloadButton *)v8 viewModel];
    [v10 setMediaEntity:v6];
  }
  return v9;
}

- (id)initTVShowDownloadButtonWithType:(unint64_t)a3
{
  v3 = [(VUIDownloadButton *)self initWithDownloadButtonViewModel:0 isForLibrary:0 type:a3 textLayout:0];
  [(VUIDownloadButton *)v3 setIsForLibrary:0];
  return v3;
}

- (void)setSeasonDownloadDataSourceProvider:(id)a3
{
  v7 = (VUISeasonDownloadDataSourceProvider *)a3;
  if (self->_seasonDownloadDataSourceProvider != v7)
  {
    objc_storeStrong((id *)&self->_seasonDownloadDataSourceProvider, a3);
    v5 = [(VUISeasonDownloadDataSourceProvider *)v7 tvShowCanonicalId];
    id v6 = +[VUIDownloadButtonViewModel viewModelWithCanonicalId:v5 title:0 episodeCount:[(VUISeasonDownloadDataSourceProvider *)v7 totalEpisodeCount] downloadType:1];
    [(VUIDownloadButton *)self setViewModel:v6];
  }
}

- (void)dealloc
{
  [(VUIDownloadButton *)self setViewModel:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB3D78] object:0];

  v4.receiver = self;
  v4.super_class = (Class)VUIDownloadButton;
  [(VUIDownloadButton *)&v4 dealloc];
}

- (void)setUsesDefaultConfiguration:(BOOL)a3
{
  self->_usesDefaultConfiguration = a3;
  if (a3)
  {
    -[VUIButton setPadding:](self, "setPadding:", 0.0, 0.0, 0.0, 0.0);
    [(VUIButton *)self setImageMaxHeight:28.0];
    [(VUIButton *)self setImageMaxWidth:28.0];
    objc_super v4 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    [(VUIButton *)self setImageTintColor:v4];

    if ([(VUIButton *)self buttonType] == 8)
    {
      [(VUIButton *)self setHeight:28.0];
      [(VUIButton *)self setWidth:28.0];
      [(VUIButton *)self setCornerRadius:14.0];
      v5 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_tertiaryFillColor");
      [(VUIDownloadButton *)self setKeyBackgroundColor:v5];

      id v7 = [(VUIDownloadButton *)self backgroundView];
      id v6 = [(VUIDownloadButton *)self keyBackgroundColor];
      [v7 setVuiBackgroundColor:v6];
    }
  }
}

- (void)setPresentingViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presentingViewController, obj);
    v5 = [(VUIDownloadButton *)self actionHandler];
    [v5 setPresentingViewController:obj];
  }
}

- (void)configureActionHandler
{
  v3 = [VUIDownloadButtonActionHandler alloc];
  objc_super v4 = [(VUIDownloadButton *)self viewModel];
  v5 = [(VUIDownloadButtonActionHandler *)v3 initWithViewModel:v4];

  [(VUIDownloadButtonActionHandler *)v5 setParentView:self];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__VUIDownloadButton_configureActionHandler__block_invoke;
  v8[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v9, &location);
  [(VUIDownloadButtonActionHandler *)v5 setAcknowledgementDownloadDeletedBlock:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__VUIDownloadButton_configureActionHandler__block_invoke_2;
  v6[3] = &unk_1E6DF4A30;
  objc_copyWeak(&v7, &location);
  [(VUIDownloadButtonActionHandler *)v5 setAcknowledgementDownloadCancelledBlock:v6];
  [(VUIDownloadButton *)self setActionHandler:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __43__VUIDownloadButton_configureActionHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setWasDeleted:1];
}

void __43__VUIDownloadButton_configureActionHandler__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setWasCanceled:1];
  [WeakRetained setEnabled:0];
}

- (void)configureWithLayoutProperties
{
  if ([(VUIButton *)self buttonType] && [(VUIButton *)self buttonType] != 3
    || ([MEMORY[0x1E4FB3C90] isMac] & 1) == 0)
  {
    v3 = [(VUIButton *)self buttonBackgroundColor];
    [(VUIDownloadButton *)self setKeyBackgroundColor:v3];

    [(VUIButton *)self setButtonBackgroundColor:0];
    objc_super v4 = [(VUIDownloadButton *)self backgroundView];
    v5 = [(VUIDownloadButton *)self keyBackgroundColor];
    [v4 setVuiBackgroundColor:v5];
  }
  v13.receiver = self;
  v13.super_class = (Class)VUIDownloadButton;
  [(VUIButton *)&v13 configureWithLayoutProperties];
  id v6 = [(VUIDownloadButton *)self viewModel];
  uint64_t v7 = [v6 downloadState];
  BOOL v8 = [(VUIDownloadButton *)self viewModel];
  uint64_t v9 = [v8 isExpired];
  id v10 = [(VUIDownloadButton *)self viewModel];
  uint64_t v11 = [v10 isExpiringSoon];
  v12 = [(VUIDownloadButton *)self viewModel];
  -[VUIDownloadButton _updateButtonToState:isExpired:isExpiringSoon:hasFailed:](self, "_updateButtonToState:isExpired:isExpiringSoon:hasFailed:", v7, v9, v11, [v12 downloadFailedDueToError]);
}

- (void)setTintColor:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VUIDownloadButton;
  [(VUIButton *)&v6 setTintColor:v4];
  if ([(VUIDownloadButton *)self tintAdjustmentMode] != 2)
  {
    v5 = [(VUIDownloadButton *)self progressIndicator];
    [v5 setProgressFillColor:v4];
  }
}

- (void)saturateTintColorAndBackgroundColor
{
  v3 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
  saturatedTintColor = self->_saturatedTintColor;
  self->_saturatedTintColor = v3;

  v5 = [(VUIDownloadButton *)self progressIndicator];
  [v5 setProgressFillColor:self->_saturatedTintColor];

  id v6 = [(VUIButton *)self imageView];
  [v6 _setTintColor:self->_saturatedTintColor];
}

- (void)revertTintColor
{
  id v6 = [(VUIButton *)self imageTintColor];
  v3 = [(VUIDownloadButton *)self progressIndicator];
  [v3 setProgressFillColor:v6];

  id v4 = [(VUIButton *)self imageView];
  [v4 _setTintColor:v6];

  saturatedTintColor = self->_saturatedTintColor;
  self->_saturatedTintColor = 0;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v28.receiver = self;
  v28.super_class = (Class)VUIDownloadButton;
  -[VUIButton vui_layoutSubviews:computationOnly:](&v28, sel_vui_layoutSubviews_computationOnly_);
  double v9 = v8;
  double v11 = v10;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__VUIDownloadButton_vui_layoutSubviews_computationOnly___block_invoke;
  aBlock[3] = &unk_1E6DFDAD0;
  aBlock[4] = self;
  *(double *)&aBlock[5] = width;
  *(double *)&aBlock[6] = height;
  *(double *)&aBlock[7] = v8;
  *(double *)&aBlock[8] = v10;
  v12 = (double (**)(void, double, double))_Block_copy(aBlock);
  if (v4)
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    unint64_t v15 = [(VUIButton *)self buttonType];
    if (v9 == v13 && v11 == v14)
    {
      if (v15 == 6)
      {
        objc_super v18 = [(VUIDownloadButton *)self progressIndicator];

        if (v18)
        {
          v19 = [(VUIDownloadButton *)self progressIndicator];
          objc_msgSend(v19, "vui_sizeThatFits:", width, height);
          double v9 = v20;
          double v11 = v21;
        }
      }
    }
    else if (v15 == 8)
    {
      double v9 = v12[2](v12, v9, v11);
      double v11 = v17;
    }
  }
  v22 = [(VUIDownloadButton *)self progressIndicator];

  if (v22) {
    [(VUIDownloadButton *)self _layoutProgressIndicator];
  }
  v23 = [(VUIDownloadButton *)self backgroundView];
  objc_msgSend(v23, "setFrame:", 0.0, 0.0, v9, v11);

  v24 = [(VUIDownloadButton *)self backgroundView];
  [(VUIButton *)self cornerRadius];
  objc_msgSend(v24, "_setCornerRadius:");

  double v25 = v9;
  double v26 = v11;
  result.double height = v26;
  result.double width = v25;
  return result;
}

double __56__VUIDownloadButton_vui_layoutSubviews_computationOnly___block_invoke(uint64_t a1, double a2)
{
  BOOL v4 = [*(id *)(a1 + 32) viewModel];
  if ([v4 downloadState]) {
    int v5 = 0;
  }
  else {
    int v5 = [*(id *)(a1 + 32) _hasTextForNotDownloadState];
  }

  id v6 = [*(id *)(a1 + 32) viewModel];
  if ([v6 downloadState] == 4) {
    int v7 = [*(id *)(a1 + 32) showsTextInDownloadedState];
  }
  else {
    int v7 = 0;
  }

  if ((v5 | v7) == 1)
  {
    double v8 = [*(id *)(a1 + 32) textContentView];

    if (v8)
    {
      double v9 = [*(id *)(a1 + 32) textContentView];
      objc_msgSend(v9, "vui_sizeThatFits:", *(double *)(a1 + 40), *(double *)(a1 + 48));
      double v11 = v10;

      [*(id *)(a1 + 32) imageMargin];
      double v13 = v12;
      double v14 = [*(id *)(a1 + 32) textContentView];
      unint64_t v15 = [v14 textLayout];
      [v15 margin];
      a2 = a2 + v11 + v13 + v16;
    }
    [*(id *)(a1 + 32) padding];
    double v18 = v17;
    [*(id *)(a1 + 32) padding];
    a2 = a2 + v18 + v19;
    [*(id *)(a1 + 32) padding];
    [*(id *)(a1 + 32) padding];
    [*(id *)(a1 + 32) height];
    if (v20 > 0.0) {
      [*(id *)(a1 + 32) height];
    }
  }
  return a2;
}

- (void)vui_didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)VUIDownloadButton;
  [(VUIDownloadButton *)&v6 vui_didMoveToWindow];
  v3 = [(VUIDownloadButton *)self window];

  BOOL v4 = +[VUIUnifiedMessagingRegistry sharedInstance];
  int v5 = v4;
  if (v3) {
    [v4 registerDownloadButton:self];
  }
  else {
    [v4 unRegisterDownloadButton:self];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = v12;
  if ((void *)__ViewModelDownloadStateContext == a6)
  {
    double v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];
    unint64_t v15 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if (v14)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            -[VUIDownloadButton _updateButtonToState:oldState:](self, "_updateButtonToState:oldState:", [v15 unsignedIntegerValue], objc_msgSend(v14, "unsignedIntegerValue"));
          }
        }
      }
    }

    goto LABEL_12;
  }
  if ((void *)__ViewModelDownloadExpirationDateContext == a6)
  {
    double v14 = [(VUIDownloadButton *)self viewModel];
    uint64_t v29 = [v14 downloadState];
    double v16 = [(VUIDownloadButton *)self viewModel];
    id v17 = v11;
    id v18 = v10;
    uint64_t v19 = [v16 isExpired];
    double v20 = [(VUIDownloadButton *)self viewModel];
    uint64_t v21 = [v20 isExpiringSoon];
    v22 = [(VUIDownloadButton *)self viewModel];
    uint64_t v23 = [v22 downloadFailedDueToError];
    uint64_t v24 = v19;
    id v10 = v18;
    id v11 = v17;
    [(VUIDownloadButton *)self _updateButtonToState:v29 isExpired:v24 isExpiringSoon:v21 hasFailed:v23];

LABEL_12:
    goto LABEL_13;
  }
  if ((void *)__ViewModelDownloadProgressContext == a6)
  {
    double v25 = VUIDefaultLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      double v26 = [(VUIDownloadButton *)self viewModel];
      [v26 downloadProgress];
      *(_DWORD *)buf = 134217984;
      uint64_t v32 = v27;
      _os_log_impl(&dword_1E2BD7000, v25, OS_LOG_TYPE_DEFAULT, "VUIDownloadButton:: update download progress %f", buf, 0xCu);
    }
    objc_super v28 = [(VUIDownloadButton *)self viewModel];
    [v28 downloadProgress];
    -[VUIDownloadButton _updateDownloadProgress:animated:](self, "_updateDownloadProgress:animated:", 1);
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)VUIDownloadButton;
    [(VUIDownloadButton *)&v30 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
LABEL_13:
}

- (void)setViewModel:(id)a3
{
  int v5 = (VUIDownloadButtonViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    int v7 = v5;
    if (viewModel)
    {
      -[VUIDownloadButton _stopObservingViewModel:](self, "_stopObservingViewModel:");
      [(VUIDownloadButton *)self _stopObservingDownloadProgress:self->_viewModel];
    }
    objc_storeStrong((id *)&self->_viewModel, a3);
    int v5 = v7;
    if (v7)
    {
      [(VUIDownloadButton *)self configureActionHandler];
      [(VUIDownloadButton *)self _startObservingViewModel:v7];
      [(VUIDownloadButton *)self _updateButtonToState:[(VUIDownloadButtonViewModel *)v7 downloadState] isExpired:[(VUIDownloadButtonViewModel *)v7 isExpired] isExpiringSoon:[(VUIDownloadButtonViewModel *)v7 isExpiringSoon] hasFailed:[(VUIDownloadButtonViewModel *)v7 downloadFailedDueToError]];
      int v5 = v7;
    }
  }
}

- (void)setNotDownloadStateText:(id)a3
{
  int v5 = (NSString *)a3;
  if (self->_notDownloadStateText != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)&self->_notDownloadStateText, a3);
    objc_super v6 = [(VUIDownloadButton *)self _buttonPropertiesForState:0 isExpired:0 isExpiringSoon:0 hasFailed:0];
    [(VUIDownloadButton *)self _updateButtonToNotDownloadedWithProperties:v6];

    int v5 = v7;
  }
}

- (void)setShowsTextInDownloadedState:(BOOL)a3
{
  self->_showsTextInDownloadedState = a3;
  if (a3)
  {
    BOOL v4 = [(VUIDownloadButton *)self viewModel];
    uint64_t v5 = [v4 downloadState];

    if (v5 == 4)
    {
      id v6 = [(VUIDownloadButton *)self _buttonPropertiesForState:4 isExpired:0 isExpiringSoon:0 hasFailed:0];
      [(VUIDownloadButton *)self _updateButtonToDownloadedWithProperties:v6];
    }
  }
}

- (void)updateWithAssetController:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDownloadButton *)self viewModel];
  [v5 setAssetController:v4];
}

- (void)updateWithPlayable:(id)a3 textLayout:(id)a4
{
  +[VUIDownloadButtonViewModel viewModelWithVideosPlayable:](VUIDownloadButtonViewModel, "viewModelWithVideosPlayable:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(VUIDownloadButton *)self setViewModel:v5];
}

- (void)setScrolledNonUberPercentage:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VUIDownloadButton;
  -[VUIButton setScrolledNonUberPercentage:](&v6, sel_setScrolledNonUberPercentage_);
  id v5 = [(VUIDownloadButton *)self backgroundView];
  [v5 setHidden:a3 == 0.0];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)VUIDownloadButton;
  -[VUIButton setHighlighted:](&v6, sel_setHighlighted_);
  if ([(VUIButton *)self buttonType] == 8)
  {
    double v5 = 1.0;
    if (v3) {
      double v5 = 0.5;
    }
    [(VUIDownloadButton *)self setVuiAlpha:v5];
  }
}

- (CGSize)_imageSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v6 = [(VUIDownloadButton *)self viewModel];
  BOOL v7 = +[VUIDownloadButtonViewModel shouldShowExpiredImageWithDownloadState:isExpired:isExpiringSoon:hasFailed:](VUIDownloadButtonViewModel, "shouldShowExpiredImageWithDownloadState:isExpired:isExpiringSoon:hasFailed:", [v6 downloadState], objc_msgSend(v6, "isExpired"), objc_msgSend(v6, "isExpiringSoon"), objc_msgSend(v6, "downloadFailedDueToError"));
  if ([v6 downloadState] != 4 || v7)
  {
    id v12 = [(VUIButton *)self imageView];
    objc_msgSend(v12, "vui_sizeThatFits:", width, height);
    double v9 = v13;
    double v11 = v14;
  }
  else
  {
    [(VUIDownloadButton *)self bounds];
    double v9 = v8 + 5.0;
    [(VUIDownloadButton *)self bounds];
    double v11 = v10 + 5.0;
  }

  double v15 = v9;
  double v16 = v11;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)_setupDownloadButton
{
  BOOL v3 = [MEMORY[0x1E4FB1830] configurationWithPointSize:7 weight:2 scale:16.0];
  primarySymbolConfiguration = self->_primarySymbolConfiguration;
  self->_primarySymbolConfiguration = v3;

  [(CAShapeLayer *)self->_backgroundMaskingLayer removeFromSuperlayer];
  [(UIView *)self->_backgroundView removeFromSuperview];
  double v5 = (UIView *)objc_opt_new();
  backgroundView = self->_backgroundView;
  self->_backgroundView = v5;

  BOOL v7 = [(VUIDownloadButton *)self subviews];
  id v13 = [v7 firstObject];

  [(VUIDownloadButton *)self vui_insertSubview:self->_backgroundView belowSubview:v13 oldView:0];
  double v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
  backgroundMaskingLayer = self->_backgroundMaskingLayer;
  self->_backgroundMaskingLayer = v8;

  double v10 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
  backdropMaskingLayer = self->_backdropMaskingLayer;
  self->_backdropMaskingLayer = v10;

  uint64_t v12 = *MEMORY[0x1E4F39FB8];
  [(CAShapeLayer *)self->_backgroundMaskingLayer setFillRule:*MEMORY[0x1E4F39FB8]];
  [(CAShapeLayer *)self->_backdropMaskingLayer setFillRule:v12];
}

- (void)_updateMaskForProgressLayer
{
  LODWORD(v2) = 1.0;
  [(CAShapeLayer *)self->_backdropMaskingLayer setOpacity:v2];
  progressIndicator = self->_progressIndicator;
  if (progressIndicator)
  {
    [(VUICircularProgress *)progressIndicator bounds];
    double v6 = v5 * 0.5;
    [(VUICircularProgress *)self->_progressIndicator vuiCenter];
    double v8 = v7;
    double v10 = v9;
    +[VUIBezierPath vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if ([(VUICircularProgress *)self->_progressIndicator isIndeterminate])
    {
      double v11 = +[VUIBezierPath vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v10, v6, -1.57079633, 4.71238898);
    }
    else
    {
      VUIRoundValue();
      VUIRoundValue();
      double v11 = +[VUIBezierPath vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:](VUIBezierPath, "vui_bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v8, v10, v12, -1.57079633, 4.71238898);
      LODWORD(v13) = 0.75;
      [(CAShapeLayer *)self->_backdropMaskingLayer setOpacity:v13];
    }
    [v18 appendBezierPath:v11];
    -[CAShapeLayer setPath:](self->_backgroundMaskingLayer, "setPath:", [v18 vuiCGPath]);
    -[CAShapeLayer setPath:](self->_backdropMaskingLayer, "setPath:", [v18 vuiCGPath]);
    double v14 = [(VUIDownloadButton *)self backgroundView];
    double v15 = [v14 layer];
    [v15 setMask:self->_backgroundMaskingLayer];

    double v16 = [(VUIButton *)self backdropView];
    id v17 = [v16 layer];
    [v17 setMask:self->_backdropMaskingLayer];
  }
}

- (void)_clearMasks
{
  BOOL v3 = [(VUIDownloadButton *)self backgroundView];
  id v4 = [v3 layer];
  [v4 setMask:0];

  id v6 = [(VUIButton *)self backdropView];
  double v5 = [v6 layer];
  [v5 setMask:0];
}

- (void)_layoutProgressIndicator
{
  BOOL v3 = [(VUIDownloadButton *)self progressIndicator];
  [(VUIDownloadButton *)self bounds];
  objc_msgSend(v3, "setFrame:");

  [(VUIDownloadButton *)self _updateMaskForProgressLayer];
}

- (void)_setTitleWithProperties:(id)a3
{
  id v14 = a3;
  if ([v14 hasTitle]
    && ([v14 title],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v5))
  {
    id v6 = [(VUIButton *)self textContentView];
    double v7 = [v6 textLayout];
    if (v7)
    {
      double v8 = [(VUIButton *)self textContentView];
      double v9 = [v8 textLayout];
    }
    else
    {
      double v9 = [(VUIDownloadButton *)self textLayout];
    }

    double v10 = [(VUIButton *)self textContentView];

    double v11 = [v14 title];
    if (v10)
    {
      double v12 = [(VUIButton *)self textContentView];
      id v13 = +[VUILabel labelWithString:v11 textLayout:v9 existingLabel:v12];
    }
    else
    {
      double v12 = +[VUILabel labelWithString:v11 textLayout:v9 existingLabel:0];
      [(VUIButton *)self setTextContentView:v12];
    }
  }
  else
  {
    [(VUIButton *)self setTextContentView:0];
  }
  [(VUIDownloadButton *)self invalidateIntrinsicContentSize];
}

- (BOOL)_hasTextForNotDownloadState
{
  BOOL v3 = [(VUIDownloadButton *)self viewModel];
  char v4 = [v3 downloadFailedDueToError];

  uint64_t v5 = [(VUIDownloadButton *)self viewModel];
  char v6 = [v5 isExpired];

  BOOL v7 = 0;
  if ((v4 & 1) == 0 && (v6 & 1) == 0)
  {
    double v8 = [(VUIDownloadButton *)self notDownloadStateText];
    BOOL v7 = [v8 length] != 0;
  }
  return v7;
}

- (void)_setImage:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    [(VUIButton *)self setImageTrailsTextContent:0];
    char v4 = [(VUIButton *)self imageView];
    if (v4)
    {
      uint64_t v5 = v4;
      [v4 setImage:v6];
    }
    else
    {
      uint64_t v5 = objc_opt_new();
      [v5 setImage:v6];
      [(VUIButton *)self setImageView:v5];
    }
    [v5 setVuiUserInteractionEnabled:0];
    [(VUIDownloadButton *)self vui_setNeedsLayout];
  }
  else
  {
    [(VUIButton *)self setImageView:0];
  }
}

- (id)_notDownloadedImage
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__VUIDownloadButton__notDownloadedImage__block_invoke;
  v4[3] = &unk_1E6DF3F68;
  uint64_t v5 = @"arrow.down";
  id v6 = self;
  if (_notDownloadedImage_onceToken != -1) {
    dispatch_once(&_notDownloadedImage_onceToken, v4);
  }
  id v2 = (id)_notDownloadedImage_sNotDownloadedImage;

  return v2;
}

void __40__VUIDownloadButton__notDownloadedImage__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 936);
  id v8 = +[VUILocalizationManager sharedInstance];
  char v4 = [v8 localizedStringForKey:@"TV.Image.Not.Downloaded.VO"];
  uint64_t v5 = [v1 vuiSystemImageNamed:v2 withConfiguration:v3 accessibilityDescription:v4];
  uint64_t v6 = [v5 vuiTemplateImage];
  BOOL v7 = (void *)_notDownloadedImage_sNotDownloadedImage;
  _notDownloadedImage_sNotDownloadedImage = v6;
}

- (id)_downloadedImage
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__VUIDownloadButton__downloadedImage__block_invoke;
  block[3] = &unk_1E6DF3D58;
  block[4] = self;
  if (_downloadedImage_onceToken != -1) {
    dispatch_once(&_downloadedImage_onceToken, block);
  }
  return (id)_downloadedImage_sDownloadedImage;
}

void __37__VUIDownloadButton__downloadedImage__block_invoke()
{
  id v6 = [MEMORY[0x1E4FB1830] configurationWithPointSize:5 weight:3 scale:16.0];
  v0 = (void *)MEMORY[0x1E4FB1818];
  v1 = +[VUILocalizationManager sharedInstance];
  uint64_t v2 = [v1 localizedStringForKey:@"TV.Image.Downloaded.VO"];
  uint64_t v3 = [v0 vuiSystemImageNamed:@"arrow.down.circle.fill" withConfiguration:v6 accessibilityDescription:v2];
  uint64_t v4 = [v3 vuiTemplateImage];
  uint64_t v5 = (void *)_downloadedImage_sDownloadedImage;
  _downloadedImage_sDownloadedImage = v4;
}

- (id)_pausedImage
{
  return 0;
}

- (id)_expiredDownloadImage
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__VUIDownloadButton__expiredDownloadImage__block_invoke;
  v4[3] = &unk_1E6DF3F68;
  uint64_t v5 = @"exclamationmark";
  id v6 = self;
  if (_expiredDownloadImage_onceToken != -1) {
    dispatch_once(&_expiredDownloadImage_onceToken, v4);
  }
  id v2 = (id)_expiredDownloadImage_sExpiredImage;

  return v2;
}

void __42__VUIDownloadButton__expiredDownloadImage__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4FB1818];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 936);
  id v8 = +[VUILocalizationManager sharedInstance];
  uint64_t v4 = [v8 localizedStringForKey:@"TV.Image.Download.Expired.VO"];
  uint64_t v5 = [v1 vuiSystemImageNamed:v2 withConfiguration:v3 accessibilityDescription:v4];
  uint64_t v6 = [v5 vuiTemplateImage];
  BOOL v7 = (void *)_expiredDownloadImage_sExpiredImage;
  _expiredDownloadImage_sExpiredImage = v6;
}

- (id)_imageForDownloadState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6
{
  if (+[VUIDownloadButtonViewModel shouldShowExpiredImageWithDownloadState:a3 isExpired:a4 isExpiringSoon:a5 hasFailed:a6])
  {
    id v8 = [(VUIDownloadButton *)self _expiredDownloadImage];
    goto LABEL_9;
  }
  switch(a3)
  {
    case 0uLL:
      goto LABEL_6;
    case 4uLL:
      id v8 = [(VUIDownloadButton *)self _downloadedImage];
      break;
    case 3uLL:
LABEL_6:
      id v8 = [(VUIDownloadButton *)self _notDownloadedImage];
      break;
    default:
      id v8 = 0;
      break;
  }
LABEL_9:
  return v8;
}

- (void)_updateButtonToState:(unint64_t)a3 oldState:(unint64_t)a4
{
  if (a3 != a4)
  {
    BOOL v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"VUIUnifiedMessagingRegistryActiveButtonsDidChange" object:self];
  }
  if (a3 > 5 || ((1 << a3) & 0x26) == 0)
  {
    id v8 = [(VUIDownloadButton *)self viewModel];
    uint64_t v9 = [v8 isExpired];
    double v10 = [(VUIDownloadButton *)self viewModel];
    uint64_t v11 = [v10 isExpiringSoon];
    double v12 = [(VUIDownloadButton *)self viewModel];
    -[VUIDownloadButton _updateButtonToState:isExpired:isExpiringSoon:hasFailed:](self, "_updateButtonToState:isExpired:isExpiringSoon:hasFailed:", a3, v9, v11, [v12 downloadFailedDueToError]);

    if (a3 != a4) {
      goto LABEL_10;
    }
LABEL_8:
    if (![(VUIDownloadButton *)self wasDeleted] && ![(VUIDownloadButton *)self wasCanceled]) {
      return;
    }
    goto LABEL_10;
  }
  if (a3 == a4) {
    goto LABEL_8;
  }
  [(VUIDownloadButton *)self _updateButtonToState:a3 isExpired:0 isExpiringSoon:0 hasFailed:0];
LABEL_10:
  id v13 = [(VUIDownloadButton *)self downloadStateChangeHandler];

  if (v13)
  {
    id v14 = [(VUIDownloadButton *)self downloadStateChangeHandler];
    ((void (**)(void, unint64_t, BOOL, BOOL))v14)[2](v14, a3, [(VUIDownloadButton *)self wasDeleted], [(VUIDownloadButton *)self wasCanceled]);
  }
  [(VUIDownloadButton *)self setWasDeleted:0];
  [(VUIDownloadButton *)self setWasCanceled:0];
}

- (void)_updateButtonToState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6
{
  id v8 = [(VUIDownloadButton *)self _buttonPropertiesForState:a3 isExpired:a4 isExpiringSoon:a5 hasFailed:a6];
  -[VUIButton setEnabled:](self, "setEnabled:", [v8 isEnabled]);
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      [(VUIDownloadButton *)self _updateButtonToNotDownloadedWithProperties:v8];
      break;
    case 1uLL:
      [(VUIDownloadButton *)self _updateButtonToConnectingWithProperties:v8];
      break;
    case 2uLL:
      [(VUIDownloadButton *)self _updateButtonToDownloadingWithProperties:v8];
      break;
    case 4uLL:
      [(VUIDownloadButton *)self _updateButtonToDownloadedWithProperties:v8];
      break;
    case 5uLL:
      [(VUIDownloadButton *)self _updateButtonToEnqueuedWithProperties:v8];
      break;
    default:
      break;
  }
  [(VUIDownloadButton *)self _updateImageViewTintColorWithDownloadState:a3];
  [(VUIDownloadButton *)self vui_setNeedsLayout];
}

- (void)_updateButtonToNotDownloadedWithProperties:(id)a3
{
  id v7 = a3;
  if ([v7 hasImage])
  {
    uint64_t v4 = [v7 image];
    [(VUIDownloadButton *)self _setImage:v4];
  }
  [(VUIDownloadButton *)self _clearMasks];
  [(VUIDownloadButton *)self _setTitleWithProperties:v7];
  uint64_t v5 = [(VUIDownloadButton *)self progressIndicator];
  objc_msgSend(v5, "vui_removeFromSuperView");

  [(VUIDownloadButton *)self setProgressIndicator:0];
  uint64_t v6 = [(VUIDownloadButton *)self viewModel];
  [(VUIDownloadButton *)self _stopObservingDownloadProgress:v6];
}

- (void)_updateButtonToConnectingWithProperties:(id)a3
{
  id v16 = a3;
  -[VUIDownloadButton _setTitleWithProperties:](self, "_setTitleWithProperties:");
  uint64_t v4 = [(VUIDownloadButton *)self progressIndicator];

  if (!v4)
  {
    uint64_t v5 = [(VUIButton *)self imageView];

    if (v5)
    {
      uint64_t v6 = [(VUIButton *)self imageView];
      [v6 frame];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
    }
    else
    {
      double v12 = 28.0;
      double v10 = 0.0;
      double v14 = 28.0;
      double v8 = 0.0;
    }
    -[VUIDownloadButton _insertProgressIndicatorWithFrame:](self, "_insertProgressIndicatorWithFrame:", v8, v10, v12, v14);
  }
  double v15 = [v16 image];
  [(VUIDownloadButton *)self _setImage:v15];

  [(VUIDownloadButton *)self _configureProgressIndicatorWithProperties:v16];
}

- (void)_updateButtonToDownloadingWithProperties:(id)a3
{
  id v16 = a3;
  -[VUIDownloadButton _setTitleWithProperties:](self, "_setTitleWithProperties:");
  uint64_t v4 = [(VUIDownloadButton *)self progressIndicator];

  if (!v4)
  {
    uint64_t v5 = [(VUIButton *)self imageView];

    if (v5)
    {
      uint64_t v6 = [(VUIButton *)self imageView];
      [v6 frame];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
    }
    else
    {
      double v12 = 28.0;
      double v10 = 0.0;
      double v14 = 28.0;
      double v8 = 0.0;
    }
    -[VUIDownloadButton _insertProgressIndicatorWithFrame:](self, "_insertProgressIndicatorWithFrame:", v8, v10, v12, v14);
  }
  [(VUIDownloadButton *)self _configureProgressIndicatorWithProperties:v16];
  double v15 = [(VUIDownloadButton *)self viewModel];
  [(VUIDownloadButton *)self _startObservingDownloadProgress:v15];

  [(VUIDownloadButton *)self _setImage:0];
}

- (void)_updateButtonToEnqueuedWithProperties:(id)a3
{
  id v16 = a3;
  -[VUIDownloadButton _setTitleWithProperties:](self, "_setTitleWithProperties:");
  uint64_t v4 = [(VUIDownloadButton *)self progressIndicator];

  if (!v4)
  {
    uint64_t v5 = [(VUIButton *)self imageView];

    if (v5)
    {
      uint64_t v6 = [(VUIButton *)self imageView];
      [v6 frame];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
    }
    else
    {
      double v12 = 28.0;
      double v10 = 0.0;
      double v14 = 28.0;
      double v8 = 0.0;
    }
    -[VUIDownloadButton _insertProgressIndicatorWithFrame:](self, "_insertProgressIndicatorWithFrame:", v8, v10, v12, v14);
  }
  [(VUIDownloadButton *)self _configureProgressIndicatorWithProperties:v16];
  double v15 = [(VUIDownloadButton *)self viewModel];
  [(VUIDownloadButton *)self _startObservingDownloadProgress:v15];

  [(VUIDownloadButton *)self _setImage:0];
}

- (void)_updateButtonToDownloadedWithProperties:(id)a3
{
  id v13 = a3;
  [(VUIDownloadButton *)self _setTitleWithProperties:v13];
  if (([v13 hasTitle] & 1) == 0
    && [(VUIDownloadButton *)self showsTextInDownloadedState])
  {
    uint64_t v4 = [(VUIButton *)self textContentView];
    uint64_t v5 = [v4 textLayout];
    if (v5)
    {
      uint64_t v6 = [(VUIButton *)self textContentView];
      double v7 = [v6 textLayout];
    }
    else
    {
      double v7 = [(VUIDownloadButton *)self textLayout];
    }

    double v8 = [v13 title];
    double v9 = +[VUILabel labelWithString:v8 textLayout:v7 existingLabel:0];
    [(VUIButton *)self setTextContentView:v9];
  }
  if ([v13 hasImage])
  {
    double v10 = [v13 image];
    [(VUIDownloadButton *)self _setImage:v10];
  }
  [(VUIDownloadButton *)self _clearMasks];
  double v11 = [(VUIDownloadButton *)self progressIndicator];
  objc_msgSend(v11, "vui_removeFromSuperView");

  [(VUIDownloadButton *)self setProgressIndicator:0];
  double v12 = [(VUIDownloadButton *)self viewModel];
  [(VUIDownloadButton *)self _stopObservingDownloadProgress:v12];
}

- (void)_updateImageViewTintColorWithDownloadState:(unint64_t)a3
{
  id v5 = [(VUIButton *)self imageView];
  uint64_t v4 = [(VUIButton *)self imageTintColor];
  [v5 _setTintColor:v4];
}

- (void)_updateDownloadProgress:(double)a3 animated:(BOOL)a4
{
  uint64_t v6 = [(VUIDownloadButton *)self progressIndicator];

  if (v6)
  {
    id v7 = [(VUIDownloadButton *)self progressIndicator];
    [v7 setProgress:a3];
  }
}

- (id)_buttonPropertiesForState:(unint64_t)a3 isExpired:(BOOL)a4 isExpiringSoon:(BOOL)a5 hasFailed:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  double v11 = objc_opt_new();
  BOOL v12 = [(VUIButton *)self buttonType] != 8 && [(VUIButton *)self buttonType] != 6;
  [v11 setHasTitle:v12];
  id v13 = [(VUIDownloadButton *)self _imageForDownloadState:a3 isExpired:v8 isExpiringSoon:v7 hasFailed:v6];
  [v11 setImage:v13];

  [v11 setHasImage:1];
  [v11 setDownloadState:a3];
  double v14 = [(VUIDownloadButton *)self viewModel];
  [v14 downloadProgress];
  objc_msgSend(v11, "setProgress:");

  [v11 setEnabled:1];
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      double v15 = [(VUIDownloadButton *)self notDownloadStateText];
      BOOL v16 = [(VUIDownloadButton *)self _hasTextForNotDownloadState];
      BOOL v17 = v16;
      if (v8)
      {
        id v18 = +[VUILocalizationManager sharedInstance];
        uint64_t v19 = v18;
        double v20 = @"RENEW";
      }
      else
      {
        if (v16)
        {
          [v11 setTitle:v15];
          goto LABEL_19;
        }
        id v18 = +[VUILocalizationManager sharedInstance];
        uint64_t v19 = v18;
        double v20 = @"BUTTON_DOWNLOAD";
      }
      uint64_t v27 = [v18 localizedStringForKey:v20];
      [v11 setTitle:v27];

LABEL_19:
      [v11 setIndeterminate:0];
      [v11 setHasTitle:v17];

LABEL_20:
      return v11;
    case 1uLL:
      [v11 setHasBorder:0];
      [v11 setHasImage:0];
      [v11 setHasTitle:0];
      uint64_t v21 = v11;
      uint64_t v22 = 1;
      goto LABEL_9;
    case 2uLL:
    case 5uLL:
      [v11 setHasBorder:1];
      [v11 setHasImage:0];
      [v11 setHasTitle:0];
      uint64_t v21 = v11;
      uint64_t v22 = 0;
LABEL_9:
      [v21 setIndeterminate:v22];
      goto LABEL_20;
    case 4uLL:
      [v11 setIndeterminate:0];
      uint64_t v23 = +[VUILocalizationManager sharedInstance];
      uint64_t v24 = v23;
      if (v8) {
        double v25 = @"RENEW";
      }
      else {
        double v25 = @"BUTTON_DOWNLOADED";
      }
      double v26 = [v23 localizedStringForKey:v25];
      [v11 setTitle:v26];

      goto LABEL_20;
    default:
      [v11 setHasTitle:0];
      goto LABEL_20;
  }
}

- (void)_insertProgressIndicatorWithFrame:(CGRect)a3
{
  if (!self->_progressIndicator)
  {
    BOOL v8 = -[VUICircularProgress initWithFrame:]([VUICircularProgress alloc], "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    uint64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(VUICircularProgress *)v8 setVuiBackgroundColor:v4];

    [(VUICircularProgress *)v8 setProgressBgHidden:1];
    VUIRoundValue();
    -[VUICircularProgress setProgressWidth:](v8, "setProgressWidth:");
    VUIRoundValue();
    -[VUICircularProgress setIndeterminateWidth:](v8, "setIndeterminateWidth:");
    [(VUICircularProgress *)v8 setCenterSquareWidth:7.0];
    [(VUICircularProgress *)v8 setCenterSquareCornerRadius:1.5];
    [(VUICircularProgress *)v8 setVuiClipsToBounds:0];
    id v5 = [(VUIDownloadButton *)self viewModel];
    uint64_t v6 = [v5 downloadType];

    if (v6 == 1)
    {
      BOOL v7 = [(VUIDownloadButton *)self _notDownloadedImage];
      [(VUICircularProgress *)v8 setCenterImage:v7];
    }
    [(VUIDownloadButton *)self vui_addSubview:v8 oldView:0];
    [(VUIDownloadButton *)self setProgressIndicator:v8];
  }
}

- (void)_configureProgressIndicatorWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIDownloadButton *)self progressIndicator];
  uint64_t v6 = [v5 vuiLayer];
  [v6 removeAllAnimations];

  BOOL v7 = [(VUIDownloadButton *)self progressIndicator];
  [v7 setVuiUserInteractionEnabled:0];

  uint64_t v8 = [(VUIButton *)self imageTintColor];
  if (!v8)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
  }
  id v18 = (id)v8;
  double v9 = [(VUIDownloadButton *)self saturatedTintColor];

  if (v9)
  {
    uint64_t v10 = [(VUIDownloadButton *)self saturatedTintColor];

    id v18 = (id)v10;
  }
  double v11 = [(VUIDownloadButton *)self progressIndicator];
  [v11 setVuiTintColor:v18];

  BOOL v12 = [(VUIDownloadButton *)self progressIndicator];
  [v12 setProgressFillColor:v18];

  id v13 = [v18 colorWithAlphaComponent:0.2];
  double v14 = [(VUIDownloadButton *)self progressIndicator];
  [v14 setProgressBgColor:v13];

  double v15 = [(VUIDownloadButton *)self progressIndicator];
  [v4 progress];
  objc_msgSend(v15, "setProgress:");

  BOOL v16 = [(VUIDownloadButton *)self progressIndicator];
  uint64_t v17 = [v4 isInderminate];

  [v16 setIndeterminate:v17];
}

- (void)_startObservingViewModel:(id)a3
{
  uint64_t v4 = __ViewModelDownloadStateContext;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"downloadState" options:3 context:v4];
  [v5 addObserver:self forKeyPath:@"downloadExpirationDate" options:3 context:__ViewModelDownloadExpirationDateContext];
}

- (void)_stopObservingViewModel:(id)a3
{
  uint64_t v4 = __ViewModelDownloadStateContext;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"downloadState" context:v4];
  [v5 removeObserver:self forKeyPath:@"downloadExpirationDate" context:__ViewModelDownloadExpirationDateContext];
}

- (void)_startObservingDownloadProgress:(id)a3
{
  id v4 = a3;
  if (![(VUIDownloadButton *)self observingDownloadProgress])
  {
    [v4 addObserver:self forKeyPath:@"downloadProgress" options:5 context:__ViewModelDownloadProgressContext];
    [(VUIDownloadButton *)self setObservingDownloadProgress:1];
  }
}

- (void)_stopObservingDownloadProgress:(id)a3
{
  id v4 = a3;
  if ([(VUIDownloadButton *)self observingDownloadProgress])
  {
    [(VUIDownloadButton *)self setObservingDownloadProgress:0];
    [v4 removeObserver:self forKeyPath:@"downloadProgress" context:__ViewModelDownloadProgressContext];
  }
}

- (VUISeasonDownloadDataSourceProvider)seasonDownloadDataSourceProvider
{
  return self->_seasonDownloadDataSourceProvider;
}

- (VUIDownloadButtonActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(id)a3
{
}

- (BOOL)showsTextInDownloadedState
{
  return self->_showsTextInDownloadedState;
}

- (BOOL)usesDefaultConfiguration
{
  return self->_usesDefaultConfiguration;
}

- (NSString)notDownloadStateText
{
  return self->_notDownloadStateText;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (id)downloadStateChangeHandler
{
  return self->_downloadStateChangeHandler;
}

- (void)setDownloadStateChangeHandler:(id)a3
{
}

- (UIImage)notDownloadedImage
{
  return self->_notDownloadedImage;
}

- (void)setNotDownloadedImage:(id)a3
{
}

- (UIImage)connectingImage
{
  return self->_connectingImage;
}

- (void)setConnectingImage:(id)a3
{
}

- (UIImage)downloadingImage
{
  return self->_downloadingImage;
}

- (void)setDownloadingImage:(id)a3
{
}

- (UIImage)downloadedImage
{
  return self->_downloadedImage;
}

- (void)setDownloadedImage:(id)a3
{
}

- (UIImage)expiredDownloadImage
{
  return self->_expiredDownloadImage;
}

- (void)setExpiredDownloadImage:(id)a3
{
}

- (VUIDownloadButtonViewModel)viewModel
{
  return self->_viewModel;
}

- (VUICircularProgress)progressIndicator
{
  return self->_progressIndicator;
}

- (void)setProgressIndicator:(id)a3
{
}

- (BOOL)observingDownloadProgress
{
  return self->_observingDownloadProgress;
}

- (void)setObservingDownloadProgress:(BOOL)a3
{
  self->_observingDownloadProgress = a3;
}

- (BOOL)wasDeleted
{
  return self->_wasDeleted;
}

- (void)setWasDeleted:(BOOL)a3
{
  self->_wasDeleted = a3;
}

- (BOOL)wasCanceled
{
  return self->_wasCanceled;
}

- (void)setWasCanceled:(BOOL)a3
{
  self->_wasCanceled = a3;
}

- (BOOL)isForLibrary
{
  return self->_isForLibrary;
}

- (void)setIsForLibrary:(BOOL)a3
{
  self->_isForLibrary = a3;
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setTextLayout:(id)a3
{
}

- (UIImageSymbolConfiguration)primarySymbolConfiguration
{
  return self->_primarySymbolConfiguration;
}

- (void)setPrimarySymbolConfiguration:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIColor)keyBackgroundColor
{
  return self->_keyBackgroundColor;
}

- (void)setKeyBackgroundColor:(id)a3
{
}

- (UIColor)saturatedTintColor
{
  return self->_saturatedTintColor;
}

- (void)setSaturatedTintColor:(id)a3
{
}

- (CAShapeLayer)backgroundMaskingLayer
{
  return self->_backgroundMaskingLayer;
}

- (void)setBackgroundMaskingLayer:(id)a3
{
}

- (CAShapeLayer)backdropMaskingLayer
{
  return self->_backdropMaskingLayer;
}

- (void)setBackdropMaskingLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropMaskingLayer, 0);
  objc_storeStrong((id *)&self->_backgroundMaskingLayer, 0);
  objc_storeStrong((id *)&self->_saturatedTintColor, 0);
  objc_storeStrong((id *)&self->_keyBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_primarySymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_expiredDownloadImage, 0);
  objc_storeStrong((id *)&self->_downloadedImage, 0);
  objc_storeStrong((id *)&self->_downloadingImage, 0);
  objc_storeStrong((id *)&self->_connectingImage, 0);
  objc_storeStrong((id *)&self->_notDownloadedImage, 0);
  objc_storeStrong(&self->_downloadStateChangeHandler, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_notDownloadStateText, 0);
  objc_storeStrong((id *)&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_seasonDownloadDataSourceProvider, 0);
}

@end