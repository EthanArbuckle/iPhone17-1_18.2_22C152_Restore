@interface UIContextMenuCollectionViewLayout
@end

@implementation UIContextMenuCollectionViewLayout

_UIContextMenuLayoutSection *___UIContextMenuCollectionViewLayout_block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  v134[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) sectionIdentifiers];
  v7 = [v6 objectAtIndexedSubscript:a2];

  v8 = [v5 traitCollection];
  uint64_t v9 = [v7 cellSizeGivenTraits:v8];

  uint64_t v10 = [*(id *)(a1 + 32) numberOfItemsInSection:v7];
  v11 = &off_1E52D2000;
  unint64_t v12 = 0x1E4F1C000uLL;
  unint64_t v129 = a2;
  if ([v7 layout] != 1)
  {
    v124 = v7;
    unint64_t v29 = 3;
    if (v9 != 1) {
      unint64_t v29 = 0;
    }
    if (!v9) {
      unint64_t v29 = 4;
    }
    if (v10 >= v29) {
      unint64_t v30 = v29;
    }
    else {
      unint64_t v30 = v10;
    }
    v31 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v125 = v10;
    v123 = v31;
    if (v30)
    {
      v128 = [MEMORY[0x1E4F1CA48] array];
      v32 = [v5 container];
      [v32 effectiveContentSize];
      double v34 = v33;

      uint64_t v35 = 0;
      double v36 = (double)(v30 >> 1);
      double v37 = (double)((int)v30 - 1);
      if ((v30 & 1) == 0) {
        double v36 = (double)((int)v30 - 1);
      }
      uint64_t v38 = v30;
      uint64_t v39 = (int)v36;
      uint64_t v126 = v38;
      double v40 = v34 / (double)v38;
      do
      {
        UIFloorToScale(v40, *(double *)(a1 + 64));
        if (v39 == v35) {
          double v42 = v34 - v41 * v37;
        }
        else {
          double v42 = v41;
        }
        v43 = _UIContextMenuSeparator(2, *(double *)(a1 + 72));
        v133 = v43;
        v44 = [*(id *)(v12 + 2424) arrayWithObjects:&v133 count:1];

        v45 = v11[356];
        v46 = [off_1E52D2B08 absoluteDimension:v42];
        v47 = [off_1E52D2B08 uniformAcrossSiblingsWithEstimate:*(double *)(a1 + 80)];
        v48 = [off_1E52D2B30 sizeWithWidthDimension:v46 heightDimension:v47];
        v49 = [v45 itemWithSize:v48 decorationItems:v44];
        [v128 addObject:v49];

        v11 = &off_1E52D2000;
        v50 = [MEMORY[0x1E4F28D58] indexPathForItem:v35 inSection:v129];
        [v31 addObject:v50];

        unint64_t v12 = 0x1E4F1C000;
        ++v35;
      }
      while (v126 != v35);
      v13 = [off_1E52D2B18 horizontalGroupWithLayoutSize:*(void *)(a1 + 48) subitems:v128];

      uint64_t v10 = v125;
      unint64_t v30 = v126;
    }
    else
    {
      v53 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a2];
      [v31 addObject:v53];

      v13 = 0;
    }
    uint64_t v54 = v10 - v30;
    if (v54 < 1)
    {
      v26 = 0;
    }
    else
    {
      v55 = v11[356];
      uint64_t v56 = *(void *)(a1 + 48);
      v57 = _UIContextMenuSeparator(1, *(double *)(a1 + 72));
      v132 = v57;
      v58 = [*(id *)(v12 + 2424) arrayWithObjects:&v132 count:1];
      v59 = [v55 itemWithSize:v56 decorationItems:v58];

      v26 = [off_1E52D2B18 verticalGroupWithLayoutSize:*(void *)(a1 + 48) repeatingSubitem:v59 count:v54];
      v60 = [off_1E52D2B38 fixedSpacing:*(double *)(a1 + 72)];
      [v26 setInterItemSpacing:v60];
    }
    v7 = v124;
    v61 = [MEMORY[0x1E4F1CA48] array];
    v62 = v61;
    if (v13)
    {
      [v61 addObject:v13];
      uint64_t v10 = v125;
      if (!v26) {
        goto LABEL_33;
      }
    }
    else
    {
      uint64_t v10 = v125;
      if (!v26)
      {
        if (os_variant_has_internal_diagnostics())
        {
          v122 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v122, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1853B0000, v122, OS_LOG_TYPE_FAULT, "Found repeated instances of the same menu element in the context menu, only one will be used. This is a client issue.", buf, 2u);
          }

          v7 = v124;
          v77 = &off_1E52D2000;
        }
        else
        {
          v76 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &kContextMenuSubmenuTitleHeader_block_invoke___s_category)+ 8);
          v77 = &off_1E52D2000;
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v76, OS_LOG_TYPE_ERROR, "Found repeated instances of the same menu element in the context menu, only one will be used. This is a client issue.", buf, 2u);
          }
        }
        v78 = v77[356];
        uint64_t v79 = *(void *)(a1 + 48);
        v80 = _UIContextMenuSeparator(1, *(double *)(a1 + 72));
        v131 = v80;
        v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v131 count:1];
        v82 = [v78 itemWithSize:v79 decorationItems:v81];

        [v62 addObject:v82];
        uint64_t v10 = v125;
        goto LABEL_33;
      }
    }
    [v62 addObject:v26];
