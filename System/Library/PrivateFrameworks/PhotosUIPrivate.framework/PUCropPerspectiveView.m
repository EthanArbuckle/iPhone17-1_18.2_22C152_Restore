@interface PUCropPerspectiveView
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isMuted;
- (CALayer)imageLayer;
- (CATransform3D)_imageOrientationTransform;
- (CATransform3D)_imageOrientationTransformWithoutTranslation;
- (CGAffineTransform)_modelSpaceToViewSpaceTransformWithModelCropRect:(SEL)a3 currentViewCropRect:(CGRect)a4;
- (CGAffineTransform)imageOrientedViewCropTransform;
- (CGImage)gainMapImage;
- (CGPoint)imagePointForViewPoint:(CGPoint)a3;
- (CGRect)_croppingRect;
- (CGRect)_fullCropRect;
- (CGRect)_modelCropRectUnorientedInUICoords;
- (CGRect)imageCropRect;
- (CGRect)imageCropRectForViewRect:(CGRect)a3;
- (CGRect)imageOrientedViewCropRect:(CGRect)a3;
- (CGRect)validateViewCropRectAgainstModelCropRect:(CGRect)a3;
- (CGRect)viewCropRectForImageRect:(CGRect)a3;
- (CGRect)viewOrientedViewCropRect:(CGRect)a3;
- (CGSize)_sizeRotatedIfNeeded:(CGSize)a3;
- (CGSize)masterImageSize;
- (PUCropPerspectiveView)initWithFrame:(CGRect)a3;
- (double)_viewScaleWithModelCropRect:(CGRect)a3;
- (double)_zoomScaleForCurrentCropRectAndModelRect;
- (double)_zoomScaleForModelCropRect:(CGRect)a3;
- (float)gainMapValue;
- (id)_animateValueFromValue:(double)a3 toValue:(double)a4 interpolation:(id)a5 completion:(id)a6;
- (id)cropModel;
- (void)_invalidateImageLayerModulator;
- (void)_invalidateImageModulationManager;
- (void)_resetCropRect;
- (void)_setCropModel:(id)a3;
- (void)_setupMediaWithComposition:(id)a3;
- (void)_updateImageModulation;
- (void)dealloc;
- (void)didBeginTrackingWithCropGestureHandler:(id)a3;
- (void)didChangeIsPerformingLiveInteraction:(BOOL)a3;
- (void)didEndTrackingWithCropGestureHandler:(id)a3;
- (void)didTrackWithCropGestureHandler:(id)a3;
- (void)handlePanGesture:(id)a3;
- (void)handlePinchGesture:(id)a3;
- (void)layoutSubviews;
- (void)mediaViewDidFinishRendering:(id)a3;
- (void)setAutoloopComposition:(id)a3;
- (void)setCanvasFrame:(CGRect)a3;
- (void)setGainMapImage:(CGImage *)a3;
- (void)setGainMapValue:(float)a3;
- (void)setImage:(id)a3;
- (void)setImageCropRectFromViewCropRect:(CGRect)a3 animated:(BOOL)a4;
- (void)setImageLayer:(id)a3;
- (void)setImageModulationOptions:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setModelCropRect:(CGRect)a3 viewCropRect:(CGRect)a4;
- (void)setMuted:(BOOL)a3;
- (void)setNeedsLayerTransformsUpdateAnimated:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setPitchAngle:(double)a3;
- (void)setShouldEnableImageModulation:(BOOL)a3;
- (void)setStraightenAngle:(double)a3;
- (void)setVideoComposition:(id)a3 withSeekTime:(id *)a4;
- (void)setYawAngle:(double)a3;
- (void)tearDownMediaViewAndLayers;
- (void)updateLayerTransformsAnimated:(BOOL)a3;
- (void)updateLayerTransformsAnimated:(BOOL)a3 viewCropRect:(CGRect)a4 modelCropRect:(CGRect)a5;
- (void)willBeginTrackingWithCropGestureHandler:(id)a3;
@end

@implementation PUCropPerspectiveView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_currentAnimation, 0);
  objc_storeStrong((id *)&self->_cropModel, 0);
  objc_storeStrong((id *)&self->_debugQuadLayer, 0);
  objc_storeStrong((id *)&self->_debugCropRectLayer, 0);
  objc_storeStrong((id *)&self->_debugViewRectLayer, 0);
  objc_storeStrong((id *)&self->_debugLayer, 0);
  objc_storeStrong((id *)&self->_mediaLayer, 0);
  objc_storeStrong((id *)&self->_mediaSuperlayer, 0);
  objc_storeStrong((id *)&self->_gestureHandler, 0);
  objc_storeStrong((id *)&self->_imageLayerModulator, 0);
  objc_storeStrong((id *)&self->_imageModulationManager, 0);
  objc_storeStrong((id *)&self->_imageGeometry, 0);
}

- (void)setImageLayer:(id)a3
{
}

- (CALayer)imageLayer
{
  return self->_imageLayer;
}

- (void)setGainMapValue:(float)a3
{
  self->_gainMapValue = a3;
}

- (float)gainMapValue
{
  return self->_gainMapValue;
}

- (CGImage)gainMapImage
{
  return self->_gainMapImage;
}

- (CGRect)imageCropRect
{
  double x = self->_imageCropRect.origin.x;
  double y = self->_imageCropRect.origin.y;
  double width = self->_imageCropRect.size.width;
  double height = self->_imageCropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)handlePinchGesture:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_isDebugging)
  {
    [v4 scale];
    printf(" handlePinchGesture:%.2f\n", v5);
    id v4 = v10;
  }
  uint64_t v6 = [v4 state];
  [v10 scale];
  double v8 = v7;
  if ((unint64_t)(v6 - 3) >= 3)
  {
    if (v6 == 2)
    {
      [(PUCropGestureHandler *)self->_gestureHandler zoomWithScale:v7];
    }
    else if (v6 == 1)
    {
      [(PUCropPerspectiveView *)self didChangeIsPerformingLiveInteraction:1];
      [(PUCropGestureHandler *)self->_gestureHandler beginZoom];
    }
  }
  else
  {
    v9 = [(PUCropTransformedImageView *)self delegate];
    [v9 cropTransformedImageViewWillEndTracking:self];

    [(PUCropGestureHandler *)self->_gestureHandler endZoomWithScale:v8];
    [(PUCropPerspectiveView *)self didChangeIsPerformingLiveInteraction:0];
  }
}

- (void)handlePanGesture:(id)a3
{
  id v4 = a3;
  [v4 translationInView:self];
  double v6 = v5;
  double v8 = v7;
  [v4 velocityInView:self];
  double v10 = v9;
  double v12 = v11;
  if (self->_isDebugging) {
    printf(" handlePanGesture:%.1f, %.1f\n", v6, v8);
  }
  uint64_t v13 = [v4 state];
  [(PUCropPerspectiveView *)self _croppingRect];
  double v15 = v14;
  double v17 = v16;
  [(PUCropTransformedImageView *)self imageSize];
  -[PUCropPerspectiveView _sizeRotatedIfNeeded:](self, "_sizeRotatedIfNeeded:");
  if (v18 < 1.0) {
    double v18 = 1.0;
  }
  double v20 = v15 / v18;
  if (v19 < 1.0) {
    double v19 = 1.0;
  }
  double v21 = v17 / v19;
  if (v20 >= v21) {
    CGFloat v22 = v20;
  }
  else {
    CGFloat v22 = v21;
  }
  [(PUCropTransformedImageView *)self imageSize];
  double v24 = v23;
  double v26 = v25;
  [(PUCropPerspectiveView *)self masterImageSize];
  if (v27 < 1.0) {
    double v27 = 1.0;
  }
  double v29 = v24 / v27;
  if (v28 < 1.0) {
    double v28 = 1.0;
  }
  double v30 = v26 / v28;
  if (v29 >= v30) {
    CGFloat v31 = v29;
  }
  else {
    CGFloat v31 = v30;
  }
  [(NUCropModel *)self->_cropModel cropRect];
  -[PUCropPerspectiveView _viewScaleWithModelCropRect:](self, "_viewScaleWithModelCropRect:");
  long long v32 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v47.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v47.m33 = v32;
  long long v33 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v47.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v47.m43 = v33;
  long long v34 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v47.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v47.m13 = v34;
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v47.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v47.m23 = v35;
  *(_OWORD *)&v46.m31 = *(_OWORD *)&v47.m31;
  *(_OWORD *)&v46.m33 = v32;
  *(_OWORD *)&v46.m41 = *(_OWORD *)&v47.m41;
  *(_OWORD *)&v46.m43 = v33;
  *(_OWORD *)&v46.m11 = *(_OWORD *)&v47.m11;
  *(_OWORD *)&v46.m13 = v34;
  *(_OWORD *)&v46.m21 = *(_OWORD *)&v47.m21;
  *(_OWORD *)&v46.m23 = v35;
  CATransform3DScale(&v47, &v46, v36, v36, 1.0);
  [(PUCropPerspectiveView *)self _imageOrientationTransform];
  CATransform3D b = v47;
  CATransform3DConcat(&v46, &a, &b);
  CATransform3D v47 = v46;
  CATransform3D b = v46;
  CATransform3DScale(&v46, &b, v22, v22, 1.0);
  CATransform3D v47 = v46;
  CATransform3D b = v46;
  CATransform3DScale(&v46, &b, v31, v31, 1.0);
  CATransform3D v47 = v46;
  memset(&v46, 0, sizeof(v46));
  CATransform3D b = v47;
  CATransform3DInvert(&v46, &b);
  double v37 = -(v8 * v46.m21) - v6 * v46.m11;
  double v38 = v8 * v46.m22 + v6 * v46.m12;
  double v39 = -(v12 * v46.m21) - v10 * v46.m11;
  double v40 = v12 * v46.m22 + v10 * v46.m12;
  if ((unint64_t)(v13 - 3) < 3)
  {
    v41 = [(PUCropTransformedImageView *)self delegate];
    [v41 cropTransformedImageViewWillEndTracking:self];

    -[PUCropGestureHandler endPanWithTranslation:velocity:](self->_gestureHandler, "endPanWithTranslation:velocity:", v37, v38, v39, v40);
    v42 = self;
    uint64_t v43 = 0;
LABEL_22:
    [(PUCropPerspectiveView *)v42 didChangeIsPerformingLiveInteraction:v43];
    goto LABEL_24;
  }
  if (v13 == 2)
  {
    -[PUCropGestureHandler panWithTranslation:velocity:](self->_gestureHandler, "panWithTranslation:velocity:", v37, v38, -(v12 * v46.m21) - v10 * v46.m11, v12 * v46.m22 + v10 * v46.m12);
    goto LABEL_24;
  }
  if (v13 == 1)
  {
    [(PUCropGestureHandler *)self->_gestureHandler beginPan];
    v42 = self;
    uint64_t v43 = 1;
    goto LABEL_22;
  }
LABEL_24:
}

- (void)didChangeIsPerformingLiveInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUCropTransformedImageView *)self delegate];
  [v5 cropTransformedImageView:self didChangeIsPerformingLiveInteraction:v3];
}

- (void)didEndTrackingWithCropGestureHandler:(id)a3
{
}

- (void)didTrackWithCropGestureHandler:(id)a3
{
  id v4 = [(PUCropTransformedImageView *)self delegate];
  [(PUCropPerspectiveView *)self updateLayerTransformsAnimated:0];
  [(PUCropTransformedImageView *)self _setTracking:1];
  [v4 cropTransformedImageViewDidTrack:self];
}

- (void)didBeginTrackingWithCropGestureHandler:(id)a3
{
}

- (void)willBeginTrackingWithCropGestureHandler:(id)a3
{
}

- (CGRect)_modelCropRectUnorientedInUICoords
{
  [(NUCropModel *)self->_cropModel cropRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PUCropTransformedImageView *)self _imageBounds];
  double v12 = v11 - v10 - v6;
  double v13 = v4;
  double v14 = v8;
  double v15 = v10;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v12;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_croppingRect
{
  [(PUCropTransformedImageView *)self cropRect];
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  if (CGRectIsEmpty(v16))
  {
    [(PUCropPerspectiveView *)self _fullCropRect];
    CGFloat x = v7;
    CGFloat y = v8;
    CGFloat width = v9;
    CGFloat height = v10;
  }
  double v11 = PURoundRectToPixel(x, y, width, height);
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)setImageCropRectFromViewCropRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  -[PUCropPerspectiveView imageCropRectForViewRect:](self, "imageCropRectForViewRect:");
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = v10;
  if (v15 <= 1.0 || v10 <= 1.0)
  {
    double v19 = (uint64_t *)MEMORY[0x1E4F7A750];
    if (*MEMORY[0x1E4F7A750] != -1) {
      dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24438);
    }
    double v20 = (os_log_t *)MEMORY[0x1E4F7A748];
    double v21 = (void *)*MEMORY[0x1E4F7A748];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7A748], OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v22 = NSString;
      double v23 = v21;
      double v24 = [v22 stringWithFormat:@"invalid imageRect"];
      *(_DWORD *)buf = 138543362;
      v88 = v24;
      _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_DEFAULT, "Continue: %{public}@", buf, 0xCu);

      uint64_t v25 = *v19;
      if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
      {
        if (v25 != -1) {
          dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24438);
        }
        goto LABEL_36;
      }
      if (v25 != -1) {
        dispatch_once(MEMORY[0x1E4F7A750], &__block_literal_global_24438);
      }
    }
    else if (dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]))
    {
LABEL_36:
      os_log_t v67 = *v20;
      if (!os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_44;
      }
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E4F7A308]);
      v69 = (void *)MEMORY[0x1E4F29060];
      id v70 = specific;
      v71 = v67;
      v72 = [v69 callStackSymbols];
      v73 = [v72 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543618;
      v88 = specific;
      __int16 v89 = 2114;
      v90 = v73;
      _os_log_error_impl(&dword_1AE9F8000, v71, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      goto LABEL_49;
    }
    os_log_t v75 = *v20;
    if (!os_log_type_enabled(*v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_44;
    }
    v78 = (void *)MEMORY[0x1E4F29060];
    v71 = v75;
    v79 = [v78 callStackSymbols];
    v80 = [v79 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v88 = v80;
    _os_log_error_impl(&dword_1AE9F8000, v71, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

LABEL_49:
LABEL_44:
    _NUAssertContinueHandler();
    v66 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      v97.origin.CGFloat x = x;
      v97.origin.CGFloat y = y;
      v97.size.CGFloat width = width;
      v97.size.CGFloat height = height;
      v76 = NSStringFromCGRect(v97);
      v98.origin.CGFloat x = v12;
      v98.origin.CGFloat y = v14;
      v98.size.CGFloat width = v16;
      v98.size.CGFloat height = v17;
      v77 = NSStringFromCGRect(v98);
      *(_DWORD *)buf = 138412546;
      v88 = v76;
      __int16 v89 = 2112;
      v90 = v77;
      _os_log_impl(&dword_1AE9F8000, v66, OS_LOG_TYPE_DEFAULT, "imageRect is near zero size. \nviewCropRect: %@ imageRect: %@", buf, 0x16u);
    }
    goto LABEL_46;
  }
  *(CGFloat *)v86 = x;
  *(CGFloat *)&v86[8] = y;
  *(CGFloat *)&v86[16] = width;
  *(CGFloat *)&v86[24] = height;
  [(NUCropModel *)self->_cropModel cropRect];
  double v30 = PURoundRectToPixel(v26, v27, v28, v29);
  uint64_t v32 = v31;
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  double v37 = PURoundRectToPixel(v12, v14, v16, v17);
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  double v44 = v30;
  uint64_t v45 = v32;
  uint64_t v46 = v34;
  uint64_t v47 = v36;
  if (!CGRectEqualToRect(*(CGRect *)&v44, *(CGRect *)&v37))
  {
    char v48 = -[NUCropModel imageContainsRect:withTol:](self->_cropModel, "imageContainsRect:withTol:", v12, v14, v16, v17, 0.000000953674316);
    v49 = "YES";
    if ((v48 & 1) == 0)
    {
      v93.origin.CGFloat x = v12;
      v93.origin.CGFloat y = v14;
      v93.size.CGFloat width = v16;
      v93.size.CGFloat height = v17;
      double MidX = CGRectGetMidX(v93);
      v94.origin.CGFloat x = v12;
      v94.origin.CGFloat y = v14;
      v94.size.CGFloat width = v16;
      v94.size.CGFloat height = v17;
      double MidY = CGRectGetMidY(v94);
      double v52 = 1.0;
      double v53 = 0.0;
      do
      {
        if (-[NUCropModel imageContainsRect:withTol:](self->_cropModel, "imageContainsRect:withTol:", MidX - v16 * ((v52 + v53) * 0.5) * 0.5, MidY - v17 * ((v52 + v53) * 0.5) * 0.5, v16 * ((v52 + v53) * 0.5), v17 * ((v52 + v53) * 0.5), 0.000000953674316))double v53 = (v52 + v53) * 0.5; {
        else
        }
          double v52 = (v52 + v53) * 0.5;
      }
      while (v52 - v53 >= 0.0000152587891);
      double v54 = (v52 + v53) * 0.5;
      double v16 = v16 * v54;
      double v17 = v17 * v54;
      double v12 = MidX - v16 * 0.5;
      double v14 = MidY - v17 * 0.5;
      v49 = "NO";
    }
    if (self->_isDebugging)
    {
      v84 = v49;
      NSStringFromCGRect(*(CGRect *)v86);
      id v85 = objc_claimAutoreleasedReturnValue();
      uint64_t v55 = [v85 UTF8String];
      if (v4) {
        v56 = "YES";
      }
      else {
        v56 = "NO";
      }
      v82 = v56;
      v83 = (const char *)v55;
      if ([(PUCropTransformedImageView *)self isTracking]) {
        v57 = "YES";
      }
      else {
        v57 = "NO";
      }
      v81 = v57;
      [(PUCropTransformedImageView *)self orientation];
      PLOrientationName();
      id v58 = objc_claimAutoreleasedReturnValue();
      v59 = (const char *)[v58 UTF8String];
      v95.origin.CGFloat x = v12;
      v95.origin.CGFloat y = v14;
      v95.size.CGFloat width = v16;
      v95.size.CGFloat height = v17;
      NSStringFromCGRect(v95);
      id v60 = objc_claimAutoreleasedReturnValue();
      v61 = (const char *)[v60 UTF8String];
      [(PUCropPerspectiveView *)self _croppingRect];
      NSStringFromCGRect(v96);
      id v62 = objc_claimAutoreleasedReturnValue();
      v63 = (const char *)[v62 UTF8String];
      NSStringFromCGRect(*(CGRect *)v86);
      id v64 = objc_claimAutoreleasedReturnValue();
      printf(" setImageCropRectFromViewCropRect: %s animated: %s\n  - isTracking = %s\n  - orientation = %s\n  - imageRect = %s\n  - croppingRect = %s\n  - cropRect = %s\n  - contained = %s\n", v83, v82, v81, v59, v61, v63, (const char *)[v64 UTF8String], v84);
    }
    if (v16 > 1.0 && v17 > 1.0)
    {
      -[PUCropPerspectiveView updateLayerTransformsAnimated:viewCropRect:modelCropRect:](self, "updateLayerTransformsAnimated:viewCropRect:modelCropRect:", v4, *(double *)v86, *(double *)&v86[8], *(double *)&v86[16], *(double *)&v86[24], v12, v14, v16, v17);
      [(NUCropModel *)self->_cropModel makeCurrentAspectRatioFreeForm];
      -[NUCropModel setCropRect:](self->_cropModel, "setCropRect:", v12, v14, v16, v17);
      cropModel = self->_cropModel;
      [(NUCropModel *)cropModel makeCurrentFreeFormAspectFixed];
      return;
    }
    v66 = PLUIGetLog();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v66, OS_LOG_TYPE_FAULT, "imageRect ended up empty", buf, 2u);
    }
LABEL_46:
  }
}

