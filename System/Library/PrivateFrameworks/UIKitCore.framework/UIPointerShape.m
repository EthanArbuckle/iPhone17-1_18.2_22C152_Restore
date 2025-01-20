@interface UIPointerShape
+ (UIPointerShape)beamWithPreferredLength:(CGFloat)length axis:(UIAxis)axis;
+ (UIPointerShape)shapeWithPath:(UIBezierPath *)path;
+ (UIPointerShape)shapeWithRoundedRect:(CGRect)rect;
+ (UIPointerShape)shapeWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius;
+ (id)_elasticRectShapePinnedAtPoint:(CGPoint)a3;
+ (id)_linkPointerShape;
+ (id)_shapeWithSymbol:(id)a3 pointSize:(double)a4;
- (BOOL)isCircle;
- (BOOL)isElastic;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (CGPoint)inherentConstrainedSlip;
- (CGPoint)pinnedPoint;
- (CGRect)rect;
- (CGSize)size;
- (NSString)cornerCurve;
- (UIBezierPath)path;
- (UIPointerShape)init;
- (double)beamLength;
- (double)cornerRadius;
- (double)defaultCornerRadius;
- (double)effectiveCornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)_type;
- (unint64_t)hash;
- (unint64_t)materialUsage;
- (void)_setType:(int64_t)a3;
- (void)setBeamLength:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDefaultCornerRadius:(double)a3;
- (void)setInherentConstrainedSlip:(CGPoint)a3;
- (void)setMaterialUsage:(unint64_t)a3;
- (void)setPath:(id)a3;
- (void)setPinnedPoint:(CGPoint)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation UIPointerShape

- (UIPointerShape)init
{
  v10.receiver = self;
  v10.super_class = (Class)UIPointerShape;
  v2 = [(UIPointerShape *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(UIPointerShape *)v2 setMaterialUsage:1];
    v4 = +[_UIPointerSettingsDomain rootSettings];
    v5 = [v4 freeformPointerSettings];

    [v5 slipFactorX];
    double v7 = v6;
    [v5 slipFactorY];
    -[UIPointerShape setInherentConstrainedSlip:](v3, "setInherentConstrainedSlip:", v7, v8);
    [v5 defaultPointerCornerRadius];
    -[UIPointerShape setDefaultCornerRadius:](v3, "setDefaultCornerRadius:");
    -[UIPointerShape setPinnedPoint:](v3, "setPinnedPoint:", 1.79769313e308, 1.79769313e308);
  }
  return v3;
}

+ (UIPointerShape)shapeWithPath:(UIBezierPath *)path
{
  v3 = path;
  v4 = objc_opt_new();
  [v4 _setType:1];
  [v4 setPath:v3];

  return (UIPointerShape *)v4;
}

+ (UIPointerShape)shapeWithRoundedRect:(CGRect)rect
{
  return (UIPointerShape *)objc_msgSend(a1, "shapeWithRoundedRect:cornerRadius:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, 2.22507386e-308);
}

+ (UIPointerShape)shapeWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius
{
  double height = rect.size.height;
  double width = rect.size.width;
  double y = rect.origin.y;
  double x = rect.origin.x;
  v9 = objc_opt_new();
  [v9 _setType:0];
  objc_msgSend(v9, "setRect:", x, y, width, height);
  [v9 setCornerRadius:cornerRadius];
  return (UIPointerShape *)v9;
}

+ (UIPointerShape)beamWithPreferredLength:(CGFloat)length axis:(UIAxis)axis
{
  double v7 = +[_UIPointerSettingsDomain rootSettings];
  double v8 = [v7 beamSettings];

  if (axis - 3 < 0xFFFFFFFFFFFFFFFELL) {
    axis = 2;
  }
  [v8 minLength];
  double v10 = v9;
  [v8 maxLength];
  double v12 = fmax(v10, fmin(length, v11));
  [v8 width];
  double v14 = *MEMORY[0x1E4F1DAD8];
  double v15 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (axis == 2) {
    double v16 = v13;
  }
  else {
    double v16 = v12;
  }
  if (axis != 2) {
    double v12 = v13;
  }
  v26.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
  v26.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
  v26.size.double width = v16;
  v26.size.double height = v12;
  double Width = CGRectGetWidth(v26);
  v27.origin.double x = v14;
  v27.origin.double y = v15;
  v27.size.double width = v16;
  v27.size.double height = v12;
  double Height = CGRectGetHeight(v27);
  if (Width < Height) {
    double Height = Width;
  }
  v19 = objc_msgSend(a1, "shapeWithRoundedRect:cornerRadius:", v14, v15, v16, v12, Height * 0.5);
  [v19 setMaterialUsage:2];
  [v8 slipFactorX];
  double v21 = v20;
  [v8 slipFactorY];
  objc_msgSend(v19, "setInherentConstrainedSlip:", v21, v22);
  if (axis == 1) {
    uint64_t v23 = 3;
  }
  else {
    uint64_t v23 = 2;
  }
  [v19 _setType:v23];
  [v19 setBeamLength:length];

  return (UIPointerShape *)v19;
}

+ (id)_linkPointerShape
{
  v2 = objc_opt_new();
  return v2;
}

+ (id)_elasticRectShapePinnedAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v5 = objc_opt_new();
  objc_msgSend(v5, "setPinnedPoint:", x, y);
  return v5;
}

