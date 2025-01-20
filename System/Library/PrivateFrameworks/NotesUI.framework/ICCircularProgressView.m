@interface ICCircularProgressView
- (CAShapeLayer)circleLayer;
- (CGPath)newPathForProgress:(double)a3;
- (NSProgress)observedProgress;
- (double)progress;
- (void)awakeFromNib;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCircleLayer:(id)a3;
- (void)setObservedProgress:(id)a3;
- (void)setProgress:(double)a3;
@end

@implementation ICCircularProgressView

- (void)dealloc
{
  [(NSProgress *)self->_observedProgress removeObserver:self forKeyPath:@"fractionCompleted" context:&compoundliteral_1];
  v3.receiver = self;
  v3.super_class = (Class)ICCircularProgressView;
  [(ICCircularProgressView *)&v3 dealloc];
}

- (void)awakeFromNib
{
  v8.receiver = self;
  v8.super_class = (Class)ICCircularProgressView;
  [(ICCircularProgressView *)&v8 awakeFromNib];
  objc_super v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
  circleLayer = self->_circleLayer;
  self->_circleLayer = v3;

  id v5 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  -[CAShapeLayer setFillColor:](self->_circleLayer, "setFillColor:", [v5 CGColor]);

  [(CAShapeLayer *)self->_circleLayer setFillRule:*MEMORY[0x1E4F39FB8]];
  v6 = [(ICCircularProgressView *)self newPathForProgress:0.1];
  [(CAShapeLayer *)self->_circleLayer setPath:v6];
  CGPathRelease(v6);
  v7 = [(ICCircularProgressView *)self layer];
  [v7 addSublayer:self->_circleLayer];
}

- (CGPath)newPathForProgress:(double)a3
{
  [(ICCircularProgressView *)self frame];
  CGFloat v6 = v5 * 0.5;
  Mutable = CGPathCreateMutable();
  [(ICCircularProgressView *)self bounds];
  CGRect v10 = CGRectInset(v9, 4.0, 4.0);
  CGPathAddEllipseInRect(Mutable, 0, v10);
  CGPathMoveToPoint(Mutable, 0, v6, v6);
  CGPathAddLineToPoint(Mutable, 0, v6, 8.0);
  CGPathAddArc(Mutable, 0, v6, v6, v6 + -8.0, -1.57079633, a3 * 6.28318531 + -1.57079633, 1);
  return Mutable;
}

- (void)setProgress:(double)a3
{
  double v4 = fmax(self->_progress, 0.1);
  double v5 = fmax(a3, 0.1);
  self->_progress = a3;
  id v17 = objc_alloc_init(MEMORY[0x1E4F39BD8]);
  [v17 setKeyPath:@"path"];
  double v6 = v5 - v4;
  uint64_t v7 = (uint64_t)fmax(v6 / 0.1, 1.0);
  objc_super v8 = [MEMORY[0x1E4F1CA48] array];
  CGRect v9 = [MEMORY[0x1E4F1CA48] array];
  if (v7 >= 1)
  {
    for (uint64_t i = 1; i <= v7; ++i)
    {
      v11 = [(ICCircularProgressView *)self newPathForProgress:v4 + (float)((float)(int)i / (float)v7) * v6];
      [v8 addObject:v11];

      *(float *)&double v12 = (float)(int)i / (float)v7;
      v13 = [NSNumber numberWithFloat:v12];
      [v9 addObject:v13];
    }
  }
  [v17 setValues:v8];
  [v17 setKeyTimes:v9];
  uint64_t v14 = [v8 lastObject];
  v15 = [(ICCircularProgressView *)self circleLayer];
  [v15 setPath:v14];

  v16 = [(ICCircularProgressView *)self circleLayer];
  [v16 addAnimation:v17 forKey:@"path"];
}

- (void)setObservedProgress:(id)a3
{
  p_observedProgress = &self->_observedProgress;
  id v6 = a3;
  if (([v6 isEqual:*p_observedProgress] & 1) == 0)
  {
    [(NSProgress *)*p_observedProgress ic_removeObserver:self forKeyPath:@"fractionCompleted" context:&compoundliteral_1];
    objc_storeStrong((id *)&self->_observedProgress, a3);
    [(NSProgress *)*p_observedProgress ic_addObserver:self forKeyPath:@"fractionCompleted" context:&compoundliteral_1];
    if (*p_observedProgress)
    {
      [(NSProgress *)*p_observedProgress fractionCompleted];
      -[ICCircularProgressView setProgress:](self, "setProgress:");
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  if ([(ICCircularProgressView *)self ic_didAddObserverForContext:a6 inScope:"/Library/Caches/com.apple.xbs/Sources/MobileNotesSupport/Ironcade/SharedUI/iOS/ICCircularProgressView.m"])
  {
    char v13 = [(ICCircularProgressView *)self ic_shouldIgnoreObserveValue:v10 ofObject:v11 forKeyPath:v12];

    if (a6 == &compoundliteral_1 && (v13 & 1) == 0) {
      dispatchMainAfterDelay();
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ICCircularProgressView;
    [(ICCircularProgressView *)&v14 observeValueForKeyPath:v12 ofObject:v11 change:v10 context:a6];
  }
}

void __73__ICCircularProgressView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
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

- (CAShapeLayer)circleLayer
{
  return self->_circleLayer;
}

- (void)setCircleLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleLayer, 0);
  objc_storeStrong((id *)&self->_observedProgress, 0);
}

@end