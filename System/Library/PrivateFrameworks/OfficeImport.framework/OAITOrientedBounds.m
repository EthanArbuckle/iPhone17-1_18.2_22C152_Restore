@interface OAITOrientedBounds
+ (CGAffineTransform)transformFromBounds:(SEL)a3 toOrientedBounds:(CGRect)a4;
+ (CGRect)axisParallelBoundsOfOrientedBounds:(id)a3;
+ (float)scaleFactorFromLength:(float)a3 toLength:(float)a4;
+ (id)absoluteOrientedBoundsOfDrawable:(id)a3;
+ (id)absoluteOrientedBoundsWithRelativeOrientedBounds:(id)a3 parentOrientedBounds:(id)a4 parentLogicalBounds:(CGRect)a5;
+ (id)adjustedOrientedBoundsWithOrientedBounds:(id)a3;
+ (id)adjustedOrientedBoundsWithOrientedBounds:(id)a3 logicalBounds:(CGRect)a4;
+ (id)relativeOrientedBoundsOfDrawable:(id)a3;
+ (id)relativeOrientedBoundsWithAbsoluteOrientedBounds:(id)a3 parentOrientedBounds:(id)a4 parentLogicalBounds:(CGRect)a5;
@end

@implementation OAITOrientedBounds

+ (float)scaleFactorFromLength:(float)a3 toLength:(float)a4
{
  if (a3 != 0.0) {
    return a4 / a3;
  }
  float v4 = 1.0;
  if (a4 != 0.0) {
    return a4 / a3;
  }
  return v4;
}

+ (id)adjustedOrientedBoundsWithOrientedBounds:(id)a3 logicalBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = a3;
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  if (CGRectGetWidth(v31) == 0.0)
  {
    v32.origin.CGFloat x = v10;
    v32.origin.CGFloat y = v12;
    v32.size.CGFloat width = v14;
    v32.size.CGFloat height = v16;
    if (CGRectGetWidth(v32) > 0.0) {
      double v14 = 0.0;
    }
  }
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  if (CGRectGetHeight(v33) == 0.0)
  {
    v34.origin.CGFloat x = v10;
    v34.origin.CGFloat y = v12;
    v34.size.CGFloat width = v14;
    v34.size.CGFloat height = v16;
    if (CGRectGetHeight(v34) > 0.0) {
      double v16 = 0.0;
    }
  }
  [v8 bounds];
  v36.origin.CGFloat x = v17;
  v36.origin.CGFloat y = v18;
  v36.size.CGFloat width = v19;
  v36.size.CGFloat height = v20;
  v35.origin.CGFloat x = v10;
  v35.origin.CGFloat y = v12;
  v35.size.CGFloat width = v14;
  v35.size.CGFloat height = v16;
  if (CGRectEqualToRect(v35, v36))
  {
    v21 = (OADOrientedBounds *)v8;
  }
  else
  {
    v22 = [OADOrientedBounds alloc];
    [v8 rotation];
    int v24 = v23;
    uint64_t v25 = [v8 flipX];
    uint64_t v26 = [v8 flipY];
    LODWORD(v27) = v24;
    v21 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v22, "initWithBounds:rotation:flipX:flipY:", v25, v26, v10, v12, v14, v16, v27);
  }
  v28 = v21;

  return v28;
}

+ (id)absoluteOrientedBoundsOfDrawable:(id)a3
{
  id v4 = a3;
  v5 = [a1 relativeOrientedBoundsOfDrawable:v4];
  v6 = [v4 parent];
  v7 = v6;
  if (v6)
  {
    [v6 logicalBounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [a1 absoluteOrientedBoundsOfDrawable:v7];
  }
  else
  {
    double v13 = 1.0;
    double v9 = 0.0;
    double v16 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", 0.0, 0.0, 1.0, 1.0);
    double v11 = 0.0;
    double v15 = 1.0;
  }
  CGFloat v17 = objc_msgSend(a1, "absoluteOrientedBoundsWithRelativeOrientedBounds:parentOrientedBounds:parentLogicalBounds:", v5, v16, v9, v11, v13, v15);

  return v17;
}

+ (id)adjustedOrientedBoundsWithOrientedBounds:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  double x = v27.origin.x;
  double y = v27.origin.y;
  double width = v27.size.width;
  double height = v27.size.height;
  if (CGRectGetWidth(v27) == 0.0) {
    double width = 0.1;
  }
  v28.origin.double x = x;
  v28.origin.double y = y;
  v28.size.double width = width;
  v28.size.double height = height;
  double v8 = CGRectGetHeight(v28);
  [v3 bounds];
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  if (v8 == 0.0) {
    double height = 0.1;
  }
  v29.origin.double x = x;
  v29.origin.double y = y;
  v29.size.double width = width;
  v29.size.double height = height;
  if (CGRectEqualToRect(v29, *(CGRect *)&v10))
  {
    CGFloat v17 = (OADOrientedBounds *)v3;
  }
  else
  {
    CGFloat v18 = [OADOrientedBounds alloc];
    [v3 rotation];
    int v20 = v19;
    uint64_t v21 = [v3 flipX];
    uint64_t v22 = [v3 flipY];
    LODWORD(v23) = v20;
    CGFloat v17 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v18, "initWithBounds:rotation:flipX:flipY:", v21, v22, x, y, width, height, v23);
  }
  int v24 = v17;

  return v24;
}

