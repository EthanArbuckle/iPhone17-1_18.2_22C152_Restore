void sub_1DD3FF094(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DD3FF208(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PA::operator*(uint64_t a1, double *a2, long long *a3)
{
  long long v17 = *a3;
  long long v18 = xmmword_1DD424090;
  double v6 = PA::operator*(a2, (double *)&v17);
  uint64_t v8 = v7;
  long long v17 = a3[1];
  long long v18 = xmmword_1DD424090;
  double v9 = PA::operator*(a2, (double *)&v17);
  uint64_t v11 = v10;
  long long v17 = a3[2];
  long long v18 = xmmword_1DD424090;
  double v12 = PA::operator*(a2, (double *)&v17);
  uint64_t v14 = v13;
  long long v17 = a3[3];
  long long v18 = xmmword_1DD424090;
  double v15 = PA::operator*(a2, (double *)&v17);
  *(double *)a1 = v6;
  *(void *)(a1 + 8) = v8;
  *(double *)(a1 + 16) = v9;
  *(void *)(a1 + 24) = v11;
  *(double *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v14;
  *(double *)(a1 + 48) = v15;
  *(void *)(a1 + 56) = v16;
}

{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  long long v24;
  uint64_t v25;
  uint64_t v26;

  v24 = *a3;
  v25 = *((void *)a3 + 2);
  v26 = 0x3FF0000000000000;
  v23 = PA::operator*(a2, (double *)&v24);
  uint64_t v7 = v6;
  double v9 = v8;
  v24 = *(long long *)((char *)a3 + 24);
  v25 = *((void *)a3 + 5);
  v26 = 0x3FF0000000000000;
  uint64_t v10 = PA::operator*(a2, (double *)&v24);
  double v12 = v11;
  uint64_t v14 = v13;
  v24 = a3[3];
  v25 = *((void *)a3 + 8);
  v26 = 0x3FF0000000000000;
  double v15 = PA::operator*(a2, (double *)&v24);
  long long v17 = v16;
  v19 = v18;
  v24 = *(long long *)((char *)a3 + 72);
  v25 = *((void *)a3 + 11);
  v26 = 0x3FF0000000000000;
  v20 = PA::operator*(a2, (double *)&v24);
  *(double *)a1 = v23;
  *(void *)(a1 + 8) = v7;
  *(void *)(a1 + 16) = v9;
  *(double *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = v12;
  *(void *)(a1 + 40) = v14;
  *(double *)(a1 + 48) = v15;
  *(void *)(a1 + 56) = v17;
  *(void *)(a1 + 64) = v19;
  *(double *)(a1 + 72) = v20;
  *(void *)(a1 + 80) = v21;
  *(void *)(a1 + 88) = v22;
}

double PA::Quad2d::boundingRect(float64x2_t *this)
{
  float64x2_t v1 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(this[1], *this), *(int8x16_t *)this, (int8x16_t)this[1]);
  float64x2_t v2 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(this[2], v1), (int8x16_t)v1, (int8x16_t)this[2]);
  *(void *)&double result = vbslq_s8((int8x16_t)vcgtq_f64(this[3], v2), (int8x16_t)v2, (int8x16_t)this[3]).u64[0];
  return result;
}

double PA::operator*(double *a1, double *a2)
{
  return a1[4] * a2[1] + *a1 * *a2 + a1[8] * a2[2] + a1[12] * a2[3];
}

void sub_1DD3FF464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3FF520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3FF70C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD3FF7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PFOppositeRectPoint(int a1)
{
  if ((a1 - 1) >= 9) {
    return 0;
  }
  else {
    return (10 - a1);
  }
}

uint64_t PFRectAreaToRectPoint(int a1)
{
  if ((a1 - 1) > 8) {
    return 0;
  }
  else {
    return dword_1DD4241D8[a1 - 1];
  }
}

uint64_t PFRectPointToRectArea(int a1)
{
  if ((a1 - 1) > 8) {
    return 0;
  }
  else {
    return dword_1DD4241FC[a1 - 1];
  }
}

double PFRectPoint(int a1, double a2, double a3, double a4)
{
  double v4 = -a4;
  if (a4 >= 0.0)
  {
    double v4 = a4;
    a4 = -0.0;
  }
  double result = a2 + a4;
  switch(a1)
  {
    case 2:
      double result = result + v4 * 0.5;
      break;
    case 3:
      double result = v4 + result;
      break;
    case 5:
      double result = result + v4 * 0.5;
      break;
    case 6:
      double result = v4 + result;
      break;
    case 8:
      double result = result + v4 * 0.5;
      break;
    case 9:
      double result = v4 + result;
      break;
    default:
      return result;
  }
  return result;
}

double PFRectNormalize(double a1, double a2, double a3)
{
  if (a3 >= 0.0) {
    a3 = -0.0;
  }
  return a1 + a3;
}

double PFRectIntegralFloorRect(double a1)
{
  return floor(a1);
}

long double PFRectIntegralModRect(long double a1, long double a2, long double a3, long double a4, long double a5, long double a6)
{
  long double v11 = a1 - fmod(a1, a5);
  fmod(a2, a6);
  fmod(a3, a5);
  fmod(a4, a6);
  return v11;
}

double PFRectIntegralContainedRect(double a1, double a2, double a3, double a4)
{
  double v5 = COERCE_DOUBLE(NSIntegralRect(*(NSRect *)&a1));
  double v6 = ceil(a1);
  if (v5 >= v6) {
    return v5;
  }
  return v6;
}

double PFRectAspectRatio(double a1, double a2, double a3, double a4)
{
  return a3 / a4;
}

double PFRectFromPoints(double a1, double a2, double a3)
{
  if (a1 >= a3) {
    return a3;
  }
  else {
    return a1;
  }
}

BOOL PFRectDifference(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  NSRect v9 = NSIntersectionRect(*(NSRect *)&a1, *(NSRect *)&a5);
  return NSIsEmptyRect(v9);
}

CGFloat PFRectScaleToFit(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  if (!NSContainsRect(v17, v18)) {
    return PFRectScaleToFill2(0, a1, a2, a3, a4, a5, a6, a7, a8);
  }
  return a1;
}

CGFloat PFRectScaleToFill2(double *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  v19.origin.x = a6;
  v19.origin.y = a7;
  v19.size.width = a8;
  v19.size.height = a9;
  if (NSIsEmptyRect(v19)) {
    return *MEMORY[0x1E4F28AD8];
  }
  v20.origin.x = a2;
  v20.origin.y = a3;
  v20.size.width = a4;
  v20.size.height = a5;
  if (NSIsEmptyRect(v20)) {
    return a6;
  }
  double v17 = a8 / a4;
  if (a8 / a4 >= a9 / a5) {
    double v17 = a9 / a5;
  }
  if (a1) {
    *a1 = v17;
  }
  return a2;
}

CGFloat PFRectScaleToFill(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return PFRectScaleToFill2(0, a1, a2, a3, a4, a5, a6, a7, a8);
}

double PFRectCenteredScaleToContain(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v10 = a5;
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  if (NSIsEmptyRect(v19)) {
    return *MEMORY[0x1E4F28AD8];
  }
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  if (!NSIsEmptyRect(v20))
  {
    double v15 = a7 / a3;
    if (a7 / a3 <= a8 / a4) {
      double v15 = a8 / a4;
    }
    double v16 = -a7;
    if (a7 < 0.0)
    {
      double v17 = a7;
    }
    else
    {
      double v16 = a7;
      double v17 = -0.0;
    }
    return v10 + v17 + v16 * 0.5 - a3 * v15 * 0.5;
  }
  return v10;
}

double PFRectCenteredScaleToFit(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v14 = -a7;
  if (a7 >= 0.0) {
    double v14 = a7;
  }
  double v15 = -0.0;
  if (a7 >= 0.0) {
    double v16 = -0.0;
  }
  else {
    double v16 = a7;
  }
  double v17 = a5 + v16;
  double v18 = -a8;
  if (a8 < 0.0) {
    double v15 = a8;
  }
  else {
    double v18 = a8;
  }
  double v19 = v17 + v14 * 0.5 - a3 * 0.5;
  double v20 = a6 + v15 + v18 * 0.5 - a4 * 0.5;
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  v23.origin.x = v19;
  v23.origin.y = v20;
  v23.size.width = a3;
  v23.size.height = a4;
  if (!NSContainsRect(v22, v23)) {
    return PFRectCenteredScaleToFill2(0, v19, v20, a3, a4, a5, a6, a7, a8);
  }
  return v19;
}

double PFRectCenteredScaleToFill2(double *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v9 = -a4;
  if (a4 >= 0.0) {
    double v9 = a4;
  }
  double v10 = -0.0;
  if (a4 >= 0.0) {
    double v11 = -0.0;
  }
  else {
    double v11 = a4;
  }
  double v12 = a2 + v11;
  double v13 = -a5;
  if (a5 < 0.0)
  {
    double v14 = a5;
  }
  else
  {
    double v13 = a5;
    double v14 = -0.0;
  }
  double v15 = v12 + v9 * 0.5;
  double v16 = a3 + v14 + v13 * 0.5;
  double v17 = a4 * 0.5;
  double v18 = a5 * 0.5;
  double v19 = -a9;
  if (a9 >= 0.0)
  {
    double v19 = a9;
    a9 = -0.0;
  }
  if (a8 < 0.0) {
    double v10 = a8;
  }
  double v20 = a6 + v10;
  double v21 = a7 + a9;
  double v22 = (v15 - v20) / v17;
  if (a8 < 0.0) {
    a8 = -a8;
  }
  double v23 = (a8 + v20 - v15) / v17;
  double v24 = (v19 + v21 - v16) / v18;
  double v25 = (v16 - v21) / v18;
  if (v22 <= v23) {
    double v23 = v22;
  }
  if (v23 > v24) {
    double v23 = v24;
  }
  if (v23 > v25) {
    double v23 = v25;
  }
  if (a1) {
    *a1 = v23;
  }
  return v15 - a4 * v23 * 0.5;
}

double PFRectCenteredScaleToFill(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8 = a7 / a3;
  if (a7 / a3 < a8 / a4) {
    double v8 = a8 / a4;
  }
  double v9 = a3 * v8;
  double v10 = -a7;
  if (a7 >= 0.0)
  {
    double v10 = a7;
    a7 = -0.0;
  }
  return a5 + a7 + v10 * 0.5 - v9 * 0.5;
}

double PFRectCenteredScaleToFillByCropping(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v8 = a7 / a3;
  if (a7 / a3 >= a8 / a4) {
    double v8 = a8 / a4;
  }
  double v9 = a3 * v8;
  double v10 = -a7;
  if (a7 >= 0.0)
  {
    double v10 = a7;
    a7 = -0.0;
  }
  return a5 + a7 + v10 * 0.5 - v9 * 0.5;
}

double PFRectUniformCenteredScale(double a1, double a2, double a3, double a4, double a5)
{
  double v5 = a3 * a5;
  double v6 = -a3;
  if (a3 >= 0.0)
  {
    double v6 = a3;
    a3 = -0.0;
  }
  return a1 + a3 + v6 * 0.5 - v5 * 0.5;
}

double PFRectCenteredScale(double a1, double a2, double a3, double a4, double a5)
{
  double v5 = a3 * a5;
  double v6 = -a3;
  if (a3 >= 0.0)
  {
    double v6 = a3;
    a3 = -0.0;
  }
  return a1 + a3 + v6 * 0.5 - v5 * 0.5;
}

double PFRectAlignWithRect(int a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v14 = PFRectPoint(a2, a7, a8, a9);
  return PFRectAlignToPoint(a1, a3, a4, a5, a6, v14);
}

double PFRectAlignToPoint(int a1, double a2, double a3, double a4, double a5, double a6)
{
  switch(a1)
  {
    case 1:
    case 4:
    case 7:
      return a6;
    case 2:
      a6 = a6 + a4 * -0.5;
      break;
    case 3:
      a6 = a6 - a4;
      break;
    case 5:
      a6 = a6 - a4 * 0.5;
      break;
    case 6:
      a6 = a6 - a4;
      break;
    case 8:
      a6 = a6 + a4 * -0.5;
      break;
    case 9:
      a6 = a6 - a4;
      break;
    default:
      a6 = a2;
      break;
  }
  return a6;
}

double PFRectScaleByCGAffineTransform(double *a1, double a2, double a3)
{
  return a1[4] + a3 * a1[2] + *a1 * a2;
}

double PFRectMapPoint(double result, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  if (a5 != 0.0 && a6 != 0.0) {
    return a9 + (result - a3) / a5 * a11;
  }
  return result;
}

double PFRectMapPoint2(double result, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  if (a5 != 0.0 && a6 != 0.0)
  {
    double v18 = (result - a3) / a5;
    if (a5 > a6 != a11 > a12) {
      return a10 + (a2 - a4) / a6 * a11;
    }
    else {
      return a9 + v18 * a11;
    }
  }
  return result;
}

BOOL PFRectIsLandscape(double a1, double a2, double a3, double a4)
{
  return a3 > a4;
}

double PFRectMapRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  if (a3 >= 0.0) {
    double v19 = -0.0;
  }
  else {
    double v19 = a3;
  }
  double result = a1 + v19;
  if (a7 != 0.0 && a8 != 0.0) {
    return a9 + (result - a5) / a7 * a11;
  }
  return result;
}

double PFRectMapRect2(int a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  double v20 = -0.0;
  if (a4 >= 0.0) {
    double v21 = -0.0;
  }
  else {
    double v21 = a4;
  }
  double result = a2 + v21;
  if (a5 < 0.0) {
    double v20 = a5;
  }
  double v23 = a3 + v20;
  if (a1)
  {
    if (a8 != 0.0 && a9 != 0.0) {
      return a10 + (result - a6) / a8 * a12;
    }
  }
  else if (a8 != 0.0 && a9 != 0.0)
  {
    if (a8 > a9 != a12 > a13) {
      return a11 + (v23 - a7) / a9 * a12;
    }
    else {
      return a10 + (result - a6) / a8 * a12;
    }
  }
  return result;
}

double PFRectContainRect(double result, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  if (a3 <= a7 && a4 <= a8)
  {
    if (result < a5) {
      double result = a5;
    }
    double v9 = a5 + a7;
    if (a3 + result > v9) {
      return v9 - a3;
    }
  }
  return result;
}

BOOL PFRectCouldContainRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a4 <= a8 && a3 <= a7;
}

double PFRectGrowToContainRect(double a1, double a2, double a3, double a4, double a5)
{
  if (a1 < a5) {
    return a1;
  }
  return a5;
}

double PFRectGrowAtHit(int a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  switch(a1)
  {
    case 1:
      BOOL v8 = 0;
      double v9 = a2 + a4 - a6;
      double v10 = a7 - a3;
      goto LABEL_20;
    case 2:
      double v10 = a7 - a3;
      BOOL v8 = a5 > a7 - a3;
      goto LABEL_5;
    case 3:
      BOOL v8 = 0;
      double v9 = a6 - a2;
      double v10 = a7 - a3;
      goto LABEL_19;
    case 4:
      double v9 = a2 + a4 - a6;
      BOOL v8 = a4 > v9;
      double v10 = a5;
      goto LABEL_20;
    case 5:
      double v9 = a4 + a6;
      double v10 = a5 + a7;
      BOOL v11 = a6 < 0.0;
      a6 = a2 - a6 * 0.5;
      BOOL v8 = v11;
      if (a7 < 0.0) {
        BOOL v8 = 1;
      }
      goto LABEL_20;
    case 6:
      double v9 = a6 - a2;
      BOOL v8 = a4 > a6 - a2;
      double v10 = a5;
      goto LABEL_19;
    case 7:
      BOOL v8 = 0;
      double v9 = a2 + a4 - a6;
      double v10 = a3 + a5 - a7;
      goto LABEL_20;
    case 8:
      double v10 = a3 + a5 - a7;
      BOOL v8 = a5 > v10;
      double v9 = a4;
      goto LABEL_19;
    case 9:
      BOOL v8 = 0;
      double v9 = a6 - a2;
      double v10 = a3 + a5 - a7;
      goto LABEL_19;
    default:
      BOOL v8 = 0;
      double v10 = a5;
LABEL_5:
      double v9 = a4;
LABEL_19:
      a6 = a2;
LABEL_20:
      if (a8 > 0.0)
      {
        double v12 = fabs(v9);
        if (v10 < 0.0) {
          double v12 = -v12;
        }
        double v13 = floor(v12 / a8);
        double v14 = fabs(v10);
        if (v9 < 0.0) {
          double v14 = -v14;
        }
        double v15 = floor(v14 * a8);
        if (fabs(v9 * v13) <= fabs(v10 * v15)) {
          double v16 = v15;
        }
        else {
          double v16 = v9;
        }
        switch(a1)
        {
          case 1:
            a6 = a2 + a4 - v16;
            break;
          case 2:
          case 8:
            if (v8) {
              double v16 = v15;
            }
            a6 = a6 + (a4 - v16) * 0.5;
            break;
          case 5:
            if (v8) {
              double v16 = v15;
            }
            double v18 = -a4;
            if (a4 >= 0.0)
            {
              double v18 = a4;
              a4 = -0.0;
            }
            a6 = a2 + a4 + v18 * 0.5 - v16 * 0.5;
            break;
          case 7:
            a6 = a2 + a4 - v16;
            break;
          default:
            return a6;
        }
      }
      return a6;
  }
}

double PFRectContainPoint(double result, double a2, double a3, double a4, double a5)
{
  if (result < a3) {
    double result = a3;
  }
  double v5 = a3 + a5;
  if (result > v5) {
    return v5;
  }
  return result;
}

double PFRectClampRect(double result, double a2, double a3, double a4, double a5)
{
  if (result < a5) {
    return a5;
  }
  return result;
}

BOOL PFRectIsInside(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a1 >= a5 && a1 + a3 <= a5 + a7 && a2 >= a6 && a2 + a4 <= a6 + a8;
}

double PFRectInterpolate(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v14 = 1.0;
  if (a9 <= 1.0) {
    double v14 = a9;
  }
  if (a9 >= 0.0) {
    double v15 = v14;
  }
  else {
    double v15 = 0.0;
  }
  return a1 - (a1 - a5) * v15;
}

