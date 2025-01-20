@interface UICollectionViewCompositionalLayout
+ (UICollectionViewCompositionalLayout)layoutWithListConfiguration:(UICollectionLayoutListConfiguration *)configuration;
- (BOOL)_adjustCollectionViewContentInsetBehaviorForLayoutAxisIfNeeded:(unint64_t)a3 container:(id)a4;
- (BOOL)_allowsItemInteractionsToBegin;
- (BOOL)_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionInSection:(int64_t)a3;
- (BOOL)_disallowsFadeCellsForBoundsChange;
- (BOOL)_estimatesSizes;
- (BOOL)_hasOrthogonalScrollingSections;
- (BOOL)_invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:(CGRect)a3 preparingLayout:(BOOL)a4;
- (BOOL)_orthogonalScrollingElementShouldAppearAboveForAttributes:(id)a3;
- (BOOL)_orthogonalScrollingElementShouldAppearBelowForAttributes:(id)a3;
- (BOOL)_overridesSafeAreaPropagationToDescendants;
- (BOOL)_preparedForBoundsChanges;
- (BOOL)_shouldAddElementToSectionContainer:(id)a3;
- (BOOL)_shouldAdjustTargetContentOffsetToValidateContentExtents;
- (BOOL)_shouldInvalidateLayoutForDataSourceChange;
- (BOOL)_shouldInvalidateLayoutForOldInsets:(UIEdgeInsets)a3 newInsets:(UIEdgeInsets)a4;
- (BOOL)_shouldInvalidateLayoutForUpdatedLayoutMargins:(UIEdgeInsets)a3 fromOldMargins:(UIEdgeInsets)a4;
- (BOOL)_shouldInvalidateLayoutForUpdatedSafeAreaInsets:(UIEdgeInsets)a3 fromOldInsets:(UIEdgeInsets)a4;
- (BOOL)_shouldOrthogonalScrollingSectionDecorationScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4;
- (BOOL)_shouldOrthogonalScrollingSectionSupplementaryScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4;
- (BOOL)_shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:(BOOL)a3;
- (BOOL)_supportsPrefetchingWithEstimatedSizes;
- (BOOL)_supportsSwipeActionsForIndexPath:(id)a3;
- (BOOL)_viewBoundsPermitsLayout:(CGRect)a3;
- (BOOL)_wantsAnimationsForOffscreenAuxillaries;
- (BOOL)_wantsBandSelectionVisualsInSection:(int64_t)a3;
- (BOOL)_wantsCustomSectionContainers;
- (BOOL)_wantsInvalidateLayoutForPreferredLayoutAttributes;
- (BOOL)_wantsUntrackedAnimationCleanupForAuxillaryItems;
- (BOOL)_wantsUpdateVisibleCellsPassNotifications;
- (BOOL)canBeEdited;
- (BOOL)isEditing;
- (BOOL)layoutRTL;
- (BOOL)roundsToScreenScale;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (CGPoint)_offsetForOrthogonalScrollingSection:(int64_t)a3;
- (CGPoint)_targetPositionForInteractiveMovementOfItemAtIndexPath:(id)a3 withProposedTargetPosition:(CGPoint)a4;
- (CGRect)_contentFrameForSection:(int64_t)a3;
- (CGRect)_frameForScrollingToFirstElementInSectionAtIndex:(int64_t)a3;
- (CGRect)_layoutFrameForSection:(int64_t)a3;
- (CGRect)_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:(id)a3 frame:(CGRect)a4;
- (CGRect)contentFrame;
- (CGRect)memoizedPreviousSolvedCollectionViewBounds;
- (CGSize)collectionViewContentSize;
- (NSCollectionLayoutSection)layoutSectionTemplate;
- (NSDirectionalEdgeInsets)_supplementaryViewInsetsForScrollingToItemAtIndexPath:(id)a3;
- (UICollectionViewCompositionalLayout)initWithLayoutSection:(id)a3;
- (UICollectionViewCompositionalLayout)initWithLayoutSection:(id)a3 scrollDirection:(int64_t)a4;
- (UICollectionViewCompositionalLayout)initWithSection:(NSCollectionLayoutSection *)section;
- (UICollectionViewCompositionalLayout)initWithSection:(NSCollectionLayoutSection *)section configuration:(UICollectionViewCompositionalLayoutConfiguration *)configuration;
- (UICollectionViewCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5;
- (UICollectionViewCompositionalLayout)initWithSectionProvider:(UICollectionViewCompositionalLayoutSectionProvider)sectionProvider;
- (UICollectionViewCompositionalLayout)initWithSectionProvider:(UICollectionViewCompositionalLayoutSectionProvider)sectionProvider configuration:(UICollectionViewCompositionalLayoutConfiguration *)configuration;
- (UICollectionViewCompositionalLayoutConfiguration)configuration;
- (UIEdgeInsets)memoizedDynamicAnimatorWorldAdjustingInsets;
- (UIEdgeInsets)memoizedPreviousLayoutMargins;
- (_UICollectionCompositionalLayoutSolver)solver;
- (_UICollectionCompositionalLayoutSolverResolveResult)currentResolveResult;
- (_UICollectionCompositionalLayoutSolverUpdate)currentUpdate;
- (_UIDataSourceSnapshotter)dataSourceSnapshotter;
- (_UIUpdateVisibleCellsContext)updateVisibleCellsContext;
- (double)_alignedContentMarginGivenMargin:(double)a3;
- (double)_interactionStateModule:(id)a3 spacingAfterLayoutSection:(int64_t)a4;
- (id)_boundsChangeResolve;
- (id)_containerFromCollectionView;
- (id)_contentInsetsEnvironmentFromCollectionViewForInsetsReference:(int64_t)a3;
- (id)_customContainerSectionIndexes;
- (id)_dataSourceSnapshotter;
- (id)_extendedAttributesQueryIncludingOrthogonalScrollingRegions:(CGRect)a3;
- (id)_interactionStateModule:(id)a3 layoutSectionForIndex:(int64_t)a4;
- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3;
- (id)_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:(CGRect)a3;
- (id)_layoutAttributesForIndelibleElements;
- (id)_layoutSectionForSectionIndex:(unint64_t)a3;
- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3;
- (id)_marginsChangeResolve;
- (id)_orthogonalScrollingSections;
- (id)_preferredAttributesResolveWithInvalidatedPreferredAttributes:(id)a3 layoutOffset:(CGPoint)a4 visibleRect:(CGRect)a5;
- (id)_propertyAnimatorForCollectionViewUpdates:(id)a3 withCustomAnimator:(id)a4;
- (id)_scrollViewAdjustmentsChangeResolve;
- (id)_sectionDefinitionsUpdateResolve;
- (id)_sectionDescriptorForSectionIndex:(int64_t)a3;
- (id)_sectionsDescription;
- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3;
- (id)_updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds;
- (id)_updateResolve;
- (id)boundarySupplementaryItems;
- (id)dynamicsConfigurationHandler;
- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)indexPathsToDeleteForDecorationViewOfKind:(id)a3;
- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3;
- (id)indexPathsToInsertForDecorationViewOfKind:(id)a3;
- (id)indexPathsToInsertForSupplementaryViewOfKind:(id)a3;
- (id)initialLayoutAttributesForAppearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutSectionProvider;
- (int64_t)_anchorForAuxiliaryElementOfKind:(id)a3;
- (int64_t)_interactionStateModule:(id)a3 swipeActionsStyleForSwipedItemAtIndexPath:(id)a4;
- (int64_t)developmentLayoutDirection;
- (int64_t)scrollDirection;
- (unint64_t)_edgesForSafeAreaPropagationToDescendants;
- (unint64_t)_layoutAxis;
- (unint64_t)_orthogonalScrollingAxis;
- (unint64_t)edgesForSafeAreaPropagation;
- (void)_cellBackgroundOrBottomSeparatorChangedAtIndexPath:(id)a3 separatorOnly:(BOOL)a4;
- (void)_collectionViewWillPerformPendingLayoutBeforeUpdate;
- (void)_computeAndUpdateAdjustedContentFrame;
- (void)_createSwipeActionsModuleIfNeeded;
- (void)_didEndSwiping;
- (void)_didPerformUpdateVisibleCellsPassWithLayoutOffset:(CGPoint)a3;
- (void)_finalizeCollectionViewUpdate:(id)a3;
- (void)_fullResolve;
- (void)_handleEndInteractiveReorderingWithContext:(id)a3;
- (void)_handlePreferredSizingDataInvalidation:(id)a3;
- (void)_handleSwipeActionsInvalidationWithContext:(id)a3;
- (void)_performDeferredResolveIfNecessary;
- (void)_postProcessPreferredAttributes:(id)a3 forView:(id)a4;
- (void)_prepareForCollectionViewUpdates:(id)a3 withDataSourceTranslator:(id)a4;
- (void)_prepareForPreferredAttributesQueryForView:(id)a3 withLayoutAttributes:(id)a4;
- (void)_prepareForTransitionToLayout:(id)a3;
- (void)_prepareLayout;
- (void)_queueDeferredResolveForInvalidationWithContext:(id)a3;
- (void)_resolveImmediatelyForInvalidationWithContext:(id)a3;
- (void)_scrollViewLayoutAdjustmentsChanged;
- (void)_setCollectionView:(id)a3;
- (void)_setOffset:(CGPoint)a3 forOrthogonalScrollingSection:(int64_t)a4;
- (void)_solveForPinnedSupplementaryItemsIfNeededWithContext:(id)a3;
- (void)_transformCellLayoutAttributes:(id)a3;
- (void)_transformDecorationLayoutAttributes:(id)a3;
- (void)_transformSupplementaryLayoutAttributes:(id)a3;
- (void)_updateCollectionViewBackgroundColor;
- (void)_updateStyleForSwipeActionsConfiguration:(id)a3 indexPath:(id)a4;
- (void)_willBeginSwiping;
- (void)_willPerformUpdateVisibleCellsPass;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setBoundarySupplementaryItems:(id)a3;
- (void)setCollectionViewTraitChangeRegistration:(uint64_t)a1;
- (void)setConfiguration:(UICollectionViewCompositionalLayoutConfiguration *)configuration;
- (void)setContentFrame:(CGRect)a3;
- (void)setCurrentResolveResult:(id)a3;
- (void)setCurrentUpdate:(id)a3;
- (void)setDataSourceSnapshotter:(id)a3;
- (void)setDynamicsConfigurationHandler:(id)a3;
- (void)setEdgesForSafeAreaPropagation:(unint64_t)a3;
- (void)setEditing:(BOOL)a3;
- (void)setLayoutRTL:(BOOL)a3;
- (void)setLayoutSectionProvider:(id)a3;
- (void)setLayoutSectionTemplate:(id)a3;
- (void)setMemoizedDynamicAnimatorWorldAdjustingInsets:(UIEdgeInsets)a3;
- (void)setMemoizedPreviousLayoutMargins:(UIEdgeInsets)a3;
- (void)setMemoizedPreviousSolvedCollectionViewBounds:(CGRect)a3;
- (void)setRoundsToScreenScale:(BOOL)a3;
- (void)setSolver:(id)a3;
- (void)setUpdateVisibleCellsContext:(id)a3;
@end

@implementation UICollectionViewCompositionalLayout

