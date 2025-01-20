@interface PUCropButtonTileViewController
+ (BOOL)shouldShowCropButtonTileForAsset:(id)a3;
- (BOOL)_canShowButton;
- (BOOL)_hasUserZoomedIn;
- (BOOL)hasShownButtonForCurrentAsset;
- (BOOL)isShowingButton;
- (BOOL)presentMenuForTip;
- (BOOL)presentingTip;
- (BOOL)preventDismissal;
- (CGSize)oneUpCropButtonBoundingSize:(id)a3;
- (CGSize)oneUpCropButtonCurrentAspectRatio:(id)a3;
- (CGSize)oneUpCropButtonOriginalAspectRatio:(id)a3;
- (NSTimer)invisibilityTimer;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingViewModel)browsingViewModel;
- (PUCropButtonTileViewControllerDelegate)delegate;
- (PUOneUpCropButton)button;
- (UIView)cropButton;
- (unint64_t)preventDismissalReasons;
- (void)_createButtonIfNeeded;
- (void)_didChangeChromeVisible:(BOOL)a3;
- (void)_didChangeCurrentAsset;
- (void)_didChangeIrisPlaying;
- (void)_didChangeModelTileTransform:(id)a3;
- (void)_dismissButtonAfterDelay;
- (void)_invalidateTimers;
- (void)_layoutSubviews;
- (void)_showButton:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateApplyEDRGainToButton;
- (void)_updatePreventDismissalReason:(unint64_t)a3 activate:(BOOL)a4;
- (void)_updatePreventDismissalReasons;
- (void)becomeReusable;
- (void)dealloc;
- (void)didChangeVisibleRect;
- (void)oneUpCropButton:(id)a3 didSelectAspectRatio:(CGSize)a4;
- (void)setAssetViewModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)setButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHasShownButtonForCurrentAsset:(BOOL)a3;
- (void)setInvisibilityTimer:(id)a3;
- (void)setPresentMenuForTip:(BOOL)a3;
- (void)setPresentingTip:(BOOL)a3;
- (void)setPreventDismissal:(BOOL)a3;
- (void)setPreventDismissalReasons:(unint64_t)a3;
- (void)setShowingButton:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUCropButtonTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invisibilityTimer, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPresentMenuForTip:(BOOL)a3
{
  self->_presentMenuForTip = a3;
}

- (BOOL)presentMenuForTip
{
  return self->_presentMenuForTip;
}

- (void)setHasShownButtonForCurrentAsset:(BOOL)a3
{
  self->_hasShownButtonForCurrentAsset = a3;
}

- (BOOL)hasShownButtonForCurrentAsset
{
  return self->_hasShownButtonForCurrentAsset;
}

- (BOOL)preventDismissal
{
  return self->_preventDismissal;
}

- (unint64_t)preventDismissalReasons
{
  return self->_preventDismissalReasons;
}

- (void)setInvisibilityTimer:(id)a3
{
}

- (NSTimer)invisibilityTimer
{
  return self->_invisibilityTimer;
}

- (void)setShowingButton:(BOOL)a3
{
  self->_showingButton = a3;
}

- (BOOL)isShowingButton
{
  return self->_showingButton;
}

- (void)setButton:(id)a3
{
}

- (PUOneUpCropButton)button
{
  return self->_button;
}

- (BOOL)presentingTip
{
  return self->_presentingTip;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (void)setDelegate:(id)a3
{
}

- (PUCropButtonTileViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUCropButtonTileViewControllerDelegate *)WeakRetained;
}

- (CGSize)oneUpCropButtonOriginalAspectRatio:(id)a3
{
  id v4 = a3;
  v5 = [(PUCropButtonTileViewController *)self assetViewModel];
  v6 = [v5 asset];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    [v7 fetchPropertySetsIfNeeded];
    v8 = [v7 originalMetadataProperties];

    [v8 originalWidth];
    [v8 originalHeight];
    [v8 originalExifOrientation];
    PLOrientationTransformImageSize();
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    [(PUCropButtonTileViewController *)self oneUpCropButtonCurrentAspectRatio:v4];
    double v10 = v13;
    double v12 = v14;
  }

  double v15 = v10;
  double v16 = v12;
  result.height = v16;
  result.width = v15;
  return result;
}

