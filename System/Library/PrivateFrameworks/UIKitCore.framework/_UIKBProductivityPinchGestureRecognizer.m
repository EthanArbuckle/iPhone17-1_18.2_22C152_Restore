@interface _UIKBProductivityPinchGestureRecognizer
+ (id)productivityPinchGestureRecognizerWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5;
- (BOOL)sufficientMotionInDirection:(int64_t)a3 withLocation:(CGPoint)a4 withScale:(double)a5 withAngle:(double)a6;
- (BOOL)tooMuchSingleMovement;
- (CGPoint)beginCentroid;
- (CGPoint)centroidOfTouches:(id)a3;
- (NSMutableArray)activeTouches;
- (NSMutableDictionary)beginTouchLocations;
- (_UIKBProductivityPinchGestureRecognizer)initWithCoder:(id)a3;
- (_UIKBProductivityPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)allowableElapsedTimeForAllRequiredTouches;
- (double)avgDistanceToCentroid:(id)a3;
- (double)avgTouchesToCentroidDistance;
- (double)beforeReductionTimeInterval;
- (double)beginPerimeter;
- (double)beginPinchTimestamp;
- (double)perimeterOfTouches:(id)a3;
- (double)scale;
- (int64_t)pinchDirection;
- (int64_t)pinchDirectionWithCurrentTime:(double)a3 perimeter:(double)a4;
- (void)_updateTransformAnalyzerWeights;
- (void)clearMultitouchTimer;
- (void)multitouchExpired:(id)a3;
- (void)reset;
- (void)setActiveTouches:(id)a3;
- (void)setAllowableElapsedTimeForAllRequiredTouches:(double)a3;
- (void)setBeforeReductionTimeInterval:(double)a3;
- (void)setBeginCentroid:(CGPoint)a3;
- (void)setBeginPerimeter:(double)a3;
- (void)setBeginPinchTimestamp:(double)a3;
- (void)setBeginTouchLocations:(id)a3;
- (void)setTooMuchSingleMovement:(BOOL)a3;
- (void)startMultitouchTimer:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIKBProductivityPinchGestureRecognizer

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  self->_hasFailedOnOtherDominantMotion = 0;
  id v5 = a3;
  v6 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  v7 = [v5 allObjects];

  [v6 removeObjectsInArray:v7];
  v8 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  unint64_t v9 = [v8 count];
  unint64_t v10 = self->_numberOfTouchesRequired - 1;

  if (v9 < v10)
  {
    if (self->_recognized)
    {
      self->_recognized = 0;
      uint64_t v11 = 3;
    }
    else
    {
      uint64_t v11 = 5;
    }
    [(UIGestureRecognizer *)self setState:v11];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v7 timestamp];
  -[_UIKBProductivityPinchGestureRecognizer setBeginPinchTimestamp:](self, "setBeginPinchTimestamp:");
  v34 = v7;
  v8 = [(UIGestureRecognizer *)self _activeTouchesForEvent:v7];
  unint64_t v9 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];

  if (!v9)
  {
    unint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    [(_UIKBProductivityPinchGestureRecognizer *)self setActiveTouches:v10];
  }
  uint64_t v11 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  v35 = v6;
  v12 = [v6 allObjects];
  [v11 addObjectsFromArray:v12];

  v13 = [(_UIKBProductivityPinchGestureRecognizer *)self beginTouchLocations];

  if (!v13)
  {
    v14 = [MEMORY[0x1E4F1CA60] dictionary];
    [(_UIKBProductivityPinchGestureRecognizer *)self setBeginTouchLocations:v14];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v15 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v37 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        v21 = [(_UIKBProductivityPinchGestureRecognizer *)self beginTouchLocations];
        v22 = [v21 objectForKey:v20];

        if (!v22)
        {
          v23 = [(_UIKBProductivityPinchGestureRecognizer *)self beginTouchLocations];
          v24 = (void *)MEMORY[0x1E4F29238];
          [v20 locationInView:0];
          v25 = objc_msgSend(v24, "valueWithCGPoint:");
          v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "_touchIdentifier"));
          [v23 setObject:v25 forKey:v26];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v17);
  }

  v27 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  unint64_t v28 = [v27 count];

  unint64_t numberOfTouchesRequired = self->_numberOfTouchesRequired;
  if (v28 >= numberOfTouchesRequired)
  {
    if (!self->_recognized)
    {
      self->_hasFailedOnOtherDominantMotion = 0;
      self->_recognized = 0;
      v31 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
      [(_UIKBProductivityPinchGestureRecognizer *)self perimeterOfTouches:v31];
      -[_UIKBProductivityPinchGestureRecognizer setBeginPerimeter:](self, "setBeginPerimeter:");

      [(UIGestureRecognizer *)self _centroidOfTouches:v8 excludingEnded:1];
      -[_UIKBProductivityPinchGestureRecognizer setBeginCentroid:](self, "setBeginCentroid:");
      [(_UIKBProductivityPinchGestureRecognizer *)self setBeforeReductionTimeInterval:0.0];
      [(UIGestureRecognizer *)self setState:1];
      self->_pinchDirection = 0;
      v32 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
      [(_UIKBProductivityPinchGestureRecognizer *)self avgDistanceToCentroid:v32];
      self->_avgTouchesToCentroidDistance = v33;

      goto LABEL_23;
    }
  }
  else if (!self->_recognized)
  {
    [(_UIKBProductivityPinchGestureRecognizer *)self allowableElapsedTimeForAllRequiredTouches];
    if (v30 > 0.0)
    {
      [(_UIKBProductivityPinchGestureRecognizer *)self allowableElapsedTimeForAllRequiredTouches];
      -[_UIKBProductivityPinchGestureRecognizer startMultitouchTimer:](self, "startMultitouchTimer:");
      goto LABEL_23;
    }
    unint64_t numberOfTouchesRequired = self->_numberOfTouchesRequired;
  }
  if (v28 == numberOfTouchesRequired) {
    [(_UIKBProductivityPinchGestureRecognizer *)self clearMultitouchTimer];
  }
