@interface SBIconImageView
+ (BOOL)allowsImageLayer;
+ (BOOL)generatesContentsImage;
+ (BOOL)hasCustomJitter;
+ (unint64_t)imageCacheRetrievalOptionsForImageOptions:(unint64_t)a3;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)canAnimateProgress;
- (BOOL)canUpdateImage;
- (BOOL)delayedImageUpdateDueToContentVisibility;
- (BOOL)hasOpaqueImage;
- (BOOL)isJittering;
- (BOOL)isPaused;
- (BOOL)isShowingRealContentsImage;
- (BOOL)isUpdatingImage;
- (BOOL)showsSquareCorners;
- (BOOL)updateImageContentsFromCacheAnimated:(BOOL)a3;
- (BOOL)updateImageContentsFromGeneratedImageAnimated:(BOOL)a3;
- (CALayer)alternateContentsLayer;
- (CALayer)contentsLayer;
- (CGRect)visibleBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (NSString)location;
- (SBHIconImageAppearance)displayedImageAppearance;
- (SBHIconImageAppearance)effectiveIconImageAppearance;
- (SBHIconImageAppearance)requestedImageAppearance;
- (SBHIconImageCache)iconImageCache;
- (SBHIconImageCacheRequestIdentifying)cacheRequestCancellation;
- (SBHIconImageIdentity)requestedImageIdentity;
- (SBIcon)icon;
- (SBIconImageInfo)iconImageInfo;
- (SBIconImageView)initWithFrame:(CGRect)a3;
- (SBIconView)iconView;
- (UIImage)displayedImage;
- (double)brightness;
- (double)continuousCornerRadius;
- (double)overlayAlpha;
- (id)_generateSquareContentsImage;
- (id)contentsImage;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)desiredImageIdentity;
- (id)disableImageUpdatesForReason:(id)a3;
- (id)effectiveTraitCollection;
- (id)retrieveNewContentsLayerMasked:(BOOL)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)contentVisibility;
- (unint64_t)iconImageOptions;
- (unint64_t)imageCacheOptions;
- (unint64_t)imageCacheRetrievalOptions;
- (unint64_t)imageLoadingBehavior;
- (void)_clearProgressView;
- (void)_updateOverlayAlpha;
- (void)_updateProgressMask;
- (void)applyImageSublayer:(id)a3 animated:(BOOL)a4;
- (void)clearCachedImages;
- (void)clearDisplayedImage;
- (void)clearIconImageInfo;
- (void)dealloc;
- (void)didAddSublayer;
- (void)didChangeContents:(id)a3 forIcon:(id)a4;
- (void)didEndAsynchronousImageLoadForIcon:(id)a3;
- (void)iconImageCache:(id)a3 didUpdateImageForIcon:(id)a4 imageAppearance:(id)a5;
- (void)iconImageDidUpdate:(id)a3;
- (void)invalidateImageUpdatesAssertion:(id)a3;
- (void)layoutSubviews;
- (void)loadContentsImageAnimated:(BOOL)a3;
- (void)loadContentsImageFromCache:(id)a3 animated:(BOOL)a4;
- (void)loadContentsImageFromIconAnimated:(BOOL)a3;
- (void)prepareForReuse;
- (void)progressViewCanBeRemoved:(id)a3;
- (void)setBrightness:(double)a3;
- (void)setCacheRequestCancellation:(id)a3;
- (void)setContentVisibility:(unint64_t)a3;
- (void)setContentsLayer:(id)a3;
- (void)setDelayedImageUpdateDueToContentVisibility:(BOOL)a3;
- (void)setDisplayedImage:(id)a3;
- (void)setDisplayedImageAppearance:(id)a3;
- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5;
- (void)setIconImageCache:(id)a3;
- (void)setIconImageInfo:(SBIconImageInfo *)a3;
- (void)setIconView:(id)a3;
- (void)setJittering:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setOverlayAlpha:(double)a3;
- (void)setPaused:(BOOL)a3;
- (void)setProgressAlpha:(double)a3;
- (void)setProgressState:(int64_t)a3 paused:(BOOL)a4 percent:(double)a5 animated:(BOOL)a6;
- (void)setRequestedImageAppearance:(id)a3;
- (void)setRequestedImageIdentity:(id)a3;
- (void)setShowingRealContentsImage:(BOOL)a3;
- (void)setShowsSquareCorners:(BOOL)a3;
- (void)updateCachedImages;
- (void)updateImageAfterTraitChange;
- (void)updateImageAnimated:(BOOL)a3;
- (void)updateImageAnimatedIfShowingRealContentImage;
- (void)updateImageContentsAnimated:(BOOL)a3;
- (void)updateImageContentsWithImage:(id)a3 imageAppearance:(id)a4 isRealContentsImage:(BOOL)a5 animated:(BOOL)a6;
- (void)updateImageSublayerAnimated:(BOOL)a3;
- (void)willBeginAsynchronousImageLoadForIcon:(id)a3;
@end

