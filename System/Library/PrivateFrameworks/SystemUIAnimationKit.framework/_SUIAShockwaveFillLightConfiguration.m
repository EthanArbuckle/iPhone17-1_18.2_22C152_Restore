@interface _SUIAShockwaveFillLightConfiguration
+ (id)fillLightConfigurationForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 bounds:(CGRect)a7 usesIntelligentFillLight:(BOOL)a8;
+ (int64_t)configurationType;
- (CATransform3D)sideLightMaskTransform;
- (CGRect)circleMaskFrame;
- (CGRect)sideLightMaskFrame;
- (NSArray)circleGradientColors;
- (NSArray)circleGradientLocations;
- (UIImage)sideLightMaskImage;
- (double)circleMaskInnerRadius;
- (double)circleMaskOuterRadius;
- (double)circleMaskSourceBlurRadius;
- (double)circleMaskSourceRadius;
- (double)lightColorBrightnessAmount;
- (double)lightColorContrastAmount;
- (double)lightColorSaturateAmount;
- (double)lightIntensity;
- (double)whiteValue;
- (int64_t)lightType;
- (void)_setCircleGradientColors:(id)a3;
- (void)_setCircleGradientLocations:(id)a3;
- (void)_setCircleMaskFrame:(CGRect)a3;
- (void)_setCircleMaskInnerRadius:(double)a3;
- (void)_setCircleMaskOuterRadius:(double)a3;
- (void)_setCircleMaskSourceBlurRadius:(double)a3;
- (void)_setCircleMaskSourceRadius:(double)a3;
- (void)_setLightColorBrightnessAmount:(double)a3;
- (void)_setLightColorContrastAmount:(double)a3;
- (void)_setLightColorSaturateAmount:(double)a3;
- (void)_setLightIntensity:(double)a3;
- (void)_setLightType:(int64_t)a3;
- (void)_setSideLightMaskFrame:(CGRect)a3;
- (void)_setSideLightMaskImage:(id)a3;
- (void)_setSideLightMaskTransform:(CATransform3D *)a3;
- (void)_setWhiteValue:(double)a3;
@end

@implementation _SUIAShockwaveFillLightConfiguration

- (void)_setLightType:(int64_t)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"lightType"];
}

- (int64_t)lightType
{
  int64_t v4 = 0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"lightType"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setWhiteValue:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"whiteValue"];
}

- (double)whiteValue
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"whiteValue"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setLightIntensity:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"lightIntensity"];
}

- (double)lightIntensity
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"lightIntensity"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setLightColorBrightnessAmount:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"lightColorBrightnessAmount"];
}

- (double)lightColorBrightnessAmount
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"lightColorBrightnessAmount"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setLightColorSaturateAmount:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"lightColorSaturateAmount"];
}

- (double)lightColorSaturateAmount
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"lightColorSaturateAmount"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setLightColorContrastAmount:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"lightColorContrastAmount"];
}

- (double)lightColorContrastAmount
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"lightColorContrastAmount"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setSideLightMaskFrame:(CGRect)a3
{
  propertyDictionary = self->super._propertyDictionary;
  CGRect v5 = a3;
  double v4 = [MEMORY[0x263F08D40] valueWithBytes:&v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"sideLightMaskFrame"];
}

- (CGRect)sideLightMaskFrame
{
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"sideLightMaskFrame"];
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

- (void)_setSideLightMaskImage:(id)a3
{
}

- (UIImage)sideLightMaskImage
{
  return (UIImage *)[(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"sideLightMaskImage"];
}

- (void)_setSideLightMaskTransform:(CATransform3D *)a3
{
  propertyDictionary = self->super._propertyDictionary;
  long long v4 = *(_OWORD *)&a3->m33;
  v9[4] = *(_OWORD *)&a3->m31;
  v9[5] = v4;
  long long v5 = *(_OWORD *)&a3->m43;
  v9[6] = *(_OWORD *)&a3->m41;
  v9[7] = v5;
  long long v6 = *(_OWORD *)&a3->m13;
  v9[0] = *(_OWORD *)&a3->m11;
  v9[1] = v6;
  long long v7 = *(_OWORD *)&a3->m23;
  v9[2] = *(_OWORD *)&a3->m21;
  v9[3] = v7;
  long long v8 = [MEMORY[0x263F08D40] valueWithCATransform3D:v9];
  [(NSMutableDictionary *)propertyDictionary setObject:v8 forKey:@"sideLightMaskTransform"];
}

- (CATransform3D)sideLightMaskTransform
{
  long long v4 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"sideLightMaskTransform"];
  if (v4)
  {
    long long v6 = v4;
    [v4 CATransform3DValue];
    long long v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->m41 = 0u;
    *(_OWORD *)&retstr->m43 = 0u;
    *(_OWORD *)&retstr->m31 = 0u;
    *(_OWORD *)&retstr->m33 = 0u;
    *(_OWORD *)&retstr->m21 = 0u;
    *(_OWORD *)&retstr->m23 = 0u;
    *(_OWORD *)&retstr->m11 = 0u;
    *(_OWORD *)&retstr->m13 = 0u;
  }

  return result;
}

