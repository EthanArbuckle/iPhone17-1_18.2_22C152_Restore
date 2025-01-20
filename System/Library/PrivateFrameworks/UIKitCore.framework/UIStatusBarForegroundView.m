@interface UIStatusBarForegroundView
- (BOOL)_accessibilityHUDGestureManager:(id)a3 canCancelGestureRecognizer:(id)a4;
- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_tryToPlaceItem:(id)a3 inItemArray:(id)a4 layoutManager:(id)a5 roomRemaining:(double *)a6 allowSwap:(BOOL)a7 swappedItem:(id *)a8;
- (BOOL)ignoringData;
- (BOOL)isShowingBreadcrumb;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)rectIntersectsBatteryItem:(CGRect)a3;
- (BOOL)rectIntersectsTimeItem:(CGRect)a3;
- (BOOL)willChangeNavigationItemDisplayWithSystemNavigationAction:(id)a3;
- (CGRect)frameForAllItemsInRegion:(int)a3;
- (CGRect)frameForItemOfType:(int)a3;
- (UIStatusBar)statusBar;
- (UIStatusBarForegroundStyleAttributes)foregroundStyle;
- (UIStatusBarForegroundView)initWithFrame:(CGRect)a3 foregroundStyle:(id)a4 usesVerticalLayout:(BOOL)a5;
- (double)leftEdgePadding;
- (double)rightEdgePadding;
- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4;
- (id)_computeVisibleItemsPreservingHistory:(BOOL)a3;
- (id)_statusBarItemViewAtPoint:(CGPoint)a3;
- (id)_statusBarWindowForAccessibilityHUD;
- (int64_t)idiom;
- (void)_accessibilityHUDGestureManager:(id)a3 showHUDItem:(id)a4;
- (void)_animateUnlockCompletionBlock:(id)a3;
- (void)_cleanUpAfterDataChange;
- (void)_cleanUpAfterSimpleReflow;
- (void)_dismissAccessibilityHUDForGestureManager:(id)a3;
- (void)_reflowItemViewsCrossfadingCenterWithDuration:(double)a3 timeWasEnabled:(BOOL)a4;
- (void)_reflowItemViewsWithDuration:(double)a3 preserveHistory:(BOOL)a4;
- (void)_setStatusBarData:(id)a3 actions:(int)a4 animated:(BOOL)a5;
- (void)animateUnlock;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)jiggleLockIcon;
- (void)reflowItemViews:(BOOL)a3;
- (void)reflowItemViewsCrossfadingCenter:(id)a3 duration:(double)a4;
- (void)reflowItemViewsForgettingEitherSideItemHistory;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIdiom:(int64_t)a3;
- (void)setPersistentAnimationsEnabled:(BOOL)a3;
- (void)setStatusBarData:(id)a3 actions:(int)a4 animated:(BOOL)a5;
- (void)startIgnoringData;
- (void)stopIgnoringData:(BOOL)a3;
@end

@implementation UIStatusBarForegroundView

- (UIStatusBarForegroundView)initWithFrame:(CGRect)a3 foregroundStyle:(id)a4 usesVerticalLayout:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v21.receiver = self;
  v21.super_class = (Class)UIStatusBarForegroundView;
  v13 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_foregroundStyle, a4);
    uint64_t v15 = 0;
    v14->_usesVerticalLayout = a5;
    do
    {
      v16 = [[UIStatusBarLayoutManager alloc] initWithRegion:v15 foregroundView:v14 usesVerticalLayout:v14->_usesVerticalLayout];
      v17 = v14->_layoutManagers[v15];
      v14->_layoutManagers[v15] = v16;

      ++v15;
    }
    while (v15 != 3);
    [(UIView *)v14 setAutoresizingMask:18];
    v18 = [[UIAccessibilityHUDGestureManager alloc] initWithView:v14 delegate:v14];
    accessibilityHUDGestureManager = v14->_accessibilityHUDGestureManager;
    v14->_accessibilityHUDGestureManager = v18;
  }
  return v14;
}

- (void)dealloc
{
  uint64_t v3 = 0;
  layoutManagers = self->_layoutManagers;
  do
  {
    [(UIStatusBarLayoutManager *)layoutManagers[v3] setForegroundView:0];
    v5 = layoutManagers[v3];
    layoutManagers[v3] = 0;

    ++v3;
  }
  while (v3 != 3);
  v6.receiver = self;
  v6.super_class = (Class)UIStatusBarForegroundView;
  [(UIView *)&v6 dealloc];
}

- (id)_statusBarItemViewAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = 0;
  layoutManagers = self->_layoutManagers;
  do
  {
    v8 = layoutManagers[v6];
    v9 = -[UIStatusBarLayoutManager visibleItemViewAtPoint:inForegroundView:](v8, "visibleItemViewAtPoint:inForegroundView:", self, x, y);

    if (v9) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = v6 == 2;
    }
    ++v6;
  }
  while (!v10);
  return v9;
}

- (id)_statusBarWindowForAccessibilityHUD
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [(UIView *)self window];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
  }
  else
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &_statusBarWindowForAccessibilityHUD___s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v6 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        int v7 = 138412290;
        v8 = v2;
        _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "status bar wanted to show or hide the accessibility HUD but instead of a status bar window there was %@", (uint8_t *)&v7, 0xCu);
      }
    }
    id v3 = 0;
  }

  return v3;
}

- (id)_accessibilityHUDGestureManager:(id)a3 HUDItemForPoint:(CGPoint)a4
{
  v4 = -[UIStatusBarForegroundView _statusBarItemViewAtPoint:](self, "_statusBarItemViewAtPoint:", a3, a4.x, a4.y);
  v5 = [v4 accessibilityHUDRepresentation];

  return v5;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_accessibilityHUDGestureManager:(id)a3 canCancelGestureRecognizer:(id)a4
{
  return 0;
}

- (void)_accessibilityHUDGestureManager:(id)a3 showHUDItem:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(UIView *)self traitCollection];
  objc_msgSend(v5, "setCustomUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  id v7 = [(UIStatusBarForegroundView *)self _statusBarWindowForAccessibilityHUD];
  [v7 _showAccessibilityHUDItem:v5 forView:self];
}

- (void)_dismissAccessibilityHUDForGestureManager:(id)a3
{
  id v3 = [(UIStatusBarForegroundView *)self _statusBarWindowForAccessibilityHUD];
  [v3 _dismissAccessibilityHUD];
}

