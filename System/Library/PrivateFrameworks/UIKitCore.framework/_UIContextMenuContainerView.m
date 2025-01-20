@interface _UIContextMenuContainerView
- (BOOL)allowsDragEventsToPassthrough;
- (BOOL)isScrollEnabled;
- (BOOL)isTransparentFocusItem;
- (BOOL)passesBackgroundViewTouchesThrough;
- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5;
- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3;
- (UIView)contentWrapperView;
- (_UIContextMenuContainerView)initWithFrame:(CGRect)a3 allowsBackgroundInteractionAcrossProccesses:(BOOL)a4;
- (id)dismissalHandler;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)sizeChangeHandler;
- (id)subtreeTraitPropagationHandler;
- (void)_attemptDismiss:(BOOL)a3;
- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4;
- (void)_sceneGeometryWillUpdate:(id)a3;
- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4;
- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)setAllowsDragEventsToPassthrough:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentWrapperView:(id)a3;
- (void)setDismissalHandler:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPassesBackgroundViewTouchesThrough:(BOOL)a3;
- (void)setSizeChangeHandler:(id)a3;
- (void)setSubtreeTraitPropagationHandler:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIContextMenuContainerView

- (BOOL)isTransparentFocusItem
{
  return 0;
}

- (_UIContextMenuContainerView)initWithFrame:(CGRect)a3 allowsBackgroundInteractionAcrossProccesses:(BOOL)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuContainerView;
  v5 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    if (!a4)
    {
      v7 = [(UIView *)v5 traitCollection];
      v8 = _UIContextMenuGetPlatformMetrics([v7 userInterfaceIdiom]);

      if ([v8 supportsPassthroughInteraction])
      {
        v9 = objc_alloc_init(_UIPassthroughScrollInteraction);
        passthroughInteraction = v6->_passthroughInteraction;
        v6->_passthroughInteraction = v9;

        [(_UIPassthroughScrollInteraction *)v6->_passthroughInteraction setDelegate:v6];
        [(_UIPassthroughScrollInteraction *)v6->_passthroughInteraction setRecognizeOnPrimaryButtonDown:1];
        [(_UIPassthroughScrollInteraction *)v6->_passthroughInteraction setRecognizeOnSecondaryButtonDown:1];
        -[_UIPassthroughScrollInteraction setHitTestsAsOpaque:](v6->_passthroughInteraction, "setHitTestsAsOpaque:", [v8 containerViewsHitTestAsOpaque]);
      }
      uint64_t v11 = [v8 containerViewsHitTestAsOpaque];
      v12 = [(UIView *)v6 layer];
      [v12 setHitTestsAsOpaque:v11];
    }
    [(UIView *)v6 _setOverrideUserInterfaceRenderingMode:1];
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIWindowSceneWillUpdateEffectiveGeometryNotification" object:0];

  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuContainerView;
  [(UIView *)&v4 dealloc];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v26.receiver = self;
  v26.super_class = (Class)_UIContextMenuContainerView;
  -[UIView setBounds:](&v26, sel_setBounds_, x, y, width, height);
  uint64_t v16 = [(_UIContextMenuContainerView *)self sizeChangeHandler];
  if (v16)
  {
    v17 = (void *)v16;
    [(UIView *)self bounds];
    v28.origin.double x = v18;
    v28.origin.double y = v19;
    v28.size.double width = v20;
    v28.size.double height = v21;
    v27.origin.double x = v9;
    v27.origin.double y = v11;
    v27.size.double width = v13;
    v27.size.double height = v15;
    BOOL v22 = CGRectEqualToRect(v27, v28);

    if (!v22)
    {
      v23 = [(_UIContextMenuContainerView *)self sizeChangeHandler];
      [(UIView *)self bounds];
      v23[2](v23, v24, v25);
    }
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self frame];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  v26.receiver = self;
  v26.super_class = (Class)_UIContextMenuContainerView;
  -[UIView setFrame:](&v26, sel_setFrame_, x, y, width, height);
  uint64_t v16 = [(_UIContextMenuContainerView *)self sizeChangeHandler];
  if (v16)
  {
    v17 = (void *)v16;
    [(UIView *)self frame];
    v28.origin.double x = v18;
    v28.origin.double y = v19;
    v28.size.double width = v20;
    v28.size.double height = v21;
    v27.origin.double x = v9;
    v27.origin.double y = v11;
    v27.size.double width = v13;
    v27.size.double height = v15;
    BOOL v22 = CGRectEqualToRect(v27, v28);

    if (!v22)
    {
      v23 = [(_UIContextMenuContainerView *)self sizeChangeHandler];
      [(UIView *)self frame];
      v23[2](v23, v24, v25);
    }
  }
}

