_DWORD *SGSplineVector_new(int a1)
{
  _DWORD *v2;

  v2 = malloc_type_malloc(0x10uLL, 0x10800409227ACB4uLL);
  *(void *)v2 = malloc_type_malloc(8 * a1, 0x100004000313F17uLL);
  v2[2] = a1;
  return v2;
}

void SGSplineVector_destroy(void **a1)
{
  free(*a1);
  free(a1);
}

void *SGSplineMatrix_new(int a1)
{
  v2 = malloc_type_malloc(0x18uLL, 0x1080040622C3295uLL);
  void *v2 = malloc_type_malloc(8 * (a1 * a1), 0x100004000313F17uLL);
  v2[1] = malloc_type_malloc(4 * (a1 * a1), 0x100004052888210uLL);
  *((_DWORD *)v2 + 4) = a1;
  return v2;
}

void SGSplineMatrix_destroy(void **a1)
{
  v2 = *a1;
  if (v2) {
    free(v2);
  }
  v3 = a1[1];
  if (v3) {
    free(v3);
  }
  free(a1);
}

void SGSplineVector_zero(uint64_t a1)
{
}

void SGSplineMatrix_zero(uint64_t a1)
{
}

void SGSplineMatrix_convert_to_single_precision(uint64_t a1)
{
}

void SGSplineMatrix_discard_double_precision(void **a1)
{
  *a1 = 0;
}

uint64_t SGSplineMatrix_set(uint64_t result, int a2, int a3, double a4)
{
  *(double *)(*(void *)result + 8 * (a2 + *(_DWORD *)(result + 16) * a3)) = a4;
  return result;
}

double SGSplineMatrix_get(uint64_t a1, int a2, int a3)
{
  return *(double *)(*(void *)a1 + 8 * (a2 + *(_DWORD *)(a1 + 16) * a3));
}

uint64_t SGSplineVector_print(uint64_t a1)
{
  putchar(123);
  if (*(int *)(a1 + 8) >= 1)
  {
    uint64_t v2 = 0;
    do
    {
      printf(" (%lf, %lf) ", COERCE_FLOAT(*(void *)(*(void *)a1 + 8 * v2)), COERCE_FLOAT(HIDWORD(*(void *)(*(void *)a1 + 8 * v2))));
      ++v2;
    }
    while (v2 < *(int *)(a1 + 8));
  }
  return puts("}\r");
}

uint64_t SGSplineMatrix_print(uint64_t a1)
{
  putchar(123);
  int v2 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    unint64_t v3 = 0;
    do
    {
      if (!((int)v3 % v2)) {
        puts("\r");
      }
      printf(" %.3e ", *(double *)(*(void *)a1 + 8 * v3++));
      int v2 = *(_DWORD *)(a1 + 16);
    }
    while (v3 < (v2 * v2));
  }
  return puts("}\r");
}

uint64_t SGSplineMatrix_times_SGSplineVector_float(uint64_t result, void *a2, void *a3)
{
  int v3 = *(_DWORD *)(result + 16);
  if (v3 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)(result + 8);
    do
    {
      if (v3 < 1)
      {
        uint64_t v9 = v3;
      }
      else
      {
        uint64_t v6 = 0;
        float32x2_t v7 = *(float32x2_t *)(*a2 + 8 * v4);
        do
        {
          *(float32x2_t *)(*a3 + 8 * v6) = vmla_n_f32(*(float32x2_t *)(*a3 + 8 * v6), v7, *(float *)(v5 + 4 * v6));
          ++v6;
          int v8 = *(_DWORD *)(result + 16);
        }
        while (v6 < v8);
        uint64_t v9 = v8;
        int v3 = *(_DWORD *)(result + 16);
      }
      v5 += 4 * v9;
      ++v4;
    }
    while (v4 < v9);
  }
  return result;
}

void *SGSplineMatrixInversionWorkspace_new(int a1)
{
  int v2 = malloc_type_malloc(0x10uLL, 0x900405DDA6445uLL);
  void *v2 = malloc_type_malloc(4 * a1, 0x100004052888210uLL);
  v2[1] = malloc_type_malloc(8 * a1, 0x100004000313F17uLL);
  return v2;
}

