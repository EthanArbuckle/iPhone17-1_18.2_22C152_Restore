@interface NotesBackgroundView
- (BOOL)_accessibilityIsScannerGroup;
- (BOOL)hasBarBlur;
- (BOOL)isContentViewVisible;
- (BOOL)isPreviewing;
- (ICAccessibilityChildReparentingController)axChildReparentingController;
- (ICAccessibilityChildReparentingProvider)elementForAccessibilityReparenting;
- (NotesBackgroundView)initWithCoder:(id)a3;
- (NotesBackgroundView)initWithFrame:(CGRect)a3;
- (NotesBarBackgroundView)topBarView;
- (UIView)contentView;
- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)_findDescendantAXElementOfClass:(Class)a3;
- (id)_miniPlayerView;
- (id)accessibilityElements;
- (id)scrollViewDescendantOfView:(id)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_setOverrideUserInterfaceStyle:(int64_t)a3;
- (void)addConstraintsForSafeAreaLayoutGuide:(id)a3 bottomToolbar:(id)a4 toContainer:(id)a5;
- (void)addConstraintsForSafeAreaLayoutGuide:(id)a3 toContainer:(id)a4;
- (void)addSubview:(id)a3;
- (void)addSubviewAboveAllViews:(id)a3;
- (void)applyContentViewBezelsStandalone:(BOOL)a3;
- (void)commonInit;
- (void)scrollView:(id)a3 didChangeContentOffset:(CGPoint)a4;
- (void)setAxChildReparentingController:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentView:(id)a3 useSafeAreaLayoutGuide:(BOOL)a4 standalone:(BOOL)a5 needsAdditionalBottomMargin:(BOOL)a6 needsAdditionalLeadingMargin:(BOOL)a7 force:(BOOL)a8;
- (void)setContentView:(id)a3 useSafeAreaLayoutGuide:(BOOL)a4 topMargin:(double)a5 bottomMargin:(double)a6 leadingMargin:(double)a7 trailingMargin:(double)a8 standalone:(BOOL)a9 force:(BOOL)a10;
- (void)setContentViewVisible:(BOOL)a3;
- (void)setElementForAccessibilityReparenting:(id)a3;
- (void)setHasBarBlur:(BOOL)a3;
- (void)setPreviewing:(BOOL)a3;
- (void)setTopBarView:(id)a3;
- (void)updateContentViewBezelsStandalone:(BOOL)a3 needsAdditionalBottomMargin:(BOOL)a4 needsAdditionalLeadingMargin:(BOOL)a5 force:(BOOL)a6;
@end

@implementation NotesBackgroundView

- (UIView)contentView
{
  return self->_contentView;
}

