@interface PUBufferingIndicatorTileViewController
+ (BOOL)canShowBufferingIndicatorTileForAsset:(id)a3;
+ (CGSize)bufferingIndicatorTileSize;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingVideoPlayer)_videoPlayer;
- (PUBrowsingViewModel)browsingViewModel;
- (PUOneUpMergedVideoProvider)mergedVideoProvider;
- (UIActivityIndicatorView)_spinner;
- (UIButton)_errorButton;
- (id)errorAlertControllerDisplayer;
- (int64_t)_indicatorStyle;
- (void)_handleErrorButton:(id)a3;
- (void)_setErrorButton:(id)a3;
- (void)_setIndicatorStyle:(int64_t)a3;
- (void)_setIndicatorStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)_setSpinner:(id)a3;
- (void)_setVideoPlayer:(id)a3;
- (void)_updateIndicator;
- (void)becomeReusable;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAssetViewModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)setErrorAlertControllerDisplayer:(id)a3;
- (void)setMergedVideoProvider:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUBufferingIndicatorTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__errorButton, 0);
  objc_storeStrong((id *)&self->__spinner, 0);
  objc_storeStrong((id *)&self->__videoPlayer, 0);
  objc_storeStrong(&self->_errorAlertControllerDisplayer, 0);
  objc_storeStrong((id *)&self->_mergedVideoProvider, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
}

- (void)_setErrorButton:(id)a3
{
}

- (UIButton)_errorButton
{
  return self->__errorButton;
}

- (void)_setSpinner:(id)a3
{
}

- (UIActivityIndicatorView)_spinner
{
  return self->__spinner;
}

- (int64_t)_indicatorStyle
{
  return self->__indicatorStyle;
}

- (PUBrowsingVideoPlayer)_videoPlayer
{
  return self->__videoPlayer;
}

- (void)setErrorAlertControllerDisplayer:(id)a3
{
}

- (id)errorAlertControllerDisplayer
{
  return self->_errorAlertControllerDisplayer;
}

- (PUOneUpMergedVideoProvider)mergedVideoProvider
{
  return self->_mergedVideoProvider;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)MergedVideoProviderContext == a5)
  {
    char v5 = a4;
    id v8 = a3;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if ((v5 & 1) == 0) {
        return;
      }
    }
    else
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:a2, self, @"PUBufferingIndicatorTileViewController.m", 268, @"Invalid parameter not satisfying: %@", @"[observable isKindOfClass:[PUOneUpMergedVideoProvider class]]" object file lineNumber description];

      if ((v5 & 1) == 0) {
        return;
      }
    }
    px_dispatch_on_main_queue();
  }
}

uint64_t __71__PUBufferingIndicatorTileViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateIndicator];
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(PUBufferingIndicatorTileViewController *)self _videoPlayer];

  if (v7 == v12)
  {
    id v10 = v6;
    if (([v10 playStateDidChange] & 1) != 0
      || ([v10 isStalledDidChange] & 1) != 0
      || ([v10 errorDidChange] & 1) != 0
      || ([v10 isActivatedDidChange] & 1) != 0
      || [v10 desiredPlayStateDidChange])
    {
      [(PUBufferingIndicatorTileViewController *)self _updateIndicator];
    }
    goto LABEL_12;
  }
  id v8 = [(PUBufferingIndicatorTileViewController *)self browsingViewModel];

  if (v8 == v12)
  {
    if ([v6 isAttemptingToPlayVideoOverlayDidChange]) {
      [(PUBufferingIndicatorTileViewController *)self _updateIndicator];
    }
  }
  else
  {
    id v9 = [(PUBufferingIndicatorTileViewController *)self assetViewModel];

    if (v9 == v12 && [v6 videoPlayerDidChange])
    {
      id v10 = [(PUBufferingIndicatorTileViewController *)self assetViewModel];
      v11 = [v10 videoPlayer];
      [(PUBufferingIndicatorTileViewController *)self _setVideoPlayer:v11];

LABEL_12:
    }
  }
}

- (void)_updateIndicator
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(PUBufferingIndicatorTileViewController *)self _videoPlayer];
  uint64_t v4 = [v3 playState];
  char v5 = [(PUBufferingIndicatorTileViewController *)self browsingViewModel];
  unsigned int v6 = [v5 isAttemptingToPlayVideoOverlay];

  id v7 = [(PUBufferingIndicatorTileViewController *)self mergedVideoProvider];
  uint64_t v8 = [v7 state];
  id v9 = [(PUAssetViewModel *)self->_assetViewModel assetSharedViewModel];
  if (v4 == 5)
  {
    uint64_t v10 = 0;
  }
  else if ((([v3 isStalled] & 1) != 0 || v4 == 1 && objc_msgSend(v3, "isPlaybackDesired")) {
         && ![v9 needsDeferredProcessing])
  }
  {
    uint64_t v10 = 1;
  }
  else
  {
    if (v8 == 3) {
      unsigned int v11 = v6;
    }
    else {
      unsigned int v11 = 0;
    }
    if (v11 == 1)
    {
      id v12 = PLOneUpGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [v7 error];
        int v17 = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_ERROR, "Showing live photo playback error indicator: %@", (uint8_t *)&v17, 0xCu);
      }
      uint64_t v10 = 2;
    }
    else if (v8 == 1)
    {
      uint64_t v10 = v6;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  v14 = +[PUOneUpSettings sharedInstance];
  unsigned __int8 v15 = [v14 showBufferingIndicatorDuringPlay];

  if ((v15 & (v4 == 3)) != 0) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v10;
  }
  [(PUBufferingIndicatorTileViewController *)self _setIndicatorStyle:v16 animated:1];
}

