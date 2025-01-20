@interface PSTextEditingCell
- (void)layoutSubviews;
@end

@implementation PSTextEditingCell

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)PSTextEditingCell;
  [(PSTextEditingCell *)&v11 layoutSubviews];
  v3 = [(PSTextEditingCell *)self editableTextField];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  [(PSTextEditingCell *)self frame];
  CGFloat v8 = CGRectGetWidth(v12) + -40.0;
  v9 = [(PSTextEditingCell *)self editableTextField];
  objc_msgSend(v9, "setFrame:", 20.0, v5, v8, v7);

  v10 = [(PSTextEditingCell *)self editableTextField];
  [v10 setTextAlignment:1];
}

@end