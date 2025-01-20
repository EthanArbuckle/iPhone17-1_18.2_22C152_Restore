@interface _UICollectionViewLayoutSwipeActionsModule
- (BOOL)_canIgnoreInvalidationContext:(id)a3;
- (BOOL)_canSwipeItemAtIndexPath:(id)a3;
- (BOOL)hasActiveSwipe;
- (BOOL)swipeActionController:(id)a3 insertActionsView:(id)a4 forItemAtIndexPath:(id)a5;
- (BOOL)swipeActionController:(id)a3 mayBeginSwipeForItemAtIndexPath:(id)a4;
- (UICollectionViewLayout)host;
- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4;
- (UISwipeActionController)swipeActionController;
- (UISwipeOccurrence)currentSwipeOccurrence;
- (_UICollectionViewLayoutSwipeActionsModule)initWithHost:(id)a3;
- (id)_cellWithCustomGroupingAtIndexPath:(id)a3;
- (id)gestureRecognizerViewForSwipeActionController:(id)a3;
- (id)indexPathsWithActiveSwipes;
- (id)itemContainerViewForSwipeActionController:(id)a3;
- (id)propertyAnimatorForCollectionViewUpdates:(id)a3 withCustomAnimator:(id)a4;
- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4;
- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4;
- (id)swipeViewManipulatorForSwipeActionController:(id)a3;
- (int64_t)layoutDirectionForSwipeActionController:(id)a3;
- (int64_t)swipeActionsStyleForSwipedItemAtIndexPath:(id)a3;
- (void)_invalidateSwipeActionsLayoutRefreshingActiveConfigurations:(BOOL)a3;
- (void)_performForcedCollectionViewLayoutPreservingExistingLayoutAttributes;
- (void)_transformLayoutAttributes:(id)a3 ofSeparatorAtBottom:(BOOL)a4 forSwipeOccurrence:(id)a5 isDisappearing:(BOOL)a6;
- (void)_updateSwipeActionsConfiguration:(id)a3 forIndexPath:(id)a4;
- (void)editingStateDidChange;
- (void)finalizeCollectionViewUpdate:(id)a3;
- (void)processLayoutInvalidationWithContext:(id)a3 updateConfigurations:(BOOL)a4;
- (void)revealTrailingSwipeActionsForIndexPath:(id)a3;
- (void)setHost:(id)a3;
- (void)setSwipeActionController:(id)a3;
- (void)swipeActionController:(id)a3 cleanupActionsView:(id)a4 forItemAtIndexPath:(id)a5;
- (void)swipeActionController:(id)a3 didBeginSwipeForItemAtIndexPath:(id)a4;
- (void)swipeActionController:(id)a3 didEndSwipeForItemAtIndexPath:(id)a4;
- (void)swipeActionController:(id)a3 swipeOccurrence:(id)a4 didChangeStateFrom:(int64_t)a5 to:(int64_t)a6;
- (void)swipeActionController:(id)a3 willBeginSwipeForItemAtIndexPath:(id)a4;
- (void)swipeItemAtIndexPath:(id)a3 direction:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)teardown;
- (void)transformCellLayoutAttributes:(id)a3 isDisappearing:(BOOL)a4;
- (void)transformDecorationLayoutAttributes:(id)a3 isDisappearing:(BOOL)a4;
- (void)updateWithDataSourceTranslator:(id)a3;
@end

@implementation _UICollectionViewLayoutSwipeActionsModule

- (void)transformDecorationLayoutAttributes:(id)a3 isDisappearing:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = a3;
  v36 = v7;
  if (!v7 || (v7[144] & 2) == 0)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    v35 = NSStringFromSelector(a2);
    [v34 handleFailureInMethod:a2, self, @"_UICollectionViewLayoutSwipeActionsModule.m", 769, @"-%@ should only be called with layout attributes for decoration views", v35 object file lineNumber description];

    v7 = v36;
  }
  swipeActionController = self->_swipeActionController;
  v9 = [v7 indexPath];
  v10 = [(UISwipeActionController *)swipeActionController _existingSwipeOccurrenceForIndexPath:v9];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  v12 = [WeakRetained collectionView];

  v13 = [v36 indexPath];
  uint64_t v14 = [v12 _globalIndexPathForItemAtIndexPath:v13];

  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = 0;
  }
  else
  {
    v16 = [v12 _indexPathForGlobalIndex:v14 + 1];
    if (v16)
    {
      v15 = [(UISwipeActionController *)self->_swipeActionController _existingSwipeOccurrenceForIndexPath:v16];
    }
    else
    {
      v15 = 0;
    }
  }
  -[UIBarButtonItemGroup _items]((id *)v36);
  v17 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17 == @"UICollectionViewListLayoutElementKindSwipeActions"
    || v17
    && (int v19 = [(__CFString *)v17 isEqual:@"UICollectionViewListLayoutElementKindSwipeActions"],
        v18,
        v19))
  {
    if (v4)
    {
      if (v10)
      {
        if ([v10 _hasAmbiguousIndexPath])
        {
          [v36 frame];
          objc_msgSend(v36, "setFrame:");
          [v36 setAlpha:1.0];
          if (v36) {
            v36[144] |= 0x10u;
          }
        }
      }
    }
    else if (v10)
    {
      uint64_t v27 = [v10 _hasAmbiguousIndexPath];
      [v36 setHidden:v27];
      if ((v27 & 1) == 0)
      {
        v28 = [v36 indexPath];
        v29 = [(_UICollectionViewLayoutSwipeActionsModule *)self _cellWithCustomGroupingAtIndexPath:v28];

        if (v29) {
          -[UICollectionViewLayoutAttributes _setMaskedCorners:]((uint64_t)v36, [v29 _effectiveMaskedCornersForSystemBackgroundView]);
        }
      }
    }
    else
    {
      [v36 setHidden:1];
    }
    goto LABEL_43;
  }
  v20 = v18;
  v21 = @"UICollectionViewListLayoutElementKindBottomSeparator";
  if (v20 == v21)
  {

    if (v10) {
      goto LABEL_22;
    }
    goto LABEL_29;
  }
  v22 = v21;
  if (v20 && v21)
  {
    int v23 = [(__CFString *)v20 isEqual:v21];

    if (v23)
    {
      if (v10)
      {
LABEL_22:
        v24 = self;
        v25 = v36;
        uint64_t v26 = 1;
LABEL_41:
        v30 = v10;
LABEL_42:
        [(_UICollectionViewLayoutSwipeActionsModule *)v24 _transformLayoutAttributes:v25 ofSeparatorAtBottom:v26 forSwipeOccurrence:v30 isDisappearing:v4];
        goto LABEL_43;
      }
LABEL_29:
      if (!v15) {
        goto LABEL_43;
      }
      v24 = self;
      v25 = v36;
      uint64_t v26 = 1;
      v30 = v15;
      goto LABEL_42;
    }
  }
  else
  {
  }
  v31 = v20;
  v32 = v31;
  if (v31 == @"UICollectionViewListLayoutElementKindTopSeparator")
  {
    int v33 = 1;
  }
  else
  {
    if (!v20 || !@"UICollectionViewListLayoutElementKindTopSeparator")
    {

      goto LABEL_43;
    }
    int v33 = [(__CFString *)v31 isEqual:@"UICollectionViewListLayoutElementKindTopSeparator"];
  }

  if (v33 && v10)
  {
    v24 = self;
    v25 = v36;
    uint64_t v26 = 0;
    goto LABEL_41;
  }
