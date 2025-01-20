@interface SBHTodayIconListLayoutDelegate
- (BOOL)isCarouselLayout;
- (BOOL)isRevealed;
- (BOOL)isVisuallyRevealed;
- (CGPoint)iconListView:(id)a3 centerForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedCenter:(CGPoint)a6;
- (CGPoint)iconListView:(id)a3 originForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedOrigin:(CGPoint)a6;
- (CGRect)unadjustedBoundsForIconCoordinate:(SBIconCoordinate)a3;
- (CGSize)iconListView:(id)a3 sizeThatFits:(CGSize)a4 metrics:(id)a5 proposedSize:(CGSize)a6;
- (NSMutableDictionary)catchupProperties;
- (NSMutableDictionary)catchupTimers;
- (SBHTodayIconListLayoutDelegate)initWithIconListView:(id)a3;
- (SBIconListView)iconListView;
- (SBTodayIconListLayoutAttributes)layoutAttributesForIconCoordinate:(SEL)a3 metrics:(SBIconCoordinate)a4 adjustedForRevealProgress:(id)a5;
- (UIEdgeInsets)additionalLayoutInsets;
- (UIEdgeInsets)carouselInsets;
- (UIScrollView)scrollView;
- (UIView)containerView;
- (double)_iconListView:(id)a3 originYForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 adjustedForRevealProgress:(BOOL)a6;
- (double)collapseHeight;
- (double)dismissProgress;
- (double)distanceToApex;
- (double)revealProgress;
- (double)revealProgressMaxTranslation;
- (double)unadjustedOriginYForIconCoordinate:(SBIconCoordinate)a3;
- (unint64_t)iconListView:(id)a3 rowAtPoint:(CGPoint)a4 metrics:(id)a5 proposedRow:(unint64_t)a6;
- (void)_layoutFocusGuideViewsInListView:(id)a3;
- (void)_reorderSubviewsForCarouselLayoutInListView:(id)a3;
- (void)iconListView:(id)a3 willLayoutIconView:(id)a4;
- (void)iconListViewDidLayoutIcons:(id)a3;
- (void)setAdditionalLayoutInsets:(UIEdgeInsets)a3;
- (void)setCarouselInsets:(UIEdgeInsets)a3;
- (void)setCarouselLayout:(BOOL)a3;
- (void)setCatchupProperties:(id)a3;
- (void)setCatchupTimers:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDismissProgress:(double)a3;
- (void)setRevealProgress:(double)a3;
- (void)setRevealed:(BOOL)a3;
- (void)setScrollView:(id)a3;
- (void)setVisuallyRevealed:(BOOL)a3;
- (void)setVisuallyRevealed:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation SBHTodayIconListLayoutDelegate

- (void)setCarouselInsets:(UIEdgeInsets)a3
{
  self->_carouselInsets = a3;
}

- (void)setAdditionalLayoutInsets:(UIEdgeInsets)a3
{
  if (self->_additionalLayoutInsets.left != a3.left
    || self->_additionalLayoutInsets.top != a3.top
    || self->_additionalLayoutInsets.right != a3.right
    || self->_additionalLayoutInsets.bottom != a3.bottom)
  {
    self->_additionalLayoutInsets = a3;
    id v6 = [(SBHTodayIconListLayoutDelegate *)self iconListView];
    [v6 invalidateIntrinsicContentSize];
  }
}

- (BOOL)isCarouselLayout
{
  return self->_carouselLayout;
}

- (SBHTodayIconListLayoutDelegate)initWithIconListView:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBHTodayIconListLayoutDelegate;
  v5 = [(SBHTodayIconListLayoutDelegate *)&v18 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconListView, v4);
    v7 = [v4 layout];
    [v7 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassDefault"];
    double v9 = v8;
    [v7 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassSmall"];
    double v11 = v10;
    v6->_collapseHeight = v9;
    [v4 iconSpacing];
    v6->_distanceToApex = (v9 + v12) * 0.5;
    v6->_revealProgressMaxTranslation = v11;
    *(_WORD *)&v6->_carouselLayout = 256;
    v6->_visuallyRevealed = 1;
    *(_OWORD *)&v6->_revealProgress = xmmword_1D81E7EE0;
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    catchupProperties = v6->_catchupProperties;
    v6->_catchupProperties = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    catchupTimers = v6->_catchupTimers;
    v6->_catchupTimers = v15;
  }
  return v6;
}

