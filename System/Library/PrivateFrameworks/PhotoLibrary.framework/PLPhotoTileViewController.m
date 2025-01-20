@interface PLPhotoTileViewController
+ (BOOL)_shouldForwardViewWillTransitionToSize;
+ (BOOL)shouldShowPlaceholderForAsset:(id)a3;
+ (CGSize)tileSize;
+ (CGSize)tvOutTileSize;
+ (id)newPhotoTileViewControllerWithFrame:(CGRect)a3 image:(id)a4 allowZoomToFill:(BOOL)a5 mode:(int)a6;
+ (id)newPhotoTileViewControllerWithFrame:(CGRect)a3 imageRef:(CGImage *)a4 imageOrientation:(int64_t)a5 allowZoomToFill:(BOOL)a6 mode:(int)a7;
+ (id)newPhotoTileViewControllerWithFrame:(CGRect)a3 modelPhoto:(id)a4 mode:(int)a5;
- (BOOL)_canShowWhileLocked;
- (BOOL)_clientIsWallpaper;
- (BOOL)allowsEditing;
- (BOOL)centerContentVertically;
- (BOOL)force1XCroppedImage;
- (BOOL)forceNativeScreenScale;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gesturesEnabled;
- (BOOL)hasFullSizeImage;
- (BOOL)isTVOut;
- (BOOL)isZoomedOut;
- (BOOL)photoShouldHaveAvalancheBadge;
- (BOOL)photoShouldHaveHDRBadge;
- (BOOL)picked;
- (BOOL)reviewing;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldHideProgressIndicator;
- (BOOL)shouldSupressViewWillTransitionToSize;
- (BOOL)tileIsOnScreen;
- (BOOL)userDidAdjustWallpaper;
- (BOOL)wantsCompactLayout;
- (CGRect)tileFrame;
- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5;
- (NSNumber)maxZoomScaleOverride;
- (NSString)description;
- (PHAsset)photo;
- (PLPhotoTileViewController)init;
- (PLPhotoTileViewController)initWithModelPhoto:(id)a3 image:(id)a4 frame:(CGRect)a5 isThumbnail:(BOOL)a6 imageOrientation:(int)a7 allowZoomToFill:(BOOL)a8 mode:(int)a9;
- (PLPhotoTileViewController)initWithModelPhoto:(id)a3 thumbnailImage:(id)a4 size:(CGSize)a5;
- (UIEdgeInsets)overlayInsets;
- (UIImage)thumbnailImage;
- (UIImage)unscaledImage;
- (UIView)_customCenterOverlay;
- (double)currentToDefaultZoomRatio;
- (double)currentToMinZoomRatio;
- (double)defaultZoomScale;
- (double)minRotatedScale;
- (double)minZoomScale;
- (double)zoomToFillScale;
- (double)zoomToFitScale;
- (float)_calculateZoomScale:(BOOL)a3 inView:(id)a4;
- (id)_newCGImageBackedUIImageFromImage:(id)a3;
- (id)_newImageForAsset:(id)a3 targetSize:(CGSize)a4 cropRect:(CGRect)a5 fullSize:(CGSize)a6;
- (id)_newOriginalImageForPickerFromCachedData;
- (id)cachingImageManager;
- (id)dictionaryWithCroppedImageForRect:(CGRect)a3 minimalCropDimension:(double)a4 withOptions:(int)a5;
- (id)expandableImageView;
- (id)image;
- (id)imageView;
- (id)initForPageController;
- (id)newImageWithCropRect:(CGRect)a3 minimalCropDimension:(double)a4 croppedImageData:(id *)a5 fullScreenImageData:(id *)a6 imageCropRect:(CGRect *)a7 intersectCropWithFullRect:(BOOL)a8;
- (id)scrollView;
- (id)tileDelegate;
- (id)videoView;
- (id)viewForZoomingInScrollView:(id)a3;
- (int)imageOrientation;
- (int)inflightFullSizeImageRequestID;
- (int64_t)_imageOrientation;
- (void)_adjustScrollViewContentOffsetForInsets;
- (void)_adjustZoomForEnteringMode:(BOOL)a3;
- (void)_centerImageInScrollView;
- (void)_configureViews;
- (void)_getFullScreenImageData:(id *)a3 forImage:(id)a4 fullSize:(CGSize)a5 imageView:(id)a6 screenScaleTransform:(CGAffineTransform *)a7;
- (void)_handleDoubleTap:(id)a3;
- (void)_handleFullSizeImageRequestResult:(id)a3 dataUTI:(id)a4 orientation:(int64_t)a5;
- (void)_handleSingleTap:(id)a3;
- (void)_installSubview:(id)a3;
- (void)_performDidEndZoomBlock;
- (void)_performRotationUpdatesWithDuration:(double)a3 size:(CGSize)a4;
- (void)_removePlaceholderView;
- (void)_requestFullSizeImage;
- (void)_resetZoomCommon;
- (void)_setCustomCenterOverlay:(id)a3;
- (void)_setDefaultZoomScale;
- (void)_setDidEndZoomingBlock:(id)a3;
- (void)_setImage:(id)a3 isThumbnail:(BOOL)a4 preserveFrame:(BOOL)a5;
- (void)_setPhoto:(id)a3;
- (void)_setupReviewCheckmark;
- (void)_teardownDispatchTimer;
- (void)_updateContentInset;
- (void)_updateModelPhotoWithImage:(id)a3;
- (void)_updatePlaceholderImageRect;
- (void)_updatePlaceholderViewAnimated:(BOOL)a3;
- (void)_updatePlaceholderVisibility;
- (void)_updateReviewCheckmark;
- (void)_updateSubviewOrdering;
- (void)_updateVideoViewForModelPhoto;
- (void)_viewWillMoveToSuperView:(id)a3;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)cancelFullSizeImageRequest;
- (void)dealloc;
- (void)didLoadImage;
- (void)didMoveToParentViewController:(id)a3;
- (void)ensureFullSizeImageLoaded;
- (void)forceZoomingGesturesEnabled;
- (void)hideContentView;
- (void)loadView;
- (void)noteParentViewControllerDidDisappear;
- (void)refreshTileWithFullScreenImage:(id)a3 modelPhoto:(id)a4;
- (void)reloadZoomScale;
- (void)resetZoom;
- (void)retryDownload;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setAllowsZoomToFill:(BOOL)a3;
- (void)setAvalancheBadgesHidden:(BOOL)a3;
- (void)setBadgeVisible:(BOOL)a3;
- (void)setBadgeVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setCenterContentVertically:(BOOL)a3;
- (void)setClientIsWallpaper:(BOOL)a3;
- (void)setCropOverlayRect:(CGRect)a3 forCropRect:(CGRect)a4;
- (void)setForce1XCroppedImage:(BOOL)a3;
- (void)setForceNativeScreenScale:(BOOL)a3;
- (void)setFullSizeImage:(id)a3;
- (void)setGesturesEnabled:(BOOL)a3;
- (void)setInflightFullSizeImageRequestID:(int)a3;
- (void)setLockedUnderCropOverlay:(BOOL)a3;
- (void)setMaxZoomScaleOverride:(id)a3;
- (void)setOrientationDelegate:(id)a3;
- (void)setOverlayInsets:(UIEdgeInsets)a3;
- (void)setPicked:(BOOL)a3;
- (void)setReviewing:(BOOL)a3;
- (void)setReviewing:(BOOL)a3 animated:(BOOL)a4;
- (void)setShouldHideProgressIndicator:(BOOL)a3;
- (void)setShouldSupressViewWillTransitionToSize:(BOOL)a3;
- (void)setTVOut:(BOOL)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setTileDelegate:(id)a3;
- (void)setTileFrame:(CGRect)a3;
- (void)setUnscaledImage:(id)a3;
- (void)setVideoView:(id)a3;
- (void)setWantsCompactLayout:(BOOL)a3;
- (void)setZoomScale:(float)a3;
- (void)setZoomingGesturesEnabled:(BOOL)a3;
- (void)showContentView;
- (void)showErrorPlaceholderView;
- (void)updateAfterCollapse;
- (void)updateCenterOverlay;
- (void)updateCloudDownloadProgress:(double)a3;
- (void)updateForVisibleOverlays:(BOOL)a3;
- (void)updateViewConstraints;
- (void)updateZoomScales;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)zoomToScale:(double)a3 animated:(BOOL)a4 completionBlock:(id)a5;
@end

@implementation PLPhotoTileViewController

- (int64_t)_imageOrientation
{
  if ([(PLPhotoTileViewController *)self imageView]) {
    uint64_t v3 = [(PLPhotoTileViewController *)self imageOrientation];
  }
  else {
    uint64_t v3 = 1;
  }
  return MEMORY[0x1F413FDB0](v3);
}

- (id)_newOriginalImageForPickerFromCachedData
{
  uint64_t v3 = [(PLPhotoTileViewController *)self unscaledImage];
  if (!v3) {
    uint64_t v3 = [(PLPhotoTileViewController *)self image];
  }
  return (id)NewUIImageFromCachedImage(v3);
}

- (UIView)_customCenterOverlay
{
  return self->__customCenterOverlay;
}

- (void)setShouldSupressViewWillTransitionToSize:(BOOL)a3
{
  self->_shouldSupressViewWillTransitionToSize = a3;
}

- (BOOL)shouldSupressViewWillTransitionToSize
{
  return self->_shouldSupressViewWillTransitionToSize;
}

- (BOOL)shouldHideProgressIndicator
{
  return self->_shouldHideProgressIndicator;
}

- (BOOL)picked
{
  return self->_picked;
}

- (BOOL)reviewing
{
  return self->_reviewing;
}

- (void)setWantsCompactLayout:(BOOL)a3
{
  self->_wantsCompactLayout = a3;
}

- (BOOL)wantsCompactLayout
{
  return self->_wantsCompactLayout;
}

- (void)setMaxZoomScaleOverride:(id)a3
{
}

- (NSNumber)maxZoomScaleOverride
{
  return self->_maxZoomScaleOverride;
}

- (UIEdgeInsets)overlayInsets
{
  double top = self->_overlayInsets.top;
  double left = self->_overlayInsets.left;
  double bottom = self->_overlayInsets.bottom;
  double right = self->_overlayInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInflightFullSizeImageRequestID:(int)a3
{
  self->_inflightFullSizeImageRequestID = a3;
}

- (int)inflightFullSizeImageRequestID
{
  return self->_inflightFullSizeImageRequestID;
}

- (void)setForce1XCroppedImage:(BOOL)a3
{
  self->_force1XCroppedImage = a3;
}

- (BOOL)force1XCroppedImage
{
  return self->_force1XCroppedImage;
}

- (void)setForceNativeScreenScale:(BOOL)a3
{
  self->_forceNativeScreenScale = a3;
}

- (BOOL)forceNativeScreenScale
{
  return self->_forceNativeScreenScale;
}

- (void)setUnscaledImage:(id)a3
{
}

- (UIImage)unscaledImage
{
  return self->_unscaledImage;
}

- (void)setCenterContentVertically:(BOOL)a3
{
  self->_centerContentVertically = a3;
}

- (BOOL)centerContentVertically
{
  return self->_centerContentVertically;
}

- (void)_updateReviewCheckmark
{
}

- (void)setPicked:(BOOL)a3
{
  if (self->_picked != a3)
  {
    self->_picked = a3;
    [(PLPhotoTileViewController *)self _updateReviewCheckmark];
  }
}

- (void)setReviewing:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_reviewing != a3)
  {
    BOOL v4 = a4;
    self->_reviewing = a3;
    [(PLPhotoTileViewController *)self _setupReviewCheckmark];
    double v6 = 1.0;
    if (!self->_reviewing) {
      double v6 = 0.0;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__PLPhotoTileViewController_setReviewing_animated___block_invoke;
    v11[3] = &unk_1E63D2930;
    v11[4] = self;
    *(double *)&v11[5] = v6;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v8 = __51__PLPhotoTileViewController_setReviewing_animated___block_invoke_2;
    v9 = &unk_1E63D2688;
    v10 = self;
    if (v4)
    {
      [MEMORY[0x1E4F42FF0] animateWithDuration:v11 animations:v7 completion:0.3];
    }
    else
    {
      -[UIImageView setAlpha:](self->_reviewCheckmarkImageView, "setAlpha:");
      ((void (*)(void *, uint64_t))v8)(v7, 1);
    }
  }
}

uint64_t __51__PLPhotoTileViewController_setReviewing_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1040) setAlpha:*(double *)(a1 + 40)];
}

void __51__PLPhotoTileViewController_setReviewing_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 1402))
  {
    [*(id *)(v1 + 1040) removeFromSuperview];

    *(void *)(*(void *)(a1 + 32) + 1040) = 0;
  }
}

- (void)setReviewing:(BOOL)a3
{
}

- (void)_setupReviewCheckmark
{
  if (self->_reviewing && !self->_reviewCheckmarkImageView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F42AA0]);
    BOOL v4 = (UIImageView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    self->_reviewCheckmarkImageView = v4;
    -[UIImageView setImage:](v4, "setImage:", [MEMORY[0x1E4F42A80] imageNamed:@"BlueCheckUnselected.png" inBundle:PLPhotoLibraryFrameworkBundle()]);
    -[UIImageView setHighlightedImage:](self->_reviewCheckmarkImageView, "setHighlightedImage:", [MEMORY[0x1E4F42A80] imageNamed:@"BlueCheckSelected.png" inBundle:PLPhotoLibraryFrameworkBundle()]);
    [(PLPhotoTileViewController *)self _updateReviewCheckmark];
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "addSubview:", self->_reviewCheckmarkImageView);
    [(PLPhotoTileViewController *)self _updateSubviewOrdering];
  }
}

- (void)setLockedUnderCropOverlay:(BOOL)a3
{
  *((unsigned char *)self + 1346) = *((unsigned char *)self + 1346) & 0xFE | a3;
  -[PLPhotoTileViewController _adjustZoomForEnteringMode:](self, "_adjustZoomForEnteringMode:");
}

- (void)_adjustZoomForEnteringMode:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLPhotoTileViewController *)self _adjustScrollViewContentOffsetForInsets];
  if (v3)
  {
    if (![(PLPhotoTileViewController *)self isZoomedOut]) {
      return;
    }
    [(PLPhotoTileViewController *)self updateZoomScales];
  }
  else
  {
    [(PLPhotoTileViewController *)self updateZoomScales];
    if (![(PLPhotoTileViewController *)self isZoomedOut]) {
      return;
    }
  }
  scrollView = self->_scrollView;
  [(PLPhotoTileViewController *)self defaultZoomScale];
  -[PLImageScrollView setZoomScale:animated:](scrollView, "setZoomScale:animated:", 1);
}