LABEL_23:
}

- (NSMutableArray)activeTouches
{
  return self->_activeTouches;
}

- (NSMutableDictionary)beginTouchLocations
{
  return self->_beginTouchLocations;
}

- (double)allowableElapsedTimeForAllRequiredTouches
{
  return self->_allowableElapsedTimeForAllRequiredTouches;
}

- (void)startMultitouchTimer:(double)a3
{
  [(_UIKBProductivityPinchGestureRecognizer *)self clearMultitouchTimer];
  self->_multitouchTimerEnabled = 1;
  [(_UIKBProductivityPinchGestureRecognizer *)self performSelector:sel_multitouchExpired_ withObject:0 afterDelay:a3];
}

- (void)reset
{
  v7.receiver = self;
  v7.super_class = (Class)_UIKBProductivityPinchGestureRecognizer;
  [(UIGestureRecognizer *)&v7 reset];
  v3 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  [v3 removeAllObjects];

  [(_UIKBProductivityPinchGestureRecognizer *)self setActiveTouches:0];
  v4 = [(_UIKBProductivityPinchGestureRecognizer *)self beginTouchLocations];
  [v4 removeAllObjects];

  [(_UIKBProductivityPinchGestureRecognizer *)self setBeginTouchLocations:0];
  [(_UIKBProductivityPinchGestureRecognizer *)self setBeginPinchTimestamp:0.0];
  [(_UIKBProductivityPinchGestureRecognizer *)self setBeforeReductionTimeInterval:0.0];
  [(_UIKBProductivityPinchGestureRecognizer *)self setBeginPerimeter:0.0];
  -[_UIKBProductivityPinchGestureRecognizer setBeginCentroid:](self, "setBeginCentroid:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(_UIKBProductivityPinchGestureRecognizer *)self setTooMuchSingleMovement:0];
  self->_pinchDirection = 0;
  self->_recognized = 0;
  self->_hasFailedOnOtherDominantMotion = 0;
  [(_UIKBProductivityPinchGestureRecognizer *)self clearMultitouchTimer];
  [self->_transformAnalyzer reset];
  [(_UIKBProductivityPinchGestureRecognizer *)self _updateTransformAnalyzerWeights];
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&self->_transform.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&self->_transform.c = v6;
  *(_OWORD *)&self->_transform.tx = *(_OWORD *)(v5 + 32);
}

- (void)setBeginTouchLocations:(id)a3
{
}

- (void)setBeginPinchTimestamp:(double)a3
{
  self->_beginPinchTimestamp = a3;
}

- (void)setActiveTouches:(id)a3
{
}

- (void)clearMultitouchTimer
{
  if (self->_multitouchTimerEnabled) {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_multitouchExpired_ object:0];
  }
  self->_multitouchTimerEnabled = 0;
}

