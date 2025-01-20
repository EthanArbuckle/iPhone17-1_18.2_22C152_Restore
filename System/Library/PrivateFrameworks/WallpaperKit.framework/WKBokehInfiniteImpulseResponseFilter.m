@interface WKBokehInfiniteImpulseResponseFilter
+ (id)lowpassFilterWithCoefficient:(double)a1;
+ (id)lowpassInertiaFilterWithCoefficient:(double)a1;
- (BOOL)zeroGradient;
- (WKBokehInfiniteImpulseResponseFilter)initWithCount:(unint64_t)a3 feedforwardCoefficients:(double *)a4 feedbackCoefficients:(double *)a5;
- (double)filterWithInput:(void *)a1;
- (double)output;
- (double)outputGradient;
- (double)zeroGradientThreshold;
- (uint64_t)setLowpassInertiaFilterCoefficient:(uint64_t)result;
- (uint64_t)setZeroGradientThreshold:(uint64_t)result;
- (void)dealloc;
- (void)resetToValue:(void *)result;
@end

@implementation WKBokehInfiniteImpulseResponseFilter

- (WKBokehInfiniteImpulseResponseFilter)initWithCount:(unint64_t)a3 feedforwardCoefficients:(double *)a4 feedbackCoefficients:(double *)a5
{
  if (a3 <= 1)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    v8 = @"count < 2";
LABEL_19:
    objc_msgSend(v6, "raise:format:", v7, v8, a5);
    v10 = 0;
    goto LABEL_20;
  }
  v9 = a4;
  if (!a4)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    v8 = @"feedforwardCoefficients is NULL";
    goto LABEL_19;
  }
  v10 = (WKBokehInfiniteImpulseResponseFilter *)a5;
  if (a5)
  {
    double v12 = 0.0;
    for (uint64_t i = 1; i != a3; ++i)
      double v12 = v12 + a5[i];
    unint64_t v14 = a3;
    double v15 = 0.0;
    unint64_t v16 = a3;
    v17 = a4;
    do
    {
      double v18 = *v17++;
      double v15 = v15 + v18;
      --v16;
    }
    while (v16);
    if (fabs((v15 - v12) * (1.0 / *a5) + -1.0) > 0.00001) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"coefficients scale the output, (1.0 / fbC[0])(sum(ffC) - sum(fbC[1:])) should be 1.0" format];
    }
    v30.receiver = self;
    v30.super_class = (Class)WKBokehInfiniteImpulseResponseFilter;
    v19 = [(WKBokehInfiniteImpulseResponseFilter *)&v30 init];
    v20 = v19;
    if (v19)
    {
      v19->_count = a3;
      size_t v21 = 8 * a3;
      v19->_ffC = (double *)malloc_type_malloc(v21, 0x100004000313F17uLL);
      v22 = (Class *)malloc_type_malloc(v21, 0x100004000313F17uLL);
      v20->_fbC = (double *)v22;
      ffC = v20->_ffC;
      unint64_t v24 = v14;
      do
      {
        uint64_t v25 = *(void *)v9++;
        *(void *)ffC++ = v25;
        Class isa = v10->super.isa;
        v10 = (WKBokehInfiniteImpulseResponseFilter *)((char *)v10 + 8);
        *v22++ = isa;
        --v24;
      }
      while (v24);
      v20->_inputHistory = (double *)malloc_type_malloc(v21, 0x100004000313F17uLL);
      v27 = (double *)malloc_type_malloc(v21, 0x100004000313F17uLL);
      v20->_outputHistory = v27;
      inputHistory = v20->_inputHistory;
      do
      {
        *inputHistory++ = 0.0;
        *v27++ = 0.0;
        --v14;
      }
      while (v14);
      v20->_zeroGradientThreshold = 0.001;
    }
    self = v20;
    v10 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"feedbackCoefficients is NULL"];
  }
LABEL_20:

  return v10;
}

+ (id)lowpassFilterWithCoefficient:(double)a1
{
  v6[2] = *MEMORY[0x1E4F143B8];
  self;
  if (a1 <= 0.0)
  {
    v2 = @"coeff <= 0.0";
  }
  else
  {
    if (a1 < 1.0) {
      goto LABEL_6;
    }
    v2 = @"coeff >= 1.0";
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:v2];
LABEL_6:
  v6[1] = 0;
  v5[0] = 0x3FF0000000000000;
  *(double *)&v5[1] = a1 + -1.0;
  *(double *)v6 = a1;
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCount:2 feedforwardCoefficients:v6 feedbackCoefficients:v5];
  return v3;
}

+ (id)lowpassInertiaFilterWithCoefficient:(double)a1
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self;
  double v1 = a1;
  if (a1 <= 0.0)
  {
    v2 = @"coeff <= 0.0";
  }
  else
  {
    if (a1 < 1.0) {
      goto LABEL_6;
    }
    v2 = @"coeff >= 1.0";
  }
  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], v2, *(void *)&a1);
  double v1 = v7;