- (BOOL)_shouldAddElementToSectionContainer:(id)a3
{
  uint64_t v4 = [(UICollectionViewCompositionalLayout *)self solver];
  v5 = (void *)v4;
  if (v4) {
    int v6 = -[_UICollectionCompositionalLayoutSolver shouldEmplaceElementOutsideSectionContainer:](v4, a3) ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_transformDecorationLayoutAttributes:(id)a3
{
  id v7 = [a3 indexPath];
  if ((unint64_t)[v7 length] >= 2)
  {
    v5 = -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", [v7 section]);
    int v6 = [v5 _callback];
    [v6 _enrichLayoutAttributes:a3 interactionState:self->_interactionStateModule];
  }
  [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule transformDecorationLayoutAttributes:a3 isDisappearing:0];
}

- (void)_transformCellLayoutAttributes:(id)a3
{
  v5 = [a3 indexPath];
  -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", [v5 section]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    int v6 = [v7 _callback];
    [v6 _enrichLayoutAttributes:a3 interactionState:self->_interactionStateModule];
  }
  [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule transformCellLayoutAttributes:a3 isDisappearing:0];
}

- (BOOL)_hasOrthogonalScrollingSections
{
  v2 = [(UICollectionViewCompositionalLayout *)self solver];
  if (v2) {
    BOOL v3 = v2[13] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (CGRect)_orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:(id)a3 frame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v9 = [(UICollectionViewCompositionalLayout *)self solver];
  double v10 = -[_UICollectionCompositionalLayoutSolver orthogonalFrameWithOffsetElidedForItemWithLayoutAttributes:frame:]((uint64_t)v9, (uint64_t)a3, x, y, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (id)_layoutSectionForSectionIndex:(unint64_t)a3
{
  uint64_t v4 = [(UICollectionViewCompositionalLayout *)self solver];
  v5 = -[_UICollectionCompositionalLayoutSolver _existingSectionDefinitionForSectionIndex:]((uint64_t)v4, a3);

  return v5;
}

- (_UICollectionCompositionalLayoutSolver)solver
{
  return self->_solver;
}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_6(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _transformCellLayoutAttributes:a2];
}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_7(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _transformDecorationLayoutAttributes:a2];
}

- (id)_orthogonalScrollingSections
{
  uint64_t v2 = [(UICollectionViewCompositionalLayout *)self solver];
  BOOL v3 = (void *)v2;
  if (v2) {
    uint64_t v4 = *(void **)(v2 + 88);
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  uint64_t v5 = [(UICollectionViewCompositionalLayout *)self currentUpdate];
  int v6 = (void *)v5;
  if (v5) {
    id v7 = *(void **)(v5 + 16);
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  if (v8 && _CompositionalLayoutShouldOverrideInitialAttributesDuringUpdates())
  {
    v9 = [v8 initialIndexPathForFinalIndexPath:a3];
    if (v9)
    {
      double v10 = [(UICollectionViewCompositionalLayout *)self solver];
      double v11 = -[_UICollectionCompositionalLayoutSolver preUpdateFrameForItemAtInitialIndexPath:]((uint64_t)v10, v9);
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      v23.origin.CGFloat x = v11;
      v23.origin.CGFloat y = v13;
      v23.size.CGFloat width = v15;
      v23.size.CGFloat height = v17;
      if (!CGRectIsNull(v23))
      {
        double v18 = [(UICollectionViewCompositionalLayout *)self layoutAttributesForItemAtIndexPath:a3];
        double v19 = (void *)[v18 copy];

        if (v19)
        {
          objc_msgSend(v19, "setFrame:", v11, v13, v15, v17);

          goto LABEL_11;
        }
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)UICollectionViewCompositionalLayout;
  double v19 = [(UICollectionViewLayout *)&v21 initialLayoutAttributesForAppearingItemAtIndexPath:a3];
LABEL_11:

  return v19;
}

- (_UICollectionCompositionalLayoutSolverUpdate)currentUpdate
{
  return self->_currentUpdate;
}

- (int64_t)developmentLayoutDirection
{
  if (dyld_program_sdk_at_least()) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewCompositionalLayout;
  return [(UICollectionViewLayout *)&v4 developmentLayoutDirection];
}

- (void)_prepareForPreferredAttributesQueryForView:(id)a3 withLayoutAttributes:(id)a4
{
  if ([(UICollectionViewCompositionalLayout *)self _estimatesSizes])
  {
    id v7 = [(UICollectionViewCompositionalLayout *)self solver];
    -[_UICollectionCompositionalLayoutSolver prepareForPreferredAttributesQueryForView:withLayoutAttributes:]((uint64_t)v7, a3, a4);

    id v8 = [a4 indexPath];
    if ([v8 item] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", [v8 section]);
      interactionStateModule = self->_interactionStateModule;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __103__UICollectionViewCompositionalLayout__prepareForPreferredAttributesQueryForView_withLayoutAttributes___block_invoke;
      v12[3] = &unk_1E52DCB30;
      id v13 = v9;
      id v14 = a4;
      double v15 = self;
      id v11 = v9;
      -[_UICollectionViewLayoutInteractionStateModule performPreferredAttributesProcessingBlock:withLayoutAttributes:forView:]((uint64_t)interactionStateModule, v12, a4, a3);
    }
  }
}

- (BOOL)_estimatesSizes
{
  uint64_t v2 = [(UICollectionViewCompositionalLayout *)self solver];
  if (v2) {
    BOOL v3 = v2[12] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_postProcessPreferredAttributes:(id)a3 forView:(id)a4
{
  id v7 = [a3 indexPath];
  if ([v7 item] != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [a3 indexPath];
    v9 = -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", [v8 section]);

    interactionStateModule = self->_interactionStateModule;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __79__UICollectionViewCompositionalLayout__postProcessPreferredAttributes_forView___block_invoke;
    v12[3] = &unk_1E52DCB30;
    id v13 = v9;
    id v14 = a3;
    double v15 = self;
    id v11 = v9;
    -[_UICollectionViewLayoutInteractionStateModule performPreferredAttributesProcessingBlock:withLayoutAttributes:forView:]((uint64_t)interactionStateModule, v12, a3, a4);
  }
}

void __79__UICollectionViewCompositionalLayout__postProcessPreferredAttributes_forView___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _callback];
  [v2 _transformPreferredLayoutAttributes:*(void *)(a1 + 40) interactionState:*(void *)(*(void *)(a1 + 48) + 280)];
}

void __103__UICollectionViewCompositionalLayout__prepareForPreferredAttributesQueryForView_withLayoutAttributes___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _callback];
  [v2 _transformFittingLayoutAttributes:*(void *)(a1 + 40) interactionState:*(void *)(*(void *)(a1 + 48) + 280)];
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  if (a4)
  {
    if (a3) {
      goto LABEL_3;
    }
LABEL_18:
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"UICollectionViewCompositionalLayout.m", 1057, @"Invalid parameter not satisfying: %@", @"preferredAttributes != nil" object file lineNumber description];

    if (a4) {
      goto LABEL_4;
    }
    return 0;
  }
  double v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"UICollectionViewCompositionalLayout.m", 1056, @"Invalid parameter not satisfying: %@", @"originalAttributes != nil" object file lineNumber description];

  if (!a3) {
    goto LABEL_18;
  }
LABEL_3:
  if (a4)
  {
LABEL_4:
    __int16 v8 = *((_WORD *)a4 + 144);
    if ((v8 & 1) == 0 && (v8 & 3) != 0) {
      return 0;
    }
    double v10 = [a4 indexPath];
    if ([(UICollectionView *)self->super._collectionView _isReorderingItemAtIndexPath:v10])
    {
      goto LABEL_13;
    }
    uint64_t v11 = [(UICollectionViewLayout *)self collectionView];
    double v12 = (void *)v11;
    id v13 = v11 ? *(void **)(v11 + 3232) : 0;
    id v14 = v13;

    double v15 = [(UICollectionViewCompositionalLayout *)self solver];
    char v16 = -[_UICollectionCompositionalLayoutSolver updatePreferredSizeIfNeededForPreferredLayoutAttributes:withOriginalAttributes:debugger:]((uint64_t)v15, (uint64_t)a3, a4, (uint64_t)v14);

    if ((v16 & 1) == 0)
    {
LABEL_13:
      dyld_program_sdk_at_least();
    }
    else
    {
      -[_UIUpdateVisibleCellsContext addPreferredAttributes:]((uint64_t)self->_updateVisibleCellsContext, a3);
      if (dyld_program_sdk_at_least())
      {
        BOOL v9 = self->_updateVisibleCellsContext == 0;
LABEL_15:

        return v9;
      }
    }
    BOOL v9 = 0;
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)_wantsInvalidateLayoutForPreferredLayoutAttributes
{
  return 1;
}

- (unint64_t)_layoutAxis
{
  UICollectionViewScrollDirection v2 = [(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration scrollDirection];
  if (v2) {
    return v2 == UICollectionViewScrollDirectionHorizontal;
  }
  else {
    return 2;
  }
}

- (int64_t)_interactionStateModule:(id)a3 swipeActionsStyleForSwipedItemAtIndexPath:(id)a4
{
  return [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule swipeActionsStyleForSwipedItemAtIndexPath:a4];
}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_8(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _transformSupplementaryLayoutAttributes:a2];
}

- (void)_transformSupplementaryLayoutAttributes:(id)a3
{
  id v7 = [a3 indexPath];
  if ((unint64_t)[v7 length] >= 2)
  {
    uint64_t v5 = -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", [v7 section]);
    int v6 = [v5 _callback];
    [v6 _enrichLayoutAttributes:a3 interactionState:self->_interactionStateModule];
  }
}

- (BOOL)_overridesSafeAreaPropagationToDescendants
{
  return (*(unsigned char *)&self->_compositionalLayoutFlags >> 1) & 1;
}

- (double)_alignedContentMarginGivenMargin:(double)a3
{
  objc_super v4 = [(UICollectionViewCompositionalLayout *)self solver];
  uint64_t v5 = -[_UICollectionCompositionalLayoutSolver _existingSectionDefinitionForSectionIndex:]((uint64_t)v4, 0);

  if (v5)
  {
    [v5 _alignedContentMarginGivenMargin:a3];
    a3 = v6;
  }

  return a3;
}

- (unint64_t)_edgesForSafeAreaPropagationToDescendants
{
  return self->_edgesForSafeAreaPropagation;
}

- (void)_willPerformUpdateVisibleCellsPass
{
  if ([(UICollectionViewCompositionalLayout *)self _estimatesSizes]
    && !self->_updateVisibleCellsContext)
  {
    BOOL v3 = objc_alloc_init(_UIUpdateVisibleCellsContext);
    updateVisibleCellsContext = self->_updateVisibleCellsContext;
    self->_updateVisibleCellsContext = v3;

    uint64_t v5 = self->_updateVisibleCellsContext;
    if (v5) {
      ++v5->_visibleCellsRefCount;
    }
  }
}

- (void)_didPerformUpdateVisibleCellsPassWithLayoutOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  BOOL v6 = [(UICollectionViewCompositionalLayout *)self _estimatesSizes];
  updateVisibleCellsContext = self->_updateVisibleCellsContext;
  if (v6)
  {
    if (updateVisibleCellsContext)
    {
      --updateVisibleCellsContext->_visibleCellsRefCount;
      __int16 v8 = self->_updateVisibleCellsContext;
      if (v8)
      {
        if ([(NSMutableArray *)v8->_attributes count] && !v8->_visibleCellsRefCount)
        {
          [(UICollectionView *)self->super._collectionView _visibleBounds];
          double v10 = v9;
          double v12 = v11;
          double v14 = v13;
          double v16 = v15;
          double v17 = [(UICollectionViewCompositionalLayout *)self solver];
          double v18 = self->_updateVisibleCellsContext;
          if (v18) {
            double v18 = (_UIUpdateVisibleCellsContext *)v18->_indexPaths;
          }
          double v19 = v18;
          double v20 = -[_UICollectionCompositionalLayoutSolver itemsWithoutPreferredSizesInGroupsWithItemsAtIndexPaths:]((uint64_t)v17, v19);

          objc_super v21 = -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_updateVisibleCellsContext->super.isa);
          v22 = -[UICollectionViewCompositionalLayout _preferredAttributesResolveWithInvalidatedPreferredAttributes:layoutOffset:visibleRect:](self, "_preferredAttributesResolveWithInvalidatedPreferredAttributes:layoutOffset:visibleRect:", v21, x, y, v10, v12, v14, v16);

          if (v22) {
            objc_setProperty_nonatomic_copy(v22, v23, v20, 128);
          }
          unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICollectionLayout", _didPerformUpdateVisibleCellsPassWithLayoutOffset____s_category);
          if (*(unsigned char *)CategoryCachedImpl)
          {
            v36 = *(NSObject **)(CategoryCachedImpl + 8);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              v37 = v36;
              v38 = [(UICollectionViewLayout *)self collectionView];
              v59.double x = x;
              v59.double y = y;
              v39 = NSStringFromCGPoint(v59);
              v40 = -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_updateVisibleCellsContext->super.isa);
              v41 = [v20 valueForKey:@"_ui_shortDescription"];
              *(_DWORD *)buf = 134218754;
              v50 = v38;
              __int16 v51 = 2112;
              v52 = v39;
              __int16 v53 = 2112;
              v54 = v40;
              __int16 v55 = 2112;
              v56 = v41;
              _os_log_impl(&dword_1853B0000, v37, OS_LOG_TYPE_ERROR, "_didPerformUpdateVisibleCellsPassWithLayoutOffset: cv == %p; layoutOffset == %@; preferredSizes == %@; d"
                "ependentItems == %@",
                buf,
                0x2Au);
            }
          }
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          v25 = -[UIBarButtonItemGroup _customizationIdentifier]((id *)&self->_updateVisibleCellsContext->super.isa);
          uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v48 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v43;
            do
            {
              for (uint64_t i = 0; i != v27; ++i)
              {
                if (*(void *)v43 != v28) {
                  objc_enumerationMutation(v25);
                }
                v30 = *(_WORD **)(*((void *)&v42 + 1) + 8 * i);
                if (v30)
                {
                  __int16 v31 = v30[144];
                  if (v31)
                  {
                    v32 = [*(id *)(*((void *)&v42 + 1) + 8 * i) indexPath];
                    v47 = v32;
                    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
                    [v22 invalidateItemsAtIndexPaths:v33];
                  }
                  else
                  {
                    if ((v31 & 3) != 0) {
                      continue;
                    }
                    v32 = -[UIBarButtonItemGroup _items](*(id **)(*((void *)&v42 + 1) + 8 * i));
                    v33 = [v30 indexPath];
                    v46 = v33;
                    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
                    [v22 invalidateSupplementaryElementsOfKind:v32 atIndexPaths:v34];
                  }
                }
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v48 count:16];
            }
            while (v27);
          }

          [(UICollectionViewCompositionalLayout *)self invalidateLayoutWithContext:v22];
          [(UICollectionView *)self->super._collectionView _setNeedsVisibleCellsUpdate:1 withLayoutAttributes:1];
        }
        v35 = self->_updateVisibleCellsContext;
        if (v35)
        {
          if (v35->_visibleCellsRefCount <= 0)
          {
            self->_updateVisibleCellsContext = 0;
          }
        }
      }
    }
  }
  else
  {
    self->_updateVisibleCellsContext = 0;
  }
}

- (BOOL)_wantsUpdateVisibleCellsPassNotifications
{
  return 1;
}

uint64_t __61__UICollectionViewCompositionalLayout__dataSourceSnapshotter__block_invoke(uint64_t a1, uint64_t a2)
{
  UICollectionViewScrollDirection v2 = *(void **)(a1 + 32);
  if (a2 == -1) {
    return [v2 numberOfSections];
  }
  else {
    return [v2 numberOfItemsInSection:a2];
  }
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  kdebug_trace();
  __int16 v8 = -[_UICollectionCompositionalLayoutSolver layoutAttributesForElementsInRect:]((uint64_t)self->_solver, x, y, width, height);
  kdebug_trace();
  return v8;
}

- (void)_prepareLayout
{
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewCompositionalLayout;
  [(UICollectionViewLayout *)&v3 _prepareLayout];
}

- (void)prepareLayout
{
  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewCompositionalLayout;
  [(UICollectionViewLayout *)&v7 prepareLayout];
  if (*(unsigned char *)&self->_compositionalLayoutFlags)
  {
    objc_super v3 = [(UICollectionViewLayout *)self collectionView];
    [v3 _visibleBounds];
    BOOL v4 = [(UICollectionViewCompositionalLayout *)self _viewBoundsPermitsLayout:"_viewBoundsPermitsLayout:"];

    if (v4)
    {
      [(UICollectionViewCompositionalLayout *)self _fullResolve];
      [(UICollectionViewCompositionalLayout *)self _solveForPinnedSupplementaryItemsIfNeededWithContext:0];
      [(UICollectionViewCompositionalLayout *)self _updateCollectionViewBackgroundColor];
      *(unsigned char *)&self->_compositionalLayoutFlags &= ~1u;
    }
  }
  if (!self->_interactionStateModule)
  {
    uint64_t v5 = (_UICollectionViewLayoutInteractionStateModule *)-[_UICollectionViewLayoutInteractionStateModule initWithHost:]([_UICollectionViewLayoutInteractionStateModule alloc], self);
    interactionStateModule = self->_interactionStateModule;
    self->_interactionStateModule = v5;
  }
  [(UICollectionViewCompositionalLayout *)self _createSwipeActionsModuleIfNeeded];
}

- (void)_createSwipeActionsModuleIfNeeded
{
  if (!self->super._swipeActionsModule)
  {
    objc_super v3 = [(UICollectionViewCompositionalLayout *)self solver];
    int v4 = -[_UICollectionCompositionalLayoutSolver _wantsSwipeActions]((uint64_t)v3);

    if (v4)
    {
      uint64_t v5 = [[_UICollectionViewLayoutSwipeActionsModule alloc] initWithHost:self];
      swipeActionsModule = self->super._swipeActionsModule;
      self->super._swipeActionsModule = v5;
    }
  }
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  solver = self->_solver;
  return -[_UICollectionCompositionalLayoutSolver layoutAttributesForItemAtIndexPath:]((uint64_t)solver, (CGFloat *)a3);
}

- (void)_performDeferredResolveIfNecessary
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    unint64_t v2 = *(void *)(a1 + 296);
    if (v2)
    {
      if ((*(unsigned char *)(a1 + 288) & 8) != 0)
      {
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICollectionLayout", &_MergedGlobals_172);
        if ((*(unsigned char *)CategoryCachedImpl & 1) == 0) {
          return;
        }
        double v16 = *(id *)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = [(id)a1 collectionView];
          double v18 = (void *)v17;
          if (v2 > 7) {
            double v19 = @"unknown";
          }
          else {
            double v19 = off_1E52E0AB0[v2 - 1];
          }
          *(_DWORD *)buf = 134218242;
          uint64_t v51 = v17;
          __int16 v52 = 2112;
          __int16 v53 = v19;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "_performDeferredResolveIfNecessary: cv==%p; skipping deferred resolve (%@) until update or reload data",
            buf,
            0x16u);
        }
      }
      else
      {
        objc_super v3 = [(id)a1 collectionView];
        [v3 _visibleBounds];
        double v5 = v4;
        double v7 = v6;
        double v9 = v8;
        double v11 = v10;

        if (objc_msgSend((id)a1, "_viewBoundsPermitsLayout:", v5, v7, v9, v11))
        {
          kdebug_trace();
          *(void *)(a1 + 296) = 0;
          unint64_t v12 = __UILogGetCategoryCachedImpl("UICollectionLayout", &qword_1E8FDF4B8);
          if (*(unsigned char *)v12)
          {
            v39 = *(id *)(v12 + 8);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              uint64_t v40 = [(id)a1 collectionView];
              v41 = (void *)v40;
              if (v2 > 7) {
                long long v42 = @"unknown";
              }
              else {
                long long v42 = off_1E52E0AB0[v2 - 1];
              }
              *(_DWORD *)buf = 134218242;
              uint64_t v51 = v40;
              __int16 v52 = 2112;
              __int16 v53 = v42;
              _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_ERROR, "_performDeferredResolve: cv == %p; Performing deferred resolve %@",
                buf,
                0x16u);
            }
          }
          id v13 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
          [v13 _setIntent:15];
          switch(v2)
          {
            case 1uLL:
              goto LABEL_39;
            case 2uLL:
              uint64_t v14 = [(id)a1 _marginsChangeResolve];
              goto LABEL_36;
            case 3uLL:
              v24 = [(id)a1 solver];
              if (v24)
              {
                uint64_t v25 = v24[36];

                if (v25 < 1) {
                  goto LABEL_39;
                }
                uint64_t v26 = [(id)a1 collectionView];
                [v26 bounds];
                uint64_t v27 = objc_msgSend((id)a1, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");

                long long v45 = 0u;
                long long v46 = 0u;
                long long v43 = 0u;
                long long v44 = 0u;
                id v23 = v27;
                uint64_t v28 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
                if (!v28) {
                  goto LABEL_32;
                }
                uint64_t v29 = v28;
                uint64_t v30 = *(void *)v44;
LABEL_22:
                uint64_t v31 = 0;
                while (1)
                {
                  if (*(void *)v44 != v30) {
                    objc_enumerationMutation(v23);
                  }
                  v32 = *(void **)(*((void *)&v43 + 1) + 8 * v31);
                  if (![v32 representedElementCategory]) {
                    break;
                  }
                  if ([v32 representedElementCategory] == 1)
                  {
                    v33 = [v32 representedElementKind];
                    v34 = [v32 indexPath];
                    v47 = v34;
                    v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
                    [v13 invalidateSupplementaryElementsOfKind:v33 atIndexPaths:v35];

LABEL_29:
                  }
                  if (v29 == ++v31)
                  {
                    uint64_t v29 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
                    if (!v29)
                    {
LABEL_32:

                      goto LABEL_33;
                    }
                    goto LABEL_22;
                  }
                }
                v33 = [v32 indexPath];
                v48 = v33;
                v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
                [v13 invalidateItemsAtIndexPaths:v34];
                goto LABEL_29;
              }
              id v23 = 0;
LABEL_33:

LABEL_39:
              [(id)a1 _solveForPinnedSupplementaryItemsIfNeededWithContext:v13];
              uint64_t v37 = 0;
              double v16 = 0;
LABEL_42:
              [*(id *)(a1 + 136) processLayoutInvalidationWithContext:v13 updateConfigurations:v37];
              v38 = [(id)a1 collectionView];
              [v38 _invalidateLayoutWithContext:v13];

              kdebug_trace();
              break;
            case 4uLL:
              uint64_t v14 = [(id)a1 _scrollViewAdjustmentsChangeResolve];
              goto LABEL_36;
            case 5uLL:
              uint64_t v14 = [(id)a1 _sectionDefinitionsUpdateResolve];
              goto LABEL_36;
            case 6uLL:
              uint64_t v14 = [(id)a1 _boundsChangeResolve];
LABEL_36:
              double v16 = v14;
              if (!v14) {
                goto LABEL_39;
              }
              objc_msgSend(v13, "setContentOffsetAdjustment:", *(double *)(v14 + 48), *(double *)(v14 + 56));
              [v13 _setShouldInvalidateCollectionViewContentSize:1];
              int isa_low = LOBYTE(v16[5].isa);
              [(id)a1 _solveForPinnedSupplementaryItemsIfNeededWithContext:v13];
              if (isa_low)
              {
LABEL_41:
                [(id)a1 _updateCollectionViewBackgroundColor];
                uint64_t v37 = 1;
              }
              else
              {
                uint64_t v37 = 0;
              }
              goto LABEL_42;
            case 7uLL:
              [(id)a1 _fullResolve];
              [(id)a1 _solveForPinnedSupplementaryItemsIfNeededWithContext:v13];
              double v16 = 0;
              goto LABEL_41;
            default:
              id v23 = [MEMORY[0x1E4F28B00] currentHandler];
              objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", sel__performDeferredResolveIfNecessary, a1, @"UICollectionViewCompositionalLayout.m", 824, @"Attempting to process an invalid or unknown resolve type. Type: %ld", v2);
              goto LABEL_33;
          }
        }
        else
        {
          unint64_t v20 = __UILogGetCategoryCachedImpl("UICollectionLayout", &qword_1E8FDF4B0);
          if ((*(unsigned char *)v20 & 1) == 0) {
            return;
          }
          double v16 = *(id *)(v20 + 8);
          if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            goto LABEL_44;
          }
          objc_super v21 = [(id)a1 collectionView];
          if (v2 > 7) {
            v22 = @"unknown";
          }
          else {
            v22 = off_1E52E0AB0[v2 - 1];
          }
          v57.origin.CGFloat x = v5;
          v57.origin.CGFloat y = v7;
          v57.size.CGFloat width = v9;
          v57.size.CGFloat height = v11;
          NSStringFromCGRect(v57);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          uint64_t v51 = (uint64_t)v21;
          __int16 v52 = 2112;
          __int16 v53 = v22;
          __int16 v54 = 2112;
          id v55 = v13;
          _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "_performDeferredResolveIfNecessary: cv==%p; skipping deferred resolve (%@) because the view bounds (%@) do n"
            "ot allow for solving",
            buf,
            0x20u);
        }
      }