- (void)_setCircleMaskFrame:(CGRect)a3
{
  propertyDictionary = self->super._propertyDictionary;
  CGRect v5 = a3;
  long long v4 = [MEMORY[0x263F08D40] valueWithBytes:&v5 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"circleMaskFrame"];
}

- (CGRect)circleMaskFrame
{
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"circleMaskFrame"];
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

- (void)_setCircleGradientLocations:(id)a3
{
}

- (NSArray)circleGradientLocations
{
  return (NSArray *)[(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"circleGradientLocations"];
}

- (void)_setCircleGradientColors:(id)a3
{
}

- (NSArray)circleGradientColors
{
  return (NSArray *)[(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"circleGradientColors"];
}

- (void)_setCircleMaskInnerRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"circleMaskInnerRadius"];
}

- (double)circleMaskInnerRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"circleMaskInnerRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setCircleMaskOuterRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"circleMaskOuterRadius"];
}

- (double)circleMaskOuterRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"circleMaskOuterRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setCircleMaskSourceRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"circleMaskSourceRadius"];
}

- (double)circleMaskSourceRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"circleMaskSourceRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

- (void)_setCircleMaskSourceBlurRadius:(double)a3
{
  propertyDictionary = self->super._propertyDictionary;
  id v4 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)propertyDictionary setObject:v4 forKey:@"circleMaskSourceBlurRadius"];
}

- (double)circleMaskSourceBlurRadius
{
  double v4 = 0.0;
  v2 = [(NSMutableDictionary *)self->super._propertyDictionary objectForKey:@"circleMaskSourceBlurRadius"];
  [v2 getValue:&v4 size:8];

  return v4;
}

+ (int64_t)configurationType
{
  return 3;
}

