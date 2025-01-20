@interface TUIUIKitTextField
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (UIEdgeInsets)editingInsets;
- (void)layoutSubviews;
- (void)setEditingInsets:(UIEdgeInsets)a3;
@end

@implementation TUIUIKitTextField

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)TUIUIKitTextField;
  [(TUIUIKitTextField *)&v4 layoutSubviews];
  v3 = [(TUIUIKitTextField *)self _fieldEditor];
  if (v3) {
    [(TUIUIKitTextField *)self bringSubviewToFront:v3];
  }
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)TUIUIKitTextField;
  -[TUIUIKitTextField textRectForBounds:](&v22, "textRectForBounds:");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  if (!CGRectIsEmpty(v23))
  {
    float64x2_t v16 = *(float64x2_t *)&self->_editingInsets.top;
    float64x2_t v17 = *(float64x2_t *)&self->_editingInsets.bottom;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&UIEdgeInsetsZero.top, v16), (int32x4_t)vceqq_f64(*(float64x2_t *)&UIEdgeInsetsZero.bottom, v17))), 0xFuLL))) & 1) == 0)
    {
      double v9 = v9 + v16.f64[1];
      double v11 = v11 + v16.f64[0];
      double v13 = v13 - (v16.f64[1] + v17.f64[1]);
      double v15 = v15 - (v16.f64[0] + v17.f64[0]);
    }
  }
  double v18 = v9;
  double v19 = v11;
  double v20 = v13;
  double v21 = v15;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  -[TUIUIKitTextField textRectForBounds:](self, "textRectForBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v3;
  return result;
}

- (UIEdgeInsets)editingInsets
{
  double top = self->_editingInsets.top;
  double left = self->_editingInsets.left;
  double bottom = self->_editingInsets.bottom;
  double right = self->_editingInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setEditingInsets:(UIEdgeInsets)a3
{
  self->_editingInsets = a3;
}

@end