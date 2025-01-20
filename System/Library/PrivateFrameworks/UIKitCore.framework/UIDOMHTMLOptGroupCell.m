@interface UIDOMHTMLOptGroupCell
- (UIDOMHTMLOptGroupCell)initWithHTMLOptGroupNode:(id)a3;
- (double)labelWidthForBounds:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation UIDOMHTMLOptGroupCell

- (UIDOMHTMLOptGroupCell)initWithHTMLOptGroupNode:(id)a3
{
  v4 = [(UIDOMHTMLOptionPickerCell *)self initCommon];
  if (v4)
  {
    -[UILabel setText:](-[UIPickerContentView titleLabel](v4, "titleLabel"), "setText:", [a3 itemTitle]);
    [(UIPickerContentView *)v4 setChecked:0];
    [(UILabel *)[(UIPickerContentView *)v4 titleLabel] setTextColor:+[UIColor colorWithWhite:0.0 alpha:0.5]];
    [(UIDOMHTMLOptionPickerCell *)v4 setDisabled:1];
  }
  return v4;
}

- (double)labelWidthForBounds:(CGRect)a3
{
  double Width = CGRectGetWidth(a3);
  +[UIPickerContentView _checkmarkOffset];
  return Width - v4;
}

- (void)layoutSubviews
{
  if ([(UIPickerContentView *)self titleLabel])
  {
    [(UIView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    +[UIPickerContentView _checkmarkOffset];
    double v12 = v11;
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    double MaxX = CGRectGetMaxX(v19);
    +[UIPickerContentView _checkmarkOffset];
    double v15 = MaxX - v14;
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    double Height = CGRectGetHeight(v20);
    v17 = [(UIPickerContentView *)self titleLabel];
    -[UILabel setFrame:](v17, "setFrame:", v12, 0.0, v15, Height);
  }
}

@end