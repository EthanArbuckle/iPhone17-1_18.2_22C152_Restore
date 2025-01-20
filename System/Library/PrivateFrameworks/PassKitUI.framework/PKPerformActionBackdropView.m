@interface PKPerformActionBackdropView
- (CGSize)sizeThatFits:(CGSize)result;
- (PKPerformActionBackdropView)init;
- (PKPerformActionBackdropView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PKPerformActionBackdropView

- (PKPerformActionBackdropView)init
{
  return -[PKPerformActionBackdropView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKPerformActionBackdropView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKPerformActionBackdropView;
  v3 = -[PKPerformActionBackdropView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backdropView = v3->_backdropView;
    v3->_backdropView = v4;

    v6 = v3->_backdropView;
    v7 = PKProvisioningBackgroundColor();
    [(UIView *)v6 setBackgroundColor:v7];

    [(PKPerformActionBackdropView *)v3 addSubview:v3->_backdropView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKPerformActionBackdropView;
  [(PKPerformActionBackdropView *)&v3 layoutSubviews];
  [(PKPerformActionBackdropView *)self bounds];
  -[UIView setFrame:](self->_backdropView, "setFrame:", 0.0, 0.0);
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 88.0;
  result.height = v3;
  return result;
}

- (void).cxx_destruct
{
}

@end