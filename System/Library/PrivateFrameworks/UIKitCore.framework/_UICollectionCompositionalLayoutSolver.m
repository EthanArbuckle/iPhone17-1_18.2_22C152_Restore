@interface _UICollectionCompositionalLayoutSolver
+ (CGFloat)_globalFrameForSolutionFrame:(CGFloat)a3 solutionGlobalFrame:(CGFloat)a4 contentInsetsOffset:(double)a5 container:(uint64_t)a6;
+ (CGFloat)_queryResultForItemAtIndexPath:(void *)a3 dataSourceSnapshot:(void *)a4 solutionBookmarks:(void *)a5 container:(void *)a6 globalFrame:;
+ (CGFloat)_queryResultForSectionSupplementaryViewOfKind:(void *)a3 withIndexPath:(void *)a4 solutionBookmarks:(void *)a5 container:(void *)a6 globalFrame:;
+ (double)_globalFrameForBackgroundDecoration:(uint64_t)a1 forSectionWithBookmark:(id *)a2;
+ (id)traitsRequiringInvalidationForChanges;
+ (void)_globalFrameForSectionAuxiliaryFrame:(CGFloat)a3 bookmark:(CGFloat)a4 container:(uint64_t)a5;
+ (void)_globalFrameForSolutionFrame:(CGFloat)a3 bookmark:(CGFloat)a4 container:(uint64_t)a5;
- (BOOL)auxillaryHostShouldLayoutRTL;
- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly;
- (BOOL)elementShouldAppearAboveOrthogonalScrollingContainer:(uint64_t)a1;
- (BOOL)hasPinnedSupplementaryItems;
- (BOOL)shouldInvalidateForBoundsChange:(double)a3 requiresContainerUpdate:(double)a4;
- (CGRect)_dynamicReferenceBounds;
- (CGRect)auxillaryHostPinningRect;
- (CGSize)auxillaryHostContentSize;
- (_BYTE)extendedAttributesQueryIncludingOrthogonalScrollingRegions:(double)a3;
- (_UICollectionCompositionalLayoutSolverResolveResult)_resolveOptionallyQueryingForSectionDefinitions:(int)a3 retainPreferredSizing:;
- (_UICollectionCompositionalLayoutSolverResolveResult)resolveForContainerChange:(uint64_t)a1;
- (_UICollectionCompositionalLayoutSolverResolveResult)resolveForMarginsChange:(uint64_t)a1;
- (_UICollectionCompositionalLayoutSolverResolveResult)resolveForUpdatingSectionDefinitionsWithContainer:(id *)a1;
- (_UICollectionCompositionalLayoutSolverResolveResult)resolveSolutionForUpdate:(void *)a3 container:(int)a4 ignoreEmptyUpdate:;
- (_WORD)_createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:(void *)a3 elementKind:(uint64_t)a4 frame:(int)a5 zIndex:(CGFloat)a6 pinned:(CGFloat)a7;
- (double)_containerByApplyingInsetsFromEnvironment:(void *)a1 toSize:(uint64_t)a2 onAxis:;
- (double)_firstBookmarkOffset;
- (double)_frameByExtendingGlobalSectionFrame:(uint64_t)a3 toOverlapPinnedSupplementaryInSection:(unsigned char *)a4 onEdge:(double)a5 visibleBounds:(CGFloat)a6 didExtend:(CGFloat)a7;
- (double)_globalFrameForSolution:(double)a3 offset:;
- (double)_validatedRoundedFrame:(uint64_t)a3 forElementOfCategory:(uint64_t)a4 atIndexPath:(CGFloat)a5 elementKind:(CGFloat)a6;
- (double)contentSize;
- (double)orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:(CGFloat)a3 frame:(CGFloat)a4;
- (double)preUpdateFrameForDecorationViewOfKind:(void *)a3 withInitialIndexPath:;
- (double)preUpdateFrameForItemAtInitialIndexPath:(uint64_t)a1;
- (double)preUpdateFrameForSupplementaryViewOfKind:(void *)a3 withInitialIndexPath:;
- (double)unpinnedFrameOfBoundarySupplementaryElementOfKind:(void *)a3 withIndexPath:;
- (id)_attributesQueryInfosForQueryRect:(double)a3;
- (id)_cachedDecorationAttributesForElementKind:(uint64_t)a3 indexPath:;
- (id)_cachedSupplementaryAttributesForElementKind:(uint64_t)a3 indexPath:;
- (id)_createAndCacheLayoutAttributesForDecorationItemAtIndexPath:(void *)a3 elementKind:(uint64_t)a4 frame:(double)a5 additionalContentInset:(double)a6 zIndex:(double)a7;
- (id)_createAndCacheLayoutAttributesForItemAtIndexPath:(uint64_t)a3 frame:(CGFloat)a4 zIndex:(CGFloat)a5;
- (id)_existingSectionDefinitionForSectionIndex:(uint64_t)a1;
- (id)_fetchUpdatedSectionDefinitionsFromSectionProvider;
- (id)_leadingSwipeActionsConfigurationForIndexPath:(uint64_t)a1;
- (id)_snapshotBookmarks:(void *)a1;
- (id)_trailingSwipeActionsConfigurationForIndexPath:(uint64_t)a1;
- (id)auxillaryHostAuxillaryItems;
- (id)auxillaryHostContainer;
- (id)auxillaryHostPreferredSizes;
- (id)auxillaryHostSupplementaryEnroller;
- (id)auxillaryHostTraitCollection;
- (id)initWithContainer:(void *)a3 traitCollection:(void *)a4 layoutAxis:(void *)a5 dataSourceSnapshot:(uint64_t)a6 options:(void *)a7 sectionProvider:;
- (id)itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths:(uint64_t)a1;
- (id)layoutAttributesForDecorationViewOfKind:(void *)a3 withIndexPath:;
- (id)layoutAttributesForElementsInRect:(CGFloat)a3;
- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(double)a3 withTargetPosition:(double)a4;
- (id)layoutAttributesForItemAtIndexPath:(uint64_t)a1;
- (id)layoutAttributesForSupplementaryViewOfKind:(void *)a3 withIndexPath:;
- (id)mutatedVisibleItemsForElementsForVisibleBounds:(double)a3;
- (id)resolveForInvalidatedPreferredAttributes:(double)a3 scrollOffset:(double)a4 visibleRect:(double)a5;
- (id)resolveForScrollViewLayoutAdjustmentsChange:(id *)a1;
- (id)resolveForUpdatedGlobalSupplementaries:(void *)a1;
- (id)restorableState;
- (id)sectionDescriptorForSectionIndex:(uint64_t)a1;
- (id)updatePinnedSectionSupplementaryItemsForVisibleBounds:(CGFloat)a3;
- (int64_t)auxillaryHostAuxillaryKind;
- (uint64_t)_anchorForAuxiliaryElementOfKind:(uint64_t)a1;
- (uint64_t)_invalidateAllAttributes;
- (uint64_t)_sectionHasBackgroundDecorationView:(uint64_t)a1;
- (uint64_t)_supportsSwipeActionsForIndexPath:(uint64_t)result;
- (uint64_t)_wantsSwipeActions;
- (uint64_t)elementShouldAppearBelowOrthogonalScrollingContainer:(uint64_t)a1;
- (uint64_t)enumerateSectionDefinitionsWithBlock:(uint64_t)result;
- (uint64_t)orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:(uint64_t)a3 elementKind:;
- (uint64_t)orthogonalScrollingSectionSupplementaryShouldScrollWithContentForIndexPath:(uint64_t)a3 elementKind:;
- (uint64_t)shouldEmplaceElementOutsideSectionContainer:(uint64_t)a1;
- (uint64_t)updatePreferredSizeIfNeededForPreferredLayoutAttributes:(void *)a3 withOriginalAttributes:(uint64_t)a4 debugger:;
- (uint64_t)updateVisibleBoundsForDynamicAnimator:(CGFloat)a3 previousVisibleBounds:(double)a4;
- (unint64_t)auxillaryHostLayoutAxis;
- (void)_configureLayoutForSections:(uint64_t)a1;
- (void)_didEndSwiping;
- (void)_generateInsetsEnvironmentsForLayoutSection:(uint64_t)a3 withParentInsetEnvironment:(void *)a4 sectionEnv:(void *)a5 supplementaryEnv:;
- (void)_globalSupplementaryFrameOffset;
- (void)_injectPreferredSizingDataIntoToLayoutAttributes:(void *)a3 atIndexPath:;
- (void)_invalidateAttributes:(uint64_t)a1;
- (void)_layoutAttributesForElementsInRect:(CGFloat)a3 handler:(CGFloat)a4;
- (void)_recomputeSolutionBookmarksAndContentSize;
- (void)_restoreStateFromBookmarkSnapshots:(void *)a3 bookmarks:(uint64_t)a4 update:;
- (void)_solveRetainingPreferredSizes:(id *)a1;
- (void)_solveWithSectionLayouts:(void *)a3 preferredSizesDict:(void *)a4 dataSourceSnapshot:(uint64_t)a5 update:;
- (void)_updateBookmarkOffsetsForGlobalSupplementariesIfNeeded;
- (void)_updateGeometryTranslator;
- (void)_updateSectionIndexer:(void *)a3 frame:(uint64_t)a4 solution:(double)a5 section:(double)a6;
- (void)_updateStyleForSwipeActionsConfiguration:(void *)a3 indexPath:;
- (void)_willBeginSwiping;
- (void)dealloc;
- (void)enumeratePinnedSupplementaryItems:(uint64_t)a1;
- (void)finalizeCollectionViewUpdates;
- (void)invalidateCachedDecorationAttributesForElementKind:(uint64_t)a3 atIndexPaths:;
- (void)invalidateCachedSupplementaryAttributesForElementKind:(uint64_t)a3 atIndexPaths:;
- (void)prepareForCollectionViewUpdates;
- (void)prepareForPreferredAttributesQueryForView:(_WORD *)a3 withLayoutAttributes:;
- (void)setDynamicsConfigurationHandler:(uint64_t)a1;
- (void)setOrthogonalOffset:(double)a3 forSection:(double)a4;
- (void)setSolutionBookmarks:(uint64_t)a1;
@end

@implementation _UICollectionCompositionalLayoutSolver

- (id)layoutAttributesForItemAtIndexPath:(uint64_t)a1
{
  id v2 = 0;
  if (a1 && a2)
  {
    v5 = [*(id *)(a1 + 208) objectForKeyedSubscript:a2];
    if (v5)
    {
      id v2 = v5;
    }
    else
    {
      long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      long long v15 = *MEMORY[0x1E4F1DB20];
      long long v16 = v6;
      v7 = *(void **)(a1 + 72);
      v8 = *(void **)(a1 + 48);
      id v9 = *(id *)(a1 + 184);
      id v10 = v7;
      v11 = +[_UICollectionCompositionalLayoutSolver _queryResultForItemAtIndexPath:dataSourceSnapshot:solutionBookmarks:container:globalFrame:]((uint64_t)_UICollectionCompositionalLayoutSolver, a2, v10, v9, v8, &v15);

      if (v11)
      {
        if (v11[3] == 0x7FFFFFFFFFFFFFFFLL) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = v11[3];
        }
        v13 = -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForItemAtIndexPath:frame:zIndex:](a1, a2, v12, *(CGFloat *)&v15, *((CGFloat *)&v15 + 1), *(CGFloat *)&v16, *((CGFloat *)&v16 + 1));
      }
      else
      {
        v13 = 0;
      }
      id v2 = v13;
    }
  }
  return v2;
}

+ (CGFloat)_queryResultForItemAtIndexPath:(void *)a3 dataSourceSnapshot:(void *)a4 solutionBookmarks:(void *)a5 container:(void *)a6 globalFrame:
{
  self;
  if (a2)
  {
    if ((unint64_t)[(CGFloat *)a2 length] < 2
      || [a3 globalIndexForIndexPath:a2] == 0x7FFFFFFFFFFFFFFFLL)
    {
      a2 = 0;
    }
    else
    {
      uint64_t v11 = objc_msgSend(a4, "objectAtIndexedSubscript:", -[CGFloat section](a2, "section"));
      uint64_t v12 = (double *)v11;
      if (v11) {
        v13 = *(void **)(v11 + 8);
      }
      else {
        v13 = 0;
      }
      id v14 = v13;
      objc_msgSend(v14, "frameForIndex:", -[CGFloat item](a2, "item"));
      a2 = (CGFloat *)objc_claimAutoreleasedReturnValue();

      if (a2)
      {
        +[_UICollectionCompositionalLayoutSolver _globalFrameForSolutionFrame:bookmark:container:](a2[8], a2[9], a2[10], a2[11], (uint64_t)_UICollectionCompositionalLayoutSolver, v12, a5);
        *a6 = v15;
        a6[1] = v16;
        a6[2] = v17;
        a6[3] = v18;
      }
    }
  }
  return a2;
}

+ (void)_globalFrameForSolutionFrame:(CGFloat)a3 bookmark:(CGFloat)a4 container:(uint64_t)a5
{
  self;
  if (a6)
  {
    double v14 = a6[3];
    double v13 = a6[4];
    double v15 = a6[5];
    double v16 = a6[6];
  }
  else
  {
    double v13 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v14 = 0.0;
  }
  double v17 = -[_UICollectionSectionSolutionBookmark contentInsetsOffset]((uint64_t)a6);
  +[_UICollectionCompositionalLayoutSolver _globalFrameForSolutionFrame:solutionGlobalFrame:contentInsetsOffset:container:](a1, a2, a3, a4, v14, (uint64_t)_UICollectionCompositionalLayoutSolver, a7, v13, v15, v16, v17);
}

+ (CGFloat)_globalFrameForSolutionFrame:(CGFloat)a3 solutionGlobalFrame:(CGFloat)a4 contentInsetsOffset:(double)a5 container:(uint64_t)a6
{
  uint64_t v20 = self;
  if (!a7)
  {
    uint64_t v24 = v20;
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:sel__globalFrameForSolutionFrame_solutionGlobalFrame_contentInsetsOffset_container_, v24, @"_UICollectionCompositionalLayoutSolver.m", 2977, @"Invalid parameter not satisfying: %@", @"container != nil" object file lineNumber description];
  }
  self;
  [a7 effectiveContentInsets];
  CGFloat v22 = a1 + a5 + a11 + v21 + *MEMORY[0x1E4F1DAD8];
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetWidth(v26);
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  CGRectGetHeight(v27);
  return v22;
}

- (id)_existingSectionDefinitionForSectionIndex:(uint64_t)a1
{
  if (a1)
  {
    id v3 = *(id *)(a1 + 184);
    if ([v3 count] <= a2)
    {
      id v7 = 0;
    }
    else
    {
      uint64_t v4 = [v3 objectAtIndexedSubscript:a2];
      v5 = (void *)v4;
      if (v4) {
        long long v6 = *(void **)(v4 + 16);
      }
      else {
        long long v6 = 0;
      }
      id v7 = v6;
    }
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (double)orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:(CGFloat)a3 frame:(CGFloat)a4
{
  if (!a1) {
    return 0.0;
  }
  if (a2)
  {
    uint64_t v12 = [(id)a2 indexPath];
    if ((unint64_t)[v12 length] < 2) {
      goto LABEL_16;
    }
    if (!*(unsigned char *)(a1 + 13)) {
      goto LABEL_16;
    }
    unint64_t v13 = [v12 section];
    if (![*(id *)(a1 + 88) containsIndex:v13]
      || v13 >= [*(id *)(a1 + 184) count])
    {
      goto LABEL_16;
    }
    __int16 v14 = *(_WORD *)(a2 + 288);
    if ((v14 & 1) == 0)
    {
      if ((v14 & 3) != 0)
      {
        if ((v14 & 2) == 0) {
          goto LABEL_16;
        }
        id v15 = *(id *)(a2 + 8);
        int v16 = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:elementKind:](a1, v12, (uint64_t)v15);

        if (!v16) {
          goto LABEL_16;
        }
      }
      else
      {
        id v17 = *(id *)(a2 + 8);
        char v18 = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionSupplementaryShouldScrollWithContentForIndexPath:elementKind:](a1, v12, (uint64_t)v17);

        if ((v18 & 1) == 0)
        {
LABEL_16:

          return a3;
        }
      }
    }
    v19 = [*(id *)(a1 + 184) objectAtIndexedSubscript:v13];
    uint64_t v20 = v19;
    if (v19) {
      v19 = (void *)v19[1];
    }
    [v19 orthogonalOffset];
    CGFloat v22 = a3 - v21;
    v24.origin.x = a3;
    v24.origin.y = a4;
    v24.size.width = a5;
    v24.size.height = a6;
    CGRectGetWidth(v24);
    v25.origin.x = a3;
    v25.origin.y = a4;
    v25.size.width = a5;
    v25.size.height = a6;
    CGRectGetHeight(v25);

    a3 = v22;
    goto LABEL_16;
  }
  return a3;
}

- (uint64_t)shouldEmplaceElementOutsideSectionContainer:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v4 = [a2 indexPath];
  uint64_t v5 = [v4 length];

  if (v5 == 1) {
    return 1;
  }
  id v7 = [a2 indexPath];
  unint64_t v8 = [v7 section];

  id v9 = [a2 indexPath];
  uint64_t v10 = [v9 item];

  unint64_t v11 = [*(id *)(a1 + 184) count];
  uint64_t v6 = 1;
  if ((v8 & 0x8000000000000000) == 0 && v8 < v11)
  {
    uint64_t v12 = [*(id *)(a1 + 184) objectAtIndexedSubscript:v8];
    unint64_t v13 = (void *)v12;
    if (v12) {
      __int16 v14 = *(void **)(v12 + 16);
    }
    else {
      __int16 v14 = 0;
    }
    id v15 = v14;
    if (![v15 _clipsContentToBounds]) {
      goto LABEL_25;
    }
    if (a2 && (a2[144] & 1) != 0)
    {
      uint64_t v6 = 0;
LABEL_25:

      return v6;
    }
    int v16 = -[UIBarButtonItemGroup _items]((id *)a2);
    id v17 = [v15 _auxillaryItemForElementKind:v16 category:2];
    char v18 = v17;
    if (!v17)
    {
      if (v13) {
        double v21 = (void *)v13[1];
      }
      else {
        double v21 = 0;
      }
      CGFloat v22 = [v21 sectionSupplementaryFrameWithKind:v16 index:v10];
      if (v22) {
        uint64_t v6 = [v15 _excludesBoundarySupplementariesFromClipping];
      }
      else {
        uint64_t v6 = 0;
      }

      goto LABEL_24;
    }
    v19 = [v17 item];
    if ([v19 isBackgroundDecoration])
    {
      char v20 = [v15 _clipsBackgroundDecorationsToContent];

      if ((v20 & 1) == 0)
      {
        uint64_t v6 = 1;
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
    }
    uint64_t v6 = 0;
    goto LABEL_24;
  }
  return v6;
}

- (id)_createAndCacheLayoutAttributesForDecorationItemAtIndexPath:(void *)a3 elementKind:(uint64_t)a4 frame:(double)a5 additionalContentInset:(double)a6 zIndex:(double)a7
{
  if (!a1)
  {
    CGRect v24 = 0;
    goto LABEL_14;
  }
  if (!a2)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:sel__createAndCacheLayoutAttributesForDecorationItemAtIndexPath_elementKind_frame_additionalContentInset_zIndex_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2607, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  if (![a3 length])
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:sel__createAndCacheLayoutAttributesForDecorationItemAtIndexPath_elementKind_frame_additionalContentInset_zIndex_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2608, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
  }
  CGRect v24 = [*(id *)(a1 + 120) layoutAttributesForDecorationViewOfKind:a3 withIndexPath:a2];
  objc_msgSend(v24, "setFrame:", -[_UICollectionCompositionalLayoutSolver _validatedRoundedFrame:forElementOfCategory:atIndexPath:elementKind:](a1, 2, (uint64_t)a2, (uint64_t)a3, a5 + a10, a6 + a9, a7 - (a12 + a10), a8 - (a9 + a11)));
  [v24 setZIndex:a4];
  -[_UICollectionCompositionalLayoutSolver _injectPreferredSizingDataIntoToLayoutAttributes:atIndexPath:](a1, (uint64_t)v24, a2);
  uint64_t v25 = *(void *)(a1 + 32);
  if (v25) {
    (*(void (**)(uint64_t, void *))(v25 + 16))(v25, v24);
  }
  if (a3)
  {
    if (a2) {
      goto LABEL_10;
    }
LABEL_18:
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:sel__setCachedDecorationAttributesForElementKind_indexPath_attributes_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2680, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];

    if (v24) {
      goto LABEL_11;
    }
LABEL_19:
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:sel__setCachedDecorationAttributesForElementKind_indexPath_attributes_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2681, @"Invalid parameter not satisfying: %@", @"attributes" object file lineNumber description];

    goto LABEL_11;
  }
  v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:sel__setCachedDecorationAttributesForElementKind_indexPath_attributes_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2679, @"Invalid parameter not satisfying: %@", @"elementKind" object file lineNumber description];

  if (!a2) {
    goto LABEL_18;
  }
LABEL_10:
  if (!v24) {
    goto LABEL_19;
  }
LABEL_11:
  id v26 = [*(id *)(a1 + 224) objectForKeyedSubscript:a3];
  if (!v26)
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*(id *)(a1 + 224) setObject:v26 forKeyedSubscript:a3];
  }
  [v26 setObject:v24 forKeyedSubscript:a2];

LABEL_14:
  return v24;
}

- (id)_createAndCacheLayoutAttributesForItemAtIndexPath:(uint64_t)a3 frame:(CGFloat)a4 zIndex:(CGFloat)a5
{
  if (a1)
  {
    if (!a2)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:sel__createAndCacheLayoutAttributesForItemAtIndexPath_frame_zIndex_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2560, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
    }
    __int16 v14 = [*(id *)(a1 + 208) objectForKeyedSubscript:a2];

    if (v14)
    {
      char v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:sel__createAndCacheLayoutAttributesForItemAtIndexPath_frame_zIndex_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2561, @"Invalid parameter not satisfying: %@", @"self.cachedItemAttributes[indexPath] == nil" object file lineNumber description];
    }
    int v15 = -[_UICollectionCompositionalLayoutSolver _sectionHasBackgroundDecorationView:](a1, [a2 section]);
    int v16 = [*(id *)(a1 + 120) layoutAttributesForCellWithIndexPath:a2];
    objc_msgSend(v16, "setFrame:", -[_UICollectionCompositionalLayoutSolver _validatedRoundedFrame:forElementOfCategory:atIndexPath:elementKind:](a1, 0, (uint64_t)a2, 0, a4, a5, a6, a7));
    [v16 setZIndex:a3];
    if (v15) {
      objc_msgSend(v16, "setZIndex:", objc_msgSend(v16, "zIndex") + 1);
    }
    -[_UICollectionCompositionalLayoutSolver _injectPreferredSizingDataIntoToLayoutAttributes:atIndexPath:](a1, (uint64_t)v16, a2);
    uint64_t v17 = *(void *)(a1 + 24);
    if (v17) {
      (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v16);
    }
    [*(id *)(a1 + 208) setObject:v16 forKeyedSubscript:a2];
  }
  else
  {
    int v16 = 0;
  }
  return v16;
}

