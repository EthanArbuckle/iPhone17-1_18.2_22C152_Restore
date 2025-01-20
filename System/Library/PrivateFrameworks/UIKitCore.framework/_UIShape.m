@interface _UIShape
+ (id)shapeWithPath:(id)a3;
+ (id)shapeWithRoundedRect:(CGRect)a3 cornerRadii:(CACornerRadii *)a4 cornerCurve:(id)a5;
+ (id)shapeWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerCurve:(id)a5;
+ (id)shapeWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerCurve:(id)a5 cornerMask:(unint64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRect;
- (CACornerRadii)cornerRadii;
- (CGRect)bounds;
- (CGRect)rect;
- (CGSize)size;
- (NSString)cornerCurve;
- (UIBezierPath)outline;
- (UIBezierPath)path;
- (_UIShape)zeroOriginShape;
- (double)cornerRadius;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shapeConvertedFromCoordinateSpace:(id)a3 toCoordinateSpace:(id)a4;
- (unint64_t)cornerMask;
@end

@implementation _UIShape

+ (id)shapeWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerCurve:(id)a5 cornerMask:(unint64_t)a6
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v12 = a5;
  uint64_t v13 = objc_opt_new();
  v14 = (void *)v13;
  *(CGFloat *)(v13 + 40) = x;
  *(CGFloat *)(v13 + 48) = y;
  *(CGFloat *)(v13 + 56) = width;
  *(CGFloat *)(v13 + 64) = height;
  double v15 = 0.0;
  if (a4 >= 0.0) {
    double v15 = a4;
  }
  *(double *)(v13 + 16) = v15;
  v16 = *(void **)(v13 + 24);
  *(void *)(v13 + 24) = v12;

  v14[4] = a6;
  return v14;
}

+ (id)shapeWithRoundedRect:(CGRect)a3 cornerRadius:(double)a4 cornerCurve:(id)a5
{
  return +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:", a5, 15, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

+ (id)shapeWithPath:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  if ([v3 _isRoundedRect])
  {
    [v3 bounds];
    *(void *)(v4 + 40) = v5;
    *(void *)(v4 + 48) = v6;
    *(void *)(v4 + 56) = v7;
    *(void *)(v4 + 64) = v8;
    [v3 _cornerRadius];
    if (v9 < 0.0) {
      double v9 = 0.0;
    }
    *(double *)(v4 + 16) = v9;
    int v10 = [v3 _hasContinuousCorners];
    v11 = (id *)MEMORY[0x1E4F39EA8];
    if (!v10) {
      v11 = (id *)MEMORY[0x1E4F39EA0];
    }
    objc_storeStrong((id *)(v4 + 24), *v11);
    *(void *)(v4 + 32) = [v3 _cornerMask];
  }
  else
  {
    uint64_t v12 = [v3 copy];
    uint64_t v13 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v12;
  }
  return (id)v4;
}

+ (id)shapeWithRoundedRect:(CGRect)a3 cornerRadii:(CACornerRadii *)a4 cornerCurve:(id)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  *(CGFloat *)(v11 + 40) = x;
  *(CGFloat *)(v11 + 48) = y;
  *(CGFloat *)(v11 + 56) = width;
  *(CGFloat *)(v11 + 64) = height;
  CGSize maxXMinY = a4->maxXMinY;
  CGSize minXMinY = a4->minXMinY;
  CGSize maxXMaxY = a4->maxXMaxY;
  *(CGSize *)(v11 + 72) = a4->minXMaxY;
  *(CGSize *)(v11 + 104) = maxXMinY;
  *(CGSize *)(v11 + 120) = minXMinY;
  *(CGSize *)(v11 + 88) = maxXMaxY;
  double v15 = *(void **)(v11 + 24);
  *(void *)(v11 + 24) = v10;

  *(void *)(v11 + 32) = 15;
  return (id)v11;
}

