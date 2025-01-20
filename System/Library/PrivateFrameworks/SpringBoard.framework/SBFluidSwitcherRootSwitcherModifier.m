@interface SBFluidSwitcherRootSwitcherModifier
- (id)_handleEvent:(id)a3;
- (id)_highlightModifierKeyForAppLayout:(id)a3;
- (id)_reduceMotionModifier;
- (id)_swipeToKillModifierKeyForAppLayout:(id)a3;
- (id)floorModifier;
- (id)floorModifierForGestureEvent:(id)a3;
- (id)floorModifierForTransitionEvent:(id)a3;
- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3;
- (id)gestureModifierForGestureEvent:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleHighlightEvent:(id)a3;
- (id)handleInsertionEvent:(id)a3;
- (id)handleReduceMotionChangedEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleScrollEvent:(id)a3;
- (id)handleSwipeToKillEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)handleUpdateFocusedAppLayoutEvent:(id)a3;
- (id)highlightModifierForHighlightEvent:(id)a3;
- (id)insertionModifierForInsertionEvent:(id)a3;
- (id)lowEndHardwareModifier;
- (id)multitaskingModifier;
- (id)multitaskingModifierForEvent:(id)a3;
- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3;
- (id)removalModifierForRemovalEvent:(id)a3;
- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5;
- (id)shelfModifierForTransitionEvent:(id)a3;
- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3;
- (id)transientlyVisibleSlideOverTongueModifier;
- (id)transientlyVisibleSlideOverTongueModifierForEvent:(id)a3;
- (id)transitionModifierForInlineTransitionEvent:(id)a3;
- (id)transitionModifierForMainTransitionEvent:(id)a3;
- (id)userScrollingModifierForScrollEvent:(id)a3;
- (int64_t)switcherModifierLevelForTransitionEvent:(id)a3;
- (void)_setup;
- (void)_updateFloorModifierWithGestureEvent:(id)a3;
- (void)_updateFloorModifierWithProposedFloorModifier:(id)a3;
- (void)_updateFloorModifierWithTransitionEvent:(id)a3;
- (void)_updateLowEndHardwareModifier;
- (void)_updateMultitaskingModifierWithEvent:(id)a3;
- (void)_updateReduceMotionModifierWithReduceMotionChangedEvent:(id)a3;
- (void)_updateTransientlyVisibleSlideOverTongueModifierWithEvent:(id)a3;
- (void)didMoveToParentModifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)verifyInternalIntegrityAfterHandlingEvent:(id)a3;
@end

@implementation SBFluidSwitcherRootSwitcherModifier

void __81__SBFluidSwitcherRootSwitcherModifier_verifyInternalIntegrityAfterHandlingEvent___block_invoke(void *a1, void *a2)
{
  id v8 = a2;
  if ([v8 state] == 1)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a1[8], a1[4], @"SBFluidSwitcherRootSwitcherModifier.m", 420, @"Failed modifier stack coherency check. %@ is Complete after handling event: %@.", v8, a1[5] object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v3 = *(void *)(a1[6] + 8);
    if (*(unsigned char *)(v3 + 24))
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a1[8], a1[4], @"SBFluidSwitcherRootSwitcherModifier.m", 424, @"Failed modifier stack coherency check. Should have at most one gesture modifier after handling event: %@", a1[5] object file lineNumber description];

      uint64_t v3 = *(void *)(a1[6] + 8);
    }
    *(unsigned char *)(v3 + 24) = 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *(void *)(a1[7] + 8);
    if (*(unsigned char *)(v4 + 24))
    {
      v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:a1[8], a1[4], @"SBFluidSwitcherRootSwitcherModifier.m", 430, @"Failed modifier stack coherency check. Should have at most one transition modifier after handling event: %@", a1[5] object file lineNumber description];

      uint64_t v4 = *(void *)(a1[7] + 8);
    }
    *(unsigned char *)(v4 + 24) = 1;
  }
}

