@interface _UITableViewCellBadge
- (BOOL)isHighlighted;
- (BOOL)isSelected;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (UIColor)color;
- (UIFont)font;
- (UILabel)badgeTextLabel;
- (_UITableViewCellBadge)initWithFrame:(CGRect)a3;
- (double)minHeight;
- (void)_sizeToFit;
- (void)layoutSubviews;
- (void)setBadgeTextLabel:(id)a3;
- (void)setColor:(id)a3;
- (void)setFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation _UITableViewCellBadge

- (_UITableViewCellBadge)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UITableViewCellBadge;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(UILabel);
    [(UILabel *)v4 setTextAlignment:2];
    [(UIView *)v3 addSubview:v4];
    [(_UITableViewCellBadge *)v3 setBadgeTextLabel:v4];
    [(_UITableViewCellBadge *)v3 setColor:0];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(_UITableViewCellBadge *)self badgeTextLabel];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (double)minHeight
{
  return 21.0;
}

- (void)_sizeToFit
{
  id v13 = [(_UITableViewCellBadge *)self badgeTextLabel];
  [v13 sizeToFit];
  [(UIView *)self frame];
  double v4 = v3;
  double v6 = v5;
  [v13 frame];
  double v8 = v7;
  double v10 = v9;
  [(_UITableViewCellBadge *)self minHeight];
  if (v11 >= v10) {
    double v12 = v11;
  }
  else {
    double v12 = v10;
  }
  -[UIView setFrame:](self, "setFrame:", v4, v6, v8, v12);
  [(UIView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)_UITableViewCellBadge;
  [(UIView *)&v11 layoutSubviews];
  double v3 = [(_UITableViewCellBadge *)self badgeTextLabel];
  [v3 sizeToFit];

  [(UIView *)self bounds];
  double v6 = v5 + v4 * 0.5;
  double v9 = v8 + v7 * 0.5;
  double v10 = [(_UITableViewCellBadge *)self badgeTextLabel];
  objc_msgSend(v10, "setCenter:", v6, v9);
}

- (void)setFont:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(_UITableViewCellBadge *)self badgeTextLabel];
    [v5 setFont:v4];

    id v6 = [(_UITableViewCellBadge *)self badgeTextLabel];
    [v6 setAdjustsFontForContentSizeCategory:1];
  }
}

- (UIFont)font
{
  v2 = [(_UITableViewCellBadge *)self badgeTextLabel];
  double v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[UIColor secondaryLabelColor];
  }
  id v6 = v4;
  double v5 = [(_UITableViewCellBadge *)self badgeTextLabel];
  [v5 setTextColor:v6];
}

- (UIColor)color
{
  v2 = [(_UITableViewCellBadge *)self badgeTextLabel];
  double v3 = [v2 textColor];

  return (UIColor *)v3;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  double v5 = [(_UITableViewCellBadge *)self badgeTextLabel];
  [v5 setText:v4];

  [(_UITableViewCellBadge *)self _sizeToFit];
}

- (NSString)text
{
  v2 = [(_UITableViewCellBadge *)self badgeTextLabel];
  double v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UITableViewCellBadge *)self badgeTextLabel];
  [v4 setHighlighted:v3];
}

- (BOOL)isHighlighted
{
  v2 = [(_UITableViewCellBadge *)self badgeTextLabel];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (UILabel)badgeTextLabel
{
  return self->_badgeTextLabel;
}

- (void)setBadgeTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end