- (double)_validatedRoundedFrame:(uint64_t)a3 forElementOfCategory:(uint64_t)a4 atIndexPath:(CGFloat)a5 elementKind:(CGFloat)a6
{
  int v16 = *(unsigned __int8 *)(a1 + 16);
  double v17 = *(double *)(a1 + 144);
  if (dyld_program_sdk_at_least())
  {
    *(void *)&rect.origin.y = MEMORY[0x1E4F143A8];
    *(void *)&rect.size.width = 3221225472;
    *(void *)&rect.size.height = __110___UICollectionCompositionalLayoutSolver__validatedRoundedFrame_forElementOfCategory_atIndexPath_elementKind___block_invoke_2;
    v33 = &unk_1E52E0FD8;
    uint64_t v34 = a3;
    uint64_t v35 = a4;
    uint64_t v36 = a1;
    uint64_t v37 = a2;
    char v18 = _Block_copy(&rect.origin.y);
    if (__110___UICollectionCompositionalLayoutSolver__validatedRoundedFrame_forElementOfCategory_atIndexPath_elementKind___block_invoke(a5, a6, a7, a8))
    {
      if (!v16)
      {
LABEL_9:

        return a5;
      }
      if (fabs(v17) >= 2.22044605e-16) {
        double v19 = v17;
      }
      else {
        double v19 = 1.0;
      }
      v38.origin.x = a5;
      v38.origin.y = a6;
      v38.size.width = a7;
      v38.size.height = a8;
      double v20 = round(v19 * CGRectGetMinX(v38)) / v19;
      v39.origin.x = a5;
      v39.origin.y = a6;
      v39.size.width = a7;
      v39.size.height = a8;
      double v31 = round(v19 * CGRectGetMinY(v39)) / v19;
      v40.origin.x = a5;
      v40.origin.y = a6;
      v40.size.width = a7;
      v40.size.height = a8;
      double v21 = round(v19 * CGRectGetWidth(v40)) / v19;
      v41.origin.x = a5;
      v41.origin.y = a6;
      v41.size.width = a7;
      v41.size.height = a8;
      double v22 = round(v19 * CGRectGetHeight(v41)) / v19;
      if (__110___UICollectionCompositionalLayoutSolver__validatedRoundedFrame_forElementOfCategory_atIndexPath_elementKind___block_invoke(v20, v31, v21, v22))
      {
        a5 = v20;
        goto LABEL_9;
      }
      v28 = (void *)MEMORY[0x1E4F28E78];
      v47.origin.x = v20;
      v47.origin.y = v31;
      v47.size.width = v21;
      v47.size.height = v22;
      id v26 = NSStringFromCGRect(v47);
      v48.origin.x = a5;
      v48.origin.y = a6;
      v48.size.width = a7;
      v48.size.height = a8;
      v29 = NSStringFromCGRect(v48);
      uint64_t v27 = [v28 stringWithFormat:@"UICollectionViewCompositionalLayout: Invalid frame %@ generated when rounding frame %@ to screen scale (%g).", v26, v29, *(void *)&v17];
    }
    else
    {
      uint64_t v25 = (void *)MEMORY[0x1E4F28E78];
      v46.origin.x = a5;
      v46.origin.y = a6;
      v46.size.width = a7;
      v46.size.height = a8;
      id v26 = NSStringFromCGRect(v46);
      uint64_t v27 = [v25 stringWithFormat:@"UICollectionViewCompositionalLayout: Invalid frame generated: %@.", v26];
    }

    (*((void (**)(void *, uint64_t))v18 + 2))(v18, v27);
    id v30 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v27 userInfo:0];
    objc_exception_throw(v30);
  }
  if (v16)
  {
    if (fabs(v17) < 2.22044605e-16) {
      double v17 = 1.0;
    }
    v42.origin.x = a5;
    v42.origin.y = a6;
    v42.size.width = a7;
    v42.size.height = a8;
    double v23 = round(v17 * CGRectGetMinX(v42)) / v17;
    v43.origin.x = a5;
    v43.origin.y = a6;
    v43.size.width = a7;
    v43.size.height = a8;
    CGRectGetMinY(v43);
    v44.origin.x = a5;
    v44.origin.y = a6;
    v44.size.width = a7;
    v44.size.height = a8;
    CGRectGetWidth(v44);
    v45.origin.x = a5;
    v45.origin.y = a6;
    v45.size.width = a7;
    v45.size.height = a8;
    CGRectGetHeight(v45);
    return v23;
  }
  return a5;
}

- (uint64_t)_sectionHasBackgroundDecorationView:(uint64_t)a1
{
  if ([*(id *)(a1 + 184) count] <= a2)
  {
    unint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel__sectionHasBackgroundDecorationView_, a1, @"_UICollectionCompositionalLayoutSolver.m", 3103, @"Invalid parameter not satisfying: %@", @"sectionIndex<self.solutionBookmarks.count" object file lineNumber description];
  }
  id v4 = *(id *)(a1 + 184);
  uint64_t v5 = [v4 objectAtIndexedSubscript:a2];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id v7 = *(void **)(v5 + 16);
  }
  else {
    id v7 = 0;
  }

  id v8 = v7;
  uint64_t v9 = [v8 _hasBackgroundDecorationItem];

  return v9;
}

- (void)_injectPreferredSizingDataIntoToLayoutAttributes:(void *)a3 atIndexPath:
{
  if ([a3 length] != 1)
  {
    unint64_t v6 = [a3 section];
    if (v6 < [*(id *)(a1 + 184) count])
    {
      id v7 = *(id *)(a1 + 184);
      uint64_t v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(a3, "section"));
      uint64_t v9 = (void *)v8;
      if (v8) {
        uint64_t v10 = *(void **)(v8 + 104);
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v10;
      -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)v11, [a3 item]);
      unint64_t v13 = (id *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        id v12 = v13[7];
        if (v12) {
          -[UICollectionViewLayoutAttributes _setPreferredSizingData:](a2, v12);
        }
      }
      else
      {
        id v12 = 0;
      }
    }
  }
}

- (int64_t)auxillaryHostAuxillaryKind
{
  return 1;
}

- (void)_updateSectionIndexer:(void *)a3 frame:(uint64_t)a4 solution:(double)a5 section:(double)a6
{
  if (result)
  {
    uint64_t v14 = result[8];
    if (v14 == 1) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = v14 == 2;
    }
    [a3 contentFrameIncludingAuxiliaries];
    BOOL v18 = v16 <= 0.0;
    if (v17 <= 0.0) {
      BOOL v18 = 1;
    }
    if (v18) {
      double v19 = a8;
    }
    else {
      double v19 = v17;
    }
    if (v18) {
      double v20 = a7;
    }
    else {
      double v20 = v16;
    }
    double v21 = _UISetSizeValueForAxis(v15, v20, v19, 1.79769313e308);
    CGFloat v23 = v22;
    double v24 = _UISetPointValueForAxis(v15, a5, a6, 0.0);
    return -[_UIRTree insertFrame:forIndex:](a2, a4, v24, v25, v21, v23);
  }
  return result;
}

- (void)prepareForPreferredAttributesQueryForView:(_WORD *)a3 withLayoutAttributes:
{
  if (!a1 || !*(unsigned char *)(a1 + 12)) {
    return;
  }
  if (a3)
  {
    __int16 v6 = a3[144];
    int v7 = v6 & 1;
    BOOL v8 = (v6 & 3) == 0;
    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
    int v7 = 0;
    BOOL v8 = 0;
  }
  if (!v8) {
    return;
  }
LABEL_8:
  uint64_t v9 = [a3 indexPath];
  if ([v9 length] == 1)
  {
    uint64_t v10 = -[UIBarButtonItemGroup _items]((id *)a3);
    id v11 = -[_UICollectionLayoutAuxillaryItemSolver elementKinds](*(void **)(a1 + 272));
    char v12 = [v11 containsObject:v10];

    if (v12)
    {
      -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](*(id **)(a1 + 272), v10, [v9 indexAtPosition:0]);
      uint64_t v27 = (id *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }

LABEL_17:
    uint64_t v27 = 0;
LABEL_26:

    double v20 = v27;
    goto LABEL_27;
  }
  unint64_t v13 = [v9 section];
  if (v13 >= [*(id *)(a1 + 184) count]) {
    goto LABEL_17;
  }
  uint64_t v10 = -[UIBarButtonItemGroup _items]((id *)a3);
  uint64_t v14 = [*(id *)(a1 + 184) objectAtIndexedSubscript:v13];
  uint64_t v15 = (void *)v14;
  if (v7)
  {
    if (v14) {
      double v16 = *(void **)(v14 + 8);
    }
    else {
      double v16 = 0;
    }
    id v17 = v16;
    uint64_t v18 = objc_msgSend(v17, "frameForIndex:", objc_msgSend(v9, "item"));
  }
  else
  {
    if (v14) {
      double v19 = *(void **)(v14 + 8);
    }
    else {
      double v19 = 0;
    }
    id v17 = v19;
    uint64_t v18 = objc_msgSend(v17, "supplementaryFrameWithKind:index:", v10, objc_msgSend(v9, "item"));
  }
  uint64_t v27 = (id *)v18;

LABEL_22:
  double v20 = v27;
  if (v27)
  {
    id v21 = v27[5];
    uint64_t v9 = [v21 size];

    if (!v9)
    {
      id v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:sel_prepareForPreferredAttributesQueryForView_withLayoutAttributes_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1175, @"Invalid parameter not satisfying: %@", @"size" object file lineNumber description];
    }
    double v22 = [v9 widthDimension];
    int v23 = [v22 isEstimated];

    double v24 = [v9 heightDimension];
    int v25 = [v24 isEstimated];

    [a2 _setShouldConstrainWidth:v23 ^ 1u];
    [a2 _setShouldConstrainHeight:v25 ^ 1u];
    goto LABEL_26;
  }
LABEL_27:
}

- (uint64_t)updatePreferredSizeIfNeededForPreferredLayoutAttributes:(void *)a3 withOriginalAttributes:(uint64_t)a4 debugger:
{
  if (!a1 || !*(unsigned char *)(a1 + 12)) {
    return 0;
  }
  if (a2)
  {
    __int16 v8 = *(_WORD *)(a2 + 288);
    char v9 = v8 & 1;
    BOOL v10 = (v8 & 3) == 0;
    if (v8)
    {
LABEL_8:
      char v12 = [a3 indexPath];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __130___UICollectionCompositionalLayoutSolver_updatePreferredSizeIfNeededForPreferredLayoutAttributes_withOriginalAttributes_debugger___block_invoke;
      aBlock[3] = &unk_1E52E0E20;
      char v40 = v9;
      id v13 = v12;
      id v38 = v13;
      uint64_t v39 = a4;
      uint64_t v14 = (uint64_t (**)(void *, id *, void *, uint64_t, id, void))_Block_copy(aBlock);
      if (v10 && [v13 length] == 1)
      {
        uint64_t v15 = -[_UICollectionLayoutAuxillaryItemSolver elementKinds](*(void **)(a1 + 272));
        double v16 = -[UIBarButtonItemGroup _items]((id *)a2);
        int v17 = [v15 containsObject:v16];

        if (v17)
        {
          uint64_t v18 = [v13 indexAtPosition:0];
          double v19 = (id *)*(id *)(a1 + 272);
          double v20 = -[UIBarButtonItemGroup _items]((id *)a2);
          uint64_t v21 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](v19, v20, v18);

          if (!v21)
          {
            uint64_t v11 = 0;
            goto LABEL_29;
          }
          double v22 = (id *)*(id *)(a1 + 280);
          -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v21);
          id v23 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v11 = v14[2](v14, v22, a3, a2, v23, 0);
LABEL_28:

LABEL_29:
          goto LABEL_30;
        }
      }
      unint64_t v24 = [v13 section];
      if (v24 >= [*(id *)(a1 + 184) count])
      {
        uint64_t v11 = 0;
LABEL_30:

        return v11;
      }
      id v25 = *(id *)(a1 + 184);
      uint64_t v21 = objc_msgSend(v25, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));

      if (v21) {
        id v26 = *(void **)(v21 + 8);
      }
      else {
        id v26 = 0;
      }
      id v23 = v26;
      if (v9)
      {
        objc_msgSend(v23, "frameForIndex:", objc_msgSend(v13, "item"));
        double v22 = (id *)objc_claimAutoreleasedReturnValue();
        if (v22) {
          goto LABEL_18;
        }
      }
      else
      {
        v32 = -[UIBarButtonItemGroup _items]((id *)a2);
        objc_msgSend(v23, "supplementaryFrameWithKind:index:", v32, objc_msgSend(v13, "item"));
        double v22 = (id *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
LABEL_18:
          id v27 = v22[5];
          v28 = [v27 size];
          char v29 = [v28 isEstimated];

          uint64_t v30 = -[UICollectionViewLayoutAttributes _preferredSizingData]((id *)a2);
          double v31 = (void *)v30;
          if ((v29 & 1) != 0 || v30)
          {
            if (v21) {
              v33 = *(void **)(v21 + 104);
            }
            else {
              v33 = 0;
            }
            uint64_t v34 = v33;
            id v35 = v22[5];
            uint64_t v11 = ((uint64_t (**)(void *, id *, void *, uint64_t, id, void *))v14)[2](v14, v34, a3, a2, v35, v31);
          }
          else
          {
            uint64_t v11 = 0;
          }

          goto LABEL_28;
        }
      }
      uint64_t v11 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    char v9 = 0;
    BOOL v10 = 0;
  }
  if (v10) {
    goto LABEL_8;
  }
  return 0;
}

- (void)_recomputeSolutionBookmarksAndContentSize
{
  double v45 = *(double *)(a1 + 80);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v3 = [*(id *)(a1 + 184) count];
  id v4 = *(void **)(a1 + 48);
  if (v4) {
    id v4 = (void *)v4[1];
  }
  v50 = v4;
  uint64_t v5 = (CGFloat *)MEMORY[0x1E4F1DB28];
  double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double r1 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  CGRect v48 = objc_alloc_init(_UIRTree);
  if (v3)
  {
    int v7 = 0;
    uint64_t v8 = 0;
    double v46 = fabs(v45);
    CGFloat y = v5[1];
    CGFloat x = *v5;
    double v10 = *MEMORY[0x1E4F1DAD8];
    double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    uint64_t v44 = v3 - 1;
    double v42 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v43 = *MEMORY[0x1E4F1DB30];
    double v51 = *MEMORY[0x1E4F1DAD8];
    double v52 = v9;
    uint64_t v47 = v3;
    do
    {
      uint64_t v11 = objc_msgSend(*(id *)(a1 + 184), "objectAtIndexedSubscript:", v8, *(void *)&v42, *(void *)&v43);
      char v12 = (void *)v11;
      if (v11) {
        id v13 = *(void **)(v11 + 8);
      }
      else {
        id v13 = 0;
      }
      id v14 = v13;
      uint64_t v15 = [v14 layoutSection];
      int v16 = [v15 _isEmptySection];
      [v15 _preBoundaryPadding];
      double v18 = v17;
      [v15 _postBoundaryPadding];
      double v20 = v19;
      if (v46 >= 2.22044605e-16 && ((v7 ^ 1) & 1) == 0 && (v16 & 1) == 0)
      {
        double v10 = v10 + _UISetPointValueForAxis(v2, v51, v52, v45);
        double v9 = v9 + v21;
      }
      int v53 = v16;
      if (fabs(v18) >= 2.22044605e-16)
      {
        double v10 = v10 + _UISetPointValueForAxis(v2, v51, v52, v18);
        double v9 = v9 + v22;
      }
      id v57 = 0;
      v58[0] = 0;
      -[_UICollectionCompositionalLayoutSolver _generateInsetsEnvironmentsForLayoutSection:withParentInsetEnvironment:sectionEnv:supplementaryEnv:](a1, v15, (uint64_t)v50, v58, &v57);
      id v23 = v58[0];
      id v24 = v57;
      double v25 = -[_UICollectionCompositionalLayoutSolver _globalFrameForSolution:offset:](a1, v14, v10);
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      v32 = [_UICollectionSectionSolutionBookmark alloc];
      if (v12) {
        v33 = (void *)v12[13];
      }
      else {
        v33 = 0;
      }
      uint64_t v34 = -[_UICollectionSectionSolutionBookmark initWithSolution:globalFrame:globalPinningFrame:insetEnvironment:supplementaryInsetEnvironment:section:preferredSizes:]((id *)&v32->super.isa, v14, v23, v24, v15, v33, v25, v27, v29, v31, v25, v27, v29, v31);
      [v49 addObject:v34];
      v59.origin.CGFloat y = y;
      v59.origin.CGFloat x = x;
      v59.size.double width = width;
      v59.size.height = r1;
      v61.origin.CGFloat x = v25;
      v61.origin.CGFloat y = v27;
      v61.size.double width = v29;
      v61.size.height = v31;
      CGRect v60 = CGRectUnion(v59, v61);
      CGFloat y = v60.origin.y;
      CGFloat x = v60.origin.x;
      double width = v60.size.width;
      double r1 = v60.size.height;
      -[_UICollectionCompositionalLayoutSolver _updateSectionIndexer:frame:solution:section:]((void *)a1, v48, v14, v8, v25, v27, v29, v31);

      double v35 = _UISizeValueForAxis(v2, v29, v31);
      double v36 = _UIPointValueForAxis(v2, v10, v9);
      double v10 = _UISetPointValueForAxis(v2, v10, v9, v35 + v36);
      double v9 = v37;
      if (fabs(v20) >= 2.22044605e-16)
      {
        uint64_t v38 = v47;
        if (v44 == v8)
        {
          double width = width + _UISetSizeValueForAxis(v2, v43, v42, v20);
          double r1 = r1 + v39;
        }
        else
        {
          double v10 = v10 + _UISetPointValueForAxis(v2, v51, v52, v20);
          double v9 = v9 + v40;
        }
      }
      else
      {
        uint64_t v38 = v47;
      }
      v7 |= v53 ^ 1;

      ++v8;
    }
    while (v38 != v8);
  }
  *(double *)(a1 + 304) = width;
  *(double *)(a1 + 312) = r1;
  -[_UICollectionCompositionalLayoutSolver setSolutionBookmarks:](a1, v49);
  CGRect v41 = *(void **)(a1 + 192);
  *(void *)(a1 + 192) = v48;
}

- (id)_cachedDecorationAttributesForElementKind:(uint64_t)a3 indexPath:
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
LABEL_4:
        __int16 v6 = [*(id *)(a1 + 224) objectForKeyedSubscript:a2];
        int v7 = v6;
        if (v6)
        {
          uint64_t v8 = [v6 objectForKeyedSubscript:a3];
        }
        else
        {
          uint64_t v8 = 0;
        }

        goto LABEL_8;
      }
    }
    else
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__cachedDecorationAttributesForElementKind_indexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2667, @"Invalid parameter not satisfying: %@", @"elementKind" object file lineNumber description];

      if (a3) {
        goto LABEL_4;
      }
    }
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel__cachedDecorationAttributesForElementKind_indexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2668, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];

    goto LABEL_4;
  }
  uint64_t v8 = 0;
LABEL_8:
  return v8;
}

- (double)_globalFrameForSolution:(double)a3 offset:
{
  [a2 contentFrameIncludingAuxiliaries];
  double width = v19.size.width;
  double height = v19.size.height;
  if (!CGRectIsEmpty(v19))
  {
    [*(id *)(a1 + 48) contentSize];
    double v9 = v8;
    double v11 = v10;
    char v12 = [a2 layoutSection];
    int v13 = [v12 scrollsOrthogonally];

    uint64_t v14 = [a2 layoutAxis];
    uint64_t v15 = v14;
    if (v13)
    {
      double v16 = _UISizeValueForAxis(v14, v9, v11);
      _UISetSizeValueForAxis(v15, width, height, v16);
    }
    else
    {
      if (v14 == 1) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = v14 == 2;
      }
      _UISizeClampToMinimumSizeForAxis(v17, width, height, v9, v11);
    }
  }
  return a3;
}

- (id)_cachedSupplementaryAttributesForElementKind:(uint64_t)a3 indexPath:
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
LABEL_4:
        __int16 v6 = [*(id *)(a1 + 216) objectForKeyedSubscript:a2];
        int v7 = v6;
        if (v6)
        {
          double v8 = [v6 objectForKeyedSubscript:a3];
        }
        else
        {
          double v8 = 0;
        }

        goto LABEL_8;
      }
    }
    else
    {
      double v10 = [MEMORY[0x1E4F28B00] currentHandler];
      [v10 handleFailureInMethod:sel__cachedSupplementaryAttributesForElementKind_indexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2642, @"Invalid parameter not satisfying: %@", @"elementKind" object file lineNumber description];

      if (a3) {
        goto LABEL_4;
      }
    }
    double v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel__cachedSupplementaryAttributesForElementKind_indexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2643, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];

    goto LABEL_4;
  }
  double v8 = 0;
LABEL_8:
  return v8;
}

+ (double)_globalFrameForBackgroundDecoration:(uint64_t)a1 forSectionWithBookmark:(id *)a2
{
  self;
  if (!a2) {
    return *MEMORY[0x1E4F1DB20];
  }
  -[_UICollectionSectionSolutionBookmark memoizedDescriptor]((uint64_t)a2);
  uint64_t v3 = (char *)objc_claimAutoreleasedReturnValue();
  id v4 = a2[2];
  int v5 = [v4 _clipsBackgroundDecorationsToContent];
  if (v3)
  {
    uint64_t v6 = 112;
    if (v5) {
      uint64_t v6 = 144;
    }
    double v7 = *(double *)&v3[v6];
  }
  else
  {
    double v7 = 0.0;
  }
  if ((dyld_program_sdk_at_least() & 1) == 0 && [a2[2] scrollsOrthogonally])
  {
    id v8 = a2[11];
    [v8 effectiveInsets];
    _UITotalEdgeDimensionsForLayoutAxis([a2[1] layoutAxis], v9, v10, v11, v12);
  }
  return v7;
}

- (_WORD)_createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:(void *)a3 elementKind:(uint64_t)a4 frame:(int)a5 zIndex:(CGFloat)a6 pinned:(CGFloat)a7
{
  if (!a1)
  {
    double v20 = 0;
    goto LABEL_25;
  }
  if (!a2)
  {
    double v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:sel__createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath_elementKind_frame_zIndex_pinned_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2584, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  if (![a3 length])
  {
    double v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:sel__createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath_elementKind_frame_zIndex_pinned_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2585, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
  }
  if ((unint64_t)[a2 length] >= 2)
  {
    int v18 = -[_UICollectionCompositionalLayoutSolver _sectionHasBackgroundDecorationView:](a1, [a2 section]);
    uint64_t v19 = a4 <= 1 ? 1 : a4;
    if (v18) {
      a4 = v19;
    }
  }
  double v20 = [*(id *)(a1 + 120) layoutAttributesForSupplementaryViewOfKind:a3 withIndexPath:a2];
  objc_msgSend(v20, "setFrame:", -[_UICollectionCompositionalLayoutSolver _validatedRoundedFrame:forElementOfCategory:atIndexPath:elementKind:](a1, 1, (uint64_t)a2, (uint64_t)a3, a6, a7, a8, a9));
  [v20 setZIndex:a4];
  if (v20)
  {
    if (a5) {
      __int16 v21 = 2048;
    }
    else {
      __int16 v21 = 0;
    }
    v20[144] = v20[144] & 0xF7FF | v21;
  }
  -[_UICollectionCompositionalLayoutSolver _injectPreferredSizingDataIntoToLayoutAttributes:atIndexPath:](a1, (uint64_t)v20, a2);
  uint64_t v22 = *(void *)(a1 + 40);
  if (v22) {
    (*(void (**)(uint64_t, _WORD *))(v22 + 16))(v22, v20);
  }
  if (a3)
  {
    if (a2) {
      goto LABEL_21;
    }
LABEL_29:
    double v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:sel__setCachedSupplementaryAttributesForElementKind_indexPath_attributes_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2655, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];

    if (v20) {
      goto LABEL_22;
    }
LABEL_30:
    double v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:sel__setCachedSupplementaryAttributesForElementKind_indexPath_attributes_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2656, @"Invalid parameter not satisfying: %@", @"attributes" object file lineNumber description];

    goto LABEL_22;
  }
  double v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:sel__setCachedSupplementaryAttributesForElementKind_indexPath_attributes_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2654, @"Invalid parameter not satisfying: %@", @"elementKind" object file lineNumber description];

  if (!a2) {
    goto LABEL_29;
  }
LABEL_21:
  if (!v20) {
    goto LABEL_30;
  }
LABEL_22:
  id v23 = [*(id *)(a1 + 216) objectForKeyedSubscript:a3];
  if (!v23)
  {
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [*(id *)(a1 + 216) setObject:v23 forKeyedSubscript:a3];
  }
  [v23 setObject:v20 forKeyedSubscript:a2];

LABEL_25:
  return v20;
}

- (id)auxillaryHostAuxillaryItems
{
  if (self) {
    globalSupplementaryItems = self->_globalSupplementaryItems;
  }
  else {
    globalSupplementaryItems = 0;
  }
  uint64_t v3 = globalSupplementaryItems;
  return v3;
}

- (unint64_t)auxillaryHostLayoutAxis
{
  if (self) {
    return *(void *)(self + 64);
  }
  return self;
}

- (id)auxillaryHostTraitCollection
{
  if (self) {
    self = (_UICollectionCompositionalLayoutSolver *)self->_traitCollection;
  }
  return self;
}

- (id)auxillaryHostSupplementaryEnroller
{
  uint64_t v2 = objc_alloc_init(_UICollectionLayoutSupplementaryEnroller);
  return v2;
}

- (BOOL)auxillaryHostShouldLayoutRTL
{
  if (self) {
    LOBYTE(self) = self->_layoutRTL;
  }
  return (char)self;
}

- (id)auxillaryHostPreferredSizes
{
  if (self) {
    self = (_UICollectionCompositionalLayoutSolver *)self->_globalSupplementaryPreferredSizes;
  }
  return self;
}

- (CGSize)auxillaryHostContentSize
{
  if (!self)
  {
    double width = 0.0;
    if (dyld_program_sdk_at_least())
    {
      uint64_t v6 = 0;
      container = 0;
      double height = 0.0;
      goto LABEL_7;
    }
    double height = 0.0;
LABEL_13:
    double v11 = width;
    double v12 = height;
    goto LABEL_14;
  }
  double width = self->_actualContentSize.width;
  double height = self->_actualContentSize.height;
  if (!dyld_program_sdk_at_least()) {
    goto LABEL_13;
  }
  unint64_t layoutAxis = self->_layoutAxis;
  if (layoutAxis == 1) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = layoutAxis == 2;
  }
  container = self->_container;
