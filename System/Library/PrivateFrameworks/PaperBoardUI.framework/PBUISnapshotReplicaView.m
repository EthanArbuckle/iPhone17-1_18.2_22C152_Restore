@interface PBUISnapshotReplicaView
+ (BOOL)automaticallyNotifiesObserversForValid;
- (BOOL)isFullscreen;
- (BOOL)isSubscribed;
- (BOOL)isValid;
- (BOOL)shouldMatchWallpaperPosition;
- (NSString)reason;
- (PBUIFakeBlurObserver)observer;
- (PBUIPosterReplicaSnapshotProviding)provider;
- (PBUIReplicaDebugView)debugView;
- (PBUIReplicaSnapshotSource)source;
- (PBUISnapshotReplicaView)initWithFrame:(CGRect)a3;
- (double)zoomScale;
- (int64_t)effectiveStyle;
- (unint64_t)transformOptions;
- (void)_updateImageViewRotation;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)invalidate;
- (void)layoutSubviews;
- (void)setEffectiveStyle:(int64_t)a3;
- (void)setFullscreen:(BOOL)a3;
- (void)setNeedsProviderUpdate;
- (void)setNeedsSourceUpdate;
- (void)setObserver:(id)a3;
- (void)setProvider:(id)a3;
- (void)setReason:(id)a3;
- (void)setShouldMatchWallpaperPosition:(BOOL)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)setTransformOptions:(unint64_t)a3;
- (void)setZoomScale:(double)a3;
- (void)willMoveToSuperview:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PBUISnapshotReplicaView

- (void)didMoveToSuperview
{
  id v3 = [(PBUISnapshotReplicaView *)self superview];
  [(PBUISnapshotReplicaView *)self setSubscribed:v3 != 0];
}

- (void)didMoveToWindow
{
  id v3 = [(PBUISnapshotReplicaView *)self window];
  [(PBUISnapshotReplicaView *)self setSubscribed:v3 != 0];
}

- (void)setSubscribed:(BOOL)a3
{
  if (!self->_invalidated && self->_subscribed != a3)
  {
    self->_subscribed = a3;
    if (a3)
    {
      [(PBUISnapshotReplicaView *)self setNeedsProviderUpdate];
    }
    else
    {
      providerToken = self->_providerToken;
      if (providerToken)
      {
        [(BSInvalidatable *)providerToken invalidate];
        v5 = self->_providerToken;
        self->_providerToken = 0;
      }
      sourceToken = self->_sourceToken;
      if (sourceToken)
      {
        [(BSInvalidatable *)sourceToken invalidate];
        v7 = self->_sourceToken;
        self->_sourceToken = 0;
      }
      source = self->_source;
      self->_source = 0;
    }
  }
}