- (void)setTooMuchSingleMovement:(BOOL)a3
{
  self->_tooMuchSingleMovement = a3;
}

- (void)setBeginPerimeter:(double)a3
{
  self->_beginPerimeter = a3;
}

- (void)setBeginCentroid:(CGPoint)a3
{
  self->_beginCentroid = a3;
}

- (void)setBeforeReductionTimeInterval:(double)a3
{
  self->_beforeReductionTimeInterval = a3;
}

- (void)_updateTransformAnalyzerWeights
{
  double v2 = 0.330000013;
  if ((unint64_t)(self->super._state - 1) < 3) {
    double v2 = 1.0;
  }
  [self->_transformAnalyzer setPinchingWeight:v2];
}

+ (id)productivityPinchGestureRecognizerWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  unint64_t v9 = [[_UIKBProductivityPinchGestureRecognizer alloc] initWithTarget:v8 action:a4];

  if (v9)
  {
    [(UIGestureRecognizer *)v9 setAllowedTouchTypes:&unk_1ED3EFC80];
    [(UIGestureRecognizer *)v9 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v9 setDelaysTouchesEnded:0];
    if (_isSystemGestureForDelegate(v7)) {
      [(UIGestureRecognizer *)v9 setCancelsTouchesInView:0];
    }
    [(UIGestureRecognizer *)v9 setName:@"com.apple.UIKit.kbProductivity.threeFingerPinch"];
    [(UIGestureRecognizer *)v9 setDelegate:v7];
    [(_UIKBProductivityPinchGestureRecognizer *)v9 setAllowableElapsedTimeForAllRequiredTouches:0.06];
    unint64_t v10 = v9;
  }

  return v9;
}

