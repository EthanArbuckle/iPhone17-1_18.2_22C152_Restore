@interface _UIFlocker
- (BOOL)isFlocked;
- (CGPoint)_badgeCenter;
- (CGPoint)badgeLocationInView:(id)a3;
- (NSArray)secondaryPlatterViews;
- (NSMutableArray)ghostPortals;
- (UITargetedPreview)primaryPlatterPreview;
- (UIView)containerView;
- (_UIDragBadge)badge;
- (_UIFlocker)initWithContainerView:(id)a3;
- (_UIGroupCompletion)groupCompletion;
- (id)_primaryPlatterView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)unflockPreviewProvider;
- (unint64_t)badgeValue;
- (unint64_t)itemCount;
- (unint64_t)settings;
- (void)_installGhostPortalForPreview:(id)a3;
- (void)flock;
- (void)install;
- (void)setBadge:(id)a3;
- (void)setBadgeValue:(unint64_t)a3;
- (void)setContainerView:(id)a3;
- (void)setGhostPortals:(id)a3;
- (void)setGroupCompletion:(id)a3;
- (void)setIsFlocked:(BOOL)a3;
- (void)setItemCount:(unint64_t)a3;
- (void)setPrimaryPlatterPreview:(id)a3;
- (void)setSecondaryPlatterViews:(id)a3;
- (void)setSettings:(unint64_t)a3;
- (void)setUnflockPreviewProvider:(id)a3;
- (void)unflock;
- (void)unflockToDrag:(BOOL)a3 animated:(BOOL)a4;
- (void)updateFlockLocation;
@end

@implementation _UIFlocker

- (_UIFlocker)initWithContainerView:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFlocker;
  v5 = [(_UIFlocker *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(_UIFlocker *)v5 setContainerView:v4];
    v7 = [MEMORY[0x1E4F1CA48] array];
    [(_UIFlocker *)v6 setGhostPortals:v7];
  }
  return v6;
}

- (void)setBadgeValue:(unint64_t)a3
{
  if (self->_badgeValue != a3)
  {
    self->_unint64_t badgeValue = a3;
    uint64_t v4 = [(_UIFlocker *)self badge];
    unint64_t badgeValue = self->_badgeValue;
    if (badgeValue >= 2 && v4 == 0)
    {
      v8 = objc_opt_new();
      [(_UIFlocker *)self setBadge:v8];

      [0 setAlpha:0.0];
      v7 = [(_UIFlocker *)self badge];
      objc_super v9 = [v7 layer];
      [v9 setShadowPathIsBounds:1];

      unint64_t badgeValue = self->_badgeValue;
    }
    else
    {
      v7 = (void *)v4;
    }
    [v7 setItemCount:badgeValue];
    [v7 layoutIfNeeded];
    [v7 intrinsicContentSize];
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, v10, v11);
    [v7 anchorPointForAlignment];
    double v13 = v12;
    double v15 = v14;
    v16 = [v7 layer];
    objc_msgSend(v16, "setAnchorPoint:", v13, v15);

    if (![(_UIFlocker *)self isFlocked])
    {
      CGAffineTransformMakeScale(&v18, 0.0, 0.0);
      CGAffineTransform v17 = v18;
      [v7 setTransform:&v17];
    }
  }
}

- (void)install
{
  v3 = [(_UIFlocker *)self _primaryPlatterView];
  [v3 setCollapsedShadowStyle:0];
  [v3 setExpandedShadowStyle:1];
  [v3 setNeedsLayout];
  [v3 layoutIfNeeded];
  uint64_t v4 = [v3 collapsedPreview];
  [(_UIFlocker *)self _installGhostPortalForPreview:v4];

  v5 = [(_UIFlocker *)self secondaryPlatterViews];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  double v11 = __21___UIFlocker_install__block_invoke;
  double v12 = &unk_1E52EAAD0;
  double v13 = self;
  id v14 = v3;
  id v6 = v3;
  [v5 enumerateObjectsWithOptions:2 usingBlock:&v9];

  v7 = objc_msgSend(v6, "superview", v9, v10, v11, v12, v13);
  v8 = [(_UIFlocker *)self badge];
  [v7 insertSubview:v8 aboveSubview:v6];
}

