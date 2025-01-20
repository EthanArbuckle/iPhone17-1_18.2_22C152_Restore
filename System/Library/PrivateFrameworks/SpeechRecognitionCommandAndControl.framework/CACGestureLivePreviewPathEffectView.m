@interface CACGestureLivePreviewPathEffectView
- ($01BB1521EC52D44A8E7628F5261DCEC8)_currentThemeSettings;
- (BOOL)done;
- (BOOL)increasedContrastEnabled;
- (CACGestureLivePreviewHandwritingQuadCurvePointFIFO)pointInterpolator;
- (CACGestureLivePreviewPathEffectView)initWithFrame:(CGRect)a3;
- (CADisplayLink)pointDecayDisplayLink;
- (NSMutableArray)paths;
- (NSMutableIndexSet)pointDecayQueue;
- (double)startTime;
- (id)_currentPath;
- (id)_pushNewPath;
- (void)_addDrawingPoint:(CGPoint)a3 force:(double)a4 sentinel:(BOOL)a5;
- (void)_clearPointInterpolators;
- (void)_displayLinkFired:(id)a3;
- (void)accessibilityValueChanged:(id)a3;
- (void)addPoint:(CGPoint)a3 force:(double)a4 timestamp:(double)a5;
- (void)buildOut;
- (void)didMoveToWindow;
- (void)drawRect:(CGRect)a3;
- (void)reset;
- (void)setDone:(BOOL)a3;
- (void)setIncreasedContrastEnabled:(BOOL)a3;
- (void)setPaths:(id)a3;
- (void)setPointDecayDisplayLink:(id)a3;
- (void)setPointDecayQueue:(id)a3;
- (void)setPointInterpolator:(id)a3;
- (void)setStartTime:(double)a3;
@end

@implementation CACGestureLivePreviewPathEffectView

- (CACGestureLivePreviewPathEffectView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)CACGestureLivePreviewPathEffectView;
  v3 = -[CACGestureLivePreviewPathEffectView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = CACLogGestureRecording();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CACGestureLivePreviewPathEffectView initWithFrame:](v4, v5, v6, v7, v8, v9, v10, v11);
    }

    [(CACGestureLivePreviewPathEffectView *)v3 setUserInteractionEnabled:0];
    v12 = [(CACGestureLivePreviewPathEffectView *)v3 layer];
    [v12 setAllowsHitTesting:0];

    v13 = [(CACGestureLivePreviewPathEffectView *)v3 layer];
    [v13 setDrawsAsynchronously:1];

    v14 = [MEMORY[0x263F825C8] clearColor];
    [(CACGestureLivePreviewPathEffectView *)v3 setBackgroundColor:v14];

    [(CACGestureLivePreviewPathEffectView *)v3 setIncreasedContrastEnabled:UIAccessibilityDarkerSystemColorsEnabled()];
    id v15 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(CACGestureLivePreviewPathEffectView *)v3 setPaths:v15];

    objc_initWeak(&location, v3);
    v16 = [[CACGestureLivePreviewHandwritingQuadCurvePointFIFO alloc] initWithFIFO:0 scale:1.0];
    [(CACGestureLivePreviewPathEffectView *)v3 setPointInterpolator:v16];

    uint64_t v21 = MEMORY[0x263EF8330];
    objc_copyWeak(&v22, &location);
    v17 = [(CACGestureLivePreviewPathEffectView *)v3 pointInterpolator];
    [v17 setEmissionHandler:&v21];

    id v18 = objc_alloc_init(MEMORY[0x263F089C8]);
    [(CACGestureLivePreviewPathEffectView *)v3 setPointDecayQueue:v18];

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v3 selector:sel_accessibilityValueChanged_ name:*MEMORY[0x263F831A0] object:0];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __53__CACGestureLivePreviewPathEffectView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    uint64_t v7 = (id *)(a1 + 32);
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v8) CACGestureLivePreviewHandwritingPointValue];
        double v10 = v9;
        double v12 = v11;
        double v14 = v13;
        id WeakRetained = objc_loadWeakRetained(v7);
        objc_msgSend(WeakRetained, "_addDrawingPoint:force:sentinel:", 0, v10, v12, v14);

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }
}

- (void)didMoveToWindow
{
}

- (id)_pushNewPath
{
  id v3 = objc_alloc_init(_CACGesturePointQueue);
  uint64_t v4 = [(CACGestureLivePreviewPathEffectView *)self paths];
  [v4 addObject:v3];

  return v3;
}

- (id)_currentPath
{
  v2 = [(CACGestureLivePreviewPathEffectView *)self paths];
  id v3 = [v2 lastObject];

  return v3;
}

