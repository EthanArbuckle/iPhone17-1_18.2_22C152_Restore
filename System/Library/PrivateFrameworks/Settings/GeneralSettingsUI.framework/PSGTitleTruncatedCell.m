@interface PSGTitleTruncatedCell
- (void)layoutSubviews;
@end

@implementation PSGTitleTruncatedCell

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PSGTitleTruncatedCell;
  [(PSTableCell *)&v10 layoutSubviews];
  v3 = [(PSTableCell *)self valueLabel];
  [v3 frame];
  double v5 = v4;
  [v3 sizeToFit];
  [v3 frame];
  float v8 = v7 - v5;
  if (v8 > 0.0)
  {
    [v3 setFrame:v6 - v8];
    v9 = [(PSTableCell *)self titleLabel];
    [v9 frame];
    objc_msgSend(v9, "setFrame:");
  }
}

@end