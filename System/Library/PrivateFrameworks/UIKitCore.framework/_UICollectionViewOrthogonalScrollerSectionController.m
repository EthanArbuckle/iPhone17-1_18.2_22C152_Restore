@interface _UICollectionViewOrthogonalScrollerSectionController
- (BOOL)isIndexPathInExtantOrthogonalScroller:(BOOL)a1;
- (id)autoScrollAssistantForOrthogonalScrollingSectionAtIndexPath:(id *)a1;
- (id)subviewRouterForSection:(id *)a1;
- (uint64_t)isElementInOrthogonalScrollingSectionWithLayoutAttributes:(uint64_t)a1;
- (uint64_t)isIndexPathInOrthogonalScrollingSection:(uint64_t)a1;
- (uint64_t)isSectionOrthogonallyScrolling:(uint64_t)a1;
- (void)_placeView:(uint64_t)a3 belowOrthogonalScrollViewForSection:;
- (void)_scrollViewForSection:(int)a3 createIfNecessary:;
- (void)adjustElementHierarchyOrderingForOrthogonalElementIfNeeded:(void *)a3 layoutAttributes:;
- (void)initWithCollectionView:(void *)a1;
- (void)layoutScrollViews;
- (void)processQueuedScrollViewRemovals;
- (void)reconfigureScrollViewsForUpdate:(uint64_t)a1;
- (void)scrollToItemAtIndexPath:(uint64_t)a3 atScrollPosition:(uint64_t)a4 additionalInsets:(double)a5 animated:(double)a6;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setShouldPreventFocusScrollPastContentSize:(uint64_t)a1;
- (void)updateParentScrollViewForCellPromiseRegion:(id *)a1;
@end

@implementation _UICollectionViewOrthogonalScrollerSectionController

- (uint64_t)isElementInOrthogonalScrollingSectionWithLayoutAttributes:(uint64_t)a1
{
  v3 = a2;
  if (!a1)
  {
    uint64_t v9 = 0;
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = [WeakRetained collectionViewLayout];
    if (![v6 _hasOrthogonalScrollingSections])
    {
      uint64_t v9 = 0;
      goto LABEL_10;
    }
    v7 = [v3 indexPath];
    v8 = v7;
    if (!v7 || [v7 length] == 1)
    {
      uint64_t v9 = 0;
LABEL_7:

LABEL_10:
      goto LABEL_11;
    }
    uint64_t v11 = [v8 section];
    v12 = [v6 _orthogonalScrollingSections];
    uint64_t v9 = [v12 containsIndex:v11];

    if (!v9) {
      goto LABEL_7;
    }
    if (v3)
    {
      __int16 v13 = v3[144];
      if ((v13 & 3) != 0)
      {
        if ((v13 & 2) == 0) {
          goto LABEL_17;
        }
        v14 = -[UIBarButtonItemGroup _items]((id *)v3);
        uint64_t v15 = [v6 _shouldOrthogonalScrollingSectionDecorationScrollWithContentForIndexPath:v8 elementKind:v14];
      }
      else
      {
        v14 = -[UIBarButtonItemGroup _items]((id *)v3);
        uint64_t v15 = [v6 _shouldOrthogonalScrollingSectionSupplementaryScrollWithContentForIndexPath:v8 elementKind:v14];
      }
      uint64_t v9 = v15;

      goto LABEL_7;
    }
LABEL_17:
    uint64_t v9 = 1;
    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_11:

LABEL_12:
  return v9;
}

- (id)subviewRouterForSection:(id *)a1
{
  if (a1)
  {
    uint64_t v2 = -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:](a1, a2, 1);
    v3 = (void *)v2;
    if (v2) {
      v4 = *(void **)(v2 + 2088);
    }
    else {
      v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_scrollViewForSection:(int)a3 createIfNecessary:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    uint64_t v9 = 0;
    goto LABEL_32;
  }
  v6 = NSNumber;
  id v7 = a1[3];
  v8 = [v6 numberWithInteger:a2];
  uint64_t v9 = [v7 objectForKey:v8];

  if (v9) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = a3 == 0;
  }
  if (v10) {
    goto LABEL_29;
  }
  if (!-[_UICollectionViewOrthogonalScrollerSectionController isSectionOrthogonallyScrolling:]((uint64_t)a1, a2))
  {
    uint64_t v9 = 0;
LABEL_29:
    if (!v9) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 2);
  if (WeakRetained)
  {
    uint64_t v9 = -[_UICollectionViewOrthogonalScrollView initWithCollectionView:section:]([_UICollectionViewOrthogonalScrollView alloc], WeakRetained, a2);
    v12 = NSNumber;
    id v13 = a1[3];
    v14 = [v12 numberWithInteger:a2];
    [v13 setObject:v9 forKey:v14];

    uint64_t v15 = [WeakRetained collectionViewLayout];
    v16 = [v15 _sectionDescriptorForSectionIndex:a2];

    [v9 setDelegate:a1];
    -[_UICollectionViewOrthogonalScrollView configureForDescriptor:]((uint64_t)v9, (uint64_t)v16);
    v17 = [WeakRetained _subviewRouterForOrthogonalScrollViewAtSection:a2];
    -[_UICollectionViewSubviewRouter addContainerView:]((uint64_t)v17, v9);
    id v18 = objc_loadWeakRetained(a1 + 2);
    if (v18)
    {
      v38 = v16;
      id v39 = WeakRetained;
      uint64_t v40 = a2;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v19 = a1[5];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v46 != v22) {
              objc_enumerationMutation(v19);
            }
            [v18 bringSubviewToFront:*(void *)(*((void *)&v45 + 1) + 8 * i)];
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v21);
      }
      v37 = v17;

      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v24 = a1[6];
      uint64_t v25 = [v24 countByEnumeratingWithState:&v41 objects:v49 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v42;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v42 != v27) {
              objc_enumerationMutation(v24);
            }
            v29 = *(void **)(*((void *)&v41 + 1) + 8 * j);
            v30 = [v29 _layoutAttributes];
            v31 = [v30 indexPath];

            if ([v31 length] == 2)
            {
              id v32 = [v29 superview];

              if (v32 == v18) {
                -[_UICollectionViewOrthogonalScrollerSectionController _placeView:belowOrthogonalScrollViewForSection:]((uint64_t)a1, v29, [v31 section]);
              }
            }
          }
          uint64_t v26 = [v24 countByEnumeratingWithState:&v41 objects:v49 count:16];
        }
        while (v26);
      }

      id WeakRetained = v39;
      a2 = v40;
      v17 = v37;
      v16 = v38;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  if (v9)
  {
LABEL_30:
    if (v9[260] != a2)
    {
      v34 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v35 = v9[260];
      id v36 = objc_loadWeakRetained(a1 + 2);
      [v34 handleFailureInMethod:sel__scrollViewForSection_createIfNecessary_, a1, @"_UICollectionViewOrthogonalScrollerSectionController.m", 269, @"UICollectionView internal inconsistency: attempted to retrieve _UICollectionViewOrthogonalScrollView for section %ld but received section %ld. Collection View: %@", a2, v35, v36 object file lineNumber description];
    }
  }
