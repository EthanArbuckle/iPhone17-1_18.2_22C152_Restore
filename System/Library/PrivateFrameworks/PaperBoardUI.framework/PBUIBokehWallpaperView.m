@interface PBUIBokehWallpaperView
+ (BOOL)allowsParallax;
+ (Class)layerClass;
- (BOOL)_layerIsOutOfBounds:(id)a3;
- (BOOL)_lowPowerModeIsEnabled;
- (BOOL)_needsFallbackImageForBackdropGeneratedImage:(id)a3;
- (BOOL)_thermalStateIsCritical;
- (BOOL)isContentStatic;
- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4;
- (CAGradientLayer)layer;
- (PBUIBokehWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8;
- (__IOSurface)_createSnapshotBuffer;
- (id)_computeAverageColor;
- (id)_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 includeTint:(BOOL)a5 traitCollection:(id)a6;
- (id)cacheGroup;
- (id)snapshotImage;
- (int64_t)userInterfaceStyle;
- (int64_t)wallpaperType;
- (void)_addBokehCircles:(int64_t)a3 inBounds:(CGRect)a4;
- (void)_correctGyroValues:(double *)a3 y:(double *)a4;
- (void)_destroyDisplayLink;
- (void)_handleVariantChange;
- (void)_initDisplayLink;
- (void)_screenDidUpdate:(id)a3;
- (void)_screenDimmed:(id)a3;
- (void)_screenUndimmed:(id)a3;
- (void)_thermalStateDidChange:(id)a3;
- (void)_toggleCircleAnimations:(BOOL)a3;
- (void)_updateGradientAndFillColor;
- (void)_updateOrientationIfNeeded;
- (void)_updateVariantStatus;
- (void)_wallpaperDidChange:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidate;
- (void)setWallpaperAnimationEnabled:(BOOL)a3;
@end

@implementation PBUIBokehWallpaperView

- (void)_updateGradientAndFillColor
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(NSDictionary *)self->_options objectForKey:@"bokehVariant"];
  v4 = [v3 stringValue];

  uint64_t v5 = +[PBUIBokehColorArbiter bokehColorForVariant:]((uint64_t)PBUIBokehColorArbiter, v4);
  v6 = +[PBUIBokehColorArbiter gradientColorsForBokehColor:]((uint64_t)PBUIBokehColorArbiter, v5);
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __53__PBUIBokehWallpaperView__updateGradientAndFillColor__block_invoke;
  v20[3] = &unk_1E62B2798;
  v20[4] = self;
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v20];
  if (v5 != self->_circleFillColor)
  {
    self->_circleFillColor = v5;
    v7 = +[PBUIBokehColorArbiter legibilityColorForBokehColor:]((uint64_t)PBUIBokehColorArbiter, v5);
    [(PBUIWallpaperView *)self updateLegibilitySettingsForAverageColor:v7];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = self->_circleArray;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12++), "setColor:", self->_circleFillColor, (void)v16);
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v10);
    }
  }
  v13 = [(PBUIBokehWallpaperView *)self layer];
  v14 = [v13 colors];

  if (v6 != v14)
  {
    v15 = [(PBUIBokehWallpaperView *)self layer];
    [v15 setColors:v6];
  }
  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __53__PBUIBokehWallpaperView__updateGradientAndFillColor__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (!*(unsigned char *)(v2 + 648) || *(unsigned char *)(v2 + 650))
  {
    v3 = *(void **)(v2 + 632);
    *(void *)(v2 + 632) = 0;

    v4 = *(void **)(v1 + 32);
    return [v4 _notifyBlursInvalidated];
  }
  return result;
}

- (int64_t)userInterfaceStyle
{
  v3 = [MEMORY[0x1E4F42FE0] sharedInstance];
  v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 currentStyle];
  }
  else
  {
    v6 = [(PBUIBokehWallpaperView *)self traitCollection];
    int64_t v5 = [v6 userInterfaceStyle];
  }
  return v5;
}

- (void)_initDisplayLink
{
  if (!self->_displayLink)
  {
    v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__screenDidUpdate_];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    int64_t v5 = self->_displayLink;
    CAFrameRateRange v9 = CAFrameRateRangeMake(20.0, 60.0, 30.0);
    -[CADisplayLink setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
    v6 = self->_displayLink;
    id v7 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [(CADisplayLink *)v6 addToRunLoop:v7 forMode:*MEMORY[0x1E4F1C4B0]];
  }
}

