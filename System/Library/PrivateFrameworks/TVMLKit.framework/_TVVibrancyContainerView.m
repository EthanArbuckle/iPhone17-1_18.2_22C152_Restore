@interface _TVVibrancyContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)containedView;
- (_TVVibrancyContainerView)initWithEffect:(id)a3 containingView:(id)a4;
- (void)layoutSubviews;
@end

@implementation _TVVibrancyContainerView

- (_TVVibrancyContainerView)initWithEffect:(id)a3 containingView:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_TVVibrancyContainerView;
  v7 = [(_TVVibrancyContainerView *)&v11 initWithEffect:a3];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_containedView, v6);
    v9 = [(_TVVibrancyContainerView *)v8 contentView];
    [v9 addSubview:v6];
  }
  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(_TVVibrancyContainerView *)self containedView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)_TVVibrancyContainerView;
  [(_TVVibrancyContainerView *)&v6 layoutSubviews];
  v3 = [(_TVVibrancyContainerView *)self containedView];
  double v4 = *MEMORY[0x263F00148];
  double v5 = *(double *)(MEMORY[0x263F00148] + 8);
  [(_TVVibrancyContainerView *)self bounds];
  objc_msgSend(v3, "setFrame:", v4, v5);
}

- (UIView)containedView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containedView);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end