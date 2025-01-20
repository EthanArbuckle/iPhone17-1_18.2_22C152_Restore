@interface _TVAlertActionCell
- (UIView)buttonView;
- (id)preferredFocusEnvironments;
- (void)prepareForReuse;
- (void)setButtonView:(id)a3;
@end

@implementation _TVAlertActionCell

- (void)setButtonView:(id)a3
{
  v5 = (UIView *)a3;
  p_buttonView = &self->_buttonView;
  buttonView = self->_buttonView;
  v10 = v5;
  if (buttonView != v5)
  {
    [(UIView *)buttonView removeFromSuperview];
    objc_storeStrong((id *)&self->_buttonView, a3);
    if (*p_buttonView)
    {
      v8 = [(_TVAlertActionCell *)self contentView];
      [v8 addSubview:*p_buttonView];

      v9 = *p_buttonView;
      [(_TVAlertActionCell *)self bounds];
      -[UIView setFrame:](v9, "setFrame:");
    }
  }
}

- (id)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x263EF8340];
  if (self->_buttonView)
  {
    v4[0] = self->_buttonView;
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)_TVAlertActionCell;
  [(_TVAlertActionCell *)&v6 prepareForReuse];
  v3 = [(_TVAlertActionCell *)self contentView];
  v4 = [v3 subviews];
  [v4 makeObjectsPerformSelector:sel_removeFromSuperview];

  buttonView = self->_buttonView;
  self->_buttonView = 0;
}

- (UIView)buttonView
{
  return self->_buttonView;
}

- (void).cxx_destruct
{
}

@end