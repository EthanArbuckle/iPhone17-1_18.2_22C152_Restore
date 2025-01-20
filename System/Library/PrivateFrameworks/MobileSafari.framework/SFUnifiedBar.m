@interface SFUnifiedBar
- (BOOL)_showsSquishedContent;
- (BOOL)inlineContentViewPinsScrollPositionToTrailingEdgeDuringResize;
- (BOOL)showsSeparator;
- (BOOL)usesFaintSeparator;
- (CGPoint)_inlineContentSquishAnchorPoint;
- (CGPoint)_squishAnchorPointForStandaloneContentViewAtIndex:(unint64_t)a3;
- (SFUnifiedBar)initWithFrame:(CGRect)a3;
- (SFUnifiedBarContentArrangement)contentArrangement;
- (SFUnifiedBarItemArrangement)itemArrangement;
- (SFUnifiedBarTheme)barTheme;
- (UIView)leadingItemContainerView;
- (UIView)trailingItemContainerView;
- (double)_backgroundAlpha;
- (double)_contentViewSpacing;
- (double)_inlineContentHeight;
- (double)_itemSpacing;
- (double)_layOutStandaloneContentView:(id)a3 atIndex:(unint64_t)a4 minY:(double)a5;
- (double)_layoutIndexes:(id)a3 ofItems:(id)a4 alongEdge:(int64_t)a5 transitioning:(BOOL)a6;
- (double)_spacingBelowContentView:(id)a3;
- (double)_squishVerticalOffset;
- (double)_squishedInlineContentTopOverflow;
- (double)_themeColorVisibility;
- (double)chromelessScrollDistance;
- (double)contentUnderStatusBarHeight;
- (double)expandedHeight;
- (double)extendedBottomHeight;
- (double)squishTransformFactor;
- (double)squishedHeight;
- (unint64_t)backgroundVisibility;
- (unint64_t)marginLevel;
- (unint64_t)sizeClass;
- (void)_installContentView:(id)a3;
- (void)_layOutInlineContentView;
- (void)_layOutStandaloneContentViews;
- (void)_layoutItems:(id)a3 alongEdge:(int64_t)a4;
- (void)_removeViewsForIndexes:(id)a3 ofItems:(id)a4;
- (void)_setNeedsRemovalForViewsAtIndexes:(id)a3 ofItems:(id)a4;
- (void)_setShowsSquishedContent:(BOOL)a3;
- (void)_uninstallContentView:(id)a3;
- (void)_updateBackgroundAlpha;
- (void)_updateBarMetricsForTraitChange;
- (void)_updateSeparatorColor;
- (void)_updateSizeClass;
- (void)_updateSquishedAccessoryViews;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
- (void)setBackgroundVisibility:(unint64_t)a3;
- (void)setBarTheme:(id)a3;
- (void)setBarTheme:(id)a3 animated:(BOOL)a4;
- (void)setChromelessScrollDistance:(double)a3;
- (void)setContentArrangement:(id)a3;
- (void)setContentUnderStatusBarHeight:(double)a3;
- (void)setExtendedBottomHeight:(double)a3;
- (void)setInlineContentViewPinsScrollPositionToTrailingEdgeDuringResize:(BOOL)a3;
- (void)setItemArrangement:(id)a3;
- (void)setItemArrangement:(id)a3 animated:(BOOL)a4;
- (void)setMarginLevel:(unint64_t)a3;
- (void)setShowsSeparator:(BOOL)a3;
- (void)setUsesFaintSeparator:(BOOL)a3;
@end

@implementation SFUnifiedBar

- (SFUnifiedBar)initWithFrame:(CGRect)a3
{
  v35.receiver = self;
  v35.super_class = (Class)SFUnifiedBar;
  v3 = -[SFUnifiedBar initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    [(SFUnifiedBar *)v3 setDirectionalLayoutMargins:defaultLayoutMargins()];
    [(SFUnifiedBar *)v3 setEdgesInsettingLayoutMarginsFromSafeArea:10];
    [(SFUnifiedBar *)v3 setMaximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
    v4 = objc_alloc_init(SFUnifiedBarItemArrangement);
    itemArrangement = v3->_itemArrangement;
    v3->_itemArrangement = v4;

    v6 = objc_alloc_init(SFUnifiedBarContentArrangement);
    contentArrangement = v3->_contentArrangement;
    v3->_contentArrangement = v6;

    v8 = [SFUnifiedBarMetrics alloc];
    v9 = [(SFUnifiedBar *)v3 traitCollection];
    uint64_t v10 = [(SFUnifiedBarMetrics *)v8 initWithTraitCollection:v9];
    barMetrics = v3->_barMetrics;
    v3->_barMetrics = (SFUnifiedBarMetrics *)v10;

    v12 = [SFThemeColorEffectView alloc];
    v13 = [MEMORY[0x1E4FB14C8] effectWithStyle:10];
    uint64_t v14 = [(SFThemeColorEffectView *)v12 initWithEffect:v13];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (SFThemeColorEffectView *)v14;

    [(SFThemeColorEffectView *)v3->_backgroundView setThemeColorVisibility:1.0];
    [(SFUnifiedBar *)v3 addSubview:v3->_backgroundView];
    v16 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    leadingItemContainerView = v3->_leadingItemContainerView;
    v3->_leadingItemContainerView = v16;

    v18 = v3->_leadingItemContainerView;
    id v19 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(UIView *)v18 addInteraction:v19];

    [(SFUnifiedBar *)v3 addSubview:v3->_leadingItemContainerView];
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    trailingItemContainerView = v3->_trailingItemContainerView;
    v3->_trailingItemContainerView = v20;

    v22 = v3->_trailingItemContainerView;
    id v23 = objc_alloc_init(MEMORY[0x1E4FB1938]);
    [(UIView *)v22 addInteraction:v23];

    [(SFUnifiedBar *)v3 addSubview:v3->_trailingItemContainerView];
    v24 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    squishedContentView = v3->_squishedContentView;
    v3->_squishedContentView = v24;

    [(UIView *)v3->_squishedContentView setHidden:1];
    [(SFUnifiedBar *)v3 addSubview:v3->_squishedContentView];
    v26 = objc_alloc_init(_SFCompressedBarButton);
    squishedBarButton = v3->_squishedBarButton;
    v3->_squishedBarButton = &v26->super;

    [(UIButton *)v3->_squishedBarButton setSpringLoaded:1];
    [(UIButton *)v3->_squishedBarButton addTarget:v3 action:sel_squishedBarTapped forControlEvents:64];
    [(UIView *)v3->_squishedContentView addSubview:v3->_squishedBarButton];
    uint64_t v28 = [MEMORY[0x1E4F1CA80] set];
    itemViewsToRemoveOnNextLayout = v3->_itemViewsToRemoveOnNextLayout;
    v3->_itemViewsToRemoveOnNextLayout = (NSMutableSet *)v28;

    v30 = +[SFUnifiedBarTheme defaultTheme];
    [(SFUnifiedBar *)v3 setBarTheme:v30];

    v31 = +[SFUnifiedBarMetrics traitsAffectingBarMetrics];
    id v32 = (id)[(SFUnifiedBar *)v3 registerForTraitChanges:v31 withTarget:v3 action:sel__updateBarMetricsForTraitChange];

    v33 = v3;
  }

  return v3;
}

