@interface PLUIImageViewController
- (BOOL)_displaysFullScreen;
- (BOOL)clientIsWallpaper;
- (BOOL)disableVideoTrimMessage;
- (BOOL)doNotTranscode;
- (BOOL)force1XCroppedImage;
- (BOOL)forceNativeScreenScale;
- (BOOL)imagePickerAllowsEditing;
- (BOOL)isDisplayedInPhotoPicker;
- (BOOL)photoTileViewControllerAllowsEditing:(id)a3;
- (BOOL)photoTileViewControllerIsDisplayingLandscape:(id)a3;
- (BOOL)prefersStatusBarHidden;
- (BOOL)videoViewCanBeginPlayback:(id)a3;
- (BOOL)viewImageBeforeSelecting;
- (BOOL)wantsAutoloopUI;
- (BOOL)wantsLegacyImageUI;
- (BOOL)wantsStatusBarVisible;
- (CGRect)_viewFrame;
- (CGRect)previewFrame;
- (Class)_viewClass;
- (NSString)localizedTitle;
- (NSString)localizedUseButtonTitle;
- (PLUIImageViewController)initWithImage:(CGImage *)a3 cropRect:(CGRect)a4;
- (PLUIImageViewController)initWithImageData:(id)a3 cropRect:(CGRect)a4;
- (PLUIImageViewController)initWithPhoto:(id)a3;
- (PLUIImageViewController)initWithUIImage:(id)a3 cropRect:(CGRect)a4;
- (PLUIImageViewController)initWithVideoURL:(id)a3;
- (double)videoViewScrubberYOrigin:(id)a3 forOrientation:(int64_t)a4;
- (id)_trimMessage;
- (id)cancelButtonTitle;
- (id)chooseButtonTitle;
- (id)cropOverlay;
- (id)customBackgroundColor;
- (id)exportPreset;
- (id)maxZoomScaleOverride;
- (id)videoMaximumDuration;
- (id)videoQuality;
- (int)cropOverlayMode;
- (int64_t)_imagePickerStatusBarStyle;
- (int64_t)_preferredWhitePointAdaptivityStyle;
- (int64_t)desiredStatusBarAnimation;
- (unint64_t)_contentAutoresizingMask;
- (unint64_t)_tileAutoresizingMask;
- (unint64_t)imagePickerSavingOptions;
- (unsigned)imageFormat;
- (void)_editabilityChanged:(id)a3;
- (void)_enableCropOverlay;
- (void)_enableCropOverlayIfNecessary;
- (void)_handleVideoSelected;
- (void)_removedAsTopViewController;
- (void)_updateGestureSettings;
- (void)attachScrubberPalette;
- (void)beginDisplayingProgress;
- (void)cropOverlay:(id)a3 didFinishSaving:(id)a4;
- (void)cropOverlayPause:(id)a3;
- (void)cropOverlayPlay:(id)a3;
- (void)cropOverlayWasCancelled:(id)a3;
- (void)cropOverlayWasOKed:(id)a3;
- (void)dealloc;
- (void)handleMediaSelectionUsingTile:(id)a3 managedAsset:(id)a4 args:(id)a5 includeEditing:(BOOL)a6;
- (void)handleVideoSelectionWithURL:(id)a3 args:(id)a4;
- (void)loadView;
- (void)photoTileViewControllerCancelImageRequests:(id)a3;
- (void)photoTileViewControllerRequestsFullScreenImage:(id)a3;
- (void)setAllowsEditing:(BOOL)a3;
- (void)setCropOverlayDone;
- (void)setupNavigationItem;
- (void)traitCollectionDidChange:(id)a3;
- (void)videoRemakerDidBeginRemaking:(id)a3;
- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4;
- (void)videoView:(id)a3 scrubberWasCreated:(id)a4 slalomRegionEditor:(id)a5;
- (void)videoViewDidBeginPlayback:(id)a3;
- (void)videoViewDidEndPlayback:(id)a3 didFinish:(BOOL)a4;
- (void)videoViewDidPausePlayback:(id)a3 didFinish:(BOOL)a4;
- (void)videoViewIsReadyToBeginPlayback:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PLUIImageViewController

- (unint64_t)imagePickerSavingOptions
{
  id v2 = [(UIViewController *)self uiipc_imagePickerController];
  return [v2 _imagePickerSavingOptions];
}

- (BOOL)imagePickerAllowsEditing
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F43960]];
  return [v3 BOOLValue];
}

- (id)maxZoomScaleOverride
{
  id v2 = objc_msgSend(-[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions"), "objectForKeyedSubscript:", @"_UIImagePickerControllerMaxZoomScaleOverride");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)customBackgroundColor
{
  id v2 = objc_msgSend(-[UIViewController uiipc_imagePickerOptions](self, "uiipc_imagePickerOptions"), "objectForKeyedSubscript:", @"_UIImagePickerControllerCustomBackgroundColor");
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (id)cancelButtonTitle
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  return (id)[v2 objectForKey:@"_UIImagePickerControllerCancelButtonTitle"];
}

- (id)chooseButtonTitle
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  uint64_t v3 = *MEMORY[0x1E4F44040];
  return (id)[v2 objectForKey:v3];
}

- (BOOL)force1XCroppedImage
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  uint64_t v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F44030]];
  return [v3 BOOLValue];
}

