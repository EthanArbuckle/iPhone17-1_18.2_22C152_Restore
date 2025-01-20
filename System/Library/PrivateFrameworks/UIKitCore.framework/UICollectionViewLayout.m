@interface UICollectionViewLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (BOOL)_allowsItemInteractionsToBegin;
- (BOOL)_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionInSection:(int64_t)a3;
- (BOOL)_cellsShouldConferWithAutolayoutEngineForSizingInfo;
- (BOOL)_disablesDoubleSidedAnimations;
- (BOOL)_disallowsFadeCellsForBoundsChange;
- (BOOL)_estimatesSizes;
- (BOOL)_estimatesSupplementaryItems;
- (BOOL)_hasOrthogonalScrollingSections;
- (BOOL)_initialAppearingLayoutAttributesCanBeOverriddenForEstimatedSizing;
- (BOOL)_isInLayoutTransition;
- (BOOL)_isPrepared;
- (BOOL)_needsRecomputeOfPreferredAttributesForVisibleEstimatedItemsDuringUpdate;
- (BOOL)_orthogonalScrollingElementShouldAppearAboveForAttributes:(id)a3;
- (BOOL)_orthogonalScrollingElementShouldAppearBelowForAttributes:(id)a3;
- (BOOL)_overridesSafeAreaPropagationToDescendants;
- (BOOL)_shouldAddElementToSectionContainer:(id)a3;
- (BOOL)_shouldAdjustTargetContentOffsetToValidateContentExtents;
- (BOOL)_shouldInvalidateLayoutForDataSourceChange;
- (BOOL)_shouldInvalidateLayoutForUpdatedLayoutMargins:(UIEdgeInsets)a3 fromOldMargins:(UIEdgeInsets)a4;
- (BOOL)_shouldInvalidateLayoutForUpdatedSafeAreaInsets:(UIEdgeInsets)a3 fromOldInsets:(UIEdgeInsets)a4;
- (BOOL)_shouldOrthogonalScrollingSectionDecorationScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4;
- (BOOL)_shouldOrthogonalScrollingSectionSupplementaryScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4;
- (BOOL)_shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:(BOOL)a3;
- (BOOL)_shouldScrollToContentBeginningInRightToLeft;
- (BOOL)_supportsAdvancedTransitionAnimations;
- (BOOL)_supportsPrefetchingWithEstimatedSizes;
- (BOOL)_supportsSwipeActionsForIndexPath:(id)a3;
- (BOOL)_wantsAnimationsForOffscreenAuxillaries;
- (BOOL)_wantsBandSelectionVisualsInSection:(int64_t)a3;
- (BOOL)_wantsCustomSectionContainers;
- (BOOL)_wantsInvalidateLayoutForPreferredLayoutAttributes;
- (BOOL)_wantsRightToLeftHorizontalMirroringIfNeeded;
- (BOOL)_wantsUntrackedAnimationCleanupForAuxillaryItems;
- (BOOL)_wantsUpdateVisibleCellsPassNotifications;
- (BOOL)canBeEdited;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)isEditing;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds;
- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes;
- (CGPoint)_layoutOffset;
- (CGPoint)_offsetForOrthogonalScrollingSection:(int64_t)a3;
- (CGPoint)_offsetInTopParentLayout:(id *)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset;
- (CGRect)_centerInsertionIndicatorFrame:(CGRect)a3 targetAttributes:(id)a4 axis:(unint64_t)a5 edges:(unint64_t)a6;
- (CGRect)_contentFrameForSection:(int64_t)a3;
- (CGRect)_dynamicReferenceBounds;
- (CGRect)_frame;
- (CGRect)_frameForInsertionIndicatorForTargetFrame:(CGRect)a3 axis:(unint64_t)a4 edges:(unint64_t)a5;
- (CGRect)_frameForScrollingToFirstElementInSectionAtIndex:(int64_t)a3;
- (CGRect)_layoutFrameForSection:(int64_t)a3;
- (CGRect)_orthogonalScrollingContentRectForSection:(int64_t)a3;
- (CGRect)_orthogonalScrollingLayoutRectForSection:(int64_t)a3;
- (CGRect)bounds;
- (CGRect)convertRect:(CGRect)a3 fromLayout:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toLayout:(id)a4;
- (CGSize)_fallbackItemSize;
- (CGSize)collectionViewContentSize;
- (NSArray)_elementKinds;
- (NSArray)layoutAttributesForElementsInRect:(CGRect)rect;
- (NSDirectionalEdgeInsets)_supplementaryViewInsetsForScrollingToItemAtIndexPath:(id)a3;
- (NSIndexPath)targetIndexPathForInteractivelyMovingItem:(NSIndexPath *)previousIndexPath withPosition:(CGPoint)position;
- (NSIndexSet)_items;
- (NSIndexSet)_sections;
- (UICollectionView)collectionView;
- (UICollectionViewLayout)_siblingLayout;
- (UICollectionViewLayout)init;
- (UICollectionViewLayout)initWithCoder:(NSCoder *)coder;
- (UICollectionViewLayoutAttributes)finalLayoutAttributesForDisappearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath;
- (UICollectionViewLayoutAttributes)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath;
- (UICollectionViewLayoutAttributes)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath;
- (UICollectionViewLayoutAttributes)initialLayoutAttributesForAppearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath;
- (UICollectionViewLayoutAttributes)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath;
- (UICollectionViewLayoutAttributes)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath;
- (UICollectionViewLayoutAttributes)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewLayoutAttributes)layoutAttributesForInteractivelyMovingItemAtIndexPath:(NSIndexPath *)indexPath withTargetPosition:(CGPoint)position;
- (UICollectionViewLayoutAttributes)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewLayoutAttributes)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath;
- (UICollectionViewLayoutInvalidationContext)invalidationContextForBoundsChange:(CGRect)newBounds;
- (UICollectionViewLayoutInvalidationContext)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(NSArray *)indexPaths previousIndexPaths:(NSArray *)previousIndexPaths movementCancelled:(BOOL)movementCancelled;
- (UICollectionViewLayoutInvalidationContext)invalidationContextForInteractivelyMovingItems:(NSArray *)targetIndexPaths withTargetPosition:(CGPoint)targetPosition previousIndexPaths:(NSArray *)previousIndexPaths previousPosition:(CGPoint)previousPosition;
- (UICollectionViewLayoutInvalidationContext)invalidationContextForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes;
- (UIColor)_preferredBackgroundColor;
- (UIEdgeInsets)_focusFastScrollingIndexBarInsets;
- (UIEdgeInsets)_preferredLayoutMargins;
- (UIUserInterfaceLayoutDirection)developmentLayoutDirection;
- (_UICollectionViewAnimationContext)_collectionViewAnimationContext;
- (_UICollectionViewCompositionLayout)_compositionLayout;
- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4;
- (id)_customContainerSectionIndexes;
- (id)_decorationViewForLayoutAttributes:(id)a3;
- (id)_dynamicAnimator;
- (id)_finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)_indexPathForInsertionIndicatorForTargetAttributes:(id)a3 axis:(unint64_t)a4 edges:(unint64_t)a5 previousAttributes:(id)a6 nextAttributes:(id)a7;
- (id)_indexPathsToDeleteForDecorationViewOfKind:(id)a3;
- (id)_indexPathsToDeleteForSupplementaryViewOfKind:(id)a3;
- (id)_indexPathsToInsertForDecorationViewOfKind:(id)a3;
- (id)_indexPathsToInsertForSupplementaryViewOfKind:(id)a3;
- (id)_initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)_invalidationContextForBoundsChange:(CGRect)a3 fromOldBounds:(CGRect)a4;
- (id)_invalidationContextForRefreshingVisibleElementAttributes;
- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3;
- (id)_layoutAttributesForElementsInProjectedRect:(CGRect)a3 withProjectionVector:(CGVector)a4 projectionDistance:(double)a5;
- (id)_layoutAttributesForIndelibleElements;
- (id)_layoutAttributesForInsertionIndicatorAtItemWithTargetAttributes:(id)a3 targetPositionEdges:(unint64_t)a4;
- (id)_layoutAttributesForInsertionIndicatorAtTargetIndexPath:(id)a3;
- (id)_layoutAttributesForInsertionIndicatorAtTargetPosition:(CGPoint)a3 sourceIndexPath:(id)a4;
- (id)_layoutAttributesForItemNearestPosition:(CGPoint)a3 maximumDistance:(double)a4;
- (id)_layoutAttributesForNextItemInDirection:(CGPoint)a3 fromIndexPath:(id)a4 constrainedToRect:(CGRect)a5;
- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3;
- (id)_nextLayoutAttributesForGlobalIndex:(int64_t)a3;
- (id)_orthogonalScrollingSections;
- (id)_previousLayoutAttributesForGlobalIndex:(int64_t)a3;
- (id)_propertyAnimatorForCollectionViewUpdates:(id)a3 withCustomAnimator:(id)a4;
- (id)_sectionDescriptorForSectionIndex:(int64_t)a3;
- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3;
- (id)snapshottedLayoutAttributeForItemAtIndexPath:(id)a3;
- (int64_t)_anchorForAuxiliaryElementOfKind:(id)a3;
- (int64_t)_sublayoutType;
- (unint64_t)_edgesForSafeAreaPropagationToDescendants;
- (unint64_t)_layoutAxis;
- (unint64_t)_layoutAxisForAttributes:(id)a3 previousAttributes:(id)a4 nextAttributes:(id)a5;
- (unint64_t)_layoutOffsetEdges;
- (unint64_t)_orthogonalScrollingAxis;
- (void)_finalizeCollectionViewItemAnimations;
- (void)_finalizeCollectionViewUpdate:(id)a3;
- (void)_finalizeLayoutTransition;
- (void)_invalidateLayoutUsingContext:(id)a3;
- (void)_prepareForCollectionViewUpdates:(id)a3 animated:(BOOL)a4;
- (void)_prepareForTransitionFromLayout:(id)a3;
- (void)_prepareForTransitionToLayout:(id)a3;
- (void)_prepareToAnimateFromCollectionViewItems:(id)a3 atContentOffset:(CGPoint)a4 toItems:(id)a5 atContentOffset:(CGPoint)a6;
- (void)_setCollectionView:(id)a3;
- (void)_setCollectionViewAnimationContext:(id)a3;
- (void)_setCollectionViewBoundsSize:(CGSize)a3;
- (void)_setCompositionLayout:(id)a3;
- (void)_setDynamicAnimator:(id)a3;
- (void)_setElementKinds:(id)a3;
- (void)_setExternalObjectTable:(id)a3 forNibLoadingOfDecorationViewOfKind:(id)a4;
- (void)_setFrame:(CGRect)a3;
- (void)_setItems:(id)a3;
- (void)_setLayoutOffset:(CGPoint)a3;
- (void)_setLayoutOffsetEdges:(unint64_t)a3;
- (void)_setPreferredBackgroundColor:(id)a3;
- (void)_setPrepared:(BOOL)a3;
- (void)_setSections:(id)a3;
- (void)_setSiblingLayout:(id)a3;
- (void)_setSublayoutType:(int64_t)a3;
- (void)_setWantsRightToLeftHorizontalMirroringIfNeeded:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateLayout;
- (void)invalidateLayoutWithContext:(UICollectionViewLayoutInvalidationContext *)context;
- (void)registerClass:(Class)viewClass forDecorationViewOfKind:(NSString *)elementKind;
- (void)registerNib:(UINib *)nib forDecorationViewOfKind:(NSString *)elementKind;
@end

@implementation UICollectionViewLayout

uint64_t __61__UICollectionViewLayout__decorationViewForLayoutAttributes___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _setLayoutAttributes:*(void *)(a1 + 32)];
}

void __61__UICollectionViewLayout__decorationViewForLayoutAttributes___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(*(Class *)(a1 + 48));
  [*(id *)(a1 + 32) frame];
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)_initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  if ([(NSMutableDictionary *)self->_initialAnimationLayoutAttributesDict count])
  {
    v5 = +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, a3);
    v6 = [(NSMutableDictionary *)self->_initialAnimationLayoutAttributesDict objectForKey:v5];
  }
  else
  {
    v6 = 0;
  }
  v7 = [(UICollectionViewLayout *)self collectionView];
  if (!v6)
  {
    uint64_t v8 = [a3 section];
    if (v8 >= [v7 numberOfSections]
      || (uint64_t v9 = [a3 item], v9 >= objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(a3, "section"))))
    {
      v6 = 0;
      goto LABEL_11;
    }
    transitioningFromLayout = self->_transitioningFromLayout;
    if (transitioningFromLayout && (*(unsigned char *)&self->_layoutFlags & 1) == 0)
    {
      v6 = [(UICollectionViewLayout *)self->_transitioningFromLayout layoutAttributesForItemAtIndexPath:a3];
      goto LABEL_11;
    }
    v12 = [v7 _currentUpdate];
    v13 = [(UICollectionViewLayout *)self layoutAttributesForItemAtIndexPath:a3];
    v6 = (void *)[v13 copy];

    if ((dyld_program_sdk_at_least() & 1) != 0 || !v12)
    {
      if (transitioningFromLayout) {
        goto LABEL_19;
      }
    }
    else
    {
      char v14 = objc_msgSend(v12[9], "containsIndex:", objc_msgSend(a3, "section"));
      if (transitioningFromLayout || (v14 & 1) == 0) {
        goto LABEL_19;
      }
    }
    [v6 setAlpha:0.0];
LABEL_19:
  }
LABEL_11:

  return v6;
}