- (CGRect)validateViewCropRectAgainstModelCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_isDebugging)
  {
    NSStringFromCGRect(a3);
    id v8 = objc_claimAutoreleasedReturnValue();
    double v9 = (const char *)[v8 UTF8String];
    [(PUCropTransformedImageView *)self orientation];
    PLOrientationName();
    id v10 = objc_claimAutoreleasedReturnValue();
    double v11 = (const char *)[v10 UTF8String];
    [(NUCropModel *)self->_cropModel cropRect];
    NSStringFromCGRect(v69);
    id v12 = objc_claimAutoreleasedReturnValue();
    double v13 = (const char *)[v12 UTF8String];
    [(PUCropPerspectiveView *)self _croppingRect];
    NSStringFromCGRect(v70);
    id v14 = objc_claimAutoreleasedReturnValue();
    printf(" validateViewCropRectAgainstModelCropRect: %s\n  - orientation = %s\n  - imageRect = %s\n  - croppingRect = %s\n", v9, v11, v13, (const char *)[v14 UTF8String]);
  }
  [(PUCropPerspectiveView *)self _croppingRect];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  v71.origin.double x = x;
  v71.origin.double y = y;
  v71.size.double width = width;
  v71.size.double height = height;
  CGRect v76 = CGRectInset(v71, 0.25, 0.25);
  v72.origin.double x = v16;
  v72.origin.double y = v18;
  v72.size.double width = v20;
  v72.size.double height = v22;
  if (!CGRectContainsRect(v72, v76))
  {
    [(NUCropModel *)self->_cropModel cropRect];
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    -[PUCropPerspectiveView imageCropRectForViewRect:](self, "imageCropRectForViewRect:", x, y, width, height);
    double v67 = v32;
    double v68 = v31;
    double v65 = v34;
    double v66 = v33;
    if ((-[NUCropModel imageContainsRect:withTol:](self->_cropModel, "imageContainsRect:withTol:") & 1) == 0)
    {
      CGFloat v57 = v26;
      CGFloat v58 = v24;
      v73.origin.double x = v24;
      v73.origin.double y = v26;
      CGFloat v55 = v30;
      CGFloat v56 = v28;
      v73.size.double width = v28;
      v73.size.double height = v30;
      CGRect v74 = CGRectInset(v73, 0.1, 0.1);
      double v61 = v74.origin.y;
      double v62 = v74.origin.x;
      double v59 = v74.size.height;
      double v60 = v74.size.width;
      double v35 = 0.0;
      char v36 = 1;
      double v37 = 1.0;
      double v38 = 1.0;
      double v39 = 0.0;
      while (1)
      {
        double v40 = (v39 + v38) * 0.5;
        double v41 = (v36 & 1) != 0 ? (v39 + v38) * 0.5 : v39;
        double v42 = v37;
        double v43 = (v35 + v37) * 0.5;
        double v44 = (v36 & 1) != 0 ? v35 : (v35 + v37) * 0.5;
        double v45 = v66 * v41 + (1.0 - v41) * v60;
        double v46 = v65 * v44 + (1.0 - v44) * v59;
        double v63 = v67 * v44 + (1.0 - v44) * v61;
        double v64 = v68 * v41 + (1.0 - v41) * v62;
        if (-[NUCropModel imageContainsRect:withTol:](self->_cropModel, "imageContainsRect:withTol:", v64))break; {
        if (v36)
        }
        {
          double v38 = v40 * 0.1 + v38 * 0.9;
LABEL_18:
          double v37 = v42;
          goto LABEL_20;
        }
        double v37 = v43 * 0.1 + v42 * 0.9;
LABEL_20:
        v36 ^= 1u;
        if (v38 - v39 < 0.000000953674316 && v37 - v35 < 0.000000953674316)
        {
          if (v38 < 0.000000953674316 && v37 < 0.000000953674316)
          {
            double v45 = v56;
            double v63 = v57;
            double v64 = v58;
            double v46 = v55;
          }
          if (self->_isDebugging) {
            printf("  - mixX = (%f, %f)\n  - mixY = (%f, %f)\n", v39, v38, v35, v37);
          }
          -[PUCropPerspectiveView viewCropRectForImageRect:](self, "viewCropRectForImageRect:", v64, v63, v45, v46);
          double x = v47;
          double y = v48;
          double width = v49;
          double height = v50;
          goto LABEL_28;
        }
      }
      if (v36) {
        double v39 = v40 * 0.1 + v39 * 0.9;
      }
      else {
        double v35 = v43 * 0.1 + v35 * 0.9;
      }
      goto LABEL_18;
    }
  }
LABEL_28:
  double v51 = x;
  double v52 = y;
  double v53 = width;
  double v54 = height;
  result.size.double height = v54;
  result.size.double width = v53;
  result.origin.double y = v52;
  result.origin.double x = v51;
  return result;
}

- (CGPoint)imagePointForViewPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  memset(&v21, 0, sizeof(v21));
  [(NUCropModel *)self->_cropModel cropRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(PUCropPerspectiveView *)self _croppingRect];
  -[PUCropPerspectiveView _modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:](self, "_modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:", v5, v7, v9, v11, v12, v13, v14, v15);
  CGAffineTransformInvert(&v21, &v20);
  float64x2_t v16 = vaddq_f64(*(float64x2_t *)&v21.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v21.c, y), *(float64x2_t *)&v21.a, x));
  double v17 = v16.f64[1];
  result.double x = v16.f64[0];
  result.double y = v17;
  return result;
}

- (CGRect)imageCropRectForViewRect:(CGRect)a3
{
  -[PUCropPerspectiveView imageOrientedViewCropRect:](self, "imageOrientedViewCropRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double MinX = CGRectGetMinX(v18);
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v19);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v21);
  [(PUCropPerspectiveView *)self _croppingRect];
  -[PUCropPerspectiveView imageOrientedViewCropRect:](self, "imageOrientedViewCropRect:");
  memset(&v17, 0, sizeof(v17));
  [(NUCropModel *)self->_cropModel cropRect];
  -[PUCropPerspectiveView _modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:](self, "_modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:");
  CGAffineTransformInvert(&v17, &v16);
  double v12 = v17.tx + MaxY * v17.c + v17.a * MinX;
  double v13 = v17.ty + MaxY * v17.d + v17.b * MinX;
  double v14 = v17.tx + MinY * v17.c + v17.a * MaxX - v12;
  double v15 = v17.ty + MinY * v17.d + v17.b * MaxX - v13;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)viewCropRectForImageRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v17);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v18);
  [(PUCropPerspectiveView *)self _croppingRect];
  -[PUCropPerspectiveView imageOrientedViewCropRect:](self, "imageOrientedViewCropRect:");
  [(NUCropModel *)self->_cropModel cropRect];
  -[PUCropPerspectiveView _modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:](self, "_modelSpaceToViewSpaceTransformWithModelCropRect:currentViewCropRect:");
  -[PUCropPerspectiveView viewOrientedViewCropRect:](self, "viewOrientedViewCropRect:", MinY * 0.0 + 0.0 * MinX + 0.0, MaxY * 0.0 + 0.0 * MaxX + 0.0, MaxY * 0.0 + 0.0 * MaxX + 0.0 - (MinY * 0.0 + 0.0 * MinX + 0.0), MinY * 0.0 + 0.0 * MinX + 0.0 - (MaxY * 0.0 + 0.0 * MaxX + 0.0));
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)imageOrientedViewCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  memset(&v7[1], 0, sizeof(CGAffineTransform));
  [(PUCropPerspectiveView *)self imageOrientedViewCropTransform];
  v7[0] = v7[1];
  v8.origin.CGFloat x = x;
  v8.origin.CGFloat y = y;
  v8.size.CGFloat width = width;
  v8.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v8, v7);
}

- (CGRect)viewOrientedViewCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  memset(&v9, 0, sizeof(v9));
  [(PUCropPerspectiveView *)self imageOrientedViewCropTransform];
  CGAffineTransformInvert(&v9, &v8);
  CGAffineTransform v7 = v9;
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  return CGRectApplyAffineTransform(v10, &v7);
}

- (CGAffineTransform)imageOrientedViewCropTransform
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v32 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v33 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->CATransform3D a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v32;
  long long v31 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&retstr->tCGFloat x = v31;
  [(PUCropTransformedImageView *)self canvasFrame];
  CGFloat x = v51.origin.x;
  CGFloat y = v51.origin.y;
  double width = v51.size.width;
  double height = v51.size.height;
  double MidX = CGRectGetMidX(v51);
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.double width = width;
  v52.size.double height = height;
  double MidY = CGRectGetMidY(v52);
  CGRect result = [(PUCropTransformedImageView *)self orientation];
  switch((unint64_t)result)
  {
    case 2uLL:
      long long v13 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v13;
      *(_OWORD *)&v50.tCGFloat x = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      v45[0] = 0xBFF0000000000000;
      v45[1] = 0;
      v45[2] = 0;
      v45[3] = 0x3FF0000000000000;
      v45[4] = 0;
      v45[5] = 0;
      long long v14 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v14;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&retstr->tx;
      p_CGAffineTransform t1 = (long long *)v45;
      goto LABEL_9;
    case 3uLL:
      long long v16 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v16;
      *(_OWORD *)&v50.tCGFloat x = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      v47[0] = 0xBFF0000000000000;
      v47[1] = 0;
      v47[2] = 0;
      v47[3] = 0xBFF0000000000000;
      v47[4] = 0;
      v47[5] = 0;
      long long v17 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v17;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&retstr->tx;
      p_CGAffineTransform t1 = (long long *)v47;
      goto LABEL_9;
    case 4uLL:
      long long v18 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v18;
      *(_OWORD *)&v50.tCGFloat x = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      v44[0] = 0x3FF0000000000000;
      v44[1] = 0;
      v44[2] = 0;
      v44[3] = 0xBFF0000000000000;
      v44[4] = 0;
      v44[5] = 0;
      long long v19 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v19;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&retstr->tx;
      p_CGAffineTransform t1 = (long long *)v44;
      goto LABEL_9;
    case 5uLL:
      long long v20 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v20;
      *(_OWORD *)&v50.tCGFloat x = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      long long v34 = xmmword_1AEFF7B90;
      uint64_t v35 = 0x3FF0000000000000;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      long long v21 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v21;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&retstr->tx;
      p_CGAffineTransform t1 = &v34;
      goto LABEL_9;
    case 6uLL:
      *(_OWORD *)&v50.CATransform3D a = v33;
      *(_OWORD *)&v50.c = v32;
      *(_OWORD *)&v50.tCGFloat x = v31;
      double v22 = width / height;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      v49[0] = 0;
      *(double *)&v49[1] = -v22;
      *(double *)&v49[2] = v22;
      memset(&v49[3], 0, 24);
      long long v23 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v23;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&retstr->tx;
      p_CGAffineTransform t1 = (long long *)v49;
      goto LABEL_9;
    case 7uLL:
      long long v24 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v24;
      *(_OWORD *)&v50.tCGFloat x = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      long long v39 = xmmword_1AEFF7B80;
      unint64_t v40 = 0xBFF0000000000000;
      uint64_t v41 = 0;
      uint64_t v42 = 0;
      uint64_t v43 = 0;
      long long v25 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v25;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&retstr->tx;
      p_CGAffineTransform t1 = &v39;
      goto LABEL_9;
    case 8uLL:
      long long v26 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v50.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v50.c = v26;
      *(_OWORD *)&v50.tCGFloat x = *(_OWORD *)&retstr->tx;
      CGAffineTransformTranslate(retstr, &v50, MidX, MidY);
      t1.CATransform3D a = 0.0;
      t1.CATransform3D b = width / height;
      t1.c = -(width / height);
      memset(&t1.d, 0, 24);
      long long v27 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v27;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&retstr->tx;
      p_CGAffineTransform t1 = (long long *)&t1;
LABEL_9:
      CGAffineTransformConcat(&v50, (CGAffineTransform *)p_t1, &t2);
      long long v28 = *(_OWORD *)&v50.c;
      *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&v50.a;
      *(_OWORD *)&retstr->c = v28;
      *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v50.tx;
      long long v29 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.CATransform3D a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v29;
      *(_OWORD *)&t2.tCGFloat x = *(_OWORD *)&retstr->tx;
      CGRect result = CGAffineTransformTranslate(&v50, &t2, -MidX, -MidY);
      long long v30 = *(_OWORD *)&v50.c;
      *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&v50.a;
      *(_OWORD *)&retstr->c = v30;
      *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v50.tx;
      break;
    default:
      return result;
  }
  return result;
}