- (void)verifyInternalIntegrityAfterHandlingEvent:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  [(SBChainableModifier *)&v21 verifyInternalIntegrityAfterHandlingEvent:v5];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__SBFluidSwitcherRootSwitcherModifier_verifyInternalIntegrityAfterHandlingEvent___block_invoke;
  v12[3] = &unk_1E6B02E68;
  SEL v16 = a2;
  v12[4] = self;
  id v6 = v5;
  id v13 = v6;
  v14 = v19;
  v15 = v17;
  [(SBChainableModifier *)self enumerateChildModifiersWithBlock:v12];
  if ([v6 type] == 14)
  {
    id v7 = v6;
    id v8 = [v7 appLayout];
    v9 = [(SBFluidSwitcherRootSwitcherModifier *)self _swipeToKillModifierKeyForAppLayout:v8];
    v10 = [(SBChainableModifier *)self childModifierByKey:v9];

    if (v10)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherRootSwitcherModifier.m" lineNumber:439 description:@"Failed modifier stack coherency check. Should not have a swipe to kill modifier for this app layout at this point."];
    }
  }

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

- (id)_handleEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  id v4 = a3;
  id v5 = [(SBSwitcherModifier *)&v7 _handleEvent:v4];
  -[SBFluidSwitcherRootSwitcherModifier _updateTransientlyVisibleSlideOverTongueModifierWithEvent:](self, "_updateTransientlyVisibleSlideOverTongueModifierWithEvent:", v4, v7.receiver, v7.super_class);

  return v5;
}

- (void)_updateTransientlyVisibleSlideOverTongueModifierWithEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = [(SBFluidSwitcherRootSwitcherModifier *)self transientlyVisibleSlideOverTongueModifierForEvent:a3];
  if (v4)
  {
    id v5 = [(SBChainableModifier *)self childModifierByKey:@"Fluid Switcher Transiently Visible Slide Over Tongue Modifier"];
    if (v5) {
      [(SBChainableModifier *)self removeChildModifier:v5];
    }
    [(SBChainableModifier *)self addChildModifier:v4 atLevel:3 key:@"Fluid Switcher Transiently Visible Slide Over Tongue Modifier"];
    id v6 = SBLogAppSwitcher();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_super v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      v9 = [v4 succinctDescription];
      int v10 = 138412546;
      v11 = v8;
      __int16 v12 = 2112;
      id v13 = v9;
      _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "[%@] Updated transiently visible slide over tongue modifier to %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (id)transientlyVisibleSlideOverTongueModifierForEvent:(id)a3
{
  return 0;
}

- (id)handleTransitionEvent:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  id v5 = [(SBSwitcherModifier *)&v21 handleTransitionEvent:v4];
  [(SBFluidSwitcherRootSwitcherModifier *)self _updateMultitaskingModifierWithEvent:v4];
  unint64_t v6 = [v4 phase];
  if (v6 >= 2)
  {
    if (v6 != 2 && ([v4 isAnimated] & 1) != 0) {
      goto LABEL_9;
    }
LABEL_8:
    [(SBFluidSwitcherRootSwitcherModifier *)self _updateFloorModifierWithTransitionEvent:v4];
    goto LABEL_9;
  }
  if (v6 == 1
    && (([v4 isDragAndDropTransition] & 1) != 0
     || [v4 isAnySplitViewToOrFromSlideOverEvent]))
  {
    goto LABEL_8;
  }
LABEL_9:
  if ([v4 phase] == 2 || (objc_msgSend(v4, "isAnimated") & 1) == 0)
  {
    objc_super v7 = [(SBFluidSwitcherRootSwitcherModifier *)self shelfModifierForTransitionEvent:v4];
    id v8 = v7;
    if (v7)
    {
      v9 = [v7 shelf];
      int v10 = [v9 uniqueIdentifier];
      [(SBChainableModifier *)self addChildModifier:v8 atLevel:4 key:v10];
    }
  }
  if ([v4 phase] == 1 && (objc_msgSend(v4, "isHandled") & 1) == 0)
  {
    v11 = [(SBFluidSwitcherRootSwitcherModifier *)self transitionModifierForMainTransitionEvent:v4];
    int64_t v12 = [(SBFluidSwitcherRootSwitcherModifier *)self switcherModifierLevelForTransitionEvent:v4];
    if (v11)
    {
      [(SBChainableModifier *)self addChildModifier:v11 atLevel:v12 key:0];
      id v13 = SBLogAppSwitcher();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        SEL v16 = [v11 succinctDescription];
        *(_DWORD *)buf = 138412546;
        v23 = v15;
        __int16 v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_1D85BA000, v13, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for transition %@.", buf, 0x16u);
      }
      if (objc_opt_respondsToSelector())
      {
        v17 = [v11 consumedPreludeToken];
        if (v17)
        {
          char v18 = [[SBConsumedPreludeAnimationTokenSwitcherEventResponse alloc] initWithPreludeToken:v17];
          uint64_t v19 = SBAppendSwitcherModifierResponse(v18, v5);

          id v5 = (void *)v19;
        }
      }
    }
  }
  return v5;
}

