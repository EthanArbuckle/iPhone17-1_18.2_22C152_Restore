@interface _UIPreviewPresentationAnimator
- (CADisplayLink)displayLink;
- (CAMediaTimingFunction)mediaTimingFunction;
- (_UIPreviewPresentationAnimator)init;
- (_UIPreviewPresentationAnimator)initWithDuration:(double)a3 advanceBlock:(id)a4;
- (double)duration;
- (double)startMediaTime;
- (id)advanceBlock;
- (void)_advanceFromDisplayLink:(id)a3;
- (void)setAdvanceBlock:(id)a3;
- (void)setDisplayLink:(id)a3;
- (void)setDuration:(double)a3;
- (void)setMediaTimingFunction:(id)a3;
- (void)setStartMediaTime:(double)a3;
- (void)stopAnimation;
@end

@implementation _UIPreviewPresentationAnimator

- (_UIPreviewPresentationAnimator)init
{
  return 0;
}

- (_UIPreviewPresentationAnimator)initWithDuration:(double)a3 advanceBlock:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIPreviewPresentationAnimator;
  v7 = [(_UIPreviewPresentationAnimator *)&v14 init];
  v8 = v7;
  if (v7)
  {
    [(_UIPreviewPresentationAnimator *)v7 setStartMediaTime:1.79769313e308];
    [(_UIPreviewPresentationAnimator *)v8 setDuration:a3];
    v9 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
    [(_UIPreviewPresentationAnimator *)v8 setMediaTimingFunction:v9];

    [(_UIPreviewPresentationAnimator *)v8 setAdvanceBlock:v6];
    v10 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v8 selector:sel__advanceFromDisplayLink_];
    v11 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v10 addToRunLoop:v11 forMode:*MEMORY[0x1E4F1C4B0]];

    [(_UIPreviewPresentationAnimator *)v8 setDisplayLink:v10];
    v12 = v8;
  }
  return v8;
}

- (void)stopAnimation
{
  v3 = [(_UIPreviewPresentationAnimator *)self displayLink];
  [v3 invalidate];

  [(_UIPreviewPresentationAnimator *)self setDisplayLink:0];
  [(_UIPreviewPresentationAnimator *)self setAdvanceBlock:0];
}

- (void)_advanceFromDisplayLink:(id)a3
{
  double v4 = CACurrentMediaTime();
  [(_UIPreviewPresentationAnimator *)self startMediaTime];
  double v6 = v5;
  if (v5 == 1.79769313e308)
  {
    [(_UIPreviewPresentationAnimator *)self setStartMediaTime:v4];
    double v6 = v4;
  }
  [(_UIPreviewPresentationAnimator *)self duration];
  double v8 = v4 - v6;
  if (v4 - v6 >= v7) {
    double v8 = v7;
  }
  double v9 = v8 / v7;
  v10 = [(_UIPreviewPresentationAnimator *)self mediaTimingFunction];
  *(float *)&double v11 = v9;
  [v10 _solveForInput:v11];
  *(float *)&double v9 = v12;
  double v13 = v12;

  objc_super v14 = [(_UIPreviewPresentationAnimator *)self advanceBlock];
  v14[2](v13);

  if (*(float *)&v9 >= 1.0)
  {
    [(_UIPreviewPresentationAnimator *)self stopAnimation];
  }
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (CAMediaTimingFunction)mediaTimingFunction
{
  return self->_mediaTimingFunction;
}

- (void)setMediaTimingFunction:(id)a3
{
}

- (double)startMediaTime
{
  return self->_startMediaTime;
}

- (void)setStartMediaTime:(double)a3
{
  self->_startMediaTime = a3;
}

- (id)advanceBlock
{
  return self->_advanceBlock;
}

- (void)setAdvanceBlock:(id)a3
{
}

- (CADisplayLink)displayLink
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayLink);
  return (CADisplayLink *)WeakRetained;
}

- (void)setDisplayLink:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayLink);
  objc_storeStrong(&self->_advanceBlock, 0);
  objc_storeStrong((id *)&self->_mediaTimingFunction, 0);
}

@end