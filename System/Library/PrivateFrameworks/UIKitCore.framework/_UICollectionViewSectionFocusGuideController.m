@interface _UICollectionViewSectionFocusGuideController
- (CGRect)_sectionEndFrameForSection:(int64_t)a3 layout:(id)a4;
- (CGRect)_sectionFrameForSection:(int64_t)a3 layout:(id)a4;
- (NSIndexPath)focusedIndexPath;
- (NSMapTable)focusGuideFromSectionMap;
- (NSMapTable)focusGuideToSectionMap;
- (NSUUID)lastUpdateIdentifier;
- (UICollectionView)collectionView;
- (_UICollectionViewSectionFocusGuideController)initWithCollectionView:(id)a3;
- (id)_createOrUpdateSectionFocusGuidePackageForSection:(int64_t)a3;
- (id)_focusGuides;
- (id)_sectionFocusGuidePackageForSection:(int64_t)a3;
- (id)_sectionsToLoad;
- (int64_t)pivotSection;
- (void)_layoutSectionFocusGuide:(id)a3 forSection:(int64_t)a4 inLayout:(id)a5;
- (void)_layoutSectionFocusGuide:(id)a3 forSection:(int64_t)a4 withFrame:(CGRect)a5;
- (void)_removeSectionFocusGuidesForSection:(int64_t)a3;
- (void)_updatePivotSection;
- (void)_updateSectionEndFocusGuideForSection:(int64_t)a3 inPackage:(id)a4 layout:(id)a5;
- (void)cleanupSectionFocusGuides;
- (void)performLayout;
- (void)reloadSectionFocusGuides;
- (void)setCollectionView:(id)a3;
- (void)setFocusGuideFromSectionMap:(id)a3;
- (void)setFocusGuideToSectionMap:(id)a3;
- (void)setFocusedIndexPath:(id)a3;
- (void)setLastUpdateIdentifier:(id)a3;
- (void)setPivotSection:(int64_t)a3;
- (void)updateFocusedIndexPath:(id)a3;
- (void)updateFocusedIndexPath:(id)a3 immediatelyReevaluatePivotIndex:(BOOL)a4;
@end

@implementation _UICollectionViewSectionFocusGuideController

- (void)performLayout
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained collectionViewLayout];
    v6 = v5;
    if (v5 && [v5 _layoutAxis] == 2)
    {
      [(_UICollectionViewSectionFocusGuideController *)self _updatePivotSection];
      v7 = [(_UICollectionViewSectionFocusGuideController *)self _sectionsToLoad];
      v8 = (void *)MEMORY[0x1E4F1CAD0];
      v9 = [(NSMapTable *)self->_focusGuideToSectionMap objectEnumerator];
      v10 = [v9 allObjects];
      v11 = [v8 setWithArray:v10];

      v12 = (void *)[v11 mutableCopy];
      [v12 minusSet:v7];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v29;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v13);
            }
            -[_UICollectionViewSectionFocusGuideController _removeSectionFocusGuidesForSection:](self, "_removeSectionFocusGuidesForSection:", [*(id *)(*((void *)&v28 + 1) + 8 * v17++) integerValue]);
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v15);
      }

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v18 = v7;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v25;
        do
        {
          uint64_t v22 = 0;
          do
          {
            if (*(void *)v25 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = -[_UICollectionViewSectionFocusGuideController _createOrUpdateSectionFocusGuidePackageForSection:](self, "_createOrUpdateSectionFocusGuidePackageForSection:", objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v22++), "integerValue", (void)v24));
          }
          while (v20 != v22);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
        }
        while (v20);
      }
    }
  }
}

