@interface TUISystemInputAssistantLayoutFloat
- (NSLayoutConstraint)centerViewCenterConstraint;
- (NSLayoutConstraint)containerLeadingHorizontalPosition;
- (NSLayoutConstraint)containerTrailingHorizontalPosition;
- (TUISystemInputAssistantLayoutFloat)init;
- (id)_buttonBarGroupSetForApplicationAssistantItem:(id)a3 withSystemInputAssistantItem:(id)a4 forAssistantView:(id)a5;
- (unint64_t)currentRectEdge;
- (void)_layoutViewSet:(id)a3 forFixedCenterViewWidth:(double)a4 inBounds:(CGRect)a5 forAssistantView:(id)a6;
- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6;
- (void)setCenterViewCenterConstraint:(id)a3;
- (void)setContainerLeadingHorizontalPosition:(id)a3;
- (void)setContainerTrailingHorizontalPosition:(id)a3;
- (void)setCurrentRectEdge:(unint64_t)a3;
- (void)trackHorizontalMovement:(CGPoint)a3;
- (void)updatePostionForRectEdge:(unint64_t)a3;
@end

@implementation TUISystemInputAssistantLayoutFloat

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerTrailingHorizontalPosition, 0);
  objc_storeStrong((id *)&self->_containerLeadingHorizontalPosition, 0);
  objc_storeStrong((id *)&self->super._rightSplitWidth, 0);
}

- (unint64_t)currentRectEdge
{
  return (unint64_t)self->_centerViewCenterConstraint;
}

- (void)setCenterViewCenterConstraint:(id)a3
{
}

- (NSLayoutConstraint)centerViewCenterConstraint
{
  return self->_containerTrailingHorizontalPosition;
}

- (void)setContainerTrailingHorizontalPosition:(id)a3
{
}

- (NSLayoutConstraint)containerTrailingHorizontalPosition
{
  return self->_containerLeadingHorizontalPosition;
}

- (void)setContainerLeadingHorizontalPosition:(id)a3
{
}

- (NSLayoutConstraint)containerLeadingHorizontalPosition
{
  return *(NSLayoutConstraint **)&self->super._rightSplitWidth;
}

- (id)_buttonBarGroupSetForApplicationAssistantItem:(id)a3 withSystemInputAssistantItem:(id)a4 forAssistantView:(id)a5
{
  v56[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [v9 leadingBarButtonGroups];
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    v13 = (void *)v10;
  }
  else {
    v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = v13;

  v15 = [v9 trailingBarButtonGroups];

  if (v15) {
    v16 = v15;
  }
  else {
    v16 = v12;
  }
  id v51 = v16;

  uint64_t v17 = [v8 leadingBarButtonGroups];
  v18 = (void *)v17;
  if (v17) {
    v19 = (void *)v17;
  }
  else {
    v19 = v12;
  }
  id v52 = v19;

  v20 = [v8 trailingBarButtonGroups];

  if (v20) {
    v21 = v20;
  }
  else {
    v21 = v12;
  }
  id v22 = v21;

  v23 = objc_alloc_init(TUIButtonBarGroupSet);
  id v24 = objc_alloc(MEMORY[0x1E4FB14B8]);
  v25 = +[TUIAssistantSeparatorView barButtonItem];
  v56[0] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:1];
  v27 = (void *)[v24 initWithBarButtonItems:v26 representativeItem:0];

  v28 = v14;
  id v29 = objc_alloc(MEMORY[0x1E4FB14B8]);
  v30 = +[TUIAssistantSeparatorView barButtonItem];
  v55 = v30;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
  v32 = (void *)[v29 initWithBarButtonItems:v31 representativeItem:0];

  LOBYTE(v31) = [v7 showsCenterView];
  v33 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v34 = [v28 count];
  if (v31)
  {
    v35 = v52;
    v36 = objc_msgSend(v33, "arrayWithCapacity:", v34 + objc_msgSend(v52, "count") + 1);
    [v36 addObjectsFromArray:v28];
    [v36 addObject:v27];
    [v36 addObjectsFromArray:v52];
    [(TUIButtonBarGroupSet *)v23 setLeadingButtonGroups:v36];
    v54 = v27;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    v37 = v50 = v28;
    [(TUIButtonBarGroupSet *)v23 setLeadingSeparators:v37];

    v38 = v51;
    v39 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v51, "count") + objc_msgSend(v22, "count") + 1);
    [v39 addObjectsFromArray:v22];
    [v39 addObject:v32];
    [v39 addObjectsFromArray:v51];
    [(TUIButtonBarGroupSet *)v23 setTrailingButtonGroups:v39];
    v53 = v32;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
    [(TUIButtonBarGroupSet *)v23 setTrailingSeparators:v40];

    v41 = v50;
  }
  else
  {
    v38 = v51;
    v36 = objc_msgSend(v33, "arrayWithCapacity:", v34 + objc_msgSend(v22, "count") + objc_msgSend(v51, "count") + objc_msgSend(v22, "count") + 2);
    v39 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    v35 = v52;
    if ([v52 count])
    {
      [v36 addObjectsFromArray:v52];
      [v36 addObject:v27];
      [v39 addObject:v27];
    }
    v41 = v28;
    [v36 addObjectsFromArray:v28];
    [v36 addObjectsFromArray:v51];
    if ([v22 count])
    {
      [v36 addObject:v32];
      [v36 addObjectsFromArray:v22];
      [v39 addObject:v32];
    }
    uint64_t v42 = MEMORY[0x1E4F1CBF0];
    [(TUIButtonBarGroupSet *)v23 setLeadingButtonGroups:MEMORY[0x1E4F1CBF0]];
    [(TUIButtonBarGroupSet *)v23 setLeadingSeparators:v42];
    [(TUIButtonBarGroupSet *)v23 setTrailingButtonGroups:v36];
    [(TUIButtonBarGroupSet *)v23 setTrailingSeparators:v39];
  }

  v43 = [(TUIButtonBarGroupSet *)v23 leadingButtonGroups];
  v44 = [(TUIButtonBarGroupSet *)v23 trailingButtonGroups];
  v45 = [v43 arrayByAddingObjectsFromArray:v44];
  [(TUIButtonBarGroupSet *)v23 setUnifiedButtonGroups:v45];

  v46 = [(TUIButtonBarGroupSet *)v23 leadingSeparators];
  v47 = [(TUIButtonBarGroupSet *)v23 trailingSeparators];
  v48 = [v46 arrayByAddingObjectsFromArray:v47];
  [(TUIButtonBarGroupSet *)v23 setUnifiedSeparators:v48];

  return v23;
}