- (SBTodayIconListLayoutAttributes)layoutAttributesForIconCoordinate:(SEL)a3 metrics:(SBIconCoordinate)a4 adjustedForRevealProgress:(id)a5
{
  BOOL v6 = a6;
  int64_t row = a4.row;
  int64_t column = a4.column;
  id v65 = a5;
  double v11 = [(SBHTodayIconListLayoutDelegate *)self iconListView];
  double v12 = objc_msgSend(v11, "iconAtCoordinate:metrics:", column, row, v65);
  v13 = v12;
  if (v12)
  {
    v14 = [v12 gridSizeClass];
  }
  else
  {
    v14 = @"SBHIconGridSizeClassDefault";
  }
  v15 = v14;
  v16 = [v11 layout];
  SBHIconListLayoutIconImageInfoForGridSizeClass(v16, v15);
  double v18 = v17;

  -[SBHTodayIconListLayoutDelegate _iconListView:originYForIconCoordinate:metrics:adjustedForRevealProgress:](self, "_iconListView:originYForIconCoordinate:metrics:adjustedForRevealProgress:", v11, column, row, v65, v6);
  double v20 = v19;
  SBRectWithSize();
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  double v28 = v27;
  double v29 = 1.0;
  if (![(SBHTodayIconListLayoutDelegate *)self isCarouselLayout])
  {
    double v37 = 1.0;
    if (!v6) {
      goto LABEL_43;
    }
    goto LABEL_38;
  }
  double v63 = v22;
  double v64 = v26;
  double v62 = v24;
  v30 = [(SBHTodayIconListLayoutDelegate *)self containerView];
  double v31 = 0.0;
  objc_msgSend(v30, "convertPoint:toView:", v11, 0.0, self->_carouselInsets.top);
  double v33 = v32;
  [v30 bounds];
  objc_msgSend(v30, "convertPoint:toView:", v11, 0.0, v34 - self->_carouselInsets.bottom);
  double v36 = v35;
  if (v20 >= v33)
  {
    if (v20 + v18 > v35) {
      double v31 = v20 + v18 - v35;
    }
  }
  else
  {
    double v31 = v20 - v33;
  }
  if (BSFloatIsZero()) {
    goto LABEL_12;
  }
  [(SBHTodayIconListLayoutDelegate *)self collapseHeight];
  double v39 = v38;
  [(SBHTodayIconListLayoutDelegate *)self distanceToApex];
  double v41 = fabs(v31);
  if (v28 - v41 >= v39) {
    double v28 = v28 - v41;
  }
  else {
    double v28 = v39;
  }
  if (v41 < v18 - v39)
  {
    if (v31 < 0.0)
    {
      double v37 = 1.0;
      double v20 = v33;
      goto LABEL_13;
    }
    double v53 = v36 - v20;
    if (v36 - v20 < v39) {
      double v53 = v39;
    }
    double v20 = v36 - v53;
LABEL_12:
    double v37 = 1.0;
LABEL_13:
    CGFloat v24 = v62;
    CGFloat v22 = v63;
    goto LABEL_35;
  }
  double v42 = fmin(fmax((v41 - (v18 - v39)) / v40, -2.0), 2.0);
  double v43 = v40;
  v44 = [(SBHTodayIconListLayoutDelegate *)self scrollView];
  [v44 _verticalVelocity];
  double v46 = v45;

  double v47 = 3.0;
  double v48 = (fabs(v46) + -1.0) * 12.0 * 0.5 + 3.0;
  if (v48 >= 3.0) {
    double v47 = v48;
  }
  double v49 = v43 * (1.0 - (1.0 - v42) * (1.0 - v42)) / v47;
  double v50 = v33 - v49;
  double v51 = v36 - v39 + v49;
  if (v31 >= 0.0) {
    double v20 = v51;
  }
  else {
    double v20 = v50;
  }
  double v52 = 1.0 - (1.0 - (v42 + -1.0)) * (1.0 - (v42 + -1.0)) + 1.0;
  if (v42 < 1.0) {
    double v52 = v42 * v42;
  }
  double v37 = 0.0;
  CGFloat v24 = v62;
  CGFloat v22 = v63;
  if (v52 <= 2.0)
  {
    if (v52 >= 1.0) {
      double v37 = 0.8 - (v52 + -1.0) * 0.8;
    }
    else {
      double v37 = v52 * -0.2 + 1.0;
    }
  }
  double v29 = v52 * -0.04 * 0.5 + 1.0;
LABEL_35:
  if ([v11 alignsIconsOnPixelBoundaries])
  {
    v54 = [v11 layout];
    [v54 iconImageInfo];

    BSFloatRoundForScale();
    double v20 = v55;
  }
  CGFloat v26 = v64;

  if (v6)
  {
LABEL_38:
    if (!self->_visuallyRevealed)
    {
      catchupProperties = self->_catchupProperties;
      v57 = [v13 uniqueIdentifier];
      v58 = [(NSMutableDictionary *)catchupProperties objectForKey:v57];

      if (v58)
      {
        [v58 presentationValue];
        double revealProgress = 1.0 - (v59 + v59);
      }
      else
      {
        double revealProgress = self->_revealProgress;
      }
      double v37 = v37 * revealProgress;
    }
  }
LABEL_43:
  retstr->var0.origin.x = v22;
  retstr->var0.origin.y = v24;
  retstr->var0.size.width = v26;
  retstr->var0.size.height = v28;
  retstr->var1 = v20;
  retstr->var2 = v37;
  retstr->var3 = v29;

  return result;
}