- (CGAffineTransform)_modelSpaceToViewSpaceTransformWithModelCropRect:(SEL)a3 currentViewCropRect:(CGRect)a4
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a4.origin.y;
  double v6 = a4.size.height;
  double v54 = a4.size.width;
  double x = a4.origin.x;
  [(PUCropTransformedImageView *)self _imageBounds];
  double v11 = v10;
  double v13 = v12;
  [(PUCropTransformedImageView *)self _imageBounds];
  PLRectGetCenter();
  double v59 = v15;
  double v60 = v14;
  [(PUCropPerspectiveView *)self masterImageSize];
  PLRectGetCenter();
  double v63 = v16;
  double v64 = v17;
  PLRectGetCenter();
  double v61 = v18;
  double v62 = v19;
  PLRectGetCenter();
  CGFloat v56 = v21;
  CGFloat v57 = v20;
  if (v11 >= 1.0) {
    double v22 = v11;
  }
  else {
    double v22 = 1.0;
  }
  double v23 = width / v22;
  if (v13 >= 1.0) {
    double v24 = v13;
  }
  else {
    double v24 = 1.0;
  }
  double v25 = height / v24;
  if (v23 >= v25) {
    CGFloat v26 = v23;
  }
  else {
    CGFloat v26 = v25;
  }
  [(PUCropPerspectiveView *)self masterImageSize];
  if (v27 < 1.0) {
    double v27 = 1.0;
  }
  double v29 = v11 / v27;
  if (v28 < 1.0) {
    double v28 = 1.0;
  }
  double v30 = v13 / v28;
  if (v29 >= v30) {
    CGFloat v31 = v29;
  }
  else {
    CGFloat v31 = v30;
  }
  -[PUCropPerspectiveView _viewScaleWithModelCropRect:](self, "_viewScaleWithModelCropRect:", x, y, v54, v6);
  CGFloat v33 = v32;
  uint64_t v34 = MEMORY[0x1E4F1DAB8];
  long long v35 = *MEMORY[0x1E4F1DAB8];
  long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->CATransform3D a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v36;
  long long v37 = *(_OWORD *)(v34 + 32);
  *(_OWORD *)&retstr->tdouble x = v37;
  *(_OWORD *)&v66.CATransform3D a = v35;
  *(_OWORD *)&v66.c = v36;
  *(_OWORD *)&v66.tdouble x = v37;
  CGAffineTransformTranslate(retstr, &v66, v57, v56);
  long long v38 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.CATransform3D a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v38;
  *(_OWORD *)&v65.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(&v66, &v65, v33, v33);
  long long v39 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v39;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v66.tx;
  long long v40 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.CATransform3D a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v40;
  *(_OWORD *)&v65.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(&v66, &v65, v26, v26);
  long long v41 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v41;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v66.tx;
  long long v42 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.CATransform3D a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v42;
  *(_OWORD *)&v65.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v66, &v65, -v60, -v59);
  long long v43 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v43;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v66.tx;
  long long v44 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.CATransform3D a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v44;
  *(_OWORD *)&v65.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(&v66, &v65, v31, v31);
  long long v45 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v45;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v66.tx;
  long long v46 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.CATransform3D a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v46;
  *(_OWORD *)&v65.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v66, &v65, -(v61 - v63), v62 - v64);
  long long v47 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v47;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v66.tx;
  [(PUCropPerspectiveView *)self masterImageSize];
  long long v48 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.CATransform3D a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v48;
  *(_OWORD *)&v65.tdouble x = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(&v66, &v65, 0.0, v49);
  long long v50 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v50;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v66.tx;
  long long v51 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v65.CATransform3D a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v65.c = v51;
  *(_OWORD *)&v65.tdouble x = *(_OWORD *)&retstr->tx;
  CGRect result = CGAffineTransformScale(&v66, &v65, 1.0, -1.0);
  long long v53 = *(_OWORD *)&v66.c;
  *(_OWORD *)&retstr->CATransform3D a = *(_OWORD *)&v66.a;
  *(_OWORD *)&retstr->c = v53;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&v66.tx;
  return result;
}

- (double)_viewScaleWithModelCropRect:(CGRect)a3
{
  -[PUCropPerspectiveView _zoomScaleForModelCropRect:](self, "_zoomScaleForModelCropRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  [(PUCropGestureHandler *)self->_gestureHandler zoomOverflow];
  return v5 + v6;
}

- (double)_zoomScaleForCurrentCropRectAndModelRect
{
  [(NUCropModel *)self->_cropModel cropRect];
  -[PUCropPerspectiveView _zoomScaleForModelCropRect:](self, "_zoomScaleForModelCropRect:");
  return result;
}

- (double)_zoomScaleForModelCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(PUCropPerspectiveView *)self masterImageSize];
  double v7 = 1.0;
  if (width >= 1.0) {
    double v8 = width;
  }
  else {
    double v8 = 1.0;
  }
  double result = v5 / v8;
  if (height >= 1.0) {
    double v7 = height;
  }
  double v10 = v6 / v7;
  if (result >= v10) {
    return v10;
  }
  return result;
}

- (CGRect)_fullCropRect
{
  [(PUCropTransformedImageView *)self _imageBounds];
  double v4 = v3;
  double v6 = v5;
  [(PUCropTransformedImageView *)self canvasFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  -[PUCropPerspectiveView _sizeRotatedIfNeeded:](self, "_sizeRotatedIfNeeded:", v4, v6);
  double v17 = PURectWithSizeThatFitsInRect(v15, v16, v8, v10, v12, v14);
  double v21 = PURoundRectToPixel(v17, v18, v19, v20);
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (void)setGainMapImage:(CGImage *)a3
{
  gainMapImage = self->_gainMapImage;
  if (gainMapImage != a3)
  {
    CGImageRelease(gainMapImage);
    self->_gainMapImage = CGImageRetain(a3);
    [(PUCropPerspectiveView *)self _updateImageModulation];
  }
}

- (void)_updateImageModulation
{
  v2 = self;
  if ([(PUCropTransformedImageView *)v2 shouldEnableImageModulation])
  {
    double v3 = v2->_imageModulationManager;
    if (!v3)
    {
      double v4 = [(PUCropPerspectiveView *)v2 window];
      objc_msgSend(v4, "px_imageModulationManager");
      double v3 = (PXImageModulationManager *)objc_claimAutoreleasedReturnValue();

      objc_storeStrong((id *)&v2->_imageModulationManager, v3);
    }
    double v5 = v2->_imageLayerModulator;
    if (!v5)
    {
      uint64_t v6 = [(PUCropTransformedImageView *)v2 imageModulationOptions];
      -[PXImageModulationManager checkoutImageLayerModulatorWithOptions:](v3, "checkoutImageLayerModulatorWithOptions:", v6, v7);
      double v5 = (PXImageLayerModulator *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v2->_imageLayerModulator, v5);
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__PUCropPerspectiveView__updateImageModulation__block_invoke;
    v8[3] = &unk_1E5F2D330;
    v8[4] = v2;
    [(PXImageLayerModulator *)v5 performChanges:v8];
  }
}

void __47__PUCropPerspectiveView__updateImageModulation__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 816);
  id v4 = a2;
  [v4 setLayer:v3];
  [v4 setGainMapImage:*(void *)(*(void *)(a1 + 32) + 808)];
  [*(id *)(a1 + 32) gainMapValue];
  objc_msgSend(v4, "setGainMapValue:");
  [v4 setDisplayingOpaqueContent:0];
}

- (void)_invalidateImageLayerModulator
{
  imageLayerModulator = self->_imageLayerModulator;
  if (imageLayerModulator)
  {
    imageModulationManager = self->_imageModulationManager;
    uint64_t v6 = imageLayerModulator;
    [(PXImageModulationManager *)imageModulationManager checkInImageLayerModulator:v6];
    double v5 = self->_imageLayerModulator;
    self->_imageLayerModulator = 0;
  }
}

- (void)_invalidateImageModulationManager
{
  [(PUCropPerspectiveView *)self _invalidateImageLayerModulator];
  imageModulationManager = self->_imageModulationManager;
  self->_imageModulationManager = 0;
}

- (CGSize)_sizeRotatedIfNeeded:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  int v5 = [(PLImageGeometry *)self->_imageGeometry isSizeInverted];
  if (v5) {
    double v6 = height;
  }
  else {
    double v6 = width;
  }
  if (v5) {
    double v7 = width;
  }
  else {
    double v7 = height;
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)mediaViewDidFinishRendering:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t value = self->_cachedVideoSeekTime.value;
  unsigned int flags = self->_cachedVideoSeekTime.flags;
  int timescale = self->_cachedVideoSeekTime.timescale;
  if (flags)
  {
    int64_t epoch = self->_cachedVideoSeekTime.epoch;
    double v7 = [(PUCropTransformedImageView *)self videoMediaView];
    CGFloat v8 = [v7 player];
    int64_t v10 = value;
    int v11 = timescale;
    unsigned int v12 = flags;
    int64_t v13 = epoch;
    [v8 seekToTime:&v10 exact:1];

    uint64_t v9 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&self->_cachedVideoSeekTime.int64_t value = *MEMORY[0x1E4F1F9F8];
    self->_cachedVideoSeekTime.int64_t epoch = *(void *)(v9 + 16);
  }
  if ([v4 loopsVideoPlayback]) {
    [v4 _startVideoPlayback];
  }
  [(PUCropPerspectiveView *)self updateLayerTransformsAnimated:1];
}

