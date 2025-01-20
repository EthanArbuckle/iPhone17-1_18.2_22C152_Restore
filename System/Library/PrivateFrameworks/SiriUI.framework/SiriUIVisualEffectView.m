@interface SiriUIVisualEffectView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (UIView)customView;
- (void)layoutSubviews;
- (void)setCustomView:(id)a3;
@end

@implementation SiriUIVisualEffectView

- (void)setCustomView:(id)a3
{
  v4 = (UIView *)a3;
  customView = self->_customView;
  if (customView) {
    [(UIView *)customView removeFromSuperview];
  }
  v6 = self->_customView;
  self->_customView = v4;
  v7 = v4;

  v9.receiver = self;
  v9.super_class = (Class)SiriUIVisualEffectView;
  v8 = [(SiriUIVisualEffectView *)&v9 contentView];
  [v8 addSubview:v7];

  [(SiriUIVisualEffectView *)self invalidateIntrinsicContentSize];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIVisualEffectView;
  [(SiriUIVisualEffectView *)&v4 layoutSubviews];
  customView = self->_customView;
  [(SiriUIVisualEffectView *)self bounds];
  -[UIView setFrame:](customView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_customView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(UIView *)self->_customView intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  -[UIView systemLayoutSizeFittingSize:](self->_customView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIView)customView
{
  return self->_customView;
}

- (void).cxx_destruct
{
}

@end