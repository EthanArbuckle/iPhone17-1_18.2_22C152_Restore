@interface _UIStatusBarRegion
- (BOOL)disableItemFrameBasedOverflow;
- (BOOL)hoverHighlightsAsRegion;
- (BOOL)isEnabled;
- (BOOL)isFrozen;
- (BOOL)needsReLayout;
- (BOOL)offsetable;
- (CGRect)absoluteHoverFrame;
- (NSArray)currentEnabledDisplayItems;
- (NSArray)enabledDisplayItems;
- (NSDictionary)displayItemAbsoluteFrames;
- (NSDirectionalEdgeInsets)extendedHoverInsets;
- (NSLayoutConstraint)centerXConstraint;
- (NSLayoutConstraint)centerYConstraint;
- (NSMutableIndexSet)disablingTokens;
- (NSOrderedSet)displayItems;
- (NSSet)dependentRegionIdentifiers;
- (NSString)description;
- (NSString)identifier;
- (UIEdgeInsets)actionInsets;
- (UILayoutGuide)layoutGuide;
- (UILayoutItem)containerItem;
- (UILayoutItem)layoutItem;
- (UIOffset)offset;
- (UIView)backgroundView;
- (UIView)containerView;
- (UIView)contentView;
- (UIView)frozenView;
- (UIView)highlightView;
- (UIView)hoverView;
- (_UIStatusBar)statusBar;
- (_UIStatusBarAction)action;
- (_UIStatusBarAction)hoverAction;
- (_UIStatusBarDisplayItem)overflowedDisplayItem;
- (_UIStatusBarRegion)enabilityRegion;
- (_UIStatusBarRegion)initWithIdentifier:(id)a3;
- (_UIStatusBarRegionLayout)layout;
- (_UIStatusBarStyleAttributes)overriddenStyleAttributes;
- (double)alpha;
- (id)displayItemForHUDAtLocation:(CGPoint)a3;
- (int64_t)effectiveStyle;
- (int64_t)overriddenStyle;
- (int64_t)style;
- (void)_addSubview:(id)a3 atBack:(BOOL)a4;
- (void)_overriddenStyleAttributesChanged;
- (void)disableWithToken:(unint64_t)a3;
- (void)enableWithToken:(unint64_t)a3;
- (void)setAction:(id)a3;
- (void)setActionInsets:(UIEdgeInsets)a3;
- (void)setAlpha:(double)a3;
- (void)setBackgroundView:(id)a3;
- (void)setCenterXConstraint:(id)a3;
- (void)setCenterYConstraint:(id)a3;
- (void)setContentView:(id)a3;
- (void)setDependentRegionIdentifiers:(id)a3;
- (void)setDisableItemFrameBasedOverflow:(BOOL)a3;
- (void)setDisablingTokens:(id)a3;
- (void)setDisplayItems:(id)a3;
- (void)setEnabilityRegion:(id)a3;
- (void)setExtendedHoverInsets:(NSDirectionalEdgeInsets)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setFrozenView:(id)a3;
- (void)setHighlightView:(id)a3;
- (void)setHoverAction:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLayout:(id)a3;
- (void)setLayoutGuide:(id)a3;
- (void)setNeedsReLayout:(BOOL)a3;
- (void)setOffset:(UIOffset)a3;
- (void)setOffsetable:(BOOL)a3;
- (void)setOverriddenStyle:(int64_t)a3;
- (void)setOverriddenStyleAttributes:(id)a3;
- (void)setStatusBar:(id)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation _UIStatusBarRegion

- (_UIStatusBarRegion)initWithIdentifier:(id)a3
{
  v4 = (NSString *)a3;
  v15.receiver = self;
  v15.super_class = (Class)_UIStatusBarRegion;
  v5 = [(_UIStatusBarRegion *)&v15 init];
  identifier = v5->_identifier;
  v5->_identifier = v4;
  v7 = v4;

  v8 = objc_alloc_init(UILayoutGuide);
  layoutGuide = v5->_layoutGuide;
  v5->_layoutGuide = v8;

  v10 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  displayItems = v5->_displayItems;
  v5->_displayItems = v10;

  uint64_t v12 = [MEMORY[0x1E4F28E60] indexSet];
  disablingTokens = v5->_disablingTokens;
  v5->_disablingTokens = (NSMutableIndexSet *)v12;

  *(int64x2_t *)&v5->_style = vdupq_n_s64(4uLL);
  return v5;
}

