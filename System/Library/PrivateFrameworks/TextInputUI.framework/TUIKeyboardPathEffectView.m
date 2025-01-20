@interface TUIKeyboardPathEffectView
- ($01BB1521EC52D44A8E7628F5261DCEC8)_currentThemeSettings;
- (BOOL)createdMTKView;
- (BOOL)done;
- (BOOL)increasedContrastEnabled;
- (CADisplayLink)pointDecayDisplayLink;
- (MTKView)mtkView;
- (NSMutableArray)paths;
- (NSMutableIndexSet)pointDecayQueue;
- (TUIKBHandwritingQuadCurvePointFIFO)pointInterpolator;
- (TUIKeyboardPathEffectView)initWithFrame:(CGRect)a3;
- (TUIKeyboardPathRenderer)renderer;
- (double)startTime;
- (id)_currentPath;
- (id)_pushNewPath;
- (id)pathsToRender;
- (int)textEffectsVisibilityLevel;
- (int64_t)keyboardAppearance;
- (void)_addDrawingPoint:(CGPoint)a3 force:(double)a4 sentinel:(BOOL)a5;
- (void)_clearPointInterpolators;
- (void)accessibilityValueChanged:(id)a3;
- (void)addPoint:(CGPoint)a3 force:(double)a4 timestamp:(double)a5;
- (void)buildOut;
- (void)createMTKViewIfNecessary;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)reset;
- (void)setCreatedMTKView:(BOOL)a3;
- (void)setDone:(BOOL)a3;
- (void)setIncreasedContrastEnabled:(BOOL)a3;
- (void)setMtkView:(id)a3;
- (void)setPaths:(id)a3;
- (void)setPointDecayDisplayLink:(id)a3;
- (void)setPointDecayQueue:(id)a3;
- (void)setPointInterpolator:(id)a3;
- (void)setRenderer:(id)a3;
- (void)setStartTime:(double)a3;
- (void)updatePaths;
@end

@implementation TUIKeyboardPathEffectView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mtkView, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_pointDecayDisplayLink, 0);
  objc_storeStrong((id *)&self->_pointDecayQueue, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_pointInterpolator, 0);
}

- (void)setCreatedMTKView:(BOOL)a3
{
  self->_createdMTKView = a3;
}

- (BOOL)createdMTKView
{
  return self->_createdMTKView;
}

- (void)setMtkView:(id)a3
{
}

- (MTKView)mtkView
{
  return self->_mtkView;
}

- (void)setRenderer:(id)a3
{
}

- (TUIKeyboardPathRenderer)renderer
{
  return self->_renderer;
}

- (void)setPointDecayDisplayLink:(id)a3
{
}

- (CADisplayLink)pointDecayDisplayLink
{
  return self->_pointDecayDisplayLink;
}

- (void)setPointDecayQueue:(id)a3
{
}

- (NSMutableIndexSet)pointDecayQueue
{
  return self->_pointDecayQueue;
}

- (void)setDone:(BOOL)a3
{
  self->_done = a3;
}

- (BOOL)done
{
  return self->_done;
}

- (void)setIncreasedContrastEnabled:(BOOL)a3
{
  self->_increasedContrastEnabled = a3;
}

- (BOOL)increasedContrastEnabled
{
  return self->_increasedContrastEnabled;
}

- (void)setPaths:(id)a3
{
}

- (NSMutableArray)paths
{
  return self->_paths;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setPointInterpolator:(id)a3
{
}

- (TUIKBHandwritingQuadCurvePointFIFO)pointInterpolator
{
  return self->_pointInterpolator;
}

- (id)pathsToRender
{
  [(TUIKeyboardPathEffectView *)self _currentThemeSettings];
  v4.f64[1] = v3;
  v6.f64[1] = v5;
  [(TUIKeyboardPathRenderer *)self->_renderer setPathColor:*(double *)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v6), v4).i64];
  [(TUIKeyboardPathEffectView *)self updatePaths];
  v7 = (void *)[(NSMutableArray *)self->_paths copy];
  return v7;
}

