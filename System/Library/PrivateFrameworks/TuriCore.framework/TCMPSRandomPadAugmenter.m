@interface TCMPSRandomPadAugmenter
- (TCMPSRandomPadAugmenter)init;
- (double)maxAreaFraction;
- (double)maxAspectRatio;
- (double)minAreaFraction;
- (double)minAspectRatio;
- (double)skipProbability;
- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4;
- (unint64_t)maxAttempts;
- (void)setMaxAreaFraction:(double)a3;
- (void)setMaxAspectRatio:(double)a3;
- (void)setMaxAttempts:(unint64_t)a3;
- (void)setMinAreaFraction:(double)a3;
- (void)setMinAspectRatio:(double)a3;
- (void)setSkipProbability:(double)a3;
@end

@implementation TCMPSRandomPadAugmenter

- (TCMPSRandomPadAugmenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)TCMPSRandomPadAugmenter;
  result = [(TCMPSRandomPadAugmenter *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_skipProbability = xmmword_2246E9A00;
    *(_OWORD *)&result->_maxAspectRatio = xmmword_2246E9A30;
    result->_maxAreaFraction = 2.0;
    result->_maxAttempts = 50;
  }
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  id v6 = a3;
  v7 = (double (**)(double, double))a4;
  double v8 = 1.0;
  double v9 = v7[2](0.0, 1.0);
  [(TCMPSRandomPadAugmenter *)self skipProbability];
  if (v9 < v10) {
    goto LABEL_14;
  }
  [v6 bounds];
  double Height = CGRectGetHeight(v39);
  [v6 bounds];
  double Width = CGRectGetWidth(v40);
  if ([(TCMPSRandomPadAugmenter *)self maxAttempts])
  {
    unint64_t v13 = 0;
    do
    {
      [(TCMPSRandomPadAugmenter *)self minAspectRatio];
      double v15 = v14;
      [(TCMPSRandomPadAugmenter *)self maxAspectRatio];
      double v8 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, v15, v16);
      if (Height >= Width / v8) {
        double v17 = Height;
      }
      else {
        double v17 = Width / v8;
      }
      [(TCMPSRandomPadAugmenter *)self minAreaFraction];
      *(float *)&double v18 = Width * (Height * v18) / v8;
      double v19 = sqrtf(*(float *)&v18);
      if (v17 < v19) {
        double v17 = v19;
      }
      [(TCMPSRandomPadAugmenter *)self maxAreaFraction];
      *(float *)&double v20 = Height * Width * v20 / v8;
      double v21 = sqrtf(*(float *)&v20);
      if (v17 < v21) {
        break;
      }
      ++v13;
    }
    while (v13 < [(TCMPSRandomPadAugmenter *)self maxAttempts]);
  }
  else
  {
    double v21 = Height;
    double v17 = Height;
  }
  if (v17 <= v21)
  {
    double v23 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, v17, v21);
    double v24 = v8 * v23;
    double v25 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, 0.0, v24 - Width);
    double v26 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, 0.0, v23 - Height);
    v27 = [MEMORY[0x263F00608] colorWithRed:0.5 green:0.5 blue:0.5];
    v28 = [MEMORY[0x263F00650] imageWithColor:v27];
    v29 = [v6 image];
    [v6 bounds];
    v30 = objc_msgSend(v29, "imageByCroppingToRect:");

    v31 = [v30 imageByCompositingOverImage:v28];
    [v6 bounds];
    double v33 = v32 - v25;
    [v6 bounds];
    double v35 = v34 - v26;
    id v22 = (id)objc_opt_new();
    [v22 setImage:v31];
    objc_msgSend(v22, "setBounds:", v33, v35, v24, v23);
    v36 = [v6 annotations];
    [v22 setAnnotations:v36];
  }
  else
  {
LABEL_14:
    id v22 = v6;
  }

  return v22;
}

- (double)skipProbability
{
  return self->_skipProbability;
}

- (void)setSkipProbability:(double)a3
{
  self->_skipProbability = a3;
}

- (double)minAspectRatio
{
  return self->_minAspectRatio;
}

- (void)setMinAspectRatio:(double)a3
{
  self->_minAspectRatio = a3;
}

- (double)maxAspectRatio
{
  return self->_maxAspectRatio;
}

- (void)setMaxAspectRatio:(double)a3
{
  self->_maxAspectRatio = a3;
}

- (double)minAreaFraction
{
  return self->_minAreaFraction;
}

- (void)setMinAreaFraction:(double)a3
{
  self->_minAreaFraction = a3;
}

- (double)maxAreaFraction
{
  return self->_maxAreaFraction;
}

- (void)setMaxAreaFraction:(double)a3
{
  self->_maxAreaFraction = a3;
}

- (unint64_t)maxAttempts
{
  return self->_maxAttempts;
}

- (void)setMaxAttempts:(unint64_t)a3
{
  self->_maxAttempts = a3;
}

@end