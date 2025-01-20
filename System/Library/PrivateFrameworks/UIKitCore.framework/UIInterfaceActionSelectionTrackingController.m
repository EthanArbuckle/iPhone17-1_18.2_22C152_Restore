@interface UIInterfaceActionSelectionTrackingController
- (BOOL)_allowSelectionForCurrentGestureLocationWithGestureRecognizer:(id)a3;
- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_isPresentedAndVisible;
- (BOOL)_shouldDisableSelectionTrackingIfScrollingScrollView:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)scrubbingEnabled;
- (BOOL)selectByIndirectPointerTouchEnabled;
- (BOOL)selectByPressGestureEnabled;
- (BOOL)selectionFeedbackEnabled;
- (CGPoint)actionSelectionInitialLocationInContainerView;
- (NSArray)representationViews;
- (NSMutableSet)viewsRequiringSelectionGestureDisabling;
- (NSPointerArray)weakCooperatingSelectionTrackingControllers;
- (UIGestureRecognizer)systemProvidedGestureRecognizer;
- (UIHoverGestureRecognizer)hoverGestureRecognizer;
- (UIInterfaceActionSelectionTrackingController)initWithTrackableContainerView:(id)a3 actionsScrollView:(id)a4;
- (UILongPressGestureRecognizer)selectionGestureRecognizer;
- (UIScrollView)actionsScrollView;
- (UISelectionFeedbackGenerator)selectionRetargetFeedbackGenerator;
- (UIView)trackableContainerView;
- (_UIInterfaceActionSelectByPressGestureRecognizer)selectByPressGestureRecognizer;
- (_UIInterfaceActionSelectionDelayGestureRecognizer)selectionDelayGestureRecognizer;
- (id)_actionViewAtCurrentLocationForGestureRecognizer:(id)a3;
- (id)_actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer:(id)a3;
- (id)_allActionViewsIncludingCooperatingActionViews;
- (id)_allGestureRecognizers;
- (id)_interfaceActionOfFocusedRepresentationView;
- (id)scrollViewDidEndDeceleratingNotificationToken;
- (id)scrollViewDidEndDraggingNotificationToken;
- (id)scrollViewWillBeginDraggingNotificationToken;
- (void)_clearSystemProvidedGestureRecognizer;
- (void)_handleActionSelectionGestureRecognizer:(id)a3;
- (void)_initializeSelectionGestureRecognizer;
- (void)_invokeHandlerForInterfaceAction:(id)a3;
- (void)_noteScrollView:(id)a3 isUserScrolling:(BOOL)a4;
- (void)_performRecursivelyWithVisitedCooperatingControllers:(id)a3 block:(id)a4;
- (void)_registerForScrollViewNotifications;
- (void)_rolloverActionChanged:(id)a3;
- (void)_setSystemProvidedGestureRecognizer:(id)a3;
- (void)_unregisterForScrollViewNotifications;
- (void)beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:(id)a3;
- (void)dealloc;
- (void)deselectAllActions;
- (void)setActionsScrollView:(id)a3;
- (void)setCooperatingSelectionTrackingControllers:(id)a3;
- (void)setHoverGestureRecognizer:(id)a3;
- (void)setRepresentationViews:(id)a3;
- (void)setScrollViewDidEndDeceleratingNotificationToken:(id)a3;
- (void)setScrollViewDidEndDraggingNotificationToken:(id)a3;
- (void)setScrollViewWillBeginDraggingNotificationToken:(id)a3;
- (void)setScrubbingEnabled:(BOOL)a3;
- (void)setSelectByIndirectPointerTouchEnabled:(BOOL)a3;
- (void)setSelectByPressGestureEnabled:(BOOL)a3;
- (void)setSelectByPressGestureRecognizer:(id)a3;
- (void)setSelectionFeedbackEnabled:(BOOL)a3;
- (void)setSelectionRetargetFeedbackGenerator:(id)a3;
- (void)setTrackableContainerView:(id)a3;
- (void)setWeakCooperatingSelectionTrackingControllers:(id)a3;
@end

@implementation UIInterfaceActionSelectionTrackingController

- (UIInterfaceActionSelectionTrackingController)initWithTrackableContainerView:(id)a3 actionsScrollView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)UIInterfaceActionSelectionTrackingController;
  v8 = [(UIInterfaceActionSelectionTrackingController *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_trackableContainerView, v6);
    [(UIInterfaceActionSelectionTrackingController *)v9 _initializeSelectionGestureRecognizer];
    objc_storeWeak((id *)&v9->_actionsScrollView, v7);
    uint64_t v10 = [MEMORY[0x1E4F1CA80] set];
    viewsRequiringSelectionGestureDisabling = v9->_viewsRequiringSelectionGestureDisabling;
    v9->_viewsRequiringSelectionGestureDisabling = (NSMutableSet *)v10;

    [(UIInterfaceActionSelectionTrackingController *)v9 _registerForScrollViewNotifications];
    v9->_scrubbingEnabled = 1;
  }

  return v9;
}

