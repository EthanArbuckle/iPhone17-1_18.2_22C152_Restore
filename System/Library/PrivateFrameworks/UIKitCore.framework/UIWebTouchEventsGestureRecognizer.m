@interface UIWebTouchEventsGestureRecognizer
+ (BOOL)_supportsDefaultPressTypes;
+ (BOOL)_supportsDefaultTouchTypes;
+ (void)initialize;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)inJavaScriptGesture;
- (BOOL)isDefaultPrevented;
- (BOOL)isDispatchingTouchEvents;
- (CGPoint)locationInWindow;
- (NSMapTable)activeTouchesByIdentifier;
- (NSMutableArray)touchIdentifiers;
- (NSMutableArray)touchLocations;
- (NSMutableArray)touchPhases;
- (UIWebTouchEventsGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 touchDelegate:(id)a5;
- (const)lastTouchEvent;
- (double)rotation;
- (double)scale;
- (int)type;
- (void)_processTouches:(id)a3 withEvent:(id)a4 type:(int)a5;
- (void)_recordTouches:(id)a3 type:(int)a4;
- (void)_resetGestureRecognizer;
- (void)_updateTapStateWithTouches:(id)a3;
- (void)_updateTapStateWithTouches:(id)a3 type:(int)a4;
- (void)cancel;
- (void)dealloc;
- (void)performAction;
- (void)reset;
- (void)setDefaultPrevented:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation UIWebTouchEventsGestureRecognizer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    do
      _incrementingTouchIdentifier = arc4random();
    while ((_incrementingTouchIdentifier + 1) < 2);
  }
}

- (UIWebTouchEventsGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 touchDelegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UIWebTouchEventsGestureRecognizer;
  v10 = [(UIGestureRecognizer *)&v17 initWithTarget:0 action:0];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak(&v10->_touchTarget, v8);
    if (a4) {
      SEL v12 = a4;
    }
    else {
      SEL v12 = 0;
    }
    v11->_touchAction = v12;
    objc_storeWeak((id *)&v11->_webTouchDelegate, v9);
    v11->_wasExplicitlyCancelled = 0;
    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    activeTouchesByIdentifier = v11->_activeTouchesByIdentifier;
    v11->_activeTouchesByIdentifier = (NSMapTable *)v13;

    v11->_lastTouchEvent.touchPoints = 0;
    v11->_lastTouchEvent.touchPointCount = 0;
    [(UIWebTouchEventsGestureRecognizer *)v11 reset];
    v15 = v11;
  }

  return v11;
}

- (void)dealloc
{
  free(self->_lastTouchEvent.touchPoints);
  v3.receiver = self;
  v3.super_class = (Class)UIWebTouchEventsGestureRecognizer;
  [(UIGestureRecognizer *)&v3 dealloc];
}

- (void)reset
{
  self->_passedHitTest = 0;
  self->_defaultPrevented = 0;
  self->_dispatchingTouchEvents = 0;
  self->_wasExplicitlyCancelled = 0;
  self->_originalGestureDistance = NAN;
  self->_originalGestureAngle = NAN;
  self->_isPotentialTap = 0;
  self->_lastTouchEvent.type = 0;
  self->_lastTouchEvent.timestamp = 0.0;
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_lastTouchEvent.locationInScreenCoordinates = (CGPoint)*MEMORY[0x1E4F1DAD8];
  self->_lastTouchEvent.locationInDocumentCoordinates = v2;
  *(int64x2_t *)&self->_lastTouchEvent.scale = vdupq_n_s64(0x7FF8000000000000uLL);
  self->_lastTouchEvent.inJavaScriptGesture = 0;
  self->_lastTouchEvent.isPotentialTap = 0;
}

- (void)cancel
{
  if (self)
  {
    if ((*(void *)&self->super._gestureFlags & 0x200000000) != 0)
    {
      self->_wasExplicitlyCancelled = 0;
      UIGestureRecognizerState v3 = [(UIGestureRecognizer *)self state];
      if ((unint64_t)v3 <= UIGestureRecognizerStateChanged)
      {
        uint64_t v4 = qword_186B9E7A8[v3];
        self->_wasExplicitlyCancelled = 1;
        [(UIGestureRecognizer *)self setState:v4];
      }
    }
  }
}

