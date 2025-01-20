@interface PUImageTileViewController
+ (id)_supportedZoomImageFormats;
- (BOOL)_assetNeedsHDR;
- (BOOL)_needsUpdate;
- (BOOL)_needsUpdateDidRequestHDR;
- (BOOL)_needsUpdateFullSizeImageMetadata;
- (BOOL)_needsUpdateFullSizeTiledLayer;
- (BOOL)_needsUpdateImage;
- (BOOL)_needsUpdateImageLayerModulator;
- (BOOL)_needsUpdateImageLayerModulatorInput;
- (BOOL)_needsUpdateImageLayerModulatorManager;
- (BOOL)animatesImageTransitions;
- (BOOL)canUseFullSizeTiledLayer;
- (BOOL)didRequestHDR;
- (BOOL)gainMapImageIsAvailable;
- (BOOL)isDeferredProcessingFinished;
- (BOOL)isDisplayingFullQualityImage;
- (BOOL)needsUpdateTargetSize;
- (BOOL)requiresFullQualityImage;
- (BOOL)shouldAdoptResult:(id)a3 overExistingResult:(id)a4;
- (BOOL)shouldAnimateAppearanceOfResult:(id)a3 overExistingResult:(id)a4;
- (BOOL)shouldAnimatePreferredDynamicRangeChanges;
- (BOOL)shouldAnimateToFullQualityResult;
- (BOOL)shouldAvoidInPlaceSnapshottedFadeOut;
- (BOOL)shouldRequestHDR;
- (BOOL)shouldRetainNonFinalImageUntilZoom;
- (BOOL)shouldUseFullSizeImageData;
- (BOOL)wantsVisibleRectChanges;
- (CGImage)gainMapImage;
- (CGSize)_fullSizeImageSize;
- (CGSize)_fullSizeImageUntransformedSize;
- (CGSize)_targetSize;
- (NSData)_fullSizeImageData;
- (NSDate)_assetLoadingStartDate;
- (NSURL)_fullSizeImageURL;
- (PLTileableLayer)_fullSizeTiledLayer;
- (PUAssetViewModel)assetViewModel;
- (PUBrowsingViewModel)browsingViewModel;
- (PUDisplayAsset)asset;
- (PUImageRequester)_imageRequester;
- (PUImageRequesterResult)displayedImageRequestResult;
- (PUImageTileViewController)initWithReuseIdentifier:(id)a3;
- (PUImageTileViewControllerPresentingDelegate)presentingDelegate;
- (PUMediaProvider)mediaProvider;
- (PXEventCoalescer)targetSizeUpdateRateLimiter;
- (PXImageLayerModulator)imageLayerModulator;
- (PXImageModulationManager)imageModulationManager;
- (PXNumberAnimator)tiledLayerAlphaAnimator;
- (UIColor)placeholderColor;
- (UIImage)image;
- (UIImageView)_imageView;
- (UIView)tiledLayerHostingView;
- (double)_screenScale;
- (float)gainMapValue;
- (id)generateAssetTransitionInfo;
- (id)loadView;
- (int64_t)_assetLoadingStage;
- (int64_t)_fullSizeImageOrientation;
- (void)_applyHDRSuppressionToWithTraitEnvironment:(id)a3;
- (void)_cancelAllImageRequests;
- (void)_configureImageViewPreferredImageDynamicRange;
- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4;
- (void)_handleBrowsingViewModel:(id)a3 didChange:(id)a4;
- (void)_handleShouldReloadAssetMediaNotification:(id)a3;
- (void)_invalidate;
- (void)_invalidateDidRequestHDR;
- (void)_invalidateFullSizeImageMetadata;
- (void)_invalidateFullSizeTiledLayer;
- (void)_invalidateImage;
- (void)_invalidateImageLayerModulator;
- (void)_invalidateImageLayerModulatorInput;
- (void)_invalidateImageLayerModulatorManager;
- (void)_invalidateTargetSize;
- (void)_notifyDeferredProcessingDoneAndFinalImageDisplayedIfNeeded;
- (void)_notifyFullQualityImageDisplayed;
- (void)_registerIfPossibleForHeadroomUsageTraitChangesOfView:(id)a3;
- (void)_setAssetLoadingStage:(int64_t)a3;
- (void)_setAssetLoadingStartDate:(id)a3;
- (void)_setAssetWithoutUpdateIfNeeded:(id)a3;
- (void)_setFullSizeImageData:(id)a3;
- (void)_setFullSizeImageOrientation:(int64_t)a3;
- (void)_setFullSizeImageSize:(CGSize)a3;
- (void)_setFullSizeImageURL:(id)a3;
- (void)_setFullSizeImageUntransformedSize:(CGSize)a3;
- (void)_setFullSizeTiledLayer:(id)a3;
- (void)_setImageRequester:(id)a3;
- (void)_setNeedsUpdateDidRequestHDR:(BOOL)a3;
- (void)_setNeedsUpdateFullSizeImageMetadata:(BOOL)a3;
- (void)_setNeedsUpdateFullSizeTiledLayer:(BOOL)a3;
- (void)_setNeedsUpdateImage:(BOOL)a3;
- (void)_setNeedsUpdateImageLayerModulator:(BOOL)a3;
- (void)_setNeedsUpdateImageLayerModulatorInput:(BOOL)a3;
- (void)_setNeedsUpdateImageLayerModulatorManager:(BOOL)a3;
- (void)_setTargetSize:(CGSize)a3;
- (void)_updateAssetLoadingStage;
- (void)_updateDidRequestHDRIfNeeded;
- (void)_updateFullSizeImageMetadataIfNeeded;
- (void)_updateFullSizeTiledLayerIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateImageIfNeeded;
- (void)_updateImageLayerModulatorIfNeeded;
- (void)_updateImageLayerModulatorInputIfNeeded;
- (void)_updateImageLayerModulatorManagerIfNeeded;
- (void)_updateImageRequesterFullSizeImageDataProperties;
- (void)_updateImageRequesterTargetSize;
- (void)_updateImageViewBackgroundColor;
- (void)_updateModulatorManager;
- (void)_updateReadyForDisplay;
- (void)_updateTargetSizeIfNeeded;
- (void)applyLayoutInfo:(id)a3;
- (void)becomeReusable;
- (void)dealloc;
- (void)didChangeVisibleRect;
- (void)displayImageRequestResult:(id)a3;
- (void)expectedPresentationSizeDidChange;
- (void)imageRequester:(id)a3 didProduceResult:(id)a4;
- (void)imageRequesterDidUpdateFullSizeImageData:(id)a3;
- (void)isViewControllerTransitioningDidChange;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)outputEventSignaledForCoalescer:(id)a3;
- (void)setAnimatesImageTransitions:(BOOL)a3;
- (void)setAsset:(id)a3;
- (void)setAssetViewModel:(id)a3;
- (void)setBrowsingViewModel:(id)a3;
- (void)setCanUseFullSizeTiledLayer:(BOOL)a3;
- (void)setDisplayedImageRequestResult:(id)a3;
- (void)setEdgeAntialiasingEnabled:(BOOL)a3;
- (void)setGainMapImage:(CGImage *)a3;
- (void)setGainMapValue:(float)a3;
- (void)setImageLayerModulator:(id)a3;
- (void)setImageModulationManager:(id)a3;
- (void)setIsDisplayingFullQualityImage:(BOOL)a3;
- (void)setMediaProvider:(id)a3;
- (void)setNeedsUpdateTargetSize:(BOOL)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setPreloadedImage:(id)a3;
- (void)setPresentingDelegate:(id)a3;
- (void)setRequiresFullQualityImage:(BOOL)a3;
- (void)setShouldAnimateToFullQualityResult:(BOOL)a3;
- (void)setShouldRetainNonFinalImageUntilZoom:(BOOL)a3;
- (void)setShouldUseFullSizeImageData:(BOOL)a3;
- (void)setTiledLayerAlphaAnimator:(id)a3;
- (void)setTiledLayerHostingView:(id)a3;
- (void)updateModulator;
- (void)updateModulatorInputs;
- (void)updateMutableImageLayerModulator:(id)a3;
- (void)viewModel:(id)a3 didChange:(id)a4;
@end

@implementation PUImageTileViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedImageRequestResult, 0);
  objc_storeStrong((id *)&self->_targetSizeUpdateRateLimiter, 0);
  objc_storeStrong((id *)&self->_imageLayerModulator, 0);
  objc_storeStrong((id *)&self->__imageRequester, 0);
  objc_storeStrong((id *)&self->__assetLoadingStartDate, 0);
  objc_storeStrong((id *)&self->__fullSizeTiledLayer, 0);
  objc_storeStrong((id *)&self->__fullSizeImageURL, 0);
  objc_storeStrong((id *)&self->__fullSizeImageData, 0);
  objc_storeStrong((id *)&self->_tiledLayerAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_tiledLayerHostingView, 0);
  objc_storeStrong((id *)&self->__imageView, 0);
  objc_destroyWeak((id *)&self->_presentingDelegate);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_imageModulationManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_storeStrong((id *)&self->_browsingViewModel, 0);
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (PUImageRequesterResult)displayedImageRequestResult
{
  return self->_displayedImageRequestResult;
}

- (BOOL)isDisplayingFullQualityImage
{
  return self->_isDisplayingFullQualityImage;
}

- (PXEventCoalescer)targetSizeUpdateRateLimiter
{
  return self->_targetSizeUpdateRateLimiter;
}

- (PXImageLayerModulator)imageLayerModulator
{
  return self->_imageLayerModulator;
}

- (PUImageRequester)_imageRequester
{
  return self->__imageRequester;
}

- (void)setShouldRetainNonFinalImageUntilZoom:(BOOL)a3
{
  self->_shouldRetainNonFinalImageUntilZoom = a3;
}

- (BOOL)shouldRetainNonFinalImageUntilZoom
{
  return self->_shouldRetainNonFinalImageUntilZoom;
}

- (BOOL)shouldAnimateToFullQualityResult
{
  return self->_shouldAnimateToFullQualityResult;
}

- (void)setRequiresFullQualityImage:(BOOL)a3
{
  self->_requiresFullQualityImage = a3;
}

- (BOOL)requiresFullQualityImage
{
  return self->_requiresFullQualityImage;
}

- (BOOL)canUseFullSizeTiledLayer
{
  return self->_canUseFullSizeTiledLayer;
}

- (void)_setAssetLoadingStartDate:(id)a3
{
}

- (NSDate)_assetLoadingStartDate
{
  return self->__assetLoadingStartDate;
}

- (int64_t)_assetLoadingStage
{
  return self->__assetLoadingStage;
}

- (void)_setFullSizeTiledLayer:(id)a3
{
}

- (PLTileableLayer)_fullSizeTiledLayer
{
  return self->__fullSizeTiledLayer;
}

- (void)_setFullSizeImageSize:(CGSize)a3
{
  self->__fullSizeImageSize = a3;
}