- (CGRect)unadjustedBoundsForIconCoordinate:(SBIconCoordinate)a3
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  BOOL v6 = [(SBHTodayIconListLayoutDelegate *)self iconListView];
  v7 = [v6 layoutMetrics];
  -[SBHTodayIconListLayoutDelegate layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:](self, "layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:", column, row, v7, 0);

  double v8 = v12;
  double v9 = v13;
  double v10 = v14;
  double v11 = v15;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (double)unadjustedOriginYForIconCoordinate:(SBIconCoordinate)a3
{
  int64_t row = a3.row;
  int64_t column = a3.column;
  BOOL v6 = [(SBHTodayIconListLayoutDelegate *)self iconListView];
  v7 = [v6 layoutMetrics];
  -[SBHTodayIconListLayoutDelegate _iconListView:originYForIconCoordinate:metrics:adjustedForRevealProgress:](self, "_iconListView:originYForIconCoordinate:metrics:adjustedForRevealProgress:", v6, column, row, v7, 0);
  double v9 = v8;

  return v9;
}

- (void)setRevealed:(BOOL)a3
{
  if (self->_revealed != a3)
  {
    self->_revealed = a3;
    id v3 = [(SBHTodayIconListLayoutDelegate *)self iconListView];
    [v3 setIconsNeedLayout];
  }
}

- (void)setRevealProgress:(double)a3
{
  if (self->_revealProgress != a3)
  {
    self->_double revealProgress = a3;
    id v3 = [(SBHTodayIconListLayoutDelegate *)self iconListView];
    [v3 setIconsNeedLayout];
  }
}

- (void)setDismissProgress:(double)a3
{
  if (self->_dismissProgress != a3)
  {
    self->_dismissProgress = a3;
    id v3 = [(SBHTodayIconListLayoutDelegate *)self iconListView];
    [v3 setIconsNeedLayout];
  }
}

- (void)setVisuallyRevealed:(BOOL)a3
{
}

- (void)setVisuallyRevealed:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->_visuallyRevealed != a3)
  {
    BOOL v4 = a4;
    self->_visuallyRevealed = a3;
    BOOL v6 = [(SBHTodayIconListLayoutDelegate *)self iconListView];
    [v6 setIconsNeedLayout];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v7 = [(NSMutableDictionary *)self->_catchupTimers allValues];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v33;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v32 + 1) + 8 * v11++) invalidate];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v9);
    }

    [(NSMutableDictionary *)self->_catchupTimers removeAllObjects];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    double v12 = [(NSMutableDictionary *)self->_catchupProperties allValues];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * v16++) invalidate];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v36 count:16];
      }
      while (v14);
    }

    [(NSMutableDictionary *)self->_catchupProperties removeAllObjects];
    if (v4)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke;
      v27[3] = &unk_1E6AAEB78;
      v27[4] = self;
      [v6 enumerateIconViewsUsingBlock:v27];
      double v17 = (void *)MEMORY[0x1E4FB1EB0];
      double v18 = [(NSMutableDictionary *)self->_catchupProperties allValues];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_2;
      v25[3] = &unk_1E6AAC810;
      id v19 = v6;
      id v26 = v19;
      [v17 _createTransformerWithInputAnimatableProperties:v18 presentationValueChangedCallback:v25];

      if (self->_visuallyRevealed) {
        double v20 = 0.0;
      }
      else {
        double v20 = 1.0;
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_3;
      v21[3] = &unk_1E6AB3960;
      id v22 = v19;
      double v23 = self;
      double v24 = v20;
      [v22 enumerateIconViewsUsingBlock:v21];
    }
  }
}

