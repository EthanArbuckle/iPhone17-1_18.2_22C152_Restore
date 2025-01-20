@interface SBTransitionSwitcherModifierRemovalContext
- (SBDisplayItem)displayItem;
- (SBTransitionSwitcherModifierRemovalContext)initWithAnimationStyle:(int64_t)a3 displayItem:(id)a4;
- (int64_t)animationStyle;
@end

@implementation SBTransitionSwitcherModifierRemovalContext

- (SBTransitionSwitcherModifierRemovalContext)initWithAnimationStyle:(int64_t)a3 displayItem:(id)a4
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBTransitionSwitcherModifierRemovalContext;
  v9 = [(SBTransitionSwitcherModifierRemovalContext *)&v12 init];
  if (v9)
  {
    if (!v8)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"SBTransitionSwitcherModifierRemovalContext.m", 15, @"Invalid parameter not satisfying: %@", @"displayItem" object file lineNumber description];
    }
    v9->_animationStyle = a3;
    objc_storeStrong((id *)&v9->_displayItem, a4);
  }

  return v9;
}

- (int64_t)animationStyle
{
  return self->_animationStyle;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (void).cxx_destruct
{
}

@end