- (UICollectionView)collectionView
{
  collectionView = self->_collectionView;
  if (collectionView)
  {
    uint64_t v3 = collectionView;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_compositionLayout);
    uint64_t v3 = [WeakRetained collectionView];
  }
  return v3;
}

- (BOOL)_shouldAddElementToSectionContainer:(id)a3
{
  return 0;
}

- (BOOL)_cellsShouldConferWithAutolayoutEngineForSizingInfo
{
  return 1;
}

- (UICollectionViewLayoutAttributes)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
  v5 = [(UICollectionViewLayout *)self _collectionViewAnimationContext];

  if (!v5
    || ([(UICollectionViewLayout *)self _collectionViewAnimationContext],
        v6 = objc_claimAutoreleasedReturnValue(),
        -[_UICollectionViewAnimationContext initialLayoutAttributesForAppearingItemAtIndexPath:]((uint64_t)v6, itemIndexPath), v7 = objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    v7 = [(UICollectionViewLayout *)self _initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
  }
  return (UICollectionViewLayoutAttributes *)v7;
}

- (_UICollectionViewAnimationContext)_collectionViewAnimationContext
{
  return self->_collectionViewAnimationContext;
}

- (BOOL)_initialAppearingLayoutAttributesCanBeOverriddenForEstimatedSizing
{
  return self->_collectionViewAnimationContext == 0;
}

- (BOOL)_wantsInvalidateLayoutForPreferredLayoutAttributes
{
  return 0;
}

- (BOOL)_orthogonalScrollingElementShouldAppearBelowForAttributes:(id)a3
{
  return 0;
}

- (unint64_t)_layoutAxis
{
  return 0;
}

- (id)_decorationViewForLayoutAttributes:(id)a3
{
  v5 = -[UIBarButtonItemGroup _items]((id *)a3);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__44;
  v28 = __Block_byref_object_dispose__44;
  id v29 = 0;
  v6 = [(NSMutableDictionary *)self->_decorationViewNibDict valueForKey:v5];
  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_decorationViewExternalObjectsTables valueForKey:v5];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v7 forKey:@"UINibExternalObjects"];
    }
    else
    {
      uint64_t v8 = 0;
    }
    v10 = [v6 instantiateWithOwner:0 options:v8];
    if ([v10 count] == 1)
    {
      uint64_t v11 = [v10 objectAtIndex:0];
      v12 = (void *)v25[5];
      v25[5] = v11;
    }
    if (!v25[5] || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 1925, @"invalid nib registered for identifier (%@) - nib must contain exactly one top level object which must be a UICollectionReusableView instance", v5 object file lineNumber description];
    }
    v13 = [(id)v25[5] reuseIdentifier];
    if ([v13 length] && (objc_msgSend(v13, "isEqualToString:", v5) & 1) == 0)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 1927, @"view reuse identifier in nib (%@) does not match the element kind used to register the nib (%@)", v13, v5 object file lineNumber description];
    }
  }
  else
  {
    id v9 = (id)[(NSMutableDictionary *)self->_decorationViewClassDict valueForKey:v5];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __61__UICollectionViewLayout__decorationViewForLayoutAttributes___block_invoke;
    v23[3] = &unk_1E52E6298;
    v23[5] = &v24;
    v23[6] = v9;
    v23[4] = a3;
    +[UIView performWithoutAnimation:v23];
  }
  char v14 = (void *)v25[5];
  if (!v14)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = -[UIBarButtonItemGroup _items]((id *)a3);
    [v18 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 1935, @"could not dequeue a decoration view of kind: %@ - must register as a class or nib or connect a prototype in a storyboard", v19 object file lineNumber description];

    char v14 = (void *)v25[5];
  }
  [v14 _setReuseIdentifier:v5];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __61__UICollectionViewLayout__decorationViewForLayoutAttributes___block_invoke_2;
  v22[3] = &unk_1E52E3210;
  v22[4] = a3;
  v22[5] = &v24;
  +[UIView performWithoutAnimation:v22];
  [(id)v25[5] setAutoresizingMask:0];
  [(id)v25[5] setTranslatesAutoresizingMaskIntoConstraints:1];
  [(id)v25[5] _setHostsLayoutEngine:1];
  [(id)v25[5] _markAsDequeued];
  id v15 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (UIUserInterfaceLayoutDirection)developmentLayoutDirection
{
  if (qword_1EB25FE70 != -1) {
    dispatch_once(&qword_1EB25FE70, &__block_literal_global_116);
  }
  return qword_1EB25FE68;
}

- (BOOL)_overridesSafeAreaPropagationToDescendants
{
  return 0;
}

- (BOOL)_wantsUpdateVisibleCellsPassNotifications
{
  return dyld_program_sdk_at_least();
}

- (BOOL)_estimatesSupplementaryItems
{
  return 0;
}

- (BOOL)_wantsUntrackedAnimationCleanupForAuxillaryItems
{
  return 0;
}

+ (Class)invalidationContextClass
{
  return (Class)objc_opt_class();
}

- (void)_invalidateLayoutUsingContext:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationContext, a3);
  [(UICollectionViewLayout *)self invalidateLayout];
  invalidationContext = self->_invalidationContext;
  self->_invalidationContext = 0;
}

- (void)invalidateLayout
{
  if (self->_invalidationContext)
  {
    [(UICollectionViewLayout *)self invalidateLayoutWithContext:"invalidateLayoutWithContext:"];
  }
  else
  {
    id v3 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
    [(UICollectionViewLayout *)self invalidateLayoutWithContext:v3];
  }
}

void __107__UICollectionViewLayout__populateInitialAndFinalLayoutAttributesDictionariesForOnScreenElementsForUpdate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 _layoutAttributes];
  uint64_t v25 = [v4 copy];

  v5 = (void *)v25;
  if (v25)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if ((*(_WORD *)(v25 + 288) & 1) == 0)
    {
      id v7 = *(id *)(v25 + 8);
      uint64_t v8 = [(id)v25 indexPath];
      id v9 = -[UICollectionViewUpdate validatedNewIndexPathForSupplementaryElementOfKind:oldIndexPath:](v6, v7, v8);

      if (v9)
      {
        [(id)v25 setIndexPath:v9];
        v10 = *(void **)(*(void *)(a1 + 40) + 32);
        uint64_t v11 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v25);
        [v10 setObject:v25 forKey:v11];
      }
      goto LABEL_5;
    }
    uint64_t v12 = *(void *)(v6 + 16);
    v13 = [(id)v25 indexPath];
    uint64_t v14 = -[UICollectionViewData validatedGlobalIndexForItemAtIndexPath:](v12, v13);

    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    {
      char v15 = [a2 _isInUpdateAnimation];
      v5 = (void *)v25;
      if ((v15 & 1) == 0)
      {
        id v9 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v18 = a1 + 40;
        uint64_t v16 = *(void *)(a1 + 40);
        uint64_t v17 = *(void *)(v18 + 8);
        v19 = [(id)v25 indexPath];
        [v9 handleFailureInMethod:v17, v16, @"UICollectionViewLayout.m", 1383, @"While preparing update a visible view at %@ wasn't found in the current data model and was not in an update animation. This is an internal error.", v19 object file lineNumber description];

LABEL_5:
        v5 = (void *)v25;
      }
    }
    else
    {
      uint64_t v20 = [*(id *)(a1 + 32) finalGlobalIndexForInitialGlobalIndex:v14];
      v5 = (void *)v25;
      if (v20 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 24);
        if (v21)
        {
          uint64_t v22 = v20;
          if ((*(unsigned char *)(v21 + 96) & 2) == 0)
          {
            -[UICollectionViewData _updateItemCounts](v21);
            v5 = (void *)v25;
          }
          if ((v22 & 0x8000000000000000) == 0 && *(void *)(v21 + 168) > v22)
          {
            v23 = -[UICollectionViewData indexPathForItemAtGlobalIndex:](*(unsigned char **)(*(void *)(a1 + 32) + 24), v22);
            [(id)v25 setIndexPath:v23];

            uint64_t v24 = *(void **)(*(void *)(a1 + 40) + 32);
            id v9 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v25);
            [v24 setObject:v25 forKey:v9];
            goto LABEL_5;
          }
        }
      }
    }
  }
}

- (void)invalidateLayoutWithContext:(UICollectionViewLayoutInvalidationContext *)context
{
  uint64_t v4 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&v4->_compositionLayout);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    do
    {
      id v9 = v6;

      uint64_t v6 = [(UICollectionViewLayout *)v9 _compositionLayout];

      id v7 = v9;
      uint64_t v4 = v9;
    }
    while (v6);
  }
  else
  {
    id v7 = v4;
  }
  v10 = v7;
  uint64_t v8 = [(UICollectionViewLayout *)v7 collectionView];
  [v8 _invalidateLayoutWithContext:context];
}

- (BOOL)_estimatesSizes
{
  return 0;
}

- (id)_orthogonalScrollingSections
{
  return 0;
}

- (id)_customContainerSectionIndexes
{
  return 0;
}

- (BOOL)_hasOrthogonalScrollingSections
{
  return 0;
}

- (BOOL)_isInLayoutTransition
{
  return self->_transitioningFromLayout || self->_transitioningToLayout != 0;
}

- (BOOL)_disablesDoubleSidedAnimations
{
  return 0;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4
{
  return 0;
}

- (id)_layoutAttributesForIndelibleElements
{
  return 0;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset
{
  double y = proposedContentOffset.y;
  double x = proposedContentOffset.x;
  if ([(UICollectionViewLayout *)self _shouldAdjustTargetContentOffsetToValidateContentExtents])
  {
    if (dyld_program_sdk_at_least())
    {
      unint64_t v6 = [(UICollectionViewLayout *)self _layoutAxis];
      if (v6 - 1 <= 1)
      {
        unint64_t v7 = v6;
        [(UICollectionViewLayout *)self collectionViewContentSize];
        double v9 = v8;
        double v11 = v10;
        uint64_t v12 = [(UICollectionViewLayout *)self collectionView];
        [v12 _minimumContentOffset];
        double v14 = v13;
        double v16 = v15;

        uint64_t v17 = [(UICollectionViewLayout *)self collectionView];
        objc_msgSend(v17, "_maximumContentOffsetForContentSize:", v9, v11);
        double v19 = v18;
        double v21 = v20;

        if (v7 == 2)
        {
          double y = fmax(v16, fmin(y, v21));
        }
        else if (v7 == 1)
        {
          double x = fmax(v14, fmin(x, v19));
        }
      }
    }
  }
  double v22 = x;
  double v23 = y;
  result.double y = v23;
  result.double x = v22;
  return result;
}

- (BOOL)_shouldAdjustTargetContentOffsetToValidateContentExtents
{
  return 0;
}

- (UICollectionViewLayout)init
{
  v5.receiver = self;
  v5.super_class = (Class)UICollectionViewLayout;
  id v2 = [(UICollectionViewLayout *)&v5 init];
  id v3 = v2;
  if (v2) {
    UICollectionViewLayoutCommonInit((uint64_t)v2);
  }
  return v3;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 0;
}

- (id)_indexPathsToInsertForDecorationViewOfKind:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_insertedDecorationIndexPathsDict objectForKeyedSubscript:a3];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)_indexPathsToInsertForSupplementaryViewOfKind:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_insertedSupplementaryIndexPathsDict objectForKeyedSubscript:a3];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)_indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_deletedSupplementaryIndexPathsDict objectForKeyedSubscript:a3];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (id)_indexPathsToDeleteForDecorationViewOfKind:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_deletedDecorationIndexPathsDict objectForKeyedSubscript:a3];
  uint64_t v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v5 = v3;

  return v5;
}

- (void)registerClass:(Class)viewClass forDecorationViewOfKind:(NSString *)elementKind
{
  if (!self->_decorationViewClassDict)
  {
    unint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    decorationViewClassDict = self->_decorationViewClassDict;
    self->_decorationViewClassDict = v7;
  }
  [(NSMutableDictionary *)self->_decorationViewNibDict removeObjectForKey:elementKind];
  double v9 = self->_decorationViewClassDict;
  if (viewClass)
  {
    [(NSMutableDictionary *)v9 setValue:viewClass forKey:elementKind];
  }
  else
  {
    [(NSMutableDictionary *)v9 removeObjectForKey:elementKind];
  }
}

- (void)_finalizeCollectionViewUpdate:(id)a3
{
  [(NSMutableDictionary *)self->_initialAnimationLayoutAttributesDict removeAllObjects];
  [(NSMutableDictionary *)self->_finalAnimationLayoutAttributesDict removeAllObjects];
  [(NSMutableDictionary *)self->_deletedSupplementaryIndexPathsDict removeAllObjects];
  [(NSMutableDictionary *)self->_insertedSupplementaryIndexPathsDict removeAllObjects];
  [(NSMutableDictionary *)self->_deletedDecorationIndexPathsDict removeAllObjects];
  [(NSMutableDictionary *)self->_insertedDecorationIndexPathsDict removeAllObjects];
  [(UICollectionViewLayout *)self finalizeCollectionViewUpdates];
}

- (int64_t)_anchorForAuxiliaryElementOfKind:(id)a3
{
  return 0;
}

- (BOOL)_shouldInvalidateLayoutForDataSourceChange
{
  return dyld_program_sdk_at_least() ^ 1;
}

- (void)_setCollectionViewAnimationContext:(id)a3
{
}

- (id)_propertyAnimatorForCollectionViewUpdates:(id)a3 withCustomAnimator:(id)a4
{
  return a4;
}

