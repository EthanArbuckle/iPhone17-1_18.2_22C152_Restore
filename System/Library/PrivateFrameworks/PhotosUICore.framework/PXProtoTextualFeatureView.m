@interface PXProtoTextualFeatureView
- (CGSize)compactContentSize;
- (CGSize)regularContentSize;
- (UIEdgeInsets)minimumMargins;
- (void)layoutSubviews;
- (void)updateContent;
@end

@implementation PXProtoTextualFeatureView

- (void).cxx_destruct
{
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)PXProtoTextualFeatureView;
  [(PXProtoFeatureView *)&v18 layoutSubviews];
  v3 = [(UILabel *)self->_label superview];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(UILabel *)self->_label bounds];
  double v13 = v12;
  double v15 = v14;
  [(UILabel *)self->_label intrinsicContentSize];
  double v17 = v16;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  -[UILabel setBounds:](self->_label, "setBounds:", v13, v15, CGRectGetWidth(v19), v17);
  PXRectGetCenter();
}

- (void)updateContent
{
  v11.receiver = self;
  v11.super_class = (Class)PXProtoTextualFeatureView;
  [(PXProtoFeatureView *)&v11 updateContent];
  if (!self->_label)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v4 = [(PXProtoFeatureView *)self contentView];
    [v4 bounds];
    CGFloat v5 = (UILabel *)objc_msgSend(v3, "initWithFrame:");
    label = self->_label;
    self->_label = v5;

    [(UILabel *)self->_label setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)self->_label setMinimumScaleFactor:0.6];
    [(UILabel *)self->_label setTextAlignment:1];
    CGFloat v7 = [(PXProtoFeatureView *)self contentView];
    [v7 addSubview:self->_label];
  }
  double v8 = [(PXProtoFeatureView *)self feature];
  CGFloat v9 = [v8 featureLocalizedTitle];
  [(UILabel *)self->_label setText:v9];

  double v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UILabel *)self->_label setTextColor:v10];
}

- (CGSize)compactContentSize
{
  [(PXProtoTextualFeatureView *)self regularContentSize];
  double v4 = v3;
  [(PXProtoFeatureView *)self recommendedCompactContentHeight];
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)regularContentSize
{
  [(UILabel *)self->_label intrinsicContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)minimumMargins
{
  double v2 = 0.0;
  double v3 = 10.0;
  double v4 = 0.0;
  double v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

@end