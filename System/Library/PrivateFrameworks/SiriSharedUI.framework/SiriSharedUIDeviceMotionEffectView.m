@interface SiriSharedUIDeviceMotionEffectView
- (BOOL)_supportsContentViewTransforms;
- (BOOL)_supportsDeviceMotion;
- (BOOL)isViewHighContrast;
- (SiriSharedUIDeviceMotionEffectView)initWithFrame:(CGRect)a3;
- (id)_currentWindowScene;
- (int64_t)_currentInterfaceOrientation;
- (int64_t)viewAppearanceStyle;
- (void)_cleanUpIfNeeded;
- (void)_configureDeviceMotionIfNeeded;
- (void)_displayLinkFired:(id)a3;
- (void)_motionManagerDidReceiveMotion:(id)a3;
- (void)_updateEffectView;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateMaskingForView:(id)a3;
- (void)viewWillBeUpdated;
@end

@implementation SiriSharedUIDeviceMotionEffectView

- (SiriSharedUIDeviceMotionEffectView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUIDeviceMotionEffectView;
  v3 = -[SiriSharedUIDeviceMotionEffectView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    effectImageView = v3->_effectImageView;
    v3->_effectImageView = v4;

    [(UIImageView *)v3->_effectImageView setContentMode:2];
    [(SiriSharedUIDeviceMotionEffectView *)v3 addSubview:v3->_effectImageView];
    [(SiriSharedUIDeviceMotionEffectView *)v3 _updateEffectView];
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUIDeviceMotionEffectView;
  id v4 = a3;
  [(SiriSharedUIDeviceMotionEffectView *)&v7 traitCollectionDidChange:v4];
  v5 = [(SiriSharedUIDeviceMotionEffectView *)self traitCollection];
  int v6 = [v5 hasDifferentColorAppearanceComparedToTraitCollection:v4];

  if (v6) {
    [(SiriSharedUIDeviceMotionEffectView *)self _updateEffectView];
  }
}

- (void)updateMaskingForView:(id)a3
{
  id v16 = a3;
  if (!v16)
  {
    [(SiriSharedUIDeviceMotionEffectView *)self _cleanUpIfNeeded];
    [(UIImageView *)self->_effectImageView setAlpha:0.0];
    [(SiriSharedUIDeviceMotionEffectView *)self setMaskView:0];
    goto LABEL_8;
  }
  [(UIImageView *)self->_effectImageView setAlpha:1.0];
  id v4 = [(SiriSharedUIDeviceMotionEffectView *)self superview];
  [v16 frame];
  objc_msgSend(v4, "convertRect:toView:", self);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = [(SiriSharedUIDeviceMotionEffectView *)self maskView];
  if (v13 != v16)
  {

LABEL_6:
    objc_msgSend(v16, "setFrame:", v6, v8, v10, v12);
    [(SiriSharedUIDeviceMotionEffectView *)self setMaskView:v16];
    self->_forcefullyUpdateImageViewFrame = 1;
    goto LABEL_7;
  }
  v14 = [(SiriSharedUIDeviceMotionEffectView *)self maskView];
  [v14 frame];
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  BOOL v15 = CGRectEqualToRect(v18, v19);

  if (!v15) {
    goto LABEL_6;
  }
LABEL_7:
  [(SiriSharedUIDeviceMotionEffectView *)self _configureDeviceMotionIfNeeded];
LABEL_8:
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)SiriSharedUIDeviceMotionEffectView;
  [(SiriSharedUIDeviceMotionEffectView *)&v24 layoutSubviews];
  [(SiriSharedUIDeviceMotionEffectView *)self bounds];
  if (!CGRectEqualToRect(v25, *MEMORY[0x263F001A8]))
  {
    BOOL forcefullyUpdateImageViewFrame = self->_forcefullyUpdateImageViewFrame;
    if (self->_forcefullyUpdateImageViewFrame) {
      self->_BOOL forcefullyUpdateImageViewFrame = 0;
    }
    [(SiriSharedUIDeviceMotionEffectView *)self bounds];
    double Height = CGRectGetHeight(v26);
    [(SiriSharedUIDeviceMotionEffectView *)self bounds];
    double Width = CGRectGetWidth(v27);
    [(SiriSharedUIDeviceMotionEffectView *)self bounds];
    if (Height <= Width) {
      double v10 = CGRectGetWidth(*(CGRect *)&v6);
    }
    else {
      double v10 = CGRectGetHeight(*(CGRect *)&v6);
    }
    double v11 = v10 + 200.0;
    [(SiriSharedUIDeviceMotionEffectView *)self bounds];
    double v12 = (CGRectGetWidth(v28) - v11) * 0.5;
    [(SiriSharedUIDeviceMotionEffectView *)self bounds];
    double v13 = (CGRectGetHeight(v29) - v11) * 0.5;
    [(UIImageView *)self->_effectImageView bounds];
    double v14 = CGRectGetWidth(v30);
    v31.origin.x = v12;
    v31.origin.y = v13;
    v31.size.width = v11;
    v31.size.height = v11;
    double v15 = CGRectGetWidth(v31);
    [(UIImageView *)self->_effectImageView bounds];
    double v16 = CGRectGetHeight(v32);
    v33.origin.x = v12;
    v33.origin.y = v13;
    v33.size.width = v11;
    v33.size.height = v11;
    double v17 = CGRectGetHeight(v33);
    if (forcefullyUpdateImageViewFrame
      || (*(uint64_t *)&v14 == *(uint64_t *)&v15 ? (BOOL v18 = *(uint64_t *)&v16 == *(uint64_t *)&v17) : (BOOL v18 = 0), !v18))
    {
      if ([(SiriSharedUIDeviceMotionEffectView *)self _supportsContentViewTransforms])
      {
        memset(&v23[1], 0, sizeof(CGAffineTransform));
        effectImageView = self->_effectImageView;
        if (effectImageView)
        {
          [(UIImageView *)effectImageView transform];
          effectImageView = self->_effectImageView;
        }
        long long v20 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
        *(_OWORD *)&v23[0].a = *MEMORY[0x263F000D0];
        *(_OWORD *)&v23[0].c = v20;
        *(_OWORD *)&v23[0].tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
        [(UIImageView *)effectImageView setTransform:v23];
        -[UIImageView setFrame:](self->_effectImageView, "setFrame:", v12, v13, v11, v11);
        v23[0] = v23[1];
        if (!CGAffineTransformIsIdentity(v23))
        {
          v21 = self->_effectImageView;
          v23[0] = v23[1];
          [(UIImageView *)v21 setTransform:v23];
        }
      }
      else
      {
        -[UIImageView setFrame:](self->_effectImageView, "setFrame:", v12, v13, v11, v11);
      }
    }
    if ([(SiriSharedUIDeviceMotionEffectView *)self _supportsDeviceMotion])
    {
      int64_t v22 = [(SiriSharedUIDeviceMotionEffectView *)self _currentInterfaceOrientation];
      if (v22)
      {
        if (v22 != self->_cachedInterfaceOrientation) {
          self->_cachedInterfaceOrientation = v22;
        }
      }
    }
  }
}