- (void)willMoveToWindow:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuContainerView;
  [(UIView *)&v4 willMoveToWindow:a3];
  if (self->_passthroughInteraction) {
    -[UIView removeInteraction:](self, "removeInteraction:");
  }
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIContextMenuContainerView;
  [(UIView *)&v14 _didMoveFromWindow:v6 toWindow:v7];
  [v6 _unregisterScrollToTopView:self];
  [v7 _registerScrollToTopView:self];
  double v8 = [(UIView *)self traitCollection];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (v9 == 6)
  {
    double v10 = [v6 windowScene];
    if (v10)
    {
      CGFloat v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v11 removeObserver:self name:@"UIWindowSceneWillUpdateEffectiveGeometryNotification" object:v10];
    }
    double v12 = [v7 windowScene];
    if (v12)
    {
      CGFloat v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v13 addObserver:self selector:sel__sceneGeometryWillUpdate_ name:@"UIWindowSceneWillUpdateEffectiveGeometryNotification" object:v12];
    }
  }
}

- (void)_sceneGeometryWillUpdate:(id)a3
{
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)_UIContextMenuContainerView;
  [(UIView *)&v4 didMoveToWindow];
  if (self->_passthroughInteraction)
  {
    v3 = [(UIView *)self window];

    if (v3) {
      [(UIView *)self addInteraction:self->_passthroughInteraction];
    }
  }
}

- (BOOL)passthroughScrollInteractionDidRecognize:(id)a3
{
  return 1;
}

- (BOOL)passthroughScrollInteraction:(id)a3 shouldInteractAtLocation:(CGPoint)a4 withEvent:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  id v10 = a5;
  CGFloat v11 = [(_UIContextMenuContainerView *)self dismissalHandler];

  if (!v11
    || v10 && (([v10 _modifierFlags] & 0x40000) != 0 || (objc_msgSend(v10, "_buttonMask") & 2) != 0))
  {
    BOOL lastHitTestWasPassedThroughToInteraction = 0;
  }
  else
  {
    self->_BOOL lastHitTestWasPassedThroughToInteraction = 0;
    double v12 = [v9 view];
    CGFloat v13 = [(UIView *)self window];
    objc_msgSend(v12, "convertPoint:toView:", v13, x, y);
    double v15 = v14;
    double v17 = v16;

    CGFloat v18 = [(UIView *)self window];
    CGFloat v19 = objc_msgSend(v18, "hitTest:withEvent:", v10, v15, v17);

    BOOL lastHitTestWasPassedThroughToInteraction = self->_lastHitTestWasPassedThroughToInteraction;
  }

  return lastHitTestWasPassedThroughToInteraction;
}