LABEL_44:
    }
  }
}

- (id)_boundsChangeResolve
{
  objc_super v3 = [(UICollectionViewLayout *)self collectionView];
  if (v3)
  {
    kdebug_trace();
    [v3 bounds];
    -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedCollectionViewBounds:](self, "setMemoizedPreviousSolvedCollectionViewBounds:");
    double v4 = [(UICollectionViewCompositionalLayout *)self _containerFromCollectionView];
    double v5 = [(UICollectionViewCompositionalLayout *)self solver];
    double v6 = -[_UICollectionCompositionalLayoutSolver resolveForContainerChange:]((uint64_t)v5, v4);

    [(UICollectionViewCompositionalLayout *)self _computeAndUpdateAdjustedContentFrame];
    [v3 visibleBounds];
    id v7 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
    kdebug_trace();
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (CGRect)_layoutFrameForSection:(int64_t)a3
{
  objc_super v3 = [(UICollectionViewCompositionalLayout *)self _sectionDescriptorForSectionIndex:a3];
  double v4 = (double *)MEMORY[0x1E4F1DB20];
  double v5 = (double *)(MEMORY[0x1E4F1DB20] + 24);
  double v6 = (double *)(MEMORY[0x1E4F1DB20] + 16);
  id v7 = (double *)(MEMORY[0x1E4F1DB20] + 8);
  if (v3)
  {
    double v4 = v3 + 14;
    id v7 = v3 + 15;
    double v6 = v3 + 16;
    double v5 = v3 + 17;
  }
  double v8 = *v5;
  double v9 = *v6;
  double v10 = *v7;
  double v11 = *v4;

  double v12 = v11;
  double v13 = v10;
  double v14 = v9;
  double v15 = v8;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGPoint)_offsetForOrthogonalScrollingSection:(int64_t)a3
{
  objc_super v3 = [(UICollectionViewCompositionalLayout *)self _sectionDescriptorForSectionIndex:a3];
  if (v3)
  {
    double v5 = v3[12];
    double v4 = v3[13];
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }

  double v6 = v5;
  double v7 = v4;
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (id)_sectionDescriptorForSectionIndex:(int64_t)a3
{
  double v4 = [(UICollectionViewCompositionalLayout *)self solver];
  double v5 = -[_UICollectionCompositionalLayoutSolver sectionDescriptorForSectionIndex:]((uint64_t)v4, a3);

  return v5;
}

- (void)_collectionViewWillPerformPendingLayoutBeforeUpdate
{
  v3.receiver = self;
  v3.super_class = (Class)UICollectionViewCompositionalLayout;
  [(UICollectionViewLayout *)&v3 _collectionViewWillPerformPendingLayoutBeforeUpdate];
  if ((*(unsigned char *)&self->_compositionalLayoutFlags & 1) == 0) {
    *(unsigned char *)&self->_compositionalLayoutFlags |= 8u;
  }
}

id __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    double v7 = [WeakRetained layoutSectionProvider];

    if (v7)
    {
      double v8 = [v6 collectionView];
      double v9 = [_UICollectionLayoutEnvironment alloc];
      double v10 = [v8 traitCollection];
      double v11 = [v6 dataSourceSnapshotter];
      double v12 = [v11 snapshot];
      double v13 = -[_UICollectionLayoutEnvironment initWithContainer:traitCollection:dataSourceSnapshot:sectionIndex:wantsCollapsedTopSpacing:](v9, "initWithContainer:traitCollection:dataSourceSnapshot:sectionIndex:wantsCollapsedTopSpacing:", a2, v10, v12, a3, [v8 _shouldAdjustLayoutToCollapseTopSpacing]);

      double v14 = [v6 layoutSectionProvider];
      ((void (**)(void, uint64_t, _UICollectionLayoutEnvironment *))v14)[2](v14, a3, v13);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = v6[39];
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)layoutSectionProvider
{
  return self->_layoutSectionProvider;
}

- (_UIDataSourceSnapshotter)dataSourceSnapshotter
{
  return self->_dataSourceSnapshotter;
}

void *__51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unint64_t v2 = [WeakRetained collectionView];
  if (WeakRetained != 0 && v2 != 0) {
    objc_super v3 = v2;
  }
  else {
    objc_super v3 = 0;
  }

  return v3;
}

- (BOOL)_wantsUntrackedAnimationCleanupForAuxillaryItems
{
  return 1;
}

void __75__UICollectionViewCompositionalLayout__updateCollectionViewBackgroundColor__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  double v6 = [a2 _preferredContainerBackgroundColor];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  double v8 = *(void **)(v7 + 40);
  id v9 = v6;
  id v15 = v9;
  if (!v8)
  {
    double v12 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v9;

    goto LABEL_10;
  }
  id v10 = v8;
  if (v15 == v10)
  {

    goto LABEL_10;
  }
  if (!v15)
  {

    goto LABEL_9;
  }
  char v11 = [v15 isEqual:v10];

  if ((v11 & 1) == 0)
  {
LABEL_9:
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
    double v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = 0;

    *a4 = 1;
  }
LABEL_10:
}

uint64_t __97__UICollectionViewCompositionalLayout__prepareForCollectionViewUpdates_withDataSourceTranslator___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  if (a2 == -1)
  {
    return [v2 finalSectionCount];
  }
  else
  {
    [v2 finalSectionGlobalItemRangeForSection:a2];
    return v3;
  }
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  solver = self->_solver;
  return -[_UICollectionCompositionalLayoutSolver layoutAttributesForSupplementaryViewOfKind:withIndexPath:]((void **)&solver->super.isa, a3, a4);
}

- (void)invalidateLayoutWithContext:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)&self->_compositionalLayoutFlags)
  {
    v26.receiver = self;
    v26.super_class = (Class)UICollectionViewCompositionalLayout;
    [(UICollectionViewLayout *)&v26 invalidateLayoutWithContext:a3];
  }
  else
  {
    double v5 = [(UICollectionViewLayout *)self collectionView];
    [v5 _visibleBounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    if (-[UICollectionViewCompositionalLayout _viewBoundsPermitsLayout:](self, "_viewBoundsPermitsLayout:", v7, v9, v11, v13))
    {
      kdebug_trace();
      uint64_t v14 = [a3 _intent];
      if (_UICollectionViewCompositionalLayoutShouldDeferResolvesUntilQueried())
      {
        if (([a3 invalidateEverything] & 1) == 0)
        {
          if (v14 == 3) {
            uint64_t v15 = 1;
          }
          else {
            uint64_t v15 = (*(unsigned char *)&self->_compositionalLayoutFlags >> 2) & 1;
          }
          [a3 _setInvalidateEverything:v15];
        }
        [(UICollectionViewCompositionalLayout *)self _queueDeferredResolveForInvalidationWithContext:a3];
      }
      else
      {
        [(UICollectionViewCompositionalLayout *)self _resolveImmediatelyForInvalidationWithContext:a3];
      }
      v24.receiver = self;
      v24.super_class = (Class)UICollectionViewCompositionalLayout;
      [(UICollectionViewLayout *)&v24 invalidateLayoutWithContext:a3];
      kdebug_trace();
    }
    else
    {
      unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICollectionLayout", &invalidateLayoutWithContext____s_category);
      if (*(unsigned char *)CategoryCachedImpl)
      {
        uint64_t v17 = *(NSObject **)(CategoryCachedImpl + 8);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          double v18 = v17;
          double v19 = [(UICollectionViewLayout *)self collectionView];
          unint64_t v20 = _UICollectionViewLayoutInvalidationContextIntentDescription([a3 _intent]);
          v36.origin.CGFloat x = v7;
          v36.origin.CGFloat y = v9;
          v36.size.CGFloat width = v11;
          v36.size.CGFloat height = v13;
          objc_super v21 = NSStringFromCGRect(v36);
          v22 = [(UICollectionViewLayout *)self collectionView];
          [v22 _effectiveContentInset];
          id v23 = NSStringFromUIEdgeInsets(v37);
          *(_DWORD *)buf = 134218754;
          uint64_t v28 = v19;
          __int16 v29 = 2112;
          uint64_t v30 = v20;
          __int16 v31 = 2112;
          v32 = v21;
          __int16 v33 = 2112;
          v34 = v23;
          _os_log_impl(&dword_1853B0000, v18, OS_LOG_TYPE_ERROR, "invalidateLayoutWithContext: cv==%p; intent == %@; visibleBounds == %@; effectiveContentInsets == %@; We are"
            " IGNORING this invalidation since the area to layout in is 0.",
            buf,
            0x2Au);
        }
      }
      *(unsigned char *)&self->_compositionalLayoutFlags |= 4u;
      v25.receiver = self;
      v25.super_class = (Class)UICollectionViewCompositionalLayout;
      [(UICollectionViewLayout *)&v25 invalidateLayoutWithContext:a3];
    }
  }
}

- (id)_customContainerSectionIndexes
{
  unint64_t v2 = [(UICollectionViewCompositionalLayout *)self solver];
  uint64_t v3 = v2;
  if (v2) {
    unint64_t v2 = (void *)v2[12];
  }
  double v4 = v2;

  return v4;
}

- (BOOL)_viewBoundsPermitsLayout:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = CGRectGetWidth(a3);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  return v7 * CGRectGetHeight(v9) > 0.0;
}

- (void)_queueDeferredResolveForInvalidationWithContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [a3 _intent];
  unint64_t deferredResolveType = self->_deferredResolveType;
  char compositionalLayoutFlags = (char)self->_compositionalLayoutFlags;
  if ((compositionalLayoutFlags & 8) != 0)
  {
    if (v6 != 3 && v6 != 8 && (*(unsigned char *)&self->_compositionalLayoutFlags & 4) == 0) {
      goto LABEL_8;
    }
    *(unsigned char *)&self->_char compositionalLayoutFlags = compositionalLayoutFlags & 0xF7;
    if (deferredResolveType != 7) {
      self->_unint64_t deferredResolveType = 0;
    }
  }
  if ((compositionalLayoutFlags & 4) != 0)
  {
LABEL_15:
    BOOL v9 = 0;
    char v11 = 0;
    unint64_t v10 = 7;
    goto LABEL_27;
  }
LABEL_8:
  BOOL v9 = 0;
  unint64_t v10 = 0;
  char v11 = 1;
  switch(v6)
  {
    case 0:
      [a3 _setRequiresFullCacheInvalidation];
      goto LABEL_15;
    case 1:
      BOOL v9 = 0;
      char v11 = 0;
      unint64_t v10 = 3;
      break;
    case 2:
      BOOL v9 = 0;
      char v11 = 0;
      unint64_t v10 = 6;
      break;
    case 3:
      goto LABEL_15;
    case 4:
    case 5:
      BOOL v9 = 0;
      char v11 = 0;
      unint64_t v10 = 1;
      break;
    case 6:
    case 12:
      break;
    case 7:
      BOOL v9 = 0;
      char v11 = 0;
      unint64_t v10 = 2;
      break;
    case 8:
      if (deferredResolveType == 7) {
        goto LABEL_25;
      }
      double v12 = [(UICollectionViewCompositionalLayout *)self _updateResolve];
      if (v12) {
        BOOL v9 = v12[40] != 0;
      }
      else {
        BOOL v9 = 0;
      }

      goto LABEL_26;
    case 9:
      [(UICollectionViewCompositionalLayout *)self _handleSwipeActionsInvalidationWithContext:a3];
      goto LABEL_25;
    case 10:
      [(UICollectionViewCompositionalLayout *)self _handlePreferredSizingDataInvalidation:a3];
      goto LABEL_25;
    case 11:
      [(UICollectionViewCompositionalLayout *)self _handleEndInteractiveReorderingWithContext:a3];
      goto LABEL_25;
    case 13:
      BOOL v9 = 0;
      char v11 = 0;
      unint64_t v10 = 4;
      break;
    case 14:
      BOOL v9 = 0;
      char v11 = 0;
      unint64_t v10 = 5;
      break;
    case 15:
      double v13 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v14 = [(UICollectionViewLayout *)self collectionView];
      [v13 handleFailureInMethod:a2, self, @"UICollectionViewCompositionalLayout.m", 716, @"Compositional Layout internal bug: Attempting to queue a invalidation for an already deferred invalidation context. Collection View: %@, Layout: %@", v14, self object file lineNumber description];

LABEL_25:
      BOOL v9 = 0;
LABEL_26:
      unint64_t v10 = 0;
      break;
    default:
      double v18 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewCompositionalLayout.m", 722, @"Compositional Layout internal bug: Attempting to process invalidation context with unknown intent. Intent: %lld; Context: %@; Layout: %@",
        [a3 _intent],
        a3,
        self);

      BOOL v9 = 0;
      unint64_t v10 = 0;
      char v11 = 1;
      break;
  }
LABEL_27:
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICollectionLayout", &_queueDeferredResolveForInvalidationWithContext____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    double v19 = *(id *)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      unint64_t v20 = [(UICollectionViewLayout *)self collectionView];
      objc_super v21 = off_1E52E0AE8[v10];
      uint64_t v22 = _UICollectionViewLayoutInvalidationContextIntentDescription([a3 _intent]);
      unint64_t v23 = self->_deferredResolveType;
      if (v23 > 7) {
        objc_super v24 = @"unknown";
      }
      else {
        objc_super v24 = off_1E52E0AE8[v23];
      }
      *(_DWORD *)buf = 134218754;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      __int16 v29 = v21;
      __int16 v30 = 2112;
      uint64_t v31 = v22;
      __int16 v32 = 2112;
      __int16 v33 = v24;
      objc_super v25 = (void *)v22;
      _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "_queueDeferredResolve: cv == %p; Computed required resolve: %@ for invalidation: %@. Current deferred resolve type: %@",
        buf,
        0x2Au);
    }
  }
  unint64_t v16 = self->_deferredResolveType;
  if (v10 > v16)
  {
    self->_unint64_t deferredResolveType = v10;
    unint64_t v16 = v10;
  }
  if (a3) {
    char v17 = v11;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0)
  {
    *((unsigned char *)a3 + 112) |= 8u;
    unint64_t v16 = self->_deferredResolveType;
  }
  if (!v16)
  {
    [(UICollectionViewCompositionalLayout *)self _solveForPinnedSupplementaryItemsIfNeededWithContext:a3];
    if (v9) {
      [(UICollectionViewCompositionalLayout *)self _updateCollectionViewBackgroundColor];
    }
  }
  [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule processLayoutInvalidationWithContext:a3 updateConfigurations:v9];
}