LABEL_33:
    v63 = [_UIContextMenuLayoutSection alloc];
    v64 = [off_1E52D2B18 verticalGroupWithLayoutSize:*(void *)(a1 + 48) subitems:v62];
    v65 = v63;
    v66 = v123;
    v67 = [(_UIContextMenuLayoutSection *)v65 initWithLayoutGroup:v64 hiddenSeparatorIndexPaths:v123];

    [*(id *)(a1 + 40) sectionInsets];
    -[NSCollectionLayoutSection setContentInsets:](v67, "setContentInsets:");
    goto LABEL_48;
  }
  v13 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
  [*(id *)(a1 + 40) paletteMinimumItemSize];
  double v15 = v14;
  double v17 = v16;
  [v5 container];
  v18 = uint64_t v127 = a1;
  [v18 contentSize];
  double v20 = v19;

  [v13 _scaledValueForValue:v17];
  UIRoundToScale(v21, *(double *)(v127 + 64));
  double v23 = v22;
  if ([*(id *)(v127 + 40) enableFloatingFocusStyle])
  {
    v24 = [off_1E52D2B08 uniformAcrossSiblingsWithEstimate:v15];
    v25 = [off_1E52D2B08 uniformAcrossSiblingsWithEstimate:v23];
    v26 = [off_1E52D2B30 sizeWithWidthDimension:v24 heightDimension:v25];
    double v27 = 16.0;
    double v28 = 24.0;
  }
  else
  {
    if ([v7 preferredCellSize] == 2)
    {
      double v28 = 16.0;
      double v51 = floor((v20 + -16.0) / (v23 + 16.0));
      if (v51 >= (double)v10) {
        double v51 = (double)v10;
      }
      double v27 = fmax((v20 - v23 * (double)(int)v51) / (double)((int)v51 + 1), 16.0);
      double v52 = v23;
    }
    else
    {
      [v13 _scaledValueForValue:v15];
      UIRoundToScale(v68, *(double *)(v127 + 64));
      double v70 = v69;
      double v71 = floor(v20 / v69);
      if ((unint64_t)v10 < 4)
      {
        double v75 = v20 / (double)(v10 + 1);
      }
      else
      {
        [*(id *)(v127 + 40) dynamicImageBoxWidth];
        double v73 = v72 * 0.5;
        [*(id *)(v127 + 40) menuItemInternalPadding];
        double v75 = (v20 - (v73 + v74 + v73 + v74)) / (double)(v10 - 1);
        if (v75 < v70) {
          double v75 = v70;
        }
      }
      UIRoundToScale(v75, *(double *)(v127 + 64));
      double v83 = (double)v10;
      if (v71 <= (double)v10) {
        double v83 = v71;
      }
      double v28 = (v20 - v83 * v52) * 0.5;
      double v27 = 0.0;
    }
    v24 = [off_1E52D2B08 estimatedDimension:v52];
    v25 = [off_1E52D2B08 estimatedDimension:v23];
    v26 = [off_1E52D2B30 sizeWithWidthDimension:v24 heightDimension:v25];
  }

  uint64_t v84 = [off_1E52D2B20 itemWithLayoutSize:v26];
  v134[0] = v84;
  v85 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:1];
  v62 = [off_1E52D2B18 verticalGroupWithLayoutSize:v26 subitems:v85];

  v67 = [off_1E52D2B28 sectionWithGroup:v62];
  [(NSCollectionLayoutSection *)v67 setOrthogonalScrollingBehavior:1];
  -[NSCollectionLayoutSection setContentInsets:](v67, "setContentInsets:", 0.0, v28, 0.0, v28);
  a1 = v127;
  v86 = [*(id *)(v127 + 40) gradientMaskingConfiguration];
  [(NSCollectionLayoutSection *)v67 _setClipsContentToBounds:v86 != 0];

  v66 = (void *)v84;
  [(NSCollectionLayoutSection *)v67 setSupplementaryContentInsetsReference:1];
  [(NSCollectionLayoutSection *)v67 setInterGroupSpacing:v27];