- (BOOL)forceNativeScreenScale
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  uint64_t v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F44058]];
  return [v3 BOOLValue];
}

- (BOOL)disableVideoTrimMessage
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  uint64_t v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F44048]];
  return [v3 BOOLValue];
}

- (id)videoMaximumDuration
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  uint64_t v3 = *MEMORY[0x1E4F439B8];
  return (id)[v2 objectForKey:v3];
}

- (BOOL)viewImageBeforeSelecting
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  uint64_t v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F440B8]];
  return [v3 BOOLValue];
}

- (id)exportPreset
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  uint64_t v3 = *MEMORY[0x1E4F440B0];
  return (id)[v2 objectForKey:v3];
}

- (id)videoQuality
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  uint64_t v3 = *MEMORY[0x1E4F439C0];
  return (id)[v2 objectForKey:v3];
}

- (BOOL)doNotTranscode
{
  id v2 = [(UIViewController *)self uiipc_imagePickerOptions];
  uint64_t v3 = (void *)[v2 objectForKey:*MEMORY[0x1E4F44098]];
  return [v3 BOOLValue];
}

- (void)handleVideoSelectionWithURL:(id)a3 args:(id)a4
{
  id v7 = [(UIViewController *)self uiipc_imagePickerController];
  if (v7)
  {
    photo = self->_photo;
    PLNotifyImagePickerOfVideoAvailability(v7, (uint64_t)a3, photo, (uint64_t)a4);
  }
  else
  {
    [(PLUIImageViewController *)self didChooseVideoAtURL:a3 options:a4];
  }
}

- (void)handleMediaSelectionUsingTile:(id)a3 managedAsset:(id)a4 args:(id)a5 includeEditing:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = [(UIViewController *)self uiipc_imagePickerController];
  PLNotifyImagePickerOfMediaAvailability(v10, a3, a4, a5, v6);
}

- (int64_t)_preferredWhitePointAdaptivityStyle
{
  return 2;
}

- (BOOL)photoTileViewControllerAllowsEditing:(id)a3
{
  return *((unsigned char *)self + 1096) & 1;
}

- (void)photoTileViewControllerCancelImageRequests:(id)a3
{
  if ([a3 inflightFullSizeImageRequestID])
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F390D0], "defaultManager"), "cancelImageRequest:", objc_msgSend(a3, "inflightFullSizeImageRequestID"));
    [a3 setInflightFullSizeImageRequestID:0];
  }
}

- (void)photoTileViewControllerRequestsFullScreenImage:(id)a3
{
  -[PLUIImageViewController photoTileViewControllerCancelImageRequests:](self, "photoTileViewControllerCancelImageRequests:");
  uint64_t v4 = [a3 photo];
  id v5 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v5 setDeliveryMode:1];
  BOOL v6 = (void *)[MEMORY[0x1E4F390D0] defaultManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PLUIImageViewController_photoTileViewControllerRequestsFullScreenImage___block_invoke;
  v7[3] = &unk_1E63D2570;
  v7[4] = a3;
  objc_msgSend(a3, "setInflightFullSizeImageRequestID:", objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v4, 0, v5, v7, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8)));
}

uint64_t __74__PLUIImageViewController_photoTileViewControllerRequestsFullScreenImage___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) setFullSizeImage:a2];
  }
  return result;
}

- (unsigned)imageFormat
{
  id v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F8B918], "defaultFormatChooser"), "fullScreenFormatForCurrentDevice");
  return [v2 formatID];
}

- (BOOL)photoTileViewControllerIsDisplayingLandscape:(id)a3
{
  return (unint64_t)(objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication", a3), "statusBarOrientation")- 3) < 2;
}

- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4
{
  *((unsigned char *)self + 1096) &= ~0x10u;
  objc_msgSend((id)*MEMORY[0x1E4F43630], "endIgnoringInteractionEvents", a3);
  if (a4) {
    uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a4 isDirectory:0];
  }
  else {
    uint64_t v6 = 0;
  }
  [(PLUIImageViewController *)self handleVideoSelectionWithURL:v6 args:0];

  self->_remaker = 0;
  [(PLUIImageViewController *)self _enableCropOverlayIfNecessary];
}

- (void)videoRemakerDidBeginRemaking:(id)a3
{
  *((unsigned char *)self + 1096) |= 0x10u;
  objc_msgSend((id)*MEMORY[0x1E4F43630], "beginIgnoringInteractionEvents", a3);
}

- (void)videoViewDidEndPlayback:(id)a3 didFinish:(BOOL)a4
{
}

- (void)videoViewDidPausePlayback:(id)a3 didFinish:(BOOL)a4
{
}

- (void)videoViewDidBeginPlayback:(id)a3
{
}

