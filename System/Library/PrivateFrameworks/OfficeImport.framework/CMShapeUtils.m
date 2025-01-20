@interface CMShapeUtils
+ (BOOL)isShapeALine:(id)a3;
+ (CGRect)transformRect:(CGRect)a3 scale:(float)a4 offsetX:(float)a5 offsetY:(float)a6;
+ (double)fixedPointDegToRad:(int)a3;
+ (double)getFormulaResultFromCustomGeometry:(id)a3 atIndex:(unint64_t)a4;
+ (double)mapAdjustCoord:(OADAdjustCoord)a3 geometry:(id)a4;
+ (double)mapFormulaOfType:(int)a3 argValues:(double *)a4 isEscher:(BOOL)a5;
+ (double)milliMinutesToRad:(int)a3;
+ (double)nativeAngleToRad:(int)a3 isEscher:(BOOL)a4;
+ (float)fontSizeForText:(id)a3 insideRectangle:(CGSize)a4;
+ (float)intersectionAngleNextToAngle:(float)a3 isAfter:(BOOL)a4 nodeSize:(CGSize)a5;
+ (float)normalizedAngle:(float)a3;
+ (float)scaleFactorFromLength:(float)a3 toLength:(float)a4;
+ (id)absoluteOrientedBoundsWithRelativeOrientedBounds:(id)a3 parentOrientedBounds:(id)a4 parentLogicalBounds:(CGRect)a5;
+ (id)inscribedBoundsWithBounds:(id)a3 logicalBounds:(CGRect)a4;
+ (id)internalBoundsWithBounds:(id)a3 scaleBounds:(CGRect)a4;
+ (id)relatvieBoundsWithAbsoluteInnerBounds:(id)a3 parentBounds:(id)a4;
+ (id)transformFromBounds:(CGRect)a3 toOrientedBounds:(id)a4;
+ (id)transformedBoundsWithBounds:(id)a3 transform:(id)a4;
+ (int)mapFormulaKeywordValue:(int)a3 geometry:(id)a4;
+ (int)radToFixedPointDeg:(double)a3;
+ (int)radToMilliMinutes:(double)a3;
+ (int)radToNativeAngle:(double)a3 isEscher:(BOOL)a4;
+ (void)setCoordSpaceForCustomeGeometry:(id)a3 fromSize:(CGSize)a4;
@end

@implementation CMShapeUtils

