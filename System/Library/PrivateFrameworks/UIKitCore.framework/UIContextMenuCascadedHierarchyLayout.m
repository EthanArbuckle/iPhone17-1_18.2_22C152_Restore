@interface UIContextMenuCascadedHierarchyLayout
@end

@implementation UIContextMenuCascadedHierarchyLayout

void __108___UIContextMenuCascadedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) traitCollection];
  v5 = _UIContextMenuGetPlatformMetrics([v4 userInterfaceIdiom]);

  v6 = [v3 listView];
  objc_msgSend(*(id *)(a1 + 40), "_submenuOffsetForCascadingLeft:", objc_msgSend(v3, "leftOfParentWhenCascading"));
  double v138 = v7;
  double v9 = v8;
  double v11 = v10;
  [v6 nativeContentSize];
  if (*(unsigned char *)(a1 + 72))
  {
    double v14 = v9;
    rect = v5;
    v15 = *(void **)(a1 + 32);
    v140 = [v3 menu];
    __int16 v16 = [v140 metadata];
    v135 = [v3 menu];
    int v17 = [v135 metadata];
    v133 = [v3 menu];
    uint64_t v18 = [v133 metadata];
    v19 = [*(id *)(a1 + 32) traitCollection];
    uint64_t v20 = [v19 userInterfaceIdiom];
    id v21 = v15;
    v22 = _UIContextMenuGetPlatformMetrics(v20);
    [v22 defaultMenuWidth];
    double v24 = v23;
    int v25 = [v22 leadingIndentationContributesToWidth];
    double v26 = 0.0;
    double v27 = 0.0;
    if ((v16 & 0x100) != 0 && v25)
    {
      v28 = _UIContextMenuGetPlatformMetrics(v20);
      [v28 leadingIndentationWidth];
      double v27 = v29;
    }
    double v30 = v24 + v27;
    if ((v17 & 0x10000) != 0)
    {
      v31 = _UIContextMenuGetPlatformMetrics(v20);
      [v31 menuGutterWidth];
      double v26 = v32;
    }
    double v33 = v30 + v26;
    if ((v18 & 0x100000000) != 0)
    {
      [v22 largePaletteWidthExtension];
      double v33 = v33 + v34;
    }
    if (v21)
    {
      v35 = [v21 traitCollection];
      v36 = [v35 preferredContentSizeCategory];
      int IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v36, v37);

      if (IsAccessibilityContentSizeCategory)
      {
        [v21 bounds];
        double Width = CGRectGetWidth(v153);
        double v40 = _UIContextMenuDefaultContentSpacing(v21);
        double v41 = Width - (v40 + v40);
        v42 = [v21 traitCollection];
        uint64_t v43 = [v42 userInterfaceIdiom];

        if (v43)
        {
          double v33 = 343.0;
        }
        else
        {
          v45 = [v21 _screen];
          [v45 _referenceBounds];
          double v46 = CGRectGetWidth(v154);
          double v47 = _UIContextMenuDefaultContentSpacing(v21);
          double v33 = v46 - (v47 + v47);
        }
        if (v41 < v33) {
          double v33 = v41;
        }
      }
    }

    double v48 = *(double *)(a1 + 56);
    if (v48 >= v33) {
      double v48 = v33;
    }
    objc_msgSend(v6, "preferredContentSizeWithinContainerSize:", v48, *(double *)(a1 + 64));
    double v50 = v49;
    double v52 = v51;
    v5 = rect;
    [rect menuMaximumHeight];
    if (v52 >= v53) {
      double v44 = v53;
    }
    else {
      double v44 = v52;
    }
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    double v9 = v14;
    int v54 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v125 = _UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled)
      {
        while (v54 >= v125)
        {
          _UIInternalPreferenceSync(v54, &_UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled, @"ContextMenuScrollTruncationDetentsEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v125 = _UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled;
          if (v54 == _UIInternalPreference_ContextMenuScrollTruncationDetentsEnabled) {
            goto LABEL_66;
          }
        }
        if (byte_1E8FD4EFC)
        {
          [v6 closestScrollTruncationDetentToHeight:v44];
          double v44 = v126;
        }
LABEL_66:
        v5 = rect;
      }
    }
    double v141 = v50;
    objc_msgSend(v6, "setNativeContentSize:", v50, v44);
  }
  else
  {
    double v44 = v13;
    double v141 = v12;
  }
  [v6 center];
  v55 = [v6 layer];
  [v55 anchorPoint];
  double v57 = v56;
  double v59 = v58;

  [*(id *)(a1 + 32) _rectOfNodeParentElement:v3];
  CGFloat recta = v63;
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    CGFloat v64 = v60;
    CGFloat v65 = v61;
    CGFloat v66 = v62;
    double v132 = v9;
    double v134 = v11;
    [*(id *)(a1 + 40) _cascadingAreaBounds];
    v129.size.width = v69;
    v129.size.height = v70;
    v129.origin.x = v67;
    v129.origin.y = v68;
    if (*(unsigned char *)(a1 + 72))
    {
      CGFloat v71 = v70;
      CGFloat v72 = v67;
      CGFloat v127 = v66;
      double v73 = v65;
      CGFloat v74 = v64;
      CGFloat v75 = v68;
      CGFloat v76 = v69;
      double MinY = CGRectGetMinY(*(CGRect *)&v67);
      v155.origin.x = v72;
      v155.origin.y = v75;
      v155.size.width = v76;
      v155.size.height = v71;
      double v77 = CGRectGetMaxY(v155) - v44;
      CGFloat v128 = v74;
      v156.origin.x = v74;
      CGFloat v65 = v73;
      CGFloat v66 = v127;
      v156.origin.y = v65;
      v156.size.width = recta;
      v156.size.height = v127;
      double v78 = fmax(MinY, fmin(v77, CGRectGetMinY(v156)));
      v157.origin.x = v72;
      double v79 = v78;
      v157.origin.y = v75;
      v157.size.width = v76;
      v157.size.height = v71;
      double v80 = CGRectGetMaxY(v157) - v79;
      if (v44 >= v80) {
        CGFloat v81 = v80;
      }
      else {
        CGFloat v81 = v44;
      }
      if (objc_msgSend(v3, "leftOfParentWhenCascading", *(void *)&v127))
      {
        v158.origin.x = 0.0;
        v158.origin.y = 0.0;
        CGFloat v82 = v141;
        v158.size.width = v141;
        v158.size.height = v81;
        double v83 = v138 + CGRectGetWidth(v158);
      }
      else
      {
        CGFloat v82 = v141;
        double v83 = -v138;
      }
      v162.origin.x = 0.0;
      v162.origin.y = 0.0;
      v162.size.width = v82;
      v162.size.height = v81;
      double v137 = v83 / CGRectGetWidth(v162);
      CGFloat v64 = v128;
      v163.origin.x = v128;
      v163.origin.y = v65;
      v163.size.width = recta;
      v163.size.height = v66;
      CGFloat v103 = CGRectGetMidY(v163) - v79;
      v164.origin.x = 0.0;
      v164.origin.y = 0.0;
      CGFloat v142 = v82;
      v164.size.width = v82;
      v164.size.height = v81;
      double v130 = 0.0;
      double v131 = 0.0;
      double v59 = v103 / CGRectGetHeight(v164);
    }
    else
    {
      double v137 = v57;
      [v6 bounds];
      double v130 = v99;
      double v131 = v100;
      CGFloat v142 = v101;
      CGFloat v81 = v102;
    }
    [v6 bounds];
    double v104 = CGRectGetWidth(v165);
    int v105 = [v3 leftOfParentWhenCascading];
    CGFloat v106 = v64;
    CGFloat v107 = v65;
    CGFloat v108 = recta;
    CGFloat v109 = v66;
    if (v105) {
      double v110 = CGRectGetMinX(*(CGRect *)&v106) - v138;
    }
    else {
      double v110 = v138 + CGRectGetMaxX(*(CGRect *)&v106);
    }
    if ([v3 leftOfParentWhenCascading])
    {
      double v111 = v104 + CGRectGetMinX(v129);
      if (v110 >= v111) {
        double v111 = v110;
      }
    }
    else
    {
      double v111 = CGRectGetMaxX(v129) - v104;
      if (v110 < v111) {
        double v111 = v110;
      }
    }
    double v139 = v111;
    v166.origin.x = v64;
    v166.origin.y = v65;
    v166.size.width = recta;
    v166.size.height = v66;
    double v11 = v134;
    double v97 = v132 + CGRectGetMidY(v166);
    double v93 = v142;
    double v94 = v59;
    double v98 = v130;
    double v96 = v131;
    double v92 = v81;
  }
  else
  {
    v84 = [*(id *)(a1 + 32) layer];
    [v84 anchorPoint];
    double v86 = v85;
    double v88 = v87;

    [v6 nativeContentSize];
    double v90 = v89;
    [*(id *)(a1 + 32) bounds];
    double Height = CGRectGetHeight(v159);
    if (v90 >= Height) {
      double v92 = Height;
    }
    else {
      double v92 = v90;
    }
    double v93 = v141;
    double v137 = v86;
    v160.origin.x = 0.0;
    v160.origin.y = 0.0;
    v160.size.width = v141;
    v160.size.height = v92;
    double v139 = v141 * 0.5 + 0.0 + (v86 + -0.5) * CGRectGetWidth(v160);
    double v94 = v88;
    double v95 = v88 + -0.5;
    double v96 = 0.0;
    v161.origin.x = 0.0;
    v161.origin.y = 0.0;
    v161.size.width = v141;
    v161.size.height = v92;
    double v97 = v95 * CGRectGetHeight(v161) + v92 * 0.5 + 0.0;
    double v98 = 0.0;
  }
  uint64_t v112 = [*(id *)(a1 + 32) hoveredListView];
  if (v6 == (void *)v112)
  {

LABEL_57:
    double v117 = 1.0;
    goto LABEL_58;
  }
  v113 = (void *)v112;
  v114 = [*(id *)(a1 + 32) submenus];
  v115 = [v114 nodes];
  if ((unint64_t)[v115 count] <= 1)
  {

    goto LABEL_57;
  }
  int v116 = [v5 applySubmenuScaling];

  if (v116) {
    double v117 = 0.99;
  }
  else {
    double v117 = 1.0;
  }