- (void)_updateTapStateWithTouches:(id)a3
{
  id v6 = a3;
  if ([v6 count] == 1)
  {
    uint64_t v4 = [v6 anyObject];
    if (v4) {
      BOOL v5 = (v4[118] >> 1) & 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  self->_lastTouchEvent.isPotentialTap = v5;
  self->_isPotentialTap = v5;
}

- (void)_updateTapStateWithTouches:(id)a3 type:(int)a4
{
  id v6 = a3;
  switch(a4)
  {
    case 0:
      goto LABEL_3;
    case 1:
    case 2:
      if (self->_isPotentialTap)
      {
LABEL_3:
        id v7 = v6;
        [(UIWebTouchEventsGestureRecognizer *)self _updateTapStateWithTouches:v6];
        id v6 = v7;
      }
      break;
    case 3:
      self->_lastTouchEvent.isPotentialTap = 0;
      self->_isPotentialTap = 0;
      break;
    default:
      break;
  }
}

- (void)_recordTouches:(id)a3 type:(int)a4
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_lastTouchEvent = &self->_lastTouchEvent;
  unsigned int v86 = a4;
  self->_lastTouchEvent.type = a4;
  self->_lastTouchEvent.inJavaScriptGesture = 0;
  id v8 = (double *)MEMORY[0x1E4F1DAD8];
  self->_dispatchingTouchEvents = 1;
  uint64_t v9 = [v6 count];
  unint64_t v10 = v9;
  if (v9 != self->_lastTouchEvent.touchPointCount)
  {
    self->_lastTouchEvent.touchPointCount = v9;
    self->_lastTouchEvent.touchPoints = (_UIWebTouchPoint *)reallocf(self->_lastTouchEvent.touchPoints, 88 * v9);
  }
  double v12 = *v8;
  double v11 = v8[1];
  uint64_t v13 = [v6 anyObject];
  [v13 timestamp];
  CFTimeInterval v15 = CACurrentMediaTime() - v14;
  double v16 = *MEMORY[0x1E4F1CF78];
  self->_lastTouchEvent.timestamp = v16 + CFAbsoluteTimeGetCurrent() - v15;

  [(NSMapTable *)self->_activeTouchesByIdentifier removeAllObjects];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v17 = v6;
  uint64_t v87 = [v17 countByEnumeratingWithState:&v96 objects:v100 count:16];
  if (!v87)
  {

    double v23 = v12;
    double v22 = v11;
    double v21 = v11;
    double v20 = v12;
    double v75 = v11;
    double v76 = v12;
    goto LABEL_53;
  }
  uint64_t v18 = 0;
  unsigned int v19 = 0;
  unint64_t v81 = v10;
  uint64_t v85 = *(void *)v97;
  double v90 = v12;
  double v91 = v11;
  double v20 = v12;
  double v21 = v11;
  double v92 = v12;
  double v93 = v11;
  double v22 = v11;
  double v23 = v12;
  double v94 = v12;
  double v95 = v11;
  id obj = v17;
  do
  {
    uint64_t v24 = 0;
    uint64_t v82 = v18;
    uint64_t v25 = 88 * v18 + 80;
    do
    {
      if (*(void *)v97 != v85) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v96 + 1) + 8 * v24);
      v27 = objc_getAssociatedObject(v26, &_associatedTouchIdentifierKey);
      int v28 = [v26 _isPointerTouch];
      double v88 = v20;
      double v89 = v21;
      if (v86 || !v28)
      {
        if (v27) {
          goto LABEL_16;
        }
      }
      else
      {
      }
      if (_incrementingTouchIdentifier == -2) {
        int v29 = 1;
      }
      else {
        int v29 = _incrementingTouchIdentifier + 1;
      }
      _incrementingTouchIdentifier = v29;
      v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
      objc_setAssociatedObject(v26, &_associatedTouchIdentifierKey, v27, (void *)1);
LABEL_16:
      [(NSMapTable *)self->_activeTouchesByIdentifier setObject:v26 forKey:v27];
      v30 = p_lastTouchEvent;
      touchPoints = p_lastTouchEvent->touchPoints;
      v32 = (double *)((char *)touchPoints + v25);
      [v26 locationInView:0];
      double v34 = v33;
      double v36 = v35;
      *(v32 - 10) = v33;
      *(v32 - 9) = v35;
      v37 = [(UIGestureRecognizer *)self view];
      objc_msgSend(v37, "convertPoint:fromView:", 0, v34, v36);
      double v39 = v38;
      double v41 = v40;

      *(v32 - 8) = v39;
      *(v32 - 7) = v41;
      *((_DWORD *)v32 - 12) = [v27 unsignedIntValue];
      *((void *)v32 - 5) = [v26 phase];
      [v26 majorRadius];
      *((void *)v32 - 4) = v42;
      [v26 maximumPossibleForce];
      double v43 = 0.0;
      if (v44 > 0.0)
      {
        [v26 force];
        double v84 = v23;
        double v45 = v22;
        double v46 = v12;
        double v47 = v11;
        double v49 = v48;
        [v26 maximumPossibleForce];
        double v43 = v49 / v50;
        double v11 = v47;
        double v12 = v46;
        double v22 = v45;
        double v23 = v84;
      }
      *(v32 - 3) = v43;
      if ([v26 type] == 2)
      {
        *(_DWORD *)((char *)touchPoints + v25) = 1;
        [v26 altitudeAngle];
        *(void *)((char *)touchPoints + v25 - 16) = v51;
        if (v26)
        {
          uint64_t v52 = v26[47];
          goto LABEL_23;
        }
      }
      else
      {
        v53 = (_DWORD *)((char *)touchPoints + v25);
        _DWORD *v53 = 0;
        *((void *)v53 - 2) = 0;
      }
      uint64_t v52 = 0;
LABEL_23:
      p_lastTouchEvent = v30;
      double v55 = v94;
      double v54 = v95;
      double v57 = v90;
      double v56 = v91;
      double v59 = v92;
      double v58 = v93;
      double v60 = v92 + v34;
      double v61 = v93 + v36;
      *(void *)((char *)touchPoints + v25 - 8) = v52;
      if (v19 == 1) {
        double v62 = v41;
      }
      else {
        double v62 = v22;
      }
      unint64_t v63 = *((void *)v32 - 5) - 3;
      if (v19 == 1) {
        double v64 = v39;
      }
      else {
        double v64 = v23;
      }
      if (v19) {
        int v65 = v19 + 1;
      }
      else {
        int v65 = 1;
      }
      if (v19)
      {
        double v66 = v95;
      }
      else
      {
        double v62 = v22;
        double v64 = v23;
        double v66 = v41;
      }
      if (v19) {
        double v67 = v94;
      }
      else {
        double v67 = v39;
      }
      double v68 = v90 + v34;
      double v69 = v91 + v36;
      double v20 = v88;
      double v21 = v89;
      if (v63 <= 1)
      {
        double v57 = v68;
        double v56 = v69;
      }
      double v90 = v57;
      double v91 = v56;
      if (v63 > 1)
      {
        double v11 = v11 + v41;
        double v12 = v12 + v39;
      }
      else
      {
        double v20 = v88 + v39;
        double v21 = v89 + v41;
      }
      if (v63 > 1)
      {
        double v58 = v61;
        double v59 = v60;
      }
      double v92 = v59;
      double v93 = v58;
      if (v63 > 1)
      {
        unsigned int v19 = v65;
        double v22 = v62;
        double v23 = v64;
        double v54 = v66;
        double v55 = v67;
      }
      double v94 = v55;
      double v95 = v54;

      ++v24;
      v25 += 88;
    }
    while (v87 != v24);
    id v17 = obj;
    uint64_t v70 = [obj countByEnumeratingWithState:&v96 objects:v100 count:16];
    uint64_t v18 = v82 + v24;
    uint64_t v87 = v70;
  }
  while (v70);

  if (v19)
  {
    double v71 = v92 / (double)v19;
    double v72 = v93 / (double)v19;
    double v73 = v12 / (double)v19;
    double v74 = v11 / (double)v19;
    double v12 = v94;
    double v11 = v95;
    goto LABEL_54;
  }
  unint64_t v10 = v81;
  double v12 = v94;
  double v11 = v95;
  double v76 = v90;
  double v75 = v91;