LABEL_32:
  return v9;
}

- (uint64_t)isSectionOrthogonallyScrolling:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  v4 = [WeakRetained collectionViewLayout];

  if (v4)
  {
    id v5 = [v4 _orthogonalScrollingSections];
    uint64_t v6 = [v5 containsIndex:a2];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)reconfigureScrollViewsForUpdate:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    id v5 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v6 = [WeakRetained collectionViewLayout];
      if (v6)
      {
        id v7 = *(id *)(a1 + 24);
        v8 = [v6 _orthogonalScrollingSections];
        uint64_t v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = [MEMORY[0x1E4F28D60] indexSet];
        }
        uint64_t v11 = v10;

        if ([v11 count] || objc_msgSend(v7, "count"))
        {
          v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v11, "count"));
          v16[0] = MEMORY[0x1E4F143A8];
          v16[1] = 3221225472;
          v16[2] = __88___UICollectionViewOrthogonalScrollerSectionController_reconfigureScrollViewsForUpdate___block_invoke;
          v16[3] = &unk_1E52E6798;
          id v17 = v3;
          id v18 = v11;
          id v13 = v12;
          id v19 = v13;
          uint64_t v20 = a1;
          [v7 enumerateKeysAndObjectsUsingBlock:v16];
          v14 = *(void **)(a1 + 24);
          *(void *)(a1 + 24) = v13;
          id v15 = v13;
        }
      }
    }
  }
}

- (void)processQueuedScrollViewRemovals
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if (WeakRetained)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      uint64_t v14 = a1;
      obuint64_t j = *(id *)(a1 + 32);
      uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v16 = *(void *)v22;
        do
        {
          uint64_t v5 = 0;
          do
          {
            if (*(void *)v22 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v6 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
            long long v17 = 0u;
            long long v18 = 0u;
            long long v19 = 0u;
            long long v20 = 0u;
            id v7 = [v6 subviews];
            uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v8)
            {
              uint64_t v9 = v8;
              uint64_t v10 = *(void *)v18;
              do
              {
                uint64_t v11 = 0;
                do
                {
                  if (*(void *)v18 != v10) {
                    objc_enumerationMutation(v7);
                  }
                  uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [WeakRetained _addControlledSubview:v12];
                  }
                  ++v11;
                }
                while (v9 != v11);
                uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
              }
              while (v9);
            }

            [v6 setDelegate:0];
            [v6 removeFromSuperview];
            ++v5;
          }
          while (v5 != v4);
          uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v4);
      }

      id v13 = *(void **)(v14 + 32);
      *(void *)(v14 + 32) = 0;
    }
  }
}