- (NotesBackgroundView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NotesBackgroundView;
  v3 = [(NotesBackgroundView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(NotesBackgroundView *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  if ((objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision") & 1) == 0 && (ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    v3 = [NotesBarBackgroundView alloc];
    v4 = -[NotesBarBackgroundView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    topBarView = self->_topBarView;
    self->_topBarView = v4;

    [(NotesBarBackgroundView *)self->_topBarView setClipsToBounds:1];
    [(NotesBarBackgroundView *)self->_topBarView setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v6 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(NotesBarBackgroundView *)self->_topBarView setColor:v6];

    [(NotesBackgroundView *)self addSubview:self->_topBarView];
    v7 = _NSDictionaryOfVariableBindings(&cfstr_Topbarview.isa, self->_topBarView, 0);
    v8 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[_topBarView]|" options:0 metrics:0 views:v7];
    [(NotesBackgroundView *)self addConstraints:v8];

    v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self attribute:3 relatedBy:0 toItem:self->_topBarView attribute:3 multiplier:1.0 constant:0.0];
    [(NotesBackgroundView *)self addConstraint:v9];
  }
  if (ICInternalSettingsIsTextKit2Enabled())
  {
    id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    id v11 = (id)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(NotesBackgroundView *)self setContentView:v11];
  }
}

- (void)setContentView:(id)a3
{
  v4 = (void *)MEMORY[0x1E4FB16C8];
  id v5 = a3;
  -[NotesBackgroundView setContentView:useSafeAreaLayoutGuide:standalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:](self, "setContentView:useSafeAreaLayoutGuide:standalone:needsAdditionalBottomMargin:needsAdditionalLeadingMargin:force:", v5, objc_msgSend(v4, "ic_isVision"), -[UIView ic_hasCompactWidth](self, "ic_hasCompactWidth"), 1, 0, 0);
}

- (void)setContentView:(id)a3 useSafeAreaLayoutGuide:(BOOL)a4 standalone:(BOOL)a5 needsAdditionalBottomMargin:(BOOL)a6 needsAdditionalLeadingMargin:(BOOL)a7 force:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  BOOL v12 = a4;
  v14 = (void *)MEMORY[0x1E4FB16C8];
  id v19 = a3;
  int v15 = objc_msgSend(v14, "ic_isVision");
  if ((v11 || v9) & objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    double v16 = 12.0;
  }
  else {
    double v16 = 0.0;
  }
  if ((v15 & v10) != 0) {
    double v17 = 12.0;
  }
  else {
    double v17 = 0.0;
  }
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")) {
    double v18 = 12.0;
  }
  else {
    double v18 = 0.0;
  }
  [(NotesBackgroundView *)self setContentView:v19 useSafeAreaLayoutGuide:v12 topMargin:v11 bottomMargin:v8 leadingMargin:0.0 trailingMargin:v17 standalone:v16 force:v18];
}

- (void)setContentView:(id)a3 useSafeAreaLayoutGuide:(BOOL)a4 topMargin:(double)a5 bottomMargin:(double)a6 leadingMargin:(double)a7 trailingMargin:(double)a8 standalone:(BOOL)a9 force:(BOOL)a10
{
  BOOL v10 = a10;
  BOOL v11 = a9;
  id v19 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v19 || v10)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(UIView *)*p_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    if (*p_contentView) {
      [(NotesBackgroundView *)self insertSubview:*p_contentView atIndex:0];
    }
    v23 = [MEMORY[0x1E4F1CA48] array];
    if (a4)
    {
      v24 = [(NotesBackgroundView *)self safeAreaLayoutGuide];
      uint64_t v25 = [v24 leadingAnchor];
    }
    else
    {
      uint64_t v25 = [(NotesBackgroundView *)self leadingAnchor];
    }
    v26 = [(UIView *)*p_contentView leadingAnchor];
    uint64_t v27 = [v26 constraintEqualToAnchor:v25 constant:a7];

    v45 = (void *)v27;
    [v23 addObject:v27];
    if (a4)
    {
      v28 = [(NotesBackgroundView *)self safeAreaLayoutGuide];
      uint64_t v29 = [v28 widthAnchor];
    }
    else
    {
      uint64_t v29 = [(NotesBackgroundView *)self widthAnchor];
    }
    v30 = [(UIView *)*p_contentView widthAnchor];
    v31 = [v30 constraintEqualToAnchor:v29 constant:-a7 - a8];

    [v23 addObject:v31];
    BOOL v43 = v11;
    if (a4)
    {
      v32 = [(NotesBackgroundView *)self safeAreaLayoutGuide];
      v33 = [v32 topAnchor];
    }
    else
    {
      v33 = [(NotesBackgroundView *)self topAnchor];
    }
    v44 = (void *)v29;
    v34 = [(UIView *)*p_contentView topAnchor];
    v35 = [v34 constraintEqualToAnchor:v33 constant:a5];

    [v23 addObject:v35];
    v36 = (void *)v25;
    if (a4)
    {
      v37 = [(NotesBackgroundView *)self safeAreaLayoutGuide];
      v38 = [v37 bottomAnchor];
    }
    else
    {
      v38 = [(NotesBackgroundView *)self bottomAnchor];
    }
    v39 = [(UIView *)*p_contentView bottomAnchor];
    v40 = [v38 constraintEqualToAnchor:v39 constant:a6];

    [v23 addObject:v40];
    v41 = (void *)MEMORY[0x1E4F28DC8];
    v42 = (void *)[v23 copy];
    [v41 activateConstraints:v42];

    if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision")
      && ![(NotesBackgroundView *)self isPreviewing])
    {
      [(NotesBackgroundView *)self applyContentViewBezelsStandalone:v43];
    }
  }
  MEMORY[0x1F41817F8]();
}

- (void)setElementForAccessibilityReparenting:(id)a3
{
}

- (void)setAxChildReparentingController:(id)a3
{
}

- (void)setHasBarBlur:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hasBarBlur = a3;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    topBarView = self->_topBarView;
    [(NotesBarBackgroundView *)topBarView setHasBlur:v3];
  }
}