void SGSplineMatrixInversionWorkspace_destroy(void **a1)
{
  free(*a1);
  free(a1[1]);
  free(a1);
}

uint64_t SGSplineMatrix_invert(uint64_t a1, uint64_t a2)
{
  __CLPK_integer __lda = *(_DWORD *)(a1 + 16);
  __CLPK_integer __info = 0;
  int v3 = *(__CLPK_integer **)a2;
  uint64_t v4 = *(__CLPK_doublereal **)(a2 + 8);
  dgetrf_(&__lda, &__lda, *(__CLPK_doublereal **)a1, &__lda, *(__CLPK_integer **)a2, &__info);
  uint64_t result = __info;
  if (!__info)
  {
    dgetri_(&__lda, *(__CLPK_doublereal **)a1, &__lda, v3, v4, &__lda, &__info);
    return __info;
  }
  return result;
}

double SGFindCubicBezierCoordinate(double a1, double a2, double a3, double a4, double a5)
{
  return (1.0 - a1) * ((1.0 - a1) * (a3 * 3.0)) * a1
       + (1.0 - a1) * ((1.0 - a1) * a2) * (1.0 - a1)
       + (1.0 - a1) * (a4 * 3.0) * a1 * a1
       + a1 * a5 * a1 * a1;
}

id SGInterpolateBetweenBezierPaths(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = v4;
  if (!v3)
  {
    id v37 = v4;
LABEL_24:
    id v38 = v37;
    goto LABEL_45;
  }
  if (!v4)
  {
    id v37 = v3;
    goto LABEL_24;
  }
  uint64_t v6 = [MEMORY[0x263F824C0] bezierPath];
  float32x2_t v7 = [MEMORY[0x263EFF980] array];
  id v8 = v3;
  CGPathApply((CGPathRef)[v8 CGPath], v7, (CGPathApplierFunction)SGBuildPathElement);
  uint64_t v9 = [MEMORY[0x263EFF980] array];
  id v10 = v5;
  CGPathApply((CGPathRef)[v10 CGPath], v9, (CGPathApplierFunction)SGBuildPathElement);
  if ([v7 count])
  {
    if ([v9 count])
    {
      unint64_t v11 = [v7 count];
      unint64_t v12 = [v9 count];
      if (v11 >= v12) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = v11;
      }
      if (v13)
      {
        unint64_t v14 = 0;
        do
        {
          v15 = [v7 objectAtIndexedSubscript:v14];
          v16 = [v9 objectAtIndexedSubscript:v14];
          int v17 = [v15 type];
          if (v17 == [v16 type])
          {
            switch([v15 type])
            {
              case 0u:
                [v15 endPoint];
                [v16 endPoint];
                CLKInterpolateBetweenPoints();
                objc_msgSend(v6, "moveToPoint:");
                break;
              case 1u:
                goto LABEL_13;
              case 2u:
                [v15 endPoint];
                [v16 endPoint];
                CLKInterpolateBetweenPoints();
                double v22 = v21;
                double v24 = v23;
                [v15 points];
                [v16 points];
                CLKInterpolateBetweenPoints();
                objc_msgSend(v6, "addQuadCurveToPoint:controlPoint:", v22, v24, v25, v26);
                break;
              case 3u:
                [v15 endPoint];
                [v16 endPoint];
                CLKInterpolateBetweenPoints();
                double v28 = v27;
                double v30 = v29;
                [v15 points];
                [v16 points];
                CLKInterpolateBetweenPoints();
                double v32 = v31;
                double v34 = v33;
                [v15 points];
                [v16 points];
                CLKInterpolateBetweenPoints();
                objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", v28, v30, v32, v34, v35, v36);
                break;
              case 4u:
                [v6 closePath];
                break;
              default:
                break;
            }
          }
          else
          {
LABEL_13:
            [v15 endPoint];
            [v16 endPoint];
            CLKInterpolateBetweenPoints();
            objc_msgSend(v6, "addLineToPoint:");
          }

          ++v14;
          unint64_t v18 = [v7 count];
          unint64_t v19 = [v9 count];
          if (v18 >= v19) {
            unint64_t v20 = v19;
          }
          else {
            unint64_t v20 = v18;
          }
        }
        while (v14 < v20);
      }
      for (unint64_t i = [v7 count]; i < objc_msgSend(v9, "count"); ++i)
      {
        v40 = [v7 lastObject];
        v41 = [v9 objectAtIndexedSubscript:i];
        switch([v41 type])
        {
          case 0u:
            [v40 endPoint];
            [v41 endPoint];
            CLKInterpolateBetweenPoints();
            objc_msgSend(v6, "moveToPoint:");
            break;
          case 1u:
            [v40 endPoint];
            [v41 endPoint];
            CLKInterpolateBetweenPoints();
            objc_msgSend(v6, "addLineToPoint:");
            break;
          case 2u:
            [v40 endPoint];
            [v41 endPoint];
            CLKInterpolateBetweenPoints();
            double v43 = v42;
            double v45 = v44;
            [v40 endPoint];
            [v41 points];
            CLKInterpolateBetweenPoints();
            objc_msgSend(v6, "addQuadCurveToPoint:controlPoint:", v43, v45, v46, v47);
            break;
          case 3u:
            [v40 endPoint];
            [v41 endPoint];
            CLKInterpolateBetweenPoints();
            double v49 = v48;
            double v51 = v50;
            [v40 endPoint];
            [v41 points];
            CLKInterpolateBetweenPoints();
            double v53 = v52;
            double v55 = v54;
            [v40 endPoint];
            [v41 points];
            CLKInterpolateBetweenPoints();
            objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", v49, v51, v53, v55, v56, v57);
            break;
          case 4u:
            [v6 closePath];
            break;
          default:
            break;
        }
      }
      unint64_t v58 = [v9 count];
      id v10 = v6;
      if (v58 < [v7 count])
      {
        do
        {
          v59 = [v7 objectAtIndexedSubscript:v58];
          v60 = [v9 lastObject];
          switch([v60 type])
          {
            case 0u:
              [v59 endPoint];
              [v60 endPoint];
              CLKInterpolateBetweenPoints();
              objc_msgSend(v6, "moveToPoint:");
              break;
            case 1u:
              [v59 endPoint];
              [v60 endPoint];
              CLKInterpolateBetweenPoints();
              objc_msgSend(v6, "addLineToPoint:");
              break;
            case 2u:
              [v59 endPoint];
              [v60 endPoint];
              CLKInterpolateBetweenPoints();
              double v62 = v61;
              double v64 = v63;
              [v59 points];
              [v60 endPoint];
              CLKInterpolateBetweenPoints();
              objc_msgSend(v6, "addQuadCurveToPoint:controlPoint:", v62, v64, v65, v66);
              break;
            case 3u:
              [v59 endPoint];
              [v60 endPoint];
              CLKInterpolateBetweenPoints();
              double v68 = v67;
              double v70 = v69;
              [v59 points];
              [v60 endPoint];
              CLKInterpolateBetweenPoints();
              double v72 = v71;
              double v74 = v73;
              [v59 points];
              [v60 endPoint];
              CLKInterpolateBetweenPoints();
              objc_msgSend(v6, "addCurveToPoint:controlPoint1:controlPoint2:", v68, v70, v72, v74, v75, v76);
              break;
            case 4u:
              [v6 closePath];
              break;
            default:
              break;
          }

          ++v58;
        }
        while (v58 < [v7 count]);
        id v10 = v6;
      }
    }
    else
    {
      id v10 = v8;
    }
  }
  id v38 = v10;