- (void)updateAfterCollapse
{
  if (self->_videoView)
  {
    [(PLExpandableImageView *)self->_imageView setVideoView:0];
    [(PLExpandableImageView *)self->_imageView setVideoView:self->_videoView];
  }
  [(PLPhotoTileViewController *)self reloadZoomScale];
  scrollView = self->_scrollView;
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[PLImageScrollView setContentOffset:](scrollView, "setContentOffset:", v4, v5);
}

- (int)imageOrientation
{
  return self->_imageOrientation;
}

- (void)setAllowsZoomToFill:(BOOL)a3
{
  if (self->_allowZoomToFill != a3)
  {
    self->_allowZoomToFill = a3;
    [(PLPhotoTileViewController *)self updateZoomScales];
  }
}

- (void)updateZoomScales
{
  [(PLPhotoTileViewController *)self _calculateZoomScale:1 inView:0];
  self->_double minZoomScale = v3;
  [(PLPhotoTileViewController *)self _calculateZoomScale:0 inView:0];
  self->_double zoomToFillScale = v4;
  if (self->_allowZoomToFill) {
    char ShouldZoomToFill = __ShouldZoomToFill((uint64_t)self, self->_minZoomScale, v4);
  }
  else {
    char ShouldZoomToFill = 0;
  }
  self->_zoomToFillInsteadOfToFit = ShouldZoomToFill;
  double v6 = (void *)[(PLPhotoTileViewController *)self viewIfLoaded];
  v7 = objc_msgSend((id)objc_msgSend(v6, "window"), "screen");
  if (!v7) {
    v7 = (void *)[MEMORY[0x1E4F42D90] mainScreen];
  }
  [v6 bounds];
  CGFloat x = v38.origin.x;
  CGFloat y = v38.origin.y;
  CGFloat width = v38.size.width;
  CGFloat height = v38.size.height;
  if (CGRectIsEmpty(v38))
  {
    [v7 bounds];
    CGFloat x = v12;
    CGFloat y = v13;
    CGFloat width = v14;
    CGFloat height = v15;
  }
  double v16 = self->_imageSize.width;
  double v17 = self->_imageSize.height;
  v39.origin.CGFloat x = x;
  v39.origin.CGFloat y = y;
  v39.size.CGFloat width = width;
  v39.size.CGFloat height = height;
  double v18 = v16 / CGRectGetWidth(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double v19 = v17 / CGRectGetHeight(v40);
  if (v18 >= v19) {
    double v20 = v18;
  }
  else {
    double v20 = v19;
  }
  [v7 scale];
  double v22 = v20 / v21;
  if (v22 >= 3.0) {
    double v23 = v22;
  }
  else {
    double v23 = 3.0;
  }
  v24 = [(PLPhotoTileViewController *)self maxZoomScaleOverride];
  v25 = v24;
  if (v24)
  {
    [(NSNumber *)v24 doubleValue];
    double v23 = v26;
  }
  if (_UIAccessibilityZoomTouchEnabled())
  {
    double v27 = self->_imageSize.height * 0.0165999997;
    if (self->_imageSize.width * 0.0165999997 >= v27) {
      double v27 = self->_imageSize.width * 0.0165999997;
    }
    if (v27 >= v23) {
      double v23 = v27;
    }
  }
  if (v25)
  {
    [(NSNumber *)v25 doubleValue];
    double v29 = v28;
  }
  else
  {
    double v29 = 3.0;
  }
  modelPhoto = self->_modelPhoto;
  if (modelPhoto
    && [(PHAsset *)modelPhoto isCloudSharedAsset]
    && [(PHAsset *)self->_modelPhoto cloudPlaceholderKind] == 3)
  {
    double v23 = 1.15;
    double v29 = 1.15;
  }
  double doubleTapZoomScale = v29 * self->_minZoomScale;
  self->_double doubleTapZoomScale = doubleTapZoomScale;
  double minZoomScale = self->_minZoomScale;
  double zoomToFillScale = self->_zoomToFillScale;
  if (v25 && doubleTapZoomScale < zoomToFillScale)
  {
    self->_double zoomToFillScale = doubleTapZoomScale;
    double zoomToFillScale = doubleTapZoomScale;
    double doubleTapZoomScale = self->_doubleTapZoomScale;
  }
  double v34 = v23 * minZoomScale;
  if (doubleTapZoomScale < zoomToFillScale)
  {
    self->_double doubleTapZoomScale = zoomToFillScale;
    double zoomToFillScale = self->_zoomToFillScale;
  }
  if (v34 < zoomToFillScale && (_UIAccessibilityZoomTouchEnabled() & 1) == 0) {
    double v34 = self->_zoomToFillScale;
  }
  [(PLImageScrollView *)self->_scrollView setMaximumZoomScale:v34];
  scrollView = self->_scrollView;
  double v36 = self->_minZoomScale;
  [(PLImageScrollView *)scrollView setMinimumZoomScale:v36];
}

- (void)reloadZoomScale
{
  [(PLPhotoTileViewController *)self updateZoomScales];
  [(PLPhotoTileViewController *)self _setDefaultZoomScale];
}

- (void)_setDefaultZoomScale
{
  if ((*((unsigned char *)self + 1346) & 0x10) != 0)
  {
    *(float *)&double v2 = self->_cropRectZoomScale;
    [(PLPhotoTileViewController *)self setZoomScale:v2];
    -[PLImageScrollView convertRect:fromView:](self->_scrollView, "convertRect:fromView:", self->_imageView, self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
    double v6 = v5 - self->_cropOverlayRect.origin.x;
    double v8 = v7 - self->_cropOverlayRect.origin.y;
    scrollView = self->_scrollView;
    -[PLImageScrollView setContentOffset:](scrollView, "setContentOffset:", v6, v8);
  }
  else
  {
    [(PLPhotoTileViewController *)self defaultZoomScale];
    *(float *)&double v4 = v4;
    [(PLPhotoTileViewController *)self setZoomScale:v4];
  }
}

- (void)setOrientationDelegate:(id)a3
{
  if (a3)
  {
    if (objc_opt_respondsToSelector())
    {
      id orientationDelegate = self->_orientationDelegate;
      self->_id orientationDelegate = a3;
      if (!orientationDelegate)
      {
        [(PLPhotoTileViewController *)self reloadZoomScale];
      }
    }
  }
  else
  {
    self->_id orientationDelegate = 0;
  }
}

- (BOOL)isZoomedOut
{
  [(PLPhotoTileViewController *)self defaultZoomScale];
  float v4 = v3;
  [(PLImageScrollView *)self->_scrollView zoomScale];
  float v6 = v5;
  if (self->_useLessThanMinZoomForZoomedOutTest) {
    return v4 + 0.001 >= v6;
  }
  self->_useLessThanMinZoomForZoomedOutTest = 1;
  return vabds_f32(v6, v4) < 0.0001;
}

- (double)currentToDefaultZoomRatio
{
  [(PLImageScrollView *)self->_scrollView zoomScale];
  double v4 = v3;
  [(PLPhotoTileViewController *)self defaultZoomScale];
  return v4 / v5;
}

- (double)currentToMinZoomRatio
{
  [(PLImageScrollView *)self->_scrollView zoomScale];
  double v4 = v3;
  [(PLPhotoTileViewController *)self minZoomScale];
  return v4 / v5;
}

- (double)defaultZoomScale
{
  if (self->_zoomToFillInsteadOfToFit) {
    [(PLPhotoTileViewController *)self zoomToFillScale];
  }
  else {
    [(PLPhotoTileViewController *)self minZoomScale];
  }
  return result;
}

- (double)zoomToFitScale
{
  return self->_minZoomScale;
}

- (double)zoomToFillScale
{
  return self->_zoomToFillScale;
}

- (double)minZoomScale
{
  return self->_minZoomScale;
}

- (float)_calculateZoomScale:(BOOL)a3 inView:(id)a4
{
  BOOL v5 = a3;
  if (a4) {
    goto LABEL_2;
  }
  if ([(PLPhotoTileViewController *)self isViewLoaded])
  {
    double v8 = objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "superview");
    if (v8)
    {
      a4 = v8;
LABEL_2:
      int v7 = 0;
      goto LABEL_10;
    }
  }
  v9 = objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "window");
  if (v9 || (v9 = (void *)[MEMORY[0x1E4F43058] keyWindow]) != 0)
  {
    a4 = v9;
  }
  else
  {
    LODWORD(v4) = 1.0;
    if ((*((unsigned char *)self + 1345) & 2) == 0) {
      return *(float *)&v4;
    }
    a4 = 0;
  }
  int v7 = 1;
LABEL_10:
  p_imageSize = &self->_imageSize;
  LODWORD(v4) = 1.0;
  if (self->_imageSize.width <= 0.0 || self->_imageSize.height <= 0.0) {
    return *(float *)&v4;
  }
  if ((*((unsigned char *)self + 1345) & 2) != 0)
  {
    double v12 = *(double *)&__TVOutTileSize_0;
    double v14 = *(double *)&__TVOutTileSize_1;
  }
  else
  {
    objc_msgSend(a4, "bounds", v4);
    double v12 = v11;
    double v14 = v13;
  }
  uint64_t v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarStyle");
  if (([(id)*MEMORY[0x1E4F43630] isStatusBarHidden] & 1) == 0)
  {
    BOOL v16 = (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
       && v15 == 1;
    if (!v7) {
      goto LABEL_28;
    }
LABEL_25:
    if ((*((char *)self + 1345) & 0x80000000) == 0 && !v16)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarFrame");
      double v14 = v14 - v18;
    }
    goto LABEL_28;
  }
  BOOL v16 = 1;
  if (v7) {
    goto LABEL_25;
  }
LABEL_28:
  double v4 = v12 / p_imageSize->width;
  double v19 = v14 / self->_imageSize.height;
  if (v4 >= v19) {
    double v20 = v14 / self->_imageSize.height;
  }
  else {
    double v20 = v12 / p_imageSize->width;
  }
  if (v4 < v19) {
    double v4 = v14 / self->_imageSize.height;
  }
  if (v5) {
    double v4 = v20;
  }
  *(float *)&double v4 = v4;
  return *(float *)&v4;
}

- (double)minRotatedScale
{
  if (!self->_allowZoomToFill
    || (p_double minZoomScale = &self->_zoomToFillScale,
        (__ShouldZoomToFill((uint64_t)self, self->_minZoomScale, self->_zoomToFillScale) & 1) == 0))
  {
    p_double minZoomScale = &self->_minZoomScale;
  }
  return *p_minZoomScale;
}

- (void)_performDidEndZoomBlock
{
  didEndZoomingBlock = (void (**)(id, SEL))self->_didEndZoomingBlock;
  if (didEndZoomingBlock)
  {
    didEndZoomingBlock[2](didEndZoomingBlock, a2);
    [(PLPhotoTileViewController *)self _setDidEndZoomingBlock:0];
  }
}

- (void)_setDidEndZoomingBlock:(id)a3
{
  id didEndZoomingBlock = self->_didEndZoomingBlock;
  if (didEndZoomingBlock)
  {

    self->_id didEndZoomingBlock = 0;
  }
  if (a3) {
    self->_id didEndZoomingBlock = (id)[a3 copy];
  }
}

- (void)zoomToScale:(double)a3 animated:(BOOL)a4 completionBlock:(id)a5
{
  scrollView = self->_scrollView;
  if (scrollView
    && (BOOL v8 = a4,
        double v9 = a3,
        [(PLImageScrollView *)scrollView zoomScale],
        a3 = vabdd_f64(v10, v9),
        a3 >= 0.00000011920929))
  {
    [(PLPhotoTileViewController *)self _setDidEndZoomingBlock:a5];
    double v12 = self->_scrollView;
    [(PLImageScrollView *)v12 setZoomScale:v8 animated:v9];
  }
  else if (a5)
  {
    double v11 = (void (*)(id, __n128))*((void *)a5 + 2);
    v11(a5, *(__n128 *)&a3);
  }
}

- (id)dictionaryWithCroppedImageForRect:(CGRect)a3 minimalCropDimension:(double)a4 withOptions:(int)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v19 = *MEMORY[0x1E4F1DB28];
  long long v20 = v12;
  double v13 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ((a5 & 8) != 0) {
    double v14 = &v22;
  }
  else {
    double v14 = 0;
  }
  if ((a5 & 4) != 0) {
    uint64_t v15 = &v21;
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = -[PLPhotoTileViewController newImageWithCropRect:minimalCropDimension:croppedImageData:fullScreenImageData:imageCropRect:intersectCropWithFullRect:](self, "newImageWithCropRect:minimalCropDimension:croppedImageData:fullScreenImageData:imageCropRect:intersectCropWithFullRect:", v14, v15, &v19, (a5 >> 4) & 1, x, y, width, height, a4);
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v19, v20);
  [v13 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F8CAF0]];
  [v13 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F8CAF8]];
  [v13 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F8CB00]];
  [v13 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F8CB08]];

  return v13;
}