double PFRectEaseInterpolate(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v27 = (sin(a9 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
  return PFRectInterpolate(a1, a2, a3, a4, a5, a6, a7, a8, v27);
}

double PFRectEaseInterpolateBend(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  double v22 = sin(a9 * 3.14159265) * a10;
  BOOL v23 = floor(a1 + a3 * 0.5) == floor(a5 + a7 * 0.5);
  if (v23) {
    double v24 = 0.0;
  }
  else {
    double v24 = v22;
  }
  CGFloat dY = v24;
  if (v23) {
    double v25 = v22;
  }
  else {
    double v25 = 0.0;
  }
  long double v26 = sin(a9 * 3.14159265 + -1.57079633);
  double v27 = PFRectInterpolate(a1, a2, a3, a4, a5, a6, a7, a8, (v26 + 1.0) * 0.5);
  *(void *)&double result = (unint64_t)NSOffsetRect(*(NSRect *)&v27, v25, dY);
  return result;
}

uint64_t PFRectClosestPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7)
{
  double v13 = a3 * 0.5;
  double v14 = a4 * 0.5;
  uint64_t v15 = 1;
  while (1)
  {
    v20.origin.x = PFRectPoint(v15, a5, a6, a7) - v13;
    v20.origin.y = v16 - v14;
    v19.x = a1;
    v19.y = a2;
    v20.size.width = a3;
    v20.size.height = a4;
    if (NSPointInRect(v19, v20)) {
      break;
    }
    uint64_t v15 = (v15 + 1);
    if (v15 == 10) {
      return 0;
    }
  }
  return v15;
}

uint64_t PFRectClosestSide(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6 = a6 * a3;
  double v7 = a1 - a4;
  if (a1 - a4 < 0.0) {
    double v7 = -(a1 - a4);
  }
  if (v7 < v6) {
    return 1;
  }
  double v9 = a1 - (a4 + a6);
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  if (v9 >= v6) {
    return 0;
  }
  else {
    return 2;
  }
}

uint64_t PFRectClosestArea(int a1, CGFloat a2, CGFloat a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  uint64_t v16 = 1;
  while (1)
  {
    PFRectBoundsForAreaType(a4, a5, a6, a7, a8, v16, a1);
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    v26.x = a2;
    v26.y = a3;
    v27.origin.x = v18;
    v27.origin.y = v20;
    v27.size.width = v22;
    v27.size.height = v24;
    if (NSPointInRect(v26, v27)) {
      break;
    }
    uint64_t v16 = (v16 + 1);
    if (v16 == 10) {
      return 0;
    }
  }
  return v16;
}

void PFRectBoundsForAreaType(double a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, int a7)
{
  double v13 = a1;
  if ((a7 & 1) == 0) {
    double v13 = a1 - floor(a1 / 3.0);
  }
  v14.origin.x = a2;
  v14.origin.y = a3;
  v14.size.width = a4;
  v14.size.height = a5;
  NSInsetRect(v14, v13, v13);
  PFRectBoundsForAreas(a7, a1, a2, a3, a4, a5);
}

double PFRectBoundsForAreas(int a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double v7 = a3;
  if (!a1)
  {
    CGFloat v8 = -(a2 - (a2 - floor(a2 / 3.0)));
    v10.origin.x = a3;
    v10.origin.y = a4;
    v10.size.width = a5;
    v10.size.height = a6;
    *(void *)&double v7 = (unint64_t)NSInsetRect(v10, v8, v8);
  }
  return v7;
}

double PFRectVector(int a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v13 = PFRectPoint(a1, a3, a4, a5);
  return PFRectPoint(a2, a7, a8, a9) - v13;
}

uint64_t PFRectIntersectLine(double *a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double v13 = a8 - a6;
  double v14 = a9 - a7;
  if (a8 - a6 == 0.0)
  {
    double v15 = 1.79769313e308;
    double v16 = 1.79769313e308;
  }
  else
  {
    double v15 = (a2 - a6) / v13;
    double v16 = (a2 + a4 - a6) / v13;
  }
  double v17 = (a3 + a5 - a7) / v14;
  double v18 = (a3 - a7) / v14;
  if (v14 == 0.0)
  {
    double v17 = 1.79769313e308;
    double v18 = 1.79769313e308;
  }
  double v19 = -(a4 * v13);
  BOOL v20 = v15 > 0.0 && v19 < 0.0;
  double v21 = fmin(v15, 1.0);
  if (!v20) {
    double v15 = 0.0;
  }
  if (v19 >= 0.0) {
    double v22 = v21;
  }
  else {
    double v22 = 1.0;
  }
  double v23 = a4 * v13;
  if (v16 >= v22) {
    double v24 = v22;
  }
  else {
    double v24 = v16;
  }
  if (v16 <= v15 || v23 >= 0.0) {
    double v16 = v15;
  }
  if (v23 >= 0.0) {
    double v26 = v24;
  }
  else {
    double v26 = v22;
  }
  double v27 = v14 * a5;
  if (v17 >= v26) {
    double v28 = v26;
  }
  else {
    double v28 = v17;
  }
  if (v17 > v16 && v27 < 0.0) {
    double v16 = v17;
  }
  if (v27 >= 0.0) {
    double v26 = v28;
  }
  double v30 = -(a5 * v14);
  if (v18 >= v26) {
    double v31 = v26;
  }
  else {
    double v31 = v18;
  }
  if (v18 > v16 && v30 < 0.0) {
    double v16 = v18;
  }
  if (v30 >= 0.0) {
    double v33 = v31;
  }
  else {
    double v33 = v26;
  }
  if (v16 >= v33) {
    return 0;
  }
  double v34 = a6 + v13 * v16;
  double v35 = a7 + v14 * v16;
  v38.x = a6;
  v38.y = a7;
  v40.x = v34;
  v40.y = v35;
  if (NSEqualPoints(v38, v40))
  {
    double v34 = a6 + v13 * v33;
    double v35 = a7 + v14 * v33;
    v39.x = a8;
    v39.y = a9;
    v41.x = v34;
    v41.y = v35;
    if (NSEqualPoints(v39, v41)) {
      return 0;
    }
  }
  if (a1)
  {
    *a1 = v34;
    a1[1] = v35;
  }
  return 1;
}

BOOL PFRectEdgeInRange(double a1, double a2, double a3, double a4, double a5, double a6)
{
  if (a3 <= a4) {
    double v6 = a4;
  }
  else {
    double v6 = a3;
  }
  return v6 <= a6 && v6 >= a5;
}

BOOL PFRectEdgeIntersectsRect(uint64_t a1, double a2, double a3, double a4, double a5)
{
  if ((*(_DWORD *)a1 & 0xFFFFFFFD) != 1)
  {
    double v10 = *(double *)(a1 + 16);
    double v11 = a3 + a5;
    if (v10 >= a3 && v10 <= v11)
    {
      double v14 = *(double *)(a1 + 8);
      if (v14 >= a2 || *(double *)(a1 + 24) >= a2)
      {
        double v15 = a2 + a4;
        if (v14 <= v15 || *(double *)(a1 + 24) <= v15) {
          return 1;
        }
      }
    }
    return 0;
  }
  double v5 = *(double *)(a1 + 8);
  double v6 = a2 + a4;
  if (v5 < a2 || v5 > v6) {
    return 0;
  }
  double v8 = *(double *)(a1 + 16);
  if (v8 < a3 && *(double *)(a1 + 32) < a3) {
    return 0;
  }
  double v9 = a3 + a5;
  return v8 <= v9 || *(double *)(a1 + 32) <= v9;
}

uint64_t PFRectMakeBoundingRect(uint64_t result)
{
  uint64_t v1 = 0;
  double v2 = 1.79769313e308;
  double v3 = -1.79769313e308;
  double v4 = -1.79769313e308;
  double v5 = 1.79769313e308;
  do
  {
    double v6 = *(double *)(result + v1);
    double v7 = *(double *)(result + v1 + 8);
    if (v6 < v5) {
      double v5 = *(double *)(result + v1);
    }
    if (v6 > v4) {
      double v4 = *(double *)(result + v1);
    }
    if (v7 < v2) {
      double v2 = *(double *)(result + v1 + 8);
    }
    if (v7 > v3) {
      double v3 = *(double *)(result + v1 + 8);
    }
    v1 += 16;
  }
  while (v1 != 64);
  return result;
}

id PFRectRotateByDegrees(double a1, double a2, double a3, double a4, double a5)
{
  double v10 = [MEMORY[0x1E4F28AF0] transform];
  double v11 = [MEMORY[0x1E4F28AF0] transform];
  double v12 = [MEMORY[0x1E4F28AF0] transform];
  double v13 = [MEMORY[0x1E4F28AF0] transform];
  double v14 = -a3;
  if (a3 >= 0.0) {
    double v14 = a3;
  }
  double v15 = -0.0;
  if (a3 >= 0.0) {
    double v16 = -0.0;
  }
  else {
    double v16 = a3;
  }
  double v17 = a1 + v16;
  double v18 = -a4;
  if (a4 < 0.0) {
    double v15 = a4;
  }
  else {
    double v18 = a4;
  }
  double v19 = v17 + v14 * 0.5;
  double v20 = a2 + v15 + v18 * 0.5;
  [v10 translateXBy:-v19 yBy:-v20];
  [v13 appendTransform:v10];
  [v12 rotateByDegrees:a5];
  [v13 appendTransform:v12];
  [v11 translateXBy:v19 yBy:v20];
  [v13 appendTransform:v11];

  return v13;
}

id PFRectScaleAroundCenter(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v12 = [MEMORY[0x1E4F28AF0] transform];
  double v13 = [MEMORY[0x1E4F28AF0] transform];
  double v14 = [MEMORY[0x1E4F28AF0] transform];
  double v15 = [MEMORY[0x1E4F28AF0] transform];
  double v16 = -a3;
  if (a3 >= 0.0) {
    double v16 = a3;
  }
  double v17 = -0.0;
  if (a3 >= 0.0) {
    double v18 = -0.0;
  }
  else {
    double v18 = a3;
  }
  double v19 = a1 + v18;
  double v20 = -a4;
  if (a4 < 0.0) {
    double v17 = a4;
  }
  else {
    double v20 = a4;
  }
  double v21 = v19 + v16 * 0.5;
  double v22 = a2 + v17 + v20 * 0.5;
  [v12 translateXBy:-v21 yBy:-v22];
  [v15 appendTransform:v12];
  [v14 scaleXBy:a5 yBy:a6];
  [v15 appendTransform:v14];
  [v13 translateXBy:v21 yBy:v22];
  [v15 appendTransform:v13];

  return v15;
}

float64x2_t PFRectGetTransform@<Q0>(uint64_t a1@<X8>, float64x2_t a2@<Q0>, float64_t a3@<D1>, float64x2_t a4@<Q2>, float64_t a5@<D3>, float64x2_t a6@<Q4>, float64_t a7@<D5>, float64x2_t a8@<Q6>, float64_t a9@<D7>)
{
  a4.f64[1] = a5;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  int8x16_t v9 = (int8x16_t)vcltzq_f64(a4);
  int8x16_t v10 = (int8x16_t)vdupq_n_s64(0x8000000000000000);
  a2.f64[1] = a3;
  float64x2_t result = vaddq_f64(a2, (float64x2_t)vbslq_s8(v9, (int8x16_t)a4, v10));
  a8.f64[1] = a9;
  int8x16_t v12 = (int8x16_t)vcltzq_f64(a8);
  a6.f64[1] = a7;
  float64x2_t v13 = vaddq_f64(a6, (float64x2_t)vbslq_s8(v12, (int8x16_t)a8, v10));
  float64x2_t v14 = vdivq_f64(vsubq_f64(vaddq_f64((float64x2_t)vbslq_s8(v12, (int8x16_t)vnegq_f64(a8), (int8x16_t)a8), v13), v13), vsubq_f64(vaddq_f64((float64x2_t)vbslq_s8(v9, (int8x16_t)vnegq_f64(a4), (int8x16_t)a4), result), result));
  *(float64_t *)a1 = v14.f64[0];
  *(float64_t *)(a1 + 24) = v14.f64[1];
  *(float64x2_t *)(a1 + 32) = vmlsq_f64(v13, result, v14);
  return result;
}

id PFRectGetNSAffineTransform(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  double v16 = [MEMORY[0x1E4F28AF0] transform];
  double v17 = [MEMORY[0x1E4F28AF0] transform];
  double v18 = [MEMORY[0x1E4F28AF0] transform];
  double v19 = -a3;
  double v20 = -0.0;
  if (a3 >= 0.0) {
    double v21 = -0.0;
  }
  else {
    double v21 = a3;
  }
  double v22 = a1 + v21;
  double v23 = -a4;
  if (a3 >= 0.0) {
    double v19 = a3;
  }
  if (a4 >= 0.0) {
    double v24 = -0.0;
  }
  else {
    double v24 = a4;
  }
  double v25 = a2 + v24;
  double v26 = -a7;
  if (a4 >= 0.0) {
    double v23 = a4;
  }
  if (a7 >= 0.0) {
    double v27 = -0.0;
  }
  else {
    double v27 = a7;
  }
  double v28 = a5 + v27;
  if (a7 >= 0.0) {
    double v26 = a7;
  }
  if (a8 < 0.0) {
    double v20 = a8;
  }
  double v29 = a6 + v20;
  double v30 = v19 + v22;
  double v31 = v23 + v25;
  if (a8 >= 0.0) {
    double v32 = a8;
  }
  else {
    double v32 = -a8;
  }
  double v33 = v28 - (v26 + v28 - v28) / (v30 - v22) * v22;
  double v34 = v29 - (v32 + v29 - v29) / (v31 - v25) * v25;
  objc_msgSend(v17, "scaleXBy:yBy:");
  [v18 appendTransform:v17];
  [v16 translateXBy:v33 yBy:v34];
  [v18 appendTransform:v16];

  return v18;
}

double PFRectPixelAlignedRect(double a1)
{
  return ceil(a1) + 0.5;
}

uint64_t *PFAspectRatioToWholeLengths(uint64_t *result, uint64_t *a2, double a3)
{
  if (a3 <= 0.0)
  {
    if (a3 >= 0.0)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      if (!result) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
    double v7 = 1.0 / a3;
    if (v7 < 0.0) {
      double v7 = -v7;
    }
    double v8 = v7 * 100.0;
  }
  else
  {
    if (a3 < 1.0) {
      double v3 = 1.0 / a3;
    }
    else {
      double v3 = a3;
    }
    double v4 = -(v3 + -1.0);
    if (v3 + -1.0 >= 0.0) {
      double v4 = v3 + -1.0;
    }
    if (v4 < 0.01)
    {
      uint64_t v5 = 1;
      uint64_t v6 = 1;
      if (!result) {
        goto LABEL_22;
      }
LABEL_21:
      *float64x2_t result = v6;
      goto LABEL_22;
    }
    double v9 = v3 + -1.3333;
    if (v3 + -1.3333 < 0.0) {
      double v9 = -(v3 + -1.3333);
    }
    if (v9 < 0.01)
    {
      BOOL v10 = a3 < 1.0;
      uint64_t v5 = 3;
      uint64_t v11 = 4;
      goto LABEL_45;
    }
    double v12 = v3 + -1.25;
    if (v3 + -1.25 < 0.0) {
      double v12 = -(v3 + -1.25);
    }
    if (v12 < 0.01)
    {
      BOOL v10 = a3 < 1.0;
      uint64_t v5 = 4;
      uint64_t v11 = 5;
      goto LABEL_45;
    }
    double v13 = v3 + -1.4;
    if (v3 + -1.4 < 0.0) {
      double v13 = -(v3 + -1.4);
    }
    if (v13 < 0.01)
    {
      BOOL v10 = a3 < 1.0;
      uint64_t v5 = 5;
      uint64_t v11 = 7;
      goto LABEL_45;
    }
    double v14 = v3 + -1.5;
    if (v3 + -1.5 < 0.0) {
      double v14 = -(v3 + -1.5);
    }
    if (v14 < 0.01)
    {
      BOOL v10 = a3 < 1.0;
      uint64_t v5 = 2;
      uint64_t v11 = 3;
      goto LABEL_45;
    }
    double v15 = v3 + -1.7777;
    if (v3 + -1.7777 < 0.0) {
      double v15 = -(v3 + -1.7777);
    }
    if (v15 < 0.01)
    {
      BOOL v10 = a3 < 1.0;
      uint64_t v5 = 9;
      uint64_t v11 = 16;
      goto LABEL_45;
    }
    double v16 = v3 + -1.375;
    if (v16 < 0.0) {
      double v16 = -v16;
    }
    if (v16 < 0.01)
    {
      BOOL v10 = a3 < 1.0;
      uint64_t v5 = 8;
      uint64_t v11 = 11;
LABEL_45:
      if (v10) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = v11;
      }
      if (v10) {
        uint64_t v5 = v11;
      }
      if (result) {
        goto LABEL_21;
      }
      goto LABEL_22;
    }
    double v8 = 1.0 / a3 * 100.0;
  }
  uint64_t v5 = (uint64_t)v8;
  uint64_t v6 = 100;
  if (result) {
    goto LABEL_21;
  }
LABEL_22:
  if (a2) {
    *a2 = v5;
  }
  return result;
}

double PFConstrainPointToRect(double a1, double a2, double a3, double a4, double a5)
{
  if (a1 >= a3)
  {
    double v5 = a3 + a5;
    a3 = a1;
    if (a1 > v5) {
      return v5;
    }
  }
  return a3;
}

uint64_t NSStringFromPFIntRect(void *a1)
{
  return [NSString stringWithFormat:@"{origin={%ld, %ld} size={%lu, %lu}}]", *a1, a1[1], a1[2], a1[3]];
}

void sub_1DD402B0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    [NSString stringWithFormat:@"error json-ifying data %@"];
    objc_claimAutoreleasedReturnValue();

    objc_end_catch();
    JUMPOUT(0x1DD402AB0);
  }
  _Unwind_Resume(exception_object);
}

void sub_1DD404C94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD404F50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float64_t PA::Quad2d::areaCenter(float64x2_t *this)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v2 = this + 2;
  float64x2_t v3 = this[2];
  double v4 = this + 1;
  float64x2_t v5 = this[1];
  __asm { FMOV            V3.2D, #0.5 }
  float64x2_t v28 = *this;
  float64x2_t v29 = vaddq_f64(v5, vmulq_f64(vsubq_f64(v3, v5), _Q3));
  float64x2_t v15 = v5;
  float64x2_t v16 = v29;
  int v30 = 0;
  float64x2_t v18 = v3;
  float64x2_t v20 = _Q3;
  float64x2_t v13 = *this;
  float64x2_t v11 = vaddq_f64(*this, vmulq_f64(vsubq_f64(v3, *this), _Q3));
  float64x2_t v25 = this[1];
  float64x2_t v26 = v11;
  int v27 = 0;
  if (PA::LineSegment2d::findIntersectPoint((uint64_t)&v28, (uint64_t)&v25, &v32) != 2)
  {
    _PFAssertFailHandler();
    goto LABEL_8;
  }
  float64x2_t v28 = this[3];
  float64x2_t v29 = v16;
  int v30 = 0;
  float64x2_t v17 = this[3];
  float64x2_t v25 = *v4;
  float64x2_t v26 = vaddq_f64(v18, vmulq_f64(vsubq_f64(v17, v18), v20));
  float64x2_t v19 = v26;
  int v27 = 0;
  if (PA::LineSegment2d::findIntersectPoint((uint64_t)&v28, (uint64_t)&v25, &v33) != 2)
  {
LABEL_8:
    _PFAssertFailHandler();
    goto LABEL_9;
  }
  float64x2_t v28 = *v4;
  float64x2_t v29 = vaddq_f64(v13, vmulq_f64(vsubq_f64(v17, v13), v20));
  float64x2_t v14 = v29;
  int v30 = 0;
  float64x2_t v25 = *this;
  float64x2_t v26 = vaddq_f64(v15, vmulq_f64(vsubq_f64(v17, v15), v20));
  int v27 = 0;
  if (PA::LineSegment2d::findIntersectPoint((uint64_t)&v28, (uint64_t)&v25, &v34) != 2)
  {
LABEL_9:
    _PFAssertFailHandler();
    goto LABEL_10;
  }
  float64x2_t v28 = *v2;
  float64x2_t v29 = v14;
  int v30 = 0;
  float64x2_t v25 = *this;
  float64x2_t v26 = v19;
  int v27 = 0;
  if (PA::LineSegment2d::findIntersectPoint((uint64_t)&v28, (uint64_t)&v25, &v35) != 2)
  {
LABEL_10:
    _PFAssertFailHandler();
LABEL_11:
    _PFAssertFailHandler();
  }
  v23[0] = v32;
  v23[1] = v33;
  int v24 = 0;
  v21[0] = v34;
  v21[1] = v35;
  int v22 = 0;
  if (PA::LineSegment2d::findIntersectPoint((uint64_t)v23, (uint64_t)v21, &v31) != 2) {
    goto LABEL_11;
  }
  return v31.f64[0];
}