LABEL_58:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __108___UIContextMenuCascadedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke_2;
  aBlock[3] = &unk_1E52DA520;
  id v118 = v6;
  id v148 = v118;
  double v149 = v137;
  double v150 = v94;
  double v151 = v139;
  double v152 = v97;
  v119 = (void (**)(void))_Block_copy(aBlock);
  if ([*(id *)(a1 + 40) isAnimatingMenuAddition]
    && ([*(id *)(a1 + 32) currentListView],
        id v120 = (id)objc_claimAutoreleasedReturnValue(),
        v120,
        v118 == v120))
  {
    +[UIView performWithoutAnimation:v119];
  }
  else
  {
    v119[2](v119);
  }
  objc_msgSend(v118, "setBounds:", v98, v96, v93, v92);
  [v118 bounds];
  objc_msgSend(v118, "setVisibleContentSize:", v121, v122);
  CGAffineTransformMakeScale(&v146, v117, v117);
  CGAffineTransform v145 = v146;
  [v118 setTransform:&v145];
  double v123 = v11 * (double)*(unint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  v124 = [v118 layer];
  [v124 setZPosition:v123];

  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
}

uint64_t __108___UIContextMenuCascadedHierarchyLayout_performLayoutForComputingPreferredContentSize_withMaxContainerSize___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  v4 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v4, "setAnchorPoint:", v2, v3);

  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(void **)(a1 + 32);
  return objc_msgSend(v7, "setCenter:", v5, v6);
}

