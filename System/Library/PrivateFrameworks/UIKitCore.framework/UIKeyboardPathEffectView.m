@interface UIKeyboardPathEffectView
- ($01BB1521EC52D44A8E7628F5261DCEC8)_currentThemeSettings;
- (BOOL)done;
- (BOOL)increasedContrastEnabled;
- (CADisplayLink)pointDecayDisplayLink;
- (NSMutableArray)paths;
- (NSMutableIndexSet)pointDecayQueue;
- (UIKBHandwritingQuadCurvePointFIFO)pointInterpolator;
- (UIKeyboardPathEffectView)initWithFrame:(CGRect)a3;
- (double)startTime;
- (id)_currentPath;
- (id)_pushNewPath;
- (int)textEffectsVisibilityLevel;
- (int64_t)keyboardAppearance;
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

@implementation UIKeyboardPathEffectView

- (UIKeyboardPathEffectView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)UIKeyboardPathEffectView;
  v3 = -[UIView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIView *)v3 setUserInteractionEnabled:0];
    v5 = [(UIView *)v4 layer];
    [v5 setAllowsHitTesting:0];

    v6 = [(UIView *)v4 layer];
    [v6 setDrawsAsynchronously:1];

    v7 = +[UIColor clearColor];
    [(UIView *)v4 setBackgroundColor:v7];

    [(UIKeyboardPathEffectView *)v4 setIncreasedContrastEnabled:_AXDarkenSystemColors() != 0];
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(UIKeyboardPathEffectView *)v4 setPaths:v8];

    objc_initWeak(&location, v4);
    v9 = [[UIKBHandwritingQuadCurvePointFIFO alloc] initWithFIFO:0 scale:1.0];
    [(UIKeyboardPathEffectView *)v4 setPointInterpolator:v9];

    uint64_t v14 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v15, &location);
    v10 = [(UIKeyboardPathEffectView *)v4 pointInterpolator];
    [v10 setEmissionHandler:&v14];

    id v11 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    [(UIKeyboardPathEffectView *)v4 setPointDecayQueue:v11];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v4 selector:sel_accessibilityValueChanged_ name:@"UIAccessibilityDarkerSystemColorsStatusDidChangeNotification" object:0];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __42__UIKeyboardPathEffectView_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
    v7 = (id *)(a1 + 32);
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v8) UIKBHandwritingPointValue];
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

- (int)textEffectsVisibilityLevel
{
  return 210;
}

- (void)didMoveToWindow
{
  id v3 = [(UIKeyboardPathEffectView *)self pointDecayDisplayLink];

  if (v3)
  {
    uint64_t v4 = [(UIKeyboardPathEffectView *)self pointDecayDisplayLink];
    uint64_t v5 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    uint64_t v6 = *MEMORY[0x1E4F1C4B0];
    [v4 removeFromRunLoop:v5 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F1C4B0];
  }
  v7 = [(UIView *)self window];
  uint64_t v8 = [v7 screen];
  double v9 = [v8 displayLinkWithTarget:self selector:sel__displayLinkFired_];
  [(UIKeyboardPathEffectView *)self setPointDecayDisplayLink:v9];

  double v10 = [(UIKeyboardPathEffectView *)self pointDecayDisplayLink];
  [v10 setPaused:1];

  id v12 = [(UIKeyboardPathEffectView *)self pointDecayDisplayLink];
  double v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
  [v12 addToRunLoop:v11 forMode:v6];
}

- (id)_pushNewPath
{
  id v3 = objc_alloc_init(_PointQueue);
  uint64_t v4 = [(UIKeyboardPathEffectView *)self paths];
  [v4 addObject:v3];

  return v3;
}

- (id)_currentPath
{
  v2 = [(UIKeyboardPathEffectView *)self paths];
  id v3 = [v2 lastObject];

  return v3;
}

