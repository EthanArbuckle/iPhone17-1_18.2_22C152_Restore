@interface PXLivePhotoTrimScrubberLoupeView
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime;
- (AVAsset)asset;
- (AVVideoComposition)videoComposition;
- (BOOL)showPlayerView;
- (CGRect)_loupeFrameWithBounds:(CGRect)a3;
- (PXLivePhotoTrimScrubberLoupeView)initWithCoder:(id)a3;
- (PXLivePhotoTrimScrubberLoupeView)initWithFrame:(CGRect)a3 forceDarkUserInterfaceStyle:(BOOL)a4;
- (UIView)playerView;
- (double)aspectRatio;
- (double)innerCornerRadius;
- (double)outerCornerRadius;
- (double)verticalInset;
- (id)_collapsedPathForBounds:(CGRect)a3;
- (id)_expandedPathForBounds:(CGRect)a3 needsCutout:(BOOL)a4;
- (id)_transitionPathForBounds:(CGRect)a3 needsCutout:(BOOL)a4;
- (unint64_t)playheadStyle;
- (void)_PXLivePhotoTrimScrubberLoupeView_commonInit;
- (void)_extractImageFromImageRequest:(id)a3;
- (void)_invalidateImage;
- (void)_invalidatePlayhead;
- (void)_presentImage:(id)a3;
- (void)_setPlayheadStyle:(unint64_t)a3 animate:(BOOL)a4;
- (void)_updateImageIfNeeded;
- (void)_updatePlayheadBorderAnimate:(BOOL)a3;
- (void)_updatePlayheadIfNeeded;
- (void)layoutSubviews;
- (void)setAspectRatio:(double)a3;
- (void)setAsset:(id)a3 videoComposition:(id)a4;
- (void)setFrame:(CGRect)a3;
- (void)setFrameTime:(id *)a3;
- (void)setInnerCornerRadius:(double)a3;
- (void)setOuterCornerRadius:(double)a3;
- (void)setPlayerView:(id)a3;
- (void)setShowLoupePlayerAnimate:(BOOL)a3;
- (void)setShowLoupeThumbnailWithFrameTime:(id *)a3 animate:(BOOL)a4;
- (void)setShowNeedleWithWidth:(double)a3 animate:(BOOL)a4;
- (void)setShowPlayerView:(BOOL)a3;
- (void)setVerticalInset:(double)a3;
@end

@implementation PXLivePhotoTrimScrubberLoupeView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerView, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_currentImageRequest, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

- (void)setInnerCornerRadius:(double)a3
{
  self->_innerCornerRadius = a3;
}

- (double)innerCornerRadius
{
  return self->_innerCornerRadius;
}

- (void)setOuterCornerRadius:(double)a3
{
  self->_outerCornerRadius = a3;
}

- (double)outerCornerRadius
{
  return self->_outerCornerRadius;
}

- (void)setVerticalInset:(double)a3
{
  self->_verticalInset = a3;
}

- (double)verticalInset
{
  return self->_verticalInset;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)frameTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[19];
  return self;
}