- (NSString)description
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(sel_identifier);
  v9 = v3;
  v4 = NSStringFromSelector(sel_enabled);
  v10 = v4;
  v5 = NSStringFromSelector(sel_displayItems);
  v11 = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:3];
  v7 = +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v6, v9, v10);

  return (NSString *)v7;
}

- (UIView)hoverView
{
  contentView = self->_contentView;
  if (!contentView) {
    contentView = self->_backgroundView;
  }
  v3 = contentView;
  return v3;
}

- (BOOL)hoverHighlightsAsRegion
{
  return 1;
}

- (CGRect)absoluteHoverFrame
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [(_UIStatusBarRegion *)self layoutItem];
  v4 = objc_msgSend(v3, "_ui_superview");
  v5 = [(_UIStatusBarRegion *)self layout];
  v6 = [v5 displayItems];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    double v11 = 1.79769313e308;
    double v12 = 2.22507386e-308;
    double v13 = 2.22507386e-308;
    double v14 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "absoluteFrame", (void)v30);
        CGFloat x = v36.origin.x;
        CGFloat y = v36.origin.y;
        CGFloat width = v36.size.width;
        CGFloat height = v36.size.height;
        double MinX = CGRectGetMinX(v36);
        if (v14 >= MinX) {
          double v14 = MinX;
        }
        v37.origin.CGFloat x = x;
        v37.origin.CGFloat y = y;
        v37.size.CGFloat width = width;
        v37.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v37);
        if (v11 >= MinY) {
          double v11 = MinY;
        }
        v38.origin.CGFloat x = x;
        v38.origin.CGFloat y = y;
        v38.size.CGFloat width = width;
        v38.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v38);
        if (v13 < MaxX) {
          double v13 = MaxX;
        }
        v39.origin.CGFloat x = x;
        v39.origin.CGFloat y = y;
        v39.size.CGFloat width = width;
        v39.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v39);
        if (v12 < MaxY) {
          double v12 = MaxY;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }
  else
  {
    double v11 = 1.79769313e308;
    double v12 = 2.22507386e-308;
    double v13 = 2.22507386e-308;
    double v14 = 1.79769313e308;
  }

  if ([v7 count])
  {
    double v24 = v13 - v14;
    double v25 = v12 - v11;
  }
  else
  {
    double v14 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v26 = v14;
  double v27 = v11;
  double v28 = v24;
  double v29 = v25;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (UILayoutItem)layoutItem
{
  contentView = self->_contentView;
  if (!contentView) {
    contentView = self->_layoutGuide;
  }
  id v3 = contentView;
  return (UILayoutItem *)v3;
}

- (UILayoutItem)containerItem
{
  if (self->_offsetable || (layoutGuide = self->_contentView) == 0) {
    layoutGuide = self->_layoutGuide;
  }
  id v3 = layoutGuide;
  return (UILayoutItem *)v3;
}

- (void)setIdentifier:(id)a3
{
  v6 = (NSString *)a3;
  if (self->_identifier != v6)
  {
    objc_storeStrong((id *)&self->_identifier, a3);
    v5 = [(_UIStatusBarRegion *)self layoutGuide];
    [v5 setIdentifier:v6];
  }
}

- (void)setLayout:(id)a3
{
  v5 = (_UIStatusBarRegionLayout *)a3;
  p_layout = &self->_layout;
  layout = self->_layout;
  uint64_t v9 = v5;
  if (layout != v5)
  {
    if (layout)
    {
      [(_UIStatusBarRegionLayout *)layout setRegion:0];
      [(_UIStatusBarRegionLayout *)*p_layout setDisplayItems:MEMORY[0x1E4F1CBF0]];
    }
    objc_storeStrong((id *)&self->_layout, a3);
    if (*p_layout)
    {
      [(_UIStatusBarRegionLayout *)*p_layout setRegion:self];
      uint64_t v8 = [(_UIStatusBarRegion *)self currentEnabledDisplayItems];
      [(_UIStatusBarRegionLayout *)self->_layout setDisplayItems:v8];
    }
  }
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = (void **)&self->_contentView;
  if (self->_contentView != v5)
  {
    double v11 = v5;
    id v7 = [(_UIStatusBarRegion *)self layoutItem];
    objc_msgSend(v7, "_ui_removeFromParentLayoutItem");

    if (v11)
    {
      objc_storeStrong((id *)&self->_contentView, a3);
      [(UIView *)self->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
      p_contentView = (void **)&self->_layoutGuide;
    }
    else
    {
      uint64_t v8 = objc_alloc_init(UILayoutGuide);
      layoutGuide = self->_layoutGuide;
      self->_layoutGuide = v8;
    }
    uint64_t v10 = *p_contentView;
    *p_contentView = 0;

    v5 = v11;
  }
}

- (void)setOffsetable:(BOOL)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  if (self->_offsetable != a3)
  {
    self->_offsetable = a3;
    if (a3)
    {
      if (!self->_contentView)
      {
        v4 = objc_alloc_init(UIView);
        [(_UIStatusBarRegion *)self setContentView:v4];
      }
      v5 = objc_alloc_init(UILayoutGuide);
      layoutGuide = self->_layoutGuide;
      self->_layoutGuide = v5;

      [(UIView *)self->_contentView addLayoutGuide:self->_layoutGuide];
      id v7 = [(UILayoutGuide *)self->_layoutGuide centerXAnchor];
      uint64_t v8 = [(UIView *)self->_contentView centerXAnchor];
      uint64_t v9 = [v7 constraintEqualToAnchor:v8];
      centerXConstraint = self->_centerXConstraint;
      self->_centerXConstraint = v9;

      double v11 = [(UILayoutGuide *)self->_layoutGuide centerYAnchor];
      double v12 = [(UIView *)self->_contentView centerYAnchor];
      double v13 = [v11 constraintEqualToAnchor:v12];
      centerYConstraint = self->_centerYConstraint;
      self->_centerYConstraint = v13;

      objc_super v15 = (void *)MEMORY[0x1E4F5B268];
      v16 = self->_centerYConstraint;
      v17 = self->_layoutGuide;
      v25[0] = self->_centerXConstraint;
      v25[1] = v16;
      v18 = [(UILayoutGuide *)v17 widthAnchor];
      v19 = [(UIView *)self->_contentView widthAnchor];
      v20 = [v18 constraintEqualToAnchor:v19];
      v25[2] = v20;
      v21 = [(UILayoutGuide *)self->_layoutGuide heightAnchor];
      v22 = [(UIView *)self->_contentView heightAnchor];
      v23 = [v21 constraintEqualToAnchor:v22];
      v25[3] = v23;
      double v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
      [v15 activateConstraints:v24];
    }
  }
}

- (void)setOffset:(UIOffset)a3
{
  if (self->_offsetable)
  {
    double vertical = a3.vertical;
    if (a3.horizontal != self->_offset.horizontal || a3.vertical != self->_offset.vertical)
    {
      self->_offset = a3;
      -[NSLayoutConstraint setConstant:](self->_centerXConstraint, "setConstant:");
      centerYConstraint = self->_centerYConstraint;
      [(NSLayoutConstraint *)centerYConstraint setConstant:vertical];
    }
  }
}

- (void)_addSubview:(id)a3 atBack:(BOOL)a4
{
  BOOL v4 = a4;
  v23[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [(_UIStatusBarRegion *)self layoutItem];
  uint64_t v8 = objc_msgSend(v7, "_ui_superview");
  v22 = v8;
  if (v4)
  {
    [v8 insertSubview:v6 atIndex:0];
  }
  else if (self->_contentView)
  {
    objc_msgSend(v8, "insertSubview:aboveSubview:", v6);
  }
  else
  {
    [v8 addSubview:v6];
  }
  v21 = [v6 topAnchor];
  v20 = [v7 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v23[0] = v19;
  v18 = [v6 leftAnchor];
  v17 = [v7 leftAnchor];
  uint64_t v9 = [v18 constraintEqualToAnchor:v17];
  v23[1] = v9;
  uint64_t v10 = [v6 bottomAnchor];
  double v11 = [v7 bottomAnchor];
  double v12 = [v10 constraintEqualToAnchor:v11];
  v23[2] = v12;
  double v13 = [v6 rightAnchor];
  double v14 = [v7 rightAnchor];
  objc_super v15 = [v13 constraintEqualToAnchor:v14];
  v23[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];

  [MEMORY[0x1E4F5B268] activateConstraints:v16];
}

- (void)setBackgroundView:(id)a3
{
  v5 = (UIView *)a3;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    id v7 = v5;
    if (v5)
    {
      [(_UIStatusBarRegion *)self _addSubview:v5 atBack:1];
      backgroundView = self->_backgroundView;
    }
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    v5 = v7;
  }
}

- (void)setHighlightView:(id)a3
{
  v5 = (UIView *)a3;
  highlightView = self->_highlightView;
  if (highlightView != v5)
  {
    id v7 = v5;
    if (v5)
    {
      [(_UIStatusBarRegion *)self _addSubview:v5 atBack:0];
      highlightView = self->_highlightView;
    }
    [(UIView *)highlightView removeFromSuperview];
    objc_storeStrong((id *)&self->_highlightView, a3);
    v5 = v7;
  }
}

- (BOOL)isEnabled
{
  p_enabilityRegion = &self->_enabilityRegion;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enabilityRegion);
  BOOL result = (!WeakRetained
         || (v5 = WeakRetained,
             id v6 = objc_loadWeakRetained((id *)p_enabilityRegion),
             int v7 = [v6 isEnabled],
             v6,
             v5,
             v7))
        && [(NSMutableIndexSet *)self->_disablingTokens count] == 0;
  return result;
}

- (void)disableWithToken:(unint64_t)a3
{
}

- (void)enableWithToken:(unint64_t)a3
{
}

- (void)setFrozen:(BOOL)a3
{
  BOOL v3 = a3;
  v27[2] = *MEMORY[0x1E4F143B8];
  if ([(_UIStatusBarRegion *)self isFrozen] != a3)
  {
    if (v3)
    {
      contentView = self->_contentView;
      if (!contentView)
      {
        double v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:a2 object:self file:@"_UIStatusBarRegion.m" lineNumber:269 description:@"Setting frozen requires a content view"];

        contentView = self->_contentView;
      }
      [(UIView *)contentView bounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [(UIView *)self->_contentView alpha];
      double v16 = v15;
      [(UIView *)self->_contentView setAlpha:1.0];
      v17 = -[UISnapshotView initWithFrame:]([UISnapshotView alloc], "initWithFrame:", v8, v10, v12, v14);
      -[UISnapshotView captureSnapshotRect:fromView:withSnapshotType:](v17, "captureSnapshotRect:fromView:withSnapshotType:", self->_contentView, 0, v8, v10, v12, v14);
      [(_UIStatusBarRegion *)self setFrozenView:v17];
      [(UIView *)self->_frozenView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)self->_frozenView setAlpha:v16];
      [(_UIStatusBarRegion *)self _addSubview:self->_frozenView atBack:1];
      v18 = [(UIView *)self->_frozenView widthAnchor];
      v29.origin.CGFloat x = v8;
      v29.origin.CGFloat y = v10;
      v29.size.CGFloat width = v12;
      v29.size.CGFloat height = v14;
      v19 = [v18 constraintEqualToConstant:CGRectGetWidth(v29)];
      v27[0] = v19;
      v20 = [(UIView *)self->_frozenView heightAnchor];
      v30.origin.CGFloat x = v8;
      v30.origin.CGFloat y = v10;
      v30.size.CGFloat width = v12;
      v30.size.CGFloat height = v14;
      v21 = [v20 constraintEqualToConstant:CGRectGetHeight(v30)];
      v27[1] = v21;
      v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

      [MEMORY[0x1E4F5B268] activateConstraints:v22];
      [(UIView *)self->_contentView setAlpha:0.0];
    }
    else
    {
      [(UIView *)self->_frozenView alpha];
      double v24 = v23;
      double v25 = [(_UIStatusBarRegion *)self containerView];
      [v25 setAlpha:v24];

      [(UIView *)self->_frozenView removeFromSuperview];
      [(_UIStatusBarRegion *)self setFrozenView:0];
    }
  }
}