@implementation SBIconImageView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"contents"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBIconImageView;
    BOOL v5 = [(SBIconImageView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  v11 = (SBIcon *)a3;
  id v9 = a4;
  icon = self->_icon;
  if (icon != v11)
  {
    [(SBIcon *)self->_icon removeObserver:self];
    objc_storeStrong((id *)&self->_icon, a3);
    [(SBIcon *)self->_icon addObserver:self];
    if ([(SBIconImageView *)self isShowingRealContentsImage]) {
      [(SBIconImageView *)self clearDisplayedImage];
    }
  }
  if ((BSEqualObjects() & 1) == 0) {
    [(SBIconImageView *)self setLocation:v9];
  }
  if (icon != v11)
  {
    [(SBIconImageView *)self updateImageAnimated:v5];
    [(SBIconImageView *)self sizeToFit];
  }
}

- (void)updateImageAnimatedIfShowingRealContentImage
{
  BOOL v3 = [(SBIconImageView *)self isShowingRealContentsImage];
  [(SBIconImageView *)self updateImageAnimated:v3];
}

- (BOOL)isShowingRealContentsImage
{
  return self->_showingRealContentsImage;
}

- (void)updateImageAfterTraitChange
{
  id v5 = [(SBIconImageView *)self displayedImageAppearance];
  BOOL v3 = [(SBIconImageView *)self requestedImageAppearance];
  id v4 = [(SBIconImageView *)self effectiveIconImageAppearance];
  if ((BSEqualObjects() & 1) == 0 && (BSEqualObjects() & 1) == 0)
  {
    if ([(SBIconImageView *)self contentVisibility] == 2) {
      [(SBIconImageView *)self setDelayedImageUpdateDueToContentVisibility:1];
    }
    else {
      [(SBIconImageView *)self effectiveIconImageAppearanceDidChange];
    }
  }
}

- (BOOL)updateImageContentsFromCacheAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBIconImageView *)self icon];
  if (v5)
  {
    v6 = [(SBIconImageView *)self iconImageCache];
    objc_super v7 = [(SBIconImageView *)self effectiveIconImageAppearance];
    v8 = objc_msgSend(v6, "imageForIcon:imageAppearance:options:", v5, v7, -[SBIconImageView imageCacheRetrievalOptions](self, "imageCacheRetrievalOptions") | 4);
    BOOL v9 = v8 != 0;
    if (v8) {
      [(SBIconImageView *)self updateImageContentsWithImage:v8 imageAppearance:v7 isRealContentsImage:1 animated:v3];
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)updateImageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBIconImageView *)self canUpdateImage])
  {
    ++self->_updateImageDepth;
    id v5 = [(SBIconImageView *)self icon];

    if (v5)
    {
      if ([(id)objc_opt_class() allowsImageLayer]) {
        [(SBIconImageView *)self updateImageSublayerAnimated:v3];
      }
      else {
        [(SBIconImageView *)self updateImageContentsAnimated:v3];
      }
    }
    else
    {
      [(SBIconImageView *)self clearDisplayedImage];
    }
    --self->_updateImageDepth;
  }
}

- (SBIcon)icon
{
  return self->_icon;
}

- (void)updateImageContentsWithImage:(id)a3 imageAppearance:(id)a4 isRealContentsImage:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v23 = a3;
  id v10 = a4;
  id v11 = [(SBIconImageView *)self displayedImage];
  if (v11 != v23)
  {
    id v12 = v23;
    v13 = (void *)[v12 CGImage];
    v14 = [(SBIconImageView *)self layer];
    id v15 = v13;
    if (v6)
    {
      uint64_t v16 = [v14 contents];
      v17 = v15;
      if ((id)v16 == v15)
      {
LABEL_7:

        goto LABEL_8;
      }
      v18 = (void *)v16;
      v19 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"contents"];
      [v19 setDuration:0.3388];
      [v19 setMass:1.0];
      [v19 setStiffness:343.985];
      [v19 setDamping:37.0937];
      [v19 setInitialVelocity:0.0];
      [v19 setFromValue:v18];
      [v19 setToValue:v15];
      [v19 setFillMode:*MEMORY[0x1E4F39FA8]];
      CAFrameRateRange v25 = CAFrameRateRangeMake(30.0, 120.0, 120.0);
      objc_msgSend(v19, "setPreferredFrameRateRange:", *(double *)&v25.minimum, *(double *)&v25.maximum, *(double *)&v25.preferred);
      [v19 setHighFrameRateReason:1114147];
      v20 = NSString;
      uint64_t updateImageCount = self->_updateImageCount;
      self->_uint64_t updateImageCount = updateImageCount + 1;
      v22 = objc_msgSend(v20, "stringWithFormat:", @"SBIconImageViewContents:%u", updateImageCount);
      [v14 addAnimation:v19 forKey:v22];

      [v14 setContents:v15];
    }
    else
    {
      [v14 setContents:v15];
    }
    [(SBIconImageView *)self setDisplayedImage:v12];
    [(SBIconImageView *)self setDisplayedImageAppearance:v10];
    [(SBIconImageView *)self setShowingRealContentsImage:v7];
    v17 = [(SBIconImageView *)self icon];
    [(SBIconImageView *)self didChangeContents:v15 forIcon:v17];
    goto LABEL_7;
  }
LABEL_8:
}

- (UIImage)displayedImage
{
  return self->_displayedImage;
}

- (BOOL)canUpdateImage
{
  return [(NSHashTable *)self->_imageUpdateDisableAssertions count] == 0;
}

- (void)clearDisplayedImage
{
}

- (SBIconImageInfo)iconImageInfo
{
  BOOL v3 = self;
  if (!LOBYTE(self[14].size.height))
  {
    id v4 = [(SBIconImageInfo *)self iconView];
    id v5 = [(SBIconImageInfo *)v3 iconImageCache];
    BOOL v6 = v5;
    if (v4)
    {
      id v5 = v4;
    }
    else if (!v5)
    {
      goto LABEL_6;
    }
    [v5 iconImageInfo];
LABEL_6:
  }
  return self;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBHIconImageAppearance)effectiveIconImageAppearance
{
  BOOL v3 = [(SBIconImageView *)self iconView];
  id v4 = [v3 effectiveIconImageAppearance];
  if (!v4)
  {
    id v5 = [(SBIconImageView *)self traitCollection];
    id v4 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_iconImageAppearanceFromTraitCollection:", v5);
  }
  return (SBHIconImageAppearance *)v4;
}

