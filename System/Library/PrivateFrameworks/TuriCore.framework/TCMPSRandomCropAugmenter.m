@interface TCMPSRandomCropAugmenter
- (TCMPSRandomCropAugmenter)init;
- (double)maxAreaFraction;
- (double)maxAspectRatio;
- (double)minAreaFraction;
- (double)minAspectRatio;
- (double)minEjectCoverage;
- (double)minObjectCovered;
- (double)skipProbability;
- (id)applyCrop:(CGRect)a3 toAnnotations:(id)a4;
- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4;
- (unint64_t)maxAttempts;
- (void)setMaxAreaFraction:(double)a3;
- (void)setMaxAspectRatio:(double)a3;
- (void)setMaxAttempts:(unint64_t)a3;
- (void)setMinAreaFraction:(double)a3;
- (void)setMinAspectRatio:(double)a3;
- (void)setMinEjectCoverage:(double)a3;
- (void)setMinObjectCovered:(double)a3;
- (void)setSkipProbability:(double)a3;
@end

@implementation TCMPSRandomCropAugmenter

- (TCMPSRandomCropAugmenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)TCMPSRandomCropAugmenter;
  result = [(TCMPSRandomCropAugmenter *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_skipProbability = xmmword_2246E9A00;
    *(_OWORD *)&result->_maxAspectRatio = xmmword_2246E9A10;
    *(_OWORD *)&result->_maxAreaFraction = xmmword_2246E9A20;
    result->_maxAttempts = 50;
    result->_minEjectCoverage = 0.5;
  }
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  id v6 = a3;
  v7 = (double (**)(double, double))a4;
  double v8 = v7[2](0.0, 1.0);
  [(TCMPSRandomCropAugmenter *)self skipProbability];
  if (v8 >= v9
    && ([v6 bounds],
        double Height = CGRectGetHeight(v36),
        [v6 bounds],
        double Width = CGRectGetWidth(v37),
        [(TCMPSRandomCropAugmenter *)self maxAttempts]))
  {
    uint64_t v12 = 0;
    double v13 = Height * Width;
    while (1)
    {
      [(TCMPSRandomCropAugmenter *)self minAspectRatio];
      double v15 = v14;
      [(TCMPSRandomCropAugmenter *)self maxAspectRatio];
      double v17 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, v15, v16);
      if (Height <= Width / v17) {
        double v18 = Height;
      }
      else {
        double v18 = Width / v17;
      }
      [(TCMPSRandomCropAugmenter *)self maxAreaFraction];
      *(float *)&double v19 = v13 * v19 / v17;
      double v20 = sqrtf(*(float *)&v19);
      if (v18 > v20) {
        double v18 = v20;
      }
      [(TCMPSRandomCropAugmenter *)self minAreaFraction];
      *(float *)&double v21 = v13 * v21 / v17;
      if (v18 >= sqrtf(*(float *)&v21))
      {
        double v22 = ((double (*)(double (**)(double, double)))v7[2])(v7);
        double v23 = v17 * v22;
        double v24 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, 0.0, Width - v23);
        double v25 = ((double (*)(double (**)(double, double), double, double))v7[2])(v7, 0.0, Height - v22);
        [v6 bounds];
        double v27 = v24 + v26;
        [v6 bounds];
        double v29 = v25 + v28;
        v30 = [v6 annotations];
        v31 = -[TCMPSRandomCropAugmenter applyCrop:toAnnotations:](self, "applyCrop:toAnnotations:", v30, v27, v29, v23, v22);

        if (v31) {
          break;
        }
      }
      if (++v12 >= [(TCMPSRandomCropAugmenter *)self maxAttempts]) {
        goto LABEL_12;
      }
    }
    id v32 = (id)objc_opt_new();
    v34 = [v6 image];
    [v32 setImage:v34];

    objc_msgSend(v32, "setBounds:", v27, v29, v23, v22);
    [v32 setAnnotations:v31];
  }
  else
  {
LABEL_12:
    id v32 = v6;
  }

  return v32;
}

- (id)applyCrop:(CGRect)a3 toAnnotations:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v12 boundingBox];
        v46.origin.double x = v13;
        CGFloat v34 = v13;
        CGFloat v15 = v14;
        CGFloat v17 = v16;
        CGFloat v19 = v18;
        v46.origin.double y = v14;
        v46.size.double width = v16;
        v46.size.double height = v18;
        CGRect v42 = CGRectIntersection(a3, v46);
        double x = v42.origin.x;
        double y = v42.origin.y;
        double width = v42.size.width;
        double height = v42.size.height;
        double v24 = CGRectGetHeight(v42);
        v43.origin.double x = x;
        v43.origin.double y = y;
        v43.size.double width = width;
        v43.size.double height = height;
        double v33 = v24 * CGRectGetWidth(v43);
        v44.origin.double x = v34;
        v44.origin.double y = v15;
        v44.size.double width = v17;
        v44.size.double height = v19;
        double v25 = CGRectGetHeight(v44);
        v45.origin.double x = v34;
        v45.origin.double y = v15;
        v45.size.double width = v17;
        v45.size.double height = v19;
        double v26 = v33 / (v25 * CGRectGetWidth(v45));
        [(TCMPSRandomCropAugmenter *)self minObjectCovered];
        if (v26 < v27)
        {

          id v30 = 0;
          goto LABEL_13;
        }
        [(TCMPSRandomCropAugmenter *)self minEjectCoverage];
        if (v26 >= v28)
        {
          double v29 = (void *)[v12 copy];
          objc_msgSend(v29, "setBoundingBox:", x, y, width, height);
          [v6 addObject:v29];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v30 = v6;
LABEL_13:

  return v30;
}

- (double)skipProbability
{
  return self->_skipProbability;
}

- (void)setSkipProbability:(double)a3
{
  self->_skipProbabilitdouble y = a3;
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

- (double)minObjectCovered
{
  return self->_minObjectCovered;
}

- (void)setMinObjectCovered:(double)a3
{
  self->_minObjectCovered = a3;
}

- (unint64_t)maxAttempts
{
  return self->_maxAttempts;
}

- (void)setMaxAttempts:(unint64_t)a3
{
  self->_maxAttempts = a3;
}

- (double)minEjectCoverage
{
  return self->_minEjectCoverage;
}

- (void)setMinEjectCoverage:(double)a3
{
  self->_minEjectCoverage = a3;
}

@end