- (void)dealloc
{
  [(UIInterfaceActionSelectionTrackingController *)self _unregisterForScrollViewNotifications];
  v3.receiver = self;
  v3.super_class = (Class)UIInterfaceActionSelectionTrackingController;
  [(UIInterfaceActionSelectionTrackingController *)&v3 dealloc];
}

- (void)setCooperatingSelectionTrackingControllers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addPointer:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(UIInterfaceActionSelectionTrackingController *)self setWeakCooperatingSelectionTrackingControllers:v5];
}

- (void)setWeakCooperatingSelectionTrackingControllers:(id)a3
{
}

- (void)setScrubbingEnabled:(BOOL)a3
{
  if (self->_scrubbingEnabled != a3)
  {
    self->_scrubbingEnabled = a3;
    selectionGestureRecognizer = self->_selectionGestureRecognizer;
    if (a3)
    {
      [(UILongPressGestureRecognizer *)selectionGestureRecognizer setAllowableMovement:1.79769313e308];
      [(UILongPressGestureRecognizer *)self->_selectionGestureRecognizer setCancelPastAllowableMovement:0];
      v5 = [(UIGestureRecognizer *)self->_selectionDelayGestureRecognizer view];
      [v5 removeGestureRecognizer:self->_selectionDelayGestureRecognizer];

      selectionDelayGestureRecognizer = self->_selectionDelayGestureRecognizer;
      self->_selectionDelayGestureRecognizer = 0;
    }
    else
    {
      [(UILongPressGestureRecognizer *)selectionGestureRecognizer setAllowableMovement:10.0];
      [(UILongPressGestureRecognizer *)self->_selectionGestureRecognizer setCancelPastAllowableMovement:1];
      uint64_t v7 = (_UIInterfaceActionSelectionDelayGestureRecognizer *)objc_opt_new();
      uint64_t v8 = self->_selectionDelayGestureRecognizer;
      self->_selectionDelayGestureRecognizer = v7;

      [(UIGestureRecognizer *)self->_selectionDelayGestureRecognizer setDelegate:self];
      [(UIGestureRecognizer *)self->_selectionDelayGestureRecognizer setName:@"UIInterfaceAction.selectionDelay"];
      uint64_t v9 = [(UIGestureRecognizer *)self->_selectionGestureRecognizer view];
      [(_UIInterfaceActionSelectionDelayGestureRecognizer *)v9 addGestureRecognizer:self->_selectionDelayGestureRecognizer];
      selectionDelayGestureRecognizer = v9;
    }
  }
}

- (void)setSelectByPressGestureEnabled:(BOOL)a3
{
  if (self->_selectByPressGestureEnabled != a3)
  {
    self->_selectByPressGestureEnabled = a3;
    if (a3) {
      id v4 = [[_UIInterfaceActionSelectByPressGestureRecognizer alloc] initWithFocusedInterfaceActionPressDelegate:self];
    }
    else {
      id v4 = 0;
    }
    v5 = v4;
    [(UIInterfaceActionSelectionTrackingController *)self setSelectByPressGestureRecognizer:v4];
  }
}

