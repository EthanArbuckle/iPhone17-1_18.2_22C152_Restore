@interface MRGestureRecognizer
- (CGPoint)_localPointFromTouchPoint:(CGPoint)a3;
- (CGSize)referenceSize;
- (MCAction)cancelAction;
- (MCAction)endAction;
- (MCAction)startAction;
- (MCAction)updateAction;
- (MRGestureRecognizer)initWithRenderer:(id)a3 startAction:(id)a4 andSender:(id)a5;
- (NSArray)matrixChain;
- (NSSet)touches;
- (double)referenceScale;
- (double)score;
- (id)description;
- (id)sender;
- (int)state;
- (unsigned)requiredTouchCount;
- (void)_sendAction:(id)a3;
- (void)_sendCancelActions;
- (void)_sendEndActions;
- (void)_sendStartActions;
- (void)_sendUpdateActions;
- (void)abort;
- (void)cleanup;
- (void)recognize;
- (void)setCancelAction:(id)a3;
- (void)setEndAction:(id)a3;
- (void)setMatrixChain:(id)a3;
- (void)setReferenceScale:(double)a3;
- (void)setReferenceSize:(CGSize)a3;
- (void)setRequiredTouchCount:(unsigned __int8)a3;
- (void)setScore:(double)a3;
- (void)setStartAction:(id)a3;
- (void)setState:(int)a3;
- (void)setUpdateAction:(id)a3;
- (void)touchBegan:(id)a3;
- (void)touchEnded:(id)a3;
- (void)touchMoved:(id)a3;
@end

@implementation MRGestureRecognizer

- (MRGestureRecognizer)initWithRenderer:(id)a3 startAction:(id)a4 andSender:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)MRGestureRecognizer;
  v8 = [(MRGestureRecognizer *)&v13 init];
  if (v8)
  {
    v8->_renderer = (MRRenderer *)a3;
    v8->_sender = a5;
    [(MRGestureRecognizer *)v8 setStartAction:a4];
    [(MRRenderer *)v8->_renderer size];
    BOOL v10 = v9 <= 1500.0;
    double v11 = 1.0;
    if (!v10) {
      double v11 = 2.0;
    }
    v8->_referenceScale = v11;
  }
  return v8;
}

- (void)cleanup
{
  self->_renderer = 0;
  self->_automaticStartAction = 0;

  self->_automaticUpdateAction = 0;
  self->_automaticEndAction = 0;

  self->_automaticCancelAction = 0;
  self->_startAction = 0;

  self->_updateAction = 0;
  self->_endAction = 0;

  self->_cancelAction = 0;
  self->_sender = 0;

  self->_matrixChain = 0;
  self->_touchSet = 0;
}

- (MCAction)startAction
{
  return [(MRAction *)self->_startAction mcAction];
}

- (void)setStartAction:(id)a3
{
  if (a3)
  {
    v4 = [[MRAction alloc] initWithAction:a3 inRenderer:self->_renderer];
    self->_startAction = v4;
    sender = self->_sender;
    [(MRAction *)v4 setSender:sender];
  }
}

- (MCAction)updateAction
{
  return [(MRAction *)self->_updateAction mcAction];
}

- (void)setUpdateAction:(id)a3
{
  if (a3)
  {
    v4 = [[MRAction alloc] initWithAction:a3 inRenderer:self->_renderer];
    self->_updateAction = v4;
    sender = self->_sender;
    [(MRAction *)v4 setSender:sender];
  }
}

- (MCAction)endAction
{
  return [(MRAction *)self->_endAction mcAction];
}

- (void)setEndAction:(id)a3
{
  if (a3)
  {
    v4 = [[MRAction alloc] initWithAction:a3 inRenderer:self->_renderer];
    self->_endAction = v4;
    sender = self->_sender;
    [(MRAction *)v4 setSender:sender];
  }
}

- (MCAction)cancelAction
{
  return [(MRAction *)self->_cancelAction mcAction];
}

- (void)setCancelAction:(id)a3
{
  if (a3)
  {
    v4 = [[MRAction alloc] initWithAction:a3 inRenderer:self->_renderer];
    self->_cancelAction = v4;
    sender = self->_sender;
    [(MRAction *)v4 setSender:sender];
  }
}

- (NSSet)touches
{
  return [(MRTouchSet *)self->_touchSet touches];
}