- (UIView)playerView
{
  return self->_playerView;
}

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (AVVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (AVAsset)asset
{
  return self->_asset;
}

- (unint64_t)playheadStyle
{
  return self->_playheadStyle;
}

- (void)_updatePlayheadBorderAnimate:(BOOL)a3
{
  BOOL v3 = a3;
  v71[3] = *MEMORY[0x1E4F143B8];
  [(PXLivePhotoTrimScrubberLoupeView *)self bounds];
  if (!CGRectIsEmpty(v72))
  {
    unint64_t v5 = [(PXLivePhotoTrimScrubberLoupeView *)self playheadStyle];
    [(PXLivePhotoTrimScrubberLoupeView *)self bounds];
    double v7 = v6;
    [(PXLivePhotoTrimScrubberLoupeView *)self aspectRatio];
    double v9 = v8 * v7;
    [(PXLivePhotoTrimScrubberLoupeView *)self verticalInset];
    CGFloat v11 = v10;
    v73.origin.double x = 0.0;
    v73.origin.double y = 0.0;
    v73.size.double width = v9;
    v73.size.double height = v7;
    CGRect v74 = CGRectInset(v73, 0.0, v11);
    double x = v74.origin.x;
    double y = v74.origin.y;
    double width = v74.size.width;
    double height = v74.size.height;
    double v16 = 0.5;
    if (v5 != 2) {
      double v16 = 0.0;
    }
    [(CAShapeLayer *)self->_borderLayer setLineWidth:v16];
    if (v5 == 2)
    {
      v17 = -[PXLivePhotoTrimScrubberLoupeView _collapsedPathForBounds:](self, "_collapsedPathForBounds:", x, y, width, height);
      v18 = -[PXLivePhotoTrimScrubberLoupeView _collapsedPathForBounds:](self, "_collapsedPathForBounds:", x, y, width, height);
      double v19 = x;
      double v20 = y;
      double v21 = width;
      double v22 = height;
    }
    else
    {
      v17 = -[PXLivePhotoTrimScrubberLoupeView _expandedPathForBounds:needsCutout:](self, "_expandedPathForBounds:needsCutout:", 1, x, y, width, height);
      -[PXLivePhotoTrimScrubberLoupeView _loupeFrameWithBounds:](self, "_loupeFrameWithBounds:", 0.0, 0.0, v9, v7);
      double v19 = v23;
      double v20 = v24;
      double v21 = v25;
      double v22 = v26;
      v18 = -[PXLivePhotoTrimScrubberLoupeView _expandedPathForBounds:needsCutout:](self, "_expandedPathForBounds:needsCutout:", 0);
    }
    id v27 = v17;
    uint64_t v28 = [v27 CGPath];
    id v29 = v18;
    uint64_t v30 = [v29 CGPath];
    uint64_t v31 = v30;
    if (v3)
    {
      double v58 = v19;
      uint64_t v62 = v30;
      [MEMORY[0x1E4F39CF8] animationDuration];
      double v61 = v32;
      uint64_t v33 = *MEMORY[0x1E4F3A4A0];
      v65 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
      v64 = [MEMORY[0x1E4F39C10] functionWithName:v33];
      v34 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"path"];
      [v34 setRemovedOnCompletion:0];
      uint64_t v35 = *MEMORY[0x1E4F39FA0];
      [v34 setFillMode:*MEMORY[0x1E4F39FA0]];
      double v36 = dbl_1AB35A060[v5 == 2];
      id v63 = v27;
      if (v5 == 2) {
        -[PXLivePhotoTrimScrubberLoupeView _expandedPathForBounds:needsCutout:](self, "_expandedPathForBounds:needsCutout:", 1, x, y, width, height);
      }
      else {
      v37 = -[PXLivePhotoTrimScrubberLoupeView _collapsedPathForBounds:](self, "_collapsedPathForBounds:", x, y, width, height);
      }
      v38 = -[PXLivePhotoTrimScrubberLoupeView _transitionPathForBounds:needsCutout:](self, "_transitionPathForBounds:needsCutout:", 1, x, y, width, height);
      id v60 = v37;
      uint64_t v39 = [v60 CGPath];
      id v59 = v38;
      v71[0] = v39;
      v71[1] = [v59 CGPath];
      v71[2] = v28;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
      [v34 setValues:v40];

      [v34 setDuration:v61];
      v70[0] = &unk_1F02DA780;
      v41 = [NSNumber numberWithDouble:v36];
      v70[1] = v41;
      v70[2] = &unk_1F02DA790;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
      [v34 setKeyTimes:v42];

      v69[0] = v65;
      v69[1] = v64;
      v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
      [v34 setTimingFunctions:v43];

      borderLayer = self->_borderLayer;
      v45 = [v34 keyPath];
      [(CAShapeLayer *)borderLayer addAnimation:v34 forKey:v45];

      v46 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"path"];
      [v46 setRemovedOnCompletion:0];
      [v46 setFillMode:v35];
      if (v5 == 2) {
        -[PXLivePhotoTrimScrubberLoupeView _expandedPathForBounds:needsCutout:](self, "_expandedPathForBounds:needsCutout:", 0, v58, v20, v21, v22);
      }
      else {
      v47 = -[PXLivePhotoTrimScrubberLoupeView _collapsedPathForBounds:](self, "_collapsedPathForBounds:", v58, v20, v21, v22);
      }
      v48 = -[PXLivePhotoTrimScrubberLoupeView _transitionPathForBounds:needsCutout:](self, "_transitionPathForBounds:needsCutout:", 0, v58, v20, v21, v22);
      id v49 = v47;
      uint64_t v50 = [v49 CGPath];
      id v51 = v48;
      v68[0] = v50;
      v68[1] = [v51 CGPath];
      v68[2] = v62;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:3];
      [v46 setValues:v52];

      [v46 setDuration:v61];
      v67[0] = &unk_1F02DA780;
      v53 = [NSNumber numberWithDouble:v36];
      v67[1] = v53;
      v67[2] = &unk_1F02DA790;
      v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:3];
      [v46 setKeyTimes:v54];

      v66[0] = v65;
      v66[1] = v64;
      v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
      [v46 setTimingFunctions:v55];

      maskLayer = self->_maskLayer;
      v57 = [v46 keyPath];
      [(CAShapeLayer *)maskLayer addAnimation:v46 forKey:v57];

      id v27 = v63;
    }
    else
    {
      [(CAShapeLayer *)self->_borderLayer removeAllAnimations];
      [(CAShapeLayer *)self->_maskLayer removeAllAnimations];
      [(CAShapeLayer *)self->_borderLayer setPath:v28];
      [(CAShapeLayer *)self->_maskLayer setPath:v31];
    }
  }
}