- (SBIconView)iconView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconView);
  return (SBIconView *)WeakRetained;
}

+ (BOOL)allowsImageLayer
{
  return 0;
}

- (void)didChangeContents:(id)a3 forIcon:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBIconImageView *)self iconView];
  [v8 iconImageViewDidChangeContents:v7 forIcon:v6];
}

- (void)setShowingRealContentsImage:(BOOL)a3
{
  self->_showingRealContentsImage = a3;
}

- (void)setDisplayedImageAppearance:(id)a3
{
}

- (void)setDisplayedImage:(id)a3
{
}

- (void)updateImageContentsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(SBIconImageView *)self iconView];
  id v5 = [v7 overrideImage];
  if (v5)
  {
    id v6 = [(SBIconImageView *)self effectiveIconImageAppearance];
    [(SBIconImageView *)self updateImageContentsWithImage:v5 imageAppearance:v6 isRealContentsImage:1 animated:v3];
  }
  else if ([(id)objc_opt_class() generatesContentsImage])
  {
    [(SBIconImageView *)self updateImageContentsFromGeneratedImageAnimated:v3];
  }
  else if (![(SBIconImageView *)self updateImageContentsFromCacheAnimated:v3])
  {
    [(SBIconImageView *)self loadContentsImageAnimated:v3];
  }
}