LABEL_43:
}

- (void)transformCellLayoutAttributes:(id)a3 isDisappearing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  v8 = v7;
  if (!v7 || (v7[144] & 1) == 0)
  {
    v44 = [MEMORY[0x1E4F28B00] currentHandler];
    v45 = NSStringFromSelector(a2);
    [v44 handleFailureInMethod:a2, self, @"_UICollectionViewLayoutSwipeActionsModule.m", 714, @"-%@ should only be called with layout attributes for cells", v45 object file lineNumber description];
  }
  swipeActionController = self->_swipeActionController;
  v10 = [v8 indexPath];
  v11 = [(UISwipeActionController *)swipeActionController _existingSwipeOccurrenceForIndexPath:v10];

  if (v11)
  {
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      v13 = [WeakRetained collectionView];
      uint64_t v14 = [v8 indexPath];
      v15 = [v13 cellForItemAtIndexPath:v14];

      v16 = [v15 _layoutAttributes];
      if (v16)
      {
        v17 = v16;
        [v16 alpha];
        objc_msgSend(v8, "setAlpha:");
        if (v8) {
          v8[144] = v8[144] & 0xFFEF | v17[144] & 0x10;
        }
        [v17 center];
        objc_msgSend(v8, "setCenter:");

        goto LABEL_33;
      }
    }
    int v18 = [v11 _hasAmbiguousIndexPath];
    if (v4 && v18)
    {
      [v8 setAlpha:1.0];
      char v19 = [v11 swipedViewMaskWasRemoved];
      if (v8 && (v19 & 1) == 0) {
        v8[144] &= ~0x10u;
      }
      goto LABEL_33;
    }
    if ((v4 | v18)) {
      goto LABEL_33;
    }
    char v20 = [v11 swipedViewMaskWasRemoved];
    if (v8 && (v20 & 1) == 0) {
      v8[144] &= ~0x10u;
    }
    BOOL v21 = [v11 state] == 3 || objc_msgSend(v11, "state") == 4;
    p_host = &self->_host;
    id v23 = objc_loadWeakRetained((id *)p_host);
    v24 = [v23 collectionView];
    v25 = [v24 layer];
    if ([v25 flipsHorizontalAxis]) {
      double v26 = -1.0;
    }
    else {
      double v26 = 1.0;
    }

    if (!v21
      || ([v11 currentAction],
          uint64_t v27 = objc_claimAutoreleasedReturnValue(),
          uint64_t v28 = [v27 style],
          v27,
          v28 != 1))
    {
      [v8 center];
      double v40 = v39;
      double v42 = v41;
      [v11 offset];
      objc_msgSend(v8, "setCenter:", v40 + v26 * v43, v42);
      goto LABEL_33;
    }
    id v29 = objc_loadWeakRetained((id *)p_host);
    v30 = [v8 indexPath];
    v31 = [v29 layoutAttributesForDecorationViewOfKind:@"UICollectionViewListLayoutElementKindSwipeActions" atIndexPath:v30];

    if (os_variant_has_internal_diagnostics())
    {
      if (v31)
      {
LABEL_29:
        [v31 bounds];
        double Width = CGRectGetWidth(v52);
        uint64_t v33 = [v11 direction];
        double v34 = -Width;
        if (v33) {
          double v34 = Width;
        }
        double v35 = v26 * v34;
        [v8 center];
        double v37 = v36;
        [v31 center];
        objc_msgSend(v8, "setCenter:", v38 + v35, v37);

        goto LABEL_33;
      }
      v46 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
      {
LABEL_41:

        goto LABEL_29;
      }
      v47 = [v8 indexPath];
      *(_DWORD *)buf = 138412290;
      v50 = v47;
      _os_log_fault_impl(&dword_1853B0000, v46, OS_LOG_TYPE_FAULT, "Missing layout attributes for swipe actions view at index path: %@", buf, 0xCu);
    }
    else
    {
      if (v31) {
        goto LABEL_29;
      }
      v48 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &transformCellLayoutAttributes_isDisappearing____s_category)+ 8);
      if (!os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      v46 = v48;
      v47 = [v8 indexPath];
      *(_DWORD *)buf = 138412290;
      v50 = v47;
      _os_log_impl(&dword_1853B0000, v46, OS_LOG_TYPE_ERROR, "Missing layout attributes for swipe actions view at index path: %@", buf, 0xCu);
    }

    goto LABEL_41;
  }