+ (id)fillLightConfigurationForState:(int64_t)a3 variant:(int64_t)a4 normalizedStartLocation:(CGRect)a5 settings:(id)a6 bounds:(CGRect)a7 usesIntelligentFillLight:(BOOL)a8
{
  BOOL v8 = a8;
  double height = a7.size.height;
  double width = a7.size.width;
  double y = a7.origin.y;
  double x = a7.origin.x;
  CGFloat v13 = a5.size.height;
  double v14 = a5.size.width;
  double v15 = a5.origin.y;
  double v16 = a5.origin.x;
  id v19 = a6;
  v20 = objc_alloc_init(_SUIAShockwaveFillLightConfiguration);
  if ((unint64_t)(a4 - 1) < 2)
  {
LABEL_2:
    [(_SUIAShockwaveFillLightConfiguration *)v20 _setLightType:1];
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v21 = [v19 captureFillLightType];
    switch(v21)
    {
      case 0:
        v90 = 0;
        goto LABEL_43;
      case 1:
        goto LABEL_2;
      case 2:
        [(_SUIAShockwaveFillLightConfiguration *)v20 _setLightType:2];
        [v19 captureFillWhiteValue];
        -[_SUIAShockwaveFillLightConfiguration _setWhiteValue:](v20, "_setWhiteValue:");
        break;
    }
  }
LABEL_8:
  v22 = [v19 colorFillInitialCircleMask];
  v23 = [v22 gradientLayerSize];
  [v23 sizeValue];
  BSRectWithSize();

  v24 = [v19 donutMaskPositionAnimationSettings];
  double v158 = v13;
  uint64_t v25 = SUIAScreenEdgeForNormalizedButtonRect();
  memset(&v163, 0, sizeof(v163));
  SUIACATransform3DFromNominalRightEdgeToEdge(v25, &v163);
  v165.origin.double x = x;
  v165.origin.double y = y;
  v165.size.double width = width;
  v165.size.double height = height;
  double v26 = CGRectGetWidth(v165);
  v166.origin.double x = x;
  v166.origin.double y = y;
  v166.size.double width = width;
  v166.size.double height = height;
  double v27 = CGRectGetHeight(v166);
  if (v26 < v27) {
    double v27 = v26;
  }
  CATransform3D v162 = v163;
  CATransform3DScale(&v163, &v162, v27 / 393.0, v27 / 393.0, 1.0);
  CATransform3D v162 = v163;
  [(_SUIAShockwaveFillLightConfiguration *)v20 _setSideLightMaskTransform:&v162];
  v28 = (void *)MEMORY[0x263F827E8];
  v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v30 = [v28 imageNamed:@"topAndBottomMask" inBundle:v29 compatibleWithTraitCollection:0];

  [v30 size];
  double v32 = v31;
  [v30 size];
  uint64_t v34 = objc_msgSend(v30, "resizableImageWithCapInsets:resizingMode:", 0, v33 * 0.5 + -1.0, 0.0, v33 * 0.5 + -1.0, v32 + -1.0);

  [(_SUIAShockwaveFillLightConfiguration *)v20 _setSideLightMaskImage:v34];
  [v19 fillLightInitialIntensity];
  if (a4 || ([v19 fillLightCaptureInitialIntensity], !v8))
  {
    double v38 = v35;
    v36 = (void *)v34;
    int v39 = 0;
  }
  else
  {
    v36 = (void *)v34;
    [v19 visionIntelligenceHintFillLightInitialIntensity];
    double v38 = v37;
    int v39 = 1;
  }
  v40 = [v19 lightIntensityAnimationSettings];
  v160 = [v19 lightIntensityCancelledAnimationSettings];
  [v19 fillLightColorBrightnessAmount];
  -[_SUIAShockwaveFillLightConfiguration _setLightColorBrightnessAmount:](v20, "_setLightColorBrightnessAmount:");
  [v19 fillLightColorSaturateAmount];
  -[_SUIAShockwaveFillLightConfiguration _setLightColorSaturateAmount:](v20, "_setLightColorSaturateAmount:");
  [v19 fillLightColorContrastAmount];
  -[_SUIAShockwaveFillLightConfiguration _setLightColorContrastAmount:](v20, "_setLightColorContrastAmount:");
  if ((unint64_t)a3 > 5)
  {
    v43 = v22;
  }
  else
  {
    if (((1 << a3) & 0x2C) != 0)
    {
      v41 = v160;
      if (!a4)
      {
        if (v8) {
          [v19 visionIntelligenceHintRetargetImpulse];
        }
        else {
          [v19 captureHintRetargetImpulse];
        }
        double v55 = v42;
        v56 = (void *)[v24 copy];

        [v56 retargetImpulse];
        [v56 setRetargetImpulse:v55 + v57];
        v58 = (void *)[v40 copy];

        [v58 retargetImpulse];
        [v58 setRetargetImpulse:v55 + v59];
        v41 = (void *)[v160 copy];

        [v41 retargetImpulse];
        [v41 setRetargetImpulse:v55 + v60];
        v40 = v58;
        v24 = v56;
      }
      v43 = [v19 colorFillFinalCircleMask];

      objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v19, v16, v15, v14, v158, x, y, width, height);
      CGFloat v62 = v61;
      CGFloat v64 = v63;
      CGFloat v66 = v65;
      CGFloat v68 = v67;
      v69 = objc_msgSend(v19, "chromaticAberrationFinalDonutMaskForShockwaveSize:", width, height);
      [v69 radiusOfMaximumOpacity];
      double v71 = v70;

      [v43 innerRadius];
      double v73 = v71 / v72;
      v167.origin.double x = v62;
      v167.origin.double y = v64;
      v167.size.double width = v66;
      v167.size.double height = v68;
      double v161 = v73 * CGRectGetWidth(v167);
      BSRectWithSize();
      UIRectGetCenter();
      BSRectCenteredAboutPoint();
      -[_SUIAShockwaveFillLightConfiguration _setCircleMaskFrame:](v20, "_setCircleMaskFrame:");
      [v19 donutMaskEndTransitionDelay];
      double v75 = v74;
      v76 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v76 forKeypath:@"circleMaskFrame"];

      v77 = [v43 locations];
      [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleGradientLocations:v77];

      v78 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v78 forKeypath:@"circleGradientLocations"];

      v79 = [v43 colors];
      [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleGradientColors:v79];

      v80 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v80 forKeypath:@"circleGradientColors"];

      v81 = [v43 gradientLayerSize];
      [v81 width];
      double v83 = v161 / v82;

      [v43 majorDiameter];
      [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleMaskSourceRadius:v83 * (v84 * 0.5)];
      v85 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v85 forKeypath:@"circleMaskSourceRadius"];

      [v43 blurRadius];
      -[_SUIAShockwaveFillLightConfiguration _setCircleMaskSourceBlurRadius:](v20, "_setCircleMaskSourceBlurRadius:");
      v86 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v86 forKeypath:@"circleMaskSourceBlurRadius"];

      [v19 fillLightFinalIntensity];
      -[_SUIAShockwaveFillLightConfiguration _setLightIntensity:](v20, "_setLightIntensity:");
      if (a3 == 5) {
        goto LABEL_31;
      }
      v88 = (void *)[v40 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v88 forKeypath:@"lightIntensity"];

      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setDelay:@"circleMaskFrame" forApplicationOfKeypath:v75];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setDelay:@"circleGradientLocations" forApplicationOfKeypath:v75];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setDelay:@"circleGradientColors" forApplicationOfKeypath:v75];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setDelay:@"circleMaskSourceRadius" forApplicationOfKeypath:v75];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setDelay:@"circleMaskSourceBlurRadius" forApplicationOfKeypath:v75];
      [v19 fillLightIntensityFinalStateDelay];
      v89 = v20;