- (void)_destroyDisplayLink
{
  displayLink = self->_displayLink;
  if (displayLink)
  {
    [(CADisplayLink *)displayLink invalidate];
    v4 = self->_displayLink;
    self->_displayLink = 0;
  }
}

- (__IOSurface)_createSnapshotBuffer
{
  v13[5] = *MEMORY[0x1E4F143B8];
  [(PBUIBokehWallpaperView *)self frame];
  uint64_t v4 = v3;
  v12[0] = *MEMORY[0x1E4F2F2C0];
  int64_t v5 = [NSNumber numberWithUnsignedInt:v2];
  v13[0] = v5;
  v12[1] = *MEMORY[0x1E4F2F0E8];
  v6 = [NSNumber numberWithUnsignedInt:v4];
  v13[1] = v6;
  v12[2] = *MEMORY[0x1E4F2F150];
  id v7 = [NSNumber numberWithUnsignedInt:1111970369];
  v13[2] = v7;
  v12[3] = *MEMORY[0x1E4F2EFD8];
  v8 = [NSNumber numberWithUnsignedInt:4];
  v12[4] = *MEMORY[0x1E4F2EFE8];
  v13[3] = v8;
  v13[4] = &unk_1F162C708;
  CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:5];

  uint64_t v10 = IOSurfaceCreate(v9);
  return v10;
}

- (PBUIBokehWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  v50.receiver = self;
  v50.super_class = (Class)PBUIBokehWallpaperView;
  long long v18 = -[PBUIWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v50, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v17, a5, a6, a7, a8, x, y, width, height);
  long long v19 = v18;
  if (!v18) {
    goto LABEL_10;
  }
  v20 = [(PBUIBokehWallpaperView *)v18 layer];
  [v20 setSortsSublayers:1];

  v19->_snapshotBuffer = [(PBUIBokehWallpaperView *)v19 _createSnapshotBuffer];
  v19->_contentIsVisible = 1;
  [(PBUIBokehWallpaperView *)v19 _handleVariantChange];
  uint64_t v21 = [v17 proceduralWallpaperOptions];
  options = v19->_options;
  v19->_options = (NSDictionary *)v21;

  v23 = [MEMORY[0x1E4F28B50] mainBundle];
  v24 = [v23 bundleIdentifier];
  if ([v24 isEqualToString:@"com.apple.springboard"])
  {

LABEL_5:
    v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v19 selector:sel__screenDimmed_ name:@"SBLockScreenDimmedNotification" object:0];

    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v19 selector:sel__screenUndimmed_ name:@"SBLockScreenUndimmedNotification" object:0];

    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v19 selector:sel__wallpaperDidChange_ name:@"SBFWallpaperDidChangeNotification" object:0];

    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v19 selector:sel__thermalStateDidChange_ name:*MEMORY[0x1E4F287F0] object:0];

    goto LABEL_6;
  }
  v25 = [MEMORY[0x1E4F28B50] mainBundle];
  v26 = [v25 bundleIdentifier];
  int v27 = [v26 isEqualToString:@"com.apple.PaperBoard"];

  if (v27) {
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
  circleArradouble y = v19->_circleArray;
  v19->_circleArradouble y = (NSMutableArray *)v32;

  [(PBUIBokehWallpaperView *)v19 _updateGradientAndFillColor];
  [(PBUIBokehWallpaperView *)v19 bounds];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  v42 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v43 = [v42 userInterfaceIdiom];

  if (v43 == 1)
  {
    UIRectCenteredRect();
    double v35 = v44;
    double v37 = v45;
    double v39 = v46;
    double v41 = v47;
    double v48 = v47 / 22.0 * 1.3;
  }
  else
  {
    double v48 = v41 / 28.0;
  }
  -[PBUIBokehWallpaperView _addBokehCircles:inBounds:](v19, "_addBokehCircles:inBounds:", (uint64_t)v48, v35, v37, v39, v41);
  [(PBUIWallpaperView *)v19 setParallaxEnabled:0];
  [(PBUIBokehWallpaperView *)v19 _toggleCircleAnimations:0];
  [(PBUIBokehWallpaperView *)v19 setWallpaperAnimationEnabled:1];
  v19->_blursNeedInvalidation = 1;
LABEL_10:

  return v19;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAGradientLayer)layer
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIBokehWallpaperView;
  double v2 = [(PBUIBokehWallpaperView *)&v4 layer];
  return (CAGradientLayer *)v2;
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)PBUIBokehWallpaperView;
  [(PBUIWallpaperView *)&v3 didMoveToWindow];
  if ([(PBUIWallpaperView *)self wallpaperAnimationEnabled]) {
    [(PBUIBokehWallpaperView *)self setWallpaperAnimationEnabled:1];
  }
}