- (CGSize)_fullSizeImageSize
{
  double width = self->__fullSizeImageSize.width;
  double height = self->__fullSizeImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setFullSizeImageUntransformedSize:(CGSize)a3
{
  self->__fullSizeImageUntransformedSize = a3;
}

- (CGSize)_fullSizeImageUntransformedSize
{
  double width = self->__fullSizeImageUntransformedSize.width;
  double height = self->__fullSizeImageUntransformedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_setFullSizeImageOrientation:(int64_t)a3
{
  self->__fullSizeImageOrientation = a3;
}

- (int64_t)_fullSizeImageOrientation
{
  return self->__fullSizeImageOrientation;
}

- (NSURL)_fullSizeImageURL
{
  return self->__fullSizeImageURL;
}

- (NSData)_fullSizeImageData
{
  return self->__fullSizeImageData;
}

- (void)setTiledLayerAlphaAnimator:(id)a3
{
}

- (PXNumberAnimator)tiledLayerAlphaAnimator
{
  return self->_tiledLayerAlphaAnimator;
}

- (void)setTiledLayerHostingView:(id)a3
{
}

- (UIView)tiledLayerHostingView
{
  return self->_tiledLayerHostingView;
}

- (UIImageView)_imageView
{
  return self->__imageView;
}

- (void)setNeedsUpdateTargetSize:(BOOL)a3
{
  self->_needsUpdateTargetSize = a3;
}

- (BOOL)needsUpdateTargetSize
{
  return self->_needsUpdateTargetSize;
}

- (CGSize)_targetSize
{
  double width = self->__targetSize.width;
  double height = self->__targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)didRequestHDR
{
  return self->_didRequestHDR;
}

- (void)_setNeedsUpdateDidRequestHDR:(BOOL)a3
{
  self->__needsUpdateDidRequestHDR = a3;
}

- (BOOL)_needsUpdateDidRequestHDR
{
  return self->__needsUpdateDidRequestHDR;
}

- (void)_setNeedsUpdateFullSizeTiledLayer:(BOOL)a3
{
  self->__needsUpdateFullSizeTiledLayer = a3;
}

- (BOOL)_needsUpdateFullSizeTiledLayer
{
  return self->__needsUpdateFullSizeTiledLayer;
}

- (void)_setNeedsUpdateFullSizeImageMetadata:(BOOL)a3
{
  self->__needsUpdateFullSizeImageMetadata = a3;
}

- (BOOL)_needsUpdateFullSizeImageMetadata
{
  return self->__needsUpdateFullSizeImageMetadata;
}

- (void)_setNeedsUpdateImageLayerModulatorInput:(BOOL)a3
{
  self->__needsUpdateImageLayerModulatorInput = a3;
}

- (BOOL)_needsUpdateImageLayerModulatorInput
{
  return self->__needsUpdateImageLayerModulatorInput;
}

- (void)_setNeedsUpdateImageLayerModulator:(BOOL)a3
{
  self->__needsUpdateImageLayerModulator = a3;
}

- (BOOL)_needsUpdateImageLayerModulator
{
  return self->__needsUpdateImageLayerModulator;
}

- (void)_setNeedsUpdateImageLayerModulatorManager:(BOOL)a3
{
  self->__needsUpdateImageLayerModulatorManager = a3;
}

- (BOOL)_needsUpdateImageLayerModulatorManager
{
  return self->__needsUpdateImageLayerModulatorManager;
}

- (void)_setNeedsUpdateImage:(BOOL)a3
{
  self->__needsUpdateImage = a3;
}

- (BOOL)_needsUpdateImage
{
  return self->__needsUpdateImage;
}

- (BOOL)shouldUseFullSizeImageData
{
  return self->_shouldUseFullSizeImageData;
}

- (void)setAnimatesImageTransitions:(BOOL)a3
{
  self->_animatesImageTransitions = a3;
}

- (BOOL)animatesImageTransitions
{
  return self->_animatesImageTransitions;
}

- (PUImageTileViewControllerPresentingDelegate)presentingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);
  return (PUImageTileViewControllerPresentingDelegate *)WeakRetained;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (PXImageModulationManager)imageModulationManager
{
  return self->_imageModulationManager;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (PUDisplayAsset)asset
{
  return self->_asset;
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (PUBrowsingViewModel)browsingViewModel
{
  return self->_browsingViewModel;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)tiledLayerAlphaAnimatorContext == a5)
  {
    if ((v6 & 2) == 0) {
      goto LABEL_8;
    }
    id v15 = v9;
    v10 = [(PUImageTileViewController *)self tiledLayerAlphaAnimator];
    [v10 presentationValue];
    double v12 = v11;
    v13 = [(PUImageTileViewController *)self tiledLayerHostingView];
    [v13 setAlpha:v12];

    goto LABEL_7;
  }
  if ((void *)PXDisplayScreenDynamicRangeObservationContext != a5)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PUImageTileViewController.m" lineNumber:1441 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v15 = v9;
    [(PUImageTileViewController *)self _invalidateDidRequestHDR];
    [(PUImageTileViewController *)self _invalidateImage];
    [(PUImageTileViewController *)self _invalidateFullSizeTiledLayer];
    [(PUImageTileViewController *)self _updateIfNeeded];
LABEL_7:
    id v9 = v15;
  }
LABEL_8:
}

- (void)setPresentingDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presentingDelegate, obj);
    p_presentingDelegateFlags = &self->_presentingDelegateFlags;
    p_presentingDelegateFlags->respondsToPPTShouldSignalDeferredProcessingDoneAndFinalImageDisplayed = objc_opt_respondsToSelector() & 1;
    p_presentingDelegateFlags->respondsToFullQualityImageDisplayed = objc_opt_respondsToSelector() & 1;
  }
}

- (void)_handleBrowsingViewModel:(id)a3 didChange:(id)a4
{
  if (objc_msgSend(a4, "isPresentedForPreviewDidChange", a3))
  {
    [(PUImageTileViewController *)self _configureImageViewPreferredImageDynamicRange];
  }
}

- (void)_handleAssetViewModel:(id)a3 didChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 revealsGainMapImageChanged])
  {
    v8 = [(PUImageTileViewController *)self imageLayerModulator];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__PUImageTileViewController__handleAssetViewModel_didChange___block_invoke;
    v10[3] = &unk_1E5F2D330;
    v10[4] = self;
    [v8 performChanges:v10];
  }
  if ([v7 assetChanged])
  {
    id v9 = [v6 asset];
    [(PUImageTileViewController *)self _setAssetWithoutUpdateIfNeeded:v9];
  }
  [(PUImageTileViewController *)self _updateIfNeeded];
}

void __61__PUImageTileViewController__handleAssetViewModel_didChange___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 assetViewModel];
  objc_msgSend(v3, "setRevealsGainMapImage:", objc_msgSend(v4, "revealsGainMapImage"));
}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (![(PUTileController *)self shouldPreserveCurrentContent])
  {
    id v7 = [(PUImageTileViewController *)self assetViewModel];

    if (v7 == v9)
    {
      [(PUImageTileViewController *)self _handleAssetViewModel:v9 didChange:v6];
    }
    else
    {
      id v8 = [(PUImageTileViewController *)self browsingViewModel];

      if (v8 == v9) {
        [(PUImageTileViewController *)self _handleBrowsingViewModel:v9 didChange:v6];
      }
    }
  }
}

- (void)_updateImageViewBackgroundColor
{
  id v6 = [(PUImageTileViewController *)self displayedImageRequestResult];
  id v3 = [v6 image];
  if (v3) {
    [MEMORY[0x1E4FB1618] clearColor];
  }
  else {
  id v4 = [(PUImageTileViewController *)self placeholderColor];
  }
  v5 = [(PUImageTileViewController *)self _imageView];
  [v5 setBackgroundColor:v4];
}

- (void)_cancelAllImageRequests
{
  id v2 = [(PUImageTileViewController *)self _imageRequester];
  [v2 cancelAllImageRequests];
}

- (id)generateAssetTransitionInfo
{
  id v3 = [(PUImageTileViewController *)self _imageView];
  id v4 = [v3 image];

  v5 = (void *)MEMORY[0x1E4F902A0];
  id v6 = [(PUImageTileViewController *)self asset];
  uint64_t v7 = [v5 optionsForAsset:v6];
  uint64_t v9 = v8;

  v10 = [(PUImageTileViewController *)self imageModulationManager];
  double v11 = objc_msgSend(v10, "checkoutImageLayerModulatorWithOptions:", v7, v9);

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __56__PUImageTileViewController_generateAssetTransitionInfo__block_invoke;
  v19[3] = &unk_1E5F2D330;
  v19[4] = self;
  [v11 performChanges:v19];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__PUImageTileViewController_generateAssetTransitionInfo__block_invoke_2;
  v16[3] = &unk_1E5F2D358;
  v16[4] = self;
  id v17 = v4;
  id v18 = v11;
  id v12 = v11;
  id v13 = v4;
  v14 = +[PUAssetTransitionInfo assetTransitionInfoWithConfigurationBlock:v16];

  return v14;
}

void __56__PUImageTileViewController_generateAssetTransitionInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v4, "setGainMapImage:", objc_msgSend(v3, "gainMapImage"));
  [*(id *)(a1 + 32) gainMapValue];
  objc_msgSend(v4, "setGainMapValue:");
}

void __56__PUImageTileViewController_generateAssetTransitionInfo__block_invoke_2(void *a1, void *a2)
{
  id v3 = (void *)a1[4];
  id v5 = a2;
  id v4 = [v3 asset];
  [v5 setAsset:v4];

  [v5 setImage:a1[5]];
  [v5 setImageLayerModulator:a1[6]];
}

- (void)_updateReadyForDisplay
{
  BOOL v3 = [(PUImageTileViewController *)self isDisplayingFullQualityImage];
  [(PUTileViewController *)self _setReadyForDisplay:v3];
}

- (void)setDisplayedImageRequestResult:(id)a3
{
  id v5 = (PUImageRequesterResult *)a3;
  if (self->_displayedImageRequestResult != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_displayedImageRequestResult, a3);
    [(PUImageTileViewController *)self displayedImageRequestResultDidChange];
    id v5 = v6;
  }
}

- (void)setIsDisplayingFullQualityImage:(BOOL)a3
{
  if (self->_isDisplayingFullQualityImage != a3)
  {
    self->_isDisplayingFullQualityImage = a3;
    [(PUImageTileViewController *)self _updateReadyForDisplay];
  }
}

- (void)_applyHDRSuppressionToWithTraitEnvironment:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PUImageTileViewController *)self _fullSizeTiledLayer];
  id v6 = [v5 sublayers];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    id v19 = v4;
    uint64_t v8 = [v4 traitCollection];
    uint64_t v9 = [v8 _headroomUsage];

    v10 = [v5 sublayers];
    double v11 = [v10 objectAtIndexedSubscript:0];
    id v12 = objc_msgSend(v11, "_ui_animationForHDRHeadroomUsageEnabled:", v9 != 0);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = v10;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v18, "_ui_configureForHDRHeadroomUsageEnabled:", v9 != 0);
          if (v12) {
            [v18 addAnimation:v12 forKey:@"contentsEDRStrength"];
          }
          else {
            [v18 removeAnimationForKey:@"contentsEDRStrength"];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v15);
    }

    id v4 = v19;
  }
}

