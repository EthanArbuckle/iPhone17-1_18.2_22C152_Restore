@interface _SUIAShockwaveChromaticAberrationConfiguration
+ (CGRect)donutMaskRectForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 inBounds:(CGRect)a7;
+ (id)chromaticAberrationConfigurationForState:(int64_t)a3 variant:(int64_t)a4 buttonEmanating:(BOOL)a5 normalizedStartLocation:(CGRect)a6 settings:(id)a7 bounds:(CGRect)a8 usesIntelligentFillLight:(BOOL)a9;
+ (int64_t)configurationType;
- (CGPoint)aberrationMagnitude;
- (CGRect)donutMaskFrame;
- (NSArray)donutGradientColors;
- (NSArray)donutGradientLocations;
- (double)aberrationBlurRadius;
- (double)aberrationColorBrightnessFactor;
- (double)aberrationColorSaturateAmount;
- (double)aberrationEDRGain;
- (double)aberrationIntensity;
- (double)aberrationMultiplyFactor;
- (void)_setAberrationBlurRadius:(double)a3;
- (void)_setAberrationColorBrightnessFactor:(double)a3;
- (void)_setAberrationColorSaturateAmount:(double)a3;
- (void)_setAberrationEDRGain:(double)a3;
- (void)_setAberrationIntensity:(double)a3;
- (void)_setAberrationMagnitude:(CGPoint)a3;
- (void)_setAberrationMultiplyFactor:(double)a3;
- (void)_setDonutGradientColors:(id)a3;
- (void)_setDonutGradientLocations:(id)a3;
- (void)_setDonutMaskFrame:(CGRect)a3;
@end

@implementation _SUIAShockwaveChromaticAberrationConfiguration

- (void)_setDonutMaskFrame:(CGRect)a3
{
  propertyDictionary = self->super._propertyDictionary;
  CGRect v5 = a3;
  v4 = [MEMORY[0x263F08D40] valueWithBytes:&v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"donutMaskFrame"];
}

- (CGRect)donutMaskFrame
{
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"donutMaskFrame"];
  [v2 getValue:&v7 size:32];

  double v4 = *((double *)&v7 + 1);
  double v3 = *(double *)&v7;
  double v6 = *((double *)&v8 + 1);
  double v5 = *(double *)&v8;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)_setDonutGradientLocations:(id)a3
{
}

- (NSArray)donutGradientLocations
{
  return (NSArray *)[(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"donutGradientLocations"];
}

- (void)_setDonutGradientColors:(id)a3
{
}

- (NSArray)donutGradientColors
{
  return (NSArray *)[(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"donutGradientColors"];
}

- (void)_setAberrationIntensity:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"aberrationIntensity"];
}

- (double)aberrationIntensity
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"aberrationIntensity"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setAberrationMagnitude:(CGPoint)a3
{
  propertyDictionary = self->super._propertyDictionary;
  CGPoint v5 = a3;
  double v4 = [MEMORY[0x263F08D40] valueWithBytes:&v5 objCType:"{CGPoint=dd}"];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"aberrationMagnitude"];
}

- (CGPoint)aberrationMagnitude
{
  double v5 = 0.0;
  double v6 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"aberrationMagnitude"];
  [v2 getValue:&v5 size:16];

  double v3 = v5;
  double v4 = v6;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_setAberrationBlurRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"aberrationBlurRadius"];
}

- (double)aberrationBlurRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"aberrationBlurRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setAberrationEDRGain:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"aberrationEDRGain"];
}

- (double)aberrationEDRGain
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"aberrationEDRGain"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setAberrationColorBrightnessFactor:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"aberrationColorBrightnessFactor"];
}

- (double)aberrationColorBrightnessFactor
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"aberrationColorBrightnessFactor"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setAberrationMultiplyFactor:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"aberrationMultiplyFactor"];
}

- (double)aberrationMultiplyFactor
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"aberrationMultiplyFactor"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setAberrationColorSaturateAmount:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"aberrationColorSaturateAmount"];
}