- (void)setImageModulationOptions:(id)a3
{
  uint64_t v3 = *(void *)&a3.var1;
  int64_t var0 = a3.var0;
  if (a3.var0 != [(PUCropTransformedImageView *)self imageModulationOptions]
    || *(float *)&v3 != v6)
  {
    v7.receiver = self;
    v7.super_class = (Class)PUCropPerspectiveView;
    -[PUCropTransformedImageView setImageModulationOptions:](&v7, sel_setImageModulationOptions_, var0, v3);
    [(PUCropPerspectiveView *)self _invalidateImageLayerModulator];
    [(PUCropPerspectiveView *)self _updateImageModulation];
  }
}

- (void)setShouldEnableImageModulation:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCropPerspectiveView;
  [(PUCropTransformedImageView *)&v4 setShouldEnableImageModulation:a3];
  [(PUCropPerspectiveView *)self _invalidateImageLayerModulator];
  [(PUCropPerspectiveView *)self _updateImageModulation];
}

- (void)_setupMediaWithComposition:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PUCropPerspectiveView *)self tearDownMediaViewAndLayers];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F7A798]);
    [(PUCropTransformedImageView *)self canvasFrame];
    float v6 = objc_msgSend(v5, "initWithFrame:");
    [(PUCropTransformedImageView *)self setVideoMediaView:v6];
    objc_super v7 = [v6 _renderer];
    [v7 setDisplayType:2];

    [v6 setAutoresizingMask:18];
    [(PUCropPerspectiveView *)self addSubview:v6];
    [v6 setZoomScale:1.0];
    [v6 setVideoEnabled:1 animated:0];
    CGFloat v8 = [MEMORY[0x1E4F8A360] preGeometryFilter];
    v13[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    [v6 setPipelineFilters:v9];

    [v6 setComposition:v4];
    [v6 setMuted:self->_muted];
    [v6 setDelegate:self];
    int64_t v10 = [v6 _videoPlayerView];
    [(CALayer *)self->_mediaLayer removeFromSuperlayer];
    int v11 = [v10 layer];
    mediaLayer = self->_mediaLayer;
    self->_mediaLayer = v11;

    [(CALayer *)self->_mediaSuperlayer addSublayer:self->_mediaLayer];
    [(PUCropTransformedImageView *)self canvasFrame];
    objc_msgSend(v10, "setFrame:");
    [v6 removeFromSuperview];
  }
  [(PUCropPerspectiveView *)self setNeedsLayerTransformsUpdateAnimated:0];
}

- (void)tearDownMediaViewAndLayers
{
  [(PUCropGestureHandler *)self->_gestureHandler tearDown];
  uint64_t v3 = [(PUCropTransformedImageView *)self videoMediaView];

  if (v3)
  {
    id v4 = [(PUCropTransformedImageView *)self videoMediaView];
    id v5 = [v4 _videoPlayerView];
    [v5 dispose];

    [(PUCropTransformedImageView *)self setVideoMediaView:0];
    [(CALayer *)self->_mediaLayer removeFromSuperlayer];
    mediaLayer = self->_mediaLayer;
    self->_mediaLayer = 0;
  }
}

- (void)setVideoComposition:(id)a3 withSeekTime:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PUCropPerspectiveView;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  id v6 = a3;
  [(PUCropTransformedImageView *)&v9 setVideoComposition:v6 withSeekTime:&v8];
  -[PUCropPerspectiveView _setupMediaWithComposition:](self, "_setupMediaWithComposition:", v6, *(_OWORD *)&v8.var0, v8.var3);

  int64_t var3 = a4->var3;
  *(_OWORD *)&self->_cachedVideoSeekTime.int64_t value = *(_OWORD *)&a4->var0;
  self->_cachedVideoSeekTime.int64_t epoch = var3;
}

- (void)setAutoloopComposition:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PUCropPerspectiveView;
  id v4 = a3;
  [(PUCropTransformedImageView *)&v6 setAutoloopComposition:v4];
  -[PUCropPerspectiveView _setupMediaWithComposition:](self, "_setupMediaWithComposition:", v4, v6.receiver, v6.super_class);

  id v5 = [(PUCropTransformedImageView *)self videoMediaView];
  [v5 setLoopsVideoPlayback:1];
}

- (void)setImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setImageSize:](&v9, sel_setImageSize_);
  uint64_t v6 = [MEMORY[0x1E4F39CF8] disableActions];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(PUCropTransformedImageView *)self _imageBounds];
  -[CALayer setBounds:](self->_imageLayer, "setBounds:");
  objc_msgSend(MEMORY[0x1E4F8A880], "geometryWithInputSize:initialOrientation:", -[PUCropTransformedImageView orientation](self, "orientation"), width, height);
  objc_super v7 = (PLImageGeometry *)objc_claimAutoreleasedReturnValue();
  imageGeometrdouble y = self->_imageGeometry;
  self->_imageGeometrdouble y = v7;

  [(PUCropPerspectiveView *)self setNeedsLayerTransformsUpdateAnimated:0];
  [MEMORY[0x1E4F39CF8] setDisableActions:v6];
  [(PUCropPerspectiveView *)self _updateImageModulation];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(PUCropTransformedImageView *)self image];

  if (v5 != v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)PUCropPerspectiveView;
    [(PUCropTransformedImageView *)&v24 setImage:v4];
    uint64_t v6 = [MEMORY[0x1E4F39CF8] disableActions];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(PUCropTransformedImageView *)self _imageBounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    id v15 = v4;
    uint64_t v16 = (CGImage *)[v15 CGImage];
    [(CALayer *)self->_imageLayer setContents:v16];
    -[CALayer setBounds:](self->_imageLayer, "setBounds:", v8, v10, v12, v14);
    ColorSpace = CGImageGetColorSpace(v16);
    BOOL v18 = CGColorSpaceUsesITUR_2100TF(ColorSpace);
    [(CALayer *)self->_imageLayer setWantsExtendedDynamicRangeContent:v18 | CGColorSpaceUsesExtendedRange(ColorSpace)];
    CGFloat v19 = (void *)MEMORY[0x1E4F8A880];
    [v15 size];
    objc_msgSend(v19, "geometryWithInputSize:initialOrientation:", -[PUCropTransformedImageView orientation](self, "orientation"), v20, v21);
    double v22 = (PLImageGeometry *)objc_claimAutoreleasedReturnValue();
    imageGeometrdouble y = self->_imageGeometry;
    self->_imageGeometrdouble y = v22;

    [(PUCropPerspectiveView *)self setNeedsLayerTransformsUpdateAnimated:0];
    [MEMORY[0x1E4F39CF8] setDisableActions:v6];
    [(PUCropPerspectiveView *)self _updateImageModulation];
  }
}

- (id)cropModel
{
  return self->_cropModel;
}

- (void)_setCropModel:(id)a3
{
  double v17 = (NUCropModel *)a3;
  if (self->_cropModel != v17)
  {
    objc_storeStrong((id *)&self->_cropModel, a3);
    id v5 = [[PUCropGestureHandler alloc] initWithCropModel:v17];
    gestureHandler = self->_gestureHandler;
    self->_gestureHandler = v5;

    [(PUCropGestureHandler *)self->_gestureHandler setDelegate:self];
    [(PUCropPerspectiveView *)self masterImageSize];
    double v8 = v7;
    double v10 = v9;
    [(PUCropPerspectiveView *)self _croppingRect];
    -[PUCropPerspectiveView _sizeRotatedIfNeeded:](self, "_sizeRotatedIfNeeded:", v11, v12);
    if (v13 < 1.0) {
      double v13 = 1.0;
    }
    double v15 = v8 / v13;
    if (v14 < 1.0) {
      double v14 = 1.0;
    }
    double v16 = v10 / v14;
    if (v15 >= v16) {
      double v15 = v16;
    }
    [(PUCropGestureHandler *)self->_gestureHandler setMaximumZoomScale:v15];
    if (self->_isDebugging) {
      [(PUCropGestureHandler *)self->_gestureHandler setLoggingEnabled:1];
    }
  }
}

- (void)setOrientation:(int64_t)a3
{
  if ((PLOrientationIsValid() & 1) == 0)
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PUCropPerspectiveView.m" lineNumber:459 description:@"Orientation must be valid"];
  }
  int64_t v6 = [(PUCropTransformedImageView *)self orientation];
  if (v6 != a3)
  {
    int64_t v7 = v6;
    v24.receiver = self;
    v24.super_class = (Class)PUCropPerspectiveView;
    [(PUCropTransformedImageView *)&v24 setOrientation:a3];
    [(PLImageGeometry *)self->_imageGeometry setAppliedOrientation:a3];
    if ((a3 != 5 || v7 != 6) && (a3 != 6 || v7 != 5) && (a3 != 7 || v7 != 8) && (a3 != 8 || v7 != 7))
    {
      memset(&v23, 0, sizeof(v23));
      imageGeometrdouble y = self->_imageGeometry;
      if (imageGeometry) {
        [(PLImageGeometry *)imageGeometry transformFromOrientation:v7];
      }
      else {
        memset(&v23, 0, 32);
      }
      *(_OWORD *)&v23.tdouble x = 0uLL;
      [(PUCropTransformedImageView *)self canvasFrame];
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      [(PUCropPerspectiveView *)self _croppingRect];
      CGAffineTransform v22 = v23;
      CGRect v26 = CGRectApplyAffineTransform(v25, &v22);
      double v17 = PURectWithSizeThatFitsInRect(v26.size.width, v26.size.height, v10, v12, v14, v16);
      PURoundRectToPixel(v17, v18, v19, v20);
      [(NUCropModel *)self->_cropModel cropRect];
      -[PUCropPerspectiveView setModelCropRect:viewCropRect:](self, "setModelCropRect:viewCropRect:");
    }
    [(PUCropPerspectiveView *)self setNeedsLayerTransformsUpdateAnimated:0];
  }
}

- (void)setNeedsLayerTransformsUpdateAnimated:(BOOL)a3
{
  self->_needsLayerTransformUpdate = 1;
  self->_layerTransformUpdateAnimated |= a3;
  [(PUCropPerspectiveView *)self setNeedsLayout];
}