LABEL_53:
  unsigned int v19 = 0;
  double v71 = v76 / (double)v10;
  double v72 = v75 / (double)v10;
  double v73 = v20 / (double)v10;
  double v74 = v21 / (double)v10;
LABEL_54:
  p_lastTouchEvent->scale = 0.0;
  p_lastTouchEvent->locationInScreenCoordinates.x = v71;
  p_lastTouchEvent->locationInScreenCoordinates.y = v72;
  p_lastTouchEvent->locationInDocumentCoordinates.x = v73;
  p_lastTouchEvent->locationInDocumentCoordinates.y = v74;
  p_lastTouchEvent->rotation = 0.0;
  if (v19 >= 2)
  {
    float v77 = (v23 - v12) * (v23 - v12) + (v22 - v11) * (v22 - v11);
    p_lastTouchEvent->scale = sqrtf(v77) / self->_originalGestureDistance;
    float v78 = v23 - v12;
    float v79 = v22 - v11;
    float v80 = atan2f(v78, v79) * 180.0 * 0.318309886;
    p_lastTouchEvent->rotation = self->_originalGestureAngle - v80;
    p_lastTouchEvent->inJavaScriptGesture = 1;
  }
  [(UIWebTouchEventsGestureRecognizer *)self _updateTapStateWithTouches:v17 type:v86];
}