void __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 icon];
  id v7 = [v3 uniqueIdentifier];

  id v4 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
  v5 = v4;
  double v6 = 1.0;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 10)) {
    double v6 = 0.0;
  }
  [v4 setValue:v6];
  [*(id *)(*(void *)(a1 + 32) + 56) setObject:v5 forKey:v7];
}

uint64_t __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIconsNeedLayout];
}

void __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = [a2 icon];
  double v6 = [v5 uniqueIdentifier];

  [*(id *)(a1 + 32) coordinateForIconAtIndex:a3];
  uint64_t v8 = v7 - 1;
  if (v7 < 1) {
    uint64_t v8 = v7;
  }
  long double v9 = (double)(unint64_t)(v8 >> 1);
  long double v10 = pow(0.9, v9);
  uint64_t v11 = *(void *)(a1 + 40);
  double v12 = v10 * 0.05 * v9;
  if (*(unsigned char *)(v11 + 10)) {
    double v13 = v12;
  }
  else {
    double v13 = 0.0;
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F1CB00];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_4;
  v18[3] = &unk_1E6AB3938;
  v18[4] = v11;
  id v19 = v6;
  uint64_t v20 = *(void *)(a1 + 48);
  id v15 = v6;
  uint64_t v16 = [v14 timerWithTimeInterval:0 repeats:v18 block:v13];
  [*(id *)(*(void *)(a1 + 40) + 64) setObject:v16 forKey:v15];
  double v17 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v17 addTimer:v16 forMode:*MEMORY[0x1E4F1C4B0]];
}

void __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_4(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 56);
  id v5 = a2;
  double v6 = [v4 objectForKey:v3];
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EB0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_5;
  v15[3] = &unk_1E6AAC838;
  id v16 = v6;
  uint64_t v17 = a1[6];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_6;
  v11[3] = &unk_1E6AB3448;
  uint64_t v8 = a1[4];
  long double v9 = (void *)a1[5];
  id v12 = v16;
  uint64_t v13 = v8;
  id v14 = v9;
  id v10 = v16;
  [v7 _animateUsingSpringWithTension:0 friction:v15 interactive:v11 animations:145.0 completion:24.0];
  [v5 invalidate];

  [*(id *)(a1[4] + 64) removeObjectForKey:a1[5]];
}

void *__63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_5(uint64_t a1)
{
  CGRect result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result setValue:*(double *)(a1 + 40)];
  }
  return result;
}

void __63__SBHTodayIconListLayoutDelegate_setVisuallyRevealed_animated___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 56) objectForKey:*(void *)(a1 + 48)];

  if (v2 == v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(*(void *)(a1 + 40) + 56);
    [v5 removeObjectForKey:v4];
  }
}

- (CGPoint)iconListView:(id)a3 originForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedOrigin:(CGPoint)a6
{
  double y = a6.y;
  CGFloat x = a6.x;
  int64_t row = a4.row;
  int64_t column = a4.column;
  id v12 = a3;
  id v13 = a5;
  if ([(SBHTodayIconListLayoutDelegate *)self isCarouselLayout])
  {
    -[SBHTodayIconListLayoutDelegate layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:](self, "layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:", column, row, v13, 1, 0, 0, 0);
    id v14 = objc_msgSend(v12, "iconAtCoordinate:metrics:", column, row, v13);
    id v15 = [v12 layout];
    id v16 = [v14 gridSizeClass];
    [v15 iconImageInfoForGridSizeClass:v16];
    double v18 = v17;

    double y = 0.0 * 0.5 + 0.0 - v18 * 0.5;
  }

  double v19 = x;
  double v20 = y;
  result.double y = v20;
  result.CGFloat x = v19;
  return result;
}

- (CGPoint)iconListView:(id)a3 centerForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 proposedCenter:(CGPoint)a6
{
  CGFloat x = a6.x;
  -[SBHTodayIconListLayoutDelegate layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:](self, "layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:", a4.column, a4.row, a5, 1, 0, 0, 0);
  double v7 = 0.0 * 0.5 + 0.0;
  double v8 = x;
  result.double y = v7;
  result.CGFloat x = v8;
  return result;
}