+ (CGAffineTransform)transformFromBounds:(SEL)a3 toOrientedBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v11 = a5;
  v60.origin.CGFloat x = x;
  v60.origin.CGFloat y = y;
  v60.size.CGFloat width = width;
  v60.size.CGFloat height = height;
  CGFloat v12 = CGRectGetWidth(v60);
  [v11 bounds];
  CGFloat v13 = CGRectGetWidth(v61);
  float v14 = v12;
  *(float *)&double v15 = v13;
  *(float *)&CGFloat v13 = v14;
  [a2 scaleFactorFromLength:v13 toLength:v15];
  LODWORD(v12) = v16;
  v62.origin.CGFloat x = x;
  v62.origin.CGFloat y = y;
  v62.size.CGFloat width = width;
  v62.size.CGFloat height = height;
  CGFloat v17 = CGRectGetHeight(v62);
  [v11 bounds];
  CGFloat v18 = CGRectGetHeight(v63);
  float v19 = v17;
  *(float *)&double v20 = v18;
  *(float *)&CGFloat v18 = v19;
  [a2 scaleFactorFromLength:v18 toLength:v20];
  LODWORD(v17) = v21;
  double v22 = TSUCenterOfRect(x, y, width, height);
  double v24 = v23;
  [v11 bounds];
  double v29 = TSUCenterOfRect(v25, v26, v27, v28);
  CGFloat v31 = v30;
  uint64_t v32 = MEMORY[0x263F000D0];
  long long v33 = *MEMORY[0x263F000D0];
  long long v34 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v34;
  long long v35 = *(_OWORD *)(v32 + 32);
  *(_OWORD *)&retstr->tCGFloat x = v35;
  *(_OWORD *)&t1.a = v33;
  *(_OWORD *)&t1.c = v34;
  *(_OWORD *)&t1.tCGFloat x = v35;
  CGAffineTransformMakeTranslation(&t2, -v22, -v24);
  CGAffineTransformConcat(retstr, &t1, &t2);
  long long v36 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v56.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v56.c = v36;
  *(_OWORD *)&v56.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformMakeScale(&v55, *(float *)&v12, *(float *)&v17);
  CGAffineTransformConcat(&v57, &v56, &v55);
  long long v37 = *(_OWORD *)&v57.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
  *(_OWORD *)&retstr->c = v37;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v57.tx;
  long long v38 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v54.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v54.c = v38;
  *(_OWORD *)&v54.tCGFloat x = *(_OWORD *)&retstr->tx;
  [v11 rotation];
  CGAffineTransformMakeRotation(&v53, v39 * 3.14159265 / 180.0);
  CGAffineTransformConcat(&v57, &v54, &v53);
  long long v40 = *(_OWORD *)&v57.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
  *(_OWORD *)&retstr->c = v40;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v57.tx;
  long long v41 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v52.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v52.c = v41;
  *(_OWORD *)&v52.tCGFloat x = *(_OWORD *)&retstr->tx;
  LODWORD(a2) = [v11 flipX];
  int v42 = [v11 flipY];
  double v43 = 1.0;
  if (a2) {
    double v44 = -1.0;
  }
  else {
    double v44 = 1.0;
  }
  if (v42) {
    double v43 = -1.0;
  }
  CGAffineTransformMakeScale(&v51, v44, v43);
  CGAffineTransformConcat(&v57, &v52, &v51);
  long long v45 = *(_OWORD *)&v57.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
  *(_OWORD *)&retstr->c = v45;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v57.tx;
  long long v46 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v50.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v50.c = v46;
  *(_OWORD *)&v50.tCGFloat x = *(_OWORD *)&retstr->tx;
  CGAffineTransformMakeTranslation(&v49, v29, v31);
  CGAffineTransformConcat(&v57, &v50, &v49);
  long long v47 = *(_OWORD *)&v57.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v57.a;
  *(_OWORD *)&retstr->c = v47;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&v57.tx;

  return result;
}

