@interface UIKeyboardPinchGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)pinchDetected;
- (UIKeyboardPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (UIKeyboardPinchGestureRecognizerDelegate)pinchDelegate;
- (double)finalProgressForInitialProgress:(double)result;
- (double)initialPinchSeparation;
- (void)interpretTouchesForSplit;
- (void)reset;
- (void)resetPinchCalculations;
- (void)setPinchDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIKeyboardPinchGestureRecognizer

- (UIKeyboardPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UIKeyboardPinchGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v10 initWithTarget:a3 action:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:2];
    activeTouches = v4->_activeTouches;
    v4->_activeTouches = (NSMutableSet *)v5;

    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    initialTouchPoints = v4->_initialTouchPoints;
    v4->_initialTouchPoints = (NSMutableDictionary *)v7;
  }
  return v4;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [a4 timestamp];
  self->_beginPinchTimestamp = v7;
  [(NSMutableSet *)self->_activeTouches unionSet:v6];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
        v13 = [(UIGestureRecognizer *)self view];
        [v12 locationInView:v13];
        double v15 = v14;
        double v17 = v16;

        initialTouchPoints = self->_initialTouchPoints;
        v19 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v15, v17);
        v20 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v12, "_touchIdentifier"));
        [(NSMutableDictionary *)initialTouchPoints setObject:v19 forKey:v20];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_msgSend(a4, "timestamp", a3);
  if (v5 - self->_beginPinchTimestamp >= 0.01)
  {
    if ([(NSMutableSet *)self->_activeTouches count] == 2)
    {
      [(UIKeyboardPinchGestureRecognizer *)self interpretTouchesForSplit];
    }
    else
    {
      [(UIGestureRecognizer *)self setState:4];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        initialTouchPoints = self->_initialTouchPoints;
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "_touchIdentifier"));
        [(NSMutableDictionary *)initialTouchPoints removeObjectForKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }
  [(NSMutableSet *)self->_activeTouches minusSet:v5];
  if (self->_pinchDetected && (unint64_t)[(NSMutableSet *)self->_activeTouches count] <= 1)
  {
    [(UIGestureRecognizer *)self setState:3];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * j);
          v18 = [(UIKeyboardPinchGestureRecognizer *)self pinchDelegate];
          [v18 pinchDidConsumeTouch:v17];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        initialTouchPoints = self->_initialTouchPoints;
        uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "_touchIdentifier"));
        [(NSMutableDictionary *)initialTouchPoints removeObjectForKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  [(NSMutableSet *)self->_activeTouches minusSet:v5];
  if (self->_pinchDetected && ![(NSMutableSet *)self->_activeTouches count]) {
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (void)reset
{
  self->_pinchDetected = 0;
  self->_beginPinchTimestamp = 0.0;
  [(UIKeyboardPinchGestureRecognizer *)self resetPinchCalculations];
  [(NSMutableDictionary *)self->_initialTouchPoints removeAllObjects];
  [(NSMutableSet *)self->_activeTouches removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardPinchGestureRecognizer;
  [(UIGestureRecognizer *)&v3 reset];
}

- (void)resetPinchCalculations
{
  self->_initialPinchSeparation = 0.0;
  *(_OWORD *)self->_pinchSeparationValues = 0u;
  *(_OWORD *)&self->_pinchSeparationValues[2] = 0u;
}

- (void)interpretTouchesForSplit
{
  if (!self->_pinchDetected || [(NSMutableSet *)self->_activeTouches count] == 2)
  {
    if ((unint64_t)[(NSMutableSet *)self->_activeTouches count] < 2
      || (unint64_t)[(NSMutableSet *)self->_activeTouches count] > 2)
    {
      return;
    }
    objc_super v3 = [(NSMutableSet *)self->_activeTouches allObjects];
    id v48 = [v3 objectAtIndex:0];

    v4 = [(NSMutableSet *)self->_activeTouches allObjects];
    id v5 = [v4 objectAtIndex:1];

    uint64_t v6 = [(UIGestureRecognizer *)self view];
    [v48 locationInView:v6];
    double v8 = v7;
    double v10 = v9;

    uint64_t v11 = [(UIGestureRecognizer *)self view];
    [v5 locationInView:v11];
    double v13 = v12;
    double v15 = v14;

    if (self->_pinchDetected) {
      goto LABEL_10;
    }
    initialTouchPoints = self->_initialTouchPoints;
    long long v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v48, "_touchIdentifier"));
    long long v22 = [(NSMutableDictionary *)initialTouchPoints objectForKey:v21];
    [v22 CGPointValue];
    double v24 = v23;
    double v26 = v25;

    uint64_t v27 = self->_initialTouchPoints;
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v5, "_touchIdentifier"));
    uint64_t v29 = [(NSMutableDictionary *)v27 objectForKey:v28];
    [v29 CGPointValue];
    double v31 = v30;
    double v33 = v32;

    double v34 = v8 - v24;
    double v35 = v13 - v31;
    if (v8 - v24 > 40.0 && v35 > 40.0) {
      goto LABEL_30;
    }
    BOOL v37 = v34 < -40.0;
    if (v35 >= -40.0) {
      BOOL v37 = 0;
    }
    if (fabs(v34) < 40.0 || v37 || fabs(v35) < 40.0) {
      goto LABEL_30;
    }
    uint64_t v38 = [(UIGestureRecognizer *)self delegate];
    if (!v38) {
      goto LABEL_10;
    }
    v39 = (void *)v38;
    float v40 = v13 - v8;
    float v41 = v15 - v10;
    double v42 = hypotf(v40, v41);
    float v43 = v31 - v24;
    float v44 = v33 - v26;
    double v45 = v42 / hypotf(v43, v44);
    v46 = [(UIKeyboardPinchGestureRecognizer *)self pinchDelegate];
    char v47 = [v46 pinchCanBeginWithTouches:self->_activeTouches andScale:v45];

    if (v47)
    {
LABEL_10:
      for (uint64_t i = 0; i != 3; ++i)
        self->_pinchSeparationValues[i] = self->_pinchSeparationValues[i + 1];
      double v17 = vabdd_f64(v8, v13);
      self->_pinchSeparationValues[3] = v17;
      if (!self->_pinchDetected && self->_initialPinchSeparation < 0.00000011920929)
      {
        self->_pinchDetected = 1;
        self->_initialPinchSeparation = v17;
      }
      v18 = [(UIGestureRecognizer *)self delegate];

      if (v18)
      {
        long long v19 = [(UIKeyboardPinchGestureRecognizer *)self pinchDelegate];
        [v19 didDetectPinchWithSeparation:v17];
      }
    }
    else
    {
      [(UIGestureRecognizer *)self setState:5];
    }
LABEL_30:

    return;
  }
  [(UIGestureRecognizer *)self setState:5];
}