- (UIStatusBar)statusBar
{
  id v3 = [(UIView *)self superview];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(UIView *)self superview];
  }
  else
  {
    id v5 = 0;
  }
  return (UIStatusBar *)v5;
}

- (BOOL)willChangeNavigationItemDisplayWithSystemNavigationAction:(id)a3
{
  int v3 = self->_itemIsEnabled[50];
  v4 = [a3 titleForDestination:0];
  int v5 = [v4 length] != 0;

  return v3 != v5;
}

- (void)_setStatusBarData:(id)a3 actions:(int)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  if (a4 || ![(UIStatusBarComposedData *)self->_currentData isEqual:v9])
  {
    objc_storeStrong((id *)&self->_currentData, a3);
    [(UIStatusBarForegroundView *)self startIgnoringData];
    BOOL v10 = [(UIStatusBarForegroundView *)self foregroundStyle];
    int v11 = [v10 canShowBreadcrumbs];

    if (v11)
    {
      if (*(unsigned char *)([v9 rawData] + 2537))
      {
        uint64_t v12 = 1;
      }
      else
      {
        v13 = [v9 systemNavigationItem];
        v14 = [v13 destinations];
        uint64_t v12 = [v14 containsObject:&unk_1ED3F6870];
      }
      [v9 setItem:50 enabled:v12];
      [v9 setItem:51 enabled:0];
    }
    else
    {
      LODWORD(v12) = 0;
    }
    if (_UIDeviceNativeUserInterfaceIdiom() == 1)
    {
      uint64_t v15 = [v9 isItemEnabled:0] ? 6 : 1;
      [v9 setItem:v15 enabled:0];
      if (MGGetBoolAnswer())
      {
        if (([v9 isItemEnabled:4] & 1) == 0 && (objc_msgSend(v9, "isItemEnabled:", 3) & 1) == 0)
        {
          [v9 setItem:4 enabled:1];
          *(_DWORD *)([v9 rawData] + 440) = -1;
        }
      }
    }
    uint64_t v16 = 0;
    itemIsEnabled = self->_itemIsEnabled;
    BOOL v31 = self->_itemIsEnabled[0];
    BOOL v18 = self->_itemIsEnabled[39];
    do
    {
      itemIsEnabled[v16] = [v9 isItemEnabled:v16];
      ++v16;
    }
    while (v16 != 52);
    uint64_t v19 = 0;
    if ((a4 & 4) != 0) {
      uint64_t v20 = a4 & 0xFFFFFFFE;
    }
    else {
      uint64_t v20 = a4;
    }
    layoutManagers = self->_layoutManagers;
    do
      LODWORD(v12) = v12 | [(UIStatusBarLayoutManager *)layoutManagers[v19++] prepareEnabledItems:self->_itemIsEnabled withData:v9 actions:v20];
    while (v19 != 3);
    double v22 = 0.0;
    if (v5 & (a4 >> 2)) {
      double v22 = 0.5;
    }
    unsigned int v23 = (v20 >> 6) & 1;
    if (v22 != 0.0) {
      unsigned int v23 = 0;
    }
    if (v23 & v5) {
      double v24 = 0.25;
    }
    else {
      double v24 = v22;
    }
    if (v24 > 0.0)
    {
      +[UIStatusBarLockItemView lockSlideAnimationDuration];
      v26 = 0;
      if (!v18 || v24 >= v25)
      {
LABEL_37:
        for (uint64_t i = 0; i != 3; ++i)
          LODWORD(v12) = v12 | [(UIStatusBarLayoutManager *)layoutManagers[i] updateItemsWithData:v9 actions:v20 animated:v5];
        if (v12)
        {
          if (v5 && v24 > 0.0)
          {
            [v26 setUseCustomFadeAnimation:1];
            dispatch_time_t v28 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 3221225472;
            block[2] = __64__UIStatusBarForegroundView__setStatusBarData_actions_animated___block_invoke;
            block[3] = &unk_1E52D9F98;
            id v34 = v26;
            v35 = self;
            dispatch_after(v28, MEMORY[0x1E4F14428], block);
            v32[0] = MEMORY[0x1E4F143A8];
            v32[1] = 3221225472;
            v32[2] = __64__UIStatusBarForegroundView__setStatusBarData_actions_animated___block_invoke_2;
            v32[3] = &unk_1E52D9CD0;
            v32[4] = self;
            *(double *)&v32[5] = v24;
            +[UIView animateWithDuration:32 delay:v32 options:0 animations:v24 completion:0.0];

LABEL_45:
            goto LABEL_46;
          }
          [(UIStatusBarForegroundView *)self _reflowItemViewsWithDuration:1 preserveHistory:v24];
        }
        [(UIStatusBarForegroundView *)self _cleanUpAfterDataChange];
        goto LABEL_45;
      }
      if (self->_itemIsEnabled[39] && v31 != *itemIsEnabled)
      {
        +[UIStatusBarLockItemView lockSlideAnimationDuration];
        double v24 = v29;
        v30 = [(UIStatusBarLayoutManager *)self->_layoutManagers[2] itemViewOfType:39];
        v26 = [(UIStatusBarLayoutManager *)self->_layoutManagers[2] itemViewOfType:0];
        [v30 setViewToAnimateAlongside:v26];
        [v30 setAlongsideViewIsBecomingVisible:*itemIsEnabled];

        goto LABEL_37;
      }
    }
    v26 = 0;
    goto LABEL_37;
  }
LABEL_46:
}

uint64_t __64__UIStatusBarForegroundView__setStatusBarData_actions_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUseCustomFadeAnimation:0];
  v2 = *(void **)(a1 + 40);
  return [v2 _cleanUpAfterDataChange];
}

uint64_t __64__UIStatusBarForegroundView__setStatusBarData_actions_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reflowItemViewsWithDuration:1 preserveHistory:*(double *)(a1 + 40)];
}

