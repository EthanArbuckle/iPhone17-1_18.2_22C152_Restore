@interface PKActivityTableCell
- (PKActivityTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)activityIndicator;
- (id)pk_childrenForAppearance;
- (void)layoutSubviews;
@end

@implementation PKActivityTableCell

- (PKActivityTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKActivityTableCell;
  v4 = [(PKActivityTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    activityIndicator = v4->_activityIndicator;
    v4->_activityIndicator = (UIActivityIndicatorView *)v5;

    [(UIActivityIndicatorView *)v4->_activityIndicator setHidesWhenStopped:1];
    [(UIActivityIndicatorView *)v4->_activityIndicator sizeToFit];
    v7 = [(PKActivityTableCell *)v4 contentView];
    [v7 addSubview:v4->_activityIndicator];
  }
  return v4;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PKActivityTableCell;
  [(PKActivityTableCell *)&v13 layoutSubviews];
  char v3 = [(PKActivityTableCell *)self _shouldReverseLayoutDirection];
  [(UIActivityIndicatorView *)self->_activityIndicator frame];
  v4 = [(PKActivityTableCell *)self contentView];
  [v4 bounds];
  UIRectCenteredYInRect();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  if ([(PKActivityTableCell *)self accessoryType]) {
    double v11 = 0.0;
  }
  else {
    double v11 = 15.0;
  }
  if ((v3 & 1) == 0)
  {
    v12 = [(PKActivityTableCell *)self contentView];
    [v12 bounds];
    double v11 = CGRectGetMaxX(v14) - v8 - v11;
  }
  -[UIActivityIndicatorView setFrame:](self->_activityIndicator, "setFrame:", v11, v6, v8, v10);
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void).cxx_destruct
{
}

- (id)pk_childrenForAppearance
{
  v7.receiver = self;
  v7.super_class = (Class)PKActivityTableCell;
  char v3 = [(UITableViewCell *)&v7 pk_childrenForAppearance];
  v4 = [(PKActivityTableCell *)self activityIndicator];
  double v5 = [v3 arrayByAddingObject:v4];

  return v5;
}

@end