@interface CMLineShapeBuilder
- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3;
- (CGRect)_boundingBoxForLineEnd:(id)a3;
- (float)_adjustedCoefAtIndex:(int)a3;
- (float)_getRotationFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 withBounds:(id)a5;
- (void)_renderBentConnector2InPath:(CGPath *)a3 withTransform:(CGAffineTransform *)a4 andOrientedBounds:(id)a5 headSrc:(CGPoint *)a6 headDst:(CGPoint *)a7 tailSrc:(CGPoint *)a8 tailDst:(CGPoint *)a9;
- (void)_renderBentConnector3InPath:(CGPath *)a3 withTransform:(CGAffineTransform *)a4 andOrientedBounds:(id)a5 headSrc:(CGPoint *)a6 headDst:(CGPoint *)a7 tailSrc:(CGPoint *)a8 tailDst:(CGPoint *)a9;
- (void)_renderLineEnd:(id)a3 atPoint:(CGPoint)a4 withOrientation:(float)a5 inPath:(CGPath *)a6;
- (void)_renderStraightConnector1InPath:(CGPath *)a3 withTransform:(CGAffineTransform *)a4 andOrientedBounds:(id)a5 headSrc:(CGPoint *)a6 headDst:(CGPoint *)a7 tailSrc:(CGPoint *)a8 tailDst:(CGPoint *)a9;
- (void)setStroke:(id)a3;
@end

@implementation CMLineShapeBuilder

- (void)setStroke:(id)a3
{
}

- (CGPath)copyShapeWithTransform:(CGAffineTransform *)a3
{
  Mutable = CGPathCreateMutable();
  int type = self->super._type;
  if (type == 34)
  {
    long long v8 = *(_OWORD *)&a3->c;
    v29[0] = *(_OWORD *)&a3->a;
    v29[1] = v8;
    v29[2] = *(_OWORD *)&a3->tx;
    [(CMLineShapeBuilder *)self _renderBentConnector3InPath:Mutable withTransform:v29 andOrientedBounds:self->super._orientedBounds headSrc:&v37 headDst:&v35 tailSrc:&v33 tailDst:&v31];
  }
  else
  {
    long long v7 = *(_OWORD *)&a3->c;
    if (type == 33)
    {
      v30[0] = *(_OWORD *)&a3->a;
      v30[1] = v7;
      v30[2] = *(_OWORD *)&a3->tx;
      [(CMLineShapeBuilder *)self _renderBentConnector2InPath:Mutable withTransform:v30 andOrientedBounds:self->super._orientedBounds headSrc:&v37 headDst:&v35 tailSrc:&v33 tailDst:&v31];
    }
    else
    {
      v28[0] = *(_OWORD *)&a3->a;
      v28[1] = v7;
      v28[2] = *(_OWORD *)&a3->tx;
      [(CMLineShapeBuilder *)self _renderStraightConnector1InPath:Mutable withTransform:v28 andOrientedBounds:self->super._orientedBounds headSrc:&v37 headDst:&v35 tailSrc:&v33 tailDst:&v31];
    }
  }
  double a = a3->a;
  double b = a3->b;
  double c = a3->c;
  double d = a3->d;
  double tx = a3->tx;
  double ty = a3->ty;
  double v15 = ty + v38 * d + b * v37;
  double v37 = tx + v38 * c + a3->a * v37;
  double v38 = v15;
  double v16 = ty + d * v36 + b * v35;
  double v35 = tx + c * v36 + a * v35;
  double v36 = v16;
  double v17 = v33;
  double v33 = tx + c * v34 + a * v33;
  double v34 = ty + d * v34 + b * v17;
  double v18 = ty + d * v32 + b * v31;
  double v31 = tx + c * v32 + a * v31;
  double v32 = v18;
  -[CMLineShapeBuilder _getRotationFromPoint:toPoint:withBounds:](self, "_getRotationFromPoint:toPoint:withBounds:", self->super._orientedBounds);
  int v20 = v19;
  v21 = [(OADStroke *)self->_stroke head];
  LODWORD(v22) = v20;
  -[CMLineShapeBuilder _renderLineEnd:atPoint:withOrientation:inPath:](self, "_renderLineEnd:atPoint:withOrientation:inPath:", v21, Mutable, v35, v36, v22);

  -[CMLineShapeBuilder _getRotationFromPoint:toPoint:withBounds:](self, "_getRotationFromPoint:toPoint:withBounds:", self->super._orientedBounds, v33, v34, v31, v32);
  int v24 = v23;
  v25 = [(OADStroke *)self->_stroke tail];
  LODWORD(v26) = v24;
  -[CMLineShapeBuilder _renderLineEnd:atPoint:withOrientation:inPath:](self, "_renderLineEnd:atPoint:withOrientation:inPath:", v25, Mutable, v31, v32, v26);

  return Mutable;
}

