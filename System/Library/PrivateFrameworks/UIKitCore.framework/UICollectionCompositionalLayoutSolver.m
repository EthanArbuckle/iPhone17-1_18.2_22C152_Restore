@interface UICollectionCompositionalLayoutSolver
@end

@implementation UICollectionCompositionalLayoutSolver

BOOL __110___UICollectionCompositionalLayoutSolver__validatedRoundedFrame_forElementOfCategory_atIndexPath_elementKind___block_invoke(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  if (CGRectIsInfinite(*(CGRect *)&a1)) {
    return 0;
  }
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  BOOL IsNull = CGRectIsNull(v11);
  BOOL result = 0;
  if (!IsNull && fabs(a1) != INFINITY && fabs(a2) != INFINITY && fabs(a3) != INFINITY)
  {
    double v10 = fabs(a4);
    return v10 > INFINITY || v10 < INFINITY;
  }
  return result;
}

uint64_t __85___UICollectionCompositionalLayoutSolver__layoutAttributesForElementsInRect_handler___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __85___UICollectionCompositionalLayoutSolver__layoutAttributesForElementsInRect_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  v3 = (id *)(id)[*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  double v4 = -[_UICollectionSectionSolutionBookmark contentInsetsOffset]((uint64_t)v3);
  double v6 = v5;
  double v7 = *(double *)(a1 + 64);
  double v8 = *(double *)(a1 + 72);
  double v9 = -[_UICollectionSectionSolutionBookmark sectionAuxiliaryContentInsetsOffset]((uint64_t)v3);
  double v124 = v10;
  double v125 = v9;
  if (v3)
  {
    id v11 = v3[1];
    double v131 = *((double *)v3 + 7);
    double v12 = *((double *)v3 + 9);
    double v133 = *((double *)v3 + 8);
    double v13 = *((double *)v3 + 10);
  }
  else
  {
    id v11 = 0;
    double v133 = 0.0;
    double v12 = 0.0;
    double v13 = 0.0;
    double v131 = 0.0;
  }
  double v14 = *(double *)(a1 + 64);
  double v15 = *(double *)(a1 + 72);
  v16 = [v11 layoutSection];
  int v17 = [v16 scrollsOrthogonally];

  double v128 = v6;
  double v129 = v4;
  double v126 = v8;
  double v127 = v7;
  double v122 = v15;
  double v123 = v14;
  if (v17)
  {
    uint64_t v18 = [v11 layoutAxis];
    [v11 contentFrameIncludingAuxiliaries];
    double v20 = v19;
    double v22 = v21;
    v23 = [v11 layoutSection];
    [v23 contentInsets];
    double v28 = _UITotalEdgeDimensionsForLayoutAxis(v18, v24, v25, v26, v27);

    double v29 = _UISizeClampToMinimumSizeForAxis(v18, v12, v13, v20, v22);
    double v31 = v30;
    double v32 = v29 + _UISetSizeValueForAxis(v18, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v28);
    double v130 = v31 + v33;
  }
  else
  {
    double v130 = v13;
    double v32 = v12;
  }
  double v34 = -[_UICollectionSectionSolutionBookmark contentInsetsOffset]((uint64_t)v3);
  double v35 = *(double *)(a1 + 80);
  double v36 = *(double *)(a1 + 88);
  CGFloat v37 = *(double *)(a1 + 96);
  CGFloat v38 = *(double *)(a1 + 104);
  CGFloat v39 = v35 - v34;
  CGFloat v41 = v36 - v40;
  v143.origin.double x = v35;
  v143.origin.double y = v36;
  v143.size.width = v37;
  v143.size.CGFloat height = v38;
  CGFloat Width = CGRectGetWidth(v143);
  v144.origin.double x = v35;
  v144.origin.double y = v36;
  v144.size.width = v37;
  v144.size.CGFloat height = v38;
  v145.size.CGFloat height = CGRectGetHeight(v144);
  v145.origin.double x = v39;
  v145.origin.double y = v41;
  v145.size.width = Width;
  v155.size.CGFloat height = v130;
  v155.origin.double x = v131;
  v155.origin.double y = v133;
  v155.size.width = v32;
  CGRect v146 = CGRectIntersection(v145, v155);
  double x = v146.origin.x;
  double y = v146.origin.y;
  CGFloat v45 = v146.size.width;
  CGFloat height = v146.size.height;
  v132 = v3;
  if (!CGRectIsEmpty(v146))
  {
    v147.origin.double x = x;
    v147.origin.double y = y;
    v147.size.width = v45;
    v147.size.CGFloat height = height;
    double v47 = CGRectGetWidth(v147);
    v148.origin.double x = x;
    v148.origin.double y = y;
    v148.size.width = v45;
    v148.size.CGFloat height = height;
    double v48 = CGRectGetHeight(v148);
    if (v3)
    {
      double v49 = *((double *)v3 + 3);
      double v50 = *((double *)v3 + 4);
    }
    else
    {
      double v50 = 0.0;
      double v49 = 0.0;
    }
    objc_msgSend(v11, "queryFramesIntersectingRect:frameOffset:", x - v131, y - v133, v47, v48, v49, v50, *(void *)&v122, *(void *)&v123);
    long long v137 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    id v51 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v52 = [v51 countByEnumeratingWithState:&v137 objects:v141 count:16];
    if (v52)
    {
      uint64_t v53 = v52;
      double v54 = v127 + v129;
      double v55 = v128 + v126;
      uint64_t v56 = *(void *)v138;
      id v134 = v51;
      do
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v138 != v56) {
            objc_enumerationMutation(v51);
          }
          uint64_t v58 = *(void *)(*((void *)&v137 + 1) + 8 * v57);
          if (v58)
          {
            uint64_t v59 = *(void *)(v58 + 32);
            if (v59 == 1)
            {
              double v60 = *(double *)(v58 + 64);
              double v61 = *(double *)(v58 + 72);
              CGFloat v62 = *(double *)(v58 + 80);
              CGFloat v63 = *(double *)(v58 + 88);
              v149.origin.double x = v60;
              v149.origin.double y = v61;
              v149.size.width = v62;
              v149.size.CGFloat height = v63;
              CGFloat v64 = CGRectGetWidth(v149);
              v150.origin.double x = v60;
              v150.origin.double y = v61;
              v150.size.width = v62;
              v150.size.CGFloat height = v63;
              CGFloat v65 = CGRectGetHeight(v150);
              v66 = [MEMORY[0x1E4F28D58] indexPathForItem:*(void *)(v58 + 16) inSection:a2];
              uint64_t v67 = *(void *)(a1 + 40);
              if (v67) {
                v68 = *(void **)(v67 + 208);
              }
              else {
                v68 = 0;
              }
              v69 = [v68 objectForKeyedSubscript:v66];
              if (!v69)
              {
                if (*(void *)(v58 + 24) == 0x7FFFFFFFFFFFFFFFLL) {
                  uint64_t v70 = 0;
                }
                else {
                  uint64_t v70 = *(void *)(v58 + 24);
                }
                v69 = -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForItemAtIndexPath:frame:zIndex:](*(void *)(a1 + 40), v66, v70, v54 + v60, v55 + v61, v64, v65);
              }
              (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
              goto LABEL_38;
            }
            if ((v59 & 0xFFFFFFFFFFFFFFFELL) != 2) {
              goto LABEL_39;
            }
            v71 = v11;
            id v72 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](*(void **)(*((void *)&v137 + 1) + 8 * v57));
            if (!v72)
            {
              v88 = [MEMORY[0x1E4F28B00] currentHandler];
              [v88 handleFailureInMethod:*(void *)(a1 + 112) object:*(void *)(a1 + 40) file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:2752 description:@"Failed to get the associated auxillary definition for this query result."];
            }
            id v73 = (id)[v72 elementKind];
            if (![v73 length])
            {
              v89 = [MEMORY[0x1E4F28B00] currentHandler];
              [v89 handleFailureInMethod:*(void *)(a1 + 112) object:*(void *)(a1 + 40) file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:2754 description:@"Failed to get the element kind from the supplementary."];
            }
            v66 = [MEMORY[0x1E4F28D58] indexPathForItem:*(void *)(v58 + 16) inSection:a2];
            uint64_t v74 = *(void *)(v58 + 32);
            if (v74 == 3)
            {
              double v82 = *(double *)(v58 + 64);
              double v83 = *(double *)(v58 + 72);
              CGFloat v84 = *(double *)(v58 + 80);
              CGFloat v85 = *(double *)(v58 + 88);
              v153.origin.double x = v82;
              v153.origin.double y = v83;
              v153.size.width = v84;
              v153.size.CGFloat height = v85;
              double v86 = CGRectGetWidth(v153);
              v154.origin.double x = v82;
              v154.origin.double y = v83;
              v154.size.width = v84;
              v154.size.CGFloat height = v85;
              double v87 = CGRectGetHeight(v154);
              v69 = -[_UICollectionCompositionalLayoutSolver _cachedDecorationAttributesForElementKind:indexPath:](*(void *)(a1 + 40), (uint64_t)v73, (uint64_t)v66);
              if (!v69)
              {
                uint64_t v81 = -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForDecorationItemAtIndexPath:elementKind:frame:additionalContentInset:zIndex:](*(void *)(a1 + 40), v66, v73, [v72 zIndex], v54 + v82, v55 + v83, v86, v87, 0.0, 0.0, 0.0, 0.0);
LABEL_35:
                v69 = (void *)v81;
              }
            }
            else if (v74 == 2)
            {
              double v75 = *(double *)(v58 + 64);
              double v76 = *(double *)(v58 + 72);
              CGFloat v77 = *(double *)(v58 + 80);
              CGFloat v78 = *(double *)(v58 + 88);
              v151.origin.double x = v75;
              v151.origin.double y = v76;
              v151.size.width = v77;
              v151.size.CGFloat height = v78;
              CGFloat v79 = CGRectGetWidth(v151);
              v152.origin.double x = v75;
              v152.origin.double y = v76;
              v152.size.width = v77;
              v152.size.CGFloat height = v78;
              CGFloat v80 = CGRectGetHeight(v152);
              v69 = -[_UICollectionCompositionalLayoutSolver _cachedSupplementaryAttributesForElementKind:indexPath:](*(void *)(a1 + 40), (uint64_t)v73, (uint64_t)v66);
              if (!v69)
              {
                uint64_t v81 = -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:elementKind:frame:zIndex:pinned:](*(void *)(a1 + 40), v66, v73, [v72 zIndex], *(unsigned __int8 *)(v58 + 8), v123 + v125 + v75, v124 + v122 + v76, v79, v80);
                goto LABEL_35;
              }
            }
            else
            {
              v69 = 0;
            }
            id v11 = v71;
            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            id v51 = v134;