- (void)_updatePlayheadIfNeeded
{
  if (!self->_playheadIsValid)
  {
    self->_playheadIsValid = 1;
    [(PXLivePhotoTrimScrubberLoupeView *)self _updatePlayheadBorderAnimate:0];
  }
}

- (void)_invalidatePlayhead
{
  self->_playheadIsValid = 0;
  [(PXLivePhotoTrimScrubberLoupeView *)self setNeedsLayout];
}

- (id)_transitionPathForBounds:(CGRect)a3 needsCutout:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, 4.5, a3.size.height, 2.0);
  [v9 closePath];
  if (v4)
  {
    v20.size.double width = 4.5;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectInset(v20, 2.2, 3.0);
    double v10 = v21.origin.x;
    double v11 = v21.origin.y;
    double width = v21.size.width;
    double v13 = v21.size.height;
    v14 = (void *)MEMORY[0x1E4FB14C0];
    [(PXLivePhotoTrimScrubberLoupeView *)self innerCornerRadius];
    double v16 = objc_msgSend(v14, "bezierPathWithRoundedRect:cornerRadius:", v10, v11, width, v13, v15);
    v17 = [v16 bezierPathByReversingPath];

    [v9 appendPath:v17];
  }
  return v9;
}

- (id)_expandedPathForBounds:(CGRect)a3 needsCutout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = (void *)MEMORY[0x1E4FB14C0];
  [(PXLivePhotoTrimScrubberLoupeView *)self outerCornerRadius];
  v12 = objc_msgSend(v10, "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v11);
  [v12 closePath];
  if (v4)
  {
    -[PXLivePhotoTrimScrubberLoupeView _loupeFrameWithBounds:](self, "_loupeFrameWithBounds:", x, y, width, height);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    CGRect v21 = (void *)MEMORY[0x1E4FB14C0];
    [(PXLivePhotoTrimScrubberLoupeView *)self innerCornerRadius];
    double v23 = objc_msgSend(v21, "bezierPathWithRoundedRect:cornerRadius:", v14, v16, v18, v20, v22);
    double v24 = [v23 bezierPathByReversingPath];
    [v12 appendPath:v24];
  }
  return v12;
}

- (id)_collapsedPathForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_needleWidth >= 0.1) {
    double needleWidth = self->_needleWidth;
  }
  else {
    double needleWidth = 0.1;
  }
  double v7 = (void *)MEMORY[0x1E4FB14C0];
  [(PXLivePhotoTrimScrubberLoupeView *)self innerCornerRadius];
  double v9 = objc_msgSend(v7, "bezierPathWithRoundedRect:cornerRadius:", x, y, needleWidth, height, v8);
  [v9 closePath];
  return v9;
}

