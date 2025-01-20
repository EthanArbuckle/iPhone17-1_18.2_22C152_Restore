@interface PUProgressView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (PUProgressView)initWithCoder:(id)a3;
- (PUProgressView)initWithFrame:(CGRect)a3;
- (PUProgressView)initWithStyle:(int64_t)a3;
- (int64_t)style;
- (void)hideAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)showInView:(id)a3 animated:(BOOL)a4 afterDelay:(double)a5;
@end

@implementation PUProgressView

- (void).cxx_destruct
{
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 1;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PUProgressView;
  [(PUProgressView *)&v4 layoutSubviews];
  spinner = self->_spinner;
  [(PUProgressView *)self center];
  -[UIActivityIndicatorView setCenter:](spinner, "setCenter:");
}

- (void)hideAnimated:(BOOL)a3
{
  double v3 = 0.0;
  if (a3) {
    double v3 = 0.5;
  }
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__PUProgressView_hideAnimated___block_invoke;
  v5[3] = &unk_1E5F2ED10;
  v5[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__PUProgressView_hideAnimated___block_invoke_2;
  v4[3] = &unk_1E5F2CEE8;
  v4[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v5 options:v4 animations:v3 completion:0.0];
}

uint64_t __31__PUProgressView_hideAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __31__PUProgressView_hideAnimated___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) stopAnimating];
  v2 = *(void **)(a1 + 32);
  return [v2 removeFromSuperview];
}

- (void)showInView:(id)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [v8 bounds];
  -[PUProgressView setFrame:](self, "setFrame:");
  [v8 addSubview:self];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
  [(PUProgressView *)self setAlpha:0.0];
  double v9 = 0.5;
  if (!v6) {
    double v9 = 0.0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PUProgressView_showInView_animated_afterDelay___block_invoke;
  v10[3] = &unk_1E5F2ED10;
  v10[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v10 options:0 animations:v9 completion:a5];
}

uint64_t __49__PUProgressView_showInView_animated_afterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (PUProgressView)initWithCoder:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PUProgressView.m" lineNumber:47 description:@"unsupported initializer"];

  return [(PUProgressView *)self initWithStyle:0];
}

- (PUProgressView)initWithFrame:(CGRect)a3
{
  return -[PUProgressView initWithStyle:](self, "initWithStyle:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PUProgressView)initWithStyle:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PUProgressView;
  objc_super v4 = -[PUProgressView initWithFrame:](&v13, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_style = a3;
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:101];
    spinner = v5->_spinner;
    v5->_spinner = (UIActivityIndicatorView *)v6;

    if (a3 == 1)
    {
      v10 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UIActivityIndicatorView *)v5->_spinner setColor:v10];

      double v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
      v11 = [v9 colorWithAlphaComponent:0.5];
      [(PUProgressView *)v5 setBackgroundColor:v11];
    }
    else
    {
      if (a3)
      {
LABEL_7:
        [(PUProgressView *)v5 addSubview:v5->_spinner];
        [(PUProgressView *)v5 setAutoresizingMask:18];
        return v5;
      }
      id v8 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UIActivityIndicatorView *)v5->_spinner setColor:v8];

      double v9 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.5];
      [(PUProgressView *)v5 setBackgroundColor:v9];
    }

    goto LABEL_7;
  }
  return v5;
}

@end