LABEL_38:
          }
LABEL_39:
          if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
          {

            return;
          }
          ++v57;
        }
        while (v53 != v57);
        uint64_t v90 = [v51 countByEnumeratingWithState:&v137 objects:v141 count:16];
        uint64_t v53 = v90;
      }
      while (v90);
    }

    v3 = v132;
  }
  if (v3) {
    id v91 = v3[2];
  }
  else {
    id v91 = 0;
  }
  id v92 = (id)objc_msgSend(v91, "decorationItems", *(void *)&v122, *(void *)&v123);
  uint64_t v93 = [v92 count];
  if (v93 >= 1)
  {
    uint64_t v94 = v93;
    v95 = 0;
    id v135 = v92;
    do
    {
      while (1)
      {
        id v96 = (id)[v92 objectAtIndexedSubscript:v95];
        if ([v96 isBackgroundDecoration]) {
          break;
        }
        if ((uint64_t)++v95 >= v94) {
          return;
        }
      }
      v97 = [v96 elementKind];
      v98 = [MEMORY[0x1E4F28D58] indexPathForItem:v95 inSection:a2];
      v99 = -[_UICollectionCompositionalLayoutSolver _cachedDecorationAttributesForElementKind:indexPath:](*(void *)(a1 + 40), (uint64_t)v97, (uint64_t)v98);
      if (v99)
      {
        v100 = v99;
        [v99 frame];
        double v102 = v101;
        double v104 = v103;
        double v106 = v105;
        double v108 = v107;
      }
      else
      {
        double v102 = +[_UICollectionCompositionalLayoutSolver _globalFrameForBackgroundDecoration:forSectionWithBookmark:]((uint64_t)_UICollectionCompositionalLayoutSolver, v132);
        double v104 = v109;
        double v106 = v110;
        double v108 = v111;
        uint64_t v112 = *(void *)(a1 + 40);
        [v96 contentInsets];
        v100 = -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForDecorationItemAtIndexPath:elementKind:frame:additionalContentInset:zIndex:](v112, v98, v97, [v96 zIndex], v102, v104, v106, v108, v113, v114, v115, v116);
      }
      v117 = [_UICollectionLayoutFramesQueryResult alloc];
      v118 = (void *)[v96 zIndex];
      v119 = [MEMORY[0x1E4F29128] UUID];
      v120 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v117->super.isa, 0, v95, v118, (void *)3, v96, (void *)2, v119, v102, v104, v106, v108);

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      LODWORD(v118) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);

      ++v95;
      if (v118) {
        BOOL v121 = 0;
      }
      else {
        BOOL v121 = (uint64_t)v95 < v94;
      }
      id v92 = v135;
    }
    while (v121);
  }
}

uint64_t __76___UICollectionCompositionalLayoutSolver_layoutAttributesForElementsInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __101___UICollectionCompositionalLayoutSolver_extendedAttributesQueryIncludingOrthogonalScrollingRegions___block_invoke(uint64_t a1, _WORD *a2)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = (id)[a2 indexPath];
    if ((unint64_t)[v4 length] >= 2)
    {
      uint64_t v5 = [v4 section];
      if (*(void *)(a1 + 48) != v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)(a1 + 32);
        double v8 = v7 ? *(void **)(v7 + 88) : 0;
        int v9 = [v8 containsIndex:v6];
        if (a2)
        {
          if (v9)
          {
            __int16 v10 = a2[144];
            if ((v10 & 3) != 0)
            {
              if ((v10 & 2) == 0)
              {
                if (v10) {
                  return;
                }
                goto LABEL_15;
              }
              uint64_t v15 = *(void *)(a1 + 32);
              double v12 = [a2 indexPath];
              double v13 = -[UIBarButtonItemGroup _items]((id *)a2);
              char v14 = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:elementKind:](v15, v12, (uint64_t)v13);
            }
            else
            {
              uint64_t v11 = *(void *)(a1 + 32);
              double v12 = [a2 indexPath];
              double v13 = -[UIBarButtonItemGroup _items]((id *)a2);
              char v14 = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionSupplementaryShouldScrollWithContentForIndexPath:elementKind:](v11, v12, (uint64_t)v13);
            }
            char v16 = v14;

            if (v16) {
              return;
            }
          }
        }
      }
    }
  }
LABEL_15:
  int v17 = *(void **)(a1 + 40);
  [v17 addObject:a2];
}

void __154___UICollectionCompositionalLayoutSolver__updateResultNotingInsertedItemAndSectionAuxillaries_forVisibleGroupAuxillaryAttributesBeforeResolve_withUpdate___block_invoke(uint64_t a1, _WORD *a2, uint64_t a3, uint64_t a4)
{
  id v7 = (id)[a2 indexPath];
  if (a4 && (*(void *)(a4 + 32) & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    double v8 = v7;
    uint64_t v9 = *(void *)(a4 + 56);
    switch(v9)
    {
      case 2:
        if ((unint64_t)[v7 length] < 2) {
          return;
        }
        uint64_t v14 = [v8 section];
        if (v14 == 0x7FFFFFFFFFFFFFFFLL
          || [*(id *)(a1 + 32) initialSectionIndexForFinalSectionIndex:v14] != 0x7FFFFFFFFFFFFFFFLL)
        {
          return;
        }
        uint64_t v15 = *(void *)(a1 + 40);
        char v16 = -[UIBarButtonItemGroup _items]((id *)a2);
        if (a2) {
          BOOL v17 = (a2[144] & 3) == 0;
        }
        else {
          BOOL v17 = 0;
        }
        id v18 = v16;
        -[_UICollectionCompositionalLayoutSolverResolveResult addInsertedAuxillaryOfElementKind:atIndexPath:isSupplementary:](v15, v16, (uint64_t)v8, v17);
        break;
      case 3:
        +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)a2);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "addObject:");
        break;
      case 4:
        __int16 v10 = [*(id *)(a1 + 32) initialIndexPathForFinalIndexPath:v7];

        if (v10) {
          return;
        }
        uint64_t v11 = *(void *)(a1 + 40);
        -[UIBarButtonItemGroup _items]((id *)a2);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        double v12 = [a2 indexPath];
        if (a2) {
          BOOL v13 = (a2[144] & 3) == 0;
        }
        else {
          BOOL v13 = 0;
        }
        -[_UICollectionCompositionalLayoutSolverResolveResult addInsertedAuxillaryOfElementKind:atIndexPath:isSupplementary:](v11, v18, (uint64_t)v12, v13);

        break;
      default:
        return;
    }
  }
}