LABEL_33:
}

- (int64_t)swipeActionsStyleForSwipedItemAtIndexPath:(id)a3
{
  v3 = [(UISwipeActionController *)self->_swipeActionController _existingSwipeOccurrenceForIndexPath:a3];
  BOOL v4 = v3;
  if (v3) {
    int64_t v5 = [v3 _styleFromConfiguration];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (_UICollectionViewLayoutSwipeActionsModule)initWithHost:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UICollectionViewLayoutSwipeActionsModule;
  int64_t v5 = [(_UICollectionViewLayoutSwipeActionsModule *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_host, v4);
    v7 = [v4 collectionView];
    v8 = [v7 traitCollection];
    v9 = +[UISwipeActionVisualStyleProvider visualStyleForIdiom:](UISwipeActionVisualStyleProvider, "visualStyleForIdiom:", [v8 userInterfaceIdiom]);

    v10 = -[UISwipeActionController initWithSwipeActionHost:style:]([UISwipeActionController alloc], "initWithSwipeActionHost:style:", v6, [v9 defaultCollectionViewCompositionalLayoutSwipeStyle]);
    swipeActionController = v6->_swipeActionController;
    v6->_swipeActionController = v10;
  }
  return v6;
}

- (void)processLayoutInvalidationWithContext:(id)a3 updateConfigurations:(BOOL)a4
{
  BOOL v4 = a4;
  v8 = a3;
  BOOL v6 = [(_UICollectionViewLayoutSwipeActionsModule *)self _canIgnoreInvalidationContext:v8];
  v7 = v8;
  if (!v6)
  {
    if ([v8 _intent] == 3)
    {
      [(UISwipeActionController *)self->_swipeActionController reloadData];
      *(unsigned char *)&self->_flags &= 0xFCu;
LABEL_7:
      v7 = v8;
      goto LABEL_9;
    }
    v7 = v8;
    if (!v8 || (v8[112] & 8) == 0)
    {
      [(_UICollectionViewLayoutSwipeActionsModule *)self _invalidateSwipeActionsLayoutRefreshingActiveConfigurations:v4];
      goto LABEL_7;
    }
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_9:
}

- (BOOL)_canIgnoreInvalidationContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 _intent];
  if (v5 > 0xF) {
    goto LABEL_8;
  }
  if (((1 << v5) & 0xE42) != 0)
  {
    BOOL v6 = 1;
    goto LABEL_13;
  }
  if (v5 != 5)
  {
    if (v5 == 15)
    {
      BOOL v6 = (*(unsigned char *)&self->_flags & 2) == 0;
      goto LABEL_13;
    }
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_13;
  }
  if ([v4 invalidateEverything]) {
    goto LABEL_8;
  }
  v7 = [v4 invalidatedItemIndexPaths];
  if ([v7 count])
  {
    BOOL v6 = 0;
  }
  else
  {
    v8 = [v4 invalidatedSupplementaryIndexPaths];
    BOOL v6 = [v8 count] == 0;
  }
LABEL_13:

  return v6;
}

- (void)_invalidateSwipeActionsLayoutRefreshingActiveConfigurations:(BOOL)a3
{
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    if ([(_UICollectionViewLayoutSwipeActionsModule *)self hasActiveSwipe])
    {
      *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFC | 1;
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __105___UICollectionViewLayoutSwipeActionsModule__invalidateSwipeActionsLayoutRefreshingActiveConfigurations___block_invoke;
      v5[3] = &unk_1E52D9FC0;
      v5[4] = self;
      BOOL v6 = a3;
      dispatch_async(MEMORY[0x1E4F14428], v5);
    }
  }
}

- (BOOL)hasActiveSwipe
{
  v2 = [(UISwipeActionController *)self->_swipeActionController swipedIndexPaths];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)indexPathsWithActiveSwipes
{
  return [(UISwipeActionController *)self->_swipeActionController swipedIndexPaths];
}

- (void)finalizeCollectionViewUpdate:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = v5;
  if (v5)
  {
    if ((*((unsigned char *)v5 + 208) & 2) != 0) {
      goto LABEL_22;
    }
  }
  else
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_UICollectionViewLayoutSwipeActionsModule.m", 686, @"Invalid parameter not satisfying: %@", @"update != nil" object file lineNumber description];
  }
  v7 = [(UISwipeActionController *)self->_swipeActionController swipeOccurrences];
  v8 = (void *)[v7 copy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v23 + 1) + 8 * v13);
        v15 = [v14 indexPath];
        v16 = [v6 finalIndexPathForInitialIndexPath:v15];
        if (!v16)
        {
          int has_internal_diagnostics = os_variant_has_internal_diagnostics();
          char v18 = [v14 _hasAmbiguousIndexPath];
          if (has_internal_diagnostics)
          {
            if ((v18 & 1) == 0)
            {
              char v19 = __UIFaultDebugAssertLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v28 = v14;
                _os_log_fault_impl(&dword_1853B0000, v19, OS_LOG_TYPE_FAULT, "The swipe occurrence should already be marked as having an ambiguous index path: %@", buf, 0xCu);
              }
            }
          }
          else if ((v18 & 1) == 0)
          {
            char v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &finalizeCollectionViewUpdate____s_category) + 8);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v28 = v14;
              _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "The swipe occurrence should already be marked as having an ambiguous index path: %@", buf, 0xCu);
            }
          }
          [v14 resetAnimated:0 completion:0];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v21 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
      uint64_t v11 = v21;
    }
    while (v21);
  }

