@interface PUUIImageViewController
- (BOOL)_isPhotosPickerExtensionAvailable;
- (BOOL)disableVideoTrimMessage;
- (BOOL)doNotTranscode;
- (BOOL)force1XCroppedImage;
- (BOOL)forceNativeScreenScale;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)imagePickerAllowsEditing;
- (BOOL)isDisplayedInPhotoPicker;
- (BOOL)pu_wantsNavigationBarVisible;
- (BOOL)uiipc_useTelephonyUI;
- (BOOL)viewImageBeforeSelecting;
- (BOOL)wantsAutoloopUI;
- (BOOL)wantsLegacyImageUI;
- (ISAnimatedImageView)_animatedImageView;
- (NSURL)_assetURL;
- (NSURL)_videoAssetURL;
- (PHLivePhotoView)_livePhotoView;
- (PUBrowsingIrisPlayer)_irisPlayer;
- (PUPhotoPicker)photoPicker;
- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel;
- (PUUIImageViewController)initWithPhoto:(id)a3 imagePickerProperties:(id)a4 expectsLivePhoto:(BOOL)a5;
- (PUUIImageViewControllerCancellationDelegate)cancellationDelegate;
- (PUUIImageViewControllerFileResizingDelegate)fileResizingDelegate;
- (PUVideoPlayerView)_autoloopView;
- (id)cancelButtonTitle;
- (id)chooseButtonTitle;
- (id)cropOverlayFileSizeMenuActions:(id)a3;
- (id)customBackgroundColor;
- (id)exportPreset;
- (id)irisPlayerViewViewHostingGestureRecognizers:(id)a3;
- (id)maxZoomScaleOverride;
- (id)videoMaximumDuration;
- (id)videoQuality;
- (int)_animatedImageRequestID;
- (int)_imageManagerVideoRequestID;
- (int)cropOverlayMode;
- (unint64_t)imagePickerSavingOptions;
- (void)_fetchAnimatedImageWithCompletion:(id)a3;
- (void)_fetchLivePhotoWithCompletion:(id)a3;
- (void)_fetchPreviewImageWithCompletion:(id)a3;
- (void)_fetchVideoWithCompletion:(id)a3;
- (void)_finishAutoloopDeliveryWithVideoURL:(id)a3 gifURL:(id)a4;
- (void)_generateGIFFromVideoURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)_handleAnimatedImagePreviewResult:(id)a3;
- (void)_handleAnimatedImageResult:(id)a3;
- (void)_handleAutoloopPreviewImageResult:(id)a3;
- (void)_handleAutoloopVideoResult:(id)a3;
- (void)_handleLivePhotoRequestResult:(id)a3 info:(id)a4;
- (void)_loadAnimatedImage;
- (void)_loadAutoloopVideo;
- (void)_loadLivePhoto;
- (void)_setAnimatedImageRequestID:(int)a3;
- (void)_setAnimatedImageView:(id)a3;
- (void)_setAssetURL:(id)a3;
- (void)_setAutoloopView:(id)a3;
- (void)_setImageManagerVideoRequestID:(int)a3;
- (void)_setLivePhotoView:(id)a3;
- (void)_setVideoAssetURL:(id)a3;
- (void)cropOverlayWasCancelled:(id)a3;
- (void)cropOverlayWasOKed:(id)a3;
- (void)handleAutoloopSelected;
- (void)handleMediaSelectionUsingTile:(id)a3 managedAsset:(id)a4 args:(id)a5 includeEditing:(BOOL)a6;
- (void)handleVideoSelectionWithURL:(id)a3 args:(id)a4;
- (void)loadView;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)performPhotoPickerSelection;
- (void)setCancellationDelegate:(id)a3;
- (void)setFileResizingDelegate:(id)a3;
- (void)setIrisPlayer:(id)a3;
- (void)setPhotoPicker:(id)a3;
- (void)setResizeTaskDescriptorViewModel:(id)a3;
- (void)set_irisPlayer:(id)a3;
- (void)videoPlayerView:(id)a3 isReadyForDisplayDidChange:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUUIImageViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__videoAssetURL, 0);
  objc_storeStrong((id *)&self->__animatedImageView, 0);
  objc_storeStrong((id *)&self->__autoloopView, 0);
  objc_storeStrong((id *)&self->__livePhotoView, 0);
  objc_storeStrong((id *)&self->__irisPlayer, 0);
  objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, 0);
  objc_destroyWeak((id *)&self->_fileResizingDelegate);
  objc_destroyWeak((id *)&self->_cancellationDelegate);
  objc_destroyWeak((id *)&self->_photoPicker);
  objc_destroyWeak((id *)&self->__imageManagerVideoRequestID);
  objc_storeStrong((id *)&self->_isIris, 0);
}