- (void)setSelectionFeedbackEnabled:(BOOL)a3
{
  if (self->_selectionFeedbackEnabled != a3)
  {
    self->_selectionFeedbackEnabled = a3;
    if (a3)
    {
      id v4 = +[_UISelectionFeedbackGeneratorConfiguration defaultConfiguration];
      v5 = [v4 tweakedConfigurationForClass:objc_opt_class() usage:@"retarget"];

      id v6 = [UISelectionFeedbackGenerator alloc];
      uint64_t v7 = [(UIInterfaceActionSelectionTrackingController *)self trackableContainerView];
      uint64_t v8 = [(UIFeedbackGenerator *)v6 initWithConfiguration:v5 view:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
    [(UIInterfaceActionSelectionTrackingController *)self setSelectionRetargetFeedbackGenerator:v8];
  }
}

- (void)setSelectByIndirectPointerTouchEnabled:(BOOL)a3
{
  if (self->_selectByIndirectPointerTouchEnabled != a3)
  {
    self->_selectByIndirectPointerTouchEnabled = a3;
    selectionGestureRecognizer = self->_selectionGestureRecognizer;
    if (a3) {
      id v4 = &unk_1ED3EF050;
    }
    else {
      id v4 = &unk_1ED3EF038;
    }
    [(UIGestureRecognizer *)selectionGestureRecognizer setAllowedTouchTypes:v4];
  }
}

- (void)setSelectByPressGestureRecognizer:(id)a3
{
  p_selectByPressGestureRecognizer = &self->_selectByPressGestureRecognizer;
  id v9 = a3;
  if ((-[_UIInterfaceActionSelectByPressGestureRecognizer isEqual:](*p_selectByPressGestureRecognizer, "isEqual:") & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_trackableContainerView);
    [WeakRetained removeGestureRecognizer:self->_selectByPressGestureRecognizer];

    objc_storeStrong((id *)&self->_selectByPressGestureRecognizer, a3);
    selectByPressGestureRecognizer = self->_selectByPressGestureRecognizer;
    if (selectByPressGestureRecognizer)
    {
      [(UIGestureRecognizer *)selectByPressGestureRecognizer setCancelsTouchesInView:0];
      id v8 = objc_loadWeakRetained((id *)&self->_trackableContainerView);
      [v8 addGestureRecognizer:*p_selectByPressGestureRecognizer];
    }
  }
}

- (id)_interfaceActionOfFocusedRepresentationView
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(UIInterfaceActionSelectionTrackingController *)self _allActionViewsIncludingCooperatingActionViews];
  objc_super v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 isFocused])
        {
          objc_super v3 = [v6 action];
          goto LABEL_11;
        }
      }
      objc_super v3 = (void *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:(id)a3
{
  id v4 = a3;
  [(UIInterfaceActionSelectionTrackingController *)self _setSystemProvidedGestureRecognizer:v4];
  [(UIInterfaceActionSelectionTrackingController *)self _handleActionSelectionGestureRecognizer:v4];
}

- (void)_setSystemProvidedGestureRecognizer:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_systemProvidedGestureRecognizer = (id *)&self->_systemProvidedGestureRecognizer;
  systemProvidedGestureRecognizer = self->_systemProvidedGestureRecognizer;
  if (systemProvidedGestureRecognizer != v5)
  {
    if (systemProvidedGestureRecognizer) {
      [(UIGestureRecognizer *)systemProvidedGestureRecognizer removeTarget:self action:0];
    }
    objc_storeStrong((id *)&self->_systemProvidedGestureRecognizer, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    long long v8 = [(UIInterfaceActionSelectionTrackingController *)self _allGestureRecognizers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v13;
      while (1)
      {
        if (*(void *)v13 != v11) {
          objc_enumerationMutation(v8);
        }
        if (*p_systemProvidedGestureRecognizer != v5) {
          [v5 setEnabled:*p_systemProvidedGestureRecognizer == 0];
        }
        if (!--v10)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }

    if (*p_systemProvidedGestureRecognizer) {
      [*p_systemProvidedGestureRecognizer addTarget:self action:sel__handleSystemProvidedGestureRecognizer_];
    }
  }
}

- (void)_clearSystemProvidedGestureRecognizer
{
}

- (BOOL)_gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  id v6 = [a3 allowedTouchTypes];
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 type];

  uint64_t v9 = [v7 numberWithInteger:v8];
  LOBYTE(v7) = [v6 containsObject:v9];

  return (char)v7;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = (_UIInterfaceActionSelectionDelayGestureRecognizer *)a3;
  uint64_t v7 = (UILongPressGestureRecognizer *)a4;
  uint64_t v8 = v7;
  selectionGestureRecognizer = self->_selectionGestureRecognizer;
  if (self->_selectionDelayGestureRecognizer == v6)
  {
    char v10 = selectionGestureRecognizer != v7;
  }
  else if (selectionGestureRecognizer == (UILongPressGestureRecognizer *)v6)
  {
    uint64_t v11 = [(UIGestureRecognizer *)v7 view];
    long long v12 = [(UIInterfaceActionSelectionTrackingController *)self trackableContainerView];
    if ([v11 isDescendantOfView:v12]) {
      char v10 = 1;
    }
    else {
      char v10 = _UISheetInteractionGestureIsForInteractiveDismiss(v8);
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = (UILongPressGestureRecognizer *)a3;
  uint64_t v7 = (_UIInterfaceActionSelectionDelayGestureRecognizer *)a4;
  uint64_t v8 = v7;
  if (self->_selectionGestureRecognizer != v6) {
    goto LABEL_2;
  }
  if (self->_selectionDelayGestureRecognizer == v7)
  {
LABEL_8:
    BOOL v9 = 1;
    goto LABEL_3;
  }
  if ([(UIGestureRecognizer *)v7 _isGestureType:9])
  {
    uint64_t v11 = [(UIGestureRecognizer *)v8 view];
    long long v12 = [(UIInterfaceActionSelectionTrackingController *)self trackableContainerView];
    if ([v11 isDescendantOfView:v12])
    {
      long long v13 = [(UIGestureRecognizer *)v8 view];
      long long v14 = [(UIInterfaceActionSelectionTrackingController *)self actionsScrollView];

      if (v13 != v14) {
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
LABEL_2:
  BOOL v9 = 0;
LABEL_3:

  return v9;
}

- (void)deselectAllActions
{
  id v2 = [(UIInterfaceActionSelectionTrackingController *)self _allActionViewsIncludingCooperatingActionViews];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_9];
}

uint64_t __66__UIInterfaceActionSelectionTrackingController_deselectAllActions__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHighlighted:0];
}

- (void)_rolloverActionChanged:(id)a3
{
  id v4 = a3;
  if ([(UIInterfaceActionSelectionTrackingController *)self _isPresentedAndVisible])
  {
    if ([v4 state] == 3)
    {
      id v5 = 0;
    }
    else
    {
      id v5 = [(UIInterfaceActionSelectionTrackingController *)self _actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer:v4];
    }
    id v6 = [(UIInterfaceActionSelectionTrackingController *)self _allActionViewsIncludingCooperatingActionViews];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__UIInterfaceActionSelectionTrackingController__rolloverActionChanged___block_invoke;
    v9[3] = &unk_1E52DA5E8;
    id v10 = v5;
    id v7 = v5;
    [v6 enumerateObjectsUsingBlock:v9];

    uint64_t v8 = [v7 action];
    objc_msgSend(v7, "setHighlighted:", objc_msgSend(v8, "isEnabled"));
  }
}

uint64_t __71__UIInterfaceActionSelectionTrackingController__rolloverActionChanged___block_invoke(uint64_t result, void *a2)
{
  if (*(void **)(result + 32) != a2) {
    return [a2 setHighlighted:0];
  }
  return result;
}

- (void)_handleActionSelectionGestureRecognizer:(id)a3
{
  id v4 = (UILongPressGestureRecognizer *)a3;
  if ([(UIInterfaceActionSelectionTrackingController *)self _isPresentedAndVisible])
  {
    if (!self->_scrubbingEnabled) {
      goto LABEL_32;
    }
    if (self->_selectionGestureRecognizer == v4) {
      goto LABEL_32;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsScrollView);
    [WeakRetained bounds];
    double v7 = v6;
    id v8 = objc_loadWeakRetained((id *)&self->_actionsScrollView);
    [v8 contentSize];
    double v10 = v9;

    if (v7 >= v10)
    {
LABEL_32:
      if ([(UIInterfaceActionSelectionTrackingController *)self _allowSelectionForCurrentGestureLocationWithGestureRecognizer:v4])
      {
        uint64_t v11 = [(UIInterfaceActionSelectionTrackingController *)self _actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer:v4];
      }
      else
      {
        uint64_t v11 = 0;
      }
      long long v12 = [v11 action];
      int v13 = [v12 isEnabled];
      id v14 = objc_loadWeakRetained((id *)&self->_trackableContainerView);
      long long v15 = [v14 traitCollection];
      uint64_t v16 = [v15 preferredContentSizeCategory];

      if (v16) {
        BOOL v17 = !UIContentSizeCategoryIsAccessibilityCategory(v16);
      }
      else {
        BOOL v17 = 1;
      }
      BOOL v33 = v17;
      v18 = [(UIInterfaceActionSelectionTrackingController *)self trackableContainerView];
      [(UILongPressGestureRecognizer *)v4 locationInView:v18];
      uint64_t v20 = v19;
      uint64_t v22 = v21;

      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke;
      aBlock[3] = &unk_1E52DA610;
      char v48 = v13;
      id v23 = v11;
      id v44 = v23;
      v45 = self;
      uint64_t v46 = v20;
      uint64_t v47 = v22;
      v24 = (void (**)(void *, void))_Block_copy(aBlock);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_2;
      v41[3] = &unk_1E52DA660;
      v41[4] = self;
      id v25 = v23;
      id v42 = v25;
      v26 = (void (**)(void *, void))_Block_copy(v41);
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_4;
      v40[3] = &unk_1E52DA6B0;
      v40[4] = self;
      v27 = (uint64_t (**)(void))_Block_copy(v40);
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v35 = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_6;
      v36 = &unk_1E52DA6D8;
      v37 = self;
      uint64_t v38 = v20;
      uint64_t v39 = v22;
      if ([(UIGestureRecognizer *)v4 state] == UIGestureRecognizerStateBegan)
      {
        v24[2](v24, 0);
        goto LABEL_16;
      }
      if ([(UIGestureRecognizer *)v4 state] == UIGestureRecognizerStateChanged)
      {
        int v28 = v27[2](v27);
        v26[2](v26, 0);
        if ((v33 | v28) == 1)
        {
          uint64_t v29 = 1;
          v24[2](v24, 1);
LABEL_27:
          v35((double *)v34, v29);
          goto LABEL_28;
        }
LABEL_16:
        uint64_t v29 = 1;
        goto LABEL_27;
      }
      if ([(UIGestureRecognizer *)v4 state] == UIGestureRecognizerStateEnded)
      {
        if (v13)
        {
          int v30 = [v25 isHighlighted];
          char v31 = v30;
          if (v30 && !self->_scrubbingEnabled)
          {
            [(UIInterfaceActionSelectionTrackingController *)self _clearSystemProvidedGestureRecognizer];
LABEL_25:
            v32 = +[_UIStatistics alertButtonTapCount];
            [v32 incrementValueBy:1];

            [(UIInterfaceActionSelectionTrackingController *)self _invokeHandlerForInterfaceAction:v12];
            goto LABEL_26;
          }
          v26[2](v26, 1);
          [(UIInterfaceActionSelectionTrackingController *)self _clearSystemProvidedGestureRecognizer];
          if (v31) {
            goto LABEL_25;
          }
LABEL_26:
          uint64_t v29 = 0;
          goto LABEL_27;
        }
      }
      else if ([(UIGestureRecognizer *)v4 state] != UIGestureRecognizerStateCancelled)
      {
LABEL_28:

        goto LABEL_29;
      }
      v26[2](v26, 1);
      [(UIInterfaceActionSelectionTrackingController *)self _clearSystemProvidedGestureRecognizer];
      goto LABEL_26;
    }
  }
LABEL_29:
}

void __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke(uint64_t a1, int a2)
{
  if (*(unsigned char *)(a1 + 64))
  {
    char v4 = [*(id *)(a1 + 32) isHighlighted];
    [*(id *)(a1 + 32) setHighlighted:1];
    if ((v4 & 1) == 0)
    {
      if (a2)
      {
        id v5 = [*(id *)(a1 + 40) selectionRetargetFeedbackGenerator];
        objc_msgSend(v5, "selectionChangedAtLocation:", *(double *)(a1 + 48), *(double *)(a1 + 56));
      }
    }
  }
}

void __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_2(uint64_t a1, char a2)
{
  char v4 = [*(id *)(a1 + 32) _allActionViewsIncludingCooperatingActionViews];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_3;
  v5[3] = &unk_1E52DA638;
  char v7 = a2;
  id v6 = *(id *)(a1 + 40);
  [v4 enumerateObjectsUsingBlock:v5];
}

void __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40) || *(id *)(a1 + 32) != v3)
  {
    id v4 = v3;
    [v3 setHighlighted:0];
    id v3 = v4;
  }
}

