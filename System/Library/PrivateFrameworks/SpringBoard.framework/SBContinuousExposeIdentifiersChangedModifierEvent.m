@interface SBContinuousExposeIdentifiersChangedModifierEvent
- (BOOL)isAnimated;
- (BOOL)isGestureInitiated;
- (NSArray)previousContinuousExposeIdentifiersInStrip;
- (NSArray)previousContinuousExposeIdentifiersInSwitcher;
- (SBAppLayout)transitioningFromAppLayout;
- (SBAppLayout)transitioningToAppLayout;
- (SBContinuousExposeIdentifiersChangedModifierEvent)initWithPreviousContinuousExposeIdentifiersInSwitcher:(id)a3 previousContinuousExposeIdentifiersInStrip:(id)a4 transitioningFromAppLayout:(id)a5 transitioningToAppLayout:(id)a6 animated:(BOOL)a7 gestureInitiated:(BOOL)a8;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBContinuousExposeIdentifiersChangedModifierEvent

- (SBContinuousExposeIdentifiersChangedModifierEvent)initWithPreviousContinuousExposeIdentifiersInSwitcher:(id)a3 previousContinuousExposeIdentifiersInStrip:(id)a4 transitioningFromAppLayout:(id)a5 transitioningToAppLayout:(id)a6 animated:(BOOL)a7 gestureInitiated:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v27.receiver = self;
  v27.super_class = (Class)SBContinuousExposeIdentifiersChangedModifierEvent;
  v19 = [(SBContinuousExposeIdentifiersChangedModifierEvent *)&v27 init];
  if (v19)
  {
    if (v15)
    {
      if (v16)
      {
LABEL_4:
        uint64_t v20 = [v15 copy];
        previousContinuousExposeIdentifiersInSwitcher = v19->_previousContinuousExposeIdentifiersInSwitcher;
        v19->_previousContinuousExposeIdentifiersInSwitcher = (NSArray *)v20;

        uint64_t v22 = [v16 copy];
        previousContinuousExposeIdentifiersInStrip = v19->_previousContinuousExposeIdentifiersInStrip;
        v19->_previousContinuousExposeIdentifiersInStrip = (NSArray *)v22;

        objc_storeStrong((id *)&v19->_transitioningFromAppLayout, a5);
        objc_storeStrong((id *)&v19->_transitioningToAppLayout, a6);
        v19->_animated = a7;
        v19->_gestureInitiated = a8;
        goto LABEL_5;
      }
    }
    else
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v19, @"SBContinuousExposeIdentifiersChangedModifierEvent.m", 18, @"Invalid parameter not satisfying: %@", @"previousContinuousExposeIdentifiersInSwitcher" object file lineNumber description];

      if (v16) {
        goto LABEL_4;
      }
    }
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, v19, @"SBContinuousExposeIdentifiersChangedModifierEvent.m", 19, @"Invalid parameter not satisfying: %@", @"previousContinuousExposeIdentifiersInStrip" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v19;
}

- (int64_t)type
{
  return 34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  previousContinuousExposeIdentifiersInSwitcher = self->_previousContinuousExposeIdentifiersInSwitcher;
  previousContinuousExposeIdentifiersInStrip = self->_previousContinuousExposeIdentifiersInStrip;
  transitioningFromAppLayout = self->_transitioningFromAppLayout;
  transitioningToAppLayout = self->_transitioningToAppLayout;
  BOOL animated = self->_animated;
  BOOL gestureInitiated = self->_gestureInitiated;
  return (id)[v4 initWithPreviousContinuousExposeIdentifiersInSwitcher:previousContinuousExposeIdentifiersInSwitcher previousContinuousExposeIdentifiersInStrip:previousContinuousExposeIdentifiersInStrip transitioningFromAppLayout:transitioningFromAppLayout transitioningToAppLayout:transitioningToAppLayout animated:animated gestureInitiated:gestureInitiated];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeIdentifiersChangedModifierEvent;
  id v4 = [(SBSwitcherModifierEvent *)&v11 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_previousContinuousExposeIdentifiersInStrip withName:@"previousContinuousExposeIdentifiersInStrip"];
  id v6 = (id)[v4 appendObject:self->_previousContinuousExposeIdentifiersInSwitcher withName:@"previousContinuousExposeIdentifiersInSwitcher"];
  v7 = [(SBAppLayout *)self->_transitioningFromAppLayout succinctDescription];
  [v4 appendString:v7 withName:@"transitioningFromAppLayout"];

  v8 = [(SBAppLayout *)self->_transitioningToAppLayout succinctDescription];
  [v4 appendString:v8 withName:@"transitioningToAppLayout"];

  id v9 = (id)[v4 appendBool:self->_gestureInitiated withName:@"gestureInitiated"];
  return v4;
}

- (NSArray)previousContinuousExposeIdentifiersInSwitcher
{
  return self->_previousContinuousExposeIdentifiersInSwitcher;
}

- (NSArray)previousContinuousExposeIdentifiersInStrip
{
  return self->_previousContinuousExposeIdentifiersInStrip;
}

- (SBAppLayout)transitioningFromAppLayout
{
  return self->_transitioningFromAppLayout;
}

- (SBAppLayout)transitioningToAppLayout
{
  return self->_transitioningToAppLayout;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (BOOL)isGestureInitiated
{
  return self->_gestureInitiated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioningToAppLayout, 0);
  objc_storeStrong((id *)&self->_transitioningFromAppLayout, 0);
  objc_storeStrong((id *)&self->_previousContinuousExposeIdentifiersInStrip, 0);
  objc_storeStrong((id *)&self->_previousContinuousExposeIdentifiersInSwitcher, 0);
}

@end