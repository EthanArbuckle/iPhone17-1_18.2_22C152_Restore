@interface UIContextMenuStackedHierarchyLayout
@end

@implementation UIContextMenuStackedHierarchyLayout

void __56___UIContextMenuStackedHierarchyLayout_encompassingSize__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(CGRect **)(*(void *)(a1 + 32) + 8);
  id v8 = [a2 listView];
  [v8 frame];
  v10.origin.x = v4;
  v10.origin.y = v5;
  v10.size.width = v6;
  v10.size.height = v7;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(v3[1], v10);
}

void __107___UIContextMenuStackedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CGFloat v4 = [v3 listView];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&v44.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&v44.c = v5;
  *(_OWORD *)&v44.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 nativeContentSize];
  if (*(unsigned char *)(a1 + 88))
  {
    objc_msgSend(v4, "preferredContentSizeWithinContainerSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v9 = v8;
    double v11 = v10;
    objc_msgSend(v4, "setNativeContentSize:");
  }
  else
  {
    double v9 = v6;
    double v11 = v7;
  }
  [*(id *)(a1 + 32) _rectOfNodeParentElement:v3];
  double y = v45.origin.y;
  BOOL IsNull = CGRectIsNull(v45);
  uint64_t v14 = [*(id *)(a1 + 32) attachmentEdge];
  double v15 = 0.0;
  if (v14 == 4) {
    double v15 = *(double *)(a1 + 80);
  }
  double v16 = 1.0;
  if ([*(id *)(a1 + 40) applySubmenuScaling]) {
    double v16 = fmax(fmin(pow(0.97, (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)), 1.0), 0.5);
  }
  v17 = [*(id *)(a1 + 32) submenus];
  v18 = [v17 nodes];
  uint64_t v19 = [v18 count];
  uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  if (IsNull)
  {
    if (*(unsigned char *)(a1 + 88)) {
      goto LABEL_32;
    }
    if (v14 != 4)
    {
      double v21 = *(double *)(a1 + 80);
LABEL_26:
      double v29 = v15;
      double v15 = v21 - v15;
      goto LABEL_27;
    }
  }
  else
  {
    unint64_t v22 = v19 + ~v20;
    double v23 = (double)v22 * 12.0;
    double v24 = y + -12.0;
    if (*(unsigned char *)(a1 + 88))
    {
      if (v14 == 4)
      {
        double v25 = v11 + v24;
        double v26 = *(double *)(a1 + 80) - v23;
        if (v25 >= v26) {
          double v15 = v26;
        }
        else {
          double v15 = v25;
        }
      }
      else if (v24 >= v23)
      {
        double v15 = y + -12.0;
      }
      else
      {
        double v15 = (double)v22 * 12.0;
      }
      goto LABEL_32;
    }
    if (v14 != 4)
    {
      double v21 = *(double *)(a1 + 80);
      double v15 = fmax(v23, fmin(v24, v21 - v11));
      goto LABEL_26;
    }
    double v27 = v11 + v24;
    double v28 = *(double *)(a1 + 80) - v23;
    if (v27 >= v28) {
      double v15 = v28;
    }
    else {
      double v15 = v27;
    }
  }
  double v29 = v15;
LABEL_27:
  if (v11 >= v15 / v16) {
    double v11 = v15 / v16;
  }
  objc_msgSend(v4, "setVisibleContentSize:", v9, v11);
  if (v11 >= *(double *)(a1 + 80) / v16) {
    double v11 = *(double *)(a1 + 80) / v16;
  }
  double v15 = v29;
LABEL_32:
  CGAffineTransformMakeScale(&v44, v16, v16);
  v30 = [*(id *)(a1 + 32) layer];
  [v30 anchorPoint];
  UIRoundToScale(v31, 2.0);
  double v33 = v32;
  if (v14 == 4) {
    double v34 = 1.0;
  }
  else {
    double v34 = 0.0;
  }

  double v35 = v33 * *(double *)(a1 + 72);
  v36 = [v4 layer];
  objc_msgSend(v36, "setAnchorPoint:", v33, v34);

  CGAffineTransform v43 = v44;
  [v4 setTransform:&v43];
  objc_msgSend(v4, "setBounds:", 0.0, 0.0, v9, v11);
  objc_msgSend(v4, "setCenter:", v35, v15);
  [*(id *)(a1 + 40) stackedSubmenuOffset];
  double v38 = v37;
  v39 = [*(id *)(a1 + 32) submenus];
  v40 = [v39 nodes];
  double v41 = v38
      * (double)(unint64_t)([v40 count]
                                 - *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  v42 = [v4 layer];
  [v42 setZPosition:v41];

  --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addSubview:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 40) setShadowAlpha:0.0];
  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _rectOfNodeParentElement:*(void *)(a1 + 56)];
    id v3 = *(void **)(*(void *)(a1 + 72) + 8);
    v3[4] = v4;
    v3[5] = v5;
    v3[6] = v6;
    v3[7] = v7;
    double v8 = *(CGRect **)(*(void *)(a1 + 72) + 8);
    [*(id *)(a1 + 64) frame];
    v41.origin.x = v9;
    v41.origin.double y = v10;
    v41.size.width = v11;
    v41.size.height = v12;
    *(CGRect *)(*(void *)(*(void *)(a1 + 80) + 8) + 32) = CGRectIntersection(v8[1], v41);
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 80) + 8) + 56));
    v13 = *(double **)(*(void *)(a1 + 80) + 8);
    [*(id *)(a1 + 64) frame];
    CGFloat v15 = v14;
    CGFloat rect_8 = v14;
    CGFloat rect_16 = v16;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v21 = v13[4];
    CGFloat v22 = v13[5];
    CGFloat rect = v21;
    CGFloat v23 = v13[6];
    CGFloat v24 = v13[7];
    double v25 = [*(id *)(a1 + 32) _screen];
    [v25 scale];
    double v27 = 0.5 / v26;

    v37.origin.x = v21;
    v37.origin.double y = v22;
    v37.size.width = v23;
    v37.size.height = v24;
    double MinY = CGRectGetMinY(v37);
    v38.origin.x = v15;
    v38.origin.double y = v18;
    v38.size.width = v20;
    v38.size.height = rect_16;
    BOOL v29 = vabdd_f64(MinY, CGRectGetMinY(v38)) <= v27;
    v39.origin.x = rect;
    v39.origin.double y = v22;
    v39.size.width = v23;
    v39.size.height = v24;
    double MaxY = CGRectGetMaxY(v39);
    v40.origin.x = rect_8;
    v40.origin.double y = v18;
    v40.size.width = v20;
    v40.size.height = rect_16;
    if (vabdd_f64(MaxY, CGRectGetMaxY(v40)) <= v27) {
      uint64_t v31 = v29 | 4;
    }
    else {
      uint64_t v31 = v29;
    }
    [*(id *)(a1 + 40) setRoundedEdges:v31];
    double v32 = *(void **)(a1 + 40);
    return [v32 layoutIfNeeded];
  }
  return result;
}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v13.minimum;
  float maximum = v13.maximum;
  float preferred = v13.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_3;
  v8[3] = &unk_1E52DC3F8;
  char v12 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);
}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56)) {
    [*(id *)(a1 + 32) highlightItemAtIndexPath:0];
  }
  [*(id *)(a1 + 40) setShadowAlpha:1.0];
  [*(id *)(a1 + 40) setRoundedEdges:5];
  id v4 = [*(id *)(a1 + 48) contentView];
  v2 = *(void **)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) backgroundMaterialGroupName];
  [v2 setSubmenuTitleViewExpanded:1 withMaterialGroupName:v3 associatedCellContentView:v4 highlighted:*(unsigned __int8 *)(a1 + 56)];
}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) collectionView];
  [v1 flashScrollIndicators];
}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v14.minimum;
  float maximum = v14.maximum;
  float preferred = v14.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_6;
  v8[3] = &unk_1E52FC800;
  id v9 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  long long v13 = *(_OWORD *)(a1 + 64);
  id v11 = *(id *)(a1 + 48);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);
}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setEmphasized:0];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  [*(id *)(a1 + 40) setNeedsLayout];
  [*(id *)(a1 + 40) layoutIfNeeded];
  if (!CGRectIsEmpty(*(CGRect *)(*(void *)(*(void *)(a1 + 64) + 8) + 32)))
  {
    double MinY = CGRectGetMinY(*(CGRect *)(*(void *)(*(void *)(a1 + 64) + 8) + 32));
    double v4 = CGRectGetMinY(*(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32));
    if (vabdd_f64(MinY, v4) >= 2.22044605e-16)
    {
      double v5 = MinY - v4;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_7;
      v9[3] = &unk_1E52D9CD0;
      id v10 = *(id *)(a1 + 48);
      double v11 = v5;
      +[UIView _performWithoutRetargetingAnimations:v9];
      double v6 = [*(id *)(a1 + 48) collectionView];
      long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      v8[0] = *MEMORY[0x1E4F1DAB8];
      v8[1] = v7;
      v8[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      [v6 setTransform:v8];
    }
  }
}