- (void)performAction
{
  id WeakRetained = objc_loadWeakRetained(&self->_touchTarget);
  if (self->_touchAction) {
    touchAction = self->_touchAction;
  }
  else {
    touchAction = 0;
  }
  if (dyld_program_sdk_at_least()) {
    objc_msgSend(WeakRetained, touchAction, self);
  }
  else {
    objc_msgSend(WeakRetained, sel_performSelector_withObject_, touchAction, self);
  }
}

- (void)_processTouches:(id)a3 withEvent:(id)a4 type:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v8);
        }
        CFTimeInterval v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v15 phase] != 2)
        {
          uint64_t v16 = [v15 phase];
          if ((uint64_t)v12 <= v16) {
            unint64_t v12 = v16;
          }
        }
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
    if (v12 > 4) {
      int v17 = 1;
    }
    else {
      int v17 = dword_186B9E7C0[v12];
    }
  }
  else
  {
    int v17 = 0;
  }
  if (v17 == v5)
  {
    [(UIWebTouchEventsGestureRecognizer *)self _recordTouches:v8 type:v5];
    [(UIWebTouchEventsGestureRecognizer *)self performAction];
    if (self->_defaultPrevented)
    {
      if ([(UIGestureRecognizer *)self state]) {
        uint64_t v18 = 2;
      }
      else {
        uint64_t v18 = 1;
      }
      [(UIGestureRecognizer *)self setState:v18];
    }
    if (v5 >= 2)
    {
      unsigned int v19 = [(UIGestureRecognizer *)self _activeTouchesForEvent:v9];
      uint64_t v20 = [v19 count];

      if (!v20)
      {
        if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
        {
          uint64_t v21 = 5;
          goto LABEL_29;
        }
        if (v5 == 2)
        {
          uint64_t v21 = 3;
          goto LABEL_29;
        }
        if (v5 == 3)
        {
          uint64_t v21 = 4;
LABEL_29:
          [(UIGestureRecognizer *)self setState:v21];
        }
      }
    }
  }
}

- (void)_resetGestureRecognizer
{
  if (self->_wasExplicitlyCancelled && self->_lastTouchEvent.type <= 1u)
  {
    self->_lastTouchEvent.type = 3;
    uint64_t touchPointCount = self->_lastTouchEvent.touchPointCount;
    if (touchPointCount)
    {
      uint64_t v4 = (void *)((char *)self->_lastTouchEvent.touchPoints + 40);
      do
      {
        *uint64_t v4 = 4;
        v4 += 11;
        --touchPointCount;
      }
      while (touchPointCount);
    }
    [(UIWebTouchEventsGestureRecognizer *)self performAction];
  }
  self->_wasExplicitlyCancelled = 0;
  v5.receiver = self;
  v5.super_class = (Class)UIWebTouchEventsGestureRecognizer;
  [(UIGestureRecognizer *)&v5 _resetGestureRecognizer];
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7 = a4;
  objc_super v5 = [v7 touchesForGestureRecognizer:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webTouchDelegate);
  if ((objc_opt_respondsToSelector() & 1) == 0 || ![WeakRetained shouldIgnoreWebTouch])
  {
    if (self->_passedHitTest)
    {
LABEL_4:
      [(UIWebTouchEventsGestureRecognizer *)self _processTouches:v5 withEvent:v7 type:0];
      goto LABEL_10;
    }
    if (((objc_opt_respondsToSelector() & 1) == 0
       || ([WeakRetained gestureRecognizer:self shouldIgnoreWebTouchWithEvent:v7] & 1) == 0)
      && ([WeakRetained isAnyTouchOverActiveArea:v5] & 1) != 0)
    {
      self->_passedHitTest = 1;
      goto LABEL_4;
    }
  }
  [(UIGestureRecognizer *)self setState:5];
LABEL_10:
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 touchesForGestureRecognizer:self];
  [(UIWebTouchEventsGestureRecognizer *)self _processTouches:v6 withEvent:v5 type:1];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 touchesForGestureRecognizer:self];
  [(UIWebTouchEventsGestureRecognizer *)self _processTouches:v6 withEvent:v5 type:2];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = [v5 touchesForGestureRecognizer:self];
  [(UIWebTouchEventsGestureRecognizer *)self _processTouches:v6 withEvent:v5 type:3];
}

