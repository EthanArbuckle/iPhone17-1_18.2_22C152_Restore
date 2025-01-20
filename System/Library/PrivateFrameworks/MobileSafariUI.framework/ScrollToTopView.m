@interface ScrollToTopView
- (ScrollToTopView)initWithFrame:(CGRect)a3;
- (ScrollToTopView)initWithTargetBlock:(id)a3;
- (double)defaultHeight;
- (id)_targetScrollView;
- (id)showBarsBlock;
- (id)targetBlock;
- (void)_showBars;
- (void)_tappedScrollToTopView:(id)a3;
- (void)setShowBarsBlock:(id)a3;
- (void)setTargetBlock:(id)a3;
@end

@implementation ScrollToTopView

- (ScrollToTopView)initWithTargetBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ScrollToTopView;
  v5 = [(ScrollToTopView *)&v10 init];
  if (v5)
  {
    uint64_t v6 = MEMORY[0x1E4E42950](v4);
    id targetBlock = v5->_targetBlock;
    v5->_id targetBlock = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (ScrollToTopView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ScrollToTopView;
  v3 = -[ScrollToTopView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v3 action:sel__tappedScrollToTopView_];
    [(ScrollToTopView *)v3 addGestureRecognizer:v4];

    v5 = v3;
  }

  return v3;
}

- (void)_tappedScrollToTopView:(id)a3
{
  id v4 = [(ScrollToTopView *)self _targetScrollView];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__ScrollToTopView__tappedScrollToTopView___block_invoke;
  v5[3] = &unk_1E6D77C20;
  v5[4] = self;
  objc_msgSend(v4, "_scrollToTopFromTouchAtScreenLocation:resultHandler:", v5, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

uint64_t __42__ScrollToTopView__tappedScrollToTopView___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _showBars];
  }
  return result;
}

- (id)_targetScrollView
{
  id targetBlock = (void (**)(void, void))self->_targetBlock;
  if (targetBlock)
  {
    ((void (**)(void, SEL))targetBlock)[2](targetBlock, a2);
    id targetBlock = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  }
  return targetBlock;
}

- (void)_showBars
{
  showBarsBlock = (void (**)(void))self->_showBarsBlock;
  if (showBarsBlock) {
    showBarsBlock[2]();
  }
}

- (double)defaultHeight
{
  v2 = [(ScrollToTopView *)self window];
  v3 = [v2 windowScene];

  id v4 = [v3 statusBarManager];
  objc_msgSend(v4, "defaultStatusBarHeightInOrientation:", objc_msgSend(v3, "interfaceOrientation"));
  double v6 = v5;

  return fmax(v6, 20.0);
}

- (id)targetBlock
{
  return self->_targetBlock;
}

- (void)setTargetBlock:(id)a3
{
}

- (id)showBarsBlock
{
  return self->_showBarsBlock;
}

- (void)setShowBarsBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_showBarsBlock, 0);
  objc_storeStrong(&self->_targetBlock, 0);
}

@end