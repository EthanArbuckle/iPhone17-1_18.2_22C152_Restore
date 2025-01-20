@interface _UIPhysicalButtonAction
+ (char)_actionFromPhysicalButtonBSAction:(uint64_t)a3 andDriver:;
+ (id)_actionFromDynamicButton:(void *)a3 withConfiguration:(uint64_t)a4 state:(uint64_t)a5 andDriver:;
- (CGPoint)_position;
- (CGPoint)_positionDelta;
- (NSString)debugDescription;
- (_UIPhysicalButtonAction)init;
- (_UIPhysicalButtonContact)_contact;
- (double)_nextStageNormalizedForceThreshold;
- (double)_normalizedForce;
- (double)_normalizedForceVelocity;
- (double)_pressedStageNormalizedForceThreshold;
- (double)_releaseStageNormalizedForceThreshold;
- (double)_timestamp;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)_behavior;
- (unint64_t)_button;
- (unint64_t)_numberOfStages;
- (unint64_t)_stage;
- (unint64_t)_stagePhase;
- (unint64_t)_state;
@end

@implementation _UIPhysicalButtonAction

+ (char)_actionFromPhysicalButtonBSAction:(uint64_t)a3 andDriver:
{
  uint64_t v5 = self;
  if (!a2)
  {
    uint64_t v14 = v5;
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:sel__actionFromPhysicalButtonBSAction_andDriver_, v14, @"_UIPhysicalButtonInteraction.m", 204, @"Invalid parameter not satisfying: %@", @"physicalButtonBSAction" object file lineNumber description];
  }
  v6 = [_UIPhysicalButtonAction alloc];
  if (v6)
  {
    v16.receiver = v6;
    v16.super_class = (Class)_UIPhysicalButtonAction;
    v7 = (char *)objc_msgSendSuper2(&v16, sel_init);
    uint64_t v8 = [a2 button];
    if (v7)
    {
      *((void *)v7 + 1) = v8;
      *((void *)v7 + 2) = [a2 state];
      *((void *)v7 + 3) = [a2 behavior];
      *((void *)v7 + 4) = a3;
      *((CFTimeInterval *)v7 + 5) = CACurrentMediaTime();
      objc_storeStrong((id *)v7 + 6, 0);
      char v9 = 0;
      *(int64x2_t *)(v7 + 56) = vdupq_n_s64(1uLL);
      goto LABEL_6;
    }
  }
  else
  {
    [a2 button];
  }
  [a2 state];
  [a2 behavior];
  CACurrentMediaTime();
  v7 = 0;
  char v9 = 1;
LABEL_6:
  unint64_t v10 = [a2 state];
  if ((v9 & 1) == 0)
  {
    if (v10 >= 4) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = v10;
    }
    *((void *)v7 + 9) = v11;
    int64x2_t v12 = vdupq_n_s64(0x7FF8000000000000uLL);
    *((int64x2_t *)v7 + 5) = v12;
    *((int64x2_t *)v7 + 6) = v12;
    *((void *)v7 + 14) = 0x7FF8000000000000;
  }
  return v7;
}