LABEL_7:
  [(_UICollectionLayoutContainer *)container effectiveContentSize];
  double v10 = _UISizeValueForAxis(v6, v8, v9);
  double v11 = _UISetSizeValueForAxis(v6, width, height, v10);
LABEL_14:
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (id)auxillaryHostContainer
{
  if (self) {
    container = self->_container;
  }
  else {
    container = 0;
  }
  uint64_t v3 = container;
  return v3;
}

- (id)mutatedVisibleItemsForElementsForVisibleBounds:(double)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v67 = 0;
    v68 = &v67;
    uint64_t v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__30;
    v71 = __Block_byref_object_dispose__30;
    id v72 = 0;
    v65[0] = 0;
    v65[1] = v65;
    v65[2] = 0x3032000000;
    v65[3] = __Block_byref_object_copy__30;
    v65[4] = __Block_byref_object_dispose__30;
    id v66 = 0;
    -[_UICollectionCompositionalLayoutSolver _attributesQueryInfosForQueryRect:](a1, a2, a3, a4, a5);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v62;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v62 != v11) {
            objc_enumerationMutation(obj);
          }
          int v13 = *(double **)(*((void *)&v61 + 1) + 8 * v12);
          if (v13)
          {
            CGFloat v14 = v13[2];
            CGFloat v15 = v13[3];
            CGFloat v16 = v13[4];
            CGFloat v17 = v13[5];
          }
          else
          {
            CGFloat v15 = 0.0;
            CGFloat v16 = 0.0;
            CGFloat v17 = 0.0;
            CGFloat v14 = 0.0;
          }
          v60[0] = MEMORY[0x1E4F143A8];
          v60[1] = 3221225472;
          v60[2] = __89___UICollectionCompositionalLayoutSolver_mutatedVisibleItemsForElementsForVisibleBounds___block_invoke;
          v60[3] = &unk_1E52E0DD0;
          v60[4] = v65;
          v60[5] = &v67;
          -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](a1, (uint64_t)v60, v14, v15, v16, v17);
          ++v12;
        }
        while (v10 != v12);
        uint64_t v18 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
        uint64_t v10 = v18;
      }
      while (v18);
    }

    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v49 = (id)v68[5];
    double v20 = 0;
    uint64_t v21 = [v49 countByEnumeratingWithState:&v56 objects:v74 count:16];
    if (v21)
    {
      uint64_t v51 = *(void *)v57;
      double v22 = *MEMORY[0x1E4F1DAD8];
      double v23 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v57 != v51) {
            objc_enumerationMutation(v49);
          }
          double v25 = *(void **)(*((void *)&v56 + 1) + 8 * v24);
          id v26 = (id)[v25 layoutSection];
          if (!v26)
          {
            double v45 = [MEMORY[0x1E4F28B00] currentHandler];
            [v45 handleFailureInMethod:sel_mutatedVisibleItemsForElementsForVisibleBounds_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1100, @"Invalid parameter not satisfying: %@", @"layoutSection" object file lineNumber description];
          }
          if ([v26 _hasVisibleItemsHandler])
          {
            id v27 = (id)[(id)v68[5] objectForKey:v25];
            if (!v27)
            {
              double v46 = [MEMORY[0x1E4F28B00] currentHandler];
              [v46 handleFailureInMethod:sel_mutatedVisibleItemsForElementsForVisibleBounds_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1104, @"Invalid parameter not satisfying: %@", @"sectionVisibleItemCandidates" object file lineNumber description];
            }
            uint64_t v28 = [v25 layoutAxis];
            [v25 orthogonalOffset];
            double v31 = _UIPointValueForAxis(v28, v29, v30);
            double v32 = _UISetPointValueForAxis(v28, v22, v23, v31);
            double v34 = v33;
            if (!v20)
            {
              double v35 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], a4, a5, 0.0, 0.0, 0.0, 0.0);
              double v36 = [_UICollectionLayoutEnvironment alloc];
              id v37 = *(id *)(a1 + 56);
              id v38 = *(id *)(a1 + 72);
              double v20 = [(_UICollectionLayoutEnvironment *)v36 initWithContainer:v35 traitCollection:v37 dataSourceSnapshot:v38];
            }
            double v39 = [v26 visibleItemsInvalidationHandler];
            ((void (**)(void, id, _UICollectionLayoutEnvironment *, double, double))v39)[2](v39, v27, v20, a2 + v32, a3 + v34);

            if (*(unsigned char *)(a1 + 12))
            {
              if (mutatedVisibleItemsForElementsForVisibleBounds__once != -1) {
                dispatch_once(&mutatedVisibleItemsForElementsForVisibleBounds__once, &__block_literal_global_100);
              }
            }
            else
            {
              long long v54 = 0u;
              long long v55 = 0u;
              long long v52 = 0u;
              long long v53 = 0u;
              id v40 = v27;
              uint64_t v41 = [v40 countByEnumeratingWithState:&v52 objects:v73 count:16];
              if (v41)
              {
                uint64_t v42 = *(void *)v53;
                do
                {
                  for (uint64_t i = 0; i != v41; ++i)
                  {
                    if (*(void *)v53 != v42) {
                      objc_enumerationMutation(v40);
                    }
                    uint64_t v44 = *(void *)(*((void *)&v52 + 1) + 8 * i);
                    if (v44 && *(unsigned char *)(v44 + 8)) {
                      objc_msgSend(v19, "addObject:");
                    }
                  }
                  uint64_t v41 = [v40 countByEnumeratingWithState:&v52 objects:v73 count:16];
                }
                while (v41);
              }
            }
          }
          ++v24;
        }
        while (v24 != v21);
        uint64_t v47 = [v49 countByEnumeratingWithState:&v56 objects:v74 count:16];
        uint64_t v21 = v47;
      }
      while (v47);
    }

    _Block_object_dispose(v65, 8);
    _Block_object_dispose(&v67, 8);
  }
  else
  {
    id v19 = 0;
  }
  return v19;
}

- (id)layoutAttributesForElementsInRect:(CGFloat)a3
{
  if (a1)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __76___UICollectionCompositionalLayoutSolver_layoutAttributesForElementsInRect___block_invoke;
    v13[3] = &unk_1E52E0D80;
    id v11 = v10;
    id v14 = v11;
    -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](a1, (uint64_t)v13, a2, a3, a4, a5);
  }
  else
  {
    id v11 = 0;
  }
  return v11;
}

- (_BYTE)extendedAttributesQueryIncludingOrthogonalScrollingRegions:(double)a3
{
  int v5 = a1;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    char v11 = v5[13];
    uint64_t v12 = -[_UICollectionCompositionalLayoutSolver _attributesQueryInfosForQueryRect:]((uint64_t)v5, a2, a3, a4, a5);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
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
          CGFloat v17 = *(double **)(*((void *)&v28 + 1) + 8 * v16);
          if (v17)
          {
            CGFloat v19 = v17[2];
            CGFloat v18 = v17[3];
            CGFloat v21 = v17[4];
            CGFloat v20 = v17[5];
            CGFloat v17 = (double *)*((void *)v17 + 1);
          }
          else
          {
            CGFloat v20 = 0.0;
            CGFloat v21 = 0.0;
            CGFloat v18 = 0.0;
            CGFloat v19 = 0.0;
          }
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __101___UICollectionCompositionalLayoutSolver_extendedAttributesQueryIncludingOrthogonalScrollingRegions___block_invoke;
          v24[3] = &unk_1E52E0F60;
          char v27 = v11;
          id v26 = v17;
          v24[4] = v5;
          id v25 = v10;
          -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:]((uint64_t)v5, (uint64_t)v24, v19, v18, v21, v20);

          ++v16;
        }
        while (v14 != v16);
        uint64_t v22 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
        uint64_t v14 = v22;
      }
      while (v22);
    }
    int v5 = [v10 allObjects];
  }
  return v5;
}

- (void)_layoutAttributesForElementsInRect:(CGFloat)a3 handler:(CGFloat)a4
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    long long v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:sel__layoutAttributesForElementsInRect_handler_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2692, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];
  }
  uint64_t v12 = *(void **)(a1 + 48);
  self;
  [v12 effectiveContentInsets];
  double v13 = *MEMORY[0x1E4F1DAD8];
  double v14 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v16 = v15 + *MEMORY[0x1E4F1DAD8];
  double v62 = v17 + v14;
  [*(id *)(a1 + 48) effectiveContentInsets];
  if (v19 == 0.0 && v18 == 0.0 && v21 == 0.0 && v20 == 0.0)
  {
    CGFloat Width = a5;
    double v23 = a4;
    double v24 = a3;
  }
  else
  {
    double v25 = v14 - v18;
    double v24 = a3 + v13 - v19;
    double v23 = a4 + v25;
    v89.origin.CGFloat x = a3;
    v89.origin.CGFloat y = a4;
    v89.size.double width = a5;
    v89.size.double height = Height;
    CGFloat Width = CGRectGetWidth(v89);
    v90.origin.CGFloat x = a3;
    v90.origin.CGFloat y = a4;
    v90.size.double width = a5;
    v90.size.double height = Height;
    Height = CGRectGetHeight(v90);
  }
  _UINormalizeRectForPositiveOrigin(v24, v23, Width, Height);
  float64_t v59 = v27;
  float64_t v60 = v26;
  float64_t v57 = v28;
  float64_t v58 = v29;
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2020000000;
  char v84 = 0;
  id v30 = *(id *)(a1 + 184);
  char v55 = *(unsigned char *)(a1 + 8);
  *(unsigned char *)(a1 + 8) = v55 | 1;
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __85___UICollectionCompositionalLayoutSolver__layoutAttributesForElementsInRect_handler___block_invoke;
  v69[3] = &unk_1E52E1000;
  double v74 = v16;
  double v75 = v62;
  float64_t v76 = v60;
  float64_t v77 = v57;
  float64_t v78 = v59;
  float64_t v79 = v58;
  id v56 = v30;
  id v70 = v56;
  uint64_t v71 = a1;
  uint64_t v72 = a2;
  v73 = &v81;
  v80 = sel__layoutAttributesForElementsInRect_handler_;
  if ([*(id *)(a1 + 264) count])
  {
    -[_UICollectionCompositionalLayoutSolver _globalSupplementaryFrameOffset](a1);
    -[_UICollectionLayoutAuxillaryItemSolver queryFramesIntersectingRect:frameOffset:](*(void *)(a1 + 272), v60, v57, v59, v58, v31, v32);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = [obj countByEnumeratingWithState:&v65 objects:v87 count:16];
    if (v33)
    {
      uint64_t v63 = *(void *)v66;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v66 != v63) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = *(void *)(*((void *)&v65 + 1) + 8 * v34);
          if (v35) {
            uint64_t v36 = *(void *)(v35 + 16);
          }
          else {
            uint64_t v36 = 0;
          }
          id v37 = [MEMORY[0x1E4F28D58] indexPathWithIndex:v36];
          if (v35) {
            id v38 = *(void **)(v35 + 40);
          }
          else {
            id v38 = 0;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            CGRect v48 = [MEMORY[0x1E4F28B00] currentHandler];
            [v48 handleFailureInMethod:sel__layoutAttributesForElementsInRect_handler_ object:a1 file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:2827 description:@"Fatal: frame result.item is incorrect class."];
          }
          id v39 = (id)[v38 elementKind];
          id v40 = -[_UICollectionCompositionalLayoutSolver _cachedSupplementaryAttributesForElementKind:indexPath:](a1, (uint64_t)v39, (uint64_t)v37);
          if (!v40)
          {
            if (v35)
            {
              CGFloat v42 = *(double *)(v35 + 64);
              CGFloat v41 = *(double *)(v35 + 72);
              CGFloat v43 = *(double *)(v35 + 80);
              CGFloat v44 = *(double *)(v35 + 88);
            }
            else
            {
              CGFloat v41 = 0.0;
              CGFloat v43 = 0.0;
              CGFloat v44 = 0.0;
              CGFloat v42 = 0.0;
            }
            uint64_t v45 = [v38 zIndex];
            if (v35) {
              BOOL v46 = *(unsigned char *)(v35 + 8) != 0;
            }
            else {
              BOOL v46 = 0;
            }
            id v40 = -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:elementKind:frame:zIndex:pinned:](a1, v37, v39, v45, v46, v42, v41, v43, v44);
          }
          (*(void (**)(uint64_t, void *, void, uint64_t, uint64_t *))(a2 + 16))(a2, v40, 0, v35, v82 + 3);
          BOOL v47 = *((unsigned char *)v82 + 24) == 0;

          if (!v47)
          {

            goto LABEL_40;
          }
          ++v34;
        }
        while (v33 != v34);
        uint64_t v49 = [obj countByEnumeratingWithState:&v65 objects:v87 count:16];
        uint64_t v33 = v49;
      }
      while (v49);
    }
  }
  uint64_t v50 = *(void *)(a1 + 192);
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __85___UICollectionCompositionalLayoutSolver__layoutAttributesForElementsInRect_handler___block_invoke_2;
  v64[3] = &unk_1E52E1028;
  v64[4] = &v81;
  v64[5] = v69;
  if (v50)
  {
    char v86 = 0;
    uint64_t v51 = *(void **)(v50 + 8);
    v53.f64[0] = v59;
    v52.f64[0] = v60;
    v52.f64[1] = v57;
    v53.f64[1] = v58;
    v85[0] = vaddq_f64(v52, vminnmq_f64(v53, (float64x2_t)0));
    v85[1] = vabsq_f64(v53);
    _UIRTreeContainerNode<unsigned long>::enumerateElementsIntersecting(v51, v85, &v86, (uint64_t)v64);
  }
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a1 + 8) & 0xFE | v55 & 1;
LABEL_40:

  _Block_object_dispose(&v81, 8);
}

- (id)_attributesQueryInfosForQueryRect:(double)a3
{
  uint64_t v6 = [_UICollectionLayoutExtendedAttributesQueryInfo alloc];
  if (v6)
  {
    v29.receiver = v6;
    v29.super_class = (Class)_UICollectionLayoutExtendedAttributesQueryInfo;
    id v7 = objc_msgSendSuper2(&v29, sel_init);
    double v8 = v7;
    if (v7)
    {
      *((double *)v7 + 2) = a2;
      *((double *)v7 + 3) = a3;
      *((double *)v7 + 4) = a4;
      *((double *)v7 + 5) = a5;
      *((void *)v7 + 1) = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    double v8 = 0;
  }
  double v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v8, 0);
  id v10 = v9;
  if (*(unsigned char *)(a1 + 13))
  {
    uint64_t v11 = *(void *)(a1 + 184);
    uint64_t v12 = *(void *)(a1 + 192);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __76___UICollectionCompositionalLayoutSolver__attributesQueryInfosForQueryRect___block_invoke;
    v22[3] = &unk_1E52E0F88;
    uint64_t v24 = v11;
    double v25 = a2;
    double v26 = a3;
    double v27 = a4;
    double v28 = a5;
    id v13 = v9;
    id v23 = v13;
    if (v12)
    {
      char v31 = 0;
      double v14 = *(void **)(v12 + 8);
      v15.f64[0] = a2;
      v16.f64[0] = a4;
      v15.f64[1] = a3;
      v16.f64[1] = a5;
      objc_super v29 = (objc_super)vaddq_f64(v15, vminnmq_f64(v16, (float64x2_t)0));
      float64x2_t v30 = vabsq_f64(v16);
      _UIRTreeContainerNode<unsigned long>::enumerateElementsIntersecting(v14, (float64x2_t *)&v29, &v31, (uint64_t)v22);
      id v13 = v23;
    }
  }
  return v10;
}

- (void)_globalSupplementaryFrameOffset
{
  [*(id *)(a1 + 48) effectiveContentInsets];
  if (v3 != 0.0 || v2 != 0.0 || v5 != 0.0 || v4 != 0.0)
  {
    uint64_t v6 = *(void *)(a1 + 64);
    if (v6 == 1) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = v6 == 2;
    }
    double v8 = _UILeadingOffsetForInsetsAlongAxis(v7, v2, v3);
    _UISetPointValueForAxis(v7, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v8);
  }
}

- (_UICollectionCompositionalLayoutSolverResolveResult)resolveForContainerChange:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      double v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:sel_resolveForContainerChange_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1269, @"Invalid parameter not satisfying: %@", @"container" object file lineNumber description];
    }
    double v4 = objc_alloc_init(_UICollectionCompositionalLayoutSolverResolveResult);
    double v5 = (void **)(a1 + 48);
    [*(id *)(a1 + 48) effectiveContentSize];
    double v7 = v6;
    double v9 = v8;
    [a2 effectiveContentSize];
    double v11 = v10;
    double v13 = v12;
    if (a2) {
      double v14 = (void *)a2[1];
    }
    else {
      double v14 = 0;
    }
    id v15 = v14;
    float64x2_t v16 = *v5;
    if (*v5) {
      float64x2_t v16 = (void *)v16[1];
    }
    double v17 = v16;
    int v18 = [v15 isEqual:v17];

    objc_storeStrong((id *)(a1 + 48), a2);
    id v19 = *(id *)(a1 + 184);
    uint64_t v20 = [v19 count];
    uint64_t v21 = [*(id *)(a1 + 72) numberOfSections];

    if (v18 && v7 == v11 && v9 == v13 && v20 == v21)
    {
      uint64_t v22 = -[_UICollectionCompositionalLayoutSolver _resolveOptionallyQueryingForSectionDefinitions:retainPreferredSizing:](a1, 0, 1);

      -[_UICollectionCompositionalLayoutSolver _recomputeSolutionBookmarksAndContentSize](a1);
      -[_UICollectionLayoutAuxillaryItemSolver resolve](*(void *)(a1 + 272));
      -[_UICollectionCompositionalLayoutSolver _updateBookmarkOffsetsForGlobalSupplementariesIfNeeded](a1);
      double v4 = (_UICollectionCompositionalLayoutSolverResolveResult *)v22;
    }
    else
    {
      char v23 = dyld_program_sdk_at_least();
      -[_UICollectionCompositionalLayoutSolver _solveRetainingPreferredSizes:]((id *)a1, v23);
      [(_UICollectionCompositionalLayoutSolverResolveResult *)v4 setSectionsWereRequeried:1];
    }
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

- (id)initWithContainer:(void *)a3 traitCollection:(void *)a4 layoutAxis:(void *)a5 dataSourceSnapshot:(uint64_t)a6 options:(void *)a7 sectionProvider:
{
  if (!a1) {
    return 0;
  }
  v32.receiver = a1;
  v32.super_class = (Class)_UICollectionCompositionalLayoutSolver;
  double v13 = (id *)objc_msgSendSuper2(&v32, sel_init);
  double v14 = v13;
  if (v13)
  {
    objc_storeStrong(v13 + 14, (id)a6);
    objc_storeStrong(v14 + 6, a2);
    objc_storeStrong(v14 + 7, a3);
    v14[8] = a4;
    objc_storeStrong(v14 + 9, a5);
    if (a6)
    {
      v14[10] = *(id *)(a6 + 16);
      *((unsigned char *)v14 + 17) = *(unsigned char *)(a6 + 8);
      id v15 = *(void **)(a6 + 24);
    }
    else
    {
      id v15 = 0;
      v14[10] = 0;
      *((unsigned char *)v14 + 17) = 0;
    }
    objc_storeStrong(v14 + 15, v15);
    if (a6) {
      float64x2_t v16 = *(void **)(a6 + 32);
    }
    else {
      float64x2_t v16 = 0;
    }
    objc_storeStrong(v14 + 16, v16);
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v18 = v14[26];
    v14[26] = v17;

    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v20 = v14[27];
    v14[27] = v19;

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v22 = v14[28];
    v14[28] = v21;

    if (a6)
    {
      objc_storeStrong(v14 + 17, *(id *)(a6 + 40));
      BOOL v23 = *(unsigned char *)(a6 + 9) != 0;
    }
    else
    {
      id v31 = v14[17];
      v14[17] = 0;

      BOOL v23 = 0;
    }
    *((unsigned char *)v14 + 16) = v23;
    if (a3)
    {
      [a3 displayScale];
      v14[18] = v24;
      if (a6)
      {
LABEL_11:
        double v25 = *(void **)(a6 + 48);
LABEL_12:
        objc_storeStrong(v14 + 33, v25);
        uint64_t v26 = [a7 copy];
        id v27 = v14[19];
        v14[19] = (id)v26;

        v14[37] = (id)3;
        goto LABEL_13;
      }
    }
    else
    {
      objc_super v29 = +[UIScreen mainScreen];
      [v29 scale];
      v14[18] = v30;

      if (a6) {
        goto LABEL_11;
      }
    }
    double v25 = 0;
    goto LABEL_12;
  }
LABEL_13:
  -[_UICollectionCompositionalLayoutSolver _solveRetainingPreferredSizes:](v14, 0);
  return v14;
}

- (void)_solveRetainingPreferredSizes:(id *)a1
{
  if (a1)
  {
    uint64_t v4 = [a1[9] numberOfSections];
    if (v4 == [a1[23] count]) {
      char v5 = a2;
    }
    else {
      char v5 = 0;
    }
    double v6 = [a1 _fetchUpdatedSectionDefinitionsFromSectionProvider];
    if ([v6 count] != v4)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__solveRetainingPreferredSizes_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2272, @"Compositional layout internal error: The number of NSCollectionLayoutSections returned (%ld) does not match the number of sections in the data source snapshot (%ld)", objc_msgSend(v6, "count"), v4);
    }
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __72___UICollectionCompositionalLayoutSolver__solveRetainingPreferredSizes___block_invoke;
    v10[3] = &unk_1E52E0FB0;
    char v12 = v5;
    v10[4] = a1;
    id v11 = v7;
    id v8 = v7;
    [v6 enumerateObjectsUsingBlock:v10];
    -[_UICollectionCompositionalLayoutSolver _configureLayoutForSections:]((uint64_t)a1, v6);
    -[_UICollectionCompositionalLayoutSolver _solveWithSectionLayouts:preferredSizesDict:dataSourceSnapshot:update:]((uint64_t)a1, v6, v8, a1[9], 0);
  }
}

- (id)sectionDescriptorForSectionIndex:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = [*(id *)(a1 + 184) count];
    char v5 = 0;
    if ((a2 & 0x8000000000000000) == 0 && v4 > a2)
    {
      double v6 = [*(id *)(a1 + 184) objectAtIndexedSubscript:a2];
      char v5 = -[_UICollectionSectionSolutionBookmark memoizedDescriptor]((uint64_t)v6);
    }
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (id)_fetchUpdatedSectionDefinitionsFromSectionProvider
{
  if (!self || !self->_sectionProvider)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UICollectionCompositionalLayoutSolver.m", 2208, @"Invalid parameter not satisfying: %@", @"self.sectionProvider != NULL" object file lineNumber description];
  }
  if (!self->_container)
  {
    float64x2_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"_UICollectionCompositionalLayoutSolver.m", 2209, @"Invalid parameter not satisfying: %@", @"_container != nil" object file lineNumber description];
  }
  uint64_t v3 = [(_UIDataSourceSnapshotter *)self->_dataSourceSnapshot numberOfSections];
  unint64_t v4 = self->_container;
  if (dyld_program_sdk_at_least())
  {
    container = self->_container;
    if (container) {
      container = (_UICollectionLayoutContainer *)container->_insetsEnvironment;
    }
    double v6 = container;
    [(_UICollectionLayoutContainer *)self->_container contentSize];
    uint64_t v7 = -[_UICollectionLayoutContainer layoutContainerForContainerSize:layoutAxis:](v6, "layoutContainerForContainerSize:layoutAxis:", self->_layoutAxis);

    unint64_t v4 = (_UICollectionLayoutContainer *)v7;
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v3];
  options = self->_options;
  if (options && (id v10 = options->_traitCollectionSourceProvider) != 0)
  {
    id v11 = v10;
    char v12 = (void *)(*((uint64_t (**)(void))v10 + 2))();
    double v14 = v13;

    memset(__src, 0, 352);
    id v27 = v14;
    if (v12)
    {
      if (!v14)
      {
        id v18 = [MEMORY[0x1E4F28B00] currentHandler];
        [v18 handleFailureInMethod:a2, self, @"_UICollectionCompositionalLayoutSolver.m", 2234, @"Compositional layout internal error: trait collection source has a view (%@) but no invalidation action", v12 object file lineNumber description];
      }
      _UIBeginTrackingTraitUsage(v12, 0, __src);
      char v15 = 0;
    }
    else
    {
      char v15 = 1;
    }
  }
  else
  {
    id v27 = 0;
    char v12 = 0;
    char v15 = 1;
    memset(__src, 0, 352);
  }
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if (self) {
        sectionProvider = (void (**)(id, _UICollectionLayoutContainer *, void))self->_sectionProvider;
      }
      else {
        sectionProvider = 0;
      }
      id v21 = sectionProvider[2](sectionProvider, v4, i);
      id v22 = (void *)[v21 copy];

      if (!v22)
      {
        if ([(_UIDataSourceSnapshotter *)self->_dataSourceSnapshot numberOfItemsInSection:i])
        {
          BOOL v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:a2 object:self file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:2243 description:@"Invalid section definition. Please specify a valid section definition when content is to be rendered for a section. This is a client error."];
        }
        id v22 = [off_1E52D2B28 _emptySection];
      }
      [v8 addObject:v22];
    }
  }
  if ((v15 & 1) == 0)
  {
    memcpy(__dst, __src, sizeof(__dst));
    uint64_t v24 = (char *)GetTraitCollectionTSD() + 16;
    memcpy(v29, v24, sizeof(v29));
    memcpy(v24, __dst, 0x160uLL);
    -[UIView _recordTraitUsage:insideMethod:withInvalidationAction:](v12, (uint64_t)&v29[136], [(_UICollectionCompositionalLayoutSolver *)self methodForSelector:sel__fetchUpdatedSectionDefinitionsFromSectionProvider], v27);
    _UITraitUsageTrackingResultDestroy((uint64_t)v29);
  }

  return v8;
}