- (void)_displayLinkFired:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIKeyboardPathEffectView *)self paths];
  uint64_t v4 = [v3 count];

  if (v4
    && (v4 != 1
     || ([(UIKeyboardPathEffectView *)self _currentPath],
         uint64_t v5 = objc_claimAutoreleasedReturnValue(),
         [v5 nonSentinelPoints],
         uint64_t v6 = objc_claimAutoreleasedReturnValue(),
         uint64_t v7 = [v6 count],
         v6,
         v5,
         v7)))
  {
    v29 = [MEMORY[0x1E4F1CA80] set];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [(UIKeyboardPathEffectView *)self paths];
    uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v34 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          double v13 = [v12 nonSentinelPoints];
          uint64_t v14 = [v13 count];

          if (v14)
          {
            unint64_t v15 = [v12 effectiveStartIndexBasedOnLength];
            double Current = CFAbsoluteTimeGetCurrent();
            long long v17 = [MEMORY[0x1E4F28E60] indexSet];
            long long v18 = [v12 nonSentinelPoints];
            unint64_t v19 = [v18 count];

            unint64_t v20 = v15;
            if (v15 < v19)
            {
              while (1)
              {
                uint64_t v21 = [v12 nonSentinelPoints];
                v22 = [v21 objectAtIndex:v20];

                if (!v22) {
                  break;
                }
                [v22 absoluteTime];
                double v24 = Current - v23;
                if (v24 <= 0.7) {
                  goto LABEL_15;
                }
                [v17 addIndex:v20];
LABEL_16:

                if (v19 == ++v20) {
                  goto LABEL_17;
                }
              }
              double v24 = 0.0;
LABEL_15:
              [v22 setDecay:v24 / 0.7];
              goto LABEL_16;
            }
LABEL_17:
            objc_msgSend(v17, "addIndexesInRange:", 0, v15);
            v25 = [v12 nonSentinelPoints];
            [v25 removeObjectsAtIndexes:v17];
          }
          else
          {
            v26 = [(UIKeyboardPathEffectView *)self _currentPath];

            if (v12 != v26) {
              [v29 addObject:v12];
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v9);
    }

    v27 = [(UIKeyboardPathEffectView *)self paths];
    v28 = [v29 allObjects];
    [v27 removeObjectsInArray:v28];

    [(UIView *)self setNeedsDisplay];
  }
  else
  {
    id obja = [(UIKeyboardPathEffectView *)self pointDecayDisplayLink];
    [obja setPaused:1];
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
  double v11 = [(UIKeyboardPathEffectView *)self _currentPath];
  if (!v11)
  {
    double v11 = [(UIKeyboardPathEffectView *)self _pushNewPath];
  }
  id v21 = v11;
  id v12 = [v11 nonSentinelPoints];
  double v13 = [v12 lastObject];

  uint64_t v14 = objc_alloc_init(_PathPoint);
  -[_PathPoint setPoint:](v14, "setPoint:", x, y);
  [(_PathPoint *)v14 setForce:a4];
  [(_PathPoint *)v14 setRelativeTime:Current - self->_startTime];
  [(_PathPoint *)v14 setAbsoluteTime:Current];
  [(_PathPoint *)v14 setSentinelPoint:v5];
  [(_PathPoint *)v14 setLength:0.0];
  if (v13 && !v5)
  {
    [v13 point];
    double v17 = hypot(x - v15, y - v16);
    [v13 length];
    [(_PathPoint *)v14 setLength:v17 + v18];
  }
  if (!v5)
  {
    unint64_t v19 = [v21 nonSentinelPoints];
    [v19 addObject:v14];
  }
  unint64_t v20 = [(UIKeyboardPathEffectView *)self pointDecayDisplayLink];
  [v20 setPaused:0];
}

- (void)addPoint:(CGPoint)a3 force:(double)a4 timestamp:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [(UIKeyboardPathEffectView *)self pointInterpolator];
  objc_msgSend(v7, "addPoint:", x, y, 1.0);
}

- (void)_clearPointInterpolators
{
  id v2 = [(UIKeyboardPathEffectView *)self pointInterpolator];
  [v2 clear];
}

