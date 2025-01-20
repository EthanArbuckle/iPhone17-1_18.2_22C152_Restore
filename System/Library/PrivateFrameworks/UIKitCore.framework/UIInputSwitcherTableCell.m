@interface UIInputSwitcherTableCell
- (BOOL)isFirst;
- (BOOL)isLast;
- (BOOL)usesDarkTheme;
- (BOOL)usesStraightLeftEdge;
- (UIEdgeInsets)interactiveInsets;
- (UIInputSwitcherTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_updateRoundedCorners;
- (void)layoutSubviews;
- (void)setFirst:(BOOL)a3;
- (void)setInteractiveInsets:(UIEdgeInsets)a3;
- (void)setLast:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setUsesDarkTheme:(BOOL)a3;
- (void)setUsesStraightLeftEdge:(BOOL)a3;
@end

@implementation UIInputSwitcherTableCell

- (UIInputSwitcherTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UIInputSwitcherTableCell;
  v4 = [(UITableViewCell *)&v7 initWithStyle:3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_alloc_init(UIInputSwitcherTableCellBackgroundView);
    [(UIView *)v5 setOpaque:0];
    [(UITableViewCell *)v4 setBackgroundView:v5];
  }
  return v4;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)UIInputSwitcherTableCell;
  [(UITableViewCell *)&v23 layoutSubviews];
  v3 = [(UITableViewCell *)self accessoryView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v5 = [(UITableViewCell *)self _textLabel:0];
    [v5 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(UITableViewCell *)self frame];
    objc_msgSend(v5, "setFrame:", round(v13 + (v12 - v9) * 0.5), v7, v9, v11);
    v14 = [(UITableViewCell *)self _detailTextLabel:0];

    [v14 frame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [(UITableViewCell *)self frame];
    objc_msgSend(v14, "setFrame:", round(v22 + (v21 - v18) * 0.5), v16, v18, v20);
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIInputSwitcherTableCell;
  [(UITableViewCell *)&v8 setSelected:a3 animated:a4];
  double v6 = [(UITableViewCell *)self backgroundView];
  [v6 setSelected:v4];

  double v7 = [(UITableViewCell *)self backgroundView];
  [v7 setNeedsDisplay];
}

- (void)_updateRoundedCorners
{
  if ([(UIInputSwitcherTableCell *)self usesStraightLeftEdge]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 4;
  }
  uint64_t v4 = [(UIInputSwitcherTableCell *)self usesStraightLeftEdge] ^ 1;
  if ([(UIInputSwitcherTableCell *)self isFirst] && [(UIInputSwitcherTableCell *)self isLast])
  {
    uint64_t v5 = v3 | v4 | 0xA;
  }
  else if ([(UIInputSwitcherTableCell *)self isFirst])
  {
    uint64_t v5 = v4 | 2;
  }
  else if ([(UIInputSwitcherTableCell *)self isLast])
  {
    uint64_t v5 = v3 | 8;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [(UIInputSwitcherTableCell *)self isFirst] ^ 1;
  double v7 = [(UITableViewCell *)self backgroundView];
  [v7 setDrawsBorder:v6];

  objc_super v8 = [(UITableViewCell *)self backgroundView];
  [v8 setRoundedCorners:v5];

  id v9 = [(UITableViewCell *)self backgroundView];
  [v9 setNeedsDisplay];
}

- (void)setFirst:(BOOL)a3
{
  self->_first = a3;
  [(UIInputSwitcherTableCell *)self _updateRoundedCorners];
}

- (void)setLast:(BOOL)a3
{
  self->_last = a3;
  [(UIInputSwitcherTableCell *)self _updateRoundedCorners];
}

- (void)setUsesStraightLeftEdge:(BOOL)a3
{
  self->_usesStraightLeftEdge = a3;
  [(UIInputSwitcherTableCell *)self _updateRoundedCorners];
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  BOOL v3 = a3;
  self->_usesDarkTheme = a3;
  uint64_t v5 = [(UITableViewCell *)self backgroundView];
  [v5 setUsesDarkTheme:v3];

  id v6 = [(UITableViewCell *)self backgroundView];
  [v6 setNeedsDisplay];
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (BOOL)usesStraightLeftEdge
{
  return self->_usesStraightLeftEdge;
}

- (BOOL)isFirst
{
  return self->_first;
}

- (BOOL)isLast
{
  return self->_last;
}

- (UIEdgeInsets)interactiveInsets
{
  double top = self->_interactiveInsets.top;
  double left = self->_interactiveInsets.left;
  double bottom = self->_interactiveInsets.bottom;
  double right = self->_interactiveInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInteractiveInsets:(UIEdgeInsets)a3
{
  self->_interactiveInsets = a3;
}

@end