- (void)touchBegan:(id)a3
{
  if ((self->_state & 0x24) == 0)
  {
    [a3 addGestureRecognizer:self];
    touchSet = self->_touchSet;
    if (touchSet)
    {
      [(MRTouchSet *)touchSet addTouch:a3];
      if (self->_requiredTouchCount
        && [(MRTouchSet *)self->_touchSet countOfActiveTouches] > self->_requiredTouchCount)
      {
        [(MRGestureRecognizer *)self abort];
      }
      else
      {
        [(MRTouchSet *)self->_touchSet centroid];
        -[MRGestureRecognizer _localPointFromTouchPoint:](self, "_localPointFromTouchPoint:");
        v7.f64[1] = v6;
        self->_offsetFromCentroid = (CGPoint)vaddq_f64((float64x2_t)self->_offsetFromCentroid, vsubq_f64((float64x2_t)self->_centroidLocation, v7));
        double scale = self->_scale;
        [(MRTouchSet *)self->_touchSet scale];
        self->_ratioFromScale = scale / v9;
        double rotation = self->_rotation;
        [(MRTouchSet *)self->_touchSet rotation];
        self->_offsetFromRotation = rotation - v11;
      }
    }
    else
    {
      self->_touchSet = [[MRTouchSet alloc] initWithTouch:a3];
      [a3 timestamp];
      self->_hitTime = v12;
      self->_previousHitTime = v12;
      self->_startTime = v12;
      [(MRTouchSet *)self->_touchSet centroid];
      -[MRGestureRecognizer _localPointFromTouchPoint:](self, "_localPointFromTouchPoint:");
      self->_previousCentroidLocation.x = v13;
      self->_previousCentroidLocation.y = v14;
      CGPoint previousCentroidLocation = self->_previousCentroidLocation;
      self->_centroidStartLocation = previousCentroidLocation;
      self->_centroidLocation = previousCentroidLocation;
      self->_ratioFromScale = 1.0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&self->_double scale = _Q0;
    }
  }
}

- (void)touchMoved:(id)a3
{
  [a3 timestamp];
  double hitTime = self->_hitTime;
  if (v6 != hitTime)
  {
    self->_previousHitTime = hitTime;
    [a3 timestamp];
    self->_double hitTime = v7;
    self->_CGPoint previousCentroidLocation = self->_centroidLocation;
    [(MRTouchSet *)self->_touchSet centroid];
    -[MRGestureRecognizer _localPointFromTouchPoint:](self, "_localPointFromTouchPoint:");
    self->_centroidLocation.x = v8;
    self->_centroidLocation.y = v9;
    self->_previousScale = self->_scale;
    [(MRTouchSet *)self->_touchSet scale];
    double rotation = self->_rotation;
    self->_double scale = v11 * self->_ratioFromScale;
    self->_previousRotation = rotation;
    double v12 = 6.28318531 / (double)[(MRTouchSet *)self->_touchSet countOfActiveTouches];
    [(MRTouchSet *)self->_touchSet rotation];
    for (double i = v13 + self->_offsetFromRotation; i - rotation >= v12 * 0.5; double i = i - v12)
      ;
    self->_double rotation = i;
    if (i - rotation <= v12 * -0.5)
    {
      do
        double i = v12 + i;
      while (i - rotation <= v12 * -0.5);
      self->_double rotation = i;
    }
  }
}

- (void)touchEnded:(id)a3
{
  [a3 removeGestureRecognizer:self];
  [(MRTouchSet *)self->_touchSet removeTouch:a3];
  if ([(NSSet *)[(MRTouchSet *)self->_touchSet touches] count])
  {
    [(MRTouchSet *)self->_touchSet centroid];
    -[MRGestureRecognizer _localPointFromTouchPoint:](self, "_localPointFromTouchPoint:");
    v6.f64[1] = v5;
    self->_offsetFromCentroid = (CGPoint)vaddq_f64((float64x2_t)self->_offsetFromCentroid, vsubq_f64((float64x2_t)self->_centroidLocation, v6));
    double scale = self->_scale;
    [(MRTouchSet *)self->_touchSet scale];
    self->_ratioFromScale = scale / v8;
    double rotation = self->_rotation;
    [(MRTouchSet *)self->_touchSet rotation];
    self->_offsetFromRotation = rotation + v10;
  }
}

- (void)recognize
{
  self->_state = self->_state & 0xFFFFFFE7 | 0x10;
}

- (void)abort
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = [(MRTouchSet *)self->_touchSet touches];
  id v4 = [(NSSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) removeGestureRecognizer:self];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(MRTouchSet *)self->_touchSet removeAllTouches];
  if (self->_state) {
    [(MRGestureRecognizer *)self _sendCancelActions];
  }
  self->_state = 32;
}