void __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke(id *a1)
{
  [a1[4] addSubview:a1[5]];
  [a1[4] _rectOfNodeParentElement:a1[6]];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v10 = [a1[4] window];
  [a1[5] bounds];
  double Width = CGRectGetWidth(v30);
  [a1[7] _cascadingAreaBounds];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_2;
  aBlock[3] = &unk_1E5305130;
  void aBlock[4] = a1[7];
  *(double *)&aBlock[5] = v3;
  *(double *)&aBlock[6] = v5;
  *(double *)&aBlock[7] = v7;
  *(double *)&aBlock[8] = v9;
  *(double *)&aBlock[9] = Width;
  aBlock[10] = v12;
  aBlock[11] = v13;
  aBlock[12] = v14;
  aBlock[13] = v15;
  __int16 v16 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
  int v17 = v16[2](v16, 1);
  uint64_t v18 = v16[2](v16, 2);
  uint64_t v19 = v18;
  if (v17 && v18)
  {
    uint64_t v19 = objc_msgSend(a1[8], "leftOfParentWhenCascading", v18);
  }
  else if (((v18 | v17) & 1) == 0)
  {
    objc_msgSend(a1[4], "convertRect:toView:", v10, v3, v5, v7, v9);
    CGFloat x = v31.origin.x;
    CGFloat y = v31.origin.y;
    CGFloat v22 = v31.size.width;
    CGFloat height = v31.size.height;
    double MinX = CGRectGetMinX(v31);
    [v10 bounds];
    double v25 = CGRectGetWidth(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.width = v22;
    v33.size.CGFloat height = height;
    uint64_t v19 = MinX > v25 - CGRectGetMaxX(v33);
  }
  [a1[6] setLeftOfParentWhenCascading:v19];
  objc_msgSend(a1[5], "setBounds:", 0.0, 0.0, Width, 44.0);
  CGAffineTransformMakeScale(&v28, 0.2, 0.2);
  id v26 = a1[5];
  CGAffineTransform v27 = v28;
  [v26 setTransform:&v27];
  [a1[5] setShadowAlpha:0.0];
  [a1[5] setAlpha:0.0];
}

BOOL __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _submenuOffsetForCascadingLeft:a2 == 2];
  double v5 = v4;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  if (a2 == 2)
  {
    CGFloat v10 = CGRectGetMinX(*(CGRect *)&v6) - v5 - *(double *)(a1 + 72);
    return v10 > CGRectGetMinX(*(CGRect *)(a1 + 80));
  }
  else
  {
    CGFloat v12 = v5 + CGRectGetMaxX(*(CGRect *)&v6) + *(double *)(a1 + 72);
    return v12 < CGRectGetMaxX(*(CGRect *)(a1 + 80));
  }
}