LABEL_41:
      -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v89, "_setDelay:forApplicationOfKeypath:", @"lightIntensity");
      goto LABEL_42;
    }
    if (((1 << a3) & 0x11) == 0)
    {
      BOOL v154 = v8;
      if (!a4)
      {
        [v19 captureHintAnimationSettings];
        v53 = BOOL v52 = v8;

        if (v52)
        {
          v24 = [v19 visionIntelligenceHintAnimationSettings];

          uint64_t v54 = [v19 visionIntelligenceHintAnimationSettings];

          v40 = (void *)v54;
        }
        else
        {
          v24 = v53;
        }
      }
      v43 = [v19 colorFillInitialCircleMask];

      v91 = objc_opt_class();
      if (v39)
      {
        objc_msgSend(v91, "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", 0, a4, v19, v16, v15, v14, v158, x, y, width, height);
        double v157 = v38;
        double v93 = v92;
        double v155 = v94;
        objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", 2, a4, v19, v16, v15, v14, v158, x, y, width, height);
        double v96 = v95;
        [v19 visionIntelligenceHintInterpolationProgress];
        double v98 = v97;
        CGFloat v159 = v93 + v97 * (v96 - v93);
        CGFloat v99 = v155 + v97 * (v96 - v155);
        UIRectGetCenter();
        double v101 = v100;
        double v103 = v102;
        UIRectGetCenter();
        double v106 = v103 + v98 * (v105 - v103);
        CGFloat v107 = v101 + v98 * (v104 - v101) - v159 * 0.5;
        CGFloat v156 = v106 - v99 * 0.5;
        v108 = objc_msgSend(v19, "chromaticAberrationFinalDonutMaskForShockwaveSize:", width, height);
        [v108 radiusOfMaximumOpacity];
        double v110 = v109;

        [v43 innerRadius];
        double v112 = v110 / v111;
        v168.origin.double x = v107;
        v168.origin.double y = v156;
        v168.size.double width = v159;
        v168.size.double height = v99;
        double v113 = v112 * CGRectGetWidth(v168);
        BSRectWithSize();
        UIRectGetCenter();
        BSRectCenteredAboutPoint();
        double v115 = v114;
        double v117 = v116;
        double v119 = v118;
        double v121 = v120;
        v122 = [v43 gradientLayerSize];
        [v122 width];
        double v124 = v113 / v123;
        double v38 = v157;
      }
      else
      {
        objc_msgSend(v91, "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", 1, a4, v19, v16, v15, v14, v158, x, y, width, height);
        UIRectGetCenter();
        BSRectCenteredAboutPoint();
        double v115 = v125;
        double v117 = v126;
        double v119 = v127;
        double v121 = v128;
        double v124 = 1.0;
      }
      -[_SUIAShockwaveFillLightConfiguration _setCircleMaskFrame:](v20, "_setCircleMaskFrame:", v115, v117, v119, v121);
      v129 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v129 forKeypath:@"circleMaskFrame"];

      v130 = [v43 locations];
      [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleGradientLocations:v130];

      v131 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v131 forKeypath:@"circleGradientLocations"];

      v132 = [v43 colors];
      [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleGradientColors:v132];

      v133 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v133 forKeypath:@"circleGradientColors"];

      [v43 majorDiameter];
      [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleMaskSourceRadius:v124 * (v134 * 0.5)];
      v135 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v135 forKeypath:@"circleMaskSourceRadius"];

      [v43 blurRadius];
      -[_SUIAShockwaveFillLightConfiguration _setCircleMaskSourceBlurRadius:](v20, "_setCircleMaskSourceBlurRadius:");
      v136 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v136 forKeypath:@"circleMaskSourceBlurRadius"];

      [(_SUIAShockwaveFillLightConfiguration *)v20 _setLightIntensity:v38];
      v41 = v160;
      if (!a4 && v154) {
        goto LABEL_42;
      }
      [v19 fillLightIntensityFinalStateDelay];
      v89 = v20;
      goto LABEL_41;
    }
    v43 = [v19 colorFillInitialCircleMask];

    objc_msgSend((id)objc_opt_class(), "donutMaskRectForState:variant:normalizedStartLocation:settings:inBounds:", a3, a4, v19, v16, v15, v14, v158, x, y, width, height);
    UIRectGetCenter();
    BSRectCenteredAboutPoint();
    -[_SUIAShockwaveFillLightConfiguration _setCircleMaskFrame:](v20, "_setCircleMaskFrame:");
    v44 = [v43 locations];
    [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleGradientLocations:v44];

    v45 = [v43 colors];
    [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleGradientColors:v45];

    [v43 majorDiameter];
    [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleMaskSourceRadius:v46 * 0.5];
    [v43 blurRadius];
    -[_SUIAShockwaveFillLightConfiguration _setCircleMaskSourceBlurRadius:](v20, "_setCircleMaskSourceBlurRadius:");
    if (a3 == 4)
    {
      [v19 fillLightFinalIntensity];
      -[_SUIAShockwaveFillLightConfiguration _setLightIntensity:](v20, "_setLightIntensity:");
      v47 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v47 forKeypath:@"circleMaskFrame"];

      v48 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v48 forKeypath:@"circleGradientLocations"];

      v49 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v49 forKeypath:@"circleGradientColors"];

      v50 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v50 forKeypath:@"circleMaskSourceRadius"];

      v51 = (void *)[v24 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v51 forKeypath:@"circleMaskSourceBlurRadius"];

      v41 = v160;
