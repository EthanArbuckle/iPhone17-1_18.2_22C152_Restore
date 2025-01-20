@interface _UIHIDScaleEventTracker
- (double)scaleZ;
- (unint64_t)compositePhase;
- (void)_setCompositePhase:(unint64_t)a3 withEvent:(__IOHIDEvent *)a4;
- (void)reset;
- (void)updateWithHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation _UIHIDScaleEventTracker

- (void)updateWithHIDEvent:(__IOHIDEvent *)a3
{
  if (!a3)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"_UIHIDTransformer.m" lineNumber:169 description:@"Attempting to update a scale tracker with no hidEvent"];
  }
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  _UIEventHIDGetTransformEventComponents((uint64_t)a3, &v14, &v13, &v12);
  if (v14 && (IOHIDEventGetDoubleValue(), uint64_t v5 = v14, self->_scaleZ = v6, v5)) {
    unint64_t Phase = IOHIDEventGetPhase();
  }
  else {
    unint64_t Phase = 0;
  }
  if (v13) {
    unint64_t v8 = IOHIDEventGetPhase();
  }
  else {
    unint64_t v8 = 0;
  }
  if (v12) {
    unint64_t v9 = IOHIDEventGetPhase();
  }
  else {
    unint64_t v9 = 0;
  }
  [(_UIHIDScaleEventTracker *)self _setCompositePhase:_UIEventHIDTransformPhaseForComponentPhases(Phase, v8, v9) withEvent:a3];
}

- (void)reset
{
  self->_scaleZ = 0.0;
  self->_compositeunint64_t Phase = 0;
}

- (void)_setCompositePhase:(unint64_t)a3 withEvent:(__IOHIDEvent *)a4
{
  compositeunint64_t Phase = self->_compositePhase;
  if (compositePhase != a3)
  {
    switch(a3)
    {
      case 0uLL:
        unint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
        [v9 handleFailureInMethod:a2, self, @"_UIHIDTransformer.m", 198, @"Received event resulting in UITransformPhaseNone %@", a4 object file lineNumber description];

        goto LABEL_7;
      case 1uLL:
        if (!compositePhase) {
          goto LABEL_7;
        }
        return;
      case 2uLL:
      case 3uLL:
        if (compositePhase - 1 >= 2) {
          return;
        }
        goto LABEL_7;
      case 4uLL:
        if (compositePhase) {
          BOOL v10 = compositePhase == 3;
        }
        else {
          BOOL v10 = 1;
        }
        if (!v10) {
          goto LABEL_7;
        }
        return;
      default:
LABEL_7:
        self->_compositeunint64_t Phase = a3;
        break;
    }
  }
}

- (double)scaleZ
{
  return self->_scaleZ;
}

- (unint64_t)compositePhase
{
  return self->_compositePhase;
}

@end