- (void)_updateFloorModifierWithTransitionEvent:(id)a3
{
  uint64_t v5 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifierForTransitionEvent:a3];
  id v7 = (id)v5;
  if (!v5)
  {
    unint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherRootSwitcherModifier.m" lineNumber:445 description:@"A floor modifier is required"];

    uint64_t v5 = 0;
  }
  [(SBFluidSwitcherRootSwitcherModifier *)self _updateFloorModifierWithProposedFloorModifier:v5];
}

- (void)_updateFloorModifierWithProposedFloorModifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
  uint64_t v6 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];
  if ((id)v6 != v4)
  {
    id v7 = (void *)v6;
    if (v6 && (id)v6 != v5) {
      [(SBChainableModifier *)self removeChildModifier:v6];
    }
    id v8 = v4;

    if (v5 != v8) {
      [(SBChainableModifier *)self addChildModifier:v8 atLevel:6 key:@"Fluid Switcher Floor Modifier"];
    }
    v9 = SBLogAppSwitcher();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int64_t v12 = [v8 succinctDescription];
      int v13 = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      SEL v16 = v12;
      _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "[%@] Updated floor modifier to %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (void)_updateMultitaskingModifierWithEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
  uint64_t v6 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifierForEvent:v4];

  if (!v6 || v6 == v5)
  {
    id v7 = v5;
  }
  else
  {
    if (v5) {
      [(SBChainableModifier *)self removeChildModifier:v5];
    }
    id v7 = v6;

    [(SBChainableModifier *)self addChildModifier:v7 atLevel:7 key:@"Fluid Switcher Multitasking Modifier"];
    id v8 = SBLogAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      int v10 = NSStringFromClass(v9);
      v11 = [v7 succinctDescription];
      int v12 = 138412546;
      int v13 = v10;
      __int16 v14 = 2112;
      __int16 v15 = v11;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "[%@] Updated multitasking modifier to %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (id)multitaskingModifier
{
  return [(SBChainableModifier *)self childModifierByKey:@"Fluid Switcher Multitasking Modifier"];
}

- (id)floorModifier
{
  uint64_t v3 = [(SBChainableModifier *)self childModifierByKey:@"Fluid Switcher Floor Modifier"];
  if (!v3)
  {
    uint64_t v3 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
  }
  return v3;
}

- (int64_t)switcherModifierLevelForTransitionEvent:(id)a3
{
  return 3;
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  id v5 = [(SBChainableModifier *)&v7 handleEvent:v4];

  kdebug_trace();
  return v5;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
  if (v11 != v9)
  {

LABEL_3:
    v18.receiver = self;
    v18.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
    int v12 = [(SBChainableModifier *)&v18 responseForProposedChildResponse:v8 childModifier:v9 event:v10];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __92__SBFluidSwitcherRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
    void v17[3] = &unk_1E6AFAF20;
    v17[4] = self;
    int v13 = [v12 responseByTransformingResponseWithTransformer:v17];

    goto LABEL_6;
  }
  __int16 v14 = [(SBFluidSwitcherRootSwitcherModifier *)self multitaskingModifier];
  __int16 v15 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifier];

  if (v14 == v15) {
    goto LABEL_3;
  }
  int v13 = 0;
LABEL_6:

  return v13;
}

id __92__SBFluidSwitcherRootSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == 31)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = v3;
    uint64_t v6 = [v5 modifier];
    uint64_t v7 = [v5 level];
    id v8 = [v5 key];

    [v4 addChildModifier:v6 atLevel:v7 key:v8];
    id v9 = 0;
  }
  else
  {
    id v9 = v3;
  }

  return v9;
}

- (void)setDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBChainableModifier setDelegate:](&v5, sel_setDelegate_);
  if (a3)
  {
    if (!*(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1))
    {
      *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1) = 1;
      [(SBFluidSwitcherRootSwitcherModifier *)self _setup];
    }
  }
}