void __99___UIContextMenuStackedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_7(uint64_t a1)
{
  CGAffineTransformMakeTranslation(&v4, 0.0, *(CGFloat *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) collectionView];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

void __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v12.minimum;
  float maximum = v12.maximum;
  float preferred = v12.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_2;
  _OWORD v8[3] = &unk_1E52DC3D0;
  id v9 = *(id *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 48);
  id v10 = *(id *)(a1 + 40);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);
}

void __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setShadowAlpha:0.0];
  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) highlightItemAtIndexPath:0];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) backgroundMaterialGroupName];
  [v2 setSubmenuTitleViewExpanded:0 withMaterialGroupName:v3 associatedCellContentView:0 highlighted:*(unsigned __int8 *)(a1 + 48)];
}

uint64_t __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setUserInteractionEnabled:1];
}

void __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_4(id *a1)
{
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v13.minimum;
  float maximum = v13.maximum;
  float preferred = v13.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_5;
  _OWORD v8[3] = &unk_1E52FC828;
  id v9 = a1[4];
  id v12 = a1[7];
  id v10 = a1[5];
  id v11 = a1[6];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);
}

void __97___UIContextMenuStackedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v54[0] = *MEMORY[0x1E4F1DAB8];
  v54[1] = v3;
  v54[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v54];
  [*(id *)(a1 + 32) setEmphasized:1];
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 2);
  }
  [*(id *)(a1 + 40) setNeedsLayout];
  [*(id *)(a1 + 40) layoutIfNeeded];
  double v5 = *(void **)(a1 + 32);
  double v6 = [*(id *)(a1 + 48) displayedMenu];
  double v7 = [v5 cellForElement:v6];

  if (v7)
  {
    double v8 = [v7 superview];
    [v7 frame];
    objc_msgSend(v8, "convertRect:toView:", *(void *)(a1 + 40));
    CGFloat v10 = v9;
    CGFloat v48 = v11;
    CGFloat v49 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat rect_24 = v15;
    CGFloat v47 = v13;
    CGFloat v16 = v15;

    [*(id *)(a1 + 32) frame];
    v63.origin.CGFloat x = v17;
    v63.origin.CGFloat y = v18;
    v63.size.CGFloat width = v19;
    v63.size.CGFloat height = v20;
    v55.origin.CGFloat x = v10;
    v55.origin.CGFloat y = v12;
    v55.size.CGFloat width = v14;
    v55.size.CGFloat height = v16;
    CGRect v56 = CGRectIntersection(v55, v63);
    CGFloat x = v56.origin.x;
    CGFloat y = v56.origin.y;
    CGFloat width = v56.size.width;
    CGFloat height = v56.size.height;
    objc_msgSend(*(id *)(a1 + 48), "setFrame:");
    [*(id *)(a1 + 32) frame];
    CGFloat v26 = v25;
    CGFloat rect = v25;
    CGFloat rect_8 = v27;
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    double v32 = [*(id *)(a1 + 40) _screen];
    [v32 scale];
    double v34 = 0.5 / v33;

    v57.origin.CGFloat x = x;
    CGFloat rect_16 = x;
    v57.origin.CGFloat y = y;
    v57.size.CGFloat width = width;
    v57.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v57);
    v58.origin.CGFloat x = v26;
    v58.origin.CGFloat y = v29;
    v58.size.CGFloat width = v31;
    v58.size.CGFloat height = rect_8;
    BOOL v35 = vabdd_f64(MinY, CGRectGetMinY(v58)) <= v34;
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v59);
    v60.origin.CGFloat x = rect;
    v60.origin.CGFloat y = v29;
    v60.size.CGFloat width = v31;
    v60.size.CGFloat height = rect_8;
    if (vabdd_f64(MaxY, CGRectGetMaxY(v60)) <= v34) {
      uint64_t v37 = v35 | 4;
    }
    else {
      uint64_t v37 = v35;
    }
    objc_msgSend(*(id *)(a1 + 48), "setRoundedEdges:", v37, *(void *)&MinY);
    [*(id *)(a1 + 48) layoutIfNeeded];
    v61.origin.CGFloat y = v48;
    v61.origin.CGFloat x = v49;
    v61.size.CGFloat height = rect_24;
    v61.size.CGFloat width = v47;
    double v38 = CGRectGetMinY(v61);
    v62.origin.CGFloat x = rect_16;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.CGFloat height = height;
    double v39 = CGRectGetMinY(v62);
    if (vabdd_f64(v38, v39) >= 2.22044605e-16)
    {
      CGAffineTransformMakeTranslation(&v53, 0.0, v38 - v39);
      CGRect v40 = [*(id *)(a1 + 48) collectionView];
      CGAffineTransform v52 = v53;
      [v40 setTransform:&v52];
    }
  }
  else
  {
    [*(id *)(a1 + 48) setAlpha:0.0];
    CGAffineTransformMakeScale(&v51, 0.2, 0.2);
    CGRect v41 = *(void **)(a1 + 48);
    CGAffineTransform v50 = v51;
    [v41 setTransform:&v50];
  }
}

@end