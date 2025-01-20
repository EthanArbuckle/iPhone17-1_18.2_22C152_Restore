@interface SFCapsuleView
+ (NSString)maximumContentSizeCategory;
- (BOOL)_shouldFadeNonKeyContentForContentView:(id)a3 withPreviousContentView:(id)a4;
- (BOOL)_usesMinimizedTheme;
- (BOOL)allowsHighlight;
- (BOOL)forceMinimizedTheme;
- (BOOL)isMinimized;
- (BOOL)isSelected;
- (BOOL)usesPlatterEffect;
- (CGAffineTransform)contentTransform;
- (CGRect)_backgroundFrame;
- (CGRect)_boundsForContent;
- (CGRect)frameForShadowView;
- (NSDirectionalEdgeInsets)accessoryViewInsets;
- (NSString)reusableContentViewIdentifier;
- (NSString)visualEffectGroupName;
- (SFCapsuleView)initWithFrame:(CGRect)a3;
- (UIView)accessoryView;
- (UIView)backgroundView;
- (UIView)contentContainer;
- (UIView)contentView;
- (UIView)shadowView;
- (_SFBarTheme)minimizedTheme;
- (_SFBarTheme)theme;
- (double)backgroundCornerRadius;
- (double)backgroundHeight;
- (double)contentHeight;
- (double)minimizationPercent;
- (id)contentViewUpdateHandler;
- (id)visualEffectBackgroundView;
- (int64_t)layoutStyle;
- (int64_t)state;
- (unint64_t)_accessoryEdge;
- (unint64_t)_collapsedContentInsetEdge;
- (unint64_t)directionalCollapsedContentEdge;
- (void)_performHighlightAnimation;
- (void)_updateAccessoryTheme;
- (void)_updateContentViewState;
- (void)_updateShadowViewTransform;
- (void)_updateStateWithContentView:(id)a3;
- (void)allowsHighlight:(BOOL)a3;
- (void)applyTheme;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setAccessoryView:(id)a3;
- (void)setAccessoryView:(id)a3 coordinator:(id)a4;
- (void)setAccessoryViewInsets:(NSDirectionalEdgeInsets)a3;
- (void)setAllowsHighlight:(BOOL)a3;
- (void)setBackgroundCornerRadius:(double)a3;
- (void)setBackgroundHeight:(double)a3;
- (void)setContentHeight:(double)a3;
- (void)setContentTransform:(CGAffineTransform *)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewUpdateHandler:(id)a3;
- (void)setDirectionalCollapsedContentEdge:(unint64_t)a3;
- (void)setForceMinimizedTheme:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setMinimizationPercent:(double)a3;
- (void)setMinimizedTheme:(id)a3;
- (void)setReusableContentViewIdentifier:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setTheme:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
- (void)setUsesPlatterEffect:(BOOL)a3;
- (void)setVisualEffectGroupName:(id)a3;
- (void)willChangeToMinimized:(BOOL)a3 coordinator:(id)a4;
- (void)willReloadWithCoordinator:(id)a3;
@end

@implementation SFCapsuleView

- (UIView)contentView
{
  v3 = [(UIView *)self->_cachedContentView superview];
  contentContainer = self->_contentContainer;

  if (v3 == contentContainer) {
    v5 = self->_cachedContentView;
  }
  else {
    v5 = 0;
  }

  return v5;
}

- (void)applyTheme
{
  v20[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(SFCapsuleView *)self _usesMinimizedTheme];
  v4 = &OBJC_IVAR___SFCapsuleView__theme;
  if (v3) {
    v4 = &OBJC_IVAR___SFCapsuleView__minimizedTheme;
  }
  id v5 = *(id *)((char *)&self->super.super.super.isa + *v4);
  v6 = [(SFCapsuleView *)self visualEffectBackgroundView];
  v7 = [(SFCapsuleView *)self contentView];
  if (objc_opt_respondsToSelector()) {
    unsigned int v8 = [v7 isHighlighted];
  }
  else {
    unsigned int v8 = 0;
  }
  if (self->_usesPlatterEffect)
  {
    v9 = [MEMORY[0x1E4FB1618] blackColor];
    v10 = [v6 contentView];
    [v10 setBackgroundColor:v9];

    v11 = objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", v8, objc_msgSend(v5, "tintStyle"));
    v20[0] = v11;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    [v6 setContentEffects:v12];

    [v6 setBackgroundEffects:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    [v5 applyBackdropEffectsToView:v6];
    if (v8 && self->_allowsHighlight)
    {
      v13 = [MEMORY[0x1E4FB1618] blackColor];
      v14 = [v6 contentView];
      [v14 setBackgroundColor:v13];

      v15 = objc_msgSend(MEMORY[0x1E4FB1EA0], "_sf_effectWithStyle:forBarTintStyle:", 1, objc_msgSend(v5, "tintStyle"));
      v19 = v15;
      v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      [v6 setContentEffects:v16];
    }
  }
  [(SFCapsuleView *)self _updateAccessoryTheme];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v17 = [v5 contentTheme];

    id v5 = (id)v17;
  }
  v18 = [v5 controlsTintColor];
  [(SFCapsuleView *)self setTintColor:v18];

  -[SFCapsuleView setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", [v5 overrideUserInterfaceStyle]);
  if (objc_opt_respondsToSelector()) {
    [v7 setTheme:v5];
  }
}

- (void)setMinimizedTheme:(id)a3
{
  id v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    BOOL v5 = [(SFCapsuleView *)self _usesMinimizedTheme];
    objc_storeStrong((id *)&self->_minimizedTheme, a3);
    if ([(SFCapsuleView *)self _usesMinimizedTheme] || v5) {
      [(SFCapsuleView *)self applyTheme];
    }
  }
}