+ (id)_shapeWithSymbol:(id)a3 pointSize:(double)a4
{
  id v5 = a3;
  double v6 = +[UIImageSymbolConfiguration configurationWithPointSize:4 weight:a4];
  double v7 = +[UIImage systemImageNamed:v5 withConfiguration:v6];

  double v8 = [v7 _outlinePath];
  double v9 = v8;
  if (v8)
  {
    [v8 bounds];
    CGFloat v10 = -CGRectGetMinX(v16);
    [v9 bounds];
    CGFloat MinY = CGRectGetMinY(v17);
    CGAffineTransformMakeTranslation(&v14, v10, -MinY);
    [v9 applyTransform:&v14];
    double v12 = +[UIPointerShape shapeWithPath:v9];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (CGSize)size
{
  v3 = [(UIPointerShape *)self path];

  if (v3)
  {
    v4 = [(UIPointerShape *)self path];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
  }
  else
  {
    [(UIPointerShape *)self rect];
    double v6 = v9;
    double v8 = v10;
  }
  double v11 = v6;
  double v12 = v8;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (BOOL)isEmpty
{
  if ([(UIPointerShape *)self isElastic]) {
    return 0;
  }
  v4 = [(UIPointerShape *)self path];

  if (v4)
  {
    double v5 = [(UIPointerShape *)self path];
    [v5 bounds];
    IsEmptdouble y = CGRectIsEmpty(v12);

    return IsEmpty;
  }
  else
  {
    [(UIPointerShape *)self rect];
    return CGRectIsEmpty(*(CGRect *)&v7);
  }
}

- (BOOL)isCircle
{
  if ([(UIPointerShape *)self isEmpty]) {
    return 0;
  }
  v3 = [(UIPointerShape *)self path];

  if (v3) {
    return 0;
  }
  [(UIPointerShape *)self rect];
  CGFloat x = v13.origin.x;
  CGFloat y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double v8 = CGRectGetWidth(v13);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  if (vabdd_f64(v8, CGRectGetHeight(v14)) > 2.22044605e-16) {
    return 0;
  }
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v10 = CGRectGetWidth(v15) * 0.5;
  [(UIPointerShape *)self effectiveCornerRadius];
  if (v11 > v10) {
    return 1;
  }
  [(UIPointerShape *)self effectiveCornerRadius];
  return vabdd_f64(v12, v10) <= 2.22044605e-16;
}

- (BOOL)isElastic
{
  [(UIPointerShape *)self pinnedPoint];
  return v3 != 1.79769313e308 || v2 != 1.79769313e308;
}

- (double)effectiveCornerRadius
{
  [(UIPointerShape *)self cornerRadius];
  double v4 = v3;
  double v5 = vabdd_f64(2.22507386e-308, v3);
  if (v4 < 0.0 || v5 <= 2.22044605e-16)
  {
    [(UIPointerShape *)self defaultCornerRadius];
    double v4 = v7;
  }
  [(UIPointerShape *)self rect];
  return _UIClampedCornerRadius(15, v4, v8, v9, v10, v11);
}

- (NSString)cornerCurve
{
  [(UIPointerShape *)self cornerRadius];
  double v4 = v3;
  [(UIPointerShape *)self rect];
  double v9 = _UIClampedCornerRadius(15, v4, v5, v6, v7, v8);
  CGFloat v10 = (void **)MEMORY[0x1E4F39EA8];
  if (v4 > v9) {
    CGFloat v10 = (void **)MEMORY[0x1E4F39EA0];
  }
  CGFloat v11 = *v10;
  return (NSString *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "_setType:", -[UIPointerShape _type](self, "_type"));
  CGFloat v5 = [(UIPointerShape *)self path];
  [v4 setPath:v5];

  [(UIPointerShape *)self rect];
  objc_msgSend(v4, "setRect:");
  [(UIPointerShape *)self pinnedPoint];
  objc_msgSend(v4, "setPinnedPoint:");
  [(UIPointerShape *)self cornerRadius];
  objc_msgSend(v4, "setCornerRadius:");
  [(UIPointerShape *)self defaultCornerRadius];
  objc_msgSend(v4, "setDefaultCornerRadius:");
  [(UIPointerShape *)self beamLength];
  objc_msgSend(v4, "setBeamLength:");
  [(UIPointerShape *)self inherentConstrainedSlip];
  objc_msgSend(v4, "setInherentConstrainedSlip:");
  objc_msgSend(v4, "setMaterialUsage:", -[UIPointerShape materialUsage](self, "materialUsage"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (UIPointerShape *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CGFloat v5 = v4;
      uint64_t v6 = [(UIPointerShape *)v5 _type];
      if (v6 != [(UIPointerShape *)self _type])
      {
LABEL_23:
        BOOL v13 = 0;
LABEL_24:

        goto LABEL_25;
      }
      CGFloat v7 = [(UIPointerShape *)v5 path];
      CGFloat v8 = [(UIPointerShape *)self path];
      id v9 = v7;
      id v10 = v8;
      CGFloat v11 = v10;
      if (v9 == v10)
      {
      }
      else
      {
        if (!v9 || !v10)
        {

LABEL_22:
          goto LABEL_23;
        }
        int v12 = [v9 isEqual:v10];

        if (!v12) {
          goto LABEL_22;
        }
      }
      [(UIPointerShape *)v5 rect];
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      [(UIPointerShape *)self rect];
      v52.origin.CGFloat x = v22;
      v52.origin.CGFloat y = v23;
      v52.size.CGFloat width = v24;
      v52.size.CGFloat height = v25;
      v51.origin.CGFloat x = v15;
      v51.origin.CGFloat y = v17;
      v51.size.CGFloat width = v19;
      v51.size.CGFloat height = v21;
      if (CGRectEqualToRect(v51, v52))
      {
        [(UIPointerShape *)v5 pinnedPoint];
        double v27 = v26;
        double v29 = v28;
        [(UIPointerShape *)self pinnedPoint];
        if (v27 == v31 && v29 == v30)
        {
          [(UIPointerShape *)v5 cornerRadius];
          double v33 = v32;
          [(UIPointerShape *)self cornerRadius];
          if (v33 == v34)
          {
            [(UIPointerShape *)v5 defaultCornerRadius];
            double v36 = v35;
            [(UIPointerShape *)self defaultCornerRadius];
            if (v36 == v37)
            {
              [(UIPointerShape *)v5 beamLength];
              double v39 = v38;
              [(UIPointerShape *)self beamLength];
              if (v39 == v40)
              {
                [(UIPointerShape *)v5 inherentConstrainedSlip];
                double v42 = v41;
                double v44 = v43;
                [(UIPointerShape *)self inherentConstrainedSlip];
                double v46 = v45;
                double v48 = v47;

                BOOL v13 = 0;
                if (v42 == v46 && v44 == v48)
                {
                  uint64_t v49 = [(UIPointerShape *)v5 materialUsage];
                  BOOL v13 = v49 == [(UIPointerShape *)self materialUsage];
                }
                goto LABEL_24;
              }
            }
          }
        }
      }
      goto LABEL_22;
    }
    BOOL v13 = 0;
  }
LABEL_25:

  return v13;
}

- (unint64_t)hash
{
  int64_t v3 = [(UIPointerShape *)self _type];
  if ([(UIPointerShape *)self isElastic])
  {
    [(UIPointerShape *)self pinnedPoint];
    int v5 = (int)v4;
    [(UIPointerShape *)self pinnedPoint];
    int v7 = (int)v6 ^ v5;
  }
  else
  {
    uint64_t v8 = [(UIPointerShape *)self path];
    [(id)v8 bounds];
    int v32 = (int)v9;
    uint64_t v10 = [(UIPointerShape *)self path];
    [(id)v10 bounds];
    int v31 = (int)v11;
    uint64_t v12 = [(UIPointerShape *)self path];
    [(id)v12 bounds];
    HIDWORD(v30) = (int)v13;
    uint64_t v14 = [(UIPointerShape *)self path];
    [(id)v14 bounds];
    LODWORD(v30) = (int)v15;

    [(UIPointerShape *)self rect];
    LODWORD(v8) = (int)v16;
    [(UIPointerShape *)self rect];
    LODWORD(v10) = (int)v17;
    [(UIPointerShape *)self rect];
    LODWORD(v12) = (int)v18;
    [(UIPointerShape *)self rect];
    LODWORD(v14) = (int)v19;
    [(UIPointerShape *)self cornerRadius];
    int v21 = (int)v20;
    [(UIPointerShape *)self defaultCornerRadius];
    int v23 = (int)v22;
    [(UIPointerShape *)self beamLength];
    int v25 = (int)v24;
    [(UIPointerShape *)self inherentConstrainedSlip];
    int v27 = (int)v26;
    [(UIPointerShape *)self inherentConstrainedSlip];
    int v7 = v31 ^ v32 ^ HIDWORD(v30) ^ v30 ^ v8 ^ v10 ^ v12 ^ v21 ^ v14 ^ v23 ^ v25 ^ v27 ^ (int)v28;
  }
  return v3 ^ [(UIPointerShape *)self materialUsage] ^ v7;
}

- (id)description
{
  int64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  switch([(UIPointerShape *)self _type])
  {
    case 0:
      [(UIPointerShape *)self rect];
      uint64_t v5 = v4;
      [(UIPointerShape *)self rect];
      uint64_t v7 = v6;
      [(UIPointerShape *)self rect];
      uint64_t v9 = v8;
      [(UIPointerShape *)self rect];
      objc_msgSend(v3, "appendFormat:", @"; rect = (%g %g; %g %g)", v5, v7, v9, v10);
      [(UIPointerShape *)self cornerRadius];
      if (vabdd_f64(2.22507386e-308, v11) > 2.22044605e-16) {
        objc_msgSend(v3, "appendFormat:", @"; cornerRadius = %g", *(void *)&v11);
      }
      break;
    case 1:
      uint64_t v14 = [(UIPointerShape *)self path];
      objc_msgSend(v3, "appendFormat:", @"; path = <UIBezierPath: %p>", v14);

      break;
    case 2:
      [(UIPointerShape *)self beamLength];
      objc_msgSend(v3, "appendFormat:", @"; beamLength = %g (vertical)", v12);
      break;
    case 3:
      [(UIPointerShape *)self beamLength];
      objc_msgSend(v3, "appendFormat:", @"; beamLength = %g (horizontal)", v13);
      break;
    default:
      break;
  }
  [v3 appendString:@">"];
  return v3;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (CGPoint)pinnedPoint
{
  double x = self->_pinnedPoint.x;
  double y = self->_pinnedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPinnedPoint:(CGPoint)a3
{
  self->_pinnedPoint = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)defaultCornerRadius
{
  return self->_defaultCornerRadius;
}

- (void)setDefaultCornerRadius:(double)a3
{
  self->_defaultCornerRadius = a3;
}

- (CGPoint)inherentConstrainedSlip
{
  double x = self->_inherentConstrainedSlip.x;
  double y = self->_inherentConstrainedSlip.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInherentConstrainedSlip:(CGPoint)a3
{
  self->_inherentConstrainedSlip = a3;
}

- (double)beamLength
{
  return self->_beamLength;
}

- (void)setBeamLength:(double)a3
{
  self->_beamLength = a3;
}

- (unint64_t)materialUsage
{
  return self->_materialUsage;
}

- (void)setMaterialUsage:(unint64_t)a3
{
  self->_materialUsage = a3;
}

- (int64_t)_type
{
  return self->__type;
}

- (void)_setType:(int64_t)a3
{
  self->__type = a3;
}

- (void).cxx_destruct
{
}

@end