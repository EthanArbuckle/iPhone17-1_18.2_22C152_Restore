@interface UIExpandedBarItemTableCell
- (void)layoutSubviews;
@end

@implementation UIExpandedBarItemTableCell

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)UIExpandedBarItemTableCell;
  [(UITableViewCell *)&v14 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(UITableViewCell *)self imageView];
  [v7 setContentMode:4];

  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v10 = [(UITableViewCell *)self imageView];
  objc_msgSend(v10, "setFrame:", v8, v9, 45.0, v6);

  v11 = [(UITableViewCell *)self imageView];
  [v11 frame];
  CGFloat v12 = CGRectGetMaxX(v15) + 10.0;

  v13 = [(UITableViewCell *)self textLabel];
  objc_msgSend(v13, "setFrame:", v12, 0.0, v4 - v12, v6);
}

@end