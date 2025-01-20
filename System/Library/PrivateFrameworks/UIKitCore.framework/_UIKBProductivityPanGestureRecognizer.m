@interface _UIKBProductivityPanGestureRecognizer
+ (id)productivityPanGestureRecognizerWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5;
- (BOOL)isShiftOrMoreKeyForTouch:(id)a3;
- (BOOL)tooMuchSingleMovement;
- (CGPoint)beginPanCentroid;
- (CGPoint)centroidOfTouches:(id)a3;
- (NSMutableDictionary)beginTouchLocations;
- (NSMutableSet)activeTouches;
- (NSMutableSet)shiftTouches;
- (_UIGestureRecognizerTransformAnalyzer)transformAnalyzer;
- (_UIKBProductivityPanGestureRecognizer)initWithCoder:(id)a3;
- (_UIKBProductivityPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)beginPanTimestamp;
- (void)reset;
- (void)setActiveTouches:(id)a3;
- (void)setBeginPanCentroid:(CGPoint)a3;
- (void)setBeginPanTimestamp:(double)a3;
- (void)setBeginTouchLocations:(id)a3;
- (void)setShiftTouches:(id)a3;
- (void)setTooMuchSingleMovement:(BOOL)a3;
- (void)setTransformAnalyzer:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIKBProductivityPanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(_UIKBProductivityPanGestureRecognizer *)self beginPanTimestamp];
  if (v8 == 0.0)
  {
    [v7 timestamp];
    -[_UIKBProductivityPanGestureRecognizer setBeginPanTimestamp:](self, "setBeginPanTimestamp:");
  }
  v49.receiver = self;
  v49.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v49 touchesBegan:v6 withEvent:v7];
  v9 = [(_UIKBProductivityPanGestureRecognizer *)self activeTouches];

  if (!v9)
  {
    v10 = [MEMORY[0x1E4F1CA80] set];
    [(_UIKBProductivityPanGestureRecognizer *)self setActiveTouches:v10];
  }
  v40 = v7;
  v11 = [(_UIKBProductivityPanGestureRecognizer *)self activeTouches];
  [v11 unionSet:v6];

  v12 = [(_UIKBProductivityPanGestureRecognizer *)self beginTouchLocations];

  if (!v12)
  {
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    [(_UIKBProductivityPanGestureRecognizer *)self setBeginTouchLocations:v13];
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  v14 = [(_UIKBProductivityPanGestureRecognizer *)self activeTouches];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v46 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v20 = [(_UIKBProductivityPanGestureRecognizer *)self beginTouchLocations];
        v21 = [v20 objectForKey:v19];

        if (!v21)
        {
          v22 = [(_UIKBProductivityPanGestureRecognizer *)self beginTouchLocations];
          v23 = (void *)MEMORY[0x1E4F29238];
          [v19 locationInView:0];
          v24 = objc_msgSend(v23, "valueWithCGPoint:");
          v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "_touchIdentifier"));
          [v22 setObject:v24 forKey:v25];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v16);
  }

  v26 = [(_UIKBProductivityPanGestureRecognizer *)self activeTouches];
  uint64_t v27 = [v26 count];
  NSUInteger v28 = [(UIPanGestureRecognizer *)self minimumNumberOfTouches];

  if (v27 == v28)
  {
    v29 = [(_UIKBProductivityPanGestureRecognizer *)self activeTouches];
    v30 = [v29 allObjects];
    [(_UIKBProductivityPanGestureRecognizer *)self centroidOfTouches:v30];
    -[_UIKBProductivityPanGestureRecognizer setBeginPanCentroid:](self, "setBeginPanCentroid:");
  }
  else
  {
    -[_UIKBProductivityPanGestureRecognizer setBeginPanCentroid:](self, "setBeginPanCentroid:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  v31 = [(_UIKBProductivityPanGestureRecognizer *)self shiftTouches];

  if (!v31)
  {
    v32 = [MEMORY[0x1E4F1CA80] set];
    [(_UIKBProductivityPanGestureRecognizer *)self setShiftTouches:v32];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v33 = v6;
  uint64_t v34 = [v33 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v35; ++j)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v33);
        }
        uint64_t v38 = *(void *)(*((void *)&v41 + 1) + 8 * j);
        if ([(_UIKBProductivityPanGestureRecognizer *)self isShiftOrMoreKeyForTouch:v38])
        {
          v39 = [(_UIKBProductivityPanGestureRecognizer *)self shiftTouches];
          [v39 addObject:v38];
        }
      }
      uint64_t v35 = [v33 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v35);
  }
}