- (void)setStatusBarData:(id)a3 actions:(int)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &setStatusBarData_actions_animated____s_category);
  if (*(unsigned char *)CategoryCachedImpl)
  {
    BOOL v31 = *(NSObject **)(CategoryCachedImpl + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v9;
      _os_log_impl(&dword_1853B0000, v31, OS_LOG_TYPE_ERROR, "Received data: %@", buf, 0xCu);
    }
  }
  if ([(UIStatusBarForegroundView *)self ignoringData])
  {
    objc_storeStrong((id *)&self->_pendedData, a3);
    self->_pendedActions |= a4;
    goto LABEL_28;
  }
  if (self->_actionAnimationStack)
  {
    if ((a4 & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  actionAnimationStack = self->_actionAnimationStack;
  self->_actionAnimationStack = v27;

  if ((a4 & 0x80) != 0)
  {
LABEL_6:
    a4 &= 0xFFFFFF3F;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke;
    aBlock[3] = &unk_1E52D9F70;
    aBlock[4] = self;
    int v11 = _Block_copy(aBlock);
    uint64_t v12 = self->_actionAnimationStack;
    v13 = _Block_copy(v11);
    [(NSMutableArray *)v12 addObject:v13];
  }
LABEL_7:
  int v14 = [v9 isItemEnabled:2];
  uint64_t v15 = 0;
  uint64_t v16 = a4 & 0xFFFFFFCF;
  if ((a4 & 0x10) != 0)
  {
    int v17 = v14;
    if (self->_itemIsEnabled[2] != v14 && v5)
    {
      if (!self->_actionAnimationStack)
      {
        uint64_t v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v20 = self->_actionAnimationStack;
        self->_actionAnimationStack = v19;
      }
      if ((v17 & 1) == 0)
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_3;
        v46[3] = &unk_1E52DC3D0;
        v46[4] = self;
        id v47 = v9;
        BOOL v48 = v5;
        objc_super v21 = _Block_copy(v46);
        double v22 = self->_actionAnimationStack;
        unsigned int v23 = _Block_copy(v21);
        [(NSMutableArray *)v22 addObject:v23];
      }
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_4;
      v44[3] = &unk_1E52D9FC0;
      v44[4] = self;
      BOOL v45 = v5;
      double v24 = _Block_copy(v44);
      double v25 = self->_actionAnimationStack;
      v26 = _Block_copy(v24);
      [(NSMutableArray *)v25 addObject:v26];

      if (v17)
      {
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_6;
        v40[3] = &unk_1E52FA4E8;
        v40[4] = self;
        id v41 = v9;
        int v42 = v16;
        BOOL v43 = v5;
        uint64_t v15 = (void (**)(void))_Block_copy(v40);
      }
      else
      {
        double v29 = (void *)[v9 copy];
        [v29 setItem:2 enabled:1];
        uint64_t v32 = MEMORY[0x1E4F143A8];
        uint64_t v33 = 3221225472;
        id v34 = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_7;
        v35 = &unk_1E52FA4E8;
        v36 = self;
        id v37 = v29;
        int v38 = v16;
        BOOL v39 = v5;
        id v30 = v29;
        uint64_t v15 = (void (**)(void))_Block_copy(&v32);
      }
    }
  }
  if ([(NSMutableArray *)self->_actionAnimationStack count])
  {
    [(UIStatusBarForegroundView *)self startIgnoringData];
    if (v15) {
      v15[2](v15);
    }
    [(UIStatusBarForegroundView *)self stopIgnoringData:v5];
  }
  else
  {
    [(UIStatusBarForegroundView *)self _setStatusBarData:v9 actions:v16 animated:v5];
  }

LABEL_28:
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) startIgnoringData];
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_2;
  v4[3] = &unk_1E52D9F70;
  v4[4] = v2;
  return [v2 _animateUnlockCompletionBlock:v4];
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopIgnoringData:1];
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStatusBarData:*(void *)(a1 + 40) actions:0 animated:*(unsigned __int8 *)(a1 + 48)];
}

void __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) startIgnoringData];
  v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:0x1ED1659C0 object:*(void *)(a1 + 32) userInfo:0];

  dispatch_time_t v3 = dispatch_time(0, 500000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_5;
  v4[3] = &unk_1E52D9FC0;
  v4[4] = *(void *)(a1 + 32);
  char v5 = *(unsigned char *)(a1 + 40);
  dispatch_after(v3, MEMORY[0x1E4F14428], v4);
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopIgnoringData:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStatusBarData:*(void *)(a1 + 40) actions:*(_DWORD *)(a1 + 48) | 0x20u animated:*(unsigned __int8 *)(a1 + 52)];
}

uint64_t __63__UIStatusBarForegroundView_setStatusBarData_actions_animated___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setStatusBarData:*(void *)(a1 + 40) actions:*(unsigned int *)(a1 + 48) animated:*(unsigned __int8 *)(a1 + 52)];
}

- (void)reflowItemViewsCrossfadingCenter:(id)a3 duration:(double)a4
{
  id v6 = a3;
  uint64_t v7 = 0;
  itemIsEnabled = self->_itemIsEnabled;
  BOOL v9 = self->_itemIsEnabled[0];
  BOOL v10 = self->_itemIsEnabled[39];
  do
  {
    itemIsEnabled[v7] = [v6 isItemEnabled:v7];
    ++v7;
  }
  while (v7 != 52);
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __71__UIStatusBarForegroundView_reflowItemViewsCrossfadingCenter_duration___block_invoke;
  v16[3] = &unk_1E52E1B98;
  BOOL v18 = &v19;
  v16[4] = self;
  id v11 = v6;
  id v17 = v11;
  +[UIView performWithoutAnimation:v16];
  if (a4 > 0.0 && v10 && self->_itemIsEnabled[39] && v9 != *itemIsEnabled)
  {
    +[UIStatusBarLockItemView lockSlideAnimationDuration];
    if (v12 > a4)
    {
      +[UIStatusBarLockItemView lockSlideAnimationDuration];
      a4 = v13;
    }
    int v14 = [(UIStatusBarLayoutManager *)self->_layoutManagers[2] itemViewOfType:39];
    uint64_t v15 = [(UIStatusBarLayoutManager *)self->_layoutManagers[2] itemViewOfType:0];
    [v14 setViewToAnimateAlongside:v15];
    [v14 setAlongsideViewIsBecomingVisible:*itemIsEnabled];
  }
  if (*((unsigned char *)v20 + 24)) {
    [(UIStatusBarForegroundView *)self _reflowItemViewsCrossfadingCenterWithDuration:v9 timeWasEnabled:a4];
  }

  _Block_object_dispose(&v19, 8);
}

uint64_t __71__UIStatusBarForegroundView_reflowItemViewsCrossfadingCenter_duration___block_invoke(void *a1)
{
  for (uint64_t i = 0; i != 24; i += 8)
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) |= [*(id *)(a1[4] + 464 + i) prepareEnabledItems:a1[4] + 409 withData:a1[5] actions:0];
  for (uint64_t j = 0; j != 24; j += 8)
  {
    uint64_t result = [*(id *)(a1[4] + 464 + j) updateItemsWithData:a1[5] actions:0 animated:0];
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) |= result;
  }
  return result;
}

