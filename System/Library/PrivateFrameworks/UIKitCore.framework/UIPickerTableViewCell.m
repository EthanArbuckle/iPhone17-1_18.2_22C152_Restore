@interface UIPickerTableViewCell
- (UIPickerTableView)pickerTable;
- (UIPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (_UIPickerViewStyle)style;
- (void)_tapAction:(id)a3;
- (void)setPickerTable:(id)a3;
- (void)setStyle:(id)a3;
@end

@implementation UIPickerTableViewCell

- (UIPickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)UIPickerTableViewCell;
  v4 = [(UITableViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(UIView *)v4 traitCollection];
    uint64_t v7 = +[UIPickerView _styleForIdiom:](UIPickerView, "_styleForIdiom:", [v6 userInterfaceIdiom]);
    style = v5->_style;
    v5->_style = (_UIPickerViewStyle *)v7;

    v9 = [[UITapGestureRecognizer alloc] initWithTarget:v5 action:sel__tapAction_];
    tap = v5->_tap;
    v5->_tap = v9;

    [(UIView *)v5 addGestureRecognizer:v5->_tap];
  }
  return v5;
}

- (void)_tapAction:(id)a3
{
  if ([a3 state] == 3)
  {
    pickerTable = self->pickerTable;
    id v5 = [(UITableView *)pickerTable indexPathForCell:self];
    [(UIPickerTableView *)pickerTable tableView:pickerTable didSelectRowAtIndexPath:v5];
  }
}

- (UIPickerTableView)pickerTable
{
  return self->pickerTable;
}

- (void)setPickerTable:(id)a3
{
  self->pickerTable = (UIPickerTableView *)a3;
}

- (_UIPickerViewStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_tap, 0);
}

@end