- (void)flock
{
  unint64_t v3 = [(_UIFlocker *)self itemCount];
  if (v3 >= 2)
  {
    unint64_t v4 = v3;
    if (![(_UIFlocker *)self isFlocked])
    {
      [(_UIFlocker *)self setIsFlocked:1];
      v5 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:dbl_186B94A10[([(_UIFlocker *)self settings] & 2) == 0]];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __19___UIFlocker_flock__block_invoke;
      v6[3] = &unk_1E52DD178;
      v6[4] = self;
      v6[5] = fmax(fmin(1.0 - (double)v4 / 5.0 + (double)v4 / 5.0 * 0.6, 1.0), 0.6);
      v6[6] = v4;
      +[UIView _animateUsingSpringBehavior:v5 tracking:0 animations:v6 completion:0];
    }
  }
}

- (void)unflockToDrag:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  if ([(_UIFlocker *)self isFlocked])
  {
    [(_UIFlocker *)self setIsFlocked:0];
    v7 = [MEMORY[0x1E4F1CA48] array];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke;
    aBlock[3] = &unk_1E52EAAF8;
    aBlock[4] = self;
    BOOL v45 = v5;
    id v8 = v7;
    id v44 = v8;
    uint64_t v9 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    if (v5)
    {
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke_2;
      v42[3] = &unk_1E52D9F70;
      v42[4] = self;
      +[UIView performWithoutAnimation:v42];
    }
    else
    {
      uint64_t v10 = [(_UIFlocker *)self primaryPlatterPreview];
      v9[2](v9, v10, 1);
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    double v11 = [(_UIFlocker *)self secondaryPlatterViews];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v11);
          }
          v9[2](v9, *(void **)(*((void *)&v38 + 1) + 8 * i), 0);
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v13);
    }

    v16 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.3];
    [v16 setInertialTargetSmoothing:0.0];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke_3;
    v35[3] = &unk_1E52D9F98;
    id v17 = v8;
    id v36 = v17;
    v37 = self;
    CGAffineTransform v18 = (void (**)(void))_Block_copy(v35);
    v19 = [(_UIFlocker *)self ghostPortals];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke_4;
    v32[3] = &unk_1E52D9F98;
    id v20 = v19;
    id v33 = v20;
    id v21 = v17;
    id v34 = v21;
    v22 = (void (**)(void))_Block_copy(v32);
    if (v4)
    {
      v23 = [(_UIFlocker *)self groupCompletion];
      v24 = v23;
      if (v23) {
        id v25 = v23;
      }
      else {
        id v25 = (id)objc_opt_new();
      }
      v26 = v25;

      [v26 addCompletion:v22];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke_5;
      v30[3] = &unk_1E52DA040;
      v31 = v18;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __37___UIFlocker_unflockToDrag_animated___block_invoke_6;
      v28[3] = &unk_1E52DA9D0;
      id v29 = v26;
      id v27 = v26;
      +[UIView _animateUsingSpringBehavior:v16 tracking:0 animations:v30 completion:v28];
    }
    else
    {
      v18[2](v18);
      v22[2](v22);
    }
  }
}

- (void)unflock
{
}

- (CGPoint)badgeLocationInView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_UIFlocker *)self badge];
  id v6 = [v5 superview];
  v7 = [(_UIFlocker *)self badge];
  [v7 center];
  objc_msgSend(v6, "convertPoint:toView:", v4);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)updateFlockLocation
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unint64_t v3 = [(_UIFlocker *)self secondaryPlatterViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        double v9 = [(_UIFlocker *)self primaryPlatterPreview];
        double v10 = [v9 view];
        [v10 center];
        double v12 = v11;
        double v14 = v13;
        double v15 = [v8 view];
        objc_msgSend(v15, "setCenter:", v12, v14);

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  [(_UIFlocker *)self _badgeCenter];
  double v17 = v16;
  double v19 = v18;
  id v20 = [(_UIFlocker *)self badge];
  objc_msgSend(v20, "setCenter:", v17, v19);
}