- (BOOL)_supportsDeviceMotion
{
  return !UIAccessibilityIsReduceMotionEnabled() && !UIAccessibilityDarkerSystemColorsEnabled();
}

- (BOOL)_supportsContentViewTransforms
{
  return 1;
}

- (void)_updateEffectView
{
  v3 = [MEMORY[0x263F825C8] clearColor];
  if ([(SiriSharedUIDeviceMotionEffectView *)self isViewHighContrast])
  {
    [MEMORY[0x263F825C8] labelColor];
    id v10 = 0;
    id v4 = v3;
    v3 = double v5 = 0.0;
  }
  else
  {
    int64_t v6 = [(SiriSharedUIDeviceMotionEffectView *)self viewAppearanceStyle];
    double v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    double v8 = v7;
    if (v6 == 1) {
      double v9 = @"deviceMotionEffect_Dark";
    }
    else {
      double v9 = @"deviceMotionEffect_Light";
    }
    id v4 = [v7 pathForResource:v9 ofType:@"png"];

    id v10 = (id)[objc_alloc(MEMORY[0x263F827E8]) initWithContentsOfFile:v4];
    double v5 = 1.0;
  }

  [(UIImageView *)self->_effectImageView setImage:v10];
  [(UIImageView *)self->_effectImageView setAlpha:v5];
  [(SiriSharedUIDeviceMotionEffectView *)self setBackgroundColor:v3];
}

- (void)viewWillBeUpdated
{
  self->_shouldUpdateOffsetRadians = 1;
}