- (id)shapeConvertedFromCoordinateSpace:(id)a3 toCoordinateSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)[(_UIShape *)self copy];
  double v9 = v8;
  if (v6 != v7)
  {
    if ([v8 isRect])
    {
      [v9 rect];
      objc_msgSend(v6, "convertRect:toCoordinateSpace:", v7);
      v9[5] = v10;
      v9[6] = v11;
      v9[7] = v12;
      v9[8] = v13;
    }
    else
    {
      uint64_t v14 = [(UIBezierPath *)self->_path _bezierPathConvertedFromCoordinateSpace:v6 toCoordinateSpace:v7];
      double v15 = (void *)v9[1];
      v9[1] = v14;
    }
  }

  return v9;
}

- (CGSize)size
{
  [(_UIShape *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.CGFloat height = v5;
  result.CGFloat width = v3;
  return result;
}

- (CGRect)bounds
{
  if ([(_UIShape *)self isRect])
  {
    [(_UIShape *)self rect];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    uint64_t v11 = [(_UIShape *)self path];
    [v11 bounds];
    double v4 = v12;
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (BOOL)isRect
{
  double v2 = [(_UIShape *)self path];
  BOOL v3 = v2 == 0;

  return v3;
}

- (UIBezierPath)outline
{
  BOOL v3 = [(_UIShape *)self path];
  if (!v3)
  {
    [(_UIShape *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(_UIShape *)self cornerRadius];
    double v13 = v12;
    double v14 = [(_UIShape *)self cornerCurve];
    double v15 = (void *)*MEMORY[0x1E4F39EA8];

    double v16 = _UIClampedCornerRadius(self->_cornerMask, v13, v5, v7, v9, v11);
    unint64_t v17 = self->_cornerMask & 0xF;
    if (v14 == v15) {
      +[UIBezierPath bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:](UIBezierPath, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v17, v5, v7, v9, v11, v16, v16);
    }
    else {
    BOOL v3 = +[UIBezierPath _roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:](UIBezierPath, "_roundedRectBezierPath:withRoundedCorners:cornerRadius:segments:legacyCorners:", v17, 16, 1, v5, v7, v9, v11, v16);
    }
  }
  return (UIBezierPath *)v3;
}

- (_UIShape)zeroOriginShape
{
  if ([(_UIShape *)self isRect])
  {
    [(_UIShape *)self rect];
    double v4 = v3;
    double v6 = v5;
    [(_UIShape *)self cornerRadius];
    double v8 = v7;
    CGFloat v9 = [(_UIShape *)self cornerCurve];
    double v10 = +[_UIShape shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:](_UIShape, "shapeWithRoundedRect:cornerRadius:cornerCurve:cornerMask:", v9, [(_UIShape *)self cornerMask], 0.0, 0.0, v4, v6, v8);
  }
  else
  {
    CGFloat v11 = [(_UIShape *)self path];
    double v12 = (void *)[v11 copy];

    memset(&v17, 0, sizeof(v17));
    [v12 bounds];
    CGFloat v13 = -CGRectGetMinX(v19);
    [v12 bounds];
    CGFloat MinY = CGRectGetMinY(v20);
    CGAffineTransformMakeTranslation(&v17, v13, -MinY);
    CGAffineTransform v16 = v17;
    [v12 applyTransform:&v16];
    double v10 = +[_UIShape shapeWithPath:v12];
  }
  return (_UIShape *)v10;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (_UIShape *)a3;
  if (v4 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      double v6 = [(_UIShape *)v5 path];
      double v7 = [(_UIShape *)self path];
      id v8 = v6;
      id v9 = v7;
      double v10 = v9;
      if (v8 == v9)
      {
      }
      else
      {
        LOBYTE(v11) = 0;
        id v12 = v8;
        if (!v8 || !v9) {
          goto LABEL_17;
        }
        LODWORD(v11) = [v8 isEqual:v9];

        if (!v11) {
          goto LABEL_18;
        }
      }
      [(_UIShape *)v5 rect];
      CGFloat v14 = v13;
      CGFloat v16 = v15;
      CGFloat v18 = v17;
      CGFloat v20 = v19;
      [(_UIShape *)self rect];
      v30.origin.CGFloat x = v21;
      v30.origin.CGFloat y = v22;
      v30.size.CGFloat width = v23;
      v30.size.CGFloat height = v24;
      v29.origin.CGFloat x = v14;
      v29.origin.CGFloat y = v16;
      v29.size.CGFloat width = v18;
      v29.size.CGFloat height = v20;
      if (!CGRectEqualToRect(v29, v30)
        || ([(_UIShape *)v5 cornerRadius],
            double v26 = v25,
            [(_UIShape *)self cornerRadius],
            v26 != v27))
      {
        LOBYTE(v11) = 0;
LABEL_18:

        goto LABEL_19;
      }
      id v12 = [(_UIShape *)v5 cornerCurve];
      id v9 = [(_UIShape *)self cornerCurve];
      if (v12 == v9)
      {
        uint64_t v11 = [(_UIShape *)v5 cornerMask];
        LOBYTE(v11) = v11 == [(_UIShape *)self cornerMask];
        id v9 = v12;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
LABEL_17:

      goto LABEL_18;
    }
    LOBYTE(v11) = 0;
  }
LABEL_19:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(_UIShape *)self path];
  double v6 = (void *)v4[1];
  v4[1] = v5;

  [(_UIShape *)self rect];
  v4[5] = v7;
  v4[6] = v8;
  v4[7] = v9;
  v4[8] = v10;
  [(_UIShape *)self cornerRadius];
  v4[2] = v11;
  uint64_t v12 = [(_UIShape *)self cornerCurve];
  double v13 = (void *)v4[3];
  v4[3] = v12;

  v4[4] = [(_UIShape *)self cornerMask];
  return v4;
}

- (id)description
{
  double v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  if ([(_UIShape *)self isRect])
  {
    [(_UIShape *)self rect];
    objc_msgSend(v3, "appendFormat:", @"; rect = (%g %g; %g %g)", v4, v5, v6, v7);
    [(_UIShape *)self cornerRadius];
    if (fabs(v8) >= 2.22044605e-16)
    {
      [(_UIShape *)self cornerRadius];
      objc_msgSend(v3, "appendFormat:", @"; cornerRadius = %g", v9);
      uint64_t v10 = [(_UIShape *)self cornerCurve];
      uint64_t v11 = (void *)*MEMORY[0x1E4F39EA8];

      if (v10 == v11) {
        uint64_t v12 = @"; cornerCurve = continuous";
      }
      else {
        uint64_t v12 = @"; cornerCurve = circular";
      }
      [v3 appendFormat:v12];
    }
  }
  else
  {
    double v13 = [(_UIShape *)self path];
    [v13 bounds];
    uint64_t v15 = v14;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;

    CGFloat v22 = [(_UIShape *)self path];
    uint64_t v23 = objc_opt_class();
    CGFloat v24 = [(_UIShape *)self path];
    [v3 appendFormat:@"; path = <%@: %p; bounds = (%g %g; %g %g)>", v23, v24, v15, v17, v19, v21];
  }
  [v3 appendString:@">"];
  return v3;
}

- (UIBezierPath)path
{
  return self->_path;
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

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (NSString)cornerCurve
{
  return self->_cornerCurve;
}

- (unint64_t)cornerMask
{
  return self->_cornerMask;
}

- (CACornerRadii)cornerRadii
{
  CGSize v3 = *(CGSize *)&self[1].maxXMaxY.height;
  retstr->minXMaxY = *(CGSize *)&self[1].minXMaxY.height;
  retstr->CGSize maxXMaxY = v3;
  CGSize v4 = *(CGSize *)&self[1].minXMinY.height;
  retstr->CGSize maxXMinY = *(CGSize *)&self[1].maxXMinY.height;
  retstr->CGSize minXMinY = v4;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cornerCurve, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end