- (void)_presentImage:(id)a3
{
  id v4 = a3;
  imageView = self->_imageView;
  if (!imageView)
  {
    double v6 = 0;
    goto LABEL_5;
  }
  if (([(UIImageView *)imageView isHidden] & 1) == 0)
  {
    double v6 = self->_imageView;
LABEL_5:
    double v7 = v6;
    double v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
    [v8 setContentMode:2];
    [(UIView *)self->_container addSubview:v8];
    [(UIView *)self->_container bounds];
    objc_msgSend(v8, "setFrame:");
    objc_storeStrong((id *)&self->_imageView, v8);
    [v8 setAlpha:0.0];
    double v9 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__PXLivePhotoTrimScrubberLoupeView__presentImage___block_invoke;
    v14[3] = &unk_1E5DD0F30;
    v14[4] = self;
    id v15 = v8;
    double v16 = v7;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __50__PXLivePhotoTrimScrubberLoupeView__presentImage___block_invoke_2;
    v12[3] = &unk_1E5DD2188;
    double v13 = v16;
    double v10 = v16;
    id v11 = v8;
    [v9 animateWithDuration:v14 animations:v12 completion:0.25];
  }
}

void __50__PXLivePhotoTrimScrubberLoupeView__presentImage___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 1.0;
  [*(id *)(*(void *)(a1 + 32) + 480) setOpacity:a2];
  [*(id *)(a1 + 40) setAlpha:1.0];
  BOOL v3 = [*(id *)(a1 + 40) image];

  if (!v3)
  {
    id v4 = *(void **)(a1 + 48);
    [v4 setAlpha:0.0];
  }
}

uint64_t __50__PXLivePhotoTrimScrubberLoupeView__presentImage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_extractImageFromImageRequest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1AD10CB00]();
  long long v39 = 0uLL;
  uint64_t v40 = 0;
  if (v4) {
    [v4 sourceTime];
  }
  [v4 imageSize];
  double v7 = v6;
  double v9 = v8;
  [v4 scale];
  if (v10 >= 1.0) {
    double v11 = v10;
  }
  else {
    double v11 = 1.0;
  }
  if (v7 >= v9) {
    double v12 = v7;
  }
  else {
    double v12 = v9;
  }
  double v13 = fmin(v12 * v11, 1024.0);
  id v14 = objc_alloc(MEMORY[0x1E4F16368]);
  id v15 = [v4 asset];
  double v16 = (void *)[v14 initWithAsset:v15];

  double v17 = [v4 videoComposition];
  [v16 setVideoComposition:v17];

  objc_msgSend(v16, "setMaximumSize:", v13, v13);
  double v18 = (long long *)MEMORY[0x1E4F1FA48];
  long long v37 = *MEMORY[0x1E4F1FA48];
  uint64_t v38 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v16 setRequestedTimeToleranceBefore:&v37];
  long long v35 = *v18;
  uint64_t v36 = *((void *)v18 + 2);
  [v16 setRequestedTimeToleranceAfter:&v35];
  [v16 setAppliesPreferredTrackTransform:1];
  double v19 = [v16 customVideoCompositor];
  NSClassFromString(&cfstr_Nuvideoplaybac.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    CGRect v21 = [v16 customVideoCompositor];
    [v21 setValue:@"PXLivePhotoTrimScrubberLoupeView" forKey:@"label"];
  }
  long long v32 = v39;
  uint64_t v33 = v40;
  id v34 = 0;
  double v22 = (CGImage *)[MEMORY[0x1E4F8CC38] copyCGImageFromImageGenerator:v16 atTime:&v32 actualTime:0 error:&v34];
  id v23 = v34;
  if (v22)
  {
    ColorSpace = CGImageGetColorSpace(v22);
    if (CGColorSpaceUsesITUR_2100TF(ColorSpace))
    {
      double v25 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DB90]);
      if (v25)
      {
        double v26 = v25;
        CGImageRef CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v22, v25);
        CFRelease(v22);
        CFRelease(v26);
        double v22 = CopyWithColorSpace;
      }
    }
  }
  uint64_t v28 = [MEMORY[0x1E4FB1818] imageWithCGImage:v22 scale:0 orientation:v11];
  CGImageRelease(v22);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __66__PXLivePhotoTrimScrubberLoupeView__extractImageFromImageRequest___block_invoke;
  v30[3] = &unk_1E5DD32A8;
  v30[4] = self;
  id v31 = v28;
  id v29 = v28;
  dispatch_async(MEMORY[0x1E4F14428], v30);
}

uint64_t __66__PXLivePhotoTrimScrubberLoupeView__extractImageFromImageRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentImage:*(void *)(a1 + 40)];
}