LABEL_22:
}

- (id)propertyAnimatorForCollectionViewUpdates:(id)a3 withCustomAnimator:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(UISwipeActionController *)self->_swipeActionController currentSwipeOccurrence];
  id v9 = v8;
  if (!v8
    || ([v8 currentAction],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 style],
        v10,
        v11 != 1))
  {
    long long v26 = 0;
    uint64_t v27 = v7;
    goto LABEL_33;
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v12 = v6;
  id v13 = (id)[v12 countByEnumeratingWithState:&v71 objects:v82 count:16];
  if (!v13)
  {
    uint64_t v27 = v7;
LABEL_32:

    long long v26 = v13;
    goto LABEL_33;
  }
  v55 = self;
  id v56 = v6;
  id v57 = v7;
  char v14 = 0;
  BOOL v58 = 0;
  uint64_t v15 = *(void *)v72;
  v16 = v9;
  do
  {
    for (i = 0; i != v13; i = (char *)i + 1)
    {
      if (*(void *)v72 != v15) {
        objc_enumerationMutation(v12);
      }
      char v18 = *(void **)(*((void *)&v71 + 1) + 8 * i);
      if (objc_msgSend(v18, "updateAction", v55) == 1)
      {
        if (v18 && v18[6] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v19 = v18[1];
          char v20 = [v9 indexPath];
          uint64_t v21 = [v20 section];

          BOOL v22 = v19 == v21;
          id v9 = v16;
          if (v22) {
            char v14 = 1;
          }
        }
        else
        {
          long long v23 = [v18 indexPathBeforeUpdate];
          long long v24 = [v9 indexPath];
          int v25 = [v23 isEqual:v24];

          id v9 = v16;
          if (v25)
          {
            BOOL v58 = [v12 count] == 1;
            char v14 = 1;
          }
        }
      }
    }
    id v13 = (id)[v12 countByEnumeratingWithState:&v71 objects:v82 count:16];
  }
  while (v13);

  if (!v58)
  {
    id v13 = 0;
    long long v26 = 0;
    id v6 = v56;
    id v7 = v57;
    uint64_t v27 = v57;
    if ((v14 & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_27;
  }
  uint64_t v28 = [v9 swipedView];
  id v29 = -[UIView _safeMaskView](v28);

  id v7 = v57;
  if (v29)
  {
    uint64_t v27 = v57;
    id v6 = v56;
    if (!v57)
    {
      v75 = v29;
      uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
      uint64_t v27 = +[_UISwipeAnimationFactory animatorForCollapseWithAdditivelyAnimatedViews:v30];
    }
    [v29 frame];
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    [v29 bounds];
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __105___UICollectionViewLayoutSwipeActionsModule_propertyAnimatorForCollectionViewUpdates_withCustomAnimator___block_invoke;
    v61[3] = &unk_1E52DD590;
    id v13 = v29;
    id v62 = v13;
    uint64_t v63 = v32;
    uint64_t v64 = v34;
    uint64_t v65 = v36;
    uint64_t v66 = 0;
    uint64_t v67 = v38;
    uint64_t v68 = v40;
    uint64_t v69 = v36;
    uint64_t v70 = 0;
    [v27 addAnimations:v61];

    long long v26 = v13;
    if (v14)
    {
LABEL_27:
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      char v42 = [v9 _hasAmbiguousIndexPath];
      if (has_internal_diagnostics)
      {
        if ((v42 & 1) == 0)
        {
          v49 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            v77 = v16;
            _os_log_fault_impl(&dword_1853B0000, v49, OS_LOG_TYPE_FAULT, "The swipe occurrence should already be marked as having an ambiguous index path: %@", buf, 0xCu);
          }

          id v6 = v56;
          id v7 = v57;
          id v9 = v16;
        }
      }
      else if ((v42 & 1) == 0)
      {
        v50 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB261C70) + 8);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v77 = v9;
          _os_log_impl(&dword_1853B0000, v50, OS_LOG_TYPE_ERROR, "The swipe occurrence should already be marked as having an ambiguous index path: %@", buf, 0xCu);
        }
      }
      if (!v27)
      {
        uint64_t v27 = +[_UISwipeAnimationFactory animatorForGenericUpdates];
      }
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __105___UICollectionViewLayoutSwipeActionsModule_propertyAnimatorForCollectionViewUpdates_withCustomAnimator___block_invoke_49;
      v59[3] = &unk_1E52DC698;
      id v60 = v9;
      [v27 addCompletion:v59];
      id v12 = v60;
      goto LABEL_32;
    }
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v51 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
      {
        id WeakRetained = objc_loadWeakRetained((id *)&v55->_host);
        v53 = [WeakRetained collectionView];
        v54 = [v16 swipedView];
        *(_DWORD *)buf = 138412802;
        v77 = v53;
        __int16 v78 = 2112;
        v79 = v16;
        __int16 v80 = 2112;
        v81 = v54;
        _os_log_fault_impl(&dword_1853B0000, v51, OS_LOG_TYPE_FAULT, "UICollectionView internal inconsistency: missing maskView for swipe occurrence. Collection view: %@; Swipe occ"
          "urrence: %@; Swiped view: %@",
          buf,
          0x20u);
      }
    }
    else
    {
      v44 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB261C68) + 8);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        v45 = v44;
        id v46 = objc_loadWeakRetained((id *)&v55->_host);
        v47 = [v46 collectionView];
        v48 = [v16 swipedView];
        *(_DWORD *)buf = 138412802;
        v77 = v47;
        __int16 v78 = 2112;
        v79 = v16;
        __int16 v80 = 2112;
        v81 = v48;
        _os_log_impl(&dword_1853B0000, v45, OS_LOG_TYPE_ERROR, "UICollectionView internal inconsistency: missing maskView for swipe occurrence. Collection view: %@; Swipe occ"
          "urrence: %@; Swiped view: %@",
          buf,
          0x20u);
      }
    }
    id v13 = 0;
    long long v26 = 0;
    id v6 = v56;
    id v7 = v57;
    uint64_t v27 = v57;
    id v9 = v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_33:

  return v27;
}

