@interface _SUIAShockwaveEdgeLightOverlayConfiguration
+ (CGRect)edgeLightMaskRectForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 inBounds:(CGRect)a7 outSourceRadius:(double *)a8;
+ (id)edgeLightOverlayConfigurationForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 bounds:(CGRect)a7;
+ (int64_t)configurationType;
- (CGPoint)edgeLightMaskCenter;
- (CGPoint)fillLightMaskCenter;
- (CGRect)edgeLightMaskFrame;
- (CGRect)fillLightMaskFrame;
- (NSArray)edgeLightMaskGradientColors;
- (NSArray)edgeLightMaskGradientLocations;
- (NSArray)fillLightMaskGradientColors;
- (NSArray)fillLightMaskGradientLocations;
- (double)edgeLightIntensity;
- (double)edgeLightMaskInnerRadius;
- (double)edgeLightMaskOuterRadius;
- (double)edgeLightMaskSourceBlurRadius;
- (double)edgeLightMaskSourceRadius;
- (double)fillLightIntensity;
- (double)fillLightMaskInnerRadius;
- (double)fillLightMaskOuterRadius;
- (double)fillLightMaskSourceBlurRadius;
- (double)fillLightMaskSourceRadius;
- (void)_setEdgeLightIntensity:(double)a3;
- (void)_setEdgeLightMaskCenter:(CGPoint)a3;
- (void)_setEdgeLightMaskFrame:(CGRect)a3;
- (void)_setEdgeLightMaskGradientColors:(id)a3;
- (void)_setEdgeLightMaskGradientLocations:(id)a3;
- (void)_setEdgeLightMaskInnerRadius:(double)a3;
- (void)_setEdgeLightMaskOuterRadius:(double)a3;
- (void)_setEdgeLightMaskSourceBlurRadius:(double)a3;
- (void)_setEdgeLightMaskSourceRadius:(double)a3;
- (void)_setFillLightIntensity:(double)a3;
- (void)_setFillLightMaskCenter:(CGPoint)a3;
- (void)_setFillLightMaskFrame:(CGRect)a3;
- (void)_setFillLightMaskGradientColors:(id)a3;
- (void)_setFillLightMaskGradientLocations:(id)a3;
- (void)_setFillLightMaskInnerRadius:(double)a3;
- (void)_setFillLightMaskOuterRadius:(double)a3;
- (void)_setFillLightMaskSourceBlurRadius:(double)a3;
- (void)_setFillLightMaskSourceRadius:(double)a3;
@end

@implementation _SUIAShockwaveEdgeLightOverlayConfiguration

- (void)_setEdgeLightIntensity:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"edgeLightIntensity"];
}

- (double)edgeLightIntensity
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"edgeLightIntensity"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setEdgeLightMaskFrame:(CGRect)a3
{
  propertyDictionary = self->super._propertyDictionary;
  CGRect v5 = a3;
  double v4 = [MEMORY[0x263F08D40] valueWithBytes:&v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"edgeLightMaskFrame"];
}

- (CGRect)edgeLightMaskFrame
{
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"edgeLightMaskFrame"];
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

- (void)_setEdgeLightMaskGradientLocations:(id)a3
{
}

- (NSArray)edgeLightMaskGradientLocations
{
  return (NSArray *)[(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"edgeLightMaskGradientLocations"];
}

- (void)_setEdgeLightMaskGradientColors:(id)a3
{
}

- (NSArray)edgeLightMaskGradientColors
{
  return (NSArray *)[(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"edgeLightMaskGradientColors"];
}

- (void)_setEdgeLightMaskCenter:(CGPoint)a3
{
  propertyDictionary = self->super._propertyDictionary;
  CGPoint v5 = a3;
  double v4 = [MEMORY[0x263F08D40] valueWithBytes:&v5 objCType:"{CGPoint=dd}"];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"edgeLightMaskCenter"];
}

- (CGPoint)edgeLightMaskCenter
{
  double v5 = 0.0;
  double v6 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"edgeLightMaskCenter"];
  [v2 getValue:&v5 size:16];

  double v3 = v5;
  double v4 = v6;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_setEdgeLightMaskInnerRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"edgeLightMaskInnerRadius"];
}

- (double)edgeLightMaskInnerRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"edgeLightMaskInnerRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setEdgeLightMaskOuterRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"edgeLightMaskOuterRadius"];
}