- (void)videoViewIsReadyToBeginPlayback:(id)a3
{
  id v5 = [(PLUIImageViewController *)self videoMaximumDuration];
  [a3 duration];
  double v7 = v6;
  BOOL v8 = [(PLUIImageViewController *)self disableVideoTrimMessage];
  if (*((unsigned char *)self + 1096)) {
    char v9 = 0;
  }
  else {
    char v9 = ![(PLUIImageViewController *)self viewImageBeforeSelecting];
  }
  [(PLCropOverlay *)self->_cropOverlay setUserInteractionEnabled:1];
  [v5 doubleValue];
  if (v10 > 0.0 && (v9 & 1) == 0)
  {
    [v5 doubleValue];
    if (v7 > v11)
    {
      [v5 doubleValue];
      objc_msgSend(a3, "setMaximumTrimLength:");
      if (([a3 isEditing] & 1) == 0) {
        [a3 setEditing:1];
      }
      if (!v8)
      {
        id v12 = [(PLCropOverlay *)self->_cropOverlay bottomBar];
        [v12 bounds];
        objc_msgSend(a3, "convertRect:fromView:", v12);
        double v14 = v13;
        id v15 = [(PLUIImageViewController *)self _trimMessage];
        double v16 = v14 + -20.0;
        *(float *)&double v16 = v14 + -20.0;
        [a3 showTrimMessage:v15 withBottomY:v16];
      }
    }
  }
}

- (id)_trimMessage
{
  return (id)PLLocalizedFrameworkString();
}

- (BOOL)videoViewCanBeginPlayback:(id)a3
{
  return 0;
}

- (double)videoViewScrubberYOrigin:(id)a3 forOrientation:(int64_t)a4
{
  id v5 = (void *)[(PLUIImageViewController *)self view];
  objc_msgSend((id)objc_msgSend(v5, "safeAreaLayoutGuide"), "layoutFrame");
  [a3 convertPoint:v5 fromView:0.0];
  return v6;
}

- (void)videoView:(id)a3 scrubberWasCreated:(id)a4 slalomRegionEditor:(id)a5
{
  if (self->_videoView == a3) {
    [(PLUIImageViewController *)self attachScrubberPalette];
  }
}

- (void)cropOverlayPause:(id)a3
{
}

- (void)cropOverlayPlay:(id)a3
{
}

- (void)cropOverlay:(id)a3 didFinishSaving:(id)a4
{
  [(PLUIImageViewController *)self handleMediaSelectionUsingTile:self->_imageTile managedAsset:self->_photo args:a4 includeEditing:*((unsigned char *)self + 1096) & 1];
  [(PLUIImageViewController *)self _enableCropOverlayIfNecessary];
}

- (void)beginDisplayingProgress
{
  uint64_t v3 = (void *)[(PLUIImageViewController *)self view];
  id v4 = [(PLCropOverlay *)self->_cropOverlay bottomBar];
  [v4 bounds];
  objc_msgSend(v3, "convertRect:fromView:", v4);
  double v7 = -[PLProgressView initWithFrame:]([PLProgressView alloc], "initWithFrame:", *MEMORY[0x1E4F1DB28], v5 - *(double *)(MEMORY[0x1E4F1DB28] + 24), v6, 45.0);
  self->_progressView = v7;
  [(PLProgressView *)v7 setBackgroundType:3];
  [(PLProgressView *)self->_progressView setAutoresizingMask:2];
  progressView = self->_progressView;
  [v3 addSubview:progressView];
}