uint64_t __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_4(uint64_t a1)
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v1 = [*(id *)(a1 + 32) _allActionViewsIncludingCooperatingActionViews];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_5;
  v4[3] = &unk_1E52DA688;
  v4[4] = &v5;
  [v1 enumerateObjectsUsingBlock:v4];

  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isHighlighted];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __88__UIInterfaceActionSelectionTrackingController__handleActionSelectionGestureRecognizer___block_invoke_6(double *a1, int a2)
{
  uint64_t result = [*(id *)(*((void *)a1 + 4) + 80) isActive];
  if (a2)
  {
    if ((result & 1) == 0)
    {
      uint64_t v5 = *(void **)(*((void *)a1 + 4) + 80);
      double v6 = a1[5];
      double v7 = a1[6];
      return objc_msgSend(v5, "userInteractionStartedAtLocation:", v6, v7);
    }
  }
  else if (result)
  {
    char v8 = *(void **)(*((void *)a1 + 4) + 80);
    double v9 = a1[5];
    double v10 = a1[6];
    return objc_msgSend(v8, "userInteractionEndedAtLocation:", v9, v10);
  }
  return result;
}

- (BOOL)_isPresentedAndVisible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackableContainerView);
  id v3 = [WeakRetained window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_invokeHandlerForInterfaceAction:(id)a3
{
}

- (BOOL)_allowSelectionForCurrentGestureLocationWithGestureRecognizer:(id)a3
{
  p_trackableContainerView = &self->_trackableContainerView;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_trackableContainerView);
  [v5 locationInView:WeakRetained];
  double v8 = v7;
  double v10 = v9;

  double x = self->_actionSelectionInitialLocationInContainerView.x;
  double y = self->_actionSelectionInitialLocationInContainerView.y;
  p_actionSelectionInitialLocationInContainerView = &self->_actionSelectionInitialLocationInContainerView;
  if (x == *MEMORY[0x1E4F1DAD8] && y == *(double *)(MEMORY[0x1E4F1DAD8] + 8)) {
    return 1;
  }
  if (sqrt((v8 - x) * (v8 - x) + (v10 - y) * (v10 - y)) > 15.0)
  {
    CGPoint *p_actionSelectionInitialLocationInContainerView = *(CGPoint *)MEMORY[0x1E4F1DAD8];
    return 1;
  }
  return 0;
}