LABEL_6:
  double v10 = v1;
  float64x2_t v11 = vmulq_n_f64((float64x2_t)xmmword_1BE1D2250, v1);
  float64x2_t v3 = vmulq_n_f64((float64x2_t)xmmword_1BE1D2260, v1);
  double v12 = v1 * 0.3;
  float64_t v13 = v3.f64[0];
  v8[0] = 0x3FF0000000000000;
  *(double *)&v8[1] = v1 + -1.0;
  *(double *)&v8[2] = v1 * 0.4;
  float64x2_t v9 = v3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCount:5 feedforwardCoefficients:&v10 feedbackCoefficients:v8];
  return v4;
}

- (uint64_t)setLowpassInertiaFilterCoefficient:(uint64_t)result
{
  if (result)
  {
    float64x2_t v2 = vmulq_n_f64((float64x2_t)xmmword_1BE1D2260, a2);
    uint64_t v3 = *(void *)(result + 16);
    *(double *)uint64_t v3 = a2;
    *(float64x2_t *)(v3 + 8) = vmulq_n_f64((float64x2_t)xmmword_1BE1D2250, a2);
    *(double *)(v3 + 24) = a2 * 0.3;
    *(float64_t *)(v3 + 32) = v2.f64[0];
    uint64_t v4 = *(void *)(result + 24);
    *(void *)uint64_t v4 = 0x3FF0000000000000;
    *(double *)(v4 + 8) = a2 + -1.0;
    *(double *)(v4 + 16) = a2 * 0.4;
    *(float64x2_t *)(v4 + 24) = v2;
  }
  return result;
}

- (double)filterWithInput:(void *)a1
{
  if (!a1) {
    return 0.0;
  }
  uint64_t v4 = (double *)a1[4];
  memmove(v4 + 1, v4, 8 * a1[1] - 8);
  double *v4 = a2;
  unint64_t v5 = a1[1];
  double v6 = 0.0;
  double v7 = 0.0;
  if (v5 >= 2)
  {
    v8 = (double *)a1[5];
    float64x2_t v9 = (double *)(a1[3] + 8);
    unint64_t v10 = v5 - 1;
    do
    {
      double v11 = *v8++;
      double v12 = v11;
      double v13 = *v9++;
      double v7 = v7 + v12 * v13;
      --v10;
    }
    while (v10);
  }
  if (v5)
  {
    uint64_t v14 = (double *)a1[4];
    double v15 = (double *)a1[2];
    double v6 = 0.0;
    uint64_t v16 = a1[1];
    do
    {
      double v17 = *v14++;
      double v18 = v17;
      double v19 = *v15++;
      double v6 = v6 + v18 * v19;
      --v16;
    }
    while (v16);
  }
  double v20 = (v6 - v7) * (1.0 / *(double *)a1[3]);
  size_t v21 = (double *)a1[5];
  memmove(v21 + 1, v21, 8 * v5 - 8);
  *size_t v21 = v20;
  return v20;
}

- (double)output
{
  if (a1) {
    return **(double **)(a1 + 40);
  }
  else {
    return 0.0;
  }
}

- (double)outputGradient
{
  if (a1) {
    return **(double **)(a1 + 40) - *(double *)(*(void *)(a1 + 40) + 8);
  }
  else {
    return 0.0;
  }
}

- (BOOL)zeroGradient
{
  if (result) {
    return vabdd_f64(**(double **)(result + 40), *(double *)(*(void *)(result + 40) + 8)) < *(double *)(result + 48);
  }
  return result;
}

- (void)resetToValue:(void *)result
{
  if (result)
  {
    uint64_t v2 = result[1];
    if (v2)
    {
      uint64_t v3 = (double *)result[4];
      uint64_t v4 = result[1];
      do
      {
        *v3++ = a2;
        --v4;
      }
      while (v4);
      unint64_t v5 = (double *)result[5];
      do
      {
        *v5++ = a2;
        --v2;
      }
      while (v2);
    }
  }
  return result;
}

- (void)dealloc
{
  free(self->_ffC);
  free(self->_fbC);
  free(self->_inputHistory);
  free(self->_outputHistory);
  v3.receiver = self;
  v3.super_class = (Class)WKBokehInfiniteImpulseResponseFilter;
  [(WKBokehInfiniteImpulseResponseFilter *)&v3 dealloc];
}

- (double)zeroGradientThreshold
{
  if (a1) {
    return *(double *)(a1 + 48);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setZeroGradientThreshold:(uint64_t)result
{
  if (result) {
    *(double *)(result + 48) = a2;
  }
  return result;
}

@end