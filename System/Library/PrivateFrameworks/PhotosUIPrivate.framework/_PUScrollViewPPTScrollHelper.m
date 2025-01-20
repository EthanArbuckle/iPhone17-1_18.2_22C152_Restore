@interface _PUScrollViewPPTScrollHelper
- (CADisplayLink)_displayLink;
- (CGPoint)originContentOffset;
- (UIScrollView)scrollView;
- (_PUScrollViewPPTScrollHelper)init;
- (_PUScrollViewPPTScrollHelper)initWithScrollView:(id)a3;
- (double)_lastIncrementTime;
- (id)_completionHandler;
- (id)_incrementHandler;
- (void)_endScroll;
- (void)_incrementScroll;
- (void)_setCompletionHandler:(id)a3;
- (void)_setDisplayLink:(id)a3;
- (void)_setIncrementHandler:(id)a3;
- (void)_setLastIncrementTime:(double)a3;
- (void)_setOriginContentOffset:(CGPoint)a3;
- (void)scrollWithStartHandler:(id)a3 incrementHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation _PUScrollViewPPTScrollHelper

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong(&self->__incrementHandler, 0);
  objc_destroyWeak((id *)&self->__displayLink);
  objc_destroyWeak((id *)&self->_scrollView);
}

- (void)_setCompletionHandler:(id)a3
{
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setIncrementHandler:(id)a3
{
}

- (id)_incrementHandler
{
  return self->__incrementHandler;
}

- (void)_setLastIncrementTime:(double)a3
{
  self->__lastIncrementTime = a3;
}

- (double)_lastIncrementTime
{
  return self->__lastIncrementTime;
}

- (void)_setDisplayLink:(id)a3
{
}

- (CADisplayLink)_displayLink
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__displayLink);
  return (CADisplayLink *)WeakRetained;
}

- (void)_setOriginContentOffset:(CGPoint)a3
{
  self->_originContentOffset = a3;
}

- (CGPoint)originContentOffset
{
  double x = self->_originContentOffset.x;
  double y = self->_originContentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  return (UIScrollView *)WeakRetained;
}

- (void)_endScroll
{
  v3 = [(_PUScrollViewPPTScrollHelper *)self _completionHandler];

  if (v3)
  {
    v4 = [(_PUScrollViewPPTScrollHelper *)self _completionHandler];
    v4[2]();
  }
  [(_PUScrollViewPPTScrollHelper *)self _setIncrementHandler:0];
  [(_PUScrollViewPPTScrollHelper *)self _setCompletionHandler:0];
  v5 = [(_PUScrollViewPPTScrollHelper *)self _displayLink];
  [v5 invalidate];

  id v6 = [(_PUScrollViewPPTScrollHelper *)self scrollView];
  [v6 _reenableImplicitAnimationsAfterScrollTest];
  objc_msgSend(v6, "_pu_setPPTScrollHelper:", 0);
}

- (void)_incrementScroll
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  [(_PUScrollViewPPTScrollHelper *)self _lastIncrementTime];
  double v7 = v5 - v6;
  [(_PUScrollViewPPTScrollHelper *)self _setLastIncrementTime:v5];
  char v10 = 0;
  v8 = [(_PUScrollViewPPTScrollHelper *)self _incrementHandler];
  ((void (**)(void, char *, double))v8)[2](v8, &v10, v7);

  if (v10)
  {
    [(_PUScrollViewPPTScrollHelper *)self _endScroll];
  }
  else
  {
    v9 = [(_PUScrollViewPPTScrollHelper *)self _displayLink];

    if (!v9) {
      [(_PUScrollViewPPTScrollHelper *)self performSelector:a2 withObject:0 afterDelay:0.0];
    }
  }
}

- (void)scrollWithStartHandler:(id)a3 incrementHandler:(id)a4 completionHandler:(id)a5
{
  v14 = (void (**)(void))a3;
  id v8 = a4;
  id v9 = a5;
  char v10 = getenv("CA_BENCHMARK");
  if (v10 && *v10 != 48)
  {
    v11 = 0;
  }
  else
  {
    v11 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:self selector:sel__incrementScroll];
  }
  [(_PUScrollViewPPTScrollHelper *)self _setDisplayLink:v11];
  v12 = [(_PUScrollViewPPTScrollHelper *)self scrollView];
  objc_msgSend(v12, "_pu_setPPTScrollHelper:", self);
  [v12 _suppressImplicitAnimationsForScrollTest];
  if (v11)
  {
    v13 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
    [v11 addToRunLoop:v13 forMode:*MEMORY[0x1E4F1C4B0]];
  }
  else
  {
    [(_PUScrollViewPPTScrollHelper *)self performSelector:sel__incrementScroll withObject:0 afterDelay:0.0];
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  -[_PUScrollViewPPTScrollHelper _setLastIncrementTime:](self, "_setLastIncrementTime:");
  [(_PUScrollViewPPTScrollHelper *)self _setIncrementHandler:v8];
  [(_PUScrollViewPPTScrollHelper *)self _setCompletionHandler:v9];
  if (v14) {
    v14[2]();
  }
}

- (_PUScrollViewPPTScrollHelper)initWithScrollView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_PUScrollViewPPTScrollHelper;
  double v5 = [(_PUScrollViewPPTScrollHelper *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_scrollView, v4);
  }

  return v6;
}

- (_PUScrollViewPPTScrollHelper)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UIScrollView+PhotosUI.m", 285, @"%s is not available as initializer", "-[_PUScrollViewPPTScrollHelper init]");

  abort();
}

@end