- (const)lastTouchEvent
{
  return &self->_lastTouchEvent;
}

+ (BOOL)_supportsDefaultTouchTypes
{
  return 1;
}

+ (BOOL)_supportsDefaultPressTypes
{
  return 0;
}

- (int)type
{
  return self->_lastTouchEvent.type;
}

- (CGPoint)locationInWindow
{
  double x = self->_lastTouchEvent.locationInDocumentCoordinates.x;
  double y = self->_lastTouchEvent.locationInDocumentCoordinates.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSMutableArray)touchLocations
{
  p_lastTouchEvent = &self->_lastTouchEvent;
  UIGestureRecognizerState v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_lastTouchEvent.touchPointCount];
  if (p_lastTouchEvent->touchPointCount)
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0;
    do
    {
      id v6 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithPoint:", *(double *)((char *)p_lastTouchEvent->touchPoints + v4 + 16), *(double *)((char *)p_lastTouchEvent->touchPoints + v4 + 24));
      [v3 addObject:v6];

      ++v5;
      v4 += 88;
    }
    while (v5 < p_lastTouchEvent->touchPointCount);
  }
  return (NSMutableArray *)v3;
}

- (NSMutableArray)touchIdentifiers
{
  p_lastTouchEvent = &self->_lastTouchEvent;
  UIGestureRecognizerState v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_lastTouchEvent.touchPointCount];
  if (p_lastTouchEvent->touchPointCount)
  {
    unint64_t v4 = 0;
    uint64_t v5 = 32;
    do
    {
      id v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)p_lastTouchEvent->touchPoints + v5)];
      [v3 addObject:v6];

      ++v4;
      v5 += 88;
    }
    while (v4 < p_lastTouchEvent->touchPointCount);
  }
  return (NSMutableArray *)v3;
}

- (NSMutableArray)touchPhases
{
  p_lastTouchEvent = &self->_lastTouchEvent;
  UIGestureRecognizerState v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_lastTouchEvent.touchPointCount];
  if (p_lastTouchEvent->touchPointCount)
  {
    unint64_t v4 = 0;
    uint64_t v5 = 40;
    do
    {
      id v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)((char *)p_lastTouchEvent->touchPoints + v5)];
      [v3 addObject:v6];

      ++v4;
      v5 += 88;
    }
    while (v4 < p_lastTouchEvent->touchPointCount);
  }
  return (NSMutableArray *)v3;
}

- (BOOL)inJavaScriptGesture
{
  return self->_lastTouchEvent.inJavaScriptGesture;
}

- (double)scale
{
  return self->_lastTouchEvent.scale;
}

- (double)rotation
{
  return self->_lastTouchEvent.rotation;
}

- (BOOL)isDefaultPrevented
{
  return self->_defaultPrevented;
}

- (void)setDefaultPrevented:(BOOL)a3
{
  self->_defaultPrevented = a3;
}

- (BOOL)isDispatchingTouchEvents
{
  return self->_dispatchingTouchEvents;
}

- (NSMapTable)activeTouchesByIdentifier
{
  return self->_activeTouchesByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTouchesByIdentifier, 0);
  objc_destroyWeak((id *)&self->_webTouchDelegate);
  objc_destroyWeak(&self->_touchTarget);
}

@end