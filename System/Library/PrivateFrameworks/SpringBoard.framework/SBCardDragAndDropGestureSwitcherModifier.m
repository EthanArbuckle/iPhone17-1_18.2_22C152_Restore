@interface SBCardDragAndDropGestureSwitcherModifier
- (BOOL)isHitTestBlockingViewVisible;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3;
- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (CGRect)fullyPresentedFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (SBCardDragAndDropGestureSwitcherModifier)initWithGestureID:(id)a3;
- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)titleAndIconOpacityForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleBlurProgressEvent:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleScrollEvent:(id)a3;
- (id)handleSwitcherDropEvent:(id)a3;
- (id)visibleAppLayouts;
- (unint64_t)blurTargetPreferenceForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
@end

@implementation SBCardDragAndDropGestureSwitcherModifier

- (SBCardDragAndDropGestureSwitcherModifier)initWithGestureID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  v6 = [(SBGestureSwitcherModifier *)&v9 initWithGestureID:v5];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_gestureID, a3);
  }

  return v7;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v64[2] = *MEMORY[0x1E4F143B8];
  v12 = (SBAppLayout *)a4;
  v62.receiver = self;
  v62.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v62, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v12, x, y, width, height);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(SBAppLayout *)v12 leafAppLayoutForRole:a3];
  v22 = v21;
  if (self->_currentDropRegion == 7 && v21 == self->_draggingLeafAppLayout
    || self->_isScrolling
    && ![(SBAppLayout *)v12 isOrContainsAppLayout:self->_draggingAppLayout])
  {
    goto LABEL_36;
  }
  if (v22 == self->_draggingLeafAppLayout)
  {
    intersectingAppLayout = self->_intersectingAppLayout;
    if (intersectingAppLayout
      && ![(SBAppLayout *)intersectingAppLayout isOrContainsAppLayout:v22])
    {
      [(SBSwitcherDropRegionContext *)self->_dropRegionContext unscaledIntersectingAppLayoutSize];
      double v18 = v40;
      double v20 = v41;
    }
    goto LABEL_36;
  }
  if ([(SBAppLayout *)v12 environment] == 2) {
    goto LABEL_36;
  }
  int64_t v23 = [(SBAppLayout *)self->_draggingAppLayout configuration];
  int64_t v24 = [(SBAppLayout *)self->_intersectingAppLayout configuration];
  if (self->_draggingAppLayout != v12 || v23 < 2)
  {
    uint64_t v26 = v24;
    if ([(SBAppLayout *)self->_intersectingAppLayout isOrContainsAppLayout:v22]) {
      BOOL v27 = v26 <= 1;
    }
    else {
      BOOL v27 = 0;
    }
    if (!v27) {
      goto LABEL_36;
    }
    v28 = [NSNumber numberWithInteger:1];
    v63[0] = v28;
    v29 = [(SBAppLayout *)self->_draggingLeafAppLayout itemForLayoutRole:1];
    v64[0] = v29;
    v30 = objc_msgSend(NSNumber, "numberWithInteger:");
    v63[1] = v30;
    v31 = [(SBAppLayout *)self->_intersectingLeafAppLayout itemForLayoutRole:1];
    v64[1] = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v64 forKeys:v63 count:2];

    v33 = [[SBAppLayout alloc] initWithItemsForLayoutRoles:v32 configuration:3 environment:1 preferredDisplayOrdinal:[(SBCardDragAndDropGestureSwitcherModifier *)self displayOrdinal]];
    unint64_t currentDropRegion = self->_currentDropRegion;
    if (currentDropRegion == 5)
    {
      [(SBCardDragAndDropGestureSwitcherModifier *)self containerViewBounds];
      v57.receiver = self;
      v57.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
      -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v57, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v33);
    }
    else
    {
      if (currentDropRegion != 4)
      {
LABEL_35:

        goto LABEL_36;
      }
      [(SBCardDragAndDropGestureSwitcherModifier *)self containerViewBounds];
      v58.receiver = self;
      v58.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
      -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v58, sel_frameForLayoutRole_inAppLayout_withBounds_, 2, v33);
    }
    double v14 = v35;
    double v16 = v36;
    double v18 = v37;
    double v20 = v38;
    goto LABEL_35;
  }
  if (v22 == self->_draggingLeafAppLayout)
  {
    v56 = [MEMORY[0x1E4F28B00] currentHandler];
    [v56 handleFailureInMethod:a2 object:self file:@"SBCardDragAndDropGestureSwitcherModifier.m" lineNumber:98 description:@"Shouldn't attempt to layout the dragging item."];
  }
  if ([(SBAppLayout *)self->_intersectingAppLayout isOrContainsAppLayout:v12])
  {
    v42 = [(SBSwitcherDropRegionContext *)self->_dropRegionContext finalTargetAppLayout];
    unint64_t v43 = self->_currentDropRegion;
    if (v43 == 5)
    {
      [(SBCardDragAndDropGestureSwitcherModifier *)self containerViewBounds];
      v60.receiver = self;
      v60.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
      -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v60, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v42);
    }
    else
    {
      if (v43 != 4)
      {
LABEL_32:

        goto LABEL_36;
      }
      [(SBCardDragAndDropGestureSwitcherModifier *)self containerViewBounds];
      v61.receiver = self;
      v61.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
      -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v61, sel_frameForLayoutRole_inAppLayout_withBounds_, 2, v42);
    }
    double v14 = v44;
    double v16 = v45;
    double v18 = v46;
    double v20 = v47;
    goto LABEL_32;
  }
  [(SBCardDragAndDropGestureSwitcherModifier *)self containerViewBounds];
  v59.receiver = self;
  v59.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v59, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v22);
  double v14 = v48;
  double v16 = v49;
  double v18 = v50;
  double v20 = v51;