- (void)layoutScrollViews
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v4 = [WeakRetained collectionViewLayout];
      if ([v4 _hasOrthogonalScrollingSections])
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        obuint64_t j = [*(id *)(a1 + 24) objectEnumerator];
        uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v20;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v20 != v7) {
                objc_enumerationMutation(obj);
              }
              uint64_t v9 = *(void **)(*((void *)&v19 + 1) + 8 * v8);
              if (v9) {
                uint64_t v10 = v9[260];
              }
              else {
                uint64_t v10 = 0;
              }
              uint64_t v11 = [v3 _subviewRouterForOrthogonalScrollViewAtSection:v10];
              uint64_t v12 = (void *)v11;
              if (v11) {
                id v13 = *(void **)(v11 + 40);
              }
              else {
                id v13 = 0;
              }
              id v14 = v13;
              id v15 = [v9 superview];

              if (v14 != v15) {
                -[_UICollectionViewSubviewRouter addContainerView:]((uint64_t)v12, v9);
              }
              uint64_t v16 = [v4 _sectionDescriptorForSectionIndex:v10];
              -[_UICollectionViewOrthogonalScrollView configureForDescriptor:]((uint64_t)v9, (uint64_t)v16);

              ++v8;
            }
            while (v6 != v8);
            uint64_t v17 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
            uint64_t v6 = v17;
          }
          while (v17);
        }
      }
    }
  }
}

- (void)initWithCollectionView:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_UICollectionViewOrthogonalScrollerSectionController;
    id v4 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 2, v3);
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v6 = (void *)a1[3];
      a1[3] = v5;

      uint64_t v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v8 = (void *)a1[5];
      a1[5] = v7;

      uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      uint64_t v10 = (void *)a1[6];
      a1[6] = v9;
    }
  }

  return a1;
}

- (void)scrollViewDidScroll:(id)a3
{
  uint64_t v10 = a3;
  if (self)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    if (!WeakRetained) {
      goto LABEL_7;
    }
    if (v10)
    {
      if (v10[2064]) {
        goto LABEL_7;
      }
      BOOL isHandlingScrollViewDelegateCallout = self->_isHandlingScrollViewDelegateCallout;
      p_BOOL isHandlingScrollViewDelegateCallout = &self->_isHandlingScrollViewDelegateCallout;
      BOOL v6 = isHandlingScrollViewDelegateCallout;
      BOOL *p_isHandlingScrollViewDelegateCallout = 1;
      uint64_t v8 = *((void *)v10 + 260);
      [v10 contentOffset];
      objc_msgSend(v10, "_pointByRemovingBaseContentInsetsFromPoint:");
    }
    else
    {
      uint64_t v8 = 0;
      BOOL v9 = self->_isHandlingScrollViewDelegateCallout;
      p_BOOL isHandlingScrollViewDelegateCallout = &self->_isHandlingScrollViewDelegateCallout;
      BOOL v6 = v9;
      BOOL *p_isHandlingScrollViewDelegateCallout = 1;
    }
    objc_msgSend(WeakRetained, "_orthogonalScrollView:didScrollToOffset:inSection:", v10, v8);
    BOOL *p_isHandlingScrollViewDelegateCallout = v6;
  }
  else
  {
    id WeakRetained = 0;
  }
LABEL_7:
}

- (uint64_t)isIndexPathInOrthogonalScrollingSection:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = 0;
  if (a1 && v3)
  {
    if ([v3 item] == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = -[_UICollectionViewOrthogonalScrollerSectionController isSectionOrthogonallyScrolling:](a1, [v4 section]);
    }
  }

  return v5;
}

