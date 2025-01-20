@interface SBWindowDragGestureWorkspaceTransaction
- (BOOL)isDraggingFromContinuousExposeStrips;
- (BOOL)shouldInterceptTransitionRequest:(id)a3;
- (CGPoint)locationInSelectedDisplayItem;
- (CGSize)sizeOfSelectedDisplayItem;
- (int64_t)_gestureType;
- (void)_beginWithGesture:(id)a3;
- (void)_finishWithGesture:(id)a3;
- (void)interceptTransitionRequest:(id)a3;
@end

@implementation SBWindowDragGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 8;
}

- (void)_beginWithGesture:(id)a3
{
  id v4 = a3;
  v62 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherController];
  v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  v6 = [v5 layoutContext];
  v7 = [v6 layoutState];

  uint64_t v8 = [v7 floatingConfiguration];
  uint64_t v9 = [v7 centerConfiguration];
  uint64_t v57 = [v7 interfaceOrientation];
  v10 = [v5 contentView];
  v11 = [v5 view];
  [v4 locationInView:v10];
  double v13 = v12;
  double v15 = v14;
  objc_opt_class();
  v63 = v4;
  uint64_t v55 = v9;
  if (objc_opt_isKindOfClass())
  {
    [v4 initialTouchLocation];
    double v13 = v16;
    double v15 = v17;
  }
  v58 = v11;
  [v11 bounds];
  if (v15 > v18 + -1.0) {
    double v15 = v18 + -1.0;
  }
  uint64_t v19 = objc_opt_class();
  v59 = SBSafeCast(v19, v4);
  uint64_t v20 = [v59 initialTouchLeafAppLayout];
  uint64_t v56 = v8;
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [v5 adjustedAppLayoutForLeafAppLayout:v20];
    if (v22)
    {
      if ([v62 isChamoisWindowingUIEnabled]) {
        goto LABEL_17;
      }
      v60 = self;
      v23 = v10;
      v24 = [v22 itemForLayoutRole:4];

      v25 = [v21 itemForLayoutRole:1];
      uint64_t v26 = [v22 layoutRoleForItem:v25];

      if (!v24)
      {
        v10 = v23;
        self = v60;
        goto LABEL_17;
      }
      BOOL v27 = v26 == 4;
      v10 = v23;
      self = v60;
      uint64_t v8 = v56;
      if (v27)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
  }
  if ([v7 layoutContainsRole:3])
  {
    if (!SBFloatingConfigurationIsStashed(v8))
    {
      v28 = +[SBMedusaDomain rootSettings];
      [v28 narrowEdgeSwipeHitTestWidth];
      double v30 = v29;

      [v62 frameForFloatingAppLayoutInInterfaceOrientation:v57 floatingConfiguration:v8];
      v68.origin.x = v32 + (v31 - v30) * 0.5;
      v68.origin.y = 0.0;
      v68.size.width = v30;
      v67.x = v13;
      v67.y = v15;
      if (CGRectContainsPoint(v68, v67))
      {
        v21 = [v7 floatingAppLayout];
        if (v21) {
          goto LABEL_18;
        }
      }
    }
  }
  v22 = objc_msgSend(v5, "_adjustedAppLayoutForItemContainerAtLocation:environment:", 0, v13, v15);
  uint64_t v33 = [v22 leafAppLayoutForRole:4];
  if (v33)
  {
    v21 = (void *)v33;
    goto LABEL_17;
  }
  v21 = objc_msgSend(v5, "_leafAppLayoutForItemContainerAtLocation:environment:", 0, v13, v15);

  if (v21)
  {
LABEL_18:
    [(SBFluidSwitcherGestureWorkspaceTransaction *)self setSelectedAppLayout:v21];
    v34 = [v5 visibleItemContainers];
    v35 = [v34 allValues];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __61__SBWindowDragGestureWorkspaceTransaction__beginWithGesture___block_invoke;
    v65[3] = &unk_1E6AF4EF8;
    id v36 = v21;
    id v66 = v36;
    v37 = objc_msgSend(v35, "bs_firstObjectPassingTest:", v65);

    v38 = [v5 adjustedAppLayoutForLeafAppLayout:v36];
    v39 = [v36 itemForLayoutRole:1];
    uint64_t v40 = [v38 layoutRoleForItem:v39];
    v41 = v62;
    v61 = v37;
    if ([v62 windowManagementStyle] == 2)
    {
      v42 = [v7 appLayout];
      self->_draggingFromContinuousExposeStrips = [v42 containsItem:v39] ^ 1;

      objc_msgSend(v37, "convertPoint:fromView:", v10, v13, v15);
      self->_locationInSelectedDisplayItem.x = v43;
      self->_locationInSelectedDisplayItem.y = v44;
      [v62 frameForItemWithRole:v40 inMainAppLayout:v38 interfaceOrientation:v57];
      CGFloat v46 = v45;
      self->_sizeOfSelectedDisplayItem.width = v47;
      v48 = v58;
LABEL_33:
      self->_sizeOfSelectedDisplayItem.height = v46;
      v41 = v62;
      goto LABEL_34;
    }
    v48 = v58;
    if ([v62 windowManagementStyle] != 1)
    {
LABEL_34:
      v64.receiver = self;
      v64.super_class = (Class)SBWindowDragGestureWorkspaceTransaction;
      [(SBFluidSwitcherGestureWorkspaceTransaction *)&v64 _beginWithGesture:v63];

      goto LABEL_35;
    }
    if ([v38 environment] == 1)
    {
      [v62 frameForItemWithRole:v40 inMainAppLayout:v38 interfaceOrientation:v57];
    }
    else if ([v38 environment] == 2)
    {
      [v62 frameForFloatingAppLayoutInInterfaceOrientation:v57 floatingConfiguration:v56];
    }
    else
    {
      if ([v38 environment] != 3)
      {
        CGFloat v52 = *MEMORY[0x1E4F1DB30];
        CGFloat v46 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
        goto LABEL_32;
      }
      [v62 frameForCenterItemWithConfiguration:v55 interfaceOrientation:v57];
    }
    CGFloat v52 = v49;
    CGFloat v46 = v50;
LABEL_32:
    self->_draggingFromContinuousExposeStrips = 0;
    objc_msgSend(v61, "convertPoint:fromView:", v10, v13, v15);
    self->_locationInSelectedDisplayItem.x = v53;
    self->_locationInSelectedDisplayItem.y = v54;
    self->_sizeOfSelectedDisplayItem.width = v52;
    goto LABEL_33;
  }
  v51 = SBLogSystemGestureAppSwitcher();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT)) {
    -[SBWindowDragGestureWorkspaceTransaction _beginWithGesture:]((uint64_t)self, v51, v13, v15);
  }

  [v4 setEnabled:0];
  [v4 setEnabled:1];
  [(SBSystemGestureWorkspaceTransaction *)self finishWithCompletionType:-1];
  v41 = v62;
  v48 = v58;