LABEL_45:
  return v38;
}

double SGFindCubicBezierPoint(double a1, float64x2_t a2, float64_t a3, float64x2_t a4, float64_t a5, float64x2_t a6, float64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, float64x2_t a16)
{
  a2.f64[1] = a3;
  a4.f64[1] = a5;
  __asm { FMOV            V4.2D, #3.0 }
  a6.f64[1] = a7;
  *(void *)&double result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(a4, _Q4), 1.0 - a1), 1.0 - a1), a1), vmulq_n_f64(vmulq_n_f64(a2, 1.0 - a1), 1.0 - a1), 1.0 - a1), vmulq_n_f64(vmulq_n_f64(vmulq_f64(a6, _Q4), 1.0 - a1), a1), a1), vmulq_n_f64(vmulq_n_f64(a16, a1), a1), a1);
  return result;
}

double SGComputeCubicBezierLength(float64x2_t a1, float64_t a2, float64x2_t a3, float64_t a4, float64x2_t a5, float64_t a6, float64x2_t a7, float64_t a8)
{
  a3.f64[1] = a4;
  __asm { FMOV            V3.2D, #3.0 }
  a5.f64[1] = a6;
  float64x2_t v13 = vmulq_f64(a3, _Q3);
  float64x2_t v14 = vmulq_f64(a5, _Q3);
  a7.f64[1] = a8;
  a1.f64[1] = a2;
  float64x2_t v15 = 0uLL;
  double v16 = 0.0;
  int v17 = 11;
  double v18 = 0.0;
  do
  {
    double v19 = 1.0 - v18 / 10.0;
    float64x2_t v20 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(v13, v19), v19), v18 / 10.0), vmulq_n_f64(vmulq_n_f64(a1, v19), v19), v19), vmulq_n_f64(vmulq_n_f64(v14, v19), v18 / 10.0), v18 / 10.0), vmulq_n_f64(vmulq_n_f64(a7, v18 / 10.0), v18 / 10.0), v18 / 10.0);
    if (v17 != 11)
    {
      float64x2_t v21 = vsubq_f64(v20, v15);
      double v16 = v16 + sqrt(vmlad_n_f64(COERCE_DOUBLE(*(void *)&vmulq_f64(v21, v21).f64[1]), v21.f64[0], v21.f64[0]));
    }
    double v18 = v18 + 1.0;
    float64x2_t v15 = v20;
    --v17;
  }
  while (v17);
  return v16;
}

