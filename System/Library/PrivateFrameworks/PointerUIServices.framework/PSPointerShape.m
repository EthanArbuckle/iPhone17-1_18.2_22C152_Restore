@interface PSPointerShape
+ (BOOL)supportsSecureCoding;
+ (id)circleWithBounds:(CGRect)a3;
+ (id)circleWithSize:(CGSize)a3;
+ (id)customShapeWithPath:(CGPath *)a3;
+ (id)customShapeWithPath:(CGPath *)a3 usesEvenOddFillRule:(BOOL)a4;
+ (id)elasticRoundedRectPinnedAtPoint:(CGPoint)a3;
+ (id)roundedRectWithBounds:(CGRect)a3 cornerRadius:(double)a4;
+ (id)roundedRectWithBounds:(CGRect)a3 cornerRadius:(double)a4 cornerCurve:(id)a5;
+ (id)roundedRectWithSize:(CGSize)a3 cornerRadius:(double)a4;
+ (id)systemShape;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesEvenOddFillRule;
- (CGPath)_createMutablePathByDecodingData:(id)a3;
- (CGPath)path;
- (CGPoint)pinnedPoint;
- (CGRect)bounds;
- (CGSize)size;
- (NSString)cornerCurve;
- (PSPointerShape)initWithCoder:(id)a3;
- (double)cornerRadius;
- (id)_initWithShapeType:(int64_t)a3 bounds:(CGRect)a4;
- (id)description;
- (int64_t)shapeType;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PSPointerShape

+ (id)systemShape
{
  id v2 = objc_alloc((Class)a1);
  v3 = objc_msgSend(v2, "_initWithShapeType:bounds:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v3;
}

+ (id)circleWithBounds:(CGRect)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "_initWithShapeType:bounds:", 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return v3;
}

+ (id)circleWithSize:(CGSize)a3
{
  return (id)objc_msgSend(a1, "circleWithBounds:", a3.width * -0.5, a3.height * -0.5, a3.width);
}

+ (id)roundedRectWithBounds:(CGRect)a3 cornerRadius:(double)a4 cornerCurve:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  uint64_t v12 = objc_msgSend(objc_alloc((Class)a1), "_initWithShapeType:bounds:", 3, x, y, width, height);
  *(double *)(v12 + 32) = a4;
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  return (id)v12;
}

+ (id)roundedRectWithBounds:(CGRect)a3 cornerRadius:(double)a4
{
  return (id)objc_msgSend(a1, "roundedRectWithBounds:cornerRadius:cornerCurve:", *MEMORY[0x1E4F39EA8], a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

+ (id)roundedRectWithSize:(CGSize)a3 cornerRadius:(double)a4
{
  return (id)objc_msgSend(a1, "roundedRectWithBounds:cornerRadius:", a3.width * -0.5, a3.height * -0.5, a3.width, a3.height, a4);
}

+ (id)elasticRoundedRectPinnedAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v5 = objc_alloc((Class)a1);
  v6 = (CGFloat *)objc_msgSend(v5, "_initWithShapeType:bounds:", 5, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6[6] = x;
  v6[7] = y;
  return v6;
}

+ (id)customShapeWithPath:(CGPath *)a3 usesEvenOddFillRule:(BOOL)a4
{
  if ((unint64_t)CGPathGetNumberOfPoints() <= 0x100)
  {
    BoundingBoCGFloat x = CGPathGetBoundingBox(a3);
    if (BoundingBox.size.width <= 10000.0 && BoundingBox.size.height <= 10000.0)
    {
      if (CGPathIsRoundedRect())
      {
        if (BSFloatEqualToFloat())
        {
          uint64_t v7 = objc_msgSend(a1, "roundedRectWithBounds:cornerRadius:", 0.0, 0.0, 0.0, 0.0, 0.0, 0);
          goto LABEL_15;
        }
      }
      else if (CGPathIsEllipse())
      {
        uint64_t v7 = objc_msgSend(a1, "circleWithBounds:", 0.0, 0.0, 0.0, 0.0, 0);
LABEL_15:
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_10;
        }
      }
      CGRect v13 = CGPathGetBoundingBox(a3);
      uint64_t v8 = objc_msgSend(objc_alloc((Class)a1), "_initWithShapeType:bounds:", 4, v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
      if (v8)
      {
        *(void *)(v8 + 8) = MEMORY[0x192FBDBD0](a3);
        *(unsigned char *)(v8 + 16) = a4;
      }
      goto LABEL_10;
    }
  }
  uint64_t v8 = [a1 systemShape];
  v9 = PSLogCommon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[PSPointerShape customShapeWithPath:usesEvenOddFillRule:](v9);
  }

LABEL_10:
  return (id)v8;
}

+ (id)customShapeWithPath:(CGPath *)a3
{
  return (id)[a1 customShapeWithPath:a3 usesEvenOddFillRule:0];
}

- (id)_initWithShapeType:(int64_t)a3 bounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)PSPointerShape;
  id result = [(PSPointerShape *)&v10 init];
  if (result)
  {
    *((void *)result + 3) = a3;
    *((CGFloat *)result + 8) = x;
    *((CGFloat *)result + 9) = y;
    *((CGFloat *)result + 10) = width;
    *((CGFloat *)result + 11) = height;
  }
  return result;
}