LABEL_35:
}

uint64_t __61__SBWindowDragGestureWorkspaceTransaction__beginWithGesture___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 appLayout];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

- (void)_finishWithGesture:(id)a3
{
  id v4 = a3;
  v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedAppLayout];

  if (v5)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBWindowDragGestureWorkspaceTransaction;
    [(SBFluidSwitcherGestureWorkspaceTransaction *)&v6 _finishWithGesture:v4];
  }
}

- (BOOL)shouldInterceptTransitionRequest:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherController];
  uint64_t v6 = [v4 source];
  v7 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedAppLayout];

  if ((unint64_t)(v6 - 6) > 0x3E || ((1 << (v6 - 6)) & 0x40000000000C0001) == 0)
  {
    [v5 isChamoisWindowingUIEnabled];
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 0;
    if ([v5 isChamoisWindowingUIEnabled] && v7)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      v10 = objc_msgSend(v4, "applicationContext", 0);
      v11 = [v10 entities];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v21;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v21 != v14) {
              objc_enumerationMutation(v11);
            }
            double v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) applicationSceneEntity];
            double v17 = [v16 application];
            char v18 = [v17 alwaysMaximizedInChamois];

            if (v18)
            {
              BOOL v9 = 0;
              goto LABEL_17;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
      BOOL v9 = 1;
LABEL_17:
    }
  }

  return v9;
}