- (CGSize)oneUpCropButtonCurrentAspectRatio:(id)a3
{
  v3 = [(PUCropButtonTileViewController *)self assetViewModel];
  id v4 = [v3 asset];

  double v5 = (double)(unint64_t)[v4 pixelWidth];
  double v6 = (double)(unint64_t)[v4 pixelHeight];

  double v7 = v5;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)oneUpCropButtonBoundingSize:(id)a3
{
  v3 = [(PUTileController *)self tilingView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)oneUpCropButton:(id)a3 didSelectAspectRatio:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v14[1] = *MEMORY[0x1E4F143B8];
  if ([(PUCropButtonTileViewController *)self presentMenuForTip])
  {
    [(PUCropButtonTileViewController *)self setPresentMenuForTip:0];
    id v12 = [(PUCropButtonTileViewController *)self button];
    [v12 presentMenu];
  }
  else
  {
    double v7 = (void *)MEMORY[0x1E4F56658];
    uint64_t v13 = *MEMORY[0x1E4F56558];
    double v8 = [(PUCropButtonTileViewController *)self assetViewModel];
    double v9 = [v8 asset];
    v14[0] = v9;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v7 sendEvent:@"com.apple.photos.CPAnalytics.cropButtonPressed" withPayload:v10];

    [(PUCropButtonTileViewController *)self _showButton:0 animated:0];
    double v11 = [(PUCropButtonTileViewController *)self delegate];
    objc_msgSend(v11, "cropButtonTileViewController:didSelectAspectRatio:", self, width, height);
  }
}

- (void)setPreventDismissal:(BOOL)a3
{
  if (self->_preventDismissal != a3)
  {
    self->_preventDismissal = a3;
    if (!a3) {
      [(PUCropButtonTileViewController *)self _dismissButtonAfterDelay];
    }
  }
}

- (void)setPreventDismissalReasons:(unint64_t)a3
{
  if (self->_preventDismissalReasons != a3)
  {
    self->_preventDismissalReasons = a3;
    [(PUCropButtonTileViewController *)self setPreventDismissal:a3 != 0];
  }
}

- (void)_updatePreventDismissalReason:(unint64_t)a3 activate:(BOOL)a4
{
  if (a4) {
    unint64_t v5 = [(PUCropButtonTileViewController *)self preventDismissalReasons] | a3;
  }
  else {
    unint64_t v5 = [(PUCropButtonTileViewController *)self preventDismissalReasons] & ~a3;
  }
  [(PUCropButtonTileViewController *)self setPreventDismissalReasons:v5];
}

- (void)_updatePreventDismissalReasons
{
  v3 = [(PUCropButtonTileViewController *)self button];
  -[PUCropButtonTileViewController _updatePreventDismissalReason:activate:](self, "_updatePreventDismissalReason:activate:", 1, [v3 presentingMenu]);

  double v4 = [(PUCropButtonTileViewController *)self button];
  -[PUCropButtonTileViewController _updatePreventDismissalReason:activate:](self, "_updatePreventDismissalReason:activate:", 2, [v4 targeted]);

  BOOL v5 = [(PUCropButtonTileViewController *)self presentingTip];
  [(PUCropButtonTileViewController *)self _updatePreventDismissalReason:4 activate:v5];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = [(PUCropButtonTileViewController *)self assetViewModel];
  id v8 = [(PUCropButtonTileViewController *)self browsingViewModel];
  if (v7 == v18)
  {
    id v16 = v6;
    if ([v16 modelTileTransformChanged])
    {
      v17 = [v18 modelTileTransform];
      [(PUCropButtonTileViewController *)self _didChangeModelTileTransform:v17];
    }
    if ([v16 isIrisPlayingChanged]) {
      [(PUCropButtonTileViewController *)self _didChangeIrisPlaying];
    }
  }
  else
  {
    if (v8 != v18) {
      goto LABEL_14;
    }
    id v9 = v6;
    double v10 = [v18 currentAssetReference];
    double v11 = [v10 asset];
    id v12 = [v11 uuid];

    uint64_t v13 = [v18 assetBeforeLastViewedAssetReference];
    double v14 = [v13 asset];
    double v15 = [v14 uuid];

    if ([v9 chromeVisibilityDidChange])
    {
      -[PUCropButtonTileViewController _didChangeChromeVisible:](self, "_didChangeChromeVisible:", [v18 isChromeVisible]);
    }
    else if ([v9 currentAssetDidChange] {
           && ([v12 isEqualToString:v15] & 1) == 0)
    }
    {
      [(PUCropButtonTileViewController *)self _didChangeCurrentAsset];
    }
  }
LABEL_14:
}