void __138___UICollectionCompositionalLayoutSolver__updateResultsNotingDeletedItemAndSectionAuxillaries_returningStartingGroupAuxillariesForUpdate___block_invoke(uint64_t a1, _WORD *a2, uint64_t a3, uint64_t a4)
{
  if (!a4 || (*(void *)(a4 + 32) & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return;
  }
  id v7 = (id)[a2 indexPath];
  double v8 = v7;
  uint64_t v9 = *(void *)(a4 + 56);
  if (v9 == 2)
  {
    if ((unint64_t)[v7 length] < 2) {
      return;
    }
    uint64_t v11 = [v8 section];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL
      || [*(id *)(a1 + 32) finalSectionIndexForInitialSectionIndex:v11] != 0x7FFFFFFFFFFFFFFFLL)
    {
      return;
    }
    goto LABEL_11;
  }
  if (v9 != 3)
  {
    if (v9 != 4) {
      return;
    }
    __int16 v10 = [*(id *)(a1 + 32) finalIndexPathForInitialIndexPath:v7];

    if (v10) {
      return;
    }
LABEL_11:
    uint64_t v12 = *(void *)(a1 + 40);
    BOOL v13 = -[UIBarButtonItemGroup _items]((id *)a2);
    if (a2) {
      BOOL v14 = (a2[144] & 3) == 0;
    }
    else {
      BOOL v14 = 0;
    }
    id v15 = v13;
    -[_UICollectionCompositionalLayoutSolverResolveResult addDeletedAuxillaryOfElementKind:atIndexPath:isSupplementary:](v12, v13, (uint64_t)v8, v14);
    goto LABEL_16;
  }
  +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)a2);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:");
LABEL_16:
}

void __89___UICollectionCompositionalLayoutSolver_mutatedVisibleItemsForElementsForVisibleBounds___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (!a3 || ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) containsObject:a2] & 1) != 0) {
    return;
  }
  double v8 = [_UICollectionLayoutVisibleItem alloc];
  if (a4) {
    uint64_t v9 = *(void **)(a4 + 40);
  }
  else {
    uint64_t v9 = 0;
  }
  id v10 = v9;
  double v21 = -[_UICollectionLayoutVisibleItem initWithLayoutAttributes:layoutItem:](v8, a2, v10);

  uint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (!v11)
  {
    uint64_t v14 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    char v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    goto LABEL_10;
  }
  uint64_t v12 = [v11 objectForKey:a3];
  if (!v12)
  {
LABEL_10:
    BOOL v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v21, 0);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v13 forKey:a3];
    goto LABEL_11;
  }
  BOOL v13 = v12;
  [v12 addObject:v21];
LABEL_11:
  BOOL v17 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v17)
  {
    [v17 addObject:a2];
  }
  else
  {
    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", a2, 0);
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8);
    double v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;
  }
}

uint64_t __130___UICollectionCompositionalLayoutSolver_updatePreferredSizeIfNeededForPreferredLayoutAttributes_withOriginalAttributes_debugger___block_invoke(uint64_t a1, void *a2, id *a3, void *a4, void *a5, void *a6)
{
  uint64_t v9 = a3;
  [a3 size];
  double v13 = v12;
  double v15 = v14;
  [a4 size];
  double v17 = v16;
  double v19 = v18;
  if (*(unsigned char *)(a1 + 48))
  {
    id v20 = a2;
  }
  else
  {
    double v21 = -[UIBarButtonItemGroup _items]((id *)a4);
    -[_UICollectionPreferredSizes objectForKeyedSubscript:]((uint64_t)a2, v21);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v22 = [*(id *)(a1 + 32) length];
  v23 = *(void **)(a1 + 32);
  v88 = a4;
  if (v22 == 1) {
    uint64_t v24 = [v23 indexAtPosition:0];
  }
  else {
    uint64_t v24 = [v23 item];
  }
  uint64_t v25 = v24;
  double v26 = [a5 layoutSize];
  uint64_t v27 = -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)v20, v25);
  double v28 = [a5 size];
  uint64_t v29 = [v28 _axesUniformAcrossSiblings];

  if (!v27 && v29)
  {
    double v30 = *(void **)(a1 + 40);
    if (v30)
    {
      uint64_t v85 = v25;
      double v31 = NSString;
      double v32 = [a5 _externalDescription];
      double v33 = [v31 stringWithFormat:@"received preferred size for item with uniformAcrossSiblings dimension: %@", v32];
      *(double *)v99 = v17;
      *(double *)&v99[1] = v19;
      [MEMORY[0x1E4F29238] valueWithBytes:v99 objCType:"{CGSize=dd}"];
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      *(double *)v98 = v13;
      *(double *)&v98[1] = v15;
      double v35 = [MEMORY[0x1E4F29238] valueWithBytes:v98 objCType:"{CGSize=dd}"];
      double v36 = @"preferredSize";
      CGFloat v37 = v30;
      CGFloat v38 = v88;
      CGFloat v39 = v33;
      id v40 = 0;
      id v41 = v34;
      goto LABEL_42;
    }
    goto LABEL_44;
  }
  if ([v26 isEstimated])
  {
    double v42 = +[_UICollectionPreferredSize preferredSizeForOriginalSize:v17 fittingSize:(uint64_t)_UICollectionPreferredSize layoutSize:v26];
    double v44 = v43;
    ShouldRespectPreferredSizeOnEstimatedAxisOnldouble y = _UICollectionViewCompositionalLayoutShouldRespectPreferredSizeOnEstimatedAxisOnly();
    if (ShouldRespectPreferredSizeOnEstimatedAxisOnly) {
      double v46 = v42;
    }
    else {
      double v46 = v17;
    }
    if (ShouldRespectPreferredSizeOnEstimatedAxisOnly) {
      double v47 = v44;
    }
    else {
      double v47 = v19;
    }
    BOOL v48 = _UISizeEqualToSizeWithPrecision(v13, v15, v46, v47, 0.0001);
    if (v27 && !v48 && v29)
    {
      double v49 = -[_UICollectionPreferredSize fittingSize](v27);
      BOOL v51 = _UISizeEqualToSizeWithPrecision(v49, v50, v17, v19, 0.0001);
      uint64_t v52 = *(void **)(a1 + 40);
      if (v52)
      {
        uint64_t v86 = v25;
        uint64_t v53 = NSString;
        BOOL v82 = v51;
        uint64_t v81 = [a5 _externalDescription];
        CGFloat v80 = [v53 stringWithFormat:@"preferred size changed for item with uniformAcrossSiblings dimension: \"%@\"", v81];
        double v54 = (void *)MEMORY[0x1E4F29238];
        v97[0] = -[_UICollectionPreferredSize fittingSize](v27);
        v97[1] = v55;
        objc_msgSend(v54, "valueWithBytes:objCType:", v97);
        uint64_t v56 = v79 = v9;
        *(double *)id v96 = v17;
        *(double *)&v96[1] = v19;
        uint64_t v57 = [MEMORY[0x1E4F29238] valueWithBytes:v96 objCType:"{CGSize=dd}"];
        *(double *)v95 = v13;
        *(double *)&v95[1] = v15;
        uint64_t v58 = [MEMORY[0x1E4F29238] valueWithBytes:v95 objCType:"{CGSize=dd}"];
        [v52 recordPreferredAttributesChangeForElementWithAttributes:v88 reason:v80 changedAttribute:@"preferredSize" fromValue:v56 toValue:v57 layoutGeneratedValue:v58];

        uint64_t v25 = v86;
        uint64_t v9 = v79;

        BOOL v51 = v82;
      }
      if (!v51) {
        goto LABEL_44;
      }
      goto LABEL_27;
    }
    if (!v48)
    {
      if (!*(void *)(a1 + 40)) {
        goto LABEL_44;
      }
      CGFloat v84 = *(void **)(a1 + 40);
      uint64_t v85 = v25;
      double v75 = NSString;
      double v32 = [a5 _externalDescription];
      double v33 = [v75 stringWithFormat:@"preferred size changed for item: \"%@\"", v32];
      double v76 = (void *)MEMORY[0x1E4F29238];
      v94[0] = -[_UICollectionPreferredSize fittingSize](v27);
      v94[1] = v77;
      [v76 valueWithBytes:v94 objCType:"{CGSize=dd}"];
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      *(double *)uint64_t v93 = v17;
      *(double *)&v93[1] = v19;
      double v35 = [MEMORY[0x1E4F29238] valueWithBytes:v93 objCType:"{CGSize=dd}"];
      *(double *)id v92 = v13;
      *(double *)&v92[1] = v15;
      CGFloat v78 = [MEMORY[0x1E4F29238] valueWithBytes:v92 objCType:"{CGSize=dd}"];
      [v84 recordPreferredAttributesChangeForElementWithAttributes:v88 reason:v33 changedAttribute:@"preferredSize" fromValue:v34 toValue:v35 layoutGeneratedValue:v78];

      goto LABEL_43;
    }
  }
  if (!v27)
  {
    v66 = 0;
    goto LABEL_34;
  }