- (void)_renderStraightConnector1InPath:(CGPath *)a3 withTransform:(CGAffineTransform *)a4 andOrientedBounds:(id)a5 headSrc:(CGPoint *)a6 headDst:(CGPoint *)a7 tailSrc:(CGPoint *)a8 tailDst:(CGPoint *)a9
{
  id v19 = a5;
  [v19 rotation];
  BOOL v14 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  int v15 = [v19 flipX];
  int v16 = v15 ^ [v19 flipY];
  if ((v14 & v16) != 0) {
    double v17 = 0.0;
  }
  else {
    double v17 = 10.0;
  }
  if ((v14 & v16) != 0) {
    double v18 = 10.0;
  }
  else {
    double v18 = 0.0;
  }
  CGPathMoveToPoint(a3, a4, v17, v18);
  CGPathAddLineToPoint(a3, a4, v18, v17);
  a9->x = v18;
  a9->y = v17;
  a8->x = v17;
  a8->y = v18;
  a6->x = v18;
  a6->y = v17;
  a7->x = v17;
  a7->y = v18;
}

- (float)_getRotationFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4 withBounds:(id)a5
{
  double x = a4.x;
  double v6 = a3.x;
  double v7 = a4.x - a3.x;
  if (v7 == 0.0) {
    double v8 = dbl_238EF1500[a3.y > a4.y];
  }
  else {
    double v8 = atan((a4.y - a3.y) / v7);
  }
  float result = v8;
  if (x < v6) {
    return result + 3.14159265;
  }
  return result;
}

