@interface _UIRotationGestureRecognizerDriver
- (BOOL)shouldReceiveComponent:(id)a3 withEvent:(id)a4;
- (_UIRotationGestureRecognizerDriver)init;
- (uint64_t)_setPostRecognitionWeight:(uint64_t)result;
- (uint64_t)_setPreRecognitionWeight:(uint64_t)result;
- (uint64_t)setRotation:(uint64_t)result;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)transformChangedWithEvent:(id)a3;
@end

@implementation _UIRotationGestureRecognizerDriver

- (uint64_t)_setPreRecognitionWeight:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(float *)(result + 112) != a2)
    {
      float v3 = a2;
      *(float *)(result + 112) = v3;
      v4 = *(void **)(result + 96);
      if ((unint64_t)([(id)result state] - 1) >= 2) {
        v5 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__preRecognitionWeight;
      }
      else {
        v5 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__postRecognitionWeight;
      }
      double v6 = *(float *)(v2 + *v5);
      return [v4 setRotationWeight:v6];
    }
  }
  return result;
}

- (_UIRotationGestureRecognizerDriver)init
{
  v9.receiver = self;
  v9.super_class = (Class)_UIRotationGestureRecognizerDriver;
  uint64_t v2 = [(_UIGestureRecognizerDriver *)&v9 init];
  float v3 = v2;
  if (v2)
  {
    v2->_hysteresisEnabled = 1;
    v2->_preRecognitionWeight = 1.0;
    v2->_postRecognitionWeight = 1.0;
    v4 = objc_alloc_init(_UIGestureRecognizerTransformAnalyzer);
    transformAnalyzer = v3->_transformAnalyzer;
    v3->_transformAnalyzer = v4;

    double v6 = v3->_transformAnalyzer;
    if ((unint64_t)([(_UIGestureRecognizerDriver *)v3 state] - 1) >= 2) {
      v7 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__preRecognitionWeight;
    }
    else {
      v7 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__postRecognitionWeight;
    }
    [(_UIGestureRecognizerTransformAnalyzer *)v6 setRotationWeight:*(float *)((char *)&v3->super.super.isa + *v7)];
    [(_UIGestureRecognizerTransformAnalyzer *)v3->_transformAnalyzer setPinchingWeight:0.25];
    [(_UIGestureRecognizerTransformAnalyzer *)v3->_transformAnalyzer setTranslationWeight:0.25];
  }
  return v3;
}

- (void)reset
{
  v6.receiver = self;
  v6.super_class = (Class)_UIRotationGestureRecognizerDriver;
  [(_UIGestureRecognizerDriver *)&v6 reset];
  [(_UIGestureRecognizerTransformAnalyzer *)self->_transformAnalyzer reset];
  transformAnalyzer = self->_transformAnalyzer;
  if ((unint64_t)([(_UIGestureRecognizerDriver *)self state] - 1) >= 2) {
    v4 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__preRecognitionWeight;
  }
  else {
    v4 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__postRecognitionWeight;
  }
  [(_UIGestureRecognizerTransformAnalyzer *)transformAnalyzer setRotationWeight:*(float *)((char *)&self->super.super.isa + *v4)];
  self->_initialTouchAngle = 0.0;
  self->_currentTouchAngle = 0.0;
  self->_previousVelocity = 0.0;
  self->_velocity = 0.0;
  self->_currentRotationCount = 0;
  touches = self->_touches;
  self->_touches = 0;

  *(unsigned char *)&self->_flags &= ~1u;
}

- (uint64_t)setRotation:(uint64_t)result
{
  if (result)
  {
    double v2 = *(double *)(result + 56) + a2;
    *(double *)(result + 48) = v2;
    *(void *)(result + 64) = 0;
    uint64_t v3 = 0;
    if (v2 > 3.14159265)
    {
      do
      {
        ++v3;
        double v2 = v2 + -6.28318531;
      }
      while (v2 > 3.14159265);
      *(void *)(result + 64) = v3;
      *(double *)(result + 48) = v2;
    }
    if (v2 < -3.14159265)
    {
      do
      {
        --v3;
        double v2 = v2 + 6.28318531;
      }
      while (v2 < -3.14159265);
      *(void *)(result + 64) = v3;
      *(double *)(result + 48) = v2;
    }
  }
  return result;
}