long long *PA::Matrix4d::rotateAxis(long long *a1, uint64_t a2, double a3)
{
  long long v4 = a1[5];
  long long v29 = a1[4];
  long long v30 = v4;
  long long v5 = a1[7];
  long long v31 = a1[6];
  long long v32 = v5;
  long long v6 = a1[1];
  long long v25 = *a1;
  long long v26 = v6;
  long long v7 = a1[3];
  long long v27 = a1[2];
  long long v28 = v7;
  *(void *)&long long v7 = *(void *)(a2 + 8);
  double v8 = *(double *)(a2 + 16);
  double v9 = sqrt(*(double *)&v7 * *(double *)&v7 + *(double *)a2 * *(double *)a2 + v8 * v8);
  double v10 = *(double *)a2 / v9;
  double v11 = *(double *)&v7 / v9;
  double v12 = v8 / v9;
  __double2 v13 = __sincos_stret(a3);
  double v14 = v10 * (1.0 - v13.__cosval);
  double v15 = v11 * (1.0 - v13.__cosval);
  v21[0] = v13.__cosval + v14 * v10;
  v21[1] = v12 * v13.__sinval + v14 * v11;
  _OWORD v21[2] = -(v11 * v13.__sinval - v14 * v12);
  v21[3] = 0.0;
  v21[4] = -(v12 * v13.__sinval - v14 * v11);
  v21[5] = v13.__cosval + v15 * v11;
  v21[6] = v10 * v13.__sinval + v15 * v12;
  v21[7] = 0.0;
  v21[8] = v11 * v13.__sinval + v14 * v12;
  v21[9] = -(v10 * v13.__sinval - v15 * v12);
  v21[10] = v13.__cosval + v12 * (1.0 - v13.__cosval) * v12;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v24 = 0x3FF0000000000000;
  PA::Matrix4d::operator*=((double *)&v25, v21);
  long long v16 = v30;
  a1[4] = v29;
  a1[5] = v16;
  long long v17 = v32;
  a1[6] = v31;
  a1[7] = v17;
  long long v18 = v26;
  *a1 = v25;
  a1[1] = v18;
  long long v19 = v28;
  a1[2] = v27;
  a1[3] = v19;
  return a1;
}

double PA::Matrix4d::operator*=(double *a1, double *a2)
{
  double v3 = *a1;
  double v2 = a1[1];
  double v5 = a1[2];
  double v4 = a1[3];
  double v7 = a1[4];
  double v6 = a1[5];
  double v9 = a1[6];
  double v8 = a1[7];
  double v11 = a1[8];
  double v10 = a1[9];
  double v13 = a1[10];
  double v12 = a1[11];
  double v15 = a1[12];
  double v14 = a1[13];
  *a1 = v7 * a2[1] + *a1 * *a2 + v11 * a2[2] + v15 * a2[3];
  a1[4] = v7 * a2[5] + v3 * a2[4] + v11 * a2[6] + v15 * a2[7];
  double v17 = a1[14];
  double v16 = a1[15];
  a1[8] = v7 * a2[9] + v3 * a2[8] + v11 * a2[10] + v15 * a2[11];
  a1[12] = v7 * a2[13] + v3 * a2[12] + v11 * a2[14] + v15 * a2[15];
  a1[1] = v6 * a2[1] + v2 * *a2 + v10 * a2[2] + v14 * a2[3];
  a1[5] = v6 * a2[5] + v2 * a2[4] + v10 * a2[6] + v14 * a2[7];
  a1[9] = v6 * a2[9] + v2 * a2[8] + v10 * a2[10] + v14 * a2[11];
  a1[13] = v6 * a2[13] + v2 * a2[12] + v10 * a2[14] + v14 * a2[15];
  a1[2] = v9 * a2[1] + v5 * *a2 + v13 * a2[2] + v17 * a2[3];
  a1[6] = v9 * a2[5] + v5 * a2[4] + v13 * a2[6] + v17 * a2[7];
  a1[10] = v9 * a2[9] + v5 * a2[8] + v13 * a2[10] + v17 * a2[11];
  a1[14] = v9 * a2[13] + v5 * a2[12] + v13 * a2[14] + v17 * a2[15];
  a1[3] = v8 * a2[1] + v4 * *a2 + v12 * a2[2] + v16 * a2[3];
  a1[7] = v8 * a2[5] + v4 * a2[4] + v12 * a2[6] + v16 * a2[7];
  a1[11] = v8 * a2[9] + v4 * a2[8] + v12 * a2[10] + v16 * a2[11];
  double result = v8 * a2[13] + v4 * a2[12] + v12 * a2[14] + v16 * a2[15];
  a1[15] = result;
  return result;
}

uint64_t PA::LineSegment2d::findIntersectPoint(uint64_t a1, uint64_t a2, float64x2_t *a3)
{
  double v3 = *(double *)(a1 + 8);
  double v4 = *(double *)(a1 + 16) - *(double *)a1;
  double v5 = *(double *)(a1 + 24) - v3;
  double v6 = *(double *)(a2 + 16);
  double v7 = *(double *)(a2 + 24);
  double v8 = *(double *)(a2 + 8);
  double v9 = v6 - *(double *)a2;
  double v10 = v7 - v8;
  double v11 = *(double *)a2 - *(double *)a1;
  double v12 = v8 - v3;
  double v13 = v11 * v10 - v12 * v9;
  double v14 = v4 * v10 - v5 * v9;
  if (v14 == 0.0)
  {
    if (v13 == 0.0)
    {
      if (*(_DWORD *)(a1 + 32) | *(_DWORD *)(a2 + 32))
      {
        return 4;
      }
      else
      {
        BOOL v15 = v4 == 0.0;
        double v16 = v12 / v5;
        double v17 = (v7 - v3) / v5;
        double v18 = v6 - *(double *)a1;
        if (v4 == 0.0) {
          double v19 = v16;
        }
        else {
          double v19 = v11 / v4;
        }
        double v20 = v18 / v4;
        if (v15) {
          double v20 = v17;
        }
        uint64_t v21 = 3;
        if (v19 <= 1.0 || v20 <= 1.0)
        {
          if (v20 < 0.0 && v19 < 0.0) {
            return 3;
          }
          else {
            return 4;
          }
        }
      }
    }
    else
    {
      return 1;
    }
  }
  else
  {
    double v24 = (v4 * v12 - v11 * v5) / (v9 * v5 - v10 * v4);
    BOOL v25 = v13 / v14 < 0.0;
    if (v13 / v14 > 1.0) {
      BOOL v25 = 1;
    }
    BOOL v26 = *(_DWORD *)(a1 + 32) != 1 && v25;
    BOOL v27 = v24 <= 1.0 && v24 >= 0.0;
    uint64_t v21 = 1;
    if (!v26 && (*(_DWORD *)(a2 + 32) == 1 || v27))
    {
      if (a3) {
        *a3 = vaddq_f64(*(float64x2_t *)a1, vmulq_n_f64(vsubq_f64(*(float64x2_t *)(a1 + 16), *(float64x2_t *)a1), v13 / v14));
      }
      return 2;
    }
  }
  return v21;
}

void sub_1DD405738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void IPAScaledTimeFromNaturalTime(long long *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>, unsigned int a5@<S0>)
{
  *(_OWORD *)a4 = *a1;
  *(void *)(a4 + 16) = *((void *)a1 + 2);
  if ((*((unsigned char *)a3 + 12) & 1) == 0
    || (*((unsigned char *)a3 + 36) & 1) == 0
    || *((void *)a3 + 5)
    || (*((void *)a3 + 3) & 0x8000000000000000) != 0
    || (long long v15 = *(long long *)((char *)a3 + 24),
        *(void *)&long long v16 = *((void *)a3 + 5),
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
        CMTimeCompare((CMTime *)&v15, &time2)))
  {
    long long v15 = *a2;
    *(void *)&long long v16 = *((void *)a2 + 2);
    Float64 Seconds = CMTimeGetSeconds((CMTime *)&v15);
    long long v11 = a3[1];
    long long v15 = *a3;
    long long v16 = v11;
    long long v17 = a3[2];
    double v12 = objc_msgSend(MEMORY[0x1E4F8CDA0], "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", &v15, 0, Seconds, COERCE_DOUBLE(__PAIR64__(DWORD1(v17), a5)));
    if (v12)
    {
      long long v15 = *a1;
      *(void *)&long long v16 = *((void *)a1 + 2);
      Float64 v13 = CMTimeGetSeconds((CMTime *)&v15);
      *(float *)&Float64 v13 = v13;
      [v12 scaledTimeForOriginalTime:v13];
      CMTimeMakeWithSeconds((CMTime *)&v15, v14, 90000);
      *(_OWORD *)a4 = v15;
      *(void *)(a4 + 16) = v16;
    }
  }
}

void IPANaturalTimeFromScaledTime(long long *a1@<X0>, long long *a2@<X1>, long long *a3@<X2>, uint64_t a4@<X8>, unsigned int a5@<S0>)
{
  *(_OWORD *)a4 = *a1;
  *(void *)(a4 + 16) = *((void *)a1 + 2);
  if ((*((unsigned char *)a3 + 12) & 1) == 0
    || (*((unsigned char *)a3 + 36) & 1) == 0
    || *((void *)a3 + 5)
    || (*((void *)a3 + 3) & 0x8000000000000000) != 0
    || (long long v15 = *(long long *)((char *)a3 + 24),
        *(void *)&long long v16 = *((void *)a3 + 5),
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
        CMTimeCompare((CMTime *)&v15, &time2)))
  {
    long long v15 = *a2;
    *(void *)&long long v16 = *((void *)a2 + 2);
    Float64 Seconds = CMTimeGetSeconds((CMTime *)&v15);
    long long v11 = a3[1];
    long long v15 = *a3;
    long long v16 = v11;
    long long v17 = a3[2];
    double v12 = objc_msgSend(MEMORY[0x1E4F8CDA0], "timeRangeMapperForSourceDuration:slowMotionRate:slowMotionTimeRange:forExport:", &v15, 0, Seconds, COERCE_DOUBLE(__PAIR64__(DWORD1(v17), a5)));
    if (v12)
    {
      long long v15 = *a1;
      *(void *)&long long v16 = *((void *)a1 + 2);
      Float64 v13 = CMTimeGetSeconds((CMTime *)&v15);
      *(float *)&Float64 v13 = v13;
      [v12 originalTimeForScaledTime:v13];
      CMTimeMakeWithSeconds((CMTime *)&v15, v14, 90000);
      *(_OWORD *)a4 = v15;
      *(void *)(a4 + 16) = v16;
    }
  }
}

__n128 IPAClipTime@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = *(_OWORD *)a1;
  *(void *)(a3 + 16) = *(void *)(a1 + 16);
  memset(&v10, 0, sizeof(v10));
  long long v6 = a2[1];
  *(_OWORD *)&range.start.value = *a2;
  *(_OWORD *)&range.start.epoch = v6;
  *(_OWORD *)&range.duration.timescale = a2[2];
  CMTimeRangeGetEnd(&v10, &range);
  *(_OWORD *)&range.start.value = *(_OWORD *)a1;
  range.start.epoch = *(void *)(a1 + 16);
  CMTime v8 = *(CMTime *)a2;
  if (CMTimeCompare(&range.start, &v8) < 0)
  {
    __n128 result = *(__n128 *)a2;
    *(_OWORD *)a3 = *a2;
    *(void *)(a3 + 16) = *((void *)a2 + 2);
  }
  else
  {
    *(_OWORD *)&range.start.value = *(_OWORD *)a1;
    range.start.epoch = *(void *)(a1 + 16);
    CMTime v8 = v10;
    if (CMTimeCompare(&range.start, &v8) >= 1)
    {
      result.n128_u64[0] = v10.value;
      *(CMTime *)a3 = v10;
      if (*(_DWORD *)(a3 + 8) != 1) {
        --*(void *)a3;
      }
    }
  }
  return result;
}

double IPAClipTimeRange@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)a1;
  time1.start.epoch = *(void *)(a1 + 16);
  CMTime time2 = *(CMTime *)a2;
  if (CMTimeCompare(&time1.start, &time2) >= 0) {
    long long v6 = (CMTime *)a1;
  }
  else {
    long long v6 = (CMTime *)a2;
  }
  CMTime time2 = *v6;
  memset(&v17, 0, sizeof(v17));
  long long v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)a2;
  *(_OWORD *)&time1.start.epoch = v7;
  *(_OWORD *)&time1.duration.timescale = *(_OWORD *)(a2 + 32);
  CMTimeRangeGetEnd(&v17, &time1);
  long long v8 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)a1;
  *(_OWORD *)&time1.start.epoch = v8;
  *(_OWORD *)&time1.duration.timescale = *(_OWORD *)(a1 + 32);
  CMTimeRangeGetEnd(&v15, &time1);
  time1.CMTime start = v17;
  if (CMTimeCompare(&v15, &time1.start) < 1)
  {
    long long v10 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)a1;
    *(_OWORD *)&time1.start.epoch = v10;
    *(_OWORD *)&time1.duration.timescale = *(_OWORD *)(a1 + 32);
    CMTimeRangeGetEnd(&start, &time1);
    CMTimeValue value = start.value;
    long long v18 = *(_OWORD *)&start.timescale;
  }
  else
  {
    long long v18 = *(_OWORD *)&v17.timescale;
    CMTimeValue value = v17.value - 1;
  }
  a3[1] = 0u;
  a3[2] = 0u;
  *a3 = 0u;
  time1.CMTime start = time2;
  start.CMTimeValue value = value;
  *(_OWORD *)&start.timescale = v18;
  if (CMTimeCompare(&time1.start, &start) < 0)
  {
    CMTime start = time2;
    v13.CMTimeValue value = value;
    *(_OWORD *)&v13.timescale = v18;
    CMTimeRangeFromTimeToTime(&time1, &start, &v13);
  }
  else
  {
    CMTime start = time2;
    CMTime v13 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    CMTimeRangeMake(&time1, &start, &v13);
  }
  long long v11 = *(_OWORD *)&time1.start.epoch;
  *a3 = *(_OWORD *)&time1.start.value;
  a3[1] = v11;
  double result = *(double *)&time1.duration.timescale;
  a3[2] = *(_OWORD *)&time1.duration.timescale;
  return result;
}

CMTime *IPAMapNormalizedTime@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int v6 = *(_DWORD *)(a2 + 12);
  if ((v6 & 1) == 0
    || (int v7 = *(_DWORD *)(a2 + 36), (v7 & 1) == 0)
    || *(void *)(a2 + 40)
    || (*(void *)(a2 + 24) & 0x8000000000000000) != 0)
  {
    long long v14 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)a2;
    *(_OWORD *)&range.start.epoch = v14;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a2 + 32);
    CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &range);
    _PFAssertFailHandler();
LABEL_15:
    start.start.CMTimeValue value = *(void *)v3;
    start.start.timescale = *(_DWORD *)(v3 + 8);
    start.start.flags = v9;
    start.start.epoch = v10;
    CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &start.start);
    _PFAssertFailHandler();
    goto LABEL_16;
  }
  if (((v7 | v6) & 0x10) != 0)
  {
    long long v8 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)a2;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a2 + 32);
    CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &range);
    a1 = _PFAssertFailHandler();
  }
  uint64_t v3 = a1;
  memset(&range, 0, sizeof(range));
  CMTimeMake(&duration, 1, 1);
  *(_OWORD *)&start.start.CMTimeValue value = *MEMORY[0x1E4F1FA48];
  start.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  CMTimeRangeMake(&range, &start.start, &duration);
  long long v19 = 0uLL;
  CMTimeEpoch v20 = 0;
  CMTimeFlags v9 = *(_DWORD *)(v3 + 12);
  CMTimeEpoch v10 = *(void *)(v3 + 16);
  if ((v9 & 1) == 0) {
    goto LABEL_15;
  }
  if ((*(_DWORD *)(v3 + 12) & 0x1D) != 1)
  {
LABEL_16:
    start.start.CMTimeValue value = *(void *)v3;
    start.start.timescale = *(_DWORD *)(v3 + 8);
    start.start.flags = v9;
    start.start.epoch = v10;
    CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &start.start);
    uint64_t v15 = _PFAssertFailHandler();
    return (CMTime *)IPAMapNormalizedTimeRange(v15);
  }
  start.start.CMTimeValue value = *(void *)v3;
  start.start.timescale = *(_DWORD *)(v3 + 8);
  start.start.flags = v9;
  start.start.epoch = v10;
  double Seconds = CMTimeGetSeconds(&start.start);
  if (Seconds < 0.0 || Seconds > 1.0)
  {
    *(_OWORD *)&toRange.start.CMTimeValue value = *(_OWORD *)v3;
    toRange.start.epoch = *(void *)(v3 + 16);
    CMTimeRange start = range;
    IPAClipTime((uint64_t)&toRange, &start, (uint64_t)&v19);
  }
  else
  {
    long long v19 = *(_OWORD *)v3;
    CMTimeEpoch v20 = *(void *)(v3 + 16);
  }
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  v17.epoch = v20;
  CMTimeRange start = range;
  long long v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&toRange.start.CMTimeValue value = *(_OWORD *)a2;
  *(_OWORD *)&toRange.start.epoch = v12;
  *(_OWORD *)&toRange.duration.timescale = *(_OWORD *)(a2 + 32);
  *(_OWORD *)&v17.CMTimeValue value = v19;
  return CMTimeMapTimeFromRangeToRange((CMTime *)a3, &v17, &start, &toRange);
}

$3CC8671D27C23BF42ADDB32F2B5E48AE *IPAMapNormalizedTimeRange@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  int v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & 1) == 0
    || (int v5 = *(_DWORD *)(a1 + 36), (v5 & 1) == 0)
    || *(void *)(a1 + 40)
    || (*(void *)(a1 + 24) & 0x8000000000000000) != 0)
  {
    long long v13 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)a1;
    *(_OWORD *)&range.start.epoch = v13;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 32);
    CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &range);
    long long v14 = (IPAVideoPlaybackSettings *)_PFAssertFailHandler();
    return [(IPAVideoPlaybackSettings *)v16 naturalDuration];
  }
  else
  {
    if (((v5 | v4) & 0x10) != 0)
    {
      long long v6 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)a1;
      *(_OWORD *)&range.start.epoch = v6;
      *(_OWORD *)&range.duration.timescale = *(_OWORD *)(a1 + 32);
      CMTimeRangeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &range);
      a1 = _PFAssertFailHandler();
    }
    int v7 = a2;
    long long v8 = *(_OWORD *)(a1 + 16);
    CMTime v18 = *(CMTime *)a1;
    memset(&v21, 0, sizeof(v21));
    long long v9 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&range.start.CMTimeValue value = *(_OWORD *)a1;
    *(_OWORD *)&range.start.epoch = v8;
    *(_OWORD *)&range.duration.timescale = v9;
    CMTimeRangeGetEnd(&v21, &range);
    long long v19 = 0uLL;
    CMTimeEpoch v20 = 0;
    long long v10 = v7[1];
    *(_OWORD *)&range.start.CMTimeValue value = *v7;
    *(_OWORD *)&range.start.epoch = v10;
    *(_OWORD *)&range.duration.timescale = v7[2];
    IPAMapNormalizedTime((uint64_t)&v18, (uint64_t)&range, (uint64_t)&v19);
    memset(&v18, 0, sizeof(v18));
    CMTime end = v21;
    long long v11 = v7[1];
    *(_OWORD *)&range.start.CMTimeValue value = *v7;
    *(_OWORD *)&range.start.epoch = v11;
    *(_OWORD *)&range.duration.timescale = v7[2];
    IPAMapNormalizedTime((uint64_t)&end, (uint64_t)&range, (uint64_t)&v18);
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)&range.start.CMTimeValue value = v19;
    range.start.epoch = v20;
    CMTime end = v18;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeRangeFromTimeToTime((CMTimeRange *)a3, &range.start, &end);
  }
}