+ (id)transformFromBounds:(CGRect)a3 toOrientedBounds:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  [v9 bounds];
  CGFloat rect = v10;
  double v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v9 rotation];
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    double v17 = NSTransposedRectWithSameCenter(v12, v14, v16, rect);
    CGFloat rect = v18;
    double v12 = v17;
    CGFloat v14 = v19;
    CGFloat v16 = v20;
  }
  CGFloat v21 = x;
  v55.origin.CGFloat x = x;
  CGFloat v22 = y;
  v55.origin.CGFloat y = y;
  CGFloat v23 = width;
  v55.size.CGFloat width = width;
  CGFloat v24 = height;
  v55.size.CGFloat height = height;
  double v25 = CGRectGetWidth(v55);
  v56.origin.CGFloat x = v12;
  v56.origin.CGFloat y = v14;
  v56.size.CGFloat width = v16;
  v56.size.CGFloat height = rect;
  CGFloat v26 = CGRectGetWidth(v56);
  float v27 = v25;
  *(float *)&double v28 = v26;
  *(float *)&CGFloat v26 = v27;
  [a1 scaleFactorFromLength:v26 toLength:v28];
  HIDWORD(v52) = v29;
  v57.origin.CGFloat x = v21;
  v57.origin.CGFloat y = v22;
  v57.size.CGFloat width = v23;
  v57.size.CGFloat height = v24;
  double v30 = CGRectGetHeight(v57);
  v58.origin.CGFloat x = v12;
  v58.origin.CGFloat y = v14;
  v58.size.CGFloat width = v16;
  v58.size.CGFloat height = rect;
  CGFloat v31 = CGRectGetHeight(v58);
  float v32 = v30;
  *(float *)&double v33 = v31;
  *(float *)&CGFloat v31 = v32;
  [a1 scaleFactorFromLength:v31 toLength:v33];
  LODWORD(v52) = v34;
  double v35 = TSUCenterOfRect(v21, v22, v23, v24);
  double v37 = v36;
  double v38 = TSUCenterOfRect(v12, v14, v16, rect);
  double v40 = v39;
  v41 = [MEMORY[0x263F08680] transform];
  id v42 = objc_alloc_init(MEMORY[0x263F08680]);
  [v42 translateXBy:-v35 yBy:-v37];
  [v41 appendTransform:v42];
  id v43 = objc_alloc_init(MEMORY[0x263F08680]);

  [v43 scaleXBy:*((float *)&v52 + 1) yBy:*(float *)&v52];
  [v41 appendTransform:v43];
  id v44 = objc_alloc_init(MEMORY[0x263F08680]);

  [v9 rotation];
  [v44 rotateByDegrees:v45];
  [v41 appendTransform:v44];
  id v46 = objc_alloc_init(MEMORY[0x263F08680]);

  LODWORD(v44) = [v9 flipX];
  int v47 = [v9 flipY];
  double v48 = 1.0;
  if (v44) {
    double v49 = -1.0;
  }
  else {
    double v49 = 1.0;
  }
  if (v47) {
    double v48 = -1.0;
  }
  objc_msgSend(v46, "scaleXBy:yBy:", v49, v48, v52);
  [v41 appendTransform:v46];
  id v50 = objc_alloc_init(MEMORY[0x263F08680]);

  [v50 translateXBy:v38 yBy:v40];
  [v41 appendTransform:v50];

  return v41;
}

+ (float)scaleFactorFromLength:(float)a3 toLength:(float)a4
{
  float v4 = a4 / a3;
  BOOL v5 = a3 == 0.0;
  float result = 0.0;
  if (!v5) {
    return v4;
  }
  return result;
}

+ (double)mapAdjustCoord:(OADAdjustCoord)a3 geometry:(id)a4
{
  id v5 = a4;
  if (a3.isFormulaResult)
  {
    +[CMShapeUtils getFormulaResultFromCustomGeometry:v5 atIndex:*(uint64_t *)&a3 >> 32];
    double value = v7;
  }
  else
  {
    double value = (double)a3.value;
  }

  return value;
}