- (void)_layoutViewSet:(id)a3 forFixedCenterViewWidth:(double)a4 inBounds:(CGRect)a5 forAssistantView:(id)a6
{
  double height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v13 = a3;
  id v14 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__TUISystemInputAssistantLayoutFloat__layoutViewSet_forFixedCenterViewWidth_inBounds_forAssistantView___block_invoke;
  aBlock[3] = &__block_descriptor_64_e41_d32__0__TUIAssistantButtonBarView_8d16d24l;
  *(CGFloat *)&aBlock[4] = x;
  *(CGFloat *)&aBlock[5] = y;
  *(CGFloat *)&aBlock[6] = width;
  *(double *)&aBlock[7] = height;
  v15 = (double (**)(void *, void *, double, double))_Block_copy(aBlock);
  UIRectRoundToScale();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [v14 updateContainerConstraintsForFloating];
  id v24 = [v14 containerLeading];
  [(TUISystemInputAssistantLayoutFloat *)self setContainerLeadingHorizontalPosition:v24];

  v25 = [v14 containerTrailing];
  [(TUISystemInputAssistantLayoutFloat *)self setContainerTrailingHorizontalPosition:v25];

  v26 = [v14 containerCenter];
  [(TUISystemInputAssistantLayoutFloat *)self setCenterViewCenterConstraint:v26];

  if (([v14 showsCenterView] & 1) == 0 && objc_msgSend(v14, "isInputAssistantItemHidden"))
  {
    if ([v14 showsButtonBarItemsInline])
    {
      v27 = [v13 leftButtonBar];
      [v27 intrinsicContentSize];
      double v29 = v28;

      v30 = [v13 rightButtonBar];
      [v30 intrinsicContentSize];
      double v32 = v31;

      v33 = [MEMORY[0x1E4FB1900] activeInstance];
      uint64_t v34 = [v33 inputDelegate];
      v35 = [v34 textInputView];
      [v35 _shouldReverseLayoutDirection];

      v36 = [v13 leftButtonBar];
      objc_msgSend(v36, "setFrame:", 0.0, 0.0, v29, v23);

      v37 = [v13 rightButtonBar];
      objc_msgSend(v37, "setFrame:", v29 + 0.0, 0.0, v32, v23);
    }
    unint64_t v38 = [(TUISystemInputAssistantLayoutFloat *)self currentRectEdge];
    v39 = [(TUISystemInputAssistantLayoutFloat *)self centerViewCenterConstraint];
    int v40 = [v39 isActive];

    if (v40)
    {
      [(TUISystemInputAssistantLayoutFloat *)self setCurrentRectEdge:0];
      [(TUISystemInputAssistantLayoutFloat *)self setCurrentRectEdge:v38];
    }
    goto LABEL_24;
  }
  if (([v14 showsCenterView] & 1) == 0)
  {
    if ([v14 showsButtonBarItemsInline])
    {
      v47 = [v13 leftButtonBar];
      [v47 intrinsicContentSize];
      double v49 = v48;
      v50 = [v13 rightButtonBar];
      [v50 intrinsicContentSize];
      double v52 = v49 + v51;

      if (v52 > v21 + -32.0)
      {
        v53 = [v13 leftButtonBar];
        objc_msgSend(v53, "collapsedSizeThatFits:", v21 + -32.0, height);
        double v55 = v54;
        v56 = [v13 rightButtonBar];
        objc_msgSend(v56, "collapsedSizeThatFits:", v21 + -32.0, height);
        double v52 = v55 + v57;
      }
      v58 = [v13 leftButtonBar];
      objc_msgSend(v58, "setFrame:", 0.0, 0.0, v52, v23);

      v59 = [v13 rightButtonBar];
      objc_msgSend(v59, "setFrame:", v52 + 0.0, 0.0, 0.0, v23);

      [(TUISystemInputAssistantLayoutFloat *)self setCurrentRectEdge:4];
      v60 = [v13 centerView];
      v61 = v60;
      double v62 = v17;
      double v63 = v19;
      double v64 = v21;
      double v65 = v23;
      goto LABEL_22;
    }
LABEL_24:
    v76 = [v13 centerView];
    objc_msgSend(v76, "setFrame:", v17, v19, v21, v23);

    [(TUISystemInputAssistantLayoutFloat *)self updatePostionForRectEdge:[(TUISystemInputAssistantLayoutFloat *)self currentRectEdge]];
    goto LABEL_25;
  }
  if (a4 <= 0.0)
  {
    CGFloat v44 = v23;
    double v45 = v21;
  }
  else
  {
    UIRectCenteredRect();
    double v17 = v41;
    double v19 = v42;
    CGFloat v44 = v43;
    double v45 = v21 - a4;
    double v21 = v46;
  }
  if (![v14 showsButtonBarItemsInline])
  {
    double v23 = v44;
    goto LABEL_24;
  }
  v66 = [v13 leftButtonBar];
  double v67 = v15[2](v15, v66, 214.0, v45 * 0.5 + -16.0);

  double v68 = 4.0;
  CGFloat v77 = v21;
  if (v67 == 0.0) {
    double v69 = 4.0;
  }
  else {
    double v69 = 10.0;
  }
  v70 = [v13 rightButtonBar];
  double v71 = v15[2](v15, v70, 214.0, v45 * 0.5 + -16.0);

  if (v71 != 0.0) {
    double v68 = 10.0;
  }
  v72 = [v13 leftButtonBar];
  objc_msgSend(v72, "setFrame:", 0.0, 0.0, v67, v23);

  double v73 = v67 + v69;
  v79.origin.CGFloat x = v67 + v69;
  v79.origin.CGFloat y = v19;
  v79.size.CGFloat width = v77;
  v79.size.double height = v44;
  double v74 = v68 + CGRectGetMaxX(v79);
  v75 = [v13 rightButtonBar];
  objc_msgSend(v75, "setFrame:", v74, 0.0, v71, v23);

  [(TUISystemInputAssistantLayoutFloat *)self updatePostionForRectEdge:4];
  v60 = [v13 centerView];
  v61 = v60;
  double v62 = v73;
  double v63 = v19;
  double v64 = v77;
  double v65 = v44;
LABEL_22:
  objc_msgSend(v60, "setFrame:", v62, v63, v64, v65);

LABEL_25:
}

