@interface SBTransientlyVisibleSlideOverTongueSwitcherModifier
+ (unint64_t)slideOverTongueTransientlyVisibleModeForEvent:(id)a3;
- (SBTransientlyVisibleSlideOverTongueSwitcherModifier)initWithMode:(unint64_t)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleSlideOverEdgeProtectTongueEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (unint64_t)mode;
- (unint64_t)slideOverTongueDirection;
- (unint64_t)slideOverTongueState;
@end

@implementation SBTransientlyVisibleSlideOverTongueSwitcherModifier

- (SBTransientlyVisibleSlideOverTongueSwitcherModifier)initWithMode:(unint64_t)a3
{
  if (!a3)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"SBTransientlyVisibleSlideOverTongueSwitcherModifier.m", 40, @"Invalid parameter not satisfying: %@", @"mode != SBSlideOverTongueTransientlyVisibleModeNone" object file lineNumber description];
  }
  v8.receiver = self;
  v8.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
  result = [(SBSwitcherModifier *)&v8 init];
  if (result)
  {
    result->_mode = a3;
    result->_rightEdgeHintState = 0;
    result->_edgeProtectEdge = 0;
  }
  return result;
}

+ (unint64_t)slideOverTongueTransientlyVisibleModeForEvent:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 1)
  {
    uint64_t v4 = objc_opt_class();
    v5 = SBSafeCast(v4, v3);
    if ([v5 phase] == 1)
    {
      uint64_t v6 = [v5 fromFloatingConfiguration];
      unint64_t v7 = [v5 toFloatingConfiguration] & 0xFFFFFFFFFFFFFFFBLL;
      BOOL v8 = [v5 toEnvironmentMode] != 3 || (v6 & 0xFFFFFFFFFFFFFFFBLL) == 0;
      if (!v8 && v7 == 0 && ([v5 isEnteringAnyPeekEvent] & 1) == 0)
      {
        v10 = [v5 toAppLayout];
        v11 = [v5 fromFloatingAppLayout];
        v12 = [v11 itemForLayoutRole:1];
        int v13 = [v10 containsItem:v12];

        if (!v13)
        {

          unint64_t v17 = 1;
          goto LABEL_18;
        }
      }
    }

    goto LABEL_17;
  }
  if ([v3 type] != 26
    || (uint64_t v14 = objc_opt_class(),
        SBSafeCast(v14, v3),
        v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v15 isTonguePresented],
        v15,
        (v16 & 1) == 0))
  {
LABEL_17:
    unint64_t v17 = 0;
    goto LABEL_18;
  }
  unint64_t v17 = 2;
LABEL_18:

  return v17;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  [(SBChainableModifier *)self setState:1];
  v7.receiver = self;
  v7.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v7 handleGestureEvent:v4];

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v15 handleTransitionEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "toFloatingConfiguration", v15.receiver, v15.super_class);

  if (self->_mode == 1 && (v6 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    if (!self->_rightEdgeHintState)
    {
      self->_rightEdgeHintState = 1;
      BOOL v8 = [(SBTransientlyVisibleSlideOverTongueSwitcherModifier *)self switcherSettings];
      v9 = [v8 floatingSwitcherSettings];
      [v9 rightEdgePeekDelay];
      double v11 = v10;

      v12 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"SBSlideOverTongueRightEdgeHintStartPeekingTimerReason" reason:v11];
      uint64_t v13 = +[SBChainableModifierEventResponse responseByAppendingResponse:v12 toResponse:v5];

      v5 = (void *)v13;
    }
  }
  else
  {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (id)handleSlideOverEdgeProtectTongueEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v9 handleSlideOverEdgeProtectTongueEvent:v4];
  if (self->_mode == 2)
  {
    if ([v4 isTonguePresented]) {
      self->_edgeProtectEdge = [v4 edge];
    }
    else {
      [(SBChainableModifier *)self setState:1];
    }
    uint64_t v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v5];

    v5 = (void *)v7;
  }

  return v5;
}

- (id)handleTimerEvent:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v18 handleTimerEvent:v4];
  uint64_t v6 = [v4 reason];
  if ([v6 isEqualToString:@"SBSlideOverTongueRightEdgeHintStartPeekingTimerReason"])
  {
  }
  else
  {
    uint64_t v7 = [v4 reason];
    int v8 = [v7 isEqualToString:@"SBSlideOverTongueRightEdgeHintStopPeekingTimerReason"];

    if (!v8) {
      goto LABEL_10;
    }
  }
  if (!v5) {
    v5 = objc_alloc_init(SBSwitcherModifierEventResponse);
  }
  objc_super v9 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
  [(SBChainableModifierEventResponse *)v5 addChildResponse:v9];
  double v10 = [v4 reason];
  int v11 = [v10 isEqualToString:@"SBSlideOverTongueRightEdgeHintStartPeekingTimerReason"];

  if (v11)
  {
    self->_rightEdgeHintState = 2;
    v12 = [(SBTransientlyVisibleSlideOverTongueSwitcherModifier *)self switcherSettings];
    uint64_t v13 = [v12 floatingSwitcherSettings];
    [v13 rightEdgePeekTimeout];
    double v15 = v14;

    char v16 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"SBSlideOverTongueRightEdgeHintStopPeekingTimerReason" reason:v15];
    [(SBChainableModifierEventResponse *)v5 addChildResponse:v16];
  }
  else
  {
    [(SBChainableModifier *)self setState:1];
  }

LABEL_10:
  return v5;
}

- (unint64_t)slideOverTongueState
{
  unint64_t mode = self->_mode;
  if (mode)
  {
    return mode != 1 || self->_rightEdgeHintState == 2;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
    return [(SBTransientlyVisibleSlideOverTongueSwitcherModifier *)&v4 slideOverTongueState];
  }
}

- (unint64_t)slideOverTongueDirection
{
  unint64_t result = self->_mode;
  if (result != 1)
  {
    if (result == 2)
    {
      if (self->_edgeProtectEdge == 8) {
        return 1;
      }
      else {
        return 2;
      }
    }
    else
    {
      v4.receiver = self;
      v4.super_class = (Class)SBTransientlyVisibleSlideOverTongueSwitcherModifier;
      return [(SBTransientlyVisibleSlideOverTongueSwitcherModifier *)&v4 slideOverTongueDirection];
    }
  }
  return result;
}

- (unint64_t)mode
{
  return self->_mode;
}

@end