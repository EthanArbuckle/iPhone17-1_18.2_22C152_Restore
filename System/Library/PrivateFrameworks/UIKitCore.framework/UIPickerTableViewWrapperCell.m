@interface UIPickerTableViewWrapperCell
- (UIEdgeInsets)wrappedViewInsets;
- (UIPickerTableViewWrapperCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIView)wrappedView;
- (id)_anyDateLabel;
- (void)_setIsCenterCell:(BOOL)a3 shouldModifyAlphaOfView:(BOOL)a4;
- (void)_updateWrappedView;
- (void)_updateWrappedViewFrame;
- (void)prepareForReuse;
- (void)resizeSubviewsWithOldSize:(CGSize)a3;
- (void)setWrappedView:(id)a3;
- (void)setWrappedViewInsets:(UIEdgeInsets)a3;
@end

@implementation UIPickerTableViewWrapperCell

- (UIPickerTableViewWrapperCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)UIPickerTableViewWrapperCell;
  v4 = [(UIPickerTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(UITableViewCell *)v4 setBackgroundColor:v5];

    [(UITableViewCell *)v4 setSelectionStyle:0];
    v6 = [UIView alloc];
    [(UIView *)v4 bounds];
    uint64_t v7 = -[UIView initWithFrame:](v6, "initWithFrame:");
    wrappedViewContainer = v4->_wrappedViewContainer;
    v4->_wrappedViewContainer = (UIView *)v7;

    [(UIView *)v4->_wrappedViewContainer setAutoresizingMask:0];
    [(UIView *)v4 addSubview:v4->_wrappedViewContainer];
  }
  return v4;
}

- (void)_setIsCenterCell:(BOOL)a3 shouldModifyAlphaOfView:(BOOL)a4
{
  if (a4)
  {
    wrappedViewContainer = self->_wrappedViewContainer;
    double v7 = 0.447;
    if (a3) {
      double v7 = 1.0;
    }
    [(UIView *)wrappedViewContainer setAlpha:v7];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v8 = [(UIView *)self->_wrappedView useDigitFont];
      if (a3)
      {
        if (v8)
        {
          v9 = [(UIPickerTableViewCell *)self style];
          objc_super v10 = [(UIView *)self traitCollection];
          uint64_t v11 = [v9 centerCellDigitFontWithTraitCollection:v10];
          goto LABEL_17;
        }
        goto LABEL_12;
      }
      if (v8)
      {
        v9 = [(UIPickerTableViewCell *)self style];
        objc_super v10 = [(UIView *)self traitCollection];
        uint64_t v11 = [v9 nonCenterCellDigitFontWithTraitCollection:v10];
        goto LABEL_17;
      }
    }
    else if (a3)
    {
LABEL_12:
      v9 = [(UIPickerTableViewCell *)self style];
      objc_super v10 = [(UIView *)self traitCollection];
      uint64_t v11 = [v9 centerCellFontWithTraitCollection:v10];
      goto LABEL_17;
    }
    v9 = [(UIPickerTableViewCell *)self style];
    objc_super v10 = [(UIView *)self traitCollection];
    uint64_t v11 = [v9 nonCenterCellFontWithTraitCollection:v10];
LABEL_17:
    v17 = (void *)v11;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [(UIView *)self->_wrappedView titleLabel];
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      v14 = v17;
      if ((isKindOfClass & 1) == 0)
      {
LABEL_22:

        return;
      }
      v15 = [(UIView *)self->_wrappedView dateLabel];
      [v15 setFont:v17];

      v12 = [(UIView *)self->_wrappedView weekdayLabel];
    }
    v16 = v12;
    [v12 setFont:v17];

    v14 = v17;
    goto LABEL_22;
  }
}