- (NSMutableSet)activeTouches
{
  return self->_activeTouches;
}

- (NSMutableDictionary)beginTouchLocations
{
  return self->_beginTouchLocations;
}

- (BOOL)isShiftOrMoreKeyForTouch:(id)a3
{
  id v3 = a3;
  v4 = +[UIKeyboardImpl activeInstance];
  v5 = v4;
  if (v4) {
    char v6 = [v4 callLayoutIsGeometricShiftOrMoreKeyForTouch:v3];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (double)beginPanTimestamp
{
  return self->_beginPanTimestamp;
}

+ (id)productivityPanGestureRecognizerWithTarget:(id)a3 action:(SEL)a4 delegate:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  v9 = [[_UIKBProductivityPanGestureRecognizer alloc] initWithTarget:v8 action:a4];

  if (v9)
  {
    [(UIGestureRecognizer *)v9 setAllowedTouchTypes:&unk_1ED3EFC68];
    [(UIGestureRecognizer *)v9 setName:@"com.apple.UIKit.kbProductivity.threeFingerPan"];
    [(UIPanGestureRecognizer *)v9 setDelegate:v7];
    [(UIPanGestureRecognizer *)v9 setMinimumNumberOfTouches:3];
    [(UIGestureRecognizer *)v9 setDelaysTouchesBegan:0];
    [(UIGestureRecognizer *)v9 setDelaysTouchesEnded:0];
    if (_isSystemGestureForDelegate(v7)) {
      [(UIGestureRecognizer *)v9 setCancelsTouchesInView:0];
    }
    [(UIPanGestureRecognizer *)v9 _setFailsPastHysteresisWithoutMinTouches:1];
    v10 = +[_UITextSelectionSettings sharedInstance];
    [v10 allowableSeparation];
    [(UIPanGestureRecognizer *)v9 _setAllowableSeparation:v11 + v11];

    [(UIPanGestureRecognizer *)v9 _setRequiresImmediateMultipleTouches:1];
    [(UIPanGestureRecognizer *)v9 _setAllowableTouchTimeSeparation:0.06];
    v12 = v9;
  }

  return v9;
}

- (void)reset
{
  v7.receiver = self;
  v7.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  [(UIGestureRecognizer *)&v7 reset];
  id v3 = [(_UIKBProductivityPanGestureRecognizer *)self activeTouches];
  [v3 removeAllObjects];

  [(_UIKBProductivityPanGestureRecognizer *)self setActiveTouches:0];
  v4 = [(_UIKBProductivityPanGestureRecognizer *)self shiftTouches];
  [v4 removeAllObjects];

  [(_UIKBProductivityPanGestureRecognizer *)self setShiftTouches:0];
  v5 = [(_UIKBProductivityPanGestureRecognizer *)self beginTouchLocations];
  [v5 removeAllObjects];

  [(_UIKBProductivityPanGestureRecognizer *)self setBeginTouchLocations:0];
  char v6 = [(_UIKBProductivityPanGestureRecognizer *)self transformAnalyzer];
  [v6 reset];

  [(_UIKBProductivityPanGestureRecognizer *)self setBeginPanTimestamp:0.0];
  -[_UIKBProductivityPanGestureRecognizer setBeginPanCentroid:](self, "setBeginPanCentroid:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [(_UIKBProductivityPanGestureRecognizer *)self setActiveTouches:0];
  [(_UIKBProductivityPanGestureRecognizer *)self setShiftTouches:0];
  [(_UIKBProductivityPanGestureRecognizer *)self setTooMuchSingleMovement:0];
}

- (void)setShiftTouches:(id)a3
{
}

- (void)setActiveTouches:(id)a3
{
}

- (void)setBeginTouchLocations:(id)a3
{
}

- (void)setBeginPanTimestamp:(double)a3
{
  self->_beginPanTimestamp = a3;
}

- (void)setBeginPanCentroid:(CGPoint)a3
{
  self->_beginPanCentroid = a3;
}

- (_UIGestureRecognizerTransformAnalyzer)transformAnalyzer
{
  return self->_transformAnalyzer;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v24 touchesEnded:v6 withEvent:a4];
  objc_super v7 = [(UIGestureRecognizer *)self delegate];
  if ((_isSystemGestureForDelegate(v7) & 1) != 0
    || (([(_UIKBProductivityPanGestureRecognizer *)self beginPanCentroid], v9 == *MEMORY[0x1E4F1DAD8])
      ? (BOOL v10 = v8 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
      : (BOOL v10 = 0),
        v10))
  {
  }
  else
  {
    double v11 = [(_UIKBProductivityPanGestureRecognizer *)self activeTouches];
    uint64_t v12 = [v11 count];
    NSUInteger v13 = [(UIPanGestureRecognizer *)self minimumNumberOfTouches];

    if (v12 == v13)
    {
      v14 = [v6 allObjects];
      [(_UIKBProductivityPanGestureRecognizer *)self centroidOfTouches:v14];
      double v16 = v15;
      double v18 = v17;

      [(_UIKBProductivityPanGestureRecognizer *)self beginPanCentroid];
      double v20 = vabdd_f64(v16, v19);
      [(_UIKBProductivityPanGestureRecognizer *)self beginPanCentroid];
      if (v20 <= vabdd_f64(v18, v21)) {
        [(UIGestureRecognizer *)self setState:5];
      }
    }
  }
  v22 = [(_UIKBProductivityPanGestureRecognizer *)self activeTouches];
  [v22 minusSet:v6];

  v23 = [(_UIKBProductivityPanGestureRecognizer *)self shiftTouches];
  [v23 minusSet:v6];
}

- (NSMutableSet)shiftTouches
{
  return self->_shiftTouches;
}

- (void)setTooMuchSingleMovement:(BOOL)a3
{
  *(&self->_tooMuchSingleMovement + 2) = a3;
}

- (_UIKBProductivityPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  v4 = [(UIPanGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4) {
    _UIUndoGestureRecognizerCommonInit(v4);
  }
  return v5;
}

- (_UIKBProductivityPanGestureRecognizer)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  v5 = [(UIPanGestureRecognizer *)&v9 initWithCoder:v4];
  id v6 = v5;
  if (v5)
  {
    _UIUndoGestureRecognizerCommonInit(v5);
    if ([v4 containsValueForKey:@"UIPanGestureRecognizer.minimumNumberOfTouches"]) {
      v6->super._minimumNumberOfTouches = [v4 decodeIntegerForKey:@"UIPanGestureRecognizer.minimumNumberOfTouches"];
    }
    if ([v4 containsValueForKey:@"UIPanGestureRecognizer.maximumNumberOfTouches"]) {
      v6->super._maximumNumberOfTouches = [v4 decodeIntegerForKey:@"UIPanGestureRecognizer.maximumNumberOfTouches"];
    }
    objc_super v7 = v6;
  }

  return v6;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v7 timestamp];
  double v9 = v8;
  [(_UIKBProductivityPanGestureRecognizer *)self beginPanTimestamp];
  double v11 = v10;
  uint64_t v12 = [(UIGestureRecognizer *)self _activeTouchesForEvent:v7];
  NSUInteger v13 = [(_UIKBProductivityPanGestureRecognizer *)self transformAnalyzer];
  [v13 analyzeTouches:v12];

  v45.receiver = self;
  v45.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v45 touchesMoved:v6 withEvent:v7];
  if ((unint64_t)[v12 count] <= 2
    && [(UIGestureRecognizer *)self state] <= UIGestureRecognizerStatePossible)
  {
    v39 = v12;
    id v40 = v6;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v42 != v17) {
            objc_enumerationMutation(v14);
          }
          double v19 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          objc_msgSend(v19, "locationInView:", 0, v39, v40, (void)v41);
          double v21 = v20;
          double v23 = v22;
          objc_super v24 = [(_UIKBProductivityPanGestureRecognizer *)self beginTouchLocations];
          v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v19, "_touchIdentifier"));
          v26 = [v24 objectForKey:v25];
          [v26 CGPointValue];
          double v28 = v27;
          double v30 = v29;

          if (sqrt((v28 - v21) * (v28 - v21) + (v30 - v23) * (v30 - v23)) > 20.0) {
            [(_UIKBProductivityPanGestureRecognizer *)self setTooMuchSingleMovement:1];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v16);
    }

    uint64_t v12 = v39;
    id v6 = v40;
  }
  double v31 = v9 - v11;
  v32 = [(_UIKBProductivityPanGestureRecognizer *)self shiftTouches];
  uint64_t v33 = [v32 count];

  uint64_t v34 = [(_UIKBProductivityPanGestureRecognizer *)self activeTouches];
  if ([v34 count] == 3 || -[UIGestureRecognizer state](self, "state") > UIGestureRecognizerStatePossible)
  {
    BOOL v35 = 1;
  }
  else
  {
    uint64_t v38 = [(_UIKBProductivityPanGestureRecognizer *)self transformAnalyzer];
    BOOL v35 = [v38 dominantComponent] == 1;
  }
  BOOL v36 = [(_UIKBProductivityPanGestureRecognizer *)self tooMuchSingleMovement];
  char v37 = v31 <= 0.18 || v35;
  if (v36 || v33 || (v37 & 1) == 0) {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIKBProductivityPanGestureRecognizer;
  id v6 = a3;
  [(UIPanGestureRecognizer *)&v9 touchesCancelled:v6 withEvent:a4];
  id v7 = [(_UIKBProductivityPanGestureRecognizer *)self activeTouches];
  [v7 minusSet:v6];

  double v8 = [(_UIKBProductivityPanGestureRecognizer *)self shiftTouches];
  [v8 minusSet:v6];
}

- (CGPoint)centroidOfTouches:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    if ([v3 count] == 1)
    {
      id v4 = [v3 objectAtIndexedSubscript:0];
      [v4 locationInView:0];
      double v6 = v5;
      double v8 = v7;
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = v3;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        double v13 = 0.0;
        double v14 = 0.0;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            objc_msgSend(v16, "locationInView:", 0, (void)v21);
            double v14 = v14 + v17;
            [v16 locationInView:0];
            double v13 = v13 + v18;
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v11);
      }
      else
      {
        double v13 = 0.0;
        double v14 = 0.0;
      }

      double v6 = v14 / (double)(unint64_t)[v9 count];
      double v8 = v13 / (double)(unint64_t)[v9 count];
    }
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v19 = v6;
  double v20 = v8;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGPoint)beginPanCentroid
{
  double x = self->_beginPanCentroid.x;
  double y = self->_beginPanCentroid.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTransformAnalyzer:(id)a3
{
}

- (BOOL)tooMuchSingleMovement
{
  return *(&self->_tooMuchSingleMovement + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginTouchLocations, 0);
  objc_storeStrong((id *)&self->_transformAnalyzer, 0);
  objc_storeStrong((id *)&self->_shiftTouches, 0);
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

@end