- (void)_registerIfPossibleForHeadroomUsageTraitChangesOfView:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = self;
  v11[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__PUImageTileViewController__registerIfPossibleForHeadroomUsageTraitChangesOfView___block_invoke;
  v8[3] = &unk_1E5F25AF0;
  objc_copyWeak(&v9, &location);
  id v7 = (id)[v4 registerForTraitChanges:v6 withHandler:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __83__PUImageTileViewController__registerIfPossibleForHeadroomUsageTraitChangesOfView___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _applyHDRSuppressionToWithTraitEnvironment:v3];
}

- (void)_updateFullSizeTiledLayerIfNeeded
{
  if ([(PUImageTileViewController *)self _needsUpdateFullSizeTiledLayer])
  {
    [(PUImageTileViewController *)self _setNeedsUpdateFullSizeTiledLayer:0];
    uint64_t v3 = [(PUImageTileViewController *)self _fullSizeImageData];
    uint64_t v4 = [(PUImageTileViewController *)self _fullSizeImageURL];
    if (v3 | v4)
    {
      BOOL v5 = [(PUTileViewController *)self isViewLoaded];
      id v6 = [(PUImageTileViewController *)self _fullSizeTiledLayer];
      if (v5)
      {
        id v7 = [(PUImageTileViewController *)self _imageView];
        unint64_t v8 = ([(PUImageTileViewController *)self _fullSizeImageOrientation] - 2) & 0xFFFFFFFFFFFFFFFALL;
        if (!v6)
        {
          id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
          [v7 frame];
          v10 = objc_msgSend(v9, "initWithFrame:");
          [(PUImageTileViewController *)self setTiledLayerHostingView:v10];
          [v10 setAutoresizingMask:18];
          [v7 addSubview:v10];
          double v11 = [v7 layer];
          id v12 = [v10 layer];
          [v11 insertSublayer:v12 atIndex:0];

          id v13 = [(PUTileViewController *)self view];
          uint64_t v14 = [v13 window];
          uint64_t v15 = [v14 screen];
          [v15 nativeBounds];
          double v17 = v16;
          double v19 = v18;

          long long v20 = +[PUOneUpSettings sharedInstance];
          v128 = v20;
          if ([v20 enableFigPhotoTiledLayer])
          {
            if ([v20 enableFigPhotoBackgroundSizeBasedDisplay])
            {
              long long v21 = [(PUImageTileViewController *)self image];
              [v21 size];
              long long v22 = [(PUImageTileViewController *)self image];
              [v22 scale];
              PXSizeScale();
              double v24 = v23;
              double v26 = v25;
            }
            else
            {
              double v24 = *MEMORY[0x1E4F1DB30];
              double v26 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
            }
            if ([v20 simulateWorstCaseFigPhotoBackgroundSize])
            {
              v125 = [(PUImageTileViewController *)self image];
              [v125 size];
              v123 = [(PUImageTileViewController *)self image];
              [v123 size];
              v122 = [(PUTileViewController *)self view];
              v120 = [v122 window];
              [v120 bounds];
              PFSizeWithAspectRatioFittingSize();
              v28 = [(PUTileViewController *)self view];
              v29 = [v28 window];
              v30 = [v29 screen];
              [v30 scale];
              PXSizeScale();
              double v24 = v31;
              double v26 = v32;
            }
            if (v8) {
              double v33 = v26;
            }
            else {
              double v33 = v24;
            }
            if (!v8) {
              double v24 = v26;
            }
            if (v3)
            {
              v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F55F88]), "initWithContainerData:containerImageIndex:backgroundImageSize:screenSize:", v3, 0, v24, v33, v17, v19);
            }
            else if (v4)
            {
              v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F55F88]), "initWithContainerURL:containerImageIndex:backgroundImageSize:screenSize:", v4, 0, v24, v33, v17, v19);
            }
            else
            {
              v34 = 0;
            }
            id v6 = v34;
            if ([(PUImageTileViewController *)self didRequestHDR])
            {
              id v35 = [(PUImageTileViewController *)self image];
              v36 = (CGImage *)[v35 CGImage];

              ColorSpace = CGImageGetColorSpace(v36);
              BOOL v38 = CGColorSpaceUsesITUR_2100TF(ColorSpace);
              uint64_t v39 = v38 ? 1 : 2;
              [v6 setDecodeToHDROutputMode:v39];
              [v6 setShouldDisplayHDR:v38];
              if (v38) {
                [v6 setFlexGTCColorSpace:ColorSpace];
              }
            }
            [v6 prepareForDecode];
            [(PUImageTileViewController *)self _registerIfPossibleForHeadroomUsageTraitChangesOfView:v7];
          }
          else if (v3)
          {
            id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F8A5F0]), "initWithJPEGData:placeholderImage:screenSize:", v3, 0, v17, v19);
          }
          else
          {
            id v6 = 0;
          }
          double v40 = *MEMORY[0x1E4F1DAD8];
          double v41 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          [(PUImageTileViewController *)self _fullSizeImageUntransformedSize];
          objc_msgSend(v6, "setBounds:", v40, v41, v42, v43);
          v44 = +[PUOneUpSettings sharedInstance];
          int v45 = [v44 useDebuggingColors];

          if (v45)
          {
            id v46 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:0.5 blue:0.0 alpha:0.25];
            objc_msgSend(v6, "setBorderColor:", objc_msgSend(v46, "CGColor"));

            [v6 setBorderWidth:100.0];
          }
          v47 = [v10 layer];
          [v47 addSublayer:v6];

          v48 = [(PUImageTileViewController *)self tiledLayerAlphaAnimator];

          if (!v48)
          {
            v49 = (void *)[objc_alloc(MEMORY[0x1E4F912A8]) initWithValue:0.0];
            [(PUImageTileViewController *)self setTiledLayerAlphaAnimator:v49];

            v50 = [(PUImageTileViewController *)self tiledLayerAlphaAnimator];
            [v50 registerChangeObserver:self context:tiledLayerAlphaAnimatorContext];
          }
          v51 = [(PUImageTileViewController *)self tiledLayerAlphaAnimator];
          [v51 performChangesWithoutAnimation:&__block_literal_global_224];

          [v10 setAlpha:0.0];
          v52 = [(PUImageTileViewController *)self tiledLayerAlphaAnimator];
          [v52 performChangesWithDuration:4 curve:&__block_literal_global_226 changes:1.0];

          [(PUImageTileViewController *)self _setFullSizeTiledLayer:v6];
        }
        v53 = [(PUImageTileViewController *)self tiledLayerHostingView];
        [v53 bounds];
        CGFloat v55 = v54;
        CGFloat v57 = v56;
        CGFloat v59 = v58;
        CGFloat v61 = v60;

        v140.origin.x = v55;
        v140.origin.y = v57;
        v140.size.double width = v59;
        v140.size.double height = v61;
        CGFloat MidX = CGRectGetMidX(v140);
        v141.origin.x = v55;
        v141.origin.y = v57;
        CGFloat v62 = v57;
        v141.size.double width = v59;
        CGFloat v121 = v59;
        v141.size.double height = v61;
        CGFloat MidY = CGRectGetMidY(v141);
        long long v127 = *MEMORY[0x1E4F1DAB8];
        long long v129 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v139.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v139.c = v129;
        long long v118 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        *(_OWORD *)&v139.tx = v118;
        [(PUImageTileViewController *)self _fullSizeImageSize];
        double v64 = v63;
        double v66 = v65;
        v142.origin.x = v55;
        v142.origin.y = v62;
        v142.size.double width = v59;
        v142.size.double height = v61;
        double v67 = CGRectGetWidth(v142) / v64;
        v143.origin.x = v55;
        v143.origin.y = v62;
        v143.size.double width = v59;
        v143.size.double height = v61;
        double v68 = CGRectGetHeight(v143) / v66;
        if (v67 > v68) {
          double v68 = v67;
        }
        *(_OWORD *)&v138.a = v127;
        *(_OWORD *)&v138.c = v129;
        *(_OWORD *)&v138.tx = v118;
        CGAffineTransformScale(&v139, &v138, v68, v68);
        [(PUImageTileViewController *)self _fullSizeImageOrientation];
        PLTransformForImageOrientation();
        CGAffineTransform t1 = v139;
        CGAffineTransformConcat(&v138, &t1, &t2);
        CGAffineTransform v139 = v138;
        v69 = [(PUTileViewController *)self view];
        v70 = [v69 window];
        v71 = [v70 screen];
        [v71 nativeScale];
        double v130 = v72;

        [(PUTileViewController *)self visibleRect];
        double v74 = v73;
        double v76 = v75;
        double v78 = v77;
        double v80 = v79;
        v81 = [(PUImageTileViewController *)self tiledLayerHostingView];
        v82 = [v81 layer];
        objc_msgSend(v6, "convertRect:fromLayer:", v82, v74, v76, v78, v80);
        CGFloat v117 = v84;
        CGFloat v119 = v83;
        CGFloat v115 = v85;
        CGFloat v116 = v86;

        v144.origin.x = v74;
        v144.origin.y = v76;
        v144.size.double width = v78;
        v144.size.double height = v80;
        double Width = CGRectGetWidth(v144);
        v145.origin.x = v55;
        v145.origin.y = v62;
        v145.size.double width = v121;
        v145.size.double height = v61;
        CGFloat v88 = CGRectGetWidth(v145);
        BOOL v89 = Width < v88;
        if (Width >= v88) {
          CGFloat v90 = v55;
        }
        else {
          CGFloat v90 = v74;
        }
        if (v89) {
          double v91 = v76;
        }
        else {
          double v91 = v62;
        }
        if (v89) {
          double v92 = v78;
        }
        else {
          double v92 = v121;
        }
        if (v89) {
          double v93 = v80;
        }
        else {
          double v93 = v61;
        }
        double v114 = v130 * CGRectGetWidth(*(CGRect *)&v90);
        v146.origin.x = v74;
        v146.origin.y = v76;
        v146.size.double width = v78;
        v146.size.double height = v80;
        double Height = CGRectGetHeight(v146);
        v147.origin.x = v55;
        v147.origin.y = v62;
        v147.size.double width = v121;
        v147.size.double height = v61;
        CGFloat v95 = CGRectGetHeight(v147);
        BOOL v96 = Height < v95;
        if (Height >= v95) {
          CGFloat v97 = v55;
        }
        else {
          CGFloat v97 = v74;
        }
        double v98 = v76;
        if (v96)
        {
          double v99 = v78;
        }
        else
        {
          double v98 = v62;
          double v99 = v121;
        }
        double v100 = v115;
        double v101 = v116;
        if (v96) {
          double v102 = v80;
        }
        else {
          double v102 = v61;
        }
        double v103 = v130 * CGRectGetHeight(*(CGRect *)&v97);
        if (v8) {
          double v104 = v114;
        }
        else {
          double v104 = v103;
        }
        if (v8) {
          double v105 = v103;
        }
        else {
          double v105 = v114;
        }
        double v106 = v117;
        v148.origin.x = v119;
        v148.origin.y = v117;
        v148.size.double width = v115;
        v148.size.double height = v116;
        double v107 = v104 / CGRectGetWidth(v148);
        v149.origin.x = v119;
        v149.origin.y = v117;
        v149.size.double width = v115;
        v149.size.double height = v116;
        double v108 = v105 / CGRectGetHeight(v149);
        if (v107 >= v108) {
          double v109 = v108;
        }
        else {
          double v109 = v107;
        }
        double v110 = v119;
        v111 = (void *)MEMORY[0x1E4F39BE8];
        v112 = [(PUTileViewController *)self view];
        v131[0] = MEMORY[0x1E4F143A8];
        v131[1] = 3221225472;
        v131[2] = __62__PUImageTileViewController__updateFullSizeTiledLayerIfNeeded__block_invoke_3;
        v131[3] = &unk_1E5F25AC8;
        id v6 = v6;
        id v132 = v6;
        CGFloat v133 = MidX;
        CGFloat v134 = MidY;
        CGAffineTransform v135 = v139;
        objc_msgSend(v111, "pu_animateAlongsideView:animations:", v112, v131);

        v150.origin.x = v119;
        v150.origin.y = v117;
        v150.size.double width = v115;
        v150.size.double height = v116;
        if (CGRectIsNull(v150))
        {
          double v110 = *MEMORY[0x1E4F1DB28];
          double v106 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
          double v100 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
          double v101 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        }
        objc_msgSend(v6, "setVisibleRectangle:zoomScale:", v110, v106, v100, v101, v109);
        BOOL v113 = 1;
        [(PUImageTileViewController *)self setIsDisplayingFullQualityImage:1];
        if ([(PUImageTileViewController *)self canUseFullSizeTiledLayer]) {
          BOOL v113 = [(PUTileController *)self isViewControllerTransitioning];
        }
        [v6 setHidden:v113];

        goto LABEL_76;
      }
    }
    else
    {
      id v6 = [(PUImageTileViewController *)self _fullSizeTiledLayer];
    }
    if (!v6)
    {
LABEL_77:

      return;
    }
    v27 = [(PUImageTileViewController *)self tiledLayerHostingView];
    [v27 removeFromSuperview];

    [(PUImageTileViewController *)self setTiledLayerHostingView:0];
    [(PUImageTileViewController *)self setTiledLayerAlphaAnimator:0];
    [v6 removeFromSuperlayer];
    [(PUImageTileViewController *)self _setFullSizeTiledLayer:0];