- (void)_updateImageIfNeeded
{
  if (!self->_imageIsValid)
  {
    imageView = self->_imageView;
    if ((!imageView || ([(UIImageView *)imageView isHidden] & 1) == 0) && self->_playheadStyle != 2)
    {
      self->_imageIsValid = 1;
      long long v23 = *(_OWORD *)&self->_frameTime.value;
      int64_t epoch = self->_frameTime.epoch;
      id v4 = objc_alloc_init(_PXLivePhotoTrimScrubberLoupeViewImageRequest);
      [(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)v4 setAsset:self->_asset];
      [(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)v4 setVideoComposition:self->_videoComposition];
      [(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)v4 setSourceTime:&v23];
      [(PXLivePhotoTrimScrubberLoupeView *)self bounds];
      double v6 = v5;
      [(PXLivePhotoTrimScrubberLoupeView *)self aspectRatio];
      -[PXLivePhotoTrimScrubberLoupeView _loupeFrameWithBounds:](self, "_loupeFrameWithBounds:", 0.0, 0.0, v7 * v6, v6);
      double v9 = v8;
      double v11 = v10;
      double v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v12 scale];
      double v14 = v13;

      [(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)v4 setScale:v14];
      -[_PXLivePhotoTrimScrubberLoupeViewImageRequest setImageSize:](v4, "setImageSize:", v9 * v14, v11 * v14);
      BOOL v15 = [(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)v4 isValid];
      currentImageRequest = self->_currentImageRequest;
      if (v15)
      {
        if (![(_PXLivePhotoTrimScrubberLoupeViewImageRequest *)v4 isEqual:currentImageRequest])
        {
          objc_storeStrong((id *)&self->_currentImageRequest, v4);
          objc_initWeak(&location, self);
          workQueue = self->_workQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __56__PXLivePhotoTrimScrubberLoupeView__updateImageIfNeeded__block_invoke;
          block[3] = &unk_1E5DD20C8;
          objc_copyWeak(&v21, &location);
          double v20 = v4;
          dispatch_async(workQueue, block);

          objc_destroyWeak(&v21);
          objc_destroyWeak(&location);
        }
      }
      else
      {
        self->_currentImageRequest = 0;

        double v18 = [(UIImageView *)self->_imageView image];

        if (v18) {
          [(PXLivePhotoTrimScrubberLoupeView *)self _presentImage:0];
        }
      }
    }
  }
}

void __56__PXLivePhotoTrimScrubberLoupeView__updateImageIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _extractImageFromImageRequest:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_invalidateImage
{
  self->_imageIsValid = 0;
  if (self->_playheadStyle != 2) {
    [(PXLivePhotoTrimScrubberLoupeView *)self setNeedsLayout];
  }
}

- (void)setPlayerView:(id)a3
{
  double v5 = (UIView *)a3;
  p_playerView = &self->_playerView;
  if (self->_playerView != v5)
  {
    double v9 = v5;
    double v7 = self->_container;
    if (v9)
    {
      [(UIView *)v7 addSubview:v9];
      [(UIView *)v7 bringSubviewToFront:v9];
    }
    double v8 = [(UIView *)*p_playerView superview];

    if (v8 == v7) {
      [(UIView *)*p_playerView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_playerView, a3);
    [(PXLivePhotoTrimScrubberLoupeView *)self setNeedsLayout];

    double v5 = v9;
  }
}

- (CGRect)_loupeFrameWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGRect v16 = CGRectInset(a3, 3.0, 3.0);
  double v7 = v16.origin.x;
  double v8 = v16.origin.y;
  double v9 = v16.size.width;
  double v10 = v16.size.height;
  IsEmptdouble y = CGRectIsEmpty(v16);
  if (IsEmpty) {
    double v12 = height;
  }
  else {
    double v12 = v10;
  }
  if (IsEmpty) {
    double v13 = width;
  }
  else {
    double v13 = v9;
  }
  if (IsEmpty) {
    double v14 = y;
  }
  else {
    double v14 = v8;
  }
  if (IsEmpty) {
    double v15 = x;
  }
  else {
    double v15 = v7;
  }
  result.size.double height = v12;
  result.size.double width = v13;
  result.origin.double y = v14;
  result.origin.double x = v15;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PXLivePhotoTrimScrubberLoupeView;
  -[PXLivePhotoTrimScrubberLoupeView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PXLivePhotoTrimScrubberLoupeView *)self bounds];
  double v5 = v4;
  [(PXLivePhotoTrimScrubberLoupeView *)self aspectRatio];
  double v7 = v6 * v5;
  [(PXLivePhotoTrimScrubberLoupeView *)self bounds];
  double v9 = v8;
  [(UIView *)self->_container frame];
  if (v7 != v11 || v9 != v10)
  {
    -[UIView setFrame:](self->_container, "setFrame:", 0.0, 0.0, v7, v9);
    [(UIView *)self->_container bounds];
    -[UIView setFrame:](self->_playerView, "setFrame:");
    [(UIView *)self->_container bounds];
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
    [(PXLivePhotoTrimScrubberLoupeView *)self _invalidatePlayhead];
  }
}