- (unint64_t)imageCacheRetrievalOptions
{
  if ([(SBIconImageView *)self showsSquareCorners]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

+ (BOOL)generatesContentsImage
{
  return 0;
}

- (SBHIconImageAppearance)displayedImageAppearance
{
  return self->_displayedImageAppearance;
}

- (SBHIconImageAppearance)requestedImageAppearance
{
  return self->_requestedImageAppearance;
}

- (void)setLocation:(id)a3
{
}

- (void)setContentVisibility:(unint64_t)a3
{
  unint64_t contentVisibility = self->_contentVisibility;
  if (contentVisibility != a3)
  {
    self->_unint64_t contentVisibility = a3;
    [(SBIconProgressView *)self->_progressView setCanAnimate:[(SBIconImageView *)self canAnimateProgress]];
    BOOL v6 = [(SBIconImageView *)self delayedImageUpdateDueToContentVisibility];
    if (a3 != 2 && v6)
    {
      [(SBIconImageView *)self setDelayedImageUpdateDueToContentVisibility:0];
      BOOL v7 = [(SBIconImageView *)self isShowingRealContentsImage];
      BOOL v8 = contentVisibility != 2 && v7;
      [(SBIconImageView *)self updateImageAnimated:v8];
    }
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    self->_paused = a3;
    progressView = self->_progressView;
    BOOL v4 = [(SBIconImageView *)self canAnimateProgress];
    [(SBIconProgressView *)progressView setCanAnimate:v4];
  }
}

- (BOOL)canAnimateProgress
{
  return ![(SBIconImageView *)self isPaused]
      && [(SBIconImageView *)self contentVisibility] != 2;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (BOOL)delayedImageUpdateDueToContentVisibility
{
  return self->_delayedImageUpdateDueToContentVisibility;
}

- (void)setProgressAlpha:(double)a3
{
}

- (void)setProgressState:(int64_t)a3 paused:(BOOL)a4 percent:(double)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  progressView = self->_progressView;
  if (!a3 || progressView)
  {
    -[SBIconProgressView setState:paused:fractionLoaded:animated:](progressView, "setState:paused:fractionLoaded:animated:");
  }
  else
  {
    id v12 = objc_alloc_init(SBIconProgressView);
    v13 = self->_progressView;
    self->_progressView = v12;

    [(SBIconProgressView *)self->_progressView setDelegate:self];
    [(SBIconProgressView *)self->_progressView setHasOpaqueIconImage:[(SBIconImageView *)self hasOpaqueImage]];
    v14 = [(SBIconProgressView *)self->_progressView layer];
    objc_msgSend(v14, "setAllowsEdgeAntialiasing:", -[SBIconImageView isJittering](self, "isJittering"));

    [(SBIconImageView *)self addSubview:self->_progressView];
    [(SBIconImageView *)self _updateProgressMask];
    uint64_t v15 = [(SBIconImageView *)self isPaused] ^ 1;
    [(SBIconProgressView *)self->_progressView setState:a3 paused:v8 fractionLoaded:v15 & v6 animated:a5];
    uint64_t v16 = self->_progressView;
    [(SBIconProgressView *)v16 setCanAnimate:v15];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  BOOL v4 = [(SBIconImageView *)self iconView];
  if (v4)
  {
  }
  else
  {
    id v5 = [(SBIconImageView *)self iconImageCache];

    if (!v5)
    {
      BOOL v8 = [(SBIconImageView *)self contentsImage];
      [v8 size];
      double v10 = v9;
      double v12 = v11;

      double v6 = v10;
      double v7 = v12;
      goto LABEL_8;
    }
  }
  [(SBIconImageView *)self iconImageInfo];
LABEL_8:
  result.height = v7;
  result.width = v6;
  return result;
}

- (NSString)location
{
  return self->_location;
}

- (void)prepareForReuse
{
  BOOL v3 = [(SBIconImageView *)self cacheRequestCancellation];
  [v3 cancel];

  [(SBIconImageView *)self setCacheRequestCancellation:0];
  [(SBIconImageView *)self setRequestedImageIdentity:0];
  [(SBIconImageView *)self setRequestedImageAppearance:0];
  [(SBIconImageView *)self setIcon:0 location:self->_location animated:0];
  [(SBIconImageView *)self setBrightness:1.0];
  [(SBIconImageView *)self setShowsSquareCorners:0];
  [(SBIconImageView *)self setPaused:0];
  [(SBIconImageView *)self setContentVisibility:0];
  [(SBIconImageView *)self setJittering:0];
  [(SBIconImageView *)self _clearProgressView];
  [(SBIconImageView *)self _removeAllAnimations:0];
  [(SBIconImageView *)self _removeAllRetargetableAnimations:0];
  imageUpdateDisableAssertions = self->_imageUpdateDisableAssertions;
  self->_imageUpdateDisableAssertions = 0;
}

- (void)setBrightness:(double)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  if (self->_brightness != a3)
  {
    self->_brightness = a3;
    multiplyFilter = self->_multiplyFilter;
    if (a3 >= 1.0)
    {
      if (multiplyFilter)
      {
        double v9 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.brightness.inputColor"];
        double v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
        [v9 setTimingFunction:v10];

        double v11 = [(CAFilter *)self->_multiplyFilter valueForKey:@"inputColor"];
        [v9 setFromValue:v11];

        [v9 setFillMode:*MEMORY[0x1E4F39FA8]];
        [v9 setDuration:0.3];
        double v12 = [(SBIconImageView *)self layer];
        id v13 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
        objc_msgSend(v12, "setValue:forKeyPath:", objc_msgSend(v13, "CGColor"), @"filters.brightness.inputColor");

        v14 = [(SBIconImageView *)self layer];
        [v14 addAnimation:v9 forKey:@"filters.brightness.inputColor"];

        uint64_t v15 = self->_multiplyFilter;
        self->_multiplyFilter = 0;
      }
    }
    else
    {
      if (!multiplyFilter)
      {
        id v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
        double v6 = self->_multiplyFilter;
        self->_multiplyFilter = v5;

        [(CAFilter *)self->_multiplyFilter setName:@"brightness"];
        double v7 = [(SBIconImageView *)self layer];
        v16[0] = self->_multiplyFilter;
        BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
        [v7 setFilters:v8];
      }
      [(SBIconImageView *)self _updateOverlayAlpha];
    }
    [(SBIconImageView *)self _updateOverlayAlpha];
  }
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  if (self->_showsSquareCorners != a3)
  {
    self->_showsSquareCorners = a3;
    [(SBIconImageView *)self updateImageAnimated:0];
    [(SBIconImageView *)self _updateProgressMask];
  }
}

- (void)setJittering:(BOOL)a3
{
  if (self->_jittering != a3)
  {
    BOOL v3 = a3;
    self->_jittering = a3;
    id v5 = [(SBIconImageView *)self layer];
    [v5 setAllowsEdgeAntialiasing:v3];

    id v6 = [(SBIconProgressView *)self->_progressView layer];
    [v6 setAllowsEdgeAntialiasing:v3];
  }
}

- (void)_clearProgressView
{
  [(SBIconProgressView *)self->_progressView setDelegate:0];
  [(SBIconProgressView *)self->_progressView removeFromSuperview];
  progressView = self->_progressView;
  self->_progressView = 0;
}

- (void)_updateOverlayAlpha
{
  multiplyFilter = self->_multiplyFilter;
  id v3 = [MEMORY[0x1E4FB1618] colorWithWhite:self->_brightness * self->_overlayAlpha alpha:1.0];
  -[CAFilter setValue:forKey:](multiplyFilter, "setValue:forKey:", [v3 CGColor], @"inputColor");
}

- (void)setIconImageCache:(id)a3
{
  id v5 = (SBHIconImageCache *)a3;
  iconImageCache = self->_iconImageCache;
  if (iconImageCache != v5)
  {
    double v7 = v5;
    [(SBHIconImageCache *)iconImageCache removeObserver:self];
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    [(SBHIconImageCache *)self->_iconImageCache addObserver:self];
    [(SBIconImageView *)self updateImageAnimated:0];
    [(SBIconImageView *)self invalidateIntrinsicContentSize];
    id v5 = v7;
  }
}

- (void)setIconView:(id)a3
{
}

- (CGRect)visibleBounds
{
  [(SBIconImageView *)self iconImageInfo];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.height = v5;
  result.size.width = v3;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CALayer)alternateContentsLayer
{
  if ([(id)objc_opt_class() allowsImageLayer]) {
    [(SBIconImageView *)self contentsLayer];
  }
  else {
  double v3 = [(SBIconImageView *)self layer];
  }
  return (CALayer *)v3;
}

- (SBIconImageView)initWithFrame:(CGRect)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SBIconImageView;
  double v3 = -[SBIconImageView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    [(SBIconImageView *)v3 setUserInteractionEnabled:0];
    objc_storeStrong((id *)&v4->_location, @"SBIconLocationRoot");
    v4->_overlayAlpha = 1.0;
    double v5 = self;
    v14[0] = v5;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v7 = (id)[(SBIconImageView *)v4 registerForTraitChanges:v6 withAction:sel_updateImageAfterTraitChange];

    BOOL v8 = self;
    id v13 = v8;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    id v10 = (id)[(SBIconImageView *)v4 registerForTraitChanges:v9 withAction:sel_updateImageAfterTraitChange];
  }
  return v4;
}

- (double)continuousCornerRadius
{
  [(SBIconImageView *)self iconImageInfo];
  return v2;
}

- (void)_updateProgressMask
{
  [(SBIconImageView *)self iconImageInfo];
  progressView = self->_progressView;
  -[SBIconProgressView setIconImageInfo:](progressView, "setIconImageInfo:");
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SBIconImageView;
  [(SBIconImageView *)&v12 layoutSubviews];
  [(SBIconImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[SBIconProgressView setFrame:](self->_progressView, "setFrame:");
  double v11 = [(SBIconImageView *)self contentsLayer];
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  UIRectGetCenter();
  objc_msgSend(v11, "setPosition:");
}

- (CALayer)contentsLayer
{
  return self->_contentsLayer;
}

- (void)didAddSublayer
{
  if (self->_progressView) {
    -[SBIconImageView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
}

- (BOOL)updateImageContentsFromGeneratedImageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(id)objc_opt_class() generatesContentsImage];
  if (v5)
  {
    if ([(SBIconImageView *)self showsSquareCorners]) {
      [(SBIconImageView *)self squareContentsImage];
    }
    else {
    double v6 = [(SBIconImageView *)self contentsImage];
    }
    double v7 = [(SBIconImageView *)self effectiveIconImageAppearance];
    [(SBIconImageView *)self updateImageContentsWithImage:v6 imageAppearance:v7 isRealContentsImage:1 animated:v3];
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheRequestCancellation, 0);
  objc_storeStrong((id *)&self->_requestedImageIdentity, 0);
  objc_storeStrong((id *)&self->_requestedImageAppearance, 0);
  objc_storeStrong((id *)&self->_contentsLayer, 0);
  objc_storeStrong((id *)&self->_displayedImageAppearance, 0);
  objc_storeStrong((id *)&self->_displayedImage, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_destroyWeak((id *)&self->_iconView);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_imageUpdateDisableAssertions, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_multiplyFilter, 0);
}

- (void)dealloc
{
  [(SBIcon *)self->_icon removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SBIconImageView;
  [(SBIconImageView *)&v3 dealloc];
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v7 = v6;
  double v8 = v5;
  CGFloat v9 = v4;
  CGFloat v10 = v3;
  if (!self->_hasSetIconImageInfo
    || !SBIconImageInfoEqualToIconImageInfo(v3, v4, v5, v6, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius))
  {
    self->_iconImageInfo.size.width = v10;
    self->_iconImageInfo.size.height = v9;
    self->_iconImageInfo.scale = v8;
    self->_iconImageInfo.continuousCornerRadius = v7;
    self->_hasSetIconImageInfo = 1;
    [(SBIconImageView *)self updateImageAnimated:0];
    [(SBIconImageView *)self invalidateIntrinsicContentSize];
  }
}

- (void)clearIconImageInfo
{
  if (self->_hasSetIconImageInfo)
  {
    self->_hasSetIconImageInfo = 0;
    [(SBIconImageView *)self updateImageAnimated:0];
    [(SBIconImageView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setOverlayAlpha:(double)a3
{
  if (self->_overlayAlpha != a3)
  {
    self->_overlayAlpha = a3;
    [(SBIconImageView *)self _updateOverlayAlpha];
  }
}

- (void)progressViewCanBeRemoved:(id)a3
{
  if (self->_progressView == a3) {
    [(SBIconImageView *)self _clearProgressView];
  }
}

+ (BOOL)hasCustomJitter
{
  return 0;
}

- (unint64_t)iconImageOptions
{
  return [(SBIconImageView *)self showsSquareCorners] ^ 1;
}

+ (unint64_t)imageCacheRetrievalOptionsForImageOptions:(unint64_t)a3
{
  return 0;
}

- (unint64_t)imageCacheOptions
{
  return 0;
}

- (unint64_t)imageLoadingBehavior
{
  double v2 = [(SBIconImageView *)self iconView];
  unint64_t v3 = [v2 imageLoadingBehavior];

  return v3;
}

- (id)effectiveTraitCollection
{
  unint64_t v3 = [(SBIconImageView *)self iconView];
  double v4 = [v3 overrideIconImageAppearance];
  double v5 = [v3 overrideIconImageStyleConfiguration];
  if (v4)
  {
    double v6 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_traitCollectionWithIconImageAppearance:", v4);
  }
  else
  {
    double v7 = [(SBIconImageView *)self traitCollection];
    double v6 = v7;
    if (v5)
    {
      uint64_t v8 = [v7 userInterfaceStyle];
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4FB1E20], "sbh_traitCollectionWithIconImageStyleConfiguration:userInterfaceStyle:", v5, v8);

      double v6 = (void *)v9;
    }
  }

  return v6;
}

- (id)desiredImageIdentity
{
  unint64_t v3 = [(SBIconImageView *)self icon];
  if (v3)
  {
    double v4 = [(SBIconImageView *)self effectiveIconImageAppearance];
    double v5 = [(SBIconImageView *)self iconImageCache];
    double v6 = -[SBHIconImageIdentity initWithIcon:imageGeneration:imageAppearance:]([SBHIconImageIdentity alloc], "initWithIcon:imageGeneration:imageAppearance:", v3, [v5 currentImageGenerationForIcon:v3], v4);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)loadContentsImageAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(SBIconImageView *)self iconImageCache];
  id v6 = (id)v5;
  if (v5) {
    [(SBIconImageView *)self loadContentsImageFromCache:v5 animated:v3];
  }
  else {
    [(SBIconImageView *)self loadContentsImageFromIconAnimated:v3];
  }
}

- (void)loadContentsImageFromCache:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(SBIconImageView *)self icon];
  if (v7)
  {
    uint64_t v8 = [(SBIconImageView *)self desiredImageIdentity];
    uint64_t v9 = [v8 imageAppearance];
    unint64_t v10 = [(SBIconImageView *)self imageLoadingBehavior];
    double v11 = [(SBIconImageView *)self requestedImageIdentity];
    int v12 = BSEqualObjects();
    id v13 = SBLogIconImageView();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v12)
    {
      if (v14) {
        -[SBIconImageView loadContentsImageFromCache:animated:]();
      }
    }
    else
    {
      if (v14) {
        -[SBIconImageView loadContentsImageFromCache:animated:].cold.6();
      }

      if (v10 - 1 < 2)
      {
        [(SBIconImageView *)self willBeginAsynchronousImageLoadForIcon:v7];
        int v15 = [(id)objc_opt_class() hasIconImage];
        if ([(SBIconImageView *)self isShowingRealContentsImage])
        {
          uint64_t v16 = SBLogIconImageView();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            -[SBIconImageView loadContentsImageFromCache:animated:].cold.4();
          }
        }
        else
        {
          uint64_t v16 = 0;
          if (v10 == 1 && v15)
          {
            uint64_t v16 = [v6 cachingPlaceholderImageWithImageAppearance:v9 options:0];
          }
          v18 = SBLogIconImageView();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[SBIconImageView loadContentsImageFromCache:animated:].cold.5();
          }

          [(SBIconImageView *)self updateImageContentsWithImage:v16 imageAppearance:v9 isRealContentsImage:0 animated:v4];
        }

        [(SBIconImageView *)self setRequestedImageAppearance:v9];
        unint64_t v19 = [(SBIconImageView *)self imageCacheRetrievalOptions] | 4;
        unint64_t v23 = [(SBIconImageView *)self imageCacheOptions];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __55__SBIconImageView_loadContentsImageFromCache_animated___block_invoke;
        v24[3] = &unk_1E6AB4B40;
        v24[4] = self;
        CAFrameRateRange v25 = v8;
        id v26 = v7;
        id v27 = v6;
        id v28 = v9;
        unint64_t v29 = v19;
        char v30 = v15;
        BOOL v31 = v4;
        v20 = [v27 cacheImageForIcon:v26 imageAppearance:v28 priority:3 reason:@"SBIconImageView loadContentsImage" options:v23 completionHandler:v24];
        v21 = [v20 requestedImageIdentities];
        v22 = [v21 firstObject];

        [(SBIconImageView *)self setRequestedImageIdentity:v22];
        [(SBIconImageView *)self setCacheRequestCancellation:v20];

        goto LABEL_25;
      }
      if (v10)
      {
LABEL_25:

        goto LABEL_26;
      }
      v17 = SBLogIconImageView();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[SBIconImageView loadContentsImageFromCache:animated:]();
      }

      id v13 = objc_msgSend(v6, "imageForIcon:imageAppearance:options:", v7, v9, -[SBIconImageView imageCacheRetrievalOptions](self, "imageCacheRetrievalOptions"));
      [(SBIconImageView *)self updateImageContentsWithImage:v13 imageAppearance:v9 isRealContentsImage:1 animated:v4];
    }

    goto LABEL_25;
  }
  uint64_t v8 = SBLogIconImageView();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SBIconImageView loadContentsImageFromCache:animated:](v8);
  }
