@interface _UINavigationBarTitleRenameRemoteView
- (CGSize)intrinsicContentSize;
- (_UINavigationBarTitleRenameRemoteView)initWithSession:(id)a3;
- (_UINavigationBarTitleRenamerRemoteSession)session;
- (_UIPortalView)portalView;
- (double)horizontalTextInset;
- (id)horizontalTextInsetDidChangeCallback;
- (int64_t)textAlignment;
- (void)_connect;
- (void)_disconnect;
- (void)setBounds:(CGRect)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHorizontalTextInset:(double)a3;
- (void)setHorizontalTextInsetDidChangeCallback:(id)a3;
- (void)setIntrinsicContentSize:(CGSize)a3;
- (void)setNeedsMetricsUpdate;
- (void)setPortalView:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)updateMetrics;
- (void)updateMetricsIfNeeded;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UINavigationBarTitleRenameRemoteView

- (_UINavigationBarTitleRenameRemoteView)initWithSession:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UINavigationBarTitleRenameRemoteView.m", 43, @"Invalid parameter not satisfying: %@", @"[session isKindOfClass:[_UINavigationBarTitleRenamerRemoteSession class]]" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)_UINavigationBarTitleRenameRemoteView;
  v7 = [(UIView *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_session, a3);
    v8->_textAlignment = 4;
  }

  return v8;
}

- (void)willMoveToWindow:(id)a3
{
  id v6 = a3;
  v4 = [(UIView *)self window];

  v5 = v6;
  if (v6)
  {
    if (v4) {
      goto LABEL_7;
    }
    [(_UINavigationBarTitleRenameRemoteView *)self _connect];
  }
  else
  {
    if (!v4) {
      goto LABEL_7;
    }
    [(_UINavigationBarTitleRenameRemoteView *)self _disconnect];
  }
  v5 = v6;
LABEL_7:
}

- (void)setPortalView:(id)a3
{
  v5 = (_UIPortalView *)a3;
  portalView = self->_portalView;
  v7 = v5;
  if (portalView != v5)
  {
    [(UIView *)portalView removeFromSuperview];
    [(UIView *)self bounds];
    -[_UIPortalView setFrame:](v7, "setFrame:");
    [(UIView *)v7 setAutoresizingMask:18];
    [(UIView *)self addSubview:v7];
    objc_storeStrong((id *)&self->_portalView, a3);
  }
}

- (void)setIntrinsicContentSize:(CGSize)a3
{
  if (a3.width != self->_intrinsicContentSize.width || a3.height != self->_intrinsicContentSize.height)
  {
    self->_intrinsicContentSize = a3;
    [(UIView *)self invalidateIntrinsicContentSize];
  }
}

- (CGSize)intrinsicContentSize
{
  double width = self->_intrinsicContentSize.width;
  double height = self->_intrinsicContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNeedsMetricsUpdate
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    v3 = [(_UINavigationBarTitleRenameRemoteView *)self portalView];

    if (v3)
    {
      *(unsigned char *)&self->_flags |= 1u;
      [(_UINavigationBarTitleRenameRemoteView *)self performSelector:sel_updateMetricsIfNeeded withObject:0 afterDelay:0.0];
    }
  }
}

- (void)updateMetricsIfNeeded
{
  if (*(unsigned char *)&self->_flags) {
    [(_UINavigationBarTitleRenameRemoteView *)self updateMetrics];
  }
}

- (void)updateMetrics
{
  *(unsigned char *)&self->_flags &= ~1u;
  [MEMORY[0x1E4F29060] cancelPreviousPerformRequestsWithTarget:self selector:a2 object:0];
  objc_initWeak(&location, self);
  v3 = [_UIONavigationBarTitleRenamerViewMetricsUpdateAction alloc];
  [(UIView *)self frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  int64_t v12 = [(_UINavigationBarTitleRenameRemoteView *)self textAlignment];
  v13 = [(_UINavigationBarTitleRenameRemoteView *)self session];
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __54___UINavigationBarTitleRenameRemoteView_updateMetrics__block_invoke;
  v20 = &unk_1E52E9550;
  objc_copyWeak(&v21, &location);
  v14 = -[_UIONavigationBarTitleRenamerViewMetricsUpdateAction initWithFrame:textAlignment:session:responseHandler:](v3, "initWithFrame:textAlignment:session:responseHandler:", v12, v13, &v17, v5, v7, v9, v11);

  v15 = [(_UINavigationBarTitleRenameRemoteView *)self session];
  v16 = [v15 overlayService];
  [v16 sendOverlayAction:v14];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenameRemoteView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UINavigationBarTitleRenameRemoteView *)self setNeedsMetricsUpdate];
}

- (void)setCenter:(CGPoint)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenameRemoteView;
  -[UIView setCenter:](&v4, sel_setCenter_, a3.x, a3.y);
  [(_UINavigationBarTitleRenameRemoteView *)self setNeedsMetricsUpdate];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UINavigationBarTitleRenameRemoteView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(_UINavigationBarTitleRenameRemoteView *)self setNeedsMetricsUpdate];
}

- (void)_connect
{
  objc_super v4 = [(_UINavigationBarTitleRenameRemoteView *)self portalView];

  if (v4)
  {
    double v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_UINavigationBarTitleRenameRemoteView.m" lineNumber:155 description:@"Remote view is already connected."];
  }
  double v5 = [_UIPortalView alloc];
  [(UIView *)self bounds];
  double v7 = -[_UIPortalView initWithFrame:](v5, "initWithFrame:");
  [(_UIPortalView *)v7 setName:@"_UINavigationBarTitleRenameRemoteView.textfield"];
  [(UIView *)v7 setAutoresizingMask:0];
  [(_UIPortalView *)v7 setHidesSourceView:1];
  [(_UIPortalView *)v7 setAllowsHitTesting:1];
  [(_UIPortalView *)v7 _setAllowedInContextTransform:1];
  [(_UINavigationBarTitleRenameRemoteView *)self setPortalView:v7];
  [(_UINavigationBarTitleRenameRemoteView *)self updateMetrics];
}

- (void)_disconnect
{
  v3 = [(_UINavigationBarTitleRenameRemoteView *)self session];
  [v3 cancelSession];

  objc_super v4 = [(_UINavigationBarTitleRenameRemoteView *)self portalView];
  [v4 removeFromSuperview];

  [(_UINavigationBarTitleRenameRemoteView *)self setPortalView:0];
}

- (void)setHorizontalTextInset:(double)a3
{
  if (self->_horizontalTextInset != a3)
  {
    self->_horizontalTextInset = a3;
    horizontalTextInsetDidChangeCallback = (void (**)(void))self->_horizontalTextInsetDidChangeCallback;
    if (horizontalTextInsetDidChangeCallback) {
      horizontalTextInsetDidChangeCallback[2]();
    }
  }
}

- (double)horizontalTextInset
{
  return self->_horizontalTextInset;
}

- (void)setTextAlignment:(int64_t)a3
{
  if (self->_textAlignment != a3)
  {
    self->_textAlignment = a3;
    [(_UINavigationBarTitleRenameRemoteView *)self setNeedsMetricsUpdate];
  }
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (id)horizontalTextInsetDidChangeCallback
{
  return self->_horizontalTextInsetDidChangeCallback;
}

- (void)setHorizontalTextInsetDidChangeCallback:(id)a3
{
}

- (_UINavigationBarTitleRenamerRemoteSession)session
{
  return self->_session;
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_horizontalTextInsetDidChangeCallback, 0);
}

@end