- (void)setAsset:(id)a3 videoComposition:(id)a4
{
  double v10 = (AVAsset *)a3;
  double v7 = (AVVideoComposition *)a4;
  if (self->_asset == v10) {
    int v8 = 0;
  }
  else {
    int v8 = -[AVAsset isEqual:](v10, "isEqual:") ^ 1;
  }
  if (self->_videoComposition == v7) {
    int v9 = 0;
  }
  else {
    int v9 = -[AVVideoComposition isEqual:](v7, "isEqual:") ^ 1;
  }
  if ((v8 | v9) == 1)
  {
    objc_storeStrong((id *)&self->_asset, a3);
    objc_storeStrong((id *)&self->_videoComposition, a4);
    [(PXLivePhotoTrimScrubberLoupeView *)self _invalidateImage];
  }
}

- (void)_setPlayheadStyle:(unint64_t)a3 animate:(BOOL)a4
{
  unint64_t playheadStyle = self->_playheadStyle;
  if (playheadStyle != a3)
  {
    BOOL v5 = a4;
    BOOL v7 = a3 != 1;
    unint64_t v8 = playheadStyle | a3;
    self->_unint64_t playheadStyle = a3;
    [(PXLivePhotoTrimScrubberLoupeView *)self setShowPlayerView:a3 - 1 < 2];
    int v9 = [(PXLivePhotoTrimScrubberLoupeView *)self playerView];
    [v9 setHidden:v7];

    if (v8 >= 2)
    {
      [(PXLivePhotoTrimScrubberLoupeView *)self _updatePlayheadBorderAnimate:v5];
    }
  }
}

- (void)setShowLoupePlayerAnimate:(BOOL)a3
{
  if (self->_playheadStyle != 1) {
    [(PXLivePhotoTrimScrubberLoupeView *)self _setPlayheadStyle:1 animate:a3];
  }
}

- (void)setFrameTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_frameTime.value = *(_OWORD *)&a3->var0;
  self->_frameTime.int64_t epoch = var3;
  [(PXLivePhotoTrimScrubberLoupeView *)self _invalidateImage];
}

- (void)setShowLoupeThumbnailWithFrameTime:(id *)a3 animate:(BOOL)a4
{
  if (self->_playheadStyle)
  {
    BOOL v4 = a4;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
    [(PXLivePhotoTrimScrubberLoupeView *)self setFrameTime:&v6];
    [(PXLivePhotoTrimScrubberLoupeView *)self _setPlayheadStyle:0 animate:v4];
  }
}

- (void)setShowNeedleWithWidth:(double)a3 animate:(BOOL)a4
{
  if (self->_playheadStyle != 2 || self->_needleWidth != a3)
  {
    self->_double needleWidth = a3;
    [(PXLivePhotoTrimScrubberLoupeView *)self _setPlayheadStyle:2 animate:a4];
  }
}

- (void)setShowPlayerView:(BOOL)a3
{
  imageView = self->_imageView;
  if (a3)
  {
    [(UIImageView *)imageView setHidden:1];
    BOOL v5 = self->_imageView;
    [(UIImageView *)v5 setImage:0];
  }
  else
  {
    -[UIImageView setHidden:](imageView, "setHidden:");
    [(PXLivePhotoTrimScrubberLoupeView *)self _invalidateImage];
  }
}

