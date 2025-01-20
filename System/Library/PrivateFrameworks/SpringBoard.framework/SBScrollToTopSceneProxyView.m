@interface SBScrollToTopSceneProxyView
- (BOOL)isScrollEnabled;
- (SBSceneHandle)sceneHandle;
- (SBScrollToTopSceneProxyViewDelegate)delegate;
- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4;
- (void)didMoveToWindow;
- (void)setDelegate:(id)a3;
- (void)setSceneHandle:(id)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SBScrollToTopSceneProxyView

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v5 = [(SBScrollToTopSceneProxyView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(SBScrollToTopSceneProxyView *)self window];
    [v5 scrollToTopSceneProxyViewWillExitViewHierarchy:self rootedAtWindow:v6];
  }
  v7.receiver = self;
  v7.super_class = (Class)SBScrollToTopSceneProxyView;
  [(SBScrollToTopSceneProxyView *)&v7 willMoveToWindow:v4];
}

- (void)didMoveToWindow
{
  v3 = [(SBScrollToTopSceneProxyView *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(SBScrollToTopSceneProxyView *)self window];
    [v3 scrollToTopSceneProxyViewDidEnterViewHierarchy:self rootedAtWindow:v4];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBScrollToTopSceneProxyView;
  [(SBScrollToTopSceneProxyView *)&v5 didMoveToWindow];
}

- (BOOL)isScrollEnabled
{
  return 1;
}

- (void)_scrollToTopFromTouchAtScreenLocation:(CGPoint)a3 resultHandler:(id)a4
{
  double x = a3.x;
  v10 = (void (**)(id, uint64_t))a4;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F42E50]) initWithType:0 xPosition:x];
  objc_super v7 = [(SBScrollToTopSceneProxyView *)self sceneHandle];
  v8 = [v7 sceneIfExists];
  v9 = [MEMORY[0x1E4F1CAD0] setWithObject:v6];
  [v8 sendActions:v9];

  if (v10) {
    v10[2](v10, 1);
  }
}

- (SBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (void)setSceneHandle:(id)a3
{
}

- (SBScrollToTopSceneProxyViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBScrollToTopSceneProxyViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
}

@end