- (id)_actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  long long v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __128__UIInterfaceActionSelectionTrackingController__actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer___block_invoke;
  v8[3] = &unk_1E52DA700;
  double v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(UIInterfaceActionSelectionTrackingController *)self _performRecursivelyWithVisitedCooperatingControllers:0 block:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __128__UIInterfaceActionSelectionTrackingController__actionViewIncludingCooperatingActionViewsAtCurrentLocationForGestureRecognizer___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v5 = [a2 _actionViewAtCurrentLocationForGestureRecognizer:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) != 0;
}

- (id)_actionViewAtCurrentLocationForGestureRecognizer:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_trackableContainerView = &self->_trackableContainerView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackableContainerView);
  [v4 locationInView:WeakRetained];
  double v8 = v7;
  double v10 = v9;

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v11 = self->_representationViews;
  uint64_t v12 = [(NSArray *)v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        BOOL v17 = objc_msgSend(v16, "_containingScrollView", (void)v30);
        if (!v17
          || (id v18 = objc_loadWeakRetained((id *)p_trackableContainerView),
              objc_msgSend(v17, "convertPoint:fromView:", v18, v8, v10),
              double v20 = v19,
              double v22 = v21,
              v18,
              objc_msgSend(v17, "pointInside:withEvent:", 0, v20, v22)))
        {
          id v23 = objc_loadWeakRetained((id *)p_trackableContainerView);
          objc_msgSend(v16, "convertPoint:fromView:", v23, v8, v10);
          double v25 = v24;
          double v27 = v26;

          if (objc_msgSend(v16, "pointInside:withEvent:", 0, v25, v27))
          {
            id v28 = v16;

            goto LABEL_13;
          }
        }
      }
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  id v28 = 0;
LABEL_13:

  return v28;
}