- (BOOL)_usesMinimizedTheme
{
  return (self->_state == 1 || self->_forceMinimizedTheme) && self->_minimizedTheme != 0;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)SFCapsuleView;
  [(SFCapsuleView *)&v38 layoutSubviews];
  [(SFCapsuleView *)self _accessoryEdge];
  -[UIView sizeThatFits:](self->_accessoryView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v37 = v3;
  double v5 = v4;
  [(SFCapsuleView *)self bounds];
  CGFloat v36 = v6;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(SFCapsuleView *)self _boundsForContent];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double contentHeight = v19;
  [(SFCapsuleView *)self _backgroundFrame];
  -[UIView ss_setUntransformedFrame:](self->_background, "ss_setUntransformedFrame:");
  if (self->_needsUpdateTheme)
  {
    self->_needsUpdateTheme = 0;
    [(SFCapsuleView *)self applyTheme];
  }
  if ([(SFCapsuleView *)self isMinimized])
  {
    [(SFCapsuleView *)self safeAreaInsets];
    UIEdgeInsetsMin();
    double v14 = v14 + v21;
    double v16 = v16 + v22;
    double v18 = v18 - (v21 + v23);
    double contentHeight = contentHeight - (v22 + v24);
  }
  [(SFCapsuleView *)self _collapsedContentInsetEdge];
  v39.origin.x = v14;
  v39.origin.y = v16;
  v39.size.width = v18;
  v39.size.height = contentHeight;
  CGRectGetWidth(v39);
  UIEdgeInsetsMakeWithEdges();
  -[UIView ss_setUntransformedFrame:](self->_contentContainer, "ss_setUntransformedFrame:", v14 + v28, v16 + v25, v18 - (v28 + v26), contentHeight - (v25 + v27));
  if (!self->_reloadingWithCoordinator)
  {
    v29 = (double *)MEMORY[0x1E4F1DAD8];
    if ([(SFCapsuleView *)self _collapsedContentInsetEdge] == 8)
    {
      v40.origin.x = v14;
      v40.origin.y = v16;
      v40.size.width = v18;
      v40.size.height = contentHeight;
      double v30 = -CGRectGetWidth(v40);
    }
    else
    {
      double v30 = *v29;
    }
    double v31 = v29[1];
    if (self->_contentHeight != 0.0)
    {
      v41.origin.x = v30;
      v41.origin.y = v29[1];
      v41.size.width = v18;
      v41.size.height = contentHeight;
      CGFloat Height = CGRectGetHeight(v41);
      double contentHeight = self->_contentHeight;
      double v31 = (Height - contentHeight) * 0.5;
    }
    v33 = [(SFCapsuleView *)self contentView];
    objc_msgSend(v33, "ss_setUntransformedFrame:", v30, v31, v18, contentHeight);
  }
  v34 = [(SFShadowView *)self->_shadowView superview];

  if (v34 == self)
  {
    [(SFCapsuleView *)self frameForShadowView];
    -[UIView ss_setUntransformedFrame:](self->_shadowView, "ss_setUntransformedFrame:");
    [(SFCapsuleView *)self _updateShadowViewTransform];
  }
  if ([(UIView *)self _sf_usesLeftToRightLayout])
  {
    v42.origin.x = v36;
    v42.origin.y = v8;
    v42.size.width = v10;
    v42.size.height = v12;
    double trailing = CGRectGetWidth(v42) - (v37 + self->_accessoryViewInsets.trailing);
  }
  else
  {
    double trailing = self->_accessoryViewInsets.trailing;
  }
  v43.origin.x = v36;
  v43.origin.y = v8;
  v43.size.width = v10;
  v43.size.height = v12;
  -[UIView setFrame:](self->_accessoryView, "setFrame:", trailing, (CGRectGetHeight(v43) - v5) * 0.5, v37, v5);
}

