@interface UIKBShadowEffect
+ (id)effectWithColor:(id)a3 offset:(CGSize)a4 insets:(UIEdgeInsets)a5 weight:(double)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)renderUnder;
- (BOOL)usesRGBColors;
- (CGColor)CGColor;
- (CGSize)offset;
- (NSString)description;
- (UIEdgeInsets)concaveInsets;
- (UIEdgeInsets)insets;
- (UIKBGradient)gradient;
- (UIKBShadowEffect)initWithColor:(id)a3 offset:(CGSize)a4 insets:(UIEdgeInsets)a5 weight:(double)a6;
- (double)weight;
- (id)copyWithZone:(_NSZone *)a3;
- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4;
- (void)setConcaveInsets:(UIEdgeInsets)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setOffset:(CGSize)a3;
- (void)setWeight:(double)a3;
@end

@implementation UIKBShadowEffect

- (BOOL)isValid
{
  [(UIKBShadowEffect *)self weight];
  return v2 > 0.0;
}

- (BOOL)usesRGBColors
{
  double v2 = [(UIKBShadowEffect *)self CGColor];
  BOOL v3 = UIKBColorUsesRGB((BOOL)v2);
  CFRelease(v2);
  return v3;
}

- (UIKBGradient)gradient
{
  return 0;
}

- (BOOL)renderUnder
{
  return 1;
}

- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4
{
}

+ (id)effectWithColor:(id)a3 offset:(CGSize)a4 insets:(UIEdgeInsets)a5 weight:(double)a6
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  double height = a4.height;
  double width = a4.width;
  id v14 = a3;
  v15 = objc_msgSend(objc_alloc((Class)a1), "initWithColor:offset:insets:weight:", v14, width, height, top, left, bottom, right, a6);

  return v15;
}

- (UIKBShadowEffect)initWithColor:(id)a3 offset:(CGSize)a4 insets:(UIEdgeInsets)a5 weight:(double)a6
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)UIKBShadowEffect;
  v16 = [(UIKBShadowEffect *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_colorName, a3);
    v17->_offset.CGFloat height = height;
    v17->_insets.CGFloat top = top;
    v17->_insets.CGFloat left = left;
    v17->_insets.CGFloat bottom = bottom;
    v17->_insets.CGFloat right = right;
    v17->_weight = a6;
    v17->_offset.CGFloat width = width;
  }

  return v17;
}

- (NSString)description
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  [v3 appendFormat:@"; color = %@", self->_colorName];
  [(UIKBShadowEffect *)self offset];
  v4 = NSStringFromCGSize(v10);
  [v3 appendFormat:@"; offset = %@", v4];

  [(UIKBShadowEffect *)self insets];
  v5 = NSStringFromUIEdgeInsets(v11);
  [v3 appendFormat:@"; insets = %@", v5];

  [(UIKBShadowEffect *)self concaveInsets];
  v6 = NSStringFromUIEdgeInsets(v12);
  [v3 appendFormat:@"; concaveInsets = %@", v6];

  [(UIKBShadowEffect *)self weight];
  objc_msgSend(v3, "appendFormat:", @"; weight = %f", v7);
  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (UIKBShadowEffect *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v7 = (objc_opt_isKindOfClass() & 1) != 0
      && (colorName = self->_colorName, (v4->_colorName == 0) != (colorName != 0))
      && (!colorName || -[NSString isEqualToString:](colorName, "isEqualToString:"))
      && (self->_offset.width == v4->_offset.width ? (BOOL v6 = self->_offset.height == v4->_offset.height) : (BOOL v6 = 0),
          v6
       && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.top, *(float64x2_t *)&v4->_insets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.bottom, *(float64x2_t *)&v4->_insets.bottom))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_concaveInsets.top, *(float64x2_t *)&v4->_concaveInsets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_concaveInsets.bottom,
                                                      *(float64x2_t *)&v4->_concaveInsets.bottom))),
                                     0xFuLL))) & 1) != 0)
      && self->_weight == v4->_weight;
  }

  return v7;
}

- (CGColor)CGColor
{
  result = (CGColor *)self->_colorName;
  if (result)
  {
    BOOL v3 = (CGColor *)UIKBGetNamedColor(result);
    return CGColorRetain(v3);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[UIKBShadowEffect allocWithZone:a3];
  colorName = self->_colorName;
  [(UIKBShadowEffect *)self offset];
  double v7 = v6;
  double v9 = v8;
  [(UIKBShadowEffect *)self insets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(UIKBShadowEffect *)self weight];
  objc_super v19 = -[UIKBShadowEffect initWithColor:offset:insets:weight:](v4, "initWithColor:offset:insets:weight:", colorName, v7, v9, v11, v13, v15, v17, v18);
  [(UIKBShadowEffect *)self concaveInsets];
  -[UIKBShadowEffect setConcaveInsets:](v19, "setConcaveInsets:");
  return v19;
}

- (CGSize)offset
{
  double width = self->_offset.width;
  double height = self->_offset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOffset:(CGSize)a3
{
  self->_offset = a3;
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

- (UIEdgeInsets)concaveInsets
{
  double top = self->_concaveInsets.top;
  double left = self->_concaveInsets.left;
  double bottom = self->_concaveInsets.bottom;
  double right = self->_concaveInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setConcaveInsets:(UIEdgeInsets)a3
{
  self->_concaveInsets = a3;
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (void).cxx_destruct
{
}

@end