- (void)_setPreferredBackgroundColor:(id)a3
{
  preferredBackgroundColor = self->_preferredBackgroundColor;
  p_preferredBackgroundColor = &self->_preferredBackgroundColor;
  if (preferredBackgroundColor != a3)
  {
    objc_storeStrong((id *)p_preferredBackgroundColor, a3);
    id v6 = [(UICollectionViewLayout *)self collectionView];
    [v6 _updateBackgroundColorIfNeeded];
  }
}

- (UIColor)_preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (UICollectionViewLayoutAttributes)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath
{
  if ([(NSMutableDictionary *)self->_initialAnimationLayoutAttributesDict count])
  {
    unint64_t v7 = +[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, elementKind, elementIndexPath);
    double v8 = [(NSMutableDictionary *)self->_initialAnimationLayoutAttributesDict objectForKey:v7];
  }
  else
  {
    double v8 = 0;
  }
  double v9 = [(UICollectionViewLayout *)self collectionView];
  if (!v8)
  {
    if ([(NSIndexPath *)elementIndexPath length] != 1)
    {
      uint64_t v10 = [(NSIndexPath *)elementIndexPath section];
      if (v10 >= [v9 numberOfSections])
      {
        double v8 = 0;
        goto LABEL_20;
      }
    }
    transitioningFromLayout = self->_transitioningFromLayout;
    if (transitioningFromLayout && (*(unsigned char *)&self->_layoutFlags & 1) == 0)
    {
      double v8 = [(UICollectionViewLayout *)self->_transitioningFromLayout layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:elementIndexPath];
      goto LABEL_20;
    }
    uint64_t v12 = [v9 _currentUpdate];
    double v13 = [(UICollectionViewLayout *)self layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:elementIndexPath];
    double v8 = (void *)[v13 copy];

    if ((dyld_program_sdk_at_least() & 1) != 0
      || !v12
      || (objc_msgSend(v12[9], "containsIndex:", -[NSIndexPath section](elementIndexPath, "section")) & 1) != 0)
    {
      if (transitioningFromLayout)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      char v14 = -[UICollectionViewUpdate hasInsertedAuxiliaryElementOfKind:atIndexPath:]((uint64_t)v12, elementKind, elementIndexPath);
      if (transitioningFromLayout || (v14 & 1) == 0) {
        goto LABEL_19;
      }
    }
    [v8 setAlpha:0.0];
    goto LABEL_19;
  }
LABEL_20:

  return (UICollectionViewLayoutAttributes *)v8;
}

- (void)_prepareForCollectionViewUpdates:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v7 = self;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  double v8 = [(UICollectionView *)self->_collectionView _currentUpdate];
  if (!v8)
  {
    v60 = [MEMORY[0x1E4F28B00] currentHandler];
    [v60 handleFailureInMethod:a2, v7, @"UICollectionViewLayout.m", 1256, @"UICollectionView %@ called prepare on layout without having a current update", v7->_collectionView object file lineNumber description];
  }
  BOOL v9 = [(UICollectionViewLayout *)v7 _shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:v4];
  BOOL v10 = v9;
  if (v9)
  {
    v70 = v8;
    BOOL v72 = v9;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v11 = a3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v81 objects:buf count:16];
    if (!v12) {
      goto LABEL_22;
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v82;
    while (1)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v82 != v14) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v81 + 1) + 8 * i);
        uint64_t v17 = [v16 updateAction];
        if (!v16 || v16[6] != 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((unint64_t)(v17 - 1) > 1)
          {
            if (v17) {
              continue;
            }
            double v19 = [v16 indexPathAfterUpdate];
            uint64_t v24 = +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v19);
            [(UICollectionViewLayout *)v7 layoutAttributesForItemAtIndexPath:v19];
            uint64_t v26 = v25 = v7;
            v27 = (void *)[v26 copy];

            unint64_t v7 = v25;
            if (v27)
            {
              [v27 setAlpha:0.0];
              [(NSMutableDictionary *)v25->_initialAnimationLayoutAttributesDict setObject:v27 forKey:v24];
            }
          }
          else
          {
            double v18 = [v16 indexPathBeforeUpdate];
            double v19 = +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, v18);

            collectionView = v7->_collectionView;
            [v16 indexPathBeforeUpdate];
            v22 = double v21 = v7;
            double v23 = objc_msgSend(-[UICollectionView _visibleCellForIndexPath:](collectionView, "_visibleCellForIndexPath:", v22), "_layoutAttributes");
            uint64_t v24 = (void *)[v23 copy];

            if (v24)
            {
              [v24 setAlpha:0.0];
              [(NSMutableDictionary *)v21->_finalAnimationLayoutAttributesDict setObject:v24 forKey:v19];
            }
            unint64_t v7 = v21;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v81 objects:buf count:16];
      if (!v13)
      {
LABEL_22:

        BOOL v10 = v72;
        double v8 = v70;
        break;
      }
    }
  }
  id v28 = v8[8];
  if (os_variant_has_internal_diagnostics())
  {
    if (!v28)
    {
      v61 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
      {
        v67 = v7->_collectionView;
        *(_DWORD *)buf = 138412546;
        v87 = v67;
        __int16 v88 = 2112;
        v89 = v8;
        _os_log_fault_impl(&dword_1853B0000, v61, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: UICollectionView %@ asked layout to prepare for update %@ without computing deleted sections", buf, 0x16u);
      }
    }
  }
  else if (!v28)
  {
    v63 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_994) + 8);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      v64 = v7->_collectionView;
      *(_DWORD *)buf = 138412546;
      v87 = v64;
      __int16 v88 = 2112;
      v89 = v8;
      _os_log_impl(&dword_1853B0000, v63, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: UICollectionView %@ asked layout to prepare for update %@ without computing deleted sections", buf, 0x16u);
    }
  }
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = __68__UICollectionViewLayout__prepareForCollectionViewUpdates_animated___block_invoke;
  v78[3] = &unk_1E52DADC0;
  id v29 = v8;
  v79 = v29;
  v80 = v7;
  [v28 enumerateIndexesUsingBlock:v78];
  id v30 = v29[9];
  if (os_variant_has_internal_diagnostics())
  {
    if (!v30)
    {
      v62 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
      {
        v68 = v7->_collectionView;
        *(_DWORD *)buf = 138412546;
        v87 = v68;
        __int16 v88 = 2112;
        v89 = v29;
        _os_log_fault_impl(&dword_1853B0000, v62, OS_LOG_TYPE_FAULT, "UIKit internal inconsistency: UICollectionView %@ asked layout to prepare for update %@ without computing inserted sections", buf, 0x16u);
      }
    }
  }
  else if (!v30)
  {
    v65 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FE60) + 8);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = v7->_collectionView;
      *(_DWORD *)buf = 138412546;
      v87 = v66;
      __int16 v88 = 2112;
      v89 = v29;
      _os_log_impl(&dword_1853B0000, v65, OS_LOG_TYPE_ERROR, "UIKit internal inconsistency: UICollectionView %@ asked layout to prepare for update %@ without computing inserted sections", buf, 0x16u);
    }
  }
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __68__UICollectionViewLayout__prepareForCollectionViewUpdates_animated___block_invoke_418;
  v75[3] = &unk_1E52DADC0;
  v31 = v29;
  v76 = v31;
  v77 = v7;
  [v30 enumerateIndexesUsingBlock:v75];
  [(UICollectionViewLayout *)v7 prepareForCollectionViewUpdates:a3];
  -[UICollectionViewUpdate _computeAuxiliaryUpdates]((uint64_t)v31);
  if (!v10) {
    goto LABEL_52;
  }
  id v71 = v30;
  id v73 = v28;
  if (!v7) {
    goto LABEL_51;
  }
  v32 = v7->_collectionView;
  v85[0] = MEMORY[0x1E4F143A8];
  v85[1] = 3221225472;
  v85[2] = __107__UICollectionViewLayout__populateInitialAndFinalLayoutAttributesDictionariesForOnScreenElementsForUpdate___block_invoke;
  v85[3] = &unk_1E52E6248;
  v85[4] = v31;
  v85[5] = v7;
  v74 = v7;
  v85[6] = sel__populateInitialAndFinalLayoutAttributesDictionariesForOnScreenElementsForUpdate_;
  [(UICollectionView *)v32 _enumerateVisibleViews:v85];
  long long v83 = 0u;
  long long v84 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  v33 = [(UICollectionView *)v32 _collectionViewData];
  v69 = v32;
  [(UIScrollView *)v32 visibleBounds];
  v38 = -[UICollectionViewData layoutAttributesForElementsInRect:](v33, v34, v35, v36, v37);

  uint64_t v39 = [v38 countByEnumeratingWithState:&v81 objects:buf count:16];
  if (!v39) {
    goto LABEL_50;
  }
  uint64_t v40 = v39;
  uint64_t v41 = *(void *)v82;
  do
  {
    uint64_t v42 = 0;
    do
    {
      if (*(void *)v82 != v41) {
        objc_enumerationMutation(v38);
      }
      v43 = *(_WORD **)(*((void *)&v81 + 1) + 8 * v42);
      v44 = (id *)[v43 copy];
      v45 = v44;
      if (!v43 || (v43[144] & 1) == 0)
      {
        v46 = -[UIBarButtonItemGroup _items](v44);
        v47 = [v45 indexPath];
        v48 = -[UICollectionViewUpdate validatedOldIndexPathForSupplementaryElementOfKind:newIndexPath:]((uint64_t)v31, v46, v47);

        if (v48)
        {
          [v45 setIndexPath:v48];
          finalAnimationLayoutAttributesDict = v74->_finalAnimationLayoutAttributesDict;
          v50 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v45);
          [(NSMutableDictionary *)finalAnimationLayoutAttributesDict setObject:v45 forKey:v50];
        }
        goto LABEL_38;
      }
      uint64_t v51 = v31[3];
      v52 = [v44 indexPath];
      uint64_t v53 = -[UICollectionViewData validatedGlobalIndexForItemAtIndexPath:](v51, v52);

      if (v53 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v54 = [v31 initialGlobalIndexForFinalGlobalIndex:v53];
        if (v54 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v55 = v31[2];
          if (v55)
          {
            uint64_t v56 = v54;
            if ((*(unsigned char *)(v55 + 96) & 2) == 0) {
              -[UICollectionViewData _updateItemCounts](v31[2]);
            }
            if ((v56 & 0x8000000000000000) == 0 && *(void *)(v55 + 168) > v56)
            {
              v57 = -[UICollectionViewData indexPathForItemAtGlobalIndex:]((unsigned char *)v31[2], v56);
              [v45 setIndexPath:v57];

              v58 = v74->_finalAnimationLayoutAttributesDict;
              v48 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v45);
              [(NSMutableDictionary *)v58 setObject:v45 forKey:v48];
LABEL_38:
            }
          }
        }
      }

      ++v42;
    }
    while (v40 != v42);
    uint64_t v59 = [v38 countByEnumeratingWithState:&v81 objects:buf count:16];
    uint64_t v40 = v59;
  }
  while (v59);
LABEL_50:

LABEL_51:
  id v30 = v71;
  id v28 = v73;
LABEL_52:
}

- (BOOL)_shouldPopulateInitialAndFinalLayoutAttributesForAllUpdateItems:(BOOL)a3
{
  if (a3) {
    return 1;
  }
  else {
    return dyld_program_sdk_at_least() ^ 1;
  }
}

- (BOOL)_needsRecomputeOfPreferredAttributesForVisibleEstimatedItemsDuringUpdate
{
  return 1;
}

