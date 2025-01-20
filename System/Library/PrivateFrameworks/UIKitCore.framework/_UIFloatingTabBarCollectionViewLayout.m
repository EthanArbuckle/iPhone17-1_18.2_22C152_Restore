@interface _UIFloatingTabBarCollectionViewLayout
+ (Class)layoutAttributesClass;
- (BOOL)_initialAppearingLayoutAttributesCanBeOverriddenForEstimatedSizing;
- (BOOL)_supportsGroupClusters;
- (CGRect)_groupItemCellItemFrameForItemAtIndex:(int64_t)a3 offset:(CGPoint)a4;
- (_UIFloatingTabBar)floatingTabBar;
- (_UIFloatingTabBarCollectionViewLayout)initWithFloatingTabBar:(id)a3;
- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)setFloatingTabBar:(id)a3;
@end

@implementation _UIFloatingTabBarCollectionViewLayout

+ (Class)layoutAttributesClass
{
  return (Class)objc_opt_class();
}

- (_UIFloatingTabBarCollectionViewLayout)initWithFloatingTabBar:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, v4);
  v5 = [v4 _currentPlatformMetrics];
  [v5 backgroundInsets];
  v7 = v6;
  v9 = v8;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64___UIFloatingTabBarCollectionViewLayout_initWithFloatingTabBar___block_invoke;
  aBlock[3] = &unk_1E530F260;
  objc_copyWeak(v17, &location);
  v17[1] = v7;
  v17[2] = 0;
  v17[3] = v9;
  v17[4] = 0;
  v10 = _Block_copy(aBlock);
  v11 = objc_opt_new();
  [v11 setScrollDirection:1];
  [v11 setContentInsetsReference:1];
  v15.receiver = self;
  v15.super_class = (Class)_UIFloatingTabBarCollectionViewLayout;
  v12 = [(UICollectionViewCompositionalLayout *)&v15 initWithSectionProvider:v10 configuration:v11];
  v13 = v12;
  if (v12) {
    objc_storeWeak((id *)&v12->_floatingTabBar, v4);
  }

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

  return v13;
}