- (void)addConstraintsForSafeAreaLayoutGuide:(id)a3 toContainer:(id)a4
{
  id v9 = a3;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    id v5 = [(NotesBackgroundView *)self topBarView];
    objc_super v6 = [v5 bottomAnchor];
    v7 = [v9 topAnchor];
    BOOL v8 = [v6 constraintEqualToAnchor:v7];

    [v8 setActive:1];
  }
}

- (void)scrollView:(id)a3 didChangeContentOffset:(CGPoint)a4
{
  double y = a4.y;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    objc_super v6 = [(NotesBackgroundView *)self topBarView];
    [v6 frame];
    BOOL v8 = v7 + -15.0 > -y;

    id v9 = [(NotesBackgroundView *)self topBarView];
    [v9 setHidden:v8];
  }
}

- (NotesBackgroundView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NotesBackgroundView;
  BOOL v3 = -[NotesBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(NotesBackgroundView *)v3 commonInit];
  }
  return v4;
}

- (void)updateContentViewBezelsStandalone:(BOOL)a3 needsAdditionalBottomMargin:(BOOL)a4 needsAdditionalLeadingMargin:(BOOL)a5 force:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  id v11 = [(NotesBackgroundView *)self contentView];
  [(NotesBackgroundView *)self setContentView:v11 useSafeAreaLayoutGuide:1 standalone:v9 needsAdditionalBottomMargin:v8 needsAdditionalLeadingMargin:v7 force:v6];
}

- (void)applyContentViewBezelsStandalone:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision"))
  {
    if (v3) {
      double v5 = 34.0;
    }
    else {
      double v5 = 16.0;
    }
    BOOL v6 = [(NotesBackgroundView *)self contentView];
    objc_msgSend(v6, "ic_applyRoundedCornersWithTopLeadingRadius:topTrailingRadius:bottomLeadingRadius:bottomTrailingRadius:", 16.0, 16.0, v5, 34.0);

    id v8 = [(NotesBackgroundView *)self contentView];
    BOOL v7 = [v8 layer];
    [v7 setMasksToBounds:1];
  }
}

- (void)_setOverrideUserInterfaceStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NotesBackgroundView;
  -[NotesBackgroundView _setOverrideUserInterfaceStyle:](&v6, sel__setOverrideUserInterfaceStyle_);
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    double v5 = [(NotesBackgroundView *)self topBarView];
    [v5 _setOverrideUserInterfaceStyle:a3];
  }
}

- (void)addConstraintsForSafeAreaLayoutGuide:(id)a3 bottomToolbar:(id)a4 toContainer:(id)a5
{
  id v12 = a3;
  id v7 = a5;
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    id v8 = [(NotesBackgroundView *)self topBarView];
    BOOL v9 = [v8 bottomAnchor];
    BOOL v10 = [v12 topAnchor];
    id v11 = [v9 constraintEqualToAnchor:v10];
    [v7 addConstraint:v11];
  }
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)NotesBackgroundView;
  [(NotesBackgroundView *)&v7 _dynamicUserInterfaceTraitDidChange];
  if ((ICInternalSettingsIsTextKit2Enabled() & 1) == 0)
  {
    BOOL v3 = [(UIView *)self ic_appearanceInfo];
    [v3 navigationBarAlpha];
    double v5 = v4;
    objc_super v6 = [(NotesBackgroundView *)self topBarView];
    [v6 setAlpha:v5];
  }
}

- (id)scrollViewDescendantOfView:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v6 = objc_msgSend(v4, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [(NotesBackgroundView *)self scrollViewDescendantOfView:*(void *)(*((void *)&v13 + 1) + 8 * i)];
          if (v11)
          {
            id v5 = (id)v11;

            goto LABEL_13;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v5 = 0;
  }
LABEL_13:

  return v5;
}

- (void)setContentViewVisible:(BOOL)a3
{
  BOOL v3 = a3;
  self->_contentViewVisible = a3;
  id v4 = [(NotesBackgroundView *)self contentView];
  id v6 = v4;
  double v5 = 0.0;
  if (v3) {
    double v5 = 1.0;
  }
  [v4 setAlpha:v5];
}

- (void)addSubview:(id)a3
{
  id v4 = a3;
  double v5 = [(NotesBackgroundView *)self contentView];

  if (v5)
  {
    id v6 = [(NotesBackgroundView *)self contentView];
    [(NotesBackgroundView *)self insertSubview:v4 aboveSubview:v6];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)NotesBackgroundView;
    [(NotesBackgroundView *)&v7 addSubview:v4];
  }
}