- (BOOL)isFrozen
{
  return self->_frozenView != 0;
}

- (void)setAlpha:(double)a3
{
  if (!self->_contentView)
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UIStatusBarRegion.m" lineNumber:305 description:@"Setting alpha requires a content view"];
  }
  BOOL v5 = [(_UIStatusBarRegion *)self isFrozen];
  uint64_t v6 = 104;
  if (v5) {
    uint64_t v6 = 176;
  }
  double v7 = *(Class *)((char *)&self->super.isa + v6);
  [v7 setAlpha:a3];
}

- (void)_overriddenStyleAttributesChanged
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(_UIStatusBarRegion *)self currentEnabledDisplayItems];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        double v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) item];
        [v7 setNeedsUpdate];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (int64_t)effectiveStyle
{
  int64_t result = self->_overriddenStyle;
  if (result == 4) {
    return self->_style;
  }
  return result;
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    if (self->_overriddenStyle == 4) {
      [(_UIStatusBarRegion *)self _overriddenStyleAttributesChanged];
    }
  }
}

- (void)setOverriddenStyle:(int64_t)a3
{
  if (self->_overriddenStyle != a3)
  {
    self->_overriddenStyle = a3;
    [(_UIStatusBarRegion *)self _overriddenStyleAttributesChanged];
  }
}