LABEL_76:

    goto LABEL_77;
  }
}

uint64_t __62__PUImageTileViewController__updateFullSizeTiledLayerIfNeeded__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "pu_setPosition:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)&v5.a = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)(a1 + 88);
  CATransform3DMakeAffineTransform(&v6, &v5);
  return objc_msgSend(v2, "pu_setTransform:", &v6);
}

uint64_t __62__PUImageTileViewController__updateFullSizeTiledLayerIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setValue:1.0];
}

uint64_t __62__PUImageTileViewController__updateFullSizeTiledLayerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:0.0];
}

- (void)_invalidateFullSizeTiledLayer
{
}

- (void)_updateFullSizeImageMetadataIfNeeded
{
  if ([(PUImageTileViewController *)self _needsUpdateFullSizeImageMetadata])
  {
    [(PUImageTileViewController *)self _setNeedsUpdateFullSizeImageMetadata:0];
    long long v10 = *MEMORY[0x1E4F1DB30];
    long long v3 = [(PUImageTileViewController *)self _fullSizeImageData];
    uint64_t v4 = [(PUImageTileViewController *)self _fullSizeImageURL];
    if (v4)
    {
      PLGetOrientationAndUntransformedSizeFromImageURL();
    }
    else if (v3)
    {
      PLGetOrientationAndUntransformedSizeFromImageData();
    }
    uint64_t v5 = PLImageOrientationFromExifOrientation();
    PLOrientationTransformImageSize();
    double v7 = v6;
    double v9 = v8;
    [(PUImageTileViewController *)self _setFullSizeImageOrientation:v5];
    [(PUImageTileViewController *)self _setFullSizeImageUntransformedSize:v10];
    -[PUImageTileViewController _setFullSizeImageSize:](self, "_setFullSizeImageSize:", v7, v9);
  }
}

- (void)_invalidateFullSizeImageMetadata
{
}

- (void)_updateAssetLoadingStage
{
  long long v3 = [(PUImageTileViewController *)self displayedImageRequestResult];
  id v6 = [v3 asset];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t v4 = [v6 cloudPlaceholderKind] - 2, v4 <= 5)) {
    uint64_t v5 = qword_1AEFF7ED0[v4];
  }
  else {
    uint64_t v5 = 0;
  }
  [(PUImageTileViewController *)self _setAssetLoadingStage:v5];
}

- (void)updateMutableImageLayerModulator:(id)a3
{
  id v6 = a3;
  unint64_t v4 = [(PUTileViewController *)self originalView];
  uint64_t v5 = [v4 layer];
  [v6 setLayer:v5];

  if ([(PUImageTileViewController *)self gainMapImageIsAvailable])
  {
    objc_msgSend(v6, "setGainMapImage:animated:", -[PUImageTileViewController gainMapImage](self, "gainMapImage"), 1);
    [(PUImageTileViewController *)self gainMapValue];
    objc_msgSend(v6, "setGainMapValue:");
  }
}

- (void)updateModulatorInputs
{
  long long v3 = [(PUImageTileViewController *)self imageLayerModulator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__PUImageTileViewController_updateModulatorInputs__block_invoke;
  v4[3] = &unk_1E5F2D330;
  v4[4] = self;
  [v3 performChanges:v4];
}

uint64_t __50__PUImageTileViewController_updateModulatorInputs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) updateMutableImageLayerModulator:a2];
}

- (void)_updateImageLayerModulatorInputIfNeeded
{
  if ([(PUImageTileViewController *)self _needsUpdateImageLayerModulatorInput])
  {
    [(PUImageTileViewController *)self _setNeedsUpdateImageLayerModulatorInput:0];
    if ([(PUTileViewController *)self isViewLoaded])
    {
      [(PUImageTileViewController *)self updateModulatorInputs];
    }
  }
}

- (void)_invalidateImageLayerModulatorInput
{
}

- (void)updateModulator
{
  long long v3 = [(PUTileController *)self tilingView];
  int v4 = [v3 shouldDisplayHDR];

  if (v4)
  {
    id v12 = [(PUImageTileViewController *)self imageModulationManager];
    uint64_t v5 = (void *)MEMORY[0x1E4F902A0];
    id v6 = [(PUImageTileViewController *)self asset];
    uint64_t v7 = [v5 optionsForAsset:v6];
    uint64_t v9 = v8;

    long long v10 = [(PUImageTileViewController *)self imageLayerModulator];
    [v12 checkInImageLayerModulator:v10];

    double v11 = objc_msgSend(v12, "checkoutImageLayerModulatorWithOptions:", v7, v9);
    [(PUImageTileViewController *)self setImageLayerModulator:v11];
  }
}

- (void)_updateImageLayerModulatorIfNeeded
{
  if ([(PUImageTileViewController *)self _needsUpdateImageLayerModulator])
  {
    [(PUImageTileViewController *)self _setNeedsUpdateImageLayerModulator:0];
    [(PUImageTileViewController *)self updateModulator];
  }
}

- (void)_invalidateImageLayerModulator
{
}

- (void)_updateModulatorManager
{
  id v2 = [(PUImageTileViewController *)self imageModulationManager];
  [v2 setNeedsEnabledUpdate];
}

- (void)_updateImageLayerModulatorManagerIfNeeded
{
  if ([(PUImageTileViewController *)self _needsUpdateImageLayerModulatorManager])
  {
    [(PUImageTileViewController *)self _setNeedsUpdateImageLayerModulatorManager:0];
    [(PUImageTileViewController *)self _updateModulatorManager];
  }
}

- (void)_invalidateImageLayerModulatorManager
{
}

- (void)_notifyFullQualityImageDisplayed
{
  if (self->_presentingDelegateFlags.respondsToFullQualityImageDisplayed)
  {
    id v3 = [(PUImageTileViewController *)self presentingDelegate];
    objc_msgSend(v3, "imageTileViewController:didDisplayFullQualityImageWithDeferredProcessingFinished:", self, -[PUImageTileViewController isDeferredProcessingFinished](self, "isDeferredProcessingFinished"));
  }
}

- (void)displayImageRequestResult:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLOneUpGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v4;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Displaying image requester result: %@", buf, 0xCu);
  }

  id v6 = [(PUImageTileViewController *)self displayedImageRequestResult];
  uint64_t v7 = [(PUImageTileViewController *)self _imageView];
  uint64_t v8 = [v4 image];
  [v7 setImage:v8];
  if (v8
    || ([(PUImageTileViewController *)self placeholderColor],
        long long v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v10))
  {
    uint64_t v9 = [MEMORY[0x1E4FB1618] clearColor];
  }
  else
  {
    uint64_t v9 = [(PUImageTileViewController *)self placeholderColor];
  }
  double v11 = (void *)v9;
  [v7 setBackgroundColor:v9];

  -[PUImageTileViewController setIsDisplayingFullQualityImage:](self, "setIsDisplayingFullQualityImage:", [v4 imageIsFullQuality]);
  -[PUImageTileViewController setGainMapImage:](self, "setGainMapImage:", [v4 gainMapImage]);
  [v4 gainMapValue];
  -[PUImageTileViewController setGainMapValue:](self, "setGainMapValue:");
  [(PUImageTileViewController *)self setDisplayedImageRequestResult:v4];
  id v12 = +[PUOneUpSettings sharedInstance];
  [v12 fullQualityCrossfadeDuration];
  double v14 = v13;

  if ([(PUImageTileViewController *)self shouldAnimateAppearanceOfResult:v4 overExistingResult:v6]&& v14 > 0.0)
  {
    uint64_t v15 = [v7 snapshotViewAfterScreenUpdates:0];
    [v7 bounds];
    objc_msgSend(v15, "setFrame:");
    [v15 setAutoresizingMask:18];
    [v7 addSubview:v15];
    double v16 = (void *)MEMORY[0x1E4FB1EB0];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __55__PUImageTileViewController_displayImageRequestResult___block_invoke;
    v23[3] = &unk_1E5F2ED10;
    id v24 = v15;
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    long long v20 = __55__PUImageTileViewController_displayImageRequestResult___block_invoke_2;
    long long v21 = &unk_1E5F2CEE8;
    id v22 = v24;
    id v17 = v24;
    [v16 animateWithDuration:2 delay:v23 options:&v18 animations:v14 completion:0.0];
  }
  [(PUImageTileViewController *)self _updateAssetLoadingStage];
  [(PUImageTileViewController *)self _configureImageViewPreferredImageDynamicRange];
  [(PUImageTileViewController *)self _invalidateImageLayerModulatorInput];
  [(PUImageTileViewController *)self _invalidateFullSizeTiledLayer];
  if (v8 && [v4 imageIsFullQuality])
  {
    [(PUImageTileViewController *)self _notifyDeferredProcessingDoneAndFinalImageDisplayedIfNeeded];
    [(PUImageTileViewController *)self _notifyFullQualityImageDisplayed];
  }
  [(PUImageTileViewController *)self _updateIfNeeded];
}

