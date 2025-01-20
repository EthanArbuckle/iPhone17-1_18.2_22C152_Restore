@interface SFOrderedContainerView
- (SFOrderedContainerViewDelegate)delegate;
- (void)_sf_setOrderedSubviews:(id *)a3 count:(unint64_t)a4;
- (void)didAddSubview:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateOrderedSubviews:(id *)a3 count:(unint64_t)a4;
- (void)willMoveToWindow:(id)a3;
@end

@implementation SFOrderedContainerView

- (void)didAddSubview:(id)a3
{
  v4 = [(SFOrderedContainerView *)self window];
  if (v4)
  {
    BOOL settingOrderedSubviews = self->_settingOrderedSubviews;

    if (!settingOrderedSubviews)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained updateOrderedSubviewsForOrderedContainerView:self];
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)willMoveToWindow:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFOrderedContainerView;
  -[SFOrderedContainerView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained updateOrderedSubviewsForOrderedContainerView:self];
  }
}

- (void)_sf_setOrderedSubviews:(id *)a3 count:(unint64_t)a4
{
  self->_BOOL settingOrderedSubviews = 1;
  v5.receiver = self;
  v5.super_class = (Class)SFOrderedContainerView;
  [(UIView *)&v5 _sf_setOrderedSubviews:a3 count:a4];
  self->_BOOL settingOrderedSubviews = 0;
}

- (void)updateOrderedSubviews:(id *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    v7 = a3;
    unint64_t v8 = a4;
    do
    {
      v9 = [*v7 superview];

      if (v9 != self) {
        id *v7 = 0;
      }
      ++v7;
      --v8;
    }
    while (v8);
  }

  [(SFOrderedContainerView *)self _sf_setOrderedSubviews:a3 count:a4];
}

- (SFOrderedContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFOrderedContainerViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end