- (void)_reflowItemViewsCrossfadingCenterWithDuration:(double)a3 timeWasEnabled:(BOOL)a4
{
  [(UIStatusBarForegroundView *)self startIgnoringData];
  uint64_t v8 = 0;
  BOOL v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v6 = [(UIStatusBarForegroundView *)self _computeVisibleItemsPreservingHistory:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke;
  v7[3] = &unk_1E5307F08;
  v7[4] = self;
  v7[5] = &v8;
  *(double *)&v7[6] = a3;
  [v6 enumerateKeysAndObjectsUsingBlock:v7];
  if (!*((unsigned char *)v9 + 24)) {
    [(UIStatusBarForegroundView *)self _cleanUpAfterDataChange];
  }

  _Block_object_dispose(&v8, 8);
}

void __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  int v6 = [a2 intValue];
  if (v6 == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    id v7 = *(id *)(*(void *)(a1 + 32) + 480);
    uint64_t v8 = [v7 itemViewOfType:0];
    [v8 setUseCustomFadeAnimation:1];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_2;
    block[3] = &unk_1E52D9F98;
    uint64_t v10 = *(void *)(a1 + 32);
    id v22 = v8;
    uint64_t v23 = v10;
    id v11 = v8;
    dispatch_after(v9, MEMORY[0x1E4F14428], block);
    double v12 = *(double *)(a1 + 48);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_3;
    v17[3] = &unk_1E52DA070;
    id v18 = v7;
    id v19 = v5;
    uint64_t v20 = *(void *)(a1 + 48);
    id v13 = v7;
    +[UIView animateWithDuration:32 delay:v17 options:0 animations:v12 completion:0.0];
  }
  else
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_4;
    v14[3] = &unk_1E52DDF08;
    v14[4] = *(void *)(a1 + 32);
    int v16 = v6;
    id v15 = v5;
    +[UIView performWithoutAnimation:v14];
  }
}

uint64_t __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setUseCustomFadeAnimation:0];
  v2 = *(void **)(a1 + 40);
  return [v2 _cleanUpAfterDataChange];
}

uint64_t __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) reflowWithVisibleItems:*(void *)(a1 + 40) duration:*(double *)(a1 + 48)];
}

uint64_t __90__UIStatusBarForegroundView__reflowItemViewsCrossfadingCenterWithDuration_timeWasEnabled___block_invoke_4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 464 + 8 * *(int *)(a1 + 48)) reflowWithVisibleItems:*(void *)(a1 + 40) duration:0.0];
}

- (void)reflowItemViews:(BOOL)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__UIStatusBarForegroundView_reflowItemViews___block_invoke;
  v5[3] = &__block_descriptor_40_e24_v24__0___v___8___v__B_16l;
  v5[4] = 0;
  v3[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__UIStatusBarForegroundView_reflowItemViews___block_invoke_2;
  v4[3] = &unk_1E52D9CD0;
  v4[4] = self;
  void v4[5] = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__UIStatusBarForegroundView_reflowItemViews___block_invoke_3;
  v3[3] = &unk_1E52DC3A0;
  +[UIView conditionallyAnimate:0 withAnimation:v5 layout:v4 completion:v3];
}

uint64_t __45__UIStatusBarForegroundView_reflowItemViews___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:4 delay:a2 options:a3 animations:*(double *)(a1 + 32) completion:0.0];
}

uint64_t __45__UIStatusBarForegroundView_reflowItemViews___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reflowItemViewsWithDuration:1 preserveHistory:*(double *)(a1 + 40)];
}

uint64_t __45__UIStatusBarForegroundView_reflowItemViews___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpAfterSimpleReflow];
}

- (void)reflowItemViewsForgettingEitherSideItemHistory
{
  [(UIStatusBarForegroundView *)self _reflowItemViewsWithDuration:0 preserveHistory:0.0];
  [(UIStatusBarForegroundView *)self _cleanUpAfterSimpleReflow];
}

- (void)startIgnoringData
{
}

- (void)stopIgnoringData:(BOOL)a3
{
  BOOL v3 = a3;
  int ignoreDataLevel = self->_ignoreDataLevel;
  if (ignoreDataLevel <= 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"UIStatusBarForegroundView.m" lineNumber:446 description:@"Stopped ignoring data more times than started"];

    int ignoreDataLevel = self->_ignoreDataLevel;
  }
  int v6 = ignoreDataLevel - 1;
  self->_int ignoreDataLevel = v6;
  if (!v6)
  {
    if ([(NSMutableArray *)self->_actionAnimationStack count])
    {
      [(UIStatusBarForegroundView *)self startIgnoringData];
      id v7 = [(NSMutableArray *)self->_actionAnimationStack lastObject];
      v7[2]();

      [(NSMutableArray *)self->_actionAnimationStack removeLastObject];
      [(UIStatusBarForegroundView *)self stopIgnoringData:v3];
    }
    else
    {
      pendedData = self->_pendedData;
      if (pendedData)
      {
        uint64_t pendedActions = self->_pendedActions;
        self->_pendedData = 0;
        double v12 = pendedData;

        self->_uint64_t pendedActions = 0;
        [(UIStatusBarForegroundView *)self setStatusBarData:v12 actions:pendedActions animated:v3];
      }
    }
  }
}

- (BOOL)ignoringData
{
  return self->_ignoreDataLevel > 0;
}

- (void)_cleanUpAfterSimpleReflow
{
  uint64_t v2 = 0;
  layoutManagers = self->_layoutManagers;
  do
    [(UIStatusBarLayoutManager *)layoutManagers[v2++] positionInvisibleItems];
  while (v2 != 3);
}

- (void)_cleanUpAfterDataChange
{
  uint64_t v3 = 0;
  layoutManagers = self->_layoutManagers;
  itemIsEnabled = self->_itemIsEnabled;
  do
  {
    [(UIStatusBarLayoutManager *)layoutManagers[v3] removeDisabledItems:itemIsEnabled];
    [(UIStatusBarLayoutManager *)layoutManagers[v3] positionInvisibleItems];
    [(UIStatusBarLayoutManager *)layoutManagers[v3++] makeVisibleItemsPerformPendedActions];
  }
  while (v3 != 3);
  [(UIStatusBarForegroundView *)self stopIgnoringData:1];
}