double __103__TUISystemInputAssistantLayoutFloat__layoutViewSet_forFixedCenterViewWidth_inBounds_forAssistantView___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  id v8 = v7;
  if (a3 >= a4) {
    a3 = a4;
  }
  double v9 = 0.0;
  if ([v7 hasVisibleItem])
  {
    [v8 intrinsicContentSize];
    double v11 = v10;
    if (v10 > a3)
    {
      objc_msgSend(v8, "collapsedSizeThatFits:", a3, *(double *)(a1 + 56));
      double v9 = v12;
      if (v12 < a3) {
        goto LABEL_8;
      }
      [v8 uncollapseAllGroups];
    }
    double v9 = v11;
LABEL_8:
    if (v9 > a4)
    {
      objc_msgSend(v8, "sizeThatFits:", a4, *(double *)(a1 + 56));
      double v9 = v13;
    }
  }

  return v9;
}

- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v13 showsCenterView] & 1) != 0 || (objc_msgSend(v13, "isInputAssistantItemHidden"))
  {
    id v14 = [v10 leftButtonBar];
    uint64_t v15 = [v14 effectiveUserInterfaceLayoutDirection];

    if (v15 == 1)
    {
      id v16 = (id)objc_opt_new();
      double v17 = [v12 trailingBarButtonGroups];
      [v16 setLeadingBarButtonGroups:v17];

      double v18 = [v12 leadingBarButtonGroups];
      [v16 setTrailingBarButtonGroups:v18];
    }
    else
    {
      id v16 = v12;
    }
    v28.receiver = self;
    v28.super_class = (Class)TUISystemInputAssistantLayoutFloat;
    [(TUISystemInputAssistantLayoutStandard *)&v28 configureButtonBarsInViewSet:v10 forApplicationAssistantItem:v11 withSystemAssistantItem:v16 withAssistantView:v13];
  }
  else
  {
    double v19 = [(TUISystemInputAssistantLayoutFloat *)self _buttonBarGroupSetForApplicationAssistantItem:v11 withSystemInputAssistantItem:v12 forAssistantView:v13];
    double v20 = [v10 leftButtonBar];
    double v21 = [v19 unifiedButtonGroups];
    objc_msgSend(v20, "setButtonGroups:animated:", v21, objc_msgSend(v13, "isTransitioning"));

    double v22 = [v10 leftButtonBar];
    double v23 = [v19 unifiedSeparators];
    [v22 setSeparatorGroups:v23];

    id v24 = [v10 rightButtonBar];
    uint64_t v25 = [v13 isTransitioning];
    uint64_t v26 = MEMORY[0x1E4F1CBF0];
    [v24 setButtonGroups:MEMORY[0x1E4F1CBF0] animated:v25];

    v27 = [v10 rightButtonBar];
    [v27 setSeparatorGroups:v26];
  }
}