- (void)dealloc
{
  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)PSPointerShape;
  [(PSPointerShape *)&v3 dealloc];
}

- (unint64_t)hash
{
  int8x16_t v2 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_bounds.origin), (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_bounds.size));
  return *(void *)&veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL)) ^ (unint64_t)self->_cornerRadius ^ self->_shapeType ^ self->_usesEvenOddFillRule;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PSPointerShape *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && v4->_shapeType == self->_shapeType
      && BSRectEqualToRect()
      && BSFloatEqualToFloat()
      && CGPathEqualToPath(v4->_path, self->_path)
      && v4->_usesEvenOddFillRule == self->_usesEvenOddFillRule;
  }

  return v5;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = [v3 activeMultilinePrefix];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  objc_super v10 = __29__PSPointerShape_description__block_invoke;
  id v11 = &unk_1E5667900;
  id v12 = v3;
  CGRect v13 = self;
  id v5 = v3;
  [v5 appendBodySectionWithName:@"PSPointerShape" multilinePrefix:v4 block:&v8];

  v6 = objc_msgSend(v5, "build", v8, v9, v10, v11);

  return v6;
}

id __29__PSPointerShape_description__block_invoke(uint64_t a1)
{
  int8x16_t v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 24) - 1;
  if (v3 > 4) {
    v4 = @"PSPointerShapeTypeUnknown";
  }
  else {
    v4 = (__CFString *)*((void *)&off_1E5667920 + v3);
  }
  id v5 = (id)[v2 appendObject:v4 withName:@"_shapeType"];
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = BSStringFromCGPoint();
  id v8 = (id)[v6 appendObject:v7 withName:@"_pinnedPoint"];

  uint64_t v9 = *(void **)(a1 + 32);
  objc_super v10 = BSStringFromCGRect();
  id v11 = (id)[v9 appendObject:v10 withName:@"_bounds"];

  id v12 = (id)[*(id *)(a1 + 32) appendFloat:@"_cornerRadius" withName:*(double *)(*(void *)(a1 + 40) + 32)];
  id v13 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"_cornerCurve"];
  v14 = *(const CGPath **)(*(void *)(a1 + 40) + 8);
  if (v14)
  {
    if ((unint64_t)CGPathGetNumberOfPoints() <= 0x100)
    {
      BoundingBoCGFloat x = CGPathGetBoundingBox(v14);
      if (BoundingBox.size.width <= 10000.0 && BoundingBox.size.height <= 10000.0)
      {
        id v15 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
        CGPathApply(*(CGPathRef *)(*(void *)(a1 + 40) + 8), v15, (CGPathApplierFunction)__encodePathElementIntoData);
        id v16 = (id)[*(id *)(a1 + 32) appendObject:v15 withName:@"_path"];
      }
    }
  }
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 16) withName:@"_usesEvenOddFillRule"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PSPointerShape)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PSPointerShape;
  id v5 = [(PSPointerShape *)&v23 init];
  if (v5)
  {
    v5->_shapeType = [v4 decodeIntegerForKey:@"shapeType"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pinnedPoint"];
    objc_msgSend(v6, "bs_CGPointValue");
    v5->_pinnedPoint.CGFloat x = v7;
    v5->_pinnedPoint.CGFloat y = v8;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bounds"];
    objc_msgSend(v9, "bs_CGRectValue");
    v5->_bounds.origin.CGFloat x = v10;
    v5->_bounds.origin.CGFloat y = v11;
    v5->_bounds.size.CGFloat width = v12;
    v5->_bounds.size.CGFloat height = v13;

    [v4 decodeDoubleForKey:@"cornerRadius"];
    v5->_cornerRadius = v14;
    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cornerCurve"];
    cornerCurve = v5->_cornerCurve;
    v5->_cornerCurve = (NSString *)v15;

    v5->_usesEvenOddFillRule = [v4 decodeBoolForKey:@"fillRule"];
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    if ([v17 length])
    {
      v18 = [(PSPointerShape *)v5 _createMutablePathByDecodingData:v17];
      if ((unint64_t)CGPathGetNumberOfPoints() > 0x100
        || (BoundingBoCGFloat x = CGPathGetBoundingBox(v18), BoundingBox.size.width > 10000.0)
        || BoundingBox.size.height > 10000.0)
      {
        v19 = PSLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[PSPointerShape initWithCoder:](v19);
        }

        CGSize v20 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
        v5->_bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
        v5->_bounds.size = v20;
        v5->_shapeType = 1;
        v5->_cornerRadius = 0.0;
        v21 = v5->_cornerCurve;
        v5->_cornerCurve = 0;

        v5->_usesEvenOddFillRule = 0;
      }
      else
      {
        v5->_path = (CGPath *)MEMORY[0x192FBDBD0](v18);
      }
      CGPathRelease(v18);
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInteger:self->_shapeType forKey:@"shapeType"];
  id v4 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGPoint:", self->_pinnedPoint.x, self->_pinnedPoint.y);
  [v7 encodeObject:v4 forKey:@"pinnedPoint"];

  id v5 = objc_msgSend(MEMORY[0x1E4F29238], "bs_valueWithCGRect:", self->_bounds.origin.x, self->_bounds.origin.y, self->_bounds.size.width, self->_bounds.size.height);
  [v7 encodeObject:v5 forKey:@"bounds"];

  [v7 encodeDouble:@"cornerRadius" forKey:self->_cornerRadius];
  [v7 encodeObject:self->_cornerCurve forKey:@"cornerCurve"];
  if (self->_path)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    CGPathApply(self->_path, v6, (CGPathApplierFunction)__encodePathElementIntoData);
    [v7 encodeObject:v6 forKey:@"path"];
    [v7 encodeBool:self->_usesEvenOddFillRule forKey:@"fillRule"];
  }
}

