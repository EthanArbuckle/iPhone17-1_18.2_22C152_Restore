@interface STSRootView
- (STSRootView)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)contentInsets;
- (UIView)contentView;
- (void)_setupView;
- (void)awakeFromNib;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContentView:(id)a3;
@end

@implementation STSRootView

- (STSRootView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)STSRootView;
  v3 = -[STSRootView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(STSRootView *)v3 _setupView];
  }
  return v4;
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)STSRootView;
  [(STSRootView *)&v3 awakeFromNib];
  [(STSRootView *)self _setupView];
}

- (void)_setupView
{
  [(STSRootView *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(MEMORY[0x263F825C8], "sts_defaultBackgroundColor");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(STSRootView *)self setBackgroundColor:v3];
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  p_contentView = &self->_contentView;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v10 = v5;
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    v8 = [(UIView *)*p_contentView superview];
    char v9 = [v8 isEqual:self];

    if ((v9 & 1) == 0) {
      [(STSRootView *)self addSubview:*p_contentView];
    }
    contentView = (UIView *)[(STSRootView *)self setNeedsLayout];
    v5 = v10;
  }

  MEMORY[0x270F9A758](contentView, v5);
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    [(STSRootView *)self setNeedsLayout];
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);

  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end