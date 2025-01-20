@interface SBLiveWindowResizeGestureWorkspaceTransaction
- (BOOL)isLiveResize;
- (int64_t)_gestureType;
- (int64_t)selectedLayoutRole;
- (unint64_t)selectedEdge;
- (void)_beginWithGesture:(id)a3;
@end

@implementation SBLiveWindowResizeGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 9;
}

- (BOOL)isLiveResize
{
  return 1;
}

- (void)_beginWithGesture:(id)a3
{
  id v5 = a3;
  v6 = [(SBFluidSwitcherGestureWorkspaceTransaction *)self switcherViewController];
  v7 = [v6 itemContainerToResizeUsingPointer];
  if (v7)
  {
    v8 = v7;
    self->_selectedEdge = [v7 pointerIsHoveringOverEdge];
    goto LABEL_24;
  }
  v9 = [v6 view];
  _UISystemGestureLocationInView();
  double v11 = v10;
  double v13 = v12;

  v8 = objc_msgSend(v6, "_itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:", 1, 1, v11, v13);
  [v8 frame];
  UIRectGetCenter();
  if (v11 < v14 && v13 < v15)
  {
    unint64_t v19 = 5;
    goto LABEL_21;
  }
  if (v11 > v14 && v13 < v15)
  {
    unint64_t v19 = 6;
    goto LABEL_21;
  }
  if (v11 < v14 && v13 > v15)
  {
    unint64_t v19 = 7;
LABEL_21:
    self->_selectedEdge = v19;
    goto LABEL_22;
  }
  if (v11 > v14 && v13 > v15)
  {
    unint64_t v19 = 8;
    goto LABEL_21;
  }
LABEL_22:
  if (!v8)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SBLiveWindowResizeGestureWorkspaceTransaction.m" lineNumber:53 description:@"Need a selected item container"];

    v8 = 0;
  }
LABEL_24:
  v20 = [v8 appLayout];
  v21 = [v6 appLayoutForLeafAppLayout:v20];
  [(SBFluidSwitcherGestureWorkspaceTransaction *)self setSelectedAppLayout:v21];
  v22 = [v20 itemForLayoutRole:1];
  self->_selectedLayoutRole = [v21 layoutRoleForItem:v22];

  v24.receiver = self;
  v24.super_class = (Class)SBLiveWindowResizeGestureWorkspaceTransaction;
  [(SBFluidSwitcherGestureWorkspaceTransaction *)&v24 _beginWithGesture:v5];
}

- (int64_t)selectedLayoutRole
{
  return self->_selectedLayoutRole;
}

- (unint64_t)selectedEdge
{
  return self->_selectedEdge;
}

@end