- (CGRect)_boundsForContent
{
  [(SFCapsuleView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SFCapsuleView *)self _accessoryEdge];
  -[UIView sizeThatFits:](self->_accessoryView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  UIEdgeInsetsMakeWithEdges();
  double v12 = v6 + v11;
  double v15 = v8 - (v13 + v14);
  double v17 = v10 - (v11 + v16);
  double v18 = v4 + v13;
  double v19 = v12;
  double v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (unint64_t)_accessoryEdge
{
  if (!self->_accessoryView) {
    return 0;
  }
  if ([(UIView *)self _sf_usesLeftToRightLayout]) {
    return 8;
  }
  return 2;
}

- (CGRect)_backgroundFrame
{
  [(SFCapsuleView *)self _boundsForContent];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(SFCapsuleView *)self _collapsedContentInsetEdge];
  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  CGRectGetWidth(v22);
  UIEdgeInsetsMakeWithEdges();
  double v13 = v6 + v12;
  double v15 = v8 - (v11 + v14);
  double v17 = v10 - (v12 + v16);
  if (self->_backgroundHeight == 0.0) {
    backgroundCGFloat Height = v17;
  }
  else {
    backgroundCGFloat Height = self->_backgroundHeight;
  }
  double v19 = v4 + v11;
  double v20 = v13;
  double v21 = v15;
  result.size.height = backgroundHeight;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)setVisualEffectGroupName:(id)a3
{
  id v4 = a3;
  double v5 = (NSString *)[v4 copy];
  visualEffectGroupName = self->_visualEffectGroupName;
  self->_visualEffectGroupName = v5;

  id v7 = [(SFCapsuleView *)self visualEffectBackgroundView];
  [v7 _setGroupName:v4];
}

- (void)_updateStateWithContentView:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(SFCapsuleView *)self isMinimized];
  double v5 = [(SFCapsuleView *)self visualEffectBackgroundView];
  [v5 _setCornerRadius:1 continuous:15 maskedCorners:self->_backgroundCornerRadius];

  double backgroundCornerRadius = 0.0;
  if (!v4) {
    double backgroundCornerRadius = self->_backgroundCornerRadius;
  }
  [(UIView *)self->_contentContainer _setContinuousCornerRadius:backgroundCornerRadius];
  uint64_t v7 = [(UIView *)self->_contentContainer setClipsToBounds:v4 ^ 1];
  if (v8)
  {
    if (objc_opt_respondsToSelector()) {
      [v8 setSelected:self->_isSelected];
    }
    if (objc_opt_respondsToSelector()) {
      [v8 setMinimized:v4];
    }
    if (objc_opt_respondsToSelector()) {
      [v8 setMinimizationPercent:self->_minimizationPercent];
    }
    uint64_t v7 = objc_opt_respondsToSelector();
    if (v7) {
      uint64_t v7 = [v8 setUnclippedContainer:self];
    }
  }

  MEMORY[0x1F4181820](v7);
}

- (id)visualEffectBackgroundView
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    background = self->_background;
  }
  else {
    background = 0;
  }

  return background;
}

- (BOOL)isMinimized
{
  return self->_state == 1;
}

- (void)_updateAccessoryTheme
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(_SFBarTheme *)self->_theme backgroundTheme];
    -[UIView setOverrideUserInterfaceStyle:](self->_accessoryView, "setOverrideUserInterfaceStyle:", [v3 overrideUserInterfaceStyle]);
  }
}

- (unint64_t)_collapsedContentInsetEdge
{
  BOOL v3 = [(UIView *)self _sf_usesLeftToRightLayout];
  unint64_t directionalCollapsedContentEdge = self->_directionalCollapsedContentEdge;
  if (directionalCollapsedContentEdge == 8)
  {
    BOOL v5 = !v3;
    unint64_t v6 = 2;
  }
  else
  {
    if (directionalCollapsedContentEdge != 2) {
      return 0;
    }
    BOOL v5 = !v3;
    unint64_t v6 = 8;
  }
  if (v5) {
    return self->_directionalCollapsedContentEdge;
  }
  else {
    return v6;
  }
}

- (UIView)shadowView
{
  return &self->_shadowView->super.super;
}

- (void)setUsesPlatterEffect:(BOOL)a3
{
  if (self->_usesPlatterEffect != a3)
  {
    self->_usesPlatterEffect = a3;
    [(SFCapsuleView *)self applyTheme];
  }
}

- (void)setTransform:(CGAffineTransform *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFCapsuleView;
  long long v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  [(SFCapsuleView *)&v6 setTransform:v5];
  [(SFCapsuleView *)self _updateShadowViewTransform];
}

- (void)setMinimizationPercent:(double)a3
{
  if (self->_minimizationPercent != a3)
  {
    self->_minimizationPercent = a3;
    [(SFCapsuleView *)self _updateContentViewState];
  }
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  p_contentTransform = &self->_contentTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&t2.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&t2.c = v7;
  *(_OWORD *)&t2.tx = *(_OWORD *)&self->_contentTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_contentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_contentTransform->tx = v9;
    *(_OWORD *)&p_contentTransform->a = v8;
    long long v10 = *(_OWORD *)&a3->c;
    v15[0] = *(_OWORD *)&a3->a;
    v15[1] = v10;
    v15[2] = *(_OWORD *)&a3->tx;
    [(UIView *)self->_contentContainer setTransform:v15];
    long long v11 = *(_OWORD *)&a3->c;
    v14[0] = *(_OWORD *)&a3->a;
    v14[1] = v11;
    v14[2] = *(_OWORD *)&a3->tx;
    [(UIView *)self->_background setTransform:v14];
    if (([(SFShadowView *)self->_shadowView isDescendantOfView:self] & 1) == 0)
    {
      long long v12 = *(_OWORD *)&a3->c;
      v13[0] = *(_OWORD *)&a3->a;
      v13[1] = v12;
      v13[2] = *(_OWORD *)&a3->tx;
      [(SFShadowView *)self->_shadowView setTransform:v13];
    }
  }
}

- (void)setContentHeight:(double)a3
{
  self->_double contentHeight = a3;
}

- (void)setAccessoryViewInsets:(NSDirectionalEdgeInsets)a3
{
  self->_accessoryViewInsets = a3;
}