- (void)setStraightenAngle:(double)a3
{
  [(PUCropTransformedImageView *)self straightenAngle];
  double v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)PUCropPerspectiveView;
  [(PUCropTransformedImageView *)&v7 setStraightenAngle:a3];
  if (v6 != a3
    && (![(PUCropGestureHandler *)self->_gestureHandler gesture]
     || [(PUCropGestureHandler *)self->_gestureHandler gesture] == 2))
  {
    [(PUCropGestureHandler *)self->_gestureHandler setRollAngle:a3];
  }
}

- (void)setYawAngle:(double)a3
{
  [(PUCropTransformedImageView *)self yawAngle];
  double v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)PUCropPerspectiveView;
  [(PUCropTransformedImageView *)&v7 setYawAngle:a3];
  if (v6 != a3
    && (![(PUCropGestureHandler *)self->_gestureHandler gesture]
     || [(PUCropGestureHandler *)self->_gestureHandler gesture] == 3))
  {
    [(PUCropGestureHandler *)self->_gestureHandler setYawAngle:a3];
  }
}

- (void)setPitchAngle:(double)a3
{
  [(PUCropTransformedImageView *)self pitchAngle];
  double v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)PUCropPerspectiveView;
  [(PUCropTransformedImageView *)&v7 setPitchAngle:a3];
  if (v6 != a3
    && (![(PUCropGestureHandler *)self->_gestureHandler gesture]
     || [(PUCropGestureHandler *)self->_gestureHandler gesture] == 1))
  {
    [(PUCropGestureHandler *)self->_gestureHandler setPitchAngle:a3];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUCropPerspectiveView;
  [(PUCropPerspectiveView *)&v3 layoutSubviews];
  if (self->_needsLayerTransformUpdate)
  {
    self->_needsLayerTransformUpdate = 0;
    [(PUCropPerspectiveView *)self updateLayerTransformsAnimated:self->_layerTransformUpdateAnimated];
  }
}

- (void)setCanvasFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PUCropTransformedImageView *)self canvasFrame];
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  self->_needsLayerTransformUpdate |= !CGRectEqualToRect(v9, v10);
  v8.receiver = self;
  v8.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setCanvasFrame:](&v8, sel_setCanvasFrame_, x, y, width, height);
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (BOOL)isMuted
{
  return self->_muted;
}

- (void)setModelCropRect:(CGRect)a3 viewCropRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  if (self->_isDebugging)
  {
    NSStringFromCGRect(a3);
    id v13 = objc_claimAutoreleasedReturnValue();
    CGFloat v14 = (const char *)[v13 UTF8String];
    v17.origin.double x = x;
    v17.origin.double y = y;
    v17.size.double width = width;
    v17.size.double height = height;
    NSStringFromCGRect(v17);
    id v15 = objc_claimAutoreleasedReturnValue();
    printf(" setModelCropRect:%s viewCropRect:%s\n", v14, (const char *)[v15 UTF8String]);
  }
  -[NUCropModel setCropRect:](self->_cropModel, "setCropRect:", v11, v10, v9, v8);
  v16.receiver = self;
  v16.super_class = (Class)PUCropPerspectiveView;
  -[PUCropTransformedImageView setModelCropRect:viewCropRect:](&v16, sel_setModelCropRect_viewCropRect_, v11, v10, v9, v8, x, y, width, height);
}

- (void)_resetCropRect
{
  uint64_t v3 = [(NUCropModel *)self->_cropModel aspectRatio];
  uint64_t v5 = v4;
  [(NUCropModel *)self->_cropModel reset];
  -[NUCropModel setAspectRatio:](self->_cropModel, "setAspectRatio:", v3, v5);
  v8.receiver = self;
  v8.super_class = (Class)PUCropPerspectiveView;
  [(PUCropTransformedImageView *)&v8 setPitchAngle:0.0];
  v7.receiver = self;
  v7.super_class = (Class)PUCropPerspectiveView;
  [(PUCropTransformedImageView *)&v7 setYawAngle:0.0];
  v6.receiver = self;
  v6.super_class = (Class)PUCropPerspectiveView;
  [(PUCropTransformedImageView *)&v6 setStraightenAngle:0.0];
  [(PUCropGestureHandler *)self->_gestureHandler reset];
}

- (void)updateLayerTransformsAnimated:(BOOL)a3 viewCropRect:(CGRect)a4 modelCropRect:(CGRect)a5
{
  if (self->_needsUpdateLayerTransforms)
  {
    double height = a5.size.height;
    CGFloat width = a5.size.width;
    double y = a5.origin.y;
    double v8 = a4.size.height;
    double v9 = a4.size.width;
    CGFloat v10 = a4.origin.y;
    CGFloat v11 = a4.origin.x;
    BOOL v13 = self->_layerTransformUpdateAnimated || a3;
    self->_needsUpdateLayerTransforms = 0;
    double v99 = a5.origin.x;
    [(PUCropTransformedImageView *)self canvasFrame];
    PLRectGetCenter();
    double v86 = v14;
    double point = v15;
    PLRectGetCenter();
    uint64_t v82 = v17;
    uint64_t v83 = v16;
    [(NUCropModel *)self->_cropModel masterImageRect];
    PLRectGetCenter();
    CGFloat v90 = v18;
    CGFloat x = v19;
    PLRectGetCenter();
    CGFloat v96 = v20;
    CGFloat v94 = v21;
    [(PUCropTransformedImageView *)self imageSize];
    -[PUCropPerspectiveView _sizeRotatedIfNeeded:](self, "_sizeRotatedIfNeeded:");
    double v98 = width;
    if (v22 < 1.0) {
      double v22 = 1.0;
    }
    double v24 = v9 / v22;
    if (v23 < 1.0) {
      double v23 = 1.0;
    }
    double v25 = v8 / v23;
    if (v24 >= v25) {
      double v26 = v24;
    }
    else {
      double v26 = v25;
    }
    [(PUCropTransformedImageView *)self imageSize];
    CGFloat v89 = v8;
    CGFloat v87 = v11;
    CGFloat v88 = v10;
    double v28 = v27;
    CGFloat v29 = height;
    double v31 = v30;
    [(NUCropModel *)self->_cropModel masterImageSize];
    if (v32 < 1.0) {
      double v32 = 1.0;
    }
    double v34 = v28 / v32;
    if (v33 < 1.0) {
      double v33 = 1.0;
    }
    double v35 = v31 / v33;
    if (v34 >= v35) {
      double v36 = v34;
    }
    else {
      double v36 = v35;
    }
    -[PUCropPerspectiveView _viewScaleWithModelCropRect:](self, "_viewScaleWithModelCropRect:", v99, y, v98, height);
    double v38 = v37;
    if (self->_isDebugging)
    {
      long long v39 = "YES";
      if (!v13) {
        long long v39 = "NO";
      }
      v79 = v39;
      [(PUCropTransformedImageView *)self orientation];
      PLOrientationName();
      id v80 = objc_claimAutoreleasedReturnValue();
      v78 = (const char *)[v80 UTF8String];
      v113.origin.CGFloat x = v99;
      v113.origin.double y = y;
      v113.size.CGFloat width = v98;
      v113.size.double height = height;
      NSStringFromCGRect(v113);
      BOOL v81 = v13;
      id v40 = objc_claimAutoreleasedReturnValue();
      long long v41 = (const char *)[v40 UTF8String];
      v114.origin.CGFloat x = v87;
      v114.origin.double y = v88;
      v114.size.CGFloat width = v9;
      v114.size.double height = v89;
      NSStringFromCGRect(v114);
      id v42 = objc_claimAutoreleasedReturnValue();
      long long v43 = (const char *)[v42 UTF8String];
      v110.CGFloat x = v86;
      v110.double y = point;
      NSStringFromCGPoint(v110);
      id v44 = objc_claimAutoreleasedReturnValue();
      long long v45 = (const char *)[v44 UTF8String];
      v111.CGFloat x = v90;
      v111.double y = x;
      NSStringFromCGPoint(v111);
      id v46 = objc_claimAutoreleasedReturnValue();
      long long v47 = (const char *)[v46 UTF8String];
      v112.CGFloat x = v96;
      v112.double y = v94;
      NSStringFromCGPoint(v112);
      id v48 = objc_claimAutoreleasedReturnValue();
      printf(" updateLayerTransformsAnimated: %s\n  - orientation = %s\n  - modelCropRect: = %s\n  - croppingRect: = %s\n  - canvasFrameCenter: = %s\n  - imageCenter: = %s\n  - modelCropCenter: = %s\n  - uiCroppingRectToImageScale: = %f\n  - uiImageToMasterImageScale: = %f\n  - imageZoomScale: = %f\n\n", v79, v78, v41, v43, v45, v47, (const char *)[v48 UTF8String], v26,
        v36,
        v38);

      BOOL v13 = v81;
    }
    currentAnimation = self->_currentAnimation;
    if (currentAnimation)
    {
      [(_UIDynamicAnimation *)currentAnimation stop];
      long long v50 = self->_currentAnimation;
      self->_currentAnimation = 0;
    }
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __82__PUCropPerspectiveView_updateLayerTransformsAnimated_viewCropRect_modelCropRect___block_invoke;
    v109[3] = &unk_1E5F25180;
    double v51 = 0.0;
    v109[4] = self;
    if (!v13) {
      double v51 = 1.0;
    }
    *(double *)&v109[5] = v38;
    *(CGFloat *)&v109[6] = v96;
    *(CGFloat *)&v109[7] = v94;
    v109[8] = v83;
    v109[9] = v82;
    *(double *)&v109[10] = v26;
    *(double *)&v109[11] = v36;
    *(CGFloat *)&v109[12] = v90;
    *(CGFloat *)&v109[13] = x;
    v109[14] = 0x3FF0000000000000;
    *(CGFloat *)&v109[15] = v90;
    *(CGFloat *)&v109[16] = x;
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __82__PUCropPerspectiveView_updateLayerTransformsAnimated_viewCropRect_modelCropRect___block_invoke_2;
    v108[3] = &unk_1E5F251A8;
    v108[4] = self;
    *(double *)&v108[5] = v38;
    *(CGFloat *)&v108[6] = v96;
    *(CGFloat *)&v108[7] = v94;
    v108[8] = v83;
    v108[9] = v82;
    *(double *)&v108[10] = v26;
    CGRect v52 = [(PUCropPerspectiveView *)self _animateValueFromValue:v109 toValue:v108 interpolation:v51 completion:1.0];
    long long v53 = self->_currentAnimation;
    self->_currentAnimation = v52;

    if (self->_debugLayer)
    {
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:!v13];
      cropModel = self->_cropModel;
      [(NUCropModel *)cropModel pitchRadians];
      double v56 = v55;
      [(NUCropModel *)self->_cropModel yawRadians];
      double v58 = v57;
      [(NUCropModel *)self->_cropModel rollRadians];
      [(NUCropModel *)cropModel _getBoundingQuadFromPitch:v56 yaw:v58 roll:v59 withExpansionTol:0.00001];
      float64x2_t v95 = v61;
      CGPoint v97 = v60;
      CGPoint v91 = v62;
      xCATransform3D a = v63;
      Mutable = CGPathCreateMutable();
      float64x2_t v65 = vsubq_f64(vmaxnmq_f64(vmaxnmq_f64((float64x2_t)v97, (float64x2_t)v91), vmaxnmq_f64(v95, xa)), vminnmq_f64(vminnmq_f64((float64x2_t)v97, (float64x2_t)v91), vminnmq_f64(v95, xa)));
      CGFloat v66 = 400.0 / sqrt(vaddvq_f64(vmulq_f64(v65, v65)));
      __asm { FMOV            V1.2D, #0.25 }
      float64x2_t v84 = vmulq_f64(vaddq_f64(xa, vaddq_f64(v95, vaddq_f64((float64x2_t)v97, (float64x2_t)v91))), _Q1);
      CGPathMoveToPoint(Mutable, 0, v97.x, v97.y);
      CGPathAddLineToPoint(Mutable, 0, v91.x, v91.y);
      CGPathAddLineToPoint(Mutable, 0, xa.f64[0], xa.f64[1]);
      CGPathAddLineToPoint(Mutable, 0, v95.f64[0], v95.f64[1]);
      CGPathAddLineToPoint(Mutable, 0, v97.x, v97.y);
      CGPathCloseSubpath(Mutable);
      [(CAShapeLayer *)self->_debugQuadLayer setPath:Mutable];
      -[CAShapeLayer setPosition:](self->_debugQuadLayer, "setPosition:", -v84.f64[0], 300.0 - v84.f64[1]);
      CATransform3DMakeScale(&v107, 1.0, -1.0, 1.0);
      debugQuadLayer = self->_debugQuadLayer;
      CATransform3D v106 = v107;
      [(CAShapeLayer *)debugQuadLayer setTransform:&v106];
      CGPathRelease(Mutable);
      v115.size.CGFloat width = v98;
      v115.origin.CGFloat x = v99;
      v115.origin.double y = y;
      v115.size.double height = v29;
      CGRect v73 = CGPathCreateWithRect(v115, 0);
      [(CAShapeLayer *)self->_debugCropRectLayer setPath:v73];
      -[CAShapeLayer setPosition:](self->_debugCropRectLayer, "setPosition:", -v84.f64[0], 300.0 - v84.f64[1]);
      CATransform3DMakeScale(&v105, 1.0, -1.0, 1.0);
      debugCropRectLayer = self->_debugCropRectLayer;
      CATransform3D v104 = v105;
      [(CAShapeLayer *)debugCropRectLayer setTransform:&v104];
      CGPathRelease(v73);
      v116.origin.CGFloat x = v87;
      v116.origin.double y = v88;
      v116.size.CGFloat width = v9;
      v116.size.double height = v89;
      os_log_t v75 = CGPathCreateWithRect(v116, 0);
      [(CAShapeLayer *)self->_debugViewRectLayer setPath:v75];
      -[CAShapeLayer setPosition:](self->_debugViewRectLayer, "setPosition:", -v86 / v66, -point / v66);
      CATransform3DMakeScale(&v103, 1.0 / v66, 1.0 / v66, 1.0);
      debugViewRectLayer = self->_debugViewRectLayer;
      CATransform3D v102 = v103;
      [(CAShapeLayer *)debugViewRectLayer setTransform:&v102];
      CGPathRelease(v75);
      -[CALayer setPosition:](self->_debugLayer, "setPosition:", v86, point);
      [(CALayer *)self->_debugLayer setZPosition:6000.0];
      CATransform3DMakeScale(&v101, v66, v66, 1.0);
      debugLayer = self->_debugLayer;
      CATransform3D v100 = v101;
      [(CALayer *)debugLayer setTransform:&v100];
      [MEMORY[0x1E4F39CF8] commit];
    }
  }
}