- (void)_didChangeIrisPlaying
{
}

- (void)_didChangeCurrentAsset
{
  [(PUCropButtonTileViewController *)self _showButton:0 animated:1];
  [(PUCropButtonTileViewController *)self setHasShownButtonForCurrentAsset:0];
  [(PUCropButtonTileViewController *)self setPresentMenuForTip:0];
}

- (void)_didChangeChromeVisible:(BOOL)a3
{
  if (a3) {
    [(PUCropButtonTileViewController *)self _showButton:0 animated:1];
  }
  [(PUCropButtonTileViewController *)self setPresentMenuForTip:0];
}

- (void)_dismissButtonAfterDelay
{
  v3 = +[PUOneUpSettings sharedInstance];
  [v3 quickCropInvisibilityTimer];
  double v5 = v4;

  if (v5 != 0.0)
  {
    if ([(PUCropButtonTileViewController *)self isShowingButton])
    {
      [(PUCropButtonTileViewController *)self _invalidateTimers];
      objc_initWeak(&location, self);
      id v6 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      double v10 = __58__PUCropButtonTileViewController__dismissButtonAfterDelay__block_invoke;
      double v11 = &unk_1E5F28EB0;
      objc_copyWeak(&v12, &location);
      id v7 = [v6 scheduledTimerWithTimeInterval:0 repeats:&v8 block:v5];
      -[PUCropButtonTileViewController setInvisibilityTimer:](self, "setInvisibilityTimer:", v7, v8, v9, v10, v11);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
  }
}

void __58__PUCropButtonTileViewController__dismissButtonAfterDelay__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained preventDismissal];

  if ((v3 & 1) == 0)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 _showButton:0 animated:1];
  }
}

- (void)_didChangeModelTileTransform:(id)a3
{
  id v6 = a3;
  id v4 = [(PUCropButtonTileViewController *)self assetViewModel];
  if ([v4 isUserTransformingTile]) {
    uint64_t v5 = [v6 isZoomedOut] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }

  [(PUCropButtonTileViewController *)self _showButton:v5 animated:1];
  [(PUCropButtonTileViewController *)self _dismissButtonAfterDelay];
  [(PUCropButtonTileViewController *)self setPresentMenuForTip:0];
}

- (void)_updateApplyEDRGainToButton
{
  id v5 = [(PUCropButtonTileViewController *)self assetViewModel];
  uint64_t v3 = [v5 isHDR];
  id v4 = [(PUCropButtonTileViewController *)self button];
  [v4 setApplyEDRBoost:v3];
}

- (BOOL)_hasUserZoomedIn
{
  v2 = [(PUCropButtonTileViewController *)self assetViewModel];
  uint64_t v3 = [v2 modelTileTransform];
  [v3 scale];
  BOOL v5 = v4 > 1.4;

  return v5;
}

- (BOOL)_canShowButton
{
  uint64_t v3 = [(PUCropButtonTileViewController *)self browsingViewModel];
  BOOL v4 = ([v3 isChromeVisible] & 1) == 0
    && [(PUCropButtonTileViewController *)self _hasUserZoomedIn];

  return v4;
}