- (uint64_t)_setPostRecognitionWeight:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    if (*(float *)(result + 116) != a2)
    {
      float v3 = a2;
      *(float *)(result + 116) = v3;
      v4 = *(void **)(result + 96);
      if ((unint64_t)([(id)result state] - 1) >= 2) {
        v5 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__preRecognitionWeight;
      }
      else {
        v5 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__postRecognitionWeight;
      }
      double v6 = *(float *)(v2 + *v5);
      return [v4 setRotationWeight:v6];
    }
  }
  return result;
}

- (BOOL)shouldReceiveComponent:(id)a3 withEvent:(id)a4
{
  return (*(unsigned char *)&self->_flags & 1) == 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  double v6 = [(_UIGestureRecognizerDriver *)self context];
  id v28 = [v6 activeComponentsForEvent:a4];

  BOOL v7 = [v28 count] == 2;
  v8 = v28;
  if (v7)
  {
    [a4 timestamp];
    self->_lastTouchTime = v9;
    self->_anchorPoint.x = _CentroidOfTouches(v28, 1);
    self->_anchorPoint.y = v10;
    self->_initialAnchorPoint = self->_anchorPoint;
    v11 = [v28 allObjects];
    touches = self->_touches;
    self->_touches = v11;

    *(unsigned char *)&self->_flags |= 1u;
    _UIGestureRecognizerDistanceBetweenTouches(self->_touches);
    self->_initialTouchDistance = v13;
    v14 = [(NSArray *)self->_touches objectAtIndexedSubscript:0];
    [v14 locationInView:0];
    double v16 = v15;
    double v18 = v17;

    v19 = [(NSArray *)self->_touches objectAtIndexedSubscript:1];
    [v19 locationInView:0];
    double v21 = v20;
    double v23 = v22;

    double v24 = atan2(v18 - v23, v21 - v16);
    self->_double initialTouchAngle = v24 + self->_initialTouchAngle - self->_currentTouchAngle;
    self->_currentTouchAngle = v24;
    double initialTouchAngle = self->_initialTouchAngle;
    if (initialTouchAngle > 3.14159265)
    {
      int64_t currentRotationCount = self->_currentRotationCount;
      do
      {
        ++currentRotationCount;
        double initialTouchAngle = initialTouchAngle + -6.28318531;
      }
      while (initialTouchAngle > 3.14159265);
      self->_int64_t currentRotationCount = currentRotationCount;
      self->_double initialTouchAngle = initialTouchAngle;
    }
    v8 = v28;
    if (initialTouchAngle < -3.14159265)
    {
      int64_t v27 = self->_currentRotationCount;
      do
      {
        --v27;
        double initialTouchAngle = initialTouchAngle + 6.28318531;
      }
      while (initialTouchAngle < -3.14159265);
      self->_int64_t currentRotationCount = v27;
      self->_double initialTouchAngle = initialTouchAngle;
      v8 = v28;
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(_UIGestureRecognizerDriver *)self context];
  v8 = [v7 activeComponentsForEvent:a4];

  if ([v8 count] != 2) {
    goto LABEL_39;
  }
  double v9 = [(NSArray *)self->_touches objectAtIndexedSubscript:0];
  [v9 locationInView:0];
  double v11 = v10;
  double v13 = v12;

  v14 = [(NSArray *)self->_touches objectAtIndexedSubscript:1];
  [v14 locationInView:0];
  double v16 = v15;
  double v18 = v17;

  long double v19 = atan2(v13 - v18, v16 - v11);
  double currentTouchAngle = self->_currentTouchAngle;
  uint64_t v21 = 64;
  int64_t currentRotationCount = self->_currentRotationCount;
  double v23 = v19 - currentTouchAngle;
  [a4 timestamp];
  double v25 = v24;
  uint64_t v26 = 72;
  double lastTouchTime = self->_lastTouchTime;
  [(_UIGestureRecognizerTransformAnalyzer *)self->_transformAnalyzer analyzeTouches:v8];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v28 = a3;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v29)
  {
    uint64_t v48 = 72;
    uint64_t v49 = 64;
    int64_t v30 = currentRotationCount;
    uint64_t v31 = *(void *)v51;
    while (2)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v51 != v31) {
          objc_enumerationMutation(v28);
        }
        if (objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * i), "_isPointerTouch", v48, v49, (void)v50))
        {
          LOBYTE(v29) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v29) {
        continue;
      }
      break;
    }