- (void)_setAnimatedImageRequestID:(int)a3
{
  HIDWORD(self->_asset) = a3;
}

- (int)_animatedImageRequestID
{
  return HIDWORD(self->_asset);
}

- (void)_setImageManagerVideoRequestID:(int)a3
{
  LODWORD(self->_asset) = a3;
}

- (int)_imageManagerVideoRequestID
{
  return (int)self->_asset;
}

- (void)_setAssetURL:(id)a3
{
}

- (NSURL)_assetURL
{
  return self->__videoAssetURL;
}

- (void)_setVideoAssetURL:(id)a3
{
}

- (NSURL)_videoAssetURL
{
  return (NSURL *)self->__animatedImageView;
}

- (void)_setAnimatedImageView:(id)a3
{
}

- (ISAnimatedImageView)_animatedImageView
{
  return (ISAnimatedImageView *)self->__autoloopView;
}

- (void)_setAutoloopView:(id)a3
{
}

- (PUVideoPlayerView)_autoloopView
{
  return (PUVideoPlayerView *)self->__livePhotoView;
}

- (void)_setLivePhotoView:(id)a3
{
}

- (PHLivePhotoView)_livePhotoView
{
  return (PHLivePhotoView *)self->__irisPlayer;
}

- (void)set_irisPlayer:(id)a3
{
}

- (PUBrowsingIrisPlayer)_irisPlayer
{
  return (PUBrowsingIrisPlayer *)self->_resizeTaskDescriptorViewModel;
}

- (void)setResizeTaskDescriptorViewModel:(id)a3
{
}

- (PUPhotoPickerResizeTaskDescriptorViewModel)resizeTaskDescriptorViewModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileResizingDelegate);
  return (PUPhotoPickerResizeTaskDescriptorViewModel *)WeakRetained;
}

- (void)setFileResizingDelegate:(id)a3
{
}

- (PUUIImageViewControllerFileResizingDelegate)fileResizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cancellationDelegate);
  return (PUUIImageViewControllerFileResizingDelegate *)WeakRetained;
}

- (void)setCancellationDelegate:(id)a3
{
}

- (PUUIImageViewControllerCancellationDelegate)cancellationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photoPicker);
  return (PUUIImageViewControllerCancellationDelegate *)WeakRetained;
}

- (void)setPhotoPicker:(id)a3
{
}

- (PUPhotoPicker)photoPicker
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__imageManagerVideoRequestID);
  return (PUPhotoPicker *)WeakRetained;
}

- (BOOL)_isPhotosPickerExtensionAvailable
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)performPhotoPickerSelection
{
  id v3 = [(PLUIImageViewController *)self cropOverlay];
  [(PUUIImageViewController *)self cropOverlayWasOKed:v3];
}

- (BOOL)pu_wantsNavigationBarVisible
{
  if ([(PUUIImageViewController *)self isDisplayedInPhotoPicker]) {
    return ![(PLUIImageViewController *)self _displaysFullScreen];
  }
  v4.receiver = self;
  v4.super_class = (Class)PUUIImageViewController;
  return [(UIViewController *)&v4 pu_wantsNavigationBarVisible];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((void *)PUUIImageViewControllerResizeTaskDescriptorViewModelObservationContext == a5)
  {
    id v8 = [(PLUIImageViewController *)self cropOverlay];
    v6 = [(PUUIImageViewController *)self resizeTaskDescriptorViewModel];
    v7 = [v6 localizedFileSizeDescription];
    [v8 setFileResizingTitle:v7];
  }
}

- (id)cropOverlayFileSizeMenuActions:(id)a3
{
  objc_super v4 = [(PUUIImageViewController *)self fileResizingDelegate];
  v5 = [v4 imageViewControllerFileSizeMenuActions:self];

  return v5;
}

- (int)cropOverlayMode
{
  if (*((unsigned char *)&self->super + 1102)) {
    return 7;
  }
  v3.receiver = self;
  v3.super_class = (Class)PUUIImageViewController;
  return [(PLUIImageViewController *)&v3 cropOverlayMode];
}

- (BOOL)isDisplayedInPhotoPicker
{
  if ([(PUUIImageViewController *)self _isPhotosPickerExtensionAvailable]) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)PUUIImageViewController;
  return [(PLUIImageViewController *)&v4 isDisplayedInPhotoPicker];
}

- (BOOL)uiipc_useTelephonyUI
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB3250]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)wantsLegacyImageUI
{
  if (*((unsigned char *)&self->super + 1099)) {
    return *((unsigned char *)&self->super.super.super.super.isa + (int)*MEMORY[0x1E4F8A608]) & 1;
  }
  else {
    return 1;
  }
}

