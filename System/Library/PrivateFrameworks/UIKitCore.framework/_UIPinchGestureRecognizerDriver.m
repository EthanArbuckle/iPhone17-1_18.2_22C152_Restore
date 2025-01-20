@interface _UIPinchGestureRecognizerDriver
- (BOOL)shouldReceiveComponent:(id)a3 withEvent:(id)a4;
- (_UIPinchGestureRecognizerDriver)init;
- (void)_applyScale:(CGFloat)a3 atLocation:(double)a4 touchDistance:(double)a5 withEvent:(double)a6;
- (void)reset;
- (void)setScale:(double *)a1;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)transformChangedWithEvent:(id)a3;
@end

@implementation _UIPinchGestureRecognizerDriver

- (_UIPinchGestureRecognizerDriver)init
{
  v9.receiver = self;
  v9.super_class = (Class)_UIPinchGestureRecognizerDriver;
  v2 = [(_UIGestureRecognizerDriver *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = MEMORY[0x1E4F1DAB8];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v2->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v2->_transform.c = v5;
    *(_OWORD *)&v2->_transform.tx = *(_OWORD *)(v4 + 32);
    v2->_scaleThreshold = 1.0;
    v2->_hysteresis = 8.0;
    v6 = objc_alloc_init(_UIGestureRecognizerTransformAnalyzer);
    transformAnalyzer = v3->_transformAnalyzer;
    v3->_transformAnalyzer = v6;

    [(_UIGestureRecognizerTransformAnalyzer *)v3->_transformAnalyzer setPinchingWeight:4.0];
    [(_UIGestureRecognizerTransformAnalyzer *)v3->_transformAnalyzer setRotationWeight:0.5];
    [(_UIGestureRecognizerTransformAnalyzer *)v3->_transformAnalyzer setTranslationWeight:0.5];
  }
  return v3;
}

- (void)reset
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPinchGestureRecognizerDriver;
  [(_UIGestureRecognizerDriver *)&v5 reset];
  [(_UIGestureRecognizerTransformAnalyzer *)self->_transformAnalyzer reset];
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&self->_transform.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)(v3 + 32);
  self->_previousVelocity = 0.0;
  self->_velocity = 0.0;
  self->_lastNonZeroTimestampDelta = 0.0;
  *(unsigned char *)&self->_flags &= ~2u;
}

- (void)setScale:(double *)a1
{
  if (a1)
  {
    long long v4 = [a1 context];
    objc_super v5 = [v4 activeEventOfType:0];

    if (v5) {
      a1[5] = a1[12] * a1[5] / a2;
    }
    a1[6] = a2;
    a1[12] = a2;
  }
}