LABEL_12:
    int64_t currentRotationCount = v30;
    uint64_t v26 = v48;
    uint64_t v21 = v49;
  }

  if (fabs(v23) > 1.57079633)
  {
    uint64_t v33 = *(uint64_t *)((char *)&self->super.super.isa + v21);
    if (v23 >= 0.0) {
      v34 = (objc_class *)(v33 + 1);
    }
    else {
      v34 = (objc_class *)(v33 - 1);
    }
    *(Class *)((char *)&self->super.super.isa + v21) = v34;
  }
  if ([(_UIGestureRecognizerDriver *)self state] || !self->_hysteresisEnabled) {
    goto LABEL_19;
  }
  v40 = [v8 allObjects];
  _UIGestureRecognizerDistanceBetweenTouches(v40);
  double v42 = v41;

  if (v29)
  {
    int v43 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_PointerTouchRotationHysteresis, @"PointerTouchRotationHysteresis");
    double v44 = *(double *)&qword_1E8FD52D8;
    if (v43) {
      double v44 = 1.0;
    }
  }
  else
  {
    double v44 = sqrt(fmin(fabs((v42 - self->_initialTouchDistance) / self->_initialTouchDistance), 1.0)) * 5.0 + 5.0;
  }
  float v45 = v44;
  double v46 = (float)(v45 * 0.017453);
  double initialTouchAngle = self->_initialTouchAngle;
  if (vabdd_f64(initialTouchAngle, v19) > v46)
  {
    if (initialTouchAngle <= v19) {
      double v46 = -v46;
    }
    self->_double initialTouchAngle = initialTouchAngle - v46;
LABEL_19:
    self->_anchorPoint.x = _CentroidOfTouches(v8, 1);
    self->_anchorPoint.y = v35;
    self->_previousVelocity = self->_velocity;
    [a4 timestamp];
    *(Class *)((char *)&self->super.super.isa + v26) = v36;
    self->_double currentTouchAngle = v19;
    if ((v29 & 1) != 0
      || [(_UIGestureRecognizerTransformAnalyzer *)self->_transformAnalyzer dominantComponent] == 3)
    {
      double v37 = v25 - lastTouchTime;
      if (v25 - lastTouchTime > 0.0)
      {
        double v37 = (currentTouchAngle
             - self->_currentTouchAngle
             + (double)(*(unint64_t *)((char *)&self->super.super.isa + v21) - currentRotationCount) * 6.28318531)
            / v37;
        self->_velocity = v37;
      }
      if (![(_UIGestureRecognizerDriver *)self state])
      {
        -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)self, 1, 1);
        transformAnalyzer = self->_transformAnalyzer;
        if ((unint64_t)([(_UIGestureRecognizerDriver *)self state] - 1) >= 2) {
          v39 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__preRecognitionWeight;
        }
        else {
          v39 = &OBJC_IVAR____UIRotationGestureRecognizerDriver__postRecognitionWeight;
        }
        [(_UIGestureRecognizerTransformAnalyzer *)transformAnalyzer setRotationWeight:*(float *)((char *)&self->super.super.isa + *v39)];
      }
    }
    else
    {
      self->_double initialTouchAngle = v23 + self->_initialTouchAngle;
      self->_velocity = 0.0;
    }
  }