void sub_1DD407028(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4071CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4072EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id thresholdForSizePolicy(void *a1)
{
  id v1 = a1;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __thresholdForSizePolicy_block_invoke;
  v5[3] = &unk_1E6CC1A58;
  id v6 = v1;
  id v2 = v1;
  uint64_t v3 = (void *)MEMORY[0x1E01B4F20](v5);

  return v3;
}

BOOL __thresholdForSizePolicy_block_invoke(uint64_t a1, double a2, double a3)
{
  double v3 = a2 * 1.05;
  double v4 = a3 * 1.05;
  objc_msgSend(*(id *)(a1 + 32), "transformSize:", a2 * 1.05, a3 * 1.05);
  return v4 != v6 || v3 != v5;
}

__CFString *NSStringFromImageStyle(int a1)
{
  double result = 0;
  if (a1 > 31)
  {
    double v3 = @"RKImageStyleFullSizePreview";
    double v4 = @"RKImageStyleFaceTile";
    double v5 = @"RKImageStyleMicro";
    if (a1 != 4096) {
      double v5 = 0;
    }
    if (a1 != 2048) {
      double v4 = v5;
    }
    if (a1 != 256) {
      double v3 = v4;
    }
    double v6 = @"RKImageStyleMaster";
    int v7 = @"RKImageStyleLargePreview";
    if (a1 != 128) {
      int v7 = 0;
    }
    if (a1 != 32) {
      double v6 = v7;
    }
    if (a1 <= 255) {
      return v6;
    }
    else {
      return v3;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        double result = @"RKImageStyleNotSpecified";
        break;
      case 1:
        double result = @"RKImageStyleTiny";
        break;
      case 2:
        double result = @"RKImageStyleMini";
        break;
      case 4:
        double result = @"RKImageStyleThumbnail";
        break;
      case 8:
        double result = @"RKImageStyleMasterThumbnail";
        break;
      default:
        return result;
    }
  }
  return result;
}

__CFString *NSStringFromImageStyleShort(int a1)
{
  double result = 0;
  if (a1 > 31)
  {
    double v3 = @"fullszpv";
    double v4 = @"facetile";
    double v5 = @"micro";
    if (a1 != 4096) {
      double v5 = 0;
    }
    if (a1 != 2048) {
      double v4 = v5;
    }
    if (a1 != 256) {
      double v3 = v4;
    }
    double v6 = @"master";
    int v7 = @"largepv";
    if (a1 != 128) {
      int v7 = 0;
    }
    if (a1 != 32) {
      double v6 = v7;
    }
    if (a1 <= 255) {
      return v6;
    }
    else {
      return v3;
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        double result = @"notspec";
        break;
      case 1:
        double result = @"tiny";
        break;
      case 2:
        double result = @"mini";
        break;
      case 4:
        double result = @"thumb";
        break;
      case 8:
        double result = @"mstrthum";
        break;
      default:
        return result;
    }
  }
  return result;
}

void sub_1DD40A4E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id PA::Matrix4d::description(PA::Matrix4d *this)
{
  id v2 = [MEMORY[0x1E4F28E78] string];
  objc_msgSend(v2, "appendFormat:", @"%12.4f %12.4f %12.4f %12.4f\n", *(void *)this, *((void *)this + 4), *((void *)this + 8), *((void *)this + 12));
  objc_msgSend(v2, "appendFormat:", @"%12.4f %12.4f %12.4f %12.4f\n", *((void *)this + 1), *((void *)this + 5), *((void *)this + 9), *((void *)this + 13));
  objc_msgSend(v2, "appendFormat:", @"%12.4f %12.4f %12.4f %12.4f\n", *((void *)this + 2), *((void *)this + 6), *((void *)this + 10), *((void *)this + 14));
  objc_msgSend(v2, "appendFormat:", @"%12.4f %12.4f %12.4f %12.4f\n", *((void *)this + 3), *((void *)this + 7), *((void *)this + 11), *((void *)this + 15));
  return v2;
}

void sub_1DD40A604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD40A774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL PA::Matrix4d::invert(PA::Matrix4d *this)
{
  uint64_t v1 = 0;
  memset(&v49[8], 0, 32);
  *(void *)v49 = 0x3FF0000000000000;
  *(void *)&v49[40] = 0x3FF0000000000000;
  long long v50 = 0u;
  long long v51 = 0u;
  memset(&v52[8], 0, 32);
  *(void *)v52 = 0x3FF0000000000000;
  *(void *)&v52[40] = 0x3FF0000000000000;
  long long v2 = *((_OWORD *)this + 5);
  long long v45 = *((_OWORD *)this + 4);
  long long v46 = v2;
  long long v3 = *((_OWORD *)this + 7);
  long long v47 = *((_OWORD *)this + 6);
  long long v48 = v3;
  long long v4 = *((_OWORD *)this + 1);
  long long v41 = *(_OWORD *)this;
  long long v42 = v4;
  long long v5 = *((_OWORD *)this + 3);
  double v6 = (char *)&v41 + 8;
  long long v43 = *((_OWORD *)this + 2);
  long long v44 = v5;
  while (1)
  {
    double v7 = *((double *)&v41 + 5 * v1);
    if (v1 == 3)
    {
      uint64_t v8 = 15;
      uint64_t v9 = 11;
      uint64_t v10 = 7;
    }
    else
    {
      uint64_t v11 = 0;
      uint64_t v12 = v1;
      do
      {
        double v13 = fabs(*(double *)&v6[8 * v11]);
        double v14 = fabs(v7);
        if (v13 > v14) {
          double v7 = *(double *)&v6[8 * v11];
        }
        ++v11;
        if (v13 > v14) {
          uint64_t v12 = v1 + v11;
        }
      }
      while (v1 + v11 != 3);
      uint64_t v10 = v1 + 4;
      uint64_t v9 = v1 + 8;
      uint64_t v8 = v1 + 12;
      if (v12 != v1)
      {
        uint64_t v15 = *(void *)&v49[8 * v1];
        *(void *)&v49[8 * v1] = *(void *)&v49[8 * v12];
        *(void *)&v49[8 * v12] = v15;
        uint64_t v16 = *((void *)&v41 + v1);
        *((void *)&v41 + v1) = *((void *)&v41 + v12);
        *((void *)&v41 + v12) = v16;
        uint64_t v17 = 8 * v12;
        uint64_t v18 = v17 + 32;
        uint64_t v19 = *(void *)&v49[8 * v10];
        *(void *)&v49[8 * v10] = *(void *)&v49[v17 + 32];
        *(void *)&v49[v18] = v19;
        uint64_t v20 = *((void *)&v41 + v10);
        *((void *)&v41 + v10) = *(void *)((char *)&v41 + v17 + 32);
        *(void *)((char *)&v41 + v18) = v20;
        uint64_t v21 = v17 + 64;
        uint64_t v22 = *(void *)&v49[8 * v9];
        *(void *)&v49[8 * v9] = *(void *)&v49[v17 + 64];
        *(void *)&v49[v21] = v22;
        uint64_t v23 = *((void *)&v41 + v9);
        *((void *)&v41 + v9) = *(void *)((char *)&v41 + v17 + 64);
        *(void *)((char *)&v41 + v21) = v23;
        v17 += 96;
        uint64_t v24 = *(void *)&v49[8 * v8];
        *(void *)&v49[8 * v8] = *(void *)&v49[v17];
        *(void *)&v49[v17] = v24;
        uint64_t v25 = *((void *)&v41 + v8);
        *((void *)&v41 + v8) = *(void *)((char *)&v41 + v17);
        *(void *)((char *)&v41 + v17) = v25;
      }
    }
    if (v7 == 0.0) {
      return v7 != 0.0;
    }
    double v26 = 1.0 / v7 * *((double *)&v41 + v1);
    *((double *)&v41 + v1) = v26;
    double v27 = 1.0 / v7 * *(double *)&v49[8 * v1];
    *(double *)&v49[8 * v1] = v27;
    *((double *)&v41 + v10) = 1.0 / v7 * *((double *)&v41 + v10);
    *(double *)&v49[8 * v10] = 1.0 / v7 * *(double *)&v49[8 * v10];
    *((double *)&v41 + v9) = 1.0 / v7 * *((double *)&v41 + v9);
    *(double *)&v49[8 * v9] = 1.0 / v7 * *(double *)&v49[8 * v9];
    *((double *)&v41 + v8) = 1.0 / v7 * *((double *)&v41 + v8);
    *(double *)&v49[8 * v8] = 1.0 / v7 * *(double *)&v49[8 * v8];
    uint64_t v28 = 32 * v1;
    if (!v1) {
      goto LABEL_16;
    }
    double v29 = *((double *)&v41 + 4 * v1);
    *(double *)&long long v41 = *(double *)&v41 - v26 * v29;
    *(double *)v49 = *(double *)v49 - v27 * v29;
    double v30 = *(double *)&v49[8 * v10];
    *(double *)&long long v43 = *(double *)&v43 - *((double *)&v41 + v10) * v29;
    *(double *)&v49[32] = *(double *)&v49[32] - v30 * v29;
    *(double *)&long long v45 = *(double *)&v45 - *((double *)&v41 + v9) * v29;
    *(double *)&long long v51 = *(double *)&v51 - *(double *)&v49[8 * v9] * v29;
    *(double *)&long long v47 = *(double *)&v47 - *((double *)&v41 + v8) * v29;
    *(double *)&v52[16] = *(double *)&v52[16] - *(double *)&v49[8 * v8] * v29;
    if (v1 != 1)
    {
      double v26 = *((double *)&v41 + v1);
      double v27 = *(double *)&v49[8 * v1];
LABEL_16:
      double v31 = *(double *)((char *)&v41 + (v28 | 8));
      *((double *)&v41 + 1) = *((double *)&v41 + 1) - v26 * v31;
      *(double *)&v49[8] = *(double *)&v49[8] - v27 * v31;
      double v32 = *(double *)&v49[8 * v10];
      *((double *)&v43 + 1) = *((double *)&v43 + 1) - *((double *)&v41 + v10) * v31;
      *(double *)&v49[40] = *(double *)&v49[40] - v32 * v31;
      *((double *)&v45 + 1) = *((double *)&v45 + 1) - *((double *)&v41 + v9) * v31;
      *((double *)&v51 + 1) = *((double *)&v51 + 1) - *(double *)&v49[8 * v9] * v31;
      *((double *)&v47 + 1) = *((double *)&v47 + 1) - *((double *)&v41 + v8) * v31;
      *(double *)&v52[24] = *(double *)&v52[24] - *(double *)&v49[8 * v8] * v31;
      if (v1 == 2) {
        goto LABEL_18;
      }
    }
    double v33 = *(double *)((char *)&v41 + (v28 | 0x10));
    *(double *)&long long v42 = *(double *)&v42 - *((double *)&v41 + v1) * v33;
    *(double *)&v49[16] = *(double *)&v49[16] - *(double *)&v49[8 * v1] * v33;
    double v34 = *(double *)&v49[8 * v10];
    *(double *)&long long v44 = *(double *)&v44 - *((double *)&v41 + v10) * v33;
    *(double *)&long long v50 = *(double *)&v50 - v34 * v33;
    *(double *)&long long v46 = *(double *)&v46 - *((double *)&v41 + v9) * v33;
    *(double *)v52 = *(double *)v52 - *(double *)&v49[8 * v9] * v33;
    *(double *)&long long v48 = *(double *)&v48 - *((double *)&v41 + v8) * v33;
    *(double *)&v52[32] = *(double *)&v52[32] - *(double *)&v49[8 * v8] * v33;
    if (v1 == 3)
    {
      long long v36 = *(_OWORD *)v52;
      *((_OWORD *)this + 4) = v51;
      *((_OWORD *)this + 5) = v36;
      long long v37 = *(_OWORD *)&v52[32];
      *((_OWORD *)this + 6) = *(_OWORD *)&v52[16];
      *((_OWORD *)this + 7) = v37;
      long long v38 = *(_OWORD *)&v49[16];
      *(_OWORD *)this = *(_OWORD *)v49;
      *((_OWORD *)this + 1) = v38;
      long long v39 = v50;
      *((_OWORD *)this + 2) = *(_OWORD *)&v49[32];
      *((_OWORD *)this + 3) = v39;
      return v7 != 0.0;
    }
LABEL_18:
    double v35 = *(double *)((char *)&v41 + (v28 | 0x18));
    *((double *)&v42 + 1) = *((double *)&v42 + 1) - *((double *)&v41 + v1) * v35;
    *(double *)&v49[24] = *(double *)&v49[24] - *(double *)&v49[8 * v1] * v35;
    *((double *)&v44 + 1) = *((double *)&v44 + 1) - *((double *)&v41 + v10) * v35;
    *((double *)&v50 + 1) = *((double *)&v50 + 1) - *(double *)&v49[8 * v10] * v35;
    *((double *)&v46 + 1) = *((double *)&v46 + 1) - *((double *)&v41 + v9) * v35;
    *(double *)&v52[8] = *(double *)&v52[8] - *(double *)&v49[8 * v9] * v35;
    *((double *)&v48 + 1) = *((double *)&v48 + 1) - *((double *)&v41 + v8) * v35;
    *(double *)&v52[40] = *(double *)&v52[40] - *(double *)&v49[8 * v8] * v35;
    v6 += 40;
    ++v1;
  }
}

id IPAAdjustmentGetLog()
{
  if (IPAMakeLogs_predicate != -1) {
    dispatch_once(&IPAMakeLogs_predicate, &__block_literal_global_509);
  }
  v0 = (void *)adjustmentLog;
  return v0;
}

uint64_t __IPAMakeLogs_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos.imaging", "adjustments");
  uint64_t v1 = (void *)adjustmentLog;
  adjustmentLog = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.photos.imaging", "video");
  long long v3 = (void *)videoLog;
  videoLog = (uint64_t)v2;

  colorTransformLog = (uint64_t)os_log_create("com.apple.photos.imaging", "colortransform");
  return MEMORY[0x1F41817F8]();
}

id IPAVideoGetLog()
{
  if (IPAMakeLogs_predicate != -1) {
    dispatch_once(&IPAMakeLogs_predicate, &__block_literal_global_509);
  }
  os_log_t v0 = (void *)videoLog;
  return v0;
}

id IPAColorTransformGetLog()
{
  if (IPAMakeLogs_predicate != -1) {
    dispatch_once(&IPAMakeLogs_predicate, &__block_literal_global_509);
  }
  os_log_t v0 = (void *)colorTransformLog;
  return v0;
}

id IPAAdjustmentError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  if ([v10 length])
  {
    uint64_t v16 = &a9;
    uint64_t v11 = [[NSString alloc] initWithFormat:v10 arguments:&a9];
    uint64_t v12 = (void *)v11;
    if (v11)
    {
      uint64_t v17 = @"reason";
      v18[0] = v11;
      double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  double v13 = 0;
LABEL_6:
  double v14 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"IPAAdjustmentErrorDomain", a1, v13, v16);

  return v14;
}

void IPAAdjustmentCurrentVersionForIdentifier(void *a1)
{
  id v1 = a1;
  os_log_t v2 = v1;
  if (IPAAdjustmentCurrentVersionForIdentifier_s_guard != -1)
  {
    dispatch_once(&IPAAdjustmentCurrentVersionForIdentifier_s_guard, &__block_literal_global_831);
    if (v2) {
      goto LABEL_3;
    }
LABEL_9:
    _PFAssertFailHandler();
    __IPAAdjustmentCurrentVersionForIdentifier_block_invoke();
    return;
  }
  if (!v1) {
    goto LABEL_9;
  }
LABEL_3:
  long long v3 = [(id)IPAAdjustmentCurrentVersionForIdentifier_s_currentVersionMapping objectForKeyedSubscript:v2];
  if (!v3)
  {
    long long v3 = +[IPAAdjustmentVersion versionForMajor:1 minor:0];
  }

  id v4 = v3;
}

void __IPAAdjustmentCurrentVersionForIdentifier_block_invoke()
{
  v14[11] = *MEMORY[0x1E4F143B8];
  v13[0] = @"Effect";
  uint64_t v12 = +[IPAAdjustmentVersion versionFromArchivalRepresentation:@"1"];
  v14[0] = v12;
  v13[1] = @"Crop";
  os_log_t v0 = +[IPAAdjustmentVersion versionFromArchivalRepresentation:@"1"];
  v14[1] = v0;
  v13[2] = @"SmartTone";
  id v1 = +[IPAAdjustmentVersion versionFromArchivalRepresentation:@"1"];
  v14[2] = v1;
  v13[3] = @"SmartBlackAndWhite";
  os_log_t v2 = +[IPAAdjustmentVersion versionFromArchivalRepresentation:@"1"];
  v14[3] = v2;
  v13[4] = @"WhiteBalance";
  long long v3 = +[IPAAdjustmentVersion versionFromArchivalRepresentation:@"1"];
  v14[4] = v3;
  v13[5] = @"RedEyeBB";
  id v4 = +[IPAAdjustmentVersion versionFromArchivalRepresentation:@"1"];
  v14[5] = v4;
  v13[6] = @"AutoEnhance";
  long long v5 = +[IPAAdjustmentVersion versionFromArchivalRepresentation:@"1"];
  v14[6] = v5;
  v13[7] = @"PosterFrame";
  double v6 = +[IPAAdjustmentVersion versionForMajor:1 minor:0];
  v14[7] = v6;
  v13[8] = @"Trim";
  double v7 = +[IPAAdjustmentVersion versionForMajor:1 minor:0];
  v14[8] = v7;
  v13[9] = @"SloMo";
  uint64_t v8 = +[IPAAdjustmentVersion versionForMajor:1 minor:0];
  v14[9] = v8;
  v13[10] = @"PortraitVideo";
  uint64_t v9 = +[IPAAdjustmentVersion versionForMajor:1 minor:0];
  v14[10] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:11];
  uint64_t v11 = (void *)IPAAdjustmentCurrentVersionForIdentifier_s_currentVersionMapping;
  IPAAdjustmentCurrentVersionForIdentifier_s_currentVersionMapping = v10;
}

uint64_t IPAAdjustmentsComeFromSupportedApp(void *a1)
{
  id v1 = a1;
  os_log_t v2 = v1;
  if (IPAAdjustmentsComeFromSupportedApp_s_guard != -1)
  {
    dispatch_once(&IPAAdjustmentsComeFromSupportedApp_s_guard, &__block_literal_global_497);
    if (v2) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v4 = 1;
    goto LABEL_9;
  }
  if (!v1) {
    goto LABEL_8;
  }
LABEL_3:
  long long v3 = [v2 lowercaseString];
  if (v3) {
    uint64_t v4 = [(id)IPAAdjustmentsComeFromSupportedApp_s_supportedOriginators containsObject:v3];
  }
  else {
    uint64_t v4 = 0;
  }

LABEL_9:
  return v4;
}

void __IPAAdjustmentsComeFromSupportedApp_block_invoke()
{
  v7[5] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v1 = objc_msgSend(@"com.apple.photos", "lowercaseString", @"com.apple.osx.photos", @"com.apple.photos.osx");
  v7[2] = v1;
  os_log_t v2 = [@"com.apple.mobileslideshow" lowercaseString];
  v7[3] = v2;
  long long v3 = [@"com.apple.camera" lowercaseString];
  v7[4] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:5];
  uint64_t v5 = [v0 setWithArray:v4];
  double v6 = (void *)IPAAdjustmentsComeFromSupportedApp_s_supportedOriginators;
  IPAAdjustmentsComeFromSupportedApp_s_supportedOriginators = v5;
}

uint64_t IPAAdjustmentsComeFromOSXPhotos(void *a1)
{
  id v1 = a1;
  if (IPAAdjustmentsComeFromOSXPhotos_s_guard != -1) {
    dispatch_once(&IPAAdjustmentsComeFromOSXPhotos_s_guard, &__block_literal_global_507);
  }
  os_log_t v2 = [v1 lowercaseString];
  if (v2) {
    uint64_t v3 = [(id)IPAAdjustmentsComeFromOSXPhotos_s_supportedOriginators containsObject:v2];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

void __IPAAdjustmentsComeFromOSXPhotos_block_invoke()
{
  v5[3] = *MEMORY[0x1E4F143B8];
  os_log_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  id v1 = objc_msgSend(@"com.apple.photos", "lowercaseString", @"com.apple.osx.photos", @"com.apple.photos.osx");
  v5[2] = v1;
  os_log_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  uint64_t v3 = [v0 setWithArray:v2];
  uint64_t v4 = (void *)IPAAdjustmentsComeFromOSXPhotos_s_supportedOriginators;
  IPAAdjustmentsComeFromOSXPhotos_s_supportedOriginators = v3;
}

void sub_1DD40B8AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void std::vector<PA::Rect>::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E6CC1908, MEMORY[0x1E4FBA1D0]);
}