LABEL_26:
}

void __55__SBIconImageView_loadContentsImageFromCache_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 desiredImageIdentity];
  id v6 = [*(id *)(a1 + 32) cacheRequestCancellation];
  double v7 = [v6 identifier];
  uint64_t v8 = [v4 requestIdentifier];
  int v9 = BSEqualObjects();

  int v10 = [v4 isFinished];
  int v11 = BSEqualObjects();
  int v12 = SBLogIconImageView();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = *(void *)(a1 + 48);
    int v21 = 138413058;
    uint64_t v22 = v20;
    __int16 v23 = 1024;
    int v24 = v9;
    __int16 v25 = 1024;
    int v26 = v10;
    __int16 v27 = 1024;
    int v28 = v11;
    _os_log_debug_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEBUG, "cache load returned for %@, is current: %{BOOL}u, finished: %{BOOL}u, identities match: %{BOOL}u", (uint8_t *)&v21, 0x1Eu);
  }

  if (v9) {
    [*(id *)(a1 + 32) setCacheRequestCancellation:0];
  }
  if ((v10 & v11) != 1)
  {
    id v13 = SBLogIconImageView();
    BOOL v15 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v10)
    {
      if (!v15) {
        goto LABEL_21;
      }
      uint64_t v16 = *(void *)(a1 + 48);
      int v21 = 138412290;
      uint64_t v22 = v16;
      v17 = "discarding results of cache load for %@ because identities no longer match";
    }
    else
    {
      if (!v15) {
        goto LABEL_21;
      }
      uint64_t v18 = *(void *)(a1 + 48);
      int v21 = 138412290;
      uint64_t v22 = v18;
      v17 = "discarding results of cache load for %@ because the load didn't finish";
    }
    _os_log_impl(&dword_1D7F0A000, v13, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v21, 0xCu);
    goto LABEL_21;
  }
  id v13 = [*(id *)(a1 + 56) imageForIcon:*(void *)(a1 + 48) imageAppearance:*(void *)(a1 + 64) options:*(void *)(a1 + 72)];
  BOOL v14 = SBLogIconImageView();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __55__SBIconImageView_loadContentsImageFromCache_animated___block_invoke_cold_2((void *)(a1 + 48), (uint64_t)v13, v14);
  }

  if (v13 || !*(unsigned char *)(a1 + 80))
  {
    [*(id *)(a1 + 32) updateImageContentsWithImage:v13 imageAppearance:*(void *)(a1 + 64) isRealContentsImage:1 animated:*(unsigned __int8 *)(a1 + 81)];
  }
  else
  {
    unint64_t v19 = SBLogIconImageView();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __55__SBIconImageView_loadContentsImageFromCache_animated___block_invoke_cold_1((id *)(a1 + 48), v19);
    }

    [*(id *)(a1 + 32) loadContentsImageFromIconAnimated:*(unsigned __int8 *)(a1 + 81)];
  }
  [*(id *)(a1 + 32) setRequestedImageAppearance:0];
  [*(id *)(a1 + 32) setRequestedImageIdentity:0];