- (CGRect)frameForShadowView
{
  BOOL v3 = [(SFShadowView *)self->_shadowView superview];

  if (v3 == self)
  {
    shadowView = self->_shadowView;
    [(SFCapsuleView *)self bounds];
    -[SFShadowView frameWithContentWithFrame:](shadowView, "frameWithContentWithFrame:");
    double v37 = v45;
    double v39 = v46;
    double v41 = v47;
    double v43 = v48;
  }
  else
  {
    [(SFCapsuleView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(SFCapsuleView *)self _backgroundFrame];
    double v54 = v12;
    double v55 = v13;
    CGFloat v56 = v14;
    CGFloat v16 = v15;
    [(SFCapsuleView *)self center];
    double v18 = v17;
    double v53 = v19;
    double v20 = [(SFCapsuleView *)self layer];
    [v20 anchorPoint];
    double v22 = v21;
    double v24 = v23;

    v57.origin.double x = v5;
    v57.origin.double y = v7;
    v57.size.double width = v9;
    v57.size.double height = v11;
    CGFloat v25 = v54 + v18 - v22 * CGRectGetWidth(v57);
    v58.origin.double x = v5;
    v58.origin.double y = v7;
    v58.size.double width = v9;
    v58.size.double height = v11;
    CGFloat v26 = v55 + v53 - v24 * CGRectGetHeight(v58);
    v59.origin.double x = v25;
    v59.origin.double y = v26;
    v59.size.double width = v56;
    v59.size.double height = v16;
    CGFloat v27 = fmin(CGRectGetWidth(v59) * 0.5, 2.0);
    v60.origin.double x = v25;
    v60.origin.double y = v26;
    v60.size.double width = v56;
    v60.size.double height = v16;
    CGFloat v28 = fmin(CGRectGetHeight(v60) * 0.5, 1.0);
    v29 = self->_shadowView;
    double v30 = [(SFCapsuleView *)self superview];
    v61.origin.double x = v25;
    v61.origin.double y = v26;
    v61.size.double width = v56;
    v61.size.double height = v16;
    CGRect v62 = CGRectInset(v61, v27, v28);
    double x = v62.origin.x;
    double y = v62.origin.y;
    double width = v62.size.width;
    double height = v62.size.height;
    v35 = [(SFShadowView *)self->_shadowView superview];
    objc_msgSend(v30, "convertRect:toView:", v35, x, y, width, height);
    -[SFShadowView frameWithContentWithFrame:](v29, "frameWithContentWithFrame:");
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
  }
  double v49 = v37;
  double v50 = v39;
  double v51 = v41;
  double v52 = v43;
  result.size.double height = v52;
  result.size.double width = v51;
  result.origin.double y = v50;
  result.origin.double x = v49;
  return result;
}

- (void)_updateShadowViewTransform
{
  BOOL v3 = [(SFShadowView *)self->_shadowView superview];

  if (v3 == self)
  {
    shadowView = self->_shadowView;
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v7 = *MEMORY[0x1E4F1DAB8];
    long long v8 = v6;
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGFloat v5 = &v7;
  }
  else
  {
    [(SFCapsuleView *)self transform];
    shadowView = self->_shadowView;
    long long v10 = v13;
    long long v11 = v14;
    long long v12 = v15;
    CGFloat v5 = &v10;
  }
  -[SFShadowView setTransform:](shadowView, "setTransform:", v5, v7, v8, v9, v10, v11, v12);
}

- (UIView)backgroundView
{
  return self->_background;
}

- (void)setForceMinimizedTheme:(BOOL)a3
{
  if (self->_forceMinimizedTheme != a3)
  {
    self->_forceMinimizedTheme = a3;
    [(SFCapsuleView *)self applyTheme];
  }
}

- (NSString)reusableContentViewIdentifier
{
  return self->_reusableContentViewIdentifier;
}

- (void)setReusableContentViewIdentifier:(id)a3
{
}

- (void)setContentView:(id)a3
{
  id v5 = a3;
  objc_initWeak(&location, self);
  id v6 = [(SFCapsuleView *)self contentView];
  if (v6 != v5)
  {
    p_cachedContentView = &self->_cachedContentView;
    objc_storeStrong((id *)&self->_cachedContentView, a3);
    long long v8 = (void (**)(void *, SFCapsuleView *, id, id))_Block_copy(self->_contentViewUpdateHandler);
    if (v8)
    {
      if (objc_opt_respondsToSelector()) {
        [v6 prepareForDeferredRemoval];
      }
    }
    else
    {
      [v6 removeFromSuperview];
    }
    [(SFCapsuleView *)self _updateStateWithContentView:v5];
    if (objc_opt_respondsToSelector()) {
      [v5 setTheme:self->_theme];
    }
    if (objc_opt_respondsToSelector()) {
      [v5 setLayoutStyle:self->_layoutStyle];
    }
    if (objc_opt_respondsToSelector())
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __32__SFCapsuleView_setContentView___block_invoke;
      v19[3] = &unk_1E54EA1B8;
      objc_copyWeak(&v20, &location);
      [v5 setHighlightObserver:v19];
      objc_destroyWeak(&v20);
    }
    long long v9 = (void *)MEMORY[0x1E4FB1EB0];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __32__SFCapsuleView_setContentView___block_invoke_2;
    _OWORD v15[3] = &unk_1E54E9B00;
    long long v10 = (UIView *)v5;
    CGFloat v16 = v10;
    double v17 = self;
    long long v11 = (UIView *)v6;
    double v18 = v11;
    [v9 performWithoutAnimation:v15];
    [(SFCapsuleView *)self setNeedsLayout];
    if (*p_cachedContentView == v10)
    {
      if (v8 && v11)
      {
        v8[2](v8, self, v11, v10);
      }
      else
      {
        long long v12 = (void *)MEMORY[0x1E4FB1EB0];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __32__SFCapsuleView_setContentView___block_invoke_3;
        _OWORD v13[3] = &unk_1E54E9A60;
        v13[4] = self;
        long long v14 = v10;
        [v12 performWithoutAnimation:v13];
      }
    }
    else if (v11 != *p_cachedContentView {
           && [(UIView *)v11 isDescendantOfView:self->_contentContainer])
    }
    {
      [(UIView *)v11 removeFromSuperview];
    }
  }
  objc_destroyWeak(&location);
}