- (void)_addBokehCircles:(int64_t)a3 inBounds:(CGRect)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3 >= 1)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    int64_t v9 = a3;
    do
    {
      uint64_t v10 = -[PBUIBokehWallpaperCircle initWithSuperviewBounds:color:]([PBUIBokehWallpaperCircle alloc], "initWithSuperviewBounds:color:", self->_circleFillColor, x, y, width, height);
      [(NSMutableArray *)self->_circleArray addObject:v10];

      --v9;
    }
    while (v9);
  }
  uint64_t v11 = [(PBUIBokehWallpaperView *)self layer];
  [v11 setAllowsGroupBlending:0];

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  BOOL v12 = [(PBUIBokehWallpaperView *)self _lowPowerModeIsEnabled];
  BOOL v13 = [(PBUIBokehWallpaperView *)self _thermalStateIsCritical];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v14 = self->_circleArray;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v24;
    uint64_t v18 = *MEMORY[0x1E4F3A220];
    int v19 = v12 || v13;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        objc_msgSend(v21, "randomize", (void)v23);
        [v21 setCompositingFilter:v18];
        if (v19) {
          [v21 configureAnimationsWithPhase:(float)((float)((float)((float)rand() * 4.6566e-10) * 26.0) + 8.0)];
        }
        uint64_t v22 = [(PBUIBokehWallpaperView *)self layer];
        [v22 addSublayer:v21];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v16);
  }

  [MEMORY[0x1E4F39CF8] commit];
}

- (BOOL)_layerIsOutOfBounds:(id)a3
{
  id v3 = a3;
  [v3 superviewBounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 size];
  CGFloat v13 = -v12;
  [v3 size];
  CGFloat v15 = -v14;
  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.CGFloat width = v9;
  v26.size.CGFloat height = v11;
  CGRect v27 = CGRectInset(v26, v13, v15);
  CGFloat x = v27.origin.x;
  CGFloat y = v27.origin.y;
  CGFloat width = v27.size.width;
  CGFloat height = v27.size.height;
  [v3 position];
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  v25.CGFloat x = v21;
  v25.CGFloat y = v23;
  return !CGRectContainsPoint(v28, v25);
}

- (void)_correctGyroValues:(double *)a3 y:(double *)a4
{
  uint64_t v6 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
  switch(v6)
  {
    case 4:
      double v7 = *a3;
      *a3 = *a4;
      break;
    case 3:
      double v8 = *a3;
      *a3 = -*a4;
      goto LABEL_8;
    case 2:
      *a3 = -*a3;
      double v7 = *a4;
      break;
    default:
      return;
  }
  double v8 = -v7;
LABEL_8:
  *a4 = v8;
}

- (void)_thermalStateDidChange:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__PBUIBokehWallpaperView__thermalStateDidChange___block_invoke;
  block[3] = &unk_1E62B2798;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __49__PBUIBokehWallpaperView__thermalStateDidChange___block_invoke(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4F28F80] processInfo];
  BOOL v3 = [v2 thermalState] != 3;

  double v4 = *(void **)(a1 + 32);
  return [v4 setWallpaperAnimationEnabled:v3];
}

- (BOOL)_lowPowerModeIsEnabled
{
  double v2 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v3 = [v2 bundleIdentifier];
  if ([v3 isEqualToString:@"com.apple.springboard"])
  {

LABEL_4:
    double v7 = [MEMORY[0x1E4F28F80] processInfo];
    char v8 = [v7 isLowPowerModeEnabled];

    return v8;
  }
  double v4 = [MEMORY[0x1E4F28B50] mainBundle];
  CGFloat v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.PaperBoard"];

  if (v6) {
    goto LABEL_4;
  }
  return 0;
}