- (void)_solveForPinnedSupplementaryItemsIfNeededWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  double v5 = [(UICollectionViewCompositionalLayout *)self solver];
  BOOL v6 = -[_UICollectionCompositionalLayoutSolver hasPinnedSupplementaryItems]((BOOL)v5);

  if (v6)
  {
    double v7 = [(UICollectionViewCompositionalLayout *)self _updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds];
    if (a3 && ([a3 invalidateEverything] & 1) == 0)
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      double v8 = objc_msgSend(v7, "invalidatedAuxillaryKinds", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v16 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            uint64_t v14 = [v7 indexPathsForInvalidatedSupplementariesOfKind:v13];
            [a3 invalidateSupplementaryElementsOfKind:v13 atIndexPaths:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)_updateCollectionViewBackgroundColor
{
  uint64_t v3 = [(UICollectionViewLayout *)self collectionView];
  char v4 = [v3 _hasCustomBackground];

  if ((v4 & 1) == 0)
  {
    uint64_t v7 = 0;
    double v8 = &v7;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = __Block_byref_object_copy__28;
    uint64_t v11 = __Block_byref_object_dispose__28;
    id v12 = 0;
    double v5 = [(UICollectionViewCompositionalLayout *)self solver];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__UICollectionViewCompositionalLayout__updateCollectionViewBackgroundColor__block_invoke;
    v6[3] = &unk_1E52E0A40;
    v6[4] = &v7;
    -[_UICollectionCompositionalLayoutSolver enumerateSectionDefinitionsWithBlock:]((uint64_t)v5, (uint64_t)v6);

    [(UICollectionViewLayout *)self _setPreferredBackgroundColor:v8[5]];
    _Block_object_dispose(&v7, 8);
  }
}

- (BOOL)_shouldOrthogonalScrollingSectionSupplementaryScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4
{
  BOOL v6 = [(UICollectionViewCompositionalLayout *)self solver];
  LOBYTE(a4) = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionSupplementaryShouldScrollWithContentForIndexPath:elementKind:]((uint64_t)v6, a3, (uint64_t)a4);

  return (char)a4;
}

- (id)_interactionStateModule:(id)a3 layoutSectionForIndex:(int64_t)a4
{
  return [(UICollectionViewCompositionalLayout *)self _layoutSectionForSectionIndex:a4];
}

- (double)_interactionStateModule:(id)a3 spacingAfterLayoutSection:(int64_t)a4
{
  [(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration interSectionSpacing];
  return result;
}

- (id)_layoutAttributesForIndelibleElements
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule indexPathsWithActiveSwipes];
  if ([v3 count])
  {
    char v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = -[UICollectionViewCompositionalLayout layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)_extendedAttributesQueryIncludingOrthogonalScrollingRegions:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = [(UICollectionViewCompositionalLayout *)self solver];
  uint64_t v8 = -[_UICollectionCompositionalLayoutSolver extendedAttributesQueryIncludingOrthogonalScrollingRegions:](v7, x, y, width, height);

  return v8;
}

- (BOOL)_supportsPrefetchingWithEstimatedSizes
{
  return 1;
}

- (CGSize)collectionViewContentSize
{
  [(UICollectionViewCompositionalLayout *)self contentFrame];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (CGRect)contentFrame
{
  double x = self->_contentFrame.origin.x;
  double y = self->_contentFrame.origin.y;
  double width = self->_contentFrame.size.width;
  double height = self->_contentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)_shouldAdjustTargetContentOffsetToValidateContentExtents
{
  return 1;
}

+ (UICollectionViewCompositionalLayout)layoutWithListConfiguration:(UICollectionLayoutListConfiguration *)configuration
{
  double v4 = (void *)[(UICollectionLayoutListConfiguration *)configuration copy];
  id v5 = objc_alloc((Class)a1);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__UICollectionViewCompositionalLayout_UICollectionLayoutListSection__layoutWithListConfiguration___block_invoke;
  v9[3] = &unk_1E52EBF20;
  id v10 = v4;
  id v6 = v4;
  uint64_t v7 = (void *)[v5 initWithSectionProvider:v9];

  return (UICollectionViewCompositionalLayout *)v7;
}

- (UICollectionViewCompositionalLayoutConfiguration)configuration
{
  double v2 = (void *)[(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration copy];
  return (UICollectionViewCompositionalLayoutConfiguration *)v2;
}

- (UICollectionViewCompositionalLayout)initWithSectionProvider:(UICollectionViewCompositionalLayoutSectionProvider)sectionProvider configuration:(UICollectionViewCompositionalLayoutConfiguration *)configuration
{
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewCompositionalLayout;
  id v6 = [(UICollectionViewLayout *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    _UICollectionViewCompositionalLayoutCommonInit((uint64_t)v6, 0, sectionProvider, configuration);
  }
  return v7;
}

- (void)setConfiguration:(UICollectionViewCompositionalLayoutConfiguration *)configuration
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UICollectionViewCompositionalLayout.m", 170, @"Invalid parameter not satisfying: %@", @"[configuration isKindOfClass:[UICollectionViewCompositionalLayoutConfiguration class]]" object file lineNumber description];
  }
  unint64_t v6 = [(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration differencesFromConfiguration:configuration];
  uint64_t v7 = (UICollectionViewCompositionalLayoutConfiguration *)[(UICollectionViewCompositionalLayoutConfiguration *)configuration copy];
  uint64_t v8 = self->_configuration;
  self->_configuration = v7;

  if (v6)
  {
    if ((v6 & 2) != 0) {
      _UIUpdateCollectionViewForScrollDirection((uint64_t)self->super._collectionView, [(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration scrollDirection]);
    }
    if (*(unsigned char *)&self->_compositionalLayoutFlags)
    {
      long long v13 = 0;
    }
    else
    {
      objc_super v9 = [(UICollectionViewCompositionalLayout *)self solver];

      if (v6 != 8 || v9 == 0)
      {
        [(UICollectionViewCompositionalLayout *)self _fullResolve];
        [(UICollectionViewCompositionalLayout *)self _updateCollectionViewBackgroundColor];
        long long v13 = 0;
      }
      else
      {
        uint64_t v11 = [(UICollectionViewCompositionalLayout *)self solver];
        long long v12 = [(UICollectionViewCompositionalLayoutConfiguration *)configuration boundarySupplementaryItems];
        -[_UICollectionCompositionalLayoutSolver resolveForUpdatedGlobalSupplementaries:](v11, v12);
        long long v13 = (double *)objc_claimAutoreleasedReturnValue();
      }
      [(UICollectionViewCompositionalLayout *)self _computeAndUpdateAdjustedContentFrame];
    }
    id v14 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
    [v14 _setInvalidateEverything:1];
    if (v13)
    {
      objc_msgSend(v14, "setContentOffsetAdjustment:", v13[6], v13[7]);
      [v14 _setShouldInvalidateCollectionViewContentSize:1];
    }
    v16.receiver = self;
    v16.super_class = (Class)UICollectionViewCompositionalLayout;
    [(UICollectionViewLayout *)&v16 invalidateLayoutWithContext:v14];
  }
}

- (id)_preferredAttributesResolveWithInvalidatedPreferredAttributes:(id)a3 layoutOffset:(CGPoint)a4 visibleRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.y;
  double v10 = a4.x;
  kdebug_trace();
  long long v13 = [(UICollectionViewCompositionalLayout *)self solver];
  id v14 = -[_UICollectionCompositionalLayoutSolver resolveForInvalidatedPreferredAttributes:scrollOffset:visibleRect:]((uint64_t)v13, a3, v10, v9, x, y, width, height);

  [(UICollectionViewCompositionalLayout *)self _computeAndUpdateAdjustedContentFrame];
  kdebug_trace();
  return v14;
}

- (UICollectionViewCompositionalLayout)initWithSectionProvider:(UICollectionViewCompositionalLayoutSectionProvider)sectionProvider
{
  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewCompositionalLayout;
  double v4 = [(UICollectionViewLayout *)&v7 init];
  if (v4)
  {
    id v5 = +[UICollectionViewCompositionalLayoutConfiguration defaultConfiguration];
    _UICollectionViewCompositionalLayoutCommonInit((uint64_t)v4, 0, sectionProvider, v5);
  }
  return v4;
}

- (void)_fullResolve
{
  kdebug_trace();
  if (![(UICollectionViewCompositionalLayout *)self layoutRTL])
  {
    double v3 = [(UICollectionViewLayout *)self collectionView];
    uint64_t v4 = [v3 effectiveUserInterfaceLayoutDirection];

    if (v4 == 1) {
      [(UICollectionViewCompositionalLayout *)self setLayoutRTL:1];
    }
  }
  UICollectionViewScrollDirection v5 = [(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration scrollDirection];
  uint64_t v6 = 1;
  if (v5 == UICollectionViewScrollDirectionVertical) {
    uint64_t v6 = 2;
  }
  v62 = (void *)v6;
  objc_initWeak(location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke;
  aBlock[3] = &unk_1E52E0950;
  objc_copyWeak(&v78, location);
  objc_super v7 = _Block_copy(aBlock);
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_2;
  v75[3] = &unk_1E52E0978;
  objc_copyWeak(&v76, location);
  uint64_t v8 = _Block_copy(v75);
  double v9 = [(UICollectionViewLayout *)self collectionView];
  double v10 = [(UICollectionViewCompositionalLayout *)self _dataSourceSnapshotter];
  [(UICollectionViewCompositionalLayout *)self setDataSourceSnapshotter:v10];
  uint64_t v11 = [(UICollectionViewCompositionalLayout *)self solver];
  v61 = -[_UICollectionCompositionalLayoutSolver restorableState]((uint64_t)v11);

  uint64_t v12 = +[_UICollectionCompositionalLayoutSolverOptions defaultOptions]();
  [(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration interSectionSpacing];
  if (v12) {
    *(void *)(v12 + 16) = v13;
  }
  id v14 = (void *)[(id)objc_opt_class() layoutAttributesClass];
  -[_UIHomeAffordanceObservationRecord setLegacyViewServiceSessionIdentifier:](v12, v14);
  long long v15 = (void *)[(id)objc_opt_class() invalidationContextClass];
  -[UIContentUnavailableImageProperties _setTintColor:](v12, v15);
  BOOL v16 = [(UICollectionViewCompositionalLayout *)self layoutRTL];
  if (v12) {
    *(unsigned char *)(v12 + 8) = v16;
  }
  BOOL v17 = [(UICollectionViewCompositionalLayout *)self roundsToScreenScale];
  if (v12)
  {
    *(unsigned char *)(v12 + 9) = v17;
    objc_setProperty_nonatomic_copy((id)v12, v18, v8, 40);
  }
  uint64_t v20 = [(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration boundarySupplementaryItems];
  if (v12) {
    objc_setProperty_nonatomic_copy((id)v12, v19, v20, 48);
  }

  newValue[0] = MEMORY[0x1E4F143A8];
  newValue[1] = 3221225472;
  newValue[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_3;
  newValue[3] = &unk_1E52E09A0;
  objc_copyWeak(&v74, location);
  if (v12) {
    objc_setProperty_nonatomic_copy((id)v12, v21, newValue, 56);
  }
  v71[0] = MEMORY[0x1E4F143A8];
  v71[1] = 3221225472;
  v71[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_4;
  v71[3] = &unk_1E52E09C8;
  objc_copyWeak(&v72, location);
  if (v12) {
    objc_setProperty_nonatomic_copy((id)v12, v22, v71, 64);
  }
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_5;
  v69[3] = &unk_1E52E09F0;
  objc_copyWeak(&v70, location);
  if (v12) {
    objc_setProperty_nonatomic_copy((id)v12, v23, v69, 72);
  }
  v60 = v8;
  objc_super v24 = [(UICollectionViewCompositionalLayout *)self _containerFromCollectionView];
  objc_super v25 = [_UICollectionCompositionalLayoutSolver alloc];
  objc_super v26 = [v9 traitCollection];
  uint64_t v27 = -[_UICollectionCompositionalLayoutSolver initWithContainer:traitCollection:layoutAxis:dataSourceSnapshot:options:sectionProvider:](v25, v24, v26, v62, v10, v12, v7);
  [(UICollectionViewCompositionalLayout *)self setSolver:v27];

  __int16 v28 = [(UICollectionViewCompositionalLayout *)self solver];
  [v61 applyToSolver:v28];

  __int16 v29 = [(UICollectionViewCompositionalLayout *)self dynamicsConfigurationHandler];
  __int16 v30 = [(UICollectionViewCompositionalLayout *)self solver];
  -[_UICollectionCompositionalLayoutSolver setDynamicsConfigurationHandler:]((uint64_t)v30, v29);

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_6;
  v67[3] = &unk_1E52E0A18;
  objc_copyWeak(&v68, location);
  uint64_t v31 = [(UICollectionViewCompositionalLayout *)self solver];
  __int16 v33 = v31;
  if (v31) {
    objc_setProperty_nonatomic_copy(v31, v32, v67, 24);
  }

  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_7;
  v65[3] = &unk_1E52E0A18;
  objc_copyWeak(&v66, location);
  uint64_t v34 = [(UICollectionViewCompositionalLayout *)self solver];
  CGRect v36 = v34;
  if (v34) {
    objc_setProperty_nonatomic_copy(v34, v35, v65, 32);
  }

  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_8;
  v63[3] = &unk_1E52E0A18;
  objc_copyWeak(&v64, location);
  UIEdgeInsets v37 = [(UICollectionViewCompositionalLayout *)self solver];
  v39 = v37;
  if (v37) {
    objc_setProperty_nonatomic_copy(v37, v38, v63, 40);
  }

  [(UICollectionViewCompositionalLayout *)self _computeAndUpdateAdjustedContentFrame];
  uint64_t v40 = [(UICollectionViewLayout *)self collectionView];
  [v40 visibleBounds];
  id v41 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");

  long long v42 = [(UICollectionViewCompositionalLayout *)self solver];
  if (v42)
  {
    uint64_t v43 = v42[13];

    if (v43)
    {
      long long v44 = [(UICollectionViewLayout *)self collectionView];
      [v44 bounds];
      double v46 = v45;
      double v48 = v47;
      double v50 = v49;
      double v52 = v51;

      -[UICollectionViewCompositionalLayout _invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:preparingLayout:](self, "_invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:preparingLayout:", 1, v46, v48, v50, v52);
    }
  }
  __int16 v53 = [(UICollectionViewCompositionalLayout *)self solver];
  if (v53)
  {
    int v54 = v53[15];

    if (!v54) {
      goto LABEL_33;
    }
    [(UICollectionViewLayout *)self _setWantsRightToLeftHorizontalMirroringIfNeeded:1];
    id v55 = [(UICollectionViewLayout *)self collectionView];
    [v55 _setFlipsHorizontalAxis:1];
  }
  else
  {
    id v55 = 0;
  }

LABEL_33:
  BOOL v56 = [(UICollectionViewCompositionalLayout *)self _adjustCollectionViewContentInsetBehaviorForLayoutAxisIfNeeded:v62 container:v24];
  if (v56) {
    char v57 = 2;
  }
  else {
    char v57 = 0;
  }
  *(unsigned char *)&self->_char compositionalLayoutFlags = *(unsigned char *)&self->_compositionalLayoutFlags & 0xFD | v57;
  unint64_t v58 = 5;
  if (!v56) {
    unint64_t v58 = 0;
  }
  self->_edgesForSafeAreaPropagation = v58;
  CGPoint v59 = [(UICollectionViewLayout *)self collectionView];
  [v59 bounds];
  -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedCollectionViewBounds:](self, "setMemoizedPreviousSolvedCollectionViewBounds:");

  *(unsigned char *)&self->_compositionalLayoutFlags &= ~4u;
  kdebug_trace();
  objc_destroyWeak(&v64);
  objc_destroyWeak(&v66);
  objc_destroyWeak(&v68);

  objc_destroyWeak(&v70);
  objc_destroyWeak(&v72);
  objc_destroyWeak(&v74);

  objc_destroyWeak(&v76);
  objc_destroyWeak(&v78);
  objc_destroyWeak(location);
}

- (id)_updateResolve
{
  uint64_t v4 = [(UICollectionViewLayout *)self collectionView];
  if (v4)
  {
    UICollectionViewScrollDirection v5 = [(UICollectionViewCompositionalLayout *)self currentUpdate];

    if (!v5)
    {
      long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
      [v18 handleFailureInMethod:a2, self, @"UICollectionViewCompositionalLayout.m", 1590, @"Invalid parameter not satisfying: %@", @"self.currentUpdate != nil" object file lineNumber description];
    }
    kdebug_trace();
    uint64_t v6 = [(UICollectionViewCompositionalLayout *)self currentUpdate];
    objc_super v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = *(void **)(v6 + 24);
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
    [(UICollectionViewCompositionalLayout *)self setDataSourceSnapshotter:v9];

    [v4 bounds];
    -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedCollectionViewBounds:](self, "setMemoizedPreviousSolvedCollectionViewBounds:");
    double v10 = [(UICollectionViewCompositionalLayout *)self _containerFromCollectionView];
    if (dyld_program_sdk_at_least()) {
      int v11 = [v4 _isReordering];
    }
    else {
      int v11 = 0;
    }
    uint64_t v13 = [(UICollectionViewCompositionalLayout *)self solver];
    id v14 = [(UICollectionViewCompositionalLayout *)self currentUpdate];
    long long v15 = -[_UICollectionCompositionalLayoutSolver resolveSolutionForUpdate:container:ignoreEmptyUpdate:]((uint64_t)v13, (uint64_t)v14, v10, v11);
    [(UICollectionViewCompositionalLayout *)self setCurrentResolveResult:v15];

    [(UICollectionViewCompositionalLayout *)self _computeAndUpdateAdjustedContentFrame];
    if (dyld_program_sdk_at_least())
    {
      [v4 visibleBounds];
      id v16 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
    }
    kdebug_trace();
    uint64_t v12 = [(UICollectionViewCompositionalLayout *)self currentResolveResult];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_computeAndUpdateAdjustedContentFrame
{
  double v3 = [(UICollectionViewCompositionalLayout *)self solver];
  if (v3)
  {
    id v16 = v3;
    double v4 = -[_UICollectionCompositionalLayoutSolver contentSize]((uint64_t)v3);
    double v6 = v5;
    id v7 = v16[6];
    [v7 contentSize];
    double v9 = v8;
    double v11 = v10;

    id v12 = v16[8];
    if (v12 == (id)1) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = v12 == (id)2;
    }
    double v14 = _UISizeClampToMinimumSizeForAxis(v13, v4, v6, v9, v11);
    -[UICollectionViewCompositionalLayout setContentFrame:](self, "setContentFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v14, v15);
    double v3 = v16;
  }
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (void)setMemoizedPreviousSolvedCollectionViewBounds:(CGRect)a3
{
  self->_memoizedPreviousSolvedCollectionViewBounds = a3;
}

- (id)_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(UICollectionViewCompositionalLayout *)self solver];
  if (v8 && (uint64_t v9 = v8[36], v8, v9 >= 1))
  {
    kdebug_trace();
    double v10 = [(UICollectionViewCompositionalLayout *)self solver];
    double v11 = -[_UICollectionCompositionalLayoutSolver mutatedVisibleItemsForElementsForVisibleBounds:]((uint64_t)v10, x, y, width, height);

    kdebug_trace();
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

- (id)_containerFromCollectionView
{
  double v3 = [(UICollectionViewLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(UICollectionViewCompositionalLayout *)self _contentInsetsEnvironmentFromCollectionViewForInsetsReference:[(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration contentInsetsReference]];
  uint64_t v9 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:insetsEnvironment:]([_UICollectionLayoutContainer alloc], v8, v5, v7, 0.0, 0.0, 0.0, 0.0);

  return v9;
}

- (id)_contentInsetsEnvironmentFromCollectionViewForInsetsReference:(int64_t)a3
{
  double v4 = [(UICollectionViewLayout *)self collectionView];
  double v5 = +[_UIContentInsetsEnvironment insetEnvironmentForScrollView:v4 insetReference:a3];

  return v5;
}

- (void)setDataSourceSnapshotter:(id)a3
{
}

- (id)indexPathsToInsertForDecorationViewOfKind:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewCompositionalLayout;
  uint64_t v5 = -[UICollectionViewLayout indexPathsToInsertForDecorationViewOfKind:](&v15, sel_indexPathsToInsertForDecorationViewOfKind_);
  double v6 = (void *)v5;
  double v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    double v7 = (void *)v5;
  }
  id v8 = v7;

  uint64_t v9 = [(UICollectionViewCompositionalLayout *)self currentResolveResult];

  if (v9)
  {
    double v10 = [(UICollectionViewCompositionalLayout *)self currentResolveResult];
    double v11 = -[_UICollectionCompositionalLayoutSolverResolveResult indexPathsForInsertedDecorationsForElementKind:](v10, a3);
    id v12 = [v11 allObjects];

    if ([v12 count])
    {
      uint64_t v13 = [v8 arrayByAddingObjectsFromArray:v12];

      id v8 = (id)v13;
    }
  }
  return v8;
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewCompositionalLayout;
  uint64_t v5 = -[UICollectionViewLayout indexPathsToDeleteForSupplementaryViewOfKind:](&v15, sel_indexPathsToDeleteForSupplementaryViewOfKind_);
  double v6 = (void *)v5;
  double v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    double v7 = (void *)v5;
  }
  id v8 = v7;

  uint64_t v9 = [(UICollectionViewCompositionalLayout *)self currentResolveResult];

  if (v9)
  {
    double v10 = [(UICollectionViewCompositionalLayout *)self currentResolveResult];
    double v11 = -[_UICollectionCompositionalLayoutSolverResolveResult indexPathsForDeletedSupplememtariesForElementKind:](v10, a3);
    id v12 = [v11 allObjects];

    if ([v12 count])
    {
      uint64_t v13 = [v8 arrayByAddingObjectsFromArray:v12];

      id v8 = (id)v13;
    }
  }
  return v8;
}

- (id)indexPathsToInsertForSupplementaryViewOfKind:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewCompositionalLayout;
  uint64_t v5 = -[UICollectionViewLayout indexPathsToInsertForSupplementaryViewOfKind:](&v15, sel_indexPathsToInsertForSupplementaryViewOfKind_);
  double v6 = (void *)v5;
  double v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    double v7 = (void *)v5;
  }
  id v8 = v7;

  uint64_t v9 = [(UICollectionViewCompositionalLayout *)self currentResolveResult];

  if (v9)
  {
    double v10 = [(UICollectionViewCompositionalLayout *)self currentResolveResult];
    double v11 = -[_UICollectionCompositionalLayoutSolverResolveResult indexPathsForInsertedSupplememtariesForElementKind:](v10, a3);
    id v12 = [v11 allObjects];

    if ([v12 count])
    {
      uint64_t v13 = [v8 arrayByAddingObjectsFromArray:v12];

      id v8 = (id)v13;
    }
  }
  return v8;
}

- (_UICollectionCompositionalLayoutSolverResolveResult)currentResolveResult
{
  return self->_currentResolveResult;
}

- (id)indexPathsToDeleteForDecorationViewOfKind:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)UICollectionViewCompositionalLayout;
  uint64_t v5 = -[UICollectionViewLayout indexPathsToDeleteForDecorationViewOfKind:](&v15, sel_indexPathsToDeleteForDecorationViewOfKind_);
  double v6 = (void *)v5;
  double v7 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    double v7 = (void *)v5;
  }
  id v8 = v7;

  uint64_t v9 = [(UICollectionViewCompositionalLayout *)self currentResolveResult];

  if (v9)
  {
    double v10 = [(UICollectionViewCompositionalLayout *)self currentResolveResult];
    double v11 = -[_UICollectionCompositionalLayoutSolverResolveResult indexPathsForDeletedDecorationsForElementKind:](v10, a3);
    id v12 = [v11 allObjects];

    if ([v12 count])
    {
      uint64_t v13 = [v8 arrayByAddingObjectsFromArray:v12];

      id v8 = (id)v13;
    }
  }
  return v8;
}

- (int64_t)_anchorForAuxiliaryElementOfKind:(id)a3
{
  double v4 = [(UICollectionViewCompositionalLayout *)self solver];
  int64_t v5 = -[_UICollectionCompositionalLayoutSolver _anchorForAuxiliaryElementOfKind:]((uint64_t)v4, (uint64_t)a3);

  return v5;
}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && [a2 _registrationViewClass])
  {
    uint64_t v3 = [a2 _registrationViewClass];
    double v4 = [a2 elementKind];
    [WeakRetained registerClass:v3 forDecorationViewOfKind:v4];
  }
}

- (void)_finalizeCollectionViewUpdate:(id)a3
{
  int64_t v5 = [(UICollectionViewCompositionalLayout *)self solver];
  -[_UICollectionCompositionalLayoutSolver finalizeCollectionViewUpdates]((uint64_t)v5);

  [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule finalizeCollectionViewUpdate:a3];
  [(UICollectionViewCompositionalLayout *)self setCurrentUpdate:0];
  [(UICollectionViewCompositionalLayout *)self setCurrentResolveResult:0];
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCompositionalLayout;
  [(UICollectionViewLayout *)&v6 _finalizeCollectionViewUpdate:a3];
}

- (void)setCurrentResolveResult:(id)a3
{
}

- (void)_prepareForCollectionViewUpdates:(id)a3 withDataSourceTranslator:(id)a4
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__UICollectionViewCompositionalLayout__prepareForCollectionViewUpdates_withDataSourceTranslator___block_invoke;
  aBlock[3] = &unk_1E52E0928;
  void aBlock[4] = a4;
  double v7 = _Block_copy(aBlock);
  [(UICollectionView *)self->super._collectionView _visibleBounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = [off_1E52D5400 snapshotterForSectionCountsProvider:v7];
  BOOL v17 = +[_UICollectionCompositionalLayoutSolverUpdate solverUpdateForVisibleBounds:updateItems:updateTranslator:finalDataSourceSnapshot:](v9, v11, v13, v15, (uint64_t)_UICollectionCompositionalLayoutSolverUpdate, a3, a4, v16);
  [(UICollectionViewCompositionalLayout *)self setCurrentUpdate:v17];

  long long v18 = [(UICollectionViewCompositionalLayout *)self solver];
  -[_UICollectionCompositionalLayoutSolver prepareForCollectionViewUpdates]((uint64_t)v18);

  [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule updateWithDataSourceTranslator:a4];
}

- (void)setCurrentUpdate:(id)a3
{
}

- (BOOL)layoutRTL
{
  return self->_layoutRTL;
}

- (void)setSolver:(id)a3
{
}

- (id)dynamicsConfigurationHandler
{
  return self->_dynamicsConfigurationHandler;
}

- (BOOL)_adjustCollectionViewContentInsetBehaviorForLayoutAxisIfNeeded:(unint64_t)a3 container:(id)a4
{
  int64_t v7 = [(UIScrollView *)self->super._collectionView _compatibleContentInsetAdjustmentBehavior];
  if (a3 != 1
    || ([(UICollectionViewCompositionalLayout *)self collectionViewContentSize],
        double v9 = v8,
        [a4 contentSize],
        v9 >= v10 + 0.5))
  {
    BOOL v11 = 0;
    if (v7 != 102) {
      return v11;
    }
    uint64_t v12 = 0;
LABEL_8:
    [(UIScrollView *)self->super._collectionView setContentInsetAdjustmentBehavior:v12];
    return v11;
  }
  BOOL v11 = 1;
  uint64_t v12 = 102;
  if (!v7 || v7 == 102) {
    goto LABEL_8;
  }
  return 0;
}

- (BOOL)roundsToScreenScale
{
  return self->_roundsToScreenScale;
}

- (id)_dataSourceSnapshotter
{
  double v2 = [(UICollectionViewLayout *)self collectionView];
  uint64_t v3 = [v2 dataSource];

  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__UICollectionViewCompositionalLayout__dataSourceSnapshotter__block_invoke;
    v6[3] = &unk_1E52E0928;
    id v7 = v2;
    double v4 = [off_1E52D5400 snapshotterForSectionCountsProvider:v6];
  }
  else
  {
    double v4 = [off_1E52D5400 snapshotterForNoDataSource];
  }

  return v4;
}