- (void)_updateContentViewState
{
  id v3 = [(SFCapsuleView *)self contentView];
  [(SFCapsuleView *)self _updateStateWithContentView:v3];
}

- (void)setBackgroundCornerRadius:(double)a3
{
  if (self->_backgroundCornerRadius != a3)
  {
    self->_double backgroundCornerRadius = a3;
    [(SFCapsuleView *)self _updateContentViewState];
  }
}

- (void)setTheme:(id)a3
{
  id v5 = a3;
  if (!-[_SFBarTheme isEqual:](self->_theme, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_theme, a3);
    if (![(SFCapsuleView *)self _usesMinimizedTheme]) {
      [(SFCapsuleView *)self applyTheme];
    }
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(SFCapsuleView *)self applyTheme];
    id v5 = [(SFCapsuleView *)self contentView];
    if (objc_opt_respondsToSelector()) {
      [v5 setLayoutStyle:a3];
    }
  }
}

- (SFCapsuleView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SFCapsuleView;
  id v3 = -[SFCapsuleView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = (SFCapsuleView *)v3;
  if (v3)
  {
    uint64_t v5 = MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)(v3 + 600) = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(v3 + 616) = v6;
    *(_OWORD *)(v3 + 632) = *(_OWORD *)(v5 + 32);
    long long v7 = objc_alloc_init(SFShadowView);
    shadowView = v4->_shadowView;
    v4->_shadowView = v7;

    [(SFCapsuleView *)v4 addSubview:v4->_shadowView];
    long long v9 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v9];
    background = v4->_background;
    v4->_background = (UIView *)v10;

    [(SFCapsuleView *)v4 bounds];
    -[UIView setFrame:](v4->_background, "setFrame:");
    [(SFCapsuleView *)v4 addSubview:v4->_background];
    id v12 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(SFCapsuleView *)v4 bounds];
    uint64_t v13 = objc_msgSend(v12, "initWithFrame:");
    contentContainer = v4->_contentContainer;
    v4->_contentContainer = (UIView *)v13;

    [(UIView *)v4->_contentContainer setClipsToBounds:1];
    [(SFCapsuleView *)v4 addSubview:v4->_contentContainer];
    [(SFCapsuleView *)v4 setBackgroundCornerRadius:20.0];
    long long v15 = [(id)objc_opt_class() maximumContentSizeCategory];
    [(SFCapsuleView *)v4 setMaximumContentSizeCategory:v15];

    CGFloat v16 = v4;
  }

  return v4;
}

+ (NSString)maximumContentSizeCategory
{
  return (NSString *)(id)*MEMORY[0x1E4FB2790];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    self->_needsUpdateTheme = 1;
    [(SFCapsuleView *)self setNeedsLayout];
    [(SFCapsuleView *)self _updateContentViewState];
    [(SFCapsuleView *)self _updateShadowViewTransform];
  }
}

- (void)setSelected:(BOOL)a3
{
  if (self->_isSelected != a3)
  {
    self->_isSelected = a3;
    [(SFCapsuleView *)self _updateContentViewState];
  }
}

- (void)setBackgroundHeight:(double)a3
{
  if (self->_backgroundHeight != a3)
  {
    self->_backgroundCGFloat Height = a3;
    [(SFCapsuleView *)self setNeedsLayout];
  }
}

- (void)setAccessoryView:(id)a3 coordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  long long v9 = self->_accessoryView;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke;
  aBlock[3] = &unk_1E54E9A60;
  uint64_t v10 = v9;
  double v23 = v10;
  double v24 = self;
  long long v11 = (void (**)(void))_Block_copy(aBlock);
  objc_storeStrong((id *)&self->_accessoryView, a3);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_2;
  v21[3] = &unk_1E54EAD00;
  v21[4] = self;
  id v12 = _Block_copy(v21);
  if (self->_accessoryView)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4FB1EB0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_3;
    v18[3] = &unk_1E54E9A88;
    v18[4] = self;
    id v19 = v8;
    id v20 = v12;
    [v13 performWithoutAnimation:v18];
  }
  [(SFCapsuleView *)self setNeedsLayout];
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_4;
    _OWORD v14[3] = &unk_1E54EAD28;
    id v17 = v12;
    long long v15 = v10;
    CGFloat v16 = self;
    [v8 addAnimations:v14];
    [v8 addCompletion:v11];
  }
  else
  {
    v11[2](v11);
  }
}

void __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) superview];
  if (v2 == *(void **)(a1 + 40))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = v2[62];

    if (v3 != v4)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      [v5 removeFromSuperview];
    }
  }
  else
  {
  }
}

- (void)setAccessoryView:(id)a3
{
}

unsigned char *__32__SFCapsuleView_setContentView___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) addSubview:*(void *)(a1 + 40)];
  CGRect result = *(unsigned char **)(a1 + 32);
  if (!result[433])
  {
    return (unsigned char *)[result layoutIfNeeded];
  }
  return result;
}