- (void)_reflowItemViewsWithDuration:(double)a3 preserveHistory:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(UIView *)self window];

  if (v7)
  {
    uint64_t v8 = [(UIStatusBarForegroundView *)self _computeVisibleItemsPreservingHistory:v4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __74__UIStatusBarForegroundView__reflowItemViewsWithDuration_preserveHistory___block_invoke;
    v9[3] = &unk_1E52FAC00;
    v9[4] = self;
    *(double *)&v9[5] = a3;
    [v8 enumerateKeysAndObjectsUsingBlock:v9];
  }
}

void __74__UIStatusBarForegroundView__reflowItemViewsWithDuration_preserveHistory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464 + 8 * (int)objc_msgSend(a2, "intValue")), "reflowWithVisibleItems:duration:", v5, *(double *)(a1 + 40));
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarForegroundView;
  [(UIView *)&v3 didMoveToWindow];
  [(UIStatusBarForegroundView *)self reflowItemViews:0];
}

- (id)_computeVisibleItemsPreservingHistory:(BOOL)a3
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x18C108260](self, a2);
  uint64_t v3 = 0;
  id v189 = 0;
  id v190 = 0;
  uint64_t v191 = 0;
  do
  {
    BOOL v4 = [MEMORY[0x1E4F1CA48] array];
    id v5 = *(&v189 + v3);
    *(&v189 + v3) = v4;

    v180[v3++] = 0;
  }
  while (v3 != 3);
  uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
  for (uint64_t i = 0; i != 52; ++i)
  {
    if (self->_itemIsEnabled[i])
    {
      uint64_t v8 = +[UIStatusBarItem itemWithType:i idiom:[(UIStatusBarForegroundView *)self idiom]];
      if (![v8 appearsOnLeft]
        || (v9 = [v8 appearsOnRight], uint64_t v10 = (void *)v6, (v9 & 1) == 0))
      {
        uint64_t v11 = 0;
        while (![v8 appearsInRegion:v11])
        {
          if (++v11 == 3) {
            goto LABEL_13;
          }
        }
        uint64_t v10 = *(&v189 + v11);
      }
      [v10 addObject:v8];
LABEL_13:
    }
  }
  uint64_t v12 = 0;
  id v13 = 0;
  v153 = (void *)v6;
  do
  {
    int v14 = v13;
    long long v178 = 0u;
    long long v179 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    obuint64_t j = *(&v189 + v12);
    uint64_t v15 = [obj countByEnumeratingWithState:&v176 objects:v188 count:16];
    uint64_t v158 = v12;
    if (!v15)
    {
      id v18 = 0;
      id v17 = 0;
LABEL_36:

      id v13 = v14;
LABEL_37:
      if ([v17 count])
      {
        id obja = v13;
        dispatch_time_t v28 = *(&v189 + v12);
        double v29 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v28, "count"));
        long long v170 = 0u;
        long long v171 = 0u;
        long long v172 = 0u;
        long long v173 = 0u;
        id v30 = v28;
        uint64_t v31 = [v30 countByEnumeratingWithState:&v170 objects:v187 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v171;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v171 != v33) {
                objc_enumerationMutation(v30);
              }
              v35 = *(void **)(*((void *)&v170 + 1) + 8 * j);
              v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v35, "type"));
              int v37 = [v17 containsObject:v36];

              if (v37) {
                [v29 addObject:v35];
              }
            }
            uint64_t v32 = [v30 countByEnumeratingWithState:&v170 objects:v187 count:16];
          }
          while (v32);
        }

        uint64_t v12 = v158;
        *(&v189 + v158) = v29;

        uint64_t v23 = 0;
        id v13 = obja;
      }
      else
      {
        uint64_t v23 = 0;
      }
      goto LABEL_52;
    }
    uint64_t v16 = v15;
    id v17 = 0;
    id v18 = 0;
    uint64_t v19 = *(void *)v177;
LABEL_18:
    uint64_t v20 = 0;
    uint64_t v21 = v17;
    id v22 = v18;
    while (1)
    {
      if (*(void *)v177 != v19) {
        objc_enumerationMutation(obj);
      }
      uint64_t v23 = *(void **)(*((void *)&v176 + 1) + 8 * v20);
      double v24 = objc_opt_class();
      uint64_t v25 = [v23 type];
      id v174 = v21;
      id v175 = v22;
      LODWORD(v24) = [v24 isItemWithTypeExclusive:v25 outBlacklistItems:&v175 outWhitelistItems:&v174];
      id v18 = v175;

      id v17 = v174;
      if (v24) {
        break;
      }
      uint64_t v12 = v158;
      if (v158 == 2 && [v23 type] == 39)
      {
        v26 = [(UIStatusBarLayoutManager *)self->_layoutManagers[2] itemViewOfType:39];
        if ([v26 isExclusive])
        {
          id v40 = v23;

          goto LABEL_49;
        }
      }
      else
      {
        if ([v17 count]) {
          goto LABEL_36;
        }
        if (![v18 count]) {
          goto LABEL_32;
        }
        v27 = v14;
        if (!v14) {
          v27 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];
        }
        v26 = [v18 allObjects];
        int v14 = v27;
        [v27 addObjectsFromArray:v26];
      }

LABEL_32:
      ++v20;
      uint64_t v21 = v17;
      id v22 = v18;
      if (v16 == v20)
      {
        uint64_t v16 = [obj countByEnumeratingWithState:&v176 objects:v188 count:16];
        uint64_t v12 = v158;
        if (v16) {
          goto LABEL_18;
        }
        goto LABEL_36;
      }
    }
    id v38 = v23;
    uint64_t v12 = v158;
LABEL_49:

    id v13 = v14;
    if (!v23) {
      goto LABEL_37;
    }
    BOOL v39 = *(&v189 + v12);
    [v39 removeAllObjects];
    [v39 addObject:v23];
    v180[v12] = 1;
LABEL_52:

    ++v12;
  }
  while (v12 != 3);
  if ([v13 count])
  {
    unint64_t v41 = 0;
    do
    {
      unint64_t v159 = v41;
      int v42 = *(&v189 + v41);
      BOOL v43 = (void *)[v42 mutableCopy];
      long long v166 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      long long v169 = 0u;
      id v44 = v42;
      uint64_t v45 = [v44 countByEnumeratingWithState:&v166 objects:v186 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v167;
        BOOL v48 = 1;
        while (2)
        {
          for (uint64_t k = 0; k != v46; ++k)
          {
            if (*(void *)v167 != v47) {
              objc_enumerationMutation(v44);
            }
            if (!v48)
            {
              BOOL v48 = 0;
              goto LABEL_69;
            }
            v50 = *(void **)(*((void *)&v166 + 1) + 8 * k);
            id v51 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v50, "type"));
            uint64_t v52 = v13;
            int v53 = [v13 containsObject:v51];

            if (v53)
            {
              [v43 removeObject:v50];
              v54 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v50, "type"));
              [v52 removeObject:v54];

              BOOL v48 = [v52 count] != 0;
            }
            else
            {
              BOOL v48 = 1;
            }
            id v13 = v52;
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v166 objects:v186 count:16];
          if (v46) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v48 = 1;
      }
