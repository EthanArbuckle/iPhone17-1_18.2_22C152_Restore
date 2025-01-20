@interface ICLoadingPieLayer
- (BOOL)removeOnCompletion;
- (CAShapeLayer)backgroundLayer;
- (CAShapeLayer)pieLayer;
- (CGPath)newPathForProgress:(double)a3;
- (ICLoadingPieLayer)init;
- (NSProgress)observedProgress;
- (double)progress;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setBackgroundLayer:(id)a3;
- (void)setObservedProgress:(id)a3;
- (void)setPieLayer:(id)a3;
- (void)setProgress:(double)a3;
- (void)setRemoveOnCompletion:(BOOL)a3;
@end

@implementation ICLoadingPieLayer

- (void)dealloc
{
  [(NSProgress *)self->_observedProgress ic_removeObserver:self forKeyPath:@"fractionCompleted" context:&compoundliteral_2];
  v3.receiver = self;
  v3.super_class = (Class)ICLoadingPieLayer;
  [(ICLoadingPieLayer *)&v3 dealloc];
}

- (ICLoadingPieLayer)init
{
  v13.receiver = self;
  v13.super_class = (Class)ICLoadingPieLayer;
  v2 = [(ICLoadingPieLayer *)&v13 init];
  objc_super v3 = v2;
  if (v2)
  {
    -[ICLoadingPieLayer setFrame:](v2, "setFrame:", 0.0, 0.0, 24.0, 24.0);
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    backgroundLayer = v3->_backgroundLayer;
    v3->_backgroundLayer = v4;

    id v6 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
    -[CAShapeLayer setFillColor:](v3->_backgroundLayer, "setFillColor:", [v6 CGColor]);

    Mutable = CGPathCreateMutable();
    [(ICLoadingPieLayer *)v3 frame];
    CGPathAddEllipseInRect(Mutable, 0, v14);
    [(CAShapeLayer *)v3->_backgroundLayer setPath:Mutable];
    CGPathRelease(Mutable);
    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    pieLayer = v3->_pieLayer;
    v3->_pieLayer = v8;

    id v10 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    -[CAShapeLayer setFillColor:](v3->_pieLayer, "setFillColor:", [v10 CGColor]);

    [(CAShapeLayer *)v3->_pieLayer setFillRule:*MEMORY[0x1E4F39FB8]];
    v11 = [(ICLoadingPieLayer *)v3 newPathForProgress:0.1];
    [(CAShapeLayer *)v3->_pieLayer setPath:v11];
    CGPathRelease(v11);
    [(ICLoadingPieLayer *)v3 addSublayer:v3->_backgroundLayer];
    [(ICLoadingPieLayer *)v3 addSublayer:v3->_pieLayer];
  }
  return v3;
}

- (CGPath)newPathForProgress:(double)a3
{
  Mutable = CGPathCreateMutable();
  [(ICLoadingPieLayer *)self bounds];
  CGRect v8 = CGRectInset(v7, 1.0, 1.0);
  CGPathAddEllipseInRect(Mutable, 0, v8);
  CGPathMoveToPoint(Mutable, 0, 12.0, 12.0);
  CGPathAddLineToPoint(Mutable, 0, 12.0, 2.0);
  CGPathAddArc(Mutable, 0, 12.0, 12.0, 10.0, -1.57079633, a3 * 6.28318531 + -1.57079633, 0);
  return Mutable;
}

- (void)setProgress:(double)a3
{
  if (a3 >= 1.0 && [(ICLoadingPieLayer *)self removeOnCompletion])
  {
    [(ICLoadingPieLayer *)self removeFromSuperlayer];
  }
  else
  {
    double v5 = fmax(self->_progress, 0.1);
    self->_progress = a3;
    id v17 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
    [v17 setKeyPath:@"path"];
    double v6 = fmax(a3, 0.1) - v5;
    uint64_t v7 = (uint64_t)fmax(v6 / 0.1, 1.0);
    CGRect v8 = [MEMORY[0x1E4F1CA48] array];
    v9 = [MEMORY[0x1E4F1CA48] array];
    if (v7 >= 1)
    {
      for (uint64_t i = 1; i <= v7; ++i)
      {
        v11 = [(ICLoadingPieLayer *)self newPathForProgress:v5 + (float)((float)(int)i / (float)v7) * v6];
        [v8 addObject:v11];

        *(float *)&double v12 = (float)(int)i / (float)v7;
        objc_super v13 = [NSNumber numberWithFloat:v12];
        [v9 addObject:v13];
      }
    }
    [v17 setValues:v8];
    [v17 setKeyTimes:v9];
    uint64_t v14 = [v8 lastObject];
    v15 = [(ICLoadingPieLayer *)self pieLayer];
    [v15 setPath:v14];

    v16 = [(ICLoadingPieLayer *)self pieLayer];
    [v16 addAnimation:v17 forKey:@"path"];
  }
}

- (void)setObservedProgress:(id)a3
{
  p_observedProgress = &self->_observedProgress;
  id v6 = a3;
  if (([v6 isEqual:*p_observedProgress] & 1) == 0)
  {
    [(NSProgress *)*p_observedProgress ic_removeObserver:self forKeyPath:@"fractionCompleted" context:&compoundliteral_2];
    objc_storeStrong((id *)&self->_observedProgress, a3);
    [(NSProgress *)*p_observedProgress ic_addObserver:self forKeyPath:@"fractionCompleted" context:&compoundliteral_2];
    if (*p_observedProgress)
    {
      [(NSProgress *)*p_observedProgress fractionCompleted];
      -[ICLoadingPieLayer setProgress:](self, "setProgress:");
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICLoadingPieLayer *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/SharedUI/Views/ICLoadingPieLayer.m"])
  {
    char v13 = [(ICLoadingPieLayer *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == &compoundliteral_2 && (v13 & 1) == 0) {
      dispatchMainAfterDelay();
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICLoadingPieLayer;
    [(ICLoadingPieLayer *)&v14 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

void __68__ICLoadingPieLayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observedProgress];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) observedProgress];
    [v3 fractionCompleted];
    objc_msgSend(*(id *)(a1 + 32), "setProgress:");
  }
}

- (double)progress
{
  return self->_progress;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (BOOL)removeOnCompletion
{
  return self->_removeOnCompletion;
}

- (void)setRemoveOnCompletion:(BOOL)a3
{
  self->_removeOnCompletion = a3;
}

- (CAShapeLayer)pieLayer
{
  return self->_pieLayer;
}

- (void)setPieLayer:(id)a3
{
}

- (CAShapeLayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLayer, 0);
  objc_storeStrong((id *)&self->_pieLayer, 0);
  objc_storeStrong((id *)&self->_observedProgress, 0);
}

@end