- (void)_updateBarMetricsForTraitChange
{
  barMetrics = self->_barMetrics;
  v4 = [(SFUnifiedBar *)self traitCollection];
  LODWORD(barMetrics) = [(SFUnifiedBarMetrics *)barMetrics updateWithTraitCollection:v4];

  if (barMetrics)
  {
    self->_needsNotifyMetricsDidChange = 1;
    [(SFUnifiedBar *)self setNeedsLayout];
  }
}

- (void)didMoveToSuperview
{
  v5.receiver = self;
  v5.super_class = (Class)SFUnifiedBar;
  [(SFUnifiedBar *)&v5 didMoveToSuperview];
  v3 = [(SFUnifiedBar *)self superview];
  if (v3)
  {
    v4 = [(_SFBarTheme *)self->_barTheme controlsTintColor];
    [(SFUnifiedBar *)self setTintColor:v4];
  }
  else
  {
    [(SFUnifiedBar *)self setTintColor:0];
  }
}

- (void)setItemArrangement:(id)a3
{
}

- (void)setItemArrangement:(id)a3 animated:(BOOL)a4
{
  id v7 = a3;
  p_itemArrangement = &self->_itemArrangement;
  if (![(SFUnifiedBarItemArrangement *)self->_itemArrangement isEqual:v7])
  {
    v9 = [(SFUnifiedBarItemArrangement *)*p_itemArrangement leadingItems];
    uint64_t v10 = [v7 leadingItems];
    v11 = [v10 differenceFromArray:v9 withOptions:4];
    v20 = objc_msgSend(v11, "safari_removalIndexes");
    uint64_t v12 = [(SFUnifiedBarItemArrangement *)*p_itemArrangement trailingItems];
    v13 = [v7 trailingItems];
    id v19 = (void *)v12;
    uint64_t v14 = [v13 differenceFromArray:v12 withOptions:4];
    v18 = objc_msgSend(v14, "safari_removalIndexes");
    objc_storeStrong((id *)&self->_itemArrangement, a3);
    [(SFUnifiedBar *)self setNeedsLayout];
    v15 = objc_msgSend(v11, "safari_insertionIndexes");
    [(SFUnifiedBar *)self _layoutIndexes:v15 ofItems:v10 alongEdge:0 transitioning:1];

    v16 = objc_msgSend(v14, "safari_insertionIndexes");
    [(SFUnifiedBar *)self _layoutIndexes:v16 ofItems:v13 alongEdge:1 transitioning:1];

    if (a4)
    {
      v17 = (void *)MEMORY[0x1E4FB1EB0];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __44__SFUnifiedBar_setItemArrangement_animated___block_invoke;
      v26[3] = &unk_1E54EAA48;
      v26[4] = self;
      id v27 = v20;
      id v28 = v9;
      id v29 = v18;
      id v30 = v19;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __44__SFUnifiedBar_setItemArrangement_animated___block_invoke_2;
      v21[3] = &unk_1E54EC010;
      v21[4] = self;
      id v22 = v27;
      id v23 = v28;
      id v24 = v29;
      id v25 = v30;
      objc_msgSend(v17, "sf_animate:usingDefaultMotionWithOptions:animations:completion:", 1, 98, v26, v21);
    }
    else
    {
      [(SFUnifiedBar *)self _setNeedsRemovalForViewsAtIndexes:v20 ofItems:v9];
      [(SFUnifiedBar *)self _setNeedsRemovalForViewsAtIndexes:v18 ofItems:v19];
    }
  }
}

uint64_t __44__SFUnifiedBar_setItemArrangement_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutIndexes:*(void *)(a1 + 40) ofItems:*(void *)(a1 + 48) alongEdge:0 transitioning:1];
  [*(id *)(a1 + 32) _layoutIndexes:*(void *)(a1 + 56) ofItems:*(void *)(a1 + 64) alongEdge:1 transitioning:1];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __44__SFUnifiedBar_setItemArrangement_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _removeViewsForIndexes:*(void *)(a1 + 40) ofItems:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);

  return [v2 _removeViewsForIndexes:v3 ofItems:v4];
}

- (void)setContentArrangement:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self->_contentArrangement;
  if (![(SFUnifiedBarContentArrangement *)v6 isEqual:v5])
  {
    objc_storeStrong((id *)&self->_contentArrangement, a3);
    id v32 = v6;
    uint64_t v7 = [(SFUnifiedBarContentArrangement *)v6 allContentViews];
    id v30 = [v5 allContentViews];
    v31 = (void *)v7;
    v8 = [v30 differenceFromArray:v7 withOptions:4];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v9 = [v8 removals];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v43 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v42 + 1) + 8 * i) object];
          [(SFUnifiedBar *)self _uninstallContentView:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v11);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v15 = [v8 insertions];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v38 + 1) + 8 * j) object];
          [(SFUnifiedBar *)self _installContentView:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v17);
    }
    id v29 = v8;

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v33 = v5;
    v21 = [v5 standaloneContentViews];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      int v24 = 0;
      uint64_t v25 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v23; ++k)
        {
          if (*(void *)v35 != v25) {
            objc_enumerationMutation(v21);
          }
          id v27 = *(void **)(*((void *)&v34 + 1) + 8 * k);
          if (objc_opt_respondsToSelector())
          {
            id v28 = [v27 barMetrics];
            [v28 setMetricsCategory:1];
          }
          if (objc_opt_respondsToSelector()) {
            v24 |= [v27 showsSquishedContent];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v23);
    }
    else
    {
      LOBYTE(v24) = 0;
    }

    self->_hasSquishedStandaloneContentView = v24 & 1;
    [(SFUnifiedBar *)self setNeedsLayout];

    v6 = v32;
    id v5 = v33;
  }
}

- (void)_installContentView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (objc_opt_respondsToSelector())
    {
      [(SFUnifiedBar *)self _backgroundAlpha];
      objc_msgSend(v4, "setBarBackgroundAlpha:");
    }
    if (objc_opt_respondsToSelector()) {
      [v4 setBarTheme:self->_barTheme];
    }
    if (objc_opt_respondsToSelector()) {
      [v4 setSizeClass:self->_sizeClass];
    }
    if (objc_opt_respondsToSelector())
    {
      [(SFUnifiedBar *)self _themeColorVisibility];
      objc_msgSend(v4, "setThemeColorVisibility:");
    }
    [v4 setInsetsLayoutMarginsFromSafeArea:0];
    [(SFUnifiedBar *)self insertSubview:v4 aboveSubview:self->_backgroundView];
    [(SFUnifiedBar *)self setNeedsLayout];
  }
}

- (void)_uninstallContentView:(id)a3
{
  if (a3) {
    [a3 removeFromSuperview];
  }
}

- (BOOL)inlineContentViewPinsScrollPositionToTrailingEdgeDuringResize
{
  v2 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 pinsScrollPositionToTrailingEdgeDuringResize];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setInlineContentViewPinsScrollPositionToTrailingEdgeDuringResize:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  if (objc_opt_respondsToSelector()) {
    [v4 setPinsScrollPositionToTrailingEdgeDuringResize:v3];
  }
}