- (unint64_t)iconListView:(id)a3 rowAtPoint:(CGPoint)a4 metrics:(id)a5 proposedRow:(unint64_t)a6
{
  double y = a4.y;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = [a5 listModel];
  [v10 iconSpacing];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v12 = [v11 icons];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    unint64_t v30 = a6;
    long long v31 = v11;
    uint64_t v15 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v10, "coordinateForIcon:", v17, v30);
        uint64_t v20 = v19;
        if (!SBIconCoordinateIsNotFound(v18, v19))
        {
          -[SBHTodayIconListLayoutDelegate unadjustedOriginYForIconCoordinate:](self, "unadjustedOriginYForIconCoordinate:", v18, v20);
          double v22 = v21;
          double v23 = [v17 gridSizeClass];
          unsigned int v24 = [v10 iconGridSizeForClass:v23];

          double v25 = [v10 layout];
          id v26 = [v17 gridSizeClass];
          SBHIconListLayoutIconImageInfoForGridSizeClass(v25, v26);
          double v28 = v27;

          if (BSFloatGreaterThanOrEqualToFloat())
          {
            if (BSFloatLessThanOrEqualToFloat())
            {
              a6 = v20 + (unint64_t)((y - v22) / (v28 / (double)HIWORD(v24))) - 1;
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v14) {
        continue;
      }
      break;
    }
    a6 = v30;
LABEL_13:
    uint64_t v11 = v31;
  }

  return a6;
}

- (CGSize)iconListView:(id)a3 sizeThatFits:(CGSize)a4 metrics:(id)a5 proposedSize:(CGSize)a6
{
  CGFloat width = a6.width;
  id v9 = a3;
  id v10 = a5;
  uint64_t v11 = [v9 icons];
  id v12 = [v11 lastObject];

  [v10 iconInsets];
  double v14 = v13;
  double v16 = v15;

  if (v12)
  {
    uint64_t v17 = [v9 coordinateForIcon:v12];
    -[SBHTodayIconListLayoutDelegate unadjustedOriginYForIconCoordinate:](self, "unadjustedOriginYForIconCoordinate:", v17, v18);
    double v20 = v19;
    double v21 = [v9 layout];
    double v22 = [v12 gridSizeClass];
    [v21 iconImageInfoForGridSizeClass:v22];
    double v24 = v23;
  }
  else
  {
    double v20 = v14 + self->_additionalLayoutInsets.top;
    double v24 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  CGFloat v25 = self->_additionalLayoutInsets.bottom + v16 + v20 + v24;

  double v26 = width;
  double v27 = v25;
  result.height = v27;
  result.CGFloat width = v26;
  return result;
}

- (void)iconListView:(id)a3 willLayoutIconView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 layoutMetrics];
  id v9 = [v7 icon];
  uint64_t v10 = [v6 coordinateForIcon:v9];
  uint64_t v12 = v11;

  sCGFloat x = 0.0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  -[SBHTodayIconListLayoutDelegate layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:](self, "layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:", v10, v12, v8, 1);
  if (([v7 allIconElementsButLabelHidden] & 1) == 0) {
    [v7 setIconImageAndAccessoryAlpha:*((double *)&v27 + 1)];
  }
  [v7 setIconImageSizeMatchesBoundsSize:1];
  objc_msgSend(v7, "setBounds:", v25, v26);
  [v7 setUserInteractionEnabled:BSFloatGreaterThanFloat()];
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeScale(&v24, sx, sx);
  [v7 center];
  double v14 = v13;
  [v6 bounds];
  CGAffineTransform v22 = v24;
  CGAffineTransformTranslate(&v23, &v22, (1.0 - sx) * (v15 * 0.5 - v14), 0.0);
  CGAffineTransform v24 = v23;
  [v7 setTransform:&v23];
  double v16 = [v7 customIconImageViewController];
  if (v16 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v17 = [(SBHTodayIconListLayoutDelegate *)self containerView];
    [v7 bounds];
    UIRectGetCenter();
    objc_msgSend(v7, "convertPoint:toView:", v17);
    double v19 = v18;
    [v17 bounds];
    [v16 setImageViewAlignment:v19 < self->_carouselInsets.top + v20 + (v21 - (self->_carouselInsets.top + self->_carouselInsets.bottom)) * 0.5];
  }
  [v7 layoutIfNeeded];
}

- (void)iconListViewDidLayoutIcons:(id)a3
{
  id v4 = a3;
  if ([(SBHTodayIconListLayoutDelegate *)self isCarouselLayout])
  {
    [(SBHTodayIconListLayoutDelegate *)self _reorderSubviewsForCarouselLayoutInListView:v4];
    [(SBHTodayIconListLayoutDelegate *)self _layoutFocusGuideViewsInListView:v4];
  }
}