- (BOOL)_shouldInvalidateLayoutForDataSourceChange
{
  return 0;
}

- (id)_propertyAnimatorForCollectionViewUpdates:(id)a3 withCustomAnimator:(id)a4
{
  swipeActionsModule = self->super._swipeActionsModule;
  if (swipeActionsModule)
  {
    objc_super v6 = [(_UICollectionViewLayoutSwipeActionsModule *)swipeActionsModule propertyAnimatorForCollectionViewUpdates:a3 withCustomAnimator:a4];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UICollectionViewCompositionalLayout;
    objc_super v6 = [(UICollectionViewLayout *)&v8 _propertyAnimatorForCollectionViewUpdates:a3 withCustomAnimator:a4];
  }
  return v6;
}

- (void)_scrollViewLayoutAdjustmentsChanged
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(UICollectionViewCompositionalLayout *)self solver];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__UICollectionViewCompositionalLayout__scrollViewLayoutAdjustmentsChanged__block_invoke;
  v5[3] = &unk_1E52E0A40;
  v5[4] = &v6;
  -[_UICollectionCompositionalLayoutSolver enumerateSectionDefinitionsWithBlock:]((uint64_t)v3, (uint64_t)v5);

  if (*((unsigned char *)v7 + 24))
  {
    id v4 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
    [v4 _setIntent:13];
    [(UICollectionViewCompositionalLayout *)self invalidateLayoutWithContext:v4];
  }
  _Block_object_dispose(&v6, 8);
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7 = [(UICollectionViewCompositionalLayout *)self currentUpdate];
  uint64_t v8 = (void *)v7;
  if (v7) {
    char v9 = *(void **)(v7 + 16);
  }
  else {
    char v9 = 0;
  }
  id v10 = v9;

  if (v10 && _CompositionalLayoutShouldOverrideInitialAttributesDuringUpdates())
  {
    BOOL v11 = [v10 initialIndexPathForSupplementaryElementOfKind:a3 forFinalIndexPath:a4];
    if (v11)
    {
      uint64_t v12 = [(UICollectionViewCompositionalLayout *)self solver];
      double v13 = -[_UICollectionCompositionalLayoutSolver preUpdateFrameForSupplementaryViewOfKind:withInitialIndexPath:]((uint64_t)v12, a3, v11);
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      v25.origin.double x = v13;
      v25.origin.double y = v15;
      v25.size.double width = v17;
      v25.size.double height = v19;
      if (!CGRectIsNull(v25))
      {
        uint64_t v20 = [(UICollectionViewCompositionalLayout *)self layoutAttributesForSupplementaryViewOfKind:a3 atIndexPath:a4];
        objc_super v21 = (void *)[v20 copy];

        if (v21)
        {
          objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

          goto LABEL_11;
        }
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)UICollectionViewCompositionalLayout;
  objc_super v21 = [(UICollectionViewLayout *)&v23 initialLayoutAttributesForAppearingSupplementaryElementOfKind:a3 atIndexPath:a4];
LABEL_11:

  return v21;
}

- (BOOL)_shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UICollectionViewCompositionalLayout *)self _estimatesSizes]) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCompositionalLayout;
  return [(UICollectionViewLayout *)&v6 _shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:v3];
}

- (id)initialLayoutAttributesForAppearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v7 = [(UICollectionViewCompositionalLayout *)self currentUpdate];
  uint64_t v8 = (void *)v7;
  if (v7) {
    char v9 = *(void **)(v7 + 16);
  }
  else {
    char v9 = 0;
  }
  id v10 = v9;

  if (v10 && _CompositionalLayoutShouldOverrideInitialAttributesDuringUpdates())
  {
    BOOL v11 = [v10 initialIndexPathForSupplementaryElementOfKind:a3 forFinalIndexPath:a4];
    if (v11)
    {
      uint64_t v12 = [(UICollectionViewCompositionalLayout *)self solver];
      double v13 = -[_UICollectionCompositionalLayoutSolver preUpdateFrameForDecorationViewOfKind:withInitialIndexPath:](v12, a3, v11);
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;

      v25.origin.double x = v13;
      v25.origin.double y = v15;
      v25.size.double width = v17;
      v25.size.double height = v19;
      if (!CGRectIsNull(v25))
      {
        uint64_t v20 = [(UICollectionViewCompositionalLayout *)self layoutAttributesForDecorationViewOfKind:a3 atIndexPath:a4];
        objc_super v21 = (void *)[v20 copy];

        if (v21)
        {
          objc_msgSend(v21, "setFrame:", v13, v15, v17, v19);

          goto LABEL_11;
        }
      }
    }
  }
  v23.receiver = self;
  v23.super_class = (Class)UICollectionViewCompositionalLayout;
  objc_super v21 = [(UICollectionViewLayout *)&v23 initialLayoutAttributesForAppearingDecorationElementOfKind:a3 atIndexPath:a4];
LABEL_11:

  return v21;
}