- (void)_layoutItems:(id)a3 alongEdge:(int64_t)a4
{
  v6 = (void *)MEMORY[0x1E4F28D60];
  id v7 = a3;
  v8 = objc_msgSend(v6, "indexSetWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
  [(SFUnifiedBar *)self _layoutIndexes:v8 ofItems:v7 alongEdge:a4 transitioning:0];
  double v10 = v9;

  uint64_t v11 = &OBJC_IVAR___SFUnifiedBar__trailingItemContainerView;
  if (!a4) {
    uint64_t v11 = &OBJC_IVAR___SFUnifiedBar__leadingItemContainerView;
  }
  id v12 = *(id *)((char *)&self->super.super.super.isa + *v11);
  uint64_t v13 = [(UIView *)self _sf_usesLeftToRightLayout];
  [(SFUnifiedBar *)self bounds];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [(SFUnifiedBar *)self layoutMargins];
  double v25 = v24;
  if (v13 == a4)
  {
    double v26 = v23;
    v41.origin.x = v15;
    v41.origin.y = v17;
    v41.size.width = v19;
    v41.size.height = v21;
    double v27 = CGRectGetWidth(v41) - v10 - v26;
  }
  else
  {
    double v27 = v22;
  }
  [(SFUnifiedBarMetrics *)self->_barMetrics itemHeight];
  double v29 = v28;
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v40[0] = *MEMORY[0x1E4F1DAB8];
  v40[1] = v30;
  v40[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v12 setTransform:v40];
  objc_msgSend(v12, "setFrame:", v27, v25, v10, v29);
  [(SFUnifiedBar *)self _inlineContentSquishAnchorPoint];
  double v32 = v31;
  double v34 = v33;
  [(SFUnifiedBar *)self squishTransformFactor];
  double v36 = v35;
  [(SFUnifiedBar *)self _squishVerticalOffset];
  makeSquishTransform((uint64_t)v39, v32, v34, v36, v37);
  v38[0] = v39[0];
  v38[1] = v39[1];
  v38[2] = v39[2];
  [v12 setTransform:v38];
}

- (double)_layoutIndexes:(id)a3 ofItems:(id)a4 alongEdge:(int64_t)a5 transitioning:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = &OBJC_IVAR___SFUnifiedBar__trailingItemContainerView;
  if (!a5) {
    id v12 = &OBJC_IVAR___SFUnifiedBar__leadingItemContainerView;
  }
  id v13 = *(id *)((char *)&self->super.super.super.isa + *v12);
  BOOL v14 = [(UIView *)self _sf_usesLeftToRightLayout];
  [(SFUnifiedBarMetrics *)self->_barMetrics itemHeight];
  uint64_t v16 = v15;
  [(SFUnifiedBar *)self _itemSpacing];
  uint64_t v18 = v17;
  [(SFUnifiedBar *)self squishTransformFactor];
  uint64_t v20 = v19;
  if (v14) {
    uint64_t v21 = 0;
  }
  else {
    uint64_t v21 = 2;
  }
  uint64_t v38 = 0;
  long long v39 = (double *)&v38;
  uint64_t v40 = 0x2020000000;
  uint64_t v41 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__SFUnifiedBar__layoutIndexes_ofItems_alongEdge_transitioning___block_invoke;
  v27[3] = &unk_1E54EC038;
  uint64_t v33 = v18;
  BOOL v36 = v14;
  id v22 = v11;
  id v28 = v22;
  double v29 = self;
  double v32 = &v38;
  uint64_t v34 = v16;
  id v23 = v10;
  id v30 = v23;
  BOOL v37 = a6;
  id v24 = v13;
  id v31 = v24;
  uint64_t v35 = v20;
  [v22 enumerateObjectsWithOptions:v21 usingBlock:v27];
  double v25 = v39[3];

  _Block_object_dispose(&v38, 8);
  return v25;
}

void __63__SFUnifiedBar__layoutIndexes_ofItems_alongEdge_transitioning___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = [v5 view];
  double v7 = *(double *)(a1 + 72);
  [v6 preferredWidth];
  if (v8 <= 0.0) {
    double v9 = 40.0;
  }
  else {
    double v9 = v8;
  }
  char v10 = [v5 spacingOptions];

  if ((v10 & 1) == 0) {
    goto LABEL_15;
  }
  if (!*(unsigned char *)(a1 + 96))
  {
    if (a3)
    {
      id v11 = *(void **)(a1 + 32);
      uint64_t v12 = a3 - 1;
      goto LABEL_10;
    }
LABEL_11:
    id v13 = 0;
    goto LABEL_12;
  }
  if (a3 + 1 >= (unint64_t)[*(id *)(a1 + 32) count]) {
    goto LABEL_11;
  }
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = a3 + 1;
LABEL_10:
  id v13 = [v11 objectAtIndexedSubscript:v12];
LABEL_12:
  if (([v13 spacingOptions] & 2) != 0)
  {
    [*(id *)(*(void *)(a1 + 40) + 408) minimumItemSpacing];
    double v7 = v14 * 0.5;
  }

LABEL_15:
  double v15 = *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v16 = [*(id *)(a1 + 32) count];
    double v17 = v9;
    if (a3 + 1 == v16) {
      goto LABEL_22;
    }
    BOOL v18 = *(unsigned char *)(a1 + 96) == 0;
  }
  else
  {
    BOOL v18 = 1;
  }
  double v19 = -0.0;
  if (a3 != 0 || !v18) {
    double v19 = v7;
  }
  double v17 = v9 + v19;
LABEL_22:
  *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v17
                                                              + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                          + 24);
  if ([*(id *)(a1 + 48) containsIndex:a3])
  {
    long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v29 = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v34.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v34.c = v27;
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v34.tx = v25;
    if (*(unsigned char *)(a1 + 97))
    {
      +[SFUnifiedBarMetrics transitioningItemScale];
      *(_OWORD *)&v33.a = v29;
      *(_OWORD *)&v33.c = v27;
      *(_OWORD *)&v33.tx = v25;
      CGAffineTransformScale(&v34, &v33, v20, v20);
    }
    double v21 = -fmax((44.0 - v9) * 0.5, 0.0);
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 456), "removeObject:", v6, v25, v27, v29);
    [*(id *)(a1 + 56) addSubview:v6];
    [v6 setBarMetrics:*(void *)(*(void *)(a1 + 40) + 408)];
    [v6 setBarTheme:*(void *)(*(void *)(a1 + 40) + 504)];
    [v6 setSquishTransformFactor:*(double *)(a1 + 88)];
    v32[0] = v30;
    v32[1] = v28;
    v32[2] = v26;
    [v6 setTransform:v32];
    [v6 setFrame:_SFRoundRectToPixels(v15)];
    double v22 = 1.0;
    if (*(unsigned char *)(a1 + 97)) {
      double v22 = 0.0;
    }
    [v6 setAlpha:v22];
    CGAffineTransform v31 = v34;
    [v6 setTransform:&v31];
    double v23 = (double)(char)-*(unsigned char *)(a1 + 97);
    id v24 = [v6 layer];
    [v24 setZPosition:v23];

    objc_msgSend(v6, "_setTouchInsets:", 0.0, v21, 0.0, v21);
    [v6 layoutIfNeeded];
  }
}

