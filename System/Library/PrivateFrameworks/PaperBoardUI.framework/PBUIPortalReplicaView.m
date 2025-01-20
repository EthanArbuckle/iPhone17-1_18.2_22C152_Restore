@interface PBUIPortalReplicaView
- (BOOL)_traitsArbiterActive;
- (BOOL)isFullscreen;
- (BOOL)isSubscribed;
- (BOOL)shouldMatchWallpaperPosition;
- (NSString)reason;
- (PBUIPortalReplicaView)initWithFrame:(CGRect)a3;
- (PBUIPosterReplicaPortalProviding)provider;
- (PBUIReplicaDebugView)debugView;
- (PBUIReplicaPortalSource)source;
- (int64_t)effectiveStyle;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)invalidate;
- (void)layoutSubviews;
- (void)setFullscreen:(BOOL)a3;
- (void)setHidesSourceView:(BOOL)a3;
- (void)setNeedsProviderUpdate;
- (void)setNeedsSourceUpdate;
- (void)setProvider:(id)a3;
- (void)setReason:(id)a3;
- (void)setShouldMatchWallpaperPosition:(BOOL)a3;
- (void)setSubscribed:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PBUIPortalReplicaView

- (PBUIPortalReplicaView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)PBUIPortalReplicaView;
  v7 = -[PBUIPortalReplicaView initWithFrame:](&v22, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_subscribed = 0;
    id v9 = objc_alloc(MEMORY[0x1E4F43298]);
    [(PBUIPortalReplicaView *)v8 bounds];
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:");
    portalView = v8->_portalView;
    v8->_portalView = (_UIPortalView *)v10;

    [(_UIPortalView *)v8->_portalView setAutoresizingMask:18];
    [(_UIPortalView *)v8->_portalView setHidesSourceView:0];
    [(_UIPortalView *)v8->_portalView setMatchesPosition:0];
    [(_UIPortalView *)v8->_portalView setMatchesTransform:0];
    [(_UIPortalView *)v8->_portalView setAllowsBackdropGroups:1];
    [(PBUIPortalReplicaView *)v8 addSubview:v8->_portalView];
    [(PBUIPortalReplicaView *)v8 setAutoresizingMask:18];
    [(PBUIPortalReplicaView *)v8 setClipsToBounds:1];
    [(PBUIPortalReplicaView *)v8 setShouldMatchWallpaperPosition:1];
    if (PBUIReplicaDebugModeIsEnabled())
    {
      v12 = -[PBUIReplicaDebugView initWithFrame:]([PBUIReplicaDebugView alloc], "initWithFrame:", x, y, width, height);
      debugView = v8->_debugView;
      v8->_debugView = v12;

      if ([(PBUIPortalReplicaView *)v8 _traitsArbiterActive]) {
        [(PBUIReplicaDebugView *)v8->_debugView setAutoresizingMask:18];
      }
      v14 = NSString;
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      v17 = [v14 stringWithFormat:@"%@ (%p)", v16, v8];

      [(PBUIReplicaDebugView *)v8->_debugView setTitle:v17];
      v18 = v8->_debugView;
      v19 = [MEMORY[0x1E4F428B8] blueColor];
      v20 = [v19 colorWithAlphaComponent:0.4];
      [(PBUIReplicaDebugView *)v18 setColor:v20];

      [(PBUIPortalReplicaView *)v8 addSubview:v8->_debugView];
    }
    else
    {
      v17 = v8->_debugView;
      v8->_debugView = 0;
    }
  }
  return v8;
}

- (int64_t)effectiveStyle
{
  return 0;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_providerToken invalidate];
  [(BSInvalidatable *)self->_sourceToken invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PBUIPortalReplicaView;
  [(PBUIPortalReplicaView *)&v3 dealloc];
}

- (void)setHidesSourceView:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIPortalView *)self->_portalView hidesSourceView] != a3)
  {
    portalView = self->_portalView;
    [(_UIPortalView *)portalView setHidesSourceView:v3];
  }
}

- (void)setShouldMatchWallpaperPosition:(BOOL)a3
{
  self->_shouldMatchWallpaperPosition = a3;
  -[_UIPortalView setMatchesPosition:](self->_portalView, "setMatchesPosition:");
}

- (void)setFullscreen:(BOOL)a3
{
}

- (BOOL)isFullscreen
{
  return ![(PBUIPortalReplicaView *)self shouldMatchWallpaperPosition];
}

- (void)setReason:(id)a3
{
  v4 = (NSString *)[a3 copy];
  reason = self->_reason;
  self->_reason = v4;

  debugView = self->_debugView;
  v7 = self->_reason;
  [(PBUIReplicaDebugView *)debugView setTitle:v7];
}

- (void)setProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_provider, obj);
    [(PBUIPortalReplicaView *)self setNeedsProviderUpdate];
  }
}

