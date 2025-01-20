@interface GQDScalarPath
- (BOOL)isRect;
- (BOOL)isRectangular;
- (CGPath)createBezierPath;
- (CGSize)size;
- (double)scalar;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (int)type;
@end

@implementation GQDScalarPath

- (BOOL)isRectangular
{
  return !self->mType || (int)self->mScalar == 4;
}

- (BOOL)isRect
{
  return (int)self->mScalar == 0;
}

- (double)scalar
{
  return self->mScalar;
}

- (int)type
{
  return self->mType;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPath)createBezierPath
{
  [(GQDScalarPath *)self size];
  double v4 = v3;
  double v6 = v5;
  [(GQDScalarPath *)self scalar];
  double v8 = v7;
  unsigned int v9 = [(GQDScalarPath *)self type];
  if (v4 == 0.0 && v6 == 0.0) {
    return 0;
  }
  if (v4 != 0.0 && v6 != 0.0)
  {
    if (v8 <= 0.0)
    {
      Mutable = CGPathCreateMutable();
      v23.origin.x = 0.0;
      v23.origin.double y = 0.0;
      v23.size.double width = v4;
      v23.size.double height = v6;
      CGPathAddRect(Mutable, 0, v23);
      return Mutable;
    }
    if (v9 == 1)
    {
      double y = NSZeroRect.origin.y;
      memset(&v22, 0, sizeof(v22));
      sub_4C24C(&v22, -1.0, -1.0, 2.0, 2.0, NSZeroRect.origin.x, y, v4, v6);
      int v16 = (int)v8;
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, &v22, 6.123234e-17, -1.0);
      if ((int)v8 >= 1)
      {
        float v17 = (float)v16;
        int v18 = 2;
        do
        {
          float v19 = ((float)((float)v18 / v17) + -0.5) * 3.14159265;
          __float2 v20 = __sincosf_stret(v19);
          CGPathAddLineToPoint(Mutable, &v22, v20.__cosval, v20.__sinval);
          v18 += 2;
          --v16;
        }
        while (v16);
      }
    }
    else
    {
      if (v9) {
        return 0;
      }
      double v11 = v4 * 0.5;
      if (v8 <= v4 * 0.5) {
        double v11 = v8;
      }
      if (v11 <= v6 * 0.5) {
        double v12 = v11;
      }
      else {
        double v12 = v6 * 0.5;
      }
      CGFloat v13 = v6 - v12;
      CGFloat v14 = v4 - v12;
      Mutable = CGPathCreateMutable();
      CGPathMoveToPoint(Mutable, 0, 0.0, v13);
      CGPathAddArc(Mutable, 0, v12, v12, v12, 3.14159265, 4.71238898, 0);
      CGPathAddArc(Mutable, 0, v14, v12, v12, 4.71238898, 0.0, 0);
      CGPathAddArc(Mutable, 0, v14, v13, v12, 0.0, 1.57079633, 0);
      CGPathAddArc(Mutable, 0, v12, v13, v12, 1.57079633, 3.14159265, 0);
    }
    CGPathCloseSubpath(Mutable);
    return Mutable;
  }
  if (v4 == 0.0) {
    double v4 = 0.0;
  }
  else {
    double v6 = 0.0;
  }
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
  CGPathAddLineToPoint(Mutable, 0, v4, v6);
  return Mutable;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  self->mType = sub_42F04(a3, qword_A35E8, (xmlChar *)"type", 0);
  if (sub_43164(a3, qword_A35E8, (xmlChar *)"scalar", &self->mScalar)) {
    return 1;
  }
  else {
    return 3;
  }
}

@end