+ (BOOL)isShapeALine:(id)a3
{
  id v3 = a3;
  float v4 = [v3 geometry];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v3 geometry];
    if ([v6 pathCount] == 1)
    {
      double v7 = [v6 pathAtIndex:0];
      if (([v7 stroked] & 1) != 0 && objc_msgSend(v7, "elementCount") == 2)
      {
        v8 = [v7 elementAtIndex:0];
        id v9 = [v7 elementAtIndex:1];
        objc_opt_class();
        BOOL v10 = 0;
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            BOOL v10 = 1;
          }
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (double)getFormulaResultFromCustomGeometry:(id)a3 atIndex:(unint64_t)a4
{
  v19[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = [v7 isEscher];
  double v9 = 0.0;
  if ([v7 formulaCount] > a4)
  {
    BOOL v10 = [v7 formulaAtIndex:a4];
    uint64_t v11 = 0;
    memset(v19, 0, 24);
    do
    {
      uint64_t v12 = [v10 argAtIndex:v11];
      unint64_t v13 = HIDWORD(v12);
      double v14 = 0.0;
      switch((int)v12)
      {
        case 0:
          goto LABEL_11;
        case 1:
          double v14 = (double)SHIDWORD(v12);
          goto LABEL_11;
        case 2:
          int v15 = objc_msgSend(v7, "adjustValueAtIndex:", v13, 0.0);
          goto LABEL_7;
        case 3:
          if (v13 >= a4)
          {
            double v18 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", 0.0);
            [v18 handleFailureInMethod:a2 object:a1 file:@"CMShapeUtils.mm" lineNumber:437 description:@"Forward reference to formula"];
          }
          +[CMShapeUtils getFormulaResultFromCustomGeometry:v7 atIndex:v12 >> 32];
          goto LABEL_11;
        case 4:
          int v15 = objc_msgSend(a1, "mapFormulaKeywordValue:geometry:", v13, v7, 0.0);
LABEL_7:
          double v14 = (double)v15;
LABEL_11:
          *(double *)&v19[v11] = v14;
          break;
        default:
          break;
      }
      ++v11;
    }
    while (v11 != 3);
    +[CMShapeUtils mapFormulaOfType:argValues:isEscher:](CMShapeUtils, "mapFormulaOfType:argValues:isEscher:", objc_msgSend(v10, "type", v13, v14), v19, v8);
    double v9 = v16;
  }
  return v9;
}

+ (int)mapFormulaKeywordValue:(int)a3 geometry:(id)a4
{
  id v9 = a4;
  BOOL v10 = v9;
  if (v9)
  {
    [v9 geometryCoordSpace];
    double v11 = COERCE_DOUBLE(vcvt_f32_s32(vsub_s32(v16, v15)));
  }
  else
  {
    double v11 = 0.0;
  }
  if (!(!v8 & v7))
  {
    switch(a3)
    {
      case 320:
        *(float *)&double v11 = *(float *)&v11 * 0.5;
        goto LABEL_13;
      case 321:
        *(float *)&double v11 = vmuls_lane_f32(0.5, *(float32x2_t *)&v11, 1);
        goto LABEL_13;
      case 322:
        goto LABEL_13;
      case 323:
        goto LABEL_9;
      default:
        JUMPOUT(0);
    }
  }
  switch(a3)
  {
    case 1280:
    case 1281:
      goto LABEL_11;
    case 1282:
      break;
    case 1283:
LABEL_9:
      LODWORD(v11) = HIDWORD(v11);
      break;
    default:
      uint64_t v12 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", v11);
      [v12 handleFailureInMethod:a2 object:a1 file:@"CMShapeUtils.mm" lineNumber:621 description:@"Unknown formula keyword"];

LABEL_11:
      LODWORD(v11) = 0;
      break;
  }
LABEL_13:
  int v13 = (int)*(float *)&v11;

  return v13;
}

+ (double)mapFormulaOfType:(int)a3 argValues:(double *)a4 isEscher:(BOOL)a5
{
  switch(a3)
  {
    case 0:
      double v5 = *a4 + a4[1];
      double v6 = a4[2];
      return v5 - v6;
    case 1:
      double v7 = a4[2];
      if (v7 == 0.0)
      {
        a4[2] = 1.0;
        double v7 = 1.0;
      }
      return *a4 * a4[1] / v7;
    case 2:
      double v9 = *a4 + a4[1];
      double v10 = 0.5;
      return v9 * v10;
    case 3:
      return fabs(*a4);
    case 4:
      double result = *a4;
      if (*a4 >= a4[1]) {
        return a4[1];
      }
      return result;
    case 5:
      double result = *a4;
      if (*a4 <= a4[1]) {
        return a4[1];
      }
      return result;
    case 6:
      uint64_t v18 = 2;
      if (*a4 > 0.0) {
        uint64_t v18 = 1;
      }
      return a4[v18];
    case 7:
      double v11 = a4[1] * a4[1] + *a4 * *a4 + a4[2] * a4[2];
      return sqrt(v11);
    case 8:
      return (double)(int)objc_msgSend(a1, "radToNativeAngle:isEscher:", a5, (double)atan2(a4[1], *a4));
    case 9:
      double v12 = *a4;
      [a1 nativeAngleToRad:(int)a4[1] isEscher:a5];
      goto LABEL_15;
    case 10:
      double v12 = *a4;
      [a1 nativeAngleToRad:(int)a4[1] isEscher:a5];
      goto LABEL_34;
    case 11:
      double v12 = *a4;
      long double v14 = atan2(a4[2], a4[1]);
LABEL_34:
      double v15 = cos(v14);
      goto LABEL_35;
    case 12:
      double v12 = *a4;
      long double v13 = atan2(a4[2], a4[1]);
LABEL_15:
      double v15 = sin(v13);
      goto LABEL_35;
    case 13:
      double v11 = *a4;
      return sqrt(v11);
    case 14:
      double v5 = *a4 + (double)((int)a4[1] << 16);
      double v6 = (double)((int)a4[2] << 16);
      return v5 - v6;
    case 15:
      double v9 = a4[2];
      double v10 = sqrt(1.0 - *a4 / a4[1] * (*a4 / a4[1]));
      return v9 * v10;
    case 16:
      double v12 = *a4;
      [a1 nativeAngleToRad:(int)a4[1] isEscher:a5];
      double v15 = tan(v16);
LABEL_35:
      double result = v12 * v15;
      break;
    case 17:
      double v17 = a4[1];
      if (*a4 > v17) {
        double v17 = *a4;
      }
      double result = a4[2];
      if (v17 < result) {
        double result = v17;
      }
      break;
    case 18:
      double result = (*a4 + a4[1]) / a4[2];
      break;
    case 19:
      double result = *a4;
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

+ (void)setCoordSpaceForCustomeGeometry:(id)a3 fromSize:(CGSize)a4
{
  uint64_t v4 = 0;
  int width = (int)a4.width;
  int height = (int)a4.height;
  [a3 setGeometryCoordSpace:&v4];
}

+ (double)nativeAngleToRad:(int)a3 isEscher:(BOOL)a4
{
  if (a4) {
    [a1 fixedPointDegToRad:*(void *)&a3];
  }
  else {
    [a1 milliMinutesToRad:*(void *)&a3];
  }
  return result;
}

+ (double)milliMinutesToRad:(int)a3
{
  return (double)a3 * 0.000000290888209;
}

+ (id)inscribedBoundsWithBounds:(id)a3 logicalBounds:(CGRect)a4
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  [v9 bounds];
  double v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  [v9 rotation];
  if (+[OADOrientedBounds directionCloserToVerticalThanToHorizontal:](OADOrientedBounds, "directionCloserToVerticalThanToHorizontal:"))
  {
    double v11 = NSTransposedRectWithSameCenter(v11, v13, v15, v17);
    CGFloat v13 = v18;
    CGFloat v15 = v19;
    CGFloat v17 = v20;
  }
  v50.size.double height = height;
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  double v48 = width;
  v50.size.CGFloat width = width;
  double v21 = CGRectGetWidth(v50);
  v51.origin.CGFloat x = v11;
  v51.origin.CGFloat y = v13;
  v51.size.CGFloat width = v15;
  v51.size.double height = v17;
  CGFloat v22 = CGRectGetWidth(v51);
  float v23 = v21;
  *(float *)&double v24 = v22;
  *(float *)&CGFloat v22 = v23;
  [a1 scaleFactorFromLength:v22 toLength:v24];
  float v26 = v25;
  v52.origin.CGFloat x = x;
  v52.origin.CGFloat y = y;
  v52.size.double height = height;
  v52.size.CGFloat width = v48;
  double v27 = CGRectGetHeight(v52);
  v53.origin.CGFloat x = v11;
  v53.origin.CGFloat y = v13;
  v53.size.CGFloat width = v15;
  v53.size.double height = v17;
  CGFloat v28 = CGRectGetHeight(v53);
  float v29 = v27;
  *(float *)&double v30 = v28;
  *(float *)&CGFloat v28 = v29;
  [a1 scaleFactorFromLength:v28 toLength:v30];
  if (v26 >= v31) {
    float v26 = v31;
  }
  double v32 = TSUCenterOfRect(v11, v13, v15, v17);
  double v34 = v33;
  double v35 = [MEMORY[0x263F08680] transform];
  [v35 scaleXBy:v26 yBy:v26];
  objc_msgSend(v35, "transformSize:", v48, height);
  double v37 = v36;
  double v39 = v38;
  double v40 = [OADOrientedBounds alloc];
  [v9 rotation];
  int v42 = v41;
  uint64_t v43 = [v9 flipX];
  uint64_t v44 = [v9 flipY];
  LODWORD(v45) = v42;
  id v46 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v40, "initWithBounds:rotation:flipX:flipY:", v43, v44, v32 - v37 * 0.5, v34 - v39 * 0.5, v37, v39, v45);

  return v46;
}

+ (id)relatvieBoundsWithAbsoluteInnerBounds:(id)a3 parentBounds:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 bounds];
  double v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 bounds];
  double v16 = v15;
  double v18 = v17;
  v31.origin.CGFloat x = v8;
  v31.origin.CGFloat y = v10;
  v31.size.CGFloat width = v12;
  v31.size.double height = v14;
  double Width = CGRectGetWidth(v31);
  v32.origin.CGFloat x = v8;
  v32.origin.CGFloat y = v10;
  v32.size.CGFloat width = v12;
  v32.size.double height = v14;
  double Height = CGRectGetHeight(v32);
  double v21 = [OADOrientedBounds alloc];
  [v5 rotation];
  LODWORD(v14) = v22;
  uint64_t v23 = [v5 flipX];
  uint64_t v24 = [v5 flipY];
  float v25 = v8 - v16;
  float v26 = v10 - v18;
  LODWORD(v27) = LODWORD(v14);
  CGFloat v28 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v21, "initWithBounds:rotation:flipX:flipY:", v23, v24, v25, v26, Width, Height, v27);

  return v28;
}