- (BOOL)shouldReceiveComponent:(id)a3 withEvent:(id)a4
{
  return (*(unsigned char *)&self->_flags & 2) == 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v6 = [(_UIGestureRecognizerDriver *)self context];
  id v12 = [v6 activeComponentsForEvent:a4];

  if ([v12 count] == 2)
  {
    if (self) {
      double a = self->_transform.a;
    }
    else {
      double a = 0.0;
    }
    self->_initialScale = a;
    v8 = [v12 allObjects];
    _UIGestureRecognizerDistanceBetweenTouches(v8);
    self->_initialTouchDistance = v9 / self->_initialScale;

    [a4 timestamp];
    self->_lastEventTime = v10;
    self->_anchorPoint.x = _CentroidOfTouches(v12, 1);
    self->_anchorPoint.y = v11;
    self->_initialAnchorPoint = self->_anchorPoint;
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v6 = [(_UIGestureRecognizerDriver *)self context];
  v7 = [v6 activeComponentsForEvent:a4];

  if ([v7 count] == 2)
  {
    v8 = [v7 allObjects];
    _UIGestureRecognizerDistanceBetweenTouches(v8);
    double v10 = v9;

    [(_UIGestureRecognizerTransformAnalyzer *)self->_transformAnalyzer analyzeTouches:v7];
    if ([(_UIGestureRecognizerDriver *)self state])
    {
      double initialTouchDistance = self->_initialTouchDistance;
LABEL_4:
      CGFloat v12 = v10 / initialTouchDistance;
      double v13 = _CentroidOfTouches(v7, 1);
      [(_UIPinchGestureRecognizerDriver *)(uint64_t)self _applyScale:v12 atLocation:v13 touchDistance:v14 withEvent:v10];
      goto LABEL_29;
    }
    double hysteresis = self->_hysteresis;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v16 = v7;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(v16);
          }
          if ([*(id *)(*((void *)&v42 + 1) + 8 * i) _isPointerTouch])
          {

            if (fabs(hysteresis + -8.0) <= 2.22044605e-16)
            {
              if (_UIInternalPreferencesRevisionOnce != -1) {
                dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
              }
              int v21 = _UIInternalPreferencesRevisionVar;
              double hysteresis = 2.0;
              if (_UIInternalPreferencesRevisionVar >= 1)
              {
                int v40 = _UIInternalPreference_PinchPointerTouchHysteresis;
                if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_PinchPointerTouchHysteresis)
                {
                  while (v21 >= v40)
                  {
                    _UIInternalPreferenceSync(v21, &_UIInternalPreference_PinchPointerTouchHysteresis, @"PinchPointerTouchHysteresis", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
                    int v40 = _UIInternalPreference_PinchPointerTouchHysteresis;
                    if (v21 == _UIInternalPreference_PinchPointerTouchHysteresis) {
                      goto LABEL_18;
                    }
                  }
                  double hysteresis = *(double *)&qword_1E8FD5140;
                }
              }
            }
            goto LABEL_18;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

LABEL_18:
    if (vabdd_f64(self->_initialTouchDistance * self->_initialScale, v10) > hysteresis)
    {
      v22 = [(_UIGestureRecognizerDriver *)self context];
      v23 = [v22 eventReceivingWindow];
      [v23 _usableBounds];
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      CGFloat v31 = v30;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v32 = v16;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        v41 = v22;
        uint64_t v35 = *(void *)v43;
        while (2)
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v43 != v35) {
              objc_enumerationMutation(v32);
            }
            v48.x = -[UITouch _locationInWindow:](*(double **)(*((void *)&v42 + 1) + 8 * j), v23);
            v48.y = v37;
            v49.origin.x = v25;
            v49.origin.y = v27;
            v49.size.width = v29;
            v49.size.height = v31;
            if (!CGRectContainsPoint(v49, v48))
            {

              goto LABEL_29;
            }
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v34) {
            continue;
          }
          break;
        }

        v22 = v41;
      }
      else
      {
      }
      double v38 = self->_initialTouchDistance;
      double v39 = -hysteresis;
      if (v38 > v10) {
        double v39 = hysteresis;
      }
      double initialTouchDistance = v38 - v39 / self->_initialScale;
      self->_double initialTouchDistance = initialTouchDistance;
      goto LABEL_4;
    }
  }
LABEL_29:
}