- (void)layoutSubviews
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)SFUnifiedBar;
  [(SFUnifiedBar *)&v24 layoutSubviews];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v3 = self->_itemViewsToRemoveOnNextLayout;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "removeFromSuperview", (void)v20);
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v5);
  }

  [(NSMutableSet *)self->_itemViewsToRemoveOnNextLayout removeAllObjects];
  [(SFUnifiedBar *)self _updateSizeClass];
  double v8 = [(SFUnifiedBarItemArrangement *)self->_itemArrangement leadingItems];
  [(SFUnifiedBar *)self _layoutItems:v8 alongEdge:0];

  double v9 = [(SFUnifiedBarItemArrangement *)self->_itemArrangement trailingItems];
  [(SFUnifiedBar *)self _layoutItems:v9 alongEdge:1];

  [(SFUnifiedBar *)self bounds];
  double v11 = v10;
  double contentUnderStatusBarHeight = self->_contentUnderStatusBarHeight;
  double v14 = v13 + 0.0;
  double v16 = v15 - contentUnderStatusBarHeight;
  double v18 = v17 - (0.0 - contentUnderStatusBarHeight);
  -[SFThemeColorEffectView setFrame:](self->_backgroundView, "setFrame:", v13 + 0.0, v15 - contentUnderStatusBarHeight, v11, v18);
  -[UIView setFrame:](self->_squishedContentView, "setFrame:", v14, v16, v11, v18);
  [(UIView *)self->_squishedContentView bounds];
  -[UIButton setFrame:](self->_squishedBarButton, "setFrame:");
  [(SFUnifiedBar *)self squishTransformFactor];
  [(SFUnifiedBar *)self _setShowsSquishedContent:_SFEqualWithEpsilon(v19, 0.0, 0.01)];
  [(SFUnifiedBar *)self _layOutInlineContentView];
  [(SFUnifiedBar *)self _layOutStandaloneContentViews];
  if (self->_needsNotifyMetricsDidChange)
  {
    self->_needsNotifyMetricsDidChange = 0;
    [(SFUnifiedBar *)self metricsDidChange];
  }
}

- (void)_layOutInlineContentView
{
  BOOL v3 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  if (!v3) {
    goto LABEL_36;
  }
  [(SFUnifiedBar *)self bounds];
  double v77 = v5;
  CGFloat v78 = v4;
  CGFloat v82 = v7;
  CGFloat v83 = v6;
  [(SFUnifiedBar *)self directionalLayoutMargins];
  double v79 = v9;
  double v80 = v8;
  [(SFUnifiedBar *)self layoutMargins];
  double v74 = v10;
  double v75 = v11;
  [(SFUnifiedBar *)self squishTransformFactor];
  double v81 = v12;
  BOOL v13 = [(UIView *)self _sf_usesLeftToRightLayout];
  double v14 = [(SFUnifiedBarItemArrangement *)self->_itemArrangement leadingItems];
  double v15 = [v14 lastObject];

  double v16 = [(SFUnifiedBarItemArrangement *)self->_itemArrangement trailingItems];
  double v17 = [v16 firstObject];

  if (v13) {
    double v18 = v15;
  }
  else {
    double v18 = v17;
  }
  if (v13) {
    double v19 = v17;
  }
  else {
    double v19 = v15;
  }
  if (v13) {
    long long v20 = &OBJC_IVAR___SFUnifiedBar__leadingItemContainerView;
  }
  else {
    long long v20 = &OBJC_IVAR___SFUnifiedBar__trailingItemContainerView;
  }
  if (v13) {
    long long v21 = &OBJC_IVAR___SFUnifiedBar__trailingItemContainerView;
  }
  else {
    long long v21 = &OBJC_IVAR___SFUnifiedBar__leadingItemContainerView;
  }
  id v22 = v18;
  id v23 = v19;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v20), "ss_untransformedFrame");
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v21), "ss_untransformedFrame");
  CGFloat v33 = v32;
  CGFloat rect = v34;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  [(SFUnifiedBar *)self _itemSpacing];
  double v40 = v39;
  if (!v22)
  {
    CGFloat v42 = v77;
    double v41 = v74;
    if (v23) {
      goto LABEL_16;
    }
LABEL_18:
    CGFloat v44 = v78;
    v89.origin.x = v78;
    v89.origin.y = v42;
    v89.size.height = v82;
    v89.size.width = v83;
    double v43 = CGRectGetWidth(v89) - v75;
    goto LABEL_19;
  }
  v87.origin.x = v25;
  v87.origin.y = v27;
  v87.size.width = v29;
  v87.size.height = v31;
  double v41 = v40 + CGRectGetMaxX(v87);
  CGFloat v42 = v77;
  if (!v23) {
    goto LABEL_18;
  }
LABEL_16:
  v88.origin.x = v33;
  v88.origin.y = rect;
  v88.size.width = v36;
  v88.size.height = v38;
  double v43 = CGRectGetMinX(v88) - v40;
  CGFloat v44 = v78;
LABEL_19:
  if (([v22 spacingOptions] & 4) != 0) {
    double v41 = v41 + 6.0;
  }
  if (([v23 spacingOptions] & 4) != 0) {
    double v43 = v43 + -6.0;
  }
  [v3 preferredSize];
  if (v45 == 1.79769313e308) {
    goto LABEL_27;
  }
  v46 = [(SFUnifiedBarItemArrangement *)self->_itemArrangement leadingItems];
  uint64_t v47 = [v46 count];
  v48 = [(SFUnifiedBarItemArrangement *)self->_itemArrangement trailingItems];
  if (v47 != [v48 count])
  {
    CGFloat v50 = v44;
    double v51 = v42;

    goto LABEL_29;
  }
  BOOL v49 = [(SFUnifiedBarItemArrangement *)self->_itemArrangement allowsCenteringInlineContentView];

  if (!v49)
  {
LABEL_27:
    CGFloat v50 = v44;
    double v51 = v42;
  }
  else
  {
    v90.origin.x = v44;
    v90.origin.y = v42;
    v90.size.width = v83;
    v90.size.height = v82;
    double v41 = fmax(v41, CGRectGetWidth(v90) - v43);
    CGFloat v50 = v44;
    v91.origin.x = v44;
    double v51 = v42;
    v91.origin.y = v42;
    v91.size.width = v83;
    v91.size.height = v82;
    CGRectGetWidth(v91);
  }
LABEL_29:
  long long v52 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v86[0] = *MEMORY[0x1E4F1DAB8];
  v86[1] = v52;
  v86[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v3 setTransform:v86];
  [v3 setFrame:_SFRoundRectToPixels(v41)];
  [(SFUnifiedBar *)self _inlineContentSquishAnchorPoint];
  double v54 = v53;
  double v56 = v55;
  [(SFUnifiedBar *)self _squishVerticalOffset];
  makeSquishTransform((uint64_t)v85, v54, v56, v81, v57);
  v84[0] = v85[0];
  v84[1] = v85[1];
  v84[2] = v85[2];
  [v3 setTransform:v84];
  objc_msgSend(v3, "setDirectionalLayoutMargins:", 0.0, v80, 0.0, v79);
  CGFloat v58 = v51;
  CGFloat v59 = v50;
  if (objc_opt_respondsToSelector())
  {
    UIRectGetCenter();
    objc_msgSend(v3, "convertPoint:fromView:", self);
    objc_msgSend(v3, "setMidpointForCenteredContent:");
  }
  if (objc_opt_respondsToSelector()) {
    [v3 setSquishTransformFactor:v81];
  }
  if (objc_opt_respondsToSelector())
  {
    [(SFUnifiedBar *)self layoutMargins];
    double v61 = v60;
    double v63 = v62;
    +[SFUnifiedBarMetrics minimumSquishScale];
    double v65 = _SFInterpolate(v64, 1.0, v81);
    v92.origin.x = v50;
    v92.origin.y = v58;
    v92.size.width = v83;
    v92.size.height = v82;
    double MidX = CGRectGetMidX(v92);
    -[SFUnifiedBar convertPoint:toView:](self, "convertPoint:toView:", v3, _SFInterpolate(MidX, v61, v65), 0.0);
    double v68 = v67;
    v93.origin.x = v50;
    v93.origin.y = v58;
    v93.size.width = v83;
    v93.size.height = v82;
    CGFloat v69 = CGRectGetMidX(v93);
    v94.size.width = v83;
    double v70 = v69;
    v94.origin.x = v59;
    v94.origin.y = v58;
    v94.size.height = v82;
    CGFloat Width = CGRectGetWidth(v94);
    -[SFUnifiedBar convertPoint:toView:](self, "convertPoint:toView:", v3, _SFInterpolate(v70, Width - v63, v65), 0.0);
    double v73 = v72;
    [v3 bounds];
    objc_msgSend(v3, "setSquishedContentInset:", 0.0, v68, 0.0, CGRectGetWidth(v95) - v73);
  }
  [v3 layoutIfNeeded];

