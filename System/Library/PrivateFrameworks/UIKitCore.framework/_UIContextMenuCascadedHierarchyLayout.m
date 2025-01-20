@interface _UIContextMenuCascadedHierarchyLayout
- (BOOL)isAnimatingMenuAddition;
- (CAPoint3D)_submenuOffsetForCascadingLeft:(BOOL)a3;
- (CGRect)_cascadingAreaBounds;
- (CGSize)encompassingSize;
- (_UIContextMenuCascadedHierarchyLayout)initWithMenuView:(id)a3;
- (_UIContextMenuView)menuView;
- (id)_metrics;
- (void)navigateDownFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6;
- (void)navigateUpFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6;
- (void)performLayoutForComputingPreferredContentSize:(BOOL)a3 withMaxContainerSize:(CGSize)a4;
- (void)setIsAnimatingMenuAddition:(BOOL)a3;
- (void)setMenuView:(id)a3;
@end

@implementation _UIContextMenuCascadedHierarchyLayout

- (_UIContextMenuCascadedHierarchyLayout)initWithMenuView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuCascadedHierarchyLayout;
  v5 = [(_UIContextMenuCascadedHierarchyLayout *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIContextMenuCascadedHierarchyLayout *)v5 setMenuView:v4];
  }

  return v6;
}

- (CGSize)encompassingSize
{
  v2 = [(_UIContextMenuCascadedHierarchyLayout *)self menuView];
  v3 = [v2 submenus];
  id v4 = [v3 first];
  v5 = [v4 listView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)performLayoutForComputingPreferredContentSize:(BOOL)a3 withMaxContainerSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  double v8 = [(_UIContextMenuCascadedHierarchyLayout *)self menuView];
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  double v9 = [v8 submenus];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __108___UIContextMenuCascadedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke;
  v11[3] = &unk_1E5305108;
  id v10 = v8;
  id v12 = v10;
  v13 = self;
  BOOL v17 = a3;
  CGFloat v15 = width;
  CGFloat v16 = height;
  v14 = v18;
  [v9 enumerateNodes:v11];

  _Block_object_dispose(v18, 8);
}

- (void)navigateDownFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v25 = a5;
  id v12 = a6;
  v13 = [(_UIContextMenuCascadedHierarchyLayout *)self menuView];
  v14 = [v11 listView];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke;
  v35[3] = &unk_1E52DF078;
  id v15 = v13;
  id v36 = v15;
  id v16 = v14;
  id v37 = v16;
  id v38 = v11;
  v39 = self;
  id v40 = v10;
  id v26 = v10;
  id v17 = v11;
  +[UIView _performWithoutRetargetingAnimations:v35];
  v18 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.25];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_3;
  v33[3] = &unk_1E52D9F70;
  id v19 = v16;
  id v34 = v19;
  +[UIView _animateUsingSpringBehavior:v18 tracking:0 animations:v33 completion:0];

  v20 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.85 response:0.32];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_5;
  v30[3] = &unk_1E52DCA58;
  id v31 = v15;
  id v32 = v25;
  v30[4] = self;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_7;
  v27[3] = &unk_1E5305158;
  id v28 = v19;
  id v29 = v12;
  id v21 = v12;
  id v22 = v19;
  id v23 = v15;
  id v24 = v25;
  +[UIView _animateUsingSpringBehavior:v20 tracking:0 animations:v30 completion:v27];
}

- (void)navigateUpFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a6;
  id v11 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.25];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __98___UIContextMenuCascadedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke;
  v14[3] = &unk_1E52DA160;
  id v15 = v8;
  id v16 = v9;
  id v12 = v9;
  id v13 = v8;
  +[UIView _animateUsingSpringBehavior:v11 tracking:0 animations:v14 completion:v10];
}

- (id)_metrics
{
  v2 = [(_UIContextMenuCascadedHierarchyLayout *)self menuView];
  v3 = [v2 traitCollection];
  id v4 = _UIContextMenuGetPlatformMetrics([v3 userInterfaceIdiom]);

  return v4;
}