- (void)interceptTransitionRequest:(id)a3
{
  id v4 = a3;
  v5 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self _copiedTransitionRequestFromTransitionRequest:v4];
  [v5 setSource:68];
  if ([v4 source] != 24 && objc_msgSend(v4, "source") != 25) {
    goto LABEL_6;
  }
  uint64_t v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherController];
  v7 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self selectedAppLayout];
  uint64_t v8 = [v5 applicationContext];
  BOOL v9 = [v8 layoutState];

  v10 = [v6 layoutState];
  v11 = [v9 appLayout];
  uint64_t v12 = [v10 appLayout];
  char v13 = [v11 isEqual:v12];

  if ((v13 & 1) == 0)
  {
    long long v22 = [v6 switcherCoordinator];
    long long v21 = [v7 itemForLayoutRole:1];
    uint64_t v14 = [v22 _entityForDisplayItem:v21 switcherController:v6];
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v15 addObject:v14];
    [v9 appLayout];
    double v16 = v20 = v7;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __70__SBWindowDragGestureWorkspaceTransaction_interceptTransitionRequest___block_invoke;
    v24[3] = &unk_1E6AF4F20;
    id v17 = v5;
    id v25 = v17;
    id v26 = v15;
    id v18 = v15;
    [v16 enumerate:v24];

    uint64_t v19 = objc_alloc_init(SBWorkspaceApplicationSceneTransitionContext);
    [(SBWorkspaceApplicationSceneTransitionContext *)v19 setEntities:v18 withPolicy:0 centerEntity:0 floatingEntity:0];
    [v17 setApplicationContext:v19];

LABEL_6:
    v23.receiver = self;
    v23.super_class = (Class)SBWindowDragGestureWorkspaceTransaction;
    [(SBFluidSwitcherGestureWorkspaceTransaction *)&v23 interceptTransitionRequest:v5];
    goto LABEL_7;
  }

LABEL_7:
}

void __70__SBWindowDragGestureWorkspaceTransaction_interceptTransitionRequest___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) applicationContext];
  id v5 = [v4 applicationSceneEntityForLayoutRole:a2];

  [*(id *)(a1 + 40) addObject:v5];
}

- (BOOL)isDraggingFromContinuousExposeStrips
{
  return self->_draggingFromContinuousExposeStrips;
}

- (CGPoint)locationInSelectedDisplayItem
{
  double x = self->_locationInSelectedDisplayItem.x;
  double y = self->_locationInSelectedDisplayItem.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGSize)sizeOfSelectedDisplayItem
{
  double width = self->_sizeOfSelectedDisplayItem.width;
  double height = self->_sizeOfSelectedDisplayItem.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_beginWithGesture:(CGFloat)a3 .cold.1(uint64_t a1, NSObject *a2, CGFloat a3, CGFloat a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (objc_class *)objc_opt_class();
  BOOL v9 = NSStringFromClass(v8);
  v18.double x = a3;
  v18.double y = a4;
  v10 = NSStringFromCGPoint(v18);
  int v11 = 138543874;
  uint64_t v12 = v9;
  __int16 v13 = 2050;
  uint64_t v14 = a1;
  __int16 v15 = 2114;
  double v16 = v10;
  _os_log_fault_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_FAULT, "<%{public}@:%{public}p> Window drag began at %{public}@ but did not hit-test to an app layout. Bailing.", (uint8_t *)&v11, 0x20u);
}

@end