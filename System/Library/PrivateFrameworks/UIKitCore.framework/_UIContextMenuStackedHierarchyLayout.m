@interface _UIContextMenuStackedHierarchyLayout
- (CGSize)encompassingSize;
- (_UIContextMenuStackedHierarchyLayout)initWithMenuView:(id)a3;
- (_UIContextMenuView)menuView;
- (id)_metrics;
- (void)navigateDownFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6;
- (void)navigateUpFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6;
- (void)performLayoutForComputingPreferredContentSize:(BOOL)a3 withMaxContainerSize:(CGSize)a4;
- (void)setMenuView:(id)a3;
@end

@implementation _UIContextMenuStackedHierarchyLayout

- (_UIContextMenuStackedHierarchyLayout)initWithMenuView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIContextMenuStackedHierarchyLayout;
  v5 = [(_UIContextMenuStackedHierarchyLayout *)&v8 init];
  v6 = v5;
  if (v5) {
    [(_UIContextMenuStackedHierarchyLayout *)v5 setMenuView:v4];
  }

  return v6;
}

- (CGSize)encompassingSize
{
  uint64_t v10 = 0;
  v11 = (double *)&v10;
  uint64_t v12 = 0x4010000000;
  v13 = &unk_186D7DBA7;
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v14 = *MEMORY[0x1E4F1DB20];
  long long v15 = v2;
  v3 = [(_UIContextMenuStackedHierarchyLayout *)self menuView];
  id v4 = [v3 submenus];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56___UIContextMenuStackedHierarchyLayout_encompassingSize__block_invoke;
  v9[3] = &unk_1E52FC788;
  v9[4] = &v10;
  [v4 enumerateNodes:v9];

  double v5 = v11[6];
  double v6 = v11[7];
  _Block_object_dispose(&v10, 8);
  double v7 = v5;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)performLayoutForComputingPreferredContentSize:(BOOL)a3 withMaxContainerSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  double v8 = [(_UIContextMenuStackedHierarchyLayout *)self menuView];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  uint64_t v30 = 0;
  v9 = [v8 submenus];
  uint64_t v10 = [v9 nodes];
  uint64_t v11 = [v10 count] - 1;

  uint64_t v30 = v11;
  [v8 bounds];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  v16 = [(_UIContextMenuStackedHierarchyLayout *)self _metrics];
  v17 = [v8 submenus];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __107___UIContextMenuStackedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke;
  v20[3] = &unk_1E52FC7B0;
  BOOL v28 = a3;
  CGFloat v24 = width;
  CGFloat v25 = height;
  id v18 = v8;
  id v21 = v18;
  v23 = v29;
  uint64_t v26 = v13;
  uint64_t v27 = v15;
  id v19 = v16;
  id v22 = v19;
  [v17 enumerateNodes:v20];

  _Block_object_dispose(v29, 8);
}

- (void)navigateDownFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v31 = a5;
  id v12 = a6;
  uint64_t v13 = [(_UIContextMenuStackedHierarchyLayout *)self menuView];
  uint64_t v14 = [v10 listView];
  uint64_t v15 = [v11 listView];
  v16 = [v15 displayedMenu];
  v17 = [v14 cellForElement:v16];

  [v14 setUserInteractionEnabled:0];
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x4010000000;
  v57[3] = &unk_186D7DBA7;
  long long v58 = 0u;
  long long v59 = 0u;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x4010000000;
  v54[3] = &unk_186D7DBA7;
  long long v55 = 0u;
  long long v56 = 0u;
  id v18 = [v15 window];

  if (!v18)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke;
    v46[3] = &unk_1E52FC7D8;
    id v47 = v13;
    id v48 = v15;
    id v49 = v17;
    v52 = v57;
    id v50 = v11;
    v53 = v54;
    id v51 = v14;
    +[UIView _performWithoutRetargetingAnimations:v46];
  }
  v29 = v12;
  uint64_t v30 = v10;
  char v19 = [v13 retainHighlightOnMenuNavigation];
  v20 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.2];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_2;
  v41[3] = &unk_1E52DC3F8;
  char v45 = v19;
  id v21 = v14;
  id v42 = v21;
  id v43 = v15;
  id v22 = v17;
  id v44 = v22;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_4;
  v39[3] = &unk_1E52DA9D0;
  id v23 = v43;
  id v40 = v23;
  +[UIView _animateUsingSpringBehavior:v20 tracking:0 animations:v41 completion:v39];

  CGFloat v24 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.85 response:0.4];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_5;
  v32[3] = &unk_1E52FC800;
  id v25 = v21;
  id v33 = v25;
  id v26 = v31;
  id v36 = v26;
  id v27 = v13;
  id v34 = v27;
  v37 = v57;
  v38 = v54;
  id v28 = v23;
  id v35 = v28;
  +[UIView _animateUsingSpringBehavior:v24 tracking:0 animations:v32 completion:0];

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(v57, 8);
}

- (void)navigateUpFromNode:(id)a3 toNode:(id)a4 alongsideAnimations:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [(_UIContextMenuStackedHierarchyLayout *)self menuView];
  uint64_t v15 = [v13 listView];

  v16 = [v12 listView];

  LODWORD(v12) = [v14 retainHighlightOnMenuNavigation];
  v17 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.5];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke;
  v34[3] = &unk_1E52DC3D0;
  id v18 = v15;
  id v35 = v18;
  char v37 = (char)v12;
  id v36 = v16;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_3;
  v32[3] = &unk_1E52DA9D0;
  id v19 = v36;
  id v33 = v19;
  +[UIView _animateUsingSpringBehavior:v17 tracking:0 animations:v34 completion:v32];

  if (v12)
  {
    v20 = [v18 displayedMenu];
    id v21 = [v19 indexPathForElement:v20];

    [v19 highlightItemAtIndexPath:v21];
  }
  id v22 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:1.0 response:0.4];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_4;
  v27[3] = &unk_1E52FC828;
  id v28 = v19;
  id v29 = v14;
  id v30 = v18;
  id v31 = v10;
  id v23 = v18;
  id v24 = v14;
  id v25 = v10;
  id v26 = v19;
  +[UIView _animateUsingSpringBehavior:v22 tracking:0 animations:v27 completion:v11];
}

- (id)_metrics
{
  long long v2 = [(_UIContextMenuStackedHierarchyLayout *)self menuView];
  v3 = [v2 traitCollection];
  id v4 = _UIContextMenuGetPlatformMetrics([v3 userInterfaceIdiom]);

  return v4;
}

- (_UIContextMenuView)menuView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_menuView);
  return (_UIContextMenuView *)WeakRetained;
}

- (void)setMenuView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end