- (BOOL)_initialAppearingLayoutAttributesCanBeOverriddenForEstimatedSizing
{
  if ([(_UIFloatingTabBarCollectionViewLayout *)self _supportsGroupClusters]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIFloatingTabBarCollectionViewLayout;
  return [(UICollectionViewLayout *)&v4 _initialAppearingLayoutAttributesCanBeOverriddenForEstimatedSizing];
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (a5 == 2 && [(_UIFloatingTabBarCollectionViewLayout *)self _supportsGroupClusters])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91___UIFloatingTabBarCollectionViewLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
    aBlock[3] = &unk_1E530F2B0;
    void aBlock[4] = self;
    id v13 = v8;
    id v14 = v9;
    v10 = _Block_copy(aBlock);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)_UIFloatingTabBarCollectionViewLayout;
  [(UICollectionViewLayout *)&v31 prepareForCollectionViewUpdates:v4];
  if ([(_UIFloatingTabBarCollectionViewLayout *)self _supportsGroupClusters])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v25 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v28;
      p_info = UIResolvedShape.info;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v28 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (objc_msgSend(v11, "updateAction", v25) == 1)
          {
            v12 = [(UICollectionViewLayout *)self collectionView];
            id v13 = [v11 indexPathBeforeUpdate];
            id v14 = [v12 cellForItemAtIndexPath:v13];

            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_super v15 = [v14 listItem];
              v16 = [(_UIFloatingTabBarCollectionViewLayout *)self floatingTabBar];
              [v16 expandedGroupItem];
              uint64_t v17 = v8;
              v18 = self;
              id v19 = v5;
              v21 = v20 = p_info;
              int v26 = [v15 isEqual:v21];

              p_info = v20;
              id v5 = v19;
              self = v18;
              uint64_t v8 = v17;

              if (v26)
              {
                v22 = [v14 contentView];
                [v22 setHidden:1];

                [v14 frame];
                self->_expandingGroupCellOrigin.x = v23;
                self->_expandingGroupCellOrigin.y = v24;
              }
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v7);
    }

    id v4 = v25;
  }
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_UIFloatingTabBarCollectionViewLayout;
  id v5 = [(UICollectionViewCompositionalLayout *)&v16 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  if ([(_UIFloatingTabBarCollectionViewLayout *)self _supportsGroupClusters])
  {
    uint64_t v6 = [(_UIFloatingTabBarCollectionViewLayout *)self floatingTabBar];
    uint64_t v7 = [v6 dataSource];
    uint64_t v8 = [v7 itemIdentifierForIndexPath:v4];

    id v9 = [v8 parent];
    v10 = [(_UIFloatingTabBarCollectionViewLayout *)self floatingTabBar];
    v11 = [v10 expandedGroupItem];
    int v12 = [v9 isEqual:v11];

    if (v12)
    {
      -[_UIFloatingTabBarCollectionViewLayout _groupItemCellItemFrameForItemAtIndex:offset:](self, "_groupItemCellItemFrameForItemAtIndex:offset:", [v8 itemIndex], self->_expandingGroupCellOrigin.x, self->_expandingGroupCellOrigin.y);
      objc_msgSend(v5, "setFrame:");
      id v13 = [v8 parent];
      id v14 = [v13 children];
      objc_msgSend(v5, "setZIndex:", objc_msgSend(v14, "count") - objc_msgSend(v8, "itemIndex"));

      [v5 setAlpha:1.0];
      [v5 setGroupItemMinimized:1];
    }
  }
  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)_UIFloatingTabBarCollectionViewLayout;
  id v5 = [(UICollectionViewCompositionalLayout *)&v23 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  if ([(_UIFloatingTabBarCollectionViewLayout *)self _supportsGroupClusters])
  {
    uint64_t v6 = [(UICollectionViewLayout *)self collectionView];
    uint64_t v7 = [v6 cellForItemAtIndexPath:v4];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [v7 listItem];
      id v9 = [v8 parent];
      v10 = [(_UIFloatingTabBarCollectionViewLayout *)self floatingTabBar];
      v11 = [v10 outgoingExpandedGroupItem];
      int v12 = [v9 isEqual:v11];

      if (v12)
      {
        id v13 = [v7 listItem];
        id v14 = [(_UIFloatingTabBarCollectionViewLayout *)self floatingTabBar];
        objc_super v15 = [v14 dataSource];
        objc_super v16 = [v13 parent];
        uint64_t v17 = [v15 indexPathForItemIdentifier:v16];

        v18 = [(UICollectionViewCompositionalLayout *)self layoutAttributesForItemAtIndexPath:v17];
        uint64_t v19 = [v13 itemIndex];
        [v18 frame];
        -[_UIFloatingTabBarCollectionViewLayout _groupItemCellItemFrameForItemAtIndex:offset:](self, "_groupItemCellItemFrameForItemAtIndex:offset:", v19);
        objc_msgSend(v5, "setFrame:");
        v20 = [v13 parent];
        v21 = [v20 children];
        objc_msgSend(v5, "setZIndex:", objc_msgSend(v21, "count") - objc_msgSend(v13, "itemIndex"));

        [v5 setAlpha:1.0];
        [v5 setGroupItemMinimized:1];
      }
    }
  }
  return v5;
}

- (CGRect)_groupItemCellItemFrameForItemAtIndex:(int64_t)a3 offset:(CGPoint)a4
{
  uint64_t v6 = [(UICollectionViewLayout *)self collectionView];
  uint64_t v7 = [v6 traitCollection];

  +[_UIFloatingTabBarGroupCell layoutFrameForItemAtIndex:a3 traitCollection:v7];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingTabBar);
  uint64_t v17 = [WeakRetained _currentPlatformMetrics];
  [v17 imageMargins];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  v35.origin.CGFloat x = v9 - v21;
  v35.origin.CGFloat y = v11 - v19;
  v35.size.CGFloat width = v13 - (-v25 - v21);
  v35.size.CGFloat height = v15 - (-v23 - v19);
  CGRect v36 = CGRectOffset(v35, a4.x, a4.y);
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;

  double v30 = x;
  double v31 = y;
  double v32 = width;
  double v33 = height;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (BOOL)_supportsGroupClusters
{
  v2 = [(_UIFloatingTabBarCollectionViewLayout *)self floatingTabBar];
  v3 = [v2 _currentPlatformMetrics];
  char v4 = [v3 supportsGroupClusters];

  return v4;
}

- (_UIFloatingTabBar)floatingTabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingTabBar);
  return (_UIFloatingTabBar *)WeakRetained;
}

- (void)setFloatingTabBar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end