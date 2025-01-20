@interface _UIDynamicButton
+ (id)_dynamicButtonFromHIDEvent:(uint64_t)a1;
- (BKSHIDEventBaseAttributes)_hidEventAttributes;
- (BOOL)_isTouching;
- (CGPoint)_position;
- (CGPoint)_positionDelta;
- (NSString)debugDescription;
- (NSString)description;
- (UIWindow)_window;
- (_UIDynamicButton)init;
- (_UIEventComponentPhaseValue)_eventComponentPhase;
- (double)_nextStageNormalizedForceThreshold;
- (double)_normalizedForce;
- (double)_normalizedForceVelocity;
- (double)_pressedStageNormalizedForceThreshold;
- (double)_releaseStageNormalizedForceThreshold;
- (double)_timestamp;
- (double)_touchMajorRadius;
- (double)_touchMinorRadius;
- (id)_eventComponentPhaseForValue:(int64_t)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (uint64_t)_appendProemDescriptionSansSelfToFormatter:(uint64_t)result;
- (unint64_t)_eventComponentType;
- (unint64_t)_phase;
- (unint64_t)_physicalButton;
- (unint64_t)_stage;
- (unint64_t)_touchPositionHints;
- (unsigned)_usage;
- (unsigned)_usagePage;
- (void)_appendDebugBodyDescriptionToFormatter:(uint64_t)a1;
- (void)_setEventComponentPhase:(id)a3;
- (void)_updateWithHIDEvent:(uint64_t)a1;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation _UIDynamicButton

- (_UIDynamicButton)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"_UIDynamicButton.m", 220, @"%s: init is not allowed on %@", "-[_UIDynamicButton init]", objc_opt_class() object file lineNumber description];

  return 0;
}

+ (id)_dynamicButtonFromHIDEvent:(uint64_t)a1
{
  self;
  v3 = [_UIDynamicButton alloc];
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)_UIDynamicButton;
    id v4 = objc_msgSendSuper2(&v6, sel_init);
  }
  else
  {
    id v4 = 0;
  }
  -[_UIDynamicButton _updateWithHIDEvent:]((uint64_t)v4, a2);
  return v4;
}

- (void)_updateWithHIDEvent:(uint64_t)a1
{
  if (a1)
  {
    if (_UIEventHIDIsDynamicButtonEvent(a2))
    {
      if (_UIEventHIDIsDynamicButtonEvent(a2)) {
        uint64_t v4 = 5;
      }
      else {
        uint64_t v4 = 0;
      }
      BKSHIDEventGetBaseAttributes();
      id v31 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = _UIEventHIDUIWindowForHIDEvent();
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      *(void *)(a1 + 24) = v4;
      *(_WORD *)(a1 + 10) = IOHIDEventGetIntegerValue();
      *(_WORD *)(a1 + 12) = IOHIDEventGetIntegerValue();
      *(unsigned char *)(a1 + 8) = IOHIDEventGetIntegerValue() > 0;
      IOHIDEventGetDoubleValue();
      double v8 = v7;
      IOHIDEventGetDoubleValue();
      double v10 = v9;
      *(double *)(a1 + 32) = _UITouchSensitiveButtonRadiusInPointsFromMM(*(void **)(a1 + 16), v8);
      *(double *)(a1 + 40) = _UITouchSensitiveButtonRadiusInPointsFromMM(*(void **)(a1 + 16), v10);
      IOHIDEventGetDoubleValue();
      uint64_t v12 = v11;
      IOHIDEventGetDoubleValue();
      uint64_t v14 = v13;
      IOHIDEventGetDoubleValue();
      uint64_t v16 = v15;
      IOHIDEventGetDoubleValue();
      *(void *)(a1 + 136) = v12;
      *(void *)(a1 + 144) = v14;
      *(void *)(a1 + 152) = v16;
      *(void *)(a1 + 160) = v17;
      *(void *)(a1 + 48) = IOHIDEventGetIntegerValue() & 0x1F;
      _UIEventHIDGetChildForceStageEvent(a2);
      uint64_t IntegerValue = IOHIDEventGetIntegerValue();
      int v19 = IOHIDEventGetIntegerValue();
      BOOL v20 = v19 == 1;
      BOOL v21 = v19 == 2;
      uint64_t v22 = 2;
      if (!v21) {
        uint64_t v22 = v20;
      }
      *(void *)(a1 + 56) = IntegerValue & ~(IntegerValue >> 63);
      *(void *)(a1 + 64) = v22;
      IOHIDEventGetDoubleValue();
      *(void *)(a1 + 80) = v23;
      IOHIDEventGetDoubleValue();
      *(void *)(a1 + 88) = v24;
      IOHIDEventGetDoubleValue();
      *(void *)(a1 + 96) = v25;
      IOHIDEventGetDoubleValue();
      *(void *)(a1 + 104) = v26;
      IOHIDEventGetDoubleValue();
      *(void *)(a1 + 112) = v27;
      unint64_t TimeStamp = IOHIDEventGetTimeStamp();
      *(double *)(a1 + 120) = _UIMediaTimeForMachTime(TimeStamp);
      uint64_t v29 = [v31 copy];
      v30 = *(void **)(a1 + 128);
      *(void *)(a1 + 128) = v29;
    }
    else
    {
      id v31 = [MEMORY[0x1E4F28B00] currentHandler];
      [v31 handleFailureInMethod:sel__updateWithHIDEvent_, a1, @"_UIDynamicButton.m", 239, @"Invalid hidEvent type for %@: %@", objc_opt_class(), a2 object file lineNumber description];
    }
  }
}