- (void)buildOut
{
  self->_done = 1;
  [(UIKeyboardPathEffectView *)self _clearPointInterpolators];
  id v3 = [(UIKeyboardPathEffectView *)self _pushNewPath];
}

- (void)reset
{
  self->_done = 0;
  self->_startTime = 0.0;
  [(NSMutableArray *)self->_paths removeAllObjects];
  [(UIKeyboardPathEffectView *)self _clearPointInterpolators];
}

- (int64_t)keyboardAppearance
{
  id v2 = +[UIKeyboardImpl activeInstance];
  id v3 = [v2 textInputTraits];
  int64_t v4 = [v3 keyboardAppearance];

  return v4;
}

- (void)accessibilityValueChanged:(id)a3
{
  self->_increasedContrastEnabled = _AXDarkenSystemColors() != 0;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_currentThemeSettings
{
  BOOL v3 = [(UIKeyboardPathEffectView *)self keyboardAppearance] == 1;
  double v4 = dbl_186B9B080[v3];
  if (self->_increasedContrastEnabled) {
    double v5 = 0.69;
  }
  else {
    double v5 = 1.0;
  }
  double v6 = dbl_186B9B090[v3];
  if (!self->_increasedContrastEnabled) {
    double v4 = 0.67;
  }
  double v7 = 0.635;
  if (self->_increasedContrastEnabled) {
    double v7 = dbl_186B9B090[v3];
  }
  else {
    double v6 = 0.619;
  }
  result.var3 = v5;
  result.var2 = v4;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  [(UIKeyboardPathEffectView *)self _currentThemeSettings];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v13 = 0;
  }
  else {
    double v13 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGContextSetRGBStrokeColor(v13, v5, v7, v9, v11);
  CGContextSetLineCap(v13, kCGLineCapRound);
  CGContextSetLineJoin(v13, kCGLineJoinRound);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = [(UIKeyboardPathEffectView *)self paths];
  uint64_t v14 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v44;
    do
    {
      uint64_t v17 = 0;
      uint64_t v41 = v15;
      do
      {
        if (*(void *)v44 != v16) {
          objc_enumerationMutation(obj);
        }
        double v18 = *(void **)(*((void *)&v43 + 1) + 8 * v17);
        unint64_t v19 = objc_msgSend(v18, "nonSentinelPoints", v41);
        unint64_t v20 = [v19 count];

        if (v20 >= 2)
        {
          unint64_t v21 = [v18 effectiveStartIndexBasedOnLength];
          v22 = [v18 nonSentinelPoints];
          double v23 = [v22 objectAtIndex:v21];

          [v23 point];
          CGFloat v25 = v24;
          [v23 point];
          CGContextMoveToPoint(v13, v25, v26);
          unint64_t v27 = v21 + 1;
          if (v21 + 1 < v20)
          {
            double v28 = (double)(v20 - v21);
            double v29 = (double)v21;
            do
            {
              v30 = [v18 nonSentinelPoints];
              v31 = [v30 objectAtIndex:v27];

              [v31 decay];
              double v33 = 19.7 - (1.0 - ((double)v27 - (v32 * v28 + v29)) / v28) * 19.7;
              if (v33 > 0.0)
              {
                CGContextSetLineWidth(v13, v33);
                [v31 point];
                CGFloat v35 = v34;
                [v31 point];
                CGContextAddLineToPoint(v13, v35, v36);
                CGContextStrokePath(v13);
              }
              [v31 point];
              CGFloat v38 = v37;
              [v31 point];
              CGContextMoveToPoint(v13, v38, v39);
              if (v27 + 3 < v20 || v27 == v20 - 1) {
                v27 += 3;
              }
              else {
                unint64_t v27 = v20 - 1;
              }
            }
            while (v27 < v20);
          }

          uint64_t v15 = v41;
        }
        ++v17;
      }
      while (v17 != v15);
      uint64_t v15 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v15);
  }
}

- (UIKBHandwritingQuadCurvePointFIFO)pointInterpolator
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

@end