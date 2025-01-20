@interface TVRUIStandardTouchProcessor
- (CGPoint)_virtualTouchLocationForTouchPoint:(CGPoint)a3;
- (CGPoint)startingPoint;
- (CGRect)_calculateVirtualBoundingBox:(CGPoint)a3 sizingRatio:(double)a4 swipeDirection:(int64_t)a5;
- (CGRect)virtualBoundingBox;
- (NSMutableSet)endedTouches;
- (NSMutableSet)startingTouches;
- (TVRButtonHaptic)haptic;
- (TVRUIStandardTouchProcessor)initWithTouchpadView:(id)a3;
- (UIView)debugView;
- (UIView)touchpadView;
- (_TVRUIEventDelegate)eventDelegate;
- (double)previousTimestamp;
- (double)previousVelocity;
- (id)_touchEventForTouch:(id)a3;
- (int64_t)_calculateDominantSwipeDirection:(CGPoint)a3 toPoint:(CGPoint)a4;
- (int64_t)startingSwipeDirection;
- (int64_t)touchCnt;
- (void)_cleanupOnTouchesEnded;
- (void)_configureGestureRecognizersOnView;
- (void)_endAndRestartTouchesManually:(id)a3;
- (void)_processTouches:(id)a3;
- (void)_sendSelectButtonPressBegan;
- (void)_sendSelectButtonPressEnded;
- (void)handleLongPress:(id)a3;
- (void)handleTapGesture:(id)a3;
- (void)setDebugView:(id)a3;
- (void)setEndedTouches:(id)a3;
- (void)setEventDelegate:(id)a3;
- (void)setHaptic:(id)a3;
- (void)setPreviousTimestamp:(double)a3;
- (void)setPreviousVelocity:(double)a3;
- (void)setStartingPoint:(CGPoint)a3;
- (void)setStartingSwipeDirection:(int64_t)a3;
- (void)setStartingTouches:(id)a3;
- (void)setTouchCnt:(int64_t)a3;
- (void)setTouchpadView:(id)a3;
- (void)setVirtualBoundingBox:(CGRect)a3;
- (void)touchesBegan:(id)a3 touches:(id)a4 withEvent:(id)a5;
- (void)touchesCancelled:(id)a3 touches:(id)a4 withEvent:(id)a5;
- (void)touchesEnded:(id)a3 touches:(id)a4 withEvent:(id)a5;
- (void)touchesMoved:(id)a3 touches:(id)a4 withEvent:(id)a5;
@end

@implementation TVRUIStandardTouchProcessor

- (TVRUIStandardTouchProcessor)initWithTouchpadView:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TVRUIStandardTouchProcessor;
  v6 = [(TVRUIStandardTouchProcessor *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_touchpadView, a3);
    [(TVRUIStandardTouchProcessor *)v7 _configureGestureRecognizersOnView];
    uint64_t v8 = +[TVRButtonHaptic hapticForView:v5];
    haptic = v7->_haptic;
    v7->_haptic = (TVRButtonHaptic *)v8;
  }
  return v7;
}

- (void)touchesBegan:(id)a3 touches:(id)a4 withEvent:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = [v7 anyObject];
  v10 = [(TVRUIStandardTouchProcessor *)self touchpadView];
  [v9 preciseLocationInView:v10];
  -[TVRUIStandardTouchProcessor setStartingPoint:](self, "setStartingPoint:");

  objc_super v11 = [MEMORY[0x263EFF9C0] set];
  [(TVRUIStandardTouchProcessor *)self setStartingTouches:v11];

  v12 = [MEMORY[0x263EFF9C0] set];
  [(TVRUIStandardTouchProcessor *)self setEndedTouches:v12];

  -[TVRUIStandardTouchProcessor setVirtualBoundingBox:](self, "setVirtualBoundingBox:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  [(TVRUIStandardTouchProcessor *)self setPreviousVelocity:0.0];
  [(TVRUIStandardTouchProcessor *)self setPreviousTimestamp:0.0];
  [(TVRUIStandardTouchProcessor *)self setTouchCnt:0];
  v13 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[TVRUIStandardTouchProcessor touchesBegan:touches:withEvent:]((uint64_t)v7, v13);
  }
  v28 = v7;

  v14 = [v8 allTouches];
  v15 = [v14 allObjects];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v16 = v15;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v22 = [v16 indexOfObject:v21];
        if (v22 >= 0) {
          uint64_t v23 = v22 + 1;
        }
        else {
          uint64_t v23 = 1;
        }
        v24 = [_TVRUITouch alloc];
        [v21 timestamp];
        v26 = -[_TVRUITouch initWithTimestamp:touchPhase:fingerIndex:](v24, "initWithTimestamp:touchPhase:fingerIndex:", [v21 phase], v23, v25);
        v27 = [(TVRUIStandardTouchProcessor *)self startingTouches];
        [v27 addObject:v26];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v18);
  }
}