- (double)finalProgressForInitialProgress:(double)result
{
  self->_pinchDetected = 0;
  double v3 = self->_pinchSeparationValues[0];
  double v4 = self->_pinchSeparationValues[3];
  if (vabdd_f64(v3, v4) < 40.0)
  {
LABEL_14:
    double v12 = self->_initialPinchSeparation
        + (v4 + v3 + self->_pinchSeparationValues[1] + self->_pinchSeparationValues[2]) * -0.25;
    if (v12 < -40.0) {
      result = 1.0;
    }
    if (v12 > 40.0) {
      return 0.0;
    }
    return result;
  }
  LOBYTE(v5) = 1;
  uint64_t v6 = 1;
  double v7 = self->_pinchSeparationValues[0];
  char v8 = 1;
  LOBYTE(v9) = 1;
  do
  {
    double v10 = self->_pinchSeparationValues[v6];
    int v9 = v9 & (v10 >= v7);
    int v5 = v5 & (v10 <= v7);
    if (v10 == 0.0 || v7 == 0.0) {
      char v8 = 0;
    }
    ++v6;
    double v7 = v10;
  }
  while (v6 != 4);
  if (v8)
  {
    if ((v9 ^ v5))
    {
      result = 1.0;
      if (v5) {
        return 0.0;
      }
      return result;
    }
    goto LABEL_14;
  }
  return result;
}

- (UIKeyboardPinchGestureRecognizerDelegate)pinchDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinchDelegate);
  return (UIKeyboardPinchGestureRecognizerDelegate *)WeakRetained;
}

- (void)setPinchDelegate:(id)a3
{
}

- (BOOL)pinchDetected
{
  return self->_pinchDetected;
}

- (double)initialPinchSeparation
{
  return self->_initialPinchSeparation;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pinchDelegate);
  objc_storeStrong((id *)&self->_initialTouchPoints, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

@end