- (void)setPassesBackgroundViewTouchesThrough:(BOOL)a3
{
  if (self->_passesBackgroundViewTouchesThrough != a3)
  {
    [(_UIPassthroughScrollInteraction *)self->_passthroughInteraction setEatsTouches:!a3];
    self->_passesBackgroundViewTouchesThrough = a3;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (self->_inPassthroughViewHitTest)
  {
LABEL_2:
    double v8 = 0;
    goto LABEL_3;
  }
  self->_BOOL lastHitTestWasPassedThroughToInteraction = 0;
  v15.receiver = self;
  v15.super_class = (Class)_UIContextMenuContainerView;
  -[UIView hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v7, x, y);
  double v8 = (_UIContextMenuContainerView *)objc_claimAutoreleasedReturnValue();
  id v10 = [(_UIContextMenuContainerView *)self dismissalHandler];

  if (!v10) {
    goto LABEL_3;
  }
  if (v8 == self
    || ([(_UIContextMenuContainerView *)self contentWrapperView],
        CGFloat v11 = (_UIContextMenuContainerView *)objc_claimAutoreleasedReturnValue(),
        v11,
        v8 == v11))
  {
    BOOL v12 = +[_UIPassthroughScrollInteraction _shouldEventBePassedThrough:v7];
    uint64_t v13 = [v7 type];
    uint64_t v14 = v13;
    if (!v12 && v13 != 11)
    {
      if (![(_UIContextMenuContainerView *)self allowsDragEventsToPassthrough]
        || [v7 type] != 9)
      {
        goto LABEL_21;
      }
LABEL_20:

LABEL_22:
      if (v7 && (([v7 _modifierFlags] & 0x40000) != 0 || (objc_msgSend(v7, "_buttonMask") & 2) != 0)) {
        [(_UIPassthroughScrollInteraction *)self->_passthroughInteraction __forciblyEndWithReason:5];
      }
      goto LABEL_2;
    }
    if (self->_passesBackgroundViewTouchesThrough)
    {

      if (v14 != 11) {
        [(_UIContextMenuContainerView *)self _attemptDismiss:1];
      }
      double v8 = 0;
    }
    if (v12)
    {
      self->_BOOL lastHitTestWasPassedThroughToInteraction = 1;
      goto LABEL_20;
    }
  }
LABEL_21:
  if (!v8) {
    goto LABEL_22;
  }
LABEL_3:

  return v8;
}

- (void)_attemptDismiss:(BOOL)a3
{
  if (!self->_didDismiss)
  {
    BOOL v3 = a3;
    v5 = [(_UIContextMenuContainerView *)self dismissalHandler];

    if (v5)
    {
      self->_didDismiss = 1;
      id v6 = [(_UIContextMenuContainerView *)self dismissalHandler];
      id v7 = v6;
      if (v3) {
        dispatch_async(MEMORY[0x1E4F14428], v6);
      }
      else {
        v6[2](v6);
      }
    }
  }
}

- (void)_traitCollectionDidChangeOnSubtreeInternal:(const _UITraitCollectionChangeDescription *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuContainerView;
  -[UIView _traitCollectionDidChangeOnSubtreeInternal:](&v7, sel__traitCollectionDidChangeOnSubtreeInternal_);
  v5 = [(_UIContextMenuContainerView *)self subtreeTraitPropagationHandler];

  if (v5)
  {
    id v6 = [(_UIContextMenuContainerView *)self subtreeTraitPropagationHandler];
    ((void (**)(void, const _UITraitCollectionChangeDescription *))v6)[2](v6, a3);
  }
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t, CGPoint, __n128))a4 + 2))(a4, 1, a3, *(__n128 *)&a3.y);
  }
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (UIView)contentWrapperView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentWrapperView);
  return (UIView *)WeakRetained;
}

- (void)setContentWrapperView:(id)a3
{
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
}

- (id)subtreeTraitPropagationHandler
{
  return self->_subtreeTraitPropagationHandler;
}

- (void)setSubtreeTraitPropagationHandler:(id)a3
{
}

- (id)sizeChangeHandler
{
  return self->_sizeChangeHandler;
}

- (void)setSizeChangeHandler:(id)a3
{
}

- (BOOL)passesBackgroundViewTouchesThrough
{
  return self->_passesBackgroundViewTouchesThrough;
}

- (BOOL)allowsDragEventsToPassthrough
{
  return self->_allowsDragEventsToPassthrough;
}

- (void)setAllowsDragEventsToPassthrough:(BOOL)a3
{
  self->_allowsDragEventsToPassthrough = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sizeChangeHandler, 0);
  objc_storeStrong(&self->_subtreeTraitPropagationHandler, 0);
  objc_storeStrong(&self->_dismissalHandler, 0);
  objc_destroyWeak((id *)&self->_contentWrapperView);
  objc_storeStrong((id *)&self->_passthroughInteraction, 0);
}

@end