unsigned char *__32__SFCapsuleView_setContentView___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setTranslatesAutoresizingMaskIntoConstraints:1];
  [*(id *)(a1 + 32) setAutoresizingMask:0];
  [*(id *)(*(void *)(a1 + 40) + 456) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  CGRect result = *(unsigned char **)(a1 + 40);
  if (result[433])
  {
    CGRect result = (unsigned char *)[result _shouldFadeNonKeyContentForContentView:*(void *)(a1 + 32) withPreviousContentView:*(void *)(a1 + 48)];
    if (result)
    {
      uint64_t v3 = *(void **)(a1 + 32);
      return (unsigned char *)[v3 setNonKeyContentAlpha:0.0];
    }
  }
  return result;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleView;
  [(SFCapsuleView *)&v3 safeAreaInsetsDidChange];
  [(SFCapsuleView *)self setNeedsLayout];
}

- (void)setDirectionalCollapsedContentEdge:(unint64_t)a3
{
  if (self->_directionalCollapsedContentEdge != a3)
  {
    self->_unint64_t directionalCollapsedContentEdge = a3;
    [(SFCapsuleView *)self setNeedsLayout];
  }
}

- (void)_performHighlightAnimation
{
  if (self->_reloadingWithCoordinator)
  {
    [(SFCapsuleView *)self setNeedsLayout];
    self->_needsUpdateTheme = 1;
  }
  else
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __43__SFCapsuleView__performHighlightAnimation__block_invoke;
    v3[3] = &unk_1E54E9858;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:50331650 delay:v3 options:0 animations:0.2 completion:0.0];
  }
}

uint64_t __43__SFCapsuleView__performHighlightAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) applyTheme];
}

void __32__SFCapsuleView_setContentView___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v6 = WeakRetained;
    v2 = [WeakRetained contentView];
    if ([v6 layoutStyle] == 1
      && (objc_opt_respondsToSelector() & 1) != 0
      && [v2 isHighlighted])
    {
      uint64_t v3 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:v6 target:sel__performHighlightAnimation selector:0 userInfo:0 repeats:0.1];
      uint64_t v4 = (void *)v6[55];
      v6[55] = v3;

      uint64_t v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
      [v5 addTimer:v6[55] forMode:*MEMORY[0x1E4F1C4B0]];
    }
    else
    {
      [v6 _performHighlightAnimation];
    }

    WeakRetained = v6;
  }
}

void __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v13 = a2;
  [v13 setAlpha:0.0];
  [*(id *)(a1 + 32) bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if (objc_msgSend(*(id *)(a1 + 32), "_sf_usesLeftToRightLayout"))
  {
    v15.origin.double x = v4;
    v15.origin.double y = v6;
    v15.size.double width = v8;
    v15.size.double height = v10;
    double Width = CGRectGetWidth(v15);
    [v13 bounds];
    double v12 = Width + (CGRectGetWidth(v16) + *(double *)(*(void *)(a1 + 32) + 576)) * 0.5;
  }
  else
  {
    [v13 bounds];
    double v12 = (CGRectGetWidth(v17) + *(double *)(*(void *)(a1 + 32) + 576)) * -0.5;
  }
  v18.origin.double x = v4;
  v18.origin.double y = v6;
  v18.size.double width = v8;
  v18.size.double height = v10;
  objc_msgSend(v13, "setCenter:", v12, CGRectGetHeight(v18) * 0.5);
}

uint64_t __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 496) setTranslatesAutoresizingMaskIntoConstraints:1];
  [*(id *)(*(void *)(a1 + 32) + 496) setAutoresizingMask:0];
  [*(id *)(*(void *)(a1 + 32) + 496) sizeToFit];
  [*(id *)(a1 + 32) _updateAccessoryTheme];
  if (*(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[62];

  return [v2 addSubview:v3];
}

uint64_t __46__SFCapsuleView_setAccessoryView_coordinator___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(void **)(*(void *)(a1 + 40) + 496);

  return [v2 setAlpha:1.0];
}

- (void)allowsHighlight:(BOOL)a3
{
  self->_allowsHighlight = a3;
  if (a3 && [(NSTimer *)self->_waitToHighlight isValid])
  {
    waitToHighlight = self->_waitToHighlight;
    [(NSTimer *)waitToHighlight fire];
  }
}