- (void)trackHorizontalMovement:(CGPoint)a3
{
  double x = a3.x;
  id v4 = [(TUISystemInputAssistantLayoutFloat *)self containerLeadingHorizontalPosition];
  [v4 setConstant:x];
}

- (void)setCurrentRectEdge:(unint64_t)a3
{
  v5 = [(TUISystemInputAssistantLayoutFloat *)self containerLeadingHorizontalPosition];

  if (v5) {
    [(TUISystemInputAssistantLayoutFloat *)self updatePostionForRectEdge:a3];
  }
  self->_centerViewCenterConstraint = (NSLayoutConstraint *)a3;
}

- (void)updatePostionForRectEdge:(unint64_t)a3
{
  if (a3 == 4)
  {
    double v9 = [(TUISystemInputAssistantLayoutFloat *)self centerViewCenterConstraint];
    char v10 = [v9 isActive];

    if (v10) {
      return;
    }
    id v11 = [(TUISystemInputAssistantLayoutFloat *)self containerLeadingHorizontalPosition];
    [v11 setActive:0];

    id v12 = [(TUISystemInputAssistantLayoutFloat *)self containerTrailingHorizontalPosition];
    [v12 setActive:0];

    id v8 = [(TUISystemInputAssistantLayoutFloat *)self centerViewCenterConstraint];
  }
  else if (a3 == 8)
  {
    id v4 = [(TUISystemInputAssistantLayoutFloat *)self containerTrailingHorizontalPosition];
    char v5 = [v4 isActive];

    if (v5) {
      return;
    }
    v6 = [(TUISystemInputAssistantLayoutFloat *)self containerLeadingHorizontalPosition];
    [v6 setActive:0];

    id v7 = [(TUISystemInputAssistantLayoutFloat *)self centerViewCenterConstraint];
    [v7 setActive:0];

    id v8 = [(TUISystemInputAssistantLayoutFloat *)self containerTrailingHorizontalPosition];
  }
  else
  {
    id v13 = [(TUISystemInputAssistantLayoutFloat *)self containerLeadingHorizontalPosition];
    char v14 = [v13 isActive];

    if (v14) {
      return;
    }
    uint64_t v15 = [(TUISystemInputAssistantLayoutFloat *)self containerTrailingHorizontalPosition];
    [v15 setActive:0];

    id v16 = [(TUISystemInputAssistantLayoutFloat *)self centerViewCenterConstraint];
    [v16 setActive:0];

    id v8 = [(TUISystemInputAssistantLayoutFloat *)self containerLeadingHorizontalPosition];
  }
  id v17 = v8;
  [v8 setActive:1];
}

- (TUISystemInputAssistantLayoutFloat)init
{
  v3.receiver = self;
  v3.super_class = (Class)TUISystemInputAssistantLayoutFloat;
  result = [(TUISystemInputAssistantLayoutFloat *)&v3 init];
  if (result) {
    result->_centerViewCenterConstraint = (NSLayoutConstraint *)8;
  }
  return result;
}

@end