LABEL_36:

  double v52 = v14;
  double v53 = v16;
  double v54 = v18;
  double v55 = v20;
  result.size.double height = v55;
  result.size.double width = v54;
  result.origin.double y = v53;
  result.origin.double x = v52;
  return result;
}

- (id)handleBlurProgressEvent:(id)a3
{
  id v4 = a3;
  id v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  v9.receiver = self;
  v9.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  v6 = [(SBSwitcherModifier *)&v9 handleBlurProgressEvent:v4];

  v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v5 toResponse:v6];

  return v7;
}

- (id)handleScrollEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  id v4 = a3;
  id v5 = [(SBSwitcherModifier *)&v8 handleScrollEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  self->_isScrolling = v6 == 0;
  return v5;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  uint64_t v6 = (SBAppLayout *)a4;
  v15.receiver = self;
  v15.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  unsigned __int8 v7 = [(SBCardDragAndDropGestureSwitcherModifier *)&v15 isLayoutRoleBlurred:a3 inAppLayout:v6];
  objc_super v8 = [(SBAppLayout *)v6 leafAppLayoutForRole:a3];
  if (self->_isScrolling
    && ![(SBAppLayout *)v6 isOrContainsAppLayout:self->_draggingAppLayout]
    || [(SBAppLayout *)self->_draggingLeafAppLayout isOrContainsAppLayout:v8]
    || [(SBAppLayout *)self->_intersectingAppLayout environment] == 2)
  {
    LOBYTE(v9) = 0;
  }
  else if (self->_gestureEnded)
  {
    LOBYTE(v9) = v7;
  }
  else
  {
    BOOL v11 = [(SBAppLayout *)self->_draggingAppLayout isSplitConfiguration];
    BOOL v12 = [(SBAppLayout *)self->_intersectingAppLayout isSplitConfiguration];
    int v9 = ![(SBAppLayout *)self->_intersectingAppLayout isOrContainsAppLayout:v8];
    if (self->_draggingAppLayout != v6 || !v11)
    {
      char v13 = v9 | v12;
      LOBYTE(v9) = v7;
      if ((v13 & 1) == 0)
      {
        double v14 = [(SBAppLayout *)v6 itemForLayoutRole:a3];
        if (self->_currentDropRegion == 7) {
          LOBYTE(v9) = 0;
        }
        else {
          LOBYTE(v9) = [(SBCardDragAndDropGestureSwitcherModifier *)self displayItemSupportsMedusa:v14];
        }
      }
    }
  }

  return v9;
}