- (void)_renderLineEnd:(id)a3 atPoint:(CGPoint)a4 withOrientation:(float)a5 inPath:(CGPath *)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  id v11 = a3;
  if (v11)
  {
    [(CMLineShapeBuilder *)self _boundingBoxForLineEnd:v11];
    CGFloat v12 = v43.origin.x;
    CGFloat v13 = v43.origin.y;
    CGFloat width = v43.size.width;
    CGFloat height = v43.size.height;
    double v16 = CGRectGetWidth(v43);
    v44.origin.CGFloat x = v12;
    v44.origin.CGFloat y = v13;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    double v17 = CGRectGetHeight(v44);
    memset(&v41, 0, sizeof(v41));
    CGAffineTransformMakeTranslation(&v41, x, y);
    CGAffineTransform v39 = v41;
    CGAffineTransformScale(&v40, &v39, 1.66666663, 1.66666663);
    CGAffineTransform v41 = v40;
    CGAffineTransform v38 = v40;
    CGAffineTransformRotate(&v40, &v38, a5 + 1.57079633);
    CGAffineTransform v41 = v40;
    CGAffineTransform v37 = v40;
    CGAffineTransformScale(&v40, &v37, 1.0, -1.0);
    CGAffineTransform v41 = v40;
    int v18 = [v11 type] - 1;
    float v19 = v16;
    float v20 = v17;
    float v21 = v19 * 0.5;
    switch(v18)
    {
      case 0:
        CGAffineTransformMakeTranslation(&m, 0.0, (float)-v20);
        CGAffineTransform t1 = m;
        CGAffineTransform t2 = v41;
        CGAffineTransformConcat(&v40, &t1, &t2);
        CGAffineTransform m = v40;
        CGPathMoveToPoint(a6, &m, v21, 0.0);
        double v22 = 0.0;
        CGPathAddLineToPoint(a6, &m, 0.0, v20);
        double v23 = (float)-v21;
        goto LABEL_7;
      case 1:
        CGAffineTransformMakeTranslation(&m, 0.0, (float)(v20 / -3.0));
        CGAffineTransform v34 = m;
        CGAffineTransform v33 = v41;
        CGAffineTransformConcat(&v40, &v34, &v33);
        CGAffineTransform m = v40;
        CGPathMoveToPoint(a6, &m, v21, 0.0);
        CGPathAddLineToPoint(a6, &m, 0.0, v20);
        double v23 = 0.0;
        CGPathAddLineToPoint(a6, &m, (float)-v21, 0.0);
        float v24 = v20 / 3.0;
        goto LABEL_6;
      case 2:
        CGAffineTransform m = v41;
        CGPathMoveToPoint(a6, &m, v21, 0.0);
        CGPathAddLineToPoint(a6, &m, 0.0, (float)(v20 * 0.5));
        double v23 = 0.0;
        CGPathAddLineToPoint(a6, &m, (float)-v21, 0.0);
        float v24 = -(float)(v20 * 0.5);
LABEL_6:
        double v22 = v24;
LABEL_7:
        CGPathAddLineToPoint(a6, &m, v23, v22);
        CGPathCloseSubpath(a6);
        break;
      case 3:
        CGAffineTransform m = v41;
        v45.origin.CGFloat x = (float)(v19 * -0.5);
        v45.origin.CGFloat y = (float)(v20 * -0.5);
        v45.size.CGFloat width = v19;
        v45.size.CGFloat height = v20;
        CGPathAddEllipseInRect(a6, &m, v45);
        break;
      case 4:
        float v25 = atanf((float)(sqrtf((float)((float)(v20 + (float)(v20 * -0.5)) + -0.5) + (float)(v21 * (float)(v21 + -1.0)))- (float)(v20 + -0.5))/ (float)(v21 + -1.0));
        float v26 = v25 + v25;
        float v27 = sinf(v25 + v25);
        float v28 = v20 + (float)(-1.0 / v27);
        CGAffineTransformMakeTranslation(&m, 0.0, (float)-v28);
        CGAffineTransform v32 = m;
        CGAffineTransform v31 = v41;
        CGAffineTransformConcat(&v40, &v32, &v31);
        CGAffineTransform m = v40;
        CGPathMoveToPoint(a6, &m, 0.0, v20);
        float v29 = v21 + -0.5;
        float v30 = cosf(v26);
        CGPathAddLineToPoint(a6, &m, (float)(v29 + (float)(v30 * 0.5)), (float)((float)(v27 * 0.5) + 0.5));
        CGPathAddLineToPoint(a6, &m, 0.0, v28);
        CGPathAddLineToPoint(a6, &m, (float)-(float)(v29 + (float)(v30 * -0.5)), (float)((float)(v27 * -0.5) + 0.5));
        CGPathCloseSubpath(a6);
        break;
      default:
        break;
    }
  }
}

