@interface HomeOrthogonalSectionTableViewCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (HomeOrthogonalSectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITableViewCell)cell;
- (void)_updateWrapperSuperview;
- (void)didMoveToSuperview;
- (void)prepareForReuse;
- (void)setAlpha:(double)a3;
- (void)setBounds:(CGRect)a3;
- (void)setCell:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHidden:(BOOL)a3;
- (void)updateHidden;
@end

@implementation HomeOrthogonalSectionTableViewCell

- (HomeOrthogonalSectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  v4 = [(HomeOrthogonalSectionTableViewCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = +[UIColor clearColor];
    [(HomeOrthogonalSectionTableViewCell *)v4 setBackgroundColor:v5];

    [(HomeOrthogonalSectionTableViewCell *)v4 setAccessibilityIdentifier:@"HomeOrthogonalSectionTableViewCell"];
    id v6 = objc_alloc((Class)UIView);
    [(HomeOrthogonalSectionTableViewCell *)v4 frame];
    v7 = [v6 initWithFrame:];
    wrapperView = v4->_wrapperView;
    v4->_wrapperView = v7;

    [(UIView *)v4->_wrapperView setAccessibilityIdentifier:@"HomeOrthogonalSectionTableViewCellWrapperView"];
  }
  return v4;
}

- (void)setCell:(id)a3
{
  v5 = (UITableViewCell *)a3;
  p_cell = &self->_cell;
  cell = self->_cell;
  if (cell != v5)
  {
    v8 = v5;
    [(UITableViewCell *)cell removeFromSuperview];
    objc_storeStrong((id *)&self->_cell, a3);
    if (*p_cell)
    {
      [(UIView *)self->_wrapperView bounds];
      -[UITableViewCell setFrame:](*p_cell, "setFrame:");
      [(UITableViewCell *)*p_cell setAutoresizingMask:18];
      [(UIView *)self->_wrapperView addSubview:*p_cell];
    }
    [(HomeOrthogonalSectionTableViewCell *)self _updateWrapperSuperview];
    v5 = v8;
  }
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  [(HomeOrthogonalSectionTableViewCell *)&v3 didMoveToSuperview];
  [(HomeOrthogonalSectionTableViewCell *)self _updateWrapperSuperview];
}

- (void)_updateWrapperSuperview
{
  objc_super v3 = [(HomeOrthogonalSectionTableViewCell *)self superview];
  if (v3 && (cell = self->_cell, v3, cell))
  {
    v5 = [(UIView *)self->_wrapperView superview];
    id v6 = [(HomeOrthogonalSectionTableViewCell *)self _tableView];

    if (v5 != v6)
    {
      id v8 = [(HomeOrthogonalSectionTableViewCell *)self _tableView];
      [v8 addSubview:self->_wrapperView];
    }
  }
  else
  {
    wrapperView = self->_wrapperView;
    [(UIView *)wrapperView removeFromSuperview];
  }
}

- (void)updateHidden
{
  id v3 = [(HomeOrthogonalSectionTableViewCell *)self isHidden];
  cell = self->_cell;

  [(UITableViewCell *)cell setHidden:v3];
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  [(HomeOrthogonalSectionTableViewCell *)&v3 prepareForReuse];
  [(UITableViewCell *)self->_cell prepareForReuse];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  -[HomeOrthogonalSectionTableViewCell setFrame:](&v10, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width);
  v7 = [(HomeOrthogonalSectionTableViewCell *)self _tableView];
  [v7 bounds];
  double v9 = v8;

  -[UIView setFrame:](self->_wrapperView, "setFrame:", x, y, v9, height);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  -[HomeOrthogonalSectionTableViewCell setBounds:](&v10, "setBounds:", a3.origin.x, a3.origin.y, a3.size.width);
  v7 = [(HomeOrthogonalSectionTableViewCell *)self _tableView];
  [v7 bounds];
  double v9 = v8;

  -[UIView setBounds:](self->_wrapperView, "setBounds:", x, y, v9, height);
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  -[HomeOrthogonalSectionTableViewCell setHidden:](&v5, "setHidden:");
  [(UITableViewCell *)self->_cell setHidden:v3];
}

- (void)setAlpha:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HomeOrthogonalSectionTableViewCell;
  -[HomeOrthogonalSectionTableViewCell setAlpha:](&v5, "setAlpha:");
  [(UITableViewCell *)self->_cell setAlpha:a3];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  -[UITableViewCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_cell, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.double height = v6;
  result.width = v5;
  return result;
}

- (UITableViewCell)cell
{
  return self->_cell;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);

  objc_storeStrong((id *)&self->_wrapperView, 0);
}

@end