uint64_t __55__PUImageTileViewController_displayImageRequestResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __55__PUImageTileViewController_displayImageRequestResult___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (BOOL)shouldAnimateAppearanceOfResult:(id)a3 overExistingResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(PUTileController *)self isAnimating])
  {
    uint64_t v9 = [v7 asset];
    if (v9)
    {
      long long v10 = (void *)v9;
      double v11 = [v6 asset];
      id v12 = [v7 asset];
      id v13 = v11;
      id v14 = v12;
      if (v13 == v14)
      {
      }
      else
      {
        uint64_t v15 = [v13 isContentEqualTo:v14];
        if (!v15) {
          uint64_t v15 = [v14 isContentEqualTo:v13];
        }

        if (v15 != 2)
        {
          double v16 = [(PUImageTileViewController *)self browsingViewModel];
          int v17 = [v16 isScrubbing];

          if (!v17) {
            goto LABEL_16;
          }
          goto LABEL_12;
        }
      }
    }
LABEL_12:
    BOOL v18 = [(PUImageTileViewController *)self animatesImageTransitions];
    if ((!v7 || !v18)
      && (![(PUImageTileViewController *)self shouldAnimateToFullQualityResult]
       || ([v6 imageIsFullQuality] & 1) == 0))
    {
      goto LABEL_2;
    }
LABEL_16:
    BOOL v8 = 1;
    goto LABEL_17;
  }
LABEL_2:
  BOOL v8 = 0;
LABEL_17:

  return v8;
}

- (BOOL)shouldAdoptResult:(id)a3 overExistingResult:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    BOOL v8 = PLOneUpGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412290;
      id v38 = v6;
      double v16 = "Accepting new image requester result because existing result is nil.\n\t%@";
      goto LABEL_12;
    }
LABEL_13:
    BOOL v17 = 1;
LABEL_35:

    goto LABEL_36;
  }
  if ([(PUImageTileViewController *)self shouldRetainNonFinalImageUntilZoom]
    && [v6 imageIsFullQuality])
  {
    BOOL v8 = PLOneUpGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412290;
      id v38 = v6;
      uint64_t v9 = "Ignoring new image requester result because we are refraining from showing final image until we zoom in to di"
           "splay full image data.\n"
           "\t%@";
LABEL_33:
      _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v37, 0xCu);
      goto LABEL_34;
    }
    goto LABEL_34;
  }
  long long v10 = [v6 asset];
  id v11 = [v10 uuid];
  id v12 = [v7 asset];
  id v13 = [v12 uuid];
  if (v11 == v13)
  {
  }
  else
  {
    id v14 = v13;
    char v15 = [v11 isEqual:v13];

    if ((v15 & 1) == 0)
    {
      BOOL v8 = PLOneUpGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 138412290;
        id v38 = v6;
        double v16 = "Accepting new image requester result because uuid does not match existing result.\n\t%@";
LABEL_12:
        _os_log_impl(&dword_1AE9F8000, v8, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v37, 0xCu);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  BOOL v18 = [v6 asset];
  uint64_t v19 = [v7 asset];
  id v20 = v18;
  id v21 = v19;
  if (v20 == v21)
  {
  }
  else
  {
    id v22 = v21;
    uint64_t v23 = [v20 isContentEqualTo:v21];
    if (!v23) {
      uint64_t v23 = [v22 isContentEqualTo:v20];
    }

    if (v23 != 2) {
      goto LABEL_28;
    }
  }
  id v24 = [v6 image];
  [v24 size];
  double v25 = [v7 image];
  [v25 size];
  if (PFSizeLargerThanSize())
  {
  }
  else
  {
    char v26 = [v6 imageIsFullQuality];

    if ((v26 & 1) == 0)
    {
      BOOL v8 = PLOneUpGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v37 = 138412290;
        id v38 = v6;
        uint64_t v9 = "Ignoring new image requester result because its image is not larger than the existing one and it is not ful"
             "l quality.\n"
             "\t%@";
        goto LABEL_33;
      }
      goto LABEL_34;
    }
  }
  uint64_t v27 = [v6 image];
  v28 = [v7 image];
  if (v27 == v28
    && (uint64_t v29 = [v6 gainMapImage], v29 == objc_msgSend(v7, "gainMapImage"))
    && ([v6 gainMapValue], float v33 = v32, objc_msgSend(v7, "gainMapValue"), v33 == v34))
  {
    int v35 = [v6 imageIsFullQuality];
    int v36 = [v7 imageIsFullQuality];

    if (v35 == v36)
    {
      BOOL v8 = PLOneUpGetLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      int v37 = 138412290;
      id v38 = v6;
      uint64_t v9 = "Ignoring new image requester result because its image, gain map info, and full quality flag is equal to our c"
           "urrent one.\n"
           "\t%@";
      goto LABEL_33;
    }
  }
  else
  {
  }
  v30 = [v6 image];

  if (!v30)
  {
    BOOL v8 = PLOneUpGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v37 = 138412290;
      id v38 = v6;
      uint64_t v9 = "Ignoring new image requester result because its image is nil.\n\t%@";
      goto LABEL_33;
    }
LABEL_34:
    BOOL v17 = 0;
    goto LABEL_35;
  }
LABEL_28:
  BOOL v17 = 1;
LABEL_36:

  return v17;
}

- (void)imageRequesterDidUpdateFullSizeImageData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 fullSizeImageData];
  [(PUImageTileViewController *)self _setFullSizeImageData:v5];

  id v6 = [v4 fullSizeImageURL];

  [(PUImageTileViewController *)self _setFullSizeImageURL:v6];
  [(PUImageTileViewController *)self _updateIfNeeded];
}

- (void)imageRequester:(id)a3 didProduceResult:(id)a4
{
  id v7 = a4;
  uint64_t v5 = [(PUImageTileViewController *)self displayedImageRequestResult];
  BOOL v6 = [(PUImageTileViewController *)self shouldAdoptResult:v7 overExistingResult:v5];

  if (v6) {
    [(PUImageTileViewController *)self displayImageRequestResult:v7];
  }
}

- (BOOL)_assetNeedsHDR
{
  id v2 = [(PUImageTileViewController *)self asset];
  unsigned int v3 = [v2 mediaSubtypes];
  unint64_t v4 = ((unint64_t)[v2 mediaSubtypes] >> 23) & 1;
  uint64_t v5 = [MEMORY[0x1E4F902A8] sharedInstance];
  int v6 = [v5 toneMapEnabled];

  return v4 | v6 & (v3 >> 9);
}

- (BOOL)shouldAnimatePreferredDynamicRangeChanges
{
  unsigned int v3 = +[PUOneUpSettings sharedInstance];
  char v4 = [v3 enablePreferredImageDynamicRangeAnimation];

  return v4 & [(PUImageTileViewController *)self _assetNeedsHDR];
}

- (BOOL)shouldRequestHDR
{
  unsigned int v3 = [(PUTileController *)self tilingView];
  char v4 = [v3 shouldDisplayHDR];

  uint64_t v5 = +[PUOneUpSettings sharedInstance];
  char v6 = [v5 enableHDRImages];

  return [(PUImageTileViewController *)self _assetNeedsHDR] & v4 & v6;
}

- (void)_updateImageIfNeeded
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if ([(PUImageTileViewController *)self _needsUpdateImage])
  {
    [(PUImageTileViewController *)self _setNeedsUpdateImage:0];
    uint64_t v3 = [(PUImageTileViewController *)self animatesImageTransitions];
    [(PUImageTileViewController *)self setAnimatesImageTransitions:0];
    char v4 = [(PUImageTileViewController *)self assetViewModel];
    uint64_t v5 = [(PUImageTileViewController *)self asset];
    char v6 = [(PUImageTileViewController *)self mediaProvider];
    [(PUImageTileViewController *)self _targetSize];
    if (v5 && v6)
    {
      uint64_t v9 = v7;
      uint64_t v10 = v8;
      id v11 = [(PUImageTileViewController *)self _imageRequester];
      id v12 = [(PUImageTileViewController *)self _imageRequester];

      if (!v12)
      {
        id v13 = [[PUImageRequester alloc] initWithMediaProvider:v6 asset:v5 requiresFullQualityImage:[(PUImageTileViewController *)self requiresFullQualityImage]];

        [(PUImageTileViewController *)self _setImageRequester:v13];
        id v11 = v13;
      }
      id v14 = [v5 uniformTypeIdentifier];
      id v15 = 0;
      if ([(PUImageTileViewController *)self shouldUseFullSizeImageData] && v14)
      {
        float v34 = v14;
        int v35 = v11;
        int v36 = v6;
        int v37 = v4;
        double v16 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v14];
        [(id)objc_opt_class() _supportedZoomImageFormats];
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v18 = [v17 countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v47;
LABEL_10:
          uint64_t v21 = 0;
          while (1)
          {
            if (*(void *)v47 != v20) {
              objc_enumerationMutation(v17);
            }
            id v22 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v46 + 1) + 8 * v21)];
            char v23 = [v16 conformsToType:v22];

            if (v23) {
              break;
            }
            if (v19 == ++v21)
            {
              uint64_t v19 = [v17 countByEnumeratingWithState:&v46 objects:v50 count:16];
              if (v19) {
                goto LABEL_10;
              }
              goto LABEL_16;
            }
          }
          id v15 = v17;
          char v4 = v37;
          uint64_t v3 = v3;
          id v11 = v35;
          if (v17) {
            goto LABEL_21;
          }
        }
        else
        {
LABEL_16:

          char v4 = v37;
          uint64_t v3 = v3;
          id v11 = v35;
        }
        if ([v16 conformsToType:*MEMORY[0x1E4F44498]]) {
          id v15 = v17;
        }
        else {
          id v15 = 0;
        }
LABEL_21:

        char v6 = v36;
        id v14 = v34;
      }
      BOOL v24 = [(PUImageTileViewController *)self didRequestHDR];
      double v25 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v25 potentialEDRHeadroom];
      uint64_t v27 = v26;

      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __49__PUImageTileViewController__updateImageIfNeeded__block_invoke;
      v38[3] = &unk_1E5F25AA0;
      id v39 = v11;
      BOOL v45 = v24;
      uint64_t v42 = v27;
      uint64_t v43 = v9;
      uint64_t v44 = v10;
      id v40 = v4;
      id v41 = v15;
      id v28 = v15;
      id v29 = v11;
      [v29 performChanges:v38];
    }
    [(PUImageTileViewController *)self setAnimatesImageTransitions:v3];
    v30 = [(PUTileController *)self tilingView];
    double v31 = [v30 screenDynamicRangeMonitor];
    [v31 unregisterChangeObserver:self context:PXDisplayScreenDynamicRangeObservationContext];

    float v32 = [(PUTileController *)self tilingView];
    float v33 = [v32 screenDynamicRangeMonitor];
    [v33 registerChangeObserver:self context:PXDisplayScreenDynamicRangeObservationContext];
  }
}

uint64_t __49__PUImageTileViewController__updateImageIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRequestHDR:*(unsigned __int8 *)(a1 + 80)];
  [*(id *)(a1 + 32) setTargetHDRHeadroom:*(double *)(a1 + 56)];
  objc_msgSend(*(id *)(a1 + 32), "setTargetSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setUseLowMemoryMode:", objc_msgSend(*(id *)(a1 + 40), "lowMemoryMode"));
  [*(id *)(a1 + 32) setRequestFullSizeImageDataUTTypes:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) focusValue];
  BOOL v4 = fabs(v3) < 0.9;
  return [v2 setHighPriorityRequest:v4];
}