LABEL_39:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  double v6 = [(_UIGestureRecognizerDriver *)self context];
  id v9 = [v6 activeComponentsForEvent:a4];

  if (![v9 count])
  {
    int64_t v7 = [(_UIGestureRecognizerDriver *)self state];
    if (self)
    {
      if (v7 == 1) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 3;
      }
      -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)self, v8, 1);
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (self) {
    -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)self, 3, 1);
  }
}

- (void)transformChangedWithEvent:(id)a3
{
  p_anchorPoint = &self->_anchorPoint;
  double v6 = [(_UIGestureRecognizerDriver *)self context];
  [a3 locationInView:0];
  double v8 = v7;
  double v10 = v9;
  double v11 = [a3 _allWindows];
  double v12 = [v11 anyObject];
  objc_msgSend(v6, "convertPoint:toSceneReferenceCoordinatesFromView:", v12, v8, v10);
  p_anchorPoint->x = v13;
  p_anchorPoint->y = v14;

  switch([a3 phase])
  {
    case 1:
      self->_double initialTouchAngle = 0.0;
      self->_initialAnchorPoint = *p_anchorPoint;
      [a3 timestamp];
      self->_double lastTouchTime = v15;
      break;
    case 2:
      self->_previousVelocity = self->_velocity;
      int64_t currentRotationCount = self->_currentRotationCount;
      [a3 rotation];
      double v18 = v17;
      double currentTouchAngle = self->_currentTouchAngle;
      [a3 timestamp];
      double v21 = v20;
      double lastTouchTime = self->_lastTouchTime;
      [a3 timestamp];
      self->_double lastTouchTime = v23;
      double v24 = vabdd_f64(v18, currentTouchAngle);
      if (v24 > 1.57079633)
      {
        int64_t v25 = self->_currentRotationCount;
        double v24 = v18 - currentTouchAngle;
        if (v18 - currentTouchAngle >= 0.0) {
          int64_t v26 = v25 + 1;
        }
        else {
          int64_t v26 = v25 - 1;
        }
        self->_int64_t currentRotationCount = v26;
      }
      if ([(_UIGestureRecognizerDriver *)self state]) {
        goto LABEL_19;
      }
      int v27 = _UIInternalPreferenceUsesDefault_1((int *)&_UIInternalPreference_TransformEventRotationHysteresis, @"TransformEventRotationHysteresis");
      float v28 = *(double *)&qword_1E8FD52E8;
      double v29 = (float)(v28 * 0.017453);
      if (v27) {
        double v29 = 0.0174532924;
      }
      double v30 = -v18;
      if (v18 >= 0.0) {
        double v30 = v18;
      }
      if (v30 > v29)
      {
LABEL_19:
        double v31 = v21 - lastTouchTime;
        self->_double currentTouchAngle = v18;
        if (v21 - lastTouchTime > 0.0)
        {
          double v32 = -(currentTouchAngle - v18);
          if (currentTouchAngle - v18 >= 0.0) {
            double v32 = currentTouchAngle - v18;
          }
          if (v32 > 0.0)
          {
            double v31 = (currentTouchAngle - v18 + (double)(self->_currentRotationCount - currentRotationCount) * 6.28318531)
                / v31;
            self->_velocity = v31;
          }
        }
        if (![(_UIGestureRecognizerDriver *)self state])
        {
          v34 = self;
          uint64_t v33 = 1;
          goto LABEL_27;
        }
      }
      break;
    case 3:
      if ([(_UIGestureRecognizerDriver *)self state] == 1) {
        uint64_t v33 = 2;
      }
      else {
        uint64_t v33 = 3;
      }
      v34 = self;
      goto LABEL_27;
    case 4:
      v34 = self;
      uint64_t v33 = 3;
LABEL_27:
      -[_UIGestureRecognizerDriver _setState:notifyDelegate:]((uint64_t)v34, v33, 1);
      break;
    default:
      return;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_transformAnalyzer, 0);
}

@end