LABEL_27:
  if (*(unsigned char *)(v27 + 48)) {
    goto LABEL_28;
  }
  v66 = *(void **)(v27 + 56);
LABEL_34:
  uint64_t v67 = v66;
  v68 = a6;
  v69 = v68;
  if (v67 == v68)
  {

    uint64_t v70 = 0;
    goto LABEL_45;
  }
  if (!v68 || !v67)
  {

LABEL_28:
    uint64_t v59 = *(void **)(a1 + 40);
    if (v59)
    {
      double v83 = a6;
      if (v27) {
        BOOL v60 = *(unsigned char *)(v27 + 48) != 0;
      }
      else {
        BOOL v60 = 0;
      }
      uint64_t v85 = v25;
      double v61 = NSString;
      uint64_t v62 = [a5 _externalDescription];
      double v32 = (void *)v62;
      if (v60)
      {
        double v33 = [v61 stringWithFormat:@"dirty preferred size for item: \"%@\"", v62];
        CGFloat v63 = (void *)MEMORY[0x1E4F29238];
        v91[0] = -[_UICollectionPreferredSize fittingSize](v27);
        v91[1] = v64;
        [v63 valueWithBytes:v91 objCType:"{CGSize=dd}"];
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        *(double *)uint64_t v90 = v17;
        *(double *)&v90[1] = v19;
        double v35 = [MEMORY[0x1E4F29238] valueWithBytes:v90 objCType:"{CGSize=dd}"];
        *(double *)v89 = v13;
        *(double *)&v89[1] = v15;
        CGFloat v65 = [MEMORY[0x1E4F29238] valueWithBytes:v89 objCType:"{CGSize=dd}"];
        [v59 recordPreferredAttributesChangeForElementWithAttributes:v88 reason:v33 changedAttribute:@"preferredSize" fromValue:v34 toValue:v35 layoutGeneratedValue:v65];

        a6 = v83;
LABEL_43:

        uint64_t v25 = v85;
        goto LABEL_44;
      }
      double v33 = [v61 stringWithFormat:@"Additional preferred sizing data changed for item: \"%@\"", v62];
      if (v27) {
        v71 = *(void **)(v27 + 56);
      }
      else {
        v71 = 0;
      }
      a6 = v83;
      id v34 = v71;
      double v35 = -[UICollectionViewLayoutAttributes _preferredSizingData](v9);
      double v36 = @"additionalData";
      CGFloat v37 = v59;
      CGFloat v38 = v88;
      CGFloat v39 = v33;
      id v40 = v34;
      id v41 = v83;
LABEL_42:
      [v37 recordPreferredAttributesChangeForElementWithAttributes:v38 reason:v39 changedAttribute:v36 fromValue:v40 toValue:v41 layoutGeneratedValue:v35];
      goto LABEL_43;
    }
LABEL_44:
    id v72 = [_UICollectionPreferredSize alloc];
    id v73 = [a5 size];
    v69 = -[_UICollectionPreferredSize initWithOriginalSize:fittingSize:layoutSize:additionalData:](v72, v73, a6, v13, v15, v17, v19);

    -[_UICollectionPreferredSizes setObject:atIndexedSubscript:]((uint64_t)v20, (uint64_t)v69, v25);
    uint64_t v70 = 1;
LABEL_45:

    goto LABEL_46;
  }
  char v87 = [v67 isEqual:v68];

  if ((v87 & 1) == 0) {
    goto LABEL_28;
  }
  uint64_t v70 = 0;
LABEL_46:

  return v70;
}

void __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke(void *a1, _WORD *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = [a2 indexPath];
  if ([v4 length] == 1) {
    uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v5 = [v4 section];
  }
  if ([v4 length] == 1) {
    uint64_t v6 = [v4 indexAtPosition:0];
  }
  else {
    uint64_t v6 = [v4 item];
  }
  uint64_t v7 = v6;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v8 = 0;
  }
  else
  {
    uint64_t v9 = *(void **)(*(void *)(a1[6] + 8) + 40);
    id v10 = [NSNumber numberWithInteger:v5];
    double v8 = [v9 objectForKeyedSubscript:v10];

    if (!v8)
    {
      double v8 = objc_alloc_init(_UICollectionLayoutSolveParameters);
      uint64_t v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
      double v12 = [NSNumber numberWithInteger:v5];
      [v11 setObject:v8 forKeyedSubscript:v12];
    }
  }
  if (a2)
  {
    __int16 v13 = a2[144];
    if (v13)
    {
      if (v8) {
        [(NSMutableIndexSet *)v8->_invalidatedIndexes addIndex:v7];
      }
    }
    else if ((v13 & 3) == 0)
    {
      double v14 = -[UIBarButtonItemGroup _items]((id *)a2);
      if (v5 == 0x7FFFFFFFFFFFFFFFLL
        && ((uint64_t v15 = a1[4]) == 0 ? (v16 = 0) : (v16 = *(void **)(v15 + 272)),
            -[_UICollectionLayoutAuxillaryItemSolver elementKinds](v16),
            double v17 = objc_claimAutoreleasedReturnValue(),
            int v18 = [v17 containsObject:v14],
            v17,
            v18))
      {
        double v19 = (void *)a1[5];
        v21[0] = v4;
        id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
        [v19 invalidateSupplementaryElementsOfKind:v14 atIndexPaths:v20];
      }
      else
      {
        -[_UICollectionLayoutSolveParameters addAuxillaryIndex:elementKind:]((uint64_t)v8, v7, v14);
      }
    }
  }
}

void __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 integerValue];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6) {
    uint64_t v6 = (void *)v6[23];
  }
  uint64_t v7 = v6;
  uint64_t v8 = [v7 objectAtIndexedSubscript:v5];

  if (v8)
  {
    id v9 = *(id *)(v8 + 8);
    id v10 = *(void **)(v8 + 104);
  }
  else
  {
    id v9 = 0;
    id v10 = 0;
  }
  id v11 = v10;
  [v9 contentFrameIncludingAuxiliaries];
  double v57 = v12;
  double v14 = v13;
  if (v8)
  {
    double v16 = *(double *)(v8 + 24);
    double v15 = *(double *)(v8 + 32);
    uint64_t v17 = *(void *)(v8 + 40);
    uint64_t v18 = *(void *)(v8 + 48);
  }
  else
  {
    double v15 = 0.0;
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    double v16 = 0.0;
  }
  double v19 = v16;
  double v20 = v15;
  CGRect v69 = CGRectIntersection(*(CGRect *)(a1 + 48), *(CGRect *)(&v17 - 2));
  double x = v69.origin.x;
  double y = v69.origin.y;
  CGFloat width = v69.size.width;
  CGFloat height = v69.size.height;
  CGFloat v25 = CGRectGetWidth(v69);
  v70.origin.double x = x;
  v70.origin.double y = y;
  v70.size.CGFloat width = width;
  v70.size.CGFloat height = height;
  CGFloat v26 = CGRectGetHeight(v70);
  uint64_t v27 = *(id **)(a1 + 32);
  if (v27)
  {
    double v28 = (id **)v27[14];
    uint64_t v29 = v28;
    if (v28) {
      uint64_t v27 = v28[8];
    }
    else {
      uint64_t v27 = 0;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }
  uint64_t v58 = v27;

  if (a3)
  {
    double v30 = x - v16;
    uint64_t v32 = *(void *)(a1 + 80);
    uint64_t v31 = *(void *)(a1 + 88);
    a3 = [(id)a3 copy];
    *(void *)(a3 + 32) = v32;
    *(void *)(a3 + 40) = v31;
    *(double *)(a3 + 48) = v30;
    *(double *)(a3 + 56) = y - v15;
    *(CGFloat *)(a3 + 64) = v25;
    *(CGFloat *)(a3 + 72) = v26;
  }
  double v33 = [v9 resolveWithParameters:a3 preferredSizes:v11];
  id v34 = [v9 errorDescription];

  if (v34 && v58)
  {
    double v35 = [v9 container];
    if (v8) {
      double v36 = *(void **)(v8 + 88);
    }
    else {
      double v36 = 0;
    }
    id v37 = v36;
    CGFloat v38 = [v9 errorDescription];
    ((void (*)(id *, uint64_t, void *, id, void *, uint64_t))v58[2])(v58, v5, v35, v37, v38, 1);
  }
  [v9 contentFrameIncludingAuxiliaries];
  double v40 = v39;
  double v42 = v41;
  uint64_t v43 = *(void *)(a1 + 32);
  if (v43) {
    double v44 = *(void **)(v43 + 88);
  }
  else {
    double v44 = 0;
  }
  if ([v44 containsIndex:v5])
  {
    uint64_t v45 = [v9 layoutAxis];
    if ((unint64_t)(v45 - 1) <= 1)
    {
      uint64_t v46 = v45;
      double v47 = _UISizeValueForAxis(v45, v14, v57);
      if (vabdd_f64(v47, _UISizeValueForAxis(v46, v40, v42)) > 0.1)
      {
        BOOL v48 = -[UICollectionViewLayoutInvalidationContext _orthogonalSectionsWithContentSizeChanges](*(void **)(a1 + 40));
        [v48 addIndex:v5];
      }
    }
  }
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v50 = -[UIBarButtonItemGroup _items](v33);
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_3;
  v66[3] = &unk_1E52E0E98;
  id v67 = v49;
  uint64_t v68 = v5;
  id v51 = v49;
  [v50 enumerateIndexesUsingBlock:v66];

  [*(id *)(a1 + 40) invalidateItemsAtIndexPaths:v51];
  uint64_t v52 = -[_UICollectionLayoutSolveResult invalidatedAuxillaryKinds]((uint64_t)v33);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_4;
  v59[3] = &unk_1E52E0EE8;
  BOOL v60 = v33;
  id v61 = v9;
  uint64_t v53 = *(void *)(a1 + 96);
  uint64_t v64 = v5;
  uint64_t v65 = v53;
  double v54 = *(void **)(a1 + 40);
  uint64_t v62 = *(void *)(a1 + 32);
  id v63 = v54;
  id v55 = v9;
  uint64_t v56 = v33;
  [v52 enumerateObjectsUsingBlock:v59];
}