- (void)_reorderSubviewsForCarouselLayoutInListView:(id)a3
{
  id v4 = a3;
  if ([(SBHTodayIconListLayoutDelegate *)self isCarouselLayout])
  {
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__18;
    v70 = __Block_byref_object_dispose__18;
    id v71 = 0;
    uint64_t v60 = 0;
    v61 = &v60;
    uint64_t v62 = 0x3032000000;
    double v63 = __Block_byref_object_copy__18;
    double v64 = __Block_byref_object_dispose__18;
    id v65 = 0;
    uint64_t v54 = 0;
    double v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__18;
    v58 = __Block_byref_object_dispose__18;
    id v59 = 0;
    id v5 = [(SBHTodayIconListLayoutDelegate *)self containerView];
    [v5 bounds];
    double top = self->_carouselInsets.top;
    double left = self->_carouselInsets.left;
    double v9 = v8 + left;
    double v11 = v10 + top;
    double v13 = v12 - (left + self->_carouselInsets.right);
    double v15 = v14 - (top + self->_carouselInsets.bottom);
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __78__SBHTodayIconListLayoutDelegate__reorderSubviewsForCarouselLayoutInListView___block_invoke;
    v45[3] = &unk_1E6AB3988;
    id v16 = v5;
    double v50 = v9;
    double v51 = v11;
    double v52 = v13;
    double v53 = v15;
    id v46 = v16;
    double v47 = &v66;
    double v48 = &v60;
    double v49 = &v54;
    [v4 enumerateIconViewsUsingBlock:v45];
    uint64_t v17 = (void *)v67[5];
    if (!v17)
    {
      uint64_t v17 = (void *)v61[5];
      if (!v17) {
        uint64_t v17 = (void *)v55[5];
      }
    }
    id v18 = v17;
    double v19 = [v18 icon];
    if (v19)
    {
      double v20 = [v4 layoutMetrics];
      double v21 = [v20 listModel];
      CGAffineTransform v22 = [v4 gridCellInfo];
      uint64_t v23 = [v21 indexForIcon:v19];
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v24 = [v22 gridCellIndexForIconIndex:v23];
        if (v24 != 0x7FFFFFFFFFFFFFFFLL)
        {
          [v22 coordinateForGridCellIndex:v24];
          if (v25 != 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v26 = [v21 iconsInGridRow:v25 - 1 gridCellInfo:v22];
            double v39 = v20;
            id v40 = v16;
            long long v27 = [v26 firstObject];
            uint64_t v28 = [v21 indexForIcon:v27];

            long long v29 = [v26 lastObject];
            uint64_t v30 = [v21 indexForIcon:v29];

            unint64_t v31 = [v21 gridCellIndexForIconIndex:v28 gridCellInfo:v22];
            uint64_t v32 = [v21 gridCellIndexForIconIndex:v30 gridCellInfo:v22];
            unint64_t v41 = [v21 maxNumberOfIcons];
            unsigned int v37 = [v21 gridSize];
            aBlock[0] = MEMORY[0x1E4F143A8];
            aBlock[1] = 3221225472;
            aBlock[2] = __78__SBHTodayIconListLayoutDelegate__reorderSubviewsForCarouselLayoutInListView___block_invoke_2;
            aBlock[3] = &unk_1E6AB39B0;
            id v38 = v26;
            id v43 = v38;
            id v44 = v4;
            long long v33 = (void (**)(void *, void *))_Block_copy(aBlock);
            if (v31)
            {
              --v31;
              do
              {
                long long v34 = [v21 iconAtGridCellIndex:v31 gridCellInfo:v22];
                v33[2](v33, v34);

                --v31;
              }
              while (v31 != -1);
            }
            unint64_t v35 = v32 + 1;
            if (v32 + 1 < v41)
            {
              while (1)
              {
                double v36 = [v21 iconAtGridCellIndex:v35 gridCellInfo:v22];
                if (!v36)
                {
                  unint64_t v31 = v31 & 0xFFFFFFFF00000000 | v37;
                  if (SBIconCoordinateMakeWithGridCellIndex(v35, v31) == 1) {
                    break;
                  }
                }
                v33[2](v33, v36);

                if (++v35 >= v41) {
                  goto LABEL_18;
                }
              }
            }
LABEL_18:

            double v20 = v39;
            id v16 = v40;
          }
        }
      }
    }
    _Block_object_dispose(&v54, 8);

    _Block_object_dispose(&v60, 8);
    _Block_object_dispose(&v66, 8);
  }
}

