@interface GQDArcPath
- (CGPath)createBezierPath;
- (CGSize)size;
- (double)arcWidth;
- (double)arrowLength;
- (double)arrowWidth;
- (double)headAngle;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
@end

@implementation GQDArcPath

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)headAngle
{
  return self->mHeadAngle;
}

- (double)arcWidth
{
  return self->mArcWidth;
}

- (double)arrowWidth
{
  return self->mArrowWidth;
}

- (double)arrowLength
{
  return self->mArrowLength;
}

- (CGPath)createBezierPath
{
  [(GQDArcPath *)self size];
  if (v3 == 0.0 && v4 == 0.0) {
    return 0;
  }
  if (v3 == 0.0 || v4 == 0.0)
  {
    if (v3 == 0.0) {
      double v28 = 0.0;
    }
    else {
      double v28 = v3;
    }
    if (v3 == 0.0) {
      double v29 = v4;
    }
    else {
      double v29 = 0.0;
    }
    Mutable = CGPathCreateMutable();
    CGPathMoveToPoint(Mutable, 0, 0.0, 0.0);
    CGPathAddLineToPoint(Mutable, 0, v28, v29);
  }
  else
  {
    [(GQDArcPath *)self size];
    double v7 = v6;
    double v31 = v8;
    float v9 = v6;
    CGFloat v10 = (float)(v9 * 0.5);
    [(GQDArcPath *)self arcWidth];
    float v12 = v11 * 0.5;
    float v13 = (float)(v9 * 0.5) - v12;
    [(GQDArcPath *)self headAngle];
    float v15 = v14 * 0.0174532925;
    v16 = CGPathCreateMutable();
    CGPathMoveToPoint(v16, 0, (float)(v9 - v12), v10);
    CGPathAddArc(v16, 0, v10, v10, (float)((float)(v9 * 0.5) + v12), 0.0, v15, 0);
    [(GQDArcPath *)self arrowWidth];
    *(float *)&double v17 = v17;
    sub_4D9C4(&v36, *(float *)&v17, v15);
    CGPoint CurrentPoint = CGPathGetCurrentPoint(v16);
    double v34 = sub_4D9B8(CurrentPoint.x, CurrentPoint.y, v36);
    CGFloat v35 = v19;
    CGPathAddLineToPoint(v16, 0, v34, v19);
    [(GQDArcPath *)self arrowLength];
    *(float *)&double v20 = v20;
    float v21 = v15 + 1.57079633;
    sub_4D9C4(&v36, *(float *)&v20, v21);
    sub_4D9C4(&v34, v9 * 0.5, v15);
    double v22 = sub_4D9B8(v10, v10, v34);
    double v34 = sub_4D9B8(v22, v23, v36);
    CGFloat v35 = v24;
    CGPathAddLineToPoint(v16, 0, v34, v24);
    [(GQDArcPath *)self arrowWidth];
    *(float *)&double v25 = v13 - v25;
    sub_4D9C4(&v36, *(float *)&v25, v15);
    double v34 = sub_4D9B8(v10, v10, v36);
    CGFloat v35 = v26;
    CGPathAddLineToPoint(v16, 0, v34, v26);
    sub_4D9C4(&v36, v13, v15);
    double v34 = sub_4D9B8(v10, v10, v36);
    CGFloat v35 = v27;
    CGPathAddLineToPoint(v16, 0, v34, v27);
    CGPathAddArc(v16, 0, v10, v10, v13, v15, 0.0, 1);
    CGPathCloseSubpath(v16);
    memset(&v33, 0, sizeof(v33));
    CGAffineTransformMakeScale(&v33, 1.0, v31 / v7);
    CGAffineTransform v32 = v33;
    Mutable = sub_4DA0C(v16, (long long *)&v32);
    CGPathRelease(v16);
  }
  return Mutable;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  if (!sub_43164(a3, qword_A35E8, (xmlChar *)"headAngle", &self->mHeadAngle)
    || !sub_43164(a3, qword_A35E8, (xmlChar *)"arcWidth", &self->mArcWidth))
  {
    return 3;
  }
  int v6 = 3;
  if (sub_43164(a3, qword_A35E8, (xmlChar *)"arrowWidth", &self->mArrowWidth))
  {
    if (sub_43164(a3, qword_A35E8, (xmlChar *)"arrowLength", &self->mArrowLength)) {
      return 1;
    }
    else {
      return 3;
    }
  }
  return v6;
}

@end