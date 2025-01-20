@interface NTKFaceViewTapControl
- (BOOL)shouldCancelTouchesInScrollview;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NTKFaceViewTapControl)initWithFrame:(CGRect)a3;
- (UIImageView)highlightImageView;
- (void)layoutSubviews;
- (void)setHighlightImageView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation NTKFaceViewTapControl

- (BOOL)shouldCancelTouchesInScrollview
{
  return 1;
}

- (NTKFaceViewTapControl)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKFaceViewTapControl;
  v3 = -[NTKFaceViewTapControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(NTKFaceViewTapControl *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    highlightImageView = v3->_highlightImageView;
    v3->_highlightImageView = (UIImageView *)v5;

    [(UIImageView *)v3->_highlightImageView setHidden:1];
    [(UIImageView *)v3->_highlightImageView setAlpha:0.0];
    [(NTKFaceViewTapControl *)v3 addSubview:v3->_highlightImageView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKFaceViewTapControl;
  [(NTKFaceViewTapControl *)&v4 layoutSubviews];
  highlightImageView = self->_highlightImageView;
  [(NTKFaceViewTapControl *)self bounds];
  -[UIImageView setFrame:](highlightImageView, "setFrame:");
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NTKFaceViewTapControl;
  unsigned int v5 = [(NTKFaceViewTapControl *)&v12 isHighlighted];
  v11.receiver = self;
  v11.super_class = (Class)NTKFaceViewTapControl;
  [(NTKFaceViewTapControl *)&v11 setHighlighted:v3];
  if (v5 != v3)
  {
    [(UIImageView *)self->_highlightImageView setHidden:0];
    double v6 = 0.2;
    if (v3) {
      double v6 = 0.0;
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__NTKFaceViewTapControl_setHighlighted___block_invoke;
    v9[3] = &unk_1E62C1BF0;
    v9[4] = self;
    BOOL v10 = v3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__NTKFaceViewTapControl_setHighlighted___block_invoke_2;
    v7[3] = &unk_1E62C50B0;
    v7[4] = self;
    BOOL v8 = v3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v9 animations:v7 completion:v6];
  }
}

uint64_t __40__NTKFaceViewTapControl_setHighlighted___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 456) setAlpha:(double)*(unint64_t *)&a2];
}

uint64_t __40__NTKFaceViewTapControl_setHighlighted___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 456) setHidden:*(unsigned char *)(a1 + 40) == 0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIImageView sizeThatFits:](self->_highlightImageView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIImageView)highlightImageView
{
  return self->_highlightImageView;
}

- (void)setHighlightImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end