- (id)description
{
  int state = self->_state;
  if (state)
  {
    id v4 = (__CFString *)[@"{ " stringByAppendingString:@"started "];
    int state = self->_state;
    if ((state & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v4 = @"{ ";
  if ((state & 2) != 0)
  {
LABEL_5:
    id v4 = (__CFString *)[(__CFString *)v4 stringByAppendingString:@"updated "];
    int state = self->_state;
  }
LABEL_6:
  if ((state & 4) != 0)
  {
    id v4 = (__CFString *)[(__CFString *)v4 stringByAppendingString:@"ended "];
    int state = self->_state;
    if ((state & 8) == 0)
    {
LABEL_8:
      if ((state & 0x10) == 0) {
        goto LABEL_9;
      }
LABEL_14:
      id v4 = (__CFString *)[(__CFString *)v4 stringByAppendingString:@"recognized "];
      if ((self->_state & 0x20) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((state & 8) == 0)
  {
    goto LABEL_8;
  }
  id v4 = (__CFString *)[(__CFString *)v4 stringByAppendingString:@"can recognize "];
  int state = self->_state;
  if ((state & 0x10) != 0) {
    goto LABEL_14;
  }
LABEL_9:
  if ((state & 0x20) != 0) {
LABEL_10:
  }
    id v4 = (__CFString *)[(__CFString *)v4 stringByAppendingString:@"failed "];
LABEL_11:
  v6.receiver = self;
  v6.super_class = (Class)MRGestureRecognizer;
  return objc_msgSend(-[MRGestureRecognizer description](&v6, "description"), "stringByAppendingFormat:", @" state=%@", -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", @"}"));
}

- (void)_sendStartActions
{
  if (self->_automaticStartAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
  if (self->_startAction)
  {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
}

- (void)_sendUpdateActions
{
  if (self->_automaticUpdateAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
  if (self->_updateAction)
  {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
}

- (void)_sendEndActions
{
  if (self->_automaticEndAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
  if (self->_endAction)
  {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
}

- (void)_sendCancelActions
{
  if (self->_automaticCancelAction) {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
  if (self->_cancelAction)
  {
    -[MRGestureRecognizer _sendAction:](self, "_sendAction:");
  }
}

- (void)_sendAction:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = (NSMutableDictionary *)[self->_sender persistentState];
    if (v5) {
      id v5 = +[NSMutableDictionary dictionaryWithDictionary:v5];
    }
  }
  else
  {
    id v5 = 0;
  }
  [a3 setStates:v5];
  [(MRRenderer *)self->_renderer time];
  objc_msgSend(a3, "setTime:");
  [(MRGestureRecognizer *)self _addSpecificObjectToAction:a3];
  [(MRRenderer *)self->_renderer doAction:a3];
  renderer = self->_renderer;
  [(MRRenderer *)renderer requestRendering:0];
}

- (CGPoint)_localPointFromTouchPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(MRRenderer *)self->_renderer size];
  double v7 = -(v6 - x * 2.0);
  [(MRRenderer *)self->_renderer size];
  double v9 = v7 / v8;
  [(MRRenderer *)self->_renderer size];
  double v11 = -(v10 - y * 2.0);
  [(MRRenderer *)self->_renderer size];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  matrixChain = self->_matrixChain;
  double v14 = v11 / v13;
  id v15 = [(NSArray *)matrixChain countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (double i = 0; i != v16; double i = (char *)i + 1)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(matrixChain);
        }
        double v9 = MRMatrix_UnprojectPoint((float *)[*(id *)(*((void *)&v22 + 1) + 8 * i) bytes], v9, v14);
        double v14 = v19;
      }
      id v16 = [(NSArray *)matrixChain countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v16);
  }
  double v20 = v9 + self->_offsetFromCentroid.x;
  double v21 = v14 * (self->_referenceSize.width / self->_referenceSize.height) + self->_offsetFromCentroid.y;
  result.double y = v21;
  result.double x = v20;
  return result;
}

- (id)sender
{
  return self->_sender;
}

- (NSArray)matrixChain
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setMatrixChain:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_int state = a3;
}

- (CGSize)referenceSize
{
  double width = self->_referenceSize.width;
  double height = self->_referenceSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setReferenceSize:(CGSize)a3
{
  self->_referenceSize = a3;
}

- (double)referenceScale
{
  return self->_referenceScale;
}

- (void)setReferenceScale:(double)a3
{
  self->_referenceScale = a3;
}

- (unsigned)requiredTouchCount
{
  return self->_requiredTouchCount;
}

- (void)setRequiredTouchCount:(unsigned __int8)a3
{
  self->_requiredTouchCount = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

@end