- (CGSize)size
{
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPath)_createMutablePathByDecodingData:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 length];
  if (v6)
  {
    unint64_t v7 = v6;
    Mutable = CGPathCreateMutable();
    uint64_t v9 = [v5 bytes];
    unint64_t v10 = 0;
    long long v24 = *MEMORY[0x1E4F1DAD8];
    do
    {
      uint64_t v11 = *(unsigned int *)(v9 + v10 + 4);
      uint64_t v12 = *(int *)(v9 + v10);
      long long v25 = v24;
      long long v26 = v24;
      long long v27 = v24;
      if (v12 > 3) {
        int v13 = 0;
      }
      else {
        int v13 = dword_18FB78DB0[v12];
      }
      unint64_t v14 = v10 + 8;
      if (v11 != v13 || v11 == 0)
      {
        v10 += 8;
      }
      else
      {
        id v16 = (float64x2_t *)&v25;
        uint64_t v17 = v11;
        do
        {
          unint64_t v10 = v14 + 8;
          *v16++ = vcvtq_f64_f32(*(float32x2_t *)(v9 + v14));
          v14 += 8;
          --v17;
        }
        while (v17);
      }
      switch((int)v12)
      {
        case 0:
          if (v11 != v13)
          {
            v19 = [MEMORY[0x1E4F28B00] currentHandler];
            [v19 handleFailureInMethod:a2 object:self file:@"PSPointerShape.m" lineNumber:255 description:@"incorrect number of points for path element type kCGPathElementMoveToPoint"];
          }
          CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v25, *((CGFloat *)&v25 + 1));
          break;
        case 1:
          if (v11 != v13)
          {
            CGSize v20 = [MEMORY[0x1E4F28B00] currentHandler];
            [v20 handleFailureInMethod:a2 object:self file:@"PSPointerShape.m" lineNumber:259 description:@"incorrect number of points for path element type kCGPathElementAddLineToPoint"];
          }
          CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v25, *((CGFloat *)&v25 + 1));
          break;
        case 2:
          if (v11 != v13)
          {
            v21 = [MEMORY[0x1E4F28B00] currentHandler];
            [v21 handleFailureInMethod:a2 object:self file:@"PSPointerShape.m" lineNumber:263 description:@"incorrect number of points for path element type kCGPathElementAddQuadCurveToPoint"];
          }
          CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)&v25, *((CGFloat *)&v25 + 1), *(CGFloat *)&v26, *((CGFloat *)&v26 + 1));
          break;
        case 3:
          if (v11 != v13)
          {
            v22 = [MEMORY[0x1E4F28B00] currentHandler];
            [v22 handleFailureInMethod:a2 object:self file:@"PSPointerShape.m" lineNumber:267 description:@"incorrect number of points for path element type kCGPathElementAddCurveToPoint"];
          }
          CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)&v25, *((CGFloat *)&v25 + 1), *(CGFloat *)&v26, *((CGFloat *)&v26 + 1), *(CGFloat *)&v27, *((CGFloat *)&v27 + 1));
          break;
        case 4:
          if (v11 != v13)
          {
            objc_super v23 = [MEMORY[0x1E4F28B00] currentHandler];
            [v23 handleFailureInMethod:a2 object:self file:@"PSPointerShape.m" lineNumber:271 description:@"incorrect number of points for path element type kCGPathElementCloseSubpath"];
          }
          CGPathCloseSubpath(Mutable);
          break;
        default:
          break;
      }
    }
    while (v10 < v7);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

- (int64_t)shapeType
{
  return self->_shapeType;
}

- (CGRect)bounds
{
  double x = self->_bounds.origin.x;
  double y = self->_bounds.origin.y;
  double width = self->_bounds.size.width;
  double height = self->_bounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (CGPoint)pinnedPoint
{
  double x = self->_pinnedPoint.x;
  double y = self->_pinnedPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (CGPath)path
{
  return self->_path;
}

- (BOOL)usesEvenOddFillRule
{
  return self->_usesEvenOddFillRule;
}

- (void).cxx_destruct
{
}

+ (void)customShapeWithPath:(os_log_t)log usesEvenOddFillRule:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FB6C000, log, OS_LOG_TYPE_ERROR, "Custom pointer shape rejected for being too complex. Using system pointer shape instead.", v1, 2u);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FB6C000, log, OS_LOG_TYPE_ERROR, "Custom pointer shape rejected for being too complex while decoding. Using system pointer shape instead.", v1, 2u);
}

@end