uint64_t __82__PUCropPerspectiveView_updateLayerTransformsAnimated_viewCropRect_modelCropRect___block_invoke(uint64_t a1, double a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  double v5 = *(double *)(v4 + 712);
  [*(id *)(v4 + 696) pitchRadians];
  double v51 = v5 + a2 * (v6 - v5);
  uint64_t v7 = *(void *)(a1 + 32);
  double v8 = *(double *)(v7 + 720);
  [*(id *)(v7 + 696) yawRadians];
  double v10 = v8 + a2 * (v9 - v8);
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = *(double *)(v11 + 728);
  [*(id *)(v11 + 696) rollRadians];
  uint64_t v14 = *(void *)(a1 + 32);
  double v15 = v12 + a2 * (v13 - v12);
  CGFloat v16 = *(double *)(v14 + 736) + a2 * (*(double *)(a1 + 40) - *(double *)(v14 + 736));
  double v17 = *(double *)(v14 + 744);
  [*(id *)(v14 + 632) panRubberBandOffset];
  double v19 = v17 + a2 * (v18 - v17);
  uint64_t v20 = *(void *)(a1 + 32);
  double v21 = *(double *)(v20 + 752);
  [*(id *)(v20 + 632) panRubberBandOffset];
  double v23 = v21 + a2 * (v22 - v21);
  double v24 = *(double **)(a1 + 32);
  double v25 = v24[95] + a2 * (*(double *)(a1 + 48) - v24[95]);
  double v26 = v24[96] + a2 * (*(double *)(a1 + 56) - v24[96]);
  double v52 = v24[98] + a2 * (*(double *)(a1 + 72) - v24[98]);
  double v53 = v24[97] + a2 * (*(double *)(a1 + 64) - v24[97]);
  double v27 = v24[99] + a2 * (*(double *)(a1 + 80) - v24[99]);
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  *(_OWORD *)&v60.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v60.m33 = v28;
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  *(_OWORD *)&v60.m41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v60.m43 = v29;
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  *(_OWORD *)&v60.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v60.m13 = v30;
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  *(_OWORD *)&v60.m21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v60.m23 = v31;
  *(_OWORD *)&v59.m31 = *(_OWORD *)&v60.m31;
  *(_OWORD *)&v59.m33 = v28;
  *(_OWORD *)&v59.m41 = *(_OWORD *)&v60.m41;
  *(_OWORD *)&v59.m43 = v29;
  *(_OWORD *)&v59.m11 = *(_OWORD *)&v60.m11;
  *(_OWORD *)&v59.m13 = v30;
  *(_OWORD *)&v59.m21 = *(_OWORD *)&v60.m21;
  *(_OWORD *)&v59.m23 = v31;
  CATransform3DScale(&v60, &v59, v16, v16, 1.0);
  double v32 = *(void **)(a1 + 32);
  if (v32) {
    [v32 _imageOrientationTransformWithoutTranslation];
  }
  else {
    memset(&a, 0, sizeof(a));
  }
  CATransform3D b = v60;
  CATransform3DConcat(&v59, &a, &b);
  CATransform3D v60 = v59;
  CATransform3D b = v59;
  CATransform3DScale(&v59, &b, v27, v27, 1.0);
  CATransform3D v60 = v59;
  CGFloat v33 = *(double *)(a1 + 88);
  CATransform3D b = v59;
  CATransform3DScale(&v59, &b, v33, v33, 1.0);
  CATransform3D v60 = v59;
  double v34 = *(double *)(a1 + 112);
  CGFloat v35 = v34 * (-(v25 - *(double *)(a1 + 96)) - v19);
  CGFloat v36 = v34 * (v23 + v26 - *(double *)(a1 + 104));
  CATransform3D b = v59;
  CATransform3DTranslate(&v59, &b, v35, v36, 0.0);
  CATransform3D v60 = v59;
  CATransform3D b = v59;
  CATransform3DScale(&v59, &b, 1.0, -1.0, 1.0);
  CATransform3D v60 = v59;
  CGFloat v37 = -*(double *)(a1 + 120);
  CGFloat v38 = -*(double *)(a1 + 128);
  CATransform3D b = v59;
  CATransform3DTranslate(&v59, &b, v37, v38, 0.0);
  CATransform3D v60 = v59;
  long long v39 = (void *)MEMORY[0x1E4F7A418];
  [*(id *)(*(void *)(a1 + 32) + 696) masterImageRect];
  objc_msgSend(v39, "_imageTransformFromPitch:yaw:roll:imageRect:", v51, v10, v15, v40, v41, v42, v43);
  CATransform3D v56 = v55[1];
  CATransform3D b = v60;
  CATransform3DConcat(&v59, &v56, &b);
  CATransform3D v60 = v59;
  CGFloat v44 = *(double *)(a1 + 120);
  CGFloat v45 = *(double *)(a1 + 128);
  CATransform3D b = v59;
  CATransform3DTranslate(&v59, &b, v44, v45, 0.0);
  CATransform3D v60 = v59;
  CATransform3D b = v59;
  CATransform3DScale(&v59, &b, 1.0, -1.0, 1.0);
  CATransform3D v60 = v59;
  CGFloat v46 = 1.0 / *(double *)(a1 + 88);
  CATransform3D b = v59;
  CATransform3DScale(&v59, &b, v46, v46, 1.0);
  CATransform3D v60 = v59;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  long long v47 = *(void **)(*(void *)(a1 + 32) + 816);
  v55[0] = v60;
  [v47 setTransform:v55];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 816), "setPosition:", v53, v52);
  uint64_t v48 = *(void *)(a1 + 32);
  if (*(void *)(v48 + 656))
  {
    [*(id *)(v48 + 816) bounds];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 656), "setBounds:");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 656), "setPosition:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    uint64_t v48 = *(void *)(a1 + 32);
  }
  CGFloat v49 = *(void **)(v48 + 648);
  CATransform3D v54 = v60;
  [v49 setTransform:&v54];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 648), "setPosition:", v53, v52);
  return [MEMORY[0x1E4F39CF8] commit];
}