double SGComputeCubicBezierYForX(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  double v17 = vabdd_f64(a9, a2) * 10.0;
  if (v17 < 10.0) {
    double v17 = 10.0;
  }
  int v18 = (int)v17;
  if ((int)v17 < 0) {
    return 0.0;
  }
  int v19 = 0;
  double v20 = (double)v18;
  double v21 = a4 * 3.0;
  double v22 = a6 * 3.0;
  double v23 = a5 * 3.0;
  double v24 = a7 * 3.0;
  int v25 = v18 + 1;
  double v26 = 0.0;
  double v27 = 1.79769313e308;
  do
  {
    double v28 = (double)v19 / v20;
    double v29 = vabdd_f64(v28 * ((1.0 - v28) * (v21 * (1.0 - v28)))+ (1.0 - v28) * (a2 * (1.0 - v28)) * (1.0 - v28)+ v28 * (v22 * (1.0 - v28)) * v28+ v28 * (a9 * v28) * v28, a1);
    if (v29 < v27)
    {
      double v26 = v28 * ((1.0 - v28) * (v23 * (1.0 - v28)))
          + (1.0 - v28) * (a3 * (1.0 - v28)) * (1.0 - v28)
          + v28 * (v24 * (1.0 - v28)) * v28
          + v28 * (a10 * v28) * v28;
      double v27 = v29;
    }
    ++v19;
  }
  while (v25 != v19);
  return v26;
}

double SGComputeRectAroundCircle(double a1, double a2, double a3)
{
  return a1 - a3;
}