- (void)_initializeSelectionGestureRecognizer
{
  id v3 = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:sel__handleActionSelectionGestureRecognizer_];
  selectionGestureRecognizer = self->_selectionGestureRecognizer;
  self->_selectionGestureRecognizer = v3;

  [(UILongPressGestureRecognizer *)self->_selectionGestureRecognizer setAllowableMovement:1.79769313e308];
  [(UILongPressGestureRecognizer *)self->_selectionGestureRecognizer setMinimumPressDuration:0.0];
  [(UIGestureRecognizer *)self->_selectionGestureRecognizer setCancelsTouchesInView:0];
  [(UIGestureRecognizer *)self->_selectionGestureRecognizer setDelegate:self];
  [(UIGestureRecognizer *)self->_selectionGestureRecognizer setAllowedTouchTypes:&unk_1ED3EF038];
  [(UIGestureRecognizer *)self->_selectionGestureRecognizer setAllowedPressTypes:MEMORY[0x1E4F1CBF0]];
  [(UIGestureRecognizer *)self->_selectionGestureRecognizer setName:@"UIInterfaceAction.selection"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackableContainerView);
  [WeakRetained addGestureRecognizer:self->_selectionGestureRecognizer];

  uint64_t v6 = [[UIHoverGestureRecognizer alloc] initWithTarget:self action:sel__rolloverActionChanged_];
  [(UIInterfaceActionSelectionTrackingController *)self setHoverGestureRecognizer:v6];

  double v7 = [(UIInterfaceActionSelectionTrackingController *)self hoverGestureRecognizer];
  [v7 setDelegate:self];

  id v9 = objc_loadWeakRetained((id *)&self->_trackableContainerView);
  double v8 = [(UIInterfaceActionSelectionTrackingController *)self hoverGestureRecognizer];
  [v9 addGestureRecognizer:v8];
}