- (BOOL)wantsAutoloopUI
{
  return *((unsigned char *)&self->super + 1098);
}

- (unint64_t)imagePickerSavingOptions
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB3280]];
  unint64_t v5 = [v4 unsignedIntegerValue];

  return v5;
}

- (BOOL)imagePickerAllowsEditing
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB29F0]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)maxZoomScaleOverride
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];
  objc_super v4 = [v3 objectForKeyedSubscript:@"_UIImagePickerControllerMaxZoomScaleOverride"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)customBackgroundColor
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];
  objc_super v4 = [v3 objectForKeyedSubscript:@"_UIImagePickerControllerCustomBackgroundColor"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = v4;
  }
  else {
    char v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)cancelButtonTitle
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:@"_UIImagePickerControllerCancelButtonTitle"];

  return v4;
}

- (id)chooseButtonTitle
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB31F8]];

  return v4;
}

- (BOOL)force1XCroppedImage
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB31D0]];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)forceNativeScreenScale
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB3210]];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (BOOL)disableVideoTrimMessage
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB3208]];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)videoMaximumDuration
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB2A40]];

  return v4;
}

- (BOOL)viewImageBeforeSelecting
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB3278]];
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (id)exportPreset
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB3270]];

  return v4;
}

- (id)videoQuality
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB2A48]];

  return v4;
}

- (BOOL)doNotTranscode
{
  v2 = [(PUUIImageViewController *)self photoPicker];
  objc_super v3 = [v2 properties];

  objc_super v4 = [v3 objectForKey:*MEMORY[0x1E4FB3258]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (void)_finishAutoloopDeliveryWithVideoURL:(id)a3 gifURL:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLPickerGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [*(id *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x1E4F8A618]) uuid];
    *(_DWORD *)buf = 138412290;
    v18 = v9;
    _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, "Calling back from review UI with selection for looping asset %@", buf, 0xCu);
  }
  if (v7)
  {
    uint64_t v15 = *MEMORY[0x1E4FB31F0];
    id v16 = v7;
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  }
  else
  {
    v10 = 0;
  }
  v11 = PLPhotoPickerDictionaryFromVideo();
  objc_initWeak((id *)buf, self);
  v12 = [(PUUIImageViewController *)self photoPicker];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__PUUIImageViewController__finishAutoloopDeliveryWithVideoURL_gifURL___block_invoke;
  v13[3] = &unk_1E5F2D898;
  objc_copyWeak(&v14, (id *)buf);
  [v12 didSelectMediaWithInfoDictionary:v11 allowedHandler:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __70__PUUIImageViewController__finishAutoloopDeliveryWithVideoURL_gifURL___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _enableCropOverlay];
  }
}

- (void)handleAutoloopSelected
{
  objc_super v3 = [(PUUIImageViewController *)self photoPicker];
  int v4 = [v3 convertAutoloopsToGIF];

  if (v4)
  {
    [(PLUIImageViewController *)self beginDisplayingProgress];
    char v5 = *(Class *)((char *)&self->super.super.super.super.isa + (int)*MEMORY[0x1E4F8A620]);
    id v6 = PLLocalizedFrameworkString();
    [v5 setLabelText:v6];

    id v7 = [(PUUIImageViewController *)self _videoAssetURL];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __49__PUUIImageViewController_handleAutoloopSelected__block_invoke;
    v10[3] = &unk_1E5F2D8C0;
    v10[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_3;
    v9[3] = &unk_1E5F2D8E8;
    v9[4] = self;
    [(PUUIImageViewController *)self _generateGIFFromVideoURL:v7 progressHandler:v10 completionHandler:v9];
  }
  else
  {
    id v8 = [(PUUIImageViewController *)self _videoAssetURL];
    [(PUUIImageViewController *)self _finishAutoloopDeliveryWithVideoURL:v8 gifURL:0];
  }
}

void __49__PUUIImageViewController_handleAutoloopSelected__block_invoke(uint64_t a1, double a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_2;
  v2[3] = &unk_1E5F2E0A8;
  v2[4] = *(void *)(a1 + 32);
  *(double *)&v2[5] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_4;
  block[3] = &unk_1E5F2E908;
  block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_4(void *a1, double a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  LODWORD(a2) = 1.0;
  [*(id *)(a1[4] + (int)*MEMORY[0x1E4F8A620]) setPercentComplete:a2];
  if (a1[5])
  {
    objc_super v3 = (void *)a1[4];
    id v8 = [v3 _videoAssetURL];
    objc_msgSend(v3, "_finishAutoloopDeliveryWithVideoURL:gifURL:");
  }
  else
  {
    int v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = a1[6];
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v5;
      _os_log_impl(&dword_1AE9F8000, v4, OS_LOG_TYPE_ERROR, "Failed to generate GIF from autoloop video with error: %@", buf, 0xCu);
    }

    id v6 = (void *)a1[4];
    id v7 = [v6 _videoAssetURL];
    [v6 _finishAutoloopDeliveryWithVideoURL:v7 gifURL:0];
  }
}

uint64_t __49__PUUIImageViewController_handleAutoloopSelected__block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  *(float *)&double v1 = v1;
  return [*(id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x1E4F8A620]) setPercentComplete:v1];
}