- (id)_newImageForAsset:(id)a3 targetSize:(CGSize)a4 cropRect:(CGRect)a5 fullSize:(CGSize)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v10 = a4.height;
  double v11 = a4.width;
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x3052000000;
  double v28 = __Block_byref_object_copy_;
  double v29 = __Block_byref_object_dispose_;
  uint64_t v30 = 0;
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeScale(&v24, 1.0 / a6.width, 1.0 / a6.height);
  CGAffineTransform v23 = v24;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGRect v32 = CGRectApplyAffineTransform(v31, &v23);
  double v13 = v32.size.width;
  double v14 = v32.size.height;
  if (v32.origin.x >= 0.0) {
    double v15 = v32.origin.x;
  }
  else {
    double v15 = 0.0;
  }
  if (v32.origin.y >= 0.0) {
    double v16 = v32.origin.y;
  }
  else {
    double v16 = 0.0;
  }
  uint64_t v17 = (void *)MEMORY[0x1C189F780]();
  id v18 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v18 setSynchronous:1];
  objc_msgSend(v18, "setNormalizedCropRect:", v15, v16, fmin(v13, 1.0), fmin(v14, 1.0));
  [v18 setResizeMode:2];
  long long v19 = (void *)[MEMORY[0x1E4F390D0] defaultManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__PLPhotoTileViewController__newImageForAsset_targetSize_cropRect_fullSize___block_invoke;
  v22[3] = &unk_1E63D21F8;
  v22[4] = &v25;
  objc_msgSend(v19, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", a3, 0, v18, v22, v11, v10);

  long long v20 = (void *)v26[5];
  _Block_object_dispose(&v25, 8);
  return v20;
}

id __76__PLPhotoTileViewController__newImageForAsset_targetSize_cropRect_fullSize___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)_getFullScreenImageData:(id *)a3 forImage:(id)a4 fullSize:(CGSize)a5 imageView:(id)a6 screenScaleTransform:(CGAffineTransform *)a7
{
  if ([(PLPhotoTileViewController *)self _clientIsWallpaper]
    || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42948], "currentDevice"), "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) != 1
    || *((char *)self + 1345) < 0)
  {
    double v17 = *MEMORY[0x1E4F1DB28];
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "bounds");
    double width = v20;
    double height = v21;
  }
  else
  {
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "frame");
    double v14 = rint((v12 + v13 + -480.0) * 0.5);
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "frame");
    double v17 = rint((v15 + v16 + -320.0) * 0.5);
    double width = 320.0;
    double height = 480.0;
  }
  objc_msgSend(a6, "convertRect:fromView:", -[PLPhotoTileViewController view](self, "view"), v17, v14, width, height);
  double x = PLIntegralRect(v22, v23, v24, v25);
  double y = v27;
  double v30 = v29;
  double v32 = v31;
  if ((dyld_program_sdk_at_least() & 1) != 0
    || [(PLPhotoTileViewController *)self forceNativeScreenScale])
  {
    long long v33 = *(_OWORD *)&a7->c;
    *(_OWORD *)&v49.a = *(_OWORD *)&a7->a;
    *(_OWORD *)&v49.c = v33;
    *(_OWORD *)&v49.tdouble x = *(_OWORD *)&a7->tx;
    double v34 = v17;
    *(double *)&long long v33 = v14;
    double v35 = width;
    double v36 = height;
    CGRect v50 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v33 - 8), &v49);
    double width = v50.size.width;
    double height = v50.size.height;
  }
  double v37 = a5.width;
  double v38 = a5.height;
  if (v30 > a5.width || v32 > a5.height)
  {
    double v40 = a5.width / v30;
    if (a5.width / v30 >= a5.height / v32) {
      double v40 = a5.height / v32;
    }
    if (v30 * v40 < a5.width) {
      double v37 = v30 * v40;
    }
    double v41 = v32 * v40;
    if (v41 < a5.height) {
      double v38 = v41;
    }
    double v42 = x + (v30 - v37) * 0.5;
    double v43 = y + (v32 - v38) * 0.5;
    CGRect v51 = CGRectIntegral(*(CGRect *)(&v37 - 2));
    double x = v51.origin.x;
    double y = v51.origin.y;
    double v30 = v51.size.width;
    double v32 = v51.size.height;
  }
  double v44 = 0.0;
  double v45 = 0.0;
  if (x >= 0.0)
  {
    v52.origin.double x = x;
    v52.origin.double y = y;
    v52.size.double width = v30;
    v52.size.double height = v32;
    if (CGRectGetMaxX(v52) <= a5.width)
    {
      double v45 = x;
    }
    else
    {
      v53.origin.double x = x;
      v53.origin.double y = y;
      v53.size.double width = v30;
      v53.size.double height = v32;
      double v45 = x - (CGRectGetMaxX(v53) - a5.width);
    }
  }
  if (y >= 0.0)
  {
    v54.origin.double x = v45;
    v54.origin.double y = y;
    v54.size.double width = v30;
    v54.size.double height = v32;
    if (CGRectGetMaxY(v54) <= a5.height)
    {
      double v44 = y;
      if (a4) {
        goto LABEL_28;
      }
      goto LABEL_30;
    }
    v55.origin.double x = v45;
    v55.origin.double y = y;
    v55.size.double width = v30;
    v55.size.double height = v32;
    double v44 = y - (CGRectGetMaxY(v55) - a5.height);
  }
  if (a4)
  {
LABEL_28:
    id v46 = (id)PLCreateCroppedImageFromImage();
    goto LABEL_31;
  }
LABEL_30:
  id v46 = -[PLPhotoTileViewController _newImageForAsset:targetSize:cropRect:fullSize:](self, "_newImageForAsset:targetSize:cropRect:fullSize:", [(PLPhotoTileViewController *)self photo], width, height, v45, v44, v30, v32, a5.width, a5.height);
LABEL_31:
  v47 = v46;
  if (v46)
  {
    [v46 CGImage];
    *a3 = (id)imageDataFromImageWithFormat();
  }
}

- (id)newImageWithCropRect:(CGRect)a3 minimalCropDimension:(double)a4 croppedImageData:(id *)a5 fullScreenImageData:(id *)a6 imageCropRect:(CGRect *)a7 intersectCropWithFullRect:(BOOL)a8
{
  BOOL v8 = a8;
  double v13 = PLIntegralRect(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = [(PLPhotoTileViewController *)self imageView];
  id v21 = [(PLPhotoTileViewController *)self image];
  [v21 size];
  double v23 = v22;
  double v25 = v24;
  if ([(UIViewController *)self uiipc_imagePickerController]) {
    id v26 = [(PLPhotoTileViewController *)self _newCGImageBackedUIImageFromImage:v21];
  }
  else {
    id v26 = 0;
  }
  PLPhysicalScreenScale();
  *(float *)&double v27 = v27;
  memset(&v53, 0, sizeof(v53));
  CGAffineTransformMakeScale(&v53, *(float *)&v27, *(float *)&v27);
  CGFloat v47 = v15;
  CGFloat v48 = v13;
  objc_msgSend(v20, "convertRect:fromView:", -[PLPhotoTileViewController scrollView](self, "scrollView"), v13, v15, v17, v19);
  CGRect v55 = CGRectIntegral(v54);
  CGFloat x = v55.origin.x;
  CGFloat y = v55.origin.y;
  double width = v55.size.width;
  double height = v55.size.height;
  if (v8)
  {
    [v20 bounds];
    v60.origin.CGFloat x = v32;
    v60.origin.CGFloat y = v33;
    v60.size.double width = v34;
    v60.size.double height = v35;
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.double width = width;
    v56.size.double height = height;
    CGRect v57 = CGRectIntersection(v56, v60);
    double v50 = v57.origin.x;
    double v51 = v57.origin.y;
    double v36 = v57.size.width;
    double v37 = v57.size.height;
    if (width != v57.size.width || height != v57.size.height)
    {
      double v17 = floor(v17 * (v57.size.width / width));
      double v19 = floor(v19 * (v57.size.height / height));
    }
  }
  else
  {
    double v50 = v55.origin.x;
    double v51 = v55.origin.y;
    double v37 = v55.size.height;
    double v36 = v55.size.width;
  }
  double v38 = v25;
  double v39 = v23;
  double v40 = a4;
  if (![(PLPhotoTileViewController *)self force1XCroppedImage]
    && ((dyld_program_sdk_at_least() & 1) != 0
     || [(PLPhotoTileViewController *)self forceNativeScreenScale]))
  {
    CGAffineTransform v52 = v53;
    v58.origin.CGFloat y = v47;
    v58.origin.CGFloat x = v48;
    v58.size.double width = v17;
    v58.size.double height = v19;
    CGRect v59 = CGRectApplyAffineTransform(v58, &v52);
    PLIntegralRect(v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);
    double v17 = v41;
    double v19 = v42;
  }
  a7->origin.CGFloat x = v50;
  a7->origin.CGFloat y = v51;
  a7->size.double width = v36;
  a7->size.double height = v37;
  if (a6)
  {
    CGAffineTransform v52 = v53;
    -[PLPhotoTileViewController _getFullScreenImageData:forImage:fullSize:imageView:screenScaleTransform:](self, "_getFullScreenImageData:forImage:fullSize:imageView:screenScaleTransform:", a6, v26, v20, &v52, v38, v23);
  }
  if (a4 <= 0.0 || v17 >= a4 || v19 >= a4) {
    goto LABEL_30;
  }
  if (v36 < v37)
  {
    if (v37 > v19)
    {
      if (v37 <= a4) {
        double v43 = v37;
      }
      else {
        double v43 = a4;
      }
      if (v17 == v19) {
        double v40 = v43;
      }
      else {
        double v40 = floor(v17 * (v43 / v19));
      }
      goto LABEL_31;
    }
LABEL_30:
    double v40 = v17;
    double v43 = v19;
    goto LABEL_31;
  }
  if (v36 <= v17) {
    goto LABEL_30;
  }
  if (v36 <= a4) {
    double v40 = v36;
  }
  if (v17 == v19) {
    double v43 = v40;
  }
  else {
    double v43 = floor(v19 * (v40 / v17));
  }
LABEL_31:
  if (v26) {
    id v44 = (id)PLCreateCroppedImageFromImage();
  }
  else {
    id v44 = -[PLPhotoTileViewController _newImageForAsset:targetSize:cropRect:fullSize:](self, "_newImageForAsset:targetSize:cropRect:fullSize:", [(PLPhotoTileViewController *)self photo], v40, v43, v50, v51, v36, v37, v38, v39);
  }
  double v45 = v44;
  if (a5 && v44)
  {
    [v44 CGImage];
    *a5 = (id)imageDataFromImageWithFormat();
  }
  if (v26) {

  }
  return v45;
}

- (void)_handleDoubleTap:(id)a3
{
  videoView = self->_videoView;
  if (videoView)
  {
    [(PLVideoView *)videoView handleDoubleTap];
    goto LABEL_10;
  }
  if ([(PLImageScrollView *)self->_scrollView isUserInteractionEnabled])
  {
    *((unsigned char *)self + 1345) |= 8u;
    *((unsigned char *)self + 1345) |= 0x20u;
    if ([(PLPhotoTileViewController *)self _clientIsWallpaper])
    {
      self->_userDidAdjustWallpaper = !self->_zoomToFillInsteadOfToFit;
      self->_zoomToFillInsteadOfToFit ^= 1u;
      scrollView = self->_scrollView;
      [(PLPhotoTileViewController *)self defaultZoomScale];
      BOOL v8 = scrollView;
LABEL_8:
      [(PLImageScrollView *)v8 setZoomScale:1 animated:v7];
      goto LABEL_10;
    }
    [(PLPhotoTileViewController *)self defaultZoomScale];
    float v10 = v9;
    [(PLImageScrollView *)self->_scrollView zoomScale];
    *(float *)&double v11 = v11;
    if (v10 != *(float *)&v11)
    {
      BOOL v8 = self->_scrollView;
      double v7 = v10;
      goto LABEL_8;
    }
    float doubleTapZoomScale = self->_doubleTapZoomScale;
    [a3 locationInView:self->_imageView];
    double v14 = v13;
    double v16 = v15;
    [(PLExpandableImageView *)self->_imageView frame];
    -[PLImageScrollView zoomToRect:animated:](self->_scrollView, "zoomToRect:animated:", 1, v14 - v17 / doubleTapZoomScale * 0.5, v16 - v18 / doubleTapZoomScale * 0.5);
  }
LABEL_10:
  [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate photoTileViewControllerDoubleTap:self];
  [(PLPhotoTileViewController *)self _updatePlaceholderImageRect];
}

- (void)_handleFullSizeImageRequestResult:(id)a3 dataUTI:(id)a4 orientation:(int64_t)a5
{
  if (a4
    && (double v7 = (void *)[MEMORY[0x1E4F442D8] typeWithIdentifier:a4],
        int v8 = [v7 conformsToType:*MEMORY[0x1E4F44410]],
        a3)
    && v8)
  {
    [(PHAsset *)self->_modelPhoto localIdentifier];
    dispatch_get_global_queue(0, 0);
    pl_dispatch_async();
  }
  else
  {
    modelPhoto = self->_modelPhoto;
    if (modelPhoto) {
      char v10 = [(PHAsset *)modelPhoto complete] ^ 1;
    }
    else {
      char v10 = 0;
    }
    if (self->_tileDelegate && (v10 & 1) == 0 && (*((unsigned char *)self + 1346) & 8) == 0)
    {
      *((unsigned char *)self + 1346) |= 8u;
      tileDelegate = self->_tileDelegate;
      [(PLPhotoTileViewControllerDelegate *)tileDelegate photoTileViewControllerRequestsFullSizeImage:self];
    }
  }
}

uint64_t __83__PLPhotoTileViewController__handleFullSizeImageRequestResult_dataUTI_orientation___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  double v2 = (double)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 1000) pixelWidth];
  double v3 = (double)(unint64_t)[*(id *)(*(void *)(a1 + 32) + 1000) pixelHeight];
  uint64_t v4 = *(void *)(a1 + 56);
  PLGetOrientationAndUntransformedSizeFromImageData();
  PLOrientationTransformImageSize();
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = PLImageOrientationFromExifOrientation();
  uint64_t v10 = v9;
  if (v6 != v2 || v8 != v3 || v9 != v4)
  {
    Log = PLPhotoKitGetLog();
    if (os_log_type_enabled(Log, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 1000);
      *(_DWORD *)buf = 138413826;
      uint64_t v17 = v14;
      __int16 v18 = 2048;
      double v19 = v2;
      __int16 v20 = 2048;
      double v21 = v3;
      __int16 v22 = 2048;
      uint64_t v23 = v4;
      __int16 v24 = 2048;
      double v25 = v6;
      __int16 v26 = 2048;
      double v27 = v8;
      __int16 v28 = 2048;
      uint64_t v29 = v10;
      _os_log_impl(&dword_1BEE94000, Log, OS_LOG_TYPE_ERROR, "Mis-matched image size and/or orientation for asset %@. PhotoKit: %.0f x %.0f (%ld). Data: %.0f x %.0f (%ld)", buf, 0x48u);
    }
  }
  return pl_dispatch_async();
}

uint64_t __83__PLPhotoTileViewController__handleFullSizeImageRequestResult_dataUTI_orientation___block_invoke_82(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1000), "localIdentifier"));
  if (result)
  {
    double v3 = *(void **)(*(void *)(a1 + 32) + 1016);
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 72);
    double v6 = *(double *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    return objc_msgSend(v3, "setFullSizeImageJPEGData:size:orientation:", v4, v5, v6, v7);
  }
  return result;
}

