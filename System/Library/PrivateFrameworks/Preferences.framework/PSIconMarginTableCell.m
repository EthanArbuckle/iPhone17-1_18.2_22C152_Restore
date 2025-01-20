@interface PSIconMarginTableCell
- (double)iconMargin;
- (void)layoutSubviews;
@end

@implementation PSIconMarginTableCell

- (double)iconMargin
{
  return 58.0;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PSIconMarginTableCell;
  [(PSTableCell *)&v18 layoutSubviews];
  v3 = [(PSTableCell *)self titleLabel];

  if (v3)
  {
    v4 = [(PSTableCell *)self titleLabel];
    [v4 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;

    if ([(PSIconMarginTableCell *)self _shouldReverseLayoutDirection])
    {
      v11 = [(PSIconMarginTableCell *)self contentView];
      [v11 bounds];
      double v13 = v12 - v8;
      [(PSIconMarginTableCell *)self iconMargin];
      double v15 = v13 - v14;
    }
    else
    {
      [(PSIconMarginTableCell *)self iconMargin];
      double v15 = v16;
    }
    v17 = [(PSTableCell *)self titleLabel];
    objc_msgSend(v17, "setFrame:", v15, v6, v8, v10);
  }
}

@end