LABEL_21:

  [*(id *)(a1 + 32) didEndAsynchronousImageLoadForIcon:*(void *)(a1 + 48)];
}

- (void)loadContentsImageFromIconAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [(SBIconImageView *)self icon];
  if (v12)
  {
    uint64_t v5 = [(SBIconImageView *)self effectiveTraitCollection];
    id v6 = objc_msgSend(v5, "sbh_iconImageAppearance");
    [(SBIconImageView *)self iconImageInfo];
    int v11 = objc_msgSend(v12, "iconImageWithInfo:traitCollection:options:", v5, -[SBIconImageView iconImageOptions](self, "iconImageOptions"), v7, v8, v9, v10);
    [(SBIconImageView *)self updateImageContentsWithImage:v11 imageAppearance:v6 isRealContentsImage:1 animated:v3];
  }
}

- (void)updateImageSublayerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBIconImageView *)self retrieveNewContentsLayerMasked:!self->_showsSquareCorners];
  [(SBIconImageView *)self applyImageSublayer:v5 animated:v3];
}

- (void)applyImageSublayer:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  id v5 = [(SBIconImageView *)self contentsLayer];
  [v5 removeFromSuperlayer];
  if (v7)
  {
    [(SBIconImageView *)self bounds];
    id v6 = [(SBIconImageView *)self layer];
    [v6 insertSublayer:v7 atIndex:0];

    UIRectGetCenter();
    objc_msgSend(v7, "setPosition:");
  }
  [(SBIconImageView *)self setContentsLayer:v7];
}