double __82__PUCropPerspectiveView_updateLayerTransformsAnimated_viewCropRect_modelCropRect___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 696) pitchRadians];
  *(void *)(*(void *)(a1 + 32) + 712) = v2;
  [*(id *)(*(void *)(a1 + 32) + 696) yawRadians];
  *(void *)(*(void *)(a1 + 32) + 720) = v3;
  [*(id *)(*(void *)(a1 + 32) + 696) rollRadians];
  *(void *)(*(void *)(a1 + 32) + 728) = v4;
  *(void *)(*(void *)(a1 + 32) + 736) = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = (void *)(v5 + 744);
  [*(id *)(v5 + 632) panRubberBandOffset];
  *double v6 = v7;
  v6[1] = v8;
  *(_OWORD *)(*(void *)(a1 + 32) + 760) = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(*(void *)(a1 + 32) + 776) = *(_OWORD *)(a1 + 64);
  double result = *(double *)(a1 + 80);
  *(double *)(*(void *)(a1 + 32) + 792) = result;
  *(unsigned char *)(*(void *)(a1 + 32) + 644) = 0;
  return result;
}

- (void)updateLayerTransformsAnimated:(BOOL)a3
{
  self->_needsUpdateLayerTransforms = 1;
  self->_needsUpdateLayerTransformsAnimated |= a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PUCropPerspectiveView_updateLayerTransformsAnimated___block_invoke;
  v3[3] = &unk_1E5F2E120;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __55__PUCropPerspectiveView_updateLayerTransformsAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  [v2 _croppingRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [*(id *)(*(void *)(a1 + 32) + 696) cropRect];
  return objc_msgSend(v2, "updateLayerTransformsAnimated:viewCropRect:modelCropRect:", v3, v5, v7, v9, v11, v12, v13, v14, v15);
}

- (id)_animateValueFromValue:(double)a3 toValue:(double)a4 interpolation:(id)a5 completion:(id)a6
{
  double v9 = (void (**)(void, double))a5;
  double v10 = (void (**)(id, uint64_t))a6;
  if (a3 == a4)
  {
    v9[2](v9, a4);
    if (v10) {
      v10[2](v10, 1);
    }
    double v11 = 0;
  }
  else
  {
    double v11 = objc_msgSend(MEMORY[0x1E4FB20E0], "pu_dynamicValueAnimationWithInitialValue:initialVelocity:targetValue:stiffness:dampingFactor:epsilon:", a3, 0.0, a4, 300.0, 1.0, 0.01);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81__PUCropPerspectiveView__animateValueFromValue_toValue_interpolation_completion___block_invoke;
    v17[3] = &unk_1E5F25130;
    double v18 = v9;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    void v13[2] = __81__PUCropPerspectiveView__animateValueFromValue_toValue_interpolation_completion___block_invoke_2;
    v13[3] = &unk_1E5F25158;
    double v14 = v18;
    double v16 = a4;
    double v15 = v10;
    [v11 runWithValueApplier:v17 completion:v13];
  }
  return v11;
}

uint64_t __81__PUCropPerspectiveView__animateValueFromValue_toValue_interpolation_completion___block_invoke(uint64_t a1, double a2, double a3)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a3);
}

uint64_t __81__PUCropPerspectiveView__animateValueFromValue_toValue_interpolation_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    (*(void (**)(double))(*(void *)(a1 + 32) + 16))(*(double *)(a1 + 48));
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (CGSize)masterImageSize
{
  [(NUCropModel *)self->_cropModel masterImageSize];
  result.double height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CATransform3D)_imageOrientationTransform
{
  memset(&v6[1], 0, sizeof(CGAffineTransform));
  imageGeometrdouble y = self->_imageGeometry;
  if (imageGeometry) {
    [(PLImageGeometry *)imageGeometry appliedTransform];
  }
  v6[0] = v6[1];
  return CATransform3DMakeAffineTransform(retstr, v6);
}

- (CATransform3D)_imageOrientationTransformWithoutTranslation
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  imageGeometrdouble y = self->_imageGeometry;
  if (imageGeometry)
  {
    [(PLImageGeometry *)imageGeometry appliedTransform];
  }
  else
  {
    long long v7 = 0uLL;
    long long v8 = 0uLL;
  }
  long long v9 = 0uLL;
  *(_OWORD *)&v6.CATransform3D a = v7;
  *(_OWORD *)&v6.c = v8;
  *(_OWORD *)&v6.tCGFloat x = 0uLL;
  return CATransform3DMakeAffineTransform(retstr, &v6);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)dealloc
{
  CGImageRelease(self->_gainMapImage);
  v3.receiver = self;
  v3.super_class = (Class)PUCropPerspectiveView;
  [(PUCropPerspectiveView *)&v3 dealloc];
}

- (PUCropPerspectiveView)initWithFrame:(CGRect)a3
{
  v42.receiver = self;
  v42.super_class = (Class)PUCropPerspectiveView;
  objc_super v3 = -[PUCropPerspectiveView initWithFrame:](&v42, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    double v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    imageLayer = v3->_imageLayer;
    v3->_imageLayer = v4;

    CGAffineTransform v6 = [(PUCropPerspectiveView *)v3 layer];
    [v6 addSublayer:v3->_imageLayer];

    long long v7 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    mediaSuperlayer = v3->_mediaSuperlayer;
    v3->_mediaSuperlayer = v7;

    [(CALayer *)v3->_mediaSuperlayer setZPosition:0.1];
    long long v9 = [(PUCropPerspectiveView *)v3 layer];
    [v9 addSublayer:v3->_mediaSuperlayer];

    mediaLayer = v3->_mediaLayer;
    v3->_mediaLayer = 0;

    double v11 = +[PUPhotoEditProtoSettings sharedInstance];
    v3->_isDebugging = [v11 perspectiveViewDebugCropEnabled];

    if (v3->_isDebugging)
    {
      double v12 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      debugLayer = v3->_debugLayer;
      v3->_debugLayer = v12;

      double v14 = [(PUCropPerspectiveView *)v3 layer];
      [v14 addSublayer:v3->_debugLayer];

      double v15 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      debugCropRectLayer = v3->_debugCropRectLayer;
      v3->_debugCropRectLayer = v15;

      id v17 = [MEMORY[0x1E4FB1618] blueColor];
      -[CAShapeLayer setBorderColor:](v3->_debugCropRectLayer, "setBorderColor:", [v17 CGColor]);

      [(CAShapeLayer *)v3->_debugCropRectLayer setBorderWidth:2.0];
      id v18 = [MEMORY[0x1E4FB1618] cyanColor];
      -[CAShapeLayer setBackgroundColor:](v3->_debugCropRectLayer, "setBackgroundColor:", [v18 CGColor]);

      id v19 = [MEMORY[0x1E4FB1618] whiteColor];
      -[CAShapeLayer setStrokeColor:](v3->_debugCropRectLayer, "setStrokeColor:", [v19 CGColor]);

      id v20 = [MEMORY[0x1E4FB1618] blueColor];
      -[CAShapeLayer setFillColor:](v3->_debugCropRectLayer, "setFillColor:", [v20 CGColor]);

      LODWORD(v21) = 1059648963;
      [(CAShapeLayer *)v3->_debugCropRectLayer setOpacity:v21];
      double v22 = *MEMORY[0x1E4F1DAD8];
      double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      -[CAShapeLayer setAnchorPoint:](v3->_debugCropRectLayer, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], v23);
      [(CALayer *)v3->_debugLayer addSublayer:v3->_debugCropRectLayer];
      double v24 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      debugQuadLayer = v3->_debugQuadLayer;
      v3->_debugQuadLayer = v24;

      id v26 = [MEMORY[0x1E4FB1618] redColor];
      -[CAShapeLayer setBorderColor:](v3->_debugQuadLayer, "setBorderColor:", [v26 CGColor]);

      [(CAShapeLayer *)v3->_debugQuadLayer setBorderWidth:3.0];
      id v27 = [MEMORY[0x1E4FB1618] redColor];
      -[CAShapeLayer setStrokeColor:](v3->_debugQuadLayer, "setStrokeColor:", [v27 CGColor]);

      [(CAShapeLayer *)v3->_debugQuadLayer setLineWidth:3.0];
      id v28 = [MEMORY[0x1E4FB1618] clearColor];
      -[CAShapeLayer setFillColor:](v3->_debugQuadLayer, "setFillColor:", [v28 CGColor]);

      LODWORD(v29) = 1064514355;
      [(CAShapeLayer *)v3->_debugQuadLayer setOpacity:v29];
      -[CAShapeLayer setAnchorPoint:](v3->_debugQuadLayer, "setAnchorPoint:", v22, v23);
      [(CALayer *)v3->_debugLayer addSublayer:v3->_debugQuadLayer];
      long long v30 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
      debugViewRectLayer = v3->_debugViewRectLayer;
      v3->_debugViewRectLayer = v30;

      id v32 = [MEMORY[0x1E4FB1618] whiteColor];
      -[CAShapeLayer setBorderColor:](v3->_debugViewRectLayer, "setBorderColor:", [v32 CGColor]);

      [(CAShapeLayer *)v3->_debugViewRectLayer setBorderWidth:3.0];
      id v33 = [MEMORY[0x1E4FB1618] grayColor];
      -[CAShapeLayer setBackgroundColor:](v3->_debugViewRectLayer, "setBackgroundColor:", [v33 CGColor]);

      id v34 = [MEMORY[0x1E4FB1618] whiteColor];
      -[CAShapeLayer setStrokeColor:](v3->_debugViewRectLayer, "setStrokeColor:", [v34 CGColor]);

      id v35 = [MEMORY[0x1E4FB1618] clearColor];
      -[CAShapeLayer setFillColor:](v3->_debugViewRectLayer, "setFillColor:", [v35 CGColor]);

      LODWORD(v36) = 1058642330;
      [(CAShapeLayer *)v3->_debugViewRectLayer setOpacity:v36];
      -[CAShapeLayer setAnchorPoint:](v3->_debugViewRectLayer, "setAnchorPoint:", v22, v23);
      [(CALayer *)v3->_debugLayer addSublayer:v3->_debugViewRectLayer];
    }
    cropModel = v3->_cropModel;
    v3->_cropModel = 0;

    v41.receiver = v3;
    v41.super_class = (Class)PUCropPerspectiveView;
    [(PUCropTransformedImageView *)&v41 setOrientation:1];
    CGFloat v38 = (void *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v3 action:sel_handlePanGesture_];
    long long v39 = (void *)[objc_alloc(MEMORY[0x1E4FB1AA0]) initWithTarget:v3 action:sel_handlePinchGesture_];
    [v38 setDelegate:v3];
    [v39 setDelegate:v3];
    [(PUCropPerspectiveView *)v3 addGestureRecognizer:v38];
    [(PUCropPerspectiveView *)v3 addGestureRecognizer:v39];
  }
  return v3;
}

@end