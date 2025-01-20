@interface _SFCompressedBarButton
- (_SFCompressedBarButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation _SFCompressedBarButton

- (_SFCompressedBarButton)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_SFCompressedBarButton;
  v3 = -[_SFCompressedBarButton initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    highlightView = v3->_highlightView;
    v3->_highlightView = v4;

    [(UIView *)v3->_highlightView setAlpha:0.0];
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v3->_highlightView setBackgroundColor:v6];

    v7 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E0]];
    v8 = [(UIView *)v3->_highlightView layer];
    [v8 setCompositingFilter:v7];

    [(_SFCompressedBarButton *)v3 addSubview:v3->_highlightView];
    v9 = v3;
  }

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SFCompressedBarButton;
  -[_SFCompressedBarButton setHighlighted:](&v8, sel_setHighlighted_);
  double v5 = 0.2;
  v6[1] = 3221225472;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[2] = __41___SFCompressedBarButton_setHighlighted___block_invoke;
  v6[3] = &unk_1E54EA208;
  if (!v3) {
    double v5 = 0.5;
  }
  v6[4] = self;
  BOOL v7 = v3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:50659332 delay:v6 options:0 animations:v5 completion:0.0];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_SFCompressedBarButton;
  [(_SFCompressedBarButton *)&v3 layoutSubviews];
  [(_SFCompressedBarButton *)self bounds];
  -[UIView setFrame:](self->_highlightView, "setFrame:");
}

- (void).cxx_destruct
{
}

@end