- (void)_handleVideoSelected
{
  [(PLVideoView *)self->_videoView pause];
  uint64_t v3 = [(PLVideoView *)self->_videoView videoCameraImage];
  if ([(NSURL *)self->_videoURL isFileURL]) {
    id v4 = [(NSURL *)self->_videoURL path];
  }
  else {
    id v4 = 0;
  }
  [(PLVideoView *)self->_videoView startTime];
  double v6 = v5;
  [(PLVideoView *)self->_videoView endTime];
  double v8 = v7;
  if ([(PLUIImageViewController *)self doNotTranscode])
  {
    if ([(PLVideoView *)self->_videoView isEditing])
    {
      id v9 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      uint64_t v10 = [NSNumber numberWithDouble:v6];
      uint64_t v11 = *MEMORY[0x1E4F440A8];
      uint64_t v12 = [NSNumber numberWithDouble:v8];
      double v13 = objc_msgSend(v9, "initWithObjectsAndKeys:", v10, v11, v12, *MEMORY[0x1E4F440A0], 0);
      if (v3)
      {
LABEL_7:
        uint64_t v14 = [(PLManagedAsset *)v3 mainFileURL];
        goto LABEL_13;
      }
    }
    else
    {
      double v13 = 0;
      if (v3) {
        goto LABEL_7;
      }
    }
    if (!v4)
    {
      uint64_t v16 = 0;
      goto LABEL_14;
    }
    uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
LABEL_13:
    uint64_t v16 = v14;
LABEL_14:
    [(PLUIImageViewController *)self handleVideoSelectionWithURL:v16 args:v13];

    [(PLUIImageViewController *)self _enableCropOverlayIfNecessary];
    return;
  }

  self->_remaker = 0;
  if (v3)
  {
    self->_remaker = [[PLVideoRemaker alloc] initWithManagedAsset:v3 applyVideoAdjustments:1];
    int v15 = [(PLManagedAsset *)v3 isHDVideo];
  }
  else
  {
    uint64_t v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
    v18 = -[PLVideoRemaker initWithAVAsset:]([PLVideoRemaker alloc], "initWithAVAsset:", [MEMORY[0x1E4F166C8] assetWithURL:v17]);
    self->_remaker = v18;
    [(PLVideoView *)self->_videoView duration];
    -[PLVideoRemaker setDuration:](v18, "setDuration:");
    int v15 = 0;
  }
  [(PLVideoRemaker *)self->_remaker setDelegate:self];
  [(PLVideoRemaker *)self->_remaker setTrimStartTime:v6];
  [(PLVideoRemaker *)self->_remaker setTrimEndTime:v8];
  id v19 = [(PLUIImageViewController *)self exportPreset];
  id v20 = [(PLUIImageViewController *)self videoQuality];
  if (v19)
  {
    [(PLVideoRemaker *)self->_remaker setExportPresetOverride:v19];
    uint64_t v21 = PLVideoRemakerModeForAVAssetExportPreset(v19);
  }
  else if (v20)
  {
    switch([v20 intValue])
    {
      case 0u:
      case 4u:
      case 5u:
        BOOL v22 = v15 == 0;
        unsigned int v23 = 5;
        goto LABEL_30;
      case 1u:
        if (v15) {
          uint64_t v21 = 5;
        }
        else {
          uint64_t v21 = 7;
        }
        break;
      case 2u:
        uint64_t v21 = 8;
        break;
      case 3u:
        BOOL v22 = (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1;
        unsigned int v23 = 6;
LABEL_30:
        if (v22) {
          uint64_t v21 = v23 + 1;
        }
        else {
          uint64_t v21 = v23;
        }
        break;
      default:
        goto LABEL_23;
    }
  }
  else
  {
LABEL_23:
    uint64_t v21 = 7;
  }
  [(PLVideoRemaker *)self->_remaker setMode:v21];
  [(PLVideoView *)self->_videoView hideTrimMessage];
  double v24 = v8 - v6;
  [(PLVideoView *)self->_videoView duration];
  double v26 = v25;
  v27 = [(PLVideoRemaker *)self->_remaker progressView];
  self->_progressView = v27;
  [(PLProgressView *)v27 frame];
  double v29 = v28;
  double v31 = v30;
  [(PLProgressView *)v27 setBackgroundType:3];
  v32 = (void *)[(PLUIImageViewController *)self view];
  id v33 = [(PLCropOverlay *)self->_cropOverlay bottomBar];
  [v33 bounds];
  objc_msgSend(v32, "convertRect:fromView:", v33);
  double v35 = v34;
  double v37 = v36 - v31;
  [v32 addSubview:v27];
  -[PLProgressView setFrame:](v27, "setFrame:", v29, v37, v35, v31);
  if (v24 >= v26) {
    [(PLProgressView *)v27 setLabelText:PLLocalizedFrameworkString()];
  }
  remaker = self->_remaker;
  [(PLVideoRemaker *)remaker remake];
}

- (void)cropOverlayWasOKed:(id)a3
{
  if ((*((unsigned char *)self + 1096) & 4) != 0 || [(PLUIImageViewController *)self wantsAutoloopUI])
  {
    if ([(PLUIImageViewController *)self wantsAutoloopUI])
    {
      [(PLUIImageViewController *)self handleAutoloopSelected];
    }
    else
    {
      [(PLUIImageViewController *)self _handleVideoSelected];
    }
  }
  else if (*((unsigned char *)self + 1096))
  {
    BOOL v4 = ([(PLUIImageViewController *)self imagePickerSavingOptions] & 1) == 0;
    cropOverlay = self->_cropOverlay;
    imageTile = self->_imageTile;
    if (v4) {
      uint64_t v7 = 16;
    }
    else {
      uint64_t v7 = 4;
    }
    [(PLCropOverlay *)cropOverlay beginBackgroundSaveWithTile:imageTile progressTitle:0 completionCallbackTarget:self options:v7];
  }
  else
  {
    [(PLUIImageViewController *)self handleMediaSelectionUsingTile:self->_imageTile managedAsset:self->_photo args:0 includeEditing:0];
    [(PLUIImageViewController *)self _enableCropOverlayIfNecessary];
  }
}

- (void)_enableCropOverlay
{
}

- (void)_enableCropOverlayIfNecessary
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(PLUIImageViewController *)self _enableCropOverlay];
  }
}

- (void)cropOverlayWasCancelled:(id)a3
{
  id v4 = [(UIViewController *)self uiipc_imagePickerController];
  if (!v4)
  {
    double v6 = (void *)[(PLUIImageViewController *)self navigationController];
    goto LABEL_5;
  }
  double v5 = v4;
  if (objc_msgSend((id)objc_msgSend(v4, "viewControllers"), "indexOfObjectIdenticalTo:", self))
  {
    double v6 = v5;
LABEL_5:
    [v6 popViewControllerAnimated:1];
    return;
  }
  [v5 _imagePickerDidCancel];
}

- (void)_updateGestureSettings
{
  if ((*((unsigned char *)self + 1096) & 4) == 0 && ![(PLUIImageViewController *)self wantsAutoloopUI])
  {
    objc_msgSend(-[PLPhotoTileViewController scrollView](self->_imageTile, "scrollView"), "setUserInteractionEnabled:", *((unsigned char *)self + 1096) & 1);
    id v3 = [(PLPhotoTileViewController *)self->_imageTile scrollView];
    uint64_t v4 = *((unsigned char *)self + 1096) & 1;
    [v3 setScrollEnabled:v4];
  }
}

- (void)_editabilityChanged:(id)a3
{
  BOOL v4 = [(PLUIImageViewController *)self imagePickerAllowsEditing];
  [(PLUIImageViewController *)self setAllowsEditing:v4];
}