+ (id)absoluteOrientedBoundsWithRelativeOrientedBounds:(id)a3 parentOrientedBounds:(id)a4 parentLogicalBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  CGFloat v13 = objc_msgSend(a1, "adjustedOrientedBoundsWithOrientedBounds:logicalBounds:", v12, x, y, width, height);

  objc_msgSend(a1, "transformFromBounds:toOrientedBounds:", v13, x, y, width, height);
  [v11 bounds];
  double v18 = TSUCenterOfRect(v14, v15, v16, v17);
  double v20 = v19;
  [v11 bounds];
  double v57 = CGRectGetWidth(v59);
  [v11 bounds];
  CGRectGetHeight(v60);
  v61.origin.double x = x;
  v61.origin.double y = y;
  v61.size.double width = width;
  v61.size.double height = height;
  double v21 = CGRectGetWidth(v61);
  [v13 bounds];
  CGFloat v22 = CGRectGetWidth(v62);
  float v23 = v21;
  *(float *)&double v24 = v22;
  *(float *)&CGFloat v22 = v23;
  [a1 scaleFactorFromLength:v22 toLength:v24];
  float v26 = v25;
  v63.origin.double x = x;
  v63.origin.double y = y;
  v63.size.double width = width;
  v63.size.double height = height;
  double v27 = CGRectGetHeight(v63);
  [v13 bounds];
  CGFloat v28 = CGRectGetHeight(v64);
  float v29 = v27;
  *(float *)&double v30 = v28;
  *(float *)&CGFloat v28 = v29;
  [a1 scaleFactorFromLength:v28 toLength:v30];
  float v32 = v31;
  [v11 rotation];
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    float v34 = v32;
  }
  else
  {
    float v34 = v26;
  }
  float v33 = v57;
  double v35 = TSURectWithCenterAndSize(v20 * 0.0 + 0.0 * v18 + 0.0, v20 * 0.0 + 0.0 * v18 + 0.0, (float)(v34 * v33));
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  int v42 = [v13 flipX];
  unsigned int v43 = [v11 flipX];
  int v44 = [v13 flipY];
  unsigned int v45 = [v11 flipY];
  int v46 = [v11 flipX];
  int v47 = [v11 flipY];
  [v11 rotation];
  float v49 = v48;
  [v13 rotation];
  float v51 = v50;
  CGAffineTransform v52 = [OADOrientedBounds alloc];
  if (v47) {
    int v54 = -1;
  }
  else {
    int v54 = 1;
  }
  if (v46) {
    int v54 = -v54;
  }
  *(float *)&double v53 = v49 + (float)((float)v54 * v51);
  CGAffineTransform v55 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v52, "initWithBounds:rotation:flipX:flipY:", v42 ^ v43, v44 ^ v45, v35, v37, v39, v41, v53);

  return v55;
}

+ (id)relativeOrientedBoundsWithAbsoluteOrientedBounds:(id)a3 parentOrientedBounds:(id)a4 parentLogicalBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a3;
  id v12 = a4;
  memset(&v79, 0, sizeof(v79));
  +[OAITOrientedBounds transformFromBounds:toOrientedBounds:](OAITOrientedBounds, "transformFromBounds:toOrientedBounds:", v12, x, y, width, height);
  [v11 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = TSUCenterOfRect(v13, v15, v17, v19);
  double v75 = v22;
  double v76 = v21;
  CGAffineTransform v77 = v79;
  CGAffineTransformInvert(&v78, &v77);
  double b = v78.b;
  double a = v78.a;
  double rect_8 = v78.c;
  double rect_16 = v78.tx;
  double rect_24 = v78.d;
  tdouble y = v78.ty;
  int v23 = [v12 flipX];
  unsigned int v24 = [v11 flipX];
  int v25 = [v12 flipY];
  unsigned int v26 = [v11 flipY];
  CGFloat v63 = v20;
  CGFloat v64 = v18;
  CGFloat v65 = v16;
  CGFloat v66 = v14;
  [v11 rotation];
  float v67 = v27;
  [v12 rotation];
  float v62 = v28;
  uint64_t v29 = v23 ^ v24;
  uint64_t v30 = v25 ^ v26;
  if (v30) {
    int v31 = -1;
  }
  else {
    int v31 = 1;
  }
  if (v29) {
    int v32 = -v31;
  }
  else {
    int v32 = v31;
  }
  [v12 bounds];
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;
  CGFloat rect = x;
  v81.origin.double x = x;
  CGFloat v41 = y;
  v81.origin.double y = y;
  CGFloat v42 = width;
  v81.size.double width = width;
  CGFloat v43 = height;
  v81.size.double height = height;
  double v44 = CGRectGetWidth(v81);
  v82.origin.double x = v34;
  v82.origin.double y = v36;
  v82.size.double width = v38;
  v82.size.double height = v40;
  CGFloat v45 = CGRectGetWidth(v82);
  float v46 = v44;
  *(float *)&double v47 = v45;
  *(float *)&CGFloat v45 = v46;
  [a1 scaleFactorFromLength:v45 toLength:v47];
  float v49 = v48;
  v83.origin.double x = rect;
  v83.origin.double y = v41;
  v83.size.double width = v42;
  v83.size.double height = v43;
  double v50 = CGRectGetHeight(v83);
  v84.origin.double x = v34;
  v84.origin.double y = v36;
  v84.size.double width = v38;
  v84.size.double height = v40;
  CGFloat v51 = CGRectGetHeight(v84);
  float v52 = v50;
  *(float *)&double v53 = v51;
  *(float *)&CGFloat v51 = v52;
  [a1 scaleFactorFromLength:v51 toLength:v53];
  float v55 = v54;
  *(float *)&double v56 = v67 - (float)((float)v32 * v62);
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:v56])
  {
    float v57 = v55;
  }
  else
  {
    float v57 = v49;
  }
  v85.origin.double x = v66;
  v85.origin.double y = v65;
  v85.size.double width = v64;
  v85.size.double height = v63;
  double v58 = CGRectGetWidth(v85);
  v86.origin.double x = v66;
  v86.origin.double y = v65;
  v86.size.double width = v64;
  v86.size.double height = v63;
  CGRectGetHeight(v86);
  float v59 = v58;
  CGRect v60 = +[OADOrientedBounds orientedBoundsWithBounds:rotation:flipX:flipY:](OADOrientedBounds, "orientedBoundsWithBounds:rotation:flipX:flipY:", v29, v30, TSURectWithCenterAndSize(rect_16 + v75 * rect_8 + a * v76, ty + v75 * rect_24 + b * v76, (float)(v59 / v57)));

  return v60;
}