- (void)touchesMoved:(id)a3 touches:(id)a4 withEvent:(id)a5
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [v6 anyObject];
  id v8 = [(TVRUIStandardTouchProcessor *)self touchpadView];
  [v7 preciseLocationInView:v8];
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  [(TVRUIStandardTouchProcessor *)self virtualBoundingBox];
  if (!CGRectIsEmpty(v52))
  {
    [(TVRUIStandardTouchProcessor *)self virtualBoundingBox];
    if (!CGRectIsNull(v53)) {
      goto LABEL_19;
    }
  }
  v13 = [(TVRUIStandardTouchProcessor *)self startingTouches];
  if ([v13 count])
  {
    [(TVRUIStandardTouchProcessor *)self startingPoint];
    double v15 = v14;
    double v17 = v16;
    double v18 = *MEMORY[0x263F00148];
    double v19 = *(double *)(MEMORY[0x263F00148] + 8);

    if (v15 != v18 || v17 != v19) {
      goto LABEL_11;
    }
  }
  else
  {
  }
  v21 = [v6 anyObject];
  uint64_t v22 = [(TVRUIStandardTouchProcessor *)self touchpadView];
  [v21 preciseLocationInView:v22];
  -[TVRUIStandardTouchProcessor setStartingPoint:](self, "setStartingPoint:");

  uint64_t v23 = [_TVRUITouch alloc];
  [v21 timestamp];
  v24 = -[_TVRUITouch initWithTimestamp:touchPhase:fingerIndex:](v23, "initWithTimestamp:touchPhase:fingerIndex:", 0, 1);
  double v25 = [(TVRUIStandardTouchProcessor *)self startingTouches];
  [v25 addObject:v24];

  v26 = [(TVRUIStandardTouchProcessor *)self endedTouches];
  [v26 removeAllObjects];

LABEL_11:
  [(TVRUIStandardTouchProcessor *)self startingPoint];
  int64_t v27 = -[TVRUIStandardTouchProcessor _calculateDominantSwipeDirection:toPoint:](self, "_calculateDominantSwipeDirection:toPoint:");
  [(TVRUIStandardTouchProcessor *)self startingPoint];
  -[TVRUIStandardTouchProcessor _calculateVirtualBoundingBox:sizingRatio:swipeDirection:](self, "_calculateVirtualBoundingBox:sizingRatio:swipeDirection:", v27);
  -[TVRUIStandardTouchProcessor setVirtualBoundingBox:](self, "setVirtualBoundingBox:");
  [(TVRUIStandardTouchProcessor *)self setStartingSwipeDirection:v27];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v28 = [(TVRUIStandardTouchProcessor *)self startingTouches];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v45;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v45 != v31) {
          objc_enumerationMutation(v28);
        }
        v33 = *(void **)(*((void *)&v44 + 1) + 8 * v32);
        [(TVRUIStandardTouchProcessor *)self startingPoint];
        -[TVRUIStandardTouchProcessor _virtualTouchLocationForTouchPoint:](self, "_virtualTouchLocationForTouchPoint:");
        double v35 = v34;
        double v37 = v36;
        v38 = [TVRUITouchEvent alloc];
        [v33 timestamp];
        v40 = -[TVRUITouchEvent initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:](v38, "initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:", [v33 phase], 1, v39, v35, v37);
        v41 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
        [v41 generatedTouchEvent:v40];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v30);
  }

LABEL_19:
  [(TVRUIStandardTouchProcessor *)self virtualBoundingBox];
  v50.x = v10;
  v50.y = v12;
  if (CGRectContainsPoint(v54, v50))
  {
    [(TVRUIStandardTouchProcessor *)self _processTouches:v6];
  }
  else
  {
    v42 = [(TVRUIStandardTouchProcessor *)self touchpadView];
    [v42 bounds];
    v51.x = v10;
    v51.y = v12;
    BOOL v43 = CGRectContainsPoint(v55, v51);

    if (v43) {
      [(TVRUIStandardTouchProcessor *)self _endAndRestartTouchesManually:v6];
    }
  }
}