- (id)itemContainerViewForSwipeActionController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  id v4 = [WeakRetained collectionView];

  return v4;
}

- (id)gestureRecognizerViewForSwipeActionController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  id v4 = [WeakRetained collectionView];

  return v4;
}

- (void)updateWithDataSourceTranslator:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"_UICollectionViewLayoutSwipeActionsModule.m", 677, @"Invalid parameter not satisfying: %@", @"dataSourceTranslator != nil" object file lineNumber description];
  }
  swipeActionController = self->_swipeActionController;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76___UICollectionViewLayoutSwipeActionsModule_updateWithDataSourceTranslator___block_invoke;
  v9[3] = &unk_1E52E5E90;
  id v10 = v5;
  id v7 = v5;
  [(UISwipeActionController *)swipeActionController rebaseUnambiguousSwipeOccurrencesWithBlock:v9];
}

- (void)teardown
{
}

- (void)_performForcedCollectionViewLayoutPreservingExistingLayoutAttributes
{
  char flags = (char)self->_flags;
  *(unsigned char *)&self->_char flags = flags | 4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  id v5 = [WeakRetained collectionView];
  [v5 layoutIfNeeded];

  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFB | flags & 4;
}

- (BOOL)_canSwipeItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  id v6 = [WeakRetained collectionView];

  id v7 = [v6 _reorderedItems];
  uint64_t v8 = [v7 count];

  if (v8) {
    LOBYTE(v9) = 0;
  }
  else {
    int v9 = [v6 _isCellInvolvedInDragOrDropAnimationAtIndexPath:v4] ^ 1;
  }

  return v9;
}

- (void)swipeItemAtIndexPath:(id)a3 direction:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = a3;
  id v10 = (void (**)(id, void))a6;
  if ([(_UICollectionViewLayoutSwipeActionsModule *)self _canSwipeItemAtIndexPath:v11])
  {
    [(UISwipeActionController *)self->_swipeActionController swipeItemAtIndexPath:v11 configuration:0 direction:a4 animated:v7 completion:v10];
  }
  else if (v10)
  {
    v10[2](v10, 0);
  }
}

- (void)revealTrailingSwipeActionsForIndexPath:(id)a3
{
  swipeActionController = self->_swipeActionController;
  id v5 = a3;
  [(_UICollectionViewLayoutSwipeActionsModule *)self swipeItemAtIndexPath:v5 direction:[(UISwipeActionController *)swipeActionController _swipeDirectionForLeadingEdge:0] animated:1 completion:0];
}

- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if (![WeakRetained _supportsSwipeActionsForIndexPath:v5]) {
    goto LABEL_9;
  }
  BOOL v7 = [WeakRetained _leadingSwipeActionsConfigurationForIndexPath:v5];
  if (v7)
  {
LABEL_3:
    [(_UICollectionViewLayoutSwipeActionsModule *)self _updateSwipeActionsConfiguration:v7 forIndexPath:v5];
    goto LABEL_10;
  }
  uint64_t v8 = [WeakRetained collectionView];
  int v9 = [v8 cellForItemAtIndexPath:v5];

  if (!v9
    || ([v9 contentView],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) == 0))
  {

LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  id v12 = [v9 contentView];
  BOOL v7 = [v12 _leadingSwipeActionsConfiguration];

  if (v7) {
    goto LABEL_3;
  }
LABEL_10:

  return v7;
}

- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  if (![WeakRetained _supportsSwipeActionsForIndexPath:v5]) {
    goto LABEL_9;
  }
  BOOL v7 = [WeakRetained _trailingSwipeActionsConfigurationForIndexPath:v5];
  if (v7)
  {
LABEL_3:
    [(_UICollectionViewLayoutSwipeActionsModule *)self _updateSwipeActionsConfiguration:v7 forIndexPath:v5];
    goto LABEL_10;
  }
  uint64_t v8 = [WeakRetained collectionView];
  int v9 = [v8 cellForItemAtIndexPath:v5];

  if (!v9
    || ([v9 contentView],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_opt_respondsToSelector(),
        v10,
        (v11 & 1) == 0))
  {

LABEL_9:
    BOOL v7 = 0;
    goto LABEL_10;
  }
  id v12 = [v9 contentView];
  BOOL v7 = [v12 _trailingSwipeActionsConfiguration];

  if (v7) {
    goto LABEL_3;
  }
LABEL_10:

  return v7;
}