LABEL_48:

  if (v10 >= 1)
  {
    v87 = [MEMORY[0x1E4F1CA48] array];
    if (([v7 isRoot] & 1) == 0)
    {
      v88 = [v7 title];
      uint64_t v89 = [v88 length];

      if (v89)
      {
        v90 = [off_1E52D2AF8 boundarySupplementaryItemWithLayoutSize:*(void *)(a1 + 48) elementKind:@"kContextMenuHeader" alignment:1];
        [v87 addObject:v90];
      }
    }
    v91 = [*(id *)(a1 + 32) sectionIdentifiers];
    unint64_t v92 = [v91 count] - 1;

    if (v92 > v129)
    {
      uint64_t v93 = a1;
      id v94 = v5;
      v95 = v7;
      if ([v7 wantsSectionSeparator]
        && ([*(id *)(v93 + 32) sectionIdentifiers],
            v96 = objc_claimAutoreleasedReturnValue(),
            [v96 objectAtIndexedSubscript:v129 + 1],
            v97 = objc_claimAutoreleasedReturnValue(),
            int v98 = [v97 wantsSectionSeparator],
            v97,
            v96,
            v98))
      {
        v99 = [off_1E52D2B08 fractionalWidthDimension:1.0];
        uint64_t v100 = v93;
        v101 = _UIContextMenuGetPlatformMetrics([*(id *)(v93 + 56) userInterfaceIdiom]);
        [v101 sectionSeparatorHeight];
        double v103 = v102;

        v104 = [off_1E52D2B08 absoluteDimension:v103];
        v105 = [off_1E52D2B30 sizeWithWidthDimension:v99 heightDimension:v104];

        v106 = [*(id *)(v100 + 40) gradientMaskingConfiguration];
        int v107 = [v106 backgroundMasksCorners];

        if (v107) {
          v108 = @"kContextMenuGradientMaskSectionSeparator";
        }
        else {
          v108 = @"kContextMenuSectionSeparator";
        }
        v109 = [off_1E52D2AF8 boundarySupplementaryItemWithLayoutSize:v105 elementKind:v108 alignment:5];
        v110 = _UIContextMenuGetPlatformMetrics([*(id *)(v100 + 56) userInterfaceIdiom]);
        [v110 sectionSeparatorInsets];
        double v112 = v111;
        double v114 = v113;
        double v116 = v115;
        double v118 = v117;

        objc_msgSend(v109, "setContentInsets:", v112, v114, v116, v118);
        if (v107) {
          [v109 setZIndex:-1];
        }
      }
      else
      {
        v119 = [off_1E52D2B08 fractionalWidthDimension:1.0];
        v120 = [off_1E52D2B08 absoluteDimension:*(double *)(v93 + 72)];
        v105 = [off_1E52D2B30 sizeWithWidthDimension:v119 heightDimension:v120];

        v109 = [off_1E52D2AF8 boundarySupplementaryItemWithLayoutSize:v105 elementKind:@"kContextMenuThinSectionSeparator" alignment:5];
      }
      id v5 = v94;

      [v87 addObject:v109];
      v7 = v95;
    }
    [(NSCollectionLayoutSection *)v67 setBoundarySupplementaryItems:v87];
  }
  return v67;
}

@end