void __78__SBHTodayIconListLayoutDelegate__reorderSubviewsForCarouselLayoutInListView___block_invoke(uint64_t a1, void *a2)
{
  id v17 = a2;
  [v17 bounds];
  objc_msgSend(v17, "convertRect:toView:", *(void *)(a1 + 32));
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  double MinY = CGRectGetMinY(v19);
  if (MinY < CGRectGetMinY(*(CGRect *)(a1 + 64))
    || (v20.origin.CGFloat x = x,
        v20.origin.CGFloat y = y,
        v20.size.CGFloat width = width,
        v20.size.CGFloat height = height,
        double v9 = CGRectGetMaxY(v20),
        v9 > CGRectGetMaxY(*(CGRect *)(a1 + 64)))
    || ([v17 effectiveIconImageAlpha], (BSFloatIsZero() & 1) != 0))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(void *)(v10 + 40))
    {
      v21.origin.CGFloat x = x;
      v21.origin.CGFloat y = y;
      v21.size.CGFloat width = width;
      v21.size.CGFloat height = height;
      double v11 = CGRectGetMinY(v21);
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) frame];
      if (v11 < CGRectGetMinY(v22))
      {
        uint64_t v12 = *(void *)(a1 + 48);
        goto LABEL_10;
      }
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
      if (*(void *)(v10 + 40))
      {
        v23.origin.CGFloat x = x;
        v23.origin.CGFloat y = y;
        v23.size.CGFloat width = width;
        v23.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v23);
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) frame];
        if (MaxY <= CGRectGetMaxY(v24)) {
          goto LABEL_13;
        }
        uint64_t v12 = *(void *)(a1 + 56);
LABEL_10:
        uint64_t v10 = *(void *)(v12 + 8);
        if (*(void *)(v10 + 40)) {
          goto LABEL_13;
        }
      }
    }
    double v14 = (id *)(v10 + 40);
LABEL_12:
    objc_storeStrong(v14, a2);
    goto LABEL_13;
  }
  uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v16 = *(void *)(v15 + 40);
  double v14 = (id *)(v15 + 40);
  if (!v16) {
    goto LABEL_12;
  }
LABEL_13:
}

uint64_t __78__SBHTodayIconListLayoutDelegate__reorderSubviewsForCarouselLayoutInListView___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (([*(id *)(a1 + 32) containsObject:v5] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(a1 + 40) displayedIconViewForIcon:v5];
    if (v3) {
      [*(id *)(a1 + 40) sendSubviewToBack:v3];
    }
  }
  return MEMORY[0x1F4181820]();
}

- (void)_layoutFocusGuideViewsInListView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SBHTodayIconListLayoutDelegate *)self isCarouselLayout];
  id v6 = [v4 layout];
  id v7 = [v4 gridCellInfo];
  double v8 = [v4 layoutMetrics];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__SBHTodayIconListLayoutDelegate__layoutFocusGuideViewsInListView___block_invoke;
  v13[3] = &unk_1E6AB39D8;
  id v14 = v7;
  id v15 = v6;
  id v16 = v4;
  id v17 = v8;
  BOOL v19 = v5;
  id v18 = self;
  id v9 = v8;
  id v10 = v4;
  id v11 = v6;
  id v12 = v7;
  [v10 enumerateIconViewsUsingBlock:v13];
}

void __67__SBHTodayIconListLayoutDelegate__layoutFocusGuideViewsInListView___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v20 = a2;
  if ([v20 wantsFocusProxyView])
  {
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "coordinateForGridCellIndex:", objc_msgSend(*(id *)(a1 + 32), "gridCellIndexForIconIndex:", a3));
    uint64_t v7 = v6;
    double v8 = [v20 focusProxyView];
    id v9 = *(void **)(a1 + 40);
    id v10 = [v20 icon];
    id v11 = [v10 gridSizeClass];
    [v9 iconImageInfoForGridSizeClass:v11];
    double v13 = v12;
    double v15 = v14;

    objc_msgSend(*(id *)(a1 + 48), "originForIconAtCoordinate:metrics:", v5, v7, *(void *)(a1 + 56));
    double v18 = v17;
    if (*(unsigned char *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 64), "_iconListView:originYForIconCoordinate:metrics:adjustedForRevealProgress:", *(void *)(a1 + 48), v5, v7, *(void *)(a1 + 56), 0);
      double v16 = v19;
    }
    objc_msgSend(v8, "setFrame:", v18, v16, v13, v15);
    [*(id *)(a1 + 48) sendSubviewToBack:v8];
  }
}