- (void)_endAndRestartTouchesManually:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v31;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
        CGFloat v10 = [(TVRUIStandardTouchProcessor *)self touchpadView];
        [v9 preciseLocationInView:v10];
        -[TVRUIStandardTouchProcessor _virtualTouchLocationForTouchPoint:](self, "_virtualTouchLocationForTouchPoint:");

        double v11 = [(TVRUIStandardTouchProcessor *)self endedTouches];
        char v12 = [v11 containsObject:v9];

        if ((v12 & 1) == 0)
        {
          v13 = [TVRUITouchEvent alloc];
          [v9 timestamp];
          double v14 = -[TVRUITouchEvent initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:](v13, "initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:", 3, 1);
          double v15 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
          [v15 generatedTouchEvent:v14];

          double v16 = [(TVRUIStandardTouchProcessor *)self endedTouches];
          [v16 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v6);
  }
  [(TVRUIStandardTouchProcessor *)self _cleanupOnTouchesEnded];
  double v17 = [v4 anyObject];
  double v18 = [(TVRUIStandardTouchProcessor *)self touchpadView];
  [v17 previousLocationInView:v18];
  -[TVRUIStandardTouchProcessor setStartingPoint:](self, "setStartingPoint:");

  [(TVRUIStandardTouchProcessor *)self startingPoint];
  double v20 = v19;
  double v22 = v21;
  uint64_t v23 = [(TVRUIStandardTouchProcessor *)self touchpadView];
  [v17 preciseLocationInView:v23];
  int64_t v26 = -[TVRUIStandardTouchProcessor _calculateDominantSwipeDirection:toPoint:](self, "_calculateDominantSwipeDirection:toPoint:", v20, v22, v24, v25);

  [(TVRUIStandardTouchProcessor *)self setStartingSwipeDirection:v26];
  [(TVRUIStandardTouchProcessor *)self startingPoint];
  -[TVRUIStandardTouchProcessor _calculateVirtualBoundingBox:sizingRatio:swipeDirection:](self, "_calculateVirtualBoundingBox:sizingRatio:swipeDirection:", v26);
  -[TVRUIStandardTouchProcessor setVirtualBoundingBox:](self, "setVirtualBoundingBox:");
  [(TVRUIStandardTouchProcessor *)self startingPoint];
  -[TVRUIStandardTouchProcessor _virtualTouchLocationForTouchPoint:](self, "_virtualTouchLocationForTouchPoint:");
  int64_t v27 = [TVRUITouchEvent alloc];
  [v17 timestamp];
  v28 = -[TVRUITouchEvent initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:](v27, "initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:", 0, 1);
  uint64_t v29 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
  [v29 generatedTouchEvent:v28];

  [(TVRUIStandardTouchProcessor *)self _processTouches:v4];
}

- (void)touchesEnded:(id)a3 touches:(id)a4 withEvent:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = _TVRUIViewControllerLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v41 = v6;
    _os_log_impl(&dword_227326000, v7, OS_LOG_TYPE_DEFAULT, "TouchesEnded: touches: %@", buf, 0xCu);
  }

  [(TVRUIStandardTouchProcessor *)self virtualBoundingBox];
  if (CGRectIsNull(v43))
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v34 + 1) + 8 * v12) tapCount])
          {
            double v24 = _TVRUIViewControllerLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
              -[TVRUIStandardTouchProcessor touchesEnded:touches:withEvent:](v24);
            }

            uint64_t v25 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
            if (v25)
            {
              int64_t v26 = (void *)v25;
              int64_t v27 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
              char v28 = objc_opt_respondsToSelector();

              if (v28)
              {
                [(TVRUIStandardTouchProcessor *)self _sendSelectButtonPressBegan];
                [(TVRUIStandardTouchProcessor *)self _sendSelectButtonPressEnded];
                [(TVRButtonHaptic *)self->_haptic userInteractionBegan];
                block[0] = MEMORY[0x263EF8330];
                block[1] = 3221225472;
                block[2] = __62__TVRUIStandardTouchProcessor_touchesEnded_touches_withEvent___block_invoke;
                block[3] = &unk_2647FFF70;
                block[4] = self;
                dispatch_async(MEMORY[0x263EF83A0], block);
              }
            }
            [(TVRUIStandardTouchProcessor *)self _cleanupOnTouchesEnded];

            goto LABEL_32;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  v13 = [(TVRUIStandardTouchProcessor *)self endedTouches];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    double v15 = [MEMORY[0x263EFF9C0] set];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v30;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v30 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * v20);
          double v22 = [(TVRUIStandardTouchProcessor *)self endedTouches];
          char v23 = [v22 containsObject:v21];

          if ((v23 & 1) == 0) {
            [v15 addObject:v21];
          }
          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v18);
    }

    [(TVRUIStandardTouchProcessor *)self _processTouches:v15];
  }
  else
  {
    [(TVRUIStandardTouchProcessor *)self _processTouches:v6];
  }
  [(TVRUIStandardTouchProcessor *)self _cleanupOnTouchesEnded];
