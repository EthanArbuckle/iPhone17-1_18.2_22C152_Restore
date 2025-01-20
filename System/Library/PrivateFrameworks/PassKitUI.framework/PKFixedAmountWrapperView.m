@interface PKFixedAmountWrapperView
- (UIPickerView)pickerView;
- (UITableView)tableView;
- (void)layoutSubviews;
- (void)setPickerView:(id)a3;
- (void)setTableView:(id)a3;
@end

@implementation PKFixedAmountWrapperView

- (void)layoutSubviews
{
  v16.receiver = self;
  v16.super_class = (Class)PKFixedAmountWrapperView;
  [(PKFixedAmountWrapperView *)&v16 layoutSubviews];
  [(PKFixedAmountWrapperView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIPickerView *)self->_pickerView bounds];
  double v12 = v11;
  double v14 = v13;
  double v15 = v10 - v13;
  -[UITableView setFrame:](self->_tableView, "setFrame:", v4, v6, v8, v15);
  -[UIPickerView setFrame:](self->_pickerView, "setFrame:", v12, v15, v8, v14);
}

- (void)setPickerView:(id)a3
{
  double v4 = (UIPickerView *)a3;
  pickerView = self->_pickerView;
  if (pickerView)
  {
    [(UIPickerView *)pickerView resignFirstResponder];
    [(UIPickerView *)self->_pickerView removeFromSuperview];
    double v6 = self->_pickerView;
  }
  else
  {
    double v6 = 0;
  }
  self->_pickerView = v4;
  double v7 = v4;

  [(PKFixedAmountWrapperView *)self addSubview:v7];
  [(PKFixedAmountWrapperView *)self setNeedsLayout];
  [(UIPickerView *)self->_pickerView becomeFirstResponder];
}

- (void)setTableView:(id)a3
{
  double v4 = (UITableView *)a3;
  tableView = self->_tableView;
  if (tableView)
  {
    [(UITableView *)tableView removeFromSuperview];
    double v6 = self->_tableView;
  }
  else
  {
    double v6 = 0;
  }
  self->_tableView = v4;
  double v7 = v4;

  [(PKFixedAmountWrapperView *)self addSubview:v7];

  [(PKFixedAmountWrapperView *)self setNeedsLayout];
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (UIPickerView)pickerView
{
  return self->_pickerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerView, 0);

  objc_storeStrong((id *)&self->_tableView, 0);
}

@end