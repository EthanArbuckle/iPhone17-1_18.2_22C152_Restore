@interface PSGShrinkingTextCell
- (void)layoutSubviews;
@end

@implementation PSGShrinkingTextCell

- (void)layoutSubviews
{
  v3 = [(PSTableCell *)self titleLabel];
  [v3 setAdjustsFontSizeToFitWidth:1];

  v4 = [(PSTableCell *)self titleLabel];
  [v4 setEnabled:0];

  v5.receiver = self;
  v5.super_class = (Class)PSGShrinkingTextCell;
  [(PSTableCell *)&v5 layoutSubviews];
}

@end