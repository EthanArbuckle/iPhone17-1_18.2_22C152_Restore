@interface SUICProgressIndicatorView
- (BOOL)isArrowVisible;
- (BOOL)isCheckmarkVisible;
- (BOOL)isDarkened;
- (BOOL)isSpinning;
- (SUICProgressIndicatorView)initWithFrame:(CGRect)a3;
- (double)progressValue;
- (void)layoutSublayersOfLayer:(id)a3;
- (void)layoutSubviews;
- (void)setArrowVisible:(BOOL)a3;
- (void)setArrowVisible:(BOOL)a3 delay:(double)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)setCheckmarkVisible:(BOOL)a3;
- (void)setCheckmarkVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setDarkened:(BOOL)a3;
- (void)setDarkened:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setProgressValue:(double)a3;
- (void)setProgressValue:(double)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setRingColor:(id)a3;
- (void)setRingLineWidth:(double)a3;
- (void)setShadowColor:(id)a3;
- (void)setShadowLineWidth:(double)a3;
- (void)setSpinning:(BOOL)a3;
@end

@implementation SUICProgressIndicatorView

- (SUICProgressIndicatorView)initWithFrame:(CGRect)a3
{
  v27.receiver = self;
  v27.super_class = (Class)SUICProgressIndicatorView;
  v3 = -[SUICProgressIndicatorView initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(_SUICRingLayer);
    shadowRingLayer = v3->_shadowRingLayer;
    v3->_shadowRingLayer = v4;

    v6 = v3->_shadowRingLayer;
    v7 = [(SUICProgressIndicatorView *)v3 traitCollection];
    if ([v7 userInterfaceStyle] == 2) {
      [MEMORY[0x1E4FB1618] darkGrayColor];
    }
    else {
    v8 = [MEMORY[0x1E4FB1618] lightGrayColor];
    }
    [(_SUICRingLayer *)v6 setRingColor:v8];

    v9 = objc_alloc_init(_SUICProgressRingLayer);
    progressRingLayer = v3->_progressRingLayer;
    v3->_progressRingLayer = v9;

    v11 = v3->_progressRingLayer;
    v12 = [MEMORY[0x1E4FB1618] blackColor];
    [(_SUICRingLayer *)v11 setRingColor:v12];

    v13 = [MEMORY[0x1E4FB1830] configurationWithWeight:7];
    v14 = [MEMORY[0x1E4FB1818] systemImageNamed:@"arrow.right" withConfiguration:v13];
    v15 = [MEMORY[0x1E4FB1618] blackColor];
    v16 = [v14 imageWithTintColor:v15 renderingMode:1];

    uint64_t v17 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v16];
    actionArrowImageView = v3->_actionArrowImageView;
    v3->_actionArrowImageView = (UIImageView *)v17;

    [(UIImageView *)v3->_actionArrowImageView setContentMode:1];
    v19 = (LAUICheckmarkLayer *)objc_alloc_init(MEMORY[0x1E4F72FB8]);
    checkmarkLayer = v3->_checkmarkLayer;
    v3->_checkmarkLayer = v19;

    v21 = v3->_checkmarkLayer;
    v22 = [MEMORY[0x1E4FB1618] whiteColor];
    [(LAUICheckmarkLayer *)v21 setPrimaryColor:v22 animated:0];

    v23 = [(SUICProgressIndicatorView *)v3 layer];
    [v23 addSublayer:v3->_shadowRingLayer];

    v24 = [(SUICProgressIndicatorView *)v3 layer];
    [v24 addSublayer:v3->_progressRingLayer];

    v25 = [(SUICProgressIndicatorView *)v3 layer];
    [v25 addSublayer:v3->_checkmarkLayer];

    [(SUICProgressIndicatorView *)v3 addSubview:v3->_actionArrowImageView];
    [(SUICProgressIndicatorView *)v3 setArrowVisible:1];
    [(SUICProgressIndicatorView *)v3 setProgressValue:1.0];
    [(SUICProgressIndicatorView *)v3 setCheckmarkVisible:0];
    [(SUICProgressIndicatorView *)v3 setSpinning:0];
    [(SUICProgressIndicatorView *)v3 setDarkened:0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SUICProgressIndicatorView;
  [(SUICProgressIndicatorView *)&v4 layoutSubviews];
  [(SUICProgressIndicatorView *)self bounds];
  CGRectGetWidth(v5);
  actionArrowImageView = self->_actionArrowImageView;
  [(SUICProgressIndicatorView *)self bounds];
  UIRectCenteredIntegralRect();
  -[UIImageView setFrame:](actionArrowImageView, "setFrame:");
}

- (void)layoutSublayersOfLayer:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)SUICProgressIndicatorView;
  id v4 = a3;
  [(SUICProgressIndicatorView *)&v18 layoutSublayersOfLayer:v4];
  objc_msgSend(v4, "bounds", v18.receiver, v18.super_class);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  checkmarkLayer = self->_checkmarkLayer;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  CGFloat v14 = CGRectGetWidth(v19) * 0.25;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  CGFloat v15 = CGRectGetHeight(v20) * 0.25;
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  CGRect v22 = CGRectInset(v21, v14, v15);
  -[LAUICheckmarkLayer setFrame:](checkmarkLayer, "setFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
  progressRingLayer = self->_progressRingLayer;
  [(SUICProgressIndicatorView *)self bounds];
  -[_SUICRingLayer setFrame:](progressRingLayer, "setFrame:");
  shadowRingLayer = self->_shadowRingLayer;
  [(SUICProgressIndicatorView *)self bounds];
  -[_SUICRingLayer setFrame:](shadowRingLayer, "setFrame:");
}