- (void)_invalidateTimers
{
  uint64_t v3 = [(PUCropButtonTileViewController *)self invisibilityTimer];
  [v3 invalidate];

  [(PUCropButtonTileViewController *)self setInvisibilityTimer:0];
}

- (void)_showButton:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(PUCropButtonTileViewController *)self _invalidateTimers];
  if ((!v5 || [(PUCropButtonTileViewController *)self _canShowButton])
    && [(PUCropButtonTileViewController *)self isShowingButton] != v5)
  {
    uint64_t v7 = [(PUCropButtonTileViewController *)self button];
    uint64_t v8 = (void *)v7;
    if (v5 || v7)
    {
      if (v5)
      {
        [(PUCropButtonTileViewController *)self _createButtonIfNeeded];
        [(PUCropButtonTileViewController *)self _updateApplyEDRGainToButton];
      }
      [(PUCropButtonTileViewController *)self _layoutSubviews];
      [(PUCropButtonTileViewController *)self setShowingButton:v5];
      uint64_t v9 = [(PUTileViewController *)self view];
      [v9 setUserInteractionEnabled:v5];

      double v10 = [(PUCropButtonTileViewController *)self button];

      [v10 setEnabled:v5];
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __55__PUCropButtonTileViewController__showButton_animated___block_invoke;
      aBlock[3] = &unk_1E5F25410;
      objc_copyWeak(&v22, &location);
      BOOL v23 = v5;
      double v11 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __55__PUCropButtonTileViewController__showButton_animated___block_invoke_2;
      v18[3] = &unk_1E5F2E120;
      id v12 = v10;
      id v19 = v12;
      BOOL v20 = v5;
      uint64_t v13 = _Block_copy(v18);
      double v14 = v13;
      if (v4)
      {
        +[PUOneUpSettings sharedInstance];
        if (v5) {
          double v15 = {;
        }
          [v15 quickCropFadeIn];
        }
        else {
          double v15 = {;
        }
          [v15 quickCropFadeOut];
        }
        double v17 = v16;

        [MEMORY[0x1E4FB1EB0] animateWithDuration:v14 animations:v11 completion:v17];
      }
      else
      {
        (*((void (**)(void *))v13 + 2))(v13);
        v11[2](v11, 1);
      }
      [(PUCropButtonTileViewController *)self setPresentMenuForTip:0];

      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
}

void __55__PUCropButtonTileViewController__showButton_animated___block_invoke(uint64_t a1, int a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    BOOL v5 = [WeakRetained delegate];
    id v6 = objc_loadWeakRetained(v3);
    [v5 cropButtonTileViewController:v6 buttonVisibilityDidChange:*(unsigned __int8 *)(a1 + 40)];

    if (*(unsigned char *)(a1 + 40))
    {
      id v7 = objc_loadWeakRetained(v3);
      char v8 = [v7 hasShownButtonForCurrentAsset];

      if ((v8 & 1) == 0)
      {
        id v9 = objc_loadWeakRetained(v3);
        [v9 setHasShownButtonForCurrentAsset:1];

        id v10 = objc_loadWeakRetained(v3);
        double v11 = [v10 assetViewModel];
        id v12 = [v11 asset];

        if (v12)
        {
          uint64_t v13 = (void *)MEMORY[0x1E4F56658];
          uint64_t v15 = *MEMORY[0x1E4F56558];
          v16[0] = v12;
          double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
          [v13 sendEvent:@"com.apple.photos.CPAnalytics.cropButtonEnabled" withPayload:v14];
        }
      }
    }
  }
}

