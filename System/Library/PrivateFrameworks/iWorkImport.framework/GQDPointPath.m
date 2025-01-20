@interface GQDPointPath
- (CGPath)createBezierPath;
- (CGPoint)point;
- (CGSize)size;
- (int)mapStrType:(__CFString *)a3;
- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4;
- (int)type;
@end

@implementation GQDPointPath

- (int)type
{
  return self->mType;
}

- (CGPoint)point
{
  double x = self->mPoint.x;
  double y = self->mPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
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
  [(GQDPointPath *)self size];
  double v4 = v3;
  double v6 = v5;
  int v7 = [(GQDPointPath *)self type];
  [(GQDPointPath *)self point];
  double v9 = v8;
  [(GQDPointPath *)self point];
  if (v4 == 0.0 && v6 == 0.0) {
    return 0;
  }
  if (v4 != 0.0 && v6 != 0.0)
  {
    v11 = 0;
    double v12 = v6 * v10;
    if (v7 <= 9)
    {
      if (v7)
      {
        if (v7 != 1) {
          return v11;
        }
        v35.a = 0.0;
        v35.b = v6 * v10;
        v35.c = v4 - v9;
        v35.d = v6 * v10;
        v35.tdouble x = v4 - v9;
        v35.tdouble y = 0.0;
        double v36 = v4;
        tdouble y = v6 * 0.5;
        double v38 = v4 - v9;
        double v39 = v6;
        double v21 = v6 - v12;
        double v40 = v4 - v9;
        double v41 = v21;
        double v42 = 0.0;
      }
      else
      {
        v35.a = v4;
        v35.b = v6 * v10;
        v35.c = v9;
        v35.d = v6 * v10;
        *(_OWORD *)&v35.tdouble x = *(unint64_t *)&v9;
        double v36 = 0.0;
        tdouble y = v6 * 0.5;
        double v38 = v9;
        double v21 = v6 - v12;
        double v39 = v6;
        double v40 = v9;
        double v41 = v21;
        double v42 = v4;
      }
      double v43 = v21;
      Mutable = CGPathCreateMutable();
      v11 = Mutable;
      size_t v20 = 7;
    }
    else
    {
      switch(v7)
      {
        case 10:
          v35.a = 0.0;
          v35.b = v6 * 0.5;
          *(_OWORD *)&v35.c = *(unint64_t *)&v9;
          v35.tdouble x = v9;
          v35.tdouble y = v6 * v10;
          double v36 = v4 - v9;
          tdouble y = v6 * v10;
          double v38 = v4 - v9;
          double v39 = 0.0;
          double v40 = v4;
          double v41 = v6 * 0.5;
          double v42 = v4 - v9;
          double v43 = v6;
          double v44 = v4 - v9;
          double v45 = v6 - v12;
          unint64_t v46 = *(void *)&v9;
          double v47 = v6 - v12;
          double v48 = v9;
          double v49 = v6;
          Mutable = CGPathCreateMutable();
          v11 = Mutable;
          size_t v20 = 10;
          break;
        case 100:
          double y = NSZeroRect.origin.y;
          memset(&v35, 0, sizeof(v35));
          [(GQDPointPath *)self point];
          int v24 = (int)v23;
          [(GQDPointPath *)self point];
          double v26 = v25;
          v11 = CGPathCreateMutable();
          CGPathMoveToPoint(v11, &v35, 6.123234e-17, -1.0);
          if (v24 >= 1)
          {
            float v27 = v26;
            float v28 = (float)v24;
            int v29 = 1;
            do
            {
              float v30 = ((float)((float)v29 / v28) + -0.5) * 3.14159265;
              __float2 v31 = __sincosf_stret(v30);
              CGPathAddLineToPoint(v11, &v35, (float)(v31.__cosval * v27), (float)(v31.__sinval * v27));
              float v32 = ((float)((float)(v29 + 1) / v28) + -0.5) * 3.14159265;
              __float2 v33 = __sincosf_stret(v32);
              CGPathAddLineToPoint(v11, &v35, v33.__cosval, v33.__sinval);
              v29 += 2;
              --v24;
            }
            while (v24);
          }
          goto LABEL_26;
        case 200:
          [(GQDPointPath *)self point];
          *(float *)&double v13 = (v4 - v13) * 0.5;
          float v14 = v4;
          *(double *)&unint64_t v15 = sub_506BC(*(float *)&v13, 0.0, v14);
          [(GQDPointPath *)self point];
          float v17 = (v6 - v16) * 0.5;
          float v18 = v6;
          *(_OWORD *)&v35.a = v15;
          v35.c = v4 - *(double *)&v15;
          v35.d = 0.0;
          v35.tdouble x = v4 - *(double *)&v15;
          v35.tdouble y = sub_506BC(v17, 0.0, v18);
          double v36 = v4;
          tdouble y = v35.ty;
          double v38 = v4;
          double v39 = v6 - v35.ty;
          double v40 = v4 - *(double *)&v15;
          double v41 = v6 - v35.ty;
          double v42 = v4 - *(double *)&v15;
          double v43 = v6;
          double v44 = *(double *)&v15;
          double v45 = v6;
          unint64_t v46 = v15;
          double v47 = v6 - v35.ty;
          double v48 = 0.0;
          double v49 = v6 - v35.ty;
          uint64_t v50 = 0;
          double v51 = v35.ty;
          unint64_t v52 = v15;
          double v53 = v35.ty;
          unint64_t v54 = v15;
          uint64_t v55 = 0;
          Mutable = CGPathCreateMutable();
          v11 = Mutable;
          size_t v20 = 13;
          break;
        default:
          return v11;
      }
    }
    CGPathAddLines(Mutable, 0, (const CGPoint *)&v35, v20);
LABEL_26:
    CGPathCloseSubpath(v11);
    return v11;
  }
  if (v4 == 0.0) {
    double v4 = 0.0;
  }
  else {
    double v6 = 0.0;
  }
  v11 = CGPathCreateMutable();
  CGPathMoveToPoint(v11, 0, 0.0, 0.0);
  CGPathAddLineToPoint(v11, 0, v4, v6);
  return v11;
}

- (int)readAttributesFromReader:(_xmlTextReader *)a3 processor:(id)a4
{
  double v5 = sub_4340C(a3, qword_A35E8, (xmlChar *)"type");
  if (!v5) {
    return 3;
  }
  double v6 = v5;
  self->mType = [(GQDPointPath *)self mapStrType:v5];
  CFRelease(v6);
  return 1;
}

- (int)mapStrType:(__CFString *)a3
{
  if (CFStringCompare(a3, @"left", 1uLL) == kCFCompareEqualTo) {
    return 0;
  }
  int v4 = 1;
  if (CFStringCompare(a3, @"right", 1uLL))
  {
    if (CFStringCompare(a3, @"double", 1uLL))
    {
      if (CFStringCompare(a3, @"star", 1uLL))
      {
        if (CFStringCompare(a3, @"plus", 1uLL)) {
          return -1;
        }
        else {
          return 200;
        }
      }
      else
      {
        return 100;
      }
    }
    else
    {
      return 10;
    }
  }
  return v4;
}

@end