+ (id)relativeOrientedBoundsOfDrawable:(id)a3
{
  id v3 = a3;
  id v4 = [v3 drawableProperties];
  if ([v4 hasOrientedBounds])
  {
    v5 = [v4 orientedBounds];
  }
  else
  {
    v5 = 0;
  }
  v6 = [v3 clientData];
  v7 = [v3 parent];
  if (v7)
  {
  }
  else if ([v6 hasBounds])
  {
    [v6 bounds];
    double x = v14.origin.x;
    double y = v14.origin.y;
    double width = v14.size.width;
    double height = v14.size.height;
    if (!CGRectEqualToRect(v14, *MEMORY[0x263F001A8]))
    {
      if (!v5)
      {
        v5 = -[OADOrientedBounds initWithBounds:]([OADOrientedBounds alloc], "initWithBounds:", x, y, width, height);
        [v4 setOrientedBounds:v5];
      }
      -[OADOrientedBounds setBounds:](v5, "setBounds:", x, y, width, height);
    }
  }

  return v5;
}

+ (CGRect)axisParallelBoundsOfOrientedBounds:(id)a3
{
  id v3 = a3;
  memset(&v43, 0, sizeof(v43));
  [v3 rotation];
  CGAffineTransformMakeRotation(&v43, v4 * 3.14159265 / 180.0);
  [v3 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  uint64_t v13 = 0;
  float v14 = -INFINITY;
  float v15 = INFINITY;
  float v42 = INFINITY;
  float v16 = -INFINITY;
  do
  {
    uint64_t v17 = 0;
    double v41 = (double)*((int *)&unk_238EDC438 + v13);
    char v18 = 1;
    do
    {
      char v19 = v18;
      v44.origin.double x = v6;
      v44.origin.double y = v8;
      v44.size.double width = v10;
      v44.size.double height = v12;
      double Width = CGRectGetWidth(v44);
      int v21 = *((_DWORD *)&unk_238EDC438 + v17);
      v45.origin.double x = v6;
      v45.origin.double y = v8;
      v45.size.double width = v10;
      v45.size.double height = v12;
      CGFloat Height = CGRectGetHeight(v45);
      char v18 = 0;
      double v23 = Width * v41 * 0.5;
      CGFloat v24 = Height * (double)v21 * 0.5;
      double v25 = v43.tx + v24 * v43.c + v43.a * v23;
      double v26 = v43.ty + v24 * v43.d + v43.b * v23;
      float v27 = v42;
      if (v25 <= v42) {
        float v27 = v25;
      }
      float v42 = v27;
      if (v26 <= v15) {
        float v15 = v26;
      }
      if (v25 > v14) {
        float v14 = v25;
      }
      if (v26 > v16) {
        float v16 = v26;
      }
      uint64_t v17 = 1;
    }
    while ((v19 & 1) != 0);
    ++v13;
  }
  while (v13 != 2);
  double v28 = TSUCenterOfRect(v6, v8, v10, v12);
  double v30 = TSURectWithCenterAndSize(v28, v29, (float)(v14 - v42));
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  double v37 = v30;
  double v38 = v32;
  double v39 = v34;
  double v40 = v36;
  result.size.double height = v40;
  result.size.double width = v39;
  result.origin.double y = v38;
  result.origin.double x = v37;
  return result;
}

@end