- (void)_requestFullSizeImage
{
  if (!self->_fullSizeImageRequestID)
  {
    if (self->_modelPhoto)
    {
      id v3 = (id)objc_opt_new();
      [v3 setDeliveryMode:1];
      [v3 setLoadingMode:1];
      [v3 setNetworkAccessAllowed:1];
      id v4 = [(PLPhotoTileViewController *)self cachingImageManager];
      modelPhoto = self->_modelPhoto;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __50__PLPhotoTileViewController__requestFullSizeImage__block_invoke;
      v6[3] = &unk_1E63D2180;
      v6[4] = self;
      self->_fullSizeImageRequestID = [v4 requestImageDataAndOrientationForAsset:modelPhoto options:v3 resultHandler:v6];
    }
  }
}

uint64_t __50__PLPhotoTileViewController__requestFullSizeImage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = PLImageOrientationFromExifOrientation();
  return [v5 _handleFullSizeImageRequestResult:a2 dataUTI:a3 orientation:v6];
}

- (void)_handleSingleTap:(id)a3
{
}

- (void)ensureFullSizeImageLoaded
{
  if (!self->_isLoadingFullSizeImage)
  {
    modelPhoto = self->_modelPhoto;
    if (modelPhoto) {
      int v4 = [(PHAsset *)modelPhoto complete] ^ 1;
    }
    else {
      LOBYTE(v4) = 0;
    }
    if (self->_tileDelegate)
    {
      if ((*((unsigned char *)self + 1345) & 1) == 0) {
        LOBYTE(v4) = 1;
      }
      if ((v4 & 1) == 0)
      {
        self->_isLoadingFullSizeImage = 1;
        tileDelegate = self->_tileDelegate;
        [(PLPhotoTileViewControllerDelegate *)tileDelegate photoTileViewControllerRequestsFullScreenImage:self];
      }
    }
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  if (self->_dispatchTimer)
  {
    dispatch_time_t v4 = dispatch_time(0, (uint64_t)((5.0 - self->_dispatchTimeElapsed) * 1000000000.0));
    dispatchTimer = self->_dispatchTimer;
    dispatch_source_set_timer(dispatchTimer, v4, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
}

- (void)applicationWillResignActive:(id)a3
{
  if (self->_dispatchTimer)
  {
    self->_dispatchTimeElapsed = CFAbsoluteTimeGetCurrent() - self->_dispatchStartTime;
    dispatchTimer = self->_dispatchTimer;
    dispatch_source_set_timer(dispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController viewDidAppear:](&v12, sel_viewDidAppear_);
  *((unsigned char *)self + 1346) |= 2u;
  if (*((char *)self + 1345) < 0) {
    [(PLPhotoTileViewController *)self setZoomingGesturesEnabled:1];
  }
  [(PLVideoView *)self->_videoView viewDidAppear];
  [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate photoTileViewController:self didAppear:v3];
  [(PLTilePlaceholderView *)self->_placeholderView showLoadingIndicatorWhenReady];
  if (!self->_dispatchTimer)
  {
    self->_dispatchTimer = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v10, &location);
    pl_dispatch_source_set_event_handler();
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer((dispatch_source_t)self->_dispatchTimer, v5, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
    self->_dispatchStartTime = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v9, 3221225472, __43__PLPhotoTileViewController_viewDidAppear___block_invoke, &unk_1E63D2158);
    double v7 = (void *)MEMORY[0x1E4F43630];
    [v6 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x1E4F43710] object:*MEMORY[0x1E4F43630]];
    double v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x1E4F43648] object:*v7];
    dispatch_resume((dispatch_object_t)self->_dispatchTimer);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  self->_hasNotedZoom = 0;
}

id *__43__PLPhotoTileViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  uint64_t result = (id *)objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    double v2 = result;
    if ((*((unsigned char *)result + 1346) & 2) != 0) {
      [result[125] uuid];
    }
    return (id *)[v2 _teardownDispatchTimer];
  }
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  uint64_t v5 = 1;
  if (!a3)
  {
    if (*((char *)self + 1345) < 0 && (objc_opt_respondsToSelector() & 1) != 0) {
      uint64_t v5 = [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate isPhotoTileParentPageControllerAnimating:self];
    }
    else {
      uint64_t v5 = 0;
    }
  }
  self->_shouldUpdateBadgeViewOptimalLayout = 1;
  *((unsigned char *)self + 1346) |= 4u;
  [(PLVideoView *)self->_videoView viewWillAppear:v5];
  if (*((char *)self + 1345) < 0)
  {
    [(PLPhotoTileViewController *)self _setDefaultZoomScale];
    [(PLExpandableImageView *)self->_imageView setBorderAndAccessoriesVisible:0];
    [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate photoTileViewController:self willAppear:v5];
    [(PLPhotoTileViewController *)self setZoomingGesturesEnabled:0];
  }
  else
  {
    [(PLPhotoTileViewController *)self reloadZoomScale];
  }
}

- (void)resetZoom
{
  [(PLPhotoTileViewController *)self _resetZoomCommon];
  BOOL v3 = (void *)[(PLPhotoTileViewController *)self view];
  [v3 layoutBelowIfNeeded];
}

- (void)updateViewConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)PLPhotoTileViewController;
  [(PLPhotoTileViewController *)&v6 updateViewConstraints];
  BOOL v3 = [(PLPhotoTileViewController *)self _customCenterOverlay];
  if (v3)
  {
    if (!self->_customCenterOverlayConstraints)
    {
      dispatch_time_t v4 = v3;
      uint64_t v5 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
      -[NSArray addObject:](v5, "addObject:", objc_msgSend(MEMORY[0x1E4F28DC8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 9, 0, -[PLPhotoTileViewController view](self, "view"), 9, 1.0, 0.0));
      -[NSArray addObject:](v5, "addObject:", objc_msgSend(MEMORY[0x1E4F28DC8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v4, 10, 0, -[PLPhotoTileViewController view](self, "view"), 10, 1.0, 0.0));
      objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "addConstraints:", v5);
      self->_customCenterOverlayConstraints = v5;
    }
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController didMoveToParentViewController:](&v5, sel_didMoveToParentViewController_);
  NSClassFromString(&cfstr_Camimagepicker.isa);
  char isKindOfClass = objc_opt_isKindOfClass();
  if (*((char *)self + 1345) & 0x80000000) == 0 && (isKindOfClass)
  {
    [(PLPhotoTileViewController *)self updateZoomScales];
    [(PLPhotoTileViewController *)self _setDefaultZoomScale];
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)PLPhotoTileViewController;
  [(PLPhotoTileViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(PLPhotoTileViewController *)self _updateContentInset];
}

- (void)viewDidLayoutSubviews
{
  *(void *)&rect.origin.CGFloat y = self;
  *(void *)&rect.size.double width = PLPhotoTileViewController;
  [(CGFloat *)(objc_super *)&rect.origin.y viewDidLayoutSubviews];
  [(PLPhotoTileViewController *)self _resetZoomCommon];
  [(UIImageView *)self->_reviewCheckmarkImageView sizeToFit];
  [(PLExpandableImageView *)self->_imageView frame];
  CGFloat v4 = v3;
  rect.origin.CGFloat x = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIImageView *)self->_reviewCheckmarkImageView bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;
  v23.origin.CGFloat x = v4;
  v23.origin.CGFloat y = v6;
  v23.size.double width = v8;
  v23.size.double height = v10;
  double Width = CGRectGetWidth(v23);
  v24.origin.CGFloat x = v12;
  v24.origin.CGFloat y = v14;
  v24.size.double width = v16;
  v24.size.double height = v18;
  double v20 = floor((Width - CGRectGetWidth(v24)) * 0.5);
  v25.origin.CGFloat x = rect.origin.x;
  v25.origin.CGFloat y = v6;
  v25.size.double width = v8;
  v25.size.double height = v10;
  double MaxY = CGRectGetMaxY(v25);
  v26.origin.CGFloat x = v12;
  v26.origin.CGFloat y = v14;
  v26.size.double width = v16;
  v26.size.double height = v18;
  -[UIImageView setFrame:](self->_reviewCheckmarkImageView, "setFrame:", v20, MaxY - CGRectGetHeight(v26) + -15.0, v16, v18);
  [(PLPhotoTileViewController *)self _repositionBadgeView];
  if ((*((unsigned char *)self + 1346) & 2) == 0 && CGRectEqualToRect(self->_cropRect, *MEMORY[0x1E4F1DB28])) {
    [(PLPhotoTileViewController *)self _centerImageInScrollView];
  }
}

- (void)_viewWillMoveToSuperView:(id)a3
{
  if (a3)
  {
    [a3 bounds];
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "setFrame:", v4, v5, v6, v7);
    [(PLPhotoTileViewController *)self _updateContentInset];
  }
}

- (void)_resetZoomCommon
{
  if ((*((unsigned char *)self + 1346) & 2) == 0 && self->_image && (*((char *)self + 1345) < 0 || self->_mode == 1)) {
    [(PLPhotoTileViewController *)self reloadZoomScale];
  }
}

- (void)_performRotationUpdatesWithDuration:(double)a3 size:(CGSize)a4
{
  if ((*((unsigned char *)self + 1345) & 2) != 0) {
    return;
  }
  imageView = self->_imageView;
  videoView = self->_videoView;
  if (imageView)
  {
    if (!videoView)
    {
      [(PLPhotoTileViewController *)self defaultZoomScale];
      float v8 = v7;
      [(PLImageScrollView *)self->_scrollView zoomScale];
      float v10 = v9;
      if (v10 >= v8) {
        float v11 = v10;
      }
      else {
        float v11 = v8;
      }
      [(PLExpandableImageView *)self->_imageView frame];
      if (*((char *)self + 1345) < 0
        && (double v13 = v12, ![(PLPhotoTileViewController *)self _clientIsWallpaper])
        && (v11 == v8 || (float v18 = v13, [(PLImageScrollView *)self->_scrollView bounds], v19 > v18)))
      {
        [(PLPhotoTileViewController *)self updateZoomScales];
        [(PLPhotoTileViewController *)self minRotatedScale];
        float v15 = v20;
      }
      else
      {
        float v15 = v11;
        if (![(PLPhotoTileViewController *)self _clientIsWallpaper]) {
          goto LABEL_25;
        }
        float v15 = v11;
        if (*((unsigned char *)self + 1345)) {
          goto LABEL_25;
        }
        float v15 = v11;
        if (self->_userDidAdjustWallpaper) {
          goto LABEL_25;
        }
        [(PLPhotoTileViewController *)self _calculateZoomScale:0 inView:self->_scrollView];
        float v15 = v16;
      }
      [(PLImageScrollView *)self->_scrollView setAdjustZoomScaleAfterRotation:1];
LABEL_25:
      char v21 = *((unsigned char *)self + 1345);
      *(float *)&double v14 = v15;
      [(PLPhotoTileViewController *)self setZoomScale:v14];
      if (v15 == v11) {
        *((unsigned char *)self + 1345) = *((unsigned char *)self + 1345) & 0xDF | v21 & 0x20;
      }
      if ((*((char *)self + 1345) & 0x80000000) == 0
        || [(PLPhotoTileViewController *)self _clientIsWallpaper])
      {
        [(PLPhotoTileViewController *)self _centerImageInScrollView];
      }
      if (!self->_mode) {
        [(PLPhotoTileViewController *)self _repositionBadgeView];
      }
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (videoView) {
LABEL_14:
  }
    [(PLVideoView *)videoView updateForRotationWithDuration:a4.width > a4.height isLandscape:a3];
LABEL_15:
  [(PLPhotoTileViewController *)self updateZoomScales];
  if (self->_videoView && self->_scrollView)
  {
    [(PLPhotoTileViewController *)self defaultZoomScale];
    *(float *)&double v17 = v17;
    [(PLPhotoTileViewController *)self setZoomScale:v17];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_);
  if (![(PLPhotoTileViewController *)self shouldSupressViewWillTransitionToSize])
  {
    if (a4) {
      [a4 targetTransform];
    }
    else {
      memset(&v14, 0, sizeof(v14));
    }
    if (CGAffineTransformIsIdentity(&v14))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v13[3] = &unk_1E63D2108;
      v13[4] = self;
      float v8 = v13;
      id v9 = a4;
      float v10 = 0;
    }
    else
    {
      self->_shouldUpdateBadgeViewOptimalLayout = 1;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
      v12[3] = &unk_1E63D2130;
      v12[4] = self;
      *(CGFloat *)&v12[5] = width;
      *(CGFloat *)&v12[6] = height;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
      v11[3] = &unk_1E63D2108;
      v11[4] = self;
      float v8 = v12;
      float v10 = v11;
      id v9 = a4;
    }
    [v9 animateAlongsideTransition:v8 completion:v10];
  }
}

uint64_t __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1008) zoomScale];
  double v3 = v2;
  double v4 = *(double **)(a1 + 32);
  double v5 = v4[154];
  double v6 = v4[155];
  [v4 updateZoomScales];
  double v7 = *(unsigned char **)(a1 + 32);
  if (v7[1136]) {
    uint64_t v8 = 1240;
  }
  else {
    uint64_t v8 = 1232;
  }
  if (v7[1136]) {
    double v9 = v6;
  }
  else {
    double v9 = v5;
  }
  double v10 = v3 * (*(double *)&v7[v8] / v9);
  *(float *)&double v10 = v10;
  [v7 setZoomScale:v10];
  float v11 = *(void **)(*(void *)(a1 + 32) + 1024);
  return [v11 updateScaleMode];
}

uint64_t __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  [a2 transitionDuration];
  return objc_msgSend(v2, "_performRotationUpdatesWithDuration:size:");
}

uint64_t __80__PLPhotoTileViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(unsigned char *)(v1 + 1345) & 2) == 0) {
    return [*(id *)(v1 + 1008) setAdjustZoomScaleAfterRotation:0];
  }
  return result;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return (*((unsigned char *)self + 1345) & 2) == 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "view", a3);
  return v5 != objc_msgSend(-[PLPhotoTileViewController videoView](self, "videoView"), "videoOverlayPlayButton");
}