- (void)_invalidateImage
{
  double v3 = [(PUImageTileViewController *)self targetSizeUpdateRateLimiter];
  [v3 reset];

  [(PUImageTileViewController *)self _setImageRequester:0];
  [(PUImageTileViewController *)self _setFullSizeImageURL:0];
  [(PUImageTileViewController *)self _setFullSizeImageData:0];
  [(PUImageTileViewController *)self _setNeedsUpdateImage:1];
}

- (double)_screenScale
{
  double v3 = [(PUTileViewController *)self view];
  BOOL v4 = [v3 window];
  uint64_t v5 = [v4 screen];
  [v5 scale];
  double v7 = v6;

  if (v7 < 1.0)
  {
    uint64_t v8 = [(PUTileController *)self tilingView];
    uint64_t v9 = [v8 window];
    uint64_t v10 = [v9 screen];
    [v10 scale];
    double v7 = v11;
  }
  if (v7 < 1.0)
  {
    if (PUMainScreenScale_onceToken != -1) {
      dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
    }
    double v7 = *(double *)&PUMainScreenScale_screenScale;
  }
  return fmax(v7, 1.0);
}

- (void)_updateTargetSizeIfNeeded
{
  if ([(PUImageTileViewController *)self needsUpdateTargetSize])
  {
    [(PUImageTileViewController *)self setNeedsUpdateTargetSize:0];
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if ([(PUTileController *)self isActive])
    {
      [(PUImageTileViewController *)self _screenScale];
      double v6 = v5;
      double v7 = [(PUImageTileViewController *)self asset];
      [v7 aspectRatio];
      double v9 = v8;

      if (v9 > 0.0)
      {
        [(PUTileController *)self expectedPresentationSize];
        PFSizeWithAspectRatioFittingSize();
      }
      uint64_t v10 = [(PUTileViewController *)self view];
      [v10 bounds];
      PXSizeMax();
      double v12 = v11;
      double v14 = v13;

      -[PUImageTileViewController targetSizeForProposedTargetSize:](self, "targetSizeForProposedTargetSize:", v12 * v6, v14 * v6);
      double v16 = v15;
      double v18 = v17;
      PLPhysicalScreenSize();
      double v20 = v19 * v6;
      double v22 = v21 * v6;
      if (v20 <= v22) {
        double v20 = v22;
      }
      double v3 = fmin(v16, v20);
      double v4 = fmin(v18, v20);
    }
    -[PUImageTileViewController _setTargetSize:](self, "_setTargetSize:", v3, v4);
  }
}

- (void)_invalidateTargetSize
{
}

- (void)_updateDidRequestHDRIfNeeded
{
  if (![(PUImageTileViewController *)self _needsUpdateDidRequestHDR]) {
    return;
  }
  [(PUImageTileViewController *)self _setNeedsUpdateDidRequestHDR:0];
  int v3 = [(PUImageTileViewController *)self shouldRequestHDR];
  double v4 = [(PUTileController *)self tilingView];
  id v6 = [v4 screenDynamicRangeMonitor];

  if (!v3) {
    goto LABEL_5;
  }
  double v5 = v6;
  if (v6)
  {
    LOBYTE(v3) = [v6 screenSupportsHDR];
LABEL_5:
    double v5 = v6;
  }
  self->_didRequestHDR = v3;
}

- (void)_invalidateDidRequestHDR
{
}

- (void)_invalidate
{
  [(PUImageTileViewController *)self _invalidateImage];
  [(PUImageTileViewController *)self _invalidateImageLayerModulator];
  [(PUImageTileViewController *)self _cancelAllImageRequests];
  [(PUImageTileViewController *)self setDisplayedImageRequestResult:0];
  [(PUImageTileViewController *)self _setImageRequester:0];
  [(PUImageTileViewController *)self _setFullSizeImageData:0];
  [(PUImageTileViewController *)self _setFullSizeImageURL:0];
  [(PUImageTileViewController *)self setIsDisplayingFullQualityImage:0];
}

- (void)_updateIfNeeded
{
  if ([(PUImageTileViewController *)self _needsUpdate])
  {
    [(PUImageTileViewController *)self _updateTargetSizeIfNeeded];
    [(PUImageTileViewController *)self _updateDidRequestHDRIfNeeded];
    [(PUImageTileViewController *)self _updateImageIfNeeded];
    [(PUImageTileViewController *)self _updateImageLayerModulatorManagerIfNeeded];
    [(PUImageTileViewController *)self _updateImageLayerModulatorIfNeeded];
    [(PUImageTileViewController *)self _updateImageLayerModulatorInputIfNeeded];
    [(PUImageTileViewController *)self _updateFullSizeImageMetadataIfNeeded];
    [(PUImageTileViewController *)self _updateFullSizeTiledLayerIfNeeded];
    if ([(PUImageTileViewController *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x1E4F28B00] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PUImageTileViewController.m" lineNumber:679 description:@"updates still needed after an update cycle"];
    }
  }
}

- (BOOL)_needsUpdate
{
  if ([(PUImageTileViewController *)self needsUpdateTargetSize]
    || [(PUImageTileViewController *)self _needsUpdateDidRequestHDR]
    || [(PUImageTileViewController *)self _needsUpdateImage]
    || [(PUImageTileViewController *)self _needsUpdateImageLayerModulatorManager]|| [(PUImageTileViewController *)self _needsUpdateImageLayerModulator]|| [(PUImageTileViewController *)self _needsUpdateImageLayerModulatorInput]|| [(PUImageTileViewController *)self _needsUpdateFullSizeImageMetadata])
  {
    return 1;
  }
  return [(PUImageTileViewController *)self _needsUpdateFullSizeTiledLayer];
}

- (void)isViewControllerTransitioningDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewController;
  [(PUTileController *)&v3 isViewControllerTransitioningDidChange];
  [(PUImageTileViewController *)self _invalidateFullSizeTiledLayer];
  [(PUImageTileViewController *)self _updateIfNeeded];
}

- (void)setCanUseFullSizeTiledLayer:(BOOL)a3
{
  if (self->_canUseFullSizeTiledLayer != a3)
  {
    self->_canUseFullSizeTiledLayer = a3;
    [(PUImageTileViewController *)self _invalidateFullSizeTiledLayer];
  }
}

- (BOOL)shouldAvoidInPlaceSnapshottedFadeOut
{
  v8.receiver = self;
  v8.super_class = (Class)PUImageTileViewController;
  unsigned __int8 v3 = [(PUTileController *)&v8 shouldAvoidInPlaceSnapshottedFadeOut];
  id v4 = [(PUImageTileViewController *)self assetViewModel];
  double v5 = v4;
  if (v3 & 1) != 0 || ([v4 isUserTransformingTile])
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    [v5 contentOffset];
    int v6 = PXFloatEqualToFloatWithTolerance() ^ 1;
  }

  return v6;
}

- (void)_setAssetLoadingStage:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->__assetLoadingStage != a3)
  {
    self->__assetLoadingStage = a3;
    uint64_t v5 = [(PUImageTileViewController *)self _assetLoadingStartDate];
    int v6 = (void *)v5;
    if (a3 == 2)
    {
      if (!v5)
      {
LABEL_15:
        -[PUImageTileViewController _setAssetLoadingStartDate:](self, "_setAssetLoadingStartDate:", v6, *(_OWORD *)v18);

        return;
      }
      double v7 = [(PUImageTileViewController *)self asset];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v9 = [(PUImageTileViewController *)self asset];
        [v6 timeIntervalSinceNow];
        double v11 = v10;
        int v12 = [v9 isCloudSharedAsset];
        double v13 = PLOneUpGetLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v14 = [(PUImageTileViewController *)self asset];
          double v15 = (void *)v14;
          double v16 = @"NO";
          *(_DWORD *)double v18 = 134218498;
          *(double *)&v18[4] = -v11;
          *(_WORD *)&v18[12] = 2112;
          if (v12) {
            double v16 = @"YES";
          }
          *(void *)&v18[14] = v14;
          __int16 v19 = 2112;
          double v20 = v16;
          _os_log_impl(&dword_1AE9F8000, v13, OS_LOG_TYPE_DEBUG, "load time = %0.3f s for asset: %@ isCloudShared:%@", v18, 0x20u);
        }
      }
    }
    else
    {
      if (a3 == 1)
      {
        uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];

        int v6 = (void *)v17;
        goto LABEL_15;
      }
      if (a3) {
        goto LABEL_15;
      }
    }

    int v6 = 0;
    goto LABEL_15;
  }
}

- (void)_handleShouldReloadAssetMediaNotification:(id)a3
{
  id v4 = a3;
  id v10 = [(PUImageTileViewController *)self asset];
  uint64_t v5 = [v4 object];

  if ([v5 conformsToProtocol:&unk_1F07DC470])
  {
    id v6 = v5;
    double v7 = [v10 uuid];
    objc_super v8 = [v6 uuid];
    int v9 = [v7 isEqualToString:v8];

    if (v9)
    {
      [(PUImageTileViewController *)self setRequiresFullQualityImage:0];
      [(PUImageTileViewController *)self _cancelAllImageRequests];
      [(PUImageTileViewController *)self _invalidateImage];
      [(PUImageTileViewController *)self _invalidateImageLayerModulator];
      [(PUImageTileViewController *)self _updateIfNeeded];
    }
  }
}

- (void)_setFullSizeImageURL:(id)a3
{
  objc_super v8 = (NSURL *)a3;
  uint64_t v5 = self->__fullSizeImageURL;
  if (v5 == v8)
  {
  }
  else
  {
    id v6 = v5;
    char v7 = [(NSURL *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->__fullSizeImageURL, a3);
      [(PUImageTileViewController *)self _invalidateFullSizeTiledLayer];
      [(PUImageTileViewController *)self _invalidateFullSizeImageMetadata];
    }
  }
}

- (void)_setFullSizeImageData:(id)a3
{
  uint64_t v5 = (NSData *)a3;
  if (self->__fullSizeImageData != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->__fullSizeImageData, a3);
    [(PUImageTileViewController *)self _invalidateFullSizeTiledLayer];
    [(PUImageTileViewController *)self _invalidateFullSizeImageMetadata];
    uint64_t v5 = v6;
  }
}

- (void)setPreloadedImage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUImageTileViewController *)self _imageRequester];
  id v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__PUImageTileViewController_setPreloadedImage___block_invoke;
      v9[3] = &unk_1E5F2ECC8;
      id v10 = v5;
      id v11 = v4;
      [v10 performChanges:v9];
    }
  }
  else
  {
    char v7 = [(PUImageTileViewController *)self image];

    if (!v7)
    {
      objc_super v8 = [[_PreloadedImageResult alloc] initWithPreloadedImage:v4];
      [(PUImageTileViewController *)self displayImageRequestResult:v8];
    }
  }
}

uint64_t __47__PUImageTileViewController_setPreloadedImage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handlePreloadedImage:*(void *)(a1 + 40)];
}