LABEL_31:
      v87 = (void *)[v41 copy];
      [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v87 forKeypath:@"lightIntensity"];

      goto LABEL_42;
    }
    [(_SUIAShockwaveFillLightConfiguration *)v20 _setLightIntensity:v38];
  }
  v41 = v160;
LABEL_42:
  [(_SUIAShockwaveFillLightConfiguration *)v20 circleMaskFrame];
  CGFloat v138 = v137;
  CGFloat v140 = v139;
  CGFloat v142 = v141;
  CGFloat v144 = v143;
  [v43 innerRadius];
  double v146 = v145;
  v169.origin.double x = v138;
  v169.origin.double y = v140;
  v169.size.double width = v142;
  v169.size.double height = v144;
  double v147 = v146 * CGRectGetWidth(v169) * 0.5;
  [v43 outerRadius];
  double v149 = v148;
  v170.origin.double x = v138;
  v170.origin.double y = v140;
  v170.size.double width = v142;
  v170.size.double height = v144;
  double v150 = v149 * CGRectGetWidth(v170) * 0.5;
  [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleMaskInnerRadius:v147];
  v151 = [(_SUIAAbstractDictionaryBackedConfiguration *)v20 behaviorSettingsForKeypath:@"circleGradientLocations"];
  [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v151 forKeypath:@"circleMaskInnerRadius"];

  [(_SUIAAbstractDictionaryBackedConfiguration *)v20 delayForApplicationOfKeypath:@"circleGradientLocations"];
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v20, "_setDelay:forApplicationOfKeypath:", @"circleMaskInnerRadius");
  [(_SUIAShockwaveFillLightConfiguration *)v20 _setCircleMaskOuterRadius:v150];
  v152 = [(_SUIAAbstractDictionaryBackedConfiguration *)v20 behaviorSettingsForKeypath:@"circleGradientLocations"];
  [(_SUIAAbstractDictionaryBackedConfiguration *)v20 _setBehaviorSettings:v152 forKeypath:@"circleMaskOuterRadius"];

  [(_SUIAAbstractDictionaryBackedConfiguration *)v20 delayForApplicationOfKeypath:@"circleGradientLocations"];
  -[_SUIAAbstractDictionaryBackedConfiguration _setDelay:forApplicationOfKeypath:](v20, "_setDelay:forApplicationOfKeypath:", @"circleMaskOuterRadius");
  v90 = v20;

LABEL_43:
  return v90;
}

@end