- (void)handleVideoSelectionWithURL:(id)a3 args:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (int)*MEMORY[0x1E4F8A618];
  v9 = PLPhotoPickerDictionaryFromVideo();
  uint64_t v10 = PLPickerGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [*(id *)((char *)&self->super.super.super.super.isa + v8) uuid];
    *(_DWORD *)buf = 138412290;
    id v16 = v11;
    _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_DEFAULT, "Calling back from review UI with selection for video asset %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v12 = [(PUUIImageViewController *)self photoPicker];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PUUIImageViewController_handleVideoSelectionWithURL_args___block_invoke;
  v13[3] = &unk_1E5F2D898;
  objc_copyWeak(&v14, (id *)buf);
  [v12 didSelectMediaWithInfoDictionary:v9 allowedHandler:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __60__PUUIImageViewController_handleVideoSelectionWithURL_args___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _enableCropOverlay];
  }
}

- (void)handleMediaSelectionUsingTile:(id)a3 managedAsset:(id)a4 args:(id)a5 includeEditing:(BOOL)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(PUUIImageViewController *)self photoPicker];
  v13 = [v12 properties];

  uint64_t v14 = (int)*MEMORY[0x1E4F8A618];
  uint64_t v15 = PLPhotoPickerDictionaryFromMedia();
  id v16 = PLPickerGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [*(id *)((char *)&self->super.super.super.super.isa + v14) uuid];
    *(_DWORD *)buf = 138412290;
    v22 = v17;
    _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Calling back from review UI with selection for asset %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v18 = [(PUUIImageViewController *)self photoPicker];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __90__PUUIImageViewController_handleMediaSelectionUsingTile_managedAsset_args_includeEditing___block_invoke;
  v19[3] = &unk_1E5F2D898;
  objc_copyWeak(&v20, (id *)buf);
  [v18 didSelectMediaWithInfoDictionary:v15 allowedHandler:v19];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

void __90__PUUIImageViewController_handleMediaSelectionUsingTile_managedAsset_args_includeEditing___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _enableCropOverlay];
  }
}

- (void)cropOverlayWasOKed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUUIImageViewController *)self fileResizingDelegate];

  if (v5)
  {
    id v6 = [(PUUIImageViewController *)self fileResizingDelegate];
    [v6 imageViewControllerDidConfirmSelection:self];
  }
  else
  {
    if (!*((unsigned char *)&self->super + 1097))
    {
      v8.receiver = self;
      v8.super_class = (Class)PUUIImageViewController;
      [(PLUIImageViewController *)&v8 cropOverlayWasOKed:v4];
      goto LABEL_10;
    }
    id v7 = dispatch_group_create();
    id v6 = v7;
    if (*((unsigned char *)&self->super + 1101))
    {
      dispatch_group_enter(v7);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke;
      v15[3] = &unk_1E5F2E390;
      v15[4] = self;
      id v16 = v6;
      [(PUUIImageViewController *)self _fetchVideoWithCompletion:v15];
    }
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__97030;
    void v13[4] = __Block_byref_object_dispose__97031;
    id v14 = 0;
    if (*((unsigned char *)&self->super + 1100))
    {
      dispatch_group_enter(v6);
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke_234;
      v10[3] = &unk_1E5F2D870;
      v12 = v13;
      id v11 = v6;
      [(PUUIImageViewController *)self _fetchLivePhotoWithCompletion:v10];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke_2;
    block[3] = &unk_1E5F2E200;
    block[4] = self;
    void block[5] = v13;
    dispatch_group_notify(v6, MEMORY[0x1E4F14428], block);
    _Block_object_dispose(v13, 8);
  }
LABEL_10:
}