- (void)layoutSubviews
{
  [(TUIKeyboardPathEffectView *)self bounds];
  -[MTKView setFrame:](self->_mtkView, "setFrame:");
  [(TUIKeyboardPathEffectView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  if ([MEMORY[0x1E4FB18E0] isKeyboardProcess])
  {
    v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    double v9 = v8;

    double v10 = fmax(v9, 1.0);
  }
  else
  {
    double v10 = 1.4;
  }
  double v11 = v6 * v10;
  double v12 = v4 * v10;
  mtkView = self->_mtkView;
  -[MTKView setDrawableSize:](mtkView, "setDrawableSize:", v12, v11);
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_currentThemeSettings
{
  if ([(TUIKeyboardPathEffectView *)self keyboardAppearance] == 1)
  {
    BOOL v3 = !self->_increasedContrastEnabled;
    if (self->_increasedContrastEnabled) {
      double v4 = 0.69;
    }
    else {
      double v4 = 1.0;
    }
    double v5 = dbl_18D515FF0[!self->_increasedContrastEnabled];
    double v6 = dbl_18D516000[!self->_increasedContrastEnabled];
    v7 = (double *)&unk_18D516010;
LABEL_20:
    double v10 = v7[v3];
    goto LABEL_21;
  }
  int64_t v8 = [(TUIKeyboardPathEffectView *)self keyboardAppearance];
  BOOL increasedContrastEnabled = self->_increasedContrastEnabled;
  if (v8 != 13)
  {
    BOOL v11 = !increasedContrastEnabled;
    BOOL v3 = !increasedContrastEnabled;
    if (v11) {
      double v4 = 1.0;
    }
    else {
      double v4 = 0.69;
    }
    double v5 = dbl_18D515FC0[v3];
    double v6 = dbl_18D515FD0[v3];
    v7 = (double *)&unk_18D515FE0;
    goto LABEL_20;
  }
  if (self->_increasedContrastEnabled) {
    double v4 = 0.69;
  }
  else {
    double v4 = 0.5;
  }
  double v6 = 1.0;
  if (self->_increasedContrastEnabled) {
    double v5 = 0.398;
  }
  else {
    double v5 = 1.0;
  }
  if (self->_increasedContrastEnabled) {
    double v6 = 0.387;
  }
  double v10 = v6;
LABEL_21:
  result.var3 = v4;
  result.var2 = v5;
  result.var1 = v6;
  result.var0 = v10;
  return result;
}

- (void)accessibilityValueChanged:(id)a3
{
  self->_BOOL increasedContrastEnabled = UIAccessibilityDarkerSystemColorsEnabled();
}

- (int64_t)keyboardAppearance
{
  v2 = [MEMORY[0x1E4FB1900] activeInstance];
  BOOL v3 = [v2 textInputTraits];
  int64_t v4 = [v3 keyboardAppearance];

  return v4;
}

- (void)reset
{
  self->_done = 0;
  self->_startTime = 0.0;
  [(NSMutableArray *)self->_paths removeAllObjects];
  [(TUIKeyboardPathEffectView *)self _clearPointInterpolators];
}

- (void)buildOut
{
  self->_done = 1;
  [(TUIKeyboardPathEffectView *)self _clearPointInterpolators];
  id v3 = [(TUIKeyboardPathEffectView *)self _pushNewPath];
}

- (void)_clearPointInterpolators
{
  id v2 = [(TUIKeyboardPathEffectView *)self pointInterpolator];
  [v2 clear];
}

- (void)addPoint:(CGPoint)a3 force:(double)a4 timestamp:(double)a5
{
  double y = a3.y;
  double x = a3.x;
  [(TUIKeyboardPathEffectView *)self createMTKViewIfNecessary];
  id v8 = [(TUIKeyboardPathEffectView *)self pointInterpolator];
  objc_msgSend(v8, "addPoint:", x, y, 1.0);
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
  BOOL v11 = [(TUIKeyboardPathEffectView *)self _currentPath];
  if (!v11)
  {
    BOOL v11 = [(TUIKeyboardPathEffectView *)self _pushNewPath];
  }
  id v21 = v11;
  double v12 = [v11 nonSentinelPoints];
  v13 = [v12 lastObject];

  v14 = objc_alloc_init(_TUIPathPoint);
  -[_TUIPathPoint setPoint:](v14, "setPoint:", x, y);
  [(_TUIPathPoint *)v14 setForce:a4];
  [(_TUIPathPoint *)v14 setRelativeTime:Current - self->_startTime];
  [(_TUIPathPoint *)v14 setAbsoluteTime:Current];
  [(_TUIPathPoint *)v14 setSentinelPoint:v5];
  [(_TUIPathPoint *)v14 setLength:0.0];
  if (v13 && !v5)
  {
    [v13 point];
    double v17 = hypot(x - v15, y - v16);
    [v13 length];
    [(_TUIPathPoint *)v14 setLength:v17 + v18];
  }
  if (!v5)
  {
    v19 = [v21 nonSentinelPoints];
    [v19 addObject:v14];
  }
  v20 = [(TUIKeyboardPathEffectView *)self renderer];
  [v20 setPaused:0];
}

- (void)updatePaths
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = [(TUIKeyboardPathEffectView *)self paths];
  uint64_t v3 = [v2 count];

  if (v3
    && (v3 != 1
     || ([(TUIKeyboardPathEffectView *)self _currentPath],
         int64_t v4 = objc_claimAutoreleasedReturnValue(),
         [v4 nonSentinelPoints],
         BOOL v5 = objc_claimAutoreleasedReturnValue(),
         uint64_t v6 = [v5 count],
         v5,
         v4,
         v6)))
  {
    v28 = [MEMORY[0x1E4F1CA80] set];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [(TUIKeyboardPathEffectView *)self paths];
    uint64_t v7 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v33 != v9) {
            objc_enumerationMutation(obj);
          }
          BOOL v11 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          double v12 = [v11 nonSentinelPoints];
          uint64_t v13 = [v12 count];

          if (v13)
          {
            unint64_t v14 = [v11 effectiveStartIndexBasedOnLength];
            double Current = CFAbsoluteTimeGetCurrent();
            double v16 = [MEMORY[0x1E4F28E60] indexSet];
            double v17 = [v11 nonSentinelPoints];
            unint64_t v18 = [v17 count];

            unint64_t v19 = v14;
            if (v14 < v18)
            {
              while (1)
              {
                v20 = [v11 nonSentinelPoints];
                id v21 = [v20 objectAtIndex:v19];

                if (!v21) {
                  break;
                }
                [v21 absoluteTime];
                double v23 = Current - v22;
                if (v23 <= 0.7) {
                  goto LABEL_15;
                }
                [v16 addIndex:v19];
LABEL_16:

                if (v18 == ++v19) {
                  goto LABEL_17;
                }
              }
              double v23 = 0.0;
LABEL_15:
              [v21 setDecay:v23 / 0.7];
              goto LABEL_16;
            }
LABEL_17:
            objc_msgSend(v16, "addIndexesInRange:", 0, v14);
            v24 = [v11 nonSentinelPoints];
            [v24 removeObjectsAtIndexes:v16];
          }
          else
          {
            v25 = [(TUIKeyboardPathEffectView *)self _currentPath];

            if (v11 != v25) {
              [v28 addObject:v11];
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v8);
    }

    v26 = [(TUIKeyboardPathEffectView *)self paths];
    v27 = [v28 allObjects];
    [v26 removeObjectsInArray:v27];

    [(TUIKeyboardPathEffectView *)self setNeedsDisplay];
  }
  else
  {
    id obja = [(TUIKeyboardPathEffectView *)self renderer];
    [obja setPaused:1];
  }
}

- (id)_currentPath
{
  id v2 = [(TUIKeyboardPathEffectView *)self paths];
  uint64_t v3 = [v2 lastObject];

  return v3;
}

- (id)_pushNewPath
{
  uint64_t v3 = objc_alloc_init(_TUIPointQueue);
  int64_t v4 = [(TUIKeyboardPathEffectView *)self paths];
  [v4 addObject:v3];

  return v3;
}

- (void)didMoveToWindow
{
  id v2 = [(TUIKeyboardPathEffectView *)self renderer];
  [v2 setPaused:1];
}

- (int)textEffectsVisibilityLevel
{
  return *MEMORY[0x1E4FB2FF8];
}

- (void)createMTKViewIfNecessary
{
  if (![(TUIKeyboardPathEffectView *)self createdMTKView])
  {
    uint64_t v3 = [(TUIKeyboardPathEffectView *)self _currentPath];
    int64_t v4 = [v3 nonSentinelPoints];
    uint64_t v5 = [v4 count];

    if (v5)
    {
      [(TUIKeyboardPathEffectView *)self setCreatedMTKView:1];
      uint64_t v6 = dispatch_get_global_queue(33, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __53__TUIKeyboardPathEffectView_createMTKViewIfNecessary__block_invoke;
      block[3] = &unk_1E55941A8;
      block[4] = self;
      dispatch_async(v6, block);
    }
  }
}

void __53__TUIKeyboardPathEffectView_createMTKViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = MTLCreateSystemDefaultDevice();
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__TUIKeyboardPathEffectView_createMTKViewIfNecessary__block_invoke_2;
  v4[3] = &unk_1E55942D8;
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v4);
}