- (BOOL)_wantsAnimationsForOffscreenAuxillaries
{
  return 1;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  solver = self->_solver;
  return -[_UICollectionCompositionalLayoutSolver layoutAttributesForDecorationViewOfKind:withIndexPath:]((uint64_t)solver, a3, a4);
}

- (BOOL)_orthogonalScrollingElementShouldAppearBelowForAttributes:(id)a3
{
  id v4 = [(UICollectionViewCompositionalLayout *)self solver];
  LOBYTE(a3) = -[_UICollectionCompositionalLayoutSolver elementShouldAppearBelowOrthogonalScrollingContainer:]((uint64_t)v4, (uint64_t)a3);

  return (char)a3;
}

- (BOOL)_shouldOrthogonalScrollingSectionDecorationScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4
{
  objc_super v6 = [(UICollectionViewCompositionalLayout *)self solver];
  LOBYTE(a4) = -[_UICollectionCompositionalLayoutSolver orthogonalScrollingSectionDecorationShouldScrollWithContentForIndexPath:elementKind:]((uint64_t)v6, a3, (uint64_t)a4);

  return (char)a4;
}

- (void)_setCollectionView:(id)a3
{
  int64_t v5 = [(UICollectionViewLayout *)self collectionView];
  if (self) {
    collectionViewTraitChangeRegistration = self->_collectionViewTraitChangeRegistration;
  }
  else {
    collectionViewTraitChangeRegistration = 0;
  }
  uint64_t v7 = collectionViewTraitChangeRegistration;
  -[UICollectionViewCompositionalLayout setCollectionViewTraitChangeRegistration:]((uint64_t)self, 0);
  if (v5 && v7) {
    [v5 unregisterForTraitChanges:v7];
  }
  v10.receiver = self;
  v10.super_class = (Class)UICollectionViewCompositionalLayout;
  [(UICollectionViewLayout *)&v10 _setCollectionView:a3];
  uint64_t v8 = +[_UICollectionCompositionalLayoutSolver traitsRequiringInvalidationForChanges]();
  if ([v8 count])
  {
    char v9 = [a3 _registerForTraitTokenChanges:v8 withTarget:self action:sel__solverObservedTraitsDidChange];
    -[UICollectionViewCompositionalLayout setCollectionViewTraitChangeRegistration:]((uint64_t)self, v9);
  }
  _UIUpdateCollectionViewForScrollDirection((uint64_t)a3, [(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration scrollDirection]);
}

- (void)setCollectionViewTraitChangeRegistration:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 376), a2);
  }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(UICollectionViewCompositionalLayout *)self solver];
  char v9 = (id *)v8;
  if (!v8
    || *(void *)(v8 + 104)
    && -[UICollectionViewCompositionalLayout _invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:preparingLayout:](self, "_invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:preparingLayout:", 0, x, y, width, height)|| (*(unsigned char *)&self->_compositionalLayoutFlags & 4) != 0)
  {
    BOOL v11 = 1;
  }
  else
  {
    char v15 = 0;
    BOOL v10 = -[_UICollectionCompositionalLayoutSolver shouldInvalidateForBoundsChange:requiresContainerUpdate:]((BOOL)v9, &v15, x, y, width, height);
    BOOL v11 = v10;
    if (v15 && !v10)
    {
      uint64_t v12 = (id *)v9[6];
      double v13 = [(_UICollectionLayoutContainer *)v12 containerUpdatingContentSize:height];

      objc_storeStrong(v9 + 6, v13);
    }
  }

  return v11;
}

- (BOOL)_preparedForBoundsChanges
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v32.receiver = self;
  v32.super_class = (Class)UICollectionViewCompositionalLayout;
  uint64_t v8 = -[UICollectionViewLayout invalidationContextForBoundsChange:](&v32, sel_invalidationContextForBoundsChange_);
  [(UICollectionViewCompositionalLayout *)self memoizedPreviousSolvedCollectionViewBounds];
  BOOL v12 = v11 != x;
  if (v13 != y) {
    BOOL v12 = 1;
  }
  BOOL v14 = v10 == height && v9 == width;
  if (v14 && v12) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = 2;
  }
  [v8 _setIntent:v15];
  if (v14 && (_UICollectionViewCompositionalLayoutShouldDeferResolvesUntilQueried() & 1) == 0)
  {
    double v16 = [(UICollectionViewCompositionalLayout *)self solver];
    if (v16)
    {
      uint64_t v17 = v16[36];

      if (v17 >= 1)
      {
        double v18 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:", x, y, width, height);
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v35 count:16];
        if (!v19) {
          goto LABEL_25;
        }
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v29;
        while (1)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            objc_super v23 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if ([v23 representedElementCategory])
            {
              if ([v23 representedElementCategory] != 1) {
                continue;
              }
              objc_super v24 = [v23 representedElementKind];
              CGRect v25 = [v23 indexPath];
              __int16 v33 = v25;
              objc_super v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
              [v8 invalidateSupplementaryElementsOfKind:v24 atIndexPaths:v26];
            }
            else
            {
              objc_super v24 = [v23 indexPath];
              uint64_t v34 = v24;
              CGRect v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
              [v8 invalidateItemsAtIndexPaths:v25];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v35 count:16];
          if (!v20) {
            goto LABEL_25;
          }
        }
      }
    }
    else
    {
      double v18 = 0;
LABEL_25:
    }
  }
  return v8;
}

- (CGRect)memoizedPreviousSolvedCollectionViewBounds
{
  double x = self->_memoizedPreviousSolvedCollectionViewBounds.origin.x;
  double y = self->_memoizedPreviousSolvedCollectionViewBounds.origin.y;
  double width = self->_memoizedPreviousSolvedCollectionViewBounds.size.width;
  double height = self->_memoizedPreviousSolvedCollectionViewBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if (_UISupportsShouldInvalidateForInsets())
  {
    v32.receiver = self;
    v32.super_class = (Class)UICollectionViewCompositionalLayout;
    uint64_t v8 = -[UICollectionViewLayout _invalidationContextForUpdatedLayoutMargins:](&v32, sel__invalidationContextForUpdatedLayoutMargins_, top, left, bottom, right);
    [v8 _setIntent:2];
    goto LABEL_23;
  }
  double v9 = [(UICollectionViewLayout *)self collectionView];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;
  [(UICollectionViewCompositionalLayout *)self memoizedPreviousSolvedCollectionViewBounds];
  BOOL v16 = v13 == v15 && v11 == v14;

  [(UICollectionViewCompositionalLayout *)self memoizedPreviousLayoutMargins];
  if (left != v20 || top != v17 || right != v19)
  {
    if (v16) {
      goto LABEL_13;
    }
LABEL_18:
    v31.receiver = self;
    v31.super_class = (Class)UICollectionViewCompositionalLayout;
    uint64_t v27 = -[UICollectionViewLayout _invalidationContextForUpdatedLayoutMargins:](&v31, sel__invalidationContextForUpdatedLayoutMargins_, top, left, bottom, right);
    uint64_t v8 = v27;
    goto LABEL_20;
  }
  if (!v16) {
    goto LABEL_18;
  }
  if (bottom != v18)
  {
LABEL_13:
    v30.receiver = self;
    v30.super_class = (Class)UICollectionViewCompositionalLayout;
    uint64_t v8 = -[UICollectionViewLayout _invalidationContextForUpdatedLayoutMargins:](&v30, sel__invalidationContextForUpdatedLayoutMargins_, top, left, bottom, right);
    unint64_t v21 = [(UICollectionViewCompositionalLayout *)self _layoutAxis];
    if (v21 == 1) {
      uint64_t v22 = 2;
    }
    else {
      uint64_t v22 = v21 == 2;
    }
    [(UICollectionViewCompositionalLayout *)self memoizedPreviousLayoutMargins];
    if (_UIEdgeInsetsEqualToInsetsAlongAxis(v22, v23, v24, v25, v26, top, left, bottom, right))
    {
      uint64_t v27 = v8;
      uint64_t v28 = 7;
LABEL_21:
      [v27 _setIntent:v28];
      goto LABEL_22;
    }
    uint64_t v27 = v8;
LABEL_20:
    uint64_t v28 = 2;
    goto LABEL_21;
  }
  uint64_t v8 = 0;
LABEL_22:
  -[UICollectionViewCompositionalLayout setMemoizedPreviousLayoutMargins:](self, "setMemoizedPreviousLayoutMargins:", top, left, bottom, right);
LABEL_23:
  return v8;
}

- (BOOL)_shouldInvalidateLayoutForUpdatedSafeAreaInsets:(UIEdgeInsets)a3 fromOldInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v8 = a3.right;
  double v9 = a3.bottom;
  double v10 = a3.left;
  double v11 = a3.top;
  if (!_UISupportsShouldInvalidateForInsets()) {
    return 1;
  }
  return -[UICollectionViewCompositionalLayout _shouldInvalidateLayoutForOldInsets:newInsets:](self, "_shouldInvalidateLayoutForOldInsets:newInsets:", top, left, bottom, right, v11, v10, v9, v8);
}

- (BOOL)_shouldInvalidateLayoutForOldInsets:(UIEdgeInsets)a3 newInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v8 = a3.right;
  double v9 = a3.bottom;
  double v10 = a3.left;
  double v11 = a3.top;
  unint64_t v12 = [(UICollectionViewCompositionalLayout *)self _layoutAxis];
  if (v12 == 1) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = v12 == 2;
  }
  return !_UIEdgeInsetsEqualToInsetsAlongAxis(v13, v11, v10, v9, v8, top, left, bottom, right);
}

- (BOOL)_shouldInvalidateLayoutForUpdatedLayoutMargins:(UIEdgeInsets)a3 fromOldMargins:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v8 = a3.right;
  double v9 = a3.bottom;
  double v10 = a3.left;
  double v11 = a3.top;
  if (!_UISupportsShouldInvalidateForInsets()) {
    return 1;
  }
  return -[UICollectionViewCompositionalLayout _shouldInvalidateLayoutForOldInsets:newInsets:](self, "_shouldInvalidateLayoutForOldInsets:newInsets:", top, left, bottom, right, v11, v10, v9, v8);
}

- (BOOL)isEditing
{
  return (*(unsigned char *)&self->super._layoutFlags >> 4) & 1;
}

- (BOOL)canBeEdited
{
  return (dyld_program_sdk_at_least() & 1) != 0 || self->super._swipeActionsModule != 0;
}

- (void)_cellBackgroundOrBottomSeparatorChangedAtIndexPath:(id)a3 separatorOnly:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"UICollectionViewCompositionalLayout.m", 2027, @"Invalid parameter not satisfying: %@", @"indexPath" object file lineNumber description];
  }
  uint64_t v7 = [(UICollectionViewLayout *)self collectionView];
  double v8 = [v7 _currentUpdate];

  if (!v8)
  {
    uint64_t v9 = [v7 _collectionViewData];
    double v10 = (void *)v9;
    if (v9 && (-[UICollectionViewData _isIndexPathValid:validateItemCounts:](v9, a3, 1) & 1) != 0)
    {
      double v11 = -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", [a3 section]);
      unint64_t v12 = v11;
      if (v11)
      {
        uint64_t v13 = [v11 _callback];
        double v14 = [v13 _invalidationContextForCellBackgroundOrBottomSeparatorChangeAtIndexPath:a3 interactionState:self->_interactionStateModule separatorOnly:v4];

        if (v14)
        {
          if (!v4)
          {
            uint64_t v15 = [v7 _selectionController];
            BOOL v16 = (void *)v15;
            if (v15) {
              double v17 = (void *)[*(id *)(v15 + 8) copy];
            }
            else {
              double v17 = 0;
            }
            double v18 = [v17 allObjects];
            [v14 invalidateItemsAtIndexPaths:v18];
          }
          [(UICollectionViewCompositionalLayout *)self invalidateLayoutWithContext:v14];
        }
      }
    }
    else if (os_variant_has_internal_diagnostics())
    {
      double v23 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        double v24 = @"background";
        if (v4) {
          double v24 = @"separator";
        }
        *(_DWORD *)buf = 138412546;
        double v26 = v24;
        __int16 v27 = 2112;
        id v28 = a3;
        _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "Ignoring cell %@ change notification received for invalid index path: %@", buf, 0x16u);
      }
    }
    else
    {
      double v19 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_cellBackgroundOrBottomSeparatorChangedAtIndexPath_separatorOnly____s_category)+ 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        double v20 = @"background";
        if (v4) {
          double v20 = @"separator";
        }
        *(_DWORD *)buf = 138412546;
        double v26 = v20;
        __int16 v27 = 2112;
        id v28 = a3;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Ignoring cell %@ change notification received for invalid index path: %@", buf, 0x16u);
      }
    }
  }
}

void __74__UICollectionViewCompositionalLayout__scrollViewLayoutAdjustmentsChanged__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  objc_super v6 = [a2 _callback];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v9 = v6;
    int v8 = [v6 _shouldInvalidateForScrollViewLayoutAdjustmentsChange];
    uint64_t v7 = v9;
    if (v8)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

void __78__UICollectionViewCompositionalLayout__handlePreferredSizingDataInvalidation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 count])
  {
    id v6 = [*(id *)(a1 + 32) solver];
    -[_UICollectionCompositionalLayoutSolver invalidateCachedDecorationAttributesForElementKind:atIndexPaths:]((uint64_t)v6, a2, (uint64_t)a3);
  }
}

- (void)_handlePreferredSizingDataInvalidation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int64_t v5 = [(UICollectionViewLayout *)self collectionView];

  if (v5)
  {
    id v6 = [a3 invalidatedItemIndexPaths];
    if ([v6 count])
    {
      uint64_t v7 = [(UICollectionViewCompositionalLayout *)self solver];
      int v8 = (void *)v7;
      if (v7) {
        [*(id *)(v7 + 208) removeObjectsForKeys:v6];
      }

      if ((dyld_program_sdk_at_least() & 1) == 0)
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v9 = v6;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v20;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v20 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
              uint64_t v15 = [(UICollectionViewLayout *)self collectionView];
              BOOL v16 = [v15 cellForItemAtIndexPath:v14];

              [v16 _invalidatePreferredAttributes];
              ++v13;
            }
            while (v11 != v13);
            uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v11);
        }
      }
    }
    double v17 = [a3 invalidatedDecorationIndexPaths];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __78__UICollectionViewCompositionalLayout__handlePreferredSizingDataInvalidation___block_invoke;
    v18[3] = &unk_1E52E0A90;
    v18[4] = self;
    [v17 enumerateKeysAndObjectsUsingBlock:v18];
  }
}

- (id)_updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds
{
  kdebug_trace();
  BOOL v3 = [(UICollectionViewLayout *)self collectionView];
  [v3 visibleBounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(UICollectionViewLayout *)self collectionView];
  [v12 _contentInsetIncludingDecorations];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  long long v21 = [(UICollectionViewLayout *)self collectionView];
  long long v22 = v21;
  if (v21)
  {
    uint64_t v23 = [v21 effectiveUserInterfaceLayoutDirection];
    if (v23 == 1) {
      double v24 = v16;
    }
    else {
      double v24 = v20;
    }
    if (v23 == 1) {
      double v16 = v20;
    }
    double v20 = v24;
  }

  double v25 = [(UICollectionViewCompositionalLayout *)self solver];
  double v26 = -[_UICollectionCompositionalLayoutSolver updatePinnedSectionSupplementaryItemsForVisibleBounds:](v25, v5 + v16, v7 + v14, v9 - (v20 + v16), v11 - (v14 + v18));

  kdebug_trace();
  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dynamicsConfigurationHandler, 0);
  objc_storeStrong((id *)&self->_collectionViewTraitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_currentResolveResult, 0);
  objc_storeStrong((id *)&self->_currentUpdate, 0);
  objc_storeStrong((id *)&self->_updateVisibleCellsContext, 0);
  objc_storeStrong((id *)&self->_dataSourceSnapshotter, 0);
  objc_storeStrong((id *)&self->_solver, 0);
  objc_storeStrong(&self->_layoutSectionProvider, 0);
  objc_storeStrong((id *)&self->_layoutSectionTemplate, 0);
  objc_storeStrong((id *)&self->_interactionStateModule, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCompositionalLayout;
  double v4 = [(UICollectionViewLayout *)&v6 finalLayoutAttributesForDisappearingItemAtIndexPath:a3];
  if (v4) {
    [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule transformCellLayoutAttributes:v4 isDisappearing:1];
  }
  return v4;
}

- (id)finalLayoutAttributesForDisappearingDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewCompositionalLayout;
  double v5 = [(UICollectionViewLayout *)&v7 finalLayoutAttributesForDisappearingDecorationElementOfKind:a3 atIndexPath:a4];
  if (v5) {
    [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule transformDecorationLayoutAttributes:v5 isDisappearing:1];
  }
  return v5;
}

- (UICollectionViewCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewCompositionalLayout;
  double v8 = [(UICollectionViewLayout *)&v11 init];
  double v9 = v8;
  if (v8) {
    _UICollectionViewCompositionalLayoutCommonInit((uint64_t)v8, a3, a4, a5);
  }
  return v9;
}