void sub_1DD40B94C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1)
{
  double result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

void sub_1DD40BC64(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<PA::Rect>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PA::Rect>>(unint64_t a1)
{
  if (a1 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  id v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::__throw_length_error[abi:ne180100]()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception);
  __cxa_throw(exception, (struct type_info *)off_1E6CC1900, MEMORY[0x1E4FBA1C8]);
}

void sub_1DD40BD38(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1)
{
  double result = std::logic_error::logic_error(a1, "vector");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1DD40BFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

char *std::vector<PA::Rect>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::vector<PA::Rect>::__throw_length_error[abi:ne180100]();
  }
  double result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PA::Rect>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void sub_1DD40C244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1DD40C2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD40C45C(_Unwind_Exception *a1)
{
  uint64_t v5 = *(void **)v3;
  if (*(void *)v3)
  {
    *(void *)(v3 + 8) = v5;
    operator delete(v5);
  }
  MEMORY[0x1E01B4BC0](v3, 0x20C40960023A9);

  _Unwind_Resume(a1);
}

void sub_1DD40C568(_Unwind_Exception *a1)
{
  MEMORY[0x1E01B4BC0](v2, 0x20C40960023A9);

  _Unwind_Resume(a1);
}

void sub_1DD40C614(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD40FC8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD40FD5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD40FDA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD40FE34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD410058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1DD4106CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DD410924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PA::Region::Includes(PA::Region *this, const PA::Region *a2)
{
  if (!*((void *)a2 + 3)) {
    return 0;
  }
  std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set((uint64_t)v5, (uint64_t)a2);
  PA::Region::Break(*((void *)this + 2), (uint64_t)v5);
  PA::Region::MergeVertically((PA::Region *)v5);
  BOOL v3 = v6 == 0;
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v5);
  return v3;
}

void sub_1DD410AF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (i = *(void **)(a2 + 16); i; i = (void *)*i)
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect const&>(a1, i + 2, (uint64_t)(i + 2));
  return a1;
}

void sub_1DD410B64(_Unwind_Exception *a1)
{
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Break(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (uint64_t *)(a2 + 16);
    do
    {
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v5 = (double *)(v3 + 16);
      uint64_t v6 = v4;
      int v25 = 1065353216;
      while (1)
      {
        uint64_t v6 = (uint64_t *)*v6;
        if (!v6) {
          break;
        }
        double v7 = (double *)(v6 + 2);
        if (PA::Rect::Intersects((CGRect *)(v6 + 2), (const Rect *)(v3 + 16)))
        {
          double v8 = *((double *)v6 + 2);
          double v9 = *((double *)v6 + 3);
          double v10 = *((double *)v6 + 4);
          double v11 = *((double *)v6 + 5);
          double v12 = *(double *)(v3 + 24);
          if (v9 >= v12)
          {
            double v15 = *((double *)v6 + 2);
            double v14 = *(double *)(v3 + 24);
            double v12 = *((double *)v6 + 3);
            double v13 = *((double *)v6 + 5);
          }
          else
          {
            *(void *)&long long v26 = v6[2];
            *((double *)&v26 + 1) = v9;
            v27[0] = v10;
            v27[1] = v12 - v9;
            std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v23, &v26, (uint64_t)&v26);
            double v13 = v9 + v11 - v12;
            double v11 = *((double *)v6 + 5);
            double v14 = *(double *)(v3 + 24);
            double v15 = *((double *)v6 + 2);
            double v9 = *((double *)v6 + 3);
          }
          double v17 = v9 + v11;
          double v18 = v14 + *(double *)(v3 + 40);
          if (v17 > v18)
          {
            double v19 = *((double *)v6 + 4);
            *(double *)&long long v26 = v15;
            *((double *)&v26 + 1) = v18;
            v27[0] = v19;
            v27[1] = v17 - v18;
            std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v23, &v26, (uint64_t)&v26);
            double v13 = v18 - v12;
            double v15 = *v7;
          }
          double v20 = *v5;
          if (v15 < *v5)
          {
            *(double *)&long long v26 = v8;
            *((double *)&v26 + 1) = v12;
            v27[0] = v20 - v8;
            v27[1] = v13;
            std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v23, &v26, (uint64_t)&v26);
            double v15 = *v7;
            double v20 = *v5;
          }
          double v21 = v15 + *((double *)v6 + 4);
          double v22 = v20 + *(double *)(v3 + 32);
          if (v21 > v22)
          {
            *(double *)&long long v26 = v20 + *(double *)(v3 + 32);
            *((double *)&v26 + 1) = v12;
            v27[0] = v8 + v10 - v22;
            v27[1] = v13;
            std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v23, &v26, (uint64_t)&v26);
          }
        }
        else
        {
          long long v16 = *((_OWORD *)v6 + 2);
          long long v26 = *(_OWORD *)v7;
          *(_OWORD *)double v27 = v16;
          std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v23, &v26, (uint64_t)&v26);
        }
      }
      if (&v23 != (long long *)a2)
      {
        *(_DWORD *)(a2 + 32) = v25;
        std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>((void *)a2, (uint64_t *)v24);
      }
      double result = std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v23);
      uint64_t v3 = *(void *)v3;
    }
    while (v3);
  }
  return result;
}

void sub_1DD410D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t PA::Region::MergeVertically(PA::Region *this)
{
  long long v16 = 0u;
  *(_OWORD *)__p = 0u;
  int v18 = 1065353216;
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__rehash<true>((uint64_t)&v16, (unint64_t)(float)*((unint64_t *)this + 3));
  for (i = (double *)*((void *)this + 2); i; i = *(double **)i)
  {
    double v3 = i[2];
    double v4 = i[3];
    double v5 = i[4];
    double v6 = i[5];
    double v7 = (double *)__p[0];
    if (__p[0])
    {
      double v8 = i[3];
      do
      {
        while (1)
        {
          double v9 = v7[3];
          double v10 = v7[2];
          if ((COERCE_DOUBLE((COERCE__INT64(v4 + v6) + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((*(void *)&v9 + 4095) & 0xFFFFFFFFFFFFF000)
             || COERCE_DOUBLE((*(void *)&v4 + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((COERCE__INT64(v9 + v7[5])
                                                                                                + 4095) & 0xFFFFFFFFFFFFF000))
            && COERCE_DOUBLE((*(void *)&v3 + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((*(void *)&v10 + 4095) & 0xFFFFFFFFFFFFF000)
            && COERCE_DOUBLE((COERCE__INT64(v3 + v5) + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((COERCE__INT64(v10 + v7[4]) + 4095) & 0xFFFFFFFFFFFFF000))
          {
            break;
          }
          double v7 = *(double **)v7;
          if (!v7) {
            goto LABEL_18;
          }
        }
        if (v9 >= v8) {
          double v4 = v8;
        }
        else {
          double v4 = v7[3];
        }
        double v12 = v4 + v8 + v6 - v4;
        double v13 = v9 + v7[5];
        if (v12 < v13) {
          double v12 = v13;
        }
        double v6 = v12 - v4;
        double v7 = (double *)std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::erase(&v16, (uint64_t *)v7);
        double v8 = v4;
      }
      while (v7);
    }
LABEL_18:
    *(double *)double v15 = v3;
    *(double *)&v15[1] = v4;
    *(double *)&v15[2] = v5;
    *(double *)&v15[3] = v6;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v16, v15, (uint64_t)v15);
  }
  if (&v16 != (long long *)this)
  {
    *((_DWORD *)this + 8) = v18;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(this, (uint64_t *)__p[0]);
  }
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v16);
}

void sub_1DD410F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      double v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  double v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      long long v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  double v5 = operator new(8 * prime);
  double v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  double v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    double v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          *double v8 = *v14;
          *double v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          double v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        double v8 = v14;
        double v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(void *a1, uint64_t *a2)
{
  uint64_t v4 = a1[1];
  if (!v4) {
    goto LABEL_9;
  }
  for (uint64_t i = 0; i != v4; *(void *)(*a1 + 8 * i++) = 0)
    ;
  double v6 = (unsigned char *)a1[2];
  a1[2] = 0;
  a1[3] = 0;
  if (v6)
  {
    while (a2)
    {
      long long v7 = *((_OWORD *)a2 + 1);
      long long v8 = *((_OWORD *)a2 + 2);
      v6[48] = *((unsigned char *)a2 + 48);
      *((_OWORD *)v6 + 1) = v7;
      *((_OWORD *)v6 + 2) = v8;
      size_t v9 = *(unsigned char **)v6;
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__node_insert_multi((uint64_t)a1, (uint64_t)v6);
      a2 = (uint64_t *)*a2;
      double v6 = v9;
      if (!v9) {
        goto LABEL_9;
      }
    }
    do
    {
      uint64_t v13 = *(unsigned char **)v6;
      operator delete(v6);
      double v6 = v13;
    }
    while (v13);
  }
  else
  {
LABEL_9:
    while (a2)
    {
      uint8x8_t v10 = operator new(0x38uLL);
      *(void *)uint8x8_t v10 = 0;
      uint64_t v11 = a2[6];
      long long v12 = *((_OWORD *)a2 + 2);
      v10[1] = *((_OWORD *)a2 + 1);
      v10[2] = v12;
      *((void *)v10 + 6) = v11;
      *((void *)v10 + 1) = (*((void *)v10 + 2) + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(*((void *)v10 + 3) + 4095) >> 32 << 24) ^ ((unint64_t)(*((void *)v10 + 4) + 4095) >> 32 << 8) ^ ((unint64_t)(*((void *)v10 + 5) + 4095) >> 32);
      std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__node_insert_multi((uint64_t)a1, (uint64_t)v10);
      a2 = (uint64_t *)*a2;
    }
  }
}

void sub_1DD4112B0(void *a1)
{
  __cxa_begin_catch(a1);
  do
  {
    uint64_t v2 = (void *)*v1;
    operator delete(v1);
    uint64_t v1 = v2;
  }
  while (v2);
  __cxa_rethrow();
}

void sub_1DD4112D0(_Unwind_Exception *a1)
{
}

uint64_t std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::erase(void *a1, uint64_t *__p)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  uint64_t v4 = *__p;
  unint64_t v3 = __p[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  double v6 = *(uint64_t **)(*a1 + 8 * v3);
  do
  {
    long long v7 = v6;
    double v6 = (uint64_t *)*v6;
  }
  while (v6 != __p);
  if (v7 != a1 + 2)
  {
    unint64_t v8 = v7[1];
    if (v5.u32[0] > 1uLL)
    {
      if (v8 >= *(void *)&v2) {
        v8 %= *(void *)&v2;
      }
    }
    else
    {
      v8 &= *(void *)&v2 - 1;
    }
    uint64_t v9 = *__p;
    if (v8 == v3)
    {
LABEL_20:
      if (!v9) {
        goto LABEL_27;
      }
      goto LABEL_21;
    }
  }
  if (!v4) {
    goto LABEL_19;
  }
  unint64_t v10 = *(void *)(v4 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v10 >= *(void *)&v2) {
      v10 %= *(void *)&v2;
    }
  }
  else
  {
    v10 &= *(void *)&v2 - 1;
  }
  uint64_t v9 = *__p;
  if (v10 != v3)
  {
LABEL_19:
    *(void *)(*a1 + 8 * v3) = 0;
    uint64_t v9 = *__p;
    goto LABEL_20;
  }
LABEL_21:
  unint64_t v11 = *(void *)(v9 + 8);
  if (v5.u32[0] > 1uLL)
  {
    if (v11 >= *(void *)&v2) {
      v11 %= *(void *)&v2;
    }
  }
  else
  {
    v11 &= *(void *)&v2 - 1;
  }
  if (v11 != v3)
  {
    *(void *)(*a1 + 8 * v11) = v7;
    uint64_t v9 = *__p;
  }
LABEL_27:
  *long long v7 = v9;
  *__p = 0;
  --a1[3];
  operator delete(__p);
  return v4;
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v6 = (*a2 + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(a2[1] + 4095) >> 32 << 24) ^ ((unint64_t)(a2[2] + 4095) >> 32 << 8);
  unint64_t v7 = v6 ^ ((unint64_t)(a2[3] + 4095) >> 32);
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v6 ^ ((unint64_t)(a2[3] + 4095) >> 32);
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
    }
    else
    {
      unint64_t v3 = v7 & (v8 - 1);
    }
    long long v12 = *(void **)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      uint64_t v13 = (void *)*v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v7)
          {
            if (PA::RectEqualTo::operator()(v13 + 2, a2)) {
              return;
            }
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v8) {
                v14 %= v8;
              }
            }
            else
            {
              v14 &= v8 - 1;
            }
            if (v14 != v3) {
              break;
            }
          }
          uint64_t v13 = (void *)*v13;
        }
        while (v13);
      }
    }
  }
  size_t v15 = operator new(0x38uLL);
  *size_t v15 = 0;
  v15[1] = v7;
  long long v16 = *(_OWORD *)(a3 + 16);
  *((_OWORD *)v15 + 1) = *(_OWORD *)a3;
  *((_OWORD *)v15 + 2) = v16;
  v15[6] = *(void *)(a3 + 32);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v8 || (float)(v18 * (float)v8) < v17)
  {
    BOOL v19 = 1;
    if (v8 >= 3) {
      BOOL v19 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v8);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__rehash<true>(a1, v22);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
      else {
        unint64_t v3 = v7;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & v7;
    }
  }
  uint64_t v23 = *(void *)a1;
  long long v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    *size_t v15 = *v24;
LABEL_38:
    *long long v24 = v15;
    goto LABEL_39;
  }
  *size_t v15 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v15;
  *(void *)(v23 + 8 * v3) = a1 + 16;
  if (*v15)
  {
    unint64_t v25 = *(void *)(*v15 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v25 >= v8) {
        v25 %= v8;
      }
    }
    else
    {
      v25 &= v8 - 1;
    }
    long long v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
}

void sub_1DD411688(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL PA::RectEqualTo::operator()(void *a1, void *a2)
{
  return COERCE_DOUBLE((*a1 + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((*a2 + 4095) & 0xFFFFFFFFFFFFF000)
      && COERCE_DOUBLE((a1[1] + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((a2[1] + 4095) & 0xFFFFFFFFFFFFF000)
      && COERCE_DOUBLE((a1[2] + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((a2[2] + 4095) & 0xFFFFFFFFFFFFF000)
      && COERCE_DOUBLE((a1[3] + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((a2[3] + 4095) & 0xFFFFFFFFFFFFF000);
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__node_insert_multi(uint64_t a1, uint64_t a2)
{
  int8x8_t v2 = (void *)a2;
  uint64_t v4 = (void *)(a2 + 16);
  int8x16_t v5 = vandq_s8((int8x16_t)vshlq_u64((uint64x2_t)vaddq_s64(*(int64x2_t *)(a2 + 24), vdupq_n_s64(0xFFFuLL)), (uint64x2_t)xmmword_1DD4240A0), (int8x16_t)xmmword_1DD4240B0);
  unint64_t v43 = v5.i64[0] ^ (*(void *)(a2 + 16) + 4095) & 0xFFFFFFFF00000000 ^ v5.i64[1] ^ ((unint64_t)(*(void *)(a2 + 40) + 4095) >> 32);
  *(void *)(a2 + 8) = v43;
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    BOOL v9 = 1;
    if (v6 >= 3) {
      BOOL v9 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v10 = v9 | (2 * v6);
    unint64_t v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11) {
      int8x8_t prime = (int8x8_t)v11;
    }
    else {
      int8x8_t prime = (int8x8_t)v10;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v6 = *(void *)(a1 + 8);
    }
    if (*(void *)&prime > v6) {
      goto LABEL_95;
    }
    if (*(void *)&prime >= v6) {
      goto LABEL_55;
    }
    unint64_t v20 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v21.i16[0] = vaddlv_u8(v21), v21.u32[0] > 1uLL))
    {
      unint64_t v20 = std::__next_prime(v20);
    }
    else
    {
      uint64_t v22 = 1 << -(char)__clz(v20 - 1);
      if (v20 >= 2) {
        unint64_t v20 = v22;
      }
    }
    if (*(void *)&prime <= v20) {
      int8x8_t prime = (int8x8_t)v20;
    }
    if (*(void *)&prime >= v6)
    {
      unint64_t v6 = *(void *)(a1 + 8);
      goto LABEL_55;
    }
    if (prime)
    {
LABEL_95:
      if (*(void *)&prime >> 61) {
        std::__throw_bad_array_new_length[abi:ne180100]();
      }
      uint64_t v13 = operator new(8 * *(void *)&prime);
      unint64_t v14 = *(void **)a1;
      *(void *)a1 = v13;
      if (v14) {
        operator delete(v14);
      }
      uint64_t v15 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v15++) = 0;
      while (*(void *)&prime != v15);
      long long v16 = *(void **)(a1 + 16);
      if (!v16) {
        goto LABEL_45;
      }
      unint64_t v17 = v16[1];
      uint8x8_t v18 = (uint8x8_t)vcnt_s8(prime);
      v18.i16[0] = vaddlv_u8(v18);
      unint64_t v19 = v18.u32[0];
      if (v18.u32[0] > 1uLL)
      {
        if (v17 >= *(void *)&prime) {
          v17 %= *(void *)&prime;
        }
      }
      else
      {
        v17 &= *(void *)&prime - 1;
      }
      *(void *)(*(void *)a1 + 8 * v17) = a1 + 16;
      uint64_t v23 = (void *)*v16;
      if (*v16)
      {
        long long v41 = v2;
        do
        {
          unint64_t v24 = v23[1];
          if (v19 > 1)
          {
            if (v24 >= *(void *)&prime) {
              v24 %= *(void *)&prime;
            }
          }
          else
          {
            v24 &= *(void *)&prime - 1;
          }
          if (v24 == v17)
          {
            long long v16 = v23;
          }
          else if (*(void *)(*(void *)a1 + 8 * v24))
          {
            unint64_t v42 = v17;
            unint64_t v25 = v4;
            long long v26 = v23;
            do
            {
              double v27 = v26;
              long long v26 = (void *)*v26;
            }
            while (v26 && PA::RectEqualTo::operator()(v23 + 2, v26 + 2));
            *long long v16 = v26;
            *double v27 = **(void **)(*(void *)a1 + 8 * v24);
            **(void **)(*(void *)a1 + 8 * v24) = v23;
            uint64_t v4 = v25;
            unint64_t v17 = v42;
          }
          else
          {
            *(void *)(*(void *)a1 + 8 * v24) = v16;
            long long v16 = v23;
            unint64_t v17 = v24;
          }
          uint64_t v23 = (void *)*v16;
        }
        while (*v16);
        unint64_t v6 = (unint64_t)prime;
        int8x8_t v2 = v41;
      }
      else
      {
LABEL_45:
        unint64_t v6 = (unint64_t)prime;
      }
    }
    else
    {
      uint64_t v28 = *(void **)a1;
      *(void *)a1 = 0;
      if (v28) {
        operator delete(v28);
      }
      unint64_t v6 = 0;
      *(void *)(a1 + 8) = 0;
    }
  }
LABEL_55:
  uint8x8_t v29 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v29.i16[0] = vaddlv_u8(v29);
  unint64_t v30 = v29.u32[0];
  if (v29.u32[0] > 1uLL)
  {
    unint64_t v31 = v43;
    if (v6 <= v43) {
      unint64_t v31 = v43 % v6;
    }
  }
  else
  {
    unint64_t v31 = (v6 - 1) & v43;
  }
  double v32 = *(void **)(*(void *)a1 + 8 * v31);
  if (v32)
  {
    int v33 = 0;
    do
    {
      double v34 = v32;
      double v32 = (void *)*v32;
      if (!v32) {
        break;
      }
      unint64_t v35 = v32[1];
      if (v30 > 1)
      {
        unint64_t v36 = v32[1];
        if (v35 >= v6) {
          unint64_t v36 = v35 % v6;
        }
      }
      else
      {
        unint64_t v36 = v35 & (v6 - 1);
      }
      if (v36 != v31) {
        break;
      }
      BOOL v37 = v35 == v43 && PA::RectEqualTo::operator()(v32 + 2, v4);
      int v38 = v33 & !v37;
      v33 |= v37;
    }
    while (v38 != 1);
  }
  else
  {
    double v34 = 0;
  }
  unint64_t v39 = v2[1];
  if (v30 > 1)
  {
    if (v39 >= v6) {
      v39 %= v6;
    }
  }
  else
  {
    v39 &= v6 - 1;
  }
  if (!v34)
  {
    *int8x8_t v2 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v2;
    *(void *)(*(void *)a1 + 8 * v39) = a1 + 16;
    if (!*v2) {
      goto LABEL_91;
    }
    unint64_t v40 = *(void *)(*v2 + 8);
    if (v30 > 1)
    {
      if (v40 >= v6) {
        v40 %= v6;
      }
    }
    else
    {
      v40 &= v6 - 1;
    }
LABEL_90:
    *(void *)(*(void *)a1 + 8 * v40) = v2;
    goto LABEL_91;
  }
  *int8x8_t v2 = *v34;
  *double v34 = v2;
  if (*v2)
  {
    unint64_t v40 = *(void *)(*v2 + 8);
    if (v30 > 1)
    {
      if (v40 >= v6) {
        v40 %= v6;
      }
    }
    else
    {
      v40 &= v6 - 1;
    }
    if (v40 != v39) {
      goto LABEL_90;
    }
  }
LABEL_91:
  ++*(void *)(a1 + 24);
}

void __clang_call_terminate(void *a1)
{
}

BOOL PA::Rect::Intersects(CGRect *this, const Rect *a2)
{
  *(Rect *)&v3.origin.x = *a2;
  *(Rect *)&v3.origin.y = a2[1];
  *(Rect *)&v3.size.width = a2[2];
  *(Rect *)&v3.size.height = a2[3];
  return CGRectIntersectsRect(*this, v3);
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect const&>(uint64_t a1, void *a2, uint64_t a3)
{
  unint64_t v6 = (*a2 + 4095) & 0xFFFFFFFF00000000 ^ ((unint64_t)(a2[1] + 4095) >> 32 << 24) ^ ((unint64_t)(a2[2] + 4095) >> 32 << 8);
  unint64_t v7 = v6 ^ ((unint64_t)(a2[3] + 4095) >> 32);
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v6 ^ ((unint64_t)(a2[3] + 4095) >> 32);
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
    }
    else
    {
      unint64_t v3 = v7 & (v8 - 1);
    }
    long long v12 = *(void **)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      uint64_t v13 = (void *)*v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v7)
          {
            if (PA::RectEqualTo::operator()(v13 + 2, a2)) {
              return;
            }
          }
          else
          {
            if (v11 > 1)
            {
              if (v14 >= v8) {
                v14 %= v8;
              }
            }
            else
            {
              v14 &= v8 - 1;
            }
            if (v14 != v3) {
              break;
            }
          }
          uint64_t v13 = (void *)*v13;
        }
        while (v13);
      }
    }
  }
  uint64_t v15 = operator new(0x38uLL);
  *uint64_t v15 = 0;
  v15[1] = v7;
  long long v16 = *(_OWORD *)(a3 + 16);
  *((_OWORD *)v15 + 1) = *(_OWORD *)a3;
  *((_OWORD *)v15 + 2) = v16;
  v15[6] = *(void *)(a3 + 32);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v8 || (float)(v18 * (float)v8) < v17)
  {
    BOOL v19 = 1;
    if (v8 >= 3) {
      BOOL v19 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v8);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__rehash<true>(a1, v22);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        unint64_t v3 = v7 % v8;
      }
      else {
        unint64_t v3 = v7;
      }
    }
    else
    {
      unint64_t v3 = (v8 - 1) & v7;
    }
  }
  uint64_t v23 = *(void *)a1;
  unint64_t v24 = *(void **)(*(void *)a1 + 8 * v3);
  if (v24)
  {
    *uint64_t v15 = *v24;
LABEL_38:
    *unint64_t v24 = v15;
    goto LABEL_39;
  }
  *uint64_t v15 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v15;
  *(void *)(v23 + 8 * v3) = a1 + 16;
  if (*v15)
  {
    unint64_t v25 = *(void *)(*v15 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v25 >= v8) {
        v25 %= v8;
      }
    }
    else
    {
      v25 &= v8 - 1;
    }
    unint64_t v24 = (void *)(*(void *)a1 + 8 * v25);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
}

