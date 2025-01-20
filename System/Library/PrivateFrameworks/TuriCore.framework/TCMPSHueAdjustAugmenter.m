@interface TCMPSHueAdjustAugmenter
- (TCMPSHueAdjustAugmenter)init;
- (double)maxHueAdjust;
- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4;
- (void)setMaxHueAdjust:(double)a3;
@end

@implementation TCMPSHueAdjustAugmenter

- (TCMPSHueAdjustAugmenter)init
{
  v3.receiver = self;
  v3.super_class = (Class)TCMPSHueAdjustAugmenter;
  result = [(TCMPSHueAdjustAugmenter *)&v3 init];
  if (result) {
    result->_maxHueAdjust = 0.0500000007;
  }
  return result;
}

- (id)imageAugmentedFromImage:(id)a3 generator:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  v6 = (double (**)(void, double, double))a4;
  id v7 = a3;
  [(TCMPSHueAdjustAugmenter *)self maxHueAdjust];
  double v8 = 0.0;
  if (v9 > 0.0)
  {
    [(TCMPSHueAdjustAugmenter *)self maxHueAdjust];
    double v11 = -v10;
    [(TCMPSHueAdjustAugmenter *)self maxHueAdjust];
    double v8 = v6[2](v6, v11, v12) * 3.14159265 + 0.0;
  }
  v13 = objc_opt_new();
  v14 = [v7 image];
  uint64_t v20 = *MEMORY[0x263F00920];
  v15 = [NSNumber numberWithDouble:v8];
  v21[0] = v15;
  v16 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
  v17 = [v14 imageByApplyingFilter:@"CIHueAdjust" withInputParameters:v16];
  [v13 setImage:v17];

  [v7 bounds];
  objc_msgSend(v13, "setBounds:");
  v18 = [v7 annotations];

  [v13 setAnnotations:v18];
  return v13;
}

- (double)maxHueAdjust
{
  return self->_maxHueAdjust;
}

- (void)setMaxHueAdjust:(double)a3
{
  self->_maxHueAdjust = a3;
}

@end