void __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) _setVideoAssetURL:a2];
  }
  else
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Failed to load video with error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke_234(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __46__PUUIImageViewController_cropOverlayWasOKed___block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  uint64_t v2 = [*(id *)(a1 + 32) _videoAssetURL];

  if (v2)
  {
    objc_super v3 = [*(id *)(a1 + 32) _videoAssetURL];
    [v5 setObject:v3 forKey:*MEMORY[0x1E4FB3228]];
  }
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4) {
    [v5 setObject:v4 forKey:*MEMORY[0x1E4FB2A10]];
  }
  [*(id *)(a1 + 32) handleMediaSelectionUsingTile:*(void *)(*(void *)(a1 + 32) + (int)*MEMORY[0x1E4F8A610]) managedAsset:*(void *)(*(void *)(a1 + 32) + (int)*MEMORY[0x1E4F8A618]) args:v5 includeEditing:0];
  [*(id *)(a1 + 32) _enableCropOverlayIfNecessary];
}

- (void)cropOverlayWasCancelled:(id)a3
{
  uint64_t v4 = [(PUUIImageViewController *)self cancellationDelegate];

  if (v4)
  {
    id v5 = [(PUUIImageViewController *)self cancellationDelegate];
    [v5 imageViewControllerDidCancel:self];
  }
}

- (void)_generateGIFFromVideoURL:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F28CB8];
    id v10 = a3;
    id v11 = [v9 defaultManager];
    v12 = [v11 tmpFileForVideoTranscodeToPhotoDataDirectory:0 withExtension:@"GIF"];

    v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
    id v14 = (void *)[objc_alloc(MEMORY[0x1E4F8CC00]) initWithVideoURL:v10];

    uint64_t v15 = (void *)MEMORY[0x1E4F8CC00];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __86__PUUIImageViewController__generateGIFFromVideoURL_progressHandler_completionHandler___block_invoke;
    v20[3] = &unk_1E5F2D820;
    id v21 = v7;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __86__PUUIImageViewController__generateGIFFromVideoURL_progressHandler_completionHandler___block_invoke_2;
    v17[3] = &unk_1E5F2D848;
    id v18 = v13;
    id v19 = v8;
    id v16 = v13;
    [v15 runExport:v14 toURL:v16 progress:v20 completion:v17];
  }
}

uint64_t __86__PUUIImageViewController__generateGIFFromVideoURL_progressHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __86__PUUIImageViewController__generateGIFFromVideoURL_progressHandler_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (a2) {
    return (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 32), 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)_fetchAnimatedImageWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v5 setVersion:2];
  [v5 setNetworkAccessAllowed:1];
  id v6 = [MEMORY[0x1E4F390D0] defaultManager];
  uint64_t v7 = *(void *)&self->_isIris;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PUUIImageViewController__fetchAnimatedImageWithCompletion___block_invoke;
  v10[3] = &unk_1E5F2D7F8;
  id v11 = v4;
  id v8 = v4;
  uint64_t v9 = [v6 requestAnimatedImageForAsset:v7 options:v5 resultHandler:v10];

  [(PUUIImageViewController *)self _setAnimatedImageRequestID:v9];
}

void __61__PUUIImageViewController__fetchAnimatedImageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (v8)
    {
      (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v8, 0);
    }
    else
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)_fetchLivePhotoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F39148]);
  [v5 setDeliveryMode:1];
  [v5 setNetworkAccessAllowed:1];
  uint64_t v6 = [MEMORY[0x1E4F390D0] defaultManager];
  uint64_t v7 = *(void *)&self->_isIris;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__PUUIImageViewController__fetchLivePhotoWithCompletion___block_invoke;
  v11[3] = &unk_1E5F2D7D0;
  id v12 = v4;
  double v8 = *MEMORY[0x1E4F396D8];
  double v9 = *(double *)(MEMORY[0x1E4F396D8] + 8);
  id v10 = v4;
  objc_msgSend(v6, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v5, v11, v8, v9);
}

uint64_t __57__PUUIImageViewController__fetchLivePhotoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_fetchVideoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  [v5 setVersion:0];
  [v5 setDeliveryMode:1];
  [v5 setNetworkAccessAllowed:1];
  uint64_t v6 = [MEMORY[0x1E4F390D0] defaultManager];
  uint64_t v7 = *(void *)&self->_isIris;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PUUIImageViewController__fetchVideoWithCompletion___block_invoke;
  v10[3] = &unk_1E5F2D7A8;
  id v11 = v4;
  id v8 = v4;
  uint64_t v9 = [v6 requestURLForVideo:v7 options:v5 resultHandler:v10];

  [(PUUIImageViewController *)self _setImageManagerVideoRequestID:v9];
}