- (id)_createOrUpdateSectionFocusGuidePackageForSection:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v6 = WeakRetained;
  if (!WeakRetained)
  {
    v8 = 0;
    goto LABEL_18;
  }
  v7 = [WeakRetained _focusSystem];

  v8 = 0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v7)
  {
    v9 = [v6 collectionViewLayout];
    if (v9)
    {
      if (a3 < 0
        || (([v6 _collectionViewData], (v10 = objc_claimAutoreleasedReturnValue()) == 0)
          ? (int64_t v11 = 0)
          : (int64_t v11 = (uint64_t)(v10[14] - v10[13]) >> 3),
            v10,
            v11 <= a3))
      {
        if (os_variant_has_internal_diagnostics())
        {
          long long v25 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 134217984;
            int64_t v27 = a3;
            _os_log_fault_impl(&dword_1853B0000, v25, OS_LOG_TYPE_FAULT, "Attempting to create or update focus guide for invalid section: %li", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_createOrUpdateSectionFocusGuidePackageForSection____s_category)+ 8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134217984;
            int64_t v27 = a3;
            _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Attempting to create or update focus guide for invalid section: %li", buf, 0xCu);
          }
        }
      }
      else
      {
        v12 = [(_UICollectionViewSectionFocusGuideController *)self _sectionFocusGuidePackageForSection:a3];
        if (v12)
        {
          v8 = v12;
          id v13 = [(_UISectionFocusContainerGuidePackage *)v12 sectionFocusGuide];
          [(_UICollectionViewSectionFocusGuideController *)self _layoutSectionFocusGuide:v13 forSection:a3 inLayout:v9];

LABEL_11:
          [(_UICollectionViewSectionFocusGuideController *)self _updateSectionEndFocusGuideForSection:a3 inPackage:v8 layout:v9];
LABEL_17:

          goto LABEL_18;
        }
        [(_UICollectionViewSectionFocusGuideController *)self _sectionFrameForSection:a3 layout:v9];
        double x = v30.origin.x;
        double y = v30.origin.y;
        double width = v30.size.width;
        double height = v30.size.height;
        if (!CGRectIsNull(v30))
        {
          uint64_t v20 = [NSNumber numberWithInteger:a3];
          uint64_t v21 = [[_UIFocusCollectionViewSectionContainerGuide alloc] initWithCollectionView:v6];
          [v6 addLayoutGuide:v21];
          [(UILayoutGuide *)v21 _setLockedToOwningView:1];
          uint64_t v22 = [NSString stringWithFormat:@"UICollectionViewSectionFocusContainerGuide_%@", v20];
          [(UILayoutGuide *)v21 setIdentifier:v22];

          [(_UIFocusCollectionViewSectionContainerGuide *)v21 setSection:a3];
          v8 = objc_alloc_init(_UISectionFocusContainerGuidePackage);
          [(_UISectionFocusContainerGuidePackage *)v8 setSectionFocusGuide:v21];
          id v23 = [(_UICollectionViewSectionFocusGuideController *)self focusGuideFromSectionMap];
          [v23 setObject:v8 forKey:v20];

          long long v24 = [(_UICollectionViewSectionFocusGuideController *)self focusGuideToSectionMap];
          [v24 setObject:v20 forKey:v8];

          -[_UICollectionViewSectionFocusGuideController _layoutSectionFocusGuide:forSection:withFrame:](self, "_layoutSectionFocusGuide:forSection:withFrame:", v21, a3, x, y, width, height);
          if (!v8) {
            goto LABEL_17;
          }
          goto LABEL_11;
        }
      }
    }
    v8 = 0;
    goto LABEL_17;
  }
LABEL_18:

  return v8;
}

- (id)_sectionsToLoad
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained collectionViewLayout];
    if (v5
      && ([v4 _collectionViewData], (v6 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v8 = v6[13], uint64_t v7 = v6[14], v6, (v9 = v7 - v8) != 0)
      && [(_UICollectionViewSectionFocusGuideController *)self pivotSection] != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v12 = v9 >> 3;
      uint64_t v13 = [(_UICollectionViewSectionFocusGuideController *)self pivotSection];
      if (v13 <= 6) {
        uint64_t v14 = 6;
      }
      else {
        uint64_t v14 = v13;
      }
      int64_t v15 = v12 - 1;
      int64_t v16 = [(_UICollectionViewSectionFocusGuideController *)self pivotSection];
      if (v15 >= v16 + 6) {
        int64_t v17 = v16 + 6;
      }
      else {
        int64_t v17 = v15;
      }
      v10 = [MEMORY[0x1E4F1CA80] set];
      if (v14 - 6 <= v17)
      {
        uint64_t v18 = v14 - 7;
        do
        {
          uint64_t v19 = [NSNumber numberWithInteger:++v18];
          [v10 addObject:v19];
        }
        while (v17 != v18);
      }
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CAD0] set];
    }
  }
  else
  {
    v10 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v10;
}

