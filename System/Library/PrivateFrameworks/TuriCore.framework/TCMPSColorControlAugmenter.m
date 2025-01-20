@interface TCMPSColorControlAugmenter
- (TCMPSColorControlAugmenter)init;
- (double)maxBrightnessDelta;
- (double)maxContrastProportion;
- (double)maxSaturationProportion;
- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4;
- (void)setMaxBrightnessDelta:(double)a3;
- (void)setMaxContrastProportion:(double)a3;
- (void)setMaxSaturationProportion:(double)a3;
@end

@implementation TCMPSColorControlAugmenter

- (TCMPSColorControlAugmenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)TCMPSColorControlAugmenter;
  result = [(TCMPSColorControlAugmenter *)&v3 init];
  if (result)
  {
    *(int64x2_t *)&result->_maxBrightnessDelta = vdupq_n_s64(0x3FA99999A0000000uLL);
    result->_maxSaturationProportion = 0.0500000007;
  }
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  v33[3] = *MEMORY[0x263EF8340];
  v6 = (double (**)(void, double, double))a4;
  id v7 = a3;
  [(TCMPSColorControlAugmenter *)self maxBrightnessDelta];
  double v8 = 0.0;
  if (v9 > 0.0)
  {
    [(TCMPSColorControlAugmenter *)self maxBrightnessDelta];
    double v11 = -v10;
    [(TCMPSColorControlAugmenter *)self maxBrightnessDelta];
    double v8 = v6[2](v6, v11, v12) + 0.0;
  }
  [(TCMPSColorControlAugmenter *)self maxContrastProportion];
  double v13 = 1.0;
  double v14 = 1.0;
  if (v15 > 0.0)
  {
    [(TCMPSColorControlAugmenter *)self maxContrastProportion];
    double v17 = -v16;
    [(TCMPSColorControlAugmenter *)self maxContrastProportion];
    double v14 = v6[2](v6, v17, v18) + 1.0;
  }
  [(TCMPSColorControlAugmenter *)self maxSaturationProportion];
  if (v19 > 0.0)
  {
    [(TCMPSColorControlAugmenter *)self maxSaturationProportion];
    double v21 = -v20;
    [(TCMPSColorControlAugmenter *)self maxSaturationProportion];
    double v13 = v6[2](v6, v21, v22) + 1.0;
  }
  v23 = objc_opt_new();
  v32[0] = *MEMORY[0x263F00938];
  v24 = [NSNumber numberWithDouble:v8];
  v33[0] = v24;
  v32[1] = *MEMORY[0x263F00950];
  v25 = [NSNumber numberWithDouble:v14];
  v33[1] = v25;
  v32[2] = *MEMORY[0x263F00988];
  v26 = [NSNumber numberWithDouble:v13];
  v33[2] = v26;
  v27 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];

  v28 = [v7 image];
  v29 = [v28 imageByApplyingFilter:@"CIColorControls" withInputParameters:v27];
  [v23 setImage:v29];

  [v7 bounds];
  objc_msgSend(v23, "setBounds:");
  v30 = [v7 annotations];

  [v23 setAnnotations:v30];
  return v23;
}

- (double)maxBrightnessDelta
{
  return self->_maxBrightnessDelta;
}

- (void)setMaxBrightnessDelta:(double)a3
{
  self->_maxBrightnessDelta = a3;
}

- (double)maxContrastProportion
{
  return self->_maxContrastProportion;
}

- (void)setMaxContrastProportion:(double)a3
{
  self->_maxContrastProportion = a3;
}

- (double)maxSaturationProportion
{
  return self->_maxSaturationProportion;
}

- (void)setMaxSaturationProportion:(double)a3
{
  self->_maxSaturationProportion = a3;
}

@end