- (void)setOverriddenStyleAttributes:(id)a3
{
  id v5 = a3;
  overriddenStyleAttributes = self->_overriddenStyleAttributes;
  long long v9 = (_UIStatusBarStyleAttributes *)v5;
  double v7 = overriddenStyleAttributes;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  BOOL v8 = [(_UIStatusBarStyleAttributes *)v9 isEqual:v7];

  if (!v8)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_overriddenStyleAttributes, a3);
    [(_UIStatusBarRegion *)self _overriddenStyleAttributesChanged];
  }
LABEL_9:
}

- (void)setDisplayItems:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v5 = (NSOrderedSet *)a3;
  displayItems = self->_displayItems;
  if (displayItems != v5 && ([(NSOrderedSet *)displayItems isEqual:v5] & 1) == 0)
  {
    self->_BOOL needsReLayout = 0;
    goto LABEL_16;
  }
  BOOL needsReLayout = self->_needsReLayout;
  self->_BOOL needsReLayout = 0;
  if (needsReLayout) {
    goto LABEL_16;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  BOOL v8 = v5;
  uint64_t v9 = [(NSOrderedSet *)v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v9)
  {
LABEL_29:

    goto LABEL_30;
  }
  uint64_t v10 = v9;
  char v11 = 0;
  uint64_t v12 = *(void *)v41;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v41 != v12) {
        objc_enumerationMutation(v8);
      }
      double v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      if ([v14 needsAddingToLayout])
      {
        [v14 setNeedsAddingToLayout:0];
        char v11 = 1;
      }
    }
    uint64_t v10 = [(NSOrderedSet *)v8 countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v10);

  if (v11)
  {
LABEL_16:
    if (!self->_layout)
    {
      long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
      [v33 handleFailureInMethod:a2, self, @"_UIStatusBarRegion.m", 371, @"%@ has no layout", self object file lineNumber description];
    }
    double v15 = self->_displayItems;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __38___UIStatusBarRegion_setDisplayItems___block_invoke;
    v37[3] = &unk_1E5307458;
    double v16 = v5;
    CGRect v38 = v16;
    CGRect v39 = self;
    [(NSOrderedSet *)v15 enumerateObjectsUsingBlock:v37];
    v17 = (NSOrderedSet *)[(NSOrderedSet *)v16 copy];
    v18 = self->_displayItems;
    self->_displayItems = v17;

    v19 = [(_UIStatusBarRegion *)self enabledDisplayItems];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (v20 = self->_layout,
          [(_UIStatusBarRegion *)self containerItem],
          v21 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v20) = [(_UIStatusBarRegionLayout *)v20 mayFitDisplayItems:v19 inContainerItem:v21], v21, (v20 & 1) == 0))
    {
      double v23 = (NSOrderedSet *)[(NSOrderedSet *)self->_displayItems mutableCopy];
      v22 = (void *)[v19 mutableCopy];
      do
      {
        uint64_t v24 = _UIStatusBarGetLowestPrioritizedItem(v22);
        if (!v24) {
          break;
        }
        double v25 = (void *)v24;
        [v22 removeObject:v24];
        [(NSOrderedSet *)v23 removeObject:v25];
        [v25 setContainerView:0];
        [v25 setRegion:0];

        layout = self->_layout;
        double v27 = [(_UIStatusBarRegion *)self containerItem];
        LODWORD(layout) = [(_UIStatusBarRegionLayout *)layout mayFitDisplayItems:v22 inContainerItem:v27];
      }
      while (!layout);
      double v28 = self->_displayItems;
      self->_displayItems = v23;
    }
    else
    {
      v22 = v19;
    }
    contentView = self->_contentView;
    if (contentView)
    {
      CGRect v30 = contentView;
    }
    else
    {
      CGRect v30 = [(UILayoutGuide *)self->_layoutGuide owningView];
    }
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __38___UIStatusBarRegion_setDisplayItems___block_invoke_2;
    v34[3] = &unk_1E5307458;
    uint64_t v35 = v30;
    CGRect v36 = self;
    long long v31 = v30;
    [v22 enumerateObjectsUsingBlock:v34];
    long long v32 = [(_UIStatusBarRegion *)self enabledDisplayItems];
    [(_UIStatusBarRegionLayout *)self->_layout setDisplayItems:v32];

    BOOL v8 = v38;
    goto LABEL_29;
  }