LABEL_36:
}

- (void)_layOutStandaloneContentViews
{
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  double v13 = 0.0;
  [(SFUnifiedBar *)self directionalLayoutMargins];
  double v4 = v3;
  [(SFUnifiedBar *)self _inlineContentHeight];
  double v6 = v4 + v5;
  double v7 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  [(SFUnifiedBar *)self _spacingBelowContentView:v7];
  double v9 = v6 + v8;

  double v13 = v9;
  double v10 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement standaloneContentViews];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__SFUnifiedBar__layOutStandaloneContentViews__block_invoke;
  v11[3] = &unk_1E54EC060;
  v11[4] = self;
  v11[5] = v12;
  [v10 enumerateObjectsUsingBlock:v11];

  _Block_object_dispose(v12, 8);
}

double __45__SFUnifiedBar__layOutStandaloneContentViews__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) _layOutStandaloneContentView:a2 atIndex:a3 minY:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

- (double)_layOutStandaloneContentView:(id)a3 atIndex:(unint64_t)a4 minY:(double)a5
{
  id v8 = a3;
  [(SFUnifiedBar *)self directionalLayoutMargins];
  double v10 = v9;
  double v43 = v11;
  [(SFUnifiedBar *)self squishTransformFactor];
  double v13 = v12;
  contentArrangement = self->_contentArrangement;
  if (a4)
  {
    double v15 = [(SFUnifiedBarContentArrangement *)contentArrangement standaloneContentViews];
    double v16 = [v15 objectAtIndexedSubscript:a4 - 1];
  }
  else
  {
    double v16 = [(SFUnifiedBarContentArrangement *)contentArrangement inlineContentView];
  }
  if (objc_opt_respondsToSelector()) {
    int v17 = [v8 isContentHidden];
  }
  else {
    int v17 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    int v18 = [v8 showsSquishedContent];
  }
  else {
    int v18 = 0;
  }
  double v19 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [(SFUnifiedBar *)self _spacingBelowContentView:v16];
    double v21 = v20;
    [v8 preferredTopSpacing];
    double v19 = v22 - v21;
  }
  [v8 preferredSize];
  double v24 = v23;
  double v25 = v19 + a5;
  [(SFUnifiedBar *)self bounds];
  CGFloat Width = CGRectGetWidth(v47);
  if (v17)
  {
    v48.origin.x = 0.0;
    v48.origin.y = v25;
    v48.size.width = Width;
    v48.size.height = v24;
    CGRectGetHeight(v48);
  }
  if ((v18 & 1) == 0)
  {
    [(SFUnifiedBar *)self expandedHeight];
    double v28 = v27;
    [(SFUnifiedBar *)self squishedHeight];
    _SFInterpolate(v28 + v29, 0.0, v13);
    +[SFUnifiedBarMetrics minimumSquishScale];
  }
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v46[0] = *MEMORY[0x1E4F1DAB8];
  v46[1] = v30;
  v46[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v8 setTransform:v46];
  [v8 setFrame:_SFRoundRectToPixels(0.0)];
  [(SFUnifiedBar *)self _squishAnchorPointForStandaloneContentViewAtIndex:a4];
  double v32 = v31;
  double v34 = v33;
  [(SFUnifiedBar *)self _squishVerticalOffset];
  makeSquishTransform((uint64_t)v45, v32, v34, v13, v35);
  v44[0] = v45[0];
  v44[1] = v45[1];
  v44[2] = v45[2];
  [v8 setTransform:v44];
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 0.0, v10, 0.0, v43);
  double v36 = (double)a4;
  double v37 = [v8 layer];
  [v37 setZPosition:v36];

  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "setContentInset:", 0.0, v10, 0.0, v43);
  }
  if (objc_opt_respondsToSelector())
  {
    [(SFUnifiedBar *)self bounds];
    UIRectGetCenter();
    objc_msgSend(v8, "convertPoint:fromView:", self);
    objc_msgSend(v8, "setMidpointForCenteredContent:");
  }
  int v38 = objc_opt_respondsToSelector();
  if (v38) {
    [v8 setSquishTransformFactor:v13];
  }
  if (v17)
  {
    double v39 = 0.0;
    [v8 setAlpha:0.0];
    [v8 layoutIfNeeded];
  }
  else
  {
    double v40 = 1.0;
    if (((v38 | v18) & 1) == 0) {
      double v40 = SFBarContentAlphaForSquishTransformFactor(v13);
    }
    [v8 setAlpha:v40];
    [v8 layoutIfNeeded];
    [(SFUnifiedBar *)self _spacingBelowContentView:v8];
    double v39 = v19 + v24 + v41;
  }

  return v39;
}

- (double)_spacingBelowContentView:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    [v4 preferredBottomSpacing];
  }
  else
  {
    double v6 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement standaloneContentViews];
    double v7 = [v6 lastObject];
    if (!v7)
    {
      double v7 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
    }
    id v8 = v7;

    if (v8 == v4)
    {
      [(SFUnifiedBar *)self layoutMargins];
      double v9 = v11;
      goto LABEL_8;
    }
    [(SFUnifiedBar *)self _contentViewSpacing];
  }
  double v9 = v5;
LABEL_8:

  return v9;
}

- (double)_squishedInlineContentTopOverflow
{
  double v3 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  [v3 preferredSize];
  double v5 = v4;
  +[SFUnifiedBarMetrics minimumSquishScale];
  double v7 = v6;
  [(SFUnifiedBarMetrics *)self->_barMetrics squishedInlineBarHeight];
  double v9 = -(v8 - v5 * v7) * 0.5;
  [(SFUnifiedBar *)self _squishVerticalOffset];
  double v11 = v10 + v9;

  return v11;
}

- (CGPoint)_squishAnchorPointForStandaloneContentViewAtIndex:(unint64_t)a3
{
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__6;
  v21[4] = __Block_byref_object_dispose__6;
  id v22 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  uint64_t v17 = 0;
  int v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  double v5 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement standaloneContentViews];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__SFUnifiedBar__squishAnchorPointForStandaloneContentViewAtIndex___block_invoke_53;
  void v12[3] = &unk_1E54EC0A8;
  id v13 = &__block_literal_global_34;
  double v14 = v21;
  double v15 = &v17;
  unint64_t v16 = a3;
  [v5 enumerateObjectsUsingBlock:v12];

  [(SFUnifiedBar *)self _inlineContentSquishAnchorPoint];
  double v7 = v6;
  double v9 = v8 + _SFRoundFloatToPixels(v18[3]);

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(v21, 8);

  double v10 = v7;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