- (UICollectionViewLayoutAttributes)initialLayoutAttributesForAppearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath
{
  if ([(NSMutableDictionary *)self->_initialAnimationLayoutAttributesDict count])
  {
    unint64_t v7 = +[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, elementKind, decorationIndexPath);
    double v8 = [(NSMutableDictionary *)self->_initialAnimationLayoutAttributesDict objectForKey:v7];
  }
  else
  {
    double v8 = 0;
  }
  BOOL v9 = [(UICollectionViewLayout *)self collectionView];
  if (!v8)
  {
    if ([(NSIndexPath *)decorationIndexPath length] != 1)
    {
      uint64_t v10 = [(NSIndexPath *)decorationIndexPath section];
      if (v10 >= [v9 numberOfSections])
      {
        double v8 = 0;
        goto LABEL_20;
      }
    }
    transitioningFromLayout = self->_transitioningFromLayout;
    if (transitioningFromLayout && (*(unsigned char *)&self->_layoutFlags & 1) == 0)
    {
      double v8 = [(UICollectionViewLayout *)self->_transitioningFromLayout layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:decorationIndexPath];
      goto LABEL_20;
    }
    uint64_t v12 = [v9 _currentUpdate];
    uint64_t v13 = [(UICollectionViewLayout *)self layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:decorationIndexPath];
    double v8 = (void *)[v13 copy];

    if ((dyld_program_sdk_at_least() & 1) != 0
      || !v12
      || (objc_msgSend(v12[9], "containsIndex:", -[NSIndexPath section](decorationIndexPath, "section")) & 1) != 0)
    {
      if (transitioningFromLayout)
      {
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      char v14 = -[UICollectionViewUpdate hasInsertedAuxiliaryElementOfKind:atIndexPath:]((uint64_t)v12, elementKind, decorationIndexPath);
      if (transitioningFromLayout || (v14 & 1) == 0) {
        goto LABEL_19;
      }
    }
    [v8 setAlpha:0.0];
    goto LABEL_19;
  }
LABEL_20:

  return (UICollectionViewLayoutAttributes *)v8;
}

- (BOOL)_wantsAnimationsForOffscreenAuxillaries
{
  return 0;
}

- (void)_setCollectionView:(id)a3
{
  self->_collectionView = (UICollectionView *)a3;
}

- (UIEdgeInsets)_preferredLayoutMargins
{
  double v2 = 1.79769313e308;
  double v3 = 1.79769313e308;
  double v4 = 1.79769313e308;
  double v5 = 1.79769313e308;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)_invalidationContextForBoundsChange:(CGRect)a3 fromOldBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double v6 = a3.size.height;
  double v7 = a3.size.width;
  double v8 = -[UICollectionViewLayout invalidationContextForBoundsChange:](self, "invalidationContextForBoundsChange:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y);
  if (dyld_program_sdk_at_least() && ![v8 _intent])
  {
    if (v6 == height && v7 == width) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    [v8 _setIntent:v10];
  }
  return v8;
}

- (UICollectionViewLayoutInvalidationContext)invalidationContextForBoundsChange:(CGRect)newBounds
{
  id v3 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  return (UICollectionViewLayoutInvalidationContext *)v3;
}

- (BOOL)_isPrepared
{
  return (*(unsigned char *)&self->_layoutFlags >> 2) & 1;
}

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (NSIndexSet)_sections
{
  double v2 = self->_sections;
  return v2;
}

- (id)_invalidationContextForUpdatedLayoutMargins:(UIEdgeInsets)a3
{
  id v3 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  return v3;
}

- (BOOL)_shouldInvalidateLayoutForUpdatedSafeAreaInsets:(UIEdgeInsets)a3 fromOldInsets:(UIEdgeInsets)a4
{
  return 1;
}

- (BOOL)_shouldInvalidateLayoutForUpdatedLayoutMargins:(UIEdgeInsets)a3 fromOldMargins:(UIEdgeInsets)a4
{
  return 1;
}

void __68__UICollectionViewLayout__prepareForCollectionViewUpdates_animated___block_invoke_418(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = -[UICollectionViewData existingSupplementaryLayoutAttributesInSection:](*(void *)(*(void *)(a1 + 32) + 24), a2);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
        if (v8 && (*(_WORD *)(v8 + 288) & 2) != 0)
        {
          char v14 = *(void **)(*(void *)(a1 + 40) + 72);
          id v15 = *(id *)(v8 + 8);
          objc_msgSend(v14, "objectForKeyedSubscript:", v15, (void)v18);
          id v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11) {
            goto LABEL_13;
          }
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 72);
          id v13 = *(id *)(v8 + 8);
        }
        else
        {
          BOOL v9 = *(void **)(*(void *)(a1 + 40) + 56);
          uint64_t v10 = -[UIBarButtonItemGroup _items](*(id **)(*((void *)&v18 + 1) + 8 * v7));
          id v11 = [v9 objectForKeyedSubscript:v10];

          if (v11) {
            goto LABEL_13;
          }
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v12 = *(void **)(*(void *)(a1 + 40) + 56);
          -[UIBarButtonItemGroup _items]((id *)v8);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        double v16 = v13;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13, (void)v18);

LABEL_13:
        uint64_t v17 = objc_msgSend((id)v8, "indexPath", (void)v18);
        [v11 addObject:v17];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

- (id)_invalidationContextForRefreshingVisibleElementAttributes
{
  id v2 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  [v2 _setIntent:12];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionViewAnimationContext, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_destroyWeak((id *)&self->_siblingLayout);
  objc_destroyWeak((id *)&self->_compositionLayout);
  objc_storeStrong((id *)&self->_elementKinds, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_swipeActionsModule, 0);
  objc_storeStrong((id *)&self->_invalidationContext, 0);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_storeStrong((id *)&self->_transitioningToLayout, 0);
  objc_storeStrong((id *)&self->_transitioningFromLayout, 0);
  objc_storeStrong((id *)&self->_decorationViewExternalObjectsTables, 0);
  objc_storeStrong((id *)&self->_decorationViewNibDict, 0);
  objc_storeStrong((id *)&self->_decorationViewClassDict, 0);
  objc_storeStrong((id *)&self->_insertedDecorationIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_deletedDecorationIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_insertedSupplementaryIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_deletedSupplementaryIndexPathsDict, 0);
  objc_storeStrong((id *)&self->_finalAnimationLayoutAttributesDict, 0);
  objc_storeStrong((id *)&self->_initialAnimationLayoutAttributesDict, 0);
}

- (UICollectionViewLayoutAttributes)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
  uint64_t v5 = [(UICollectionViewLayout *)self _collectionViewAnimationContext];

  if (!v5
    || ([(UICollectionViewLayout *)self _collectionViewAnimationContext],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        -[_UICollectionViewAnimationContext finalLayoutAttributesForDisappearingItemAtIndexPath:]((uint64_t)v6, itemIndexPath), uint64_t v7 = objc_claimAutoreleasedReturnValue(), v6, !v7))
  {
    uint64_t v7 = [(UICollectionViewLayout *)self _finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
  }
  return (UICollectionViewLayoutAttributes *)v7;
}

- (id)_finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  if (![(NSMutableDictionary *)self->_finalAnimationLayoutAttributesDict count]
    || (+[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, a3), v5 = objc_claimAutoreleasedReturnValue(), [(NSMutableDictionary *)self->_finalAnimationLayoutAttributesDict objectForKey:v5], uint64_t v6 = objc_claimAutoreleasedReturnValue(), v5, !v6))
  {
    transitioningToLayout = self->_transitioningToLayout;
    if (transitioningToLayout && (*(unsigned char *)&self->_layoutFlags & 2) == 0)
    {
      uint64_t v6 = [(UICollectionViewLayout *)self->_transitioningToLayout layoutAttributesForItemAtIndexPath:a3];
      goto LABEL_12;
    }
    uint64_t v8 = [(UICollectionViewLayout *)self collectionView];
    BOOL v9 = [v8 _currentUpdate];
    uint64_t v10 = [v8 _cellForItemAtIndexPath:a3];
    id v11 = [v10 _layoutAttributes];
    uint64_t v6 = (void *)[v11 copy];

    if ((dyld_program_sdk_at_least() & 1) != 0 || !v9)
    {
      if (transitioningToLayout) {
        goto LABEL_11;
      }
    }
    else
    {
      char v12 = objc_msgSend(v9[8], "containsIndex:", objc_msgSend(a3, "section"));
      if (transitioningToLayout || (v12 & 1) == 0) {
        goto LABEL_11;
      }
    }
    [v6 setAlpha:0.0];
LABEL_11:
  }
LABEL_12:
  return v6;
}

- (void)_setWantsRightToLeftHorizontalMirroringIfNeeded:(BOOL)a3
{
  char layoutFlags = (char)self->_layoutFlags;
  if (((((layoutFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    if (a3) {
      char v4 = 8;
    }
    else {
      char v4 = 0;
    }
    *(unsigned char *)&self->_char layoutFlags = layoutFlags & 0xF7 | v4;
  }
}

- (UICollectionViewLayoutAttributes)finalLayoutAttributesForDisappearingDecorationElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)decorationIndexPath
{
  if (![(NSMutableDictionary *)self->_finalAnimationLayoutAttributesDict count]
    || (+[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, elementKind, decorationIndexPath), v7 = objc_claimAutoreleasedReturnValue(), [(NSMutableDictionary *)self->_finalAnimationLayoutAttributesDict objectForKey:v7], uint64_t v8 = objc_claimAutoreleasedReturnValue(), v7, !v8))
  {
    transitioningToLayout = self->_transitioningToLayout;
    if (transitioningToLayout && (*(unsigned char *)&self->_layoutFlags & 2) == 0)
    {
      uint64_t v8 = [(UICollectionViewLayout *)self->_transitioningToLayout layoutAttributesForDecorationViewOfKind:elementKind atIndexPath:decorationIndexPath];
      goto LABEL_15;
    }
    uint64_t v10 = [(UICollectionViewLayout *)self collectionView];
    id v11 = [v10 _currentUpdate];
    char v12 = [v10 _visibleSupplementaryViewOfKind:elementKind atIndexPath:decorationIndexPath isDecorationView:1];
    id v13 = [v12 _layoutAttributes];
    uint64_t v8 = (void *)[v13 copy];

    if ((dyld_program_sdk_at_least() & 1) != 0
      || !v11
      || (objc_msgSend(v11[8], "containsIndex:", -[NSIndexPath section](decorationIndexPath, "section")) & 1) != 0)
    {
      if (transitioningToLayout)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      char v14 = -[UICollectionViewUpdate hasDeletedAuxiliaryElementOfKind:atIndexPath:]((uint64_t)v11, elementKind, decorationIndexPath);
      if (transitioningToLayout || (v14 & 1) == 0) {
        goto LABEL_14;
      }
    }
    [v8 setAlpha:0.0];
    goto LABEL_14;
  }
LABEL_15:
  return (UICollectionViewLayoutAttributes *)v8;
}

void __52__UICollectionViewLayout_developmentLayoutDirection__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  v1 = [v0 infoDictionary];
  id v6 = [v1 objectForKey:@"CFBundleDevelopmentRegion"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = (__CFString *)v6;
LABEL_3:
    id v3 = v2;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v6 count])
    {
      char v4 = [v6 objectAtIndexedSubscript:0];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v2 = [v6 objectAtIndexedSubscript:0];
        goto LABEL_3;
      }
    }
  }
  NSLog(&cfstr_WarningThisApp.isa);
  id v3 = @"en";
LABEL_9:
  qword_1EB25FE68 = [off_1E52D2DD0 defaultWritingDirectionForLanguage:v3] == 1;
}

void __68__UICollectionViewLayout__prepareForCollectionViewUpdates_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v3 = -[UICollectionViewData existingSupplementaryLayoutAttributesInSection:](*(void *)(*(void *)(a1 + 32) + 16), a2);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v18 + 1) + 8 * v7);
        if (v8 && (*(_WORD *)(v8 + 288) & 2) != 0)
        {
          char v14 = *(void **)(*(void *)(a1 + 40) + 64);
          id v15 = *(id *)(v8 + 8);
          objc_msgSend(v14, "objectForKeyedSubscript:", v15, (void)v18);
          id v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11) {
            goto LABEL_13;
          }
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          char v12 = *(void **)(*(void *)(a1 + 40) + 64);
          id v13 = *(id *)(v8 + 8);
        }
        else
        {
          BOOL v9 = *(void **)(*(void *)(a1 + 40) + 48);
          uint64_t v10 = -[UIBarButtonItemGroup _items](*(id **)(*((void *)&v18 + 1) + 8 * v7));
          id v11 = [v9 objectForKeyedSubscript:v10];

          if (v11) {
            goto LABEL_13;
          }
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          char v12 = *(void **)(*(void *)(a1 + 40) + 48);
          -[UIBarButtonItemGroup _items]((id *)v8);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        double v16 = v13;
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13, (void)v18);

LABEL_13:
        uint64_t v17 = objc_msgSend((id)v8, "indexPath", (void)v18);
        [v11 addObject:v17];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

- (CGRect)bounds
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compositionLayout);

  if (WeakRetained)
  {
    double width = self->_frame.size.width;
    double height = self->_frame.size.height;
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    [(UIView *)self->_collectionView bounds];
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (UICollectionViewLayout)initWithCoder:(NSCoder *)coder
{
  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewLayout;
  uint64_t v4 = [(UICollectionViewLayout *)&v11 init];
  if (v4)
  {
    uint64_t v5 = [(NSCoder *)coder decodeObjectForKey:@"UICollectionViewDecorationViewNibDict"];
    decorationViewNibDict = v4->_decorationViewNibDict;
    v4->_decorationViewNibDict = (NSMutableDictionary *)v5;

    double v7 = [(NSCoder *)coder decodeObjectForKey:@"UICollectionViewDecorationViewPrototypeNibExternalObjects"];
    uint64_t v8 = mutableDictionaryByTransformingLeafDictionariesToWeakValued(v7);
    decorationViewExternalObjectsTables = v4->_decorationViewExternalObjectsTables;
    v4->_decorationViewExternalObjectsTables = (NSMutableDictionary *)v8;

    UICollectionViewLayoutCommonInit((uint64_t)v4);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  if ([(NSMutableDictionary *)self->_decorationViewNibDict count]) {
    [a3 encodeObject:self->_decorationViewNibDict forKey:@"UICollectionViewDecorationViewNibDict"];
  }
  if ([(NSMutableDictionary *)self->_decorationViewExternalObjectsTables count])
  {
    decorationViewExternalObjectsTables = self->_decorationViewExternalObjectsTables;
    [a3 encodeObject:decorationViewExternalObjectsTables forKey:@"UICollectionViewDecorationViewPrototypeNibExternalObjects"];
  }
}

- (NSArray)layoutAttributesForElementsInRect:(CGRect)rect
{
  return 0;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
  return 0;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
  return 0;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
  return 0;
}

- (BOOL)shouldInvalidateLayoutForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes
{
  return 0;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
  return 0;
}

- (UICollectionViewLayoutInvalidationContext)invalidationContextForPreferredLayoutAttributes:(UICollectionViewLayoutAttributes *)preferredAttributes withOriginalAttributes:(UICollectionViewLayoutAttributes *)originalAttributes
{
  id v4 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  [v4 _setIntent:5];
  return (UICollectionViewLayoutInvalidationContext *)v4;
}

- (CGSize)collectionViewContentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)snapshottedLayoutAttributeForItemAtIndexPath:(id)a3
{
  return 0;
}

- (void)registerNib:(UINib *)nib forDecorationViewOfKind:(NSString *)elementKind
{
  if (!self->_decorationViewNibDict)
  {
    double v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    decorationViewNibDict = self->_decorationViewNibDict;
    self->_decorationViewNibDict = v7;
  }
  [(NSMutableDictionary *)self->_decorationViewClassDict removeObjectForKey:elementKind];
  BOOL v9 = self->_decorationViewNibDict;
  if (nib)
  {
    [(NSMutableDictionary *)v9 setValue:nib forKey:elementKind];
  }
  else
  {
    [(NSMutableDictionary *)v9 removeObjectForKey:elementKind];
  }
}

- (void)_prepareForTransitionToLayout:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningToLayout, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = 2;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_char layoutFlags = *(unsigned char *)&self->_layoutFlags & 0xFD | v5;
  [(UIDynamicAnimator *)self->_animator _setRunning:0];
  [(UICollectionViewLayout *)self prepareForTransitionToLayout:a3];
}