- (void)_updateSwipeActionsConfiguration:(id)a3 forIndexPath:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  if (!v11)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"_UICollectionViewLayoutSwipeActionsModule.m", 282, @"Invalid parameter not satisfying: %@", @"configuration != nil" object file lineNumber description];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  [WeakRetained _updateStyleForSwipeActionsConfiguration:v11 indexPath:v7];

  if ([v11 _swipeActionsStyle] != 1)
  {
    int v9 = [(_UICollectionViewLayoutSwipeActionsModule *)self _cellWithCustomGroupingAtIndexPath:v7];

    if (v9) {
      [v11 _setSwipeActionsStyle:1];
    }
  }
}

- (id)_cellWithCustomGroupingAtIndexPath:(id)a3
{
  p_host = &self->_host;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_host);
  id v6 = [WeakRetained collectionView];
  id v7 = [v6 cellForItemAtIndexPath:v4];

  if (!v7)
  {
    id v10 = 0;
    goto LABEL_12;
  }
  uint64_t v8 = [v7 _layoutAttributes];
  uint64_t v9 = -[UICollectionViewLayoutAttributes _existingListAttributes](v8);

  if (v9 && (*(unsigned char *)(v9 + 8) & 2) != 0 && *(void *)(v9 + 24) != 15)
  {
    id v10 = v7;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v10 = v7;
  if ((unint64_t)[v10 _backgroundViewConfigurationGrouping] <= 1)
  {

LABEL_8:
    id v10 = 0;
  }
LABEL_11:

LABEL_12:
  return v10;
}

- (int64_t)layoutDirectionForSwipeActionController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  id v4 = [WeakRetained collectionView];
  int64_t v5 = [v4 effectiveUserInterfaceLayoutDirection];

  return v5;
}

- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  uint64_t v8 = [WeakRetained collectionView];

  uint64_t v9 = objc_msgSend(v8, "indexPathForItemAtPoint:", x, y);
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = [(UISwipeActionController *)self->_swipeActionController swipeOccurrences];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (([v17 _hasAmbiguousIndexPath] & 1) == 0)
          {
            char v18 = [v17 indexPath];
            uint64_t v19 = [v8 _visibleDecorationViewOfKind:@"UICollectionViewListLayoutElementKindSwipeActions" atIndexPath:v18];

            if (v19)
            {
              if (([v19 isHidden] & 1) == 0)
              {
                objc_msgSend(v19, "convertPoint:fromView:", v8, x, y);
                if (objc_msgSend(v19, "pointInside:withEvent:", 0))
                {
                  id v11 = [v17 indexPath];

                  goto LABEL_17;
                }
              }
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v11 = 0;
  }
LABEL_17:

  return v11;
}

- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4
{
  p_host = &self->_host;
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_host);
  id v7 = [WeakRetained collectionView];
  uint64_t v8 = [v7 cellForItemAtIndexPath:v5];

  return v8;
}

- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  id v7 = [WeakRetained collectionView];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  double v51 = v10;
  double v52 = v8;
  double v53 = v12;
  double v50 = v14;
  [v7 safeAreaInsets];
  double v49 = v16;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  long long v23 = [v7 accessoryViewAtEdge:3];
  long long v24 = v23;
  if (v23)
  {
    [v23 frame];
    double MaxX = CGRectGetMaxX(v60);
    v61.origin.double x = v9;
    v61.origin.double y = v11;
    v61.size.width = v13;
    v61.size.height = v15;
    double v26 = MaxX - CGRectGetMinX(v61);
    if (v18 < v26) {
      double v18 = v26;
    }
  }
  uint64_t v27 = [v7 accessoryViewAtEdge:5];
  if (v27)
  {
    v62.origin.double x = v9;
    v62.origin.double y = v11;
    v62.size.width = v13;
    v62.size.height = v15;
    double v28 = CGRectGetMaxX(v62);
    [v27 frame];
    double v29 = v28 - CGRectGetMinX(v63);
    if (v22 < v29) {
      double v22 = v29;
    }
  }
  uint64_t v30 = [WeakRetained layoutAttributesForDecorationViewOfKind:@"UICollectionViewListLayoutElementKindSwipeActions" atIndexPath:v5];
  [v30 frame];
  double v55 = v22;
  if (v30)
  {
    CGFloat v35 = v31;
    CGFloat v36 = v32;
    CGFloat v37 = v33;
    CGFloat v38 = v34;
  }
  else
  {
    CGFloat v38 = v15;
    CGFloat v36 = v11;
    if (os_variant_has_internal_diagnostics())
    {
      CGFloat v35 = v9;
      v48 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v5;
        _os_log_fault_impl(&dword_1853B0000, v48, OS_LOG_TYPE_FAULT, "Missing layout attributes for swipe actions view at index path: %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v39 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &swipeActionController_extraInsetsForItemAtIndexPath____s_category)+ 8);
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v5;
        _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_ERROR, "Missing layout attributes for swipe actions view at index path: %@", buf, 0xCu);
      }
      CGFloat v35 = v9;
    }
    CGFloat v37 = v13;
  }
  CGFloat v40 = v52 + v18;
  CGFloat v41 = v53 - (v18 + v55);
  v64.origin.double x = v40;
  v64.origin.double y = v51 + v49;
  v64.size.width = v41;
  v64.size.height = v50 - (v49 + v20);
  double MinX = CGRectGetMinX(v64);
  v65.origin.double x = v35;
  v65.origin.double y = v36;
  v65.size.width = v37;
  v65.size.height = v38;
  double v54 = CGRectGetMinX(v65);
  v66.origin.double x = v35;
  v66.origin.double y = v36;
  v66.size.width = v37;
  v66.size.height = v38;
  double v42 = CGRectGetMaxX(v66);
  v67.origin.double x = v40;
  v67.origin.double y = v51 + v49;
  v67.size.width = v41;
  v67.size.height = v50 - (v49 + v20);
  double v43 = CGRectGetMaxX(v67);

  double v44 = 0.0;
  double v45 = fmax(MinX - v54, 0.0);
  double v46 = fmax(v42 - v43, 0.0);
  double v47 = 0.0;
  result.right = v46;
  result.bottom = v44;
  result.left = v45;
  result.top = v47;
  return result;
}