- (void)setAllowsEditing:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 1096);
  if (((((v3 & 1) == 0) ^ a3) & 1) == 0)
  {
    *((unsigned char *)self + 1096) = v3 & 0xFE | a3;
    [(PLUIImageViewController *)self _updateGestureSettings];
    cropOverlay = self->_cropOverlay;
    BOOL v6 = (*((unsigned char *)self + 1096) & 1) == 0;
    [(PLCropOverlay *)cropOverlay setPreviewMode:v6];
  }
}

- (void)_removedAsTopViewController
{
}

- (void)attachScrubberPalette
{
  char v3 = [(PLVideoView *)self->_videoView scrubberBackgroundView];
  if (v3)
  {
    BOOL v4 = v3;
    double v5 = (void *)[(PLUIImageViewController *)self navigationController];
    if (([v5 isNavigationBarHidden] & 1) == 0 && !objc_msgSend(v5, "existingPaletteForEdge:", 2))
    {
      [(PLUIImageViewController *)self _viewFrame];
      double Width = CGRectGetWidth(v10);
      [(UIView *)v4 bounds];
      uint64_t v7 = objc_msgSend(v5, "paletteForEdge:size:", 2, Width, CGRectGetHeight(v11));
      if (v7)
      {
        double v8 = (void *)v7;
        [v5 attachPalette:v7 isPinned:1];
        [v8 addSubview:v4];
        [(UIView *)v4 setBackgroundColor:0];
        [v8 bounds];
        -[UIView setFrame:](v4, "setFrame:");
        [(UIView *)v4 setAutoresizingMask:10];
      }
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ((*((unsigned char *)self + 1096) & 0x10) != 0) {
    [(PLVideoRemaker *)self->_remaker cancel];
  }
  *((unsigned char *)self + 1096) |= 8u;
  [(PLVideoView *)self->_videoView stop];
  [(PLVideoView *)self->_videoView setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)PLUIImageViewController;
  [(PLUIImageViewController *)&v5 viewWillDisappear:v3];
  *((unsigned char *)self + 1096) &= ~8u;
}

- (int64_t)_imagePickerStatusBarStyle
{
  return self->_newStatusBarStyle;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLUIImageViewController;
  [(PLUIImageViewController *)&v5 viewDidAppear:a3];
  if ([(UIViewController *)self uiipc_useTelephonyUI])
  {
    imageTile = self->_imageTile;
    [(PLCropOverlay *)self->_cropOverlay cropRect];
    -[PLPhotoTileViewController setCropOverlayRect:forCropRect:](imageTile, "setCropOverlayRect:forCropRect:");
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PLUIImageViewController *)self isDisplayedInPhotoPicker])
  {
    [(PLUIImageViewController *)self setAllowsEditing:[(PLUIImageViewController *)self imagePickerAllowsEditing]];
    objc_super v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:self selector:sel__editabilityChanged_ name:*MEMORY[0x1E4F44050] object:0];
  }
  int v6 = [(PLUIImageViewController *)self cropOverlayMode];
  uint64_t v7 = (void *)[(PLUIImageViewController *)self navigationController];
  if (v6 == 4) {
    [v7 setNavigationBarHidden:1];
  }
  else {
    objc_msgSend((id)objc_msgSend(v7, "navigationBar"), "setBarStyle:", 0);
  }
  [(PLVideoView *)self->_videoView setDelegate:self];
  [(PLVideoView *)self->_videoView setShowsScrubber:1];
  [(PLVideoView *)self->_videoView setScrubberIsSubview:1];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "isStatusBarHidden")) {
    char v8 = 2;
  }
  else {
    char v8 = 0;
  }
  *((unsigned char *)self + 1096) = *((unsigned char *)self + 1096) & 0xFD | v8;
  double v9 = *MEMORY[0x1E4F43BF0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__PLUIImageViewController_viewWillAppear___block_invoke;
  v11[3] = &unk_1E63D2660;
  v11[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v11 animations:v9];
  v10.receiver = self;
  v10.super_class = (Class)PLUIImageViewController;
  [(PLUIImageViewController *)&v10 viewWillAppear:v3];
}

uint64_t __42__PLUIImageViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (BOOL)isDisplayedInPhotoPicker
{
  return [(UIViewController *)self uiipc_imagePickerController] != 0;
}

- (BOOL)prefersStatusBarHidden
{
  return ![(PLUIImageViewController *)self wantsStatusBarVisible];
}

- (int64_t)desiredStatusBarAnimation
{
  return 0;
}

- (BOOL)wantsStatusBarVisible
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLUIImageViewController;
  [(PLUIImageViewController *)&v5 traitCollectionDidChange:a3];
  if ([(UIViewController *)self uiipc_useTelephonyUI])
  {
    imageTile = self->_imageTile;
    [(PLCropOverlay *)self->_cropOverlay cropRect];
    -[PLPhotoTileViewController setCropOverlayRect:forCropRect:](imageTile, "setCropOverlayRect:forCropRect:");
  }
  [(PLPhotoTileViewController *)self->_imageTile reloadZoomScale];
}