LABEL_30:
}

- (NSArray)enabledDisplayItems
{
  displayItems = self->_displayItems;
  uint64_t v3 = [(NSOrderedSet *)displayItems indexesOfObjectsPassingTest:&__block_literal_global_501];
  uint64_t v4 = [(NSOrderedSet *)displayItems objectsAtIndexes:v3];

  return (NSArray *)v4;
}

- (NSArray)currentEnabledDisplayItems
{
  displayItems = self->_displayItems;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48___UIStatusBarRegion_currentEnabledDisplayItems__block_invoke;
  v6[3] = &unk_1E53079F0;
  v6[4] = self;
  uint64_t v3 = [(NSOrderedSet *)displayItems indexesOfObjectsPassingTest:v6];
  uint64_t v4 = [(NSOrderedSet *)displayItems objectsAtIndexes:v3];

  return (NSArray *)v4;
}

- (_UIStatusBarDisplayItem)overflowedDisplayItem
{
  if ([(_UIStatusBarRegionLayout *)self->_layout fitsAllItems])
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = _UIStatusBarGetLowestPrioritizedItem(self->_displayItems);
  }
  return (_UIStatusBarDisplayItem *)v3;
}

- (NSDictionary)displayItemAbsoluteFrames
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(_UIStatusBarRegion *)self layout];
  id v5 = [v4 displayItems];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47___UIStatusBarRegion_displayItemAbsoluteFrames__block_invoke;
  v8[3] = &unk_1E53056E8;
  id v6 = v3;
  id v9 = v6;
  [v5 enumerateObjectsUsingBlock:v8];

  return (NSDictionary *)v6;
}

