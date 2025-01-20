@interface GQDCallout2Path
- (BOOL)tailAtCenter;
- (CGPath)createBezierPath;
- (CGPoint)tailCenter;
- (CGPoint)tailPosition;
- (CGSize)size;
- (double)cornerRadius;
- (double)tailSize;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
@end

@implementation GQDCallout2Path

- (CGPoint)tailCenter
{
  if (self->mTailAtCenter)
  {
    double x = self->mSize.width * 0.5;
    double y = self->mSize.height * 0.5;
  }
  else
  {
    double x = self->mTailPosition.x;
    double mCornerRadius = self->mCornerRadius;
    if (x <= mCornerRadius || x >= self->mSize.width - mCornerRadius)
    {
      double y = self->mTailPosition.y;
      if (y <= mCornerRadius || y >= self->mSize.height - mCornerRadius)
      {
        BOOL v5 = x > mCornerRadius;
        double x = self->mCornerRadius;
        if (v5) {
          double x = self->mSize.width - mCornerRadius;
        }
        if (y <= mCornerRadius) {
          double y = self->mCornerRadius;
        }
        else {
          double y = self->mSize.height - mCornerRadius;
        }
      }
      else
      {
        double x = self->mSize.width * 0.5;
      }
    }
    else
    {
      double y = self->mSize.height * 0.5;
    }
  }
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPath)createBezierPath
{
  [(GQDCallout2Path *)self size];
  double v4 = v3;
  double v6 = v5;
  double y = CGPointZero.y;
  double mCornerRadius = self->mCornerRadius;
  float v9 = sub_50500(CGPointZero.x, y, 0.0, v5);
  float v10 = sub_50500(CGPointZero.x, y, v4, 0.0);
  Mutable = CGPathCreateMutable();
  v12 = Mutable;
  if (v6 >= v4) {
    double v13 = v4;
  }
  else {
    double v13 = v6;
  }
  if (self->mCornerRadius >= v13 * 0.5)
  {
    v74.origin.double x = 0.0;
    v74.origin.double y = 0.0;
    v74.size.width = v4;
    v74.size.height = v6;
    CGPathAddEllipseInRect(Mutable, 0, v74);
  }
  else
  {
    double v14 = v10 * 0.5;
    if (v9 * 0.5 < v14) {
      double v14 = v9 * 0.5;
    }
    if (mCornerRadius < v14) {
      double v14 = mCornerRadius;
    }
    float v15 = v14;
    double v16 = v15;
    double v17 = sub_4D9B8(0.0, v6, 0.0);
    CGPathMoveToPoint(v12, 0, v17, v18);
    double v19 = sub_4D9B8(CGPointZero.x, y, v16);
    CGPathAddArcToPoint(v12, 0, CGPointZero.x, y, v19, v20, v16);
    double v21 = sub_5051C(v4, 0.0, 0.0);
    CGPathAddArcToPoint(v12, 0, v4, 0.0, v21, v22, v16);
    double v23 = sub_5051C(v4, v6, v16);
    CGPathAddArcToPoint(v12, 0, v4, v6, v23, v24, v16);
    double v25 = sub_4D9B8(0.0, v6, 0.0);
    CGPathAddArcToPoint(v12, 0, 0.0, v6, v25, v26, v16);
  }
  CGPathCloseSubpath(v12);
  p_mTailPosition = &self->mTailPosition;
  if (!CGPathContainsPoint(v12, 0, self->mTailPosition, 1))
  {
    [(GQDCallout2Path *)self tailCenter];
    double v30 = v28;
    double v31 = v29;
    float mTailSize = self->mTailSize;
    if (!self->mTailAtCenter)
    {
      float v33 = sub_50500(p_mTailPosition->x, self->mTailPosition.y, v28, v29);
      float mTailSize = (float)(v33 / sub_50500(p_mTailPosition->x, self->mTailPosition.y, v4 * 0.5, v6 * 0.5)) * mTailSize;
    }
    double v34 = sub_5051C(p_mTailPosition->x, self->mTailPosition.y, v30);
    double v36 = sub_50558(v34, v35);
    double v38 = sub_50528(v36, v37, mTailSize);
    double v40 = sub_50538(1, v38, v39);
    CGPoint v71 = *p_mTailPosition;
    double x = p_mTailPosition->x;
    double v42 = self->mTailPosition.y;
    double v43 = sub_4D9B8(v30, v31, v40);
    double v45 = sub_5051C(v43, v44, p_mTailPosition->x);
    double v47 = sub_50528(v45, v46, 20.0);
    double v72 = sub_4D9B8(x, v42, v47);
    uint64_t v73 = v48;
    CGPoint v68 = *p_mTailPosition;
    double v49 = p_mTailPosition->x;
    double v50 = self->mTailPosition.y;
    double v51 = sub_5051C(v30, v31, v40);
    double v53 = sub_5051C(v51, v52, p_mTailPosition->x);
    double v55 = sub_50528(v53, v54, 20.0);
    double v69 = sub_4D9B8(v49, v50, v55);
    uint64_t v70 = v56;
    double v57 = sub_50B20(v12, &v71.x);
    CGFloat v59 = v58;
    double v60 = sub_50B20(v12, &v68.x);
    CGFloat v62 = v61;
    v63 = CGPathCreateMutable();
    CGPathMoveToPoint(v63, 0, v57, v59);
    CGPathAddLineToPoint(v63, 0, p_mTailPosition->x, p_mTailPosition->y);
    CGPathAddLineToPoint(v63, 0, v60, v62);
    v67[0] = v12;
    v67[1] = v63;
    CFArrayRef v64 = CFArrayCreate(0, v67, 2, &kCFTypeArrayCallBacks);
    v65 = sub_51888(v64);
    CFRelease(v64);
    CFRelease(v12);
    CFRelease(v63);
    return v65;
  }
  return v12;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)cornerRadius
{
  return self->mCornerRadius;
}

- (CGPoint)tailPosition
{
  double x = self->mTailPosition.x;
  double y = self->mTailPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)tailSize
{
  return self->mTailSize;
}

- (BOOL)tailAtCenter
{
  return self->mTailAtCenter;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  if (!sub_43164(a3, qword_A35E8, (xmlChar *)"cornerRadius", &self->mCornerRadius)) {
    return 3;
  }
  sub_4338C(a3, qword_A35E8, (xmlChar *)"tailPositionX", &self->mTailPosition.x);
  if (!v6) {
    return 3;
  }
  sub_4338C(a3, qword_A35E8, (xmlChar *)"tailPositionY", &self->mTailPosition.y);
  if (!v7) {
    return 3;
  }
  int v8 = 3;
  if (sub_43164(a3, qword_A35E8, (xmlChar *)"tailSize", &self->mTailSize))
  {
    if (sub_42C34(a3, qword_A35E8, (xmlChar *)"tailAtCenter", &self->mTailAtCenter)) {
      return 1;
    }
    else {
      return 3;
    }
  }
  return v8;
}

@end