LABEL_32:
}

uint64_t __62__TVRUIStandardTouchProcessor_touchesEnded_touches_withEvent___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) userInteractionEnded];
}

- (void)touchesCancelled:(id)a3 touches:(id)a4 withEvent:(id)a5
{
  [(TVRUIStandardTouchProcessor *)self _processTouches:a4];
  [(TVRUIStandardTouchProcessor *)self _cleanupOnTouchesEnded];
}

- (void)_processTouches:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [(TVRUIStandardTouchProcessor *)self _touchEventForTouch:*(void *)(*((void *)&v15 + 1) + 8 * v8)];
        uint64_t v10 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
        if (v10)
        {
          uint64_t v11 = (void *)v10;
          uint64_t v12 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
          char v13 = objc_opt_respondsToSelector();

          if (v13)
          {
            uint64_t v14 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
            [v14 generatedTouchEvent:v9];
          }
        }

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)_cleanupOnTouchesEnded
{
  -[TVRUIStandardTouchProcessor setVirtualBoundingBox:](self, "setVirtualBoundingBox:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
  v3 = [(TVRUIStandardTouchProcessor *)self startingTouches];
  [v3 removeAllObjects];

  id v4 = [(TVRUIStandardTouchProcessor *)self endedTouches];
  [v4 removeAllObjects];

  double v5 = *MEMORY[0x263F00148];
  double v6 = *(double *)(MEMORY[0x263F00148] + 8);
  -[TVRUIStandardTouchProcessor setStartingPoint:](self, "setStartingPoint:", v5, v6);
}

- (id)_touchEventForTouch:(id)a3
{
  id v4 = a3;
  double v5 = [(TVRUIStandardTouchProcessor *)self touchpadView];
  [v4 preciseLocationInView:v5];
  -[TVRUIStandardTouchProcessor _virtualTouchLocationForTouchPoint:](self, "_virtualTouchLocationForTouchPoint:");
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [TVRUITouchEvent alloc];
  [v4 timestamp];
  double v12 = v11;
  uint64_t v13 = [v4 phase];

  uint64_t v14 = -[TVRUITouchEvent initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:](v10, "initWithTimestamp:touchPhase:fingerIndex:digitizerLocation:", v13, 1, v12, v7, v9);
  return v14;
}

- (CGRect)_calculateVirtualBoundingBox:(CGPoint)a3 sizingRatio:(double)a4 swipeDirection:(int64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  double v9 = [(TVRUIStandardTouchProcessor *)self touchpadView];
  [v9 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v15 = v14;
  double v17 = v16;

  if (TVRPointSizeOfSiriRemoteOnMainScreen_onceToken != -1) {
    dispatch_once(&TVRPointSizeOfSiriRemoteOnMainScreen_onceToken, &__block_literal_global_18);
  }
  double v18 = *(double *)&TVRPointSizeOfSiriRemoteOnMainScreen_size_0 * a4;
  double v19 = *(double *)&TVRPointSizeOfSiriRemoteOnMainScreen_size_1 * a4;
  switch(a5)
  {
    case 1:
      double v20 = x + v18 * -0.5;
      double v21 = -0.8;
      goto LABEL_12;
    case 2:
      double v31 = -0.2;
      goto LABEL_14;
    case 3:
      double v20 = x + v18 * -0.5;
      double v21 = -0.2;
LABEL_12:
      double v30 = y + v19 * v21;
      break;
    case 4:
      double v31 = -0.8;
LABEL_14:
      double v20 = x + v18 * v31;
      double v30 = y + v19 * -0.5;
      break;
    default:
      v38.origin.double x = v11;
      v38.origin.double y = v13;
      v38.size.width = v15;
      v38.size.height = v17;
      double v37 = y;
      CGFloat v22 = v17;
      double MinX = CGRectGetMinX(v38);
      v39.origin.double x = v11;
      v39.origin.double y = v13;
      v39.size.width = v15;
      v39.size.height = v22;
      double v24 = (x - MinX) / (CGRectGetMaxX(v39) - MinX);
      if (v24 < 0.0) {
        double v24 = 0.0;
      }
      double v36 = v18 * fmin(v24, 1.0) + 0.0;
      v40.origin.double x = v11;
      v40.origin.double y = v13;
      v40.size.width = v15;
      v40.size.height = v22;
      double MinY = CGRectGetMinY(v40);
      v41.origin.double x = v11;
      v41.origin.double y = v13;
      v41.size.width = v15;
      v41.size.height = v22;
      CGFloat MaxY = CGRectGetMaxY(v41);
      double v27 = v37 - MinY;
      CGFloat v28 = MaxY - MinY;
      double v17 = v22;
      double v29 = v27 / v28;
      if (v29 < 0.0) {
        double v29 = 0.0;
      }
      double v20 = x - v36;
      double v30 = v37 - (v19 * fmin(v29, 1.0) + 0.0);
      break;
  }
  double v32 = 0.0;
  double v33 = 0.0;
  if (v20 >= 0.0)
  {
    double v33 = v20;
    if (v18 + v20 > v15) {
      double v33 = v15 - v18;
    }
  }
  if (v30 >= 0.0)
  {
    double v32 = v30;
    if (v19 + v30 > v17) {
      double v32 = v17 - v19;
    }
  }
  double v34 = v18;
  double v35 = v19;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.double y = v32;
  result.origin.double x = v33;
  return result;
}

- (CGPoint)_virtualTouchLocationForTouchPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(TVRUIStandardTouchProcessor *)self virtualBoundingBox];
  CGFloat v4 = v17.origin.x;
  CGFloat v5 = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  double MinX = CGRectGetMinX(v17);
  v18.origin.double x = v4;
  v18.origin.double y = v5;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v9 = (x - MinX) / (CGRectGetMaxX(v18) - MinX);
  if (v9 < 0.0) {
    double v9 = 0.0;
  }
  if (v9 >= 1.0) {
    double v10 = 1.0;
  }
  else {
    double v10 = v9 + 0.0;
  }
  v19.origin.double x = v4;
  v19.origin.double y = v5;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v19);
  v20.origin.double x = v4;
  v20.origin.double y = v5;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v12 = (y - MinY) / (CGRectGetMaxY(v20) - MinY);
  if (v12 < 0.0) {
    double v12 = 0.0;
  }
  double v13 = v12 + 0.0;
  if (v12 >= 1.0) {
    double v13 = 1.0;
  }
  double v14 = v10;
  result.double y = v13;
  result.double x = v14;
  return result;
}