- (unint64_t)blurTargetPreferenceForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  uint64_t v6 = (SBAppLayout *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  [(SBCardDragAndDropGestureSwitcherModifier *)&v13 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  int v9 = [(SBAppLayout *)v6 leafAppLayoutForRole:a3];
  if (self->_currentDropRegion != 7
    && self->_intersectingAppLayout == v6
    && [(SBAppLayout *)v6 isSplitConfiguration]
    && ![(SBAppLayout *)self->_intersectingAppLayout isOrContainsAppLayout:self->_draggingLeafAppLayout]&& v9 != self->_draggingLeafAppLayout&& v9 == self->_intersectingLeafAppLayout)
  {
    v10 = [(SBCardDragAndDropGestureSwitcherModifier *)self medusaSettings];
    [v10 defaultDimmingOpacity];
    double v8 = v11;
  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  BOOL v7 = [(SBCardDragAndDropGestureSwitcherModifier *)&v10 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  double v8 = [v6 leafAppLayoutForRole:a3];
  if ([(SBAppLayout *)self->_draggingAppLayout isOrContainsAppLayout:v8]
    || [(SBAppLayout *)self->_intersectingAppLayout isOrContainsAppLayout:v6]
    || [(SBAppLayout *)self->_previouslyIntersectingAppLayout isOrContainsAppLayout:v6])
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3
{
  id v5 = [(SBCardDragAndDropGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if (!self->_gestureEnded && self->_intersectingAppLayout && objc_msgSend(v6, "isOrContainsAppLayout:"))
  {
    BOOL v11 = [(SBAppLayout *)self->_intersectingAppLayout isOrContainsAppLayout:self->_draggingLeafAppLayout];
    int v7 = !v11 | [(SBAppLayout *)self->_draggingAppLayout isSplitConfiguration];
  }
  else
  {
    int v7 = 0;
  }
  if (([v6 isSplitConfiguration] & 1) == 0)
  {
    double v8 = [v6 itemForLayoutRole:1];
    v7 &= [(SBCardDragAndDropGestureSwitcherModifier *)self displayItemSupportsMedusa:v8];
  }
  if ((self->_currentDropRegion & 0xFFFFFFFFFFFFFFFELL) == 6) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v7;
  }

  return v9;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)visibleAppLayouts
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v7.receiver = self;
  v7.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  id v4 = [(SBCardDragAndDropGestureSwitcherModifier *)&v7 visibleAppLayouts];
  id v5 = (void *)[v3 initWithSet:v4];

  [v5 addObject:self->_draggingAppLayout];
  return v5;
}

- (id)handleSwitcherDropEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  id v4 = a3;
  id v5 = [(SBSwitcherModifier *)&v8 handleSwitcherDropEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 == 1) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4 = a3;
  id v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  v9.receiver = self;
  v9.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  uint64_t v6 = [(SBSwitcherModifier *)&v9 handleSceneReadyEvent:v4];

  objc_super v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v5 toResponse:v6];

  return v7;
}

- (id)handleGestureEvent:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  uint64_t v6 = [(SBGestureSwitcherModifier *)&v30 handleGestureEvent:v5];
  objc_super v7 = [v5 gestureID];
  char v8 = [v7 isEqual:self->_gestureID];

  if (v8)
  {
    id v9 = v5;
    if (!v9)
    {
      v29 = [MEMORY[0x1E4F28B00] currentHandler];
      [v29 handleFailureInMethod:a2 object:self file:@"SBCardDragAndDropGestureSwitcherModifier.m" lineNumber:318 description:@"Found invalid modifier event."];
    }
    self->_gestureEnded = [v9 phase] == 3;
    objc_super v10 = [v9 switcherDropRegionContext];
    dropRegionContext = self->_dropRegionContext;
    self->_dropRegionContext = v10;

    self->_unint64_t currentDropRegion = [(SBSwitcherDropRegionContext *)self->_dropRegionContext currentDropRegion];
    BOOL v12 = [v9 selectedAppLayout];
    draggingAppLayout = self->_draggingAppLayout;
    self->_draggingAppLayout = v12;

    int64_t v14 = [v9 draggedSceneLayoutRole];
    self->_draggingLayoutRole = v14;
    objc_super v15 = [(SBAppLayout *)self->_draggingAppLayout leafAppLayoutForRole:v14];
    draggingLeafAppLayout = self->_draggingLeafAppLayout;
    self->_draggingLeafAppLayout = v15;

    double v17 = [(SBSwitcherDropRegionContext *)self->_dropRegionContext intersectingAppLayout];
    if (v17)
    {
    }
    else
    {
      intersectingAppLayout = self->_intersectingAppLayout;
      if (intersectingAppLayout) {
        objc_storeStrong((id *)&self->_previouslyIntersectingAppLayout, intersectingAppLayout);
      }
    }
    double v19 = [(SBSwitcherDropRegionContext *)self->_dropRegionContext intersectingAppLayout];
    double v20 = self->_intersectingAppLayout;
    self->_intersectingAppLayout = v19;

    int64_t v21 = [(SBSwitcherDropRegionContext *)self->_dropRegionContext intersectingLayoutRole];
    self->_intersectingLayoutRole = v21;
    v22 = [(SBAppLayout *)self->_intersectingAppLayout leafAppLayoutForRole:v21];
    intersectingLeafAppLayout = self->_intersectingLeafAppLayout;
    self->_intersectingLeafAppLayout = v22;

    [v9 translationInContainerView];
    self->_translation.double x = v24;
    self->_translation.double y = v25;
    [v9 locationInContainerView];
    self->_location.double x = v26;
    self->_location.double y = v27;
  }
  if (self->_gestureEnded && !self->_dropModifier) {
    [(SBChainableModifier *)self setState:1];
  }

  return v6;
}

- (CGRect)fullyPresentedFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  [(SBCardDragAndDropGestureSwitcherModifier *)self containerViewBounds];
  -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight = a5.topRight;
  double bottomRight = a5.bottomRight;
  double bottomLeft = a5.bottomLeft;
  double topLeft = a5.topLeft;
  id v11 = a4;
  double v12 = v11;
  if (self->_currentDropRegion != 7
    && (([v11 isOrContainsAppLayout:self->_intersectingAppLayout] & 1) != 0
     || [v12 isOrContainsAppLayout:self->_draggingAppLayout]))
  {
    double v13 = [(SBCardDragAndDropGestureSwitcherModifier *)self appLayouts];
    v31.receiver = self;
    v31.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
    -[SBCardDragAndDropGestureSwitcherModifier cornerRadiiForIndex:](&v31, sel_cornerRadiiForIndex_, [v13 indexOfObject:v12]);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
    -[SBCardDragAndDropGestureSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v30, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, a3, v12, topLeft, bottomLeft, bottomRight, topRight);
    double v15 = v22;
    double v17 = v23;
    double v19 = v24;
    double v21 = v25;
  }

  double v26 = v15;
  double v27 = v17;
  double v28 = v19;
  double v29 = v21;
  result.double topRight = v29;
  result.double bottomRight = v28;
  result.double bottomLeft = v27;
  result.double topLeft = v26;
  return result;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  id v5 = [(SBCardDragAndDropGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  double v7 = 0.0;
  if (([v6 isOrContainsAppLayout:self->_draggingAppLayout] & 1) == 0)
  {
    if ((self->_currentDropRegion & 0xFFFFFFFFFFFFFFFELL) == 6
      || ![v6 isOrContainsAppLayout:self->_intersectingAppLayout]
      || ([(SBAppLayout *)self->_intersectingAppLayout itemForLayoutRole:1],
          double v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = [(SBCardDragAndDropGestureSwitcherModifier *)self displayItemSupportsMedusa:v8], v8, (v9 & 1) == 0))
    {
      v12.receiver = self;
      v12.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
      [(SBCardDragAndDropGestureSwitcherModifier *)&v12 titleAndIconOpacityForIndex:a3];
      double v7 = v10;
    }
  }

  return v7;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = [(SBCardDragAndDropGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  double v8 = v7;
  if (self->_draggingAppLayout) {
    objc_msgSend(v7, "addObject:");
  }
  if (self->_intersectingAppLayout) {
    objc_msgSend(v8, "addObject:");
  }
  if (self->_previouslyIntersectingAppLayout) {
    objc_msgSend(v8, "addObject:");
  }
  char v9 = [(SBSwitcherDropRegionContext *)self->_dropRegionContext remainingAppLayout];

  if (v9)
  {
    double v10 = [(SBSwitcherDropRegionContext *)self->_dropRegionContext remainingAppLayout];
    [v8 addObject:v10];
  }
  id v11 = [(SBSwitcherDropRegionContext *)self->_dropRegionContext evictedAppLayout];

  if (v11)
  {
    objc_super v12 = [(SBSwitcherDropRegionContext *)self->_dropRegionContext evictedAppLayout];
    [v8 addObject:v12];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v8;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v13);
        }
        if (objc_msgSend(v6, "isOrContainsAppLayout:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18))
        {
          LOBYTE(v14) = 1;
          goto LABEL_21;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  return v14;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = (SBAppLayout *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  id v5 = [(SBGestureSwitcherModifier *)&v11 animationAttributesForLayoutElement:v4];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [(SBCardDragAndDropGestureSwitcherModifier *)self medusaSettings];
  double v8 = [v7 resizeAnimationSettings];

  [v6 setLayoutSettings:v8];
  [v6 setPositionSettings:v8];
  [v6 setScaleSettings:v8];
  [v6 setCornerRadiusSettings:v8];
  [v6 setUpdateMode:3];
  if (self->_isScrolling
    && self->_intersectingAppLayout == v4
    && [(SBAppLayout *)self->_draggingAppLayout isOrContainsAppLayout:v4])
  {
    char v9 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    [v8 response];
    objc_msgSend(v9, "setResponse:");
    [v9 setDampingRatio:1.0];
    CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
    [v6 setLayoutSettings:v9];
    [v6 setPositionSettings:v9];
    [v6 setScaleSettings:v9];
    [v6 setPositionUpdateMode:3];
    [v6 setLayoutUpdateMode:3];
    [v6 setOpacityUpdateMode:3];
    [v6 setScaleUpdateMode:3];
    [v6 setCornerRadiusUpdateMode:3];
    [v6 setTitleAndIconOpacityUpdateMode:3];
  }
  return v6;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  id v5 = [(SBCardDragAndDropGestureSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_draggingAppLayout || v6 == self->_intersectingAppLayout)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
    BOOL v7 = [(SBCardDragAndDropGestureSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (BOOL)isHitTestBlockingViewVisible
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropModifier, 0);
  objc_storeStrong((id *)&self->_dropRegionContext, 0);
  objc_storeStrong((id *)&self->_gestureID, 0);
  objc_storeStrong((id *)&self->_previouslyIntersectingAppLayout, 0);
  objc_storeStrong((id *)&self->_intersectingLeafAppLayout, 0);
  objc_storeStrong((id *)&self->_intersectingAppLayout, 0);
  objc_storeStrong((id *)&self->_draggingLeafAppLayout, 0);
  objc_storeStrong((id *)&self->_draggingAppLayout, 0);
}

@end