- (void)layoutSubviews
{
  debugView = self->_debugView;
  if (debugView)
  {
    [(PBUISnapshotReplicaView *)self bounds];
    -[PBUIReplicaDebugView setFrame:](debugView, "setFrame:");
  }
  [(PBUISnapshotReplicaView *)self _updateImageViewRotation];
  [(PBUISnapshotReplicaView *)self bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  imageView = self->_imageView;
  if (imageView)
  {
    [(UIImageView *)imageView transform];
    v13 = self->_imageView;
  }
  else
  {
    v13 = 0;
    memset(&v15, 0, sizeof(v15));
  }
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  CGRect v17 = CGRectApplyAffineTransform(v16, &v15);
  -[UIImageView setBounds:](v13, "setBounds:", 0.0, 0.0, v17.size.width, v17.size.height);
  v14 = self->_imageView;
  [(PBUISnapshotReplicaView *)self center];
  -[UIImageView setCenter:](v14, "setCenter:");
}

- (void)_updateImageViewRotation
{
  uint64_t v3 = [(PBUISnapshotReplicaView *)self window];
  if (!v3) {
    goto LABEL_3;
  }
  double v4 = (void *)v3;
  CGFloat v5 = [(PBUISnapshotReplicaView *)self window];
  double v6 = [v5 screen];
  int v7 = [v6 _isEmbeddedScreen];

  CGFloat v8 = 0.0;
  if (v7)
  {
LABEL_3:
    CGFloat v8 = 0.0;
    if (soft_PUIDynamicRotationIsActive())
    {
      uint64_t v9 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
      if ((unint64_t)(v9 - 2) <= 2) {
        CGFloat v8 = dbl_1BC53F2D8[v9 - 2];
      }
    }
  }
  imageView = self->_imageView;
  CGAffineTransformMakeRotation(&v11, v8);
  UIIntegralTransform();
  [(UIImageView *)imageView setTransform:v12];
}

- (void)setNeedsSourceUpdate
{
  p_provider = &self->_provider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  id obj = [WeakRetained snapshotSourceForObserver:self];

  CGFloat v5 = [obj legibilitySettings];
  legibilitySettings = self->_legibilitySettings;
  self->_legibilitySettings = v5;

  p_source = (id *)&self->_source;
  if (BSEqualObjects()) {
    goto LABEL_7;
  }
  [(BSInvalidatable *)self->_sourceToken invalidate];
  sourceToken = self->_sourceToken;
  self->_sourceToken = 0;

  objc_storeStrong((id *)&self->_source, obj);
  id v9 = *p_source;
  if (!*p_source) {
    goto LABEL_7;
  }
  id v10 = objc_loadWeakRetained((id *)p_provider);
  if (v9 == v10) {
    goto LABEL_6;
  }
  CGAffineTransform v11 = v10;
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [*p_source acquireSourceUsageAssertionForView:self];
    id v9 = self->_sourceToken;
    self->_sourceToken = v13;
LABEL_6:
  }
LABEL_7:
  [(PBUISnapshotReplicaView *)self willChangeValueForKey:@"valid"];
  v14 = [obj snapshot];
  CGAffineTransform v15 = v14;
  if (v14)
  {
    [v14 size];
    if (v17 != *MEMORY[0x1E4F1DB30] || v16 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
      [(UIImageView *)self->_imageView setImage:v15];
    }
  }
  [(PBUISnapshotReplicaView *)self _updateImageViewRotation];
  [(PBUISnapshotReplicaView *)self didChangeValueForKey:@"valid"];
  int v19 = [MEMORY[0x1E4F42FF0] _isInAnimationBlockWithAnimationsEnabled];
  [(PBUISnapshotReplicaView *)self setNeedsLayout];
  if (v19) {
    [(PBUISnapshotReplicaView *)self layoutIfNeeded];
  }
}

- (int64_t)effectiveStyle
{
  return self->_effectiveStyle;
}

- (void)willMoveToWindow:(id)a3
{
  if (a3) {
    [(PBUISnapshotReplicaView *)self setSubscribed:1];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  if (a3) {
    [(PBUISnapshotReplicaView *)self setSubscribed:1];
  }
}

- (void)setEffectiveStyle:(int64_t)a3
{
  if (self->_effectiveStyle != a3)
  {
    self->_effectiveStyle = a3;
    [(PBUISnapshotReplicaView *)self setNeedsSourceUpdate];
  }
}

- (void)setProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_provider, obj);
    [(PBUISnapshotReplicaView *)self setNeedsProviderUpdate];
  }
}

- (void)setNeedsProviderUpdate
{
  providerToken = self->_providerToken;
  if (providerToken) {
    [(BSInvalidatable *)providerToken invalidate];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);

  if (WeakRetained)
  {
    self->_subscribed = 1;
    id v5 = objc_loadWeakRetained((id *)&self->_provider);
    double v6 = [v5 registerSnapshotSourceObserver:self];
    int v7 = self->_providerToken;
    self->_providerToken = v6;

    [(PBUISnapshotReplicaView *)self setNeedsSourceUpdate];
  }
}

