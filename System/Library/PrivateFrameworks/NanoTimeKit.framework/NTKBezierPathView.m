@interface NTKBezierPathView
+ (Class)layerClass;
- (CGPoint)pointOnPathForHorizontalPercentage:(double)a3;
- (NSString)lineCap;
- (NTKBezierPathPointModel)pointModel;
- (UIBezierPath)path;
- (UIColor)pathColor;
- (void)animateToPath:(id)a3 duration:(double)a4 curve:(int64_t)a5;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)setLineCap:(id)a3;
- (void)setPath:(id)a3;
- (void)setPathColor:(id)a3;
@end

@implementation NTKBezierPathView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_path, a3);
  v6 = [(NTKBezierPathView *)self _shapeLayer];
  id v7 = v5;
  objc_msgSend(v6, "setPath:", objc_msgSend(v7, "CGPath"));

  v8 = [(NTKBezierPathView *)self _shapeLayer];
  [v7 lineWidth];
  objc_msgSend(v8, "setLineWidth:");

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __29__NTKBezierPathView_setPath___block_invoke;
  v12[3] = &unk_1E62C4EC8;
  objc_copyWeak(&v14, &location);
  id v9 = v7;
  id v13 = v9;
  v10 = +[NTKPromise promiseNamed:@"BezierPathView Point Model" withBlock:v12];
  pointModel = self->_pointModel;
  self->_pointModel = v10;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

NTKBezierPathPointModel *__29__NTKBezierPathView_setPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    v3 = [[NTKBezierPathPointModel alloc] initWithPath:*(void *)(a1 + 32)];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)setPathColor:(id)a3
{
  objc_storeStrong((id *)&self->_pathColor, a3);
  id v5 = a3;
  id v9 = [(NTKBezierPathView *)self _shapeLayer];
  id v6 = v5;
  objc_msgSend(v9, "setStrokeColor:", objc_msgSend(v6, "CGColor"));
  id v7 = [MEMORY[0x1E4FB1618] clearColor];

  id v8 = v7;
  objc_msgSend(v9, "setFillColor:", objc_msgSend(v8, "CGColor"));
}

- (void)setLineCap:(id)a3
{
  id v4 = a3;
  id v5 = [(NTKBezierPathView *)self _shapeLayer];
  [v5 setLineCap:v4];
}

- (NSString)lineCap
{
  v2 = [(NTKBezierPathView *)self _shapeLayer];
  v3 = [v2 lineCap];

  return (NSString *)v3;
}

- (void)animateToPath:(id)a3 duration:(double)a4 curve:(int64_t)a5
{
  id v8 = a3;
  id v9 = [(NTKBezierPathView *)self _shapeLayer];
  [v9 removeAnimationForKey:@"animation"];
  [v9 setShouldRasterize:0];
  objc_storeStrong((id *)&self->_animateToPath, a3);
  v10 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"path"];
  [v10 setDelegate:self];
  [v10 setDuration:a4];
  [v10 setFillMode:*MEMORY[0x1E4F39FA8]];
  [v10 setRemovedOnCompletion:0];
  v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
  [v10 setTimingFunction:v11];

  objc_msgSend(v10, "setFromValue:", -[UIBezierPath CGPath](self->_path, "CGPath"));
  id v12 = v8;
  objc_msgSend(v10, "setToValue:", objc_msgSend(v12, "CGPath"));
  [v9 addAnimation:v10 forKey:@"animation"];
  objc_storeStrong((id *)&self->_path, v12);
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__NTKBezierPathView_animateToPath_duration_curve___block_invoke;
  v16[3] = &unk_1E62C4EC8;
  objc_copyWeak(&v18, &location);
  id v13 = v12;
  id v17 = v13;
  id v14 = +[NTKPromise promiseNamed:@"BezierPathView Point Model" withBlock:v16];
  pointModel = self->_pointModel;
  self->_pointModel = v14;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

NTKBezierPathPointModel *__50__NTKBezierPathView_animateToPath_duration_curve___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    v3 = [[NTKBezierPathPointModel alloc] initWithPath:*(void *)(a1 + 32)];
  }
  else {
    v3 = 0;
  }

  return v3;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = [(NTKBezierPathView *)self _shapeLayer];
  [v9 removeAnimationForKey:@"animation"];
  objc_msgSend(v9, "setPath:", -[UIBezierPath CGPath](self->_animateToPath, "CGPath"));
  [v9 setShouldRasterize:1];
  id v6 = +[CLKRenderingContext sharedRenderingContext];
  id v7 = [v6 device];

  [v7 screenScale];
  objc_msgSend(v9, "setRasterizationScale:");
  if (v4)
  {
    animateToPath = self->_animateToPath;
    self->_animateToPath = 0;
  }
}

- (CGPoint)pointOnPathForHorizontalPercentage:(double)a3
{
  BOOL v4 = [(NTKPromise *)self->_pointModel object];
  [v4 pointOnPathForHorizontalPercentage:a3];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (NTKBezierPathPointModel)pointModel
{
  return (NTKBezierPathPointModel *)[(NTKPromise *)self->_pointModel object];
}

- (UIBezierPath)path
{
  return self->_path;
}

- (UIColor)pathColor
{
  return self->_pathColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathColor, 0);
  objc_storeStrong((id *)&self->_pointModel, 0);
  objc_storeStrong((id *)&self->_animateToPath, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end