double SGScreenRadiusAtAngleWithInset(void *a1, double a2, double a3)
{
  id v5 = a1;
  float v6 = a2;
  float v7 = fmodf(v6, 6.2832);
  double v8 = v7;
  if (v7 < 0.0)
  {
    do
      double v8 = v8 + 6.28318531;
    while (v8 < 0.0);
  }
  double v9 = 1.57079633;
  if (v8 >= 1.57079633)
  {
    double v10 = 3.14159265;
    if (v8 >= 3.14159265)
    {
      if (v8 < 4.71238898)
      {
        double v8 = v8 + -3.14159265;
        goto LABEL_9;
      }
      double v10 = 6.28318531;
    }
    double v8 = v10 - v8;
  }
LABEL_9:
  [v5 screenBounds];
  double v12 = v11 + a3 * -2.0;
  [v5 screenBounds];
  double v14 = v13 + a3 * -2.0;
  [v5 screenCornerRadius];
  double v16 = fmax((v15 - a3) * 1.52866, 0.0);
  double v17 = v14 * 0.5;
  if (atan2(-(v16 - v12 * 0.5), v14 * 0.5) >= v8)
  {
    double v18 = v17 * tan(v8);
LABEL_13:
    double v19 = v18 * v18 + v17 * v17;
    goto LABEL_25;
  }
  double v18 = v12 * 0.5;
  if (atan2(v18, v14 * 0.5 - v16) < v8)
  {
    double v17 = v18 / tan(v8);
    goto LABEL_13;
  }
  unsigned int v20 = 0;
  double v30 = v18 - v16;
  double v21 = 0.0;
  do
  {
    __double2 v22 = __sincos_stret((v21 + v9) * 0.5);
    long double v23 = v17 - v16 + v16 * pow(v22.__cosval, 0.622409222);
    long double v24 = v30 + v16 * pow(v22.__sinval, 0.622409222);
    double v25 = v8 - atan2(v24, v23);
    if (v25 > 0.0) {
      double v26 = (v21 + v9) * 0.5;
    }
    else {
      double v26 = v21;
    }
    if (v25 < 0.0) {
      double v9 = (v21 + v9) * 0.5;
    }
    else {
      double v21 = v26;
    }
    if (fabs(v25) <= 0.01) {
      break;
    }
  }
  while (v20++ < 0x63);
  double v19 = v24 * v24 + v23 * v23;
LABEL_25:
  double v28 = sqrt(v19);

  return v28;
}

void SGBuildPathElement(void *a1, uint64_t a2)
{
  id v9 = a1;
  if ([v9 count])
  {
    id v3 = [v9 lastObject];
    [v3 endPoint];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x263F00148];
    double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  }
  double v8 = -[SGBezierPathElement initWithStartPoint:pathElement:]([SGBezierPathElement alloc], "initWithStartPoint:pathElement:", a2, v5, v7);
  [v9 addObject:v8];
}

SGColorCurveElement *_elementWithColorAtAltitude(double a1, double a2, double a3, double a4)
{
  double v5 = [MEMORY[0x263F825C8] colorWithHue:a1 / 360.0 saturation:a2 / 100.0 brightness:a3 / 100.0 alpha:1.0];
  double v6 = [SGColorCurveElement alloc];
  *(float *)&double v7 = a4;
  double v8 = [(SGColorCurveElement *)v6 initWithColor:v5 fraction:v7];

  return v8;
}