- (void)didMoveToParentModifier:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v5, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!*(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1))
    {
      *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1) = 1;
      [(SBFluidSwitcherRootSwitcherModifier *)self _setup];
    }
  }
}

- (void)_setup
{
  [(SBFluidSwitcherRootSwitcherModifier *)self _updateMultitaskingModifierWithEvent:0];
  [(SBFluidSwitcherRootSwitcherModifier *)self _updateFloorModifierWithTransitionEvent:0];
  [(SBFluidSwitcherRootSwitcherModifier *)self _updateReduceMotionModifierWithReduceMotionChangedEvent:0];
  [(SBFluidSwitcherRootSwitcherModifier *)self _updateLowEndHardwareModifier];
}

- (id)handleGestureEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v12 handleGestureEvent:v4];
  if ([v4 phase] == 1)
  {
    [(SBFluidSwitcherRootSwitcherModifier *)self _updateFloorModifierWithGestureEvent:v4];
    if (([v4 isHandled] & 1) == 0)
    {
      uint64_t v6 = [(SBFluidSwitcherRootSwitcherModifier *)self gestureModifierForGestureEvent:v4];
      if (v6)
      {
        [(SBChainableModifier *)self addChildModifier:v6 atLevel:3 key:0];
        uint64_t v7 = SBLogAppSwitcher();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          id v8 = (objc_class *)objc_opt_class();
          id v9 = NSStringFromClass(v8);
          id v10 = [v6 succinctDescription];
          *(_DWORD *)buf = 138412546;
          __int16 v14 = v9;
          __int16 v15 = 2112;
          uint64_t v16 = v10;
          _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for gesture %@.", buf, 0x16u);
        }
      }
    }
  }
  else if (-[SBFluidSwitcherRootSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled")&& [v4 isWindowDragGestureEvent])
  {
    [(SBFluidSwitcherRootSwitcherModifier *)self _updateFloorModifierWithGestureEvent:v4];
  }

  return v5;
}

- (id)handleReduceMotionChangedEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  id v4 = a3;
  objc_super v5 = [(SBSwitcherModifier *)&v7 handleReduceMotionChangedEvent:v4];
  -[SBFluidSwitcherRootSwitcherModifier _updateMultitaskingModifierWithEvent:](self, "_updateMultitaskingModifierWithEvent:", v4, v7.receiver, v7.super_class);
  [(SBFluidSwitcherRootSwitcherModifier *)self _updateReduceMotionModifierWithReduceMotionChangedEvent:v4];

  return v5;
}

- (id)handleSwipeToKillEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v14 handleSwipeToKillEvent:v4];
  uint64_t v6 = [v4 appLayout];
  if (v6)
  {
    objc_super v7 = [(SBFluidSwitcherRootSwitcherModifier *)self _swipeToKillModifierKeyForAppLayout:v6];
    id v8 = [(SBChainableModifier *)self childModifierByKey:v7];
    if (!v8)
    {
      [v4 progress];
      if (BSFloatIsZero())
      {
        id v8 = 0;
      }
      else
      {
        id v8 = [(SBFluidSwitcherRootSwitcherModifier *)self swipeToKillModifierForSwipeToKillEvent:v4];
        if (v8)
        {
          [(SBChainableModifier *)self addChildModifier:v8 atLevel:3 key:v7];
          id v9 = SBLogAppSwitcher();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            id v10 = (objc_class *)objc_opt_class();
            id v11 = NSStringFromClass(v10);
            objc_super v12 = [v8 succinctDescription];
            *(_DWORD *)buf = 138412546;
            uint64_t v16 = v11;
            __int16 v17 = 2112;
            objc_super v18 = v12;
            _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for swipe to kill %@.", buf, 0x16u);
          }
        }
      }
    }
  }
  return v5;
}

- (id)handleHighlightEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v16 handleHighlightEvent:v4];
  uint64_t v6 = [v4 appLayout];
  if (v6)
  {
    objc_super v7 = [v4 appLayout];
    id v8 = objc_msgSend(v7, "leafAppLayoutForRole:", objc_msgSend(v4, "layoutRole"));

    id v9 = [(SBFluidSwitcherRootSwitcherModifier *)self _highlightModifierKeyForAppLayout:v8];
    if (![v4 phase])
    {
      id v10 = [(SBFluidSwitcherRootSwitcherModifier *)self highlightModifierForHighlightEvent:v4];
      if (v10)
      {
        [(SBChainableModifier *)self addChildModifier:v10 atLevel:3 key:v9];
        id v11 = SBLogAppSwitcher();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_super v12 = (objc_class *)objc_opt_class();
          int v13 = NSStringFromClass(v12);
          objc_super v14 = [v10 succinctDescription];
          *(_DWORD *)buf = 138412546;
          objc_super v18 = v13;
          __int16 v19 = 2112;
          char v20 = v14;
          _os_log_impl(&dword_1D85BA000, v11, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for highlight %@.", buf, 0x16u);
        }
      }
    }
  }

  return v5;
}