- (UICollectionViewCompositionalLayout)initWithSection:(NSCollectionLayoutSection *)section
{
  v7.receiver = self;
  v7.super_class = (Class)UICollectionViewCompositionalLayout;
  double v4 = [(UICollectionViewLayout *)&v7 init];
  if (v4)
  {
    double v5 = +[UICollectionViewCompositionalLayoutConfiguration defaultConfiguration];
    _UICollectionViewCompositionalLayoutCommonInit((uint64_t)v4, section, 0, v5);
  }
  return v4;
}

- (UICollectionViewCompositionalLayout)initWithSection:(NSCollectionLayoutSection *)section configuration:(UICollectionViewCompositionalLayoutConfiguration *)configuration
{
  v9.receiver = self;
  v9.super_class = (Class)UICollectionViewCompositionalLayout;
  objc_super v6 = [(UICollectionViewLayout *)&v9 init];
  objc_super v7 = v6;
  if (v6) {
    _UICollectionViewCompositionalLayoutCommonInit((uint64_t)v6, section, 0, configuration);
  }
  return v7;
}

- (UICollectionViewCompositionalLayout)initWithLayoutSection:(id)a3
{
  double v5 = +[UICollectionViewCompositionalLayoutConfiguration defaultConfiguration];
  objc_super v6 = [(UICollectionViewCompositionalLayout *)self initWithSection:a3 sectionProvider:0 configuration:v5];

  return v6;
}

- (UICollectionViewCompositionalLayout)initWithLayoutSection:(id)a3 scrollDirection:(int64_t)a4
{
  objc_super v7 = +[UICollectionViewCompositionalLayoutConfiguration defaultConfiguration];
  [v7 setScrollDirection:a4];
  double v8 = [(UICollectionViewCompositionalLayout *)self initWithSection:a3 sectionProvider:0 configuration:v7];

  return v8;
}

- (int64_t)scrollDirection
{
  return [(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration scrollDirection];
}

- (id)boundarySupplementaryItems
{
  return [(UICollectionViewCompositionalLayoutConfiguration *)self->_configuration boundarySupplementaryItems];
}

- (void)setBoundarySupplementaryItems:(id)a3
{
  BOOL v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("CompositionalLayout", &setBoundarySupplementaryItems____s_category)
                    + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_ERROR, "Warning: this method is no longer supported - ignoring update to boundarySupplementaryItems", v4, 2u);
  }
}

- (void)_prepareForTransitionToLayout:(id)a3
{
  [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule teardown];
  swipeActionsModule = self->super._swipeActionsModule;
  self->super._swipeActionsModule = 0;

  v6.receiver = self;
  v6.super_class = (Class)UICollectionViewCompositionalLayout;
  [(UICollectionViewLayout *)&v6 _prepareForTransitionToLayout:a3];
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  double v8 = [(_UICollectionCompositionalLayoutSolver *)(uint64_t)self->_solver layoutAttributesForInteractivelyMovingItemAtIndexPath:x withTargetPosition:y];
  if (!v8)
  {
    v10.receiver = self;
    v10.super_class = (Class)UICollectionViewCompositionalLayout;
    double v8 = -[UICollectionViewLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v10, sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, a3, x, y);
  }
  return v8;
}

- (BOOL)_allowsItemInteractionsToBegin
{
  if ([(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule hasActiveSwipe]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)UICollectionViewCompositionalLayout;
  return [(UICollectionViewLayout *)&v4 _allowsItemInteractionsToBegin];
}

- (NSDirectionalEdgeInsets)_supplementaryViewInsetsForScrollingToItemAtIndexPath:(id)a3
{
  -[UICollectionViewCompositionalLayout _performDeferredResolveIfNecessary]((uint64_t)self);
  double v5 = 0.0;
  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = 0.0;
  if ([a3 item] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v24 = 0;
    double v25 = (float64x2_t *)&v24;
    uint64_t v26 = 0x4010000000;
    __int16 v27 = &unk_186D7DBA7;
    long long v28 = 0u;
    long long v29 = 0u;
    solver = self->_solver;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __93__UICollectionViewCompositionalLayout__supplementaryViewInsetsForScrollingToItemAtIndexPath___block_invoke;
    v23[3] = &unk_1E52E08D8;
    v23[4] = a3;
    v23[5] = &v24;
    -[_UICollectionCompositionalLayoutSolver enumeratePinnedSupplementaryItems:]((uint64_t)solver, (uint64_t)v23);
    double v6 = v25[2].f64[1];
    if (v6 != 0.0
      || (double v5 = v25[2].f64[0], v5 != 0.0)
      || (double v8 = v25[3].f64[1], v8 != 0.0)
      || (double v7 = v25[3].f64[0], v7 != 0.0))
    {
      objc_super v10 = -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", [a3 section]);
      if ([v10 _pinnedSupplementariesShouldOverlap])
      {
        objc_super v11 = [(UICollectionViewLayout *)self collectionView];
        [v11 _currentScreenScale];
        double v13 = v12;
        uint64_t v14 = [a3 item];
        double v16 = 1.0 / v13;
        if (!v14) {
          v25[2] = vsubq_f64(v25[2], (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v16, 0));
        }
        uint64_t v17 = objc_msgSend(a3, "item", *(void *)&v16, v15);
        if (v17 == objc_msgSend(v11, "numberOfItemsInSection:", objc_msgSend(a3, "section")) - 1) {
          v25[3] = vsubq_f64(v25[3], (float64x2_t)vdupq_lane_s64(v22, 0));
        }
      }
      double v5 = v25[2].f64[0];
      double v6 = v25[2].f64[1];
      double v7 = v25[3].f64[0];
      double v8 = v25[3].f64[1];
    }
    _Block_object_dispose(&v24, 8);
  }
  double v18 = v5;
  double v19 = v6;
  double v20 = v7;
  double v21 = v8;
  result.trailing = v21;
  result.double bottom = v20;
  result.leading = v19;
  result.double top = v18;
  return result;
}

void __93__UICollectionViewCompositionalLayout__supplementaryViewInsetsForScrollingToItemAtIndexPath___block_invoke(uint64_t a1, id *a2, void *a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) section];
  double v7 = [a3 indexPath];
  uint64_t v8 = [v7 section];

  if (v6 != v8) {
    return;
  }
  double v21 = -[_UICollectionLayoutFramesQueryResult supplementaryItem](a2);
  int v9 = [v21 extendsBoundary];
  objc_super v10 = v21;
  if (v9)
  {
    objc_super v11 = [v21 containerAnchor];
    char v12 = [v11 edges];

    if (v12)
    {
      double v17 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32);
      [a3 frame];
      double Height = CGRectGetHeight(v25);
      if (v17 >= Height) {
        double Height = v17;
      }
      *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = Height;
      if ((v12 & 4) == 0)
      {
LABEL_5:
        if ((v12 & 2) == 0)
        {
LABEL_9:
          objc_super v10 = v21;
          if ((v12 & 8) != 0)
          {
            double v15 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56);
            [a3 frame];
            double Width = CGRectGetWidth(v24);
            objc_super v10 = v21;
            if (v15 >= Width) {
              double Width = v15;
            }
            *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56) = Width;
          }
          goto LABEL_13;
        }
LABEL_6:
        double v13 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        [a3 frame];
        double v14 = CGRectGetWidth(v23);
        if (v13 >= v14) {
          double v14 = v13;
        }
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v14;
        goto LABEL_9;
      }
    }
    else if ((v12 & 4) == 0)
    {
      goto LABEL_5;
    }
    double v19 = *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
    [a3 frame];
    double v20 = CGRectGetHeight(v26);
    if (v19 >= v20) {
      double v20 = v19;
    }
    *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48) = v20;
    if ((v12 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_6;
  }
LABEL_13:
}

- (CGRect)_frameForScrollingToFirstElementInSectionAtIndex:(int64_t)a3
{
  double v5 = [(UICollectionViewCompositionalLayout *)self dataSourceSnapshotter];
  int64_t v6 = [v5 numberOfSections];

  if (v6 <= a3)
  {
    v61.receiver = self;
    v61.super_class = (Class)UICollectionViewCompositionalLayout;
    [(UICollectionViewLayout *)&v61 _frameForScrollingToFirstElementInSectionAtIndex:a3];
    double v17 = v33;
    double v19 = v34;
    CGFloat v21 = v35;
    CGFloat v23 = v36;
  }
  else
  {
    double v7 = [(UICollectionViewCompositionalLayout *)self _layoutSectionForSectionIndex:a3];
    uint64_t v55 = 0;
    BOOL v56 = &v55;
    uint64_t v57 = 0x3032000000;
    unint64_t v58 = __Block_byref_object_copy__28;
    CGPoint v59 = __Block_byref_object_dispose__28;
    id v60 = 0;
    uint64_t v8 = [(UICollectionViewCompositionalLayout *)self _layoutAxis];
    int v9 = [v7 boundarySupplementaryItems];
    objc_super v10 = v9;
    uint64_t v11 = 3;
    if (v8 == 2) {
      uint64_t v11 = 1;
    }
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __88__UICollectionViewCompositionalLayout__frameForScrollingToFirstElementInSectionAtIndex___block_invoke;
    v54[3] = &unk_1E52E0900;
    v54[4] = &v55;
    v54[5] = v11;
    [v9 enumerateObjectsUsingBlock:v54];

    char v12 = (void *)v56[5];
    if (v12)
    {
      double v13 = [v12 elementKind];
      double v14 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a3];
      double v15 = [(UICollectionViewCompositionalLayout *)self layoutAttributesForSupplementaryViewOfKind:v13 atIndexPath:v14];
      [v15 frame];
      double v17 = v16;
      double v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      if ([(id)v56[5] pinToVisibleBounds]
        && [v7 _pinnedSupplementariesShouldOverlap])
      {
        if (v15 && (v15[144] & 0x800) != 0)
        {
          CGRect v24 = [(UICollectionViewCompositionalLayout *)self solver];
          double v17 = -[_UICollectionCompositionalLayoutSolver unpinnedFrameOfBoundarySupplementaryElementOfKind:withIndexPath:](v24, v13, v14);
          double v19 = v25;
          CGFloat v21 = v26;
          CGFloat v23 = v27;
        }
        v62.origin.double x = v17;
        v62.origin.double y = v19;
        v62.size.double width = v21;
        v62.size.double height = v23;
        if (!CGRectIsNull(v62))
        {
          long long v28 = [(UICollectionViewLayout *)self collectionView];

          if (v28)
          {
            long long v29 = [(UICollectionViewLayout *)self collectionView];
            [v29 _currentScreenScale];
            double v31 = v30;

            double v17 = v17
                + _UISetPointValueForAxis(v8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 1.0 / v31);
            double v19 = v19 + v32;
          }
        }
      }
    }
    else
    {
      UIEdgeInsets v37 = [(UICollectionViewCompositionalLayout *)self dataSourceSnapshotter];
      uint64_t v38 = [v37 numberOfItemsInSection:a3];

      if (v38 < 1)
      {
        v53.receiver = self;
        v53.super_class = (Class)UICollectionViewCompositionalLayout;
        [(UICollectionViewLayout *)&v53 _frameForScrollingToFirstElementInSectionAtIndex:a3];
        double v17 = v45;
        double v19 = v46;
        CGFloat v21 = v47;
        CGFloat v23 = v48;
      }
      else
      {
        v39 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:a3];
        uint64_t v40 = [(UICollectionViewCompositionalLayout *)self layoutAttributesForItemAtIndexPath:v39];

        [v40 frame];
        double v17 = v41;
        double v19 = v42;
        CGFloat v21 = v43;
        CGFloat v23 = v44;
      }
    }
    _Block_object_dispose(&v55, 8);
  }
  double v49 = v17;
  double v50 = v19;
  double v51 = v21;
  double v52 = v23;
  result.size.double height = v52;
  result.size.double width = v51;
  result.origin.double y = v50;
  result.origin.double x = v49;
  return result;
}

void __88__UICollectionViewCompositionalLayout__frameForScrollingToFirstElementInSectionAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if ((*(void *)(a1 + 40) & ~[a2 alignment]) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (CGPoint)_targetPositionForInteractiveMovementOfItemAtIndexPath:(id)a3 withProposedTargetPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = -[UICollectionViewCompositionalLayout _layoutSectionForSectionIndex:](self, "_layoutSectionForSectionIndex:", [a3 section]);
  int v9 = v8;
  if (v8 && [v8 shouldRestrictOrthogonalAxisDuringInteractiveMovement])
  {
    objc_super v10 = -[_UICollectionCompositionalLayoutSolver layoutAttributesForItemAtIndexPath:]((uint64_t)self->_solver, (CGFloat *)a3);
    unint64_t v11 = [(UICollectionViewCompositionalLayout *)self _layoutAxis];
    if (v11 == 1) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = v11 == 2;
    }
    [v10 center];
    double v15 = _UIPointValueForAxis(v12, v13, v14);
    double x = _UISetPointValueForAxis(v12, x, y, v15);
    double y = v16;
  }
  double v17 = x;
  double v18 = y;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (void)_resolveImmediatelyForInvalidationWithContext:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (([a3 invalidateEverything] & 1) == 0
    && ([a3 _intent] == 3
     || ![a3 _intent]
     || [a3 _intent] == 2
     || [a3 _intent] == 7
     || (*(unsigned char *)&self->_compositionalLayoutFlags & 4) != 0))
  {
    [a3 _setInvalidateEverything:1];
  }
  if ((*(unsigned char *)&self->_compositionalLayoutFlags & 4) != 0)
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UICollectionLayout", &_resolveImmediatelyForInvalidationWithContext____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      double v13 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        double v14 = v13;
        double v15 = [(UICollectionViewLayout *)self collectionView];
        double v16 = _UICollectionViewLayoutInvalidationContextIntentDescription([a3 _intent]);
        double v17 = [(UICollectionViewLayout *)self collectionView];
        [v17 _effectiveContentInset];
        double v18 = NSStringFromUIEdgeInsets(v26);
        int v19 = 134218498;
        double v20 = v15;
        __int16 v21 = 2112;
        double v22 = v16;
        __int16 v23 = 2112;
        CGRect v24 = v18;
        _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "_resolveImmediatelyIfNecessary: cv==%p; intent == %@; effectiveContentInsets == %@; Performing full resolve si"
          "nce forceFullResolveForNextSolve is set.",
          (uint8_t *)&v19,
          0x20u);
      }
    }
    goto LABEL_13;
  }
  if ([a3 _intent] == 2)
  {
    uint64_t v5 = [(UICollectionViewCompositionalLayout *)self _boundsChangeResolve];
    [a3 _setInvalidateEverything:1];
    if (!v5) {
      goto LABEL_31;
    }
    goto LABEL_17;
  }
  if ([a3 _intent] == 7)
  {
    uint64_t v7 = [(UICollectionViewCompositionalLayout *)self _marginsChangeResolve];
    goto LABEL_16;
  }
  if ([a3 _intent] == 9)
  {
    [(UICollectionViewCompositionalLayout *)self _handleSwipeActionsInvalidationWithContext:a3];
    goto LABEL_31;
  }
  uint64_t v10 = [(UICollectionViewCompositionalLayout *)self currentUpdate];
  if (v10)
  {
    unint64_t v11 = (void *)v10;
    uint64_t v12 = [a3 _intent];

    if (v12 == 8)
    {
      uint64_t v7 = [(UICollectionViewCompositionalLayout *)self _updateResolve];
      goto LABEL_16;
    }
  }
  if ([a3 _intent] == 10)
  {
    [(UICollectionViewCompositionalLayout *)self _handlePreferredSizingDataInvalidation:a3];
    goto LABEL_31;
  }
  if ([a3 _intent] == 11)
  {
    [(UICollectionViewCompositionalLayout *)self _handleEndInteractiveReorderingWithContext:a3];
    goto LABEL_31;
  }
  if ([a3 _intent] != 13)
  {
    if (([a3 invalidateEverything] & 1) == 0) {
      goto LABEL_31;
    }
LABEL_13:
    [(UICollectionViewCompositionalLayout *)self _fullResolve];
    [(UICollectionViewCompositionalLayout *)self _solveForPinnedSupplementaryItemsIfNeededWithContext:a3];
    goto LABEL_18;
  }
  uint64_t v7 = [(UICollectionViewCompositionalLayout *)self _scrollViewAdjustmentsChangeResolve];
LABEL_16:
  uint64_t v5 = v7;
  if (!v7)
  {
LABEL_31:
    [(UICollectionViewCompositionalLayout *)self _solveForPinnedSupplementaryItemsIfNeededWithContext:a3];
    goto LABEL_32;
  }