- (void)_configureDeviceMotionIfNeeded
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_shouldUpdateOffsetRadians)
  {
    self->_double initialOffsetRadians = (double)(arc4random() % 0x168) * 3.14159265 / 180.0;
    v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      double initialOffsetRadians = self->_initialOffsetRadians;
      *(_DWORD *)buf = 136315394;
      double v17 = "-[SiriSharedUIDeviceMotionEffectView _configureDeviceMotionIfNeeded]";
      __int16 v18 = 2048;
      double v19 = initialOffsetRadians;
      _os_log_impl(&dword_20C9D5000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact using initial offset radians: %f", buf, 0x16u);
    }
    self->_shouldUpdateOffsetRadians = 0;
  }
  if ([(SiriSharedUIDeviceMotionEffectView *)self _supportsDeviceMotion])
  {
    double v5 = [MEMORY[0x263F82B60] mainScreen];
    double v6 = (float)(1.0 / (float)[v5 maximumFramesPerSecond]);
    self->_rotationIncrementalRateRadians = v6 * 0.20943951;
    if (!self->_motionManager)
    {
      double v7 = (CMMotionManager *)objc_alloc_init(MEMORY[0x263F01788]);
      motionManager = self->_motionManager;
      self->_motionManager = v7;

      [(CMMotionManager *)self->_motionManager setDeviceMotionUpdateInterval:v6];
      [(CMMotionManager *)self->_motionManager startDeviceMotionUpdates];
    }
    if (!self->_displayLink)
    {
      double v9 = [MEMORY[0x263F82B60] mainScreen];
      id v10 = [v9 displayLinkWithTarget:self selector:sel__displayLinkFired_];
      displayLink = self->_displayLink;
      self->_displayLink = v10;

      double v12 = self->_displayLink;
      double v13 = [MEMORY[0x263EFF9F0] mainRunLoop];
      [(CADisplayLink *)v12 addToRunLoop:v13 forMode:*MEMORY[0x263EFF588]];
    }
  }
  else
  {
    [(SiriSharedUIDeviceMotionEffectView *)self _cleanUpIfNeeded];
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __68__SiriSharedUIDeviceMotionEffectView__configureDeviceMotionIfNeeded__block_invoke;
    v14[3] = &unk_2640E3698;
    objc_copyWeak(&v15, (id *)buf);
    v14[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __68__SiriSharedUIDeviceMotionEffectView__configureDeviceMotionIfNeeded__block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && [WeakRetained _supportsContentViewTransforms])
  {
    id v4 = (void *)v3[51];
    CGAffineTransformMakeRotation(&v5, *(CGFloat *)(*(void *)(a1 + 32) + 424));
    [v4 setTransform:&v5];
  }
}

- (void)_displayLinkFired:(id)a3
{
  uint64_t v4 = [(CMMotionManager *)self->_motionManager deviceMotion];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v4 = [(SiriSharedUIDeviceMotionEffectView *)self _motionManagerDidReceiveMotion:v4];
    uint64_t v5 = v6;
  }
  MEMORY[0x270F9A758](v4, v5);
}

- (void)_cleanUpIfNeeded
{
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  [(CMMotionManager *)self->_motionManager stopDeviceMotionUpdates];
  motionManager = self->_motionManager;
  self->_motionManager = 0;
}

- (void)_motionManagerDidReceiveMotion:(id)a3
{
  double initialOffsetRadians = self->_initialOffsetRadians;
  unint64_t v5 = self->_cachedInterfaceOrientation - 3;
  [a3 gravity];
  if (v5 < 2) {
    double v6 = v7;
  }
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeRotation(&v12, initialOffsetRadians + v6 * 5.5);
  self->_double initialOffsetRadians = self->_rotationIncrementalRateRadians + self->_initialOffsetRadians;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__SiriSharedUIDeviceMotionEffectView__motionManagerDidReceiveMotion___block_invoke;
  v8[3] = &unk_2640E3848;
  objc_copyWeak(&v9, &location);
  CGAffineTransform v10 = v12;
  dispatch_async(MEMORY[0x263EF83A0], v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __69__SiriSharedUIDeviceMotionEffectView__motionManagerDidReceiveMotion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 51);
    long long v5 = *(_OWORD *)(a1 + 56);
    v6[0] = *(_OWORD *)(a1 + 40);
    v6[1] = v5;
    v6[2] = *(_OWORD *)(a1 + 72);
    [v4 setTransform:v6];
  }
}

- (id)_currentWindowScene
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = objc_msgSend(MEMORY[0x263F82438], "sharedApplication", 0);
  v3 = [v2 windows];

  uint64_t v4 = (void *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 isKeyWindow])
        {
          uint64_t v4 = [v7 windowScene];
          goto LABEL_11;
        }
      }
      uint64_t v4 = (void *)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (int64_t)_currentInterfaceOrientation
{
  v2 = [(SiriSharedUIDeviceMotionEffectView *)self _currentWindowScene];
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 interfaceOrientation];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)isViewHighContrast
{
  v2 = [(SiriSharedUIDeviceMotionEffectView *)self traitCollection];
  BOOL v3 = [v2 accessibilityContrast] == 1;

  return v3;
}

- (int64_t)viewAppearanceStyle
{
  v2 = [(SiriSharedUIDeviceMotionEffectView *)self traitCollection];
  int64_t v3 = [v2 userInterfaceStyle] == 2;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_effectImageView, 0);
}

@end