- (void)_displayLinkFired:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  uint64_t v4 = CACLogGestureRecording();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[CACGestureLivePreviewPathEffectView _displayLinkFired:](v4, v5, v6, v7, v8, v9, v10, v11);
  }

  double v12 = [(CACGestureLivePreviewPathEffectView *)self paths];
  uint64_t v13 = [v12 count];

  if (v13
    && (v13 != 1
     || ([(CACGestureLivePreviewPathEffectView *)self _currentPath],
         double v14 = objc_claimAutoreleasedReturnValue(),
         [v14 nonSentinelPoints],
         id v15 = objc_claimAutoreleasedReturnValue(),
         uint64_t v16 = [v15 count],
         v15,
         v14,
         v16)))
  {
    v39 = [MEMORY[0x263EFF9C0] set];
    v40 = self;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obj = [(CACGestureLivePreviewPathEffectView *)self paths];
    uint64_t v17 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v43 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          id v22 = [v21 nonSentinelPoints];
          uint64_t v23 = [v22 count];

          if (v23)
          {
            unint64_t v24 = [v21 effectiveStartIndexBasedOnLength];
            double Current = CFAbsoluteTimeGetCurrent();
            v26 = [MEMORY[0x263F089C8] indexSet];
            v27 = [v21 nonSentinelPoints];
            unint64_t v28 = [v27 count];

            unint64_t v29 = v24;
            if (v24 < v28)
            {
              while (1)
              {
                v30 = [v21 nonSentinelPoints];
                v31 = [v30 objectAtIndex:v29];

                if (!v31) {
                  break;
                }
                [v31 absoluteTime];
                double v33 = Current - v32;
                if (v33 <= 0.3) {
                  goto LABEL_17;
                }
                [v26 addIndex:v29];
LABEL_18:

                if (v28 == ++v29) {
                  goto LABEL_19;
                }
              }
              double v33 = 0.0;
LABEL_17:
              [v31 setDecay:v33 / 0.3];
              goto LABEL_18;
            }
LABEL_19:
            objc_msgSend(v26, "addIndexesInRange:", 0, v24);
            v34 = [v21 nonSentinelPoints];
            [v34 removeObjectsAtIndexes:v26];
          }
          else
          {
            v35 = [(CACGestureLivePreviewPathEffectView *)v40 _currentPath];

            if (v21 != v35) {
              [v39 addObject:v21];
            }
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v18);
    }

    v36 = [(CACGestureLivePreviewPathEffectView *)v40 paths];
    v37 = v39;
    v38 = [v39 allObjects];
    [v36 removeObjectsInArray:v38];

    [(CACGestureLivePreviewPathEffectView *)v40 setNeedsDisplay];
  }
  else
  {
    v37 = [(CACGestureLivePreviewPathEffectView *)self pointDecayDisplayLink];
    [v37 setPaused:1];
  }
}

- (void)_addDrawingPoint:(CGPoint)a3 force:(double)a4 sentinel:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a3.y;
  double x = a3.x;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  if (self->_startTime == 0.0) {
    self->_startTime = Current;
  }
  uint64_t v11 = [(CACGestureLivePreviewPathEffectView *)self _currentPath];
  if (!v11)
  {
    uint64_t v11 = [(CACGestureLivePreviewPathEffectView *)self _pushNewPath];
  }
  id v21 = v11;
  double v12 = [v11 nonSentinelPoints];
  uint64_t v13 = [v12 lastObject];

  double v14 = objc_alloc_init(_CACGesturePathPoint);
  -[_CACGesturePathPoint setPoint:](v14, "setPoint:", x, y);
  [(_CACGesturePathPoint *)v14 setForce:a4];
  [(_CACGesturePathPoint *)v14 setRelativeTime:Current - self->_startTime];
  [(_CACGesturePathPoint *)v14 setAbsoluteTime:Current];
  [(_CACGesturePathPoint *)v14 setSentinelPoint:v5];
  [(_CACGesturePathPoint *)v14 setLength:0.0];
  if (v13 && !v5)
  {
    [v13 point];
    double v17 = CACCGPointDistance(v15, v16, x, y);
    [v13 length];
    [(_CACGesturePathPoint *)v14 setLength:v17 + v18];
  }
  if (!v5)
  {
    uint64_t v19 = [v21 nonSentinelPoints];
    [v19 addObject:v14];
  }
  v20 = [(CACGestureLivePreviewPathEffectView *)self pointDecayDisplayLink];
  [v20 setPaused:0];
}

- (void)addPoint:(CGPoint)a3 force:(double)a4 timestamp:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [(CACGestureLivePreviewPathEffectView *)self pointInterpolator];
  objc_msgSend(v7, "addPoint:", x, y, 1.0);
}

- (void)_clearPointInterpolators
{
  id v2 = [(CACGestureLivePreviewPathEffectView *)self pointInterpolator];
  [v2 clear];
}

- (void)buildOut
{
  self->_done = 1;
  [(CACGestureLivePreviewPathEffectView *)self _clearPointInterpolators];
  id v3 = [(CACGestureLivePreviewPathEffectView *)self _pushNewPath];
}

- (void)reset
{
  self->_done = 0;
  self->_startTime = 0.0;
  [(NSMutableArray *)self->_paths removeAllObjects];
  [(CACGestureLivePreviewPathEffectView *)self _clearPointInterpolators];
}