- (BOOL)_thermalStateIsCritical
{
  double v2 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v3 = [v2 bundleIdentifier];
  if ([v3 isEqualToString:@"com.apple.springboard"])
  {
  }
  else
  {
    double v4 = [MEMORY[0x1E4F28B50] mainBundle];
    CGFloat v5 = [v4 bundleIdentifier];
    int v6 = [v5 isEqualToString:@"com.apple.PaperBoard"];

    if (!v6) {
      return 0;
    }
  }
  double v7 = [MEMORY[0x1E4F28F80] processInfo];
  BOOL v8 = [v7 thermalState] == 3;

  return v8;
}

- (void)setWallpaperAnimationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PBUIBokehWallpaperView;
  -[PBUIWallpaperView setWallpaperAnimationEnabled:](&v13, sel_setWallpaperAnimationEnabled_);
  if ([(PBUIWallpaperView *)self _isVisible])
  {
    if (self->_contentIsVisible || !v3) {
      goto LABEL_9;
    }
  }
  else if (!v3)
  {
LABEL_9:
    if ([(PBUIWallpaperView *)self _isVisible])
    {
      cachedSnapshotImage = self->_cachedSnapshotImage;
      self->_cachedSnapshotImage = 0;

      CGFloat v11 = [(PBUIBokehWallpaperView *)self snapshotImage];
      double v12 = self->_cachedSnapshotImage;
      self->_cachedSnapshotImage = v11;
    }
    if ((((self->_displayLink == 0) ^ v3) & 1) == 0)
    {
      if (self->_blursNeedInvalidation)
      {
        [(PBUIWallpaperView *)self _notifyBlursInvalidated];
        self->_blursNeedInvalidation = 0;
      }
      if (v3)
      {
        if (self->_contentIsVisible
          && ![(PBUIBokehWallpaperView *)self _lowPowerModeIsEnabled]
          && ![(PBUIBokehWallpaperView *)self _thermalStateIsCritical])
        {
          [(PBUIBokehWallpaperView *)self _toggleCircleAnimations:1];
          [(PBUIBokehWallpaperView *)self _initDisplayLink];
        }
      }
      else
      {
        [(PBUIBokehWallpaperView *)self _destroyDisplayLink];
        [(PBUIBokehWallpaperView *)self _toggleCircleAnimations:0];
      }
    }
    return;
  }
  CGFloat v5 = [MEMORY[0x1E4F28B50] mainBundle];
  int v6 = [v5 bundleIdentifier];
  if ([v6 isEqualToString:@"com.apple.springboard"])
  {

    return;
  }
  double v7 = [MEMORY[0x1E4F28B50] mainBundle];
  BOOL v8 = [v7 bundleIdentifier];
  char v9 = [v8 isEqualToString:@"com.apple.PaperBoard"];

  if ((v9 & 1) == 0) {
    goto LABEL_9;
  }
}

- (void)_toggleCircleAnimations:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v4 = self->_circleArray;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setAnimationsEnabled:", v3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_updateOrientationIfNeeded
{
  size_t Width = IOSurfaceGetWidth(self->_snapshotBuffer);
  size_t Height = IOSurfaceGetHeight(self->_snapshotBuffer);
  [(PBUIBokehWallpaperView *)self frame];
  double v5 = CGRectGetWidth(v11);
  [(PBUIBokehWallpaperView *)self frame];
  int v6 = (Width < Height) ^ (v5 < CGRectGetHeight(v12));
  if (Height) {
    BOOL v7 = Width == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || v6 != 0)
  {
    CFRelease(self->_snapshotBuffer);
    self->_snapshotBuffer = [(PBUIBokehWallpaperView *)self _createSnapshotBuffer];
    cachedSnapshotImage = self->_cachedSnapshotImage;
    self->_cachedSnapshotImage = 0;
  }
}

- (void)_handleVariantChange
{
  v4.receiver = self;
  v4.super_class = (Class)PBUIBokehWallpaperView;
  [(PBUIWallpaperView *)&v4 _handleVariantChange];
  BOOL v3 = [(PBUIWallpaperView *)self variant] == 0;
  if (self->_isOnLockScreen != v3) {
    self->_isOnLockScreen = v3;
  }
  [(PBUIBokehWallpaperView *)self _updateVariantStatus];
}