- (void)_solveWithSectionLayouts:(void *)a3 preferredSizesDict:(void *)a4 dataSourceSnapshot:(uint64_t)a5 update:
{
  uint64_t v8 = a1;
  -[_UICollectionCompositionalLayoutSolver _invalidateAllAttributes](a1);
  if (!a4)
  {
    id v70 = [MEMORY[0x1E4F28B00] currentHandler];
    [v70 handleFailureInMethod:sel__solveWithSectionLayouts_preferredSizesDict_dataSourceSnapshot_update_, v8, @"_UICollectionCompositionalLayoutSolver.m", 2322, @"Invalid parameter not satisfying: %@", @"dataSourceSnapshot" object file lineNumber description];
  }
  uint64_t v9 = [a2 count];
  if (v9 != [a4 numberOfSections])
  {
    uint64_t v71 = [MEMORY[0x1E4F28B00] currentHandler];
    [v71 handleFailureInMethod:sel__solveWithSectionLayouts_preferredSizesDict_dataSourceSnapshot_update_, v8, @"_UICollectionCompositionalLayoutSolver.m", 2323, @"Invalid parameter not satisfying: %@", @"sectionLayouts.count == dataSourceSnapshot.numberOfSections" object file lineNumber description];
  }
  if (!a3)
  {
    uint64_t v72 = [MEMORY[0x1E4F28B00] currentHandler];
    [v72 handleFailureInMethod:sel__solveWithSectionLayouts_preferredSizesDict_dataSourceSnapshot_update_, v8, @"_UICollectionCompositionalLayoutSolver.m", 2324, @"Invalid parameter not satisfying: %@", @"sectionPreferredSizesDict" object file lineNumber description];
  }
  uint64_t v86 = [a4 numberOfSections];
  id v10 = *(void **)(v8 + 112);
  uint64_t v74 = a5;
  if (v10) {
    id v10 = (void *)v10[8];
  }
  uint64_t v11 = *(void *)(v8 + 64);
  double v78 = *(double *)(v8 + 80);
  v92 = v10;
  uint64_t v12 = -[_UICollectionCompositionalLayoutSolver _snapshotBookmarks:](*(void **)(v8 + 184));
  id v89 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id obj = objc_alloc_init(_UIRTree);
  if (*(unsigned char *)(v8 + 17)) {
    *(unsigned char *)(v8 + 15) = 1;
  }
  double v13 = (CGFloat *)MEMORY[0x1E4F1DB28];
  id v82 = [MEMORY[0x1E4F28E60] indexSet];
  id v80 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v79 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  double v14 = *(void **)(v8 + 48);
  if (v14) {
    double v14 = (void *)v14[1];
  }
  double v75 = (void *)v12;
  CGFloat x = *v13;
  CGFloat y = v13[1];
  double width = v13[2];
  double height = v13[3];
  uint64_t v88 = v14;
  if (v86 < 1)
  {
    uint64_t v100 = 0;
    uint64_t v98 = 0;
    char v99 = 0;
  }
  else
  {
    v85 = a4;
    char v99 = 0;
    uint64_t v98 = 0;
    char v19 = 0;
    uint64_t v100 = 0;
    uint64_t v20 = 0;
    double v83 = fabs(v78);
    double v21 = *MEMORY[0x1E4F1DAD8];
    double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v76 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v77 = *MEMORY[0x1E4F1DB30];
    double v90 = v22;
    double v91 = *MEMORY[0x1E4F1DAD8];
    char v84 = a2;
    do
    {
      BOOL v23 = [a2 objectAtIndexedSubscript:v20];
      [v23 _preBoundaryPadding];
      double v25 = v24;
      [v23 _postBoundaryPadding];
      double v94 = v26;
      id v105 = 0;
      v106[0] = 0;
      -[_UICollectionCompositionalLayoutSolver _generateInsetsEnvironmentsForLayoutSection:withParentInsetEnvironment:sectionEnv:supplementaryEnv:](v8, v23, (uint64_t)v88, v106, &v105);
      id v27 = v106[0];
      id v28 = v105;
      [*(id *)(v8 + 48) effectiveContentSize];
      v104 = -[_UICollectionCompositionalLayoutSolver _containerByApplyingInsetsFromEnvironment:toSize:onAxis:](v27, v11);
      [*(id *)(v8 + 48) effectiveContentSize];
      v103 = v28;
      v102 = -[_UICollectionCompositionalLayoutSolver _containerByApplyingInsetsFromEnvironment:toSize:onAxis:](v28, v11);
      char v101 = [v23 _isEmptySection];
      objc_super v29 = +[_UICollectionLayoutSectionSolver solverWithLayoutSection:layoutAxis:]((uint64_t)_UICollectionLayoutSectionSolver, v23, v11);
      float64x2_t v30 = [NSNumber numberWithInteger:v20];
      id v31 = [a3 objectForKeyedSubscript:v30];
      objc_super v32 = v31;
      if (v31) {
        uint64_t v33 = v31;
      }
      else {
        uint64_t v33 = objc_alloc_init(_UICollectionPreferredSizes);
      }
      uint64_t v34 = v33;

      if ([v23 scrollsOrthogonally]) {
        [v80 addIndex:v20];
      }
      if ([v23 _clipsContentToBounds]) {
        [v79 addIndex:v20];
      }
      if (!((v83 < 2.22044605e-16 || (v19 & 1) == 0) | v101 & 1))
      {
        double v21 = v21 + _UISetPointValueForAxis(v11, v91, v90, v78);
        double v22 = v22 + v35;
      }
      CGFloat v96 = x;
      CGFloat r1 = width;
      CGFloat v95 = y;
      if (fabs(v25) >= 2.22044605e-16)
      {
        double v21 = v21 + _UISetPointValueForAxis(v11, v91, v90, v25);
        double v22 = v22 + v36;
      }
      CGFloat v37 = height;
      LOBYTE(v73) = 0;
      objc_msgSend(v29, "solveForContainer:supplementaryContainer:traitCollection:layoutAxis:frameCount:preferredSizes:layoutRTL:", v104, v102, *(void *)(v8 + 56), v11, objc_msgSend(v85, "numberOfItemsInSection:", v20), v34, v73);
      id v38 = [v29 errorDescription];

      if (v38 && v92)
      {
        id v39 = [v29 errorDescription];
        ((void (*)(void *, uint64_t, void *, id, void *, void))v92[2])(v92, v20, v104, v27, v39, 0);
      }
      uint64_t v93 = [v29 containerSizeDependentAxes];
      id v40 = (void *)v8;
      double v41 = -[_UICollectionCompositionalLayoutSolver _globalFrameForSolution:offset:](v8, v29, v21);
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      double v48 = _UISizeValueForAxis(v11, v44, v46);
      double v49 = _UIPointValueForAxis(v11, v21, v22);
      double v21 = _UISetPointValueForAxis(v11, v21, v22, v48 + v49);
      double v22 = v50;
      uint64_t v51 = [v23 pinnedBoundarySupplementaryItemIndexes];
      uint64_t v52 = [v51 count];

      if (v52) {
        [v82 addIndex:v20];
      }
      float64x2_t v53 = -[_UICollectionSectionSolutionBookmark initWithSolution:globalFrame:globalPinningFrame:insetEnvironment:supplementaryInsetEnvironment:section:preferredSizes:]((id *)[_UICollectionSectionSolutionBookmark alloc], v29, v27, v103, v23, v34, v41, v43, v45, v47, v41, v43, v45, v47);
      [v89 addObject:v53];
      v107.origin.CGFloat x = v41;
      v107.origin.CGFloat y = v43;
      v107.size.double width = v45;
      v107.size.double height = v47;
      if (!CGRectIsEmpty(v107)) {
        -[_UICollectionCompositionalLayoutSolver _updateSectionIndexer:frame:solution:section:](v40, obj, v29, v20, v41, v43, v45, v47);
      }
      v108.origin.CGFloat y = v95;
      v108.origin.CGFloat x = v96;
      v108.size.double width = r1;
      v108.size.double height = v37;
      v114.origin.CGFloat x = v41;
      v114.origin.CGFloat y = v43;
      v114.size.double width = v45;
      v114.size.double height = v47;
      CGRect v109 = CGRectUnion(v108, v114);
      CGFloat x = v109.origin.x;
      CGFloat y = v109.origin.y;
      double width = v109.size.width;
      double height = v109.size.height;
      if (fabs(v94) >= 2.22044605e-16)
      {
        if (v86 - 1 == v20)
        {
          double width = v109.size.width + _UISetSizeValueForAxis(v11, v77, v76, v94);
          double height = height + v54;
        }
        else
        {
          double v21 = v21 + _UISetPointValueForAxis(v11, v91, v90, v94);
          double v22 = v22 + v55;
        }
      }
      unsigned int v56 = [v23 _hasVisibleItemsHandler];
      if (v99) {
        char v99 = 1;
      }
      else {
        char v99 = [v23 _containsEstimatedSizeElement];
      }
      v19 |= v101 ^ 1;
      v100 |= v93;
      v98 += v56;

      ++v20;
      uint64_t v8 = (uint64_t)v40;
      a2 = v84;
    }
    while (v86 != v20);
  }
  if (*(unsigned char *)(v8 + 16))
  {
    if (fabs(*(double *)(v8 + 144)) >= 2.22044605e-16) {
      double v57 = *(double *)(v8 + 144);
    }
    else {
      double v57 = 1.0;
    }
    v110.origin.CGFloat x = x;
    v110.origin.CGFloat y = y;
    v110.size.double width = width;
    v110.size.double height = height;
    CGRectGetMinX(v110);
    v111.origin.CGFloat x = x;
    v111.origin.CGFloat y = y;
    v111.size.double width = width;
    v111.size.double height = height;
    CGRectGetMinY(v111);
    v112.origin.CGFloat x = x;
    v112.origin.CGFloat y = y;
    v112.size.double width = width;
    v112.size.double height = height;
    double v58 = round(v57 * CGRectGetWidth(v112)) / v57;
    v113.origin.CGFloat x = x;
    v113.origin.CGFloat y = y;
    v113.size.double width = width;
    v113.size.double height = height;
    double height = round(v57 * CGRectGetHeight(v113)) / v57;
    double width = v58;
  }
  -[_UICollectionCompositionalLayoutSolver _restoreStateFromBookmarkSnapshots:bookmarks:update:](v8, v75, v89, v74);
  -[_UICollectionCompositionalLayoutSolver setSolutionBookmarks:](v8, v89);
  *(double *)(v8 + 304) = width;
  *(double *)(v8 + 312) = height;
  objc_storeStrong((id *)(v8 + 192), obj);
  objc_storeStrong((id *)(v8 + 160), v82);
  *(void *)(v8 + 288) = v98;
  float64_t v59 = (void *)-[_UICollectionLayoutAuxillaryItemSolver initWithAuxillaryHost:]([_UICollectionLayoutAuxillaryItemSolver alloc], (void *)v8);
  float64_t v60 = (unint64_t *)(v8 + 272);
  objc_storeStrong((id *)(v8 + 272), v59);

  if (!*(void *)(v8 + 280))
  {
    long long v61 = objc_alloc_init(_UICollectionPreferredSizes);
    objc_storeStrong((id *)(v8 + 280), v61);
  }
  double v62 = (void *)*v60;
  if (v99)
  {
    BOOL v63 = 1;
    if (!v62) {
      goto LABEL_68;
    }
  }
  else
  {
    if (!v62)
    {
      BOOL v63 = 0;
      goto LABEL_68;
    }
    BOOL v63 = *((unsigned char *)v62 + 32) != 0;
  }
  if (*((double *)v62 + 18) != 0.0
    || *((double *)v62 + 20) != 0.0
    || *((double *)v62 + 19) != 0.0
    || *((double *)v62 + 21) != 0.0)
  {
    -[_UICollectionCompositionalLayoutSolver _updateBookmarkOffsetsForGlobalSupplementariesIfNeeded](v8);
    goto LABEL_60;
  }
LABEL_68:
  -[_UICollectionCompositionalLayoutSolver _updateGeometryTranslator](v8);
LABEL_60:
  long long v64 = (void *)*v60;
  if (*v60) {
    long long v64 = (void *)v64[5];
  }
  long long v65 = v64;
  uint64_t v66 = [v65 count];

  if (v66)
  {
    [*(id *)(v8 + 48) contentSize];
    -[_UICollectionLayoutAuxillaryItemSolver resolveSupplementaryItemsForVisibleBounds:](*(id **)(v8 + 272), 0.0, 0.0, v67, v68);
  }
  unint64_t v69 = *v60;
  if (*v60) {
    unint64_t v69 = *(void *)(v69 + 56);
  }
  *(void *)(v8 + 296) = v69 | v100;
  objc_storeStrong((id *)(v8 + 88), v80);
  *(unsigned char *)(v8 + 13) = [v80 count] != 0;
  *(unsigned char *)(v8 + 14) = [v79 count] != 0;
  objc_storeStrong((id *)(v8 + 96), v79);
  *(unsigned char *)(v8 + 12) = v63;
}

- (double)_containerByApplyingInsetsFromEnvironment:(void *)a1 toSize:(uint64_t)a2 onAxis:
{
  double v2 = objc_msgSend(a1, "layoutContainerForContainerSize:layoutAxis:", a2);
  uint64_t v3 = [_UICollectionLayoutContainer alloc];
  [v2 effectiveContentSize];
  double v6 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:](v3, v4, v5, 0.0, 0.0, 0.0, 0.0);

  return v6;
}

- (void)_generateInsetsEnvironmentsForLayoutSection:(uint64_t)a3 withParentInsetEnvironment:(void *)a4 sectionEnv:(void *)a5 supplementaryEnv:
{
  if (a2)
  {
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel__generateInsetsEnvironmentsForLayoutSection_withParentInsetEnvironment_sectionEnv_supplementaryEnv_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2300, @"Invalid parameter not satisfying: %@", @"layoutSection != nil" object file lineNumber description];

    if (a3)
    {
LABEL_3:
      if (a4) {
        goto LABEL_4;
      }
LABEL_12:
      double v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel__generateInsetsEnvironmentsForLayoutSection_withParentInsetEnvironment_sectionEnv_supplementaryEnv_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2302, @"Invalid parameter not satisfying: %@", @"outSectionEnv != nil" object file lineNumber description];

      if (a5) {
        goto LABEL_5;
      }
      goto LABEL_13;
    }
  }
  double v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:sel__generateInsetsEnvironmentsForLayoutSection_withParentInsetEnvironment_sectionEnv_supplementaryEnv_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2301, @"Invalid parameter not satisfying: %@", @"parentInsetEnvironment != nil" object file lineNumber description];

  if (!a4) {
    goto LABEL_12;
  }
LABEL_4:
  if (a5) {
    goto LABEL_5;
  }
LABEL_13:
  char v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:sel__generateInsetsEnvironmentsForLayoutSection_withParentInsetEnvironment_sectionEnv_supplementaryEnv_, a1, @"_UICollectionCompositionalLayoutSolver.m", 2303, @"Invalid parameter not satisfying: %@", @"outSuppEnv != nil" object file lineNumber description];

LABEL_5:
  uint64_t v10 = [a2 contentInsetsReference];
  id v16 = +[_UIContentInsetsEnvironment insetEnvironmentFromParentEnvironment:a3 insetReference:v10];
  *a4 = v16;
  if ([a2 supplementaryContentInsetsReference]) {
    uint64_t v10 = [a2 supplementaryContentInsetsReference];
  }
  id v11 = +[_UIContentInsetsEnvironment insetEnvironmentFromParentEnvironment:a3 insetReference:v10];
  *a5 = v11;
}

- (void)setSolutionBookmarks:(uint64_t)a1
{
  if (os_variant_has_internal_diagnostics())
  {
    if (*(unsigned char *)(a1 + 8))
    {
      double v4 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v4, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: attempted to update solution bookmarks that are locked. Please file a bug against UICollectionView with reproduction steps.", buf, 2u);
      }
    }
  }
  else if (*(unsigned char *)(a1 + 8))
  {
    double v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &setSolutionBookmarks____s_category) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v6 = 0;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: attempted to update solution bookmarks that are locked. Please file a bug against UICollectionView with reproduction steps.", v6, 2u);
    }
  }
  objc_storeStrong((id *)(a1 + 184), a2);
}

- (void)_updateGeometryTranslator
{
  double v2 = *(double **)(a1 + 272);
  if (v2)
  {
    double v3 = v2[14];
    double v4 = v2[15];
    double v5 = v2[16];
    double v6 = v2[17];
  }
  else
  {
    double v3 = 0.0;
    double v4 = 0.0;
    double v6 = 0.0;
    double v5 = 0.0;
  }
  uint64_t v7 = -[_UICollectionLayoutSectionGeometryTranslator initWithPrimaryContentSize:sectionAuxiliarySolutionSize:layoutAxis:layoutRTL:sectionInsets:contentFrameSupplementaryOffset:]([_UICollectionLayoutSectionGeometryTranslator alloc], *(void *)(a1 + 64), *(unsigned __int8 *)(a1 + 17), *(double *)(a1 + 304), *(double *)(a1 + 312), v3, v4, 0.0, 0.0, 0.0, 0.0, v5, v6);
  uint64_t v8 = *(void **)(a1 + 200);
  *(void *)(a1 + 200) = v7;
}

- (id)_snapshotBookmarks:(void *)a1
{
  if ([a1 count])
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([a1 count])
    {
      unint64_t v3 = 0;
      do
      {
        double v4 = [a1 objectAtIndexedSubscript:v3];
        double v5 = [_UICollectionCompositionalLayoutSolverBookmarkStateSnapshotter alloc];
        if (v5)
        {
          v9.receiver = v5;
          v9.super_class = (Class)_UICollectionCompositionalLayoutSolverBookmarkStateSnapshotter;
          id v6 = objc_msgSendSuper2(&v9, sel_init);
          uint64_t v7 = v6;
          if (v6)
          {
            objc_storeStrong((id *)v6 + 1, v4);
            v7[2] = v3;
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
        [v2 addObject:v7];

        ++v3;
      }
      while (v3 < [a1 count]);
    }
  }
  else
  {
    id v2 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (uint64_t)_invalidateAllAttributes
{
  [*(id *)(a1 + 208) removeAllObjects];
  [*(id *)(a1 + 216) removeAllObjects];
  id v2 = *(void **)(a1 + 224);
  return [v2 removeAllObjects];
}

- (id)layoutAttributesForSupplementaryViewOfKind:(void *)a3 withIndexPath:
{
  if (a1)
  {
    uint64_t v6 = [a2 length];
    id v7 = 0;
    if (a3 && v6)
    {
      uint64_t v8 = -[_UICollectionCompositionalLayoutSolver _cachedSupplementaryAttributesForElementKind:indexPath:]((uint64_t)a1, (uint64_t)a2, (uint64_t)a3);
      if (v8)
      {
        id v7 = v8;
LABEL_22:

        goto LABEL_23;
      }
      if ([a3 length] == 1
        && (-[_UICollectionLayoutAuxillaryItemSolver elementKinds](a1[34]),
            objc_super v9 = objc_claimAutoreleasedReturnValue(),
            int v10 = [v9 containsObject:a2],
            v9,
            v10))
      {
        id v11 = a1[34];
        uint64_t v12 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](v11, a2, [a3 indexAtPosition:0]);

        if (v12)
        {
          double v13 = -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v12);
          if (!v13)
          {
            id v40 = [MEMORY[0x1E4F28B00] currentHandler];
            [v40 handleFailureInMethod:sel_layoutAttributesForSupplementaryViewOfKind_withIndexPath_ object:a1 file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:737 description:@"Failed to resolve the global supplementary definition."];
          }
          -[_UICollectionCompositionalLayoutSolver _globalSupplementaryFrameOffset]((uint64_t)a1);
          double v14 = *(double *)(v12 + 64);
          double v15 = *(double *)(v12 + 72);
          CGFloat v16 = *(double *)(v12 + 80);
          CGFloat v17 = *(double *)(v12 + 88);
          CGFloat v19 = v14 + v18;
          CGFloat v21 = v20 + v15;
          v44.origin.CGFloat x = v14;
          v44.origin.CGFloat y = v15;
          v44.size.double width = v16;
          v44.size.double height = v17;
          CGFloat Width = CGRectGetWidth(v44);
          v45.origin.CGFloat x = v14;
          v45.origin.CGFloat y = v15;
          v45.size.double width = v16;
          v45.size.double height = v17;
          CGFloat Height = CGRectGetHeight(v45);
          uint64_t v24 = [v13 zIndex];
          int v25 = *(unsigned __int8 *)(v12 + 8);
          uint64_t v26 = (uint64_t)a1;
          id v27 = a3;
          id v28 = a2;
          CGFloat v29 = v19;
          CGFloat v30 = v21;
          CGFloat v31 = Width;
          CGFloat v32 = Height;
LABEL_19:
          -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForSupplementaryItemAtIndexPath:elementKind:frame:zIndex:pinned:](v26, v27, v28, v24, v25, v29, v30, v31, v32);
          id v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
          goto LABEL_22;
        }
      }
      else
      {
        long long v33 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
        long long v41 = *MEMORY[0x1E4F1DB20];
        long long v42 = v33;
        +[_UICollectionCompositionalLayoutSolver _queryResultForSectionSupplementaryViewOfKind:withIndexPath:solutionBookmarks:container:globalFrame:]((uint64_t)_UICollectionCompositionalLayoutSolver, (uint64_t)a2, a3, a1[23], a1[6], &v41);
        uint64_t v34 = (id *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = (uint64_t)v34;
        if (v34)
        {
          double v13 = -[_UICollectionLayoutFramesQueryResult supplementaryItem](v34);
          if (!v13)
          {
            id v39 = [MEMORY[0x1E4F28B00] currentHandler];
            [v39 handleFailureInMethod:sel_layoutAttributesForSupplementaryViewOfKind_withIndexPath_ object:a1 file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:758 description:@"Invalid query result - supplementary item was nil."];
          }
          uint64_t v35 = [v13 zIndex];
          double v36 = [v13 boundarySupplementaryItem];
          CGFloat v37 = v36;
          if (v36 && *(unsigned char *)(v12 + 8)) {
            uint64_t v35 = [v36 _pinningZIndex];
          }

          int v25 = *(unsigned __int8 *)(v12 + 8);
          CGFloat v30 = *((double *)&v41 + 1);
          CGFloat v29 = *(double *)&v41;
          CGFloat v32 = *((double *)&v42 + 1);
          CGFloat v31 = *(double *)&v42;
          uint64_t v26 = (uint64_t)a1;
          id v27 = a3;
          id v28 = a2;
          uint64_t v24 = v35;
          goto LABEL_19;
        }
      }
      id v7 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    id v7 = 0;
  }
LABEL_23:
  return v7;
}

- (void)invalidateCachedSupplementaryAttributesForElementKind:(uint64_t)a3 atIndexPaths:
{
  if (a1)
  {
    double v4 = [*(id *)(a1 + 216) objectForKeyedSubscript:a2];
    if (v4)
    {
      id v5 = v4;
      [v4 removeObjectsForKeys:a3];
      double v4 = v5;
    }
  }
}

+ (CGFloat)_queryResultForSectionSupplementaryViewOfKind:(void *)a3 withIndexPath:(void *)a4 solutionBookmarks:(void *)a5 container:(void *)a6 globalFrame:
{
  uint64_t v11 = self;
  unint64_t v12 = [a3 section];
  uint64_t v13 = [a3 item];
  unint64_t v14 = [a4 count];
  double v15 = 0;
  if ((v12 & 0x8000000000000000) == 0 && v12 < v14)
  {
    uint64_t v16 = [a4 objectAtIndexedSubscript:v12];
    CGFloat v17 = (double *)v16;
    if (v16) {
      double v18 = *(void **)(v16 + 8);
    }
    else {
      double v18 = 0;
    }
    id v19 = v18;
    double v20 = [v19 supplementaryFrameWithKind:a2 index:v13];
    double v15 = v20;
    if (v20)
    {
      +[_UICollectionCompositionalLayoutSolver _globalFrameForSectionAuxiliaryFrame:bookmark:container:](v20[8], v20[9], v20[10], v20[11], (uint64_t)_UICollectionCompositionalLayoutSolver, v17, a5);
      uint64_t v22 = v21;
      uint64_t v24 = v23;
      uint64_t v26 = v25;
      uint64_t v28 = v27;
      if (!a6)
      {
        CGFloat v30 = [MEMORY[0x1E4F28B00] currentHandler];
        [v30 handleFailureInMethod:sel__queryResultForSectionSupplementaryViewOfKind_withIndexPath_solutionBookmarks_container_globalFrame_, v11, @"_UICollectionCompositionalLayoutSolver.m", 823, @"Invalid parameter not satisfying: %@", @"outGlobalFrame != nil" object file lineNumber description];
      }
      *a6 = v22;
      a6[1] = v24;
      a6[2] = v26;
      a6[3] = v28;
    }
  }
  return v15;
}

+ (void)_globalFrameForSectionAuxiliaryFrame:(CGFloat)a3 bookmark:(CGFloat)a4 container:(uint64_t)a5
{
  self;
  if (a6)
  {
    double v14 = a6[3];
    double v13 = a6[4];
    double v15 = a6[5];
    double v16 = a6[6];
  }
  else
  {
    double v13 = 0.0;
    double v15 = 0.0;
    double v16 = 0.0;
    double v14 = 0.0;
  }
  double v17 = -[_UICollectionSectionSolutionBookmark sectionAuxiliaryContentInsetsOffset]((uint64_t)a6);
  +[_UICollectionCompositionalLayoutSolver _globalFrameForSolutionFrame:solutionGlobalFrame:contentInsetsOffset:container:](a1, a2, a3, a4, v14, (uint64_t)_UICollectionCompositionalLayoutSolver, a7, v13, v15, v16, v17);
}

- (BOOL)hasPinnedSupplementaryItems
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 160) count];
    unint64_t v3 = *(void **)(v1 + 272);
    if (v3) {
      unint64_t v3 = (void *)v3[5];
    }
    double v4 = v3;
    uint64_t v5 = v2 | [v4 count];

    return v5 != 0;
  }
  return result;
}