- (void)setNeedsSourceUpdate
{
  p_provider = &self->_provider;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  id obj = [WeakRetained portalSourceForReplicaView:self];

  char v5 = [obj legibilitySettings];
  legibilitySettings = self->_legibilitySettings;
  self->_legibilitySettings = v5;

  p_source = (id *)&self->_source;
  if ((BSEqualObjects() & 1) == 0)
  {
    sourceToken = self->_sourceToken;
    if (sourceToken)
    {
      [(BSInvalidatable *)sourceToken invalidate];
      id v9 = self->_sourceToken;
      self->_sourceToken = 0;
    }
    objc_storeStrong((id *)&self->_source, obj);
    id v10 = *p_source;
    if (*p_source)
    {
      id v11 = objc_loadWeakRetained((id *)p_provider);
      if (v10 != v11)
      {
        v12 = v11;
        char v13 = objc_opt_respondsToSelector();

        if ((v13 & 1) == 0) {
          goto LABEL_9;
        }
        v14 = [*p_source acquireSourceUsageAssertionForView:self];
        id v10 = self->_sourceToken;
        self->_sourceToken = v14;
      }
    }
  }
LABEL_9:
  v15 = [obj targetView];
  v16 = [(_UIPortalView *)self->_portalView sourceView];
  char v17 = BSEqualObjects();

  if ((v17 & 1) == 0)
  {
    [(_UIPortalView *)self->_portalView setSourceView:0];
    [(_UIPortalView *)self->_portalView setSourceView:v15];
    [(_UIPortalView *)self->_portalView setMatchesPosition:self->_shouldMatchWallpaperPosition];
  }
  int v18 = [MEMORY[0x1E4F42FF0] _isInAnimationBlockWithAnimationsEnabled];
  [(PBUIPortalReplicaView *)self setNeedsLayout];
  if (v18) {
    [(PBUIPortalReplicaView *)self layoutIfNeeded];
  }
}

- (void)layoutSubviews
{
  if (![(PBUIPortalReplicaView *)self _traitsArbiterActive])
  {
    id v15 = [(_UIPortalView *)self->_portalView sourceView];
    if (v15)
    {
      BOOL v3 = [(PBUIPortalReplicaView *)self superview];

      if (v3)
      {
        v4 = [v15 window];
        char v5 = [(PBUIPortalReplicaView *)self window];

        if (v4 == v5)
        {
          [v15 bounds];
          -[PBUIPortalReplicaView setBounds:](self, "setBounds:");
          [v15 center];
          -[PBUIPortalReplicaView setCenter:](self, "setCenter:");
        }
      }
      if (self->_debugView)
      {
        [v15 bounds];
        objc_msgSend(v15, "convertRect:toView:", self);
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;
        double v13 = v12;
        [(PBUIReplicaDebugView *)self->_debugView setHidden:0];
        -[PBUIReplicaDebugView setFrame:](self->_debugView, "setFrame:", v7, v9, v11, v13);
        [(PBUIReplicaDebugView *)self->_debugView setNeedsLayout];
        [(PBUIReplicaDebugView *)self->_debugView layoutIfNeeded];
      }
    }
    else
    {
      debugView = self->_debugView;
      if (debugView) {
        [(PBUIReplicaDebugView *)debugView setHidden:1];
      }
    }
  }
}

- (BOOL)_traitsArbiterActive
{
  if (soft_PUIFeatureEnabled(0)) {
    return 0;
  }
  return soft_PUIFeatureEnabled(1);
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
    double v6 = [v5 registerPortalSourceObserver:self];
    double v7 = self->_providerToken;
    self->_providerToken = v6;

    [(PBUIPortalReplicaView *)self setNeedsSourceUpdate];
  }
}

- (void)setSubscribed:(BOOL)a3
{
  if (!self->_invalidated && self->_subscribed != a3)
  {
    self->_subscribed = a3;
    if (a3)
    {
      [(PBUIPortalReplicaView *)self setNeedsProviderUpdate];
    }
    else
    {
      providerToken = self->_providerToken;
      if (providerToken)
      {
        [(BSInvalidatable *)providerToken invalidate];
        id v5 = self->_providerToken;
        self->_providerToken = 0;
      }
      sourceToken = self->_sourceToken;
      if (sourceToken)
      {
        [(BSInvalidatable *)sourceToken invalidate];
        double v7 = self->_sourceToken;
        self->_sourceToken = 0;
      }
      source = self->_source;
      self->_source = 0;
    }
  }
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    [(PBUIPortalReplicaView *)self removeFromSuperview];
    [(PBUIPortalReplicaView *)self setSubscribed:0];
    self->_invalidated = 1;
  }
}

- (void)didMoveToWindow
{
  id v3 = [(PBUIPortalReplicaView *)self window];
  [(PBUIPortalReplicaView *)self setSubscribed:v3 != 0];
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  if (!v4
    || ([(PBUIPortalReplicaView *)self setSubscribed:1],
        [v4 screen],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [MEMORY[0x1E4F42D90] mainScreen],
        double v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v5 == v6))
  {
    double v8 = [(_UIPortalView *)self->_portalView portalLayer];
    double v9 = v8;
    uint64_t v10 = 0;
  }
  else
  {
    double v7 = PBUILogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PBUIPortalReplicaView willMoveToWindow:]((uint64_t)self, v7);
    }

    double v8 = [(_UIPortalView *)self->_portalView portalLayer];
    double v9 = v8;
    uint64_t v10 = 1;
  }
  [v8 setCrossDisplay:v10];
}

- (BOOL)shouldMatchWallpaperPosition
{
  return self->_shouldMatchWallpaperPosition;
}

- (PBUIPosterReplicaPortalProviding)provider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_provider);
  return (PBUIPosterReplicaPortalProviding *)WeakRetained;
}

- (NSString)reason
{
  return self->_reason;
}

- (PBUIReplicaDebugView)debugView
{
  return self->_debugView;
}

- (PBUIReplicaPortalSource)source
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
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_sourceToken, 0);
  objc_storeStrong((id *)&self->_providerToken, 0);
}

- (void)willMoveToWindow:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BC4B3000, a2, OS_LOG_TYPE_ERROR, "Enabling %@ as a cross-display portal. I'm told this may have a significant perf impact.", (uint8_t *)&v2, 0xCu);
}

@end