void __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) sectionSupplementaryFrameForIndex:a2];
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 16);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForItem:v4 inSection:*(void *)(a1 + 56)];
  uint64_t v6 = -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v3);
  uint64_t v7 = [v6 elementKind];

  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 40) file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:349 description:@"Could not determine supplementary elementKind."];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  v11[0] = v5;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  -[_UICollectionCompositionalLayoutSolver invalidateCachedSupplementaryAttributesForElementKind:atIndexPaths:](v8, (uint64_t)v7, (uint64_t)v9);

  [*(id *)(a1 + 48) addInvalidatedSupplementaryForKind:v7 indexPath:v5];
}

uint64_t __79___UICollectionCompositionalLayoutSolver_enumerateSectionDefinitionsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75___UICollectionCompositionalLayoutSolver__anchorForAuxiliaryElementOfKind___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a2) {
    uint64_t v6 = *(void **)(a2 + 8);
  }
  else {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [v6 supplementaryFrameWithKind:*(void *)(a1 + 32) index:0];
  if (v7)
  {
    uint64_t v8 = v7[7];
    if (v8 == 2)
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    }
    else
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v8 != 4)
      {
        *(void *)(v9 + 24) = 0;
        goto LABEL_10;
      }
      uint64_t v8 = 3;
    }
    *(void *)(v9 + 24) = v8;
LABEL_10:
    *a4 = 1;
  }
}

void __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addObject:v3];
}