- (void)_handleErrorButton:(id)a3
{
  uint64_t v4 = [(PUBufferingIndicatorTileViewController *)self errorAlertControllerDisplayer];

  if (!v4) {
    return;
  }
  char v5 = [(PUBufferingIndicatorTileViewController *)self _videoPlayer];
  unsigned int v6 = [(PUBufferingIndicatorTileViewController *)self mergedVideoProvider];
  if ([v5 playState] == 5)
  {
    id v7 = @"VIDEO_PLAYBACK_ERROR_TITLE";
    uint64_t v8 = v5;
  }
  else
  {
    if ([v6 state] != 3)
    {
      uint64_t v10 = 0;
LABEL_13:
      PULocalizedString(@"GENERAL_PLAYBACK_ERROR_TITLE");
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v10) {
        goto LABEL_9;
      }
LABEL_14:
      uint64_t v10 = PULocalizedString(@"GENERAL_PLAYBACK_ERROR_MESSAGE");
      goto LABEL_9;
    }
    id v7 = @"LIVE_PHOTO_PLAYBACK_ERROR_TITLE";
    uint64_t v8 = v6;
  }
  PULocalizedString(v7);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 error];
  uint64_t v10 = [v9 localizedDescription];

  if (!v12) {
    goto LABEL_13;
  }
  if (!v10) {
    goto LABEL_14;
  }
LABEL_9:
  unsigned int v11 = [(PUBufferingIndicatorTileViewController *)self errorAlertControllerDisplayer];
  ((void (**)(void, id, void *))v11)[2](v11, v12, v10);
}

- (void)_setIndicatorStyle:(int64_t)a3 animated:(BOOL)a4
{
  if (self->__indicatorStyle != a3)
  {
    BOOL v4 = a4;
    self->__indicatorStyle = a3;
    uint64_t v7 = [(PUBufferingIndicatorTileViewController *)self _spinner];
    uint64_t v8 = (void *)v7;
    BOOL v9 = a3 == 1;
    if (a3 == 1 && !v7)
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
      uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
      [v8 setColor:v10];

      [v8 setAlpha:0.0];
      [v8 setAutoresizingMask:45];
      unsigned int v11 = [(PUTileViewController *)self view];
      [v11 bounds];
      CGFloat x = v53.origin.x;
      CGFloat y = v53.origin.y;
      CGFloat width = v53.size.width;
      CGFloat height = v53.size.height;
      double MidX = CGRectGetMidX(v53);
      v54.origin.CGFloat x = x;
      v54.origin.CGFloat y = y;
      v54.size.CGFloat width = width;
      v54.size.CGFloat height = height;
      objc_msgSend(v8, "setCenter:", MidX, CGRectGetMidY(v54));
      [v11 addSubview:v8];
      [(PUBufferingIndicatorTileViewController *)self _setSpinner:v8];
    }
    uint64_t v17 = [v8 tag] + 1;
    [v8 setTag:v17];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke;
    aBlock[3] = &unk_1E5F2D968;
    id v18 = v8;
    id v50 = v18;
    uint64_t v51 = v17;
    BOOL v52 = a3 == 1;
    uint64_t v19 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v20 = [(PUBufferingIndicatorTileViewController *)self _errorButton];
    v21 = (void *)v20;
    if (a3 == 2 && !v20)
    {
      v21 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
      [v21 addTarget:self action:sel__handleErrorButton_ forControlEvents:0x2000];
      v22 = +[PUInterfaceManager currentTheme];
      v23 = [v22 regularLoadErrorIcon];
      [v21 setImage:v23 forState:0];

      [v21 sizeToFit];
      [v21 setAlpha:0.0];
      [v21 setAutoresizingMask:45];
      v24 = [(PUTileViewController *)self view];
      [v24 bounds];
      CGFloat v25 = v55.origin.x;
      CGFloat v26 = v55.origin.y;
      CGFloat v27 = v55.size.width;
      CGFloat v28 = v55.size.height;
      double v29 = CGRectGetMidX(v55);
      v56.origin.CGFloat x = v25;
      v56.origin.CGFloat y = v26;
      v56.size.CGFloat width = v27;
      v56.size.CGFloat height = v28;
      objc_msgSend(v21, "setCenter:", v29, CGRectGetMidY(v56));
      [v24 addSubview:v21];
      [(PUBufferingIndicatorTileViewController *)self _setErrorButton:v21];
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_2;
    v44[3] = &unk_1E5F24268;
    id v30 = v18;
    id v45 = v30;
    BOOL v47 = a3 == 1;
    id v31 = v21;
    id v46 = v31;
    BOOL v48 = a3 == 2;
    v32 = _Block_copy(v44);
    v33 = v32;
    if (v4)
    {
      v34 = [(PUBufferingIndicatorTileViewController *)self browsingViewModel];
      int v35 = [v34 isAttemptingToPlayVideoOverlay];

      if (((a3 == 1) & (v35 ^ 1)) != 0) {
        double v36 = 1.0;
      }
      else {
        double v36 = 0.0;
      }
      double v37 = dbl_1AEFF7B50[a3 == 1];
      if (a3 == 1) {
        v19[2](v19);
      }
      v38 = (void *)MEMORY[0x1E4FB1EB0];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_3;
      v42[3] = &unk_1E5F2EBA0;
      id v43 = v33;
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_4;
      v39[3] = &unk_1E5F24290;
      BOOL v41 = v9;
      v40 = v19;
      [v38 animateWithDuration:4 delay:v42 options:v39 animations:v37 completion:v36];
    }
    else
    {
      (*((void (**)(void *))v32 + 2))(v32);
      v19[2](v19);
    }
  }
}