+ (float)fontSizeForText:(id)a3 insideRectangle:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  unint64_t v6 = [a3 length];
  if (!v6) {
    return 65.0;
  }
  float result = width / (double)v6 * 2.03999996;
  if (height * 0.600000024 < result) {
    return height * 0.600000024 / result * result;
  }
  return result;
}

+ (id)internalBoundsWithBounds:(id)a3 scaleBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v8 = a3;
  [v8 bounds];
  CGFloat v9 = v31.origin.x;
  CGFloat v10 = v31.origin.y;
  CGFloat v11 = v31.size.width;
  CGFloat v12 = v31.size.height;
  double v29 = CGRectGetWidth(v31);
  v32.origin.double x = v9;
  v32.origin.double y = v10;
  v32.size.CGFloat width = v11;
  v32.size.CGFloat height = v12;
  double v28 = CGRectGetHeight(v32);
  v33.origin.double x = x;
  v33.origin.double y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  double v27 = CGRectGetWidth(v33);
  v34.origin.double x = v9;
  v34.origin.double y = v10;
  v34.size.CGFloat width = v11;
  v34.size.CGFloat height = v12;
  double v26 = CGRectGetWidth(v34);
  v35.origin.double x = x;
  v35.origin.double y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  double v13 = CGRectGetHeight(v35);
  v36.origin.double x = v9;
  v36.origin.double y = v10;
  v36.size.CGFloat width = v11;
  v36.size.CGFloat height = v12;
  double v14 = CGRectGetHeight(v36);
  double v15 = [OADOrientedBounds alloc];
  [v8 rotation];
  LODWORD(v11) = v16;
  uint64_t v17 = [v8 flipX];
  uint64_t v18 = [v8 flipY];
  float v19 = x * v29;
  float v20 = y * v28;
  float v21 = v27 * v26;
  float v22 = v13 * v14;
  LODWORD(v23) = LODWORD(v11);
  uint64_t v24 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v15, "initWithBounds:rotation:flipX:flipY:", v17, v18, v19, v20, v21, v22, v23);

  return v24;
}