LABEL_69:

      v55 = *(&v189 + v159);
      *(&v189 + v159) = v43;

      if (v159 > 1) {
        break;
      }
      unint64_t v41 = v159 + 1;
    }
    while (v48);
  }
  layoutManagers = self->_layoutManagers;
  [(UIStatusBarLayoutManager *)self->_layoutManagers[2] rectForItems:v191];
  uint64_t v58 = v57;
  uint64_t v60 = v59;
  uint64_t v62 = v61;
  uint64_t v64 = v63;
  BOOL usesVerticalLayout = self->_usesVerticalLayout;
  [(UIView *)self bounds];
  if (usesVerticalLayout) {
    double v68 = v67;
  }
  else {
    double v68 = v66;
  }
  uint64_t v69 = v58;
  uint64_t v70 = v60;
  uint64_t v71 = v62;
  uint64_t v72 = v64;
  if (self->_usesVerticalLayout) {
    double MinY = CGRectGetMinY(*(CGRect *)&v69);
  }
  else {
    double MinY = CGRectGetMinX(*(CGRect *)&v69);
  }
  double v74 = MinY;
  unint64_t v75 = 0x1E4F28000uLL;
  id objb = v13;
  uint64_t v76 = v58;
  uint64_t v77 = v60;
  uint64_t v78 = v62;
  uint64_t v79 = v64;
  if (self->_usesVerticalLayout) {
    double MaxY = CGRectGetMaxY(*(CGRect *)&v76);
  }
  else {
    double MaxY = CGRectGetMaxX(*(CGRect *)&v76);
  }
  double v81 = MaxY;
  double v185 = 0.0;
  v82 = [(UIStatusBarForegroundView *)self foregroundStyle];
  [v82 leftEdgePadding];
  double v84 = v83;

  v85 = [(UIStatusBarForegroundView *)self foregroundStyle];
  [v85 rightEdgePadding];
  double v87 = v86;

  v88 = [(UIStatusBarForegroundView *)self foregroundStyle];
  [v88 middlePadding];
  double v90 = v89;

  double v183 = v74 - v84 - v90 + 1.0;
  double v184 = v68 - v81 - v87 - v90 + 1.0;
  if (self->_usesVerticalLayout)
  {
    [(UIStatusBarLayoutManager *)*layoutManagers sizeNeededForItems:v189];
    double v92 = v91;
    [(UIStatusBarLayoutManager *)self->_layoutManagers[1] sizeNeededForItems:v190];
    double v185 = v68 - v92 - v93 - (v90 + v90);
    double v94 = (v92 + v68 - v93) * 0.5;
    v95 = self->_layoutManagers[2];
    *(float *)&double v94 = v94;
    v96 = [NSNumber numberWithFloat:v94];
    [(UIStatusBarLayoutManager *)v95 setAssignedStartPosition:v96];
  }
  uint64_t v97 = 0;
  while (2)
  {
    if (v97 == 2)
    {
      if (!self->_usesVerticalLayout) {
        break;
      }
LABEL_87:
      v98 = *(&v189 + v97);
      [(UIStatusBarLayoutManager *)layoutManagers[v97] clearOverlapFromItems:v98];
      [(UIStatusBarLayoutManager *)layoutManagers[v97] sizeNeededForItems:v98];
      double v100 = *(&v183 + v97) - v99;
      *(&v183 + v97) = v100;
      if (v100 < 0.0)
      {
        [(UIStatusBarLayoutManager *)layoutManagers[v97] distributeOverlap:v98 amongItems:-v100];
        *(&v183 + v97) = v101 + *(&v183 + v97);
      }
      [v98 sortUsingSelector:sel_comparePriority_];
      while (1)
      {
        double v102 = *(&v183 + v97);
        if (v102 >= 0.0) {
          break;
        }
        if (![v98 count])
        {
          double v102 = *(&v183 + v97);
          break;
        }
        v103 = [v98 objectAtIndex:0];
        [(UIStatusBarLayoutManager *)layoutManagers[v97] sizeNeededForItem:v103];
        *(&v183 + v97) = v104 + *(&v183 + v97);
        [v98 removeObjectAtIndex:0];
      }
      if (v102 > 0.0)
      {
        -[UIStatusBarLayoutManager removeOverlap:fromItems:](layoutManagers[v97], "removeOverlap:fromItems:", v98);
        *(&v183 + v97) = *(&v183 + v97) - v105;
      }
    }
    else if (!self->_usesVerticalLayout)
    {
      goto LABEL_87;
    }
    if (++v97 != 3) {
      continue;
    }
    break;
  }
  v106 = [MEMORY[0x1E4F1CA48] array];
  v107 = v106;
  if (a3)
  {
    long long v164 = 0u;
    long long v165 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    id v108 = v153;
    uint64_t v109 = [v108 countByEnumeratingWithState:&v162 objects:v182 count:16];
    if (!v109) {
      goto LABEL_113;
    }
    uint64_t v110 = v109;
    uint64_t v111 = *(void *)v163;
    int v112 = v180[0];
    int v113 = v180[1];
    while (1)
    {
      for (uint64_t m = 0; m != v110; ++m)
      {
        if (*(void *)v163 != v111) {
          objc_enumerationMutation(v108);
        }
        uint64_t v115 = *(void *)(*((void *)&v162 + 1) + 8 * m);
        if (!v112
          && [(UIStatusBarLayoutManager *)*layoutManagers itemIsVisible:*(void *)(*((void *)&v162 + 1) + 8 * m)])
        {
          id v116 = v189;
          v117 = *layoutManagers;
          v118 = &v183;
          v119 = self;
          goto LABEL_109;
        }
        if (!v113 && [(UIStatusBarLayoutManager *)self->_layoutManagers[1] itemIsVisible:v115])
        {
          id v116 = v190;
          v117 = self->_layoutManagers[1];
          v119 = self;
          v118 = &v184;
LABEL_109:
          if ([(UIStatusBarForegroundView *)v119 _tryToPlaceItem:v115 inItemArray:v116 layoutManager:v117 roomRemaining:v118 allowSwap:0 swappedItem:0])
          {
            continue;
          }
        }
        [v107 addObject:v115];
      }
      uint64_t v110 = [v108 countByEnumeratingWithState:&v162 objects:v182 count:16];
      if (!v110)
      {
LABEL_113:

        unint64_t v75 = 0x1E4F28000;
        goto LABEL_115;
      }
    }
  }
  [v106 addObjectsFromArray:v153];
