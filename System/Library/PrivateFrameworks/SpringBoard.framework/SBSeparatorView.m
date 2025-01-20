@interface SBSeparatorView
+ (CGSize)nubHitTestSize;
- (CGRect)nubRect;
- (SBSeparatorNubView)nubView;
- (SBSeparatorView)initWithFrame:(CGRect)a3;
- (double)keyboardHeight;
- (unint64_t)nubStyle;
- (void)_updateNubViewFrame;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setFrame:(CGRect)a3;
- (void)setKeyboardHeight:(double)a3;
- (void)setNubStyle:(unint64_t)a3;
- (void)setNubView:(id)a3;
@end

@implementation SBSeparatorView

- (SBSeparatorView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBSeparatorView;
  v3 = -[SBSeparatorView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_nubStyle = 0;
    v5 = [SBSeparatorNubView alloc];
    uint64_t v6 = -[SBSeparatorNubView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    nubView = v4->_nubView;
    v4->_nubView = (SBSeparatorNubView *)v6;

    [(SBSeparatorNubView *)v4->_nubView _setCornerRadius:2.0];
    [(SBSeparatorNubView *)v4->_nubView setAlpha:1.0];
    v8 = v4->_nubView;
    v9 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
    [(SBSeparatorNubView *)v8 setBackgroundColor:v9];

    [(SBSeparatorNubView *)v4->_nubView setUserInteractionEnabled:0];
    [(SBSeparatorView *)v4 addSubview:v4->_nubView];
    [(SBSeparatorView *)v4 _updateNubViewFrame];
  }
  return v4;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBSeparatorView;
  [(SBSeparatorView *)&v3 layoutSubviews];
  [(SBSeparatorView *)self _updateNubViewFrame];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSeparatorView;
  -[SBSeparatorView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SBSeparatorView *)self _updateNubViewFrame];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBSeparatorView;
  -[SBSeparatorView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SBSeparatorView *)self _updateNubViewFrame];
}

- (void)setNubStyle:(unint64_t)a3
{
  if (self->_nubStyle != a3)
  {
    self->_nubStyle = a3;
    if (a3 == 2)
    {
      id v5 = [MEMORY[0x1E4F428B8] whiteColor];
      double v4 = 0.0;
    }
    else
    {
      if (a3 == 1) {
        [MEMORY[0x1E4F428B8] whiteColor];
      }
      else {
      id v5 = [MEMORY[0x1E4F428B8] secondaryLabelColor];
      }
      double v4 = 1.0;
    }
    [(SBSeparatorNubView *)self->_nubView setAlpha:v4];
    [(SBSeparatorNubView *)self->_nubView setBackgroundColor:v5];
  }
}

- (void)setKeyboardHeight:(double)a3
{
  if (self->_keyboardHeight != a3)
  {
    self->_keyboardHeight = a3;
    [(SBSeparatorView *)self _updateNubViewFrame];
  }
}

- (CGRect)nubRect
{
  [(SBSeparatorNubView *)self->_nubView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

+ (CGSize)nubHitTestSize
{
  SBRectWithSize();
  double v3 = v2 + 40.0;
  double v5 = v4 + 40.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)_updateNubViewFrame
{
  [(SBSeparatorView *)self bounds];
  UIRectCenteredIntegralRect();
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(SBSeparatorView *)self frame];
  double v12 = (v11 - self->_keyboardHeight) * 0.5;
  nubView = self->_nubView;
  SBRectWithSize();
  -[SBSeparatorNubView setFrame:](nubView, "setFrame:");
  v14 = self->_nubView;
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  double MidX = CGRectGetMidX(v17);
  -[SBSeparatorNubView setCenter:](v14, "setCenter:", MidX, v12);
}

- (unint64_t)nubStyle
{
  return self->_nubStyle;
}

- (double)keyboardHeight
{
  return self->_keyboardHeight;
}

- (SBSeparatorNubView)nubView
{
  return self->_nubView;
}

- (void)setNubView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end