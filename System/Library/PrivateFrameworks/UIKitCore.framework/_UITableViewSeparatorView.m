@interface _UITableViewSeparatorView
- (_UITableViewSeparatorView)initWithFrame:(CGRect)a3 withTable:(id)a4;
- (_UITableViewSeparatorView)initWithTableCell:(id)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation _UITableViewSeparatorView

- (_UITableViewSeparatorView)initWithTableCell:(id)a3
{
  id v5 = a3;
  v6 = [v5 superview];
  [v6 frame];
  double v8 = v7;

  [v5 frame];
  v14.receiver = self;
  v14.super_class = (Class)_UITableViewSeparatorView;
  v11 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, 0.0, v9 + v10 + -1.0, v8, 1.0);
  v12 = v11;
  if (v11) {
    objc_storeStrong((id *)&v11->_tableCell, a3);
  }

  return v12;
}

- (_UITableViewSeparatorView)initWithFrame:(CGRect)a3 withTable:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UITableViewSeparatorView;
  double v10 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_table, v9);
    [(UIView *)v11 setOpaque:0];
  }

  return v11;
}

- (void)drawRect:(CGRect)a3
{
  tableCell = self->_tableCell;
  if (tableCell)
  {
    [(UIView *)self bounds];
    -[UITableViewCell _drawSeparatorInRect:](tableCell, "_drawSeparatorInRect:");
    id v5 = self->_tableCell;
    self->_tableCell = 0;
  }
  else
  {
    WeakRetained = (UITableViewCell *)objc_loadWeakRetained((id *)&self->_table);
    [(UIView *)self bounds];
    -[UITableViewCell _drawExtraSeparator:](WeakRetained, "_drawExtraSeparator:");
    id v5 = WeakRetained;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_table);
  objc_storeStrong((id *)&self->_tableCell, 0);
}

@end