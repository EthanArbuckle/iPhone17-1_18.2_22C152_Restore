@interface SiriUIProgressBarView
- (SiriUIProgressBarView)initWithFrame:(CGRect)a3;
- (void)beginProgressAnimationWithDuration:(double)a3;
- (void)layoutSubviews;
@end

@implementation SiriUIProgressBarView

- (SiriUIProgressBarView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SiriUIProgressBarView;
  v3 = -[SiriUIProgressBarView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    progressBar = v3->_progressBar;
    v3->_progressBar = (UIView *)v5;

    v7 = v3->_progressBar;
    v8 = [MEMORY[0x263F1C550] labelColor];
    v9 = [v8 colorWithAlphaComponent:0.3];
    [(UIView *)v7 setBackgroundColor:v9];

    [(SiriUIProgressBarView *)v3 addSubview:v3->_progressBar];
    [(SiriUIProgressBarView *)v3 setClipsToBounds:1];
    v3->_progressState = 0;
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIProgressBarView;
  [(SiriUIProgressBarView *)&v4 layoutSubviews];
  [(SiriUIProgressBarView *)self bounds];
  unint64_t progressState = self->_progressState;
  if (progressState != 1) {
    -[UIView setFrame:](self->_progressBar, "setFrame:");
  }
}

- (void)beginProgressAnimationWithDuration:(double)a3
{
  if (!self->_progressState)
  {
    self->_unint64_t progressState = 1;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __60__SiriUIProgressBarView_beginProgressAnimationWithDuration___block_invoke;
    v4[3] = &unk_26469EFA8;
    v4[4] = self;
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __60__SiriUIProgressBarView_beginProgressAnimationWithDuration___block_invoke_2;
    v3[3] = &unk_26469F020;
    v3[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v4 animations:v3 completion:a3];
  }
}

uint64_t __60__SiriUIProgressBarView_beginProgressAnimationWithDuration___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[51];
  [v1 bounds];
  return objc_msgSend(v2, "setFrame:");
}

uint64_t __60__SiriUIProgressBarView_beginProgressAnimationWithDuration___block_invoke_2(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 416) = 2;
  return result;
}

- (void).cxx_destruct
{
}

@end