- (id)viewForZoomingInScrollView:(id)a3
{
  if ((id)[(PLPhotoTileViewController *)self view] == a3) {
    return 0;
  }
  else {
    return self->_imageView;
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate photoTileViewControllerDidEndGesture:self];
  if (self->_scrollView == a3)
  {
    if ([(PLPhotoTileViewController *)self _clientIsWallpaper])
    {
      [a3 visibleBounds];
      v10.origin.CGFloat x = v5;
      v10.origin.CGFloat y = v6;
      v10.size.CGFloat width = v7;
      v10.size.CGFloat height = v8;
      if (!CGRectEqualToRect(self->_cropRectBeforeDragging, v10)) {
        self->_userDidAdjustWallpaper = 1;
      }
    }
    if ((*((unsigned char *)self + 1345) & 4) == 0) {
      [(PLPhotoTileViewController *)self _updatePlaceholderImageRect];
    }
    [(PLPhotoTileViewController *)self _updatePlaceholderVisibility];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate photoTileViewControllerDidEndGesture:self];
    if (self->_scrollView == a3)
    {
      if ([(PLPhotoTileViewController *)self _clientIsWallpaper])
      {
        [a3 visibleBounds];
        v11.origin.CGFloat x = v6;
        v11.origin.CGFloat y = v7;
        v11.size.CGFloat width = v8;
        v11.size.CGFloat height = v9;
        if (!CGRectEqualToRect(self->_cropRectBeforeDragging, v11)) {
          self->_userDidAdjustWallpaper = 1;
        }
      }
      if ((*((unsigned char *)self + 1345) & 4) == 0) {
        [(PLPhotoTileViewController *)self _updatePlaceholderImageRect];
      }
      [(PLPhotoTileViewController *)self _updatePlaceholderVisibility];
    }
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (self->_scrollView == a3)
  {
    [(PLPhotoTileViewController *)self _updatePlaceholderVisibility];
    if ([(PLPhotoTileViewController *)self _clientIsWallpaper])
    {
      [a3 visibleBounds];
      self->_cropRectBeforeDragging.origin.CGFloat x = v5;
      self->_cropRectBeforeDragging.origin.CGFloat y = v6;
      self->_cropRectBeforeDragging.size.CGFloat width = v7;
      self->_cropRectBeforeDragging.size.CGFloat height = v8;
    }
  }
  tileDelegate = self->_tileDelegate;
  [(PLPhotoTileViewControllerDelegate *)tileDelegate photoTileViewControllerWillBeginGesture:self];
}

- (void)scrollViewDidZoom:(id)a3
{
  if ((*((unsigned char *)self + 1345) & 4) != 0 && (*((unsigned char *)self + 1345) & 0x40) == 0)
  {
    *((unsigned char *)self + 1345) |= 0x20u;
    [(PLImageScrollView *)self->_scrollView zoomScale];
    double v5 = v4;
    [(PLPhotoTileViewController *)self defaultZoomScale];
    *(float *)&double v6 = v5 / v6;
    if (*(float *)&v6 > 1.0) {
      [(PLPhotoTileViewController *)self _requestFullSizeImage];
    }
    if (self->_badgeViewOptimalLayoutLowestTop != 0.0)
    {
      [(PLPhotoTileViewController *)self _repositionBadgeView];
    }
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  if (self->_scrollView == a3)
  {
    if ([(PLPhotoTileViewController *)self _clientIsWallpaper])
    {
      if ((*((unsigned char *)self + 1345) & 0x40) == 0)
      {
        double zoomScaleBeforeZooming = self->_zoomScaleBeforeZooming;
        [a3 zoomScale];
        if (v8 != zoomScaleBeforeZooming) {
          self->_userDidAdjustWallpaper = 1;
        }
      }
      if ((*((unsigned char *)self + 1345) & 0x40) != 0) {
        *((unsigned char *)self + 1345) &= ~0x40u;
      }
      [(PLPhotoTileViewController *)self _updateContentInset];
    }
    *((unsigned char *)self + 1345) &= ~4u;
    *((unsigned char *)self + 1345) &= ~8u;
    [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate photoTileViewControllerDidEndGesture:self];
    pendingImage = self->_pendingImage;
    if (pendingImage)
    {
      [(PLPhotoTileViewController *)self _setImage:pendingImage isThumbnail:0 preserveFrame:0];

      self->_pendingImage = 0;
    }
    [(PLPhotoTileViewController *)self _performDidEndZoomBlock];
    if (([(PLImageScrollView *)self->_scrollView isDragging] & 1) == 0) {
      [(PLPhotoTileViewController *)self _updatePlaceholderImageRect];
    }
    [(PLPhotoTileViewController *)self _updatePlaceholderVisibility];
  }
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  self->_shouldUpdateBadgeViewOptimalLayout = 0;
  if (self->_scrollView == a3)
  {
    [(PLPhotoTileViewController *)self _updatePlaceholderVisibility];
    if ([(PLPhotoTileViewController *)self _clientIsWallpaper])
    {
      [a3 zoomScale];
      *(float *)&double v6 = v6;
      self->_double zoomScaleBeforeZooming = *(float *)&v6;
    }
    *((unsigned char *)self + 1345) |= 4u;
    [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate photoTileViewControllerWillBeginGesture:self];
    if (!self->_hasNotedZoom) {
      self->_hasNotedZoom = 1;
    }
  }
}

- (CGSize)scrollView:(id)a3 contentSizeForZoomScale:(double)a4 withProposedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  if (*((char *)self + 1345) < 0
    && ![(PLPhotoTileViewController *)self _clientIsWallpaper]
    && ([(PLPhotoTileViewController *)self defaultZoomScale], v10 >= a4))
  {
    [a3 bounds];
    double v16 = v15;
    double v18 = v17;
    objc_msgSend(-[PLPhotoTileViewController viewForZoomingInScrollView:](self, "viewForZoomingInScrollView:", a3), "frame");
    if (v16 >= v19) {
      double v21 = v19;
    }
    else {
      double v21 = v16;
    }
    float v22 = v21;
    float v12 = rintf(v22);
    if (v18 >= v20) {
      double height = v20;
    }
    else {
      double height = v18;
    }
  }
  else
  {
    float v11 = width;
    float v12 = rintf(v11);
  }
  if ((*((unsigned char *)self + 1345) & 4) == 0
    && (*((unsigned char *)self + 1345) & 0x40) == 0
    && ((*((char *)self + 1345) & 0x80000000) == 0 && CGRectEqualToRect(self->_cropRect, *MEMORY[0x1E4F1DB28])
     || [(PLPhotoTileViewController *)self allowsEditing]))
  {
    [(PLPhotoTileViewController *)self _centerImageInScrollView];
  }
  double v13 = rint(height);
  double v14 = v12;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (void)noteParentViewControllerDidDisappear
{
  if ((*((unsigned char *)self + 1346) & 2) != 0) {
    [(PLPhotoTileViewController *)self viewDidDisappear:0];
  }
}

- (void)updateForVisibleOverlays:(BOOL)a3
{
  BOOL v3 = a3;
  -[PLPhotoTileViewController setBadgeVisible:](self, "setBadgeVisible:");
  placeholderView = self->_placeholderView;
  [(PLTilePlaceholderView *)placeholderView setToolbarVisible:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PLPhotoTileViewController;
  -[PLPhotoTileViewController viewDidDisappear:](&v5, sel_viewDidDisappear_);
  *((unsigned char *)self + 1346) &= ~2u;
  *((unsigned char *)self + 1346) &= ~4u;
  if (*((char *)self + 1345) < 0) {
    [(PLPhotoTileViewController *)self setZoomingGesturesEnabled:0];
  }
  [(PLVideoView *)self->_videoView viewDidDisappear];
  if (![(PLPhotoTileViewController *)self tileIsOnScreen])
  {
    [(PLPhotoTileViewController *)self _setDefaultZoomScale];
    [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate photoTileViewController:self didDisappear:v3];
  }
  [(PLPhotoTileViewController *)self _teardownDispatchTimer];
}

- (void)loadView
{
  double x = self->_tileFrame.origin.x;
  double y = self->_tileFrame.origin.y;
  double width = self->_tileFrame.size.width;
  double height = self->_tileFrame.size.height;
  if ([(PLPhotoTileViewController *)self isTVOut])
  {
    double width = *(double *)&__TVOutTileSize_0;
    double height = *(double *)&__TVOutTileSize_1;
  }
  self->_shouldUpdateBadgeViewOptimalLayout = 1;
  CGFloat v7 = -[PLTileContainerView initWithFrame:photoTileController:]([PLTileContainerView alloc], "initWithFrame:photoTileController:", self, x, y, width, height);
  self->_containerView = v7;
  [(PLTileContainerView *)v7 setAutoresizingMask:18];
  containerView = self->_containerView;
  [(PLPhotoTileViewController *)self setView:containerView];
}

- (void)cancelFullSizeImageRequest
{
  if (self->_fullSizeImageRequestID) {
    objc_msgSend(-[PLPhotoTileViewController cachingImageManager](self, "cachingImageManager"), "cancelImageRequest:", self->_fullSizeImageRequestID);
  }
  self->_fullSizeImageRequestID = 0;
}

- (BOOL)hasFullSizeImage
{
  return (*((unsigned char *)self + 1345) & 1) == 0 && [(PLExpandableImageView *)self->_imageView image] != 0;
}

- (void)setFullSizeImage:(id)a3
{
  if ((*((unsigned char *)self + 1345) & 8) != 0)
  {

    self->_pendingImage = (UIImage *)a3;
  }
  else
  {
    [(PLPhotoTileViewController *)self _setImage:a3 isThumbnail:0 preserveFrame:1];
  }
}

- (void)showErrorPlaceholderView
{
  self->_currentTileDownloadFinished = 1;
  placeholderView = self->_placeholderView;
  if (placeholderView) {
    [(PLTilePlaceholderView *)placeholderView showErrorIndicator];
  }
}

- (void)_removePlaceholderView
{
  self->_currentTileDownloadFinished = 1;
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    [(PLTilePlaceholderView *)placeholderView fadeOutSoonIfNeededAndRemoveFromSuperview:1];

    self->_placeholderView = 0;
  }
}

- (void)didLoadImage
{
  self->_isLoadingFullSizeImage = 0;
  if (([(PHAsset *)self->_modelPhoto isTimelapsePlaceholder] & 1) == 0)
  {
    [(PLPhotoTileViewController *)self _removePlaceholderView];
  }
}

- (void)refreshTileWithFullScreenImage:(id)a3 modelPhoto:(id)a4
{
  self->_modelPhoto = (PHAsset *)a4;
  if (![(PLVideoView *)self->_videoView isPlaying])
  {
    [(PLPhotoTileViewController *)self _updateVideoViewForModelPhoto];
    if (self->_videoView)
    {
      if ([(PLPhotoTileViewController *)self isViewLoaded]) {
        [(PLPhotoTileViewController *)self _installSubview:self->_videoView];
      }
    }
  }
  [(PLPhotoTileViewController *)self _updatePlaceholderViewAnimated:1];
  [(PLPhotoTileViewController *)self _setImage:a3 isThumbnail:0 preserveFrame:0];
  if (self->_fullSizeImageRequestID)
  {
    [(PLPhotoTileViewController *)self cancelFullSizeImageRequest];
    [(PLPhotoTileViewController *)self _requestFullSizeImage];
  }
}

- (void)_setImage:(id)a3 isThumbnail:(BOOL)a4 preserveFrame:(BOOL)a5
{
  BOOL v5 = a5;
  if (!a4) {
    self->_isLoadingFullSizeImage = 0;
  }
  imageView = self->_imageView;
  [(PLExpandableImageView *)imageView frame];
  double v45 = v11;
  double v46 = v10;
  double v13 = v12;
  double v47 = v14;
  image = self->_image;
  double v16 = (UIImage *)a3;
  if (image != a3)
  {

    double v16 = (UIImage *)a3;
    self->_image = v16;
  }
  if (v16 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (!a4)
    {
      p_imageSize = &self->_imageSize;
      double v20 = self->_image;
      if (v20)
      {
        [(UIImage *)v20 size];
        p_imageSize->double width = v21;
        self->_imageSize.double height = v22;
      }
      else
      {
        CGSize *p_imageSize = *(CGSize *)MEMORY[0x1E4F1DB30];
      }
    }
  }
  else
  {
    CGFloat v17 = (double)[(PHAsset *)self->_modelPhoto pixelWidth];
    CGFloat v18 = (double)[(PHAsset *)self->_modelPhoto pixelHeight];
    self->_imageSize.double width = v17;
    self->_imageSize.double height = v18;
  }
  [(PLPhotoTileViewController *)self _updateModelPhotoWithImage:a3];
  [(PLPhotoTileViewController *)self _configureViews];
  [(PLPhotoTileViewController *)self _showBadgeViewIfAppropriate];
  [(PLImageScrollView *)self->_scrollView contentOffset];
  double v24 = v23;
  double v26 = v25;
  [(PLImageScrollView *)self->_scrollView zoomScale];
  float v28 = v27;
  uint64_t v29 = self->_imageView;
  if (v29)
  {
    [(PLExpandableImageView *)v29 bounds];
    double v31 = v30;
    double v33 = v32;
    uint64_t v29 = self->_imageView;
  }
  else
  {
    double v31 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v33 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v34 = v28;
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  -[PLExpandableImageView setBounds:](v29, "setBounds:", 0.0, 0.0, width, height);
  *((unsigned char *)self + 1345) = *((unsigned char *)self + 1345) & 0xFE | a4;
  if (a4)
  {
    int v37 = 1;
  }
  else
  {
    [(UIImage *)self->_image imageOrientation];
    int v37 = PLDeviceOrientationFromImageOrientation();
  }
  double v38 = v31 * v34;
  self->_imageOrientation = v37;
  [(PLVideoView *)self->_videoView setPosterFrameImage:a3];
  [(PLExpandableImageView *)self->_imageView setImage:a3 isFullscreen:(*((unsigned char *)self + 1345) & 1) == 0];
  [(PLPhotoTileViewController *)self updateZoomScales];
  if ((*((unsigned char *)self + 1345) & 0x20) != 0)
  {
    double v39 = v38 / width;
    *(float *)&double v39 = v38 / width;
    [(PLPhotoTileViewController *)self setZoomScale:v39];
    if (!imageView) {
      goto LABEL_26;
    }
  }
  else
  {
    if (self->_image) {
      [(PLPhotoTileViewController *)self _setDefaultZoomScale];
    }
    if (!imageView) {
      goto LABEL_26;
    }
  }
  if (![(PLPhotoTileViewController *)self _clientIsWallpaper] && *((char *)self + 1345) < 0)
  {
    double v41 = v33 * v34;
    if (v38 <= 0.0) {
      double v42 = *MEMORY[0x1E4F1DB30];
    }
    else {
      double v42 = v24 / v38;
    }
    if (v41 <= 0.0) {
      double v43 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else {
      double v43 = v26 / v41;
    }
    [(PLImageScrollView *)self->_scrollView zoomScale];
    *(float *)&double v44 = v44;
    -[PLImageScrollView setContentOffset:](self->_scrollView, "setContentOffset:", v42 * (width * *(float *)&v44), v43 * (height * *(float *)&v44));
    if (!v5) {
      return;
    }
    goto LABEL_30;
  }
LABEL_26:
  if ([(PLPhotoTileViewController *)self _clientIsWallpaper] || self->_mode == 1) {
    [(PLPhotoTileViewController *)self _centerImageInScrollView];
  }
  if (v5)
  {
LABEL_30:
    if (v13 != *MEMORY[0x1E4F1DB30] || v47 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      double v40 = self->_imageView;
      -[PLExpandableImageView setFrame:](v40, "setFrame:", v46, v45, v13, v47);
    }
  }
}

- (void)_updateModelPhotoWithImage:(id)a3
{
  if ([(PLPhotoTileViewController *)self photoShouldHaveHDRBadge]) {
    [(PLPhotoTileViewController *)self _setupBadgeView];
  }
  if ([(PLPhotoTileViewController *)self photoShouldHaveAvalancheBadge]) {
    [(PLPhotoTileViewController *)self _setupBadgeView];
  }
  if (self->_reviewing)
  {
    [(PLPhotoTileViewController *)self _updateReviewCheckmark];
  }
}

- (void)setShouldHideProgressIndicator:(BOOL)a3
{
  if (self->_shouldHideProgressIndicator != a3)
  {
    self->_shouldHideProgressIndicator = a3;
    [(PLPhotoTileViewController *)self _updatePlaceholderVisibility];
  }
}

- (void)_updatePlaceholderVisibility
{
  if ([(PLPhotoTileViewController *)self shouldHideProgressIndicator]
    || (*((unsigned char *)self + 1345) & 4) != 0)
  {
    uint64_t v3 = 1;
  }
  else
  {
    uint64_t v3 = [(PLImageScrollView *)self->_scrollView isDragging];
  }
  placeholderView = self->_placeholderView;
  [(PLTilePlaceholderView *)placeholderView setHidden:v3];
}

- (void)_updatePlaceholderImageRect
{
  placeholderView = self->_placeholderView;
  if (placeholderView)
  {
    [(PLExpandableImageView *)self->_imageView frame];
    -[PLTilePlaceholderView convertRect:fromView:](placeholderView, "convertRect:fromView:", self->_scrollView);
    -[PLTilePlaceholderView setImageRect:](placeholderView, "setImageRect:");
  }
}

- (void)_updateContentInset
{
  if ([(PLPhotoTileViewController *)self _clientIsWallpaper])
  {
    p_scrollView = &self->_scrollView;
    [(PLImageScrollView *)self->_scrollView bounds];
    double v5 = v4;
    double v7 = v6;
    [(PLImageScrollView *)self->_scrollView contentSize];
    double v9 = v8;
    double v11 = v7 - v10;
    BOOL v12 = v7 <= v10;
    double v13 = 0.0;
    if (v12) {
      double v11 = 0.0;
    }
    if (v11 < 110.0) {
      double v11 = 110.0;
    }
    if (v5 > v9) {
      double v13 = v5 - v9;
    }
    double v14 = v11;
    double v15 = v13;
  }
  else
  {
    if (![(PLPhotoTileViewController *)self isViewLoaded]) {
      return;
    }
    p_scrollView = &self->_scrollView;
    if (!self->_scrollView) {
      return;
    }
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "bounds");
    CGFloat v46 = v17;
    CGFloat v47 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    if (CGRectIsEmpty(self->_cropOverlayRect))
    {
      [(PLImageScrollView *)*p_scrollView safeAreaInsets];
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
    }
    else
    {
      objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "convertRect:fromView:", objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "superview"), self->_cropOverlayRect.origin.x, self->_cropOverlayRect.origin.y, self->_cropOverlayRect.size.width, self->_cropOverlayRect.size.height);
      CGFloat x = v49.origin.x;
      CGFloat y = v49.origin.y;
      CGFloat width = v49.size.width;
      CGFloat height = v49.size.height;
      double MinX = CGRectGetMinX(v49);
      v50.origin.CGFloat x = v47;
      v50.origin.CGFloat y = v46;
      v50.size.CGFloat width = v19;
      v50.size.CGFloat height = v21;
      double v44 = MinX - CGRectGetMinX(v50);
      v51.origin.CGFloat x = v47;
      v51.origin.CGFloat y = v46;
      v51.size.CGFloat width = v19;
      v51.size.CGFloat height = v21;
      CGFloat rect = width;
      double MaxX = CGRectGetMaxX(v51);
      v52.origin.CGFloat x = x;
      v52.origin.CGFloat y = y;
      v52.size.CGFloat width = width;
      v52.size.CGFloat height = height;
      double v43 = MaxX - CGRectGetMaxX(v52);
      v53.origin.CGFloat x = x;
      v53.origin.CGFloat y = y;
      v53.size.CGFloat width = width;
      v53.size.CGFloat height = height;
      double MinY = CGRectGetMinY(v53);
      v54.origin.CGFloat x = v47;
      v54.origin.CGFloat y = v46;
      v54.size.CGFloat width = v19;
      v54.size.CGFloat height = v21;
      double v23 = MinY - CGRectGetMinY(v54);
      v55.origin.CGFloat x = v47;
      v55.origin.CGFloat y = v46;
      v55.size.CGFloat width = v19;
      v55.size.CGFloat height = v21;
      double MaxY = CGRectGetMaxY(v55);
      double v25 = v44;
      v56.origin.CGFloat x = x;
      v56.origin.CGFloat y = y;
      v56.size.CGFloat width = width;
      v56.size.CGFloat height = height;
      double v27 = MaxY - CGRectGetMaxY(v56);
      double v29 = v43;
    }
    [(PLPhotoTileViewController *)self overlayInsets];
    double v11 = v23 + v36;
    double v13 = v25 + v37;
    double v14 = v27 + v38;
    double v15 = v29 + v39;
  }
  double v40 = *p_scrollView;
  -[PLImageScrollView setContentInset:](v40, "setContentInset:", v11, v13, v14, v15);
}