- (void)_updateWrappedViewFrame
{
  CGFloat v3 = *MEMORY[0x1E4F1DAD8];
  CGFloat v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double width = self->_wrappedViewSize.width;
  double height = self->_wrappedViewSize.height;
  [(UIView *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(UIPickerTableViewWrapperCell *)self wrappedViewInsets];
  double v16 = v8 + v15;
  double v18 = v10 + v17;
  double v20 = v12 - (v15 + v19);
  double v22 = v14 - (v17 + v21);
  v30.origin.x = v3;
  v30.origin.y = v4;
  v30.size.double width = width;
  v30.size.double height = height;
  BOOL IsEmpty = CGRectIsEmpty(v30);
  if (IsEmpty) {
    double v24 = v22;
  }
  else {
    double v24 = height;
  }
  if (IsEmpty) {
    double v25 = v20;
  }
  else {
    double v25 = width;
  }
  double v26 = round(v16 + (v20 - v25) * 0.5);
  wrappedView = self->_wrappedView;
  double v28 = round(v18 + (v22 - v24) * 0.5);
  -[UIView setFrame:](wrappedView, "setFrame:", v26, v28);
}

- (void)_updateWrappedView
{
  p_wrappedViewSize = &self->_wrappedViewSize;
  wrappedView = self->_wrappedView;
  if (wrappedView)
  {
    [(UIView *)wrappedView frame];
    p_wrappedViewSize->double width = v5;
    p_wrappedViewSize->double height = v6;
  }
  else
  {
    CGSize *p_wrappedViewSize = *(CGSize *)MEMORY[0x1E4F1DB30];
  }
  double v7 = [(UIView *)self->_wrappedView backgroundColor];

  if (!v7)
  {
    double v8 = +[UIColor clearColor];
    [(UIView *)self->_wrappedView setBackgroundColor:v8];
  }
  [(UIPickerTableViewWrapperCell *)self _updateWrappedViewFrame];
  [(UITableViewCell *)self setSelectionStyle:0];
}

- (UIView)wrappedView
{
  return self->_wrappedView;
}

- (void)setWrappedView:(id)a3
{
  CGFloat v5 = (UIView *)a3;
  wrappedView = self->_wrappedView;
  double v7 = v5;
  if (wrappedView != v5)
  {
    [(UIView *)wrappedView removeFromSuperview];
    objc_storeStrong((id *)&self->_wrappedView, a3);
    [(UIView *)self->_wrappedViewContainer addSubview:self->_wrappedView];
  }
  [(UIPickerTableViewWrapperCell *)self _updateWrappedView];
}

- (void)setWrappedViewInsets:(UIEdgeInsets)a3
{
  if (self->_wrappedViewInsets.left != a3.left
    || self->_wrappedViewInsets.top != a3.top
    || self->_wrappedViewInsets.right != a3.right
    || self->_wrappedViewInsets.bottom != a3.bottom)
  {
    self->_wrappedViewInsets = a3;
    [(UIPickerTableViewWrapperCell *)self _updateWrappedViewFrame];
  }
}

- (void)resizeSubviewsWithOldSize:(CGSize)a3
{
  [(UIPickerTableViewWrapperCell *)self _updateWrappedViewFrame];
  wrappedView = self->_wrappedView;
  if (wrappedView)
  {
    p_wrappedViewSize = &self->_wrappedViewSize;
    [(UIView *)wrappedView frame];
    p_wrappedViewSize->double width = v6;
    p_wrappedViewSize->double height = v7;
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)UIPickerTableViewWrapperCell;
  [(UITableViewCell *)&v3 prepareForReuse];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(UIView *)self->_wrappedView setChecked:0];
  }
}

- (id)_anyDateLabel
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v3 = [(UIView *)self->_wrappedView titleLabel];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v3 = [(UIView *)self->_wrappedView dateLabel];
    }
    else
    {
      objc_super v3 = 0;
    }
  }
  return v3;
}

- (UIEdgeInsets)wrappedViewInsets
{
  double top = self->_wrappedViewInsets.top;
  double left = self->_wrappedViewInsets.left;
  double bottom = self->_wrappedViewInsets.bottom;
  double right = self->_wrappedViewInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedViewContainer, 0);
  objc_storeStrong((id *)&self->_wrappedView, 0);
}

@end