- (unint64_t)_eventComponentType
{
  return 2;
}

- (_UIEventComponentPhaseValue)_eventComponentPhase
{
  unint64_t phase = self->_phase;
  v3 = _eventComponentPhaseMapping();
  uint64_t v4 = _eventComponentPhaseForUnderlyingValue(phase, v3);

  return (_UIEventComponentPhaseValue *)v4;
}

- (void)_setEventComponentPhase:(id)a3
{
  self->_unint64_t phase = [a3 underlyingValue];
}

- (id)_eventComponentPhaseForValue:(int64_t)a3
{
  uint64_t v4 = _eventComponentPhaseMapping();
  uint64_t v5 = _eventComponentPhaseForValue(a3, v4);

  return v5;
}

- (uint64_t)_appendProemDescriptionSansSelfToFormatter:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = _NSStringFromUIPhysicalButton(*(void *)(result + 24));
    [a2 appendString:v4 withName:@"physicalButton"];

    id v5 = (id)[a2 appendUnsignedInteger:*(void *)(v3 + 56) withName:@"stage"];
    unint64_t v6 = *(void *)(v3 + 72);
    if (v6 > 4) {
      double v7 = &stru_1ED0E84C0;
    }
    else {
      double v7 = off_1E52E0770[v6];
    }
    [a2 appendString:v7 withName:@"phase"];
    id v8 = (id)[a2 appendBool:*(unsigned __int8 *)(v3 + 8) withName:@"isTouching"];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __63___UIDynamicButton__appendProemDescriptionSansSelfToFormatter___block_invoke;
    v10[3] = &unk_1E52E0750;
    v10[4] = v3;
    [a2 appendCustomFormatWithName:@"position" block:v10];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63___UIDynamicButton__appendProemDescriptionSansSelfToFormatter___block_invoke_2;
    v9[3] = &unk_1E52E0750;
    v9[4] = v3;
    return [a2 appendCustomFormatWithName:@"positionDelta" block:v9];
  }
  return result;
}