- (void)_prepareForTransitionFromLayout:(id)a3
{
  objc_storeStrong((id *)&self->_transitioningFromLayout, a3);
  objc_opt_class();
  *(unsigned char *)&self->_char layoutFlags = *(unsigned char *)&self->_layoutFlags & 0xFE | objc_opt_isKindOfClass() & 1;
  [(UICollectionViewLayout *)self prepareForTransitionFromLayout:a3];
}

- (void)_finalizeLayoutTransition
{
  transitioningFromLayout = self->_transitioningFromLayout;
  self->_transitioningFromLayout = 0;

  *(unsigned char *)&self->_layoutFlags &= ~1u;
  transitioningToLayout = self->_transitioningToLayout;
  self->_transitioningToLayout = 0;

  *(unsigned char *)&self->_layoutFlags &= ~2u;
  [(UICollectionViewLayout *)self finalizeLayoutTransition];
  char v5 = [(UICollectionViewLayout *)self collectionView];
  double v6 = [v5 collectionViewLayout];

  if (v6 == self)
  {
    animator = self->_animator;
    [(UIDynamicAnimator *)animator _tickle];
  }
}

- (void)_setCollectionViewBoundsSize:(CGSize)a3
{
  self->_collectionViewBoundsSize = a3;
}

- (void)_setDynamicAnimator:(id)a3
{
}

- (id)_dynamicAnimator
{
  return self->_animator;
}

- (void)_prepareToAnimateFromCollectionViewItems:(id)a3 atContentOffset:(CGPoint)a4 toItems:(id)a5 atContentOffset:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v9 = a4.y;
  double v10 = a4.x;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (dyld_program_sdk_at_least())
  {
    double v35 = self;
    id v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a3, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v14 = a3;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v48 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          long long v20 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v19);
          [v13 setObject:v19 forKey:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v16);
    }

    long long v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a5, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v22 = a5;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          id v28 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, v27);
          [v21 setObject:v27 forKey:v28];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v24);
    }

    id v29 = (void *)MEMORY[0x1E4F1CA80];
    id v30 = [v21 allKeys];
    v31 = [v29 setWithArray:v30];

    v32 = [v13 allKeys];
    [v31 addObjectsFromArray:v32];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __107__UICollectionViewLayout__prepareToAnimateFromCollectionViewItems_atContentOffset_toItems_atContentOffset___block_invoke;
    v36[3] = &unk_1E52E6270;
    id v37 = v13;
    id v38 = v21;
    double v41 = x - v10;
    double v42 = y - v9;
    id v39 = v22;
    uint64_t v40 = v35;
    id v33 = v21;
    id v34 = v13;
    [v31 enumerateObjectsUsingBlock:v36];
  }
}

void __107__UICollectionViewLayout__prepareToAnimateFromCollectionViewItems_atContentOffset_toItems_atContentOffset___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKey:v3];
  char v5 = [*(id *)(a1 + 40) objectForKey:v3];
  double v6 = (void *)[v4 copy];
  [v6 center];
  objc_msgSend(v6, "setCenter:", v7 + *(double *)(a1 + 64), v8 + *(double *)(a1 + 72));
  double v9 = (void *)[v5 copy];
  [v9 center];
  objc_msgSend(v9, "setCenter:", v10 - *(double *)(a1 + 64), v11 - *(double *)(a1 + 72));
  if (v4 && v5)
  {
    [v6 frame];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [v5 frame];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    v67.origin.CGFloat x = v13;
    v67.origin.CGFloat y = v15;
    v67.size.CGFloat width = v17;
    v67.size.CGFloat height = v19;
    v70.origin.CGFloat x = v21;
    v70.origin.CGFloat y = v23;
    v70.size.CGFloat width = v25;
    v70.size.CGFloat height = v27;
    CGRect v68 = CGRectUnion(v67, v70);
    CGFloat y = v68.origin.y;
    CGFloat x = v68.origin.x;
    CGFloat height = v68.size.height;
    CGFloat width = v68.size.width;
    v68.origin.CGFloat x = v13;
    v68.origin.CGFloat y = v15;
    v68.size.CGFloat width = v17;
    v68.size.CGFloat height = v19;
    v71.origin.CGFloat x = v21;
    v71.origin.CGFloat y = v23;
    v71.size.CGFloat width = v25;
    v71.size.CGFloat height = v27;
    if (CGRectIntersectsRect(v68, v71)) {
      goto LABEL_27;
    }
    uint64_t v53 = v6;
    uint64_t v54 = v5;
    uint64_t v55 = v4;
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    uint64_t v52 = a1;
    obuint64_t j = *(id *)(a1 + 48);
    uint64_t v28 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (!v28) {
      goto LABEL_26;
    }
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v62;
    while (1)
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v62 != v30) {
          objc_enumerationMutation(obj);
        }
        v32 = *(void **)(*((void *)&v61 + 1) + 8 * v31);
        uint64_t v33 = +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)v32);
        id v34 = (void *)v33;
        if (v3)
        {
          uint64_t v35 = v3[4];
          if (!v33) {
            goto LABEL_22;
          }
        }
        else
        {
          uint64_t v35 = 0;
          if (!v33)
          {
LABEL_22:
            uint64_t v36 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v36 = *(void *)(v33 + 32);
LABEL_12:
        if (v35 == v36)
        {
          id v37 = v3 ? (void *)v3[2] : 0;
          id v38 = v37;
          id v39 = v34 ? (void *)v34[2] : 0;
          id v40 = v39;
          int v41 = [v38 isEqualToString:v40];

          if (v41)
          {
            [v32 frame];
            v72.origin.CGFloat x = v42;
            v72.origin.CGFloat y = v43;
            v72.size.CGFloat width = v44;
            v72.size.CGFloat height = v45;
            v69.origin.CGFloat x = x;
            v69.origin.CGFloat y = y;
            v69.size.CGFloat width = width;
            v69.size.CGFloat height = height;
            if (CGRectIntersectsRect(v69, v72))
            {
              double v6 = v53;
              long long v50 = (void *)[v53 copy];
              uint64_t v51 = (void *)[v9 copy];
              [v50 setAlpha:0.0];
              [v51 setAlpha:0.0];
              [*(id *)(*(void *)(v52 + 56) + 32) setObject:v51 forKey:v3];
              [*(id *)(*(void *)(v52 + 56) + 40) setObject:v50 forKey:v3];

              char v5 = v54;
              id v4 = v55;
              goto LABEL_33;
            }
          }
        }

        ++v31;
      }
      while (v29 != v31);
      uint64_t v46 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
      uint64_t v29 = v46;
      if (!v46)
      {
LABEL_26:

        char v5 = v54;
        id v4 = v55;
        double v6 = v53;
        a1 = v52;
LABEL_27:
        objc_msgSend(*(id *)(*(void *)(a1 + 56) + 32), "setObject:forKey:", v4, v3, v52);
        long long v47 = *(void **)(*(void *)(a1 + 56) + 40);
        long long v48 = v5;
LABEL_30:
        [v47 setObject:v48 forKey:v3];
        goto LABEL_33;
      }
    }
  }
  if (v4)
  {
    [v6 setAlpha:0.0];
    [*(id *)(*(void *)(a1 + 56) + 32) setObject:v4 forKey:v3];
    long long v47 = *(void **)(*(void *)(a1 + 56) + 40);
    long long v48 = v6;
    goto LABEL_30;
  }
  long long v49 = (void *)[v9 copy];
  [v49 setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 56) + 32) setObject:v49 forKey:v3];
  [*(id *)(*(void *)(a1 + 56) + 40) setObject:v5 forKey:v3];

LABEL_33:
}

- (UICollectionViewLayoutAttributes)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)elementIndexPath
{
  if (![(NSMutableDictionary *)self->_finalAnimationLayoutAttributesDict count]
    || (+[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, elementKind, elementIndexPath), v7 = objc_claimAutoreleasedReturnValue(), [(NSMutableDictionary *)self->_finalAnimationLayoutAttributesDict objectForKey:v7], double v8 = objc_claimAutoreleasedReturnValue(), v7, !v8))
  {
    transitioningToLayout = self->_transitioningToLayout;
    if (transitioningToLayout && (*(unsigned char *)&self->_layoutFlags & 2) == 0)
    {
      double v8 = [(UICollectionViewLayout *)self->_transitioningToLayout layoutAttributesForSupplementaryViewOfKind:elementKind atIndexPath:elementIndexPath];
      goto LABEL_15;
    }
    double v10 = [(UICollectionViewLayout *)self collectionView];
    double v11 = [v10 _currentUpdate];
    double v12 = [v10 _visibleSupplementaryViewOfKind:elementKind atIndexPath:elementIndexPath isDecorationView:0];
    CGFloat v13 = [v12 _layoutAttributes];
    double v8 = (void *)[v13 copy];

    if ((dyld_program_sdk_at_least() & 1) != 0
      || !v11
      || (objc_msgSend(v11[8], "containsIndex:", -[NSIndexPath section](elementIndexPath, "section")) & 1) != 0)
    {
      if (transitioningToLayout)
      {
LABEL_14:

        goto LABEL_15;
      }
    }
    else
    {
      char v14 = -[UICollectionViewUpdate hasDeletedAuxiliaryElementOfKind:atIndexPath:]((uint64_t)v11, elementKind, elementIndexPath);
      if (transitioningToLayout || (v14 & 1) == 0) {
        goto LABEL_14;
      }
    }
    [v8 setAlpha:0.0];
    goto LABEL_14;
  }
LABEL_15:
  return (UICollectionViewLayoutAttributes *)v8;
}

- (void)_finalizeCollectionViewItemAnimations
{
  [(NSMutableDictionary *)self->_initialAnimationLayoutAttributesDict removeAllObjects];
  finalAnimationLayoutAttributesDict = self->_finalAnimationLayoutAttributesDict;
  [(NSMutableDictionary *)finalAnimationLayoutAttributesDict removeAllObjects];
}

- (void)_setExternalObjectTable:(id)a3 forNibLoadingOfDecorationViewOfKind:(id)a4
{
  decorationViewExternalObjectsTables = self->_decorationViewExternalObjectsTables;
  if (!decorationViewExternalObjectsTables)
  {
    double v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    double v9 = self->_decorationViewExternalObjectsTables;
    self->_decorationViewExternalObjectsTables = v8;

    decorationViewExternalObjectsTables = self->_decorationViewExternalObjectsTables;
  }
  [(NSMutableDictionary *)decorationViewExternalObjectsTables setObject:a3 forKey:a4];
}

- (BOOL)_supportsAdvancedTransitionAnimations
{
  return 1;
}

- (BOOL)canBeEdited
{
  return 0;
}

- (BOOL)isEditing
{
  return 0;
}

- (void)_setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (CGRect)_frame
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double width = self->_frame.size.width;
  double height = self->_frame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_dynamicReferenceBounds
{
  [(UICollectionViewLayout *)self collectionViewContentSize];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.double height = v5;
  result.size.double width = v3;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (void)_setSections:(id)a3
{
  if (self->_sections != a3)
  {
    double v4 = (NSIndexSet *)[a3 copy];
    sections = self->_sections;
    self->_sections = v4;
  }
}

- (void)_setItems:(id)a3
{
  if (self->_items != a3)
  {
    double v4 = (NSIndexSet *)[a3 copy];
    items = self->_items;
    self->_items = v4;
  }
}

- (NSIndexSet)_items
{
  double v2 = self->_items;
  return v2;
}

- (void)_setElementKinds:(id)a3
{
  if (self->_elementKinds != a3)
  {
    double v4 = (NSArray *)[a3 copy];
    elementKinds = self->_elementKinds;
    self->_elementKinds = v4;
  }
}

- (NSArray)_elementKinds
{
  double v2 = self->_elementKinds;
  return v2;
}

- (void)_setCompositionLayout:(id)a3
{
}

- (_UICollectionViewCompositionLayout)_compositionLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compositionLayout);
  return (_UICollectionViewCompositionLayout *)WeakRetained;
}

- (void)_setSiblingLayout:(id)a3
{
}

- (UICollectionViewLayout)_siblingLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_siblingLayout);
  return (UICollectionViewLayout *)WeakRetained;
}

- (void)_setLayoutOffset:(CGPoint)a3
{
  self->_layoutOffset = a3;
}