- (BOOL)swipeActionController:(id)a3 mayBeginSwipeForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  BOOL v7 = ([WeakRetained isEditing] & 1) == 0
    && [(_UICollectionViewLayoutSwipeActionsModule *)self _canSwipeItemAtIndexPath:v5];

  return v7;
}

- (BOOL)swipeActionController:(id)a3 insertActionsView:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  p_host = &self->_host;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  CGFloat v11 = [WeakRetained collectionView];

  id v12 = objc_loadWeakRetained((id *)p_host);
  _UIInvalidateSwipeActionsLayoutForDecorationViewAtIndexPath(v12, v8);

  _UIPerformImmediateCollectionViewLayoutAndVisibleCellsUpdate(v11);
  CGFloat v13 = [v11 _visibleDecorationViewOfKind:@"UICollectionViewListLayoutElementKindSwipeActions" atIndexPath:v8];
  double v14 = v13;
  if (v13)
  {
    [v13 setClipsToBounds:1];
    [v14 addSubview:v7];
  }
  else if (os_variant_has_internal_diagnostics())
  {
    double v17 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "Swipe actions view was not created for index path: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  else
  {
    CGFloat v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &swipeActionController_insertActionsView_forItemAtIndexPath____s_category)+ 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "Swipe actions view was not created for index path: %@", (uint8_t *)&v18, 0xCu);
    }
  }

  return v14 != 0;
}

- (void)swipeActionController:(id)a3 cleanupActionsView:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)swipeActionController:(id)a3 willBeginSwipeForItemAtIndexPath:(id)a4
{
  if ([a3 _isSwipeForIndexPathFirstOccurrenceBeginningOrLastOccurrenceEnding:a4])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    [WeakRetained _willBeginSwiping];
  }
}

- (void)swipeActionController:(id)a3 didBeginSwipeForItemAtIndexPath:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [a3 _existingSwipeOccurrenceForIndexPath:v5];
  if (os_variant_has_internal_diagnostics())
  {
    if (!v6)
    {
      CGFloat v11 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        int v13 = 138412290;
        id v14 = v5;
        _os_log_fault_impl(&dword_1853B0000, v11, OS_LOG_TYPE_FAULT, "Unable to get swipe occurrence for swipe at index path: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else if (!v6)
  {
    id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &swipeActionController_didBeginSwipeForItemAtIndexPath____s_category)+ 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v5;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Unable to get swipe occurrence for swipe at index path: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v7 = [v6 swipedView];
  id v8 = [_UICollectionViewLayoutSwipeMaskView alloc];
  [v7 bounds];
  CGFloat v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
  double v10 = +[UIColor blackColor];
  [(UIView *)v9 setBackgroundColor:v10];

  -[UIView _setSafeMaskView:](v7, v9);
  _UIUpdateMaskViewClippingFromView(v9, v7);
}

- (void)swipeActionController:(id)a3 didEndSwipeForItemAtIndexPath:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 _existingSwipeOccurrenceForIndexPath:v7];
  if (os_variant_has_internal_diagnostics())
  {
    if (!v8)
    {
      uint64_t v15 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        int v18 = 138412290;
        id v19 = v7;
        _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Unable to get swipe occurrence for ended swipe at index path: %@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else if (!v8)
  {
    double v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1147) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = v7;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Unable to get swipe occurrence for ended swipe at index path: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  [v8 setSwipedViewMaskWasRemoved:1];
  int v9 = [v8 _hasAmbiguousIndexPath];
  double v10 = [v8 swipedView];
  id WeakRetained = v10;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (os_variant_has_internal_diagnostics())
      {
        double v17 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          int v18 = 138412290;
          id v19 = WeakRetained;
          _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "Swiped view was of unexpected class or nil: %@", (uint8_t *)&v18, 0xCu);
        }
      }
      else
      {
        id v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB261C60) + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v18 = 138412290;
          id v19 = WeakRetained;
          _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Swiped view was of unexpected class or nil: %@", (uint8_t *)&v18, 0xCu);
        }
      }
      -[UIView _setSafeMaskView:](WeakRetained, 0);
    }
  }
  else
  {
    -[UIView _setSafeMaskView:](v10, 0);

    if ([v8 _didReloadData]) {
      goto LABEL_12;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
    int v13 = [v8 indexPath];
    _UIInvalidateSwipeActionsLayoutForItemAtIndexPath(WeakRetained, v13);
  }
LABEL_12:
  if ([v6 _isSwipeForIndexPathFirstOccurrenceBeginningOrLastOccurrenceEnding:v7])
  {
    id v14 = objc_loadWeakRetained((id *)&self->_host);
    [v14 _didEndSwiping];
  }
}