- (void)_adjustScrollViewContentOffsetForInsets
{
  [(PLImageScrollView *)self->_scrollView zoomScale];
  double v4 = v3;
  double v5 = v3 * self->_imageSize.height;
  [(PLImageScrollView *)self->_scrollView frame];
  double v7 = v6;
  double v8 = v4 * self->_imageSize.width;
  [(PLImageScrollView *)self->_scrollView frame];
  double v10 = v9;
  [(PLImageScrollView *)self->_scrollView contentOffset];
  double v12 = v11;
  double v14 = v13;
  BOOL v15 = v7 <= v5;
  double v16 = v13;
  if (!v15)
  {
    char v17 = *((unsigned char *)self + 1346);
    [(PLImageScrollView *)self->_scrollView contentInset];
    double v19 = rint(v18 * 0.5);
    if (v17) {
      double v16 = v14 - v19;
    }
    else {
      double v16 = v14 + v19;
    }
  }
  double v20 = v12;
  if (v10 > v8)
  {
    char v21 = *((unsigned char *)self + 1346);
    [(PLImageScrollView *)self->_scrollView contentInset];
    double v23 = rint(v22 * 0.5);
    if (v21) {
      double v20 = v12 - v23;
    }
    else {
      double v20 = v12 + v23;
    }
  }
  if (v12 != v20 || v14 != v16)
  {
    scrollView = self->_scrollView;
    -[PLImageScrollView setContentOffset:](scrollView, "setContentOffset:");
  }
}

- (void)_centerImageInScrollView
{
  [(PLImageScrollView *)self->_scrollView zoomScale];
  double v4 = v3 * self->_imageSize.width;
  double v5 = v3 * self->_imageSize.height;
  [(PLImageScrollView *)self->_scrollView contentSize];
  double v7 = v6;
  double v51 = v8;
  [(PLImageScrollView *)self->_scrollView bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [(PLImageScrollView *)self->_scrollView contentInset];
  double v48 = v17;
  double v49 = v18;
  BOOL zoomToFillInsteadOfToFit = self->_zoomToFillInsteadOfToFit;
  v55.origin.CGFloat x = v10;
  v55.origin.CGFloat y = v12;
  v55.size.CGFloat width = v14;
  v55.size.CGFloat height = v16;
  double Width = CGRectGetWidth(v55);
  v56.origin.CGFloat x = v10;
  v56.origin.CGFloat y = v12;
  v56.size.CGFloat width = v14;
  v56.size.CGFloat height = v16;
  double Height = CGRectGetHeight(v56);
  double v52 = v5;
  double v53 = v4;
  if (zoomToFillInsteadOfToFit)
  {
    BOOL v22 = v5 < Height;
    if (v4 < Width) {
      goto LABEL_3;
    }
LABEL_10:
    v59.origin.CGFloat x = v10;
    v59.origin.CGFloat y = v12;
    v59.size.CGFloat width = v14;
    v59.size.CGFloat height = v16;
    double v27 = CGRectGetWidth(v59);
    if (v7 < v27) {
      double v27 = v7;
    }
    double v50 = v27;
    double v24 = v51;
    if (!v22) {
      goto LABEL_6;
    }
LABEL_13:
    v60.origin.CGFloat x = v10;
    v60.origin.CGFloat y = v12;
    v60.size.CGFloat width = v14;
    v60.size.CGFloat height = v16;
    double v28 = CGRectGetHeight(v60);
    if (v24 >= v28) {
      double v26 = v24;
    }
    else {
      double v26 = v28;
    }
    goto LABEL_16;
  }
  BOOL v22 = v5 > Height;
  if (v4 <= Width) {
    goto LABEL_10;
  }
LABEL_3:
  v57.origin.CGFloat x = v10;
  v57.origin.CGFloat y = v12;
  v57.size.CGFloat width = v14;
  v57.size.CGFloat height = v16;
  double v23 = CGRectGetWidth(v57);
  if (v7 >= v23) {
    double v23 = v7;
  }
  double v50 = v23;
  double v24 = v51;
  if (v22) {
    goto LABEL_13;
  }
LABEL_6:
  v58.origin.CGFloat x = v10;
  v58.origin.CGFloat y = v12;
  v58.size.CGFloat width = v14;
  v58.size.CGFloat height = v16;
  double v25 = CGRectGetHeight(v58);
  if (v24 >= v25) {
    double v26 = v25;
  }
  else {
    double v26 = v24;
  }
LABEL_16:
  centerContentVerticallCGFloat y = self->_centerContentVertically;
  double v30 = (double *)MEMORY[0x1E4F1DAD8];
  v61.origin.CGFloat x = v10;
  v61.origin.CGFloat y = v12;
  v61.size.CGFloat width = v14;
  v61.size.CGFloat height = v16;
  if (CGRectGetWidth(v61) <= v7)
  {
    double v34 = *v30;
  }
  else
  {
    double v31 = rint(v49);
    BOOL v32 = [(PLPhotoTileViewController *)self _clientIsWallpaper];
    double v33 = rint(v31 * 0.5);
    if (v32) {
      double v34 = v33;
    }
    else {
      double v34 = v31;
    }
  }
  double v35 = v30[1];
  v62.origin.CGFloat x = v10;
  v62.origin.CGFloat y = v12;
  v62.size.CGFloat width = v14;
  v62.size.CGFloat height = v16;
  double v36 = CGRectGetHeight(v62) - v24;
  if (v36 <= 0.0)
  {
    double v37 = v52;
    double v38 = v50;
  }
  else
  {
    double v37 = v52;
    double v38 = v50;
    if (self->_centerContentVertically)
    {
      BOOL v39 = [(PLPhotoTileViewController *)self _clientIsWallpaper];
      float v40 = v36 * 0.5;
      double v41 = rint(v48);
      double v42 = rintf(v40);
      if (v41 <= v42) {
        double v42 = v41;
      }
      double v43 = rint(v36 * 0.5);
      if (v39) {
        double v35 = v43;
      }
      else {
        double v35 = v42;
      }
    }
  }
  double v44 = rint((v37 - v26) * 0.5);
  if (!centerContentVertically) {
    double v44 = 0.0;
  }
  double v45 = v44 - v35;
  double v46 = rint((v53 - v38) * 0.5) - v34;
  scrollView = self->_scrollView;
  -[PLImageScrollView setContentOffset:](scrollView, "setContentOffset:", v46, v45);
}

- (void)retryDownload
{
  *((unsigned char *)self + 1346) &= ~8u;
  [(PLPhotoTileViewController *)self cancelFullSizeImageRequest];
  [(PLPhotoTileViewController *)self _requestFullSizeImage];
}

- (void)_updatePlaceholderViewAnimated:(BOOL)a3
{
  int v4 = [(id)objc_opt_class() shouldShowPlaceholderForAsset:self->_modelPhoto];
  placeholderView = self->_placeholderView;
  if (v4)
  {
    if (!placeholderView)
    {
      objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "bounds");
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      if ([(PHAsset *)self->_modelPhoto isCloudPlaceholder])
      {
        if (!self->_currentTileDownloadFinished)
        {
          CGFloat v14 = -[PLPhotoTileCloudPlaceholderView initWithFrame:]([PLPhotoTileCloudPlaceholderView alloc], "initWithFrame:", v7, v9, v11, v13);
          self->_placeholderView = (PLTilePlaceholderView *)v14;
          [(PLPhotoTileCloudPlaceholderView *)v14 setAutoresizingMask:18];
          [(PLTilePlaceholderView *)self->_placeholderView setRetryDelegate:self];
        }
      }
      else
      {
        double v15 = -[PLPhotoTilePlaceholderView initWithFrame:]([PLPhotoTilePlaceholderView alloc], "initWithFrame:", v7, v9, v11, v13);
        self->_placeholderView = (PLTilePlaceholderView *)v15;
        [(PLPhotoTilePlaceholderView *)v15 setAutoresizingMask:18];
      }
      CGFloat v16 = self->_placeholderView;
      [(PLPhotoTileViewController *)self _installSubview:v16];
    }
  }
  else if (placeholderView)
  {
    [(PLPhotoTileViewController *)self _removePlaceholderView];
  }
}