- (CGPoint)_layoutOffset
{
  double x = self->_layoutOffset.x;
  double y = self->_layoutOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setLayoutOffsetEdges:(unint64_t)a3
{
  self->_layoutOffsetEdges = a3;
}

- (unint64_t)_layoutOffsetEdges
{
  return self->_layoutOffsetEdges;
}

- (CGPoint)_offsetInTopParentLayout:(id *)a3
{
  double x = self->_frame.origin.x;
  double y = self->_frame.origin.y;
  double v7 = [(UICollectionViewLayout *)self _compositionLayout];
  if (v7)
  {
    double v8 = v7;
    [(UICollectionViewLayout *)v7 _frame];
    double x = x + v9;
    double y = y + v10;
    uint64_t v11 = [(UICollectionViewLayout *)v8 _compositionLayout];
    if (v11)
    {
      do
      {
        double v12 = (UICollectionViewLayout *)v11;

        [(UICollectionViewLayout *)v12 _frame];
        double x = x + v13;
        double y = y + v14;
        uint64_t v11 = [(UICollectionViewLayout *)v12 _compositionLayout];
        double v8 = v12;
      }
      while (v11);
    }
    else
    {
      double v12 = v8;
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v12 = self;
    }
    else {
      double v12 = 0;
    }
  }
  CGFloat v15 = v12;
  *a3 = v15;

  double v16 = x;
  double v17 = y;
  result.double y = v17;
  result.double x = v16;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toLayout:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v33 = 0;
  [(UICollectionViewLayout *)self _offsetInTopParentLayout:&v33];
  double v12 = v11;
  double v14 = v13;
  id v15 = v33;
  id v32 = 0;
  [a4 _offsetInTopParentLayout:&v32];
  double v17 = v16;
  double v19 = v18;
  id v20 = v32;
  CGFloat v21 = v20;
  if (v15) {
    BOOL v22 = v15 == v20;
  }
  else {
    BOOL v22 = 0;
  }
  if (!v22)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 2124, @"to convert between layouts, both layouts must have non-nil parent composition layouts and have the same parent at the top of their layout tree" object file lineNumber description];
  }
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRect v35 = CGRectOffset(v34, v12 - v17, v14 - v19);
  CGFloat v23 = v35.origin.x;
  CGFloat v24 = v35.origin.y;
  CGFloat v25 = v35.size.width;
  CGFloat v26 = v35.size.height;

  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromLayout:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v33 = 0;
  [(UICollectionViewLayout *)self _offsetInTopParentLayout:&v33];
  double v12 = v11;
  double v14 = v13;
  id v15 = v33;
  id v32 = 0;
  [a4 _offsetInTopParentLayout:&v32];
  double v17 = v16;
  double v19 = v18;
  id v20 = v32;
  CGFloat v21 = v20;
  if (v15) {
    BOOL v22 = v15 == v20;
  }
  else {
    BOOL v22 = 0;
  }
  if (!v22)
  {
    uint64_t v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 2134, @"to convert between layouts, both layouts must have non-nil parent composition layouts and have the same parent at the top of their layout tree" object file lineNumber description];
  }
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRect v35 = CGRectOffset(v34, v17 - v12, v19 - v14);
  CGFloat v23 = v35.origin.x;
  CGFloat v24 = v35.origin.y;
  CGFloat v25 = v35.size.width;
  CGFloat v26 = v35.size.height;

  double v27 = v23;
  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (void)_setPrepared:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char layoutFlags = *(unsigned char *)&self->_layoutFlags & 0xFB | v3;
}

- (BOOL)_supportsPrefetchingWithEstimatedSizes
{
  return 0;
}

- (CGSize)_fallbackItemSize
{
  double v2 = 50.0;
  double v3 = 50.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (NSIndexPath)targetIndexPathForInteractivelyMovingItem:(NSIndexPath *)previousIndexPath withPosition:(CGPoint)position
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  double v5 = -[UICollectionViewLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", position.x, position.y, 1.0, 1.0);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v6) {
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  double v8 = 0;
  uint64_t v9 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v17 != v9) {
        objc_enumerationMutation(v5);
      }
      double v11 = *(_WORD **)(*((void *)&v16 + 1) + 8 * i);
      if (v11)
      {
        if (v11[144])
        {
          if (!v8
            || (uint64_t v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) zIndex], v12 > objc_msgSend(v8, "zIndex")))
          {
            double v13 = v11;

            double v8 = v13;
          }
        }
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  }
  while (v7);
  if (v8)
  {
    double v14 = [v8 indexPath];
  }
  else
  {
LABEL_15:
    double v14 = previousIndexPath;
  }

  return v14;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForInteractivelyMovingItemAtIndexPath:(NSIndexPath *)indexPath withTargetPosition:(CGPoint)position
{
  double y = position.y;
  double x = position.x;
  uint64_t v6 = [(UICollectionViewLayout *)self layoutAttributesForItemAtIndexPath:indexPath];
  uint64_t v7 = (void *)[v6 copy];

  objc_msgSend(v7, "setCenter:", x, y);
  [v7 setZIndex:0x7FFFFFFFFFFFFFFFLL];
  return (UICollectionViewLayoutAttributes *)v7;
}

- (UICollectionViewLayoutInvalidationContext)invalidationContextForInteractivelyMovingItems:(NSArray *)targetIndexPaths withTargetPosition:(CGPoint)targetPosition previousIndexPaths:(NSArray *)previousIndexPaths previousPosition:(CGPoint)previousPosition
{
  double y = targetPosition.y;
  double x = targetPosition.x;
  id v10 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  [v10 _setPreviousIndexPathsForInteractivelyMovingItems:previousIndexPaths];
  [v10 _setTargetIndexPathsForInteractivelyMovingItems:targetIndexPaths];
  objc_msgSend(v10, "_setInteractiveMovementTarget:", x, y);
  if ([(NSArray *)targetIndexPaths isEqual:previousIndexPaths]) {
    [v10 invalidateItemsAtIndexPaths:targetIndexPaths];
  }
  return (UICollectionViewLayoutInvalidationContext *)v10;
}

- (UICollectionViewLayoutInvalidationContext)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(NSArray *)indexPaths previousIndexPaths:(NSArray *)previousIndexPaths movementCancelled:(BOOL)movementCancelled
{
  id v7 = objc_alloc_init((Class)[(id)objc_opt_class() invalidationContextClass]);
  [v7 _setPreviousIndexPathsForInteractivelyMovingItems:previousIndexPaths];
  [v7 _setTargetIndexPathsForInteractivelyMovingItems:indexPaths];
  [v7 _setIntent:11];
  if ([(NSArray *)indexPaths isEqual:previousIndexPaths]) {
    [v7 invalidateItemsAtIndexPaths:indexPaths];
  }
  return (UICollectionViewLayoutInvalidationContext *)v7;
}

- (BOOL)_shouldScrollToContentBeginningInRightToLeft
{
  return 0;
}

- (BOOL)_wantsRightToLeftHorizontalMirroringIfNeeded
{
  return (*(unsigned char *)&self->_layoutFlags >> 3) & 1;
}

- (UIEdgeInsets)_focusFastScrollingIndexBarInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)_frameForScrollingToFirstElementInSectionAtIndex:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)_layoutAttributesForNextItemInDirection:(CGPoint)a3 fromIndexPath:(id)a4 constrainedToRect:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  double v13 = [(UICollectionViewLayout *)self layoutAttributesForItemAtIndexPath:"layoutAttributesForItemAtIndexPath:"];
  double v14 = v13;
  if (!v13) {
    goto LABEL_13;
  }
  double v44 = height;
  double v45 = y;
  double v15 = x;
  double v16 = width;
  double v17 = v11;
  [v13 frame];
  CGFloat v18 = v71.origin.x;
  CGFloat v19 = v71.origin.y;
  CGFloat v20 = v71.size.width;
  double v21 = v10;
  CGFloat v22 = v71.size.height;
  CGFloat MidX = CGRectGetMidX(v71);
  v72.origin.CGFloat x = v18;
  v72.origin.CGFloat y = v19;
  v72.size.CGFloat width = v20;
  v72.size.CGFloat height = v22;
  double v23 = v21;
  double MidY = CGRectGetMidY(v72);
  if (v21 < 0.0)
  {
    double v25 = MidY - v45;
    double v26 = v17;
    double v27 = v16;
    double v28 = v45;
    goto LABEL_12;
  }
  double v26 = v17;
  if (v21 > 0.0)
  {
    double v25 = v45 + v44 - MidY;
    double v28 = MidY;
    double v27 = v16;
    goto LABEL_12;
  }
  double v25 = v44;
  if (v17 < 0.0)
  {
    double v29 = MidX;
LABEL_10:
    double v27 = v29 - v15;
    double v28 = v45;
    goto LABEL_12;
  }
  if (v17 > 0.0)
  {
    double v29 = v15 + v16;
    double v15 = MidX;
    goto LABEL_10;
  }
  double v15 = *MEMORY[0x1E4F28AD8];
  double v28 = *(double *)(MEMORY[0x1E4F28AD8] + 8);
  double v27 = *(double *)(MEMORY[0x1E4F28AD8] + 16);
  double v25 = *(double *)(MEMORY[0x1E4F28AD8] + 24);
LABEL_12:
  v73.origin.CGFloat x = v15;
  v73.origin.CGFloat y = v28;
  v73.size.CGFloat width = v27;
  v73.size.CGFloat height = v25;
  if (CGRectIsEmpty(v73))
  {
LABEL_13:
    double v30 = 0;
    goto LABEL_30;
  }
  uint64_t v31 = -[UICollectionViewLayout _extendedAttributesQueryIncludingOrthogonalScrollingRegions:](self, "_extendedAttributesQueryIncludingOrthogonalScrollingRegions:", v15, v28, v27, v25);
  if ([v31 count])
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v33 = v31;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v64 objects:v68 count:16];
    if (v34)
    {
      uint64_t v35 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v65 != v35) {
            objc_enumerationMutation(v33);
          }
          id v37 = objc_msgSend(*(id *)(*((void *)&v64 + 1) + 8 * i), "indexPath", *(void *)&MidX);
          uint64_t v38 = [v37 section];
          uint64_t v39 = [a4 section];
          if (v38 - v39 >= 0) {
            uint64_t v40 = v38 - v39;
          }
          else {
            uint64_t v40 = v39 - v38;
          }
          [v32 addIndex:v40];
        }
        uint64_t v34 = [v33 countByEnumeratingWithState:&v64 objects:v68 count:16];
      }
      while (v34);
    }

    uint64_t v58 = 0;
    uint64_t v59 = &v58;
    uint64_t v60 = 0x3032000000;
    long long v61 = __Block_byref_object_copy__44;
    long long v62 = __Block_byref_object_dispose__44;
    id v63 = 0;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __98__UICollectionViewLayout__layoutAttributesForNextItemInDirection_fromIndexPath_constrainedToRect___block_invoke;
    v46[3] = &unk_1E52E62C0;
    id v47 = v33;
    id v48 = a4;
    double v50 = v15;
    double v51 = v28;
    double v52 = v27;
    double v53 = v25;
    CGFloat v54 = MidX;
    double v55 = MidY;
    double v56 = v26;
    double v57 = v23;
    long long v49 = &v58;
    [v32 enumerateIndexesUsingBlock:v46];
    double v30 = (void *)v59[5];
    if (v30) {
      id v41 = v30;
    }

    _Block_object_dispose(&v58, 8);
  }
  else
  {
    double v30 = 0;
  }

LABEL_30:
  return v30;
}

void __98__UICollectionViewLayout__layoutAttributesForNextItemInDirection_fromIndexPath_constrainedToRect___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  double v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v53 count:16];
  if (!v7)
  {
LABEL_49:

    return;
  }
  uint64_t v8 = v7;
  uint64_t v46 = a3;
  id v47 = 0;
  uint64_t v9 = *(void *)v50;
  double v10 = 1.79769313e308;
  id v48 = v6;
  do
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v50 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(_WORD **)(*((void *)&v49 + 1) + 8 * v11);
      double v13 = [v12 indexPath];
      uint64_t v14 = [v13 section];

      uint64_t v15 = [*(id *)(a1 + 40) section];
      uint64_t v16 = v14 - v15;
      if (v14 - v15 < 0) {
        uint64_t v16 = v15 - v14;
      }
      if (v16 == a2)
      {
        uint64_t v17 = v15;
        [v12 frame];
        if (v12)
        {
          if (v12[144])
          {
            CGFloat v22 = v18;
            CGFloat v23 = v19;
            CGFloat v24 = v20;
            CGFloat v25 = v21;
            double v26 = [v12 indexPath];
            if ([v26 isEqual:*(void *)(a1 + 40)]) {
              goto LABEL_12;
            }
            v57.origin.CGFloat x = v22;
            v57.origin.CGFloat y = v23;
            v57.size.CGFloat width = v24;
            v57.size.CGFloat height = v25;
            BOOL v27 = NSIntersectsRect(*(NSRect *)(a1 + 56), v57);

            if (!v27) {
              goto LABEL_23;
            }
            v55.origin.CGFloat x = v22;
            v55.origin.CGFloat y = v23;
            v55.size.CGFloat width = v24;
            v55.size.CGFloat height = v25;
            double MidX = CGRectGetMidX(v55);
            v56.origin.CGFloat x = v22;
            v56.origin.CGFloat y = v23;
            v56.size.CGFloat width = v24;
            v56.size.CGFloat height = v25;
            CGFloat MidY = CGRectGetMidY(v56);
            double v30 = MidX - *(double *)(a1 + 88);
            double v31 = MidY - *(double *)(a1 + 96);
            double v32 = v30 * v30 + v31 * v31;
            if (v32 < v10)
            {
              if (v14 == v17)
              {
                double v33 = *(double *)(a1 + 112);
                double v6 = v48;
                if (v33 >= 0.0)
                {
                  if (v33 <= 0.0)
                  {
                    double v39 = *(double *)(a1 + 104);
                    if (v39 >= 0.0)
                    {
                      if (v39 <= 0.0 || v30 >= 0.0 && fabs(v31) <= v30) {
                        goto LABEL_27;
                      }
                    }
                    else
                    {
                      BOOL v36 = v30 <= 0.0;
                      double v40 = fabs(v31);
                      double v41 = fabs(v30);
                      if (v36 && v40 <= v41)
                      {
LABEL_27:
                        double v26 = v47;
                        id v47 = v12;
                        double v10 = v32;
LABEL_12:
                      }
                    }
                  }
                  else
                  {
                    double v37 = fabs(v30);
                    if (v31 >= 0.0 && v37 <= v31) {
                      goto LABEL_27;
                    }
                  }
                }
                else
                {
                  BOOL v36 = v31 <= 0.0;
                  double v34 = fabs(v30);
                  double v35 = fabs(v31);
                  BOOL v36 = v36 && v34 <= v35;
                  if (v36) {
                    goto LABEL_27;
                  }
                }
              }
              else
              {
                double v6 = v48;
                if (v30 * *(double *)(a1 + 104) + v31 * *(double *)(a1 + 112) > 0.0) {
                  goto LABEL_27;
                }
              }
            }
            else
            {
LABEL_23:
              double v6 = v48;
            }
          }
        }
      }
      ++v11;
    }
    while (v8 != v11);
    uint64_t v43 = [v6 countByEnumeratingWithState:&v49 objects:v53 count:16];
    uint64_t v8 = v43;
  }
  while (v43);

  if (v47)
  {
    uint64_t v44 = *(void *)(*(void *)(a1 + 48) + 8);
    double v45 = *(void **)(v44 + 40);
    *(void *)(v44 + 40) = v47;
    double v6 = v47;

    unsigned char *v46 = 1;
    goto LABEL_49;
  }
}