- (void)_updatePivotSection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  [(_UICollectionViewSectionFocusGuideController *)self setPivotSection:0x7FFFFFFFFFFFFFFFLL];
  v3 = WeakRetained;
  if (WeakRetained)
  {
    char v4 = [WeakRetained _needsReload];
    v3 = WeakRetained;
    if ((v4 & 1) == 0)
    {
      v5 = [WeakRetained collectionViewLayout];
      if (v5)
      {
        v6 = [WeakRetained _collectionViewData];
        if (v6)
        {
          uint64_t v8 = v6[13];
          uint64_t v7 = v6[14];

          uint64_t v9 = v7 - v8;
          if (v7 != v8)
          {
            v10 = [(_UICollectionViewSectionFocusGuideController *)self focusedIndexPath];

            if (v10)
            {
              int64_t v11 = [(_UICollectionViewSectionFocusGuideController *)self focusedIndexPath];
              -[_UICollectionViewSectionFocusGuideController setPivotSection:](self, "setPivotSection:", [v11 section]);
            }
            if ([(_UICollectionViewSectionFocusGuideController *)self pivotSection] == 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v12 = [WeakRetained _existingVisibleCells];
              uint64_t v13 = [v12 firstObject];

              if (v13)
              {
                uint64_t v14 = [WeakRetained indexPathForCell:v13];
                int64_t v15 = v14;
                if (v14) {
                  -[_UICollectionViewSectionFocusGuideController setPivotSection:](self, "setPivotSection:", [v14 section]);
                }
              }
            }
            if ([(_UICollectionViewSectionFocusGuideController *)self pivotSection] == 0x7FFFFFFFFFFFFFFFLL) {
              [(_UICollectionViewSectionFocusGuideController *)self setPivotSection:0];
            }
            if ([(_UICollectionViewSectionFocusGuideController *)self pivotSection] != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v16 = [(_UICollectionViewSectionFocusGuideController *)self pivotSection];
              if ((v16 & ~(v16 >> 63)) >= (v9 >> 3) - 1) {
                uint64_t v17 = (v9 >> 3) - 1;
              }
              else {
                uint64_t v17 = v16 & ~(v16 >> 63);
              }
              [(_UICollectionViewSectionFocusGuideController *)self setPivotSection:v17];
            }
          }
        }
      }

      v3 = WeakRetained;
    }
  }
}

- (int64_t)pivotSection
{
  return self->_pivotSection;
}

- (void)setPivotSection:(int64_t)a3
{
  self->_pivotSection = a3;
}

- (NSIndexPath)focusedIndexPath
{
  return self->_focusedIndexPath;
}

- (_UICollectionViewSectionFocusGuideController)initWithCollectionView:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionViewSectionFocusGuideController;
  v5 = [(_UICollectionViewSectionFocusGuideController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_collectionView, v4);
    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    focusGuideFromSectionMap = v6->_focusGuideFromSectionMap;
    v6->_focusGuideFromSectionMap = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    focusGuideToSectionMap = v6->_focusGuideToSectionMap;
    v6->_focusGuideToSectionMap = (NSMapTable *)v9;

    v6->_pivotSection = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (void)cleanupSectionFocusGuides
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (WeakRetained)
  {
    id v4 = [(_UICollectionViewSectionFocusGuideController *)self _focusGuides];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          [v9 _setLockedToOwningView:0];
          [WeakRetained removeLayoutGuide:v9];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  v10 = [(_UICollectionViewSectionFocusGuideController *)self focusGuideFromSectionMap];
  [v10 removeAllObjects];

  int64_t v11 = [(_UICollectionViewSectionFocusGuideController *)self focusGuideToSectionMap];
  [v11 removeAllObjects];
}

- (NSMapTable)focusGuideToSectionMap
{
  return self->_focusGuideToSectionMap;
}

- (NSMapTable)focusGuideFromSectionMap
{
  return self->_focusGuideFromSectionMap;
}

- (id)_focusGuides
{
  v2 = [(NSMapTable *)self->_focusGuideFromSectionMap objectEnumerator];
  v3 = [v2 allObjects];
  id v4 = [v3 valueForKeyPath:@"@unionOfArrays.focusGuides"];

  return v4;
}

- (void)updateFocusedIndexPath:(id)a3 immediatelyReevaluatePivotIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(_UICollectionViewSectionFocusGuideController *)self focusedIndexPath];
  id v8 = v6;
  id v10 = v8;
  if (v7 == v8)
  {

    goto LABEL_10;
  }
  if (v8 && v7)
  {
    char v9 = [v7 isEqual:v8];

    if (v9) {
      goto LABEL_10;
    }
  }
  else
  {
  }
  [(_UICollectionViewSectionFocusGuideController *)self setFocusedIndexPath:v10];
  if (v4) {
    [(_UICollectionViewSectionFocusGuideController *)self _updatePivotSection];
  }