- (CGPoint)_badgeCenter
{
  unint64_t v3 = [(_UIFlocker *)self _primaryPlatterView];
  [v3 bounds];
  double MaxX = CGRectGetMaxX(v14);
  uint64_t v5 = [(_UIFlocker *)self badge];
  uint64_t v6 = [v5 superview];
  objc_msgSend(v3, "convertPoint:toView:", v6, MaxX, 0.0);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(_UIFlocker *)self containerView];
  double v9 = [(_UIFlocker *)self _primaryPlatterView];
  objc_msgSend(v8, "convertPoint:toView:", v9, x, y);
  double v11 = v10;
  double v13 = v12;

  CGRect v14 = [(_UIFlocker *)self _primaryPlatterView];
  double v15 = objc_msgSend(v14, "hitTest:withEvent:", v7, v11, v13);

  return v15;
}

- (id)_primaryPlatterView
{
  v2 = [(_UIFlocker *)self primaryPlatterPreview];
  unint64_t v3 = [v2 view];

  return v3;
}

- (void)_installGhostPortalForPreview:(id)a3
{
  id v21 = a3;
  if ([v21 _sourceViewIsInViewHierarchy])
  {
    uint64_t v4 = [_UIPortalView alloc];
    uint64_t v5 = [v21 view];
    uint64_t v6 = [(_UIPortalView *)v4 initWithSourceView:v5];

    [(_UIPortalView *)v6 setHidesSourceView:1];
    [(UIView *)v6 setAlpha:0.0];
    [(_UIPortalView *)v6 setMatchesPosition:1];
    [(_UIPortalView *)v6 setMatchesTransform:1];
    [(_UIPortalView *)v6 setName:@"_UIFlocker.flockGhost"];
    [(_UIPortalView *)v6 _setGeometryFrozen:1];
    [(UIView *)v6 setUserInteractionEnabled:0];
    id v7 = [v21 view];
    double v8 = [v7 layer];
    uint64_t v9 = [v8 flipsHorizontalAxis];
    double v10 = [(UIView *)v6 layer];
    [v10 setFlipsHorizontalAxis:v9];

    double v11 = [(_UIFlocker *)self ghostPortals];
    [v11 addObject:v6];

    double v12 = [v21 view];
    [v12 _setGhostPortal:v6];

    double v13 = [v21 view];
    CGRect v14 = [v13 superview];
    double v15 = [v21 target];
    double v16 = [v15 container];

    double v17 = [v21 target];
    double v18 = [v17 container];
    double v19 = v18;
    if (v14 == v16)
    {
      id v20 = [v21 view];
      [v19 insertSubview:v6 aboveSubview:v20];
    }
    else
    {
      [v18 addSubview:v6];
    }
  }
}

- (unint64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(unint64_t)a3
{
  self->_itemCount = a3;
}

- (unint64_t)badgeValue
{
  return self->_badgeValue;
}

- (unint64_t)settings
{
  return self->_settings;
}

- (void)setSettings:(unint64_t)a3
{
  self->_settings = a3;
}

- (UITargetedPreview)primaryPlatterPreview
{
  return self->_primaryPlatterPreview;
}

- (void)setPrimaryPlatterPreview:(id)a3
{
}

- (NSArray)secondaryPlatterViews
{
  return self->_secondaryPlatterViews;
}

- (void)setSecondaryPlatterViews:(id)a3
{
}

- (id)unflockPreviewProvider
{
  return self->_unflockPreviewProvider;
}

- (void)setUnflockPreviewProvider:(id)a3
{
}

- (_UIGroupCompletion)groupCompletion
{
  return self->_groupCompletion;
}

- (void)setGroupCompletion:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (_UIDragBadge)badge
{
  return self->_badge;
}

- (void)setBadge:(id)a3
{
}

- (NSMutableArray)ghostPortals
{
  return self->_ghostPortals;
}

- (void)setGhostPortals:(id)a3
{
}

- (BOOL)isFlocked
{
  return self->_isFlocked;
}

- (void)setIsFlocked:(BOOL)a3
{
  self->_isFlocked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ghostPortals, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_groupCompletion, 0);
  objc_storeStrong(&self->_unflockPreviewProvider, 0);
  objc_storeStrong((id *)&self->_secondaryPlatterViews, 0);
  objc_storeStrong((id *)&self->_primaryPlatterPreview, 0);
}

@end