- (BOOL)_shouldFadeNonKeyContentForContentView:(id)a3 withPreviousContentView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      double v7 = [v6 microphoneContentOriginX];
      if (v7)
      {
        CGFloat v8 = [v5 microphoneContentOriginX];
        BOOL v9 = v8 == 0;
      }
      else
      {
        BOOL v9 = 1;
      }
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)willReloadWithCoordinator:(id)a3
{
  id v4 = a3;
  self->_reloadingWithCoordinator = 1;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke;
  v50[3] = &unk_1E54EA080;
  v50[4] = self;
  [v4 addAnimations:v50];
  id v5 = [(SFCapsuleView *)self contentView];
  objc_msgSend(v5, "ss_untransformedFrame");
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_3;
  aBlock[3] = &unk_1E54EAD70;
  void aBlock[4] = self;
  long long v14 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  uint64_t v15 = v14[2](v14, v5);
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  id v20 = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_2(v15, v5);
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy__1;
  v47[4] = __Block_byref_object_dispose__1;
  id v48 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_49;
  v33[3] = &unk_1E54EAE28;
  double v40 = v47;
  v33[4] = self;
  id v21 = v5;
  id v34 = v21;
  double v22 = v14;
  double v36 = v22;
  id v37 = &__block_literal_global_19;
  uint64_t v41 = v7;
  uint64_t v42 = v9;
  uint64_t v43 = v11;
  uint64_t v44 = v13;
  uint64_t v45 = v17;
  uint64_t v46 = v19;
  id v38 = &__block_literal_global_41;
  id v39 = &__block_literal_global_46;
  id v23 = v20;
  id v35 = v23;
  [v4 addAnimations:v33];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_4_52;
  v28[3] = &unk_1E54EAE50;
  id v31 = &__block_literal_global_41;
  id v24 = v21;
  id v32 = &__block_literal_global_46;
  id v29 = v24;
  double v30 = self;
  [v4 addCompletion:v28];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_6;
  v26[3] = &unk_1E54EAE78;
  v26[4] = self;
  id v25 = v24;
  id v27 = v25;
  [v4 addAnimations:v26];

  _Block_object_dispose(v47, 8);
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 433) = 0;
  return result;
}

id __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [v2 microphoneContentOriginX];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 keyContentRect];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;

    int v12 = objc_msgSend(*(id *)(a1 + 32), "_sf_usesLeftToRightLayout");
    CGFloat v13 = v5;
    CGFloat v14 = v7;
    CGFloat v15 = v9;
    CGFloat v16 = v11;
    if (v12) {
      double MinX = CGRectGetMinX(*(CGRect *)&v13);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v13);
    }
    double v20 = MinX;
    v27.origin.double x = v5;
    v27.origin.double y = v7;
    v27.size.double width = v9;
    v27.size.double height = v11;
    double MidY = CGRectGetMidY(v27);
    id v23 = *(void **)(a1 + 32);
    uint64_t v18 = v23;
  }
  else
  {
    uint64_t v18 = *(void **)(a1 + 32);
    [v3 center];
    double v20 = v19;
    double MidY = v21;

    id v23 = *(void **)(a1 + 32);
  }
  uint64_t v24 = v23[57];

  return objc_msgSend(v18, "convertPoint:fromView:", v24, v20, MidY);
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_4(uint64_t a1, void *a2, _OWORD *a3)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    long long v5 = a3[1];
    v8[0] = *a3;
    v8[1] = v5;
    v8[2] = a3[2];
    [v4 setKeyContentTransform:v8];
  }
  else
  {
    long long v6 = a3[1];
    v7[0] = *a3;
    v7[1] = v6;
    v7[2] = a3[2];
    [v4 setTransform:v7];
  }
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = a4;
  if (objc_opt_respondsToSelector())
  {
    if (v7 && v8)
    {
      [v8 floatValue];
      float v10 = v9;
      [v7 floatValue];
      CGAffineTransformMakeTranslation(&v18, (float)(v10 - v11), 0.0);
      CGAffineTransform v17 = v18;
      int v12 = &v17;
    }
    else
    {
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      long long v14 = *MEMORY[0x1E4F1DAB8];
      long long v15 = v13;
      long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      int v12 = (CGAffineTransform *)&v14;
    }
    objc_msgSend(v6, "setMicrophoneContentTransform:", v12, v14, v15, v16, *(_OWORD *)&v17.a, *(_OWORD *)&v17.c, *(_OWORD *)&v17.tx);
  }
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_49(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contentView];
  uint64_t v3 = *(void *)(*(void *)(a1 + 88) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 88);
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(v5 + 8) + 40))
  {
    [*(id *)(*(void *)(a1 + 32) + 456) bounds];
    double v19 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    objc_msgSend(v19, "setFrame:");
  }
  else
  {
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_2_50;
    v37[3] = &unk_1E54EADD8;
    v37[4] = *(void *)(a1 + 32);
    v37[5] = v5;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v37];
    double v6 = (*(double (**)(void))(*(void *)(a1 + 56) + 16))();
    double v8 = v7;
    float v9 = (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    float v10 = (void *)MEMORY[0x1E4FB1EB0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_3_51;
    v24[3] = &unk_1E54EAE00;
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 32);
    id v25 = v11;
    uint64_t v26 = v12;
    long long v13 = *(_OWORD *)(a1 + 112);
    long long v32 = *(_OWORD *)(a1 + 96);
    long long v33 = v13;
    uint64_t v31 = *(void *)(a1 + 88);
    id v29 = *(id *)(a1 + 72);
    long long v34 = *(_OWORD *)(a1 + 128);
    double v35 = v6;
    double v36 = v8;
    id v30 = *(id *)(a1 + 80);
    id v27 = v9;
    id v28 = *(id *)(a1 + 48);
    id v14 = v9;
    [v10 performWithoutAnimation:v24];
    [*(id *)(a1 + 40) setAlpha:0.0];
    [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setAlpha:1.0];
    long long v15 = *(void (**)(void))(*(void *)(a1 + 72) + 16);
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v21 = *MEMORY[0x1E4F1DAB8];
    long long v22 = v16;
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v15();
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    uint64_t v17 = *(void *)(a1 + 72);
    uint64_t v18 = *(void *)(a1 + 40);
    CGAffineTransformMakeTranslation(&v20, v6 - *(double *)(a1 + 128), v8 - *(double *)(a1 + 136));
    (*(void (**)(uint64_t, uint64_t, CGAffineTransform *))(v17 + 16))(v17, v18, &v20);
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_2_50(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) bounds];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "setFrame:");
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return [v2 layoutIfNeeded];
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_3_51(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeAllAnimations:1];
  [*(id *)(*(void *)(a1 + 40) + 456) addSubview:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 32), "ss_setUntransformedFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) setAlpha:0.0];
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  CGAffineTransformMakeTranslation(&v5, *(double *)(a1 + 120) - *(double *)(a1 + 136), *(double *)(a1 + 128) - *(double *)(a1 + 144));
  (*(void (**)(uint64_t, uint64_t, CGAffineTransform *))(v2 + 16))(v2, v3, &v5);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16))();
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_4_52(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_5_53;
  _OWORD v5[3] = &unk_1E54EAE50;
  id v8 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v7 = v4;
  [v2 performWithoutAnimation:v5];
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_5_53(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void (**)(uint64_t, uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t))(v7 + 16);
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v15[0] = *MEMORY[0x1E4F1DAB8];
  v15[1] = v10;
  v15[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  v9(v7, v8, v15, a4, a5, a6);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v11 = [*(id *)(a1 + 32) superview];
  uint64_t v12 = *(void **)(a1 + 40);
  if (v11 == (void *)v12[57])
  {
    long long v13 = *(void **)(a1 + 32);
    id v14 = [v12 contentView];

    if (v13 != v14) {
      [*(id *)(a1 + 32) removeFromSuperview];
    }
  }
  else
  {
  }
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contentView];
  if ([*(id *)(a1 + 32) _shouldFadeNonKeyContentForContentView:v2 withPreviousContentView:*(void *)(a1 + 40)])
  {
    id v3 = (void *)MEMORY[0x1E4FB1EB0];
    [MEMORY[0x1E4FB1EB0] inheritedAnimationDuration];
    double v5 = v4;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_7;
    _OWORD v8[3] = &unk_1E54E9A60;
    id v9 = *(id *)(a1 + 40);
    id v10 = v2;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_10;
    v6[3] = &unk_1E54E9998;
    id v7 = *(id *)(a1 + 40);
    [v3 animateKeyframesWithDuration:3072 delay:v8 options:v6 animations:v5 completion:0.0];
  }
}

