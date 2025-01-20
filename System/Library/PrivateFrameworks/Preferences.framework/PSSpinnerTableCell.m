@interface PSSpinnerTableCell
- (PSSpinnerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)spinner;
- (void)layoutSubviews;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation PSSpinnerTableCell

- (PSSpinnerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PSSpinnerTableCell;
  v4 = [(PSSpinnerTableCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v5;

    v7 = [(PSSpinnerTableCell *)v4 contentView];
    [v7 addSubview:v4->_spinner];
  }
  return v4;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PSSpinnerTableCell;
  [(PSTableCell *)&v12 layoutSubviews];
  v3 = [(PSSpinnerTableCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  [(UIActivityIndicatorView *)self->_spinner frame];
  float v9 = (v5 - v8) * 0.5;
  float v11 = (v7 - v10) * 0.5;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", floorf(v9), floorf(v11));
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSSpinnerTableCell;
  [(PSTableCell *)&v4 refreshCellContentsWithSpecifier:a3];
  [(UIActivityIndicatorView *)self->_spinner startAnimating];
}

- (void).cxx_destruct
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

@end