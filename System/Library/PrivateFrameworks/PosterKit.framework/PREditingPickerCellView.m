@interface PREditingPickerCellView
- (PREditingPickerCellView)initWithFrame:(CGRect)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation PREditingPickerCellView

- (PREditingPickerCellView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PREditingPickerCellView;
  v3 = -[PREditingPickerCellView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PREditingPickerCellView *)v3 layer];
    [v5 setCornerCurve:*MEMORY[0x1E4F39EA8]];

    v6 = [(PREditingPickerCellView *)v4 layer];
    [v6 setCornerRadius:14.0];

    v7 = [(PREditingPickerCellView *)v4 layer];
    id v8 = [MEMORY[0x1E4FB1618] systemBlueColor];
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));
  }
  return v4;
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PREditingPickerCellView;
  -[PREditingPickerCellView setSelected:](&v8, sel_setSelected_);
  v5 = [(PREditingPickerCellView *)self layer];
  v6 = v5;
  double v7 = 0.0;
  if (v3) {
    double v7 = 3.0;
  }
  [v5 setBorderWidth:v7];
}

@end