- (BOOL)isIndexPathInExtantOrthogonalScroller:(BOOL)a1
{
  id v3 = a2;
  if (a1)
  {
    if (-[_UICollectionViewOrthogonalScrollerSectionController isIndexPathInOrthogonalScrollingSection:](a1, v3))
    {
      id v4 = -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:]((id *)a1, [v3 section], 0);
      a1 = v4 != 0;
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (id)autoScrollAssistantForOrthogonalScrollingSectionAtIndexPath:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (-[_UICollectionViewOrthogonalScrollerSectionController isIndexPathInExtantOrthogonalScroller:]((BOOL)a1, v3))
    {
      id v4 = -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:](a1, [v3 section], 0);
      a1 = [v4 _autoScrollAssistant];
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)adjustElementHierarchyOrderingForOrthogonalElementIfNeeded:(void *)a3 layoutAttributes:
{
  id v11 = a2;
  uint64_t v5 = a3;
  if (v11 && a1 && v5 && (v5[144] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    uint64_t v7 = WeakRetained;
    if (WeakRetained && (objc_msgSend(WeakRetained, "__hasTransitionLayoutAttributes") & 1) == 0)
    {
      uint64_t v8 = [v7 collectionViewLayout];
      if ([v8 _hasOrthogonalScrollingSections])
      {
        if ([v8 _orthogonalScrollingElementShouldAppearAboveForAttributes:v5])
        {
          [v7 bringSubviewToFront:v11];
          [a1[5] addObject:v11];
        }
        else if ([v8 _orthogonalScrollingElementShouldAppearBelowForAttributes:v5])
        {
          [a1[6] addObject:v11];
          BOOL v9 = [v5 indexPath];
          uint64_t v10 = [v9 section];

          -[_UICollectionViewOrthogonalScrollerSectionController _placeView:belowOrthogonalScrollViewForSection:]((uint64_t)a1, v11, v10);
        }
      }
    }
  }
}

- (void)_placeView:(uint64_t)a3 belowOrthogonalScrollViewForSection:
{
  id v9 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    if (WeakRetained)
    {
      BOOL v6 = -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:](a1, a3, 0);
      uint64_t v7 = v6;
      if (v6)
      {
        id v8 = [v6 superview];

        if (v8 == WeakRetained) {
          [WeakRetained insertSubview:v9 belowSubview:v7];
        }
      }
    }
  }
}

- (void)updateParentScrollViewForCellPromiseRegion:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v8 = v3;
    id v4 = [v3 layoutAttributes];
    uint64_t v5 = [v4 indexPath];
    uint64_t v6 = [v5 section];

    uint64_t v7 = -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:](a1, v6, 0);
    if (v7) {
      [v8 setParentScrollView:v7];
    }

    id v3 = v8;
  }
}

- (void)setShouldPreventFocusScrollPastContentSize:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a1 && *(unsigned __int8 *)(a1 + 8) != a2)
  {
    *(unsigned char *)(a1 + 8) = a2;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = objc_msgSend(*(id *)(a1 + 24), "objectEnumerator", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * v7++) _setShouldPreventFocusScrollPastContentSize:*(unsigned __int8 *)(a1 + 8)];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)scrollToItemAtIndexPath:(uint64_t)a3 atScrollPosition:(uint64_t)a4 additionalInsets:(double)a5 animated:(double)a6
{
  id v15 = a2;
  if (a1)
  {
    if (v15)
    {
      id v19 = v15;
      BOOL v16 = (unint64_t)[v15 length] >= 2;
      id v15 = v19;
      if (v16)
      {
        -[_UICollectionViewOrthogonalScrollerSectionController _scrollViewForSection:createIfNecessary:](a1, [v19 section], 1);
        uint64_t v17 = (id *)objc_claimAutoreleasedReturnValue();
        long long v18 = v17;
        if (v17) {
          -[_UICollectionViewOrthogonalScrollView scrollToItemAtIndexPath:atScrollPosition:additionalInsets:animated:](v17, (uint64_t)v19, a3, a4, a5, a6, a7, a8);
        }

        id v15 = v19;
      }
    }
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  if (self)
  {
    BOOL isHandlingScrollViewDelegateCallout = self->_isHandlingScrollViewDelegateCallout;
    self->_BOOL isHandlingScrollViewDelegateCallout = 1;
  }
  else
  {
    BOOL isHandlingScrollViewDelegateCallout = 0;
  }
  a5->x = -[_UICollectionViewOrthogonalScrollView contentOffsetAdjustedForCurrentScrollingBehavior:itemFrame:]((id *)a3, a5->x, a5->y, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));
  a5->y = v8;
  if (self) {
    self->_BOOL isHandlingScrollViewDelegateCallout = isHandlingScrollViewDelegateCallout;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementsBelowOrthogonalScrollView, 0);
  objc_storeStrong((id *)&self->_frontMostElements, 0);
  objc_storeStrong((id *)&self->_scrollViewsQueuedForRemoval, 0);
  objc_storeStrong((id *)&self->_sectionToScrollViewMap, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end