- (void)updateCloudDownloadProgress:(double)a3
{
}

- (void)_updateSubviewOrdering
{
  double v3 = (void *)[(PLPhotoTileViewController *)self view];
  [v3 sendSubviewToBack:self->_scrollView];
  [v3 sendSubviewToBack:self->_videoView];
  objc_msgSend(v3, "bringSubviewToFront:", -[PLVideoView videoOverlayPlayButton](self->_videoView, "videoOverlayPlayButton"));
  objc_msgSend(v3, "bringSubviewToFront:", -[PLPhotoTileViewController _customCenterOverlay](self, "_customCenterOverlay"));
  [v3 bringSubviewToFront:self->_reviewCheckmarkImageView];
  placeholderView = self->_placeholderView;
  [v3 bringSubviewToFront:placeholderView];
}

- (void)_installSubview:(id)a3
{
  objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "addSubview:", a3);
  [(PLPhotoTileViewController *)self _updateSubviewOrdering];
}

- (void)_configureViews
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  if ([(PLPhotoTileViewController *)self isViewLoaded])
  {
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "bounds");
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    double v6 = self->_tileFrame.size.width;
    double v8 = self->_tileFrame.size.height;
  }
  if (*((char *)self + 1345) < 0 || !self->_videoView)
  {
    if (([(PHAsset *)self->_modelPhoto isVideo] & 1) != 0
      || ([(PHAsset *)self->_modelPhoto isStreamedVideo] & 1) != 0
      || ([(PHAsset *)self->_modelPhoto isAudio] & 1) != 0)
    {
      [(PLImageScrollView *)self->_scrollView removeFromSuperview];

      self->_scrollView = 0;
      videoView = self->_videoView;
      if (videoView)
      {
        uint64_t v10 = [(PLVideoView *)videoView superview];
        if (v10 != [(PLPhotoTileViewController *)self view]) {
          [(PLPhotoTileViewController *)self _installSubview:self->_videoView];
        }
        double v11 = self->_videoView;
        objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "frame");
        -[PLVideoView setFrame:](v11, "setFrame:");
      }
      double v12 = (PLImageScrollView *)[(PLPhotoTileViewController *)self view];
    }
    else
    {
      if (!self->_imageView)
      {
        double v13 = -[PLExpandableImageView initWithFrame:frameStyle:withBorder:]([PLExpandableImageView alloc], "initWithFrame:frameStyle:withBorder:", 1, 0, 0.0, 0.0, width, height);
        self->_imageView = v13;
        [(PLExpandableImageView *)v13 setUserInteractionEnabled:0];
      }
      if (self->_videoView) {
        -[PLExpandableImageView setVideoView:](self->_imageView, "setVideoView:");
      }
      scrollView = self->_scrollView;
      if (!scrollView)
      {
        double v15 = -[PLImageScrollView initWithFrame:]([PLImageScrollView alloc], "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v6, v8);
        self->_scrollView = v15;
        if ((*((char *)self + 1345) & 0x80000000) == 0)
        {
          [(PLExpandableImageView *)self->_imageView frame];
          -[PLImageScrollView setContentSize:](v15, "setContentSize:", v16, v17);
          [(PLImageScrollView *)self->_scrollView setAlwaysBounceVertical:1];
          [(PLImageScrollView *)self->_scrollView setAlwaysBounceHorizontal:1];
          double v15 = self->_scrollView;
        }
        [(PLImageScrollView *)v15 setAutoresizingMask:18];
        [(PLImageScrollView *)self->_scrollView setPreservesCenterDuringRotation:1];
        [(PLImageScrollView *)self->_scrollView setShowsHorizontalScrollIndicator:0];
        [(PLImageScrollView *)self->_scrollView setShowsVerticalScrollIndicator:0];
        [(PLImageScrollView *)self->_scrollView addSubview:self->_imageView];
        [(PLImageScrollView *)self->_scrollView setDelegate:self];
        [(PLImageScrollView *)self->_scrollView setBouncesZoom:1];
        [(PLImageScrollView *)self->_scrollView setContentInsetAdjustmentBehavior:2];
        [(PLPhotoTileViewController *)self _updateContentInset];
        scrollView = self->_scrollView;
      }
      uint64_t v18 = [(PLImageScrollView *)scrollView superview];
      if (v18 != [(PLPhotoTileViewController *)self view]) {
        [(PLPhotoTileViewController *)self _installSubview:self->_scrollView];
      }
      double v12 = self->_scrollView;
    }
    [(PLImageScrollView *)v12 addGestureRecognizer:self->_singleTapGestureRecognizer];
  }
  else if ([(PLPhotoTileViewController *)self isViewLoaded])
  {
    [(PLPhotoTileViewController *)self _installSubview:self->_videoView];
  }
  [(PLPhotoTileViewController *)self _updatePlaceholderViewAnimated:0];
}

- (void)setBadgeVisible:(BOOL)a3 animated:(BOOL)a4
{
  char v4 = *((unsigned char *)self + 1346);
  if (((((v4 & 0x40) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 64;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 1346) = v4 & 0xBF | v5;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __54__PLPhotoTileViewController_setBadgeVisible_animated___block_invoke;
    v6[3] = &unk_1E63D2660;
    v6[4] = self;
    if (a4) {
      [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:0.300000012];
    }
    else {
      [(PLPhotoTileViewController *)self _showBadgeViewIfAppropriate];
    }
  }
}

uint64_t __54__PLPhotoTileViewController_setBadgeVisible_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showBadgeViewIfAppropriate];
}

- (void)setBadgeVisible:(BOOL)a3
{
}

- (void)setAvalancheBadgesHidden:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 1346) = *((unsigned char *)self + 1346) & 0xDF | v3;
  [(PLPhotoTileViewController *)self _showBadgeViewIfAppropriate];
}

- (BOOL)photoShouldHaveAvalancheBadge
{
  BOOL v3 = [(PHAsset *)self->_modelPhoto representsBurst];
  if (v3) {
    LOBYTE(v3) = !self->_reviewing && (*((unsigned char *)self + 1346) & 0x20) == 0;
  }
  return v3;
}

- (BOOL)photoShouldHaveHDRBadge
{
  if ([(PHAsset *)self->_modelPhoto mediaType] != PHAssetMediaTypeImage) {
    return 0;
  }
  modelPhoto = self->_modelPhoto;
  return [(PHAsset *)modelPhoto isMediaSubtype:2];
}

- (void)setGesturesEnabled:(BOOL)a3
{
}

- (BOOL)gesturesEnabled
{
  return [(PLImageScrollView *)self->_scrollView isUserInteractionEnabled];
}

- (BOOL)allowsEditing
{
  tileDelegate = self->_tileDelegate;
  if (tileDelegate) {
    LOBYTE(tileDelegate) = [(PLPhotoTileViewControllerDelegate *)tileDelegate photoTileViewControllerAllowsEditing:self];
  }
  return (char)tileDelegate;
}

- (void)setClientIsWallpaper:(BOOL)a3
{
  self->_clientIsTemporarilyWallpaper = a3;
  self->_userDidAdjustWallpaper = 0;
  if (a3)
  {
    *((unsigned char *)self + 1345) |= 0x40u;
    [(PLImageScrollView *)self->_scrollView zoomScale];
    double v5 = v4;
    [(PLPhotoTileViewController *)self defaultZoomScale];
    *(float *)&double v6 = v5 / v6;
    if (*(float *)&v6 > 1.0) {
      self->_userDidAdjustWallpaper = 1;
    }
  }
  else
  {
    gradientView = self->_gradientView;
    if (gradientView) {
      [(UIImageView *)gradientView removeFromSuperview];
    }
  }
  [(PLPhotoTileViewController *)self _updateContentInset];
}

- (BOOL)_clientIsWallpaper
{
  return self->_mode == 2 || self->_clientIsTemporarilyWallpaper;
}

- (BOOL)userDidAdjustWallpaper
{
  return self->_userDidAdjustWallpaper;
}

- (void)setTVOut:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 1345) = *((unsigned char *)self + 1345) & 0xFD | v3;
}

- (BOOL)isTVOut
{
  return (*((unsigned __int8 *)self + 1345) >> 1) & 1;
}

- (void)setTileDelegate:(id)a3
{
  if (self->_tileDelegate != a3)
  {
    self->_tileDelegate = (PLPhotoTileViewControllerDelegate *)a3;
    self->_isLoadingFullSizeImage = 0;
    [(PLPhotoTileViewController *)self ensureFullSizeImageLoaded];
  }
}

- (id)tileDelegate
{
  return self->_tileDelegate;
}

- (void)showContentView
{
  [(PLVideoView *)self->_videoView setHidden:0];
  objc_msgSend(-[PLVideoView videoOverlayPlayButton](self->_videoView, "videoOverlayPlayButton"), "setHidden:", 0);
  scrollView = self->_scrollView;
  [(PLImageScrollView *)scrollView setHidden:0];
}

- (void)hideContentView
{
  [(PLVideoView *)self->_videoView setHidden:1];
  objc_msgSend(-[PLVideoView videoOverlayPlayButton](self->_videoView, "videoOverlayPlayButton"), "setHidden:", 1);
  scrollView = self->_scrollView;
  [(PLImageScrollView *)scrollView setHidden:1];
}

- (void)_setCustomCenterOverlay:(id)a3
{
  customCenterOverlaCGFloat y = self->__customCenterOverlay;
  if (customCenterOverlay != a3)
  {
    [(UIView *)customCenterOverlay removeFromSuperview];

    self->_customCenterOverlayConstraints = 0;
    self->__customCenterOverlaCGFloat y = (UIView *)a3;
    objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "addSubview:", self->__customCenterOverlay);
    [(PLPhotoTileViewController *)self _updateSubviewOrdering];
    double v6 = (void *)[(PLPhotoTileViewController *)self view];
    [v6 setNeedsUpdateConstraints];
  }
}

- (void)updateCenterOverlay
{
  if (objc_opt_respondsToSelector()) {
    uint64_t v3 = [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate photoTileViewControllerCustomCenterOverlay:self];
  }
  else {
    uint64_t v3 = 0;
  }
  [(PLPhotoTileViewController *)self _setCustomCenterOverlay:v3];
  if (objc_opt_respondsToSelector()) {
    int v4 = [(PLPhotoTileViewControllerDelegate *)self->_tileDelegate photoTileViewControllerCanShowCenterOverlay:self];
  }
  else {
    int v4 = 1;
  }
  videoView = self->_videoView;
  if (videoView) {
    [(PLVideoView *)self->_videoView setShowsPlayOverlay:(([(PLPhotoTileViewController *)self _customCenterOverlay] == 0) & ~[(PLVideoView *)videoView isPlaying]) & v4];
  }
  double v6 = [(PLPhotoTileViewController *)self _customCenterOverlay];
  [(UIView *)v6 setHidden:v4 ^ 1u];
}

- (void)setVideoView:(id)a3
{
  videoView = self->_videoView;
  if (videoView != a3)
  {
    [(PLVideoView *)videoView viewDidDisappear];
    [(PLVideoView *)self->_videoView setImageTile:0];
    [(PLVideoView *)self->_videoView removeFromSuperview];

    double v6 = (PLVideoView *)a3;
    self->_videoView = v6;
    [(PLVideoView *)v6 setImageTile:self];
    if (self->_videoView)
    {
      if ([(PLPhotoTileViewController *)self isViewLoaded])
      {
        [(PLPhotoTileViewController *)self _configureViews];
      }
    }
  }
}

- (id)videoView
{
  return self->_videoView;
}

- (id)scrollView
{
  return self->_scrollView;
}

- (id)_newCGImageBackedUIImageFromImage:(id)a3
{
  if ([a3 CGImage])
  {
    return a3;
  }
  else
  {
    id result = (id)PLCreateCGImageFromIOSurfaceBackedUIImage();
    if (result)
    {
      int v4 = (CGImage *)result;
      double v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A80]), "initWithCGImage:imageOrientation:", result, objc_msgSend(a3, "imageOrientation"));
      CGImageRelease(v4);
      return v5;
    }
  }
  return result;
}

- (id)image
{
  if ([(PHAsset *)self->_modelPhoto isVideo]) {
    imageView = [(PLVideoView *)self->_videoView previewImageView];
  }
  else {
    imageView = (UIImageView *)self->_imageView;
  }
  return [(UIImageView *)imageView image];
}

- (id)imageView
{
  return self->_imageView;
}

- (id)expandableImageView
{
  return self->_imageView;
}

- (void)forceZoomingGesturesEnabled
{
  if ((*((unsigned char *)self + 1345) & 0x10) != 0) {
    [(PLPhotoTileViewController *)self setZoomingGesturesEnabled:0];
  }
  [(PLPhotoTileViewController *)self setZoomingGesturesEnabled:1];
}