LABEL_10:
}

- (void)updateFocusedIndexPath:(id)a3
{
}

- (void)reloadSectionFocusGuides
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  [(_UICollectionViewSectionFocusGuideController *)self cleanupSectionFocusGuides];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  BOOL v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained _focusSystem];

    if (v5)
    {
      id v6 = [v4 collectionViewLayout];
      id v7 = v6;
      if (v6 && [v6 _layoutAxis] == 2)
      {
        id v8 = [(_UICollectionViewSectionFocusGuideController *)self _sectionsToLoad];
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v15;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v15 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = -[_UICollectionViewSectionFocusGuideController _createOrUpdateSectionFocusGuidePackageForSection:](self, "_createOrUpdateSectionFocusGuidePackageForSection:", [*(id *)(*((void *)&v14 + 1) + 8 * v12++) integerValue]);
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          }
          while (v10);
        }
      }
    }
  }
}

- (id)_sectionFocusGuidePackageForSection:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = 0;
  }
  else
  {
    uint64_t v5 = [(_UICollectionViewSectionFocusGuideController *)self focusGuideFromSectionMap];
    id v6 = [NSNumber numberWithInteger:a3];
    v3 = [v5 objectForKey:v6];
  }
  return v3;
}

- (void)_updateSectionEndFocusGuideForSection:(int64_t)a3 inPackage:(id)a4 layout:(id)a5
{
  id v20 = a4;
  [(_UICollectionViewSectionFocusGuideController *)self _sectionEndFrameForSection:a3 layout:a5];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  long long v16 = [NSNumber numberWithInteger:a3];
  long long v17 = [v20 sectionEndFocusGuide];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  v22.origin.double x = v9;
  v22.origin.double y = v11;
  v22.size.double width = v13;
  v22.size.double height = v15;
  if (CGRectIsNull(v22))
  {
    if (!v17) {
      goto LABEL_8;
    }
    [(UILayoutGuide *)v17 _setLockedToOwningView:0];
    [WeakRetained removeLayoutGuide:v17];
    [v20 setSectionEndFocusGuide:0];
  }
  else
  {
    if (!v17)
    {
      long long v17 = [[_UIFocusCollectionViewSectionContainerGuide alloc] initWithCollectionView:WeakRetained];
      [WeakRetained addLayoutGuide:v17];
      [(UILayoutGuide *)v17 _setLockedToOwningView:1];
      uint64_t v19 = [NSString stringWithFormat:@"UICollectionViewSectionEndFocusContainerGuide_%@", v16];
      [(UILayoutGuide *)v17 setIdentifier:v19];

      [(_UIFocusCollectionViewSectionContainerGuide *)v17 setSection:a3];
      [v20 setSectionEndFocusGuide:v17];
    }
    -[UILayoutGuide _setManualLayoutFrame:](v17, "_setManualLayoutFrame:", v9, v11, v13, v15);
  }

LABEL_8:
}

