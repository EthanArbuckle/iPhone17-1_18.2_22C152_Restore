@interface CMFreeFormShapeBuilder
- (CGAffineTransform)affineTransform;
- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3;
- (CGPoint)_renderPathElement:(id)a3 withTransform:(CGAffineTransform *)a4 inPath:(CGPath *)a5;
- (void)setPath:(id)a3;
- (void)setSpace:(CGSize)a3;
@end

@implementation CMFreeFormShapeBuilder

- (void)setPath:(id)a3
{
}

- (void)setSpace:(CGSize)a3
{
  if (a3.width == 0.0 || a3.height == 0.0)
  {
    BOOL v4 = [(CMShapeBuilder *)self isOffice12];
    a3.width = 12666.0;
    if (!v4) {
      a3.width = 8.0;
    }
    a3.height = a3.width;
  }
  self->_space = a3;
}

- (CGAffineTransform)affineTransform
{
  orientedBounds = self->super.super._orientedBounds;
  if (!orientedBounds)
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    [v38 handleFailureInMethod:a3 object:self file:@"CMFreeFormShapeBuilder.mm" lineNumber:41 description:@"oriented bounds not set"];

    orientedBounds = self->super.super._orientedBounds;
  }
  uint64_t v6 = MEMORY[0x263F000D0];
  long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v7;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v6 + 32);
  [(OADOrientedBounds *)orientedBounds bounds];
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(OADOrientedBounds *)self->super.super._orientedBounds rotation];
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    double v9 = NSTransposedRectWithSameCenter(v9, v11, v13, v15);
    CGFloat v11 = v16;
    CGFloat v13 = v17;
    CGFloat v15 = v18;
  }
  long long v19 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v47.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v47.c = v19;
  *(_OWORD *)&v47.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformTranslate(retstr, &v47, v9, v11);
  [(OADOrientedBounds *)self->super.super._orientedBounds rotation];
  float v21 = v20 * 3.14159265 / -180.0;
  if (v21 != 0.0)
  {
    long long v22 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v45.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v45.c = v22;
    *(_OWORD *)&v45.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v46, &v45, v13 * 0.5, v15 * 0.5);
    long long v23 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v23;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
    long long v24 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v44.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v44.c = v24;
    *(_OWORD *)&v44.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformRotate(&v46, &v44, v21);
    long long v25 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v25;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
    long long v26 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v43.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v43.c = v26;
    *(_OWORD *)&v43.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v46, &v43, -(v13 * 0.5), -(v15 * 0.5));
    long long v27 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
  }
  if ([(OADOrientedBounds *)self->super.super._orientedBounds flipX])
  {
    long long v28 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v42.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v42.c = v28;
    *(_OWORD *)&v42.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v46, &v42, -1.0, 1.0);
    long long v29 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v29;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
    long long v30 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v41.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v41.c = v30;
    *(_OWORD *)&v41.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformTranslate(&v46, &v41, -v13, 0.0);
    long long v31 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v31;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
  }
  result = (CGAffineTransform *)[(OADOrientedBounds *)self->super.super._orientedBounds flipY];
  if (result)
  {
    long long v33 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v40.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v40.c = v33;
    *(_OWORD *)&v40.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformScale(&v46, &v40, 1.0, -1.0);
    long long v34 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v34;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
    long long v35 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v39.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v39.c = v35;
    *(_OWORD *)&v39.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformTranslate(&v46, &v39, 0.0, -v15);
    long long v36 = *(_OWORD *)&v46.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v46.a;
    *(_OWORD *)&retstr->c = v36;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v46.tx;
  }
  return result;
}

- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3
{
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, a3, 0.0, 0.0);
  if ([(OADPath *)self->_path elementCount])
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    while (1)
    {
      double v8 = [(OADPath *)self->_path elementAtIndex:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      long long v9 = *(_OWORD *)&a3->c;
      v12[0] = *(_OWORD *)&a3->a;
      v12[1] = v9;
      v12[2] = *(_OWORD *)&a3->tx;
      [(CMFreeFormShapeBuilder *)self _renderPathElement:v8 withTransform:v12 inPath:Mutable];

      uint64_t v6 = v7;
      if ([(OADPath *)self->_path elementCount] <= v7++) {
        return Mutable;
      }
    }
    CGPathCloseSubpath(Mutable);
  }
  return Mutable;
}

- (CGPoint)_renderPathElement:(id)a3 withTransform:(CGAffineTransform *)a4 inPath:(CGPath *)a5
{
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v11 = (unint64_t)[v10 toPoint] >> 32;
    p_space = &self->_space;
    double width = p_space->width;
    [v10 toPoint];
    double v5 = (double)v11 / width;
    double v6 = (double)v14 / p_space->height;
    CGPathMoveToPoint(a5, a4, v5, v6);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = (unint64_t)[v10 toPoint] >> 32;
      double v18 = self->_space.width;
      [v10 toPoint];
      double v5 = (double)v17 / v18;
      double v6 = (double)v19 / self->_space.height;
      if ([v10 relative])
      {
        CGPoint CurrentPoint = CGPathGetCurrentPoint(a5);
        double v5 = v5 + CurrentPoint.x;
        double v6 = v6 + CurrentPoint.y;
        CGPathAddLineToPoint(a5, 0, v5, v6);
      }
      else
      {
        CGPathAddLineToPoint(a5, a4, v5, v6);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v21 = (unint64_t)[v10 toPoint] >> 32;
        long long v22 = &self->_space;
        double v23 = v22->width;
        [v10 toPoint];
        double v5 = (double)v21 / v23;
        double v6 = (double)v24 / v22->height;
        CGPathAddLineToPoint(a5, a4, v5, v6);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v25 = (unint64_t)[v10 toPoint] >> 32;
          long long v26 = &self->_space;
          double v27 = self->_space.width;
          [v10 toPoint];
          int v29 = v28;
          double height = v26->height;
          int v31 = (unint64_t)[v10 controlPoint1] >> 32;
          double v32 = v26->width;
          [v10 controlPoint1];
          int v34 = v33;
          double v35 = v26->height;
          int v36 = (unint64_t)[v10 controlPoint2] >> 32;
          double v37 = v26->width;
          [v10 controlPoint2];
          double v5 = (double)v25 / v27;
          double v6 = (double)v29 / height;
          CGPathAddCurveToPoint(a5, a4, (double)v31 / v32, (double)v34 / v35, (double)v36 / v37, (double)v38 / v26->height, v5, v6);
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v39 = (unint64_t)[v10 toPoint] >> 32;
            CGAffineTransform v40 = &self->_space;
            double v41 = self->_space.width;
            [v10 toPoint];
            int v43 = v42;
            double v44 = v40->height;
            int v45 = (unint64_t)[v10 controlPoint] >> 32;
            double v46 = v40->width;
            [v10 controlPoint];
            double v5 = (double)v39 / v41;
            double v6 = (double)v43 / v44;
            CGPathAddQuadCurveToPoint(a5, a4, (double)v45 / v46, (double)v47 / v40->height, v5, v6);
          }
        }
      }
    }
  }

  double v15 = v5;
  double v16 = v6;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void).cxx_destruct
{
}

@end