- (CGRect)_boundingBoxForLineEnd:(id)a3
{
  id v3 = a3;
  if ([v3 type] == 5) {
    v4 = (float *)&-[CMLineShapeBuilder _boundingBoxForLineEnd:]::openEndArrowSizes;
  }
  else {
    v4 = (float *)&-[CMLineShapeBuilder _boundingBoxForLineEnd:]::arrowSizes;
  }
  unsigned int v5 = [v3 width];
  unsigned int v6 = [v3 length];
  if (v5 >= 3) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = v5;
  }
  float v8 = v4[v7];
  if (v6 >= 3) {
    unsigned int v9 = 0;
  }
  else {
    unsigned int v9 = v6;
  }
  float v10 = v4[v9];
  int v11 = [v3 type];
  float v12 = 0.0;
  if (v11 == 4) {
    float v12 = v10 * 0.5;
  }
  if (v11 == 3) {
    float v12 = v10 * 0.5;
  }
  double v13 = (float)(v12 - v10);

  double v14 = (float)(v8 * -0.5);
  double v15 = v13;
  double v16 = v8;
  double v17 = v10;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)_renderBentConnector3InPath:(CGPath *)a3 withTransform:(CGAffineTransform *)a4 andOrientedBounds:(id)a5 headSrc:(CGPoint *)a6 headDst:(CGPoint *)a7 tailSrc:(CGPoint *)a8 tailDst:(CGPoint *)a9
{
  id v24 = a5;
  [v24 rotation];
  BOOL v15 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  int v16 = [v24 flipX];
  int v17 = [v24 flipY];
  [(CMLineShapeBuilder *)self _adjustedCoefAtIndex:0];
  int v19 = v16 ^ v17;
  if ((v15 & (v16 ^ v17)) != 0) {
    double v20 = 10.0;
  }
  else {
    double v20 = 0.0;
  }
  if ((v15 & v19) != 0) {
    double v21 = 0.0;
  }
  else {
    double v21 = 10.0;
  }
  if ((v15 & v19) != 0) {
    float v22 = 1.0 - v18;
  }
  else {
    float v22 = v18;
  }
  CGPathMoveToPoint(a3, a4, v21, v20);
  CGFloat v23 = v22 * 10.0;
  CGPathAddLineToPoint(a3, a4, v23, v20);
  CGPathAddLineToPoint(a3, a4, v23, v21);
  CGPathAddLineToPoint(a3, a4, v20, v21);
  a7->CGFloat x = v21;
  a7->CGFloat y = v20;
  a6->CGFloat x = v23;
  a6->CGFloat y = v20;
  a8->CGFloat x = v23;
  a8->CGFloat y = v21;
  a9->CGFloat x = v20;
  a9->CGFloat y = v21;
}

- (float)_adjustedCoefAtIndex:(int)a3
{
  adjustValues = self->super._adjustValues;
  unsigned int v5 = [NSNumber numberWithInt:*(void *)&a3];
  unsigned int v6 = [(NSDictionary *)adjustValues objectForKey:v5];

  if (v6)
  {
    [v6 floatValue];
    float v8 = v7;
    [(CMShapeBuilder *)self maxAdjustedValue];
    float v10 = v8 / (float)(v9 + v9);
  }
  else
  {
    float v10 = 0.5;
  }

  return v10;
}

- (void)_renderBentConnector2InPath:(CGPath *)a3 withTransform:(CGAffineTransform *)a4 andOrientedBounds:(id)a5 headSrc:(CGPoint *)a6 headDst:(CGPoint *)a7 tailSrc:(CGPoint *)a8 tailDst:(CGPoint *)a9
{
  id v19 = a5;
  [v19 rotation];
  BOOL v14 = +[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:");
  int v15 = [v19 flipX];
  int v16 = v15 ^ [v19 flipY];
  if ((v14 & v16) != 0) {
    double v17 = 10.0;
  }
  else {
    double v17 = 0.0;
  }
  if ((v14 & v16) != 0) {
    double v18 = 0.0;
  }
  else {
    double v18 = 10.0;
  }
  CGPathMoveToPoint(a3, a4, v17, v18);
  CGPathAddLineToPoint(a3, a4, v18, v18);
  CGPathAddLineToPoint(a3, a4, v18, v17);
  a9->CGFloat x = v17;
  a9->CGFloat y = v18;
  a8->CGFloat x = v18;
  a8->CGFloat y = v18;
  a6->CGFloat x = v18;
  a6->CGFloat y = v18;
  a7->CGFloat x = v18;
  a7->CGFloat y = v17;
}

- (void).cxx_destruct
{
}

@end