- (id)handleInsertionEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v12 handleInsertionEvent:v4];
  if ([v4 phase] == 1)
  {
    uint64_t v6 = [(SBFluidSwitcherRootSwitcherModifier *)self insertionModifierForInsertionEvent:v4];
    if (v6)
    {
      [(SBChainableModifier *)self addChildModifier:v6 atLevel:3 key:0];
      objc_super v7 = SBLogAppSwitcher();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = [v6 succinctDescription];
        *(_DWORD *)buf = 138412546;
        objc_super v14 = v9;
        __int16 v15 = 2112;
        objc_super v16 = v10;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for insertion %@.", buf, 0x16u);
      }
    }
  }
  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v12 handleRemovalEvent:v4];
  if ([v4 phase] == 1)
  {
    uint64_t v6 = [(SBFluidSwitcherRootSwitcherModifier *)self removalModifierForRemovalEvent:v4];
    if (v6)
    {
      [(SBChainableModifier *)self addChildModifier:v6 atLevel:3 key:0];
      objc_super v7 = SBLogAppSwitcher();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        id v10 = [v6 succinctDescription];
        *(_DWORD *)buf = 138412546;
        objc_super v14 = v9;
        __int16 v15 = 2112;
        objc_super v16 = v10;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for removal %@.", buf, 0x16u);
      }
    }
  }
  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v12 handleScrollEvent:v4];
  if (![v4 phase] && objc_msgSend(v4, "isUserInitiated"))
  {
    uint64_t v6 = [(SBChainableModifier *)self childModifierByKey:@"UserScrollingModifier"];
    if (!v6)
    {
      uint64_t v6 = [(SBFluidSwitcherRootSwitcherModifier *)self userScrollingModifierForScrollEvent:v4];
      if (v6)
      {
        [(SBChainableModifier *)self addChildModifier:v6 atLevel:3 key:@"UserScrollingModifier"];
        objc_super v7 = SBLogAppSwitcher();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          id v8 = (objc_class *)objc_opt_class();
          id v9 = NSStringFromClass(v8);
          id v10 = [v6 succinctDescription];
          *(_DWORD *)buf = 138412546;
          objc_super v14 = v9;
          __int16 v15 = 2112;
          objc_super v16 = v10;
          _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for scroll %@.", buf, 0x16u);
        }
      }
    }
  }
  return v5;
}

- (id)handleUpdateFocusedAppLayoutEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBFluidSwitcherRootSwitcherModifier;
  objc_super v5 = [(SBSwitcherModifier *)&v14 handleUpdateFocusedAppLayoutEvent:v4];
  uint64_t v6 = [v4 appLayout];
  if (v6)
  {
    objc_super v7 = objc_msgSend(NSString, "stringWithFormat:", @"FocusedAppModifier-%p", v6);
    id v8 = [(SBChainableModifier *)self childModifierByKey:v7];
    if (!v8)
    {
      if ([v4 isFocused])
      {
        id v8 = [(SBFluidSwitcherRootSwitcherModifier *)self focusedAppModifierForUpdateFocusedAppLayoutEvent:v4];
        if (v8)
        {
          [(SBChainableModifier *)self addChildModifier:v8 atLevel:3 key:v7];
          id v9 = SBLogAppSwitcher();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            id v10 = (objc_class *)objc_opt_class();
            id v11 = NSStringFromClass(v10);
            objc_super v12 = [v8 succinctDescription];
            *(_DWORD *)buf = 138412546;
            objc_super v16 = v11;
            __int16 v17 = 2112;
            objc_super v18 = v12;
            _os_log_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEFAULT, "[%@] Adding child modifier for focusedApp %@.", buf, 0x16u);
          }
        }
      }
      else
      {
        id v8 = 0;
      }
    }
  }
  return v5;
}

