@interface TSWPSwipeGestureRecognizer
- (BOOL)p_swipeDirectionValidForAngle:(double)a3 direction:(int)a4;
- (BOOL)p_swipeDirectionValidForXDiff:(double)a3 yDiff:(double)a4;
- (BOOL)p_touchWasSwipe:(id)a3 movedFarOut:(BOOL *)a4;
- (CGPoint)locationInView:(id)a3;
- (double)p_angleDifferenceForAngle1:(double)a3 angle2:(double)a4;
- (int)direction;
- (unint64_t)numberOfTouchesRequired;
- (void)dealloc;
- (void)p_recordTouches:(id)a3;
- (void)reset;
- (void)setDirection:(int)a3;
- (void)setNumberOfTouchesRequired:(unint64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TSWPSwipeGestureRecognizer

- (double)p_angleDifferenceForAngle1:(double)a3 angle2:(double)a4
{
  TSDNormalizeAngleInRadians(a4 - a3);
  return v4 + -3.14159265;
}

- (BOOL)p_swipeDirectionValidForAngle:(double)a3 direction:(int)a4
{
  if (a4 == 1)
  {
    double v4 = 3.14159265;
  }
  else if (a4 == 8)
  {
    double v4 = -1.57079633;
  }
  else
  {
    double v4 = 0.0;
    if (a4 == 4) {
      double v4 = 1.57079633;
    }
  }
  [(TSWPSwipeGestureRecognizer *)self p_angleDifferenceForAngle1:a3 angle2:v4];
  return v5 >= -0.785398163 && v5 <= 0.785398163;
}

- (BOOL)p_swipeDirectionValidForXDiff:(double)a3 yDiff:(double)a4
{
  double v5 = atan2(a4, a3);
  double v6 = v5;
  int mDirection = self->mDirection;
  if ((mDirection & 4) != 0)
  {
    if ([(TSWPSwipeGestureRecognizer *)self p_swipeDirectionValidForAngle:4 direction:v5])
    {
      return 1;
    }
    int mDirection = self->mDirection;
  }
  if (mDirection)
  {
    BOOL v8 = 1;
    if ([(TSWPSwipeGestureRecognizer *)self p_swipeDirectionValidForAngle:1 direction:v6])
    {
      return v8;
    }
    int mDirection = self->mDirection;
  }
  if ((mDirection & 8) != 0)
  {
    if ([(TSWPSwipeGestureRecognizer *)self p_swipeDirectionValidForAngle:8 direction:v6])
    {
      return 1;
    }
    int mDirection = self->mDirection;
  }
  if ((mDirection & 2) == 0) {
    return 0;
  }
  return [(TSWPSwipeGestureRecognizer *)self p_swipeDirectionValidForAngle:2 direction:v6];
}

- (void)p_recordTouches:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(a3);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![(TSUPointerKeyDictionary *)self->mStartLocations objectForKeyedSubscript:v9])
        {
          mStartLocations = self->mStartLocations;
          v11 = (void *)MEMORY[0x263F08D40];
          objc_msgSend(v9, "locationInView:", objc_msgSend(v9, "view"));
          -[TSUPointerKeyDictionary setObject:forUncopiedKey:](mStartLocations, "setObject:forUncopiedKey:", objc_msgSend(v11, "valueWithCGPoint:"), v9);
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  unint64_t v12 = [(TSUPointerKeyDictionary *)self->mStartLocations count];
  if (self->mTouchCountAttained < v12) {
    self->mTouchCountAttained = v12;
  }
}

- (BOOL)p_touchWasSwipe:(id)a3 movedFarOut:(BOOL *)a4
{
  *a4 = 0;
  uint64_t v7 = (void *)-[TSUPointerKeyDictionary objectForKeyedSubscript:](self->mStartLocations, "objectForKeyedSubscript:");
  if (v7)
  {
    [v7 getValue:&v13];
    objc_msgSend(a3, "locationInView:", objc_msgSend(a3, "view"));
    if ((v9 - v14) * (v9 - v14) + (v8 - v13) * (v8 - v13) >= 2500.0)
    {
      *a4 = 1;
      return -[TSWPSwipeGestureRecognizer p_swipeDirectionValidForXDiff:yDiff:](self, "p_swipeDirectionValidForXDiff:yDiff:");
    }
  }
  else
  {
    v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPSwipeGestureRecognizer p_touchWasSwipe:movedFarOut:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSwipeGestureRecognizer.mm"), 109, @"invalid nil value for '%s'", "value");
  }
  return 0;
}