void __53__TUIKeyboardPathEffectView_createMTKViewIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F353C8]);
  [*(id *)(a1 + 32) bounds];
  id v3 = objc_msgSend(v2, "initWithFrame:device:", *(void *)(a1 + 40));
  [*(id *)(a1 + 32) setMtkView:v3];

  int64_t v4 = [*(id *)(a1 + 32) mtkView];
  id v5 = [v4 layer];
  [v5 setOpaque:0];

  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 mtkView];
  [v6 addSubview:v7];

  uint64_t v8 = [TUIKeyboardPathRenderer alloc];
  uint64_t v9 = [*(id *)(a1 + 32) mtkView];
  double v10 = [(TUIKeyboardPathRenderer *)v8 initWithMTKView:v9 generatePipelineDescriptors:0];
  [*(id *)(a1 + 32) setRenderer:v10];

  BOOL v11 = *(void **)(a1 + 32);
  id v12 = [v11 renderer];
  [v12 setDatasource:v11];
}

- (TUIKeyboardPathEffectView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)TUIKeyboardPathEffectView;
  id v3 = -[TUIKeyboardPathEffectView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int64_t v4 = v3;
  if (v3)
  {
    [(TUIKeyboardPathEffectView *)v3 setUserInteractionEnabled:0];
    id v5 = [(TUIKeyboardPathEffectView *)v4 layer];
    [v5 setAllowsHitTesting:0];

    uint64_t v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(TUIKeyboardPathEffectView *)v4 setBackgroundColor:v6];

    [(TUIKeyboardPathEffectView *)v4 setIncreasedContrastEnabled:UIAccessibilityDarkerSystemColorsEnabled()];
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(TUIKeyboardPathEffectView *)v4 setPaths:v7];

    objc_initWeak(&location, v4);
    uint64_t v8 = [[TUIKBHandwritingQuadCurvePointFIFO alloc] initWithFIFO:0 scale:1.0];
    [(TUIKeyboardPathEffectView *)v4 setPointInterpolator:v8];

    uint64_t v13 = MEMORY[0x1E4F143A8];
    objc_copyWeak(&v14, &location);
    uint64_t v9 = [(TUIKeyboardPathEffectView *)v4 pointInterpolator];
    [v9 setEmissionHandler:&v13];

    id v10 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    [(TUIKeyboardPathEffectView *)v4 setPointDecayQueue:v10];

    BOOL v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v4 selector:sel_accessibilityValueChanged_ name:*MEMORY[0x1E4FB2438] object:0];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __43__TUIKeyboardPathEffectView_initWithFrame___block_invoke(uint64_t a1, void *a2)
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
    id v7 = (id *)(a1 + 32);
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v8) TUIKBHandwritingPointValue];
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

@end