- (void)_applyScale:(CGFloat)a3 atLocation:(double)a4 touchDistance:(double)a5 withEvent:(double)a6
{
  if (!a1) {
    return;
  }
  double v12 = *(double *)(a1 + 96);
  [a2 timestamp];
  double v14 = v13;
  double v15 = *(double *)(a1 + 88);
  if (v15 == 1.0)
  {
    char v16 = 0;
  }
  else
  {
    BOOL v17 = v15 <= 1.0 || v15 >= a3;
    char v16 = (v15 >= 1.0 || v15 <= a3) && v17;
  }
  double v19 = *(double *)(a1 + 56);
  *(double *)(a1 + 168) = a4;
  *(double *)(a1 + 176) = a5;
  *(void *)(a1 + 72) = *(void *)(a1 + 64);
  [a2 timestamp];
  *(void *)(a1 + 56) = v20;
  if ([a2 type] || objc_msgSend(*(id *)(a1 + 152), "dominantComponent") == 2)
  {
    double v21 = v14 - v19;
    CGAffineTransformMakeScale(&v30, a3, a3);
    long long v22 = *(_OWORD *)&v30.c;
    *(_OWORD *)(a1 + 96) = *(_OWORD *)&v30.a;
    *(_OWORD *)(a1 + 112) = v22;
    *(_OWORD *)(a1 + 128) = *(_OWORD *)&v30.tx;
    if ([a2 type])
    {
      uint64_t v23 = [a2 type];
      double v24 = a3 - v12;
      if (a3 - v12 < 0.0) {
        double v24 = -(a3 - v12);
      }
      BOOL v25 = v23 == 14 && v24 > 0.0;
    }
    else
    {
      BOOL v25 = 1;
    }
    if (v21 <= 0.0)
    {
      if (v21 != 0.0 || (double v21 = *(double *)(a1 + 80), v21 <= 0.0))
      {
        double v26 = +[UIScreen mainScreen];
        [v26 _refreshRate];
        double v21 = v27;
      }
    }
    else
    {
      *(double *)(a1 + 80) = v21;
    }
    if (!v25) {
      goto LABEL_31;
    }
    double v28 = (a3 - v12) / v21;
  }
  else
  {
    *(double *)(a1 + 40) = a6 / *(double *)(a1 + 96);
    double v28 = 0.0;
  }
  *(double *)(a1 + 64) = v28;
LABEL_31:
  if ([(id)a1 state]) {
    char v29 = 1;
  }
  else {
    char v29 = v16;
  }
  if ((v29 & 1) == 0) {
    -[_UIGestureRecognizerDriver _setState:notifyDelegate:](a1, 1, 1);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6 = [(_UIGestureRecognizerDriver *)self context];
  id v10 = [v6 activeComponentsForEvent:a4];

  uint64_t v7 = [v10 count];
  if (v7)
  {
    if (v7 == 1 && (*(unsigned char *)&self->_flags & 1) != 0)
    {
      int64_t v8 = [(_UIGestureRecognizerDriver *)self state];
LABEL_6:
      if (v8 == 1) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 3;
      }
      -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)self, v9, 1);
    }
  }
  else
  {
    int64_t v8 = [(_UIGestureRecognizerDriver *)self state];
    if (self) {
      goto LABEL_6;
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v6 = [(_UIGestureRecognizerDriver *)self context];
  id v8 = [v6 activeComponentsForEvent:a4];

  uint64_t v7 = [v8 count];
  if (!v7)
  {
    if (!self) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v7 == 1 && (*(unsigned char *)&self->_flags & 1) != 0) {
LABEL_6:
  }
    -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)self, 3, 1);
LABEL_7:
}

- (void)transformChangedWithEvent:(id)a3
{
  objc_super v5 = [(_UIGestureRecognizerDriver *)self context];
  [a3 locationInView:0];
  double v7 = v6;
  double v9 = v8;
  id v10 = [a3 _allWindows];
  CGFloat v11 = [v10 anyObject];
  objc_msgSend(v5, "convertPoint:toSceneReferenceCoordinatesFromView:", v11, v7, v9);
  double v13 = v12;
  double v15 = v14;

  switch([a3 phase])
  {
    case 1:
      if (self) {
        double a = self->_transform.a;
      }
      else {
        double a = 0.0;
      }
      self->_initialScale = a;
      [a3 timestamp];
      self->_lastEventTime = v17;
      self->_anchorPoint.x = v13;
      self->_anchorPoint.y = v15;
      self->_initialAnchorPoint.x = v13;
      self->_initialAnchorPoint.y = v15;
      break;
    case 2:
      [a3 scale];
      double v22 = v21 * self->_initialScale;
      [(_UIPinchGestureRecognizerDriver *)(uint64_t)self _applyScale:v22 atLocation:v13 touchDistance:v15 withEvent:0.0];
      break;
    case 3:
      int64_t v18 = [(_UIGestureRecognizerDriver *)self state];
      if (self)
      {
        if (v18 == 1) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 3;
        }
        uint64_t v20 = self;
        goto LABEL_13;
      }
      break;
    case 4:
      if (self)
      {
        uint64_t v20 = self;
        uint64_t v19 = 3;
LABEL_13:
        -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)v20, v19, 1);
      }
      break;
    default:
      return;
  }
}

- (void).cxx_destruct
{
}

@end