- (CGPoint)locationInView:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = [(TSUPointerKeyDictionary *)self->mStartLocations count];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = (void *)[(TSUPointerKeyDictionary *)self->mStartLocations allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) locationInView:a3];
        double v10 = v10 + v13;
        double v11 = v11 + v14;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }
  double v15 = v10 / (double)v5;
  double v16 = v11 / (double)v5;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)TSWPSwipeGestureRecognizer;
  [(TSWPSwipeGestureRecognizer *)&v10 touchesBegan:a3 withEvent:a4];
  objc_msgSend((id)objc_msgSend(a3, "anyObject"), "timestamp");
  self->mStartTime = v6;
  mStartLocations = self->mStartLocations;
  if (!mStartLocations)
  {
    mStartLocations = (TSUPointerKeyDictionary *)objc_alloc_init(MEMORY[0x263F7C8A8]);
    self->mStartLocations = mStartLocations;
  }
  [(TSUPointerKeyDictionary *)mStartLocations removeAllObjects];
  [(TSWPSwipeGestureRecognizer *)self p_recordTouches:a3];
  unint64_t v8 = [a3 count];
  unint64_t mNumberOfTouchesRequired = self->mNumberOfTouchesRequired;
  if (!objc_msgSend((id)-[TSWPSwipeGestureRecognizer delegate](self, "delegate"), "gestureRecognizerShouldBegin:", self)|| v8 > mNumberOfTouchesRequired)
  {
    [(TSWPSwipeGestureRecognizer *)self setState:5];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)TSWPSwipeGestureRecognizer;
  [(TSWPSwipeGestureRecognizer *)&v17 touchesMoved:a3 withEvent:a4];
  [(TSWPSwipeGestureRecognizer *)self p_recordTouches:a3];
  if (self->mTouchCountAttained <= self->mNumberOfTouchesRequired
    && (objc_msgSend((id)objc_msgSend(a3, "anyObject"), "timestamp"), v6 - self->mStartTime <= 0.150000006))
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(a3);
          }
          uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          char v12 = 0;
          if (![(TSWPSwipeGestureRecognizer *)self p_touchWasSwipe:v11 movedFarOut:&v12])
          {
            if (v12) {
              [(TSWPSwipeGestureRecognizer *)self setState:5];
            }
          }
        }
        uint64_t v8 = [a3 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [(TSWPSwipeGestureRecognizer *)self setState:5];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  -[TSWPSwipeGestureRecognizer p_recordTouches:](self, "p_recordTouches:");
  objc_msgSend((id)objc_msgSend(a3, "anyObject"), "timestamp");
  if (v7 - self->mStartTime <= 0.150000006)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      unsigned __int8 v10 = 0;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(a3);
          }
          uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          char v27 = 0;
          BOOL v14 = [(TSWPSwipeGestureRecognizer *)self p_touchWasSwipe:v13 movedFarOut:&v27];
          if (v27) {
            BOOL v15 = v14;
          }
          else {
            BOOL v15 = 0;
          }
          v10 |= v15;
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v9);
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
    uint64_t v16 = [(TSUPointerKeyDictionary *)self->mStartLocations count];
    if (v16 == [a3 count])
    {
      if (((self->mTouchCountAttained == self->mNumberOfTouchesRequired) & v10) != 0) {
        uint64_t v17 = 3;
      }
      else {
        uint64_t v17 = 5;
      }
      [(TSWPSwipeGestureRecognizer *)self setState:v17];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v18 = [a3 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v24 != v20) {
            objc_enumerationMutation(a3);
          }
          [(TSUPointerKeyDictionary *)self->mStartLocations removeObjectForKey:*(void *)(*((void *)&v23 + 1) + 8 * j)];
        }
        uint64_t v19 = [a3 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v19);
    }
  }
  else
  {
    [(TSWPSwipeGestureRecognizer *)self setState:5];
  }
  v22.receiver = self;
  v22.super_class = (Class)TSWPSwipeGestureRecognizer;
  [(TSWPSwipeGestureRecognizer *)&v22 touchesEnded:a3 withEvent:a4];
}

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPSwipeGestureRecognizer;
  [(TSWPSwipeGestureRecognizer *)&v3 reset];
  [(TSWPSwipeGestureRecognizer *)self delegate];
  [(id)TSUProtocolCast() didReset:self];
  self->mStartTime = -1.0;
  self->mTouchCountAttained = 0;
  [(TSUPointerKeyDictionary *)self->mStartLocations removeAllObjects];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPSwipeGestureRecognizer;
  [(TSWPSwipeGestureRecognizer *)&v3 dealloc];
}

- (unint64_t)numberOfTouchesRequired
{
  return self->mNumberOfTouchesRequired;
}

- (void)setNumberOfTouchesRequired:(unint64_t)a3
{
  self->unint64_t mNumberOfTouchesRequired = a3;
}

- (int)direction
{
  return self->mDirection;
}

- (void)setDirection:(int)a3
{
  self->int mDirection = a3;
}

@end