- (void)_appendDebugBodyDescriptionToFormatter:(uint64_t)a1
{
  if (a1)
  {
    id v4 = (id)[a2 appendBool:*(unsigned __int8 *)(a1 + 8) withName:@"isTouching"];
    id v5 = (id)[a2 appendFloat:@"touchMajorRadius" withName:1 decimalPrecision:*(double *)(a1 + 32)];
    id v6 = (id)[a2 appendFloat:@"touchMinorRadius" withName:1 decimalPrecision:*(double *)(a1 + 40)];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59___UIDynamicButton__appendDebugBodyDescriptionToFormatter___block_invoke;
    v22[3] = &unk_1E52E0750;
    v22[4] = a1;
    [a2 appendCustomFormatWithName:@"position" block:v22];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59___UIDynamicButton__appendDebugBodyDescriptionToFormatter___block_invoke_2;
    v21[3] = &unk_1E52E0750;
    v21[4] = a1;
    [a2 appendCustomFormatWithName:@"positionDelta" block:v21];
    double v7 = _NSStringFromUITouchSenstiveButtonPositionHint(*(void *)(a1 + 48));
    id v8 = (id)[a2 appendObject:v7 withName:@"touchPositionHints"];

    id v9 = (id)[a2 appendFloat:@"normalizedForce" withName:3 decimalPrecision:*(double *)(a1 + 80)];
    id v10 = (id)[a2 appendFloat:@"normalizedForceVelocity" withName:3 decimalPrecision:*(double *)(a1 + 88)];
    id v11 = (id)[a2 appendFloat:@"releaseStageForceThreshold" withName:3 decimalPrecision:*(double *)(a1 + 96)];
    id v12 = (id)[a2 appendFloat:@"pressedStageForceThreshold" withName:3 decimalPrecision:*(double *)(a1 + 104)];
    id v13 = (id)[a2 appendFloat:@"nextStageForceThreshold" withName:3 decimalPrecision:*(double *)(a1 + 112)];
    uint64_t v14 = *(void **)(a1 + 16);
    if (v14)
    {
      uint64_t v15 = NSString;
      id v16 = v14;
      uint64_t v17 = (objc_class *)objc_opt_class();
      v18 = NSStringFromClass(v17);
      int v19 = [v15 stringWithFormat:@"<%@: %p>", v18, v16];
    }
    else
    {
      int v19 = @"(nil)";
    }
    id v20 = (id)[a2 appendObject:v19 withName:@"window"];
  }
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49___UIDynamicButton_appendDescriptionToFormatter___block_invoke;
  v3[3] = &unk_1E52D9F98;
  v3[4] = self;
  v3[5] = a3;
  [a3 appendProem:self block:v3];
}

- (id)succinctDescription
{
  v2 = [(_UIDynamicButton *)self succinctDescriptionBuilder];
  uint64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  -[_UIDynamicButton _appendProemDescriptionSansSelfToFormatter:]((uint64_t)self, v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIDynamicButton *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  uint64_t v3 = [(_UIDynamicButton *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v5 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  [v5 setActiveMultilinePrefix:a3];
  id v6 = _NSStringFromUIPhysicalButton(self->_physicalButton);
  [v5 appendString:v6 withName:@"physicalButton"];

  id v7 = (id)[v5 appendUnsignedInteger:self->_stage withName:@"stage"];
  unint64_t phase = self->_phase;
  if (phase > 4) {
    id v9 = &stru_1ED0E84C0;
  }
  else {
    id v9 = off_1E52E0770[phase];
  }
  [v5 appendString:v9 withName:@"phase"];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58___UIDynamicButton_descriptionBuilderWithMultilinePrefix___block_invoke;
  v14[3] = &unk_1E52D9F98;
  id v10 = v5;
  id v15 = v10;
  id v16 = self;
  id v11 = (id)[v10 modifyBody:v14];
  id v12 = v10;

  return v12;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_new();
  [(_UIDynamicButton *)self appendDescriptionToFormatter:v3];
  id v4 = [v3 description];

  return (NSString *)v4;
}

- (NSString)debugDescription
{
  uint64_t v3 = objc_opt_new();
  id v4 = v3;
  if (self)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52___UIDynamicButton__appendDebugDescriptionToStream___block_invoke;
    v8[3] = &unk_1E52D9F98;
    v8[4] = self;
    v8[5] = v3;
    [v3 appendProem:self block:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __52___UIDynamicButton__appendDebugDescriptionToStream___block_invoke_2;
    v7[3] = &unk_1E52D9F98;
    v7[4] = self;
    v7[5] = v4;
    [v4 appendBodySectionWithName:0 block:v7];
  }
  id v5 = [v4 description];

  return (NSString *)v5;
}

- (UIWindow)_window
{
  return self->_window;
}

- (unint64_t)_physicalButton
{
  return self->_physicalButton;
}

- (unsigned)_usagePage
{
  return self->_usagePage;
}

- (unsigned)_usage
{
  return self->_usage;
}

- (BOOL)_isTouching
{
  return self->_touching;
}

- (double)_touchMajorRadius
{
  return self->_touchMajorRadius;
}

- (double)_touchMinorRadius
{
  return self->_touchMinorRadius;
}

- (CGPoint)_position
{
  double x = self->_position.x;
  double y = self->_position.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)_positionDelta
{
  double x = self->_positionDelta.x;
  double y = self->_positionDelta.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)_touchPositionHints
{
  return self->_touchPositionHints;
}

- (unint64_t)_stage
{
  return self->_stage;
}

- (unint64_t)_phase
{
  return self->_phase;
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

- (double)_timestamp
{
  return self->_timestamp;
}

- (BKSHIDEventBaseAttributes)_hidEventAttributes
{
  return self->_hidEventAttributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidEventAttributes, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end