double __66__SFUnifiedBar__squishAnchorPointForStandaloneContentViewAtIndex___block_invoke(uint64_t a1, void *a2)
{
  [a2 preferredSize];
  double v3 = v2;
  +[SFUnifiedBarMetrics minimumSquishScale];
  return v3 - v3 * v4;
}

void __66__SFUnifiedBar__squishAnchorPointForStandaloneContentViewAtIndex___block_invoke_53(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (a1[7] == a3) {
    *a4 = 1;
  }
  id v16 = v8;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v16 showsSquishedContent])
  {
    [*(id *)(*(void *)(a1[5] + 8) + 40) preferredSize];
    double v10 = v9;
    [v16 preferredSize];
    double v12 = v10 * 0.5 + v11 * 0.5;
    double v13 = (*(double (**)(void))(a1[4] + 16))() * 0.5;
    *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24)
                                                 + v12
                                                 - (v13
                                                  + (*(double (**)(void))(a1[4] + 16))() * 0.5);
    if (objc_opt_respondsToSelector())
    {
      [*(id *)(*(void *)(a1[5] + 8) + 40) preferredSquishedBottomSpacing];
      *(double *)(*(void *)(a1[6] + 8) + 24) = v14 + *(double *)(*(void *)(a1[6] + 8) + 24);
    }
    if (objc_opt_respondsToSelector())
    {
      [v16 topSquishedSpacingAdjustment];
      *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24) - v15;
    }
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
  }
}

- (void)setMarginLevel:(unint64_t)a3
{
  if (self->_marginLevel == a3) {
    return;
  }
  self->_marginLevel = a3;
  switch(a3)
  {
    case 2uLL:
      double v4 = 4.0;
      goto LABEL_9;
    case 1uLL:
      int IsPad = _SFDeviceIsPad();
      double v4 = 4.0;
      if (!IsPad) {
        double v4 = 7.0;
      }
      goto LABEL_9;
    case 0uLL:
      double v4 = defaultLayoutMargins();
LABEL_9:
      [(SFUnifiedBar *)self setDirectionalLayoutMargins:v4];
      break;
  }

  [(SFUnifiedBar *)self setNeedsLayout];
}

- (void)_setNeedsRemovalForViewsAtIndexes:(id)a3 ofItems:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__SFUnifiedBar__setNeedsRemovalForViewsAtIndexes_ofItems___block_invoke;
  v4[3] = &unk_1E54EBA50;
  v4[4] = self;
  [a4 enumerateObjectsAtIndexes:a3 options:0 usingBlock:v4];
}

void __58__SFUnifiedBar__setNeedsRemovalForViewsAtIndexes_ofItems___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 456);
  id v3 = [a2 view];
  [v2 addObject:v3];
}

- (void)_removeViewsForIndexes:(id)a3 ofItems:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__SFUnifiedBar__removeViewsForIndexes_ofItems___block_invoke;
  v4[3] = &unk_1E54EBA50;
  v4[4] = self;
  [a4 enumerateObjectsAtIndexes:a3 options:0 usingBlock:v4];
}

void __47__SFUnifiedBar__removeViewsForIndexes_ofItems___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [*(id *)(*(void *)(a1 + 32) + 488) leadingItems];
  if (([v3 containsObject:v6] & 1) == 0)
  {
    double v4 = [*(id *)(*(void *)(a1 + 32) + 488) trailingItems];
    char v5 = [v4 containsObject:v6];

    if (v5) {
      goto LABEL_5;
    }
    id v3 = [v6 view];
    [v3 removeFromSuperview];
  }

LABEL_5:
}

- (double)_itemSpacing
{
  id v3 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  if (objc_opt_respondsToSelector())
  {
    [v3 preferredSize];
    double v5 = v4;
  }
  else
  {
    double v5 = 1.79769313e308;
  }
  [(SFUnifiedBarMetrics *)self->_barMetrics minimumItemSpacing];
  double v7 = v6;
  [(SFUnifiedBarMetrics *)self->_barMetrics maximumItemSpacing];
  double v9 = v8;
  [(SFUnifiedBar *)self bounds];
  if (v5 <= CGRectGetWidth(v27))
  {
    uint64_t v23 = 0;
    double v24 = &v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = (double *)&v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __28__SFUnifiedBar__itemSpacing__block_invoke;
    aBlock[3] = &unk_1E54EC0F8;
    *(double *)&aBlock[6] = v7;
    aBlock[4] = &v19;
    aBlock[5] = &v23;
    double v10 = (void (**)(void *, void *, void))_Block_copy(aBlock);
    double v11 = [(SFUnifiedBarItemArrangement *)self->_itemArrangement leadingItems];
    v10[2](v10, v11, 0);

    double v12 = [(SFUnifiedBarItemArrangement *)self->_itemArrangement trailingItems];
    v10[2](v10, v12, 1);

    [(SFUnifiedBar *)self layoutMargins];
    double v14 = v13;
    double v16 = v15;
    [(SFUnifiedBar *)self bounds];
    double v7 = fmax(v7, fmin(v9, (CGRectGetWidth(v28) - v14 - v16 - v5 - v20[3]) / (double)v24[3]));

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }

  return v7;
}

void __28__SFUnifiedBar__itemSpacing__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = a3 == 1;
  id v6 = a2;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__SFUnifiedBar__itemSpacing__block_invoke_2;
  v8[3] = &unk_1E54EC0D0;
  uint64_t v11 = a3;
  id v9 = v6;
  uint64_t v12 = *(void *)(a1 + 48);
  long long v10 = *(_OWORD *)(a1 + 32);
  id v7 = v6;
  [v7 enumerateObjectsWithOptions:2 * v5 usingBlock:v8];
}

void __28__SFUnifiedBar__itemSpacing__block_invoke_2(uint64_t a1, void *a2, char *a3)
{
  id v10 = a2;
  BOOL v5 = [v10 view];
  [v5 preferredWidth];
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6
                                                              + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24);

  if (!*(void *)(a1 + 56))
  {
    unint64_t v9 = (unint64_t)(a3 + 1);
    if (v9 >= [*(id *)(a1 + 32) count])
    {
      a3 = 0;
      goto LABEL_8;
    }
    id v7 = *(void **)(a1 + 32);
    double v8 = (char *)v9;
    goto LABEL_6;
  }
  if (a3)
  {
    id v7 = *(void **)(a1 + 32);
    double v8 = a3 - 1;
LABEL_6:
    a3 = [v7 objectAtIndexedSubscript:v8];
  }