- (id)_layoutAttributesForInsertionIndicatorAtItemWithTargetAttributes:(id)a3 targetPositionEdges:(unint64_t)a4
{
  collectionView = self->_collectionView;
  uint64_t v9 = [a3 indexPath];
  uint64_t v10 = [(UICollectionView *)collectionView _globalIndexPathForItemAtIndexPath:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 2431, @"Invalid parameter not satisfying: %@", @"targetGlobalIndex != NSNotFound" object file lineNumber description];
  }
  uint64_t v11 = [(UICollectionViewLayout *)self _previousLayoutAttributesForGlobalIndex:v10];
  uint64_t v12 = [(UICollectionViewLayout *)self _nextLayoutAttributesForGlobalIndex:v10];
  unint64_t v13 = [(UICollectionViewLayout *)self _layoutAxisForAttributes:a3 previousAttributes:v11 nextAttributes:v12];
  [a3 frame];
  -[UICollectionViewLayout _frameForInsertionIndicatorForTargetFrame:axis:edges:](self, "_frameForInsertionIndicatorForTargetFrame:axis:edges:", v13, a4);
  -[UICollectionViewLayout _centerInsertionIndicatorFrame:targetAttributes:axis:edges:](self, "_centerInsertionIndicatorFrame:targetAttributes:axis:edges:", a3, v13, a4);
  double x = v23.origin.x;
  double y = v23.origin.y;
  double width = v23.size.width;
  double height = v23.size.height;
  if (CGRectIsNull(v23))
  {
    double v18 = 0;
  }
  else
  {
    double v19 = [(UICollectionViewLayout *)self _indexPathForInsertionIndicatorForTargetAttributes:a3 axis:v13 edges:a4 previousAttributes:v11 nextAttributes:v12];
    double v18 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "layoutAttributesClass"), "layoutAttributesForCellWithIndexPath:", v19);
    objc_msgSend(v18, "setFrame:", x, y, width, height);
  }
  return v18;
}

- (id)_layoutAttributesForInsertionIndicatorAtTargetPosition:(CGPoint)a3 sourceIndexPath:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v8 = -[UICollectionViewLayout _layoutAttributesForItemNearestPosition:maximumDistance:](self, "_layoutAttributesForItemNearestPosition:maximumDistance:", a3.x, a3.y, 1000.0);
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 frame];
    uint64_t v14 = [(UICollectionViewLayout *)self _layoutAttributesForInsertionIndicatorAtItemWithTargetAttributes:v9 targetPositionEdges:_UIDirectionalRectEdgesForLocationRelativeToRectWithDefaultEdges(12, x, y, v10, v11, v12, v13)];
    uint64_t v15 = [v14 indexPath];
    uint64_t v16 = (void *)v15;
    if (a4)
    {
      if (v15)
      {
        uint64_t v17 = [a4 section];
        if (v17 == [v16 section] && objc_msgSend(a4, "compare:", v16) == -1)
        {
          double v18 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v16, "item") - 1, objc_msgSend(v16, "section"));
          [v14 setIndexPath:v18];
        }
      }
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)_layoutAttributesForInsertionIndicatorAtTargetIndexPath:(id)a3
{
  uint64_t v5 = [(UICollectionViewLayout *)self layoutAttributesForItemAtIndexPath:"layoutAttributesForItemAtIndexPath:"];
  if (v5)
  {
    double v6 = (void *)v5;
LABEL_3:
    uint64_t v7 = 3;
    goto LABEL_6;
  }
  if ([a3 item] < 1)
  {
    double v6 = 0;
    goto LABEL_3;
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(a3, "item") - 1, objc_msgSend(a3, "section"));
  double v6 = [(UICollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v8];

  uint64_t v7 = 12;
LABEL_6:
  uint64_t v9 = [(UICollectionViewLayout *)self _layoutAttributesForInsertionIndicatorAtItemWithTargetAttributes:v6 targetPositionEdges:v7];

  return v9;
}

- (CGRect)_frameForInsertionIndicatorForTargetFrame:(CGRect)a3 axis:(unint64_t)a4 edges:(unint64_t)a5
{
  char v5 = a5;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a4 == 2)
  {
    double MinX = CGRectGetMinX(a3);
    CGFloat v11 = x;
    CGFloat v12 = y;
    CGFloat v13 = width;
    CGFloat v14 = height;
    if (v5) {
      double MaxY = CGRectGetMinY(*(CGRect *)&v11) + -5.0;
    }
    else {
      double MaxY = CGRectGetMaxY(*(CGRect *)&v11);
    }
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    double v16 = CGRectGetWidth(v20);
    double v17 = 5.0;
  }
  else if (a4 == 1)
  {
    if ((a5 & 2) != 0) {
      double MinX = CGRectGetMinX(a3) + -5.0;
    }
    else {
      double MinX = CGRectGetMaxX(a3);
    }
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double MaxY = CGRectGetMinY(v21);
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    double v17 = CGRectGetHeight(v22);
    double v16 = 5.0;
  }
  else
  {
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double MinX = *MEMORY[0x1E4F1DB20];
    double MaxY = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  }
  double v18 = MinX;
  double v19 = MaxY;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)_centerInsertionIndicatorFrame:(CGRect)a3 targetAttributes:(id)a4 axis:(unint64_t)a5 edges:(unint64_t)a6
{
  char v6 = a6;
  CGFloat height = a3.size.height;
  double x = a3.origin.x;
  double rect = a3.size.width;
  double y = a3.origin.y;
  if (a4)
  {
    __int16 v11 = *((_WORD *)a4 + 144);
    uint64_t v12 = 1;
    if ((v11 & 2) != 0) {
      uint64_t v12 = 2;
    }
    if (v11) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  CGFloat v14 = [a4 indexPath];
  [a4 frame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v23 = _UIUnitVectorFromDirectionalRectEdgeAndPermittedAxis(v6, a5);
  CGFloat v25 = -[UICollectionViewLayout _layoutAttributesForElementsInProjectedRect:withProjectionVector:projectionDistance:](self, "_layoutAttributesForElementsInProjectedRect:withProjectionVector:projectionDistance:", v16, v18, v20, v22, v23, v24, 200.0);
  uint64_t v68 = 0;
  uint64_t v69 = &v68;
  uint64_t v70 = 0x3032000000;
  CGRect v71 = __Block_byref_object_copy__44;
  CGRect v72 = __Block_byref_object_dispose__44;
  id v73 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  v67[3] = 0x7FEFFFFFFFFFFFFFLL;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __85__UICollectionViewLayout__centerInsertionIndicatorFrame_targetAttributes_axis_edges___block_invoke;
  v58[3] = &unk_1E52E62E8;
  id v26 = v14;
  double v63 = v16;
  double v64 = v18;
  double v65 = v20;
  double v66 = v22;
  id v59 = v26;
  uint64_t v60 = v67;
  long long v61 = &v68;
  uint64_t v62 = v13;
  [v25 enumerateObjectsUsingBlock:v58];
  BOOL v27 = (void *)v69[5];
  if (!v27) {
    goto LABEL_25;
  }
  [v27 frame];
  CGFloat v53 = v31;
  CGFloat v32 = v28;
  CGFloat v33 = v29;
  CGFloat v34 = v30;
  double v54 = height;
  if (a5 == 2)
  {
    v74.origin.double y = y;
    v74.origin.double x = x;
    v74.size.CGFloat width = rect;
    v74.size.CGFloat height = height;
    CGFloat MinX = CGRectGetMinX(v74);
    if (v6)
    {
      v83.origin.double x = v32;
      v83.origin.double y = v33;
      v83.size.CGFloat width = v34;
      v83.size.CGFloat height = v53;
      CGFloat MaxY = CGRectGetMaxY(v83);
      v84.origin.double y = y;
      v84.origin.double x = x;
      v84.size.CGFloat width = rect;
      v84.size.CGFloat height = height;
      double Width = CGRectGetWidth(v84);
      v85.origin.double x = v16;
      v85.origin.double y = v18;
      v85.size.CGFloat width = v20;
      v85.size.CGFloat height = v22;
      double MinY = CGRectGetMinY(v85);
      v86.origin.double x = v32;
      v86.origin.double y = v33;
      v86.size.CGFloat width = v34;
      v86.size.CGFloat height = v53;
      double v37 = MinY - CGRectGetMaxY(v86);
    }
    else
    {
      v75.origin.double x = v16;
      v75.origin.double y = v18;
      v75.size.CGFloat width = v20;
      v75.size.CGFloat height = v22;
      CGFloat MaxY = CGRectGetMaxY(v75);
      v76.origin.double y = y;
      v76.origin.double x = x;
      v76.size.CGFloat width = rect;
      v76.size.CGFloat height = height;
      double Width = CGRectGetWidth(v76);
      v77.origin.double x = v32;
      v77.origin.double y = v33;
      v77.size.CGFloat width = v34;
      v77.size.CGFloat height = v53;
      double v36 = CGRectGetMinY(v77);
      v78.origin.double x = v16;
      v78.origin.double y = v18;
      v78.size.CGFloat width = v20;
      v78.size.CGFloat height = v22;
      double v37 = v36 - CGRectGetMaxY(v78);
    }
LABEL_18:
    double v46 = MaxY;
    double v45 = MinX;
    goto LABEL_19;
  }
  if (a5 == 1)
  {
    if ((v6 & 2) != 0)
    {
      CGFloat MinX = CGRectGetMaxX(*(CGRect *)&v28);
      v87.origin.double y = y;
      v87.origin.double x = x;
      v87.size.CGFloat width = rect;
      v87.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMinY(v87);
      v88.origin.double x = v16;
      v88.origin.double y = v18;
      v88.size.CGFloat width = v20;
      v88.size.CGFloat height = v22;
      double v38 = CGRectGetMinX(v88);
      CGFloat v39 = v32;
      CGFloat v40 = v33;
      CGFloat v41 = v34;
      CGFloat v42 = v53;
    }
    else
    {
      v79.origin.double x = v16;
      v79.origin.double y = v18;
      v79.size.CGFloat width = v20;
      v79.size.CGFloat height = v22;
      CGFloat MinX = CGRectGetMaxX(v79);
      v80.origin.double y = y;
      v80.origin.double x = x;
      v80.size.CGFloat width = rect;
      v80.size.CGFloat height = height;
      CGFloat MaxY = CGRectGetMinY(v80);
      v81.origin.double x = v32;
      v81.origin.double y = v33;
      v81.size.CGFloat width = v34;
      v81.size.CGFloat height = v53;
      double v38 = CGRectGetMinX(v81);
      CGFloat v39 = v16;
      CGFloat v40 = v18;
      CGFloat v41 = v20;
      CGFloat v42 = v22;
    }
    double MaxX = CGRectGetMaxX(*(CGRect *)&v39);
    v82.origin.double y = y;
    v82.origin.double x = x;
    v82.size.CGFloat width = rect;
    v82.size.CGFloat height = v54;
    double v37 = CGRectGetHeight(v82);
    double Width = v38 - MaxX;
    goto LABEL_18;
  }
  double Width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v37 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  double v45 = *MEMORY[0x1E4F1DB20];
  double v46 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
LABEL_19:
  v89.origin.double x = v45;
  v89.origin.double y = v46;
  v89.size.CGFloat width = Width;
  v89.size.CGFloat height = v37;
  if (CGRectIsNull(v89))
  {
LABEL_24:
    CGFloat height = v54;
    goto LABEL_25;
  }
  if (a5 == 1)
  {
    double x = round(v45 + (Width - rect) * 0.5);
    goto LABEL_24;
  }
  if (a5 != 2) {
    goto LABEL_24;
  }
  CGFloat height = v54;
  double y = round(v46 + (v37 - v54) * 0.5);
LABEL_25:

  _Block_object_dispose(v67, 8);
  _Block_object_dispose(&v68, 8);

  double v48 = y;
  double v47 = x;
  double v49 = rect;
  double v50 = height;
  result.size.CGFloat height = v50;
  result.size.CGFloat width = v49;
  result.origin.double y = v48;
  result.origin.double x = v47;
  return result;
}

void __85__UICollectionViewLayout__centerInsertionIndicatorFrame_targetAttributes_axis_edges___block_invoke(uint64_t a1, _WORD *a2)
{
  if (!a2 || (__int16 v4 = a2[144], (v4 & 1) != 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    if ((v4 & 2) != 0) {
      return;
    }
    uint64_t v5 = 1;
  }
  char v6 = [a2 indexPath];
  if ([v6 isEqual:*(void *)(a1 + 32)])
  {
    uint64_t v7 = *(void *)(a1 + 56);

    if (v5 == v7) {
      return;
    }
  }
  else
  {
  }
  [a2 frame];
  double v12 = UIDistanceBetweenRects(v8, v9, v10, v11, *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80), *(CGFloat *)(a1 + 88));
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v12 < *(double *)(v13 + 24))
  {
    *(double *)(v13 + 24) = v12;
    CGFloat v14 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    objc_storeStrong(v14, a2);
  }
}

- (id)_indexPathForInsertionIndicatorForTargetAttributes:(id)a3 axis:(unint64_t)a4 edges:(unint64_t)a5 previousAttributes:(id)a6 nextAttributes:(id)a7
{
  char v8 = a5;
  double v12 = [a3 indexPath];
  uint64_t v13 = v12;
  if (a4 == 1)
  {
    if ((v8 & 8) != 0) {
      goto LABEL_10;
    }
    if ((v8 & 2) != 0) {
      goto LABEL_5;
    }
LABEL_8:
    double v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 2641, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];

    goto LABEL_9;
  }
  if (a4 != 2) {
    goto LABEL_8;
  }
  if ((v8 & 4) == 0)
  {
    if (v8)
    {
LABEL_5:
      id v14 = v12;
      goto LABEL_20;
    }
    goto LABEL_8;
  }
LABEL_10:
  if (!a7)
  {
    int64_t v17 = [(UICollectionView *)self->_collectionView _globalIndexPathForItemAtIndexPath:v12];
    if (v17 != 0x7FFFFFFFFFFFFFFFLL
      && v17 + 1 == [(UICollectionView *)self->_collectionView _totalItemCount])
    {
      objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v13, "item") + 1, objc_msgSend(v13, "section"));
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_9:
    double v16 = 0;
    goto LABEL_21;
  }
  if ((unint64_t)[v12 length] >= 2)
  {
    double v16 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v13, "item") + 1, objc_msgSend(v13, "section"));
    if ([(UICollectionView *)self->_collectionView _indexPathIsSectionAppendingIndexPath:v16])
    {
      if (v16) {
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
  id v14 = [a7 indexPath];
LABEL_20:
  double v16 = v14;
LABEL_21:

  return v16;
}

- (BOOL)_allowsItemInteractionsToBegin
{
  return 1;
}

- (NSDirectionalEdgeInsets)_supplementaryViewInsetsForScrollingToItemAtIndexPath:(id)a3
{
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = 0.0;
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (unint64_t)_layoutAxisForAttributes:(id)a3 previousAttributes:(id)a4 nextAttributes:(id)a5
{
  if (a3) {
    BOOL v6 = a4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  int v7 = !v6;
  if (v7 == 1 && a5 != 0)
  {
    return _UILayoutAxisForAttributeTriple(a4, a3, a5);
  }
  if (!a5 && ((v7 ^ 1) & 1) == 0)
  {
    id v10 = a4;
    id v11 = a3;
LABEL_22:
    return _UILayoutAxisForAttributePair(v10, v11);
  }
  if (a3 && !a4 && a5)
  {
    id v10 = a3;
    id v11 = a5;
    goto LABEL_22;
  }
  unint64_t result = 0;
  if (a3 && !a4 && !a5)
  {
    unint64_t v13 = [(UICollectionViewLayout *)self _layoutAxis];
    if (v13 - 1 > 1) {
      return 0;
    }
    unint64_t v14 = v13;
    [a3 frame];
    double v16 = v15;
    double v18 = v17;
    uint64_t v19 = v14 == 1 ? 2 : v14 == 2;
    [(UICollectionViewLayout *)self collectionViewContentSize];
    double v22 = _UISizeValueForAxis(v19, v20, v21);
    double v23 = _UISizeValueForAxis(v19, v16, v18);
    if (fabs(v22) >= 2.22044605e-16)
    {
      if (v23 / v22 <= 0.5) {
        return v19;
      }
      else {
        return v14;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)_previousLayoutAttributesForGlobalIndex:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    BOOL v6 = 0;
  }
  else
  {
    double v5 = -[UICollectionView _indexPathForGlobalIndex:](self->_collectionView, "_indexPathForGlobalIndex:");
    if (!v5)
    {
      char v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 2722, @"Invalid parameter not satisfying: %@", @"previousIndexPath" object file lineNumber description];
    }
    BOOL v6 = [(UICollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v5];
    if (!v6)
    {
      CGFloat v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 2724, @"Invalid parameter not satisfying: %@", @"previousAttributes" object file lineNumber description];
    }
  }
  return v6;
}

- (id)_nextLayoutAttributesForGlobalIndex:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL
    || a3 + 1 >= [(UICollectionView *)self->_collectionView _totalItemCount])
  {
    BOOL v6 = 0;
  }
  else
  {
    double v5 = -[UICollectionView _indexPathForGlobalIndex:](self->_collectionView, "_indexPathForGlobalIndex:");
    if (!v5)
    {
      char v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 2739, @"Invalid parameter not satisfying: %@", @"nextIndexPath" object file lineNumber description];
    }
    BOOL v6 = [(UICollectionViewLayout *)self layoutAttributesForItemAtIndexPath:v5];
  }
  return v6;
}

