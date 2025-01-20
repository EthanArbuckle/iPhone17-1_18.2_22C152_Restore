@interface SBSlideOverPeekSwitcherModifier
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldConfigureInAppDockHiddenAssertion;
- (BOOL)wantsDockBehaviorAssertion;
- (BOOL)wantsDockWindowLevelAssertion;
- (BOOL)wantsHomeScreenPointerInteractions;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBSlideOverPeekSwitcherModifier)initWithAppLayout:(id)a3 peekConfiguration:(int64_t)a4 environmentMode:(int64_t)a5 fromFloatingConfiguration:(int64_t)a6;
- (double)dockProgress;
- (double)dockWindowLevel;
- (double)homeScreenAlpha;
- (double)homeScreenBackdropBlurProgress;
- (double)homeScreenDimmingAlpha;
- (double)homeScreenScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handleTapAppLayoutEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)visibleHomeAffordanceLayoutElements;
- (int64_t)dockUpdateMode;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (unint64_t)dockWindowLevelPriority;
- (unint64_t)slideOverTongueDirection;
@end

@implementation SBSlideOverPeekSwitcherModifier

- (SBSlideOverPeekSwitcherModifier)initWithAppLayout:(id)a3 peekConfiguration:(int64_t)a4 environmentMode:(int64_t)a5 fromFloatingConfiguration:(int64_t)a6
{
  id v12 = a3;
  if (!v12)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"SBSlideOverPeekSwitcherModifier.m", 36, @"Invalid parameter not satisfying: %@", @"peekingAppLayout" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)SBSlideOverPeekSwitcherModifier;
  v13 = [(SBSwitcherModifier *)&v20 init];
  if (v13)
  {
    uint64_t v14 = +[SBAppSwitcherDomain rootSettings];
    switcherSettings = v13->_switcherSettings;
    v13->_switcherSettings = (SBAppSwitcherSettings *)v14;

    objc_storeStrong((id *)&v13->_peekingAppLayout, a3);
    v13->_peekConfiguration = a4;
    v13->_environmentMode = a5;
    v13->_fromFloatingConfiguration = a6;
    v16 = [[SBActiveAppLayoutFloatingSwitcherModifier alloc] initWithActiveAppLayout:v12 floatingConfiguration:2 environmentMode:a5];
    floorModifier = v13->_floorModifier;
    v13->_floorModifier = v16;

    [(SBChainableModifier *)v13 addChildModifier:v13->_floorModifier];
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)[(SBAppLayout *)self->_peekingAppLayout copy];
  v6 = (void *)[v4 initWithAppLayout:v5 peekConfiguration:self->_peekConfiguration environmentMode:self->_environmentMode fromFloatingConfiguration:self->_fromFloatingConfiguration];

  return v6;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v24.receiver = self;
  v24.super_class = (Class)SBSlideOverPeekSwitcherModifier;
  -[SBSlideOverPeekSwitcherModifier frameForIndex:](&v24, sel_frameForIndex_);
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  v13 = [(SBSlideOverPeekSwitcherModifier *)self appLayouts];
  uint64_t v14 = [v13 objectAtIndex:a3];

  if ([v14 isEqual:self->_peekingAppLayout])
  {
    int64_t peekConfiguration = self->_peekConfiguration;
    if (peekConfiguration == 3)
    {
      if (![(SBSlideOverPeekSwitcherModifier *)self isRTLEnabled])
      {
LABEL_7:
        [(SBSlideOverPeekSwitcherModifier *)self switcherViewBounds];
        double MaxX = CGRectGetMaxX(v25);
        [(SBAppSwitcherSettings *)self->_switcherSettings peekInsetWidth];
        double v6 = MaxX - v17;
        goto LABEL_9;
      }
      int64_t peekConfiguration = self->_peekConfiguration;
    }
    if (peekConfiguration != 2 || ![(SBSlideOverPeekSwitcherModifier *)self isRTLEnabled])
    {
      [(SBAppSwitcherSettings *)self->_switcherSettings peekInsetWidth];
      double v19 = v18;
      v26.origin.x = v6;
      v26.origin.y = v8;
      v26.size.width = v10;
      v26.size.height = v12;
      double v6 = v19 - CGRectGetWidth(v26);
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_9:

  double v20 = v6;
  double v21 = v8;
  double v22 = v10;
  double v23 = v12;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (double)homeScreenAlpha
{
  return 1.0;
}

- (double)homeScreenScale
{
  return 1.0;
}

- (double)homeScreenDimmingAlpha
{
  return 0.0;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (double)homeScreenBackdropBlurProgress
{
  return 0.0;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)wantsHomeScreenPointerInteractions
{
  return 1;
}

- (BOOL)shouldAllowContentViewTouchesForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (id)keyboardSuppressionMode
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(SBSlideOverPeekSwitcherModifier *)self appLayouts];
  id v4 = [v2 setWithArray:v3];
  id v5 = +[SBSwitcherKeyboardSuppressionMode newSuppressionModeForSwitcherScenesFromAppLayouts:v4];

  [v5 setApplyAssertionEvenIfAppIsHostingTheKeyboard:1];
  return v5;
}

- (id)visibleHomeAffordanceLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBSlideOverPeekSwitcherModifier;
  v3 = [(SBSlideOverPeekSwitcherModifier *)&v6 visibleHomeAffordanceLayoutElements];
  id v4 = (void *)[v3 mutableCopy];

  [v4 removeObject:self->_peekingAppLayout];
  return v4;
}

- (BOOL)shouldConfigureInAppDockHiddenAssertion
{
  return 0;
}

- (BOOL)wantsDockBehaviorAssertion
{
  return 0;
}

- (double)dockProgress
{
  return 1.0;
}

- (int64_t)dockUpdateMode
{
  return 2;
}

- (BOOL)wantsDockWindowLevelAssertion
{
  return 0;
}

- (unint64_t)dockWindowLevelPriority
{
  return 0;
}

- (double)dockWindowLevel
{
  return 0.0;
}

- (unint64_t)slideOverTongueDirection
{
  if (SBFloatingConfigurationIsLeft(self->_fromFloatingConfiguration)) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)handleTapAppLayoutEvent:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 appLayout];
  int v6 = [v5 isEqual:self->_peekingAppLayout];

  if (v6)
  {
    double v7 = [(SBAppLayout *)self->_peekingAppLayout itemForLayoutRole:1];
    CGFloat v8 = [SBAppLayout alloc];
    double v9 = [NSNumber numberWithInteger:1];
    v15 = v9;
    v16[0] = v7;
    CGFloat v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    double v11 = [(SBAppLayout *)v8 initWithItemsForLayoutRoles:v10 configuration:1 environment:1 preferredDisplayOrdinal:[(SBSlideOverPeekSwitcherModifier *)self displayOrdinal]];

    CGFloat v12 = +[SBSwitcherTransitionRequest requestForTapAppLayoutEvent:v4];
    [v12 setAppLayout:v11];
    [v12 setPeekConfiguration:1];
    objc_msgSend(v12, "setRetainsSiri:", -[SBSlideOverPeekSwitcherModifier isSystemAssistantExperiencePersistentSiriEnabled](self, "isSystemAssistantExperiencePersistentSiriEnabled"));
    v13 = [[SBPerformTransitionSwitcherEventResponse alloc] initWithTransitionRequest:v12 gestureInitiated:0];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floorModifier, 0);
  objc_storeStrong((id *)&self->_peekingAppLayout, 0);
  objc_storeStrong((id *)&self->_switcherSettings, 0);
}

@end