LABEL_17:
  objc_msgSend(a3, "setContentOffsetAdjustment:", *(double *)(v5 + 48), *(double *)(v5 + 56));
  [a3 _setShouldInvalidateCollectionViewContentSize:1];
  int v8 = *(unsigned __int8 *)(v5 + 40);

  [(UICollectionViewCompositionalLayout *)self _solveForPinnedSupplementaryItemsIfNeededWithContext:a3];
  if (!v8)
  {
LABEL_32:
    uint64_t v9 = 0;
    goto LABEL_33;
  }
LABEL_18:
  [(UICollectionViewCompositionalLayout *)self _updateCollectionViewBackgroundColor];
  uint64_t v9 = 1;
LABEL_33:
  [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule processLayoutInvalidationWithContext:a3 updateConfigurations:v9];
}

- (id)invalidationContextForPreferredLayoutAttributes:(id)a3 withOriginalAttributes:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  [(UICollectionView *)self->super._collectionView _visibleBounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v17[0] = a3;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  double v15 = -[UICollectionViewCompositionalLayout _preferredAttributesResolveWithInvalidatedPreferredAttributes:layoutOffset:visibleRect:](self, "_preferredAttributesResolveWithInvalidatedPreferredAttributes:layoutOffset:visibleRect:", v14, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v7, v9, v11, v13);

  return v15;
}

- (CGRect)_contentFrameForSection:(int64_t)a3
{
  BOOL v3 = [(UICollectionViewCompositionalLayout *)self _sectionDescriptorForSectionIndex:a3];
  objc_super v4 = (double *)MEMORY[0x1E4F1DB20];
  uint64_t v5 = (double *)(MEMORY[0x1E4F1DB20] + 24);
  double v6 = (double *)(MEMORY[0x1E4F1DB20] + 16);
  double v7 = (double *)(MEMORY[0x1E4F1DB20] + 8);
  if (v3)
  {
    objc_super v4 = v3 + 18;
    double v7 = v3 + 19;
    double v6 = v3 + 20;
    uint64_t v5 = v3 + 21;
  }
  double v8 = *v5;
  double v9 = *v6;
  double v10 = *v7;
  double v11 = *v4;

  double v12 = v11;
  double v13 = v10;
  double v14 = v9;
  double v15 = v8;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)_wantsCustomSectionContainers
{
  double v2 = [(UICollectionViewCompositionalLayout *)self solver];
  if (v2) {
    BOOL v3 = v2[14] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)_disallowsFadeCellsForBoundsChange
{
  return 1;
}

- (BOOL)_wantsBandSelectionVisualsInSection:(int64_t)a3
{
  uint64_t v5 = [(UICollectionViewCompositionalLayout *)self _layoutSectionForSectionIndex:"_layoutSectionForSectionIndex:"];
  double v6 = v5;
  if (v5)
  {
    unsigned __int8 v7 = [v5 _wantsBandSelectionVisuals];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UICollectionViewCompositionalLayout;
    unsigned __int8 v7 = [(UICollectionViewLayout *)&v10 _wantsBandSelectionVisualsInSection:a3];
  }
  BOOL v8 = v7;

  return v8;
}

- (BOOL)_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionInSection:(int64_t)a3
{
  BOOL v3 = [(UICollectionViewCompositionalLayout *)self _layoutSectionForSectionIndex:a3];
  char v4 = [v3 shouldRestrictOrthogonalAxisDuringInteractiveMovement] ^ 1;

  return v4;
}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained invalidateLayoutWithContext:a2];
    id WeakRetained = v4;
  }
}

void __51__UICollectionViewCompositionalLayout__fullResolve__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, int a6)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v12 = WeakRetained;
    UICollectionViewCompositionalLayoutAlertForInvalidLayout(WeakRetained, a2, a3, a4, a5, a6);
    id WeakRetained = v12;
  }
}

- (void)_handleEndInteractiveReorderingWithContext:(id)a3
{
  if (!a3)
  {
    BOOL v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UICollectionViewCompositionalLayout.m", 1578, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  id v9 = [a3 targetIndexPathsForInteractivelyMovingItems];
  objc_msgSend(a3, "invalidateItemsAtIndexPaths:");
  uint64_t v5 = [(UICollectionViewCompositionalLayout *)self solver];
  double v6 = (void *)v5;
  if (v5) {
    [*(id *)(v5 + 208) removeObjectsForKeys:v9];
  }
}

- (id)_sectionDefinitionsUpdateResolve
{
  BOOL v3 = [(UICollectionViewLayout *)self collectionView];
  if (v3)
  {
    kdebug_trace();
    [v3 bounds];
    -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedCollectionViewBounds:](self, "setMemoizedPreviousSolvedCollectionViewBounds:");
    id v4 = [(UICollectionViewCompositionalLayout *)self _containerFromCollectionView];
    uint64_t v5 = [(UICollectionViewCompositionalLayout *)self solver];
    double v6 = -[_UICollectionCompositionalLayoutSolver resolveForUpdatingSectionDefinitionsWithContainer:](v5, v4);

    [(UICollectionViewCompositionalLayout *)self _computeAndUpdateAdjustedContentFrame];
    [v3 visibleBounds];
    id v7 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
    kdebug_trace();
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_marginsChangeResolve
{
  BOOL v3 = [(UICollectionViewLayout *)self collectionView];
  if (v3)
  {
    kdebug_trace();
    [v3 bounds];
    -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedCollectionViewBounds:](self, "setMemoizedPreviousSolvedCollectionViewBounds:");
    id v4 = [(UICollectionViewCompositionalLayout *)self _containerFromCollectionView];
    uint64_t v5 = [(UICollectionViewCompositionalLayout *)self solver];
    double v6 = -[_UICollectionCompositionalLayoutSolver resolveForMarginsChange:]((uint64_t)v5, v4);

    [(UICollectionViewCompositionalLayout *)self _computeAndUpdateAdjustedContentFrame];
    [v3 visibleBounds];
    id v7 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
    id v8 = [(UICollectionViewCompositionalLayout *)self _updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds];
    kdebug_trace();
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_scrollViewAdjustmentsChangeResolve
{
  BOOL v3 = [(UICollectionViewLayout *)self collectionView];
  if (v3)
  {
    kdebug_trace();
    [v3 bounds];
    -[UICollectionViewCompositionalLayout setMemoizedPreviousSolvedCollectionViewBounds:](self, "setMemoizedPreviousSolvedCollectionViewBounds:");
    id v4 = [(UICollectionViewCompositionalLayout *)self _containerFromCollectionView];
    uint64_t v5 = [(UICollectionViewCompositionalLayout *)self solver];
    double v6 = -[_UICollectionCompositionalLayoutSolver resolveForScrollViewLayoutAdjustmentsChange:](v5, v4);

    [(UICollectionViewCompositionalLayout *)self _computeAndUpdateAdjustedContentFrame];
    [v3 visibleBounds];
    id v7 = -[UICollectionViewCompositionalLayout _invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:](self, "_invokeVisibleItemsInvalidationHandlerIfNeededForVisibleBounds:");
    id v8 = [(UICollectionViewCompositionalLayout *)self _updatePinnedSectionSupplementaryItemsForCurrentVisibleBounds];
    kdebug_trace();
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (void)_handleSwipeActionsInvalidationWithContext:(id)a3
{
  uint64_t v5 = [(UICollectionViewLayout *)self collectionView];

  if (v5)
  {
    double v6 = [a3 invalidatedItemIndexPaths];
    if ([v6 count])
    {
      uint64_t v7 = [(UICollectionViewCompositionalLayout *)self solver];
      id v8 = (void *)v7;
      if (v7) {
        [*(id *)(v7 + 208) removeObjectsForKeys:v6];
      }
    }
    id v9 = [a3 invalidatedDecorationIndexPaths];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__UICollectionViewCompositionalLayout__handleSwipeActionsInvalidationWithContext___block_invoke;
    v10[3] = &unk_1E52E0A90;
    v10[4] = self;
    [v9 enumerateKeysAndObjectsUsingBlock:v10];
  }
}

void __82__UICollectionViewCompositionalLayout__handleSwipeActionsInvalidationWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = [*(id *)(a1 + 32) solver];
  -[_UICollectionCompositionalLayoutSolver invalidateCachedDecorationAttributesForElementKind:atIndexPaths:]((uint64_t)v5, a2, a3);
}

- (BOOL)_invokeVisibleBoundsUpdateForDynamicAnimatorForNewVisibleBounds:(CGRect)a3 preparingLayout:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4
    || (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_memoizedDynamicAnimatorWorldAdjustingInsets.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_memoizedDynamicAnimatorWorldAdjustingInsets.bottom))))) & 1) == 0)
  {
    p_memoizedDynamicAnimatorWorldAdjustingInsets = &self->_memoizedDynamicAnimatorWorldAdjustingInsets;
    CGFloat v10 = CGRectGetHeight(a3) * -2.0;
    v44.origin.double x = x;
    v44.origin.double y = y;
    v44.size.double width = width;
    v44.size.double height = height;
    CGFloat v11 = CGRectGetWidth(v44) * -2.0;
    v45.origin.double x = x;
    v45.origin.double y = y;
    v45.size.double width = width;
    v45.size.double height = height;
    CGFloat v12 = CGRectGetHeight(v45) * -2.0;
    v46.origin.double x = x;
    v46.origin.double y = y;
    v46.size.double width = width;
    v46.size.double height = height;
    CGFloat v13 = CGRectGetWidth(v46);
    p_memoizedDynamicAnimatorWorldAdjustingInsets->double top = v10;
    p_memoizedDynamicAnimatorWorldAdjustingInsets->double left = v11;
    p_memoizedDynamicAnimatorWorldAdjustingInsets->double bottom = v12;
    p_memoizedDynamicAnimatorWorldAdjustingInsets->double right = v13 * -2.0;
    double v14 = [(UICollectionViewLayout *)self collectionView];
    [v14 _visibleRectEdgeInsets];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    if (v18 == 0.0 && v16 == 0.0 && v22 == 0.0 && v20 == 0.0)
    {
      __int16 v23 = [(UICollectionViewLayout *)self collectionView];
      objc_msgSend(v23, "_setVisibleRectEdgeInsets:", p_memoizedDynamicAnimatorWorldAdjustingInsets->top, p_memoizedDynamicAnimatorWorldAdjustingInsets->left, p_memoizedDynamicAnimatorWorldAdjustingInsets->bottom, p_memoizedDynamicAnimatorWorldAdjustingInsets->right);
    }
  }
  CGRect v24 = [(UICollectionViewLayout *)self collectionView];
  [v24 _visibleBounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  double v33 = [(UICollectionViewLayout *)self collectionView];
  objc_msgSend(v33, "_effectiveVisibleBoundsForBounds:", x, y, width, height);
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  double v39 = v38;
  double v41 = v40;

  double v42 = [(UICollectionViewCompositionalLayout *)self solver];
  LOBYTE(v33) = -[_UICollectionCompositionalLayoutSolver updateVisibleBoundsForDynamicAnimator:previousVisibleBounds:]((uint64_t)v42, v35, v37, v39, v41, v26, v28, v30, v32);

  return (char)v33;
}

- (void)_setOffset:(CGPoint)a3 forOrthogonalScrollingSection:(int64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [(UICollectionViewCompositionalLayout *)self solver];
  [(_UICollectionCompositionalLayoutSolver *)(uint64_t)v7 setOrthogonalOffset:x forSection:y];
}

- (unint64_t)_orthogonalScrollingAxis
{
  double v2 = [(UICollectionViewCompositionalLayout *)self solver];
  if (v2)
  {
    uint64_t v3 = v2[8];
    if (v3 == 1) {
      unint64_t v4 = 2;
    }
    else {
      unint64_t v4 = v3 == 2;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_orthogonalScrollingElementShouldAppearAboveForAttributes:(id)a3
{
  unint64_t v4 = [(UICollectionViewCompositionalLayout *)self solver];
  LOBYTE(a3) = -[_UICollectionCompositionalLayoutSolver elementShouldAppearAboveOrthogonalScrollingContainer:]((uint64_t)v4, (uint64_t)a3);

  return (char)a3;
}

- (void)setEditing:(BOOL)a3
{
  char layoutFlags = (char)self->super._layoutFlags;
  if (((((layoutFlags & 0x10) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 16;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->super._char layoutFlags = layoutFlags & 0xEF | v4;
    [(_UICollectionViewLayoutSwipeActionsModule *)self->super._swipeActionsModule editingStateDidChange];
  }
}

- (BOOL)_supportsSwipeActionsForIndexPath:(id)a3
{
  char v4 = [(UICollectionViewCompositionalLayout *)self solver];
  LOBYTE(a3) = -[_UICollectionCompositionalLayoutSolver _supportsSwipeActionsForIndexPath:]((uint64_t)v4, a3);

  return (char)a3;
}

- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3
{
  char v4 = [(UICollectionViewCompositionalLayout *)self solver];
  id v5 = -[_UICollectionCompositionalLayoutSolver _leadingSwipeActionsConfigurationForIndexPath:]((uint64_t)v4, a3);

  return v5;
}

- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3
{
  char v4 = [(UICollectionViewCompositionalLayout *)self solver];
  id v5 = -[_UICollectionCompositionalLayoutSolver _trailingSwipeActionsConfigurationForIndexPath:]((uint64_t)v4, a3);

  return v5;
}

- (void)_updateStyleForSwipeActionsConfiguration:(id)a3 indexPath:(id)a4
{
  id v6 = [(UICollectionViewCompositionalLayout *)self solver];
  -[_UICollectionCompositionalLayoutSolver _updateStyleForSwipeActionsConfiguration:indexPath:]((uint64_t)v6, (uint64_t)a3, a4);
}

- (void)_willBeginSwiping
{
  id v2 = [(UICollectionViewCompositionalLayout *)self solver];
  -[_UICollectionCompositionalLayoutSolver _willBeginSwiping]((uint64_t)v2);
}

- (void)_didEndSwiping
{
  id v2 = [(UICollectionViewCompositionalLayout *)self solver];
  -[_UICollectionCompositionalLayoutSolver _didEndSwiping]((uint64_t)v2);
}

- (id)_sectionsDescription
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"Sections for %@:", self];
  solver = self->_solver;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__UICollectionViewCompositionalLayout__sectionsDescription__block_invoke;
  v7[3] = &unk_1E52E0A68;
  id v5 = v3;
  id v8 = v5;
  -[_UICollectionCompositionalLayoutSolver enumerateSectionDefinitionsWithBlock:]((uint64_t)solver, (uint64_t)v7);

  return v5;
}

uint64_t __59__UICollectionViewCompositionalLayout__sectionsDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"\n\t[Section %ld: %@]", a3, a2];
}

- (NSCollectionLayoutSection)layoutSectionTemplate
{
  return self->_layoutSectionTemplate;
}

- (void)setLayoutSectionTemplate:(id)a3
{
}

- (void)setLayoutSectionProvider:(id)a3
{
}

- (UIEdgeInsets)memoizedDynamicAnimatorWorldAdjustingInsets
{
  double top = self->_memoizedDynamicAnimatorWorldAdjustingInsets.top;
  double left = self->_memoizedDynamicAnimatorWorldAdjustingInsets.left;
  double bottom = self->_memoizedDynamicAnimatorWorldAdjustingInsets.bottom;
  double right = self->_memoizedDynamicAnimatorWorldAdjustingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMemoizedDynamicAnimatorWorldAdjustingInsets:(UIEdgeInsets)a3
{
  self->_memoizedDynamicAnimatorWorldAdjustingInsets = a3;
}

- (UIEdgeInsets)memoizedPreviousLayoutMargins
{
  double top = self->_memoizedPreviousLayoutMargins.top;
  double left = self->_memoizedPreviousLayoutMargins.left;
  double bottom = self->_memoizedPreviousLayoutMargins.bottom;
  double right = self->_memoizedPreviousLayoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMemoizedPreviousLayoutMargins:(UIEdgeInsets)a3
{
  self->_memoizedPreviousLayoutMargins = a3;
}

- (unint64_t)edgesForSafeAreaPropagation
{
  return self->_edgesForSafeAreaPropagation;
}

- (void)setEdgesForSafeAreaPropagation:(unint64_t)a3
{
  self->_edgesForSafeAreaPropagation = a3;
}

- (_UIUpdateVisibleCellsContext)updateVisibleCellsContext
{
  return self->_updateVisibleCellsContext;
}

- (void)setUpdateVisibleCellsContext:(id)a3
{
}

- (void)setLayoutRTL:(BOOL)a3
{
  self->_layoutRTL = a3;
}

- (void)setRoundsToScreenScale:(BOOL)a3
{
  self->_roundsToScreenScale = a3;
}

- (void)setDynamicsConfigurationHandler:(id)a3
{
}

uint64_t __98__UICollectionViewCompositionalLayout_UICollectionLayoutListSection__layoutWithListConfiguration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [off_1E52D2B28 sectionWithListConfiguration:*(void *)(a1 + 32) layoutEnvironment:a3];
}

@end