- (id)displayItemForHUDAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v6 = [(_UIStatusBarRegion *)self layout];
  double v7 = [v6 displayItems];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v30;
    double v12 = 1.79769313e308;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v30 != v11) {
        objc_enumerationMutation(v7);
      }
      double v14 = *(void **)(*((void *)&v29 + 1) + 8 * v13);
      double v15 = [v14 view];
      [v15 frame];
      if (CGRectIsEmpty(v36)) {
        goto LABEL_18;
      }
      double v16 = [(_UIStatusBarRegion *)self statusBar];
      objc_msgSend(v16, "convertPoint:toView:", v15, x, y);
      double v18 = v17;

      [v15 bounds];
      if (objc_msgSend(v15, "pointInside:withEvent:", 0, v18, CGRectGetMidY(v37)))
      {
        id v27 = v14;

        goto LABEL_24;
      }
      [v15 bounds];
      double MinX = CGRectGetMinX(v38);
      [v15 bounds];
      if (v18 <= MinX) {
        break;
      }
      if (v18 >= CGRectGetMaxX(*(CGRect *)&v20))
      {
        [v15 bounds];
        double v24 = v18 - CGRectGetMaxX(v39);
        goto LABEL_12;
      }
LABEL_18:

      if (v9 == ++v13)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_23;
      }
    }
    double v24 = CGRectGetMinX(*(CGRect *)&v20) - v18;