LABEL_115:
  [v107 sortUsingSelector:sel_comparePriority_];
  if ([v107 count])
  {
    while (2)
    {
      v120 = [v107 lastObject];
      [v107 removeLastObject];
      int64_t v121 = +[UIStatusBar _deviceUserInterfaceLayoutDirection];
      char v122 = 0;
      BOOL v123 = v121 != 0;
      BOOL v124 = v121 == 0;
      char v125 = 1;
      do
      {
        while (1)
        {
          char v126 = v125;
          if (!v180[v123]) {
            break;
          }
          char v125 = 0;
          char v122 = 1;
          BOOL v123 = v124;
          if ((v126 & 1) == 0) {
            goto LABEL_122;
          }
        }
        BOOL v127 = [(UIStatusBarForegroundView *)self _tryToPlaceItem:v120 inItemArray:*(&v189 + v123) layoutManager:layoutManagers[v123] roomRemaining:&v183 + v123 allowSwap:0 swappedItem:0];
        char v125 = 0;
        char v128 = v122 | v127;
        char v122 = 1;
        BOOL v123 = v124;
      }
      while ((v128 & 1) == 0);
      if (v127) {
        goto LABEL_133;
      }
LABEL_122:
      id v129 = v189;
      if (![v189 count] || (id v130 = v190, !objc_msgSend(v190, "count")))
      {

        v145 = 0;
        goto LABEL_138;
      }
      v131 = [v129 objectAtIndex:0];
      unsigned int v132 = [v131 priority];
      v133 = [v130 objectAtIndex:0];
      unsigned int v134 = [v133 priority];
      BOOL v160 = v132 < v134;
      BOOL v135 = v132 >= v134;

      char v136 = 0;
      uint64_t v137 = 0;
      v138 = 0;
      v181[0] = v135;
      v181[1] = v160;
      do
      {
        uint64_t v139 = v181[v137];
        if (v180[v139])
        {
          BOOL v140 = 0;
        }
        else
        {
          uint64_t v141 = (uint64_t)*(&v189 + v139);
          v142 = layoutManagers[v139];
          id v161 = v138;
          BOOL v140 = [(UIStatusBarForegroundView *)self _tryToPlaceItem:v120 inItemArray:v141 layoutManager:v142 roomRemaining:&v183 + v139 allowSwap:1 swappedItem:&v161];
          id v143 = v161;

          v138 = v143;
        }
        char v144 = v136 | v140;
        char v136 = 1;
        uint64_t v137 = 1;
      }
      while ((v144 & 1) == 0);
      if (v138 && [v153 containsObject:v138])
      {
        [v107 addObject:v138];
        [v107 sortUsingSelector:sel_comparePriority_];
      }

      unint64_t v75 = 0x1E4F28000uLL;
LABEL_133:

      if ([v107 count]) {
        continue;
      }
      break;
    }
  }
  v145 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
  for (uint64_t n = 0; n != 3; ++n)
  {
    uint64_t v147 = (uint64_t)*(&v189 + n);
    v148 = [*(id *)(v75 + 3792) numberWithInt:n];
    [v145 setObject:v147 forKey:v148];
  }
LABEL_138:

  for (iuint64_t i = 16; ii != -8; ii -= 8)
  return v145;
}

- (BOOL)_tryToPlaceItem:(id)a3 inItemArray:(id)a4 layoutManager:(id)a5 roomRemaining:(double *)a6 allowSwap:(BOOL)a7 swappedItem:(id *)a8
{
  BOOL v9 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  [v15 sizeNeededForItem:v13];
  double v17 = v16;
  if (v16 > *a6 && v9)
  {
    uint64_t v19 = [v14 objectAtIndex:0];
    [v15 sizeNeededForItem:v19];
    double v21 = v20;
    unsigned int v22 = [v13 priority];
    if (v22 <= [v19 priority] || (double v23 = v21 + *a6, v17 > v23))
    {

      goto LABEL_11;
    }
    *a6 = v23;
    [v14 removeObjectAtIndex:0];
    if (a8) {
      *a8 = v19;
    }

LABEL_15:
    [v14 addObject:v13];
    [v14 sortUsingSelector:sel_comparePriority_];
    *a6 = *a6 - v17;
    BOOL v24 = 1;
    goto LABEL_16;
  }
  if (v16 <= *a6) {
    goto LABEL_15;
  }
LABEL_11:
  BOOL v24 = 0;
LABEL_16:

  return v24;
}

- (BOOL)isShowingBreadcrumb
{
  return self->_itemIsEnabled[50];
}

- (double)leftEdgePadding
{
  uint64_t v2 = [(UIStatusBarForegroundView *)self foregroundStyle];
  [v2 leftEdgePadding];
  double v4 = v3;

  return v4;
}

- (double)rightEdgePadding
{
  uint64_t v2 = [(UIStatusBarForegroundView *)self foregroundStyle];
  [v2 rightEdgePadding];
  double v4 = v3;

  return v4;
}