- (void)_removeSectionFocusGuidesForSection:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = -[_UICollectionViewSectionFocusGuideController _sectionFocusGuidePackageForSection:](self, "_sectionFocusGuidePackageForSection:");
  id v6 = [NSNumber numberWithInteger:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v8 = objc_msgSend(v5, "focusGuides", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          double v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          [v13 _setLockedToOwningView:0];
          [WeakRetained removeLayoutGuide:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    double v14 = [(_UICollectionViewSectionFocusGuideController *)self focusGuideToSectionMap];
    [v14 removeObjectForKey:v5];
  }
  double v15 = [(_UICollectionViewSectionFocusGuideController *)self focusGuideFromSectionMap];
  [v15 removeObjectForKey:v6];
}

- (void)_layoutSectionFocusGuide:(id)a3 forSection:(int64_t)a4 inLayout:(id)a5
{
  id v8 = a3;
  [(_UICollectionViewSectionFocusGuideController *)self _sectionFrameForSection:a4 layout:a5];
  -[_UICollectionViewSectionFocusGuideController _layoutSectionFocusGuide:forSection:withFrame:](self, "_layoutSectionFocusGuide:forSection:withFrame:", v8, a4);
}

- (void)_layoutSectionFocusGuide:(id)a3 forSection:(int64_t)a4 withFrame:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v12 = [v10 section];
  if (has_internal_diagnostics)
  {
    if (v12 == a4) {
      goto LABEL_4;
    }
    double v14 = __UIFaultDebugAssertLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      goto LABEL_13;
    }
    uint64_t v15 = [v10 section];
    long long v16 = [v10 debugDescription];
    int v20 = 134218498;
    uint64_t v21 = v15;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    __int16 v24 = 2112;
    long long v25 = v16;
    _os_log_fault_impl(&dword_1853B0000, v14, OS_LOG_TYPE_FAULT, "Attempting to layout focus guide for section: %li with mismatched sectionIndex: %li.\n%@", (uint8_t *)&v20, 0x20u);
LABEL_12:

LABEL_13:
    goto LABEL_4;
  }
  if (v12 != a4)
  {
    long long v17 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_layoutSectionFocusGuide_forSection_withFrame____s_category)+ 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      double v14 = v17;
      uint64_t v19 = [v10 section];
      long long v16 = [v10 debugDescription];
      int v20 = 134218498;
      uint64_t v21 = v19;
      __int16 v22 = 2048;
      int64_t v23 = a4;
      __int16 v24 = 2112;
      long long v25 = v16;
      _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_ERROR, "Attempting to layout focus guide for section: %li with mismatched sectionIndex: %li.\n%@", (uint8_t *)&v20, 0x20u);
      goto LABEL_12;
    }
  }
LABEL_4:
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  BOOL IsNull = CGRectIsNull(v27);
  if (!IsNull) {
    objc_msgSend(v10, "_setManualLayoutFrame:", x, y, width, height);
  }
  [v10 setEnabled:!IsNull];
}

- (CGRect)_sectionFrameForSection:(int64_t)a3 layout:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    [v6 _layoutFrameForSection:a3];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    uint64_t v15 = [v6 _layoutAxis];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
    [WeakRetained bounds];
    double v18 = v17;
    double v20 = v19;

    double v21 = 0.0;
    if (v15 == 1) {
      double v22 = v20;
    }
    else {
      double v22 = v14;
    }
    if (v15 == 1) {
      double v23 = 0.0;
    }
    else {
      double v23 = v10;
    }
    if (v15 == 2) {
      double v24 = v14;
    }
    else {
      double v24 = v22;
    }
    if (v15 == 2) {
      double v25 = v18;
    }
    else {
      double v25 = v12;
    }
    if (v15 == 2) {
      double v26 = v10;
    }
    else {
      double v26 = v23;
    }
    if (v15 != 2) {
      double v21 = v8;
    }
  }
  else
  {
    double v21 = *MEMORY[0x1E4F1DB20];
    double v26 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v25 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v24 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.double height = v24;
  result.size.double width = v25;
  result.origin.double y = v26;
  result.origin.double x = v21;
  return result;
}