LABEL_12:
    if (v24 < 6.0 && v24 < v12)
    {
      id v26 = v14;

      id v10 = v26;
      double v12 = v24;
    }
    goto LABEL_18;
  }
  id v10 = 0;
LABEL_23:

  id v10 = v10;
  id v27 = v10;
LABEL_24:

  return v27;
}

- (_UIStatusBarAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (UIEdgeInsets)actionInsets
{
  double top = self->_actionInsets.top;
  double left = self->_actionInsets.left;
  double bottom = self->_actionInsets.bottom;
  double right = self->_actionInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setActionInsets:(UIEdgeInsets)a3
{
  self->_actionInsets = a3;
}

- (_UIStatusBarAction)hoverAction
{
  return self->_hoverAction;
}

- (void)setHoverAction:(id)a3
{
}

- (NSDirectionalEdgeInsets)extendedHoverInsets
{
  double top = self->_extendedHoverInsets.top;
  double leading = self->_extendedHoverInsets.leading;
  double bottom = self->_extendedHoverInsets.bottom;
  double trailing = self->_extendedHoverInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setExtendedHoverInsets:(NSDirectionalEdgeInsets)a3
{
  self->_extendedHoverInsets = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (_UIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (_UIStatusBar *)WeakRetained;
}

- (void)setStatusBar:(id)a3
{
}

- (_UIStatusBarRegionLayout)layout
{
  return self->_layout;
}

- (NSSet)dependentRegionIdentifiers
{
  return self->_dependentRegionIdentifiers;
}

- (void)setDependentRegionIdentifiers:(id)a3
{
}

- (_UIStatusBarRegion)enabilityRegion
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enabilityRegion);
  return (_UIStatusBarRegion *)WeakRetained;
}

- (void)setEnabilityRegion:(id)a3
{
}

- (BOOL)offsetable
{
  return self->_offsetable;
}

- (UIOffset)offset
{
  double horizontal = self->_offset.horizontal;
  double vertical = self->_offset.vertical;
  result.double vertical = vertical;
  result.double horizontal = horizontal;
  return result;
}

- (double)alpha
{
  return self->_alpha;
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)overriddenStyle
{
  return self->_overriddenStyle;
}

- (_UIStatusBarStyleAttributes)overriddenStyleAttributes
{
  return self->_overriddenStyleAttributes;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)highlightView
{
  return self->_highlightView;
}

- (NSOrderedSet)displayItems
{
  return self->_displayItems;
}

- (BOOL)needsReLayout
{
  return self->_needsReLayout;
}

- (void)setNeedsReLayout:(BOOL)a3
{
  self->_BOOL needsReLayout = a3;
}

- (BOOL)disableItemFrameBasedOverflow
{
  return self->_disableItemFrameBasedOverflow;
}

- (void)setDisableItemFrameBasedOverflow:(BOOL)a3
{
  self->_disableItemFrameBasedOverflow = a3;
}

- (NSMutableIndexSet)disablingTokens
{
  return self->_disablingTokens;
}

- (void)setDisablingTokens:(id)a3
{
}

- (UILayoutGuide)layoutGuide
{
  return self->_layoutGuide;
}

- (void)setLayoutGuide:(id)a3
{
}

- (NSLayoutConstraint)centerXConstraint
{
  return self->_centerXConstraint;
}

- (void)setCenterXConstraint:(id)a3
{
}

- (NSLayoutConstraint)centerYConstraint
{
  return self->_centerYConstraint;
}

- (void)setCenterYConstraint:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)frozenView
{
  return self->_frozenView;
}

- (void)setFrozenView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frozenView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_centerYConstraint, 0);
  objc_storeStrong((id *)&self->_centerXConstraint, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_disablingTokens, 0);
  objc_storeStrong((id *)&self->_displayItems, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_overriddenStyleAttributes, 0);
  objc_destroyWeak((id *)&self->_enabilityRegion);
  objc_storeStrong((id *)&self->_dependentRegionIdentifiers, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_destroyWeak((id *)&self->_statusBar);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hoverAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end