- (void)accessibilityValueChanged:(id)a3
{
  self->_increasedContrastEnabled = UIAccessibilityDarkerSystemColorsEnabled();
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_currentThemeSettings
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v3 = CACIsInDarkMode();
  double v4 = 0.398;
  if (v3) {
    double v4 = 0.914;
  }
  double v5 = 0.387;
  if (v3) {
    double v5 = 0.895;
  }
  if (self->_increasedContrastEnabled) {
    double v6 = 0.69;
  }
  else {
    double v6 = 1.0;
  }
  if (self->_increasedContrastEnabled) {
    double v7 = v4;
  }
  else {
    double v7 = 0.67;
  }
  if (self->_increasedContrastEnabled) {
    double v8 = v5;
  }
  else {
    double v8 = 0.635;
  }
  if (self->_increasedContrastEnabled) {
    double v9 = v5;
  }
  else {
    double v9 = 0.619;
  }
  uint64_t v10 = CACLogGestureRecording();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 134218752;
    double v16 = v9;
    __int16 v17 = 2048;
    double v18 = v8;
    __int16 v19 = 2048;
    double v20 = v7;
    __int16 v21 = 2048;
    double v22 = v6;
    _os_log_debug_impl(&dword_238377000, v10, OS_LOG_TYPE_DEBUG, "Picked colors r:%f g:%f b:%f a:%f", (uint8_t *)&v15, 0x2Au);
  }

  double v11 = v9;
  double v12 = v8;
  double v13 = v7;
  double v14 = v6;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  [(CACGestureLivePreviewPathEffectView *)self _currentThemeSettings];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetRGBStrokeColor(CurrentContext, v5, v7, v9, v11);
  CGContextSetLineCap(CurrentContext, kCGLineCapRound);
  CGContextSetLineJoin(CurrentContext, kCGLineJoinRound);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = [(CACGestureLivePreviewPathEffectView *)self paths];
  uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
    uint64_t v38 = *(void *)v42;
    do
    {
      uint64_t v16 = 0;
      uint64_t v39 = v14;
      do
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(obj);
        }
        __int16 v17 = *(void **)(*((void *)&v41 + 1) + 8 * v16);
        double v18 = [v17 nonSentinelPoints];
        unint64_t v19 = [v18 count];

        if (v19 >= 2)
        {
          uint64_t v20 = [v17 effectiveStartIndexBasedOnLength];
          __int16 v21 = [v17 nonSentinelPoints];
          double v22 = [v21 objectAtIndex:v20];

          [v22 point];
          CGFloat v24 = v23;
          [v22 point];
          CGContextMoveToPoint(CurrentContext, v24, v25);
          unint64_t v26 = v20 + 1;
          while (v26 < v19)
          {
            v27 = [v17 nonSentinelPoints];
            unint64_t v28 = [v27 objectAtIndex:v26];

            [v28 decay];
            double v30 = 1.0 - v29;
            if ((double)(v26 - v20) / (double)(v19 - v20) < v30) {
              double v30 = (double)(v26 - v20) / (double)(v19 - v20);
            }
            CGContextSetLineWidth(CurrentContext, (1.0 - v30) * -62.1 + 69.0);
            [v28 point];
            CGFloat v32 = v31;
            [v28 point];
            CGContextAddLineToPoint(CurrentContext, v32, v33);
            CGContextStrokePath(CurrentContext);
            [v28 point];
            CGFloat v35 = v34;
            [v28 point];
            CGContextMoveToPoint(CurrentContext, v35, v36);
            if (v26 + 3 < v19 || v26 == v19 - 1) {
              v26 += 3;
            }
            else {
              unint64_t v26 = v19 - 1;
            }
          }
          uint64_t v15 = v38;
          uint64_t v14 = v39;
        }
        ++v16;
      }
      while (v16 != v14);
      uint64_t v14 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    }
    while (v14);
  }
}

- (CACGestureLivePreviewHandwritingQuadCurvePointFIFO)pointInterpolator
{
  return self->_pointInterpolator;
}

- (void)setPointInterpolator:(id)a3
{
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (NSMutableArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
}

- (BOOL)increasedContrastEnabled
{
  return self->_increasedContrastEnabled;
}

- (void)setIncreasedContrastEnabled:(BOOL)a3
{
  self->_increasedContrastEnabled = a3;
}

- (BOOL)done
{
  return self->_done;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (NSMutableIndexSet)pointDecayQueue
{
  return self->_pointDecayQueue;
}

- (void)setPointDecayQueue:(id)a3
{
}

- (CADisplayLink)pointDecayDisplayLink
{
  return self->_pointDecayDisplayLink;
}

- (void)setPointDecayDisplayLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pointDecayDisplayLink, 0);
  objc_storeStrong((id *)&self->_pointDecayQueue, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_pointInterpolator, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_displayLinkFired:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end