- (PBUISnapshotReplicaView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)PBUISnapshotReplicaView;
  int v7 = -[PBUISnapshotReplicaView initWithFrame:](&v20, sel_initWithFrame_);
  CGFloat v8 = v7;
  if (v7)
  {
    v7->_subscribed = 0;
    id v9 = objc_alloc(MEMORY[0x1E4F42AA0]);
    [(PBUISnapshotReplicaView *)v8 bounds];
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:");
    imageView = v8->_imageView;
    v8->_imageView = (UIImageView *)v10;

    [(UIImageView *)v8->_imageView setContentMode:2];
    [(UIImageView *)v8->_imageView setOpaque:1];
    char v12 = [(UIImageView *)v8->_imageView layer];
    [v12 setContentsOpaque:1];

    [(UIImageView *)v8->_imageView setAutoresizingMask:18];
    [(PBUISnapshotReplicaView *)v8 addSubview:v8->_imageView];
    [(PBUISnapshotReplicaView *)v8 setAutoresizingMask:18];
    [(PBUISnapshotReplicaView *)v8 setShouldMatchWallpaperPosition:1];
    if (PBUIReplicaDebugModeIsEnabled())
    {
      v13 = -[PBUIReplicaDebugView initWithFrame:]([PBUIReplicaDebugView alloc], "initWithFrame:", x, y, width, height);
      debugView = v8->_debugView;
      v8->_debugView = v13;

      CGAffineTransform v15 = v8->_debugView;
      double v16 = [MEMORY[0x1E4F428B8] blueColor];
      double v17 = [v16 colorWithAlphaComponent:0.4];
      [(PBUIReplicaDebugView *)v15 setColor:v17];

      [(PBUISnapshotReplicaView *)v8 addSubview:v8->_debugView];
    }
    else
    {
      v18 = v8->_debugView;
      v8->_debugView = 0;
    }
  }
  return v8;
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  self->_shouldMatchWallpaperPosition = a3;
  [(PBUISnapshotReplicaView *)self setNeedsLayout];
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_providerToken invalidate];
  [(BSInvalidatable *)self->_sourceToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBUISnapshotReplicaView;
  [(PBUISnapshotReplicaView *)&v3 dealloc];
}

- (void)setFullscreen:(BOOL)a3
{
}

- (BOOL)isFullscreen
{
  return ![(PBUISnapshotReplicaView *)self shouldMatchWallpaperPosition];
}

+ (BOOL)automaticallyNotifiesObserversForValid
{
  return 0;
}

- (BOOL)isValid
{
  if (!self->_source) {
    return 0;
  }
  v2 = [(UIImageView *)self->_imageView image];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setReason:(id)a3
{
  id v7 = a3;
  double v4 = (NSString *)[v7 copy];
  reason = self->_reason;
  self->_reason = v4;

  debugView = self->_debugView;
  if (debugView) {
    [(PBUIReplicaDebugView *)debugView setTitle:v7];
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    [(PBUISnapshotReplicaView *)self removeFromSuperview];
    [(PBUISnapshotReplicaView *)self setSubscribed:0];
    self->_invalidated = 1;
  }
}

- (PBUIFakeBlurObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (PBUIFakeBlurObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (unint64_t)transformOptions
{
  return self->_transformOptions;
}

- (void)setTransformOptions:(unint64_t)a3
{
  self->_transformOptions = a3;
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (PBUIReplicaDebugView)debugView
{
  return self->_debugView;
}

- (BOOL)shouldMatchWallpaperPosition
{
  return self->_shouldMatchWallpaperPosition;
}

- (PBUIPosterReplicaSnapshotProviding)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (PBUIPosterReplicaSnapshotProviding *)WeakRetained;
}

- (NSString)reason
{
  return self->_reason;
}

- (PBUIReplicaSnapshotSource)source
{
  return self->_source;
}

- (BOOL)isSubscribed
{
  return self->_subscribed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_sourceToken, 0);
  objc_storeStrong((id *)&self->_providerToken, 0);
}

@end