void __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_7(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_8;
  v6[3] = &unk_1E54E9858;
  id v7 = *(id *)(a1 + 32);
  [v2 addKeyframeWithRelativeStartTime:v6 relativeDuration:0.0 animations:0.67];
  id v3 = (void *)MEMORY[0x1E4FB1EB0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_9;
  v4[3] = &unk_1E54E9858;
  id v5 = *(id *)(a1 + 40);
  [v3 addKeyframeWithRelativeStartTime:v4 relativeDuration:0.33 animations:0.67];
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNonKeyContentAlpha:0.0];
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNonKeyContentAlpha:1.0];
}

uint64_t __43__SFCapsuleView_willReloadWithCoordinator___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNonKeyContentAlpha:1.0];
}

- (void)willChangeToMinimized:(BOOL)a3 coordinator:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  id v6 = [(SFCapsuleView *)self contentView];
  if (objc_opt_respondsToSelector()) {
    [v6 willChangeToMinimized:v4 coordinator:v7];
  }
}

- (UIView)contentContainer
{
  return self->_contentContainer;
}

- (double)backgroundCornerRadius
{
  return self->_backgroundCornerRadius;
}

- (double)backgroundHeight
{
  return self->_backgroundHeight;
}

- (double)contentHeight
{
  return self->_contentHeight;
}

- (NSString)visualEffectGroupName
{
  return self->_visualEffectGroupName;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (NSDirectionalEdgeInsets)accessoryViewInsets
{
  double top = self->_accessoryViewInsets.top;
  double leading = self->_accessoryViewInsets.leading;
  double bottom = self->_accessoryViewInsets.bottom;
  double trailing = self->_accessoryViewInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (id)contentViewUpdateHandler
{
  return self->_contentViewUpdateHandler;
}

- (void)setContentViewUpdateHandler:(id)a3
{
}

- (_SFBarTheme)theme
{
  return self->_theme;
}

- (_SFBarTheme)minimizedTheme
{
  return self->_minimizedTheme;
}

- (BOOL)forceMinimizedTheme
{
  return self->_forceMinimizedTheme;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)usesPlatterEffect
{
  return self->_usesPlatterEffect;
}

- (BOOL)allowsHighlight
{
  return self->_allowsHighlight;
}

- (void)setAllowsHighlight:(BOOL)a3
{
  self->_allowsHighlight = a3;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (double)minimizationPercent
{
  return self->_minimizationPercent;
}

- (CGAffineTransform)contentTransform
{
  long long v3 = *(_OWORD *)&self[12].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[13].b;
  return self;
}

- (unint64_t)directionalCollapsedContentEdge
{
  return self->_directionalCollapsedContentEdge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimizedTheme, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong(&self->_contentViewUpdateHandler, 0);
  objc_storeStrong((id *)&self->_reusableContentViewIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_visualEffectGroupName, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
  objc_storeStrong((id *)&self->_waitToHighlight, 0);
  objc_storeStrong((id *)&self->_cachedContentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);

  objc_storeStrong((id *)&self->_background, 0);
}

@end