- (void)_restoreStateFromBookmarkSnapshots:(void *)a3 bookmarks:(uint64_t)a4 update:
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (a1 && [a2 count])
  {
    if (a4)
    {
      id v7 = *(id *)(a4 + 16);
    }
    else
    {
      uint64_t v8 = [a2 count];
      if (v8 != [a3 count]) {
        return;
      }
      id v7 = 0;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v9 = a2;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (!v10) {
      goto LABEL_38;
    }
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v40;
    id v36 = v9;
    CGFloat v37 = a3;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v40 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v39 + 1) + 8 * v13);
        if (v14)
        {
          if (*(void *)(v14 + 16) == 0x7FFFFFFFFFFFFFFFLL) {
            goto LABEL_32;
          }
          unint64_t v15 = *(void *)(v14 + 16);
          if (v7)
          {
LABEL_15:
            unint64_t v15 = objc_msgSend(v7, "finalSectionIndexForInitialSectionIndex:", v36, v37);
            if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
              goto LABEL_32;
            }
          }
        }
        else
        {
          unint64_t v15 = 0;
          if (v7) {
            goto LABEL_15;
          }
        }
        if (v15 >= objc_msgSend(a3, "count", v36, v37))
        {
          uint64_t v34 = *(NSObject **)(__UILogGetCategoryCachedImpl("CollectionLayout", &_restoreStateFromBookmarkSnapshots_bookmarks_update____s_category)+ 8);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_ERROR, "Error: could not restore orthogonal content offset after update. This may result in a UI glitch - please file a bug on UIKit.", buf, 2u);
          }
        }
        else
        {
          double v16 = [a3 objectAtIndexedSubscript:v15];
          if (v14)
          {
            double v17 = *(void **)(v14 + 8);
            if (v17) {
              double v17 = (void *)v17[1];
            }
            double v18 = v17;
            if (v16) {
              id v19 = (void *)v16[1];
            }
            else {
              id v19 = 0;
            }
            id v20 = v19;
            uint64_t v21 = [v18 layoutSection];
            if ([v21 scrollsOrthogonally])
            {
              uint64_t v22 = [v20 layoutSection];
              int v23 = [v22 scrollsOrthogonally];

              if (v23)
              {
                uint64_t v24 = [v20 layoutAxis];
                [v18 orthogonalOffset];
                double v26 = v25;
                double v28 = v27;
                [v20 contentFrameIncludingAuxiliaries];
                double v30 = v29;
                double v32 = v31;
                if (v24 == [v18 layoutAxis])
                {
                  double v33 = _UIPointValueForAxis(v24, v26, v28);
                  if (v33 < _UISizeValueForAxis(v24, v30, v32)) {
                    objc_msgSend(v20, "setOrthogonalOffset:", v26, v28);
                  }
                }
              }
            }
            else
            {
            }
            id v9 = v36;
            a3 = v37;
          }
        }
LABEL_32:
        ++v13;
      }
      while (v11 != v13);
      uint64_t v35 = [v9 countByEnumeratingWithState:&v39 objects:v43 count:16];
      uint64_t v11 = v35;
      if (!v35)
      {
LABEL_38:

        return;
      }
    }
  }
}

- (uint64_t)orthogonalScrollingSectionSupplementaryShouldScrollWithContentForIndexPath:(uint64_t)a3 elementKind:
{
  if (!a1 || [a2 length] == 1) {
    return 0;
  }
  unint64_t v7 = [a2 section];
  if (v7 >= [*(id *)(a1 + 184) count]) {
    return 1;
  }
  uint64_t v8 = [*(id *)(a1 + 184) objectAtIndexedSubscript:v7];
  id v9 = (void *)v8;
  if (v8)
  {
    id v10 = *(id *)(v8 + 8);
    uint64_t v11 = (void *)v9[2];
  }
  else
  {
    id v10 = 0;
    uint64_t v11 = 0;
  }
  id v12 = v11;
  if ([v12 scrollsOrthogonally])
  {
    uint64_t v13 = objc_msgSend(v10, "sectionSupplementaryFrameWithKind:index:", a3, objc_msgSend(a2, "item"));
    BOOL v6 = v13 == 0;
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (double)_frameByExtendingGlobalSectionFrame:(uint64_t)a3 toOverlapPinnedSupplementaryInSection:(unsigned char *)a4 onEdge:(double)a5 visibleBounds:(CGFloat)a6 didExtend:(CGFloat)a7
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v17 = *(void *)(a1 + 64);
  if ((unint64_t)(v17 - 1) <= 1)
  {
    if (a2)
    {
      uint64_t v25 = *(void *)(a2 + 24);
      uint64_t v26 = *(void *)(a2 + 32);
      uint64_t v27 = *(void *)(a2 + 40);
      uint64_t v28 = *(void *)(a2 + 48);
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v25 = 0;
    }
    if (CGRectIntersectsRect(*(CGRect *)&v25, *(CGRect *)&a9))
    {
      uint64_t v29 = *(void *)(a1 + 64);
      if ((unint64_t)(v29 - 1) > 1)
      {
        id v34 = (id)MEMORY[0x1E4F1CBF0];
      }
      else
      {
        if (a2) {
          double v30 = *(void **)(a2 + 8);
        }
        else {
          double v30 = 0;
        }
        id v31 = v30;
        double v32 = [v31 pinnedSupplementaryIndexes];
        uint64_t v33 = [v32 count];
        id v34 = (id)MEMORY[0x1E4F1CBF0];
        if (v33)
        {
          uint64_t v71 = 0;
          uint64_t v72 = &v71;
          uint64_t v73 = 0x3032000000;
          uint64_t v74 = __Block_byref_object_copy__30;
          double v75 = __Block_byref_object_dispose__30;
          id v76 = 0;
          v64[0] = MEMORY[0x1E4F143A8];
          v64[1] = 3221225472;
          v64[2] = __97___UICollectionCompositionalLayoutSolver__unpinnedFramesOfSupplementariesPinnedToEdge_ofSection___block_invoke;
          v64[3] = &unk_1E52E0D08;
          id v65 = v31;
          id v66 = v32;
          uint64_t v67 = a2;
          uint64_t v69 = v29;
          uint64_t v70 = a3;
          CGFloat v68 = &v71;
          [v66 enumerateIndexesUsingBlock:v64];
          uint64_t v35 = (void *)v72[5];
          if (!v35) {
            uint64_t v35 = v34;
          }
          id v34 = v35;

          _Block_object_dispose(&v71, 8);
        }
      }
      if ([v34 count] != 1) {
        goto LABEL_34;
      }
      id v36 = [v34 objectAtIndexedSubscript:0];
      CGFloat v62 = a7;
      CGFloat v63 = a8;
      double v61 = a5;
      if (v36)
      {
        CGFloat v37 = v36[8];
        CGFloat v38 = v36[9];
        CGFloat v39 = v36[10];
        CGFloat v40 = v36[11];
      }
      else
      {
        CGFloat v38 = 0.0;
        CGFloat v39 = 0.0;
        CGFloat v40 = 0.0;
        CGFloat v37 = 0.0;
      }
      +[_UICollectionCompositionalLayoutSolver _globalFrameForSectionAuxiliaryFrame:bookmark:container:](v37, v38, v39, v40, (uint64_t)_UICollectionCompositionalLayoutSolver, (double *)a2, *(void **)(a1 + 48));
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v47 = a9;
      double v49 = v48;
      double v50 = _UIPointValueForAxis(v17, v47, a10);
      double v51 = _UISizeValueForAxis(v17, a11, a12);
      CGFloat v60 = v42;
      double v52 = _UIPointValueForAxis(v17, v42, v44);
      double v53 = _UISizeValueForAxis(v17, v46, v49);
      if (v52 <= v50 && vabdd_f64(v52, v50) > 0.001)
      {
        a5 = v61;
LABEL_33:

LABEL_34:
        return a5;
      }
      double v54 = v52 + v53;
      a5 = v61;
      if (v54 >= v50 + v51 && vabdd_f64(v54, v50 + v51) > 0.001) {
        goto LABEL_33;
      }
      if (v17 == 2)
      {
        v77.origin.CGFloat x = v60;
        v77.origin.CGFloat y = v44;
        v77.size.double width = v46;
        v77.size.double height = v49;
        double MaxY = CGRectGetMaxY(v77);
        v78.origin.CGFloat x = v60;
        v78.origin.CGFloat y = v44;
        v78.size.double width = v46;
        v78.size.double height = v49;
        double MinY = CGRectGetMinY(v78);
        a5 = v61;
        v79.origin.CGFloat x = v61;
        v79.origin.CGFloat y = a6;
        v79.size.double width = v62;
        v79.size.double height = v63;
        if (MaxY <= CGRectGetMaxY(v79))
        {
          v83.origin.CGFloat x = v61;
          v83.origin.CGFloat y = a6;
          v83.size.double width = v62;
          v83.size.double height = v63;
          if (MinY >= CGRectGetMinY(v83)) {
            goto LABEL_33;
          }
          v84.origin.CGFloat x = v61;
          v84.origin.CGFloat y = a6;
          v84.size.double width = v62;
          v84.size.double height = v63;
          CGRectGetMaxY(v84);
        }
      }
      else
      {
        v80.origin.CGFloat x = v60;
        v80.origin.CGFloat y = v44;
        v80.size.double width = v46;
        v80.size.double height = v49;
        double MaxX = CGRectGetMaxX(v80);
        v81.origin.CGFloat x = v60;
        v81.origin.CGFloat y = v44;
        v81.size.double width = v46;
        v81.size.double height = v49;
        double MinX = CGRectGetMinX(v81);
        a5 = v61;
        v82.origin.CGFloat x = v61;
        v82.origin.CGFloat y = a6;
        v82.size.double width = v62;
        v82.size.double height = v63;
        if (MaxX <= CGRectGetMaxX(v82))
        {
          v85.origin.CGFloat x = v61;
          v85.origin.CGFloat y = a6;
          v85.size.double width = v62;
          v85.size.double height = v63;
          if (MinX >= CGRectGetMinX(v85)) {
            goto LABEL_33;
          }
          v86.origin.CGFloat x = v61;
          v86.origin.CGFloat y = a6;
          v86.size.double width = v62;
          v86.size.double height = v63;
          CGRectGetMaxX(v86);
          a5 = MinX;
        }
      }
      *a4 = 1;
      goto LABEL_33;
    }
  }
  return a5;
}

- (uint64_t)_wantsSwipeActions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 184);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        uint64_t v5 = *(void *)(*((void *)&v9 + 1) + 8 * v4);
        if (v5) {
          BOOL v6 = *(void **)(v5 + 16);
        }
        else {
          BOOL v6 = 0;
        }
        if (objc_msgSend(v6, "_wantsSwipeActions", (void)v9))
        {
          uint64_t v2 = 1;
          goto LABEL_16;
        }
        ++v4;
      }
      while (v2 != v4);
      uint64_t v7 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v2 = v7;
    }
    while (v7);
  }
LABEL_16:

  return v2;
}

- (_UICollectionCompositionalLayoutSolverResolveResult)_resolveOptionallyQueryingForSectionDefinitions:(int)a3 retainPreferredSizing:
{
  if (a1)
  {
    -[_UICollectionCompositionalLayoutSolver _invalidateAllAttributes](a1);
    double Bookmark = -[_UICollectionCompositionalLayoutSolver _firstBookmarkOffset](a1);
    double v8 = v7;
    if (a2) {
      [(id)a1 _fetchUpdatedSectionDefinitionsFromSectionProvider];
    }
    else {
    long long v9 = [*(id *)(a1 + 184) valueForKey:@"section"];
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a3 && [*(id *)(a1 + 184) count])
    {
      unint64_t v11 = 0;
      do
      {
        uint64_t v12 = [*(id *)(a1 + 184) objectAtIndexedSubscript:v11];
        uint64_t v13 = (void *)v12;
        if (v12) {
          uint64_t v12 = *(void *)(v12 + 104);
        }
        id v14 = -[_UICollectionPreferredSizes copyByDirtyingPreferredSizes]((id *)v12);
        unint64_t v15 = [NSNumber numberWithInteger:v11];
        [v10 setObject:v14 forKeyedSubscript:v15];

        ++v11;
      }
      while (v11 < [*(id *)(a1 + 184) count]);
    }
    double v16 = objc_alloc_init(_UICollectionCompositionalLayoutSolverResolveResult);
    [(_UICollectionCompositionalLayoutSolverResolveResult *)v16 setSectionsWereRequeried:a2];
    if (a2) {
      -[_UICollectionCompositionalLayoutSolver _configureLayoutForSections:](a1, v9);
    }
    -[_UICollectionCompositionalLayoutSolver _solveWithSectionLayouts:preferredSizesDict:dataSourceSnapshot:update:](a1, v9, v10, *(void **)(a1 + 72), 0);
    double v17 = -[_UICollectionCompositionalLayoutSolver _firstBookmarkOffset](a1) - Bookmark;
    double v19 = v18 - v8;
    if (*(unsigned char *)(a1 + 16)) {
      double v17 = UIPointRoundToScale(v17, v19, *(double *)(a1 + 144));
    }
    -[_UICollectionCompositionalLayoutSolverResolveResult setContentOffsetAdjustment:](v16, "setContentOffsetAdjustment:", v17, v19);
  }
  else
  {
    double v16 = 0;
  }
  return v16;
}

- (id)resolveForInvalidatedPreferredAttributes:(double)a3 scrollOffset:(double)a4 visibleRect:(double)a5
{
  if (a1)
  {
    double v16 = *(objc_class **)(a1 + 128);
    if (!v16)
    {
      float64_t v59 = [MEMORY[0x1E4F28B00] currentHandler];
      [v59 handleFailureInMethod:sel_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect_ object:a1 file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:1584 description:@"No invalidation context class specified."];

      double v16 = *(objc_class **)(a1 + 128);
    }
    id v17 = objc_alloc_init(v16);
    [v17 _setIntent:5];
    if ([a2 count])
    {
      uint64_t v18 = *(void *)(a1 + 64);
      if ((unint64_t)(v18 - 1) <= 1
        && ((v19 = _UIPointValueForAxis(*(void *)(a1 + 64), a3, a4), double v20 = _UIPointValueForAxis(v18, a5, a6),
                                                                       v19 < 0.0)
          ? (BOOL v21 = v20 > 44.0)
          : (BOOL v21 = 0),
            v21))
      {
        uint64_t v23 = *(void *)(a1 + 64);
        double v24 = _UIPointValueForAxis(v23, a5, a6);
        uint64_t v94 = 0;
        CGFloat v95 = &v94;
        uint64_t v96 = 0x3032000000;
        v97 = __Block_byref_object_copy__30;
        uint64_t v98 = __Block_byref_object_dispose__30;
        id v99 = 0;
        v93[0] = 0;
        v93[1] = v93;
        v93[2] = 0x2020000000;
        v93[3] = 0x7FEFFFFFFFFFFFFFLL;
        uint64_t v87 = 0;
        uint64_t v88 = &v87;
        uint64_t v89 = 0x3032000000;
        double v90 = __Block_byref_object_copy__30;
        double v91 = __Block_byref_object_dispose__30;
        id v92 = 0;
        v86[0] = 0;
        v86[1] = v86;
        v86[2] = 0x2020000000;
        v86[3] = 0x7FEFFFFFFFFFFFFFLL;
        uint64_t v72 = MEMORY[0x1E4F143A8];
        uint64_t v73 = 3221225472;
        uint64_t v74 = (uint64_t)__129___UICollectionCompositionalLayoutSolver__layoutAttributesOfFirstElementEligibleForPreferredSizingContentOffsetAdjustmentInRect___block_invoke;
        double v75 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52E0E48;
        double v80 = a5;
        double v81 = a6;
        CGFloat v82 = a7;
        CGFloat v83 = a8;
        uint64_t v84 = v23;
        double v85 = v24;
        id v76 = (void (*)(uint64_t))&v94;
        CGRect v77 = v93;
        CGRect v78 = v86;
        CGRect v79 = &v87;
        -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](a1, (uint64_t)&v72, a5, a6, a7, a8);
        uint64_t v25 = (void *)v95[5];
        if (!v25) {
          uint64_t v25 = (void *)v88[5];
        }
        id v22 = v25;
        _Block_object_dispose(v86, 8);
        _Block_object_dispose(&v87, 8);

        _Block_object_dispose(v93, 8);
        _Block_object_dispose(&v94, 8);
      }
      else
      {
        id v22 = 0;
      }
      id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v72 = 0;
      uint64_t v73 = (uint64_t)&v72;
      uint64_t v74 = 0x3032000000;
      double v75 = __Block_byref_object_copy__30;
      id v76 = __Block_byref_object_dispose__30;
      CGRect v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v69[0] = MEMORY[0x1E4F143A8];
      v69[1] = 3221225472;
      v69[2] = __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke;
      v69[3] = &unk_1E52E0E70;
      uint64_t v71 = &v72;
      void v69[4] = a1;
      id v27 = v17;
      id v70 = v27;
      [a2 enumerateObjectsUsingBlock:v69];
      uint64_t v28 = *(void **)(v73 + 40);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __108___UICollectionCompositionalLayoutSolver_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect___block_invoke_2;
      v60[3] = &unk_1E52E0F10;
      v60[4] = a1;
      double v62 = a5;
      double v63 = a6;
      CGFloat v64 = a7;
      CGFloat v65 = a8;
      double v66 = a3;
      double v67 = a4;
      id v29 = v27;
      id v61 = v29;
      CGFloat v68 = sel_resolveForInvalidatedPreferredAttributes_scrollOffset_visibleRect_;
      [v28 enumerateKeysAndObjectsUsingBlock:v60];
      -[_UICollectionCompositionalLayoutSolver _recomputeSolutionBookmarksAndContentSize](a1);
      id v30 = *(id *)(a1 + 272);
      -[_UICollectionLayoutAuxillaryItemSolver resolve]((uint64_t)v30);

      -[_UICollectionCompositionalLayoutSolver _updateBookmarkOffsetsForGlobalSupplementariesIfNeeded](a1);
      [*(id *)(a1 + 208) removeAllObjects];
      [*(id *)(a1 + 216) removeAllObjects];
      [*(id *)(a1 + 224) removeAllObjects];
      double v31 = *MEMORY[0x1E4F1DAD8];
      double v32 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      if (!v22) {
        goto LABEL_30;
      }
      __int16 v33 = *((_WORD *)v22 + 144);
      if (v33)
      {
        uint64_t v35 = [v22 indexPath];
        id v34 = -[_UICollectionCompositionalLayoutSolver layoutAttributesForItemAtIndexPath:](a1, v35);
      }
      else
      {
        if ((v33 & 2) != 0)
        {
          uint64_t v35 = (CGFloat *)*((id *)v22 + 1);
          id v36 = [v22 indexPath];
          uint64_t v37 = -[_UICollectionCompositionalLayoutSolver layoutAttributesForDecorationViewOfKind:withIndexPath:](a1, v35, v36);
        }
        else
        {
          if ((v33 & 3) != 0)
          {
            id v34 = 0;
            goto LABEL_29;
          }
          uint64_t v35 = (CGFloat *)*((id *)v22 + 1);
          id v36 = [v22 indexPath];
          uint64_t v37 = -[_UICollectionCompositionalLayoutSolver layoutAttributesForSupplementaryViewOfKind:withIndexPath:]((void **)a1, v35, v36);
        }
        id v34 = (void *)v37;
      }
      if (v34)
      {
        [v22 frame];
        CGFloat v39 = v38;
        CGFloat v41 = v40;
        CGFloat v43 = v42;
        CGFloat v45 = v44;
        [v34 frame];
        uint64_t v50 = *(void *)(a1 + 64);
        if (v50 == 1)
        {
          double MaxX = CGRectGetMaxX(*(CGRect *)&v46);
          v102.origin.CGFloat x = v39;
          v102.origin.CGFloat y = v41;
          v102.size.double width = v43;
          v102.size.double height = v45;
          CGFloat v56 = CGRectGetMaxX(v102);
          double v53 = _UISetPointValueForAxis(1, v31, v32, MaxX - v56);
        }
        else
        {
          if (v50 != 2) {
            goto LABEL_29;
          }
          double MaxY = CGRectGetMaxY(*(CGRect *)&v46);
          v101.origin.CGFloat x = v39;
          v101.origin.CGFloat y = v41;
          v101.size.double width = v43;
          v101.size.double height = v45;
          CGFloat v52 = CGRectGetMaxY(v101);
          double v53 = _UISetPointValueForAxis(2, v31, v32, MaxY - v52);
        }
        double v31 = v53;
        double v32 = v54;
      }
LABEL_29:

LABEL_30:
      objc_msgSend(v29, "setContentOffsetAdjustment:", v31, v32);
      double v57 = v61;
      id v17 = v29;

      _Block_object_dispose(&v72, 8);
    }
  }
  else
  {
    id v17 = 0;
  }
  return v17;
}