void __53__PUUIImageViewController__fetchVideoWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6)
  {
    if (v8)
    {
      (*(void (**)(uint64_t, id, void))(v6 + 16))(v6, v8, 0);
    }
    else
    {
      uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F39698]];
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)_fetchPreviewImageWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = *(void **)&self->_isIris;
  uint64_t v6 = (void *)MEMORY[0x1E4F390D0];
  id v7 = v5;
  id v8 = [v6 defaultManager];
  id v9 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v9 setVersion:0];
  [v9 setDeliveryMode:2];
  [v9 setResizeMode:0];
  [v9 setNetworkAccessAllowed:0];
  id v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;
  [v10 scale];
  double v16 = v12 * v15;
  double v17 = v14 * v15;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__PUUIImageViewController__fetchPreviewImageWithCompletion___block_invoke;
  v19[3] = &unk_1E5F2DA80;
  id v20 = v4;
  id v18 = v4;
  objc_msgSend(v8, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 0, v9, v19, v16, v17);
}

void __60__PUUIImageViewController__fetchPreviewImageWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = *MEMORY[0x1E4F39698];
    id v6 = a2;
    id v7 = [a3 objectForKeyedSubscript:v5];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v7);
  }
}

- (void)_handleLivePhotoRequestResult:(id)a3 info:(id)a4
{
  id v5 = a3;
  id v6 = [(PUUIImageViewController *)self _livePhotoView];
  [v6 setLivePhoto:v5];
}

- (void)_loadLivePhoto
{
  id v3 = *(id *)&self->_isIris;
  id v4 = [MEMORY[0x1E4F390D0] defaultManager];
  id v5 = objc_alloc_init(MEMORY[0x1E4F39148]);
  [v5 setDeliveryMode:1];
  id v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  [v6 scale];
  double v12 = v8 * v11;
  double v13 = v10 * v11;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __41__PUUIImageViewController__loadLivePhoto__block_invoke;
  v14[3] = &unk_1E5F2D780;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v4, "requestLivePhotoForAsset:targetSize:contentMode:options:resultHandler:", v3, 0, v5, v14, v12, v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __41__PUUIImageViewController__loadLivePhoto__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__PUUIImageViewController__loadLivePhoto__block_invoke_2;
  block[3] = &unk_1E5F2D758;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __41__PUUIImageViewController__loadLivePhoto__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleLivePhotoRequestResult:*(void *)(a1 + 32) info:*(void *)(a1 + 40)];
}

- (void)_handleAutoloopVideoResult:(id)a3
{
  id v4 = a3;
  [(PUUIImageViewController *)self _setVideoAssetURL:v4];
  id v8 = [(PUUIImageViewController *)self _autoloopView];
  id v5 = [MEMORY[0x1E4F16620] playerItemWithURL:v4];

  id v6 = objc_alloc_init(MEMORY[0x1E4F8EBD0]);
  [v6 replaceCurrentItemWithPlayerItem:v5];
  [v6 setLoopingEnabled:1 withTemplateItem:v5];
  [v8 configureWithAVPlayer:v6];
  LODWORD(v7) = 1.0;
  [v6 setRate:v7];
}

- (void)_handleAutoloopPreviewImageResult:(id)a3
{
  id v4 = a3;
  id v5 = [(PUUIImageViewController *)self _autoloopView];
  [v5 setPlaceholderImage:v4];
}

- (void)_loadAutoloopVideo
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PUUIImageViewController__loadAutoloopVideo__block_invoke;
  v5[3] = &unk_1E5F2D6E0;
  objc_copyWeak(&v6, &location);
  [(PUUIImageViewController *)self _fetchPreviewImageWithCompletion:v5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PUUIImageViewController__loadAutoloopVideo__block_invoke_214;
  v3[3] = &unk_1E5F2D730;
  objc_copyWeak(&v4, &location);
  [(PUUIImageViewController *)self _fetchVideoWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __45__PUUIImageViewController__loadAutoloopVideo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handleAutoloopPreviewImageResult:v5];
  }
  else
  {
    id WeakRetained = PLUIGetLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1AE9F8000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to load preview image for autoloop with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __45__PUUIImageViewController__loadAutoloopVideo__block_invoke_214(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__PUUIImageViewController__loadAutoloopVideo__block_invoke_2;
    v8[3] = &unk_1E5F2E4E8;
    objc_copyWeak(&v10, (id *)(a1 + 32));
    id v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    double v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Failed to load autoloop video with error: %@", buf, 0xCu);
    }
  }
}

void __45__PUUIImageViewController__loadAutoloopVideo__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAutoloopVideoResult:*(void *)(a1 + 32)];
}

- (void)_handleAnimatedImageResult:(id)a3
{
  id v4 = a3;
  [(PUUIImageViewController *)self _setAnimatedImageRequestID:0];
  id v6 = [(PUUIImageViewController *)self _animatedImageView];
  id v5 = objc_msgSend(v4, "pf_animatedImage");

  [v6 setImage:v5];
  [v6 setPlaying:1];
}