- (void)setGainMapValue:(float)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_gainMapValue = a3;
    [(PUImageTileViewController *)self _invalidateImageLayerModulatorInput];
  }
}

- (void)setGainMapImage:(CGImage *)a3
{
  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = a3;
    CGImageRetain(a3);
    [(PUImageTileViewController *)self _invalidateImageLayerModulatorInput];
  }
}

- (BOOL)gainMapImageIsAvailable
{
  unsigned __int8 v3 = [(PUImageTileViewController *)self asset];
  id v4 = [(PUImageTileViewController *)self displayedImageRequestResult];
  char v5 = [v4 imageIsFullQuality];

  if (objc_opt_respondsToSelector()) {
    int v6 = [v3 needsDeferredProcessing];
  }
  else {
    int v6 = 0;
  }
  char v7 = [(PUImageTileViewController *)self displayedImageRequestResult];
  uint64_t v8 = [v7 gainMapImage];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  char v10 = !v9;
  if (v5) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v10;
  }

  return v11;
}

- (UIImage)image
{
  id v2 = [(PUImageTileViewController *)self displayedImageRequestResult];
  unsigned __int8 v3 = [v2 image];

  return (UIImage *)v3;
}

- (BOOL)isDeferredProcessingFinished
{
  id v2 = [(PUImageTileViewController *)self asset];
  if (objc_opt_respondsToSelector()) {
    int v3 = [v2 needsDeferredProcessing] ^ 1;
  }
  else {
    LOBYTE(v3) = 0;
  }

  return v3;
}

- (void)_notifyDeferredProcessingDoneAndFinalImageDisplayedIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v3 = [(PUImageTileViewController *)self assetViewModel];
  if ((objc_msgSend(v3, "PPT_isDeferredProcessingDoneAndFinalImageDisplayed") & 1) == 0
    && self->_presentingDelegateFlags.respondsToPPTShouldSignalDeferredProcessingDoneAndFinalImageDisplayed)
  {
    if ([(PUImageTileViewController *)self isDeferredProcessingFinished])
    {
      id v4 = [(PUImageTileViewController *)self presentingDelegate];
      int v5 = objc_msgSend(v4, "ppt_imageTileViewControllerShouldSignalDeferredProcessingDoneAndFinalImageDisplayed:", self);

      if (v5)
      {
        int v6 = PLOneUpGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          char v7 = [(PUImageTileViewController *)self image];
          [v7 size];
          uint64_t v8 = NSStringFromCGSize(v18);
          BOOL v9 = [(PUImageTileViewController *)self asset];
          char v10 = [v9 uuid];
          *(_DWORD *)buf = 138412546;
          uint64_t v14 = v8;
          __int16 v15 = 2112;
          double v16 = v10;
          _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEBUG, "Deferred Processing: DP processed image loaded/displayed, %@, uuid: %@", buf, 0x16u);
        }
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        void v11[2] = __88__PUImageTileViewController__notifyDeferredProcessingDoneAndFinalImageDisplayedIfNeeded__block_invoke;
        v11[3] = &unk_1E5F2ED10;
        id v12 = v3;
        [v12 performChanges:v11];
      }
    }
  }
}

uint64_t __88__PUImageTileViewController__notifyDeferredProcessingDoneAndFinalImageDisplayedIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPPT_isDeferredProcessingDoneAndFinalImageDisplayed:", 1);
}

- (void)_updateImageRequesterTargetSize
{
  int v3 = [(PUImageTileViewController *)self _imageRequester];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __60__PUImageTileViewController__updateImageRequesterTargetSize__block_invoke;
  v5[3] = &unk_1E5F2ECC8;
  id v6 = v3;
  char v7 = self;
  id v4 = v3;
  [v4 performChanges:v5];
}

uint64_t __60__PUImageTileViewController__updateImageRequesterTargetSize__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) _targetSize];
  id v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setTargetSize:");
}

- (void)_setTargetSize:(CGSize)a3
{
  if (a3.width != self->__targetSize.width || a3.height != self->__targetSize.height)
  {
    self->__targetSize = a3;
    id v4 = [(PUImageTileViewController *)self targetSizeUpdateRateLimiter];
    [v4 inputEvent];
  }
}

- (void)setEdgeAntialiasingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUImageTileViewController *)self _imageView];
  id v4 = [v5 layer];
  [v4 setAllowsEdgeAntialiasing:v3];
}

- (void)didChangeVisibleRect
{
  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewController;
  [(PUTileViewController *)&v3 didChangeVisibleRect];
  [(PUImageTileViewController *)self _invalidateFullSizeTiledLayer];
  [(PUImageTileViewController *)self _updateIfNeeded];
}

- (BOOL)wantsVisibleRectChanges
{
  v6.receiver = self;
  v6.super_class = (Class)PUImageTileViewController;
  if ([(PUTileViewController *)&v6 wantsVisibleRectChanges]) {
    return 1;
  }
  id v4 = [(PUImageTileViewController *)self _fullSizeTiledLayer];
  BOOL v3 = v4 != 0;

  return v3;
}

- (void)setPlaceholderColor:(id)a3
{
  uint64_t v8 = (UIColor *)a3;
  id v5 = self->_placeholderColor;
  if (v5 == v8)
  {
  }
  else
  {
    objc_super v6 = v5;
    char v7 = [(UIColor *)v5 isEqual:v8];

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_placeholderColor, a3);
      [(PUImageTileViewController *)self _updateImageViewBackgroundColor];
    }
  }
}

- (void)_updateImageRequesterFullSizeImageDataProperties
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PUImageTileViewController *)self asset];
  id v4 = [v3 uniformTypeIdentifier];

  id v5 = 0;
  if ([(PUImageTileViewController *)self shouldUseFullSizeImageData] && v4)
  {
    objc_super v6 = [MEMORY[0x1E4F442D8] typeWithIdentifier:v4];
    [(id)objc_opt_class() _supportedZoomImageFormats];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
LABEL_5:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [MEMORY[0x1E4F442D8] typeWithIdentifier:*(void *)(*((void *)&v18 + 1) + 8 * v11)];
        char v13 = [v6 conformsToType:v12];

        if (v13) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
          if (v9) {
            goto LABEL_5;
          }
          goto LABEL_11;
        }
      }
      id v5 = v7;
      if (v7) {
        goto LABEL_16;
      }
    }
    else
    {
LABEL_11:
    }
    if ([v6 conformsToType:*MEMORY[0x1E4F44498]]) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
LABEL_16:
  }
  uint64_t v14 = [(PUImageTileViewController *)self _imageRequester];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__PUImageTileViewController__updateImageRequesterFullSizeImageDataProperties__block_invoke;
  v16[3] = &unk_1E5F2ECC8;
  v16[4] = self;
  id v17 = v5;
  id v15 = v5;
  [v14 performChanges:v16];
}

void __77__PUImageTileViewController__updateImageRequesterFullSizeImageDataProperties__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _imageRequester];
  [v2 setRequestFullSizeImageDataUTTypes:*(void *)(a1 + 40)];
}

- (void)setShouldUseFullSizeImageData:(BOOL)a3
{
  if (self->_shouldUseFullSizeImageData != a3)
  {
    self->_shouldUseFullSizeImageData = a3;
    if ([(PUImageTileViewController *)self shouldUseFullSizeImageData]) {
      double v4 = 1.0;
    }
    else {
      double v4 = 0.2;
    }
    id v5 = [(PUImageTileViewController *)self targetSizeUpdateRateLimiter];
    [v5 setInterval:v4];

    [(PUImageTileViewController *)self _updateImageRequesterFullSizeImageDataProperties];
  }
}

- (void)setImageLayerModulator:(id)a3
{
  id v5 = (PXImageLayerModulator *)a3;
  if (self->_imageLayerModulator != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_imageLayerModulator, a3);
    [(PUImageTileViewController *)self _invalidateImageLayerModulatorInput];
    id v5 = v6;
  }
}

- (void)setImageModulationManager:(id)a3
{
  id v5 = (PXImageModulationManager *)a3;
  if (self->_imageModulationManager != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_imageModulationManager, a3);
    [(PUImageTileViewController *)self _invalidateImageLayerModulator];
    id v5 = v6;
  }
}

- (void)_setImageRequester:(id)a3
{
  id v5 = (PUImageRequester *)a3;
  p_imageRequester = &self->__imageRequester;
  imageRequester = self->__imageRequester;
  if (imageRequester != v5)
  {
    uint64_t v8 = v5;
    [(PUImageRequester *)imageRequester unregisterObserver:self];
    [(PUImageRequester *)*p_imageRequester cancelAllImageRequests];
    objc_storeStrong((id *)&self->__imageRequester, a3);
    [(PUImageRequester *)*p_imageRequester registerObserver:self];
    id v5 = v8;
  }
}

- (void)setMediaProvider:(id)a3
{
  id v5 = (PUMediaProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    [(PUImageTileViewController *)self _invalidate];
    id v5 = v6;
  }
}

- (void)setShouldAnimateToFullQualityResult:(BOOL)a3
{
  if (self->_shouldAnimateToFullQualityResult != a3)
  {
    self->_shouldAnimateToFullQualityResult = a3;
    id v4 = +[PUOneUpSettings sharedInstance];
    -[PUImageTileViewController setShouldRetainNonFinalImageUntilZoom:](self, "setShouldRetainNonFinalImageUntilZoom:", [v4 retainProxyUntilZoom]);
  }
}

- (void)_setAssetWithoutUpdateIfNeeded:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = (PUDisplayAsset *)a3;
  p_asset = (id *)&self->_asset;
  asset = self->_asset;
  if (asset == v5) {
    goto LABEL_38;
  }
  uint64_t v8 = asset;
  objc_storeStrong((id *)&self->_asset, a3);
  [(PUImageTileViewController *)self _invalidateDidRequestHDR];
  uint64_t v9 = +[PUOneUpSettings sharedInstance];
  uint64_t v10 = [v9 fullQualityCrossfadeBehavior];

  if (*p_asset)
  {
    uint64_t v11 = [(PUDisplayAsset *)v5 uuid];
    id v12 = [(PUDisplayAsset *)v8 uuid];
    int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      if (v10 == 1
        || (objc_opt_respondsToSelector() & 1) != 0
        && [(PUDisplayAsset *)v5 needsDeferredProcessing]
        && v10 == 2)
      {
        [(PUImageTileViewController *)self setShouldAnimateToFullQualityResult:1];
      }
      uint64_t v14 = v8;
      id v15 = v5;
      if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
      {
        uint64_t v16 = [(PUDisplayAsset *)v14 contentChangeFromDisplayAsset:v15];
        LOBYTE(v17) = v16;
        if (!v16) {
          uint64_t v17 = [(PUDisplayAsset *)v15 contentChangeFromDisplayAsset:v14];
        }

        if ((v17 & 0x10) != 0) {
          [(PUImageTileViewController *)self setShouldAnimateToFullQualityResult:0];
        }
      }
      else
      {
      }
    }
  }
  else
  {
    [(PUImageTileViewController *)self setShouldAnimateToFullQualityResult:0];
    [(PUImageTileViewController *)self _invalidate];
  }
  if (v5
    && v8
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && [(PUDisplayAsset *)v8 isPhotoIrisPlaceholder])
  {
    [(PUImageTileViewController *)self _invalidateImage];
  }
  else
  {
    long long v18 = (PUDisplayAsset *)*p_asset;
    long long v19 = v8;
    if (v18 == v19)
    {
      uint64_t v20 = 0;
    }
    else if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      uint64_t v20 = [(PUDisplayAsset *)v18 contentChangeFromDisplayAsset:v19];
      if (!v20) {
        uint64_t v20 = [(PUDisplayAsset *)v19 contentChangeFromDisplayAsset:v18];
      }
    }
    else
    {
      uint64_t v20 = 1;
    }

    if ((v20 & 4) != 0) {
      uint64_t v21 = v20 ^ 0x20;
    }
    else {
      uint64_t v21 = v20;
    }
    if ((v21 & 0xFFFFFFFFFFFFFFF1) == 0) {
      goto LABEL_35;
    }
    [(PUImageTileViewController *)self _invalidateImage];
    if ((v21 & 2) != 0) {
      goto LABEL_35;
    }
  }
  [(PUImageTileViewController *)self _invalidateImageLayerModulator];
