@interface TUISystemInputAssistantLayoutStandard
- (BOOL)isSplit;
- (double)leftSplitWidth;
- (double)rightSplitWidth;
- (unint64_t)currentRectEdge;
- (void)_layoutViewSet:(id)a3 forFixedCenterViewWidth:(double)a4 inBounds:(CGRect)a5 forAssistantView:(id)a6;
- (void)_layoutViewSet:(id)a3 forFlexibleCenterViewInBounds:(CGRect)a4 forAssistantView:(id)a5;
- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6;
- (void)layoutViewSet:(id)a3 inBounds:(CGRect)a4 forAssistantView:(id)a5;
- (void)setIsSplit:(BOOL)a3;
- (void)setLeftSplitWidth:(double)a3;
- (void)setRightSplitWidth:(double)a3;
@end

@implementation TUISystemInputAssistantLayoutStandard

- (void)setRightSplitWidth:(double)a3
{
  self->_leftSplitWidth = a3;
}

- (double)rightSplitWidth
{
  return self->_leftSplitWidth;
}

- (void)setLeftSplitWidth:(double)a3
{
  *(double *)&self->_isSplit = a3;
}

- (double)leftSplitWidth
{
  return *(double *)&self->_isSplit;
}

- (void)setIsSplit:(BOOL)a3
{
  *(&self->super._usesUnifiedButtonBar + 1) = a3;
}

- (BOOL)isSplit
{
  return *(&self->super._usesUnifiedButtonBar + 1);
}

- (unint64_t)currentRectEdge
{
  return 4;
}

- (void)layoutViewSet:(id)a3 inBounds:(CGRect)a4 forAssistantView:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v16 = a3;
  id v11 = a5;
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  if (!CGRectIsEmpty(v18))
  {
    uint64_t v12 = [v11 showsButtonBarItemsInline] ^ 1;
    v13 = [v16 leftButtonBar];
    [v13 setHidden:v12];

    v14 = [v16 rightButtonBar];
    [v14 setHidden:v12];

    [v11 centerViewWidth];
    if (v15 <= 0.0) {
      -[TUISystemInputAssistantLayoutStandard _layoutViewSet:forFlexibleCenterViewInBounds:forAssistantView:](self, "_layoutViewSet:forFlexibleCenterViewInBounds:forAssistantView:", v16, v11, x, y, width, height);
    }
    else {
      -[TUISystemInputAssistantLayoutStandard _layoutViewSet:forFixedCenterViewWidth:inBounds:forAssistantView:](self, "_layoutViewSet:forFixedCenterViewWidth:inBounds:forAssistantView:", v16, v11);
    }
  }
}

- (void)_layoutViewSet:(id)a3 forFlexibleCenterViewInBounds:(CGRect)a4 forAssistantView:(id)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v27 = a3;
  id v10 = a5;
  id v11 = [v27 viewSetContainer];
  int v12 = [v11 translatesAutoresizingMaskIntoConstraints];

  if (v12)
  {
    v13 = [v27 viewSetContainer];
    [v10 bounds];
    objc_msgSend(v13, "setFrame:");
  }
  else
  {
    [v10 resetContainerConstraints];
  }
  int v14 = [v10 showsButtonBarItemsInline];

  if (v14)
  {
    double v15 = [v27 leftButtonBar];
    [v15 intrinsicContentSize];
    double v17 = v16;

    CGRect v18 = [v27 rightButtonBar];
    [v18 intrinsicContentSize];
    double v20 = v19;

    double v21 = v17 + v20;
    if (width > 0.0 && v21 > width)
    {
      double v17 = v17 * (width / v21);
      double v20 = v20 * (width / v21);
      double v21 = v20 + v17;
    }
    v22 = [v27 leftButtonBar];
    double y = 0.0;
    objc_msgSend(v22, "setFrame:", 0.0, 0.0, v17, height);

    v23 = [v27 leftButtonBar];
    [v23 frame];
    double x = CGRectGetWidth(v29) + 0.0;

    double width = width - v21;
    v30.origin.double y = 0.0;
    v30.origin.double x = x;
    v30.size.double width = width;
    v30.size.double height = height;
    double v24 = x + CGRectGetWidth(v30);
    v25 = [v27 rightButtonBar];
    objc_msgSend(v25, "setFrame:", v24, 0.0, v20, height);
  }
  v26 = [v27 centerView];
  objc_msgSend(v26, "setFrame:", x, y, width, height);
}

