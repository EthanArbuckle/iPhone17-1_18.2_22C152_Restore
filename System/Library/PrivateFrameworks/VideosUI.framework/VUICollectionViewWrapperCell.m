@interface VUICollectionViewWrapperCell
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)childView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setChildView:(id)a3;
@end

@implementation VUICollectionViewWrapperCell

- (void)setChildView:(id)a3
{
  v5 = (UIView *)a3;
  p_childView = &self->_childView;
  childView = self->_childView;
  if (childView != v5)
  {
    v9 = v5;
    [(UIView *)childView removeFromSuperview];
    objc_storeStrong((id *)&self->_childView, a3);
    if (*p_childView)
    {
      v8 = [(VUICollectionViewWrapperCell *)self contentView];
      [v8 addSubview:*p_childView];
    }
    [(VUICollectionViewWrapperCell *)self setNeedsLayout];
    v5 = v9;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  childView = self->_childView;
  if (childView)
  {
    -[UIView sizeThatFits:](childView, "sizeThatFits:", a3.width, a3.height);
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUICollectionViewWrapperCell;
  [(VUICollectionViewWrapperCell *)&v5 layoutSubviews];
  childView = self->_childView;
  double v4 = [(VUICollectionViewWrapperCell *)self contentView];
  [v4 bounds];
  -[UIView setFrame:](childView, "setFrame:");
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)VUICollectionViewWrapperCell;
  [(VUICollectionViewWrapperCell *)&v6 prepareForReuse];
  v3 = [(VUICollectionViewWrapperCell *)self contentView];
  double v4 = [v3 subviews];
  [v4 makeObjectsPerformSelector:sel_removeFromSuperview];

  childView = self->_childView;
  self->_childView = 0;
}

- (UIView)childView
{
  return self->_childView;
}

- (void).cxx_destruct
{
}

@end