LABEL_8:
  if (([v10 spacingOptions] & 1) != 0 && (objc_msgSend(a3, "spacingOptions") & 2) != 0) {
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 64) * 0.5
  }
                                                                + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                            + 24);
  else {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

- (double)_contentViewSpacing
{
  double result = 12.0;
  if (self->_marginLevel - 1 < 2) {
    return 10.0;
  }
  return result;
}

- (double)_inlineContentHeight
{
  [(SFUnifiedBarMetrics *)self->_barMetrics itemHeight];
  double v4 = v3;
  BOOL v5 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  [v5 preferredSize];
  double v7 = fmax(v4, v6);

  return v7;
}

- (void)_updateSizeClass
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  [(SFUnifiedBar *)self bounds];
  double Width = CGRectGetWidth(v27);
  double v4 = [(SFUnifiedBar *)self _screen];
  [v4 bounds];
  double v5 = CGRectGetWidth(v28);

  double v6 = [(SFUnifiedBar *)self _screen];
  [v6 bounds];
  double v7 = CGRectGetWidth(v29);

  if (v7 <= 1366.0)
  {
    if (Width != v5)
    {
LABEL_13:
      unint64_t v11 = 2;
      goto LABEL_14;
    }
LABEL_11:
    if (_SFDeviceIsPad())
    {
      double v13 = [(SFUnifiedBar *)self window];
      double v14 = [v13 windowScene];
      unint64_t v11 = (unint64_t)([v14 interfaceOrientation] - 1) < 2;

      goto LABEL_14;
    }
    goto LABEL_13;
  }
  double v8 = [(SFUnifiedBar *)self traitCollection];
  unint64_t v9 = [v8 preferredContentSizeCategory];
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v9, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]);

  if (v10 == NSOrderedDescending) {
    unint64_t v11 = 3;
  }
  else {
    unint64_t v11 = 2;
  }
  if (v10 != NSOrderedDescending && Width == v5) {
    goto LABEL_11;
  }
LABEL_14:
  if (self->_sizeClass != v11)
  {
    self->_sizeClass = v11;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v15 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement allContentViews];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v20 setSizeClass:v11];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v17);
    }
  }
}

- (double)expandedHeight
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [(SFUnifiedBar *)self layoutMargins];
  double v4 = v3;
  [(SFUnifiedBar *)self _inlineContentHeight];
  double v6 = v4 + v5;
  double v7 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  [(SFUnifiedBar *)self _spacingBelowContentView:v7];
  double v9 = v6 + v8;

  NSComparisonResult v10 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v11 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement standaloneContentViews];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
        if ((objc_opt_respondsToSelector() & 1) == 0 || ([v16 isContentHidden] & 1) == 0)
        {
          [v16 preferredSize];
          double v18 = v17;
          [(SFUnifiedBar *)self _spacingBelowContentView:v16];
          double v9 = v9 + v18 + v19;
          if (objc_opt_respondsToSelector())
          {
            [(SFUnifiedBar *)self _spacingBelowContentView:v10];
            double v21 = v9 - v20;
            [v16 preferredTopSpacing];
            double v9 = v21 + v22;
          }
          id v23 = v16;

          NSComparisonResult v10 = v23;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  return v9;
}

- (double)squishedHeight
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_hasSquishedStandaloneContentView)
  {
    [(SFUnifiedBar *)self _inlineContentHeight];
    double v4 = v3;
    +[SFUnifiedBarMetrics minimumSquishScale];
    double v6 = v4 * v5;
    [(SFUnifiedBar *)self _squishedInlineContentTopOverflow];
    double v8 = v6 - v7;
    double v9 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
    long long v25 = v9;
    if (objc_opt_respondsToSelector())
    {
      [v9 preferredSquishedBottomSpacing];
      double v8 = v8 + v10;
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    unint64_t v11 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement standaloneContentViews];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0 && [v16 showsSquishedContent])
          {
            [v16 preferredSize];
            double v18 = v17;
            +[SFUnifiedBarMetrics minimumSquishScale];
            double v8 = v8 + v18 * v19;
            if (objc_opt_respondsToSelector())
            {
              [v16 preferredSquishedBottomSpacing];
              double v8 = v8 + v20;
            }
            if (objc_opt_respondsToSelector())
            {
              [v16 topSquishedSpacingAdjustment];
              double v8 = v8 - v21;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v13);
    }

    double v22 = _SFRoundFloatToPixels(v8);
    return v22;
  }
  else
  {
    barMetrics = self->_barMetrics;
    [(SFUnifiedBarMetrics *)barMetrics squishedInlineBarHeight];
  }
  return result;
}

- (double)squishTransformFactor
{
  [(SFUnifiedBar *)self squishedHeight];
  double v4 = v3;
  [(SFUnifiedBar *)self expandedHeight];
  double v6 = v5;
  [(SFUnifiedBar *)self extendedBottomHeight];
  double v8 = v6 + v7;
  [(SFUnifiedBar *)self bounds];
  double Height = CGRectGetHeight(v13);
  double v10 = _SFUninterpolate(Height, v4, v8);

  return _SFClamp(v10, 0.0, 1.0);
}

- (CGPoint)_inlineContentSquishAnchorPoint
{
  [(SFUnifiedBar *)self bounds];
  double MidX = CGRectGetMidX(v8);
  [(SFUnifiedBarMetrics *)self->_barMetrics squishedInlineBarHeight];

  double v4 = _SFRoundPointToPixels(MidX);
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)_squishVerticalOffset
{
  double contentUnderStatusBarHeight = self->_contentUnderStatusBarHeight;
  double v3 = 0.0;
  if (contentUnderStatusBarHeight > 0.0) {
    double v3 = 2.5;
  }
  BOOL v4 = contentUnderStatusBarHeight <= 20.0;
  double result = 5.0;
  if (v4) {
    return v3;
  }
  return result;
}

- (void)_setShowsSquishedContent:(BOOL)a3
{
  if (self->_showsSquishedContent != a3)
  {
    BOOL v3 = a3;
    self->_showsSquishedContent = a3;
    BOOL v5 = !a3;
    [(UIView *)self->_squishedContentView setHidden:!a3];
    if (!v5) {
      [(SFUnifiedBar *)self _updateSquishedAccessoryViews];
    }
    id v6 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
    if (objc_opt_respondsToSelector()) {
      [v6 setShowsSquishedAccessoryViews:v3];
    }
  }
}

- (void)_updateSquishedAccessoryViews
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  BOOL v3 = [(UIView *)self->_squishedContentView subviews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) removeFromSuperview];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  CGRect v8 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement inlineContentView];
  if (objc_opt_respondsToSelector())
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    double v9 = objc_msgSend(v8, "squishedAccessoryViews", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [(UIView *)self->_squishedContentView addSubview:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v11);
    }
  }
  [(UIView *)self->_squishedContentView addSubview:self->_squishedBarButton];
}

- (void)setBarTheme:(id)a3
{
}

- (void)setBarTheme:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (([v7 isEqual:self->_barTheme] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_barTheme, a3);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __37__SFUnifiedBar_setBarTheme_animated___block_invoke;
    uint64_t v13 = &unk_1E54E9A60;
    long long v14 = self;
    id v15 = v7;
    CGRect v8 = _Block_copy(&v10);
    double v9 = v8;
    if (v4) {
      objc_msgSend(MEMORY[0x1E4FB1EB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331650, v8, 0, v10, v11, v12, v13, v14);
    }
    else {
      (*((void (**)(void *))v8 + 2))(v8);
    }
  }
}