- (void)viewWillLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PLUIImageViewController;
  [(PLUIImageViewController *)&v7 viewWillLayoutSubviews];
  BOOL v3 = (void *)[(PLUIImageViewController *)self view];
  BOOL v4 = (void *)[(PLPhotoTileViewController *)self->_imageTile view];
  [v3 bounds];
  objc_msgSend(v4, "setFrame:");
  if ((*((unsigned char *)self + 1096) & 4) == 0 && ![(PLUIImageViewController *)self wantsAutoloopUI])
  {
    cropOverlay = self->_cropOverlay;
    [(PLCropOverlay *)cropOverlay setNeedsLayout];
    [(PLCropOverlay *)cropOverlay layoutIfNeeded];
    imageTile = self->_imageTile;
    [(PLCropOverlay *)cropOverlay cropRect];
    -[PLPhotoTileViewController setCropOverlayRect:forCropRect:](imageTile, "setCropOverlayRect:forCropRect:");
  }
}

- (void)loadView
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  [(PLUIImageViewController *)self previewFrame];
  -[PLUIImageViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v7);
  id v43 = (id)objc_msgSend(objc_alloc(-[PLUIImageViewController _viewClass](self, "_viewClass")), "initWithFrame:", v3, v4, v6, v5);
  objc_msgSend(v43, "setAutoresizingMask:", -[PLUIImageViewController _contentAutoresizingMask](self, "_contentAutoresizingMask"));
  char v8 = (double *)MEMORY[0x1E4F1DAD8];
  uint64_t v9 = [MEMORY[0x1E4F428B8] blackColor];
  id v10 = [(PLUIImageViewController *)self customBackgroundColor];
  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = (id)v9;
  }
  [v43 setBackgroundColor:v11];
  [(PLUIImageViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  BOOL v12 = [(UIViewController *)self uiipc_useTelephonyUI];
  BOOL v13 = (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
     && v12;
  [(PLUIImageViewController *)self setupNavigationItem];
  id v14 = [(PLUIImageViewController *)self chooseButtonTitle];
  if (![v14 length]) {
    id v14 = (id)PLLocalizedFrameworkString();
  }
  double v16 = *v8;
  double v15 = v8[1];
  id v17 = [(PLUIImageViewController *)self cancelButtonTitle];
  if (![v17 length]) {
    id v17 = (id)PLLocalizedFrameworkString();
  }

  v18 = -[PLCropOverlay initWithFrame:mode:offsettingStatusBar:]([PLCropOverlay alloc], "initWithFrame:mode:offsettingStatusBar:", [(PLUIImageViewController *)self cropOverlayMode], v13, v16, v15, v6, v5);
  self->_cropOverlay = v18;
  [(PLCropOverlay *)v18 setDisplayedInPopover:0];
  [(PLCropOverlay *)self->_cropOverlay setOKButtonTitle:v14];
  [(PLCropOverlay *)self->_cropOverlay setDefaultOKButtonTitle:v14];
  [(PLCropOverlay *)self->_cropOverlay setCancelButtonTitle:v17];
  [(PLCropOverlay *)self->_cropOverlay setDefaultCancelButtonTitle:v17];
  [(PLCropOverlay *)self->_cropOverlay setDelegate:self];
  [(PLCropOverlay *)self->_cropOverlay setAutoresizingMask:[(PLUIImageViewController *)self _tileAutoresizingMask]];
  [(PLVideoView *)self->_videoView setDelegate:0];

  self->_videoView = 0;
  self->_imageTile = 0;
  if ((*((unsigned char *)self + 1096) & 4) == 0 && ![(PLUIImageViewController *)self wantsAutoloopUI])
  {
    imageRef = self->_imageRef;
    if (imageRef)
    {
      if ([(PLUIImageViewController *)self clientIsWallpaper]) {
        uint64_t v21 = 2;
      }
      else {
        uint64_t v21 = 1;
      }
      BOOL v22 = +[PLPhotoTileViewController newPhotoTileViewControllerWithFrame:imageRef:imageOrientation:allowZoomToFill:mode:](PLPhotoTileViewController, "newPhotoTileViewControllerWithFrame:imageRef:imageOrientation:allowZoomToFill:mode:", imageRef, 0, 1, v21, v16, v15, v6, v5);
    }
    else
    {
      image = self->_image;
      if (!image)
      {
        uint64_t v40 = [(PLManagedAsset *)self->_photo pl_PHAssetFromPhotoLibrary:pl_appPhotoLibrary()];
        if ([(PLUIImageViewController *)self clientIsWallpaper]) {
          uint64_t v41 = 2;
        }
        else {
          uint64_t v41 = 1;
        }
        v42 = +[PLPhotoTileViewController newPhotoTileViewControllerWithFrame:modelPhoto:mode:](PLPhotoTileViewController, "newPhotoTileViewControllerWithFrame:modelPhoto:mode:", v40, v41, v16, v15, v6, v5);
        self->_imageTile = v42;
        [(PLPhotoTileViewController *)v42 setTileDelegate:self];
        goto LABEL_36;
      }
      if ([(PLUIImageViewController *)self clientIsWallpaper]) {
        uint64_t v30 = 2;
      }
      else {
        uint64_t v30 = 1;
      }
      BOOL v22 = +[PLPhotoTileViewController newPhotoTileViewControllerWithFrame:image:allowZoomToFill:mode:](PLPhotoTileViewController, "newPhotoTileViewControllerWithFrame:image:allowZoomToFill:mode:", image, 1, v30, v16, v15, v6, v5);
    }
    self->_imageTile = v22;
    goto LABEL_36;
  }
  if (![(PLUIImageViewController *)self wantsAutoloopUI])
  {
    if ([(NSURL *)self->_videoURL isFileURL])
    {
      id v19 = (PLVideoView *)+[PLVideoView videoViewForVideoFileAtURL:self->_videoURL];
    }
    else
    {
      videoURL = self->_videoURL;
      if (videoURL)
      {
        uint64_t v24 = objc_msgSend(MEMORY[0x1E4F8A950], "photoFromAssetURL:photoLibrary:", videoURL, objc_msgSend(MEMORY[0x1E4F8AA78], "systemPhotoLibrary"));
        double v25 = [PLVideoView alloc];
        double v26 = 1.0;
        double v27 = 1.0;
        photo = (PLManagedAsset *)v24;
      }
      else
      {
        double v25 = [PLVideoView alloc];
        photo = self->_photo;
        double v26 = 1.0;
        double v27 = 1.0;
      }
      id v19 = -[PLVideoView initWithFrame:videoCameraImage:orientation:](v25, "initWithFrame:videoCameraImage:orientation:", photo, 1, 0.0, 0.0, v26, v27);
    }
    self->_videoView = v19;
    [(PLUIImageViewController *)self setEdgesForExtendedLayout:14];
    [(PLUIImageViewController *)self previewFrame];
    double v32 = v31;
    double v34 = v33;
    if (!PLIsTallScreen()) {
      double v5 = v34;
    }
    double v35 = objc_alloc_init(PLPhotoTileViewController);
    self->_imageTile = v35;
    objc_msgSend((id)-[PLPhotoTileViewController view](v35, "view"), "setFrame:", 0.0, 0.0, v32, v5);
    -[PLVideoView setFrame:](self->_videoView, "setFrame:", 0.0, 0.0, v32, v5);
    [(PLVideoView *)self->_videoView setDelegate:self];
    BOOL v36 = 1;
    [(PLVideoView *)self->_videoView setLoadMediaImmediately:1];
    [(PLVideoView *)self->_videoView setShowsPlayOverlay:0];
    videoView = self->_videoView;
    if ((*((unsigned char *)self + 1096) & 1) == 0) {
      BOOL v36 = [(PLUIImageViewController *)self viewImageBeforeSelecting];
    }
    [(PLVideoView *)videoView setCanEdit:v36];
    [(PLVideoView *)self->_videoView setImageTile:self->_imageTile];
    [(PLPhotoTileViewController *)self->_imageTile setVideoView:self->_videoView];
    [(PLCropOverlay *)self->_cropOverlay didCaptureVideo];
    [(PLCropOverlay *)self->_cropOverlay setUserInteractionEnabled:0];
  }
LABEL_36:
  [(PLPhotoTileViewController *)self->_imageTile setOrientationDelegate:self];
  [(PLPhotoTileViewController *)self->_imageTile setForceNativeScreenScale:[(PLUIImageViewController *)self forceNativeScreenScale]];
  [(PLPhotoTileViewController *)self->_imageTile setForce1XCroppedImage:[(PLUIImageViewController *)self force1XCroppedImage]];
  [(PLPhotoTileViewController *)self->_imageTile setMaxZoomScaleOverride:[(PLUIImageViewController *)self maxZoomScaleOverride]];
  if ([(PLUIImageViewController *)self wantsLegacyImageUI] && self->_imageTile)
  {
    -[PLUIImageViewController addChildViewController:](self, "addChildViewController:");
    v38 = (void *)[(PLPhotoTileViewController *)self->_imageTile view];
    objc_msgSend(v38, "setAutoresizingMask:", -[PLUIImageViewController _tileAutoresizingMask](self, "_tileAutoresizingMask"));
    [v43 addSubview:v38];
  }
  [v43 addSubview:self->_cropOverlay];
  [(PLUIImageViewController *)self _updateGestureSettings];
  [(PLUIImageViewController *)self setView:v43];
  if ((*((unsigned char *)self + 1096) & 1) != 0 && ![(PLUIImageViewController *)self wantsAutoloopUI]) {
    uint64_t v39 = [(PLUIImageViewController *)self wantsLegacyImageUI] ^ 1;
  }
  else {
    uint64_t v39 = 1;
  }
  [(PLCropOverlay *)self->_cropOverlay setPreviewMode:v39];
}

- (Class)_viewClass
{
  return (Class)objc_opt_class();
}

- (void)setupNavigationItem
{
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v3 = (void *)[(PLUIImageViewController *)self navigationItem];
    objc_msgSend(v3, "setTitle:", -[PLUIImageViewController localizedTitle](self, "localizedTitle"));
    double v4 = [(PLUIImageViewController *)self chooseButtonTitle];
    if (![(NSString *)v4 length]) {
      double v4 = [(PLUIImageViewController *)self localizedUseButtonTitle];
    }
    double v5 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithTitle:v4 style:2 target:self action:sel_cropOverlayWasOKed_];
    [v5 setAccessibilityIdentifier:@"Done"];
    [v3 setRightBarButtonItem:v5];

    unsigned int v6 = [(PLUIImageViewController *)self cropOverlayMode];
    if (v6 <= 8 && ((1 << v6) & 0x1E6) != 0)
    {
      id v7 = [(PLUIImageViewController *)self cancelButtonTitle];
      if (![v7 length]) {
        id v7 = (id)PLLocalizedFrameworkString();
      }
      id v8 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithTitle:v7 style:0 target:self action:sel_cropOverlayWasCancelled_];
      [v8 setAccessibilityIdentifier:@"Cancel"];
      [v3 setLeftBarButtonItem:v8];
    }
  }
}

