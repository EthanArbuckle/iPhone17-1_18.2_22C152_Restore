@interface UITransformEvent
- (BOOL)_sendEventToGestureRecognizer:(id)a3;
- (CGAffineTransform)transform;
- (CGPoint)locationInView:(id)a3;
- (CGPoint)translation;
- (double)rotation;
- (double)scale;
- (id)_allWindows;
- (id)_gestureRecognizersForWindow:(id)a3;
- (id)_init;
- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4;
- (id)_windowServerHitTestWindow;
- (int64_t)subtype;
- (int64_t)type;
- (int64_t)weightedDominantComponentForScaleWeight:(double)a3 rotationWeight:(double)a4 translationWeight:(double)a5;
- (unint64_t)phase;
- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4;
- (void)_removeGestureRecognizersFromWindows;
- (void)_reset;
- (void)_setHIDEvent:(__IOHIDEvent *)a3;
@end

@implementation UITransformEvent

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)UITransformEvent;
  id v2 = [(UIEvent *)&v5 _init];
  v3 = v2;
  if (v2) {
    _UITransformEventCommonInit(v2);
  }
  return v3;
}

- (id)_initWithEvent:(__GSEvent *)a3 touches:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UITransformEvent;
  id v4 = [(UIEvent *)&v7 _init];
  objc_super v5 = v4;
  if (v4) {
    _UITransformEventCommonInit(v4);
  }
  return v5;
}

- (void)_reset
{
  self->_scale = 0.0;
  self->_scaleDelta = 0.0;
  self->_rotation = 0.0;
  self->_rotationDelta = 0.0;
  self->_translation = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_translationMagDelta = 0.0;
  self->_scalePhase = 0;
  self->_rotationPhase = 0;
  self->_translationPhase = 0;
}

- (void)_setHIDEvent:(__IOHIDEvent *)a3
{
  if (a3
    && ([(UITransformEvent *)self phase] == 3
     || [(UITransformEvent *)self phase] == 4
     || ![(UITransformEvent *)self phase]))
  {
    [(UITransformEvent *)self _reset];
  }
  v30.receiver = self;
  v30.super_class = (Class)UITransformEvent;
  [(UIEvent *)&v30 _setHIDEvent:a3];
  if ([(UIEvent *)self _hidEvent])
  {
    BKSHIDEventGetPointerAttributes();
    objc_super v5 = (BKSHIDEventPointerAttributes *)objc_claimAutoreleasedReturnValue();
    pointerAttributes = self->_pointerAttributes;
    self->_pointerAttributes = v5;

    objc_super v7 = _UIEventHIDUIWindowForHIDEvent();
    if (v7)
    {
      objc_msgSend(v7, "_convertPointToSceneReferenceSpace:", _UIEventHIDConvertPointerLocation3DToWindow((uint64_t)a3, v7));
      self->_sceneReferenceLocation.x = v8;
      self->_sceneReferenceLocation.y = v9;
    }
    else
    {
      self->_sceneReferenceLocation = (CGPoint)*MEMORY[0x1E4F1DAD8];
    }
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    uint64_t v27 = 0;
    _UIEventHIDGetTransformEventComponents((uint64_t)a3, &v29, &v28, &v27);
    if (v29)
    {
      IOHIDEventGetDoubleValue();
      self->_scaleDelta = v10;
      self->_scale = v10 + self->_scale;
      self->_scalePhase = _UIEventHIDTransformPhaseForComponentEvent(v29);
    }
    if (v28)
    {
      IOHIDEventGetDoubleValue();
      self->_rotationDelta = v11;
      self->_rotation = v11 + self->_rotation;
      self->_rotationPhase = _UIEventHIDTransformPhaseForComponentEvent(v28);
    }
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v12 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar < 1
      || (int v26 = _UIInternalPreference_ShouldIncludeTranslationHIDEvent,
          _UIInternalPreferencesRevisionVar == _UIInternalPreference_ShouldIncludeTranslationHIDEvent))
    {
      BOOL v13 = 1;
    }
    else
    {
      do
      {
        BOOL v13 = v12 >= v26;
        if (v12 < v26) {
          break;
        }
        _UIInternalPreferenceSync(v12, &_UIInternalPreference_ShouldIncludeTranslationHIDEvent, @"ShouldIncludeTranslationHIDEvent", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        int v26 = _UIInternalPreference_ShouldIncludeTranslationHIDEvent;
      }
      while (v12 != _UIInternalPreference_ShouldIncludeTranslationHIDEvent);
    }
    if (byte_1EB256E3C) {
      int v14 = 1;
    }
    else {
      int v14 = v13;
    }
    if (v14 == 1 && v27 != 0)
    {
      IOHIDEventGetDoubleValue();
      double v17 = v16;
      IOHIDEventGetDoubleValue();
      long double v19 = v18;
      uint64_t v20 = _UIEventHIDGetInterfaceOrientationForEvent((uint64_t)self->super._hidEvent);
      double v21 = -v19;
      if (v20 == 2) {
        double v22 = -v19;
      }
      else {
        double v22 = v19;
      }
      if (v20 == 2) {
        double v23 = -v17;
      }
      else {
        double v23 = v17;
      }
      if (v20 == 3) {
        double v22 = v17;
      }
      else {
        double v21 = v23;
      }
      if (v20 == 4) {
        double v24 = -v17;
      }
      else {
        double v24 = v22;
      }
      if (v20 != 4) {
        long double v19 = v21;
      }
      self->_translationMagDelta = hypot(v19, v24);
      CGFloat v25 = v24 + self->_translation.y;
      self->_translation.x = v19 + self->_translation.x;
      self->_translation.y = v25;
      self->_translationPhase = _UIEventHIDTransformPhaseForComponentEvent(v27);
    }
  }
}