- (void)addSubviewAboveAllViews:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NotesBackgroundView;
  [(NotesBackgroundView *)&v3 addSubview:a3];
}

- (id)accessibilityElements
{
  objc_super v3 = [(NotesBackgroundView *)self axChildReparentingController];
  int v4 = [v3 allowsAccessibilityChildReparenting];

  if (v4)
  {
    double v5 = [(NotesBackgroundView *)self elementForAccessibilityReparenting];
    id v6 = [v5 childElementsForAccessibilityReparenting];

    Class v7 = NSClassFromString(&cfstr_Icnoteeditorda.isa);
    Class v8 = NSClassFromString(&cfstr_Icnoteeditorus.isa);
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    BOOL v10 = [(NotesBackgroundView *)self _accessibleSubviews];
    [v9 addObjectsFromArray:v10];

    [v9 addObjectsFromArray:v6];
    uint64_t v11 = [(NotesBackgroundView *)self _findDescendantAXElementOfClass:v7];
    id v12 = [(NotesBackgroundView *)self _findDescendantAXElementOfClass:v8];
    if (v11)
    {
      [v9 removeObject:v11];
      [v9 insertObject:v11 atIndex:0];
    }
    if (v12)
    {
      [v9 removeObject:v12];
      [v9 insertObject:v12 atIndex:0];
    }
    long long v13 = (void *)[v9 copy];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)NotesBackgroundView;
    long long v13 = [(NotesBackgroundView *)&v15 accessibilityElements];
  }
  return v13;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  Class v8 = [(NotesBackgroundView *)self _miniPlayerView];
  if (v8)
  {
    uint64_t v9 = [(NotesBackgroundView *)self window];
    -[NotesBackgroundView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    long long v14 = [MEMORY[0x1E4FB0688] defaultVoiceOverOptions];
    objc_super v15 = [v8 _accessibilityLeafDescendantsWithOptions:v14];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
LABEL_4:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v25 + 1) + 8 * v20);
        [v21 accessibilityFrame];
        v32.double x = v11;
        v32.double y = v13;
        if (CGRectContainsPoint(v33, v32)) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v18) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v22 = v21;

      if (v22) {
        goto LABEL_13;
      }
    }
    else
    {
LABEL_10:
    }
  }
  v24.receiver = self;
  v24.super_class = (Class)NotesBackgroundView;
  -[NotesBackgroundView _accessibilityHitTest:withEvent:](&v24, sel__accessibilityHitTest_withEvent_, v7, x, y);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v22;
}

- (id)_findDescendantAXElementOfClass:(Class)a3
{
  int v4 = [MEMORY[0x1E4F1CA48] array];
  double v5 = [(NotesBackgroundView *)self _accessibleSubviews];
  if (v5) {
    [v4 addObjectsFromArray:v5];
  }
  while ([v4 count])
  {
    id v6 = [v4 firstObject];
    [v4 removeObjectAtIndex:0];
    if (objc_opt_isKindOfClass()) {
      goto LABEL_9;
    }
    id v7 = [v6 _accessibleSubviews];
    if (v7) {
      [v4 addObjectsFromArray:v7];
    }
  }
  id v6 = 0;
LABEL_9:

  return v6;
}

- (BOOL)_accessibilityIsScannerGroup
{
  return 0;
}

- (id)_miniPlayerView
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = [(NotesBackgroundView *)self subviews];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        Class v8 = [v7 accessibilityIdentifier];
        int v9 = [v8 isEqualToString:@"MiniPlayer"];

        if (v9)
        {
          id v10 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)isContentViewVisible
{
  return self->_contentViewVisible;
}

- (ICAccessibilityChildReparentingController)axChildReparentingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_axChildReparentingController);
  return (ICAccessibilityChildReparentingController *)WeakRetained;
}

- (BOOL)hasBarBlur
{
  return self->_hasBarBlur;
}

- (BOOL)isPreviewing
{
  return self->_previewing;
}

- (void)setPreviewing:(BOOL)a3
{
  self->_previewing = a3;
}

- (NotesBarBackgroundView)topBarView
{
  return self->_topBarView;
}

- (void)setTopBarView:(id)a3
{
}

- (ICAccessibilityChildReparentingProvider)elementForAccessibilityReparenting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementForAccessibilityReparenting);
  return (ICAccessibilityChildReparentingProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementForAccessibilityReparenting);
  objc_storeStrong((id *)&self->_topBarView, 0);
  objc_destroyWeak((id *)&self->_axChildReparentingController);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end