- (double)aberrationColorSaturateAmount
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"aberrationColorSaturateAmount"];
  [v2 getValue:&v4 size:8];

  return v4;
}

+ (int64_t)configurationType
{
  return 1;
}

+ (CGRect)donutMaskRectForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 inBounds:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  CGFloat y = a7.origin.y;
  CGFloat x = a7.origin.x;
  id v14 = a6;
  v15 = [v14 chromaticAberrationInitialDonutMask];
  v16 = [v15 gradientLayerSize];
  [v16 sizeValue];
  BSRectWithSize();
  double v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  if ((unint64_t)a3 <= 5)
  {
    if (((1 << a3) & 0x2C) != 0)
    {
      v25 = objc_msgSend(v14, "chromaticAberrationFinalDonutMaskForShockwaveSize:", width, height);
      [v25 maximumExtentOfZeroOpacity];
      UIRectGetCenter();
      SUIAExpandNormalizedPoint(x, y, width, height, v26);
      v62.origin.CGFloat x = x;
      v62.origin.CGFloat y = y;
      v62.size.double width = width;
      v62.size.double height = height;
      CGRectGetMinX(v62);
      v63.origin.CGFloat x = x;
      v63.origin.CGFloat y = y;
      v63.size.double width = width;
      v63.size.double height = height;
      CGRectGetMinY(v63);
      UIDistanceBetweenPoints();
      v64.origin.CGFloat x = x;
      v64.origin.CGFloat y = y;
      v64.size.double width = width;
      v64.size.double height = height;
      CGRectGetMaxX(v64);
      v65.origin.CGFloat x = x;
      v65.origin.CGFloat y = y;
      v65.size.double width = width;
      v65.size.double height = height;
      CGRectGetMinY(v65);
      UIDistanceBetweenPoints();
      v66.origin.CGFloat x = x;
      v66.origin.CGFloat y = y;
      v66.size.double width = width;
      v66.size.double height = height;
      CGRectGetMinX(v66);
      v67.origin.CGFloat x = x;
      v67.origin.CGFloat y = y;
      v67.size.double width = width;
      v67.size.double height = height;
      CGRectGetMaxY(v67);
      UIDistanceBetweenPoints();
      v68.origin.CGFloat x = x;
      v68.origin.CGFloat y = y;
      v68.size.double width = width;
      v68.size.double height = height;
      CGRectGetMaxX(v68);
      v69.origin.CGFloat x = x;
      v69.origin.CGFloat y = y;
      v69.size.double width = width;
      v69.size.double height = height;
      CGRectGetMaxY(v69);
      UIDistanceBetweenPoints();
      uint64_t v27 = SUIAScreenEdgeForNormalizedButtonRect();
      if (v27 == 8 || v27 == 2) {
        objc_msgSend(v14, "finalFitVsDiameterRatioLongEdgeForShockwaveSize:", width, height);
      }
      else {
        objc_msgSend(v14, "finalFitVsDiameterRatioShortEdgeForShockwaveSize:", width, height);
      }
      BSRectWithSize();
      double v18 = SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v35, v36, v37, v38, 0.0, a5.origin.x, a5.origin.y, v39, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, x, y, width, height);
      CGFloat v20 = v40;
      CGFloat v22 = v41;
      CGFloat v24 = v42;
    }
    else if (((1 << a3) & 0x11) != 0 || a4)
    {
      [v14 donutMaskInitialEdgeOutsetProportion];
      double v18 = SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v18, v20, v22, v24, v28, v29, v30, v31, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, x, y, width, height);
      CGFloat v20 = v32;
      CGFloat v22 = v33;
      CGFloat v24 = v34;
    }
    else
    {
      objc_msgSend(a1, "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", 0, 0, v14, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, x, y, width, height);
      double v59 = v47;
      double v60 = v48;
      objc_msgSend(a1, "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", 2, 0, v14, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, x, y, width, height);
      double v50 = v49;
      [v14 captureHintInterpolationProgress];
      double v52 = v51;
      CGFloat v22 = v59 + v51 * (v50 - v59);
      CGFloat v24 = v60 + v51 * (v50 - v60);
      UIRectGetCenter();
      double v54 = v53;
      double v56 = v55;
      UIRectGetCenter();
      double v18 = v54 + v52 * (v57 - v54) - v22 * 0.5;
      CGFloat v20 = v56 + v52 * (v58 - v56) - v24 * 0.5;
    }
  }

  double v43 = v18;
  double v44 = v20;
  double v45 = v22;
  double v46 = v24;
  result.size.double height = v46;
  result.size.double width = v45;
  result.origin.CGFloat y = v44;
  result.origin.CGFloat x = v43;
  return result;
}