- (BOOL)wantsLegacyImageUI
{
  return 1;
}

- (BOOL)wantsAutoloopUI
{
  return 0;
}

- (BOOL)clientIsWallpaper
{
  return 0;
}

- (NSString)localizedTitle
{
  return (NSString *)PLLocalizedFrameworkString();
}

- (NSString)localizedUseButtonTitle
{
  return (NSString *)PLLocalizedFrameworkString();
}

- (unint64_t)_tileAutoresizingMask
{
  return 18;
}

- (unint64_t)_contentAutoresizingMask
{
  return 18;
}

- (CGRect)_viewFrame
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "bounds");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(PLUIImageViewController *)self navigationController])
  {
    objc_msgSend((id)objc_msgSend((id)-[PLUIImageViewController navigationController](self, "navigationController"), "view"), "bounds");
    double v4 = v11;
    double v6 = v12;
    double v8 = v13;
    double v10 = v14;
  }
  uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom");
  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v16 = 320.0;
  }
  else {
    double v16 = v8;
  }
  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v17 = 426.0;
  }
  else {
    double v17 = v10;
  }
  double v18 = v4;
  double v19 = v6;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)previewFrame
{
  double v2 = 320.0;
  double v3 = 426.0;
  double v4 = 0.0;
  double v5 = 1.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setCropOverlayDone
{
}

- (id)cropOverlay
{
  return self->_cropOverlay;
}

- (int)cropOverlayMode
{
  if ([(UIViewController *)self uiipc_useTelephonyUI]) {
    return 4;
  }
  int v3 = 1;
  if ((*((unsigned char *)self + 1096) & 4) != 0)
  {
    if ([(PLUIImageViewController *)self wantsAutoloopUI]) {
      return 1;
    }
    else {
      return 2;
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);

  imageRef = self->_imageRef;
  if (imageRef) {
    CGImageRelease(imageRef);
  }

  [(PLPhotoTileViewController *)self->_imageTile setTileDelegate:0];
  [(PLVideoView *)self->_videoView setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)PLUIImageViewController;
  [(PLUIImageViewController *)&v4 dealloc];
}

- (PLUIImageViewController)initWithVideoURL:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PLUIImageViewController;
  objc_super v4 = [(PLUIImageViewController *)&v7 init];
  double v5 = v4;
  if (v4)
  {
    *((unsigned char *)v4 + 1096) |= 4u;
    v4->_videoURL = (NSURL *)a3;
  }
  return v5;
}

- (PLUIImageViewController)initWithImageData:(id)a3 cropRect:(CGRect)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PLUIImageViewController;
  objc_super v4 = [(PLUIImageViewController *)&v11 init];
  if (v4)
  {
    double v5 = (UIImage *)PLCreateImageFromDataWithFormat();
    v4->_image = v5;
    [(UIImage *)v5 size];
    PLImageSizeFromImageData();
    PLScaledCropRect();
    v4->_cropRect.origin.x = v6;
    v4->_cropRect.origin.y = v7;
    v4->_cropRect.size.width = v8;
    v4->_cropRect.size.height = v9;
    if (!v4->_image)
    {

      return 0;
    }
  }
  return v4;
}