SGCubicColorCurveElement *SGCubicColorCurveElementCreate(double a1)
{
  int v2 = objc_alloc_init(SGCubicColorCurveElement);
  [(SGCubicColorCurveElement *)v2 setFraction:a1];
  __asm { FMOV            V0.4S, #1.0 }
  CLKUIConvertToRGBfFromXRSRGBf();
  -[SGCubicColorCurveElement setColor:](v2, "setColor:");
  return v2;
}

void *generateOpenSplineMatrix(int a1)
{
  int v2 = SGSplineMatrix_new(a1);
  SGSplineMatrix_zero((uint64_t)v2);
  if (a1 >= 3)
  {
    int v3 = 1;
    do
    {
      SGSplineMatrix_set((uint64_t)v2, v3, v3 - 1, 1.0);
      SGSplineMatrix_set((uint64_t)v2, v3, v3, 4.0);
      SGSplineMatrix_set((uint64_t)v2, v3, v3 + 1, 1.0);
      ++v3;
    }
    while (v3 != a1 - 1);
  }
  SGSplineMatrix_set((uint64_t)v2, 0, 0, 2.0);
  SGSplineMatrix_set((uint64_t)v2, 0, 1, 1.0);
  SGSplineMatrix_set((uint64_t)v2, a1 - 1, a1 - 2, 1.0);
  SGSplineMatrix_set((uint64_t)v2, a1 - 1, a1 - 1, 2.0);
  return v2;
}

void *generateClosedSplineMatrix(int a1)
{
  int v2 = SGSplineMatrix_new(a1);
  SGSplineMatrix_zero((uint64_t)v2);
  if (a1 >= 3)
  {
    int v3 = 1;
    do
    {
      SGSplineMatrix_set((uint64_t)v2, v3, v3 - 1, 1.0);
      SGSplineMatrix_set((uint64_t)v2, v3, v3, 4.0);
      SGSplineMatrix_set((uint64_t)v2, v3, v3 + 1, 1.0);
      ++v3;
    }
    while (v3 != a1 - 1);
  }
  SGSplineMatrix_set((uint64_t)v2, 0, 0, 4.0);
  SGSplineMatrix_set((uint64_t)v2, 0, 1, 1.0);
  SGSplineMatrix_set((uint64_t)v2, 0, a1 - 1, 1.0);
  SGSplineMatrix_set((uint64_t)v2, a1 - 1, 0, 1.0);
  SGSplineMatrix_set((uint64_t)v2, a1 - 1, a1 - 2, 1.0);
  SGSplineMatrix_set((uint64_t)v2, a1 - 1, a1 - 1, 4.0);
  return v2;
}

float32x2_t computeCubic(float32x2_t *a1, float32x2_t a2, float32x2_t a3, float32x2_t a4, float32x2_t a5, double a6, double a7)
{
  *(float *)&a7 = *(float *)&a6 * *(float *)&a6;
  float32x2_t v7 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a6, 0);
  if (a1)
  {
    __asm { FMOV            V7.2S, #3.0 }
    float32x2_t v13 = vmul_f32(a5, _D7);
    float32x2_t v14 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a7, 0);
    *a1 = vmla_n_f32(vmla_n_f32(a3, vadd_f32(a4, a4), *(float *)&a6), v13, *(float *)&a7);
  }
  else
  {
    float32x2_t v14 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a7, 0);
  }
  return vmla_n_f32(vmla_f32(vmla_f32(a2, a3, v7), a4, v14), a5, *(float *)&a7 * *(float *)&a6);
}

id SGStartOfDayForDate(void *a1)
{
  if (a1)
  {
    v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    int v3 = [v1 currentCalendar];
    double v4 = [v3 startOfDayForDate:v2];
  }
  else
  {
    double v4 = 0;
  }
  return v4;
}

id SGStartOfNextDayForDate(void *a1)
{
  if (a1)
  {
    v1 = (void *)MEMORY[0x263EFF8F0];
    id v2 = a1;
    int v3 = [v1 currentCalendar];
    double v4 = [v3 dateByAddingUnit:16 value:1 toDate:v2 options:0];

    double v5 = [v3 startOfDayForDate:v4];
  }
  else
  {
    double v5 = 0;
  }
  return v5;
}

double SGPercentageOfDayDoneForDateWithStartAndEnd(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  double v8 = v7;
  double v9 = 0.0;
  if (v5)
  {
    if (v6)
    {
      if (v7)
      {
        [v6 timeIntervalSinceReferenceDate];
        double v11 = v10;
        [v8 timeIntervalSinceReferenceDate];
        double v13 = v12;
        [v5 timeIntervalSinceReferenceDate];
        if (v13 - v11 > 0.0) {
          double v9 = (v14 - v11) / (v13 - v11);
        }
      }
    }
  }

  return v9;
}

double SGSiderealDegreesToSolarDayProgress(double a1)
{
  double result = a1 / 360.0;
  if (result < 0.0) {
    return result + 1.0;
  }
  return result;
}

uint64_t SGSunriseAltitudeToSolarDayPercentage()
{
  return CLKMapFractionIntoRange();
}

uint64_t SGSunsetAltitudeToSolarDayPercentage()
{
  return CLKMapFractionIntoRange();
}

double SGPointOnCircle(double a1, double a2, double a3, double a4)
{
  float v5 = a4;
  return a2 + a1 * __sincosf_stret(v5).__cosval;
}