- (void)setZoomingGesturesEnabled:(BOOL)a3
{
  char v3 = *((unsigned char *)self + 1345);
  if (((((v3 & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v5 = 16;
    }
    else {
      char v5 = 0;
    }
    *((unsigned char *)self + 1345) = v3 & 0xEF | v5;
    scrollView = self->_scrollView;
    if (!scrollView) {
      scrollView = self->_videoView;
    }
    if (scrollView) {
      BOOL v7 = a3;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      [(UIGestureRecognizer *)self->_singleTapGestureRecognizer requireGestureRecognizerToFail:self->_doubleTapGestureRecognizer];
      [scrollView addGestureRecognizer:self->_doubleTapGestureRecognizer];
    }
    else
    {
      if (!scrollView) {
        return;
      }
      [(UIGestureRecognizer *)self->_singleTapGestureRecognizer removeFailureRequirement:self->_doubleTapGestureRecognizer];
      [scrollView removeGestureRecognizer:self->_doubleTapGestureRecognizer];
    }
    [(PLImageScrollView *)self->_scrollView setClipsToBounds:!v7];
    videoView = self->_videoView;
    [(PLVideoView *)videoView setClipsToBounds:!v7];
  }
}

- (void)setCropOverlayRect:(CGRect)a3 forCropRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  p_cropOverlayRect = &self->_cropOverlayRect;
  self->_cropOverlayRect = a3;
  if (CGRectIsEmpty(a4))
  {
    *((unsigned char *)self + 1346) &= ~0x10u;
    CGSize v10 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    self->_cropRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_cropRect.size = v10;
    float v11 = 1.0;
  }
  else
  {
    *((unsigned char *)self + 1346) |= 0x10u;
    self->_cropRect.origin.CGFloat x = x;
    self->_cropRect.origin.CGFloat y = y;
    self->_cropRect.size.double width = width;
    self->_cropRect.size.double height = height;
    double v12 = p_cropOverlayRect->size.height / height;
    if (v12 >= p_cropOverlayRect->size.width / width) {
      double v12 = p_cropOverlayRect->size.width / width;
    }
    float v11 = v12;
  }
  self->_cropRectZoomScale = v11;
  [(PLPhotoTileViewController *)self _updateContentInset];
}

- (void)setZoomScale:(float)a3
{
  *((unsigned char *)self + 1345) |= 0x40u;
  [(PLImageScrollView *)self->_scrollView setZoomScale:a3];
  [(PLPhotoTileViewController *)self _updatePlaceholderImageRect];
  *((unsigned char *)self + 1345) &= ~0x40u;
}

- (NSString)description
{
  v3.receiver = self;
  v3.super_class = (Class)PLPhotoTileViewController;
  return (NSString *)[NSString stringWithFormat:@"<%@ photo:%@", -[PLPhotoTileViewController description](&v3, sel_description), self->_modelPhoto];
}

- (void)setTileFrame:(CGRect)a3
{
  self->_tileFrame = a3;
}

- (CGRect)tileFrame
{
  double x = self->_tileFrame.origin.x;
  double y = self->_tileFrame.origin.y;
  double width = self->_tileFrame.size.width;
  double height = self->_tileFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setThumbnailImage:(id)a3
{
}

- (UIImage)thumbnailImage
{
  if (*((unsigned char *)self + 1345)) {
    return self->_image;
  }
  else {
    return 0;
  }
}

- (PHAsset)photo
{
  return self->_modelPhoto;
}

- (void)_updateVideoViewForModelPhoto
{
  int v3 = [(PHAsset *)self->_modelPhoto isVideo];
  modelPhoto = self->_modelPhoto;
  if (v3)
  {
    [(PHAsset *)modelPhoto isStreamedVideo];
    goto LABEL_3;
  }
  char v13 = [(PHAsset *)modelPhoto isAudio];
  int v14 = [(PHAsset *)self->_modelPhoto isStreamedVideo];
  if ((v13 & 1) != 0 || v14)
  {
LABEL_3:
    if ([(PLPhotoTileViewController *)self isViewLoaded])
    {
      objc_msgSend((id)-[PLPhotoTileViewController view](self, "view"), "bounds");
      double x = v5;
      double y = v7;
      double width = v9;
      double height = v11;
    }
    else
    {
      double x = self->_tileFrame.origin.x;
      double y = self->_tileFrame.origin.y;
      double width = self->_tileFrame.size.width;
      double height = self->_tileFrame.size.height;
    }
    [(PLVideoView *)self->_videoView setImageTile:0];
    [(PLVideoView *)self->_videoView removeFromSuperview];

    double v16 = -[PLVideoView initWithFrame:videoCameraImage:orientation:]([PLVideoView alloc], "initWithFrame:videoCameraImage:orientation:", [(PHAsset *)self->_modelPhoto pl_managedAsset], 1, x, y, width, height);
    self->_videoView = v16;
    [(PLVideoView *)v16 setAllowSlalomEditor:1];
    [(PLVideoView *)self->_videoView setImageTile:self];
    if (self->_image) {
      -[PLVideoView setPosterFrameImage:](self->_videoView, "setPosterFrameImage:");
    }
    [(PLVideoView *)self->_videoView setScrubberIsSubview:0];
    if ((*((unsigned char *)self + 1346) & 4) != 0)
    {
      videoView = self->_videoView;
      [(PLVideoView *)videoView viewWillAppear:1];
    }
    return;
  }
  double v15 = self->_videoView;
  if (v15)
  {
    objc_msgSend(-[PLVideoView videoOverlayPlayButton](v15, "videoOverlayPlayButton"), "removeFromSuperview");
    [(PLVideoView *)self->_videoView removeFromSuperview];

    self->_videoView = 0;
  }
}

- (void)_setPhoto:(id)a3
{
  modelPhoto = self->_modelPhoto;
  if (modelPhoto != a3)
  {

    self->_modelPhoto = (PHAsset *)a3;
    [(PLPhotoTileViewController *)self _updateVideoViewForModelPhoto];
    if (self->_modelPhoto)
    {
      [(PLPhotoTileViewController *)self _configureViews];
      if (self->_image) {
        -[PLExpandableImageView setImage:isFullscreen:](self->_imageView, "setImage:isFullscreen:");
      }
    }
    if (!self->_image)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        image = self->_image;
        uint64_t v7 = *((unsigned char *)self + 1345) & 1;
        [(PLPhotoTileViewController *)self _setImage:image isThumbnail:v7 preserveFrame:0];
      }
    }
  }
}

- (BOOL)tileIsOnScreen
{
  if (![(PLPhotoTileViewController *)self isViewLoaded]) {
    return 0;
  }
  int v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "windows");
  if (![v3 count]) {
    return 0;
  }
  uint64_t v4 = [v3 objectAtIndex:0];
  if (!v4) {
    return 0;
  }
  double v5 = (void *)v4;
  double v6 = (void *)[(PLPhotoTileViewController *)self view];
  [v5 bounds];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  [v6 bounds];
  objc_msgSend(v6, "convertRect:toView:", v5);
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  uint64_t v23 = v8;
  uint64_t v24 = v10;
  uint64_t v25 = v12;
  uint64_t v26 = v14;
  return CGRectIntersectsRect(*(CGRect *)&v23, *(CGRect *)&v16);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  [(PLPhotoTileViewController *)self cancelFullSizeImageRequest];

  [(PLTileContainerView *)self->_containerView clearBackReference];
  [(UIImageView *)self->_gradientView removeFromSuperview];

  [(PLImageScrollView *)self->_scrollView setDelegate:0];
  [(PLImageScrollView *)self->_scrollView removeFromSuperview];

  [(UIGestureRecognizer *)self->_singleTapGestureRecognizer removeTarget:self action:sel__handleSingleTap_];
  [(UIGestureRecognizer *)self->_singleTapGestureRecognizer setDelegate:0];

  [(UIGestureRecognizer *)self->_doubleTapGestureRecognizer removeTarget:self action:sel__handleDoubleTap_];
  [(UIGestureRecognizer *)self->_doubleTapGestureRecognizer setDelegate:0];

  [(PLExpandableImageView *)self->_imageView removeFromSuperview];
  [(PLExpandableImageView *)self->_imageView removeAllGestureRecognizers];

  [(PLVideoView *)self->_videoView removeFromSuperview];
  [(PLVideoView *)self->_videoView removeAllGestureRecognizers];

  int v3 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = (void *)MEMORY[0x1E4F43630];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43710] object:*MEMORY[0x1E4F43630]];
  double v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F43648] object:*v4];
  [(PLPhotoTileViewController *)self _teardownDispatchTimer];

  v6.receiver = self;
  v6.super_class = (Class)PLPhotoTileViewController;
  [(PLPhotoTileViewController *)&v6 dealloc];
}

- (void)_teardownDispatchTimer
{
  dispatchTimer = self->_dispatchTimer;
  if (dispatchTimer)
  {
    dispatch_source_cancel(dispatchTimer);
    dispatch_release((dispatch_object_t)self->_dispatchTimer);
    self->_dispatchTimer = 0;
  }
}

- (id)cachingImageManager
{
  id result = self->__cachingImageManager;
  if (!result)
  {
    id result = (id)objc_opt_new();
    self->__cachingImageManager = (PHCachingImageManager *)result;
  }
  return result;
}

- (PLPhotoTileViewController)initWithModelPhoto:(id)a3 thumbnailImage:(id)a4 size:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  [a4 imageOrientation];
  id result = -[PLPhotoTileViewController initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:](self, "initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:", a3, a4, 1, PLDeviceOrientationFromImageOrientation(), 1, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), width, height);
  *((unsigned char *)result + 1345) |= 0x80u;
  return result;
}

- (id)initForPageController
{
  id result = [(PLPhotoTileViewController *)self init];
  if (result)
  {
    *((unsigned char *)result + 1345) |= 0x80u;
    *((_DWORD *)result + 312) = 0;
  }
  return result;
}

- (PLPhotoTileViewController)initWithModelPhoto:(id)a3 image:(id)a4 frame:(CGRect)a5 isThumbnail:(BOOL)a6 imageOrientation:(int)a7 allowZoomToFill:(BOOL)a8 mode:(int)a9
{
  BOOL v11 = a6;
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v18 = [(PLPhotoTileViewController *)self init];
  uint64_t v19 = v18;
  if (v18)
  {
    v18->_allowZoomToFill = a8;
    *((unsigned char *)v18 + 1345) = *((unsigned char *)v18 + 1345) & 0x7F | ((a9 == 0) << 7);
    v18->_mode = a9;
    [(PLPhotoTileViewController *)v18 _setPhoto:a3];
    -[PLPhotoTileViewController setTileFrame:](v19, "setTileFrame:", x, y, width, height);
    [(PLPhotoTileViewController *)v19 _setImage:a4 isThumbnail:v11 preserveFrame:0];
    if (!v19->_videoView && !v19->_scrollView && v19->_image)
    {
      [(PLPhotoTileViewController *)v19 _configureViews];
      [(PLExpandableImageView *)v19->_imageView setImage:v19->_image];
    }
  }
  return v19;
}

- (PLPhotoTileViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PLPhotoTileViewController;
  double v2 = [(PLPhotoTileViewController *)&v7 init];
  int v3 = v2;
  if (v2)
  {
    v2->_allowZoomToFill = 1;
    v2->_forceNativeScreenScale = 0;
    v2->_centerContentVerticalldouble y = 1;
    *((unsigned char *)v2 + 1346) &= ~0x40u;
    uint64_t v4 = (UIGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v2 action:sel__handleSingleTap_];
    [(UIGestureRecognizer *)v4 setDelegate:v3];
    double v5 = (UIGestureRecognizer *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v3 action:sel__handleDoubleTap_];
    [(UIGestureRecognizer *)v5 setNumberOfTapsRequired:2];
    [(UIGestureRecognizer *)v5 setDelegate:v3];
    v3->_singleTapGestureRecognizer = v4;
    v3->_doubleTapGestureRecognizer = v5;
  }
  return v3;
}

- (void)setOverlayInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_overlayInsets.left
    || a3.top != self->_overlayInsets.top
    || a3.right != self->_overlayInsets.right
    || a3.bottom != self->_overlayInsets.bottom)
  {
    self->_overlayInsets = a3;
    [(PLPhotoTileViewController *)self _updateContentInset];
    [(PLPhotoTileViewController *)self _centerImageInScrollView];
  }
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

+ (id)newPhotoTileViewControllerWithFrame:(CGRect)a3 modelPhoto:(id)a4 mode:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = (id)objc_opt_new();
  [v11 setDeliveryMode:2];
  uint64_t v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F390D0], "defaultManager"), "synchronousImageForAsset:targetSize:contentMode:options:", a4, 0, v11, 160.0, 120.0);
  uint64_t v13 = [PLPhotoTileViewController alloc];
  return -[PLPhotoTileViewController initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:](v13, "initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:", a4, v12, 1, 1, 1, v5, x, y, width, height);
}

+ (id)newPhotoTileViewControllerWithFrame:(CGRect)a3 image:(id)a4 allowZoomToFill:(BOOL)a5 mode:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [a4 imageOrientation];
  uint64_t v13 = PLDeviceOrientationFromImageOrientation();
  uint64_t v14 = [PLPhotoTileViewController alloc];
  return -[PLPhotoTileViewController initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:](v14, "initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:", 0, a4, 0, v13, v7, v6, x, y, width, height);
}

+ (id)newPhotoTileViewControllerWithFrame:(CGRect)a3 imageRef:(CGImage *)a4 imageOrientation:(int64_t)a5 allowZoomToFill:(BOOL)a6 mode:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F42A80]) initWithCGImage:a4 imageOrientation:a5];
  uint64_t v14 = -[PLPhotoTileViewController initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:]([PLPhotoTileViewController alloc], "initWithModelPhoto:image:frame:isThumbnail:imageOrientation:allowZoomToFill:mode:", 0, v13, 0, PLDeviceOrientationFromImageOrientation(), v8, v7, x, y, width, height);

  return v14;
}

+ (CGSize)tvOutTileSize
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (*(double *)&__TVOutTileSize_0 == 0.0)
  {
    double v2 = objc_msgSend(MEMORY[0x1E4F42D90], "screens", *(double *)&__TVOutTileSize_0);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v13 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (v7 != (void *)[MEMORY[0x1E4F42D90] mainScreen])
          {
            if (v7)
            {
              [v7 bounds];
              __TVOutTileSize_0 = v8;
              __TVOutTileSize_1 = v9;
            }
            goto LABEL_13;
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
  }
LABEL_13:
  double v10 = *(double *)&__TVOutTileSize_0;
  double v11 = *(double *)&__TVOutTileSize_1;
  result.double height = v11;
  result.double width = v10;
  return result;
}

+ (CGSize)tileSize
{
  double v2 = *(double *)&__TileSize_0;
  if (*(double *)&__TileSize_0 == 0.0)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen", *(double *)&__TileSize_0), "bounds");
    double v4 = *(double *)&v3;
    __TileSize_1 = v3;
    double v2 = v5 + 40.0;
    *(double *)&__TileSize_0 = v5 + 40.0;
  }
  else
  {
    double v4 = *(double *)&__TileSize_1;
  }
  result.double height = v4;
  result.double width = v2;
  return result;
}

+ (BOOL)shouldShowPlaceholderForAsset:(id)a3
{
  if (a3)
  {
    if (([a3 isCloudPlaceholder] & 1) != 0
      || ![a3 complete]
      || (int v4 = [a3 isTimelapsePlaceholder]) != 0)
    {
      [MEMORY[0x1E4F42D90] mainScreen];
      PHFullScreenSizeForScreen();
      double v6 = v5;
      double v8 = v7;
      uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "pl_managedAsset"), "masterThumbnailResource");
      LOBYTE(v4) = (int)[v9 localAvailability] < 1
                || v6 >= (double)[v9 orientedWidth]
                || v8 >= (double)[v9 orientedHeight];
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

@end