- (void)_handleAnimatedImagePreviewResult:(id)a3
{
  id v4 = a3;
  id v6 = [(PUUIImageViewController *)self _animatedImageView];
  id v5 = [v6 placeholderImageView];
  [v5 setImage:v4];
}

- (void)_loadAnimatedImage
{
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__PUUIImageViewController__loadAnimatedImage__block_invoke;
  v5[3] = &unk_1E5F2D6E0;
  objc_copyWeak(&v6, &location);
  [(PUUIImageViewController *)self _fetchPreviewImageWithCompletion:v5];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PUUIImageViewController__loadAnimatedImage__block_invoke_211;
  v3[3] = &unk_1E5F2D708;
  objc_copyWeak(&v4, &location);
  [(PUUIImageViewController *)self _fetchAnimatedImageWithCompletion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __45__PUUIImageViewController__loadAnimatedImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _handleAnimatedImagePreviewResult:v5];
  }
  else
  {
    id WeakRetained = PLUIGetLog();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v6;
      _os_log_impl(&dword_1AE9F8000, WeakRetained, OS_LOG_TYPE_ERROR, "Failed to load preview image for animated image with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

void __45__PUUIImageViewController__loadAnimatedImage__block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__PUUIImageViewController__loadAnimatedImage__block_invoke_2;
    v8[3] = &unk_1E5F2E4E8;
    objc_copyWeak(&v10, (id *)(a1 + 32));
    id v9 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v8);

    objc_destroyWeak(&v10);
  }
  else
  {
    double v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Failed to load animated image with error: %@", buf, 0xCu);
    }
  }
}

void __45__PUUIImageViewController__loadAnimatedImage__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleAnimatedImageResult:*(void *)(a1 + 32)];
}

- (void)videoPlayerView:(id)a3 isReadyForDisplayDidChange:(BOOL)a4
{
}

- (id)irisPlayerViewViewHostingGestureRecognizers:(id)a3
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PUUIImageViewController;
  [(PUUIImageViewController *)&v17 viewDidLayoutSubviews];
  id v3 = [(PUUIImageViewController *)self view];
  [v3 bounds];
  double v8 = PURectWithAspectRatioFittingRect((double)(unint64_t)[*(id *)&self->_isIris pixelWidth]/ (double)(unint64_t)objc_msgSend(*(id *)&self->_isIris, "pixelHeight"), v4, v5, v6, v7);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = [(PUUIImageViewController *)self _livePhotoView];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);
  double v16 = [(PUUIImageViewController *)self _autoloopView];
  objc_msgSend(v16, "setFrame:", v8, v10, v12, v14);
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PUUIImageViewController;
  [(PLUIImageViewController *)&v5 viewDidAppear:a3];
  CGFloat v4 = [(PUUIImageViewController *)self photoPicker];
  [v4 didDisplayPhotoPickerPreview];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUUIImageViewController;
  [(PLUIImageViewController *)&v6 viewWillDisappear:a3];
  if (LODWORD(self->_asset))
  {
    CGFloat v4 = [MEMORY[0x1E4F390D0] defaultManager];
    [v4 cancelImageRequest:LODWORD(self->_asset)];
  }
  if (HIDWORD(self->_asset))
  {
    objc_super v5 = [MEMORY[0x1E4F390D0] defaultManager];
    [v5 cancelImageRequest:HIDWORD(self->_asset)];
  }
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)PUUIImageViewController;
  [(PUUIImageViewController *)&v9 viewDidLoad];
  uint64_t v3 = [(PUUIImageViewController *)self resizeTaskDescriptorViewModel];
  CGFloat v4 = (void *)v3;
  if (*((unsigned char *)&self->super + 1102)) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    objc_super v6 = [(PLUIImageViewController *)self cropOverlay];
    [v6 setFileResizingHidden:0];

    CGFloat v7 = [(PLUIImageViewController *)self cropOverlay];
    double v8 = [v4 localizedFileSizeDescription];
    [v7 setFileResizingTitle:v8];

    [v4 registerChangeObserver:self context:PUUIImageViewControllerResizeTaskDescriptorViewModelObservationContext];
  }
}

- (void)setIrisPlayer:(id)a3
{
  BOOL v5 = (PUPhotoPickerResizeTaskDescriptorViewModel *)a3;
  if (self->_resizeTaskDescriptorViewModel != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_resizeTaskDescriptorViewModel, a3);
    objc_super v6 = [(PUPhotoPickerResizeTaskDescriptorViewModel *)self->_resizeTaskDescriptorViewModel player];
    CGFloat v7 = [(PUUIImageViewController *)self _livePhotoView];
    [v7 setPlayer:v6];

    BOOL v5 = v8;
  }
}