- (CGRect)_sectionEndFrameForSection:(int64_t)a3 layout:(id)a4
{
  id v6 = a4;
  double v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  uint64_t v8 = [v6 _layoutAxis];
  if (!v8) {
    goto LABEL_9;
  }
  uint64_t v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  double v11 = [WeakRetained _collectionViewData];
  uint64_t v12 = -[UICollectionViewData _existingNumberOfItemsInSection:]((uint64_t)v11, a3);

  if (v12 > 0)
  {
    double v13 = [MEMORY[0x1E4F28D58] indexPathForItem:v12 - 1 inSection:a3];
    double v14 = [v7 layoutAttributesForItemAtIndexPath:v13];
    if (v14)
    {
      [(_UICollectionViewSectionFocusGuideController *)self _sectionFrameForSection:a3 layout:v7];
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat rect = v19;
      CGFloat v21 = v20;
      [v14 frame];
      CGFloat v40 = v23;
      double v41 = v24;
      double v42 = v25;
      CGFloat v26 = *MEMORY[0x1E4F1DB20];
      CGFloat MinY = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat Width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat Height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      if (v9 == 1)
      {
        CGFloat v32 = v22;
        v49.origin.double x = v16;
        v49.origin.double y = v18;
        v49.size.double width = rect;
        v49.size.double height = v21;
        CGFloat v39 = v21;
        double MinX = CGRectGetMinX(v49);
        v50.origin.double x = v32;
        v50.origin.double y = v40;
        v50.size.double width = v42;
        v50.size.double height = v41;
        if (CGRectGetMinX(v50) - MinX >= v42)
        {
          v51.origin.double x = v32;
          v51.origin.double y = v40;
          v51.size.double width = v42;
          v51.size.double height = v41;
          CGFloat v26 = CGRectGetMinX(v51);
          v52.origin.double x = v16;
          v52.origin.double y = v18;
          v52.size.double width = rect;
          v52.size.double height = v39;
          CGFloat MinY = CGRectGetMinY(v52);
          v53.origin.double x = v16;
          v53.origin.double y = v18;
          v53.size.double width = rect;
          v53.size.double height = v39;
          CGFloat Height = CGRectGetHeight(v53);
          CGFloat Width = v42;
        }
      }
      else if (v9 == 2)
      {
        CGFloat v30 = v22;
        v44.origin.double x = v16;
        v44.origin.double y = v18;
        v44.size.double width = rect;
        v44.size.double height = v21;
        CGFloat v38 = v21;
        double v31 = CGRectGetMinY(v44);
        v45.origin.double x = v30;
        v45.origin.double y = v40;
        v45.size.double width = v42;
        v45.size.double height = v41;
        if (CGRectGetMinY(v45) - v31 >= v41)
        {
          v46.origin.double x = v16;
          v46.origin.double y = v18;
          v46.size.double width = rect;
          v46.size.double height = v38;
          CGFloat v26 = CGRectGetMinX(v46);
          v47.origin.double x = v30;
          v47.origin.double y = v40;
          v47.size.double width = v42;
          v47.size.double height = v41;
          CGFloat MinY = CGRectGetMinY(v47);
          v48.origin.double x = v16;
          v48.origin.double y = v18;
          v48.size.double width = rect;
          v48.size.double height = v38;
          CGFloat Width = CGRectGetWidth(v48);
          CGFloat Height = v41;
        }
      }
    }
    else
    {
      CGFloat v26 = *MEMORY[0x1E4F1DB20];
      CGFloat MinY = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat Width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat Height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
  }
  else
  {
LABEL_9:
    CGFloat v26 = *MEMORY[0x1E4F1DB20];
    CGFloat MinY = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat Width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat Height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v34 = v26;
  double v35 = MinY;
  double v36 = Width;
  double v37 = Height;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (UICollectionView)collectionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  return (UICollectionView *)WeakRetained;
}

- (void)setCollectionView:(id)a3
{
}

- (void)setFocusGuideFromSectionMap:(id)a3
{
}

- (void)setFocusGuideToSectionMap:(id)a3
{
}

- (NSUUID)lastUpdateIdentifier
{
  return self->_lastUpdateIdentifier;
}

- (void)setLastUpdateIdentifier:(id)a3
{
}

- (void)setFocusedIndexPath:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedIndexPath, 0);
  objc_storeStrong((id *)&self->_lastUpdateIdentifier, 0);
  objc_storeStrong((id *)&self->_focusGuideToSectionMap, 0);
  objc_storeStrong((id *)&self->_focusGuideFromSectionMap, 0);
  objc_destroyWeak((id *)&self->_collectionView);
}

@end