@interface SiriSharedUIContentPlatterSeparatorView
- (CGSize)sizeThatFits:(CGSize)a3;
- (SiriSharedUIContentPlatterSeparatorView)initWithFrame:(CGRect)a3;
- (UIView)backgroundView;
- (UIView)backgroundViewSmall;
- (double)_scale;
- (int64_t)separatorType;
- (void)_setupBackgroundView;
- (void)_setupBackgroundViewSmall;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setBackgroundViewSmall:(id)a3;
- (void)setSeparatorType:(int64_t)a3;
@end

@implementation SiriSharedUIContentPlatterSeparatorView

- (SiriSharedUIContentPlatterSeparatorView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SiriSharedUIContentPlatterSeparatorView;
  v3 = -[SiriSharedUIContentPlatterSeparatorView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SiriSharedUIContentPlatterSeparatorView *)v3 _setupBackgroundView];
    [(SiriSharedUIContentPlatterSeparatorView *)v4 _setupBackgroundViewSmall];
    [(SiriSharedUIContentPlatterSeparatorView *)v4 addSubview:v4->_backgroundView];
    [(SiriSharedUIContentPlatterSeparatorView *)v4 addSubview:v4->_backgroundViewSmall];
    v4->_separatorType = 0;
  }
  return v4;
}

- (void)_setupBackgroundView
{
  id v8 = [MEMORY[0x263F824D8] effectWithStyle:8];
  v3 = [MEMORY[0x263F82DF0] effectForBlurEffect:v8 style:7];
  v4 = (UIView *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v3];
  v5 = [(UIView *)v4 contentView];
  objc_super v6 = SiriSharedUIPlatterKeyLineColor();
  [v5 setBackgroundColor:v6];

  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;
}

- (void)_setupBackgroundViewSmall
{
  v3 = (UIView *)[objc_alloc(MEMORY[0x263F7E3B8]) initWithProminence:2];
  backgroundViewSmall = self->_backgroundViewSmall;
  self->_backgroundViewSmall = v3;

  v5 = self->_backgroundViewSmall;
  [(UIView *)v5 setHidden:1];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  switch(self->_separatorType)
  {
    case 0:
    case 4:
      double v4 = 8.0;
      break;
    case 1:
      [(SiriSharedUIContentPlatterSeparatorView *)self _scale];
      double v4 = 1.0 / v5;
      break;
    case 2:
      double v4 = 2.0;
      break;
    case 3:
      double v4 = 4.0;
      break;
    default:
      double v4 = 0.0;
      break;
  }
  double v6 = width;
  result.height = v4;
  result.CGFloat width = v6;
  return result;
}

- (double)_scale
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 scale];
  double v4 = v3;

  return v4;
}

- (void)setSeparatorType:(int64_t)a3
{
  if (self->_separatorType != a3)
  {
    self->_separatorType = a3;
    backgroundView = self->_backgroundView;
    BOOL v5 = a3 == 1;
    BOOL v6 = a3 == 1;
    uint64_t v7 = !v5;
    [(UIView *)backgroundView setHidden:v6];
    backgroundViewSmall = self->_backgroundViewSmall;
    [(UIView *)backgroundViewSmall setHidden:v7];
  }
}

- (void)layoutSubviews
{
  backgroundView = self->_backgroundView;
  [(SiriSharedUIContentPlatterSeparatorView *)self bounds];
  -[UIView setFrame:](backgroundView, "setFrame:");
  backgroundViewSmall = self->_backgroundViewSmall;
  [(SiriSharedUIContentPlatterSeparatorView *)self bounds];
  -[UIView setFrame:](backgroundViewSmall, "setFrame:");
}

- (int64_t)separatorType
{
  return self->_separatorType;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)backgroundViewSmall
{
  return self->_backgroundViewSmall;
}

- (void)setBackgroundViewSmall:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundViewSmall, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end