- (void)setRingColor:(id)a3
{
}

- (void)setShadowColor:(id)a3
{
}

- (void)setRingLineWidth:(double)a3
{
}

- (void)setShadowLineWidth:(double)a3
{
}

- (double)progressValue
{
  [(_SUICProgressRingLayer *)self->_progressRingLayer progress];
  return result;
}

- (void)setProgressValue:(double)a3
{
}

- (void)setProgressValue:(double)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (BOOL)isArrowVisible
{
  [(UIImageView *)self->_actionArrowImageView alpha];
  return v2 != 0.0;
}

- (void)setArrowVisible:(BOOL)a3
{
}

- (void)setArrowVisible:(BOOL)a3 delay:(double)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v8 = a3;
  CGFloat v10 = (void (**)(id, uint64_t))a6;
  if ([(SUICProgressIndicatorView *)self isArrowVisible] != v8)
  {
    objc_initWeak(&location, self->_actionArrowImageView);
    if (v6)
    {
      double v11 = (void *)MEMORY[0x1E4FB1EB0];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __71__SUICProgressIndicatorView_setArrowVisible_delay_animated_completion___block_invoke;
      v18[3] = &unk_1E5C59968;
      CGFloat v12 = &v19;
      objc_copyWeak(&v19, &location);
      BOOL v20 = v8;
      [v11 animateWithDuration:0 delay:v18 usingSpringWithDamping:v10 initialSpringVelocity:0.35 options:a4 animations:400.0 completion:1.0];
    }
    else
    {
      if (a4 == 0.0)
      {
        [(UIImageView *)self->_actionArrowImageView setAlpha:(double)v8];
        if (v10) {
          v10[2](v10, 1);
        }
        goto LABEL_11;
      }
      dispatch_time_t v13 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __71__SUICProgressIndicatorView_setArrowVisible_delay_animated_completion___block_invoke_2;
      v14[3] = &unk_1E5C59990;
      CGFloat v12 = &v16;
      objc_copyWeak(&v16, &location);
      BOOL v17 = v8;
      CGFloat v15 = v10;
      dispatch_after(v13, MEMORY[0x1E4F14428], v14);
    }
    objc_destroyWeak(v12);
LABEL_11:
    objc_destroyWeak(&location);
    goto LABEL_12;
  }
  if (v10) {
    v10[2](v10, 1);
  }
LABEL_12:
}

void __71__SUICProgressIndicatorView_setArrowVisible_delay_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  LOBYTE(v2) = *(unsigned char *)(a1 + 40);
  [WeakRetained setAlpha:(double)v2];
}

void __71__SUICProgressIndicatorView_setArrowVisible_delay_animated_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  LOBYTE(v3) = *(unsigned char *)(a1 + 48);
  id v5 = WeakRetained;
  [WeakRetained setAlpha:(double)v3];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, 1);
  }
}

- (BOOL)isSpinning
{
  return [(_SUICProgressRingLayer *)self->_progressRingLayer spinning];
}

- (void)setSpinning:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_SUICProgressRingLayer *)self->_progressRingLayer spinning] != a3)
  {
    progressRingLayer = self->_progressRingLayer;
    [(_SUICProgressRingLayer *)progressRingLayer setSpinning:v3];
  }
}

- (BOOL)isCheckmarkVisible
{
  return [(LAUICheckmarkLayer *)self->_checkmarkLayer isRevealed];
}

- (void)setCheckmarkVisible:(BOOL)a3
{
}

- (void)setCheckmarkVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  BOOL v8 = (void (**)(id, uint64_t))a5;
  if ([(SUICProgressIndicatorView *)self isCheckmarkVisible] == v6)
  {
    if (v8) {
      v8[2](v8, 1);
    }
  }
  else
  {
    [(LAUICheckmarkLayer *)self->_checkmarkLayer setRevealed:v6 animated:v5 withCompletion:v8];
  }
}

- (BOOL)isDarkened
{
  id v3 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v4 = (CGColor *)[v3 CGColor];

  BOOL v5 = (CGColor *)[(_SUICProgressRingLayer *)self->_progressRingLayer fillColor];

  return CGColorEqualToColor(v5, v4);
}

- (void)setDarkened:(BOOL)a3
{
}

- (void)setDarkened:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a3;
  double v7 = (void (**)(id, uint64_t))a5;
  if ([(SUICProgressIndicatorView *)self isDarkened] == v5)
  {
    if (v7) {
      v7[2](v7, 1);
    }
  }
  else
  {
    if (v5) {
      [MEMORY[0x1E4FB1618] blackColor];
    }
    else {
    id v8 = [MEMORY[0x1E4FB1618] clearColor];
    }
    double v9 = (void *)[v8 CGColor];

    objc_initWeak(&location, self);
    CGFloat v10 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __61__SUICProgressIndicatorView_setDarkened_animated_completion___block_invoke;
    v11[3] = &unk_1E5C59920;
    objc_copyWeak(v12, &location);
    v12[1] = v9;
    [v10 animateWithDuration:0 delay:v11 usingSpringWithDamping:v7 initialSpringVelocity:0.35 options:0.0 animations:400.0 completion:1.0];
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

void __61__SUICProgressIndicatorView_setDarkened_animated_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[52] setFillColor:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionArrowImageView, 0);
  objc_storeStrong((id *)&self->_checkmarkLayer, 0);
  objc_storeStrong((id *)&self->_progressRingLayer, 0);

  objc_storeStrong((id *)&self->_shadowRingLayer, 0);
}

@end