- (id)_layoutAttributesForElementsInProjectedRect:(CGRect)a3 withProjectionVector:(CGVector)a4 projectionDistance:(double)a5
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (fabs(a5) < 2.22044605e-16
    || ((ddouble y = a4.dy, dx = a4.dx, width = a3.size.width, v10 = fabs(a4.dy), fabs(a4.dx) < 2.22044605e-16)
      ? (BOOL v11 = v10 < 2.22044605e-16)
      : (BOOL v11 = 0),
        v11))
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    double height = a3.size.height;
    long double v15 = hypot(a4.dx, a4.dy);
    double v16 = x + width * 0.5 + dx / v15 * a5;
    double v17 = y + height * 0.5 + dy / v15 * a5;
    v38.origin.double y = round(v17 - height * 0.5);
    v38.origin.double x = round(v16 - width * 0.5);
    v36.origin.double x = x;
    v36.origin.double y = y;
    v36.size.double width = width;
    v36.size.double height = height;
    v38.size.double width = width;
    v38.size.double height = height;
    CGRect v37 = CGRectUnion(v36, v38);
    double v18 = -[UICollectionViewLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
    if ([v18 count])
    {
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v18];
      id v20 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __110__UICollectionViewLayout__layoutAttributesForElementsInProjectedRect_withProjectionVector_projectionDistance___block_invoke;
      v23[3] = &unk_1E52E6310;
      double v25 = x + width * 0.5;
      double v26 = y + height * 0.5;
      double v27 = v16;
      double v28 = v17;
      double v29 = v25;
      double v30 = v26;
      double v31 = x;
      double v32 = y;
      double v33 = width;
      double v34 = height;
      id v24 = v20;
      id v21 = v20;
      [v19 enumerateObjectsUsingBlock:v23];
      [v19 removeObjectsAtIndexes:v21];
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  return v19;
}

uint64_t __110__UICollectionViewLayout__layoutAttributesForElementsInProjectedRect_withProjectionVector_projectionDistance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  [a2 center];
  double v8 = *(double *)(a1 + 40);
  double v9 = *(double *)(a1 + 48);
  double v10 = *(double *)(a1 + 56);
  double v11 = *(double *)(a1 + 64);
  double v12 = v11 - v9;
  double v13 = v10 - v8;
  double v14 = vabdd_f64(v9 * v10 + v6 * (v11 - v9) - v7 * (v10 - v8), v8 * v11);
  double v15 = sqrt(v13 * v13 + v12 * v12);
  double v16 = v14 / v15;
  if (fabs(v15) < 2.22044605e-16) {
    double v16 = 1.79769313e308;
  }
  double v17 = sqrt((*(double *)(a1 + 72) - v6) * (*(double *)(a1 + 72) - v6)+ (*(double *)(a1 + 80) - v7) * (*(double *)(a1 + 80) - v7));
  double v18 = sqrt(v17 * v17 - v16 * v16);
  long double v19 = hypot(v13, v12);
  long double v20 = v8 + v13 / v19 * v18;
  long double v21 = v9 + v12 / v19 * v18;
  double v22 = *(double *)(a1 + 104);
  double v23 = *(double *)(a1 + 112);
  CGFloat v24 = round(v21 - v23 * 0.5);
  CGFloat v25 = round(v20 - v22 * 0.5);
  [a2 frame];
  v34.origin.double x = v26;
  v34.origin.double y = v27;
  v34.size.double width = v28;
  v34.size.double height = v29;
  v33.origin.double x = v25;
  v33.origin.double y = v24;
  v33.size.double width = v22;
  v33.size.double height = v23;
  uint64_t result = CGRectIntersectsRect(v33, v34);
  if ((result & 1) == 0)
  {
    double v31 = *(void **)(a1 + 32);
    return [v31 addIndex:a3];
  }
  return result;
}

- (id)_layoutAttributesForItemNearestPosition:(CGPoint)a3 maximumDistance:(double)a4
{
  CGFloat y = a3.y;
  double x = a3.x;
  double v6 = fabs(a4);
  double v7 = a4 * 0.5;
  if (v6 < 2.22044605e-16) {
    double v7 = 1.0;
  }
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  double v16 = __Block_byref_object_copy__44;
  double v17 = __Block_byref_object_dispose__44;
  id v18 = 0;
  double v8 = -[UICollectionViewLayout layoutAttributesForElementsInRect:](self, "layoutAttributesForElementsInRect:", round(x - v7 * 0.5), round(a3.y - v7 * 0.5), v7, v7);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0x7FEFFFFFFFFFFFFFLL;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__UICollectionViewLayout__layoutAttributesForItemNearestPosition_maximumDistance___block_invoke;
  v11[3] = &unk_1E52E6338;
  *(double *)&v11[6] = x;
  *(CGFloat *)&v11[7] = y;
  v11[4] = v12;
  v11[5] = &v13;
  [v8 enumerateObjectsUsingBlock:v11];
  id v9 = (id)v14[5];
  _Block_object_dispose(v12, 8);

  _Block_object_dispose(&v13, 8);
  return v9;
}

void __82__UICollectionViewLayout__layoutAttributesForItemNearestPosition_maximumDistance___block_invoke(uint64_t a1, _WORD *a2)
{
  if (a2)
  {
    if (a2[144])
    {
      [a2 frame];
      UIDistanceBetweenPointAndRect(*(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56), v4, v5, v6, v7);
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      if (v8 < *(double *)(v9 + 24))
      {
        *(double *)(v9 + 24) = v8;
        double v10 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        objc_storeStrong(v10, a2);
      }
    }
  }
}

- (unint64_t)_edgesForSafeAreaPropagationToDescendants
{
  return 0;
}

- (BOOL)_disallowsFadeCellsForBoundsChange
{
  return 0;
}

- (CGRect)_contentFrameForSection:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_layoutFrameForSection:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB20];
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGPoint)_offsetForOrthogonalScrollingSection:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.CGFloat y = v4;
  result.double x = v3;
  return result;
}

- (CGRect)_orthogonalScrollingLayoutRectForSection:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)_orthogonalScrollingContentRectForSection:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.CGFloat y = v4;
  result.origin.double x = v3;
  return result;
}

- (unint64_t)_orthogonalScrollingAxis
{
  return 0;
}

- (BOOL)_shouldOrthogonalScrollingSectionSupplementaryScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4
{
  return 1;
}

- (BOOL)_shouldOrthogonalScrollingSectionDecorationScrollWithContentForIndexPath:(id)a3 elementKind:(id)a4
{
  return 1;
}

- (BOOL)_orthogonalScrollingElementShouldAppearAboveForAttributes:(id)a3
{
  return 0;
}

- (id)_leadingSwipeActionsConfigurationForIndexPath:(id)a3
{
  return 0;
}

- (id)_trailingSwipeActionsConfigurationForIndexPath:(id)a3
{
  return 0;
}

- (BOOL)_supportsSwipeActionsForIndexPath:(id)a3
{
  return 0;
}

- (BOOL)_wantsBandSelectionVisualsInSection:(int64_t)a3
{
  return 1;
}

- (BOOL)_allowsPanningAcrossConstrainedAxisToBeginMultiSelectInteractionInSection:(int64_t)a3
{
  return 1;
}

- (BOOL)_wantsCustomSectionContainers
{
  return 0;
}

- (id)_sectionDescriptorForSectionIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)_sublayoutType
{
  return self->_sublayoutType;
}

- (void)_setSublayoutType:(int64_t)a3
{
  self->_sublayoutType = a3;
}

@end