- (void)_screenDidUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PBUIWallpaperView *)self _isVisible])
  {
    cachedSnapshotImage = self->_cachedSnapshotImage;
    self->_cachedSnapshotImage = 0;

    self->_blursNeedInvalidation = 1;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setAnimationDuration:0.699999988];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v6 = self->_circleArray;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          CGRect v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (-[PBUIBokehWallpaperView _layerIsOutOfBounds:](self, "_layerIsOutOfBounds:", v11, (void)v13))
          {
            [v11 randomize];
          }
          else
          {
            [v4 duration];
            objc_msgSend(v11, "updatePositionWithTime:dx:dy:lockScreen:", self->_isOnLockScreen);
          }
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }

    [MEMORY[0x1E4F39CF8] commit];
  }
  else
  {
    if (self->_hasSingleVariant)
    {
      CGRect v12 = self->_cachedSnapshotImage;
      self->_cachedSnapshotImage = 0;

      self->_blursNeedInvalidation = 1;
    }
    [(PBUIBokehWallpaperView *)self setWallpaperAnimationEnabled:0];
  }
}

- (void)_wallpaperDidChange:(id)a3
{
  CGRect v11 = objc_alloc_init(PBUIWallpaperConfigurationManager);
  id v4 = [(PBUIWallpaperConfigurationManager *)v11 wallpaperConfigurationForVariant:[(PBUIWallpaperView *)self variant] includingValuesForTypes:0 wallpaperMode:0];
  double v5 = [v4 proceduralWallpaperOptions];
  int v6 = [v5 objectForKey:@"bokehVariant"];
  uint64_t v7 = [v6 stringValue];
  uint64_t v8 = [(NSDictionary *)self->_options objectForKey:@"bokehVariant"];
  uint64_t v9 = [v8 stringValue];
  char v10 = [v7 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_options, v5);
    [(PBUIBokehWallpaperView *)self _updateGradientAndFillColor];
  }
}

- (id)_computeAverageColor
{
  return +[PBUIBokehColorArbiter legibilityColorForBokehColor:]((uint64_t)PBUIBokehColorArbiter, self->_circleFillColor);
}

- (void)_screenDimmed:(id)a3
{
  self->_contentIsVisible = 0;
}

- (void)_screenUndimmed:(id)a3
{
  self->_contentIsVisible = 1;
  [(PBUIBokehWallpaperView *)self setWallpaperAnimationEnabled:1];
}

- (void)_updateVariantStatus
{
  CGRect v12 = objc_alloc_init(PBUIWallpaperConfigurationManager);
  BOOL v3 = [(PBUIWallpaperConfigurationManager *)v12 wallpaperConfigurationForVariant:0 includingValuesForTypes:0 wallpaperMode:0];
  id v4 = [v3 proceduralWallpaperOptions];
  double v5 = [v4 objectForKey:@"bokehVariant"];
  int v6 = [v5 stringValue];

  uint64_t v7 = [(PBUIWallpaperConfigurationManager *)v12 wallpaperConfigurationForVariant:1 includingValuesForTypes:0 wallpaperMode:0];
  uint64_t v8 = [v7 proceduralWallpaperOptions];
  uint64_t v9 = [v8 objectForKey:@"bokehVariant"];
  char v10 = [v9 stringValue];

  int v11 = [v10 isEqualToString:v6];
  if (self->_hasSingleVariant != v11) {
    self->_hasSingleVariant = v11;
  }
}