- (void)setPersistentAnimationsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = 0;
  layoutManagers = self->_layoutManagers;
  do
    [(UIStatusBarLayoutManager *)layoutManagers[v4++] setPersistentAnimationsEnabled:v3];
  while (v4 != 3);
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL usesVerticalLayout = self->_usesVerticalLayout;
  [(UIView *)self frame];
  if (usesVerticalLayout) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  v13.receiver = self;
  v13.super_class = (Class)UIStatusBarForegroundView;
  -[UIView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (self->_usesVerticalLayout) {
    double v12 = height;
  }
  else {
    double v12 = width;
  }
  if (v11 != v12) {
    [(UIStatusBarForegroundView *)self reflowItemViews:0];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL usesVerticalLayout = self->_usesVerticalLayout;
  [(UIView *)self bounds];
  if (usesVerticalLayout) {
    double v11 = v10;
  }
  else {
    double v11 = v9;
  }
  v13.receiver = self;
  v13.super_class = (Class)UIStatusBarForegroundView;
  -[UIView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (self->_usesVerticalLayout) {
    double v12 = height;
  }
  else {
    double v12 = width;
  }
  if (v11 != v12) {
    [(UIStatusBarForegroundView *)self reflowItemViews:0];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)UIStatusBarForegroundView;
  if (-[UIView pointInside:withEvent:](&v20, sel_pointInside_withEvent_, v7, x, y))
  {
    BOOL v8 = 1;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v9 = [(UIView *)self subviews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          objc_msgSend(v14, "convertPoint:fromView:", self, x, y);
          if (objc_msgSend(v14, "pointInside:withEvent:", v7))
          {
            BOOL v8 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 0;
LABEL_13:
  }
  return v8;
}

- (void)_animateUnlockCompletionBlock:(id)a3
{
  blocuint64_t k = a3;
  uint64_t v4 = [(UIStatusBarLayoutManager *)self->_layoutManagers[2] itemViewOfType:39];
  if (v4)
  {
    id v5 = [(UIStatusBarLayoutManager *)self->_layoutManagers[2] itemViewOfType:0];
    uint64_t v6 = [v5 snapshotViewAfterScreenUpdates:0];
    [v5 frame];
    objc_msgSend(v6, "setFrame:");
    [v4 animateUnlockForegroundView:self timeItemSnapshot:v6 completionBlock:block];
  }
  else if (block)
  {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)animateUnlock
{
  BOOL v3 = [(UIStatusBarLayoutManager *)self->_layoutManagers[2] itemViewOfType:39];
  if (v3)
  {
    if ([(UIStatusBarForegroundView *)self ignoringData])
    {
      self->_pendedActions |= 0x80u;
    }
    else
    {
      [(UIStatusBarForegroundView *)self startIgnoringData];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __42__UIStatusBarForegroundView_animateUnlock__block_invoke;
      v4[3] = &unk_1E52D9F70;
      v4[4] = self;
      [(UIStatusBarForegroundView *)self _animateUnlockCompletionBlock:v4];
    }
  }
}

uint64_t __42__UIStatusBarForegroundView_animateUnlock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopIgnoringData:1];
}

- (void)jiggleLockIcon
{
  BOOL v3 = [(UIStatusBarLayoutManager *)self->_layoutManagers[2] itemViewOfType:39];
  if (v3 && ![(UIStatusBarForegroundView *)self ignoringData])
  {
    [(UIStatusBarForegroundView *)self startIgnoringData];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __43__UIStatusBarForegroundView_jiggleLockIcon__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    [v3 jiggleCompletionBlock:v4];
  }
}

uint64_t __43__UIStatusBarForegroundView_jiggleLockIcon__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopIgnoringData:1];
}

- (CGRect)frameForItemOfType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = 0;
  layoutManagers = self->_layoutManagers;
  while (1)
  {
    id v7 = [(UIStatusBarLayoutManager *)layoutManagers[v5] itemViewOfType:v3];
    BOOL v8 = v7;
    if (v7) {
      break;
    }
    if (++v5 == 3)
    {
      double v9 = *MEMORY[0x1E4F1DB28];
      double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      goto LABEL_6;
    }
  }
  [v7 bounds];
  -[UIView convertRect:fromView:](self, "convertRect:fromView:", v8);
  double v9 = v13;
  double v10 = v14;
  double v11 = v15;
  double v12 = v16;
LABEL_6:

  double v17 = v9;
  double v18 = v10;
  double v19 = v11;
  double v20 = v12;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)frameForAllItemsInRegion:(int)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(UIStatusBarLayoutManager *)self->_layoutManagers[a3] allItemViews];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v9 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v4);
        }
        double v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v13 bounds];
        -[UIView convertRect:fromView:](self, "convertRect:fromView:", v13);
        v37.origin.CGFloat x = v14;
        v37.origin.CGFloat y = v15;
        v37.size.CGFloat width = v16;
        v37.size.CGFloat height = v17;
        v32.origin.CGFloat x = x;
        v32.origin.CGFloat y = y;
        v32.size.CGFloat width = width;
        v32.size.CGFloat height = height;
        CGRect v33 = CGRectUnion(v32, v37);
        CGFloat x = v33.origin.x;
        CGFloat y = v33.origin.y;
        CGFloat width = v33.size.width;
        CGFloat height = v33.size.height;
      }
      uint64_t v10 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v10);
  }
  v34.origin.CGFloat x = x;
  v34.origin.CGFloat y = y;
  v34.size.CGFloat width = width;
  v34.size.CGFloat height = height;
  CGRect v35 = CGRectStandardize(v34);
  CGFloat v18 = v35.origin.x;
  CGFloat v19 = v35.origin.y;
  CGFloat v20 = v35.size.width;
  CGFloat v21 = v35.size.height;

  double v22 = v18;
  double v23 = v19;
  double v24 = v20;
  double v25 = v21;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (BOOL)rectIntersectsTimeItem:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = [(UIStatusBarLayoutManager *)self->_layoutManagers[2] itemViewOfType:0];
  BOOL v8 = v7;
  if (v7)
  {
    [v7 frame];
    v16.origin.CGFloat x = v9;
    v16.origin.CGFloat y = v10;
    v16.size.CGFloat width = v11;
    v16.size.CGFloat height = v12;
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    BOOL v13 = CGRectIntersectsRect(v15, v16);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)rectIntersectsBatteryItem:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(UIStatusBarForegroundView *)self frameForItemOfType:12];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  CGFloat v15 = x;
  CGFloat v16 = y;
  CGFloat v17 = width;
  CGFloat v18 = height;
  return CGRectIntersectsRect(*(CGRect *)&v15, *(CGRect *)&v8);
}

- (int64_t)idiom
{
  return self->_idiom;
}

- (void)setIdiom:(int64_t)a3
{
  self->_idiouint64_t m = a3;
}

- (UIStatusBarForegroundStyleAttributes)foregroundStyle
{
  return self->_foregroundStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundStyle, 0);
  objc_storeStrong((id *)&self->_accessibilityHUDGestureManager, 0);
  objc_storeStrong((id *)&self->_pendedData, 0);
  objc_storeStrong((id *)&self->_currentData, 0);
  objc_storeStrong((id *)&self->_actionAnimationStack, 0);
  layoutManagers = self->_layoutManagers;
  for (uint64_t i = 2; i != -1; --i)
    objc_storeStrong((id *)&layoutManagers[i], 0);
}

@end