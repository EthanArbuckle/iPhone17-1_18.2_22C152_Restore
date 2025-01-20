@interface SBDragAndDropGestureRootSwitcherModifier
- (SBDragAndDropGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 floatingSwitcherVisible:(BOOL)a4 fullScreenAppLayout:(id)a5;
- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4;
- (id)handleSwitcherDropEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4;
- (int64_t)gestureType;
@end

@implementation SBDragAndDropGestureRootSwitcherModifier

- (SBDragAndDropGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 floatingSwitcherVisible:(BOOL)a4 fullScreenAppLayout:(id)a5
{
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBDragAndDropGestureRootSwitcherModifier;
  v11 = [(SBGestureRootSwitcherModifier *)&v14 initWithStartingEnvironmentMode:a3];
  if (v11)
  {
    if (a3 == 3 && !v10)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v11, @"SBDragAndDropGestureRootSwitcherModifier.m", 33, @"Invalid parameter not satisfying: %@", @"fullScreenAppLayout" object file lineNumber description];
    }
    v11->_floatingSwitcherVisible = a4;
    objc_storeStrong((id *)&v11->_fullScreenAppLayout, a5);
  }

  return v11;
}

- (int64_t)gestureType
{
  return 6;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5 = a3;
  int64_t v6 = [(SBGestureRootSwitcherModifier *)self currentEnvironmentMode];
  if (v6 == 2)
  {
    id v10 = [SBCardDragAndDropGestureSwitcherModifier alloc];
    v8 = [v5 gestureID];
    uint64_t v9 = [(SBCardDragAndDropGestureSwitcherModifier *)v10 initWithGestureID:v8];
    goto LABEL_5;
  }
  if (v6 == 3)
  {
    v7 = [SBAppDragAndDropGestureSwitcherModifier alloc];
    v8 = [v5 gestureID];
    uint64_t v9 = [(SBAppDragAndDropGestureSwitcherModifier *)v7 initWithGestureID:v8 floatingSwitcherVisible:self->_floatingSwitcherVisible fullScreenAppLayout:self->_fullScreenAppLayout];
LABEL_5:
    v11 = (void *)v9;

    goto LABEL_7;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)handleSwitcherDropEvent:(id)a3
{
  id v4 = a3;
  if ([v4 phase] == 1)
  {
    id v5 = [SBCardDropSwitcherModifier alloc];
    int64_t v6 = [v4 context];
    v7 = [(SBCardDropSwitcherModifier *)v5 initWithDropContext:v6];

    [(SBChainableModifier *)self addChildModifier:v7];
  }
  v10.receiver = self;
  v10.super_class = (Class)SBDragAndDropGestureRootSwitcherModifier;
  v8 = [(SBSwitcherModifier *)&v10 handleSwitcherDropEvent:v4];

  return v8;
}

- (id)handleTransitionEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBDragAndDropGestureRootSwitcherModifier;
  id v3 = a3;
  id v4 = [(SBGestureRootSwitcherModifier *)&v10 handleTransitionEvent:v3];
  id v5 = NSString;
  int64_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [v5 stringWithFormat:@"%@ handling drag and drop initiated transition.", v7];
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