id SGCircleSectorPath(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  double v12 = [MEMORY[0x263F824C0] bezierPath];
  objc_msgSend(v12, "moveToPoint:", a2, a3);
  objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", a1, a2, a3, a4, a5, a6);
  [v12 closePath];
  return v12;
}

uint64_t SolarGradient.colors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SolarGradient.colors.setter(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  void *v1 = a1;
  return result;
}

uint64_t (*SolarGradient.colors.modify())()
{
  return nullsub_1;
}

void SolarGradient.gradient.getter()
{
  swift_bridgeObjectRetain();
  JUMPOUT(0x25A2B4790);
}

uint64_t SolarGradient.init(date:location:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  id v6 = objc_msgSend(self, sel_sharedPalette);
  id v7 = (void *)sub_257344D68();
  id v8 = objc_msgSend(v6, sel_getSolarColorsForLocation_atDate_, a2, v7);

  sub_257344D18();
  unint64_t v9 = sub_257344DA8();

  if (!(v9 >> 62))
  {
    uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10) {
      goto LABEL_3;
    }
LABEL_11:

    uint64_t v14 = MEMORY[0x263F8EE78];
LABEL_12:
    uint64_t v15 = sub_257344D78();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8))(a1, v15);
    uint64_t result = swift_bridgeObjectRelease();
    *a3 = v14;
    return result;
  }
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_257344E18();
  swift_bridgeObjectRelease();
  if (!v10) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v16 = MEMORY[0x263F8EE78];
  uint64_t result = sub_257344DE8();
  if ((v10 & 0x8000000000000000) == 0)
  {
    uint64_t v12 = 0;
    do
    {
      if ((v9 & 0xC000000000000001) != 0) {
        id v13 = (id)MEMORY[0x25A2B47B0](v12, v9);
      }
      else {
        id v13 = *(id *)(v9 + 8 * v12 + 32);
      }
      ++v12;
      MEMORY[0x25A2B4780](v13);
      sub_257344DC8();
      sub_257344DF8();
      sub_257344E08();
      sub_257344DD8();
    }
    while (v10 != v12);
    uint64_t v14 = v16;

    goto LABEL_12;
  }
  __break(1u);
  return result;
}

unint64_t sub_257344D18()
{
  unint64_t result = qword_269FE7FA0;
  if (!qword_269FE7FA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269FE7FA0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SolarGradient()
{
  return &type metadata for SolarGradient;
}

uint64_t sub_257344D68()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_257344D78()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_257344D88()
{
  return MEMORY[0x270F045A8]();
}

uint64_t sub_257344D98()
{
  return MEMORY[0x270F04EE8]();
}

uint64_t sub_257344DA8()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_257344DB8()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_257344DC8()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_257344DD8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_257344DE8()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_257344DF8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_257344E08()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_257344E18()
{
  return MEMORY[0x270F9F080]();
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
}

uint64_t CLKInterpolateBetweenPoints()
{
  return MEMORY[0x270EE31C0]();
}

uint64_t CLKMapFractionIntoRange()
{
  return MEMORY[0x270EE3210]();
}

uint64_t CLKUIConvertToRGBfFromUIColor_fast()
{
  return MEMORY[0x270F168F8]();
}

uint64_t CLKUIConvertToRGBfFromXRSRGBf()
{
  return MEMORY[0x270F16900]();
}

uint64_t CLKUIConvertToXRSRGBfFromRGBf()
{
  return MEMORY[0x270F16910]();
}

uint64_t CLKUIInterpolateBetweenColors()
{
  return MEMORY[0x270F16920]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x270ED7E88](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  MEMORY[0x270ED7E90](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
}

int dgetrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE5A0](__m, __n, __a, __lda, __ipiv, __info);
}

int dgetri_(__CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_integer *__ipiv, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x270EDE5B0](__n, __a, __lda, __ipiv, __work, __lwork, __info);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  MEMORY[0x270ED99D8](a1, a2);
  return result;
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

int putchar(int a1)
{
  return MEMORY[0x270EDB090](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x270EDB098](a1);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

long double tan(long double __x)
{
  MEMORY[0x270EDB810](__x);
  return result;
}

void vDSP_vdpsp(const double *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsbsm(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
}