LABEL_35:
  double v22 = PLOneUpGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v23 = [(PUDisplayAsset *)v5 modificationDate];
    int v24 = 138413570;
    double v25 = self;
    __int16 v26 = 2048;
    uint64_t v27 = v8;
    __int16 v28 = 2112;
    id v29 = v5;
    __int16 v30 = 2112;
    double v31 = v23;
    __int16 v32 = 1024;
    int v33 = [(PUDisplayAsset *)v5 canPlayPhotoIris];
    __int16 v34 = 1024;
    int v35 = [(PUDisplayAsset *)v5 isPhotoIrisPlaceholder];
    _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_DEBUG, "%@ setAsset:%p -> %@ modificationDate:%@ canPlayIris:%d isPhotoIrisPlaceholder:%d", (uint8_t *)&v24, 0x36u);
  }
  [(PUImageTileViewController *)self _updateAssetLoadingStage];
  [(PUImageTileViewController *)self assetDidChange];

LABEL_38:
}

- (void)setAsset:(id)a3
{
  if (self->_asset != a3)
  {
    [(PUImageTileViewController *)self _setAssetWithoutUpdateIfNeeded:"_setAssetWithoutUpdateIfNeeded:"];
    [(PUImageTileViewController *)self _updateImageRequesterFullSizeImageDataProperties];
    [(PUImageTileViewController *)self _updateIfNeeded];
  }
}

- (void)setAssetViewModel:(id)a3
{
  id v5 = (PUAssetViewModel *)a3;
  assetViewModel = self->_assetViewModel;
  uint64_t v9 = v5;
  if (assetViewModel != v5)
  {
    id v7 = assetViewModel;
    [(PUAssetViewModel *)v7 unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_assetViewModel, a3);
    [(PUAssetViewModel *)self->_assetViewModel registerChangeObserver:self];
    [(PUImageTileViewController *)self assetViewModelDidChange:v7];
    uint64_t v8 = [(PUAssetViewModel *)v9 asset];

    [(PUImageTileViewController *)self setAsset:v8];
  }
}

- (void)setBrowsingViewModel:(id)a3
{
  id v5 = (PUBrowsingViewModel *)a3;
  browsingViewModel = self->_browsingViewModel;
  if (browsingViewModel != v5)
  {
    id v7 = v5;
    [(PUBrowsingViewModel *)browsingViewModel unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_browsingViewModel, a3);
    [(PUBrowsingViewModel *)self->_browsingViewModel registerChangeObserver:self];
    id v5 = v7;
  }
}

- (void)applyLayoutInfo:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PUImageTileViewController;
  id v4 = a3;
  [(PUTileViewController *)&v20 applyLayoutInfo:v4];
  objc_msgSend(v4, "contentsRect", v20.receiver, v20.super_class);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.double width = v10;
  v21.size.double height = v12;
  BOOL IsEmpty = CGRectIsEmpty(v21);
  uint64_t v14 = (CGRect *)MEMORY[0x1E4F91340];
  if (IsEmpty)
  {
    double v6 = *MEMORY[0x1E4F91340];
    double v8 = *(double *)(MEMORY[0x1E4F91340] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F91340] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F91340] + 24);
  }
  id v15 = [(PUImageTileViewController *)self _imageView];
  uint64_t v16 = [v15 layer];
  [v16 contentsRect];
  char v17 = PXRectApproximatelyEqualToRect();

  if ((v17 & 1) == 0)
  {
    long long v18 = [(PUImageTileViewController *)self _imageView];
    long long v19 = [v18 layer];
    objc_msgSend(v19, "setContentsRect:", v6, v8, v10, v12);
  }
  [(PUImageTileViewController *)self _invalidateTargetSize];
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.double width = v10;
  v22.size.double height = v12;
  [(PUImageTileViewController *)self setCanUseFullSizeTiledLayer:CGRectEqualToRect(v22, *v14)];
  [(PUImageTileViewController *)self _invalidateFullSizeTiledLayer];
  [(PUImageTileViewController *)self _updateIfNeeded];
}

- (void)becomeReusable
{
  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewController;
  [(PUTileViewController *)&v3 becomeReusable];
  [(PUImageTileViewController *)self setAssetViewModel:0];
  [(PUImageTileViewController *)self setAsset:0];
  [(PUImageTileViewController *)self setShouldUseFullSizeImageData:0];
  [(PUImageTileViewController *)self setMediaProvider:0];
  -[PUImageTileViewController _setTargetSize:](self, "_setTargetSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  [(PUImageTileViewController *)self displayImageRequestResult:0];
  [(PUImageTileViewController *)self _invalidateFullSizeTiledLayer];
  [(PUImageTileViewController *)self _updateFullSizeTiledLayerIfNeeded];
  [(PUImageTileViewController *)self _updateIfNeeded];
}

- (void)_configureImageViewPreferredImageDynamicRange
{
  objc_super v3 = [(PUTileController *)self tilingView];
  int v4 = [v3 shouldDisplayHDR];

  if (v4)
  {
    double v5 = [(PUImageTileViewController *)self browsingViewModel];

    if (v5)
    {
      double v6 = [(PUImageTileViewController *)self browsingViewModel];
      int v7 = [v6 isPresentedForPreview];

      if (v7) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = 2;
      }
    }
    else
    {
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([(PUImageTileViewController *)self shouldRequestHDR]
    && [(PUImageTileViewController *)self shouldAnimatePreferredDynamicRangeChanges])
  {
    double v9 = [(PUTileController *)self tilingView];

    if (!v9)
    {
      double v10 = PXAssertGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_FAULT, "Tiling view should not be nil", buf, 2u);
      }
    }
    double v11 = +[PUOneUpSettings sharedInstance];
    [v11 preferredImageDynamicRangeAnimationDuration];
    double v13 = v12;

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __74__PUImageTileViewController__configureImageViewPreferredImageDynamicRange__block_invoke;
    v15[3] = &unk_1E5F2E0A8;
    v15[4] = self;
    v15[5] = v8;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v15 options:0 animations:v13 completion:0.0];
  }
  else
  {
    id v14 = [(PUImageTileViewController *)self _imageView];
    [v14 setPreferredImageDynamicRange:v8];
  }
}

void __74__PUImageTileViewController__configureImageViewPreferredImageDynamicRange__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _imageView];
  [v2 setPreferredImageDynamicRange:v1];
}

- (id)loadView
{
  objc_super v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
  imageView = self->__imageView;
  self->__imageView = v3;

  [(UIImageView *)self->__imageView setContentMode:2];
  [(UIImageView *)self->__imageView setClipsToBounds:1];
  [(UIImageView *)self->__imageView setUserInteractionEnabled:0];
  double v5 = [(UIImageView *)self->__imageView layer];
  [v5 setAllowsGroupOpacity:0];

  double v6 = [(UIImageView *)self->__imageView layer];
  [v6 setAllowsGroupBlending:0];

  [(UIImageView *)self->__imageView setPreferredImageDynamicRange:0];
  int v7 = +[PUOneUpSettings sharedInstance];
  int v8 = [v7 useDebuggingColors];

  if (v8)
  {
    double v9 = [(UIImageView *)self->__imageView layer];
    id v10 = [MEMORY[0x1E4FB1618] redColor];
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    [v9 setBorderWidth:2.0];
  }
  [(PUImageTileViewController *)self _invalidateImage];
  [(PUImageTileViewController *)self _invalidateImageLayerModulatorManager];
  [(PUImageTileViewController *)self _invalidateImageLayerModulator];
  [(PUImageTileViewController *)self _invalidateImageLayerModulatorInput];
  double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel__handleShouldReloadAssetMediaNotification_ name:@"PUShouldReloadAssetMediaNotification" object:0];

  double v12 = self->__imageView;
  return v12;
}

- (void)expectedPresentationSizeDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PUImageTileViewController;
  [(PUTileController *)&v3 expectedPresentationSizeDidChange];
  [(PUImageTileViewController *)self _invalidateTargetSize];
  [(PUImageTileViewController *)self _updateIfNeeded];
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  [(PUImageTileViewController *)self _cancelAllImageRequests];
  v4.receiver = self;
  v4.super_class = (Class)PUImageTileViewController;
  [(PUTileViewController *)&v4 dealloc];
}

- (void)outputEventSignaledForCoalescer:(id)a3
{
  id v4 = a3;
  id v5 = [(PUImageTileViewController *)self targetSizeUpdateRateLimiter];

  if (v5 == v4)
  {
    [(PUImageTileViewController *)self _updateImageRequesterTargetSize];
  }
}

- (PUImageTileViewController)initWithReuseIdentifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUImageTileViewController;
  objc_super v3 = [(PUTileController *)&v7 initWithReuseIdentifier:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F91248] rateLimitingCoalescerWithRate:0.2];
    targetSizeUpdateRateLimiter = v3->_targetSizeUpdateRateLimiter;
    v3->_targetSizeUpdateRateLimiter = (PXEventCoalescer *)v4;

    [(PXEventCoalescer *)v3->_targetSizeUpdateRateLimiter registerObserver:v3];
  }
  return v3;
}

+ (id)_supportedZoomImageFormats
{
  if (_supportedZoomImageFormats_onceToken != -1) {
    dispatch_once(&_supportedZoomImageFormats_onceToken, &__block_literal_global_30993);
  }
  id v2 = (void *)_supportedZoomImageFormats_supportedZoomImageFormats;
  return v2;
}

void __55__PUImageTileViewController__supportedZoomImageFormats__block_invoke()
{
  id v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:6];
  v0 = [(id)*MEMORY[0x1E4F44410] identifier];
  [v5 addObject:v0];

  uint64_t v1 = +[PUOneUpSettings sharedInstance];
  int v2 = [v1 enableFigPhotoTiledLayer];

  if (v2) {
    [v5 addObjectsFromArray:&unk_1F078ADA8];
  }
  uint64_t v3 = [v5 copy];
  uint64_t v4 = (void *)_supportedZoomImageFormats_supportedZoomImageFormats;
  _supportedZoomImageFormats_supportedZoomImageFormats = v3;
}

@end