- (double)edgeLightMaskOuterRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"edgeLightMaskOuterRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setEdgeLightMaskSourceRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"edgeLightMaskSourceRadius"];
}

- (double)edgeLightMaskSourceRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"edgeLightMaskSourceRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setEdgeLightMaskSourceBlurRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"edgeLightMaskSourceBlurRadius"];
}

- (double)edgeLightMaskSourceBlurRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"edgeLightMaskSourceBlurRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setFillLightIntensity:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"fillLightIntensity"];
}

- (double)fillLightIntensity
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"fillLightIntensity"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setFillLightMaskFrame:(CGRect)a3
{
  propertyDictionary = self->super._propertyDictionary;
  CGRect v5 = a3;
  double v4 = [MEMORY[0x263F08D40] valueWithBytes:&v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"fillLightMaskFrame"];
}

- (CGRect)fillLightMaskFrame
{
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"fillLightMaskFrame"];
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

- (void)_setFillLightMaskGradientLocations:(id)a3
{
}

- (NSArray)fillLightMaskGradientLocations
{
  return (NSArray *)[(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"fillLightMaskGradientLocations"];
}

- (void)_setFillLightMaskGradientColors:(id)a3
{
}

- (NSArray)fillLightMaskGradientColors
{
  return (NSArray *)[(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"fillLightMaskGradientColors"];
}

- (void)_setFillLightMaskCenter:(CGPoint)a3
{
  propertyDictionary = self->super._propertyDictionary;
  CGPoint v5 = a3;
  double v4 = [MEMORY[0x263F08D40] valueWithBytes:&v5 objCType:"{CGPoint=dd}"];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"fillLightMaskCenter"];
}

- (CGPoint)fillLightMaskCenter
{
  double v5 = 0.0;
  double v6 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"fillLightMaskCenter"];
  [v2 getValue:&v5 size:16];

  double v3 = v5;
  double v4 = v6;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_setFillLightMaskInnerRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"fillLightMaskInnerRadius"];
}

- (double)fillLightMaskInnerRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"fillLightMaskInnerRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setFillLightMaskOuterRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"fillLightMaskOuterRadius"];
}

- (double)fillLightMaskOuterRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"fillLightMaskOuterRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setFillLightMaskSourceRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"fillLightMaskSourceRadius"];
}

- (double)fillLightMaskSourceRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"fillLightMaskSourceRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setFillLightMaskSourceBlurRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"fillLightMaskSourceBlurRadius"];
}

- (double)fillLightMaskSourceBlurRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"fillLightMaskSourceBlurRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

+ (int64_t)configurationType
{
  return 4;
}

+ (CGRect)edgeLightMaskRectForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 inBounds:(CGRect)a7 outSourceRadius:(double *)a8
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  double v13 = a5.size.height;
  double v14 = a5.size.width;
  double v15 = a5.origin.y;
  double v16 = a5.origin.x;
  id v19 = a6;
  v20 = v19;
  if ((unint64_t)a3 <= 5)
  {
    if (((1 << a3) & 0x2C) != 0)
    {
      v21 = [v19 edgeLightFinalCircleMask];
      objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v20, v16, v15, v14, v13, x, y, width, height);
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
      v30 = objc_msgSend(v20, "chromaticAberrationFinalDonutMaskForShockwaveSize:", width, height);
      [v30 radiusOfMaximumOpacity];
      double v32 = v31;

      [v21 innerRadius];
      double v34 = v32 / v33;
      v74.origin.double x = v23;
      v74.origin.double y = v25;
      v74.size.double width = v27;
      v74.size.double height = v29;
      double v35 = v34 * CGRectGetWidth(v74);
      BSRectWithSize();
      UIRectGetCenter();
      BSRectCenteredAboutPoint();
      double v37 = v36;
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      if (a8)
      {
        v44 = [v21 gradientLayerSize];
        [v44 width];
        double v46 = v35 / v45;

        [v21 majorDiameter];
        double v48 = v46 * (v47 * 0.5);
LABEL_11:
        *a8 = v48;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (((1 << a3) & 0x11) != 0)
    {
      v21 = [v19 edgeLightInitialCircleMask];
      v49 = [v21 gradientLayerSize];
      [v49 sizeValue];
      BSRectWithSize();

      objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v20, v16, v15, v14, v13, x, y, width, height);
      UIRectGetCenter();
      BSRectCenteredAboutPoint();
      double v37 = v50;
      double v39 = v51;
      double v41 = v52;
      double v43 = v53;
      if (!a8) {
        goto LABEL_12;
      }
    }
    else
    {
      v21 = [v19 edgeLightHintCircleMask];
      v54 = [v21 gradientLayerSize];
      [v54 sizeValue];
      BSRectWithSize();
      CGFloat v72 = v56;
      CGFloat v73 = v55;
      CGFloat v70 = v58;
      CGFloat v71 = v57;

      double v37 = SAUIRectMovedOffscreenByProportionToNormalizedButtonRectInContextOfShockwaveBounds(v73, v72, v71, v70, 0.5, v59, v60, v61, v16, v15, v14, v13, x, y, width, height);
      double v39 = v62;
      double v41 = v63;
      double v43 = v64;
      if (!a8) {
        goto LABEL_12;
      }
    }
    [v21 majorDiameter];
    double v48 = v65 * 0.5;
    goto LABEL_11;
  }
  double v37 = *MEMORY[0x263F001A0];
  double v39 = *(double *)(MEMORY[0x263F001A0] + 8);
  double v41 = *(double *)(MEMORY[0x263F001A0] + 16);
  double v43 = *(double *)(MEMORY[0x263F001A0] + 24);
