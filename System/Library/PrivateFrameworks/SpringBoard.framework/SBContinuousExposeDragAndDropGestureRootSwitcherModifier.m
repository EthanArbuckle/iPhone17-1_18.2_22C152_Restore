@interface SBContinuousExposeDragAndDropGestureRootSwitcherModifier
- (SBContinuousExposeDragAndDropGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 appLayout:(id)a4;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)handleTransitionEvent:(id)a3;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
@end

@implementation SBContinuousExposeDragAndDropGestureRootSwitcherModifier

- (SBContinuousExposeDragAndDropGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 appLayout:(id)a4
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposeDragAndDropGestureRootSwitcherModifier;
  v9 = [(SBGestureRootSwitcherModifier *)&v12 initWithStartingEnvironmentMode:a3];
  if (v9)
  {
    if (a3 == 3 && !v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"SBContinuousExposeDragAndDropGestureRootSwitcherModifier.m", 29, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_appLayout, a4);
  }

  return v9;
}

- (int64_t)gestureType
{
  return 6;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5 = a3;
  if ([(SBGestureRootSwitcherModifier *)self currentEnvironmentMode] == 3)
  {
    v6 = +[SBAppSwitcherDomain rootSettings];
    v7 = [v6 chamoisSettings];
    unint64_t v8 = [v7 maximumNumberOfAppsOnStage];

    v9 = [(SBAppLayout *)self->_appLayout allItems];
    unint64_t v10 = [v9 count];

    if (v10 >= v8)
    {
      v13 = [(SBAppLayout *)self->_appLayout allItems];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __121__SBContinuousExposeDragAndDropGestureRootSwitcherModifier_gestureChildModifierForGestureEvent_activeTransitionModifier___block_invoke;
      v18[3] = &unk_1E6B00710;
      v18[4] = self;
      v14 = [v13 sortedArrayUsingComparator:v18];

      v11 = [v14 firstObject];
    }
    else
    {
      v11 = 0;
    }
    v15 = [SBContinuousExposeAppDragAndDropGestureSwitcherModifier alloc];
    v16 = [v5 gestureID];
    objc_super v12 = [(SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)v15 initWithGestureID:v16 appLayout:self->_appLayout displayItemThatWouldBeEvicted:v11];
  }
  else
  {
    objc_super v12 = 0;
  }

  return v12;
}

uint64_t __121__SBContinuousExposeDragAndDropGestureRootSwitcherModifier_gestureChildModifierForGestureEvent_activeTransitionModifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 128);
  id v6 = a3;
  v7 = [v5 layoutAttributesForItem:a2];
  uint64_t v8 = [v7 lastInteractionTime];

  v9 = [*(id *)(*(void *)(a1 + 32) + 128) layoutAttributesForItem:v6];

  uint64_t v10 = [v9 lastInteractionTime];
  v11 = [NSNumber numberWithInteger:v8];
  objc_super v12 = [NSNumber numberWithInteger:v10];
  uint64_t v13 = [v11 compare:v12];

  return v13;
}

- (id)handleTransitionEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBContinuousExposeDragAndDropGestureRootSwitcherModifier;
  id v3 = a3;
  v4 = [(SBGestureRootSwitcherModifier *)&v10 handleTransitionEvent:v3];
  id v5 = NSString;
  id v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  uint64_t v8 = [v5 stringWithFormat:@"%@ handling drag and drop initiated transition.", v7];
  [v3 handleWithReason:v8];

  return v4;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
}

@end