- (PLUIImageViewController)initWithUIImage:(id)a3 cropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PLUIImageViewController;
  CGFloat v9 = [(PLUIImageViewController *)&v11 init];
  if (v9)
  {
    v9->_image = (UIImage *)a3;
    v9->_cropRect.origin.CGFloat x = x;
    v9->_cropRect.origin.CGFloat y = y;
    v9->_cropRect.size.CGFloat width = width;
    v9->_cropRect.size.CGFloat height = height;
  }
  return v9;
}

- (PLUIImageViewController)initWithImage:(CGImage *)a3 cropRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)PLUIImageViewController;
  CGFloat v9 = [(PLUIImageViewController *)&v11 init];
  if (v9)
  {
    v9->_imageRef = CGImageRetain(a3);
    v9->_cropRect.origin.CGFloat x = x;
    v9->_cropRect.origin.CGFloat y = y;
    v9->_cropRect.size.CGFloat width = width;
    v9->_cropRect.size.CGFloat height = height;
  }
  return v9;
}

- (PLUIImageViewController)initWithPhoto:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PLUIImageViewController;
  objc_super v4 = [(PLUIImageViewController *)&v8 init];
  if (v4)
  {
    double v5 = (PLManagedAsset *)a3;
    v4->_photo = v5;
    if ([(PLManagedAsset *)v5 isVideo]) {
      char v6 = 4;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)v4 + 1096) = *((unsigned char *)v4 + 1096) & 0xFB | v6;
  }
  return v4;
}

- (BOOL)_displaysFullScreen
{
  return (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
      || [(PLUIImageViewController *)self cropOverlayMode] == 4;
}

@end