- (void)_updateBookmarkOffsetsForGlobalSupplementariesIfNeeded
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  -[_UICollectionCompositionalLayoutSolver _updateGeometryTranslator](a1);
  uint64_t v45 = a1;
  uint64_t v2 = *(double **)(a1 + 272);
  if (v2 && (v2[18] != 0.0 || v2[20] != 0.0 || v2[19] != 0.0 || v2[21] != 0.0))
  {
    double v44 = objc_alloc_init(_UIRTree);
    uint64_t v3 = *(void *)(a1 + 272);
    if (v3)
    {
      double v5 = *(double *)(v3 + 144);
      double v4 = *(double *)(v3 + 152);
    }
    else
    {
      double v4 = 0.0;
      double v5 = 0.0;
    }
    uint64_t v6 = *(void *)(a1 + 64);
    id v43 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id obj = *(id *)(v45 + 184);
    uint64_t v7 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (!v7)
    {
LABEL_28:

      -[_UICollectionCompositionalLayoutSolver setSolutionBookmarks:](v45, v43);
      double v38 = *(void **)(v45 + 192);
      *(void *)(v45 + 192) = v44;

      return;
    }
    uint64_t v8 = v7;
    if (v6)
    {
      if (v6 != 1)
      {
        if (v6 == 2) {
          double v4 = 0.0;
        }
        goto LABEL_15;
      }
    }
    else
    {
      double v4 = 0.0;
    }
    double v5 = 0.0;
LABEL_15:
    uint64_t v9 = 0;
    double v40 = *(double *)(MEMORY[0x1E4F1DAD8] + 8) - v5;
    double v41 = *MEMORY[0x1E4F1DAD8] - v4;
    uint64_t v42 = *(void *)v50;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v50 != v42) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v49 + 1) + 8 * v10);
        if (v11)
        {
          double v12 = *(double *)(v11 + 24);
          double v13 = *(double *)(v11 + 32);
          CGFloat v14 = *(double *)(v11 + 40);
          CGFloat v15 = *(double *)(v11 + 48);
          double v47 = v40 + v13;
          double v48 = v41 + v12;
          v55.origin.CGFloat x = v12;
          v55.origin.CGFloat y = v13;
          v55.size.double width = v14;
          v55.size.double height = v15;
          double Width = CGRectGetWidth(v55);
          v56.origin.CGFloat x = v12;
          v56.origin.CGFloat y = v13;
          v56.size.double width = v14;
          v56.size.double height = v15;
          double Height = CGRectGetHeight(v56);
          double v17 = *(double *)(v11 + 56);
          double v18 = *(double *)(v11 + 64);
          CGFloat v19 = *(double *)(v11 + 72);
          CGFloat v20 = *(double *)(v11 + 80);
          double v21 = v41 + v17;
          v57.origin.CGFloat x = v17;
          v57.origin.CGFloat y = v18;
          v57.size.double width = v19;
          v57.size.double height = v20;
          double v22 = CGRectGetWidth(v57);
          v58.origin.CGFloat x = v17;
          v58.origin.CGFloat y = v18;
          v58.size.double width = v19;
          v58.size.double height = v20;
          double v23 = CGRectGetHeight(v58);
          double v24 = [_UICollectionSectionSolutionBookmark alloc];
          uint64_t v25 = *(void **)(v11 + 88);
          id v26 = *(void **)(v11 + 96);
          id v27 = *(void **)(v11 + 8);
          uint64_t v28 = *(void **)(v11 + 104);
          id v29 = *(id *)(v11 + 16);
          id v30 = v27;
          double v31 = -[_UICollectionSectionSolutionBookmark initWithSolution:globalFrame:globalPinningFrame:insetEnvironment:supplementaryInsetEnvironment:section:preferredSizes:]((id *)&v24->super.isa, v30, v25, v26, v29, v28, v48, v47, Width, Height, v21, v40 + v18, v22, v23);

          [v43 addObject:v31];
          if (v31)
          {
            double v32 = *((double *)v31 + 7);
            double v33 = *((double *)v31 + 8);
            double v34 = *((double *)v31 + 9);
            double v35 = *((double *)v31 + 10);
          }
          else
          {
            double v33 = 0.0;
            double v34 = 0.0;
            double v35 = 0.0;
            double v32 = 0.0;
          }
          id v36 = *(void **)(v11 + 8);
        }
        else
        {
          [v43 addObject:0];
          double v31 = 0;
          id v36 = 0;
          double v32 = 0.0;
          double v35 = 0.0;
          double v34 = 0.0;
          double v33 = 0.0;
        }
        -[_UICollectionCompositionalLayoutSolver _updateSectionIndexer:frame:solution:section:]((void *)v45, v44, v36, v9 + v10, v32, v33, v34, v35);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v37 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
      uint64_t v8 = v37;
      v9 += v10;
    }
    while (v37);
    goto LABEL_28;
  }
}

- (double)_firstBookmarkOffset
{
  if (![*(id *)(a1 + 184) count]) {
    return *MEMORY[0x1E4F1DAD8];
  }
  uint64_t v2 = [*(id *)(a1 + 184) firstObject];
  if (v2) {
    double v3 = v2[3];
  }
  else {
    double v3 = 0.0;
  }

  return v3;
}

- (id)resolveForUpdatedGlobalSupplementaries:(void *)a1
{
  if (a1)
  {
    uint64_t v3 = (uint64_t)a1;
    uint64_t v4 = [a2 copy];
    double v5 = *(void **)(v3 + 264);
    *(void *)(v3 + 264) = v4;

    a1 = -[_UICollectionCompositionalLayoutSolver _resolveOptionallyQueryingForSectionDefinitions:retainPreferredSizing:](v3, 0, 1);
    uint64_t v2 = vars8;
  }
  return a1;
}

- (double)contentSize
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v1 = *(void *)(a1 + 200);
  if (v1) {
    return *(double *)(v1 + 120);
  }
  else {
    return *(double *)(a1 + 304);
  }
}

- (uint64_t)_anchorForAuxiliaryElementOfKind:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  if (!a2)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:sel__anchorForAuxiliaryElementOfKind_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1879, @"Invalid parameter not satisfying: %@", @"elementKind != nil" object file lineNumber description];
  }
  uint64_t v4 = *(id *)(a1 + 272);
  double v5 = -[_UICollectionLayoutAuxillaryItemSolver elementKinds](v4);
  char v6 = [v5 containsObject:a2];

  if (v6) {
    return 1;
  }
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  id v8 = *(id *)(a1 + 184);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75___UICollectionCompositionalLayoutSolver__anchorForAuxiliaryElementOfKind___block_invoke;
  v11[3] = &unk_1E52E0F38;
  v11[4] = a2;
  v11[5] = &v12;
  [v8 enumerateObjectsUsingBlock:v11];

  uint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (_UICollectionCompositionalLayoutSolverResolveResult)resolveSolutionForUpdate:(void *)a3 container:(int)a4 ignoreEmptyUpdate:
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    double v91 = 0;
    goto LABEL_70;
  }
  uint64_t v6 = a2;
  uint64_t v7 = a1;
  if (a2)
  {
    id v8 = *(id *)(a2 + 16);
    id v9 = *(id *)(v6 + 24);
    uint64_t v10 = v9;
    CGRect v86 = v8;
    if (v8)
    {
      if (v9) {
        goto LABEL_5;
      }
LABEL_76:
      CGFloat v83 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = a1;
      [v83 handleFailureInMethod:sel_resolveSolutionForUpdate_container_ignoreEmptyUpdate_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1214, @"Invalid parameter not satisfying: %@", @"finalDataSourceSnapshot != nil" object file lineNumber description];

      uint64_t v6 = a2;
      if (a3) {
        goto LABEL_6;
      }
LABEL_77:
      uint64_t v84 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v7 = a1;
      [v84 handleFailureInMethod:sel_resolveSolutionForUpdate_container_ignoreEmptyUpdate_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1215, @"Invalid parameter not satisfying: %@", @"newContainer != nil" object file lineNumber description];

      uint64_t v6 = a2;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  CGFloat v82 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v7 = a1;
  [v82 handleFailureInMethod:sel_resolveSolutionForUpdate_container_ignoreEmptyUpdate_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1213, @"Invalid parameter not satisfying: %@", @"updateTranslator != nil" object file lineNumber description];

  CGRect v86 = 0;
  uint64_t v6 = a2;
  if (!v10) {
    goto LABEL_76;
  }
LABEL_5:
  if (!a3) {
    goto LABEL_77;
  }
LABEL_6:
  double v91 = objc_alloc_init(_UICollectionCompositionalLayoutSolverResolveResult);
  if (a4)
  {
    if (v6) {
      uint64_t v11 = *(void **)(v6 + 8);
    }
    else {
      uint64_t v11 = 0;
    }
    id v12 = v11;
    if ([v12 count])
    {
    }
    else
    {
      int v13 = [a3 isEqual:*(void *)(v7 + 48)];

      if (v13)
      {
        -[_UICollectionCompositionalLayoutSolver _invalidateAllAttributes](v7);
        goto LABEL_69;
      }
    }
  }
  double v85 = v10;
  objc_storeStrong((id *)(v7 + 48), a3);
  if (v6)
  {
    uint64_t v14 = a2;
    uint64_t v15 = a1;
    CGFloat v17 = *(double *)(a2 + 32);
    CGFloat v16 = *(double *)(a2 + 40);
    CGFloat v19 = *(double *)(a2 + 48);
    CGFloat v18 = *(double *)(a2 + 56);
    CGFloat v20 = *(void **)(a2 + 16);
  }
  else
  {
    CGFloat v20 = 0;
    CGFloat v18 = 0.0;
    CGFloat v19 = 0.0;
    CGFloat v16 = 0.0;
    CGFloat v17 = 0.0;
    uint64_t v14 = a2;
    uint64_t v15 = a1;
  }
  BOOL v21 = v14 == 0;
  id v22 = v20;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v117[0] = MEMORY[0x1E4F143A8];
  v117[1] = 3221225472;
  v117[2] = __138___UICollectionCompositionalLayoutSolver__updateResultsNotingDeletedItemAndSectionAuxillaries_returningStartingGroupAuxillariesForUpdate___block_invoke;
  v117[3] = &unk_1E52E10A0;
  id v118 = v22;
  v119 = v91;
  id v24 = v23;
  id v120 = v24;
  id v25 = v22;
  -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](v15, (uint64_t)v117, v17, v16, v19, v18);
  id v26 = v120;
  id v87 = v24;

  if (v21) {
    id v27 = 0;
  }
  else {
    id v27 = *(void **)(a2 + 24);
  }
  objc_storeStrong((id *)(a1 + 72), v27);
  uint64_t v28 = (id *)a1;
  if (*(unsigned char *)(a1 + 12))
  {
    id v90 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v116 = 0u;
    id v29 = *(id *)(a1 + 184);
    uint64_t v30 = [v29 countByEnumeratingWithState:&v113 objects:v117 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v114;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v114 != v31) {
            objc_enumerationMutation(v29);
          }
          uint64_t v33 = *(void *)(*((void *)&v113 + 1) + 8 * v32);
          double v34 = [_UICollectionCompositionalSolverPreferredSizesRebaseInfo alloc];
          p_isa = (id *)&v34->super.isa;
          if (v33)
          {
            id v36 = *(id *)(v33 + 8);
            uint64_t v33 = *(void *)(v33 + 104);
            if (!p_isa) {
              goto LABEL_27;
            }
          }
          else
          {
            id v36 = 0;
            if (!v34) {
              goto LABEL_27;
            }
          }
          v102.receiver = p_isa;
          v102.super_class = (Class)_UICollectionCompositionalSolverPreferredSizesRebaseInfo;
          uint64_t v37 = (id *)objc_msgSendSuper2(&v102, sel_init);
          p_isa = v37;
          if (v37)
          {
            objc_storeStrong(v37 + 1, v36);
            objc_storeStrong(p_isa + 2, (id)v33);
          }
LABEL_27:

          [v90 addObject:p_isa];
          ++v32;
        }
        while (v30 != v32);
        uint64_t v38 = [v29 countByEnumeratingWithState:&v113 objects:v117 count:16];
        uint64_t v30 = v38;
      }
      while (v38);
    }

    uint64_t v39 = *(void *)(a1 + 152);
    v102.receiver = 0;
    v102.super_class = (Class)&v102;
    *(void *)&long long v103 = 0x3032000000;
    *((void *)&v103 + 1) = __Block_byref_object_copy__30;
    *(void *)&long long v104 = __Block_byref_object_dispose__30;
    *((void *)&v104 + 1) = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (a2) {
      double v40 = *(void **)(a2 + 16);
    }
    else {
      double v40 = 0;
    }
    id v41 = v40;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    uint64_t v107 = 3221225472;
    CGRect v108 = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke;
    CGRect v109 = &unk_1E52E10C8;
    CGRect v110 = &v102;
    uint64_t v42 = _Block_copy(&aBlock);
    *(void *)&long long v98 = MEMORY[0x1E4F143A8];
    *((void *)&v98 + 1) = 3221225472;
    *(void *)&long long v99 = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_2;
    *((void *)&v99 + 1) = &unk_1E52E1168;
    id v43 = v41;
    *(void *)&long long v100 = v43;
    id v44 = v42;
    *((void *)&v100 + 1) = v44;
    [v90 enumerateObjectsUsingBlock:&v98];
    if (v39)
    {
      uint64_t v45 = (void *)a2;
      if (a2) {
        uint64_t v45 = *(void **)(a2 + 8);
      }
      id v46 = v45;
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = ___UICollectionLayoutCompositionalSolverRebasedPreferredSizesForSolutions_block_invoke_6;
      v97[3] = &unk_1E52E1190;
      v97[4] = &v102;
      [v46 enumerateObjectsUsingBlock:v97];
    }
    id v47 = *((id *)v102.super_class + 5);

    _Block_object_dispose(&v102, 8);
    uint64_t v28 = (id *)a1;
  }
  else
  {
    id v47 = (id)MEMORY[0x1E4F1CC08];
  }
  double v48 = (void *)[v47 mutableCopy];

  [v86 finalSectionCount];
  uint64_t v49 = [v28[23] count];
  long long v50 = [v28 _fetchUpdatedSectionDefinitionsFromSectionProvider];
  v92[0] = MEMORY[0x1E4F143A8];
  v92[1] = 3221225472;
  v92[2] = __95___UICollectionCompositionalLayoutSolver_resolveSolutionForUpdate_container_ignoreEmptyUpdate___block_invoke;
  v92[3] = &unk_1E52E0DF8;
  id v93 = v86;
  uint64_t v94 = a1;
  id v95 = v48;
  uint64_t v96 = v49;
  id v51 = v48;
  [v50 enumerateObjectsUsingBlock:v92];
  [(_UICollectionCompositionalLayoutSolverResolveResult *)v91 setSectionsWereRequeried:1];
  -[_UICollectionCompositionalLayoutSolver _solveWithSectionLayouts:preferredSizesDict:dataSourceSnapshot:update:](a1, v50, v51, v85, a2);
  -[_UICollectionCompositionalLayoutSolver _configureLayoutForSections:](a1, v50);
  if (a2)
  {
    CGFloat v53 = *(double *)(a2 + 32);
    CGFloat v52 = *(double *)(a2 + 40);
    CGFloat v55 = *(double *)(a2 + 48);
    CGFloat v54 = *(double *)(a2 + 56);
    CGRect v56 = *(void **)(a2 + 16);
  }
  else
  {
    CGRect v56 = 0;
    CGFloat v54 = 0.0;
    CGFloat v55 = 0.0;
    CGFloat v52 = 0.0;
    CGFloat v53 = 0.0;
  }
  CGRect v57 = v56;
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v107 = 3221225472;
  CGRect v108 = __154___UICollectionCompositionalLayoutSolver__updateResultNotingInsertedItemAndSectionAuxillaries_forVisibleGroupAuxillaryAttributesBeforeResolve_withUpdate___block_invoke;
  CGRect v109 = &unk_1E52E10A0;
  CGRect v110 = v57;
  CGRect v111 = v91;
  id v59 = v58;
  id v112 = v59;
  CGFloat v60 = v57;
  -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](a1, (uint64_t)&aBlock, v53, v52, v55, v54);
  id v61 = v112;
  id v62 = v59;

  double v63 = (void *)[v62 mutableCopy];
  [v63 minusSet:v87];
  long long v104 = 0u;
  long long v105 = 0u;
  objc_super v102 = (objc_super)0;
  long long v103 = 0u;
  id v64 = v63;
  uint64_t v65 = [v64 countByEnumeratingWithState:&v102 objects:v117 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v103;
    do
    {
      for (uint64_t i = 0; i != v65; ++i)
      {
        if (*(void *)v103 != v66) {
          objc_enumerationMutation(v64);
        }
        uint64_t v68 = *((void *)v102.super_class + i);
        if (v68)
        {
          uint64_t v69 = *(void *)(v68 + 32);
          if (v69 == 2)
          {
            id v70 = *(id *)(v68 + 16);
            id v71 = *(id *)(v68 + 8);
            -[_UICollectionCompositionalLayoutSolverResolveResult addInsertedAuxillaryOfElementKind:atIndexPath:isSupplementary:]((uint64_t)v91, v70, (uint64_t)v71, 0);
          }
          else
          {
            if (v69 != 1) {
              continue;
            }
            id v70 = *(id *)(v68 + 16);
            id v71 = *(id *)(v68 + 8);
            -[_UICollectionCompositionalLayoutSolverResolveResult addInsertedAuxillaryOfElementKind:atIndexPath:isSupplementary:]((uint64_t)v91, v70, (uint64_t)v71, 1);
          }
        }
      }
      uint64_t v65 = [v64 countByEnumeratingWithState:&v102 objects:v117 count:16];
    }
    while (v65);
  }

  uint64_t v72 = (void *)[v87 mutableCopy];
  [v72 minusSet:v62];
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v73 = v72;
  uint64_t v74 = [v73 countByEnumeratingWithState:&v98 objects:&v113 count:16];
  if (!v74) {
    goto LABEL_68;
  }
  uint64_t v75 = *(void *)v99;
  do
  {
    for (uint64_t j = 0; j != v74; ++j)
    {
      if (*(void *)v99 != v75) {
        objc_enumerationMutation(v73);
      }
      uint64_t v77 = *(void *)(*((void *)&v98 + 1) + 8 * j);
      if (v77)
      {
        uint64_t v78 = *(void *)(v77 + 32);
        if (v78 == 2)
        {
          id v79 = *(id *)(v77 + 16);
          id v80 = *(id *)(v77 + 8);
          -[_UICollectionCompositionalLayoutSolverResolveResult addDeletedAuxillaryOfElementKind:atIndexPath:isSupplementary:]((uint64_t)v91, v79, (uint64_t)v80, 0);
        }
        else
        {
          if (v78 != 1) {
            continue;
          }
          id v79 = *(id *)(v77 + 16);
          id v80 = *(id *)(v77 + 8);
          -[_UICollectionCompositionalLayoutSolverResolveResult addDeletedAuxillaryOfElementKind:atIndexPath:isSupplementary:]((uint64_t)v91, v79, (uint64_t)v80, 1);
        }
      }
    }
    uint64_t v74 = [v73 countByEnumeratingWithState:&v98 objects:&v113 count:16];
  }
  while (v74);
LABEL_68:

  uint64_t v10 = v85;
LABEL_69:

LABEL_70:
  return v91;
}

- (void)_configureLayoutForSections:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 112);
  if (v2 && *(void *)(v2 + 56))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = a2;
    uint64_t v23 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v23)
    {
      uint64_t v22 = *(void *)v27;
      do
      {
        uint64_t v4 = 0;
        do
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = v4;
          double v5 = *(void **)(*((void *)&v26 + 1) + 8 * v4);
          uint64_t v6 = *(void *)(a1 + 112);
          if (!v6 || !*(void *)(v6 + 56))
          {
            CGFloat v19 = [MEMORY[0x1E4F28B00] currentHandler];
            [v19 handleFailureInMethod:sel__registerDecorationItemsIfNeeded_, a1, @"_UICollectionCompositionalLayoutSolver.m", 3118, @"Invalid parameter not satisfying: %@", @"self.options.decorationRegistrationHandler" object file lineNumber description];
          }
          id v24 = v5;
          uint64_t v7 = [v5 _backgroundDecorationViewsRequiringCustomViewClassRegistration];
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v32;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v32 != v10) {
                  objc_enumerationMutation(v7);
                }
                uint64_t v12 = *(void *)(*((void *)&v31 + 1) + 8 * v11);
                int v13 = *(void **)(a1 + 112);
                if (v13) {
                  uint64_t v14 = v13[7];
                }
                else {
                  uint64_t v14 = 0;
                }
                uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v14 + 16);
                CGFloat v16 = v13;
                v15(v14, v12);

                ++v11;
              }
              while (v9 != v11);
              uint64_t v17 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
              uint64_t v9 = v17;
            }
            while (v17);
          }
          CGFloat v18 = [v24 group];
          if ([v18 _hasDecorationItemRequiringRegistration])
          {
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __75___UICollectionCompositionalLayoutSolver__registerDecorationItemsIfNeeded___block_invoke;
            v30[3] = &unk_1E52E1050;
            v30[4] = a1;
            [v18 _enumerateItemsWithHandler:v30];
          }

          uint64_t v4 = v25 + 1;
        }
        while (v25 + 1 != v23);
        uint64_t v20 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
        uint64_t v23 = v20;
      }
      while (v20);
    }
  }
}

- (void)prepareForCollectionViewUpdates
{
  if (a1)
  {
    id v2 = *(id *)(a1 + 208);
    *(void *)(a1 + 232) = [v2 count];

    objc_setProperty_nonatomic_copy((id)a1, v3, *(id *)(a1 + 184), 240);
    objc_storeStrong((id *)(a1 + 248), *(id *)(a1 + 48));
    uint64_t v4 = *(void **)(a1 + 72);
    objc_storeStrong((id *)(a1 + 256), v4);
  }
}

- (void)finalizeCollectionViewUpdates
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v2 = [*(id *)(a1 + 208) count];
    unint64_t v4 = *(void *)(a1 + 232);
    if (v4 <= 0x64) {
      unint64_t v4 = 100;
    }
    if (v2 > v4)
    {
      unint64_t v5 = v2;
      if (v2 / v4 >= 2)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICollectionLayout", &finalizeCollectionViewUpdates___s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          uint64_t v9 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            uint64_t v10 = *(void *)(a1 + 232);
            int v11 = 134218496;
            uint64_t v12 = a1;
            __int16 v13 = 2048;
            uint64_t v14 = v10;
            __int16 v15 = 2048;
            unint64_t v16 = v5;
            _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "finalizeCollectionViewUpdates: solver == %p; CompLayoutSolver clearing caches for large update becase item"
              " cache size changed from %lu to %lu during update.",
              (uint8_t *)&v11,
              0x20u);
          }
        }
        -[_UICollectionCompositionalLayoutSolver _invalidateAllAttributes](a1);
      }
    }
    *(void *)(a1 + 232) = 0;
    objc_setProperty_nonatomic_copy((id)a1, v3, 0, 240);
    uint64_t v7 = *(void **)(a1 + 248);
    *(void *)(a1 + 248) = 0;

    uint64_t v8 = *(void **)(a1 + 256);
    *(void *)(a1 + 256) = 0;
  }
}

- (void)setDynamicsConfigurationHandler:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v4 = [a2 copy];
    unint64_t v5 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v4;

    if (a2)
    {
      uint64_t v6 = objc_alloc_init(_UICollectionLayoutDynamicsConfiguration);
      uint64_t v7 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = v6;

      uint64_t v8 = [_UICollectionCompositionalLayoutDynamicAnimator alloc];
      id v9 = *(id *)(a1 + 136);
      CGFloat v18 = v9;
      if (v8)
      {
        if (!v9)
        {
          uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:sel_initWithReferenceSystem_invalidationHandler_, v8, @"_UICollectionCompositionalLayoutSolver.m", 3512, @"Invalid parameter not satisfying: %@", @"invalidationHandler" object file lineNumber description];
        }
        v19.receiver = v8;
        v19.super_class = (Class)_UICollectionCompositionalLayoutDynamicAnimator;
        uint64_t v8 = (_UICollectionCompositionalLayoutDynamicAnimator *)objc_msgSendSuper2(&v19, sel_initWithReferenceSystem_, a1);
        uint64_t v10 = [v18 copy];
        id invalidationHandler = v8->_invalidationHandler;
        v8->_id invalidationHandler = (id)v10;

        uint64_t v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        itemBehaviors = v8->_itemBehaviors;
        v8->_itemBehaviors = v12;
      }
      uint64_t v14 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = v8;

      __int16 v15 = v18;
    }
    else
    {
      unint64_t v16 = *(void **)(a1 + 176);
      *(void *)(a1 + 176) = 0;

      __int16 v15 = *(void **)(a1 + 168);
      *(void *)(a1 + 168) = 0;
    }
  }
}

