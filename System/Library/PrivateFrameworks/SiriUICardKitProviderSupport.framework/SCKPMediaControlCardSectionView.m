@interface SCKPMediaControlCardSectionView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)contentView;
- (void)layoutSubviews;
- (void)setContentView:(id)a3;
@end

@implementation SCKPMediaControlCardSectionView

- (void)layoutSubviews
{
  [(SCKPMediaControlCardSectionView *)self bounds];
  contentView = self->_contentView;

  -[UIView setFrame:](contentView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    if (contentView) {
      [(UIView *)contentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentView, a3);
    if (self->_contentView) {
      [(SCKPMediaControlCardSectionView *)self addSubview:v7];
    }
    contentView = (UIView *)[(SCKPMediaControlCardSectionView *)self setNeedsLayout];
    v5 = v7;
  }

  MEMORY[0x270F9A758](contentView, v5);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
}

@end