void __76___UICollectionCompositionalLayoutSolver__attributesQueryInfosForQueryRect___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (id *)(id)[*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  if (v4)
  {
    uint64_t v5 = v4;
    if (![v4[2] scrollsOrthogonally]) {
      return;
    }
    id v6 = v5[1];
  }
  else
  {
    char v18 = [0 scrollsOrthogonally];
    id v6 = 0;
    if ((v18 & 1) == 0) {
      return;
    }
  }
  [v6 orthogonalOffset];
  double v8 = v7;
  double v10 = v9;
  double v11 = *(double *)(a1 + 48);
  double v12 = *(double *)(a1 + 56);
  v20.size.CGFloat width = *(CGFloat *)(a1 + 64);
  v20.size.CGFloat height = *(CGFloat *)(a1 + 72);
  v20.origin.double x = v11;
  v20.origin.double y = v12;
  CGFloat Width = CGRectGetWidth(v20);
  CGFloat Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
  double v15 = [_UICollectionLayoutExtendedAttributesQueryInfo alloc];
  if (v15)
  {
    v19.receiver = v15;
    v19.super_class = (Class)_UICollectionLayoutExtendedAttributesQueryInfo;
    id v16 = objc_msgSendSuper2(&v19, sel_init);
    uint64_t v17 = v16;
    if (v16)
    {
      *((double *)v16 + 2) = v8 + v11;
      *((double *)v16 + 3) = v10 + v12;
      *((CGFloat *)v16 + 4) = Width;
      *((CGFloat *)v16 + 5) = Height;
      *((void *)v16 + 1) = a2;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  [*(id *)(a1 + 32) addObject:v17];
}

void __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = *(id *)(v4 + 8);
    double v7 = *(void **)(v5 + 16);
  }
  else
  {
    id v6 = 0;
    double v7 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = v7;
  double v10 = v9;
  if (v8)
  {
    if ([v9 _pinnedSupplementariesShouldOverlap]) {
      LODWORD(v8) = [v10 scrollsOrthogonally] ^ 1;
    }
    else {
      LODWORD(v8) = 0;
    }
  }

  if (v5)
  {
    double v12 = *(double *)(v5 + 24);
    CGFloat v11 = *(double *)(v5 + 32);
    CGFloat v13 = *(double *)(v5 + 40);
    CGFloat v14 = *(double *)(v5 + 48);
  }
  else
  {
    CGFloat v11 = 0.0;
    CGFloat v13 = 0.0;
    CGFloat v14 = 0.0;
    double v12 = 0.0;
  }
  v117[0] = 0;
  if (v8)
  {
    uint64_t v15 = [*(id *)(a1 + 48) indexGreaterThanIndex:v2];
    if (v15 == v2 + 1)
    {
      uint64_t v16 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v15];
      uint64_t v17 = (void *)v16;
      if (v16) {
        char v18 = *(void **)(v16 + 16);
      }
      else {
        char v18 = 0;
      }
      id v19 = v18;
      CGRect v20 = v19;
      if (*(void *)(a1 + 40)
        && [v19 _pinnedSupplementariesShouldOverlap]
        && ([v20 scrollsOrthogonally] & 1) == 0)
      {
        uint64_t v21 = *(void *)(a1 + 40);
        if (v21) {
          uint64_t v22 = *(void *)(v21 + 64);
        }
        else {
          uint64_t v22 = 0;
        }
        uint64_t v23 = _UIDirectionalEdgeForPreEdgeOnLayoutAxis(v22);
        double v12 = -[_UICollectionCompositionalLayoutSolver _frameByExtendingGlobalSectionFrame:toOverlapPinnedSupplementaryInSection:onEdge:visibleBounds:didExtend:](v21, (uint64_t)v17, v23, v117, v12, v11, v13, v14, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
        CGFloat v11 = v24;
        CGFloat v13 = v25;
        CGFloat v14 = v26;
      }
    }
    uint64_t v27 = [*(id *)(a1 + 48) indexLessThanIndex:v2];
    if (v27 == v2 - 1)
    {
      uint64_t v28 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v27];
      uint64_t v29 = (void *)v28;
      if (v28) {
        double v30 = *(void **)(v28 + 16);
      }
      else {
        double v30 = 0;
      }
      id v31 = v30;
      uint64_t v32 = v31;
      if (*(void *)(a1 + 40)
        && [v31 _pinnedSupplementariesShouldOverlap]
        && ([v32 scrollsOrthogonally] & 1) == 0)
      {
        uint64_t v33 = *(void *)(a1 + 40);
        if (v33) {
          uint64_t v34 = *(void *)(v33 + 64);
        }
        else {
          uint64_t v34 = 0;
        }
        uint64_t v35 = _UIDirectionalEdgeForPostEdgeOnLayoutAxis(v34);
        double v12 = -[_UICollectionCompositionalLayoutSolver _frameByExtendingGlobalSectionFrame:toOverlapPinnedSupplementaryInSection:onEdge:visibleBounds:didExtend:](v33, (uint64_t)v29, v35, v117, v12, v11, v13, v14, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
        CGFloat v11 = v36;
        CGFloat v13 = v37;
        CGFloat v14 = v38;
      }
    }
    BOOL v39 = v117[0] != 0;
  }
  else
  {
    BOOL v39 = 0;
  }
  if (v5)
  {
    uint64_t v40 = *(void *)(v5 + 56);
    uint64_t v41 = *(void *)(v5 + 64);
    uint64_t v42 = *(void *)(v5 + 72);
    uint64_t v43 = *(void *)(v5 + 80);
  }
  else
  {
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    uint64_t v43 = 0;
    uint64_t v40 = 0;
  }
  v118.origin.CGFloat x = v12;
  v118.origin.CGFloat y = v11;
  v118.size.CGFloat width = v13;
  v118.size.CGFloat height = v14;
  if (!CGRectEqualToRect(v118, *(CGRect *)&v40))
  {
    BOOL v107 = v39;
    char v109 = v8;
    double v44 = v13;
    uint64_t v8 = v2;
    id v45 = v6;
    if (v5)
    {
      uint64_t v46 = [_UICollectionSectionSolutionBookmark alloc];
      double v47 = *(double *)(v5 + 24);
      double v48 = *(double *)(v5 + 32);
      double v49 = *(double *)(v5 + 40);
      double v50 = *(double *)(v5 + 48);
      id v51 = *(void **)(v5 + 88);
      uint64_t v52 = *(void **)(v5 + 96);
      uint64_t v53 = *(void **)(v5 + 8);
      double v54 = *(void **)(v5 + 104);
      id v55 = *(id *)(v5 + 16);
      id v56 = v53;
      double v57 = v47;
      CGFloat v13 = v44;
      uint64_t v58 = -[_UICollectionSectionSolutionBookmark initWithSolution:globalFrame:globalPinningFrame:insetEnvironment:supplementaryInsetEnvironment:section:preferredSizes:]((id *)&v46->super.isa, v56, v51, v52, v55, v54, v57, v48, v49, v50, v12, v11, v44, v14);
    }
    else
    {
      uint64_t v58 = 0;
    }
    uint64_t v2 = v8;
    [*(id *)(a1 + 32) setObject:v58 atIndexedSubscript:v8];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    id v6 = v45;
    LOBYTE(v8) = v109;
    BOOL v39 = v107;
  }
  v119.origin.CGFloat x = v12;
  v119.origin.CGFloat y = v11;
  v119.size.CGFloat width = v13;
  v119.size.CGFloat height = v14;
  CGRect v120 = CGRectIntersection(v119, *(CGRect *)(a1 + 72));
  CGFloat x = v120.origin.x;
  CGFloat y = v120.origin.y;
  CGFloat width = v120.size.width;
  CGFloat height = v120.size.height;
  if ((v8 & 1) != 0
    || !CGRectIsEmpty(v120)
    && (v124.origin.CGFloat x = x, v124.origin.y = y, v124.size.width = width, v124.size.height = height, !CGRectIsNull(v124)))
  {
    v121.origin.CGFloat x = x;
    v121.origin.CGFloat y = y;
    v121.size.CGFloat width = width;
    v121.size.CGFloat height = height;
    IsEmptCGFloat y = CGRectIsEmpty(v121);
    uint64_t v64 = (double *)MEMORY[0x1E4F1DAD8];
    if (IsEmpty)
    {
      v122.origin.CGFloat x = v12;
      v122.origin.CGFloat y = v11;
      v122.size.CGFloat width = v13;
      v122.size.CGFloat height = v14;
      double v65 = CGRectGetWidth(v122);
      v123.origin.CGFloat x = v12;
      v123.origin.CGFloat y = v11;
      v123.size.CGFloat width = v13;
      v123.size.CGFloat height = v14;
      double v66 = CGRectGetHeight(v123);
      double v67 = 0.0;
      double v68 = 0.0;
      if (!v39)
      {
LABEL_41:
        objc_msgSend(v6, "updatePinnedSupplementaryItemsWithVisibleBounds:", v67, v68, v65, v66);
LABEL_55:
        double v101 = [v6 pinnedSupplementaryIndexes];
        v111[0] = MEMORY[0x1E4F143A8];
        v111[1] = 3221225472;
        v111[2] = __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_2;
        v111[3] = &unk_1E52E0C68;
        id v102 = v6;
        uint64_t v103 = *(void *)(a1 + 104);
        uint64_t v115 = v2;
        uint64_t v116 = v103;
        uint64_t v104 = *(void *)(a1 + 40);
        id v112 = v102;
        uint64_t v113 = v104;
        id v114 = *(id *)(a1 + 56);
        [v101 enumerateIndexesUsingBlock:v111];

        goto LABEL_56;
      }
    }
    else
    {
      double v105 = v13;
      double v106 = v11;
      if (v5)
      {
        CGFloat v69 = *(double *)(v5 + 24);
        CGFloat v70 = *(double *)(v5 + 32);
        CGFloat v71 = *(double *)(v5 + 40);
        CGFloat v72 = *(double *)(v5 + 48);
      }
      else
      {
        CGFloat v70 = 0.0;
        CGFloat v71 = 0.0;
        CGFloat v72 = 0.0;
        CGFloat v69 = 0.0;
      }
      double v73 = _UIRectSubtractingRectYieldingDirectionalInsets(v69, v70, v71, v72, x, y, width, height);
      double v75 = v74;
      double v77 = v76;
      double v79 = v78;
      double v81 = *v64;
      double v80 = v64[1];
      if (v5) {
        BOOL v82 = *(void **)(v5 + 8);
      }
      else {
        BOOL v82 = 0;
      }
      [v82 contentFrameIncludingAuxiliaries];
      double v67 = v75 + v81;
      double v65 = v83 - (v79 + v75);
      double v68 = v73 + v80;
      double v66 = v84 - (v73 + v77);
      CGFloat v13 = v105;
      CGFloat v11 = v106;
      if (!v39) {
        goto LABEL_41;
      }
    }
    double v108 = v66;
    double v110 = v65;
    if (v5)
    {
      CGFloat v85 = *(double *)(v5 + 24);
      CGFloat v86 = *(double *)(v5 + 32);
      CGFloat v87 = *(double *)(v5 + 40);
      CGFloat v88 = *(double *)(v5 + 48);
    }
    else
    {
      CGFloat v86 = 0.0;
      CGFloat v87 = 0.0;
      CGFloat v88 = 0.0;
      CGFloat v85 = 0.0;
    }
    double v89 = _UIRectSubtractingRectYieldingDirectionalInsets(v85, v86, v87, v88, v12, v11, v13, v14);
    double v91 = v90;
    double v93 = v92;
    double v95 = v94;
    double v97 = *v64;
    double v96 = v64[1];
    if (v5) {
      v98 = *(void **)(v5 + 8);
    }
    else {
      v98 = 0;
    }
    [v98 contentFrameIncludingAuxiliaries];
    objc_msgSend(v6, "updatePinnedSupplementaryItemsWithVisibleBounds:overrideContentRectForPinning:", v67, v68, v110, v108, v91 + v97, v89 + v96, v99 - (v95 + v91), v100 - (v89 + v93));
    goto LABEL_55;
  }
LABEL_56:
}

void __95___UICollectionCompositionalLayoutSolver_resolveSolutionForUpdate_container_ignoreEmptyUpdate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = objc_msgSend(*(id *)(a1 + 32), "initialSectionIndexForFinalSectionIndex:");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = v6;
    if (v6 < *(void *)(a1 + 56))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8) {
        id v9 = *(void **)(v8 + 184);
      }
      else {
        id v9 = 0;
      }
      uint64_t v10 = [v9 objectAtIndexedSubscript:v7];
      id v15 = (id)v10;
      if (v10)
      {
        id v11 = *(id *)(v10 + 16);
        double v12 = v11;
        if (v11 && ([v11 isEqual:a2] & 1) == 0)
        {
          CGFloat v13 = *(void **)(a1 + 48);
          CGFloat v14 = [NSNumber numberWithUnsignedInteger:a3];
          [v13 removeObjectForKey:v14];
        }
      }
      else
      {
        double v12 = 0;
      }
    }
  }
}

void __75___UICollectionCompositionalLayoutSolver__registerDecorationItemsIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_msgSend(a2, "decorationItems", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
        if ([v8 _registrationViewClass])
        {
          uint64_t v9 = *(void *)(a1 + 32);
          if (v9)
          {
            id v10 = *(id *)(v9 + 112);
            id v11 = v10;
            if (v10) {
              id v10 = (id)*((void *)v10 + 7);
            }
          }
          else
          {
            id v11 = 0;
            id v10 = 0;
          }
          (*((void (**)(id, void *))v10 + 2))(v10, v8);
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v12 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v5 = v12;
    }
    while (v12);
  }
}