+ (id)_actionFromDynamicButton:(void *)a3 withConfiguration:(uint64_t)a4 state:(uint64_t)a5 andDriver:
{
  uint64_t v9 = self;
  if (!a2)
  {
    uint64_t v33 = v9;
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    [v34 handleFailureInMethod:sel__actionFromDynamicButton_withConfiguration_state_andDriver_, v33, @"_UIPhysicalButtonInteraction.m", 235, @"Invalid parameter not satisfying: %@", @"dynamicButton" object file lineNumber description];
  }
  unint64_t v10 = [_UIPhysicalButtonAction alloc];
  if (v10)
  {
    v37.receiver = v10;
    v37.super_class = (Class)_UIPhysicalButtonAction;
    id v11 = objc_msgSendSuper2(&v37, sel_init);
    uint64_t v12 = [a2 _physicalButton];
    if (v11)
    {
      *((void *)v11 + 1) = v12;
      *((void *)v11 + 2) = a4;
      *((void *)v11 + 3) = [a3 _behavior];
      *((void *)v11 + 4) = a5;
      [a2 _timestamp];
      int v13 = 0;
      *((void *)v11 + 5) = v14;
      goto LABEL_6;
    }
  }
  else
  {
    [a2 _physicalButton];
  }
  [a3 _behavior];
  [a2 _timestamp];
  id v11 = 0;
  int v13 = 1;
LABEL_6:
  v15 = -[_UIPhysicalButtonContact _init]([_UIPhysicalButtonContact alloc]);
  char v16 = [a2 _isTouching];
  if (v15)
  {
    v15[8] = v16;
    [a2 _touchMajorRadius];
    *((void *)v15 + 2) = v17;
    [a2 _touchMinorRadius];
    *((void *)v15 + 3) = v18;
    [a2 _position];
    *((void *)v15 + 5) = v19;
    *((void *)v15 + 6) = v20;
    [a2 _positionDelta];
    *((void *)v15 + 7) = v21;
    *((void *)v15 + 8) = v22;
    *((void *)v15 + 4) = [a2 _touchPositionHints];
    if (!v11) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  [a2 _touchMajorRadius];
  [a2 _touchMinorRadius];
  [a2 _position];
  [a2 _positionDelta];
  [a2 _touchPositionHints];
  if (v11) {
LABEL_8:
  }
    objc_storeStrong((id *)v11 + 6, v15);
LABEL_9:
  uint64_t v23 = [a2 _stage];
  if (v13)
  {
    [v11 _button];
  }
  else
  {
    *((void *)v11 + 7) = v23;
    if ([v11 _button] == 5) {
      uint64_t v24 = 5;
    }
    else {
      uint64_t v24 = 1;
    }
    *((void *)v11 + 8) = v24;
  }
  uint64_t v25 = [a2 _phase];
  uint64_t v26 = 1;
  switch(v25)
  {
    case 0:
      uint64_t v26 = 0;
      if (!v13) {
        goto LABEL_21;
      }
      goto LABEL_26;
    case 2:
      v35 = [MEMORY[0x1E4F28B00] currentHandler];
      v36 = [NSString stringWithUTF8String:"_UIPhysicalButtonStagePhase _UIPhysicalButtonStagePhaseForDynamicButtonPhase(_UIDynamicButtonPhase)"];
      [v35 handleFailureInFunction:v36 file:@"_UIPhysicalButtonInteraction.m" lineNumber:127 description:@"Invalid state: attempting to resolve physical button stage for stationary dynamic button"];

      uint64_t v26 = 1;
      if (v13) {
        goto LABEL_26;
      }
      goto LABEL_21;
    case 3:
      uint64_t v26 = 2;
      if (v13) {
        goto LABEL_26;
      }
      goto LABEL_21;
    case 4:
      uint64_t v26 = 3;
      goto LABEL_20;
    default:
LABEL_20:
      if (v13)
      {
LABEL_26:
        [a2 _normalizedForce];
        [a2 _normalizedForceVelocity];
        [a2 _releaseStageNormalizedForceThreshold];
        [a2 _pressedStageNormalizedForceThreshold];
        [a2 _nextStageNormalizedForceThreshold];
      }
      else
      {
LABEL_21:
        *((void *)v11 + 9) = v26;
        [a2 _normalizedForce];
        *((void *)v11 + 10) = v27;
        [a2 _normalizedForceVelocity];
        *((void *)v11 + 11) = v28;
        [a2 _releaseStageNormalizedForceThreshold];
        *((void *)v11 + 12) = v29;
        [a2 _pressedStageNormalizedForceThreshold];
        *((void *)v11 + 13) = v30;
        [a2 _nextStageNormalizedForceThreshold];
        *((void *)v11 + 14) = v31;
      }

      return v11;
  }
}

- (_UIPhysicalButtonAction)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIPhysicalButtonInteraction.m", 266, @"%s: init is not allowed on %@", "-[_UIPhysicalButtonAction init]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (CGPoint)_position
{
  [(_UIPhysicalButtonContact *)self->_contact position];
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)_positionDelta
{
  [(_UIPhysicalButtonContact *)self->_contact positionDelta];
  result.y = v3;
  result.x = v2;
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)[(_UIPhysicalButtonAction *)self debugDescriptionWithMultilinePrefix:&stru_1ED0E84C0];
}

- (id)succinctDescription
{
  double v2 = [(_UIPhysicalButtonAction *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  double v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = _NSStringFromUIPhysicalButton(self->_button);
  [v3 appendString:v4 withName:@"button"];
  uint64_t v5 = _NSStringFromUIPhysicalButtonBehavior(self->_behavior);
  [v3 appendString:v5 withName:@"behavior"];
  id v6 = (id)[v3 appendUnsignedInteger:self->_stage withName:@"stage"];
  id v7 = (id)[v3 appendUnsignedInteger:self->_numberOfStages withName:@"numberOfStages"];
  unint64_t stagePhase = self->_stagePhase;
  if (stagePhase > 3) {
    uint64_t v9 = &stru_1ED0E84C0;
  }
  else {
    uint64_t v9 = off_1E5308918[stagePhase];
  }
  [v3 appendString:v9 withName:@"stagePhase"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(_UIPhysicalButtonAction *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(_UIPhysicalButtonAction *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65___UIPhysicalButtonAction_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v11 = v6;
  uint64_t v12 = self;
  id v7 = (id)[v6 modifyBody:v10];
  id v8 = v6;

  return v8;
}

- (unint64_t)_button
{
  return self->_button;
}

- (unint64_t)_state
{
  return self->_state;
}

- (unint64_t)_behavior
{
  return self->_behavior;
}

- (double)_timestamp
{
  return self->_timestamp;
}

- (_UIPhysicalButtonContact)_contact
{
  return self->_contact;
}

- (unint64_t)_stage
{
  return self->_stage;
}

- (unint64_t)_numberOfStages
{
  return self->_numberOfStages;
}

- (unint64_t)_stagePhase
{
  return self->_stagePhase;
}

- (double)_normalizedForce
{
  return self->_normalizedForce;
}

- (double)_normalizedForceVelocity
{
  return self->_normalizedForceVelocity;
}

- (double)_releaseStageNormalizedForceThreshold
{
  return self->_releaseStageNormalizedForceThreshold;
}

- (double)_pressedStageNormalizedForceThreshold
{
  return self->_pressedStageNormalizedForceThreshold;
}

- (double)_nextStageNormalizedForceThreshold
{
  return self->_nextStageNormalizedForceThreshold;
}

- (void).cxx_destruct
{
}

@end