- (id)restorableState
{
  if (a1 && (unint64_t v2 = [_UICollectionCompositionalLayoutSolverRestorableState alloc]) != 0)
  {
    v8.receiver = v2;
    v8.super_class = (Class)_UICollectionCompositionalLayoutSolverRestorableState;
    id v3 = objc_msgSendSuper2(&v8, sel_init);
    if (v3)
    {
      id v4 = *(id *)(a1 + 184);
      uint64_t v5 = -[_UICollectionCompositionalLayoutSolver _snapshotBookmarks:](v4);
      uint64_t v6 = (void *)*((void *)v3 + 1);
      *((void *)v3 + 1) = v5;

      objc_storeStrong((id *)v3 + 2, *(id *)(a1 + 88));
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)dealloc
{
  if (os_variant_has_internal_diagnostics())
  {
    if (*(unsigned char *)&self->_solverFlags)
    {
      id v3 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v3, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: solver unexpectedly deallocating whilst solution bookmarks are locked. Please file a bug against UICollectionView with reproduction steps.", buf, 2u);
      }
    }
  }
  else if (*(unsigned char *)&self->_solverFlags)
  {
    id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dealloc___s_category_1) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: solver unexpectedly deallocating whilst solution bookmarks are locked. Please file a bug against UICollectionView with reproduction steps.", buf, 2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)_UICollectionCompositionalLayoutSolver;
  [(_UICollectionCompositionalLayoutSolver *)&v5 dealloc];
}

- (id)itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:sel_itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1772, @"Invalid parameter not satisfying: %@", @"indexPaths != nil" object file lineNumber description];
    }
    uint64_t v26 = a1;
    id v4 = *(id *)(a1 + 184);
    id v27 = (id)objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v5 = a2;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v32;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v32 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
          unint64_t v11 = [v10 section];
          if (v11 >= [v4 count])
          {
            uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel_itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths_, v26, @"_UICollectionCompositionalLayoutSolver.m", 1779, @"Compositional Layout internal error: Layout solver queried for preferred size group in invalid section %ld. Section count: %ld", v11, objc_msgSend(v4, "count"));
          }
          uint64_t v12 = [v4 objectAtIndexedSubscript:v11];
          __int16 v13 = (void *)v12;
          if (v12) {
            uint64_t v14 = *(void **)(v12 + 8);
          }
          else {
            uint64_t v14 = 0;
          }
          id v15 = v14;
          unint64_t v16 = objc_msgSend(v15, "preferredSizeGroupingRangeForItemAtIndex:", objc_msgSend(v10, "item"));
          unint64_t v18 = v17;

          if (v18 >= 2 && v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v13) {
              uint64_t v20 = v13[13];
            }
            else {
              uint64_t v20 = 0;
            }
            BOOL v21 = [(_UICollectionPreferredSizes *)v20 indexesOfItemsWithoutPreferredSizesInRange:v18];
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __98___UICollectionCompositionalLayoutSolver_itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths___block_invoke;
            v28[3] = &unk_1E52E0E98;
            unint64_t v30 = v11;
            id v29 = v27;
            [v21 enumerateIndexesUsingBlock:v28];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v23 = [v5 countByEnumeratingWithState:&v31 objects:v35 count:16];
        uint64_t v7 = v23;
      }
      while (v23);
    }
  }
  else
  {
    id v27 = 0;
  }
  return v27;
}

- (uint64_t)enumerateSectionDefinitionsWithBlock:(uint64_t)result
{
  if (result)
  {
    unint64_t v2 = *(void **)(result + 184);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __79___UICollectionCompositionalLayoutSolver_enumerateSectionDefinitionsWithBlock___block_invoke;
    v3[3] = &unk_1E52E1078;
    v3[4] = a2;
    return [v2 enumerateObjectsUsingBlock:v3];
  }
  return result;
}

- (id)layoutAttributesForDecorationViewOfKind:(void *)a3 withIndexPath:
{
  if (!a1) {
    goto LABEL_7;
  }
  uint64_t v6 = [a2 length];
  id v7 = 0;
  if (a3 && v6)
  {
    if ([a3 length] == 2)
    {
      uint64_t v8 = -[_UICollectionCompositionalLayoutSolver _cachedDecorationAttributesForElementKind:indexPath:](a1, (uint64_t)a2, (uint64_t)a3);
      if (v8)
      {
        id v7 = v8;
LABEL_28:

        goto LABEL_29;
      }
      id v9 = *(id *)(a1 + 184);
      unint64_t v10 = [a3 section];
      unint64_t v11 = [a3 item];
      unint64_t v12 = [v9 count];
      id v7 = 0;
      if ((v10 & 0x8000000000000000) != 0 || v10 >= v12)
      {
LABEL_27:

        goto LABEL_28;
      }
      uint64_t v13 = [v9 objectAtIndexedSubscript:v10];
      uint64_t v14 = v13;
      if (v13) {
        id v15 = *(void **)(v13 + 16);
      }
      else {
        id v15 = 0;
      }
      id v16 = v15;
      unint64_t v17 = [v16 _auxillaryItemForElementKind:a2 category:2];
      if (!v17)
      {
        if (v14) {
          uint64_t v36 = *(void **)(v14 + 8);
        }
        else {
          uint64_t v36 = 0;
        }
        id v22 = v36;
        uint64_t v37 = [v22 supplementaryFrameWithKind:a2 index:v11];
        uint64_t v23 = v37;
        if (v37)
        {
          if (*(void *)(v37 + 32) != 3)
          {
            long long v50 = [MEMORY[0x1E4F28B00] currentHandler];
            [v50 handleFailureInMethod:sel_layoutAttributesForDecorationViewOfKind_withIndexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 925, @"Invalid parameter not satisfying: %@", @"result.isDecoration" object file lineNumber description];
          }
          +[_UICollectionCompositionalLayoutSolver _globalFrameForSolutionFrame:bookmark:container:](*(CGFloat *)(v23 + 64), *(CGFloat *)(v23 + 72), *(CGFloat *)(v23 + 80), *(CGFloat *)(v23 + 88), (uint64_t)_UICollectionCompositionalLayoutSolver, (double *)v14, *(void **)(a1 + 48));
          double v39 = v38;
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          id v46 = -[_UICollectionLayoutFramesQueryResult auxillaryItem]((void *)v23);
          id v47 = [v46 decorationItem];

          if (!v47)
          {
            id v51 = [MEMORY[0x1E4F28B00] currentHandler];
            [v51 handleFailureInMethod:sel_layoutAttributesForDecorationViewOfKind_withIndexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 932, @"Invalid parameter not satisfying: %@", @"decorationItem" object file lineNumber description];
          }
          double v35 = -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForDecorationItemAtIndexPath:elementKind:frame:additionalContentInset:zIndex:](a1, a3, a2, [v47 zIndex], v39, v41, v43, v45, 0.0, 0.0, 0.0, 0.0);

          unint64_t v17 = 0;
        }
        else
        {
          double v35 = 0;
        }
        goto LABEL_26;
      }
      unint64_t v18 = [v16 decorationItems];
      unint64_t v19 = [v18 count];

      if (v11 >= v19)
      {
        uint64_t v49 = [MEMORY[0x1E4F28B00] currentHandler];
        [v49 handleFailureInMethod:sel_layoutAttributesForDecorationViewOfKind_withIndexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 913, @"Invalid parameter not satisfying: %@", @"itemIndex < section.decorationItems.count" object file lineNumber description];

        if (v14) {
          goto LABEL_15;
        }
      }
      else if (v14)
      {
LABEL_15:
        uint64_t v20 = *(void **)(v14 + 16);
LABEL_16:
        BOOL v21 = [v20 decorationItems];
        id v22 = [v21 objectAtIndexedSubscript:v11];

        uint64_t v23 = [v22 elementKind];
        double v24 = +[_UICollectionCompositionalLayoutSolver _globalFrameForBackgroundDecoration:forSectionWithBookmark:]((uint64_t)_UICollectionCompositionalLayoutSolver, (id *)v14);
        double v26 = v25;
        double v28 = v27;
        double v30 = v29;
        [v22 contentInsets];
        double v35 = -[_UICollectionCompositionalLayoutSolver _createAndCacheLayoutAttributesForDecorationItemAtIndexPath:elementKind:frame:additionalContentInset:zIndex:](a1, a3, (void *)v23, [v22 zIndex], v24, v26, v28, v30, v31, v32, v33, v34);
LABEL_26:

        id v7 = v35;
        goto LABEL_27;
      }
      uint64_t v20 = 0;
      goto LABEL_16;
    }
LABEL_7:
    id v7 = 0;
  }
LABEL_29:
  return v7;
}

- (uint64_t)elementShouldAppearBelowOrthogonalScrollingContainer:(uint64_t)a1
{
  uint64_t v2 = 0;
  if (a1 && a2)
  {
    if (dyld_program_sdk_at_least() && *(unsigned char *)(a1 + 13))
    {
      id v5 = [(id)a2 indexPath];
      uint64_t v6 = v5;
      if (v5
        && [v5 length] == 2
        && [(id)a2 zIndex] <= 0
        && (*(_WORD *)(a2 + 288) & 2) != 0)
      {
        id v8 = *(id *)(a2 + 8);
        uint64_t v2 = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:elementKind:](a1, v6, (uint64_t)v8) ^ 1;
      }
      else
      {
        uint64_t v2 = 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

- (uint64_t)orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:(uint64_t)a3 elementKind:
{
  if (!a1 || [a2 length] == 1) {
    return 0;
  }
  unint64_t v7 = [a2 section];
  if (v7 >= [*(id *)(a1 + 184) count]) {
    return 1;
  }
  uint64_t v8 = [*(id *)(a1 + 184) objectAtIndexedSubscript:v7];
  id v9 = (void *)v8;
  if (v8)
  {
    id v10 = *(id *)(v8 + 8);
    unint64_t v11 = (void *)v9[2];
  }
  else
  {
    id v10 = 0;
    unint64_t v11 = 0;
  }
  id v12 = v11;
  if ([v12 scrollsOrthogonally])
  {
    [a2 item];
    uint64_t v13 = [v12 _auxillaryItemForElementKind:a3 category:2];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = [v13 decorationItem];
      if ([v15 isBackgroundDecoration]) {
        uint64_t v6 = [v12 _clipsBackgroundDecorationsToContent];
      }
      else {
        uint64_t v6 = 1;
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

+ (id)traitsRequiringInvalidationForChanges
{
  self;
  if (_MergedGlobals_193 != -1) {
    dispatch_once(&_MergedGlobals_193, &__block_literal_global_118);
  }
  v0 = (void *)qword_1E8FDF628;
  return v0;
}

- (BOOL)shouldInvalidateForBoundsChange:(double)a3 requiresContainerUpdate:(double)a4
{
  if (result)
  {
    uint64_t v9 = result;
    if (!a2)
    {
      uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:sel_shouldInvalidateForBoundsChange_requiresContainerUpdate_, v9, @"_UICollectionCompositionalLayoutSolver.m", 1365, @"Invalid parameter not satisfying: %@", @"requiresContainerUpdate" object file lineNumber description];
    }
    *a2 = 0;
    if (-[_UICollectionCompositionalLayoutSolver hasPinnedSupplementaryItems](v9) || *(uint64_t *)(v9 + 288) > 0) {
      return 1;
    }
    [*(id *)(v9 + 48) contentSize];
    uint64_t v12 = (v10 != a5) | 2;
    if (v11 == a6) {
      uint64_t v12 = v10 != a5;
    }
    BOOL v13 = v10 != a5 || v11 != a6;
    *a2 = v13;
    return (v12 & *(void *)(v9 + 296)) != 0 || v13 && !dyld_program_sdk_at_least();
  }
  return result;
}

- (void)invalidateCachedDecorationAttributesForElementKind:(uint64_t)a3 atIndexPaths:
{
  if (a1)
  {
    id v4 = [*(id *)(a1 + 224) objectForKeyedSubscript:a2];
    if (v4)
    {
      id v5 = v4;
      [v4 removeObjectsForKeys:a3];
      id v4 = v5;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalSupplementaryPreferredSizes, 0);
  objc_storeStrong((id *)&self->_globalSupplementarySolver, 0);
  objc_storeStrong((id *)&self->_globalSupplementaryItems, 0);
  objc_storeStrong((id *)&self->_preUpdateDataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_preUpdateContainer, 0);
  objc_storeStrong((id *)&self->_preUpdateSolutionBookmarks, 0);
  objc_storeStrong((id *)&self->_cachedDecorationAttributes, 0);
  objc_storeStrong((id *)&self->_cachedSupplementaryAttributes, 0);
  objc_storeStrong((id *)&self->_cachedItemAttributes, 0);
  objc_storeStrong((id *)&self->_sectionGeometryTranslator, 0);
  objc_storeStrong((id *)&self->_sectionIndexer, 0);
  objc_storeStrong((id *)&self->_solutionBookmarks, 0);
  objc_storeStrong((id *)&self->_dynamicsConfiguration, 0);
  objc_storeStrong((id *)&self->_dynamicAnimator, 0);
  objc_storeStrong((id *)&self->_solutionBookmarkIndexesWithPinnedSupplementaryItems, 0);
  objc_storeStrong(&self->_sectionProvider, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_invalidationContextClass, 0);
  objc_storeStrong((id *)&self->_layoutAttributeClass, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong(&self->_dynamicsConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_customContainerSectionIndexes, 0);
  objc_storeStrong((id *)&self->_orthogonalScrollingSectionIndexes, 0);
  objc_storeStrong((id *)&self->_dataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_storeStrong(&self->_sectionSupplementaryLayoutAttributesTransformer, 0);
  objc_storeStrong(&self->_sectionDecorationLayoutAttributesTransformer, 0);
  objc_storeStrong(&self->_cellLayoutAttributesTransformer, 0);
}

- (id)updatePinnedSectionSupplementaryItemsForVisibleBounds:(CGFloat)a3
{
  id v5 = a1;
  if (a1)
  {
    double v10 = objc_alloc_init(_UICollectionLayoutUpdateContainerOffsetResult);
    id v11 = v5[20];
    uint64_t v12 = (void *)[v5[23] mutableCopy];
    uint64_t v58 = 0;
    id v59 = &v58;
    uint64_t v60 = 0x2020000000;
    char v61 = 0;
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke;
    v47[3] = &unk_1E52E0C90;
    id v13 = v12;
    id v48 = v13;
    uint64_t v49 = v5;
    id v14 = v11;
    CGFloat v53 = a2;
    CGFloat v54 = a3;
    CGFloat v55 = a4;
    CGFloat v56 = a5;
    id v50 = v14;
    CGFloat v52 = &v58;
    CGRect v57 = sel_updatePinnedSectionSupplementaryItemsForVisibleBounds_;
    id v15 = v10;
    id v51 = v15;
    [v14 enumerateIndexesUsingBlock:v47];
    -[_UICollectionCompositionalLayoutSolver setSolutionBookmarks:]((uint64_t)v5, v13);
    if (*((unsigned char *)v59 + 24))
    {
      id v16 = objc_alloc_init(_UIRTree);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_3;
      v45[3] = &unk_1E52E0CB8;
      v45[4] = v5;
      unint64_t v17 = v16;
      id v46 = v17;
      [v13 enumerateObjectsUsingBlock:v45];
      id v18 = v5[24];
      v5[24] = v17;
      unint64_t v19 = v17;
    }
    id v20 = v5[34];
    BOOL v21 = v20;
    if (v20) {
      id v22 = (void *)*((void *)v20 + 5);
    }
    else {
      id v22 = 0;
    }
    id v23 = v22;
    uint64_t v24 = [v23 count];

    if (v24)
    {
      id v25 = v5[34];
      double v26 = v25;
      if (v25) {
        double v27 = (void *)*((void *)v25 + 5);
      }
      else {
        double v27 = 0;
      }
      id v28 = v27;
      uint64_t v29 = [v28 count];

      if (v29)
      {
        -[_UICollectionCompositionalLayoutSolver _globalSupplementaryFrameOffset]((uint64_t)v5);
        uint64_t v31 = v30;
        uint64_t v33 = v32;
      }
      else
      {
        uint64_t v31 = *MEMORY[0x1E4F1DAD8];
        uint64_t v33 = *(void *)(MEMORY[0x1E4F1DAD8] + 8);
      }
      double v34 = (id *)v5[34];
      -[_UICollectionLayoutAuxillaryItemSolver resolveSupplementaryItemsForVisibleBounds:](v34, a2, a3, a4, a5);

      id v35 = v5[34];
      uint64_t v36 = v35;
      if (v35) {
        uint64_t v37 = (void *)*((void *)v35 + 5);
      }
      else {
        uint64_t v37 = 0;
      }
      id v38 = v37;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __96___UICollectionCompositionalLayoutSolver_updatePinnedSectionSupplementaryItemsForVisibleBounds___block_invoke_4;
      v41[3] = &unk_1E52E0CE0;
      v41[4] = v5;
      double v42 = v15;
      uint64_t v43 = v31;
      uint64_t v44 = v33;
      [v38 enumerateIndexesUsingBlock:v41];
    }
    double v39 = v51;
    id v5 = v15;

    _Block_object_dispose(&v58, 8);
  }
  return v5;
}

- (void)_invalidateAttributes:(uint64_t)a1
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    __int16 v4 = a2[144];
    if (v4)
    {
      id v5 = [a2 indexPath];
      v10[0] = v5;
      uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      [*(id *)(a1 + 208) removeObjectsForKeys:v6];
    }
    else
    {
      if ((v4 & 3) != 0)
      {
        if ((v4 & 2) == 0) {
          return;
        }
        id v5 = [a2 representedElementKind];
        uint64_t v6 = [a2 indexPath];
        uint64_t v8 = v6;
        unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
        -[_UICollectionCompositionalLayoutSolver invalidateCachedDecorationAttributesForElementKind:atIndexPaths:](a1, (uint64_t)v5, (uint64_t)v7);
      }
      else
      {
        id v5 = [a2 representedElementKind];
        uint64_t v6 = [a2 indexPath];
        uint64_t v9 = v6;
        unint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v9 count:1];
        -[_UICollectionCompositionalLayoutSolver invalidateCachedSupplementaryAttributesForElementKind:atIndexPaths:](a1, (uint64_t)v5, (uint64_t)v7);
      }
    }
  }
}

- (uint64_t)updateVisibleBoundsForDynamicAnimator:(CGFloat)a3 previousVisibleBounds:(double)a4
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v9 = result;
    if (*(void *)(result + 104))
    {
      id v18 = *(id *)(result + 168);
      uint64_t v90 = v9;
      id v19 = *(id *)(v9 + 176);
      id v20 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:]([_UICollectionLayoutContainer alloc], a4, a5, 0.0, 0.0, 0.0, 0.0);
      BOOL v21 = [_UICollectionLayoutEnvironment alloc];
      uint64_t v22 = *(void *)(v90 + 72);
      id v23 = *(id *)(v90 + 56);
      CGFloat v82 = v20;
      CGFloat v83 = [(_UICollectionLayoutEnvironment *)v21 initWithContainer:v20 traitCollection:v23 dataSourceSnapshot:v22];

      objc_msgSend(v19, "setCurrentVisibleBounds:", a2, a3, a4, a5);
      double v81 = v19;
      uint64_t v24 = v19;
      uint64_t v25 = v90;
      objc_msgSend(v24, "setPreviousVisibleBounds:", a6, a7, a8, a9);
      uint64_t v113 = 0;
      long long v114 = &v113;
      uint64_t v115 = 0x3032000000;
      long long v116 = __Block_byref_object_copy__30;
      v117 = __Block_byref_object_dispose__30;
      id v118 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      v110[0] = MEMORY[0x1E4F143A8];
      v110[1] = 3221225472;
      v110[2] = __102___UICollectionCompositionalLayoutSolver_updateVisibleBoundsForDynamicAnimator_previousVisibleBounds___block_invoke;
      v110[3] = &unk_1E52E0D30;
      id v112 = &v113;
      double v26 = (id *)v18;
      CGRect v111 = v26;
      -[_UICollectionCompositionalLayoutSolver _layoutAttributesForElementsInRect:handler:](v90, (uint64_t)v110, a2, a3, a4, a5);
      double v85 = v26;
      if (v26)
      {
        double v27 = (void *)MEMORY[0x1E4F1CAD0];
        id v28 = [v26[42] allKeys];
        uint64_t v29 = [v27 setWithArray:v28];
      }
      else
      {
        uint64_t v29 = 0;
      }
      uint64_t v84 = (void *)[v29 mutableCopy];

      [v84 minusSet:v114[5]];
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __102___UICollectionCompositionalLayoutSolver_updateVisibleBoundsForDynamicAnimator_previousVisibleBounds___block_invoke_2;
      v107[3] = &unk_1E52E0D58;
      uint64_t v30 = v85;
      CGRect v108 = v30;
      uint64_t v109 = v90;
      [v84 enumerateObjectsUsingBlock:v107];
      uint64_t v88 = v30;
      if (v85)
      {
        id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        uint64_t v32 = [v30[42] allValues];
        uint64_t v33 = [v32 countByEnumeratingWithState:&v119 objects:v127 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v120;
          do
          {
            uint64_t v35 = 0;
            do
            {
              if (*(void *)v120 != v34) {
                objc_enumerationMutation(v32);
              }
              uint64_t v36 = *(void *)(*((void *)&v119 + 1) + 8 * v35);
              if (v36) {
                uint64_t v37 = *(void *)(v36 + 48);
              }
              else {
                uint64_t v37 = 0;
              }
              [v31 addObject:v37];
              ++v35;
            }
            while (v33 != v35);
            uint64_t v38 = [v32 countByEnumeratingWithState:&v119 objects:v127 count:16];
            uint64_t v33 = v38;
          }
          while (v38);
        }
      }
      else
      {
        id v31 = 0;
      }
      id v39 = *(id *)(v90 + 176);
      [v39 setDynamicItems:v31];

      long long v105 = 0u;
      long long v106 = 0u;
      long long v103 = 0u;
      long long v104 = 0u;
      if (v85)
      {
        double v40 = [v88[42] allValues];
      }
      else
      {
        double v40 = 0;
      }
      uint64_t v41 = [v40 countByEnumeratingWithState:&v103 objects:v126 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v104;
        do
        {
          uint64_t v43 = 0;
          do
          {
            if (*(void *)v104 != v42) {
              objc_enumerationMutation(v40);
            }
            uint64_t v44 = *(void **)(*((void *)&v103 + 1) + 8 * v43);
            id v45 = *(id *)(v90 + 176);
            id v46 = [v44 childBehaviors];
            if (v44) {
              id v47 = (void *)v44[6];
            }
            else {
              id v47 = 0;
            }
            id v48 = v47;
            [v45 _setBehaviors:v46 forItem:v48];

            ++v43;
          }
          while (v41 != v43);
          uint64_t v49 = [v40 countByEnumeratingWithState:&v103 objects:v126 count:16];
          uint64_t v41 = v49;
        }
        while (v49);
      }

      id v50 = (void (**)(id, id, void *))*(id *)(v90 + 104);
      id v51 = *(id *)(v90 + 176);
      v50[2](v50, v51, v83);

      id v52 = *(id *)(v90 + 176);
      CGFloat v53 = [v52 _dirtyItems];

      long long v101 = 0u;
      long long v102 = 0u;
      long long v99 = 0u;
      long long v100 = 0u;
      id obj = v53;
      uint64_t v54 = [obj countByEnumeratingWithState:&v99 objects:v125 count:16];
      if (v54)
      {
        uint64_t v87 = *(void *)v100;
        do
        {
          uint64_t v89 = v54;
          for (uint64_t i = 0; i != v89; ++i)
          {
            if (*(void *)v100 != v87) {
              objc_enumerationMutation(obj);
            }
            uint64_t v56 = *(void *)(*((void *)&v99 + 1) + 8 * i);
            if (v56)
            {
              id v57 = *(id *)(v56 + 24);
              uint64_t v58 = *(void **)(v56 + 16);
            }
            else
            {
              id v57 = 0;
              uint64_t v58 = 0;
            }
            id v59 = v58;
            uint64_t v60 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v59);

            char v61 = -[_UICollectionCompositionalLayoutDynamicAnimator behaviorForIdentifier:](v88, (uint64_t)v60);
            id v62 = [v61 childBehaviors];
            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            id v63 = v62;
            uint64_t v64 = [v63 countByEnumeratingWithState:&v95 objects:v124 count:16];
            if (v64)
            {
              uint64_t v65 = *(void *)v96;
              do
              {
                for (uint64_t j = 0; j != v64; ++j)
                {
                  if (*(void *)v96 != v65) {
                    objc_enumerationMutation(v63);
                  }
                  [v61 removeChildBehavior:*(void *)(*((void *)&v95 + 1) + 8 * j)];
                }
                uint64_t v64 = [v63 countByEnumeratingWithState:&v95 objects:v124 count:16];
              }
              while (v64);
            }

            id v67 = *(id *)(v90 + 176);
            uint64_t v68 = [v67 behaviorsForItem:v56];

            long long v93 = 0u;
            long long v94 = 0u;
            long long v91 = 0u;
            long long v92 = 0u;
            id v69 = v68;
            uint64_t v70 = [v69 countByEnumeratingWithState:&v91 objects:v123 count:16];
            if (v70)
            {
              uint64_t v71 = *(void *)v92;
              do
              {
                for (uint64_t k = 0; k != v70; ++k)
                {
                  if (*(void *)v92 != v71) {
                    objc_enumerationMutation(v69);
                  }
                  [v61 addChildBehavior:*(void *)(*((void *)&v91 + 1) + 8 * k)];
                }
                uint64_t v70 = [v69 countByEnumeratingWithState:&v91 objects:v123 count:16];
              }
              while (v70);
            }

            uint64_t v25 = v90;
          }
          uint64_t v54 = [obj countByEnumeratingWithState:&v99 objects:v125 count:16];
        }
        while (v54);
      }

      id v73 = *(id *)(v25 + 176);
      [v73 _reset];

      if (v85)
      {
        long long v121 = 0u;
        long long v122 = 0u;
        long long v119 = 0u;
        long long v120 = 0u;
        uint64_t v74 = [v88[42] objectEnumerator];
        uint64_t v75 = [v74 countByEnumeratingWithState:&v119 objects:v127 count:16];
        if (v75)
        {
          uint64_t v76 = *(void *)v120;
          do
          {
            uint64_t v77 = 0;
            do
            {
              if (*(void *)v120 != v76) {
                objc_enumerationMutation(v74);
              }
              uint64_t v78 = *(void *)(*((void *)&v119 + 1) + 8 * v77);
              if (v78) {
                uint64_t v79 = *(void *)(v78 + 48);
              }
              else {
                uint64_t v79 = 0;
              }
              [v88 updateItemFromCurrentState:v79];
              ++v77;
            }
            while (v75 != v77);
            uint64_t v80 = [v74 countByEnumeratingWithState:&v119 objects:v127 count:16];
            uint64_t v75 = v80;
          }
          while (v80);
        }
      }
      _Block_object_dispose(&v113, 8);

      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (double)preUpdateFrameForItemAtInitialIndexPath:(uint64_t)a1
{
  if (!a1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    return *(double *)&v18;
  }
  id v4 = *(id *)(a1 + 256);
  if (!v4) {
    goto LABEL_7;
  }
  id v5 = v4;
  id v6 = *(id *)(a1 + 248);
  if (!v6)
  {

    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a1 + 240);

  if (!v7)
  {
LABEL_7:
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v18 = *MEMORY[0x1E4F1DB20];
    long long v19 = v16;
    return *(double *)&v18;
  }
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v18 = *MEMORY[0x1E4F1DB20];
  long long v19 = v8;
  uint64_t v9 = *(void **)(a1 + 240);
  uint64_t v12 = a1 + 248;
  double v10 = *(void **)(a1 + 248);
  id v11 = *(void **)(v12 + 8);
  id v13 = v9;
  id v14 = v11;
  id v15 = +[_UICollectionCompositionalLayoutSolver _queryResultForItemAtIndexPath:dataSourceSnapshot:solutionBookmarks:container:globalFrame:]((uint64_t)_UICollectionCompositionalLayoutSolver, a2, v14, v13, v10, &v18);

  return *(double *)&v18;
}

- (double)preUpdateFrameForSupplementaryViewOfKind:(void *)a3 withInitialIndexPath:
{
  if (!a1)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    return *(double *)&v33;
  }
  id v6 = *(id *)(a1 + 256);
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = v6;
  id v8 = *(id *)(a1 + 248);
  if (!v8)
  {

    goto LABEL_12;
  }
  uint64_t v9 = *(void *)(a1 + 240);

  if (!v9)
  {
LABEL_12:
    long long v24 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v33 = *MEMORY[0x1E4F1DB20];
    long long v34 = v24;
    return *(double *)&v33;
  }
  if ([a3 length] == 1
    && (-[_UICollectionLayoutAuxillaryItemSolver elementKinds](*(void **)(a1 + 272)),
        double v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 containsObject:a2],
        v10,
        v11))
  {
    uint64_t v12 = (id *)*(id *)(a1 + 272);
    uint64_t v13 = -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](v12, a2, [a3 indexAtPosition:0]);

    if (v13)
    {
      id v14 = -[_UICollectionLayoutFramesQueryResult supplementaryItem]((id *)v13);
      if (!v14)
      {
        uint64_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
        [v32 handleFailureInMethod:sel_preUpdateFrameForSupplementaryViewOfKind_withInitialIndexPath_ object:a1 file:@"_UICollectionCompositionalLayoutSolver.m" lineNumber:701 description:@"Failed to resolve the global supplementary definition."];
      }
      -[_UICollectionCompositionalLayoutSolver _globalSupplementaryFrameOffset](a1);
      double v15 = *(double *)(v13 + 64);
      double v16 = *(double *)(v13 + 72);
      CGFloat v17 = *(double *)(v13 + 80);
      CGFloat v18 = *(double *)(v13 + 88);
      double v20 = v15 + v19;
      double v22 = v21 + v16;
      v35.origin.CGFloat x = v15;
      v35.origin.CGFloat y = v16;
      v35.size.double width = v17;
      v35.size.double height = v18;
      CGFloat Width = CGRectGetWidth(v35);
      v36.origin.CGFloat x = v15;
      v36.origin.CGFloat y = v16;
      v36.size.double width = v17;
      v36.size.double height = v18;
      *(double *)&long long v33 = v20;
      *((double *)&v33 + 1) = v22;
      *(CGFloat *)&long long v34 = Width;
      *((void *)&v34 + 1) = CGRectGetHeight(v36);
    }
    else
    {
      long long v31 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      long long v33 = *MEMORY[0x1E4F1DB20];
      long long v34 = v31;
    }
  }
  else
  {
    long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v33 = *MEMORY[0x1E4F1DB20];
    long long v34 = v26;
    double v27 = *(void **)(a1 + 240);
    id v28 = *(void **)(a1 + 248);
    id v29 = v27;
    uint64_t v30 = +[_UICollectionCompositionalLayoutSolver _queryResultForSectionSupplementaryViewOfKind:withIndexPath:solutionBookmarks:container:globalFrame:]((uint64_t)_UICollectionCompositionalLayoutSolver, (uint64_t)a2, a3, v29, v28, &v33);
  }
  return *(double *)&v33;
}

- (double)unpinnedFrameOfBoundarySupplementaryElementOfKind:(void *)a3 withIndexPath:
{
  if (!a1) {
    return 0.0;
  }
  if (a2)
  {
    if (a3) {
      goto LABEL_4;
    }
  }
  else
  {
    double v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:sel_unpinnedFrameOfBoundarySupplementaryElementOfKind_withIndexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 775, @"Invalid parameter not satisfying: %@", @"elementKind != nil" object file lineNumber description];

    if (a3) {
      goto LABEL_4;
    }
  }
  double v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:sel_unpinnedFrameOfBoundarySupplementaryElementOfKind_withIndexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 776, @"Invalid parameter not satisfying: %@", @"indexPath != nil" object file lineNumber description];

