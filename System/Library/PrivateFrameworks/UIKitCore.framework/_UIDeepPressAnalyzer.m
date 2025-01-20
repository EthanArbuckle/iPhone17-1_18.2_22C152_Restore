@interface _UIDeepPressAnalyzer
- (BOOL)isDeepPressLikely;
- (_UIDeepPressAnalyzer)init;
- (_UIVelocityIntegrator)locationIntegrator;
- (_UIVelocityIntegrator)touchForceIntegrator;
- (double)_touchForceFromTouches:(id)a3;
- (void)analyzeTouchForce:(double)a3 centroidAtLocation:(CGPoint)a4;
- (void)analyzeTouches:(id)a3;
- (void)setLocationIntegrator:(id)a3;
- (void)setTouchForceIntegrator:(id)a3;
@end

@implementation _UIDeepPressAnalyzer

- (_UIDeepPressAnalyzer)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDeepPressAnalyzer;
  v2 = [(_UIDeepPressAnalyzer *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(_UIVelocityIntegrator);
    [(_UIDeepPressAnalyzer *)v2 setTouchForceIntegrator:v3];

    v4 = objc_alloc_init(_UIVelocityIntegrator);
    [(_UIDeepPressAnalyzer *)v2 setLocationIntegrator:v4];

    v5 = v2;
  }

  return v2;
}

- (void)analyzeTouches:(id)a3
{
  id v4 = a3;
  [(_UIDeepPressAnalyzer *)self _touchForceFromTouches:v4];
  double v6 = v5;
  double v7 = _CentroidOfTouches(v4, 0);
  double v9 = v8;

  -[_UIDeepPressAnalyzer analyzeTouchForce:centroidAtLocation:](self, "analyzeTouchForce:centroidAtLocation:", v6, v7, v9);
}

- (void)analyzeTouchForce:(double)a3 centroidAtLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3 * 10.0;
  double v8 = [(_UIDeepPressAnalyzer *)self touchForceIntegrator];
  objc_msgSend(v8, "addSample:", v7, v7);

  id v9 = [(_UIDeepPressAnalyzer *)self locationIntegrator];
  objc_msgSend(v9, "addSample:", x, y);
}

- (BOOL)isDeepPressLikely
{
  v3 = [(_UIDeepPressAnalyzer *)self locationIntegrator];
  [v3 velocity];
  double v5 = v4;
  double v7 = v6;

  double v8 = fabs(v7);
  double v9 = fabs(v5);
  if (v8 >= v9) {
    double v10 = v8;
  }
  else {
    double v10 = v9;
  }
  v11 = [(_UIDeepPressAnalyzer *)self touchForceIntegrator];
  [v11 velocity];
  double v13 = v12;

  return v13 > 0.0 && v10 < 10.0;
}

- (double)_touchForceFromTouches:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      double v8 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          double v8 = v8 + -[UITouch _unclampedForce](*(void **)(*((void *)&v12 + 1) + 8 * i));
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      double v8 = 0.0;
    }

    double v10 = v8 / (double)(unint64_t)objc_msgSend(v4, "count", (void)v12);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (_UIVelocityIntegrator)touchForceIntegrator
{
  return self->_touchForceIntegrator;
}

- (void)setTouchForceIntegrator:(id)a3
{
}

- (_UIVelocityIntegrator)locationIntegrator
{
  return self->_locationIntegrator;
}

- (void)setLocationIntegrator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationIntegrator, 0);
  objc_storeStrong((id *)&self->_touchForceIntegrator, 0);
}

@end