+ (CGRect)transformRect:(CGRect)a3 scale:(float)a4 offsetX:(float)a5 offsetY:(float)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v17.c = v11;
  *(_OWORD *)&v17.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformTranslate(&v18, &v17, a5, a6);
  CGAffineTransform v16 = v18;
  CGAffineTransformScale(&v18, &v16, a4, a4);
  double v12 = height * v18.c + v18.a * width;
  double v13 = height * v18.d + v18.b * width;
  double v14 = v18.tx + y * v18.c + v18.a * x;
  double v15 = v18.ty + y * v18.d + v18.b * x;
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

+ (id)transformedBoundsWithBounds:(id)a3 transform:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  [v5 bounds];
  double v11 = TSUCenterOfRect(v7, v8, v9, v10);
  double v13 = v12;
  objc_msgSend(v6, "transformPoint:", *MEMORY[0x263F08668], *(double *)(MEMORY[0x263F08668] + 8));
  double v15 = v14;
  double v17 = v16;
  [v5 bounds];
  objc_msgSend(v6, "transformSize:", v18, v19);
  double v21 = TSURectWithCenterAndSize(v11 + v15, v13 + v17, v20);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v28 = [OADOrientedBounds alloc];
  [v5 rotation];
  int v30 = v29;
  uint64_t v31 = [v5 flipX];
  uint64_t v32 = [v5 flipY];
  LODWORD(v33) = v30;
  CGRect v34 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v28, "initWithBounds:rotation:flipX:flipY:", v31, v32, v21, v23, v25, v27, v33);

  return v34;
}