void sub_1DD411E78(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_1DD411EE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

PA::Region *PA::Region::Region(PA::Region *this, const PA::Rect *a2)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  if ((*(void *)a2 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (*((void *)a2 + 1) & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL
    || (double v4 = *((double *)a2 + 2), (*(void *)&v4 & 0x7FFFFFFFFFFFFFFFuLL) > 0x7FEFFFFFFFFFFFFFLL)
    || (double v5 = *((double *)a2 + 3), (*(void *)&v5 & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000))
  {
    unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    BOOL v9 = [NSString stringWithUTF8String:"PA::Region::Region(const Rect &)"];
    [v8 handleFailureInFunction:v9, @"IPARegion.mm", 93, @"Invalid parameter not satisfying: %@", @"rect.IsFinite()" file lineNumber description];

    double v4 = *((double *)a2 + 2);
    double v5 = *((double *)a2 + 3);
  }
  if (v4 > 0.0 && v5 > 0.0)
  {
    long long v6 = *((_OWORD *)a2 + 1);
    v10[0] = *(_OWORD *)a2;
    v10[1] = v6;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)this, v10, (uint64_t)v10);
  }
  return this;
}

void sub_1DD412028(_Unwind_Exception *a1)
{
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Intersects(uint64_t result, uint64_t a2)
{
  if (result)
  {
    uint64_t v2 = result;
    unint64_t v3 = (uint64_t *)(a2 + 16);
    do
    {
      double v4 = v3;
      while (1)
      {
        double v4 = (uint64_t *)*v4;
        if (!v4) {
          break;
        }
        if (PA::Rect::Intersects((CGRect *)(v4 + 2), (const Rect *)(v2 + 16))) {
          return 1;
        }
      }
      uint64_t v2 = *(void *)v2;
    }
    while (v2);
    return 0;
  }
  return result;
}

void sub_1DD412138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

double PA::Region::GetBounds(PA::Region *this)
{
  double v1 = *MEMORY[0x1E4F1DB28];
  uint64_t v2 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (!this) {
    return *MEMORY[0x1E4F1DB28];
  }
  double v5 = this;
  do
  {
    double v6 = *((double *)v5 + 2);
    uint64_t v7 = *((void *)v5 + 3);
    double v8 = *((double *)v5 + 4);
    double v9 = *((double *)v5 + 5);
    if (v3 > 0.0 && v4 > 0.0)
    {
      if (v8 > 0.0 && v9 > 0.0) {
        *(CGRect *)&double v1 = CGRectUnion(*(CGRect *)&v1, *(CGRect *)&v6);
      }
      double v6 = v1;
      uint64_t v7 = v2;
      double v8 = v3;
      double v9 = v4;
    }
    double v5 = *(PA::Region **)v5;
    double v1 = v6;
    uint64_t v2 = v7;
    double v3 = v8;
    double v4 = v9;
  }
  while (v5);
  return v6;
}

void sub_1DD412438(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4125D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_1DD4126A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1DD412794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::RoundUp(PA::Region *this)
{
  std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set((uint64_t)v8, (uint64_t)this);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear(this);
  for (uint64_t i = v9; i; uint64_t i = *(float64x2_t **)&i->f64[0])
  {
    float64x2_t v3 = i[2];
    v7[0] = i[1];
    float64x2_t v4 = vrndmq_f64(v7[0]);
    float64x2_t v5 = vsubq_f64(vrndpq_f64(vaddq_f64(v4, vsubq_f64(vaddq_f64(v7[0], v3), v4))), v4);
    v7[0] = v4;
    v7[1] = v5;
    PA::Region::Add(this, (const PA::Rect *)v7);
  }
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v8);
}

void sub_1DD412834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear((void *)a1);
  uint64_t v4 = *a2;
  *a2 = 0;
  float64x2_t v5 = *(void **)a1;
  *(void *)a1 = v4;
  if (v5) {
    operator delete(v5);
  }
  uint64_t v8 = a2[2];
  uint64_t v7 = a2 + 2;
  uint64_t v6 = v8;
  uint64_t v9 = *(v7 - 1);
  *(void *)(a1 + 16) = v8;
  *(void *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  uint64_t v10 = v7[1];
  *(void *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    unint64_t v11 = *(void *)(v6 + 8);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        v11 %= v12;
      }
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(void *)(*(void *)a1 + 8 * v11) = a1 + 16;
    *uint64_t v7 = 0;
    v7[1] = 0;
  }
}

void *std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear(void *result)
{
  if (result[3])
  {
    double v1 = result;
    double result = (void *)result[2];
    if (result)
    {
      do
      {
        uint64_t v2 = (void *)*result;
        operator delete(result);
        double result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

uint64_t PA::Region::Add(PA::Region *this, const PA::Rect *a2)
{
  PA::Region::Region((PA::Region *)v4, a2);
  PA::Region::Add(this, (const PA::Region *)v4);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1DD412998(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Add(PA::Region *this, const PA::Region *a2)
{
  std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set((uint64_t)v4, (uint64_t)a2);
  PA::Region::Break(*((void *)this + 2), (uint64_t)v4);
  PA::Region::Merge(this, v4);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1DD4129FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Merge(PA::Region *this, void *a2)
{
  while (a2[3])
  {
    uint64_t v4 = a2[2];
    float64x2_t v25 = *(float64x2_t *)(v4 + 16);
    float64x2_t v26 = *(float64x2_t *)(v4 + 32);
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::erase(a2, (uint64_t *)v4);
    float64x2_t v6 = vaddq_f64(v25, v26);
    double v5 = v6.f64[1];
    *(void *)&v6.f64[0] = (*(void *)&v6.f64[0] + 4095) & 0xFFFFFFFFFFFFF000;
    uint64_t v7 = (double *)((char *)this + 16);
    while (1)
    {
      uint64_t v7 = *(double **)v7;
      if (!v7)
      {
        float64x2_t v27 = v25;
        float64x2_t v28 = v26;
        std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)this, &v27, (uint64_t)&v27);
        goto LABEL_22;
      }
      double v8 = v7[3];
      if (v6.f64[0] == COERCE_DOUBLE((*((void *)v7 + 2) + 4095) & 0xFFFFFFFFFFFFF000)
        || COERCE_DOUBLE((*(void *)&v25.f64[0] + 4095) & 0xFFFFFFFFFFFFF000) == COERCE_DOUBLE((COERCE__INT64(v7[2] + v7[4]) + 4095) & 0xFFFFFFFFFFFFF000))
      {
        *(void *)&double v9 = (COERCE__INT64(v8 + v7[5]) + 4095) & 0xFFFFFFFFFFFFF000;
        *(void *)&double v10 = (*(void *)&v8 + 4095) & 0xFFFFFFFFFFFFF000;
        if (COERCE_DOUBLE((*(void *)&v25.f64[1] + 4095) & 0xFFFFFFFFFFFFF000) < v9
          && COERCE_DOUBLE((*(void *)&v6.f64[1] + 4095) & 0xFFFFFFFFFFFFF000) > v10)
        {
          break;
        }
      }
    }
    v12.f64[0] = v7[2];
    v12.f64[1] = v25.f64[1];
    v13.f64[0] = v25.f64[0];
    v13.f64[1] = v7[3];
    float64x2_t v14 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v13, v12), *(int8x16_t *)(v7 + 2), (int8x16_t)v25);
    v15.f64[0] = v26.f64[0];
    v15.f64[1] = v7[5];
    v16.f64[1] = v26.f64[1];
    v16.f64[0] = v7[4];
    float64x2_t v17 = vaddq_f64(v12, v16);
    float64x2_t v18 = vaddq_f64(v13, v15);
    int8x16_t v19 = (int8x16_t)vcgtq_f64(v17, v18);
    v15.f64[0] = v17.f64[0];
    v15.f64[1] = v18.f64[1];
    v18.f64[1] = v17.f64[1];
    float64x2_t v27 = v14;
    float64x2_t v28 = vsubq_f64((float64x2_t)vbslq_s8(v19, (int8x16_t)v15, (int8x16_t)v18), v14);
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)a2, &v27, (uint64_t)&v27);
    double v20 = v7[3];
    if (v25.f64[1] >= v20)
    {
      if (v25.f64[1] <= v20) {
        goto LABEL_16;
      }
      float64_t v21 = v7[4];
      v27.f64[0] = v7[2];
      v27.f64[1] = v20;
      v28.f64[0] = v21;
      v28.f64[1] = v25.f64[1] - v20;
    }
    else
    {
      float64x2_t v27 = v25;
      v28.f64[0] = v26.f64[0];
      v28.f64[1] = v20 - v25.f64[1];
    }
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)a2, &v27, (uint64_t)&v27);
LABEL_16:
    double v22 = v7[3] + v7[5];
    if (v5 >= v22)
    {
      if (v5 <= v22) {
        goto LABEL_21;
      }
      v27.f64[0] = v25.f64[0];
      v27.f64[1] = v22;
      v28.f64[0] = v26.f64[0];
      v28.f64[1] = v5 - v22;
    }
    else
    {
      float64_t v23 = v7[4];
      v27.f64[0] = v7[2];
      v27.f64[1] = v5;
      v28.f64[0] = v23;
      v28.f64[1] = v22 - v5;
    }
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)a2, &v27, (uint64_t)&v27);
LABEL_21:
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::erase(this, (uint64_t *)v7);
LABEL_22:
    ;
  }
  return PA::Region::MergeVertically(this);
}

uint64_t PA::Region::ShrinkInRect(PA::Region *this, float64_t a2, float64_t a3, const PA::Rect *a4)
{
  PA::Region::Region((PA::Region *)v10, a4);
  PA::Region::Break(*((void *)this + 2), (uint64_t)v10);
  PA::Region::MergeVertically((PA::Region *)v10);
  PA::Region::Grow((PA::Region *)v10, a2, a3);
  PA::Region::Region((PA::Region *)v9, a4);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__move_assign((uint64_t)this, v9);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v9);
  PA::Region::Break(v11, (uint64_t)this);
  PA::Region::MergeVertically(this);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v10);
}

void sub_1DD412D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Grow(PA::Region *this, float64_t a2, float64_t a3)
{
  std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set((uint64_t)v14, (uint64_t)this);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::clear(this);
  uint64_t v4 = v15;
  if (v15)
  {
    v5.f64[0] = a2;
    v5.f64[1] = a3;
    float64x2_t v12 = v5;
    do
    {
      float64x2_t v6 = v4[2];
      v13[0] = v4[1];
      float64x2_t v7 = vsubq_f64(v13[0], v12);
      float64x2_t v8 = vsubq_f64(vaddq_f64(vaddq_f64(v7, vsubq_f64(vaddq_f64(v13[0], v6), v7)), v12), v7);
      v13[0] = v7;
      v13[1] = v8;
      PA::Region::Add(this, (const PA::Rect *)v13);
      uint64_t v4 = *(float64x2_t **)&v4->f64[0];
    }
    while (v4);
  }
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v14);
}

void sub_1DD412E50(_Unwind_Exception *a1)
{
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table(v1 - 56);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Clip(PA::Region *this, const PA::Rect *a2)
{
  PA::Region::Region((PA::Region *)v4, a2);
  PA::Region::Clip(this, (const PA::Region *)v4);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v4);
}

void sub_1DD412FF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Clip(PA::Region *this, const PA::Region *a2)
{
  long long v8 = 0u;
  long long v9 = 0u;
  int v10 = 1065353216;
  for (uint64_t i = (uint64_t *)*((void *)this + 2); i; uint64_t i = (uint64_t *)*i)
  {
    for (j = (uint64_t *)*((void *)a2 + 2); j; j = (uint64_t *)*j)
    {
      CGRect v11 = CGRectIntersection(*(CGRect *)(i + 2), *(CGRect *)(j + 2));
      if (v11.size.width > 0.0 && v11.size.height > 0.0)
      {
        CGRect v7 = v11;
        std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__emplace_unique_key_args<PA::RegionRect,PA::RegionRect>((uint64_t)&v8, &v7, (uint64_t)&v7);
      }
    }
  }
  if (&v8 != (long long *)this)
  {
    *((_DWORD *)this + 8) = v10;
    std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::__assign_multi<std::__hash_const_iterator<std::__hash_node<PA::RegionRect,void *> *>>(this, (uint64_t *)v9);
  }
  PA::Region::MergeVertically(this);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)&v8);
}

void sub_1DD4130D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1DD4131C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD4132D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1DD4133A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1DD413470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t PA::Region::Diff(PA::Region *this, const PA::Region *a2)
{
  std::unordered_set<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::unordered_set((uint64_t)v5, (uint64_t)a2);
  PA::Region::Break(*((void *)this + 2), (uint64_t)v5);
  PA::Region::Break(*((void *)a2 + 2), (uint64_t)this);
  PA::Region::Merge(this, v5);
  return std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)v5);
}

void sub_1DD4134FC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1DD413560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1DD4135D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD413684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD4136F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD4137C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__hash_table<PA::RegionRect,PA::RectHash,PA::RectEqualTo,std::allocator<PA::RegionRect>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1DD413898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4138FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD413AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_1DD413B48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD413CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1DD413E10(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  MEMORY[0x1E01B4BC0](v4, 0x10A0C408EF24B1CLL);

  _Unwind_Resume(a1);
}