- (void)swipeActionController:(id)a3 swipeOccurrence:(id)a4 didChangeStateFrom:(int64_t)a5 to:(int64_t)a6
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = v11;
  switch(a6)
  {
    case 5:
      goto LABEL_12;
    case 4:
      CGFloat v41 = [v11 currentAction];
      uint64_t v42 = [v41 style];

      if (v42 == 1) {
        break;
      }
LABEL_12:
      [(_UICollectionViewLayoutSwipeActionsModule *)self _performForcedCollectionViewLayoutPreservingExistingLayoutAttributes];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke_3;
      v46[3] = &unk_1E52DA660;
      v46[4] = self;
      id v47 = v12;
      [v47 resetAnimated:1 completion:v46];

      break;
    case 3:
      int v13 = [v11 currentAction];
      uint64_t v14 = [v13 style];

      if (v14 == 1)
      {
        uint64_t v15 = [v12 swipedView];
        double v16 = -[UIView _safeMaskView](v15);
        double v17 = [v16 layer];
        int v18 = [v17 presentationLayer];
        if (v18)
        {
          id v19 = [v17 animationKeys];
          uint64_t v20 = [v19 count];

          if (v20)
          {
            [v18 position];
            objc_msgSend(v17, "setPosition:");
            [v17 removeAllAnimations];
          }
        }

        if (!v15 || !v16)
        {
          double v43 = [MEMORY[0x1E4F28B00] currentHandler];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
          double v45 = [WeakRetained collectionView];
          [v43 handleFailureInMethod:a2, self, @"_UICollectionViewLayoutSwipeActionsModule.m", 506, @"UICollectionView internal inconsistency: did not receive a swiped view or mask as expected for swipe occurrence %@.\nCollection View: %@, swiped view: %@, mask: %@", v12, v45, v15, v16 object file lineNumber description];
        }
        v59[0] = v16;
        v59[1] = v15;
        double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
        double v22 = +[_UISwipeAnimationFactory animatorForTentativeWithOccurrence:v12 additivelyAnimatedViews:v21];

        p_host = &self->_host;
        id v24 = objc_loadWeakRetained((id *)&self->_host);
        int v25 = [v24 collectionView];

        [(_UICollectionViewLayoutSwipeActionsModule *)self _performForcedCollectionViewLayoutPreservingExistingLayoutAttributes];
        double v26 = [v12 lockActionViewForAnimation];
        [v26 bounds];
        uint64_t v28 = v27;
        uint64_t v30 = v29;
        uint64_t v32 = v31;
        double v33 = [v26 superview];
        [v33 bounds];
        CGFloat Width = CGRectGetWidth(v60);

        id v35 = objc_loadWeakRetained((id *)p_host);
        CGFloat v36 = [v12 indexPath];
        _UIInvalidateSwipeActionsLayoutForItemAtIndexPath(v35, v36);

        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke;
        v51[3] = &unk_1E52E6160;
        id v37 = v26;
        uint64_t v55 = v28;
        uint64_t v56 = v30;
        CGFloat v57 = Width;
        uint64_t v58 = v32;
        id v52 = v37;
        id v53 = v25;
        id v38 = v12;
        id v54 = v38;
        id v39 = v25;
        [v22 addAnimations:v51];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __105___UICollectionViewLayoutSwipeActionsModule_swipeActionController_swipeOccurrence_didChangeStateFrom_to___block_invoke_2;
        v48[3] = &unk_1E52E6608;
        id v49 = v38;
        id v50 = v37;
        id v40 = v37;
        [v22 addCompletion:v48];
        [v22 startAnimation];
      }
      break;
  }
}

- (void)editingStateDidChange
{
  BOOL v3 = +[UIView areAnimationsEnabled];
  swipeActionController = self->_swipeActionController;
  [(UISwipeActionController *)swipeActionController resetSwipedItemAnimated:v3 completion:0];
}

- (void)_transformLayoutAttributes:(id)a3 ofSeparatorAtBottom:(BOOL)a4 forSwipeOccurrence:(id)a5 isDisappearing:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v24 = a3;
  id v11 = a5;
  if (!v11)
  {
    long long v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"_UICollectionViewLayoutSwipeActionsModule.m", 839, @"Invalid parameter not satisfying: %@", @"swipeOccurrence != nil" object file lineNumber description];
  }
  int v12 = [v11 _hasAmbiguousIndexPath];
  uint64_t v13 = [v11 _style];
  if (v12 && v6)
  {
    if (!v8) {
      goto LABEL_17;
    }
    if (v13 != 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
      uint64_t v15 = [v24 indexPath];
      double v16 = [WeakRetained finalLayoutAttributesForDisappearingItemAtIndexPath:v15];

      [v24 frame];
      double v18 = v17;
      [v16 frame];
      [v24 setFrame:v18];
      [v24 setAlpha:1.0];

      goto LABEL_17;
    }
    double v21 = 0.0;
    goto LABEL_16;
  }
  if (((v12 | v6) & 1) == 0 && v13 == 2)
  {
    [v11 offset];
    double v20 = v19;
    [v24 alpha];
    double v22 = -v20;
    if (v20 >= 0.0) {
      double v22 = v20;
    }
    if (v22 > 0.0) {
      double v21 = 0.0;
    }
LABEL_16:
    [v24 setAlpha:v21];
  }
LABEL_17:
}

- (id)swipeViewManipulatorForSwipeActionController:(id)a3
{
  id v4 = [_UICollectionViewLayoutSwipeViewManipulator alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  BOOL v6 = [WeakRetained collectionView];
  id v7 = [(_UICollectionViewLayoutSwipeViewManipulator *)v4 initWithCollectionView:v6 swipeActionsModule:self];

  return v7;
}

- (UISwipeOccurrence)currentSwipeOccurrence
{
  return [(UISwipeActionController *)self->_swipeActionController currentSwipeOccurrence];
}

- (UICollectionViewLayout)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  return (UICollectionViewLayout *)WeakRetained;
}

- (void)setHost:(id)a3
{
}

- (UISwipeActionController)swipeActionController
{
  return self->_swipeActionController;
}

- (void)setSwipeActionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swipeActionController, 0);
  objc_destroyWeak((id *)&self->_host);
}

@end