- (BOOL)sufficientMotionInDirection:(int64_t)a3 withLocation:(CGPoint)a4 withScale:(double)a5 withAngle:(double)a6
{
  if (a3 == 3)
  {
    double v11 = fabs(a6);
    double v12 = 0.314159265;
LABEL_8:
    BOOL v13 = v11 <= v12;
    return !v13;
  }
  if (a3 == 2)
  {
    double v11 = vabdd_f64(1.0, a5);
    double v12 = 0.08;
    goto LABEL_8;
  }
  if (a3 != 1) {
    return 0;
  }
  double y = a4.y;
  double x = a4.x;
  [(_UIKBProductivityPinchGestureRecognizer *)self beginCentroid];
  if (vabdd_f64(x, v9) > 10.0) {
    return 1;
  }
  [(_UIKBProductivityPinchGestureRecognizer *)self beginCentroid];
  BOOL v13 = vabdd_f64(y, v14) <= 10.0;
  return !v13;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  id v8 = [v6 setWithArray:v7];

  [v5 timestamp];
  double v10 = v9;
  [(_UIKBProductivityPinchGestureRecognizer *)self beginPinchTimestamp];
  uint64_t v12 = 336;
  if (!self->_hasFailedOnOtherDominantMotion)
  {
    double v13 = v11;
    if ([v8 count] == self->_numberOfTouchesRequired)
    {
      [self->_transformAnalyzer analyzeTouches:v8];
      double v14 = [v8 allObjects];
      [(_UIKBProductivityPinchGestureRecognizer *)self perimeterOfTouches:v14];
      double v16 = v15;

      [(_UIKBProductivityPinchGestureRecognizer *)self beginPerimeter];
      memset(&v51, 0, sizeof(v51));
      CGAffineTransformMakeScale(&v51, v16 / v17, v16 / v17);
      uint64_t v18 = [self->_transformAnalyzer dominantComponent];
      [(UIGestureRecognizer *)self _centroidOfTouches:v8 excludingEnded:1];
      BOOL v19 = -[_UIKBProductivityPinchGestureRecognizer sufficientMotionInDirection:withLocation:withScale:withAngle:](self, "sufficientMotionInDirection:withLocation:withScale:withAngle:", v18);
      BOOL v20 = v19;
      if (!self->_recognized && v19 && [self->_transformAnalyzer dominantComponent] != 2)
      {
        [(UIGestureRecognizer *)self setState:5];
        self->_hasFailedOnOtherDominantMotion = 1;
      }
      if ([self->_transformAnalyzer dominantComponent] == 2)
      {
        long long v21 = *(_OWORD *)&v51.c;
        *(_OWORD *)&self->_transform.a = *(_OWORD *)&v51.a;
        *(_OWORD *)&self->_transform.c = v21;
        *(_OWORD *)&self->_transform.tdouble x = *(_OWORD *)&v51.tx;
        BOOL recognized = self->_recognized;
        if (!self->_recognized && v20)
        {
          self->_BOOL recognized = 1;
          [(_UIKBProductivityPinchGestureRecognizer *)self _updateTransformAnalyzerWeights];
          [(UIGestureRecognizer *)self setState:1];
          [v5 timestamp];
          self->_pinchDirection = -[_UIKBProductivityPinchGestureRecognizer pinchDirectionWithCurrentTime:perimeter:](self, "pinchDirectionWithCurrentTime:perimeter:");
          v24 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
          [(_UIKBProductivityPinchGestureRecognizer *)self avgDistanceToCentroid:v24];
          self->_avgTouchesToCentroidDistance = v25;

          BOOL recognized = self->_recognized;
        }
        if (recognized || [(UIGestureRecognizer *)self state] == UIGestureRecognizerStateChanged)
        {
          [(UIGestureRecognizer *)self setState:2];
          [v5 timestamp];
          self->_pinchDirection = -[_UIKBProductivityPinchGestureRecognizer pinchDirectionWithCurrentTime:perimeter:](self, "pinchDirectionWithCurrentTime:perimeter:");
          v26 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
          [(_UIKBProductivityPinchGestureRecognizer *)self avgDistanceToCentroid:v26];
          self->_avgTouchesToCentroidDistance = v27;
        }
      }
      else if (!self->_recognized)
      {
        [(_UIKBProductivityPinchGestureRecognizer *)self setBeginPerimeter:v16 / self->_transform.a];
      }
    }
    else if ([(UIGestureRecognizer *)self state] <= UIGestureRecognizerStatePossible)
    {
      uint64_t v45 = 336;
      v46 = v8;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v28 = v8;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v48 != v31) {
              objc_enumerationMutation(v28);
            }
            double v33 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            objc_msgSend(v33, "locationInView:", 0, v45, v46, (void)v47);
            double v35 = v34;
            double v37 = v36;
            long long v38 = [(_UIKBProductivityPinchGestureRecognizer *)self beginTouchLocations];
            long long v39 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v33, "_touchIdentifier"));
            v40 = [v38 objectForKey:v39];
            [v40 CGPointValue];
            double v42 = v41;
            double v44 = v43;

            if (sqrt((v42 - v35) * (v42 - v35) + (v44 - v37) * (v44 - v37)) > 20.0) {
              [(_UIKBProductivityPinchGestureRecognizer *)self setTooMuchSingleMovement:1];
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v47 objects:v52 count:16];
        }
        while (v30);
      }

      uint64_t v12 = v45;
      id v8 = v46;
    }
    if ([(_UIKBProductivityPinchGestureRecognizer *)self tooMuchSingleMovement]
      || v10 - v13 > 0.05 && [(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
    {
      [(UIGestureRecognizer *)self setState:5];
      *((unsigned char *)&self->super.super.isa + v12) = 1;
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->_BOOL recognized = 0;
  self->_hasFailedOnOtherDominantMotion = 0;
  id v5 = a3;
  long long v6 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  id v7 = [v5 allObjects];

  [v6 removeObjectsInArray:v7];
  id v8 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  unint64_t v9 = [v8 count];
  unint64_t numberOfTouchesRequired = self->_numberOfTouchesRequired;

  if (v9 < numberOfTouchesRequired)
  {
    self->_pinchDirection = 0;
    if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateBegan)
    {
      uint64_t v11 = 4;
    }
    else if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateChanged)
    {
      uint64_t v11 = 4;
    }
    else
    {
      uint64_t v11 = 5;
    }
    [(UIGestureRecognizer *)self setState:v11];
  }
}

- (void)multitouchExpired:(id)a3
{
  v4 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  unint64_t v5 = [v4 count];
  unint64_t numberOfTouchesRequired = self->_numberOfTouchesRequired;

  if (v5 < numberOfTouchesRequired)
  {
    [(_UIKBProductivityPinchGestureRecognizer *)self clearMultitouchTimer];
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (_UIKBProductivityPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIKBProductivityPinchGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  unint64_t v5 = v4;
  if (v4)
  {
    _UIUndoPinchGestureRecognizerCommonInit((uint64_t)v4);
    long long v6 = v5;
  }

  return v5;
}

- (_UIKBProductivityPinchGestureRecognizer)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIKBProductivityPinchGestureRecognizer;
  v3 = [(UIGestureRecognizer *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    _UIUndoPinchGestureRecognizerCommonInit((uint64_t)v3);
    unint64_t v5 = v4;
  }

  return v4;
}

- (double)scale
{
  return self->_transform.a;
}

- (int64_t)pinchDirectionWithCurrentTime:(double)a3 perimeter:(double)a4
{
  [(_UIKBProductivityPinchGestureRecognizer *)self beginPinchTimestamp];
  long long v6 = [(_UIKBProductivityPinchGestureRecognizer *)self activeTouches];
  [(_UIKBProductivityPinchGestureRecognizer *)self centroidOfTouches:v6];
  double v8 = v7;
  double v10 = v9;

  [(_UIKBProductivityPinchGestureRecognizer *)self beginCentroid];
  double v12 = vabdd_f64(v8, v11);
  [(_UIKBProductivityPinchGestureRecognizer *)self beginCentroid];
  if (v12 <= vabdd_f64(v10, v13) * 5.0)
  {
    [(_UIKBProductivityPinchGestureRecognizer *)self beginCentroid];
    double v17 = vabdd_f64(v10, v16);
    [(_UIKBProductivityPinchGestureRecognizer *)self beginCentroid];
    double v19 = vabdd_f64(v8, v18) * 5.0;
    BOOL v15 = v17 > v19;
    [(_UIKBProductivityPinchGestureRecognizer *)self beginPerimeter];
    if (v20 <= a4) {
      goto LABEL_7;
    }
    if (v17 <= v19) {
      return 8;
    }
LABEL_6:
    [(_UIKBProductivityPinchGestureRecognizer *)self beginPerimeter];
    return 8 * (v21 * 0.8 >= a4);
  }
  [(_UIKBProductivityPinchGestureRecognizer *)self beginPerimeter];
  if (v14 > a4) {
    goto LABEL_6;
  }
  BOOL v15 = 1;
LABEL_7:
  [(_UIKBProductivityPinchGestureRecognizer *)self beginPerimeter];
  if (v23 >= a4) {
    int64_t result = 0;
  }
  else {
    int64_t result = 10;
  }
  if (v23 < a4 && v15)
  {
    [(_UIKBProductivityPinchGestureRecognizer *)self beginPerimeter];
    if (v24 * 1.2 <= a4) {
      return 10;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (double)perimeterOfTouches:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = 0.0;
  if ((unint64_t)[v4 count] >= 2)
  {
    long long v6 = [v4 objectAtIndexedSubscript:0];
    v26[0] = v6;
    double v7 = [v4 objectAtIndexedSubscript:1];
    v26[1] = v7;
    double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    double v9 = v8;
    double v10 = 0.0;
    if (self)
    {
      _UIGestureRecognizerDistanceBetweenTouches(v8);
      double v5 = v11;
    }

    if ([v4 count] == 3)
    {
      double v12 = [v4 objectAtIndexedSubscript:1];
      v25[0] = v12;
      double v13 = [v4 objectAtIndexedSubscript:2];
      v25[1] = v13;
      double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      BOOL v15 = v14;
      if (self)
      {
        _UIGestureRecognizerDistanceBetweenTouches(v14);
        double v10 = v16;
      }
    }
    double v17 = 0.0;
    if ([v4 count] == 3)
    {
      double v18 = [v4 objectAtIndexedSubscript:0];
      v24[0] = v18;
      double v19 = [v4 objectAtIndexedSubscript:2];
      v24[1] = v19;
      double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
      double v21 = v20;
      if (self)
      {
        _UIGestureRecognizerDistanceBetweenTouches(v20);
        double v17 = v22;
      }
    }
    double v5 = v5 + v10 + v17;
  }

  return v5;
}

- (CGPoint)centroidOfTouches:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    long long v6 = [v3 objectAtIndexedSubscript:0];
    [v6 locationInView:0];
    double v8 = v7;
    double v10 = v9;

    double v11 = [v3 objectAtIndexedSubscript:1];
    [v11 locationInView:0];
    double v13 = v12;
    double v15 = v14;

    if ([v3 count] == 3)
    {
      double v16 = [v3 objectAtIndexedSubscript:2];
      [v16 locationInView:0];
      double v18 = v17;
      double v20 = v19;
    }
    else
    {
      double v18 = *MEMORY[0x1E4F1DAD8];
      double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    double v5 = (v8 + v13 + v18) / 3.0;
    double v4 = (v10 + v15 + v20) / 3.0;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DAD8];
    double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v21 = v5;
  double v22 = v4;
  result.double y = v22;
  result.double x = v21;
  return result;
}

- (double)avgDistanceToCentroid:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ((unint64_t)[v4 count] >= 2)
  {
    [(_UIKBProductivityPinchGestureRecognizer *)self centroidOfTouches:v4];
    double v7 = v6;
    double v9 = v8;
    if ((unint64_t)[v4 count] > 2)
    {
      unint64_t v10 = 3;
    }
    else
    {
      unint64_t v10 = [v4 count];
      if (!v10)
      {
        double v11 = 0.0;
LABEL_8:
        double v5 = v11 / (double)v10;
        goto LABEL_9;
      }
    }
    uint64_t v12 = 0;
    double v11 = 0.0;
    do
    {
      double v13 = [v4 objectAtIndexedSubscript:v12];
      [v13 locationInView:0];
      double v11 = v11 + sqrt((v14 - v7) * (v14 - v7) + (v15 - v9) * (v15 - v9));

      ++v12;
    }
    while (v10 != v12);
    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (double)avgTouchesToCentroidDistance
{
  return self->_avgTouchesToCentroidDistance;
}

- (int64_t)pinchDirection
{
  return self->_pinchDirection;
}

- (double)beginPinchTimestamp
{
  return self->_beginPinchTimestamp;
}

- (double)beforeReductionTimeInterval
{
  return self->_beforeReductionTimeInterval;
}

- (double)beginPerimeter
{
  return self->_beginPerimeter;
}

- (CGPoint)beginCentroid
{
  double x = self->_beginCentroid.x;
  double y = self->_beginCentroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAllowableElapsedTimeForAllRequiredTouches:(double)a3
{
  self->_allowableElapsedTimeForAllRequiredTouches = a3;
}

- (BOOL)tooMuchSingleMovement
{
  return self->_tooMuchSingleMovement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginTouchLocations, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
  objc_storeStrong(&self->_transformAnalyzer, 0);
}

@end