- (double)_iconListView:(id)a3 originYForIconCoordinate:(SBIconCoordinate)a4 metrics:(id)a5 adjustedForRevealProgress:(BOOL)a6
{
  int64_t row = a4.row;
  int64_t column = a4.column;
  id v10 = a3;
  id v11 = a5;
  double v12 = [v11 gridCellInfo];
  uint64_t v13 = [v11 columns];
  [v11 iconSpacing];
  double v15 = v14;
  [v11 iconInsets];
  double v17 = v16;
  int64_t v43 = column;
  int64_t v44 = row;
  unint64_t v18 = column - 1;
  unint64_t v19 = column - 1 + v13 * (row - 1);
  unint64_t v20 = [v12 iconIndexForGridCellIndex:v19];
  double v48 = v10;
  CGRect v21 = [v10 layout];
  id v47 = v11;
  CGRect v22 = [v11 listModel];
  double v45 = self;
  double v23 = v17 + self->_additionalLayoutInsets.top;
  if (v18 < v19)
  {
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      unint64_t v25 = [v12 iconIndexForGridCellIndex:v18];
      unint64_t v26 = v25;
      if (v25 == v24 || v25 >= v20)
      {
        if (v25 == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v21 iconImageInfoForGridSizeClass:@"SBHIconGridSizeClassDefault"];
          double v23 = v23 + v15 + v31;
        }
      }
      else
      {
        long long v27 = [v22 iconAtIndex:v25];
        uint64_t v28 = [v27 gridSizeClass];
        [v21 iconImageInfoForGridSizeClass:v28];
        double v30 = v29;

        double v23 = v23 + v15 + v30;
        uint64_t v24 = v26;
      }
      v18 += v13;
    }
    while (v18 < v19);
  }
  if (a6)
  {
    long long v33 = v47;
    uint64_t v32 = v48;
    long long v34 = objc_msgSend(v48, "iconAtCoordinate:metrics:", v43, v44, v47);
    catchupProperties = v45->_catchupProperties;
    double v36 = [v34 uniqueIdentifier];
    unsigned int v37 = [(NSMutableDictionary *)catchupProperties objectForKey:v36];

    [(SBHTodayIconListLayoutDelegate *)v45 revealProgressMaxTranslation];
    double v39 = v38;
    if (v37)
    {
      [v37 presentationValue];
      double v23 = v23 + v39 * v40;
    }
    else
    {
      double v41 = -0.0;
      if (!v45->_visuallyRevealed) {
        double v41 = v39;
      }
      double v23 = v23 + v41;
    }
  }
  else
  {
    long long v33 = v47;
    uint64_t v32 = v48;
  }

  return v23;
}

- (SBIconListView)iconListView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconListView);
  return (SBIconListView *)WeakRetained;
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void)setContainerView:(id)a3
{
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setScrollView:(id)a3
{
}

- (void)setCarouselLayout:(BOOL)a3
{
  self->_carouselLayout = a3;
}

- (UIEdgeInsets)carouselInsets
{
  double top = self->_carouselInsets.top;
  double left = self->_carouselInsets.left;
  double bottom = self->_carouselInsets.bottom;
  double right = self->_carouselInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)additionalLayoutInsets
{
  double top = self->_additionalLayoutInsets.top;
  double left = self->_additionalLayoutInsets.left;
  double bottom = self->_additionalLayoutInsets.bottom;
  double right = self->_additionalLayoutInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isRevealed
{
  return self->_revealed;
}

- (double)revealProgress
{
  return self->_revealProgress;
}

- (double)dismissProgress
{
  return self->_dismissProgress;
}

- (BOOL)isVisuallyRevealed
{
  return self->_visuallyRevealed;
}

- (NSMutableDictionary)catchupProperties
{
  return self->_catchupProperties;
}

- (void)setCatchupProperties:(id)a3
{
}

- (NSMutableDictionary)catchupTimers
{
  return self->_catchupTimers;
}

- (void)setCatchupTimers:(id)a3
{
}

- (double)collapseHeight
{
  return self->_collapseHeight;
}

- (double)distanceToApex
{
  return self->_distanceToApex;
}

- (double)revealProgressMaxTranslation
{
  return self->_revealProgressMaxTranslation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catchupTimers, 0);
  objc_storeStrong((id *)&self->_catchupProperties, 0);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_containerView);
  objc_destroyWeak((id *)&self->_iconListView);
}

@end