void __37__SFUnifiedBar_setBarTheme_animated___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) superview];

  if (v2)
  {
    BOOL v3 = [*(id *)(a1 + 40) controlsTintColor];
    [*(id *)(a1 + 32) setTintColor:v3];
  }
  BOOL v4 = objc_msgSend(MEMORY[0x1E4FB1E20], "traitCollectionWithUserInterfaceStyle:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 504), "userInterfaceStyle"));
  [*(id *)(a1 + 32) _setLocalOverrideTraitCollection:v4];

  [*(id *)(a1 + 32) _updateSeparatorColor];
  uint64_t v5 = (void *)MEMORY[0x1E4FB1EB0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __37__SFUnifiedBar_setBarTheme_animated___block_invoke_2;
  v20[3] = &unk_1E54E9A60;
  uint64_t v6 = *(void **)(a1 + 40);
  v20[4] = *(void *)(a1 + 32);
  id v21 = v6;
  [v5 performWithoutAnimation:v20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 496) allContentViews];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 setBarTheme:*(void *)(a1 + 40)];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 488);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__SFUnifiedBar_setBarTheme_animated___block_invoke_3;
  v14[3] = &unk_1E54EC120;
  id v15 = *(id *)(a1 + 40);
  [v13 enumerateAllItemsUsingBlock:v14];
}

uint64_t __37__SFUnifiedBar_setBarTheme_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setTheme:*(void *)(a1 + 40)];
}

void __37__SFUnifiedBar_setBarTheme_animated___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 view];
  [v3 setBarTheme:v2];
}

- (BOOL)showsSeparator
{
  return self->_separator != 0;
}

- (void)setShowsSeparator:(BOOL)a3
{
  v21[4] = *MEMORY[0x1E4F143B8];
  if ([(SFUnifiedBar *)self showsSeparator] != a3)
  {
    if (a3)
    {
      uint64_t v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
      separator = self->_separator;
      self->_separator = v5;

      [(SFUnifiedBar *)self _updateSeparatorColor];
      [(UIView *)self->_separator setTranslatesAutoresizingMaskIntoConstraints:0];
      [(SFUnifiedBar *)self addSubview:self->_separator];
      long long v18 = (void *)MEMORY[0x1E4F28DC8];
      long long v20 = [(UIView *)self->_separator leadingAnchor];
      long long v19 = [(SFUnifiedBar *)self leadingAnchor];
      id v7 = [v20 constraintEqualToAnchor:v19];
      v21[0] = v7;
      uint64_t v8 = [(UIView *)self->_separator topAnchor];
      uint64_t v9 = [(SFUnifiedBar *)self bottomAnchor];
      uint64_t v10 = [v8 constraintEqualToAnchor:v9];
      v21[1] = v10;
      uint64_t v11 = [(SFUnifiedBar *)self trailingAnchor];
      uint64_t v12 = [(UIView *)self->_separator trailingAnchor];
      uint64_t v13 = [v11 constraintEqualToAnchor:v12];
      v21[2] = v13;
      long long v14 = [(UIView *)self->_separator heightAnchor];
      id v15 = [v14 constraintEqualToConstant:_SFOnePixel()];
      v21[3] = v15;
      long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
      [v18 activateConstraints:v16];
    }
    else
    {
      [(UIView *)self->_separator removeFromSuperview];
      long long v17 = self->_separator;
      self->_separator = 0;
    }
  }
}

- (void)setUsesFaintSeparator:(BOOL)a3
{
  if (self->_usesFaintSeparator != a3)
  {
    self->_usesFaintSeparator = a3;
    [(SFUnifiedBar *)self _updateSeparatorColor];
  }
}

- (void)_updateSeparatorColor
{
  if (self->_usesFaintSeparator) {
    objc_msgSend(MEMORY[0x1E4FB1618], "sf_secondaryBarHairlineOutlineColor");
  }
  else {
    objc_msgSend(MEMORY[0x1E4FB1618], "sf_barHairlineShadowColor");
  }
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UIView *)self->_separator setBackgroundColor:v3];
}

- (void)setBackgroundVisibility:(unint64_t)a3
{
  if (self->_backgroundVisibility != a3)
  {
    self->_backgroundVisibility = a3;
    [(SFUnifiedBar *)self _updateBackgroundAlpha];
  }
}

- (void)setChromelessScrollDistance:(double)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  self->_chromelessScrollDistance = a3;
  [(SFUnifiedBar *)self _updateBackgroundAlpha];
  [(SFUnifiedBar *)self _themeColorVisibility];
  double v5 = v4;
  [(SFThemeColorEffectView *)self->_backgroundView themeColorVisibility];
  if (v6 != v5)
  {
    [(SFThemeColorEffectView *)self->_backgroundView setThemeColorVisibility:v5];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement allContentViews];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            [v12 setThemeColorVisibility:v5];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)_updateBackgroundAlpha
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(SFUnifiedBar *)self _backgroundAlpha];
  double v4 = v3;
  [(SFThemeColorEffectView *)self->_backgroundView alpha];
  if (v5 != v4)
  {
    [(SFThemeColorEffectView *)self->_backgroundView setAlpha:v4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v6 = [(SFUnifiedBarContentArrangement *)self->_contentArrangement allContentViews];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            [v11 setBarBackgroundAlpha:v4];
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (double)_backgroundAlpha
{
  unint64_t backgroundVisibility = self->_backgroundVisibility;
  if (backgroundVisibility == 2) {
    return fmin(SFChromeVisibilityForScrollDistance(self->_chromelessScrollDistance), 0.999);
  }
  double result = 1.0;
  if (backgroundVisibility == 1) {
    return 0.0;
  }
  return result;
}

- (double)_themeColorVisibility
{
  [(SFUnifiedBar *)self expandedHeight];
  return 1.0
       - SFChromeVisibilityForScrollDistance(self->_chromelessScrollDistance - (v3
                                                                              + self->_contentUnderStatusBarHeight
                                                                              + self->_extendedBottomHeight));
}

- (BOOL)_showsSquishedContent
{
  return self->_showsSquishedContent;
}

- (SFUnifiedBarItemArrangement)itemArrangement
{
  return self->_itemArrangement;
}

- (SFUnifiedBarContentArrangement)contentArrangement
{
  return self->_contentArrangement;
}

- (SFUnifiedBarTheme)barTheme
{
  return self->_barTheme;
}

- (unint64_t)sizeClass
{
  return self->_sizeClass;
}

- (double)contentUnderStatusBarHeight
{
  return self->_contentUnderStatusBarHeight;
}

- (void)setContentUnderStatusBarHeight:(double)a3
{
  self->_double contentUnderStatusBarHeight = a3;
}

- (double)extendedBottomHeight
{
  return self->_extendedBottomHeight;
}

- (void)setExtendedBottomHeight:(double)a3
{
  self->_extendedBottomdouble Height = a3;
}

- (BOOL)usesFaintSeparator
{
  return self->_usesFaintSeparator;
}

- (unint64_t)marginLevel
{
  return self->_marginLevel;
}

- (UIView)leadingItemContainerView
{
  return self->_leadingItemContainerView;
}

- (UIView)trailingItemContainerView
{
  return self->_trailingItemContainerView;
}

- (unint64_t)backgroundVisibility
{
  return self->_backgroundVisibility;
}

- (double)chromelessScrollDistance
{
  return self->_chromelessScrollDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barTheme, 0);
  objc_storeStrong((id *)&self->_contentArrangement, 0);
  objc_storeStrong((id *)&self->_itemArrangement, 0);
  objc_storeStrong((id *)&self->_trailingItemContainerView, 0);
  objc_storeStrong((id *)&self->_leadingItemContainerView, 0);
  objc_storeStrong((id *)&self->_itemViewsToRemoveOnNextLayout, 0);
  objc_storeStrong((id *)&self->_squishedBarButton, 0);
  objc_storeStrong((id *)&self->_squishedContentView, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_barMetrics, 0);
}

@end