void sub_1DD413F60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD413FFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD414078(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4140E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD414150(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41419C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4141E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41427C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4142E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD414374(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4143D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41443C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4144A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41450C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD414594(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD414600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD414678(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD414700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41476C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4147E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41486C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4148D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD414950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4149D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double PFSizeFitAspectInSize(double a1, double a2, double a3)
{
  if (a1 <= 0.0) {
    return *MEMORY[0x1E4F28AE0];
  }
  double v3 = a2 / a3;
  if (a2 / a3 <= 0.0) {
    return *MEMORY[0x1E4F28AE0];
  }
  if (v3 >= a1 && v3 > a1) {
    return floor(a3 * a1);
  }
  return a2;
}

double PFSizeFitAspectInSizeRounded(double a1, double a2, double a3)
{
  if (a1 <= 0.0) {
    return *MEMORY[0x1E4F28AE0];
  }
  double v3 = a2 / a3;
  if (a2 / a3 <= 0.0) {
    return *MEMORY[0x1E4F28AE0];
  }
  if (v3 >= a1 && v3 > a1) {
    return round(a3 * a1);
  }
  return a2;
}

double PFSizeFitAspectInSizeNoRounding(double a1, double a2, double a3)
{
  if (a1 <= 0.0) {
    return *MEMORY[0x1E4F28AE0];
  }
  double v3 = a2 / a3;
  if (a2 / a3 <= 0.0) {
    return *MEMORY[0x1E4F28AE0];
  }
  if (v3 >= a1 && v3 > a1) {
    return a3 * a1;
  }
  return a2;
}

double PFSizeGetScaleToFit(double a1, double a2, double a3, double a4)
{
  if (NSEqualSizes(*(NSSize *)&a1, *MEMORY[0x1E4F28AE0]))
  {
    unint64_t v10 = _PFAssertFailHandler();
    return PFSizeFitSizeInSquare(v10, v11, v12);
  }
  else
  {
    double result = a3 / a1;
    double v9 = 0.0;
    if (a1 == 0.0) {
      double result = 0.0;
    }
    if (a2 != 0.0) {
      double v9 = a4 / a2;
    }
    if (result >= v9) {
      return v9;
    }
  }
  return result;
}

double PFSizeFitSizeInSquare(unint64_t a1, double a2, double a3)
{
  if (a2 <= 0.0 || a3 <= 0.0) {
    return (double)a1;
  }
  double result = (double)a1;
  if (a2 <= a3) {
    return ceil(a2 / a3 * result);
  }
  return result;
}

double PFSizeFitSizeInSize(double a1, double a2, double a3, double a4)
{
  double v4 = a1 / a2;
  if (v4 <= 0.0) {
    return *MEMORY[0x1E4F28AE0];
  }
  double v5 = a3 / a4;
  if (a3 / a4 <= 0.0) {
    return *MEMORY[0x1E4F28AE0];
  }
  if (v5 >= v4 && v5 > v4) {
    return floor(a4 * v4);
  }
  return a3;
}

double PFSizeConformToAspect(double a1, double a2, double a3)
{
  double v4 = a1;
  double v5 = a2 / a1;
  if (v5 != a3)
  {
    double v7 = atan(v5);
    double v8 = atan(1.0 / a3);
    long double v9 = sqrt(a2 * a2 + v4 * v4) * cos(v8 - v7);
    return __sincos_stret(v8).__cosval * v9;
  }
  return v4;
}

uint64_t PFSizeRotate(uint64_t result)
{
  if (result >= 0) {
    uint64_t v1 = result;
  }
  else {
    uint64_t v1 = -result;
  }
  if (__ROR8__(0x4FA4FA4FA4FA4FA5 * v1, 1) >= 0x2D82D82D82D82D9uLL)
  {
    uint64_t v2 = _PFAssertFailHandler();
    return PFSizeEnforceMinDimension(v2);
  }
  return result;
}

double PFSizeEnforceMinDimension(int a1, double a2, double a3, double a4)
{
  return PFSizeEnforceMinDimensions(a1, a2, a3, a4, a4);
}

double PFSizeEnforceMinDimensions(int a1, double result, double a3, double a4, double a5)
{
  if (a1 && result > 0.0 && a3 > 0.0)
  {
    if (result < a4 || a3 < a5)
    {
      double v5 = a4 / result;
      double v6 = a5 / a3;
      if (v5 < v6) {
        double v5 = v6;
      }
      return result * v5;
    }
  }
  else if (result < a4)
  {
    return a4;
  }
  return result;
}

double PFSizeEnforceMaxDimension(int a1, double a2, double a3, double a4)
{
  return PFSizeEnforceMaxDimensions(a1, a2, a3, a4, a4);
}

double PFSizeEnforceMaxDimensions(int a1, double result, double a3, double a4, double a5)
{
  if (a1 && result > 0.0 && a3 > 0.0)
  {
    if (result > a4 || a3 > a5)
    {
      double v5 = a4 / result;
      double v6 = a5 / a3;
      if (v5 >= v6) {
        double v5 = v6;
      }
      return result * v5;
    }
  }
  else if (result >= a4)
  {
    return a4;
  }
  return result;
}

double PAConvertImageRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, CGFloat a9, CGFloat a10, double a11, double a12)
{
  double v20 = a11 / a7;
  double v21 = a12 / a8;
  CGRect v24 = CGRectOffset(*(CGRect *)&a1, -a5, -a6);
  v24.origin.x = v20 * v24.origin.x;
  v24.origin.y = v21 * v24.origin.y;
  v24.size.width = v20 * v24.size.width;
  v24.size.height = v21 * v24.size.height;
  CGRect v25 = CGRectStandardize(v24);
  *(void *)&double result = (unint64_t)CGRectOffset(v25, a9, a10);
  return result;
}

id PAConvertImageRegion(void *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  float64x2_t v17 = (void *)[a1 mutableCopy];
  objc_msgSend(v17, "translateBy:", -a2, -a3);
  objc_msgSend(v17, "scaleBy:", a8 / a4, a9 / a5);
  objc_msgSend(v17, "translateBy:", a6, a7);
  return v17;
}

void sub_1DD414EEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double PARectVertex(char a1, double a2, double a3, double a4)
{
  if ((a1 & 1) == 0) {
    a4 = -0.0;
  }
  return a2 + a4;
}

uint64_t PARectVectexOpposite(int a1)
{
  return a1 ^ 3u;
}

uint64_t PAOrientationTransformRectVertex(uint64_t a1, uint64_t a2)
{
  switch(a1)
  {
    case 2:
      a2 = a2 ^ 1;
      break;
    case 3:
      a2 = a2 ^ 3;
      break;
    case 4:
      a2 = a2 ^ 2;
      break;
    case 5:
      unsigned int v2 = ~__rbit32(a2);
      goto LABEL_8;
    case 6:
      a2 = (__rbit32(a2) >> 30) ^ 2;
      break;
    case 7:
      unsigned int v2 = __rbit32(a2);
LABEL_8:
      a2 = v2 >> 30;
      break;
    case 8:
      a2 = (__rbit32(a2) >> 30) ^ 1;
      break;
    default:
      return a2;
  }
  return a2;
}

double PARectRoundUp(double a1, double a2, double a3, double a4, double a5)
{
  return floor(a1 / a5) * a5;
}

double PARectRoundDown(double a1, double a2, double a3, double a4, double a5)
{
  return ceil(a1 / a5) * a5;
}

double PARelativePointInRect(double a1, double a2, double a3, double a4, double a5)
{
  double result = 0.0;
  if (a5 != 0.0) {
    return (a1 - a3) / a5;
  }
  return result;
}

double PAAbsolutePointInRect(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

double PAPointClipToRect(double a1, double a2, double a3, double a4, double a5)
{
  return fmin(fmax(a1, a3), a3 + a5);
}

double PAAnchorPointFromRectToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double result = 0.5;
  if (vabdd_f64(a7, a3) > 0.00000011920929) {
    return -(a5 - a1) / (a7 - a3);
  }
  return result;
}

double PARectResizeByMovingRelativePoint(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v16 = a1 + a9 * a3;
  if (a5 != a9) {
    a3 = (a1 + a5 * a3 + a7 - v16) / (a5 - a9);
  }
  return v16 - a9 * a3;
}

double PARectEnforceMinimumSizeAndAspectRatio(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (a1 | a2 && a7 * (double)a2 < a8 * (double)a1)
  {
    double v9 = (double)a1 / (double)a2;
    double v10 = INFINITY;
    if (!a1) {
      double v10 = NAN;
    }
    if (!a2) {
      double v9 = v10;
    }
    a7 = a8 * v9;
  }
  return fmin(a3, a3 + a9 * (a5 - a7));
}

BOOL PAAspectRatioIsUndefined(uint64_t a1, uint64_t a2)
{
  return (a1 | a2) == 0;
}

double PAAspectRatioValue(unint64_t a1, unint64_t a2)
{
  double result = (double)a1 / (double)a2;
  double v3 = INFINITY;
  if (!a1) {
    double v3 = NAN;
  }
  if (!a2) {
    return v3;
  }
  return result;
}

double PARectEnforceMinimumSize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return fmin(a1, a1 + a7 * (a3 - a5));
}

double PARectResizeRelative(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1 + a7 * a3 - a7 * (a3 + a5);
}

double PARectRescaleRelative(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6 * a3 - a6 * (a3 * a5);
}

double PARectRescaleRelativeXY(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1 + a7 * a3 - a7 * (a3 * a5);
}

double PARectAspectConstrain(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14)
{
  if (a1 | a2) {
    return a3
  }
         + a9 * a5
         - a9
         * (((a4 + a8 * a6 - (a4 + a10 * a6)) * ((a8 - a10) * (double)a2)
           + (a3 + a7 * a5 - (a3 + a9 * a5)) * ((a7 - a9) * (double)a1))
          / ((a8 - a10) * (double)a2 * ((a8 - a10) * (double)a2) + (a7 - a9) * (double)a1 * ((a7 - a9) * (double)a1))
          * (double)a1);
  _PFAssertFailHandler();
  return PARectResizeToFitInRect(v21, v22, v23, v24, v25, v26, v27, v28, a11, a12, a13, a14);
}

double PARectResizeToFitInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  return a1
       + a5 * a3
       - a5
       * (a3
        * fmin(fmin((a1 + a5 * a3 - a9) / (a3 * a5), (a9 + a11 - (a1 + a5 * a3)) / (a3 * (1.0 - a5))), fmin((a2 + a6 * a4 - a10) / (a4 * a6), (a10 + a12 - (a2 + a6 * a4)) / (a4 * (1.0 - a6)))));
}

BOOL PAAspectRatioIsEqual(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 | a4) {
    BOOL v4 = a4 * a1 == a3 * a2;
  }
  else {
    BOOL v4 = (a1 | a2 | a3 | a4) == 0;
  }
  if (a1 | a2) {
    return v4;
  }
  else {
    return (a1 | a2 | a3 | a4) == 0;
  }
}

uint64_t PAAspectRatioWithOrientation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)(a3 - 5) >= 4) {
    return a1;
  }
  return a2;
}

unint64_t PAAspectRatioConformWidth(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  double v4 = (double)a3 / (double)a4;
  double v5 = (double)a2;
  if ((double)result / (double)a2 > v4) {
    return vcvtmd_u64_f64(v4 * v5);
  }
  if (v5 / (double)result > v4) {
    return vcvtpd_u64_f64(v5 / v4);
  }
  return result;
}

double PAAspectRatioConformHeight(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  double result = (double)a3 / (double)a4;
  double v5 = (double)a1;
  if ((double)a1 / (double)a2 > result) {
    return v5 / result;
  }
  if ((double)a2 / v5 > result) {
    return result * v5;
  }
  return result;
}

uint64_t PAAspectRatioCompare(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  double v4 = (double)a1 / (double)a2;
  double v5 = INFINITY;
  if (!a1) {
    double v5 = NAN;
  }
  if (!a2) {
    double v4 = v5;
  }
  double v6 = (double)a3 / (double)a4;
  double v7 = INFINITY;
  if (!a3) {
    double v7 = NAN;
  }
  if (!a4) {
    double v6 = v7;
  }
  if (v4 < v6) {
    return -1;
  }
  else {
    return v4 > v6;
  }
}

double PAExtractRotationFromStraightenAffineTransform(__n128 *a1)
{
  uint64_t v6 = 0;
  long long v4 = 0u;
  long long v5 = 0u;
  __n128 v1 = a1[1];
  v3[0] = *a1;
  v3[1] = v1;
  v3[2] = a1[2];
  PADecomposeAffineTransform(v3, (uint64_t)&v4);
  double result = *(double *)&v5 * 180.0 / 3.14159265;
  if (result < 0.0) {
    return result + 360.0;
  }
  return result;
}

__n128 PADecomposeAffineTransform@<Q0>(__n128 *a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = a1->n128_f64[0];
  float v5 = a1->n128_f64[0];
  double v6 = a1[1].n128_f64[0];
  float v7 = v6;
  double v8 = hypotf(v5, v7);
  double v9 = a1->n128_f64[1];
  float v10 = v9;
  double v11 = a1[1].n128_f64[1];
  float v12 = v11;
  double v13 = hypotf(v10, v12);
  double v14 = v4 * v11 - v9 * v6;
  BOOL v15 = v14 < 0.0;
  if (v14 <= 0.0)
  {
    double v16 = 0.0;
    if (v15)
    {
      if (v4 >= 0.0)
      {
        float v19 = -v9 - v6;
        float v20 = v4 - v11;
        double v16 = atan2f(v19, v20);
        double v13 = -v13;
      }
      else
      {
        float v17 = v6 + v9;
        float v18 = v11 - v4;
        double v16 = atan2f(v17, v18);
        double v8 = -v8;
      }
    }
  }
  else
  {
    double v16 = atan2(v9 - v6, v4 + v11);
  }
  *(double *)a2 = v8;
  *(double *)(a2 + 8) = v13;
  *(double *)(a2 + 16) = v16;
  __n128 result = a1[2];
  *(__n128 *)(a2 + 24) = result;
  return result;
}

double PAConvertCropRectWithStraightenAffineTransform(_OWORD *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  long long v11 = a1[1];
  *(_OWORD *)&v21.a = *a1;
  *(_OWORD *)&v21.c = v11;
  *(_OWORD *)&v21.tx = a1[2];
  *(double *)&long long v11 = a7;
  double v13 = -_PAOffsetFromDGCropToCICropWithTransform(&v21, *(CGSize *)((char *)&v11 - 8));
  double v15 = -v14;
  double v16 = a2;
  double v17 = a3;
  double v18 = a4;
  double v19 = a5;
  *(void *)&double result = (unint64_t)CGRectOffset(*(CGRect *)&v16, v13, v15);
  return result;
}

double _PAOffsetFromDGCropToCICropWithTransform(CGAffineTransform *a1, CGSize a2)
{
  CGFloat height = a2.height;
  CGFloat width = a2.width;
  long long v4 = *(_OWORD *)&a1->c;
  *(_OWORD *)&v7.a = *(_OWORD *)&a1->a;
  *(_OWORD *)&v7.c = v4;
  *(_OWORD *)&v7.tx = *(_OWORD *)&a1->tx;
  uint64_t v5 = 0;
  *(void *)&long long v4 = 0;
  CGRect v8 = CGRectApplyAffineTransform(*(CGRect *)(&height - 3), &v7);
  *(void *)&double result = (unint64_t)CGRectIntegral(v8);
  return result;
}

CGFloat PAStraightenAffineTransformWithRadians@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  uint64_t v8 = MEMORY[0x1E4F1DAB8];
  long long v9 = *MEMORY[0x1E4F1DAB8];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a1 + 16) = v10;
  long long v11 = *(_OWORD *)(v8 + 32);
  *(_OWORD *)(a1 + 32) = v11;
  *(_OWORD *)&v28.a = v9;
  *(_OWORD *)&v28.c = v10;
  *(_OWORD *)&v28.tx = v11;
  *(void *)&long long v9 = 0;
  *(void *)&long long v10 = 0;
  *(CGFloat *)&long long v11 = a3;
  CGFloat v12 = a4;
  CGFloat MidX = CGRectGetMidX(*(CGRect *)&v9);
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.CGFloat width = a3;
  v29.size.CGFloat height = a4;
  MiCGFloat dY = CGRectGetMidY(v29);
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v28, MidX, MidY);
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v26.a = *(_OWORD *)a1;
  *(_OWORD *)&v26.c = v15;
  *(_OWORD *)&v26.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformRotate(&v27, &v26, a2);
  long long v16 = *(_OWORD *)&v27.c;
  *(_OWORD *)a1 = *(_OWORD *)&v27.a;
  *(_OWORD *)(a1 + 16) = v16;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v27.tx;
  long long v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v17;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  uint64_t v18 = 0;
  *(void *)&long long v17 = 0;
  CGFloat v19 = a3;
  CGFloat v20 = a4;
  CGFloat v21 = -CGRectGetMidX(*(CGRect *)((char *)&v17 - 8));
  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.CGFloat width = a3;
  v30.size.CGFloat height = a4;
  CGFloat v22 = CGRectGetMidY(v30);
  CGAffineTransformTranslate(&v27, &v25, v21, -v22);
  long long v23 = *(_OWORD *)&v27.c;
  *(_OWORD *)a1 = *(_OWORD *)&v27.a;
  *(_OWORD *)(a1 + 16) = v23;
  CGFloat result = v27.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v27.tx;
  return result;
}

CGFloat PAStraightenAffineTransformWithDegrees@<D0>(uint64_t a1@<X8>, double a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  return PAStraightenAffineTransformWithRadians(a1, a2 * 3.14159265 / 180.0, a3, a4);
}

void PAConvertCICropRectToDGCropRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, CGFloat a6, CGFloat a7)
{
  memset(&v17, 0, sizeof(v17));
  PAStraightenAffineTransformWithRadians((uint64_t)&v17, a5 * 3.14159265 / 180.0, a6, a7);
  CGAffineTransform v16 = v17;
  v18.CGFloat width = a6;
  v18.CGFloat height = a7;
  CGFloat v13 = -_PAOffsetFromDGCropToCICropWithTransform(&v16, v18);
  CGFloat v15 = -v14;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.CGFloat width = a3;
  v19.size.CGFloat height = a4;
  CGRectOffset(v19, v13, v15);
}

void PAConvertDGCropRectToCICropRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, CGFloat a6, CGFloat a7)
{
  memset(&v17, 0, sizeof(v17));
  PAStraightenAffineTransformWithRadians((uint64_t)&v17, a5 * 3.14159265 / 180.0, a6, a7);
  CGAffineTransform v16 = v17;
  v18.CGFloat width = a6;
  v18.CGFloat height = a7;
  double v13 = _PAOffsetFromDGCropToCICropWithTransform(&v16, v18);
  CGFloat v15 = v14;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.CGFloat width = a3;
  v19.size.CGFloat height = a4;
  CGRectOffset(v19, v13, v15);
}

double PAConvertCropRectWithAspectRatio(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6)
{
  return _rectWithAspectRatio(a1, a2, a3, a4, a5, a6, 1.0);
}

double _rectWithAspectRatio(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  unsigned int v7 = vcvtmd_u64_f64(sqrt(a6 * (a5 * a7) * (double)a2 / (double)a1) + 0.5);
  int v8 = v7 | 1;
  int v9 = (v7 & 1) + v7;
  if (vcvtmd_u64_f64(a6)) {
    int v9 = v8;
  }
  unsigned int v10 = vcvtmd_u64_f64(a5);
  unsigned int v11 = vcvtmd_u64_f64(floor((double)a1 * (double)v9 / (double)a2) + 0.5);
  int v12 = v11 | 1;
  int v13 = (v11 & 1) + v11;
  if (v10) {
    int v13 = v12;
  }
  return a3 - (double)(int)(v13 - v10) * 0.5;
}

double PAConvertCropRectWithAspectRatioAndArea(unint64_t a1, unint64_t a2, double a3, double a4, double a5, double a6, double a7)
{
  return _rectWithAspectRatio(a1, a2, a3, a4, a5, a6, a7 / (a5 * a6));
}

double PACropRectWithCropSizeAndPreferredCenterPoint(double a1, double a2, double a3, double a4, double a5)
{
  double result = 0.0;
  if (a3 > 0.0)
  {
    double v7 = (double)(unint64_t)a1;
    unint64_t v8 = (unint64_t)fmin(v7, a3);
    return fmax(fmin((double)v8 * -0.5 + v7 * a5, (double)((unint64_t)a1 - v8)), 0.0);
  }
  return result;
}

__n128 PARecomposeAffineTransform@<Q0>(uint64_t a1@<X0>, __n128 *a2@<X8>)
{
  __double2 v4 = __sincos_stret(*(double *)(a1 + 16));
  double v5 = *(double *)a1;
  double v6 = *(double *)(a1 + 8);
  a2->n128_f64[0] = *(double *)a1 * v4.__cosval;
  a2->n128_f64[1] = v4.__sinval * v6;
  a2[1].n128_f64[0] = -(v5 * v4.__sinval);
  a2[1].n128_f64[1] = v4.__cosval * v6;
  __n128 result = *(__n128 *)(a1 + 24);
  a2[2] = result;
  return result;
}

double PAAffineTransformDelta@<D0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, uint64_t a3@<X8>)
{
  double v3 = a2[2].f64[0] - a1[2].f64[0];
  float64x2_t v4 = vsubq_f64(a2[1], a1[1]);
  v6[0] = vdivq_f64(*a2, *a1);
  v6[1] = v4;
  double v7 = v3;
  *(void *)&double result = PAAffineTransformStandardize((uint64_t)v6, a3).n128_u64[0];
  return result;
}

__n128 PAAffineTransformStandardize@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v5 = *(double *)a1;
  double v4 = *(double *)(a1 + 8);
  if (*(double *)a1 >= 0.0)
  {
    if (v4 >= 0.0)
    {
      double v6 = *(double *)(a1 + 16);
      goto LABEL_14;
    }
  }
  else if (v4 < 0.0)
  {
    *(double *)a1 = -v5;
    *(double *)(a1 + 8) = -v4;
    double v6 = *(double *)(a1 + 16);
    if (v6 > 0.0)
    {
LABEL_12:
      double v7 = -3.14159265;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  double v6 = *(double *)(a1 + 16);
  if (v6 >= -1.57079633)
  {
    if (v6 <= 1.57079633) {
      goto LABEL_14;
    }
    *(double *)a1 = -v5;
    *(double *)(a1 + 8) = -v4;
    goto LABEL_12;
  }
  *(double *)a1 = -v5;
  *(double *)(a1 + 8) = -v4;
LABEL_8:
  double v7 = 3.14159265;
LABEL_13:
  double v6 = v6 + v7;
  *(double *)(a1 + 16) = v6;
LABEL_14:
  double v8 = -3.14159265;
  if (v6 <= -3.14159265)
  {
    double v9 = 3.14159265;
    goto LABEL_18;
  }
  double v8 = 3.14159265;
  if (v6 > 3.14159265)
  {
    double v9 = -3.14159265;
LABEL_18:
    *(long double *)(a1 + 16) = fmod(v6 + v8, 6.28318531) + v9;
  }
  __n128 result = *(__n128 *)a1;
  long long v11 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v11;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  return result;
}

uint64_t PAAffineTransformOrientation(double *a1)
{
  double v1 = *a1;
  uint64_t v2 = 4;
  if (a1[1] < 0.0)
  {
    BOOL v3 = v1 < 0.0;
  }
  else
  {
    uint64_t v2 = 1;
    BOOL v3 = 0;
  }
  uint64_t v4 = (uint64_t)llround(a1[2] * 180.0 / 3.14159265) / 90;
  uint64_t v5 = v4 & 3;
  uint64_t v6 = 2;
  if (v3) {
    uint64_t v6 = 3;
  }
  uint64_t v7 = -v4;
  BOOL v3 = v7 < 0;
  uint64_t v8 = v7 & 3;
  if (v3) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = -v8;
  }
  if (v1 >= 0.0) {
    uint64_t v10 = v2;
  }
  else {
    uint64_t v10 = v6;
  }
  return IPAOrientationConcat(qword_1DD424438[v9 + 3], v10);
}