- (void)_layoutViewSet:(id)a3 forFixedCenterViewWidth:(double)a4 inBounds:(CGRect)a5 forAssistantView:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v35 = a3;
  id v13 = a6;
  int v14 = [v35 viewSetContainer];
  int v15 = [v14 translatesAutoresizingMaskIntoConstraints];

  if (v15)
  {
    double v16 = [v35 viewSetContainer];
    [v13 bounds];
    objc_msgSend(v16, "setFrame:");
  }
  else
  {
    [v13 resetContainerConstraints];
  }
  double v17 = width - a4;
  if (((a4 > 0.0) & [v13 showsCenterView]) != 0) {
    double v18 = width - a4;
  }
  else {
    double v18 = width;
  }
  if ([(TUISystemInputAssistantLayoutStandard *)self isSplit])
  {
    [(TUISystemInputAssistantLayoutStandard *)self leftSplitWidth];
    ddouble x = v19;
    [(TUISystemInputAssistantLayoutStandard *)self rightSplitWidth];
    double v21 = v20;
  }
  else
  {
    double v21 = v18 * 0.5;
    ddouble x = v21;
  }
  int v22 = [v13 showsCenterView];
  if (a4 <= 0.0)
  {
    double v23 = height;
    double v24 = width;
  }
  else
  {
    double v23 = height;
    double v24 = width;
    if (v22)
    {
      v37.origin.double x = x;
      v37.origin.double y = y;
      v37.size.double width = width;
      v37.size.double height = height;
      CGRect v38 = CGRectInset(v37, v17 * 0.5, 0.0);
      double x = v38.origin.x;
      double y = v38.origin.y;
      double v24 = v38.size.width;
      double v23 = v38.size.height;
    }
  }
  if ([v13 showsButtonBarItemsInline])
  {
    v25 = [v35 leftButtonBar];
    objc_msgSend(v25, "setFrame:", 0.0, 0.0, dx, height);

    if ([v13 showsCenterView])
    {
      v26 = [v35 leftButtonBar];
      [v26 frame];
      double v33 = v21;
      double v27 = height;
      double MaxX = CGRectGetMaxX(v39);
      v40.origin.double x = x;
      v40.origin.double y = y;
      v40.size.double width = v24;
      v40.size.double height = v23;
      double MinX = CGRectGetMinX(v40);

      BOOL v30 = MaxX <= MinX;
      double height = v27;
      double v21 = v33;
      if (!v30)
      {
        v41.origin.double x = x;
        v41.origin.double y = y;
        v41.size.double width = v24;
        v41.size.double height = v23;
        CGRect v42 = CGRectInset(v41, dx, 0.0);
        double x = v42.origin.x;
        double y = v42.origin.y;
        double v24 = v42.size.width;
        double v23 = v42.size.height;
      }
    }
    v31 = [v35 rightButtonBar];
    objc_msgSend(v31, "setFrame:", width - v21, 0.0, v21, height);
  }
  v32 = [v35 centerView];
  objc_msgSend(v32, "setFrame:", x, y, v24, v23);
}

- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __140__TUISystemInputAssistantLayoutStandard_configureButtonBarsInViewSet_forApplicationAssistantItem_withSystemAssistantItem_withAssistantView___block_invoke;
  aBlock[3] = &unk_1E5593918;
  id v12 = v11;
  id v31 = v12;
  id v13 = a5;
  id v14 = a4;
  int v15 = (void (**)(void *, void *, void *, void *))_Block_copy(aBlock);
  double v16 = [(TUISystemInputAssistantLayout *)self _buttonBarGroupSetForApplicationAssistantItem:v14 withSystemInputAssistantItem:v13 forAssistantView:v12];

  uint64_t v17 = [v12 showsCenterView] ^ 1;
  double v18 = [v10 centerView];
  [v18 setHidden:v17];

  if ([(TUISystemInputAssistantLayout *)self usesUnifiedButtonBar])
  {
    double v19 = [v10 unifiedButtonBar];
    double v20 = [v16 unifiedButtonGroups];
    [v19 setButtonGroups:v20];
  }
  else
  {
    double v21 = [v10 leftButtonBar];
    uint64_t v22 = [v21 effectiveUserInterfaceLayoutDirection];

    if (v22 == 1)
    {
      double v23 = [v10 rightButtonBar];
      double v24 = [v16 leadingButtonGroups];
      v25 = [v16 leadingSeparators];
      v15[2](v15, v23, v24, v25);

      [v10 leftButtonBar];
    }
    else
    {
      v26 = [v10 leftButtonBar];
      double v27 = [v16 leadingButtonGroups];
      v28 = [v16 leadingSeparators];
      v15[2](v15, v26, v27, v28);

      [v10 rightButtonBar];
    double v19 = };
    double v20 = [v16 trailingButtonGroups];
    CGRect v29 = [v16 trailingSeparators];
    v15[2](v15, v19, v20, v29);
  }
}

void __140__TUISystemInputAssistantLayoutStandard_configureButtonBarsInViewSet_forApplicationAssistantItem_withSystemAssistantItem_withAssistantView___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  objc_msgSend(v9, "setButtonGroups:animated:", v8, objc_msgSend(v6, "isTransitioning"));

  [v9 setSeparatorGroups:v7];
}

@end