- (BOOL)isUpdatingImage
{
  return self->_updateImageDepth != 0;
}

- (id)disableImageUpdatesForReason:(id)a3
{
  id v4 = a3;
  if (!self->_imageUpdateDisableAssertions)
  {
    id v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    imageUpdateDisableAssertions = self->_imageUpdateDisableAssertions;
    self->_imageUpdateDisableAssertions = v5;
  }
  id v7 = [[_SBIconImageViewDisableUpdatesAssertion alloc] initWithIconImageView:self reason:v4];
  [(NSHashTable *)self->_imageUpdateDisableAssertions addObject:v7];

  return v7;
}

- (void)invalidateImageUpdatesAssertion:(id)a3
{
  [(NSHashTable *)self->_imageUpdateDisableAssertions removeObject:a3];
  if (![(NSHashTable *)self->_imageUpdateDisableAssertions count])
  {
    [(SBIconImageView *)self updateImageAnimated:0];
  }
}

- (id)_generateSquareContentsImage
{
  BOOL v3 = [(SBIconImageView *)self icon];
  [(SBIconImageView *)self iconImageInfo];
  id v4 = objc_msgSend(v3, "unmaskedIconImageWithInfo:");

  return v4;
}

- (void)clearCachedImages
{
  v7[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SBIconImageView *)self iconImageCache];
  uint64_t v4 = [(SBIconImageView *)self icon];
  id v5 = (void *)v4;
  if (v4)
  {
    v7[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [v3 purgeCachedImagesForIcons:v6];
  }
}

- (void)updateCachedImages
{
  id v4 = [(SBIconImageView *)self iconImageCache];
  BOOL v3 = [(SBIconImageView *)self icon];
  if (v3) {
    [v4 updateImageForIcon:v3];
  }
}

- (id)contentsImage
{
  if ([(SBIconImageView *)self isShowingRealContentsImage])
  {
    BOOL v3 = [(SBIconImageView *)self displayedImage];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)retrieveNewContentsLayerMasked:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBIconImageView *)self icon];
  if (!v5)
  {
    id v22 = 0;
    goto LABEL_12;
  }
  id v6 = [(SBIconImageView *)self effectiveTraitCollection];
  id v7 = [(SBIconImageView *)self iconView];
  [(SBIconImageView *)self iconImageInfo];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  uint64_t v16 = [v7 imageLoadingBehavior];
  uint64_t v17 = v16;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__21;
  v39 = __Block_byref_object_dispose__21;
  id v40 = 0;
  if ((unint64_t)(v16 - 1) < 2)
  {
    [(SBIconImageView *)self willBeginAsynchronousImageLoadForIcon:v5];
    uint64_t v18 = [(SBIconImageView *)self iconImageCache];
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    char v34 = 1;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __50__SBIconImageView_retrieveNewContentsLayerMasked___block_invoke;
    v25[3] = &unk_1E6AB4B68;
    id v26 = v5;
    __int16 v27 = self;
    uint64_t v29 = &v31;
    char v30 = &v35;
    id v19 = v18;
    id v28 = v19;
    objc_msgSend(v26, "iconLayerWithInfo:traitCollection:options:completionHandler:", v6, v3, v25, v9, v11, v13, v15);
    *((unsigned char *)v32 + 24) = 0;
    if (v17 == 1 && !v36[5])
    {
      uint64_t v20 = +[SBIcon genericIconLayerWithInfo:](SBIcon, "genericIconLayerWithInfo:", v9, v11, v13, v15);
      int v21 = (void *)v36[5];
      v36[5] = v20;
    }
    _Block_object_dispose(&v31, 8);
    goto LABEL_10;
  }
  if (!v16)
  {
    uint64_t v23 = objc_msgSend(v5, "iconLayerWithInfo:traitCollection:options:", v6, v3, v9, v11, v13, v15);
    id v19 = (id)v36[5];
    v36[5] = v23;
LABEL_10:
  }
  id v22 = (id)v36[5];
  _Block_object_dispose(&v35, 8);

LABEL_12:
  return v22;
}