- (void)loadView
{
  v9.receiver = self;
  v9.super_class = (Class)PUUIImageViewController;
  [(PLUIImageViewController *)&v9 loadView];
  if (*((unsigned char *)&self->super + 1097))
  {
    uint64_t v3 = [(PUUIImageViewController *)self view];
    CGFloat v4 = (PUVideoPlayerView *)objc_alloc_init(MEMORY[0x1E4F39928]);
    BOOL v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(PUVideoPlayerView *)v4 setBackgroundColor:v5];

    [(PUVideoPlayerView *)v4 setAutoresizingMask:18];
    [v3 bounds];
    -[PUVideoPlayerView setFrame:](v4, "setFrame:");
    [(PUVideoPlayerView *)v4 setContentMode:1];
    [(PUVideoPlayerView *)v4 setClipsToBounds:1];
    [v3 insertSubview:v4 atIndex:1];
    [(PUUIImageViewController *)self _setLivePhotoView:v4];
    [(PUUIImageViewController *)self _setImageManagerVideoRequestID:0];
    [(PUUIImageViewController *)self _loadLivePhoto];
LABEL_5:

    return;
  }
  if (*((unsigned char *)&self->super + 1098))
  {
    uint64_t v3 = [(PUUIImageViewController *)self view];
    CGFloat v4 = objc_alloc_init(PUVideoPlayerView);
    [(PUVideoPlayerView *)v4 setAutoresizingMask:18];
    [v3 bounds];
    -[PUVideoPlayerView setFrame:](v4, "setFrame:");
    [(PUVideoPlayerView *)v4 setDelegate:self];
    [v3 insertSubview:v4 atIndex:1];
    [(PUUIImageViewController *)self _setAutoloopView:v4];
    [(PUUIImageViewController *)self _setImageManagerVideoRequestID:0];
    [(PUUIImageViewController *)self _loadAutoloopVideo];
    goto LABEL_5;
  }
  if (*((unsigned char *)&self->super + 1099)
    && (*((unsigned char *)&self->super.super.super.super.isa + (int)*MEMORY[0x1E4F8A608]) & 1) == 0)
  {
    uint64_t v3 = [(PUUIImageViewController *)self view];
    id v6 = objc_alloc(MEMORY[0x1E4F8EB90]);
    [v3 bounds];
    CGFloat v4 = (PUVideoPlayerView *)objc_msgSend(v6, "initWithFrame:");
    [(PUVideoPlayerView *)v4 setAutoresizingMask:18];
    [(PUVideoPlayerView *)v4 setContentMode:1];
    [(PUVideoPlayerView *)v4 setClipsToBounds:1];
    id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v8 setContentMode:1];
    [(PUVideoPlayerView *)v4 setPlaceholderImageView:v8];
    [v3 insertSubview:v4 atIndex:0];
    [(PUUIImageViewController *)self _setAnimatedImageView:v4];
    [(PUUIImageViewController *)self _setAnimatedImageRequestID:0];
    [(PUUIImageViewController *)self _loadAnimatedImage];

    goto LABEL_5;
  }
}

- (PUUIImageViewController)initWithPhoto:(id)a3 imagePickerProperties:(id)a4 expectsLivePhoto:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PUUIImageViewController;
  id v10 = [(PLUIImageViewController *)&v20 initWithPhoto:v8];
  if (v10)
  {
    double v11 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    double v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F39508], *MEMORY[0x1E4F39448], 0);
    uint64_t v13 = objc_msgSend(v8, "pl_PHAssetWithPropertySets:photoLibrary:", v12, v11);
    double v14 = (void *)*((void *)v10 + 138);
    *((void *)v10 + 138) = v13;

    *((unsigned char *)v10 + 1100) = a5;
    id v15 = [v9 objectForKey:*MEMORY[0x1E4FB31E0]];
    *((unsigned char *)v10 + 1101) = [v15 BOOLValue];

    double v16 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FB3248]];
    *((unsigned char *)v10 + 1102) = [v16 BOOLValue];

    *((unsigned char *)v10 + 1098) = [*((id *)v10 + 138) canPlayLoopingVideo];
    if (*((unsigned char *)v10 + 1100) || (char v17 = *((unsigned char *)v10 + 1101)) != 0)
    {
      if ([*((id *)v10 + 138) canPlayPhotoIris]) {
        char v17 = *((unsigned char *)v10 + 1098) == 0;
      }
      else {
        char v17 = 0;
      }
    }
    *((unsigned char *)v10 + 1097) = v17;
    *((unsigned char *)v10 + 1099) = [*((id *)v10 + 138) playbackStyle] == 2;
    id v18 = [v10 localizedTitle];
    [v10 setTitle:v18];
  }
  return (PUUIImageViewController *)v10;
}

@end