void __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_3(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_4;
  v8[3] = &unk_1E52D9F70;
  id v9 = *(id *)(a1 + 32);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);
}

uint64_t __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(void **)(a1 + 32);
  return [v2 setShadowAlpha:1.0];
}

void __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v11.minimum;
  float maximum = v11.maximum;
  float preferred = v11.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_6;
  v8[3] = &unk_1E52DCA58;
  void v8[4] = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);
}

uint64_t __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsAnimatingMenuAddition:1];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, 1);
  }
  [*(id *)(a1 + 40) setNeedsLayout];
  [*(id *)(a1 + 40) layoutIfNeeded];
  double v3 = *(void **)(a1 + 32);
  return [v3 setIsAnimatingMenuAddition:0];
}

uint64_t __100___UIContextMenuCascadedHierarchyLayout_navigateDownFromNode_toNode_alongsideAnimations_completion___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) didCompleteMenuAppearanceAnimation];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __98___UIContextMenuCascadedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v11.minimum;
  float maximum = v11.maximum;
  float preferred = v11.preferred;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98___UIContextMenuCascadedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_2;
  v8[3] = &unk_1E52DA160;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v8, v5, v6, v7);
}

void __98___UIContextMenuCascadedHierarchyLayout_navigateUpFromNode_toNode_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) listView];
  CGAffineTransformMakeScale(&v5, 0.2, 0.2);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  [v2 setAlpha:0.0];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 2);
  }
}

@end