- (void)_registerForScrollViewNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v4 = [MEMORY[0x1E4F28F08] mainQueue];
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke;
  v15[3] = &unk_1E52DA728;
  objc_copyWeak(&v16, &location);
  uint64_t v5 = [v3 addObserverForName:@"_UIScrollViewWillBeginDraggingNotification" object:0 queue:v4 usingBlock:v15];
  id scrollViewWillBeginDraggingNotificationToken = self->_scrollViewWillBeginDraggingNotificationToken;
  self->_id scrollViewWillBeginDraggingNotificationToken = v5;

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke_2;
  v13[3] = &unk_1E52DA728;
  objc_copyWeak(&v14, &location);
  double v7 = [v3 addObserverForName:@"_UIScrollViewDidEndDraggingNotification" object:0 queue:v4 usingBlock:v13];
  id scrollViewDidEndDraggingNotificationToken = self->_scrollViewDidEndDraggingNotificationToken;
  self->_id scrollViewDidEndDraggingNotificationToken = v7;

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke_3;
  v11[3] = &unk_1E52DA728;
  objc_copyWeak(&v12, &location);
  id v9 = [v3 addObserverForName:@"_UIScrollViewDidEndDeceleratingNotification" object:0 queue:v4 usingBlock:v11];
  id scrollViewDidEndDeceleratingNotificationToken = self->_scrollViewDidEndDeceleratingNotificationToken;
  self->_id scrollViewDidEndDeceleratingNotificationToken = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 object];

  [WeakRetained _noteScrollView:v4 isUserScrolling:1];
}

void __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 userInfo];
  id v4 = [v3 objectForKey:@"_UIScrollViewDidEndDraggingWillDecelerateUserInfoKey"];
  char v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    double v7 = [v8 object];
    [WeakRetained _noteScrollView:v7 isUserScrolling:0];
  }
}

void __83__UIInterfaceActionSelectionTrackingController__registerForScrollViewNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 object];

  [WeakRetained _noteScrollView:v4 isUserScrolling:0];
}

- (void)_unregisterForScrollViewNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_scrollViewWillBeginDraggingNotificationToken];
  [v3 removeObserver:self->_scrollViewDidEndDraggingNotificationToken];
  [v3 removeObserver:self->_scrollViewDidEndDeceleratingNotificationToken];
}

- (void)_noteScrollView:(id)a3 isUserScrolling:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if (-[UIInterfaceActionSelectionTrackingController _shouldDisableSelectionTrackingIfScrollingScrollView:](self, "_shouldDisableSelectionTrackingIfScrollingScrollView:"))
  {
    viewsRequiringSelectionGestureDisabling = self->_viewsRequiringSelectionGestureDisabling;
    if (v4) {
      [(NSMutableSet *)viewsRequiringSelectionGestureDisabling addObject:v7];
    }
    else {
      [(NSMutableSet *)viewsRequiringSelectionGestureDisabling removeObject:v7];
    }
    [(UIGestureRecognizer *)self->_selectionGestureRecognizer setEnabled:[(NSMutableSet *)self->_viewsRequiringSelectionGestureDisabling count] == 0];
  }
}

- (BOOL)_shouldDisableSelectionTrackingIfScrollingScrollView:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsScrollView);
  if (WeakRetained == v4)
  {
    char v7 = 1;
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_trackableContainerView);
    char v7 = [v6 isDescendantOfView:v4];
  }
  return v7;
}

- (void)_performRecursivelyWithVisitedCooperatingControllers:(id)a3 block:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = (void (**)(id, UIInterfaceActionSelectionTrackingController *, unsigned char *))a4;
  if (([v6 containsObject:self] & 1) == 0)
  {
    if (!v6)
    {
      id v6 = [MEMORY[0x1E4F1CA48] array];
    }
    [v6 addObject:self];
    uint64_t v20 = 0;
    double v21 = &v20;
    uint64_t v22 = 0x2020000000;
    v23[0] = 0;
    v7[2](v7, self, v23);
    if (!*((unsigned char *)v21 + 24))
    {
      [(NSPointerArray *)self->_weakCooperatingSelectionTrackingControllers compact];
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v8 = self->_weakCooperatingSelectionTrackingControllers;
      uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v17;
LABEL_7:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v16 + 1) + 8 * v11);
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __107__UIInterfaceActionSelectionTrackingController__performRecursivelyWithVisitedCooperatingControllers_block___block_invoke;
          v13[3] = &unk_1E52DA750;
          id v14 = v7;
          long long v15 = &v20;
          [v12 _performRecursivelyWithVisitedCooperatingControllers:v6 block:v13];
          LOBYTE(v12) = *((unsigned char *)v21 + 24) == 0;

          if ((v12 & 1) == 0) {
            break;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [(NSPointerArray *)v8 countByEnumeratingWithState:&v16 objects:v24 count:16];
            if (v9) {
              goto LABEL_7;
            }
            break;
          }
        }
      }
    }
    _Block_object_dispose(&v20, 8);
  }
}

uint64_t __107__UIInterfaceActionSelectionTrackingController__performRecursivelyWithVisitedCooperatingControllers_block___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *a3;
  return result;
}