- (int64_t)type
{
  return 14;
}

- (int64_t)subtype
{
  return 0;
}

- (id)_gestureRecognizersForWindow:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(NSMapTable *)self->_gestureRecognizersByWindow objectForKey:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else if ([(UITransformEvent *)self phase] == 1)
  {
    CGFloat v8 = [(UITransformEvent *)self _windowServerHitTestWindow];
    _UINonComponentEventHitTestGestureRecognizers(self, v8, (uint64_t)v8, self->_sceneReferenceLocation.x, self->_sceneReferenceLocation.y);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    gestureRecognizersByWindow = self->_gestureRecognizersByWindow;
    double v10 = (void *)[v7 mutableCopy];
    [(NSMapTable *)gestureRecognizersByWindow setObject:v10 forKey:v4];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)_removeGestureRecognizersFromWindows
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(UITransformEvent *)self _allWindows];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [(NSMapTable *)self->_gestureRecognizersByWindow removeObjectForKey:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_removeGestureRecognizer:(id)a3 fromComponents:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(UITransformEvent *)self _allWindows];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = [(NSMapTable *)self->_gestureRecognizersByWindow objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * v10)];
        [v11 removeObject:v5];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (BOOL)_sendEventToGestureRecognizer:(id)a3
{
  return 1;
}

- (id)_allWindows
{
  id v2 = [(UITransformEvent *)self _windowServerHitTestWindow];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F1CAD0] setWithObject:v2];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_windowServerHitTestWindow
{
  [(UIEvent *)self _hidEvent];
  return _UIEventHIDUIWindowForHIDEvent();
}

- (int64_t)weightedDominantComponentForScaleWeight:(double)a3 rotationWeight:(double)a4 translationWeight:(double)a5
{
  double scaleDelta = self->_scaleDelta;
  double rotationDelta = self->_rotationDelta;
  double translationMagDelta = self->_translationMagDelta;
  if (translationMagDelta < 0.0) {
    double translationMagDelta = -translationMagDelta;
  }
  double v8 = translationMagDelta * a5;
  if (scaleDelta < 0.0) {
    double scaleDelta = -scaleDelta;
  }
  double v9 = scaleDelta * a3;
  double v10 = -rotationDelta;
  if (rotationDelta >= 0.0) {
    double v10 = self->_rotationDelta;
  }
  double v11 = v10 * a4;
  double v12 = 1.0;
  if (v9 <= 0.0) {
    double v13 = 1.0;
  }
  else {
    double v13 = v9;
  }
  if (v9 != 0.0 && v8 / v13 <= 1.4) {
    goto LABEL_16;
  }
  if (v11 > 0.0) {
    double v12 = v11;
  }
  int64_t result = 3;
  if (v11 != 0.0 && v8 / v12 <= 1.4)
  {
LABEL_16:
    double v15 = 1.0;
    if (v8 <= 0.0) {
      double v16 = 1.0;
    }
    else {
      double v16 = v8;
    }
    if (v8 != 0.0 && v9 / v16 <= 1.4) {
      goto LABEL_26;
    }
    if (v11 > 0.0) {
      double v15 = v11;
    }
    int64_t result = 1;
    if (v11 != 0.0 && v9 / v15 <= 1.4)
    {
LABEL_26:
      if (v8 == 0.0 || v11 / v16 > 1.4)
      {
        if (v11 / v13 > 1.4 || v9 == 0.0) {
          return 2;
        }
        else {
          return 0;
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [(UITransformEvent *)self _allWindows];
    id v6 = [v7 anyObject];
  }
  double v8 = [v6 _window];
  double v9 = v8;
  if (v8) {
    objc_msgSend(v8, "_convertPointFromSceneReferenceSpace:", self->_sceneReferenceLocation.x, self->_sceneReferenceLocation.y);
  }
  objc_msgSend(v6, "convertPoint:fromView:", 0);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (CGAffineTransform)transform
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tCGFloat x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  [(UITransformEvent *)self scale];
  CGFloat v6 = v5;
  [(UITransformEvent *)self scale];
  CGAffineTransformMakeScale(retstr, v6, v7);
  double rotation = self->_rotation;
  long long v9 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v9;
  *(_OWORD *)&v15.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformRotate(&v16, &v15, rotation);
  long long v10 = *(_OWORD *)&v16.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v16.tx;
  CGFloat x = self->_translation.x;
  *(CGFloat *)&long long v10 = self->_translation.y;
  long long v12 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v15.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v15.c = v12;
  *(_OWORD *)&v15.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGPoint result = CGAffineTransformTranslate(&v16, &v15, x, *(CGFloat *)&v10);
  long long v14 = *(_OWORD *)&v16.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v16.a;
  *(_OWORD *)&retstr->c = v14;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v16.tx;
  return result;
}

- (double)scale
{
  double scale = self->_scale;
  if (scale < 0.0) {
    double scale = 1.0 / (pow(-scale, 1.1) * 1.9 + 1.0) + -1.0;
  }
  return scale + 1.0;
}

- (unint64_t)phase
{
  return _UIEventHIDTransformPhaseForComponentPhases(self->_scalePhase, self->_rotationPhase, self->_translationPhase);
}

- (double)rotation
{
  return self->_rotation;
}

- (CGPoint)translation
{
  double x = self->_translation.x;
  double y = self->_translation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointerAttributes, 0);
  objc_storeStrong((id *)&self->_gestureRecognizersByWindow, 0);
}

@end