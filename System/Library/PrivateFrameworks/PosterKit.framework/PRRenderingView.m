@interface PRRenderingView
- (BOOL)isAlphaInverted;
- (BOOL)isEmpty;
- (BOOL)isExtensionUserInteractionEnabled;
- (PRRenderingView)initWithOwner:(id)a3 scene:(id)a4 level:(int64_t)a5 extensionUserInteractionEnabled:(BOOL)a6;
- (double)parallaxFactor;
- (int64_t)level;
- (void)invalidate;
- (void)setAlphaInverted:(BOOL)a3;
- (void)setExtensionUserInteractionEnabled:(BOOL)a3;
- (void)setLevel:(int64_t)a3;
- (void)setParallaxFactor:(double)a3;
@end

@implementation PRRenderingView

- (PRRenderingView)initWithOwner:(id)a3 scene:(id)a4 level:(int64_t)a5 extensionUserInteractionEnabled:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  BSDispatchQueueAssertMain();
  v21.receiver = self;
  v21.super_class = (Class)PRRenderingView;
  v12 = [(PRRenderingView *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_owner, v10);
    v14 = [[PRPosterWindow alloc] initWithWindowScene:v11];
    window = v13->_window;
    v13->_window = v14;

    v13->_level = a5;
    v16 = [(PRRenderingView *)v13 layer];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"PRRenderingView - %ld", a5);
    [v16 setName:v17];

    v18 = objc_alloc_init(PRPosterRootViewController);
    [(PRPosterRootViewController *)v18 setView:v13];
    [(PRPosterWindow *)v13->_window setRootViewController:v18];
    [(PRPosterWindow *)v13->_window setUserInteractionEnabled:v6];
    [(PRPosterWindow *)v13->_window setWindowLevel:(double)a5];
    v19 = [(PRPosterWindow *)v13->_window layer];
    [v19 setAllowsHitTesting:v6];

    [(PRPosterWindow *)v13->_window setHidden:0];
  }

  return v13;
}

- (void)setLevel:(int64_t)a3
{
  if (self->_level != a3)
  {
    self->_level = a3;
    [(PRPosterWindow *)self->_window setWindowLevel:(double)a3];
  }
}

- (void)setAlphaInverted:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_alphaInverted != a3)
  {
    BOOL v3 = a3;
    self->_alphaInverted = a3;
    v5 = self->_window;
    if (v3)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      [(PRPosterWindow *)v5 bounds];
      v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
      [(UIView *)v7 setAutoresizingMask:18];
      v8 = [MEMORY[0x1E4FB1618] systemDarkOrangeColor];
      [(UIView *)v7 setBackgroundColor:v8];

      [(PRPosterWindow *)v5 insertSubview:v7 atIndex:0];
      invertedBackgroundCutoutView = self->_invertedBackgroundCutoutView;
      self->_invertedBackgroundCutoutView = v7;
    }
    else
    {
      [(UIView *)self->_invertedBackgroundCutoutView removeFromSuperview];
      invertedBackgroundCutoutView = self->_invertedBackgroundCutoutView;
      self->_invertedBackgroundCutoutView = 0;
    }

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    objc_super v21 = v5;
    id v10 = [(PRPosterWindow *)v5 subviews];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      uint64_t v14 = *MEMORY[0x1E4F3A098];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(UIView **)(*((void *)&v22 + 1) + 8 * i);
          BOOL v17 = v3 && v16 != self->_invertedBackgroundCutoutView;
          v18 = [(UIView *)v16 layer];
          v19 = v18;
          if (v17) {
            uint64_t v20 = v14;
          }
          else {
            uint64_t v20 = 0;
          }
          [v18 setCompositingFilter:v20];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }
  }
}

- (void)setExtensionUserInteractionEnabled:(BOOL)a3
{
  if (self->_extensionUserInteractionEnabled != a3)
  {
    BOOL v3 = a3;
    self->_extensionUserInteractionEnabled = a3;
    -[PRPosterWindow setUserInteractionEnabled:](self->_window, "setUserInteractionEnabled:");
    id v5 = [(PRPosterWindow *)self->_window layer];
    [v5 setAllowsHitTesting:v3];
  }
}

- (BOOL)isEmpty
{
  BOOL v3 = [(PRRenderingView *)self subviews];
  if ([v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    id v5 = [(PRRenderingView *)self backgroundColor];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (void)invalidate
{
  [(PRPosterWindow *)self->_window setHidden:1];
  [(PRRenderingView *)self removeFromSuperview];
  BOOL v3 = [(PRPosterWindow *)self->_window rootViewController];
  [v3 setView:0];

  [(PRPosterWindow *)self->_window setRootViewController:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  [WeakRetained invalidateView:self];

  window = self->_window;
  self->_window = 0;

  objc_storeWeak((id *)&self->_owner, 0);
}

- (int64_t)level
{
  return self->_level;
}

- (double)parallaxFactor
{
  return self->_parallaxFactor;
}

- (void)setParallaxFactor:(double)a3
{
  self->_parallaxFactor = a3;
}

- (BOOL)isAlphaInverted
{
  return self->_alphaInverted;
}

- (BOOL)isExtensionUserInteractionEnabled
{
  return self->_extensionUserInteractionEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invertedBackgroundCutoutView, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_destroyWeak((id *)&self->_owner);
}

@end