+ (float)intersectionAngleNextToAngle:(float)a3 isAfter:(BOOL)a4 nodeSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  BOOL v41 = a4;
  v47[1] = *MEMORY[0x263EF8340];
  v47[0] = 0;
  objc_msgSend(a1, "normalizedAngle:");
  float v42 = v8;
  __double2 v9 = __sincos_stret(v8 * 3.14159265 / 180.0);
  uint64_t v10 = 0;
  int v11 = 0;
  float v12 = v9.__cosval * 0.5 - width * 0.5;
  float v13 = v9.__sinval * 0.5 - height * 0.5;
  float v14 = width * 0.5 + v9.__cosval * 0.5;
  double v15 = height * 0.5 + v9.__sinval * 0.5;
  *(float *)&double v15 = v15;
  char v16 = 1;
  *(float *)id v46 = v12;
  *(float *)&v46[1] = v13;
  *(float *)&v46[2] = v14;
  v46[3] = LODWORD(v15);
  do
  {
    uint64_t v17 = 0;
    int v45 = *((_DWORD *)&qword_238EDC5E8 + v10);
    uint64_t v18 = v16 & 1;
    if (v16) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = 2;
    }
    char v20 = 1;
    do
    {
      char v21 = v20;
      float v22 = *(float *)&v46[2 * *((_DWORD *)&qword_238EDC5E8 + v17) + v45];
      if (fabsf(v22) <= 0.5)
      {
        uint64_t v23 = 0;
        float v24 = sqrtf(0.25 - (float)(v22 * v22));
        float v25 = *(float *)&v46[v18];
        char v26 = 1;
        do
        {
          char v27 = v26;
          float v28 = v24 * (float)*((int *)&unk_238EDC438 + v23);
          if (v28 > v25 && v28 < *(float *)&v46[v19])
          {
            if (v18) {
              float v29 = v22;
            }
            else {
              float v29 = v24 * (float)*((int *)&unk_238EDC438 + v23);
            }
            if (v18) {
              float v30 = v24 * (float)*((int *)&unk_238EDC438 + v23);
            }
            else {
              float v30 = v22;
            }
            if (v11 >= 2)
            {
              uint64_t v44 = [MEMORY[0x263F08690] currentHandler];
              [v44 handleFailureInMethod:a2 object:a1 file:@"CMShapeUtils.mm" lineNumber:488 description:@"Unexpected intersection count"];
            }
            double v31 = (float)(atan2f(v30, v29) * 180.0) / 3.14159265;
            *(float *)&double v31 = v31;
            [a1 normalizedAngle:v31];
            *((_DWORD *)v47 + v11++) = LODWORD(v15);
          }
          char v26 = 0;
          uint64_t v23 = 1;
        }
        while ((v27 & 1) != 0);
      }
      char v20 = 0;
      uint64_t v17 = 1;
    }
    while ((v21 & 1) != 0);
    char v16 = 0;
    uint64_t v10 = 1;
  }
  while ((v18 & 1) != 0);
  float v32 = v42;
  if (v11 != 2)
  {
    double v40 = [MEMORY[0x263F08690] currentHandler];
    [v40 handleFailureInMethod:a2 object:a1 file:@"CMShapeUtils.mm" lineNumber:495 description:@"Unexpected intersection count"];

    float v32 = v42;
  }
  uint64_t v33 = 0;
  float v34 = 360.0;
  if (!v41) {
    float v34 = 0.0;
  }
  char v35 = 1;
  do
  {
    char v36 = v35;
    float v37 = *((float *)v47 + v33) - v32;
    if (v37 < 0.0) {
      float v37 = v37 + 360.0;
    }
    BOOL v38 = v37 >= v34;
    if (!v41) {
      BOOL v38 = v37 <= v34;
    }
    if (!v38) {
      float v34 = v37;
    }
    uint64_t v33 = 1;
    char v35 = 0;
  }
  while ((v36 & 1) != 0);
  *(float *)&double v15 = v32 + v34;
  [a1 normalizedAngle:v15];
  return result;
}