- (int64_t)_calculateDominantSwipeDirection:(CGPoint)a3 toPoint:(CGPoint)a4
{
  if (a3.x == a4.x && a3.y == a4.y) {
    return 0;
  }
  int64_t v5 = 2;
  if (a4.x - a3.x < 0.0) {
    int64_t v5 = 4;
  }
  int64_t v6 = 3;
  if (a4.y - a3.y < 0.0) {
    int64_t v6 = 1;
  }
  if (vabdd_f64(a4.x, a3.x) >= vabdd_f64(a4.y, a3.y)) {
    return v5;
  }
  else {
    return v6;
  }
}

- (void)_configureGestureRecognizersOnView
{
  [(UIView *)self->_touchpadView removeAllGestureRecognizers];
  id v4 = (id)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel_handleTapGesture_];
  [v4 setCancelsTouchesInView:1];
  [v4 setDelaysTouchesBegan:0];
  [v4 setDelaysTouchesEnded:0];
  [v4 setAllowableMovement:5.0];
  [(UIView *)self->_touchpadView addGestureRecognizer:v4];
  v3 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel_handleLongPress_];
  [v3 setMinimumPressDuration:0.3];
  [v3 setCancelsTouchesInView:1];
  [v3 setDelaysTouchesBegan:0];
  [v3 setDelaysTouchesEnded:0];
  [(UIView *)self->_touchpadView addGestureRecognizer:v3];
}