+ (id)chromaticAberrationConfigurationForState:(int64_t)a3 variant:(int64_t)a4 buttonEmanating:(BOOL)a5 normalizedStartLocation:(CGRect)a6 settings:(id)a7 bounds:(CGRect)a8 usesIntelligentFillLight:(BOOL)a9
{
  BOOL v9 = a9;
  double height = a8.size.height;
  double width = a8.size.width;
  double y = a8.origin.y;
  double x = a8.origin.x;
  double v13 = a6.size.height;
  double v14 = a6.size.width;
  double v15 = a6.origin.y;
  double v16 = a6.origin.x;
  id v20 = a7;
  id v21 = objc_alloc_init((Class)a1);
  CGFloat v22 = [v20 donutMaskPositionAnimationSettings];
  [v20 aberrationMagnitudeX];
  double v63 = v23;
  [v20 aberrationMagnitudeY];
  double v62 = v24;
  uint64_t v25 = SUIAScreenEdgeForNormalizedButtonRect();
  memset(&v66, 0, sizeof(v66));
  SUIACATransform3DFromNominalRightEdgeToEdge(v25, &v66);
  memset(&v65, 0, sizeof(v65));
  CATransform3D v64 = v66;
  CATransform3DGetAffineTransform(&v65, &v64);
  objc_msgSend(v21, "_setAberrationMagnitude:", vaddq_f64(*(float64x2_t *)&v65.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v65.c, v62), *(float64x2_t *)&v65.a, v63)));
  [v20 aberrationBlurRadius];
  objc_msgSend(v21, "_setAberrationBlurRadius:");
  int v26 = [v20 aberrationUseEDR];
  double v27 = 0.0;
  double v28 = 0.0;
  if (v26) {
    objc_msgSend(v20, "aberrationEDRGain", 0.0);
  }
  [v21 _setAberrationEDRGain:v28];
  if ([v20 aberrationUseColorBrightness])
  {
    [v20 aberrationColorBrightness];
    double v27 = v29;
  }
  [v21 _setAberrationColorBrightnessFactor:v27];
  int v30 = [v20 aberrationUseColorMatrixMultiply];
  double v31 = 0.0;
  double v32 = 0.0;
  if (v30) {
    objc_msgSend(v20, "aberrationColorMatrixMultiplyFactor", 0.0);
  }
  [v21 _setAberrationMultiplyFactor:v32];
  if ([v20 aberrationUseColorSaturate])
  {
    [v20 aberrationColorSaturateAmount];
    double v31 = v33;
  }
  [v21 _setAberrationColorSaturateAmount:v31];
  [v21 _setAberrationIntensity:1.0];
  if ((unint64_t)a3 <= 5)
  {
    if (((1 << a3) & 0x2C) != 0)
    {
      if (a4)
      {
        double v34 = v22;
      }
      else
      {
        double v34 = (void *)[v22 copy];

        if (v9) {
          [v20 visionIntelligenceHintRetargetImpulse];
        }
        else {
          [v20 captureHintRetargetImpulse];
        }
        double v49 = v41;
        [v34 retargetImpulse];
        [v34 setRetargetImpulse:v49 + v50];
      }
      objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v20, v16, v15, v14, v13, x, y, width, height);
      objc_msgSend(v21, "_setDonutMaskFrame:");
      [v20 donutMaskEndTransitionDelay];
      double v52 = v51;
      double v48 = objc_msgSend(v20, "chromaticAberrationFinalDonutMaskForShockwaveSize:", width, height);
      double v53 = (void *)[v34 copy];
      [v21 _setBehaviorSettings:v53 forKeypath:@"donutMaskFrame"];

      double v54 = [v48 locations];
      [v21 _setDonutGradientLocations:v54];

      double v55 = (void *)[v34 copy];
      [v21 _setBehaviorSettings:v55 forKeypath:@"donutGradientLocations"];

      double v56 = [v48 colors];
      [v21 _setDonutGradientColors:v56];

      double v57 = (void *)[v34 copy];
      [v21 _setBehaviorSettings:v57 forKeypath:@"donutGradientColors"];

      [v21 _setAberrationIntensity:0.0];
      if (a3 == 5) {
        [v20 abberationCancelledFadeOutAnimationSettings];
      }
      else {
      double v58 = [v20 abberationFadeOutAnimationSettings];
      }
      double v59 = (void *)[v58 copy];
      [v21 _setBehaviorSettings:v59 forKeypath:@"aberrationIntensity"];

      if (a3 != 5)
      {
        [v21 _setDelay:@"donutMaskFrame" forApplicationOfKeypath:v52];
        [v21 _setDelay:@"donutGradientLocations" forApplicationOfKeypath:v52];
        [v21 _setDelay:@"donutGradientColors" forApplicationOfKeypath:v52];
        [v20 aberrationFadeOutDelay];
        objc_msgSend(v21, "_setDelay:forApplicationOfKeypath:", @"aberrationIntensity");
      }
    }
    else
    {
      if (((1 << a3) & 0x11) != 0)
      {
        objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v20, v16, v15, v14, v13, x, y, width, height);
        objc_msgSend(v21, "_setDonutMaskFrame:");
        CGFloat v35 = [v20 chromaticAberrationInitialDonutMask];
        CGFloat v36 = [v35 locations];
        [v21 _setDonutGradientLocations:v36];

        CGFloat v37 = [v20 chromaticAberrationInitialDonutMask];
        CGFloat v38 = [v37 colors];
        [v21 _setDonutGradientColors:v38];

        if (a3 != 4) {
          goto LABEL_31;
        }
        double v39 = (void *)[v22 copy];
        [v21 _setBehaviorSettings:v39 forKeypath:@"donutMaskFrame"];

        double v40 = (void *)[v22 copy];
        [v21 _setBehaviorSettings:v40 forKeypath:@"donutGradientLocations"];
      }
      else
      {
        if (!a4)
        {
          uint64_t v42 = [v20 captureHintAnimationSettings];

          CGFloat v22 = (void *)v42;
        }
        objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", 1, a4, v20, v16, v15, v14, v13, x, y, width, height);
        objc_msgSend(v21, "_setDonutMaskFrame:");
        double v43 = (void *)[v22 copy];
        [v21 _setBehaviorSettings:v43 forKeypath:@"donutMaskFrame"];

        double v44 = [v20 chromaticAberrationInitialDonutMask];
        double v45 = [v44 locations];
        [v21 _setDonutGradientLocations:v45];

        double v46 = (void *)[v22 copy];
        [v21 _setBehaviorSettings:v46 forKeypath:@"donutGradientLocations"];

        double v40 = [v20 chromaticAberrationInitialDonutMask];
        double v47 = [v40 colors];
        [v21 _setDonutGradientColors:v47];
      }
      double v48 = (void *)[v22 copy];
      [v21 _setBehaviorSettings:v48 forKeypath:@"donutGradientColors"];
      double v34 = v22;
    }

    CGFloat v22 = v34;
  }
LABEL_31:

  return v21;
}

@end