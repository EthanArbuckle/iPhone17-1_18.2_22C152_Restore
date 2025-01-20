@interface _UIFloatingTabBarSpringLoadedInteractionBehavior
- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4;
- (_UIFloatingTabBar)tabBar;
- (void)interaction:(id)a3 didChangeWithContext:(id)a4;
- (void)setTabBar:(id)a3;
@end

@implementation _UIFloatingTabBarSpringLoadedInteractionBehavior

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v5 = a4;
  v6 = [(_UIFloatingTabBarSpringLoadedInteractionBehavior *)self tabBar];
  v7 = [v6 tabModel];
  char v8 = [v7 isEditing];

  if ((v8 & 1) == 0)
  {
    v10 = [(_UIFloatingTabBarSpringLoadedInteractionBehavior *)self tabBar];
    v11 = [v10 pinnedItemsView];
    [v5 locationInView:v11];
    double v13 = v12;
    double v15 = v14;

    v16 = [(_UIFloatingTabBarSpringLoadedInteractionBehavior *)self tabBar];
    v17 = [v16 pinnedItemsView];
    uint64_t v18 = objc_msgSend(v17, "itemIndexForItemAtLocation:", v13, v15);

    v19 = [v5 targetItem];
    v20 = [(_UIFloatingTabBarSpringLoadedInteractionBehavior *)self tabBar];
    v21 = v20;
    if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = [v20 collectionView];
      [v5 locationInView:v22];
      double v24 = v23;
      double v26 = v25;

      v27 = [(_UIFloatingTabBarSpringLoadedInteractionBehavior *)self tabBar];
      v28 = [v27 collectionView];
      [v28 bounds];
      v43.x = v24;
      v43.y = v26;
      BOOL v29 = CGRectContainsPoint(v44, v43);

      if (!v29)
      {
        v36 = 0;
LABEL_17:
        v32 = 0;
        goto LABEL_18;
      }
      v30 = [(_UIFloatingTabBarSpringLoadedInteractionBehavior *)self tabBar];
      v31 = [v30 collectionView];
      v32 = objc_msgSend(v31, "indexPathForItemAtPoint:", v24, v26);

      v33 = [(_UIFloatingTabBarSpringLoadedInteractionBehavior *)self tabBar];
      v34 = [v33 dataSource];
      v35 = [v34 itemIdentifierForIndexPath:v32];

      v36 = [v35 tabForSelection];

      if (!v36) {
        goto LABEL_18;
      }
    }
    else
    {
      v37 = [v20 pinnedItemsView];
      v36 = [v37 tabForSelectionAtItemIndex:v18];

      v32 = [MEMORY[0x1E4F28D58] indexPathForItem:v18 inSection:3];
      if (!v36)
      {
LABEL_18:
        char v9 = 0;
        goto LABEL_19;
      }
    }
    [v5 setTargetItem:v32];
    if (!v19) {
      goto LABEL_15;
    }
    id v38 = v19;
    id v39 = v32;
    if (v38 == v39)
    {

      goto LABEL_15;
    }
    v40 = v39;
    if (v39)
    {
      int v41 = [v38 isEqual:v39];

      if (!v41)
      {
        char v9 = 0;
        v32 = v40;
LABEL_19:

        goto LABEL_20;
      }
LABEL_15:
      char v9 = [v36 isSpringLoaded];
      goto LABEL_19;
    }

    goto LABEL_17;
  }
  char v9 = 0;
LABEL_20:

  return v9;
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 state];
  id v12 = [v6 targetItem];
  char v8 = [(_UIFloatingTabBarSpringLoadedInteractionBehavior *)self tabBar];
  char v9 = [v8 _viewForItemAtIndexPath:v12];
  [v6 setTargetView:v9];

  v10 = [(_UIFloatingTabBarSpringLoadedInteractionBehavior *)self tabBar];
  v11 = [v10 blinkEffect];
  [v11 interaction:v7 didChangeWithContext:v6];
}

- (_UIFloatingTabBar)tabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  return (_UIFloatingTabBar *)WeakRetained;
}

- (void)setTabBar:(id)a3
{
}

- (void).cxx_destruct
{
}

@end