- (id)_allActionViewsIncludingCooperatingActionViews
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __94__UIInterfaceActionSelectionTrackingController__allActionViewsIncludingCooperatingActionViews__block_invoke;
  v6[3] = &unk_1E52DA778;
  id v4 = v3;
  id v7 = v4;
  [(UIInterfaceActionSelectionTrackingController *)self _performRecursivelyWithVisitedCooperatingControllers:0 block:v6];

  return v4;
}

uint64_t __94__UIInterfaceActionSelectionTrackingController__allActionViewsIncludingCooperatingActionViews__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObjectsFromArray:*(void *)(a2 + 32)];
}

- (id)_allGestureRecognizers
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = v3;
  if (self->_selectionGestureRecognizer) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_selectByPressGestureRecognizer) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_systemProvidedGestureRecognizer) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (UIView)trackableContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackableContainerView);
  return (UIView *)WeakRetained;
}

- (void)setTrackableContainerView:(id)a3
{
}

- (UIScrollView)actionsScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsScrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)setActionsScrollView:(id)a3
{
}

- (BOOL)scrubbingEnabled
{
  return self->_scrubbingEnabled;
}

- (BOOL)selectByPressGestureEnabled
{
  return self->_selectByPressGestureEnabled;
}

- (BOOL)selectionFeedbackEnabled
{
  return self->_selectionFeedbackEnabled;
}

- (BOOL)selectByIndirectPointerTouchEnabled
{
  return self->_selectByIndirectPointerTouchEnabled;
}

- (NSArray)representationViews
{
  return self->_representationViews;
}

- (void)setRepresentationViews:(id)a3
{
}

- (CGPoint)actionSelectionInitialLocationInContainerView
{
  double x = self->_actionSelectionInitialLocationInContainerView.x;
  double y = self->_actionSelectionInitialLocationInContainerView.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UILongPressGestureRecognizer)selectionGestureRecognizer
{
  return self->_selectionGestureRecognizer;
}

- (_UIInterfaceActionSelectionDelayGestureRecognizer)selectionDelayGestureRecognizer
{
  return self->_selectionDelayGestureRecognizer;
}

- (UIGestureRecognizer)systemProvidedGestureRecognizer
{
  return self->_systemProvidedGestureRecognizer;
}

- (NSMutableSet)viewsRequiringSelectionGestureDisabling
{
  return self->_viewsRequiringSelectionGestureDisabling;
}

- (_UIInterfaceActionSelectByPressGestureRecognizer)selectByPressGestureRecognizer
{
  return self->_selectByPressGestureRecognizer;
}

- (UISelectionFeedbackGenerator)selectionRetargetFeedbackGenerator
{
  return self->_selectionRetargetFeedbackGenerator;
}

- (void)setSelectionRetargetFeedbackGenerator:(id)a3
{
}

- (NSPointerArray)weakCooperatingSelectionTrackingControllers
{
  return self->_weakCooperatingSelectionTrackingControllers;
}

- (id)scrollViewWillBeginDraggingNotificationToken
{
  return self->_scrollViewWillBeginDraggingNotificationToken;
}

- (void)setScrollViewWillBeginDraggingNotificationToken:(id)a3
{
}

- (id)scrollViewDidEndDraggingNotificationToken
{
  return self->_scrollViewDidEndDraggingNotificationToken;
}

- (void)setScrollViewDidEndDraggingNotificationToken:(id)a3
{
}

- (id)scrollViewDidEndDeceleratingNotificationToken
{
  return self->_scrollViewDidEndDeceleratingNotificationToken;
}

- (void)setScrollViewDidEndDeceleratingNotificationToken:(id)a3
{
}

- (UIHoverGestureRecognizer)hoverGestureRecognizer
{
  return self->_hoverGestureRecognizer;
}

- (void)setHoverGestureRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoverGestureRecognizer, 0);
  objc_storeStrong(&self->_scrollViewDidEndDeceleratingNotificationToken, 0);
  objc_storeStrong(&self->_scrollViewDidEndDraggingNotificationToken, 0);
  objc_storeStrong(&self->_scrollViewWillBeginDraggingNotificationToken, 0);
  objc_storeStrong((id *)&self->_weakCooperatingSelectionTrackingControllers, 0);
  objc_storeStrong((id *)&self->_selectionRetargetFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_selectByPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_viewsRequiringSelectionGestureDisabling, 0);
  objc_storeStrong((id *)&self->_systemProvidedGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionDelayGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_selectionGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_representationViews, 0);
  objc_destroyWeak((id *)&self->_actionsScrollView);
  objc_destroyWeak((id *)&self->_trackableContainerView);
}

@end