- (id)_generateImageFromImage:(id)a3 forBackdropParameters:(id *)a4 includeTint:(BOOL)a5 traitCollection:(id)a6
{
  BOOL v7 = a5;
  v33[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  CGRect v12 = v11;
  int64_t var7 = a4->var7;
  if (var7 == 1)
  {
    long long v16 = (void *)MEMORY[0x1E4F42F80];
    v33[0] = v11;
    uint64_t v17 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:1];
    v33[1] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    uint64_t v19 = [v16 traitCollectionWithTraitsFromCollections:v18];

    CGRect v12 = (void *)v19;
    goto LABEL_13;
  }
  if (var7)
  {
LABEL_13:
    a4->double var3 = 1.79769313e308;
    uint64_t v20 = +[PBUIBokehColorArbiter colorSwatchForBokehColor:]((uint64_t)PBUIBokehColorArbiter, self->_circleFillColor);

    v27.receiver = self;
    v27.super_class = (Class)PBUIBokehWallpaperView;
    long long v21 = *(_OWORD *)&a4->var2;
    long long v28 = *(_OWORD *)&a4->var0;
    long long v29 = v21;
    long long v22 = *(_OWORD *)&a4->var6;
    long long v30 = *(_OWORD *)&a4->var4;
    long long v31 = v22;
    CGFloat v23 = [(PBUIWallpaperView *)&v27 _generateImageFromImage:v20 forBackdropParameters:&v28 includeTint:v7 traitCollection:v12];
    id v10 = (id)v20;
    goto LABEL_16;
  }
  if (a4->var0 == -2
    && a4->var1 == *MEMORY[0x1E4F43F90]
    && !a4->var2
    && ((double var3 = a4->var3, var3 == 1.79769313e308) || var3 == 0.0)
    && a4->var4 == 1.79769313e308
    && a4->var5 == 1.79769313e308
    && a4->var6 == 1.79769313e308)
  {
    uint64_t v15 = [(PBUIBokehWallpaperView *)self snapshotImage];
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)PBUIBokehWallpaperView;
    long long v24 = *(_OWORD *)&a4->var2;
    long long v28 = *(_OWORD *)&a4->var0;
    long long v29 = v24;
    long long v25 = *(_OWORD *)&a4->var6;
    long long v30 = *(_OWORD *)&a4->var4;
    long long v31 = v25;
    uint64_t v15 = [(PBUIWallpaperView *)&v32 _generateImageFromImage:v10 forBackdropParameters:&v28 includeTint:v7 traitCollection:v11];
  }
  CGFloat v23 = (void *)v15;
LABEL_16:

  return v23;
}

- (BOOL)_needsFallbackImageForBackdropGeneratedImage:(id)a3
{
  return 0;
}

- (BOOL)isContentStatic
{
  return 0;
}

- (id)snapshotImage
{
  cachedSnapshotImage = self->_cachedSnapshotImage;
  if (!cachedSnapshotImage)
  {
    [(PBUIBokehWallpaperView *)self _updateOrientationIfNeeded];
    id v4 = (void *)MEMORY[0x1E4F42A80];
    double v5 = [(PBUIBokehWallpaperView *)self layer];
    objc_msgSend(v4, "pbui_imageSnapshotFromLayer:buffer:", v5, self->_snapshotBuffer);
    int v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = self->_cachedSnapshotImage;
    self->_cachedSnapshotImage = v6;

    cachedSnapshotImage = self->_cachedSnapshotImage;
  }
  return cachedSnapshotImage;
}

- (id)cacheGroup
{
  return 0;
}

- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4
{
  id v5 = a3;
  if ([v5 wallpaperType] == 2)
  {
    options = self->_options;
    BOOL v7 = [v5 proceduralWallpaperOptions];
    BOOL v8 = [(NSDictionary *)options isEqualToDictionary:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (int64_t)wallpaperType
{
  return 2;
}

+ (BOOL)allowsParallax
{
  return 0;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = [v3 bundleIdentifier];
  if ([v4 isEqualToString:@"com.apple.springboard"])
  {

LABEL_4:
    BOOL v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 removeObserver:self name:@"SBLockScreenDimmedNotification" object:0];

    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:self name:@"SBLockScreenUndimmedNotification" object:0];

    id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 removeObserver:self name:@"SBWallpaperDidChangeNotification" object:0];

    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 removeObserver:self name:*MEMORY[0x1E4F287F0] object:0];

    CGRect v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 removeObserver:self name:*MEMORY[0x1E4F287E8] object:0];

    goto LABEL_5;
  }
  id v5 = [MEMORY[0x1E4F28B50] mainBundle];
  int v6 = [v5 bundleIdentifier];
  int v7 = [v6 isEqualToString:@"com.apple.PaperBoard"];

  if (v7) {
    goto LABEL_4;
  }
LABEL_5:
  CFRelease(self->_snapshotBuffer);
  v13.receiver = self;
  v13.super_class = (Class)PBUIBokehWallpaperView;
  [(PBUIWallpaperView *)&v13 dealloc];
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSnapshotImage, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_circleArray, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end