uint64_t __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) tag];
  if (result == *(void *)(a1 + 40))
  {
    v3 = *(void **)(a1 + 32);
    if (*(unsigned char *)(a1 + 48))
    {
      return [v3 startAnimating];
    }
    else
    {
      return [v3 stopAnimating];
    }
  }
  return result;
}

uint64_t __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
  BOOL v4 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 49)) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  return [v4 setAlpha:v5];
}

uint64_t __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __70__PUBufferingIndicatorTileViewController__setIndicatorStyle_animated___block_invoke_4(uint64_t result)
{
  if (!*(unsigned char *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)_setIndicatorStyle:(int64_t)a3
{
}

- (void)setMergedVideoProvider:(id)a3
{
  double v5 = (PUOneUpMergedVideoProvider *)a3;
  mergedVideoProvider = self->_mergedVideoProvider;
  if (mergedVideoProvider != v5)
  {
    uint64_t v7 = v5;
    [(PUOneUpMergedVideoProvider *)mergedVideoProvider unregisterChangeObserver:self context:MergedVideoProviderContext];
    objc_storeStrong((id *)&self->_mergedVideoProvider, a3);
    [(PUOneUpMergedVideoProvider *)self->_mergedVideoProvider registerChangeObserver:self context:MergedVideoProviderContext];
    [(PUBufferingIndicatorTileViewController *)self _updateIndicator];
    double v5 = v7;
  }
}

- (void)setBrowsingViewModel:(id)a3
{
  double v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    uint64_t v7 = v5;
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)self->_browsingViewModel registerChangeObserver:self];
    double v5 = v7;
  }
}

- (void)_setVideoPlayer:(id)a3
{
  double v5 = (PUBrowsingVideoPlayer *)a3;
  videoPlayer = self->__videoPlayer;
  if (videoPlayer != v5)
  {
    uint64_t v7 = v5;
    [(PUBrowsingVideoPlayer *)videoPlayer unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->__videoPlayer, a3);
    [(PUBrowsingVideoPlayer *)self->__videoPlayer registerChangeObserver:self];
    [(PUBufferingIndicatorTileViewController *)self _updateIndicator];
    double v5 = v7;
  }
}

- (void)setAssetViewModel:(id)a3
{
  double v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  uint64_t v8 = v5;
  if (assetViewModel != v5)
  {
    [(PUAssetViewModel *)assetViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)self->_assetViewModel registerChangeObserver:self];
    uint64_t v7 = [(PUAssetViewModel *)v8 videoPlayer];
    [(PUBufferingIndicatorTileViewController *)self _setVideoPlayer:v7];
  }
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUBufferingIndicatorTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUBufferingIndicatorTileViewController *)self setBrowsingViewModel:0];
  [(PUBufferingIndicatorTileViewController *)self setAssetViewModel:0];
  [(PUBufferingIndicatorTileViewController *)self setErrorAlertControllerDisplayer:0];
  [(PUBufferingIndicatorTileViewController *)self setMergedVideoProvider:0];
  [(PUBufferingIndicatorTileViewController *)self _setIndicatorStyle:0 animated:0];
}

+ (CGSize)bufferingIndicatorTileSize
{
  double v2 = 100.0;
  double v3 = 100.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

+ (BOOL)canShowBufferingIndicatorTileForAsset:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 mediaType] == 2
    || [v3 playbackStyle] == 3
    || [v3 playbackStyle] == 5;

  return v4;
}

@end