LABEL_4:
  unint64_t v6 = [a3 section];
  id v7 = a1[23];
  id v8 = v7;
  if ((v6 & 0x8000000000000000) != 0 || v6 >= [v7 count])
  {
    double v15 = *MEMORY[0x1E4F1DB20];
  }
  else if ([a1[20] containsIndex:v6])
  {
    uint64_t v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(a3, "section"));
    double v10 = (double *)v9;
    if (v9) {
      int v11 = *(void **)(v9 + 8);
    }
    else {
      int v11 = 0;
    }
    id v12 = v11;
    objc_msgSend(v12, "unpinnedSectionSupplementaryFrameForIndex:", objc_msgSend(a3, "item"));
    uint64_t v13 = (CGFloat *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[_UICollectionCompositionalLayoutSolver _globalFrameForSectionAuxiliaryFrame:bookmark:container:](v13[8], v13[9], v13[10], v13[11], (uint64_t)_UICollectionCompositionalLayoutSolver, v10, a1[6]);
      double v15 = v14;
    }
    else
    {
      double v15 = *MEMORY[0x1E4F1DB20];
    }
  }
  else
  {
    CGFloat v17 = -[_UICollectionCompositionalLayoutSolver layoutAttributesForSupplementaryViewOfKind:withIndexPath:](a1, a2, a3);
    CGFloat v18 = v17;
    if (v17)
    {
      [v17 frame];
      double v15 = v19;
    }
    else
    {
      double v15 = *MEMORY[0x1E4F1DB20];
    }
  }
  return v15;
}

- (double)preUpdateFrameForDecorationViewOfKind:(void *)a3 withInitialIndexPath:
{
  if (!a1) {
    return 0.0;
  }
  id v6 = a1[32];
  if (v6)
  {
    id v7 = v6;
    id v8 = a1[31];
    if (v8)
    {
      id v9 = a1[30];

      if (v9)
      {
        uint64_t v10 = [a2 length];
        if (a3)
        {
          if (v10 && (unint64_t)[a3 length] > 1)
          {
            unint64_t v11 = [a3 section];
            unint64_t v12 = [a3 item];
            id v13 = a1[30];
            uint64_t v14 = [v13 objectAtIndexedSubscript:v11];
            double v15 = (void *)v14;
            if (v14) {
              double v16 = *(void **)(v14 + 16);
            }
            else {
              double v16 = 0;
            }
            id v17 = v16;
            unint64_t v18 = [v13 count];
            if ((v11 & 0x8000000000000000) != 0 || v11 >= v18)
            {
              double v26 = *MEMORY[0x1E4F1DB20];
LABEL_29:

              return v26;
            }
            double v19 = [v17 _auxillaryItemForElementKind:a2 category:2];
            if (!v19)
            {
              if (v15) {
                id v28 = (void *)v15[1];
              }
              else {
                id v28 = 0;
              }
              id v29 = v28;
              uint64_t v30 = [v29 supplementaryFrameWithKind:a2 index:v12];
              if (v30)
              {
                long long v31 = (CGFloat *)v30;
                if (*(void *)(v30 + 32) != 3)
                {
                  long long v34 = [MEMORY[0x1E4F28B00] currentHandler];
                  [v34 handleFailureInMethod:sel_preUpdateFrameForDecorationViewOfKind_withInitialIndexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 869, @"Invalid parameter not satisfying: %@", @"result.isDecoration" object file lineNumber description];
                }
                +[_UICollectionCompositionalLayoutSolver _globalFrameForSolutionFrame:bookmark:container:](v31[8], v31[9], v31[10], v31[11], (uint64_t)_UICollectionCompositionalLayoutSolver, (double *)v15, a1[31]);
                double v26 = v32;
              }
              else
              {

                double v26 = *MEMORY[0x1E4F1DB20];
              }
              goto LABEL_28;
            }
            double v20 = [v17 decorationItems];
            unint64_t v21 = [v20 count];

            if (v12 >= v21)
            {
              long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
              [v33 handleFailureInMethod:sel_preUpdateFrameForDecorationViewOfKind_withInitialIndexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 857, @"Invalid parameter not satisfying: %@", @"itemIndex < section.decorationItems.count" object file lineNumber description];

              if (v15) {
                goto LABEL_15;
              }
            }
            else if (v15)
            {
LABEL_15:
              double v22 = (void *)v15[2];
LABEL_16:
              id v23 = [v22 decorationItems];
              long long v24 = [v23 objectAtIndexedSubscript:v12];

              uint64_t v25 = [v24 elementKind];
              double v26 = +[_UICollectionCompositionalLayoutSolver _globalFrameForBackgroundDecoration:forSectionWithBookmark:]((uint64_t)_UICollectionCompositionalLayoutSolver, (id *)v15);

LABEL_28:
              goto LABEL_29;
            }
            double v22 = 0;
            goto LABEL_16;
          }
        }
      }
    }
    else
    {
    }
  }
  return *MEMORY[0x1E4F1DB20];
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(double)a3 withTargetPosition:(double)a4
{
  if (a1 && (unint64_t)[a2 length] >= 2)
  {
    unint64_t v8 = [a2 section];
    if (v8 >= [*(id *)(a1 + 184) count])
    {
      id v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, a1, @"_UICollectionCompositionalLayoutSolver.m", 975, @"Invalid parameter not satisfying: %@", @"sectionIndex < self.solutionBookmarks.count" object file lineNumber description];
    }
    id v9 = [*(id *)(a1 + 184) objectAtIndexedSubscript:v8];
    uint64_t v10 = v9;
    if (v9) {
      id v9 = (void *)v9[2];
    }
    if ([v9 shouldRestrictOrthogonalAxisDuringInteractiveMovement])
    {
      uint64_t v11 = *(void *)(a1 + 64);
      double v12 = _UIPointValueForAxis(v11, a3, a4);
      id v13 = -[_UICollectionCompositionalLayoutSolver layoutAttributesForItemAtIndexPath:](a1, (CGFloat *)a2);
      [v13 center];
      objc_msgSend(v13, "setCenter:", _UISetPointValueForAxis(v11, v14, v15, v12));
      [v13 setZIndex:0x7FFFFFFFFFFFFFFFLL];
    }
    else
    {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (void)enumeratePinnedSupplementaryItems:(uint64_t)a1
{
  if (a1 && -[_UICollectionCompositionalLayoutSolver hasPinnedSupplementaryItems](a1))
  {
    id v4 = *(void **)(a1 + 160);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke;
    v8[3] = &unk_1E52E0DA8;
    v8[4] = a1;
    v8[5] = a2;
    [v4 enumerateIndexesUsingBlock:v8];
    id v5 = *(void **)(a1 + 272);
    if (v5) {
      id v5 = (void *)v5[5];
    }
    id v6 = v5;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __76___UICollectionCompositionalLayoutSolver_enumeratePinnedSupplementaryItems___block_invoke_3;
    v7[3] = &unk_1E52E0DA8;
    v7[4] = a1;
    v7[5] = a2;
    [v6 enumerateIndexesUsingBlock:v7];
  }
}

- (_UICollectionCompositionalLayoutSolverResolveResult)resolveForUpdatingSectionDefinitionsWithContainer:(id *)a1
{
  if (a1)
  {
    if (!a2)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_resolveForUpdatingSectionDefinitionsWithContainer_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1297, @"Invalid parameter not satisfying: %@", @"container != nil" object file lineNumber description];
    }
    id v4 = objc_alloc_init(_UICollectionCompositionalLayoutSolverResolveResult);
    objc_storeStrong(a1 + 6, a2);
    -[_UICollectionCompositionalLayoutSolver _solveRetainingPreferredSizes:](a1, 1);
    [(_UICollectionCompositionalLayoutSolverResolveResult *)v4 setSectionsWereRequeried:1];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (_UICollectionCompositionalLayoutSolverResolveResult)resolveForMarginsChange:(uint64_t)a1
{
  if (a1)
  {
    if (!a2)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_resolveForMarginsChange_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1308, @"Invalid parameter not satisfying: %@", @"container" object file lineNumber description];
    }
    id v4 = objc_alloc_init(_UICollectionCompositionalLayoutSolverResolveResult);
    objc_storeStrong((id *)(a1 + 48), a2);
    -[_UICollectionCompositionalLayoutSolver _recomputeSolutionBookmarksAndContentSize](a1);
    -[_UICollectionLayoutAuxillaryItemSolver resolve](*(void *)(a1 + 272));
    -[_UICollectionCompositionalLayoutSolver _updateBookmarkOffsetsForGlobalSupplementariesIfNeeded](a1);
    -[_UICollectionCompositionalLayoutSolver _invalidateAllAttributes](a1);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)resolveForScrollViewLayoutAdjustmentsChange:(id *)a1
{
  if (a1)
  {
    uint64_t v3 = (uint64_t)a1;
    objc_storeStrong(a1 + 6, a2);
    -[_UICollectionCompositionalLayoutSolver _resolveOptionallyQueryingForSectionDefinitions:retainPreferredSizing:](v3, 1, 1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = vars8;
  }
  return a1;
}

- (uint64_t)_supportsSwipeActionsForIndexPath:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    unint64_t v3 = [a2 section];
    if (v3 >= [*(id *)(v2 + 184) count])
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v8 = [NSNumber numberWithInteger:v3];
      [v7 handleFailureInMethod:sel__supportsSwipeActionsForIndexPath_, v2, @"_UICollectionCompositionalLayoutSolver.m", 1813, @"Invalid section %@.", v8 object file lineNumber description];
    }
    id v4 = [*(id *)(v2 + 184) objectAtIndexedSubscript:v3];
    id v5 = v4;
    if (v4) {
      id v4 = (void *)v4[2];
    }
    uint64_t v6 = [v4 _wantsSwipeActions];

    return v6;
  }
  return result;
}

- (id)_leadingSwipeActionsConfigurationForIndexPath:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = [a2 section];
    if (v4 >= [*(id *)(a1 + 184) count])
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = [NSNumber numberWithInteger:v4];
      [v9 handleFailureInMethod:sel__leadingSwipeActionsConfigurationForIndexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1820, @"Invalid section %@.", v10 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 184) objectAtIndexedSubscript:v4];
    uint64_t v6 = v5;
    if (v5) {
      id v5 = (void *)v5[2];
    }
    id v7 = [v5 _leadingSwipeActionsConfigurationForIndexPath:a2];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)_trailingSwipeActionsConfigurationForIndexPath:(uint64_t)a1
{
  if (a1)
  {
    unint64_t v4 = [a2 section];
    if (v4 >= [*(id *)(a1 + 184) count])
    {
      id v9 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v10 = [NSNumber numberWithInteger:v4];
      [v9 handleFailureInMethod:sel__trailingSwipeActionsConfigurationForIndexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1827, @"Invalid section %@.", v10 object file lineNumber description];
    }
    id v5 = [*(id *)(a1 + 184) objectAtIndexedSubscript:v4];
    uint64_t v6 = v5;
    if (v5) {
      id v5 = (void *)v5[2];
    }
    id v7 = [v5 _trailingSwipeActionsConfigurationForIndexPath:a2];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)_updateStyleForSwipeActionsConfiguration:(void *)a3 indexPath:
{
  if (a1)
  {
    unint64_t v5 = [a3 section];
    if (v5 >= [*(id *)(a1 + 184) count])
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      unint64_t v8 = [NSNumber numberWithInteger:v5];
      [v7 handleFailureInMethod:sel__updateStyleForSwipeActionsConfiguration_indexPath_, a1, @"_UICollectionCompositionalLayoutSolver.m", 1834, @"Invalid section %@.", v8 object file lineNumber description];
    }
    uint64_t v6 = [*(id *)(a1 + 184) objectAtIndexedSubscript:v5];
    id v9 = v6;
    if (v6) {
      uint64_t v6 = (void *)v6[2];
    }
    [v6 _updateStyleForSwipeActionsConfiguration:a2];
  }
}

- (void)_willBeginSwiping
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v1 = *(id *)(a1 + 184);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v10;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v10 != v4) {
            objc_enumerationMutation(v1);
          }
          uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * v5);
          if (v6) {
            id v7 = *(void **)(v6 + 16);
          }
          else {
            id v7 = 0;
          }
          objc_msgSend(v7, "_willBeginSwiping", (void)v9);
          ++v5;
        }
        while (v3 != v5);
        uint64_t v8 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v3 = v8;
      }
      while (v8);
    }
  }
}

- (void)_didEndSwiping
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v1 = *(id *)(a1 + 184);
    uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v10;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v10 != v4) {
            objc_enumerationMutation(v1);
          }
          uint64_t v6 = *(void *)(*((void *)&v9 + 1) + 8 * v5);
          if (v6) {
            id v7 = *(void **)(v6 + 16);
          }
          else {
            id v7 = 0;
          }
          objc_msgSend(v7, "_didEndSwiping", (void)v9);
          ++v5;
        }
        while (v3 != v5);
        uint64_t v8 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
        uint64_t v3 = v8;
      }
      while (v8);
    }
  }
}

- (void)setOrthogonalOffset:(double)a3 forSection:(double)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (a1 && [*(id *)(a1 + 184) count] > a2)
  {
    uint64_t v8 = [*(id *)(a1 + 184) objectAtIndexedSubscript:a2];
    long long v9 = (void *)v8;
    if (v8) {
      long long v10 = *(void **)(v8 + 16);
    }
    else {
      long long v10 = 0;
    }
    id v11 = v10;
    if ([v11 scrollsOrthogonally])
    {
      if (v9) {
        long long v12 = (void *)v9[1];
      }
      else {
        long long v12 = 0;
      }
      id v13 = v12;
      objc_msgSend(v13, "setOrthogonalOffset:", a3, a4);
      -[_UICollectionSectionSolutionBookmark memoizedDescriptor]((uint64_t)v9);
      uint64_t v14 = (double *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v14[12] = a3;
        v14[13] = a4;
      }

      [v13 orthogonalScrollingPrefetchingUnitVector];
      uint64_t v16 = v15;
      uint64_t v18 = v17;

      double v19 = -[_UICollectionSectionSolutionBookmark memoizedDescriptor]((uint64_t)v9);
      if (v19)
      {
        v19[10] = v16;
        v19[11] = v18;
      }
    }
    if (*(void *)(a1 + 136))
    {
      double v20 = objc_alloc_init(UICollectionViewLayoutInvalidationContext);
      [(UICollectionViewLayoutInvalidationContext *)v20 _setIntent:6];
      if ([v11 _hasVisibleItemsHandler])
      {
        -[_UICollectionSectionSolutionBookmark memoizedDescriptor]((uint64_t)v9);
        unint64_t v21 = (double *)objc_claimAutoreleasedReturnValue();
        id v35 = v11;
        CGRect v36 = v9;
        if (v21)
        {
          double v23 = v21[14];
          double v22 = v21[15];
          double v24 = v21[16];
          double v25 = v21[17];
        }
        else
        {
          double v22 = 0.0;
          double v24 = 0.0;
          double v25 = 0.0;
          double v23 = 0.0;
        }

        double v26 = -[_UICollectionCompositionalLayoutSolver mutatedVisibleItemsForElementsForVisibleBounds:](a1, v23, v22, v24, v25);
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v44 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v38;
          do
          {
            for (uint64_t i = 0; i != v28; ++i)
            {
              if (*(void *)v38 != v29) {
                objc_enumerationMutation(v26);
              }
              long long v31 = *(void **)(*((void *)&v37 + 1) + 8 * i);
              if (objc_msgSend(v31, "representedElementCategory", v35, v36))
              {
                if ([v31 representedElementCategory] == 1)
                {
                  double v32 = [v31 representedElementKind];
                  long long v33 = [v31 indexPath];
                  uint64_t v42 = v33;
                  long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
                  [(UICollectionViewLayoutInvalidationContext *)v20 invalidateSupplementaryElementsOfKind:v32 atIndexPaths:v34];
                }
                else
                {
                  if ([v31 representedElementCategory] != 2) {
                    continue;
                  }
                  double v32 = [v31 representedElementKind];
                  long long v33 = [v31 indexPath];
                  uint64_t v41 = v33;
                  long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
                  [(UICollectionViewLayoutInvalidationContext *)v20 invalidateDecorationElementsOfKind:v32 atIndexPaths:v34];
                }
              }
              else
              {
                double v32 = [v31 indexPath];
                uint64_t v43 = v32;
                long long v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
                [(UICollectionViewLayoutInvalidationContext *)v20 invalidateItemsAtIndexPaths:v33];
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v37 objects:v44 count:16];
          }
          while (v28);
        }

        id v11 = v35;
        long long v9 = v36;
      }
      (*(void (**)(void))(*(void *)(a1 + 136) + 16))();
    }
  }
}

- (BOOL)elementShouldAppearAboveOrthogonalScrollingContainer:(uint64_t)a1
{
  BOOL v2 = 0;
  if (a1 && a2)
  {
    uint64_t v5 = [(id)a2 indexPath];
    uint64_t v6 = v5;
    if (!v5 || !*(unsigned char *)(a1 + 13) || (*(_WORD *)(a2 + 288) & 3) != 0) {
      goto LABEL_6;
    }
    if ([v5 length] == 1)
    {
      if ([(id)a2 zIndex] >= 1)
      {
        uint64_t v8 = [v6 indexAtPosition:0];
        long long v9 = (id *)*(id *)(a1 + 272);
        id v10 = *(id *)(a2 + 8);
        -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](v9, v10, v8);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v2 = v11 != 0;
LABEL_12:

        goto LABEL_7;
      }
    }
    else if ([v6 length] == 2 {
           && dyld_program_sdk_at_least()
    }
           && [(id)a2 zIndex] >= 1)
    {
      unint64_t v12 = [v6 section];
      id v11 = *(id *)(a1 + 184);
      if ([v11 count] <= v12)
      {
        BOOL v2 = 0;
      }
      else
      {
        uint64_t v13 = [v11 objectAtIndexedSubscript:v12];
        uint64_t v14 = (void *)v13;
        if (v13) {
          uint64_t v15 = *(void **)(v13 + 8);
        }
        else {
          uint64_t v15 = 0;
        }
        id v16 = v15;
        uint64_t v17 = [v6 item];
        id v18 = *(id *)(a2 + 8);
        double v19 = [v16 sectionSupplementaryFrameWithKind:v18 index:v17];

        BOOL v2 = v19 != 0;
      }
      goto LABEL_12;
    }
LABEL_6:
    BOOL v2 = 0;
LABEL_7:
  }
  return v2;
}

- (CGRect)auxillaryHostPinningRect
{
  double y = 0.0;
  if (self)
  {
    sectionGeometryTranslator = self->_sectionGeometryTranslator;
    double width = 0.0;
    double height = 0.0;
    double x = 0.0;
    if (sectionGeometryTranslator)
    {
      double x = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.x;
      double y = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.origin.y;
      double width = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.width;
      double height = sectionGeometryTranslator->_contentFrameIncludingAuxiliaries.size.height;
    }
  }
  else
  {
    double width = 0.0;
    double height = 0.0;
    double x = 0.0;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly
{
  return 0;
}

- (CGRect)_dynamicReferenceBounds
{
  double v2 = -[_UICollectionCompositionalLayoutSolver contentSize]((uint64_t)self);
  double v4 = v3;
  double v5 = 0.0;
  double v6 = 0.0;
  result.size.double height = v4;
  result.size.double width = v2;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

@end