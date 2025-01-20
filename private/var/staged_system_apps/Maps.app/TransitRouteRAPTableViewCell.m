@interface TransitRouteRAPTableViewCell
+ (double)horizontalPadding;
+ (double)leadingTextAlignmentMargin;
+ (double)rowHeight;
- (BOOL)isChecked;
- (TransitRouteRAPTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (double)_leadingInset;
- (double)_trailingInset;
- (void)setChecked:(BOOL)a3;
@end

@implementation TransitRouteRAPTableViewCell

+ (double)horizontalPadding
{
  return 16.0;
}

+ (double)leadingTextAlignmentMargin
{
  return 16.0;
}

+ (double)rowHeight
{
  return UITableViewAutomaticDimension;
}

- (TransitRouteRAPTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TransitRouteRAPTableViewCell;
  v4 = [(TransitRouteTableViewCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    -[CenteredTableViewCell setMinimumHorizontalMargins:](v4, "setMinimumHorizontalMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v6 = +[UIColor secondarySystemGroupedBackgroundColor];
    [(TransitRouteRAPTableViewCell *)v5 setBackgroundColor:v6];

    [(TransitRouteTableViewCell *)v5 setLeftPadding:15.0];
  }
  return v5;
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  [(TransitRouteRAPTableViewCell *)self setAccessoryType:v3];
}

- (double)_leadingInset
{
  return 0.0;
}

- (double)_trailingInset
{
  return 0.0;
}

- (BOOL)isChecked
{
  return self->_checked;
}

@end