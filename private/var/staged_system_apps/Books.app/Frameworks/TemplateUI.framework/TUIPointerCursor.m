@interface TUIPointerCursor
+ (id)defaultPointerCursor;
- (BOOL)isEqual:(id)a3;
- (TUIPointerCursor)init;
- (TUIPointerCursor)initWithOther:(id)a3;
- (TUIPointerCursor)pointerCursorWithCornerRadius:(double)a3;
- (TUIPointerCursor)pointerCursorWithInsets:(UIEdgeInsets)a3;
- (TUIPointerCursor)pointerCursorWithScale:(double)a3;
- (TUIPointerCursor)pointerCursorWithShape:(int64_t)a3;
- (UIEdgeInsets)insets;
- (double)cornerRadius;
- (double)scale;
- (id)pointerShapeWithBounds:(CGRect)a3 preview:(id)a4;
- (int64_t)shape;
- (void)setCornerRadius:(double)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setScale:(double)a3;
- (void)setShape:(int64_t)a3;
@end

@implementation TUIPointerCursor

- (TUIPointerCursor)init
{
  v4.receiver = self;
  v4.super_class = (Class)TUIPointerCursor;
  result = [(TUIPointerCursor *)&v4 init];
  if (result)
  {
    int64x2_t v3 = vdupq_n_s64(0x7FF8000000000000uLL);
    result->_shape = 0;
    *(int64x2_t *)&result->_insets.top = v3;
    *(int64x2_t *)&result->_insets.bottom = v3;
    *(_OWORD *)&result->_cornerRadius = xmmword_243AF0;
  }
  return result;
}

+ (id)defaultPointerCursor
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (TUIPointerCursor)initWithOther:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TUIPointerCursor;
  v5 = [(TUIPointerCursor *)&v13 init];
  if (v5)
  {
    v5->_shape = (int64_t)[v4 shape];
    [v4 insets];
    v5->_insets.top = v6;
    v5->_insets.left = v7;
    v5->_insets.bottom = v8;
    v5->_insets.right = v9;
    [v4 cornerRadius];
    v5->_cornerRadius = v10;
    [v4 scale];
    v5->_scale = v11;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    CGFloat v6 = v4;
  }
  else {
    CGFloat v6 = 0;
  }
  CGFloat v7 = v6;
  BOOL v8 = v7 == self;
  if (v7) {
    BOOL v9 = v7 == self;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9) {
    BOOL v8 = self->_shape == v7->_shape
  }
      && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.top, *(float64x2_t *)&v7->_insets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.bottom, *(float64x2_t *)&v7->_insets.bottom))), 0xFuLL))) & 1) != 0&& self->_cornerRadius == v7->_cornerRadius&& self->_scale == v7->_scale;

  return v8;
}

- (TUIPointerCursor)pointerCursorWithShape:(int64_t)a3
{
  id v4 = self;
  if (v4->_shape != a3)
  {
    uint64_t v5 = [[TUIPointerCursor alloc] initWithOther:v4];

    [(TUIPointerCursor *)v5 setShape:a3];
    id v4 = v5;
  }

  return v4;
}

- (TUIPointerCursor)pointerCursorWithInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  CGFloat v7 = self;
  if (v7->_insets.left != left || v7->_insets.top != top || v7->_insets.right != right || v7->_insets.bottom != bottom)
  {
    double v11 = [[TUIPointerCursor alloc] initWithOther:v7];

    -[TUIPointerCursor setInsets:](v11, "setInsets:", top, left, bottom, right);
    CGFloat v7 = v11;
  }

  return v7;
}

- (TUIPointerCursor)pointerCursorWithCornerRadius:(double)a3
{
  id v4 = self;
  if (v4->_cornerRadius != a3)
  {
    uint64_t v5 = [[TUIPointerCursor alloc] initWithOther:v4];

    [(TUIPointerCursor *)v5 setCornerRadius:a3];
    id v4 = v5;
  }

  return v4;
}

- (TUIPointerCursor)pointerCursorWithScale:(double)a3
{
  id v4 = self;
  if (v4->_scale != a3)
  {
    uint64_t v5 = [[TUIPointerCursor alloc] initWithOther:v4];

    [(TUIPointerCursor *)v5 setScale:a3];
    id v4 = v5;
  }

  return v4;
}

- (id)pointerShapeWithBounds:(CGRect)a3 preview:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  double left = self->_insets.left;
  double top = self->_insets.top;
  double v12 = x + left;
  double v13 = y + top;
  double v14 = width - (left + self->_insets.right);
  double v15 = height - (top + self->_insets.bottom);
  if (self->_scale != 1.0)
  {
    v31.origin.double x = v12;
    v31.origin.double y = v13;
    v31.size.double width = v14;
    v31.size.double height = v15;
    double MidX = CGRectGetMidX(v31);
    v32.origin.double x = v12;
    v32.origin.double y = v13;
    v32.size.double width = v14;
    v32.size.double height = v15;
    double MidY = CGRectGetMidY(v32);
    v33.origin.double x = v12;
    v33.origin.double y = v13;
    v33.size.double width = v14;
    v33.size.double height = v15;
    double v18 = CGRectGetWidth(v33);
    v34.origin.double x = v12;
    v34.origin.double y = v13;
    v34.size.double width = v14;
    v34.size.double height = v15;
    CGFloat v19 = CGRectGetHeight(v34);
    double scale = self->_scale;
    double v14 = v18 * scale;
    double v15 = v19 * scale;
    double v12 = MidX - v18 * scale * 0.5;
    double v13 = MidY - v19 * scale * 0.5;
  }
  int64_t shape = self->_shape;
  if (shape == 1)
  {
    v28 = +[UIPointerShape shapeWithRoundedRect:cornerRadius:](UIPointerShape, "shapeWithRoundedRect:cornerRadius:", v12, v13, v14, v15, self->_cornerRadius);
  }
  else if (shape == 2)
  {
    v35.origin.double x = v12;
    v35.origin.double y = v13;
    v35.size.double width = v14;
    v35.size.double height = v15;
    double v22 = CGRectGetMidX(v35);
    v36.origin.double x = v12;
    v36.origin.double y = v13;
    v36.size.double width = v14;
    v36.size.double height = v15;
    double v23 = CGRectGetMidY(v36);
    v37.origin.double x = v12;
    v37.origin.double y = v13;
    v37.size.double width = v14;
    v37.size.double height = v15;
    double v24 = CGRectGetWidth(v37);
    v38.origin.double x = v12;
    v38.origin.double y = v13;
    v38.size.double width = v14;
    v38.size.double height = v15;
    double v25 = CGRectGetHeight(v38);
    if (v24 >= v25) {
      double v26 = v24;
    }
    else {
      double v26 = v25;
    }
    v27 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v22 - v26 * 0.5, v23 - v26 * 0.5, v26, v26);
    v28 = +[UIPointerShape shapeWithPath:v27];
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (int64_t)shape
{
  return self->_shape;
}

- (void)setShape:(int64_t)a3
{
  self->_int64_t shape = a3;
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_double scale = a3;
}

@end