- (void)handleTapGesture:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 state] == 3)
  {
    int64_t v5 = _TVRUIViewControllerLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_227326000, v5, OS_LOG_TYPE_DEFAULT, "Handling tap gesture on touchpad %@", buf, 0xCu);
    }

    uint64_t v6 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
    if (v6)
    {
      double v7 = (void *)v6;
      double v8 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        [(TVRUIStandardTouchProcessor *)self _sendSelectButtonPressBegan];
        [(TVRUIStandardTouchProcessor *)self _sendSelectButtonPressEnded];
        [(TVRButtonHaptic *)self->_haptic userInteractionBegan];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __48__TVRUIStandardTouchProcessor_handleTapGesture___block_invoke;
        block[3] = &unk_2647FFF70;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
}

uint64_t __48__TVRUIStandardTouchProcessor_handleTapGesture___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) userInteractionEnded];
}

- (void)handleLongPress:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(TVRUIStandardTouchProcessor *)self _sendSelectButtonPressBegan];
  }
  else if ([v4 state] == 3 || objc_msgSend(v4, "state") == 4)
  {
    [(TVRUIStandardTouchProcessor *)self _sendSelectButtonPressEnded];
  }
}

- (void)_sendSelectButtonPressBegan
{
  id v4 = +[TVRUIButtonEvent createButtonEvent:1 buttonType:1];
  v3 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
  [v3 generatedButtonEvent:v4];
}

- (void)_sendSelectButtonPressEnded
{
  id v4 = +[TVRUIButtonEvent createButtonEvent:2 buttonType:1];
  v3 = [(TVRUIStandardTouchProcessor *)self eventDelegate];
  [v3 generatedButtonEvent:v4];
}

- (UIView)touchpadView
{
  return self->_touchpadView;
}

- (void)setTouchpadView:(id)a3
{
}

- (_TVRUIEventDelegate)eventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDelegate);
  return (_TVRUIEventDelegate *)WeakRetained;
}

- (void)setEventDelegate:(id)a3
{
}

- (TVRButtonHaptic)haptic
{
  return self->_haptic;
}

- (void)setHaptic:(id)a3
{
}

- (CGRect)virtualBoundingBox
{
  double x = self->_virtualBoundingBox.origin.x;
  double y = self->_virtualBoundingBox.origin.y;
  double width = self->_virtualBoundingBox.size.width;
  double height = self->_virtualBoundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVirtualBoundingBox:(CGRect)a3
{
  self->_virtualBoundingBodouble x = a3;
}

- (UIView)debugView
{
  return self->_debugView;
}

- (void)setDebugView:(id)a3
{
}

- (double)previousVelocity
{
  return self->_previousVelocity;
}

- (void)setPreviousVelocity:(double)a3
{
  self->_previousVelocitdouble y = a3;
}

- (double)previousTimestamp
{
  return self->_previousTimestamp;
}

- (void)setPreviousTimestamp:(double)a3
{
  self->_previousTimestamp = a3;
}

- (NSMutableSet)startingTouches
{
  return self->_startingTouches;
}

- (void)setStartingTouches:(id)a3
{
}

- (CGPoint)startingPoint
{
  double x = self->_startingPoint.x;
  double y = self->_startingPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setStartingPoint:(CGPoint)a3
{
  self->_startingPoint = a3;
}

- (int64_t)startingSwipeDirection
{
  return self->_startingSwipeDirection;
}

- (void)setStartingSwipeDirection:(int64_t)a3
{
  self->_startingSwipeDirection = a3;
}

- (NSMutableSet)endedTouches
{
  return self->_endedTouches;
}

- (void)setEndedTouches:(id)a3
{
}

- (int64_t)touchCnt
{
  return self->_touchCnt;
}

- (void)setTouchCnt:(int64_t)a3
{
  self->_touchCnt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endedTouches, 0);
  objc_storeStrong((id *)&self->_startingTouches, 0);
  objc_storeStrong((id *)&self->_debugView, 0);
  objc_storeStrong((id *)&self->_haptic, 0);
  objc_destroyWeak((id *)&self->_eventDelegate);
  objc_storeStrong((id *)&self->_touchpadView, 0);
}

- (void)touchesBegan:(uint64_t)a1 touches:(NSObject *)a2 withEvent:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_227326000, a2, OS_LOG_TYPE_DEBUG, "TouchesBegan: touches: %@", (uint8_t *)&v2, 0xCu);
}

- (void)touchesEnded:(os_log_t)log touches:withEvent:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_227326000, log, OS_LOG_TYPE_ERROR, "Detected a tap event in touchesEnded", v1, 2u);
}

@end