@interface UIKBEdgeEffect
+ (id)effectWithColor:(id)a3 edges:(unint64_t)a4 inset:(double)a5 weight:(double)a6;
+ (id)effectWithColor:(id)a3 edges:(unint64_t)a4 insets:(UIEdgeInsets)a5 weight:(double)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)renderUnder;
- (BOOL)usesRGBColors;
- (CGColor)CGColor;
- (NSString)description;
- (UIEdgeInsets)insets;
- (UIKBEdgeEffect)initWithColor:(id)a3 edges:(unint64_t)a4 insets:(UIEdgeInsets)a5 weight:(double)a6;
- (UIKBGradient)gradient;
- (double)opacity;
- (double)weight;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)edges;
- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4;
- (void)setEdges:(unint64_t)a3;
- (void)setGradient:(id)a3;
- (void)setInsets:(UIEdgeInsets)a3;
- (void)setOpacity:(double)a3;
- (void)setWeight:(double)a3;
@end

@implementation UIKBEdgeEffect

- (BOOL)isValid
{
  if (self->_colorName)
  {
    [(UIKBEdgeEffect *)self weight];
    return v3 > 0.0 && [(UIKBEdgeEffect *)self edges] != 0;
  }
  else
  {
    v5 = [(UIKBEdgeEffect *)self gradient];
    BOOL v4 = v5 && ([(UIKBEdgeEffect *)self weight], v6 > 0.0) && [(UIKBEdgeEffect *)self edges] != 0;
  }
  return v4;
}

- (BOOL)usesRGBColors
{
  double v3 = [(UIKBEdgeEffect *)self gradient];

  if (v3)
  {
    BOOL v4 = [(UIKBEdgeEffect *)self gradient];
    char v5 = [v4 usesRGBColors];
  }
  else
  {
    double v6 = [(UIKBEdgeEffect *)self CGColor];
    char v5 = UIKBColorUsesRGB((BOOL)v6);
    CFRelease(v6);
  }
  return v5;
}

- (BOOL)renderUnder
{
  return 0;
}

- (void)renderEffectWithRenderer:(id)a3 traits:(id)a4
{
}

+ (id)effectWithColor:(id)a3 edges:(unint64_t)a4 inset:(double)a5 weight:(double)a6
{
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  double v12 = 0.0;
  if (a4) {
    double v13 = a5;
  }
  else {
    double v13 = 0.0;
  }
  if ((a4 & 2) != 0) {
    double v14 = a5;
  }
  else {
    double v14 = 0.0;
  }
  if ((a4 & 4) != 0) {
    double v15 = a5;
  }
  else {
    double v15 = 0.0;
  }
  if ((a4 & 8) != 0) {
    double v12 = a5;
  }
  v16 = objc_msgSend(v11, "initWithColor:edges:insets:weight:", v10, a4, v13, v14, v15, v12, a6);

  return v16;
}

+ (id)effectWithColor:(id)a3 edges:(unint64_t)a4 insets:(UIEdgeInsets)a5 weight:(double)a6
{
  double right = a5.right;
  double bottom = a5.bottom;
  double left = a5.left;
  double top = a5.top;
  id v13 = a3;
  double v14 = objc_msgSend(objc_alloc((Class)a1), "initWithColor:edges:insets:weight:", v13, a4, top, left, bottom, right, a6);

  return v14;
}

- (UIKBEdgeEffect)initWithColor:(id)a3 edges:(unint64_t)a4 insets:(UIEdgeInsets)a5 weight:(double)a6
{
  CGFloat right = a5.right;
  CGFloat bottom = a5.bottom;
  CGFloat left = a5.left;
  CGFloat top = a5.top;
  id v14 = a3;
  v18.receiver = self;
  v18.super_class = (Class)UIKBEdgeEffect;
  double v15 = [(UIKBEdgeEffect *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_colorName, a3);
    v16->_edges = a4;
    v16->_insets.CGFloat top = top;
    v16->_insets.CGFloat left = left;
    v16->_insets.CGFloat bottom = bottom;
    v16->_insets.CGFloat right = right;
    v16->_weight = a6;
    v16->_opacity = 1.0;
  }

  return v16;
}

- (NSString)description
{
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"<%@: %p", objc_opt_class(), self];
  BOOL v4 = [(UIKBEdgeEffect *)self gradient];

  if (v4)
  {
    char v5 = [(UIKBEdgeEffect *)self gradient];
    [v3 appendFormat:@"; gradient = %@", v5];
  }
  else
  {
    [v3 appendFormat:@"; color = %@", self->_colorName];
  }
  objc_msgSend(v3, "appendFormat:", @"; edges = %x", -[UIKBEdgeEffect edges](self, "edges"));
  [(UIKBEdgeEffect *)self insets];
  double v6 = NSStringFromUIEdgeInsets(v12);
  [v3 appendFormat:@"; insets = %@", v6];

  [(UIKBEdgeEffect *)self weight];
  objc_msgSend(v3, "appendFormat:", @"; weight = %f", v7);
  [(UIKBEdgeEffect *)self opacity];
  if (v8 != 1.0)
  {
    [(UIKBEdgeEffect *)self opacity];
    objc_msgSend(v3, "appendFormat:", @"; opacity = %f", v9);
  }
  [v3 appendString:@">"];
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (UIKBEdgeEffect *)a3;
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
      && (gradient = self->_gradient, (gradient != 0) != (v4->_gradient == 0))
      && (!gradient || -[UIKBGradient isEqual:](gradient, "isEqual:"))
      && self->_edges == v4->_edges
      && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.top, *(float64x2_t *)&v4->_insets.top), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insets.bottom, *(float64x2_t *)&v4->_insets.bottom))), 0xFuLL))) & 1) != 0&& self->_weight == v4->_weight&& self->_opacity == v4->_opacity;
  }

  return v7;
}

- (CGColor)CGColor
{
  colorName = self->_colorName;
  if (!colorName) {
    return 0;
  }
  BOOL v4 = (CGColor *)UIKBGetNamedColor(colorName);
  [(UIKBEdgeEffect *)self opacity];
  if (v5 == 1.0)
  {
    CGColorRetain(v4);
    return v4;
  }
  [(UIKBEdgeEffect *)self opacity];
  return CGColorCreateCopyWithAlpha(v4, v6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = +[UIKBEdgeEffect allocWithZone:a3];
  colorName = self->_colorName;
  unint64_t v6 = [(UIKBEdgeEffect *)self edges];
  [(UIKBEdgeEffect *)self insets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(UIKBEdgeEffect *)self weight];
  uint64_t v16 = -[UIKBEdgeEffect initWithColor:edges:insets:weight:](v4, "initWithColor:edges:insets:weight:", colorName, v6, v8, v10, v12, v14, v15);
  uint64_t v17 = [(UIKBGradient *)self->_gradient copy];
  objc_super v18 = *(void **)(v16 + 32);
  *(void *)(v16 + 32) = v17;

  *(double *)(v16 + 40) = self->_opacity;
  return (id)v16;
}

- (unint64_t)edges
{
  return self->_edges;
}

- (void)setEdges:(unint64_t)a3
{
  self->_edges = a3;
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

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (UIKBGradient)gradient
{
  return self->_gradient;
}

- (void)setGradient:(id)a3
{
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradient, 0);
  objc_storeStrong((id *)&self->_colorName, 0);
}

@end