LABEL_13:

  double v66 = v37;
  double v67 = v39;
  double v68 = v41;
  double v69 = v43;
  result.size.double height = v69;
  result.size.double width = v68;
  result.origin.double y = v67;
  result.origin.double x = v66;
  return result;
}

+ (id)edgeLightOverlayConfigurationForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 bounds:(CGRect)a7
{
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  double v11 = a5.size.height;
  double v12 = a5.size.width;
  double v13 = a5.origin.y;
  double v14 = a5.origin.x;
  id v17 = a6;
  v18 = objc_alloc_init(_SUIAShockwaveEdgeLightOverlayConfiguration);
  id v19 = [v17 donutMaskPositionAnimationSettings];
  double v88 = width;
  double v89 = height;
  double v86 = x;
  double v87 = y;
  double v84 = v12;
  double v85 = v11;
  double v82 = v14;
  double v83 = v13;
  if ((unint64_t)a3 > 5)
  {
    v20 = 0;
  }
  else if (((1 << a3) & 0x2C) != 0)
  {
    double v90 = 0.0;
    v20 = [v17 edgeLightFinalCircleMask];
    objc_msgSend((id)objc_opt_class(), "edgeLightMaskRectForState:variant:normalizedStartLocation:settings:inBounds:outSourceRadius:", a3, a4, v17, &v90, v14, v13, v12, v11, x, y, width, height);
    -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskFrame:](v18, "_setEdgeLightMaskFrame:");
    v21 = (void *)[v19 copy];
    [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v21 forKeypath:@"edgeLightMaskFrame"];

    double v22 = [v20 locations];
    [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskGradientLocations:v22];

    CGFloat v23 = (void *)[v19 copy];
    [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v23 forKeypath:@"edgeLightMaskGradientLocations"];

    double v24 = [v20 colors];
    [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskGradientColors:v24];

    CGFloat v25 = (void *)[v19 copy];
    [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v25 forKeypath:@"edgeLightMaskGradientColors"];

    [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskSourceRadius:v90];
    double v26 = (void *)[v19 copy];
    [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v26 forKeypath:@"edgeLightMaskSourceRadius"];

    [v20 blurRadius];
    -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskSourceBlurRadius:](v18, "_setEdgeLightMaskSourceBlurRadius:");
    CGFloat v27 = (void *)[v19 copy];
    [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v27 forKeypath:@"edgeLightMaskSourceBlurRadius"];

    if (a3 == 5)
    {
      [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightIntensity:0.0];
      double v28 = [v17 lightIntensityCancelledAnimationSettings];
      CGFloat v29 = (void *)[v28 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v29 forKeypath:@"edgeLightIntensity"];
    }
    else
    {
      [v17 donutMaskEndTransitionDelay];
      double v41 = v40;
      [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightIntensity:1.0];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setDelay:@"edgeLightMaskFrame" forApplicationOfKeypath:v41];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setDelay:@"edgeLightMaskGradientColors" forApplicationOfKeypath:v41];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setDelay:@"edgeLightMaskGradientLocations" forApplicationOfKeypath:v41];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setDelay:@"edgeLightMaskSourceRadius" forApplicationOfKeypath:v41];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setDelay:@"edgeLightMaskSourceBlurRadius" forApplicationOfKeypath:v41];
    }
  }
  else
  {
    if (((1 << a3) & 0x11) != 0)
    {
      double v90 = 0.0;
      v20 = [v17 edgeLightInitialCircleMask];
      objc_msgSend((id)objc_opt_class(), "edgeLightMaskRectForState:variant:normalizedStartLocation:settings:inBounds:outSourceRadius:", a3, a4, v17, &v90, v14, v13, v12, v11, x, y, width, height);
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskFrame:](v18, "_setEdgeLightMaskFrame:");
      v30 = [v20 locations];
      [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskGradientLocations:v30];

      double v31 = [v20 colors];
      [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskGradientColors:v31];

      [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskSourceRadius:v90];
      [v20 blurRadius];
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskSourceBlurRadius:](v18, "_setEdgeLightMaskSourceBlurRadius:");
      double v32 = 1.0;
      if (a3 == 4)
      {
        double v33 = objc_msgSend(v19, "copy", 1.0);
        [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v33 forKeypath:@"edgeLightMaskFrame"];

        double v34 = (void *)[v19 copy];
        [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v34 forKeypath:@"edgeLightMaskGradientLocations"];

        double v35 = (void *)[v19 copy];
        [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v35 forKeypath:@"edgeLightMaskGradientColors"];

        double v36 = (void *)[v19 copy];
        [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v36 forKeypath:@"edgeLightMaskSourceRadius"];

        double v37 = (void *)[v19 copy];
        [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v37 forKeypath:@"edgeLightMaskSourceBlurRadius"];

        double v38 = [v17 lightIntensityCancelledAnimationSettings];
        double v39 = (void *)[v38 copy];
        [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v39 forKeypath:@"edgeLightIntensity"];

        double v32 = 0.0;
      }
    }
    else
    {
      [v17 edgeLightHintTransitionDelay];
      double v80 = v42;
      double v90 = 0.0;
      v20 = [v17 edgeLightHintCircleMask];
      objc_msgSend((id)objc_opt_class(), "edgeLightMaskRectForState:variant:normalizedStartLocation:settings:inBounds:outSourceRadius:", 1, a4, v17, &v90, v14, v13, v12, v11, x, y, width, height);
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskFrame:](v18, "_setEdgeLightMaskFrame:");
      double v43 = (void *)[v19 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v43 forKeypath:@"edgeLightMaskFrame"];

      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setDelay:@"edgeLightMaskFrame" forApplicationOfKeypath:v80];
      v44 = [v20 locations];
      [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskGradientLocations:v44];

      double v45 = (void *)[v19 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v45 forKeypath:@"edgeLightMaskGradientLocations"];

      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setDelay:@"edgeLightMaskGradientLocations" forApplicationOfKeypath:v80];
      double v46 = [v20 colors];
      [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskGradientColors:v46];

      double v47 = (void *)[v19 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v47 forKeypath:@"edgeLightMaskGradientColors"];

      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setDelay:@"edgeLightMaskGradientColors" forApplicationOfKeypath:v80];
      [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskSourceRadius:v90];
      double v48 = (void *)[v19 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v48 forKeypath:@"edgeLightMaskSourceRadius"];

      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setDelay:@"edgeLightMaskSourceRadius" forApplicationOfKeypath:v80];
      [v20 blurRadius];
      -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskSourceBlurRadius:](v18, "_setEdgeLightMaskSourceBlurRadius:");
      v49 = (void *)[v19 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v49 forKeypath:@"edgeLightMaskSourceBlurRadius"];

      [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setDelay:@"edgeLightMaskSourceBlurRadius" forApplicationOfKeypath:v80];
      double v32 = 1.0;
    }
    [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightIntensity:v32];
  }
  [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 edgeLightMaskFrame];
  CGFloat v51 = v50;
  CGFloat v53 = v52;
  CGFloat v55 = v54;
  CGFloat v57 = v56;
  UIRectGetCenter();
  double v59 = v58;
  double v61 = v60;
  [v20 innerRadius];
  double v63 = v62;
  v92.origin.double x = v51;
  v92.origin.double y = v53;
  v92.size.double width = v55;
  v92.size.double height = v57;
  double v81 = v63 * CGRectGetWidth(v92) * 0.5;
  [v20 outerRadius];
  double v65 = v64;
  v93.origin.double x = v51;
  v93.origin.double y = v53;
  v93.size.double width = v55;
  v93.size.double height = v57;
  double v66 = v65 * CGRectGetWidth(v93) * 0.5;
  -[_SUIAShockwaveEdgeLightOverlayConfiguration _setEdgeLightMaskCenter:](v18, "_setEdgeLightMaskCenter:", v59, v61);
  double v67 = [(_SUIAAbstractDictionaryBackedConfiguration *)v18 behaviorSettingsForKeypath:@"edgeLightMaskFrame"];
  [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v67 forKeypath:@"edgeLightMaskCenter"];

  [(_SUIAAbstractDictionaryBackedConfiguration *)v18 delayForApplicationOfKeypath:@"edgeLightMaskFrame"];
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", @"edgeLightMaskCenter");
  [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskInnerRadius:v81];
  double v68 = [(_SUIAAbstractDictionaryBackedConfiguration *)v18 behaviorSettingsForKeypath:@"edgeLightMaskGradientLocations"];
  [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v68 forKeypath:@"edgeLightMaskInnerRadius"];

  [(_SUIAAbstractDictionaryBackedConfiguration *)v18 delayForApplicationOfKeypath:@"edgeLightMaskGradientLocations"];
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", @"edgeLightMaskInnerRadius");
  [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 _setEdgeLightMaskOuterRadius:v66];
  double v69 = [(_SUIAAbstractDictionaryBackedConfiguration *)v18 behaviorSettingsForKeypath:@"edgeLightMaskGradientLocations"];
  [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v69 forKeypath:@"edgeLightMaskOuterRadius"];

  [(_SUIAAbstractDictionaryBackedConfiguration *)v18 delayForApplicationOfKeypath:@"edgeLightMaskGradientLocations"];
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", @"edgeLightMaskOuterRadius");
  CGFloat v70 = +[_SUIAShockwaveFillLightConfiguration fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:](_SUIAShockwaveFillLightConfiguration, "fillLightConfigurationForState:variant:normalizedStartLocation:settings:bounds:usesIntelligentFillLight:", a3, a4, v17, 0, v82, v83, v84, v85, v86, v87, v88, v89);
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke((uint64_t)v70, v18, v70, @"fillLightIntensity", @"lightIntensity");
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v71, v18, v70, @"fillLightMaskFrame", @"circleMaskFrame");
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v72, v18, v70, @"fillLightMaskGradientLocations", @"circleGradientLocations");
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v73, v18, v70, @"fillLightMaskGradientColors", @"circleGradientColors");
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v74, v18, v70, @"fillLightMaskInnerRadius", @"circleMaskInnerRadius");
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v75, v18, v70, @"fillLightMaskOuterRadius", @"circleMaskOuterRadius");
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v76, v18, v70, @"fillLightMaskSourceRadius", @"circleMaskSourceRadius");
  __133___SUIAShockwaveEdgeLightOverlayConfiguration_edgeLightOverlayConfigurationForState_variant_normalizedStartLocation_settings_bounds___block_invoke(v77, v18, v70, @"fillLightMaskSourceBlurRadius", @"circleMaskSourceBlurRadius");
  [(_SUIAShockwaveEdgeLightOverlayConfiguration *)v18 fillLightMaskFrame];
  UIRectGetCenter();
  -[_SUIAShockwaveEdgeLightOverlayConfiguration _setFillLightMaskCenter:](v18, "_setFillLightMaskCenter:");
  v78 = [(_SUIAAbstractDictionaryBackedConfiguration *)v18 behaviorSettingsForKeypath:@"fillLightMaskFrame"];
  [(_SUIAAbstractDictionaryBackedConfiguration *)v18 _setBehaviorSettings:v78 forKeypath:@"fillLightMaskCenter"];

  [(_SUIAAbstractDictionaryBackedConfiguration *)v18 delayForApplicationOfKeypath:@"fillLightMaskFrame"];
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v18, "_setDelay:forApplicationOfKeypath:", @"fillLightMaskCenter");

  return v18;
}

@end