+ (float)normalizedAngle:(float)a3
{
  return (float)((float)(a3 / 360.0) - floorf(a3 / 360.0)) * 360.0;
}

+ (id)absoluteOrientedBoundsWithRelativeOrientedBounds:(id)a3 parentOrientedBounds:(id)a4 parentLogicalBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v10 = a3;
  id v11 = a4;
  float v12 = +[CMShapeUtils transformFromBounds:toOrientedBounds:](CMShapeUtils, "transformFromBounds:toOrientedBounds:", v11, x, y, width, height);
  [v10 bounds];
  double MidX = CGRectGetMidX(v44);
  [v10 bounds];
  objc_msgSend(v12, "transformPoint:", MidX, CGRectGetMidY(v45));
  double v15 = v14;
  double v17 = v16;
  [v10 bounds];
  objc_msgSend(v12, "transformSize:", v18, v19);
  double v21 = TSURectWithCenterAndSize(v15, v17, v20);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  int v28 = [v11 flipX];
  unsigned int v29 = [v10 flipX];
  int v30 = [v11 flipY];
  unsigned int v31 = [v10 flipY];
  int v32 = [v10 flipX];
  int v33 = [v10 flipY];
  [v10 rotation];
  float v35 = v34;
  [v11 rotation];
  float v37 = v36;
  BOOL v38 = [OADOrientedBounds alloc];
  if (v33) {
    int v40 = -1;
  }
  else {
    int v40 = 1;
  }
  if (v32) {
    int v40 = -v40;
  }
  *(float *)&double v39 = v35 + (float)((float)v40 * v37);
  BOOL v41 = -[OADOrientedBounds initWithBounds:rotation:flipX:flipY:](v38, "initWithBounds:rotation:flipX:flipY:", v28 ^ v29, v30 ^ v31, v21, v23, v25, v27, v39);

  return v41;
}

+ (double)fixedPointDegToRad:(int)a3
{
  return (double)a3 * 0.000000266316109;
}

+ (int)radToFixedPointDeg:(double)a3
{
  [a1 fixedPointDegToRad:1];
  return (int)(a3 / v4);
}

+ (int)radToNativeAngle:(double)a3 isEscher:(BOOL)a4
{
  if (a4) {
    return [a1 radToFixedPointDeg:a3];
  }
  else {
    return [a1 radToMilliMinutes:a3];
  }
}

+ (int)radToMilliMinutes:(double)a3
{
  [a1 milliMinutesToRad:1];
  return (int)(a3 / v4);
}

@end