- (id)floorModifierForTransitionEvent:(id)a3
{
  return 0;
}

- (id)floorModifierForGestureEvent:(id)a3
{
  return 0;
}

- (id)multitaskingModifierForEvent:(id)a3
{
  return 0;
}

- (id)gestureModifierForGestureEvent:(id)a3
{
  return 0;
}

- (id)transitionModifierForMainTransitionEvent:(id)a3
{
  return 0;
}

- (id)transitionModifierForInlineTransitionEvent:(id)a3
{
  return 0;
}

- (id)reduceMotionModifierForReduceMotionChangedEvent:(id)a3
{
  return 0;
}

- (id)insertionModifierForInsertionEvent:(id)a3
{
  return 0;
}

- (id)swipeToKillModifierForSwipeToKillEvent:(id)a3
{
  return 0;
}

- (id)highlightModifierForHighlightEvent:(id)a3
{
  return 0;
}

- (id)removalModifierForRemovalEvent:(id)a3
{
  return 0;
}

- (id)lowEndHardwareModifier
{
  return 0;
}

- (id)userScrollingModifierForScrollEvent:(id)a3
{
  return 0;
}

- (id)shelfModifierForTransitionEvent:(id)a3
{
  return 0;
}

- (id)focusedAppModifierForUpdateFocusedAppLayoutEvent:(id)a3
{
  return 0;
}

- (id)transientlyVisibleSlideOverTongueModifier
{
  return [(SBChainableModifier *)self childModifierByKey:@"Fluid Switcher Transiently Visible Slide Over Tongue Modifier"];
}

- (void)_updateFloorModifierWithGestureEvent:(id)a3
{
  uint64_t v5 = [(SBFluidSwitcherRootSwitcherModifier *)self floorModifierForGestureEvent:a3];
  id v7 = (id)v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBFluidSwitcherRootSwitcherModifier.m" lineNumber:451 description:@"A floor modifier is required"];

    uint64_t v5 = 0;
  }
  [(SBFluidSwitcherRootSwitcherModifier *)self _updateFloorModifierWithProposedFloorModifier:v5];
}

- (void)_updateReduceMotionModifierWithReduceMotionChangedEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SBFluidSwitcherRootSwitcherModifier *)self _reduceMotionModifier];
  uint64_t v6 = [(SBFluidSwitcherRootSwitcherModifier *)self reduceMotionModifierForReduceMotionChangedEvent:v4];
  id v7 = (void *)v6;
  if (v6 && v5 != (void *)v6)
  {
    [(SBChainableModifier *)self removeChildModifier:v5];
    [(SBChainableModifier *)self addChildModifier:v7 atLevel:1 key:@"Fluid Switcher Reduce Motion Modifier"];
    id v8 = SBLogAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v7 succinctDescription];
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      int v13 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "[Fluid Switcher Root] Handled reduce motion changed event %@ by adding child modifier %@.", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_updateLowEndHardwareModifier
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(SBFluidSwitcherRootSwitcherModifier *)self lowEndHardwareModifier];
  if (v3)
  {
    uint64_t v4 = [(SBChainableModifier *)self childModifierByKey:@"Fluid Switcher Low End Hardware Modifier"];
    uint64_t v5 = (void *)v4;
    if (v4 && (void *)v4 != v3)
    {
      [(SBChainableModifier *)self removeChildModifier:v4];
      uint64_t v6 = SBLogAppSwitcher();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [v5 succinctDescription];
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_1D85BA000, v6, OS_LOG_TYPE_INFO, "[Fluid Switcher Root] Removed low end hardware modifier: %@.", (uint8_t *)&v10, 0xCu);
      }
    }
    [(SBChainableModifier *)self addChildModifier:v3 atLevel:0 key:@"Fluid Switcher Low End Hardware Modifier"];
    id v8 = SBLogAppSwitcher();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v3 succinctDescription];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_INFO, "[Fluid Switcher Root] Added low end hardware modifier: %@.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (id)_swipeToKillModifierKeyForAppLayout:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"SwipeToKill-%p", a3);
}

- (id)_highlightModifierKeyForAppLayout:(id)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Highlight-%p", a3);
}

- (id)_reduceMotionModifier
{
  return [(SBChainableModifier *)self childModifierByKey:@"Fluid Switcher Reduce Motion Modifier"];
}

@end