uint64_t NSStringFromPAAffineTransform(void *a1)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"PAAffineTransform:[scale: %0.2f, %0.2f; translation: %0.2f, %0.2f; rotation: %0.2f]",
           *a1,
           a1[1],
           a1[3],
           a1[4],
           a1[2]);
}

void sub_1DD41600C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD4160DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD416264(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NSStringFromPFIntPoint(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"{%ld, %ld}", a1, a2];
}

uint64_t IPAOrientationFromClockwiseRotation(uint64_t a1)
{
  if (a1 / -90 >= 0) {
    uint64_t v1 = -((a1 / -90) & 3);
  }
  else {
    uint64_t v1 = (a1 / 90) & 3;
  }
  return qword_1DD424438[v1 + 3];
}

uint64_t IPAOrientationFromClockwiseRotationAndFlip(uint64_t a1, int a2, int a3)
{
  if (a1 / -90 >= 0) {
    uint64_t v3 = -((a1 / -90) & 3);
  }
  else {
    uint64_t v3 = (a1 / 90) & 3;
  }
  uint64_t v4 = qword_1DD424438[v3 + 3];
  uint64_t v5 = 2;
  if ((a2 & a3) != 0) {
    uint64_t v5 = 3;
  }
  uint64_t v6 = 4;
  if (!a3) {
    uint64_t v6 = 1;
  }
  if (a2) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v6;
  }
  return IPAOrientationConcat(v4, v7);
}

uint64_t IPAOrientationConcat(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a1 - 9) <= 0xFFFFFFFFFFFFFFF7)
  {
    _PFAssertFailHandler();
  }
  else if ((unint64_t)(a2 - 9) > 0xFFFFFFFFFFFFFFF7)
  {
    return IPAOrientationConcat_m[8 * a1 - 9 + a2];
  }
  uint64_t v3 = _PFAssertFailHandler();
  return IPAOrientationToClockwiseRotation(v3);
}

uint64_t IPAOrientationToClockwiseRotation(uint64_t a1)
{
  if ((unint64_t)(a1 - 3) > 5) {
    return 0;
  }
  else {
    return dword_1DD424470[a1 - 3];
  }
}

uint64_t IPAOrientationInverse(uint64_t a1)
{
  uint64_t v1 = 6;
  if (a1 != 8) {
    uint64_t v1 = a1;
  }
  if (a1 == 6) {
    return 8;
  }
  else {
    return v1;
  }
}

double IPAOrientationTransformImageSize(uint64_t a1, double a2, double a3)
{
  if ((unint64_t)(a1 - 5) >= 4) {
    return a2;
  }
  return a3;
}

uint64_t IPAOrientationTransformIntegralImageSize(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if ((unint64_t)(a1 - 5) >= 4) {
    return (int)(double)a2;
  }
  else {
    return (int)(double)a3;
  }
}

double IPAOrientationTransformVector(uint64_t a1, double result, double a3)
{
  switch(a1)
  {
    case 2:
      __n128 result = -result;
      break;
    case 3:
      __n128 result = -result;
      break;
    case 5:
      __n128 result = -a3;
      break;
    case 6:
      __n128 result = a3;
      break;
    case 7:
      __n128 result = a3;
      break;
    case 8:
      __n128 result = -a3;
      break;
    default:
      return result;
  }
  return result;
}

double IPAOrientationTransformImageRect(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  switch(a1)
  {
    case 2:
      a4 = a2 - (a4 + a6);
      break;
    case 3:
      a4 = a2 - (a4 + a6);
      break;
    case 5:
      a4 = a3 - (a5 + a7);
      break;
    case 6:
      a4 = a5;
      break;
    case 7:
      a4 = a5;
      break;
    case 8:
      a4 = a3 - (a5 + a7);
      break;
    default:
      return a4;
  }
  return a4;
}

uint64_t IPAOrientationMakeTransformWithSize@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  switch(result)
  {
    case 2:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0x3FF0000000000000;
      *(double *)(a2 + 32) = a3;
      goto LABEL_11;
    case 3:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0xBFF0000000000000;
      *(double *)(a2 + 32) = a3;
      *(double *)(a2 + 40) = a4;
      return result;
    case 4:
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)a2 = 0x3FF0000000000000;
      *(_OWORD *)(a2 + 24) = xmmword_1DD4240D0;
      *(double *)(a2 + 40) = a4;
      return result;
    case 5:
      *(_OWORD *)a2 = xmmword_1DD4240C0;
      *(_OWORD *)(a2 + 16) = xmmword_1DD4240D0;
      *(double *)(a2 + 32) = a4;
      *(double *)(a2 + 40) = a3;
      return result;
    case 6:
      *(_OWORD *)a2 = xmmword_1DD4240C0;
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 16) = 0x3FF0000000000000;
      *(double *)(a2 + 40) = a3;
      return result;
    case 7:
      *(_OWORD *)a2 = xmmword_1DD424090;
      *(void *)(a2 + 16) = 0x3FF0000000000000;
      *(void *)(a2 + 24) = 0;
      goto LABEL_9;
    case 8:
      *(_OWORD *)a2 = xmmword_1DD424090;
      *(_OWORD *)(a2 + 16) = xmmword_1DD4240D0;
      *(double *)(a2 + 32) = a4;
LABEL_11:
      *(void *)(a2 + 40) = 0;
      return result;
    default:
      *(void *)a2 = 0x3FF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0x3FF0000000000000;
LABEL_9:
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 40) = 0;
      return result;
  }
}

__CFString *IPAOrientationName(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 8) {
    uint64_t v1 = 0;
  }
  else {
    uint64_t v1 = a1;
  }
  return IPAOrientationName_names[v1];
}

BOOL IPAOrientationIsValid(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 8;
}

uint64_t IPAOrientationHasFlip(unint64_t a1)
{
  return (a1 < 8) & (0xB4u >> a1);
}

void sub_1DD417224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD417640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);

  _Block_object_dispose((const void *)(v34 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1740(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1741(uint64_t a1)
{
}

void sub_1DD417A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_1DD417D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD417EF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD417F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1DD4181DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41841C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD418490(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t NSStringFromPFIntSize(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"{%lu, %lu}", a1, a2];
}

void sub_1DD418598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41927C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void PA::Matrix4d::MultiplyWithProject(double *a1, __n128 a2, double a3)
{
  __n128 v10 = a2;
  double v11 = a3;
  uint64_t v12 = 0x3FF0000000000000;
  PA::operator*(a1, v10.n128_f64);
  if (v3 == 0.0)
  {
    uint64_t v4 = (IPAPerspectiveTransform *)_PFAssertFailHandler();
    [(IPAPerspectiveTransform *)v4 initWithInputGeometry:v6 intrinsicGeometry:v7 projectionTransform:v8 viewingTransform:v9];
  }
}

void sub_1DD41998C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t PA::Quad2d::simpleContains(PA::Quad2d *this, const Vector2d *a2)
{
  BOOL v4 = PA::Quad2d::simpleContains(this, a2, a2->X, a2->Y);
  BOOL v6 = PA::Quad2d::simpleContains(this, v5, a2[1].X, a2[1].Y);
  BOOL v8 = PA::Quad2d::simpleContains(this, v7, a2[2].X, a2[2].Y);
  return (v4 && v6) & v8 & PA::Quad2d::simpleContains(this, v9, a2[3].X, a2[3].Y);
}

BOOL PA::Quad2d::simpleContains(PA::Quad2d *this, const Vector2d *a2, double a3, double a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v6 = *((_OWORD *)this + 1);
  v11[0] = *(_OWORD *)this;
  v11[1] = v6;
  long long v7 = *((_OWORD *)this + 2);
  v11[2] = *((_OWORD *)this + 3);
  v11[3] = v7;
  v11[4] = v11[0];
  double v8 = *((double *)v11 + 1);
  do
  {
    double v9 = v8;
    double v8 = *((double *)&v11[v4 + 1] + 1);
    if (v9 <= a4)
    {
      if (v8 > a4
        && (*(double *)&v11[v4 + 1] - *(double *)&v11[v4]) * (a4 - v9) - (v8 - v9) * (a3 - *(double *)&v11[v4]) >= 0.0)
      {
        ++v5;
      }
    }
    else if (v8 <= a4)
    {
      v5 -= (*(double *)&v11[v4 + 1] - *(double *)&v11[v4]) * (a4 - v9) - (v8 - v9) * (a3 - *(double *)&v11[v4]) <= 0.0;
    }
    ++v4;
  }
  while (v4 != 4);
  return v5 != 0;
}

BOOL PA::centerRectFinder::converged(PA::centerRectFinder *this, const CGRect *a2, const CGRect *a3, double a4)
{
  return vabdd_f64(a2->size.height, a3->size.height) < a4;
}

double PA::centerRectFinder::constructNextRect(PA::centerRectFinder *this, const CGRect *a2, const CGRect *a3)
{
  return *((double *)this + 1)
       - *((double *)this + 3) * (a3->size.height + (a2->size.height - a3->size.height) * 0.5) * 0.5;
}

void PA::centerRectFinder::~centerRectFinder(PA::centerRectFinder *this)
{
}

void sub_1DD419CD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

double PFPointInterpolate(double a1, double a2, double a3, double a4, double a5)
{
  double v5 = 1.0;
  if (a5 <= 1.0) {
    double v5 = a5;
  }
  if (a5 >= 0.0) {
    double v6 = v5;
  }
  else {
    double v6 = 0.0;
  }
  return a1 - (a1 - a3) * v6;
}

double PFPointMapToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  return a9 + a11 * ((a1 - a3) / a5);
}

__CFString *NSStringFromEditSource(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6CC2088[a1 - 1];
  }
}

BOOL IPAEditSourceIsForMaster(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

#error "1DD41BC5C: call analysis failed (funcsize=22)"

id PANSAffineTransformWithCGAffineTransform(_OWORD *a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28AF0] transform];
  long long v3 = a1[1];
  v5[0] = *a1;
  v5[1] = v3;
  v5[2] = a1[2];
  [v2 setTransformStruct:v5];
  return v2;
}

BOOL CGAffineTransformIsValid(double *a1)
{
  return *a1 * a1[3] - a1[1] * a1[2] != 0.0;
}

double CGAffineTransformDeterminant(double *a1)
{
  return *a1 * a1[3] - a1[1] * a1[2];
}

double CGAffineTransformDot(double *a1, double *a2)
{
  return a1[1] * a2[1] + *a1 * *a2 + a1[2] * a2[2] + a1[3] * a2[3];
}

float64x2_t CGAffineTransformSubstract@<Q0>(float64x2_t *a1@<X0>, float64x2_t *a2@<X1>, float64x2_t *a3@<X8>)
{
  float64x2_t v3 = vsubq_f64(a1[1], a2[1]);
  *a3 = vsubq_f64(*a1, *a2);
  a3[1] = v3;
  float64x2_t result = vsubq_f64(a1[2], a2[2]);
  a3[2] = result;
  return result;
}

double CGAffineTransformRoot(double *a1)
{
  double v1 = *a1;
  double v2 = a1[1];
  double v4 = a1[2];
  double v3 = a1[3];
  double v5 = *a1 * v3 - v2 * v4;
  if (v5 != 0.0) {
    return (v4 * a1[5] - v3 * a1[4]) / v5;
  }
  if (v1 == 0.0 && v4 == 0.0)
  {
    if (v2 == 0.0)
    {
      return 0.0;
    }
    else if (a1[4] == 0.0)
    {
      return -a1[5] / v2;
    }
    else
    {
      return 0.0;
    }
  }
  else if (v2 == 0.0 && v3 == 0.0)
  {
    double result = 0.0;
    if (a1[5] == 0.0)
    {
      double result = -a1[4] / v1;
      if (v1 == 0.0) {
        return 0.0;
      }
    }
  }
  else
  {
    double v7 = a1[4];
    double v8 = a1[5];
    double v9 = v2 * v7;
    double v10 = v7 * v3;
    double result = -v7 / v1;
    if (v8 * v4 != v10) {
      double result = 0.0;
    }
    if (v9 != v1 * v8) {
      return 0.0;
    }
  }
  return result;
}

double CGAffineTransformFixedPoint(float64x2_t *a1)
{
  float64x2_t v1 = vsubq_f64(a1[1], *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 16));
  v3[0] = vsubq_f64(*a1, *MEMORY[0x1E4F1DAB8]);
  v3[1] = v1;
  v3[2] = vsubq_f64(a1[2], *(float64x2_t *)(MEMORY[0x1E4F1DAB8] + 32));
  return CGAffineTransformRoot((double *)v3);
}

BOOL CGAffineTransformHasRotation(double *a1)
{
  return *a1 < 0.0 || a1[1] != 0.0 || a1[2] != 0.0 || a1[3] < 0.0;
}

CGAffineTransform *CGAffineTransformMove@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, a3, a4);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, -a5, -a6);
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  CGAffineTransform t1 = v16;
  long long v10 = a1[1];
  *(_OWORD *)&v12.a = *a1;
  *(_OWORD *)&v12.c = v10;
  *(_OWORD *)&v12.tx = a1[2];
  CGAffineTransformConcat(&v14, &t1, &v12);
  CGAffineTransform t1 = v15;
  return CGAffineTransformConcat((CGAffineTransform *)a2, &v14, &t1);
}

id NSStringFromAffineTranform(_OWORD *a1)
{
  long long v1 = a1[1];
  v5[0] = *a1;
  v5[1] = v1;
  v5[2] = a1[2];
  double v2 = PANSAffineTransformWithCGAffineTransform(v5);
  double v3 = [v2 description];

  return v3;
}

CGFloat CGAffineTransformForMappingFromRectToRect@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, CGFloat a6@<D4>, CGFloat a7@<D5>, double a8@<D6>, double a9@<D7>)
{
  uint64_t v16 = MEMORY[0x1E4F1DAB8];
  long long v17 = *MEMORY[0x1E4F1DAB8];
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)(a1 + 16) = v18;
  long long v19 = *(_OWORD *)(v16 + 32);
  *(_OWORD *)(a1 + 32) = v19;
  *(_OWORD *)&v26.a = v17;
  *(_OWORD *)&v26.c = v18;
  *(_OWORD *)&v26.tx = v19;
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v26, a6, a7);
  long long v20 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v20;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v26, &v25, a8 / a4, a9 / a5);
  long long v21 = *(_OWORD *)&v26.c;
  *(_OWORD *)a1 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a1 + 16) = v21;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v26.tx;
  long long v22 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v25.a = *(_OWORD *)a1;
  *(_OWORD *)&v25.c = v22;
  *(_OWORD *)&v25.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformTranslate(&v26, &v25, -a2, -a3);
  long long v23 = *(_OWORD *)&v26.c;
  *(_OWORD *)a1 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a1 + 16) = v23;
  CGFloat result = v26.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v26.tx;
  return result;
}

__n128 CGAffineTransformRelative@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result = *(__n128 *)a1;
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = v3;
  *(void *)(a2 + 32) = 0;
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1DD41D46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2208(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2209(uint64_t a1)
{
}

void sub_1DD41DB04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41DB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41DC74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41DCC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41DD50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41DE04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41DEA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41E1F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41E358(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41E4AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41E520(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41E580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41E690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1DD41E768(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9710](data, *(void *)&len, md);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1F40D9790](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97D8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97E8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F0](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1F40D97F8](retstr, t, tx, ty);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  MEMORY[0x1F40DB220](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x1F40DB2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB2C8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB2D0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1F40DB2D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1F40DB2E0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  MEMORY[0x1F40DB2F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  MEMORY[0x1F40DB300]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1F40DC0C8](time1, time2);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC0E0](time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x1F40DC0E8](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  MEMORY[0x1F40DC100](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1F40DC108](retstr, value, *(void *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1F40DC110](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1F40DC120](retstr, *(void *)&preferredTimescale, seconds);
}

CMTime *__cdecl CMTimeMapTimeFromRangeToRange(CMTime *__return_ptr retstr, CMTime *t, CMTimeRange *fromRange, CMTimeRange *toRange)
{
  return (CMTime *)MEMORY[0x1F40DC130](retstr, t, fromRange, toRange);
}

CMTime *__cdecl CMTimeMaximum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC160](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1F40DC168](retstr, time1, time2);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1F40DC190](range, time);
}

Boolean CMTimeRangeContainsTimeRange(CMTimeRange *range, CMTimeRange *otherRange)
{
  return MEMORY[0x1F40DC198](range, otherRange);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1F40DC1A0](range, allocator);
}

CFStringRef CMTimeRangeCopyDescription(CFAllocatorRef allocator, CMTimeRange *range)
{
  return (CFStringRef)MEMORY[0x1F40DC1A8](allocator, range);
}

Boolean CMTimeRangeEqual(CMTimeRange *range1, CMTimeRange *range2)
{
  return MEMORY[0x1F40DC1B0](range1, range2);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1B8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1F40DC1C0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1F40DC1D8](retstr, start, duration);
}

BOOL NSContainsRect(NSRect aRect, NSRect bRect)
{
  return MEMORY[0x1F40E7028]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return MEMORY[0x1F40E70B8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)bPoint, *(__n128 *)&bPoint.y);
}

BOOL NSEqualSizes(NSSize aSize, NSSize bSize)
{
  return MEMORY[0x1F40E70C8]((__n128)aSize, *(__n128 *)&aSize.height, (__n128)bSize, *(__n128 *)&bSize.height);
}

NSRect NSInsetRect(NSRect aRect, CGFloat dX, CGFloat dY)
{
  MEMORY[0x1F40E7128]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, dX, dY);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

NSRect NSIntegralRect(NSRect aRect)
{
  MEMORY[0x1F40E7130]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSRect NSIntersectionRect(NSRect aRect, NSRect bRect)
{
  MEMORY[0x1F40E7148]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, (__n128)bRect.origin, *(__n128 *)&bRect.origin.y, (__n128)bRect.size, *(__n128 *)&bRect.size.height);
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL NSIsEmptyRect(NSRect aRect)
{
  return MEMORY[0x1F40E7160]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSRect NSOffsetRect(NSRect aRect, CGFloat dX, CGFloat dY)
{
  MEMORY[0x1F40E71B8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height, dX, dY);
  result.size.CGFloat height = v6;
  result.size.CGFloat width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL NSPointInRect(NSPoint aPoint, NSRect aRect)
{
  return MEMORY[0x1F40E71D8]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1F40E72A8]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *__cdecl NSStringFromSize(NSSize aSize)
{
  return (NSString *)MEMORY[0x1F40E72C0]((__n128)aSize, *(__n128 *)&aSize.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1F40D8D18]();
}

uint64_t _PFAssertContinueHandler()
{
  return MEMORY[0x1F413F3A8]();
}

uint64_t _PFAssertFailHandler()
{
  return MEMORY[0x1F413F3B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__double2 __sincos_stret(double a1)
{
  MEMORY[0x1F40C9C80](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan(long double __x)
{
  MEMORY[0x1F40CA450](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x1F40CA460](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x1F40CA468](a1, a2);
  return result;
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  MEMORY[0x1F40CC640](a1, a2);
  return result;
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}