void __72___UICollectionCompositionalLayoutSolver__solveRetainingPreferredSizes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint64_t v7 = *(void **)(v6 + 184);
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [v7 objectAtIndexedSubscript:a3];
  uint64_t v9 = (id *)v8;
  if (*(unsigned char *)(a1 + 48)) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    uint64_t v11 = *(void *)(v8 + 104);
    if (v11)
    {
      id v19 = (id *)v8;
      uint64_t v12 = [*(id *)(v11 + 16) count];
      uint64_t v9 = v19;
      if (v12 || (v13 = [*(id *)(v11 + 24) count], uint64_t v9 = v19, v13))
      {
        id v14 = v9[2];
        if ([v14 isEqual:a2])
        {
          long long v15 = (id *)v19[13];
          id v16 = -[_UICollectionPreferredSizes copyByDirtyingPreferredSizes](v15);
          uint64_t v17 = *(void **)(a1 + 40);
          uint64_t v18 = [NSNumber numberWithUnsignedInteger:a3];
          [v17 setObject:v16 forKeyedSubscript:v18];
        }
        uint64_t v9 = v19;
      }
    }
  }
}

void __97___UICollectionCompositionalLayoutSolver__unpinnedFramesOfSupplementariesPinnedToEdge_ofSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) unpinnedSectionSupplementaryFrameForIndex:a2];
  uint64_t v5 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](v4);
  uint64_t v6 = [v5 boundarySupplementaryItem];

  if (v6)
  {
    uint64_t v7 = [v6 alignment];
    uint64_t v8 = *(void *)(a1 + 64);
    if (v8 == 1)
    {
      if ((unint64_t)(v7 - 2) >= 3) {
        uint64_t v9 = 8 * ((unint64_t)(v7 - 6) < 3);
      }
      else {
        uint64_t v9 = 2;
      }
    }
    else if (v8 == 2 && (unint64_t)(v7 - 1) < 8)
    {
      uint64_t v9 = qword_186B93B80[v7 - 1];
    }
    else
    {
      uint64_t v9 = 0;
    }
    if (v9 == *(void *)(a1 + 72))
    {
      uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      if (v13)
      {
        [v13 addObject:v4];
      }
      else
      {
        uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithObject:v4];
        uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
        id v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = v14;
      }
    }
  }
  else if (os_variant_has_internal_diagnostics())
  {
    uint64_t v17 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v19 = *(void *)(a1 + 48);
      int v20 = 138413058;
      uint64_t v21 = v18;
      __int16 v22 = 2048;
      uint64_t v23 = a2;
      __int16 v24 = 2112;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      uint64_t v27 = v4;
      _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "UIKit internal bug: Compositional solver found a section with supplementaries pinned at indexes %@, but the supplementary at index %zd is not pinned.\nSection bookmark: %@. Pinned supplementary frame: %@", (uint8_t *)&v20, 0x2Au);
    }
  }
  else
  {
    BOOL v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_1)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(a1 + 48);
      int v20 = 138413058;
      uint64_t v21 = v11;
      __int16 v22 = 2048;
      uint64_t v23 = a2;
      __int16 v24 = 2112;
      uint64_t v25 = v12;
      __int16 v26 = 2112;
      uint64_t v27 = v4;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "UIKit internal bug: Compositional solver found a section with supplementaries pinned at indexes %@, but the supplementary at index %zd is not pinned.\nSection bookmark: %@. Pinned supplementary frame: %@", (uint8_t *)&v20, 0x2Au);
    }
  }
}

void __98___UICollectionCompositionalLayoutSolver_itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) addObject:v3];
}

void __79___UICollectionCompositionalLayoutSolver_traitsRequiringInvalidationForChanges__block_invoke()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    v6[0] = 0x1ED3F5A78;
    v0 = (void *)MEMORY[0x1E4F1C978];
    v1 = v6;
    uint64_t v2 = 1;
  }
  else
  {
    v5[0] = 0x1ED3F5A90;
    v5[1] = 0x1ED3F5AD8;
    v5[2] = 0x1ED3F5A78;
    v0 = (void *)MEMORY[0x1E4F1C978];
    v1 = v5;
    uint64_t v2 = 3;
  }
  uint64_t v3 = [v0 arrayWithObjects:v1 count:v2];
  uint64_t v4 = (void *)qword_1E8FDF628;
  qword_1E8FDF628 = v3;
}

void __89___UICollectionCompositionalLayoutSolver_mutatedVisibleItemsForElementsForVisibleBounds___block_invoke_2()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("UICompositionalLayout", &_UIInternalPreference_UIViewDebugSignposts_block_invoke_2___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "note: the section invalidation handler cannot currently mutate visible items for layouts containing estimated items. Please file an enhancement request on UICollectionView.", v1, 2u);
  }
}

void *__96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_3(uint64_t a1, double *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  if (a2)
  {
    double v6 = a2[7];
    double v7 = a2[8];
    double v8 = a2[9];
    double v9 = a2[10];
    BOOL v10 = (void *)*((void *)a2 + 1);
  }
  else
  {
    BOOL v10 = 0;
    double v9 = 0.0;
    double v8 = 0.0;
    double v7 = 0.0;
    double v6 = 0.0;
  }
  return -[_UICollectionCompositionalLayoutSolver _updateSectionIndexer:frame:solution:section:](v5, *(void **)(a1 + 40), v10, a3, v6, v7, v8, v9);
}

void __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(id **)(v4 + 272);
  }
  else {
    uint64_t v5 = 0;
  }
  double v6 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v5);
  id v25 = [v6 objectAtIndexedSubscript:a2];

  if (v25) {
    uint64_t v7 = *((void *)v25 + 2);
  }
  else {
    uint64_t v7 = 0;
  }
  double v8 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v7];
  double v9 = -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v25);
  BOOL v10 = [v9 elementKind];

  -[_UICollectionCompositionalLayoutSolver _cachedSupplementaryAttributesForElementKind:indexPath:](*(void *)(a1 + 32), (uint64_t)v10, (uint64_t)v8);
  uint64_t v11 = (_WORD *)objc_claimAutoreleasedReturnValue();
  if (v11) {
    -[_UICollectionCompositionalLayoutSolver _invalidateAttributes:](*(void *)(a1 + 32), v11);
  }
  [*(id *)(a1 + 40) addInvalidatedSupplementaryForKind:v10 indexPath:v8];
  if (v25)
  {
    double v13 = *((double *)v25 + 8);
    double v12 = *((double *)v25 + 9);
    CGFloat v14 = *((double *)v25 + 10);
    CGFloat v15 = *((double *)v25 + 11);
  }
  else
  {
    double v12 = 0.0;
    CGFloat v14 = 0.0;
    CGFloat v15 = 0.0;
    double v13 = 0.0;
  }
  double v16 = *(double *)(a1 + 48);
  double v17 = *(double *)(a1 + 56);
  v27.origin.CGFloat x = v13;
  v27.origin.CGFloat y = v12;
  v27.size.CGFloat width = v14;
  v27.size.CGFloat height = v15;
  CGFloat Width = CGRectGetWidth(v27);
  v28.origin.CGFloat x = v13;
  v28.origin.CGFloat y = v12;
  v28.size.CGFloat width = v14;
  v28.size.CGFloat height = v15;
  CGFloat Height = CGRectGetHeight(v28);
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v25);
  uint64_t v22 = [v21 zIndex];
  if (v25) {
    BOOL v23 = *((unsigned char *)v25 + 8) != 0;
  }
  else {
    BOOL v23 = 0;
  }
  id v24 = -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:elementKind:frame:zIndex:pinned:](v20, v8, v10, v22, v23, v13 + v16, v12 + v17, Width, Height);
}