- (CGRect)_cascadingAreaBounds
{
  v3 = [(_UIContextMenuCascadedHierarchyLayout *)self menuView];
  id v4 = [v3 window];

  v5 = [(_UIContextMenuCascadedHierarchyLayout *)self menuView];
  int v6 = [v5 shouldAvoidInputViews];
  id v7 = v4;
  [v7 safeAreaInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = [v7 traitCollection];
  uint64_t v17 = [v16 verticalSizeClass];

  double v18 = 0.0;
  if (v17 == 1) {
    double v19 = v15;
  }
  else {
    double v19 = v15 + 0.0;
  }
  if (v17 == 1)
  {
    double v20 = v9;
  }
  else
  {
    double v13 = v13 + 20.0;
    double v11 = v11 + 0.0;
    double v20 = v9 + 20.0;
  }
  double v21 = _UIContextMenuDefaultContentSpacing(v7);
  double v22 = fmax(v13, 20.0);
  if (v6)
  {
    id v23 = v7;
    id v24 = [v23 _window];
    char v25 = [v24 _isRemoteInputHostWindow];

    if ((v25 & 1) == 0)
    {
      id v26 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      v27 = v26;
      if (v26)
      {
        [v26 verticalOverlapForView:v23 usingKeyboardInfo:0];
        double v29 = v28;
        v30 = [v23 traitCollection];
        id v31 = _UIContextMenuGetPlatformMetrics([v30 userInterfaceIdiom]);

        [v31 minimumContainerInsets];
        double v33 = v32;

        double v18 = v29 + v33;
      }
    }
    if (v22 < v18) {
      double v22 = v18;
    }
  }
  double v34 = fmax(v19, v21);
  double v35 = fmax(v11, v21);
  double v36 = fmax(v20, 20.0);

  [v7 bounds];
  double v38 = v35 + v37;
  double v40 = v36 + v39;
  double v42 = v41 - (v35 + v34);
  double v44 = v43 - (v36 + v22);
  v45 = [(_UIContextMenuCascadedHierarchyLayout *)self menuView];
  objc_msgSend(v7, "convertRect:toView:", v45, v38, v40, v42, v44);
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;

  double v54 = v47;
  double v55 = v49;
  double v56 = v51;
  double v57 = v53;
  result.size.CGFloat height = v57;
  result.size.CGFloat width = v56;
  result.origin.y = v55;
  result.origin.x = v54;
  return result;
}

- (CAPoint3D)_submenuOffsetForCascadingLeft:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(_UIContextMenuCascadedHierarchyLayout *)self _metrics];
  int v6 = [(_UIContextMenuCascadedHierarchyLayout *)self menuView];
  uint64_t v7 = [v6 effectiveUserInterfaceLayoutDirection];

  if (!v3)
  {
    if (!v7) {
      goto LABEL_3;
    }
LABEL_5:
    [v5 leadingCascadedSubmenuOffset];
    goto LABEL_6;
  }
  if (!v7) {
    goto LABEL_5;
  }
LABEL_3:
  [v5 trailingCascadedSubmenuOffset];
LABEL_6:
  double v11 = v8;
  double v12 = v9;
  double v13 = v10;

  double v14 = v11;
  double v15 = v12;
  double v16 = v13;
  result.z = v16;
  result.y = v15;
  result.x = v14;
  return result;
}

- (_UIContextMenuView)menuView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuView);
  return (_UIContextMenuView *)WeakRetained;
}

- (void)setMenuView:(id)a3
{
}

- (BOOL)isAnimatingMenuAddition
{
  return self->_isAnimatingMenuAddition;
}

- (void)setIsAnimatingMenuAddition:(BOOL)a3
{
  self->_isAnimatingMenuAddition = a3;
}

- (void).cxx_destruct
{
}

@end