- (BOOL)showPlayerView
{
  return [(UIImageView *)self->_imageView isHidden];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXLivePhotoTrimScrubberLoupeView;
  [(PXLivePhotoTrimScrubberLoupeView *)&v3 layoutSubviews];
  [(PXLivePhotoTrimScrubberLoupeView *)self _updateImageIfNeeded];
  [(PXLivePhotoTrimScrubberLoupeView *)self _updatePlayheadIfNeeded];
}

- (void)_PXLivePhotoTrimScrubberLoupeView_commonInit
{
  objc_super v3 = [MEMORY[0x1E4F39C88] layer];
  borderLayer = self->_borderLayer;
  self->_borderLayer = v3;

  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  -[CAShapeLayer setFillColor:](self->_borderLayer, "setFillColor:", [v5 CGColor]);

  [(CAShapeLayer *)self->_borderLayer setLineCap:*MEMORY[0x1E4F3A458]];
  LODWORD(v6) = 1.0;
  [(CAShapeLayer *)self->_borderLayer setOpacity:v6];
  [(CAShapeLayer *)self->_borderLayer setZPosition:10.0];
  id v7 = [MEMORY[0x1E4FB1618] grayColor];
  -[CAShapeLayer setStrokeColor:](self->_borderLayer, "setStrokeColor:", [v7 CGColor]);

  id v8 = [MEMORY[0x1E4FB1618] blackColor];
  -[CAShapeLayer setShadowColor:](self->_borderLayer, "setShadowColor:", [v8 CGColor]);

  LODWORD(v9) = 1058642330;
  [(CAShapeLayer *)self->_borderLayer setShadowOpacity:v9];
  -[CAShapeLayer setShadowOffset:](self->_borderLayer, "setShadowOffset:", 0.0, 0.0);
  double v10 = [(PXLivePhotoTrimScrubberLoupeView *)self layer];
  [v10 addSublayer:self->_borderLayer];

  double v11 = [MEMORY[0x1E4F39C88] layer];
  maskLayer = self->_maskLayer;
  self->_maskLayer = v11;

  if (self->_forceDarkUserInterfaceStyle) {
    [MEMORY[0x1E4FB1618] blackColor];
  }
  else {
  id v13 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  -[CAShapeLayer setFillColor:](self->_maskLayer, "setFillColor:", [v13 CGColor]);

  LODWORD(v14) = 1.0;
  [(CAShapeLayer *)self->_maskLayer setOpacity:v14];
  [(CAShapeLayer *)self->_maskLayer setZPosition:10.0];
  double v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.livephotoloupe.work", 0);
  workQueue = self->_workQueue;
  self->_workQueue = v15;

  self->_outerCornerRadius = 3.0;
  self->_innerCornerRadius = 0.0;
  double v17 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  container = self->_container;
  self->_container = v17;

  [(PXLivePhotoTrimScrubberLoupeView *)self addSubview:self->_container];
  double v19 = self->_maskLayer;
  double v20 = [(UIView *)self->_container layer];
  [v20 setMask:v19];

  id v21 = [(UIView *)self->_container layer];
  [v21 setMasksToBounds:1];

  [(PXLivePhotoTrimScrubberLoupeView *)self outerCornerRadius];
  double v23 = v22;
  double v24 = [(UIView *)self->_container layer];
  [v24 setCornerRadius:v23];

  self->_aspectRatio = 1.0;
  self->_double needleWidth = 1.0;
}

- (PXLivePhotoTrimScrubberLoupeView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PXLivePhotoTrimScrubberLoupeView;
  objc_super v3 = [(PXLivePhotoTrimScrubberLoupeView *)&v6 initWithCoder:a3];
  BOOL v4 = v3;
  if (v3)
  {
    v3->_forceDarkUserInterfaceStyle = 1;
    [(PXLivePhotoTrimScrubberLoupeView *)v3 _PXLivePhotoTrimScrubberLoupeView_commonInit];
  }
  return v4;
}

- (PXLivePhotoTrimScrubberLoupeView)initWithFrame:(CGRect)a3 forceDarkUserInterfaceStyle:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PXLivePhotoTrimScrubberLoupeView;
  id v5 = -[PXLivePhotoTrimScrubberLoupeView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_super v6 = v5;
  if (v5)
  {
    v5->_forceDarkUserInterfaceStyle = a4;
    [(PXLivePhotoTrimScrubberLoupeView *)v5 _PXLivePhotoTrimScrubberLoupeView_commonInit];
  }
  return v6;
}

@end