uint64_t __55__PUCropButtonTileViewController__showButton_animated___block_invoke_2(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

- (void)_createButtonIfNeeded
{
  uint64_t v3 = [(PUCropButtonTileViewController *)self button];

  if (!v3)
  {
    id v5 = [(PUTileViewController *)self view];
    BOOL v4 = objc_alloc_init(PUOneUpCropButton);
    [(PUOneUpCropButton *)v4 setDelegate:self];
    [v5 addSubview:v4];
    [(PUCropButtonTileViewController *)self setButton:v4];
    [(PUCropButtonTileViewController *)self setShowingButton:1];
    [(PUCropButtonTileViewController *)self _showButton:0 animated:0];
    [(PUCropButtonTileViewController *)self _layoutSubviews];
    [(PUCropButtonTileViewController *)self _updatePreventDismissalReasons];
  }
}

- (void)dealloc
{
  [(PUAssetViewModel *)self->_assetViewModel unregisterChangeObserver:self];
  [(PUBrowsingViewModel *)self->_browsingViewModel unregisterChangeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PUCropButtonTileViewController;
  [(PUTileViewController *)&v3 dealloc];
}

- (void)_layoutSubviews
{
  id v13 = [(PUTileViewController *)self view];
  objc_super v3 = [v13 window];
  +[PUOneUpCropButton frameForWindow:v3];
  objc_msgSend(v3, "convertRect:toView:", v13);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(PUCropButtonTileViewController *)self button];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)didChangeVisibleRect
{
  v3.receiver = self;
  v3.super_class = (Class)PUCropButtonTileViewController;
  [(PUTileViewController *)&v3 didChangeVisibleRect];
  [(PUCropButtonTileViewController *)self _layoutSubviews];
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUCropButtonTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUCropButtonTileViewController *)self setAssetViewModel:0];
  [(PUCropButtonTileViewController *)self setBrowsingViewModel:0];
  [(PUCropButtonTileViewController *)self _showButton:0 animated:0];
  [(PUCropButtonTileViewController *)self _updatePreventDismissalReasons];
  [(PUCropButtonTileViewController *)self setPresentMenuForTip:0];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PUCropButtonTileViewController;
  [(PUTileViewController *)&v4 viewDidLoad];
  objc_super v3 = [(PUTileViewController *)self view];
  [v3 setUserInteractionEnabled:0];
}

- (void)setPresentingTip:(BOOL)a3
{
  if (self->_presentingTip != a3)
  {
    self->_presentingTip = a3;
    [(PUCropButtonTileViewController *)self _updatePreventDismissalReasons];
    if (!a3)
    {
      double v5 = [(PUCropButtonTileViewController *)self button];
      int v6 = [v5 isBeingTouched];

      if (v6)
      {
        [(PUCropButtonTileViewController *)self setPresentMenuForTip:1];
      }
    }
  }
}

- (UIView)cropButton
{
  if ([(PUCropButtonTileViewController *)self isShowingButton])
  {
    objc_super v3 = [(PUCropButtonTileViewController *)self button];
  }
  else
  {
    objc_super v3 = 0;
  }
  return (UIView *)v3;
}

- (void)setBrowsingViewModel:(id)a3
{
  double v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    double v7 = v5;
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)self->_browsingViewModel registerChangeObserver:self];
    double v5 = v7;
  }
}

- (void)setAssetViewModel:(id)a3
{
  double v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  if (assetViewModel != v5)
  {
    double v7 = v5;
    [(PUAssetViewModel *)assetViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)self->_assetViewModel registerChangeObserver:self];
    double v5 = v7;
  }
}

+ (BOOL)shouldShowCropButtonTileForAsset:(id)a3
{
  id v3 = a3;
  objc_super v4 = +[PUPhotoEditProtoSettings sharedInstance];
  int v5 = [v4 enableSpatialMediaEditing];

  BOOL v6 = [v3 mediaType] == 1 || objc_msgSend(v3, "mediaType") == 2;
  int v7 = [v3 isCloudSharedAsset];
  int v8 = v6 & ((v7 | [v3 isAnimatedGIF]) ^ 1);
  if (v5 && [v3 mediaType] == 1) {
    int v9 = 1;
  }
  else {
    int v9 = [v3 isSpatialMedia] ^ 1;
  }
  int v10 = v8 & v9;
  int v11 = [v3 canPerformEditOperation:2];
  char v12 = 0;
  if (v10 == 1 && v11) {
    char v12 = [MEMORY[0x1E4F911C0] canPerformEditOnAsset:v3];
  }

  return v12;
}

@end