void __50__SBIconImageView_retrieveNewContentsLayerMasked___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (v10)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) icon];

    if (v4 == v5)
    {
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
      }
      else {
        [*(id *)(a1 + 40) applyImageSublayer:v10 animated:1];
      }
      if ((__sb__runningInSpringBoard() & 1) == 0)
      {
        id v6 = *(void **)(a1 + 48);
        id v7 = objc_alloc_init(MEMORY[0x1E4FB1818]);
        uint64_t v8 = *(void *)(a1 + 32);
        double v9 = +[SBHIconImageAppearance lightAppearance];
        [v6 cacheImage:v7 forIcon:v8 imageAppearance:v9];
      }
    }
  }
  [*(id *)(a1 + 40) didEndAsynchronousImageLoadForIcon:*(void *)(a1 + 32)];
}

- (BOOL)hasOpaqueImage
{
  return 1;
}

- (void)willBeginAsynchronousImageLoadForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconImageView *)self iconView];
  [v5 iconImageViewWillBeginAsynchronousImageLoadForIcon:v4];
}

- (void)didEndAsynchronousImageLoadForIcon:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconImageView *)self iconView];
  [v5 iconImageViewDidEndAsynchronousImageLoadForIcon:v4];
}

- (void)iconImageDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(SBIconImageView *)self icon];

  if (v5 == v4)
  {
    [(SBIconImageView *)self updateImageAnimated:1];
    [(SBIconImageView *)self sizeToFit];
  }
}

- (void)iconImageCache:(id)a3 didUpdateImageForIcon:(id)a4 imageAppearance:(id)a5
{
  id v16 = a5;
  id v7 = a4;
  uint64_t v8 = [(SBIconImageView *)self icon];
  int v9 = [v7 isEqual:v8];

  if (v9 && ![(SBIconImageView *)self isUpdatingImage])
  {
    id v10 = [(SBIconImageView *)self displayedImageAppearance];
    if (!v10 || BSEqualObjects())
    {
      double v11 = [(SBIconImageView *)self effectiveIconImageAppearance];
      if (!v11 || BSEqualObjects())
      {
        unint64_t v12 = [(SBIconImageView *)self contentVisibility];
        [(SBIconImageView *)self alpha];
        BOOL v15 = v13 > 0.0 && v12 != 2;
        [(SBIconImageView *)self updateImageAnimated:v15];
        [(SBIconImageView *)self sizeToFit];
      }
    }
  }
}

- (NSString)description
{
  return (NSString *)[(SBIconImageView *)self descriptionWithMultilinePrefix:@"\t"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBIconImageView *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [(SBIconImageView *)self frame];
  id v5 = (id)objc_msgSend(v4, "appendRect:withName:", @"frame");
  id v6 = [(SBIconImageView *)self icon];
  id v7 = (id)[v4 appendObject:v6 withName:@"icon"];

  [(SBIconImageView *)self alpha];
  if (v8 < 1.0)
  {
    [(SBIconImageView *)self alpha];
    id v9 = (id)objc_msgSend(v4, "appendFloat:withName:", @"alpha");
  }
  [(SBIconImageView *)self brightness];
  if (v10 < 1.0) {
    id v11 = (id)objc_msgSend(v4, "appendFloat:withName:", @"brightness");
  }
  [(SBIconImageView *)self overlayAlpha];
  if (v12 < 1.0) {
    id v13 = (id)objc_msgSend(v4, "appendFloat:withName:", @"overlayAlpha");
  }
  id v14 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconImageView isPaused](self, "isPaused"), @"isPaused");
  id v15 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconImageView showsSquareCorners](self, "showsSquareCorners"), @"showsSquareCorners");
  id v16 = (id)[v4 appendObject:self->_imageUpdateDisableAssertions withName:@"imageUpdateDisableAssertions" skipIfNil:1];
  return v4;
}

- (id)succinctDescription
{
  double v2 = [(SBIconImageView *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (double)brightness
{
  return self->_brightness;
}

- (BOOL)isJittering
{
  return self->_jittering;
}

- (void)setContentsLayer:(id)a3
{
}

- (void)setDelayedImageUpdateDueToContentVisibility:(BOOL)a3
{
  self->_delayedImageUpdateDueToContentVisibility = a3;
}

- (void)setRequestedImageAppearance:(id)a3
{
}

- (SBHIconImageIdentity)requestedImageIdentity
{
  return self->_requestedImageIdentity;
}

- (void)setRequestedImageIdentity:(id)a3
{
}

- (SBHIconImageCacheRequestIdentifying)cacheRequestCancellation
{
  return self->_cacheRequestCancellation;
}

- (void)setCacheRequestCancellation:(id)a3
{
}

- (double)overlayAlpha
{
  return self->_overlayAlpha;
}

- (void)loadContentsImageFromCache:(os_log_t)log animated:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D7F0A000, log, OS_LOG_TYPE_DEBUG, "skipping image load because no icon", v1, 2u);
}

- (void)loadContentsImageFromCache:animated:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1D7F0A000, v0, v1, "skipping image load for %@ because in-flight request matches (%@)");
}

- (void)loadContentsImageFromCache:animated:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "loading image for %@ synchronously", v2, v3, v4, v5, v6);
}

- (void)loadContentsImageFromCache:animated:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "leaving currently displayed image in place while we load image for %@", v2, v3, v4, v5, v6);
}

- (void)loadContentsImageFromCache:animated:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "displaying placeholder while loading image for %@", v2, v3, v4, v5, v6);
}

- (void)loadContentsImageFromCache:animated:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7F0A000, v0, v1, "will load image for %@", v2, v3, v4, v5, v6);
}

void __55__SBIconImageView_loadContentsImageFromCache_animated___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 uniqueIdentifier];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "Missing cached image for icon '%@' after caching should have completed", v4, 0xCu);
}

void __55__SBIconImageView_loadContentsImageFromCache_animated___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_2(&dword_1D7F0A000, a2, a3, "cached image after load returned for %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end