void __102___UICollectionCompositionalLayoutSolver_updateVisibleBoundsForDynamicAnimator_previousVisibleBounds___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)a2);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v26];
  uint64_t v7 = -[_UICollectionCompositionalLayoutDynamicAnimator behaviorForIdentifier:](*(id **)(a1 + 32), (uint64_t)v26);

  double v8 = v26;
  if (!v7)
  {
    double v9 = [_UICollectionLayoutVisibleItem alloc];
    if (a4) {
      BOOL v10 = *(void **)(a4 + 40);
    }
    else {
      BOOL v10 = 0;
    }
    id v11 = v10;
    double v12 = -[_UICollectionLayoutVisibleItem initWithLayoutAttributes:layoutItem:](v9, a2, v11);

    double v13 = [_UICollectionCompositionalLayoutDynamicBehavior alloc];
    if (v13)
    {
      v27.receiver = v13;
      v27.super_class = (Class)_UICollectionCompositionalLayoutDynamicBehavior;
      CGFloat v14 = (id *)objc_msgSendSuper2(&v27, sel_init);
      CGFloat v15 = v14;
      if (v14)
      {
        objc_storeStrong(v14 + 6, v12);
        [v15 setAction:&__block_literal_global_512];
      }
    }
    else
    {
      CGFloat v15 = 0;
    }
    double v16 = *(id **)(a1 + 32);
    if (!v16) {
      goto LABEL_16;
    }
    if (v15)
    {
      id v17 = v15[6];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = (void *)*((void *)v17 + 2);
LABEL_11:
        id v20 = v19;
        uint64_t v21 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v20);

        if (!v21)
        {
          id v25 = [MEMORY[0x1E4F28B00] currentHandler];
          [v25 handleFailureInMethod:sel_addItemBehavior_, v16, @"_UICollectionCompositionalLayoutSolver.m", 3556, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
        }
        uint64_t v22 = [v16[42] objectForKeyedSubscript:v21];
        if (v22)
        {
          [v16 removeBehavior:v22];
          [v16[42] removeObjectForKey:v21];
        }
        [v16[42] setObject:v15 forKeyedSubscript:v21];
        [v16 addBehavior:v15];

LABEL_16:
        double v8 = v26;
        goto LABEL_17;
      }
    }
    else
    {
      BOOL v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:sel_addItemBehavior_, v16, @"_UICollectionCompositionalLayoutSolver.m", 3552, @"Invalid parameter not satisfying: %@", @"visibleItemBehavior" object file lineNumber description];
    }
    id v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:sel_addItemBehavior_, v16, @"_UICollectionCompositionalLayoutSolver.m", 3554, @"Invalid parameter not satisfying: %@", @"visibleItem" object file lineNumber description];

    uint64_t v18 = 0;
    uint64_t v19 = 0;
    goto LABEL_11;
  }
LABEL_17:
}

void __102___UICollectionCompositionalLayoutSolver_updateVisibleBoundsForDynamicAnimator_previousVisibleBounds___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double v9 = -[_UICollectionCompositionalLayoutDynamicAnimator behaviorForIdentifier:](*(id **)(a1 + 32), a2);
  if (v9)
  {
    uint64_t v4 = (void *)v9[6];
    if (v4) {
      uint64_t v4 = (void *)v4[2];
    }
    uint64_t v5 = v4;
    -[_UICollectionCompositionalLayoutSolver _invalidateAttributes:](*(void *)(a1 + 40), v5);
  }
  double v6 = *(id **)(a1 + 32);
  if (v6)
  {
    if (!a2)
    {
      double v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel_removeItemBehaviorForIdentifier_, v6, @"_UICollectionCompositionalLayoutSolver.m", 3570, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
    }
    uint64_t v7 = [v6[42] objectForKeyedSubscript:a2];
    if (v7)
    {
      [v6 removeBehavior:v7];
      [v6[42] removeObjectForKey:a2];
    }
  }
}

void __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 184) objectAtIndexedSubscript:a2];
  uint64_t v5 = (void *)v4;
  if (v4) {
    double v6 = *(void **)(v4 + 8);
  }
  else {
    double v6 = 0;
  }
  id v7 = v6;
  double v8 = [v7 pinnedSupplementaryIndexes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke_2;
  v10[3] = &unk_1E52E10F0;
  id v11 = v7;
  uint64_t v13 = a2;
  long long v12 = *(_OWORD *)(a1 + 32);
  id v9 = v7;
  [v8 enumerateIndexesUsingBlock:v10];
}

void __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) sectionSupplementaryFrameForIndex:a2];
  BOOL v10 = (void *)v3;
  if (v3) {
    uint64_t v4 = *(void *)(v3 + 16);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForItem:v4 inSection:*(void *)(a1 + 56)];
  double v6 = *(void ***)(a1 + 40);
  id v7 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](v10);
  double v8 = [v7 elementKind];
  id v9 = -[_UICollectionCompositionalLayoutSolver layoutAttributesForSupplementaryViewOfKind:withIndexPath:](v6, v8, v5);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(id **)(v4 + 272);
  }
  else {
    uint64_t v5 = 0;
  }
  double v6 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrames](v5);
  long long v12 = [v6 objectAtIndexedSubscript:a2];

  if (v12) {
    id v7 = v12[2];
  }
  else {
    id v7 = 0;
  }
  double v8 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v7];
  id v9 = -[_UICollectionLayoutFramesQueryResult supplementaryItem](v12);
  BOOL v10 = [v9 elementKind];

  id v11 = -[_UICollectionCompositionalLayoutSolver layoutAttributesForSupplementaryViewOfKind:withIndexPath:](*(void ***)(a1 + 32), v10, v8);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __129___UICollectionCompositionalLayoutSolver__layoutAttributesOfFirstElementEligibleForPreferredSizingContentOffsetAdjustmentInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, unsigned char *a5)
{
  if (a4 && a4[4] == 1)
  {
    [a2 frame];
    int v9 = 1;
    if (CGRectContainsPoint(v24, *(CGPoint *)(a1 + 64)))
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
      *a5 = 1;
      return;
    }
  }
  else
  {
    int v9 = 0;
  }
  [a2 frame];
  double v12 = _UIPointValueForAxis(*(void *)(a1 + 96), v10, v11) - *(double *)(a1 + 104);
  uint64_t v13 = -[_UICollectionLayoutFramesQueryResult auxillaryItem](a4);
  if (v9)
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v12 < *(double *)(v14 + 24))
    {
      id v22 = v13;
      *(double *)(v14 + 24) = v12;
      uint64_t v15 = *(void *)(a1 + 32);
LABEL_14:
      id v20 = (void **)(*(void *)(v15 + 8) + 40);
      id v21 = a2;
      double v16 = *v20;
      *id v20 = v21;
      goto LABEL_15;
    }
  }
  if (v13)
  {
    id v22 = v13;
    double v16 = [v13 boundarySupplementaryItem];
    if ([v16 pinToVisibleBounds])
    {
LABEL_15:

      uint64_t v13 = v22;
      goto LABEL_16;
    }
    id v17 = [v22 decorationItem];
    char v18 = [v17 isBackgroundDecoration];

    uint64_t v13 = v22;
    if ((v18 & 1) == 0)
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      if (v12 < *(double *)(v19 + 24))
      {
        *(double *)(v19 + 24) = v12;
        uint64_t v15 = *(void *)(a1 + 56);
        goto LABEL_14;
      }
    }
  }
LABEL_16:
}

void __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = -[_UICollectionLayoutSolveResult indexesForInvalidatedAuxillariesOfKind:](*(id **)(a1 + 32), a2);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_5;
  v7[3] = &unk_1E52E0EC0;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = a2;
  uint64_t v5 = *(void *)(a1 + 72);
  uint64_t v12 = *(void *)(a1 + 64);
  uint64_t v13 = v5;
  double v6 = *(void **)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = v6;
  [v4 enumerateIndexesUsingBlock:v7];
}

void __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_5(uint64_t a1, uint64_t a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) supplementaryFrameWithKind:*(void *)(a1 + 40) index:a2];
  uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:*(void *)(a1 + 64)];
  if (v4)
  {
    uint64_t v6 = v4[4];
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 48), @"_UICollectionCompositionalLayoutSolver.m", 1708, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:*(void *)(a1 + 72), *(void *)(a1 + 48), @"_UICollectionCompositionalLayoutSolver.m", 1709, @"Invalid parameter not satisfying: %@", @"result.isAuxillary" object file lineNumber description];

  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v6 = v4[4];
LABEL_3:
  if (v6 == 3)
  {
    uint64_t v10 = *(void **)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v14 = v5;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    [v10 invalidateDecorationElementsOfKind:v11 atIndexPaths:v9];
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    id v7 = *(void **)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 40);
    v15[0] = v5;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v7 invalidateSupplementaryElementsOfKind:v8 atIndexPaths:v9];
LABEL_7:
  }
LABEL_8:
}

uint64_t __110___UICollectionCompositionalLayoutSolver__validatedRoundedFrame_forElementOfCategory_atIndexPath_elementKind___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = _UIStringFromCollectionElementCategory(*(void *)(a1 + 56));
  uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "_ui_shortDescription");
  [a2 appendFormat:@" Element category: %@; indexPath: %@;", v4, v5];

  if (*(void *)(a1 + 40)) {
    [a2 appendFormat:@"; elementKind: %@", *(void *)(a1 + 40)];
  }
  if ([*(id *)(a1 + 32) length] == 2)
  {
    uint64_t v6 = -[_UICollectionCompositionalLayoutSolver _existingSectionDefinitionForSectionIndex:](*(void *)(a1 + 48), [*(id *)(a1 + 32) section]);
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 group];
      uint64_t v9 = [v8 _externalDescription];
      [a2 appendFormat:@"\nSection: %@;\nGroup: %@", v7, v9];
    }
  }
  return [a2 appendFormat:@"\nInspect the layout definition responsible for creating this item and ensure that it does not result in an infinite or null frame, or a frame with members that aren't finite (inf/NaN)."];
}

@end