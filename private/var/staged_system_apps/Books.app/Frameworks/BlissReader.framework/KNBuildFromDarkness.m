@interface KNBuildFromDarkness
+ (BOOL)requiresSingleTexturePerStage;
+ (id)animationFilter;
+ (id)animationName;
+ (id)customAttributes;
+ (id)defaultAttributes;
+ (id)localizedMenuString:(int)a3;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (unint64_t)directionType;
+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8;
+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8;
- (CATransform3D)p_transformForPercent:(SEL)a3 centerPoint:(double)a4;
- (CGRect)frameOfEffectWithContext:(id)a3;
- (KNBuildFromDarkness)initWithAnimationContext:(id)a3;
- (void)metalAnimationHasBegunWithContext:(id)a3;
- (void)metalAnimationWillBeginWithContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalRenderFrameWithContext:(id)a3;
- (void)metalTeardownAnimationsWithContext:(id)a3;
- (void)p_drawWithContext:(id)a3;
- (void)p_metalSetupWithContext:(id)a3;
- (void)p_setupAnimationWithContext:(id)a3;
- (void)p_setupMetalAnimationWithContext:(id)a3 texturedRect:(id)a4;
- (void)p_setupMetalEdgeDistanceTextureWithContext:(id)a3;
- (void)p_setupMetalTransformWithContext:(id)a3 texturedRect:(id)a4;
- (void)p_teardown;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNBuildFromDarkness

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.FromDarkness";
}

+ (int)animationCategory
{
  return 201;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_499B30;
}

+ (id)localizedMenuString:(int)a3
{
  v3 = KNBundle();
  v4 = [v3 localizedStringForKey:@"Fade and Scale" value:@"Fade and Scale" table:@"Keynote"];

  return v4;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  v2 = +[NSNumber numberWithDouble:2.5];
  v3 = +[NSDictionary dictionaryWithObject:v2 forKey:@"KNBuildAttributesDuration"];

  return v3;
}

+ (id)customAttributes
{
  v18[0] = @"KNBuildCustomAttributesShine";
  v17[0] = &off_4993F0;
  v17[1] = &off_499408;
  v2 = KNBundle();
  v3 = [v2 localizedStringForKey:@"Shine *Fade and Scale Build*" value:@"Shine" table:@"Keynote"];
  v18[1] = v3;
  v18[2] = &off_499438;
  v17[2] = &off_499420;
  v17[3] = &off_499450;
  v4 = KNBundle();
  v5 = [v4 localizedStringForKey:@"Select to use a shine effect during the build." value:&stru_46D7E8 table:@"Keynote"];
  v18[3] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:4];

  v16[0] = @"KNBuildCustomAttributesScaleAmount";
  v15[0] = &off_4993F0;
  v15[1] = &off_499408;
  v7 = KNBundle();
  v8 = [v7 localizedStringForKey:@"Scale *Fade and Scale Build*" value:@"Scale" table:@"Keynote"];
  v16[1] = v8;
  v16[2] = &off_499468;
  v15[2] = &off_499420;
  v15[3] = &off_499480;
  v16[3] = &off_499498;
  v16[4] = &off_4994C8;
  v15[4] = &off_4994B0;
  v15[5] = &off_499450;
  v9 = KNBundle();
  v10 = [v9 localizedStringForKey:@"Adjust how much the object\\U2019s size changes." value:&stru_46D7E8 table:@"Keynote"];
  v16[5] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];

  v14[0] = v6;
  v14[1] = v11;
  v12 = +[NSArray arrayWithObjects:v14 count:2];

  return v12;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-builds-fromDarkness";
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  uint64_t v9 = [*a3 objectForKeyedSubscript:@"KNBuildCustomAttributesShine" a4, a5, *(void *)&a6, a7, a8];
  if (!v9
    || (v10 = (void *)v9,
        [*a3 objectForKeyedSubscript:@"KNBuildCustomAttributesScaleAmount"],
        v11 = objc_claimAutoreleasedReturnValue(),
        v11,
        v10,
        !v11))
  {
    id v12 = [*a3 mutableCopy];
    [v12 setObject:&__kCFBooleanTrue forKeyedSubscript:@"KNBuildCustomAttributesShine"];
    [v12 setObject:&off_4994E0 forKeyedSubscript:@"KNBuildCustomAttributesScaleAmount"];
    id v13 = v12;
    *a3 = v13;
  }
}

+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a7)
  {
    uint64_t v8 = *(void *)&a6;
    *a4 = @"apple:dissolve";
    KNBundle();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    v11 = [v13 localizedStringForKey:@"%@ builds were exported as Dissolve." value:&stru_46D7E8 table:@"Keynote"];
    id v12 = [a1 localizedMenuString:v8];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (KNBuildFromDarkness)initWithAnimationContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)KNBuildFromDarkness;
  v3 = [(KNAnimationEffect *)&v9 initWithAnimationContext:a3];
  if (v3)
  {
    v4 = KNBundle();
    v5 = [v4 pathForResource:@"FromDarkness" ofType:@"parameterGroup"];

    uint64_t v6 = +[KNAnimParameterGroup parameterGroupForFile:v5];
    parameterGroup = v3->_parameterGroup;
    v3->_parameterGroup = (KNAnimParameterGroup *)v6;
  }
  return v3;
}

- (void)p_teardown
{
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  id v4 = a3;
  [v4 drawableFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  self->_drawableFrame.origin.x = v5;
  self->_drawableFrame.origin.y = v7;
  self->_drawableFrame.size.width = v9;
  self->_drawableFrame.size.height = v11;
  id v13 = [v4 animatedBuild];

  v14 = [v13 attributes];
  v15 = [v14 objectForKeyedSubscript:@"KNBuildCustomAttributesScaleAmount"];
  [v15 doubleValue];
  double v17 = v16 / 100.0;

  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  CGRectGetMinX(v19);
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  CGRectGetMinY(v20);
  v21.origin.x = v6;
  v21.origin.y = v8;
  v21.size.width = v10;
  v21.size.height = v12;
  CGRectGetMaxX(v21);
  v22.origin.x = v6;
  v22.origin.y = v8;
  v22.size.width = v10;
  v22.size.height = v12;
  CGRectGetMaxY(v22);
  if (v17 > 1.0 && vabdd_f64(1.0, v17) >= 0.00999999978)
  {
    v23.origin.x = v6;
    v23.origin.y = v8;
    v23.size.width = v10;
    v23.size.height = v12;
    CGRectGetMidX(v23);
    v24.origin.x = v6;
    v24.origin.y = v8;
    v24.size.width = v10;
    v24.size.height = v12;
    CGRectGetMidY(v24);
    v25.origin.x = v6;
    v25.origin.y = v8;
    v25.size.width = v10;
    v25.size.height = v12;
    CGRectGetWidth(v25);
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v12;
    CGRectGetHeight(v26);
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    CGRectGetMinX(v27);
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    CGRectGetMinY(v28);
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    CGRectGetMaxX(v29);
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    CGRectGetMaxY(v30);
  }
  p_frameRect = &self->_frameRect;
  TSDRectWithPoints();
  CGRect *p_frameRect = v31;
  CGRect result = CGRectIntegral(v31);
  CGRect *p_frameRect = result;
  return result;
}

- (CATransform3D)p_transformForPercent:(SEL)a3 centerPoint:(double)a4
{
  double y = a5.y;
  double x = a5.x;
  TSUMix();
  CGFloat v10 = v9;
  long long v12 = *(_OWORD *)&self->_baseTransform.m31;
  long long v11 = *(_OWORD *)&self->_baseTransform.m33;
  long long v13 = *(_OWORD *)&self->_baseTransform.m23;
  *(_OWORD *)&retstr->m31 = v12;
  *(_OWORD *)&retstr->m33 = v11;
  long long v14 = *(_OWORD *)&self->_baseTransform.m33;
  long long v16 = *(_OWORD *)&self->_baseTransform.m41;
  long long v15 = *(_OWORD *)&self->_baseTransform.m43;
  *(_OWORD *)&retstr->m41 = v16;
  *(_OWORD *)&retstr->m43 = v15;
  long long v17 = *(_OWORD *)&self->_baseTransform.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->_baseTransform.m11;
  *(_OWORD *)&retstr->m13 = v17;
  long long v18 = *(_OWORD *)&self->_baseTransform.m23;
  long long v20 = *(_OWORD *)&self->_baseTransform.m11;
  long long v19 = *(_OWORD *)&self->_baseTransform.m13;
  long long v21 = *(_OWORD *)&self->_baseTransform.m21;
  *(_OWORD *)&retstr->m21 = v21;
  *(_OWORD *)&retstr->m23 = v18;
  *(_OWORD *)&v44.m31 = v12;
  *(_OWORD *)&v44.m33 = v14;
  long long v22 = *(_OWORD *)&self->_baseTransform.m43;
  *(_OWORD *)&v44.m41 = v16;
  *(_OWORD *)&v44.m43 = v22;
  *(_OWORD *)&v44.m11 = v20;
  *(_OWORD *)&v44.m13 = v19;
  *(_OWORD *)&v44.m21 = v21;
  *(_OWORD *)&v44.m23 = v13;
  CATransform3DTranslate(&v45, &v44, x, y, 0.0);
  long long v23 = *(_OWORD *)&v45.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v45.m31;
  *(_OWORD *)&retstr->m33 = v23;
  long long v24 = *(_OWORD *)&v45.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v45.m41;
  *(_OWORD *)&retstr->m43 = v24;
  long long v25 = *(_OWORD *)&v45.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v45.m11;
  *(_OWORD *)&retstr->m13 = v25;
  long long v26 = *(_OWORD *)&v45.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v45.m21;
  *(_OWORD *)&retstr->m23 = v26;
  long long v27 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v44.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v44.m33 = v27;
  long long v28 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v44.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v44.m43 = v28;
  long long v29 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v44.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v44.m13 = v29;
  long long v30 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v44.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v44.m23 = v30;
  CATransform3DScale(&v45, &v44, v10, v10, 1.0);
  long long v31 = *(_OWORD *)&v45.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v45.m31;
  *(_OWORD *)&retstr->m33 = v31;
  long long v32 = *(_OWORD *)&v45.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v45.m41;
  *(_OWORD *)&retstr->m43 = v32;
  long long v33 = *(_OWORD *)&v45.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v45.m11;
  *(_OWORD *)&retstr->m13 = v33;
  long long v34 = *(_OWORD *)&v45.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v45.m21;
  *(_OWORD *)&retstr->m23 = v34;
  long long v35 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v44.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v44.m33 = v35;
  long long v36 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v44.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v44.m43 = v36;
  long long v37 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v44.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v44.m13 = v37;
  long long v38 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v44.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v44.m23 = v38;
  CGRect result = CATransform3DTranslate(&v45, &v44, -x, -y, 0.0);
  long long v40 = *(_OWORD *)&v45.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v45.m31;
  *(_OWORD *)&retstr->m33 = v40;
  long long v41 = *(_OWORD *)&v45.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v45.m41;
  *(_OWORD *)&retstr->m43 = v41;
  long long v42 = *(_OWORD *)&v45.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v45.m11;
  *(_OWORD *)&retstr->m13 = v42;
  long long v43 = *(_OWORD *)&v45.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v45.m21;
  *(_OWORD *)&retstr->m23 = v43;
  return result;
}

- (void)p_drawWithContext:(id)a3
{
  id v4 = a3;
  CGFloat v5 = [v4 textures];
  CGFloat v6 = [v4 animatedBuild];
  [v4 percent];
  double v8 = v7;
  [v6 duration];
  double v9 = [v4 animatedBuild];

  LODWORD(v4) = [v9 isBuildOut];
  if (v4) {
    double v8 = 1.0 - v8;
  }
  CGFloat v10 = [v5 lastObject];
  [v10 size];
  TSDRectWithSize();
  TSDCenterOfRect();
  double v12 = v11;
  double v14 = v13;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"Scale Timing" atPercent:v8];
  if (!BYTE2(self->_scaleMin)) {
    double v15 = 1.0 - v15;
  }
  -[KNBuildFromDarkness p_transformForPercent:centerPoint:](self, "p_transformForPercent:centerPoint:", v15, v12, v14);
  if (BYTE1(self->_scaleMin))
  {
    TSUClamp();
    -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](self->_parameterGroup, "valueForAnimationCurve:atPercent:", @"Scale Timing");
    if (!BYTE2(self->_scaleMin)) {
      double v16 = 1.0 - v16;
    }
    -[KNBuildFromDarkness p_transformForPercent:centerPoint:](self, "p_transformForPercent:centerPoint:", v16, v12, v14);
    [(TSDMetalMotionBlurEffect *)self->_metalMotionBlurEffect velocityScale];
    v18.f64[1] = v17;
    *(float32x2_t *)&self->_anon_140[135] = vcvt_f32_f64(v18);
    *(float32x4_t *)&self->_anon_140[71] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
    *(float32x4_t *)&self->_anon_140[87] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
    *(float32x4_t *)&self->_anon_140[103] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
    *(float32x4_t *)&self->_anon_140[119] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
    *(float32x2_t *)&v18.f64[0] = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.a);
    float32x2_t v19 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.c);
    float32x2_t v20 = vcvt_f32_f64(*(float64x2_t *)&CGAffineTransformIdentity.tx);
    *(_DWORD *)&self->_anon_140[159] = 0;
    *(float64_t *)&self->_anon_140[151] = v18.f64[0];
    *(_DWORD *)&self->_anon_140[175] = 0;
    *(float32x2_t *)&self->_anon_140[167] = v19;
    *(_DWORD *)&self->_anon_140[191] = 1065353216;
    *(float32x2_t *)&self->_anon_140[183] = v20;
  }
  [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"Opacity Timing" atPercent:v8];
  double v22 = v21;
  [v10 singleTextureOpacity];
  double v24 = v22 * v23;
  if (LOBYTE(self->_scaleMin))
  {
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Gradient BeginTime"];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Gradient EndTime"];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Gradient Size"];
    TSUClamp();
    TSDMixFloats();
    float64_t v55 = v25;
    TSDMixFloats();
    v26.f64[0] = v55;
    v26.f64[1] = v27;
    float32x2_t v28 = vcvt_f32_f64(v26);
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Bevel Angle Begin"];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Bevel Angle End"];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"Bevel Angle Timing" atPercent:v8];
    TSDMixFloats();
    TSDDeltaFromAngle();
    float64_t v54 = v30;
    float64_t v56 = v29;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Bevel Opacity"];
    double v32 = v31;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"Bevel Timing" atPercent:v8];
    double v34 = v32 * v33;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Shine XPosition Begin"];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Shine XPosition End"];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Shine Angle"];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"Shine Move Timing" atPercent:v8];
    TSDMixFloats();
    double v36 = v35;
    [v10 size];
    *(float *)&double v37 = v36 * v37;
    unsigned int v53 = LODWORD(v37);
    TSDDeltaFromAngle();
    v39.f64[1] = v38;
    float32x2_t v40 = vadd_f32((float32x2_t)v53, vcvt_f32_f64(v39));
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Shine Size"];
    double v42 = v41;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Shine Opacity"];
    double v44 = v43;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Shine Opacity EndTime"];
    parameterGroup = self->_parameterGroup;
    TSUClamp();
    -[KNAnimParameterGroup valueForAnimationCurve:atPercent:](parameterGroup, "valueForAnimationCurve:atPercent:", @"Shine Opacity Timing");
    double v47 = v44 * v46;
    *(float32x2_t *)&self->_anon_200[39] = v28;
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Gradient Affects Highlights Amount"];
    *(float *)&double v48 = v48;
    *(_DWORD *)&self->_anon_200[47] = LODWORD(v48);
    v49.f64[0] = v56;
    v49.f64[1] = v54;
    *(float32x2_t *)&self->_anon_200[31] = vcvt_f32_f64(v49);
    *(float *)v49.f64 = v34;
    *(_DWORD *)&self->_anon_200[23] = LODWORD(v49.f64[0]);
    *(void *)&self->_anon_200[55] = v53;
    *(float32x2_t *)&self->_anon_200[63] = v40;
    *(float *)v49.f64 = v42;
    float v50 = v47;
    *(_DWORD *)&self->_anon_200[71] = LODWORD(v49.f64[0]);
    self->_unshinyFragmentInput.Opacitdouble y = v50;
    float v51 = v24;
    *(float *)&self->_anon_200[15] = v51;
  }
  else
  {
    float v51 = v24;
  }
  float32x4_t v52 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64((float64x2_t)0), (float64x2_t)0);
  *(float32x4_t *)&self->_anon_100[7] = v52;
  *(float32x4_t *)&self->_anon_100[23] = v52;
  *(float32x4_t *)&self->_anon_100[39] = v52;
  *(float32x4_t *)&self->_anon_100[55] = v52;
  *(float32x4_t *)&self->_anon_140[7] = v52;
  *(float32x4_t *)&self->_anon_140[23] = v52;
  *(float32x4_t *)&self->_anon_140[39] = v52;
  *(float32x4_t *)&self->_anon_140[55] = v52;
  *(float *)&self->_edgeTextureName = v51;
}

- (void)p_setupMetalEdgeDistanceTextureWithContext:(id)a3
{
  id v4 = a3;
  if (!self->_edgeDistanceTexture)
  {
    id v33 = v4;
    CGFloat v5 = [v4 metalContext];
    CGFloat v6 = [v33 textures];
    if ([v6 count] != (char *)&dword_0 + 1)
    {
      double v7 = +[TSUAssertionHandler currentHandler];
      double v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFromDarkness p_setupMetalEdgeDistanceTextureWithContext:]");
      double v9 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFromDarkness.m"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 397, @"Effect expects one texture. Passed (%lu) textures.", objc_msgSend(v6, "count"));
    }
    CGFloat v10 = [v6 lastObject];
    [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Bevel Size"];
    double v12 = v11 / 100.0;
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v14 = v13;
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    if (v14 >= v15) {
      double v16 = v15;
    }
    else {
      double v16 = v14;
    }
    double v17 = v12 * v16;
    float v18 = v12 * v16;
    *(float *)&self->_anon_200[19] = v18;
    float32x2_t v19 = [v10 metalTextureWithContext:v5];
    float32x2_t v20 = v19;
    if (v19)
    {
      double v21 = (double)(unint64_t)[v19 width];
      double v22 = (double)(unint64_t)[v20 height];
      double v32 = v5;
      double v23 = [v33 metalContext];
      double v24 = [(KNAnimationContext *)self->super.mAnimationContext capabilities];
      double v25 = +[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:](TSDMetalEdgeDistanceField, "distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:", v20, (uint64_t)(v17 + v17), 1, 0, v23, v24, v21, v22, TSDEdgeInsetsZero[0].f64[0], TSDEdgeInsetsZero[0].f64[1], TSDEdgeInsetsZero[1].f64[0], TSDEdgeInsetsZero[1].f64[1], 1.0);
      float64x2_t v26 = [v25 name];
      edgeDistanceTexture = self->_edgeDistanceTexture;
      self->_edgeDistanceTexture = v26;

      CGFloat v5 = v32;
      [v10 size];
      float64_t v31 = v28;
      [v10 size];
      v29.f64[0] = v31;
      v29.f64[1] = v30;
      *(float32x2_t *)&self->_anon_200[7] = vcvt_f32_f64(v29);
    }

    id v4 = v33;
  }
}

- (void)p_setupMetalAnimationWithContext:(id)a3 texturedRect:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  double v7 = [v32 metalContext];
  double v8 = [v7 device];
  id v9 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v9 setPixelFormat:[v7 pixelFormat]];
  [v9 setBlendingEnabled:1];
  [v9 setDestinationRGBBlendFactor:5];
  [v9 setDestinationAlphaBlendFactor:5];
  if (BYTE1(self->_scaleMin))
  {
    id v10 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    objc_msgSend(v10, "setPixelFormat:", objc_msgSend(v7, "pixelFormat"));
    id v11 = objc_alloc((Class)TSDMetalMotionBlurEffect);
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v13 = v12;
    double v15 = v14;
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v17 = v16;
    double v19 = v18;
    float32x2_t v20 = [v32 randomGenerator];
    double v21 = [v11 initWithFramebufferSize:v20 slideSize:v7 randomGenerator:v13 metalContext:v15, v17, v19];
    metalMotionBlurEffect = self->_metalMotionBlurEffect;
    self->_metalMotionBlurEffect = v21;

    [(TSDMetalMotionBlurEffect *)self->_metalMotionBlurEffect setIsSingleObject:1];
  }
  else
  {
    id v10 = 0;
  }
  if (LOBYTE(self->_scaleMin))
  {
    double v23 = @"buildFromDarknessMotionBlurFragmentShader";
    if (BYTE1(self->_scaleMin)) {
      double v24 = @"buildFromDarknessMotionBlurVertexShader";
    }
    else {
      double v24 = @"buildFromDarknessVertexShader";
    }
    if (!BYTE1(self->_scaleMin)) {
      double v23 = @"buildFromDarknessFragmentShader";
    }
    double v25 = v23;
    float64x2_t v26 = v24;
    float64_t v27 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:v26 fragmentShader:v25 device:v8 library:@"KeynoteMetalLibrary" colorAttachment:v9 velocityAttachment:v10];

    metalShader = self->_metalShader;
    self->_metalShader = v27;
  }
  else
  {
    float64x2_t v29 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureAndOpacityMotionBlurShaderWithDevice:v8 colorAttachment:v9 velocityAttachment:v10 motionBlur:BYTE1(self->_scaleMin)];
    metalShader = self->_metalShader;
    self->_metalShader = v29;
  }

  [v6 size];
  TSDRectWithSize();
  float64_t v30 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v8);
  mtlDataBuffer = self->_mtlDataBuffer;
  self->_mtlDataBuffer = v30;
}

- (void)p_setupMetalTransformWithContext:(id)a3 texturedRect:(id)a4
{
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  -[KNAnimationEffect mvpMatrixWithContext:](self, "mvpMatrixWithContext:", a3, a4);
  if (BYTE1(self->_scaleMin))
  {
    metalMotionBlurEffect = self->_metalMotionBlurEffect;
    if (metalMotionBlurEffect)
    {
      v10[4] = v23;
      v10[5] = v24;
      v10[6] = v25;
      v10[7] = v26;
      v10[0] = v19;
      v10[1] = v20;
      v10[2] = v21;
      v10[3] = v22;
      [(TSDMetalMotionBlurEffect *)metalMotionBlurEffect adjustTransformForMotionBlurBuffer:v10];
    }
    else
    {
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
    }
    long long v23 = v15;
    long long v24 = v16;
    long long v25 = v17;
    long long v26 = v18;
    long long v19 = v11;
    long long v20 = v12;
    long long v21 = v13;
    long long v22 = v14;
  }
  long long v6 = v24;
  *(_OWORD *)&self->_baseTransform.m31 = v23;
  *(_OWORD *)&self->_baseTransform.m33 = v6;
  long long v7 = v26;
  *(_OWORD *)&self->_baseTransform.m41 = v25;
  *(_OWORD *)&self->_baseTransform.m43 = v7;
  long long v8 = v20;
  *(_OWORD *)&self->_baseTransform.m11 = v19;
  *(_OWORD *)&self->_baseTransform.m13 = v8;
  long long v9 = v22;
  *(_OWORD *)&self->_baseTransform.m21 = v21;
  *(_OWORD *)&self->_baseTransform.m23 = v9;
}

- (void)p_setupAnimationWithContext:(id)a3
{
  id v19 = a3;
  id v4 = [v19 textures];
  if ([v4 count] != (char *)&dword_0 + 1)
  {
    CGFloat v5 = +[TSUAssertionHandler currentHandler];
    long long v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFromDarkness p_setupAnimationWithContext:]");
    long long v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFromDarkness.m"];
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 486, @"Effect expects one texture. Passed (%lu) textures.", objc_msgSend(v4, "count"));
  }
  long long v8 = [v4 lastObject];
  [(KNBuildFromDarkness *)self p_setupMetalTransformWithContext:v19 texturedRect:v8];
  long long v9 = [v19 animatedBuild];
  id v10 = [v9 attributes];
  long long v11 = [v10 objectForKeyedSubscript:@"KNBuildCustomAttributesScaleAmount"];
  [v11 doubleValue];
  double v13 = v12 / 100.0;

  BYTE2(self->_scaleMin) = 1;
  self->_scaleMadouble x = 1.0;
  self[1].super.super.isa = (Class)0x3FF0000000000000;
  BYTE1(self->_scaleMin) = [v19 isMotionBlurred];
  if (fabs(v13 + -1.0) >= 0.01)
  {
    if (v13 >= 1.0)
    {
      if (v13 > 1.0)
      {
        BYTE2(self->_scaleMin) = 0;
        [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Scale Max"];
        TSUMix();
        self[1].super.super.isa = v15;
      }
    }
    else
    {
      [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Scale Min"];
      TSUMix();
      self->_scaleMadouble x = v14;
    }
  }
  else
  {
    BYTE1(self->_scaleMin) = 0;
  }
  long long v16 = [v19 animatedBuild];
  long long v17 = [v16 attributes];
  long long v18 = [v17 objectForKeyedSubscript:@"KNBuildCustomAttributesShine"];
  LOBYTE(self->_scaleMin) = [v18 BOOLValue];

  [(KNBuildFromDarkness *)self p_setupMetalAnimationWithContext:v19 texturedRect:v8];
}

- (void)renderFrameWithContext:(id)a3
{
}

- (void)p_metalSetupWithContext:(id)a3
{
  id v4 = a3;
  if (!self->_isMetalSetupComplete)
  {
    [(KNBuildFromDarkness *)self p_setupAnimationWithContext:v4];
    CGFloat v5 = [v4 textures];
    if ([v5 count] != (char *)&dword_0 + 1)
    {
      long long v6 = +[TSUAssertionHandler currentHandler];
      long long v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFromDarkness p_metalSetupWithContext:]");
      long long v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFromDarkness.m"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, v8, 538, @"Effect expects one texture. Passed (%lu) textures.", objc_msgSend(v5, "count"));
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    [(KNAnimationEffect *)self mvpMatrixWithContext:v4];
    if (BYTE1(self->_scaleMin))
    {
      metalMotionBlurEffect = self->_metalMotionBlurEffect;
      if (metalMotionBlurEffect)
      {
        v14[4] = v27;
        v14[5] = v28;
        v14[6] = v29;
        v14[7] = v30;
        v14[0] = v23;
        v14[1] = v24;
        void v14[2] = v25;
        v14[3] = v26;
        [(TSDMetalMotionBlurEffect *)metalMotionBlurEffect adjustTransformForMotionBlurBuffer:v14];
      }
      else
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
      }
      long long v27 = v19;
      long long v28 = v20;
      long long v29 = v21;
      long long v30 = v22;
      long long v23 = v15;
      long long v24 = v16;
      long long v25 = v17;
      long long v26 = v18;
    }
    long long v10 = v28;
    *(_OWORD *)&self->_baseTransform.m31 = v27;
    *(_OWORD *)&self->_baseTransform.m33 = v10;
    long long v11 = v30;
    *(_OWORD *)&self->_baseTransform.m41 = v29;
    *(_OWORD *)&self->_baseTransform.m43 = v11;
    long long v12 = v24;
    *(_OWORD *)&self->_baseTransform.m11 = v23;
    *(_OWORD *)&self->_baseTransform.m13 = v12;
    long long v13 = v26;
    *(_OWORD *)&self->_baseTransform.m21 = v25;
    *(_OWORD *)&self->_baseTransform.m23 = v13;
    self->_isMetalSetupComplete = 1;
  }
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v9 = a3;
  id v4 = [v9 animatedBuild];
  CGFloat v5 = [v4 attributes];
  long long v6 = [v5 objectForKeyedSubscript:@"KNBuildCustomAttributesShine"];
  LOBYTE(self->_scaleMin) = [v6 BOOLValue];

  [(KNBuildFromDarkness *)self p_metalSetupWithContext:v9];
  if (!LOBYTE(self->_scaleMin)
    || ([v9 animatedBuild],
        long long v7 = objc_claimAutoreleasedReturnValue(),
        unsigned int v8 = [v7 isBuildIn],
        v7,
        v8))
  {
    [(KNBuildFromDarkness *)self p_setupMetalEdgeDistanceTextureWithContext:v9];
  }
}

- (void)metalAnimationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  [(KNBuildFromDarkness *)self metalPrepareAnimationWithContext:v4];
  [(KNBuildFromDarkness *)self metalAnimationHasBegunWithContext:v4];
}

- (void)metalAnimationHasBegunWithContext:(id)a3
{
  id v6 = a3;
  id v4 = [v6 animatedBuild];
  unsigned int v5 = [v4 isBuildOut];

  if (v5) {
    [(KNBuildFromDarkness *)self p_setupMetalEdgeDistanceTextureWithContext:v6];
  }
}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v18 = a3;
  id v4 = [v18 metalContext];
  unsigned int v5 = [v4 renderEncoder];
  if (!v5)
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    long long v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildFromDarkness metalRenderFrameWithContext:]");
    unsigned int v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildFromDarkness.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:581 description:@"invalid nil value for '%s'", "workingEncoder"];
  }
  if (BYTE1(self->_scaleMin))
  {
    uint64_t v9 = [(TSDMetalMotionBlurEffect *)self->_metalMotionBlurEffect bindColorAndVelocityWithMetalContext:v4 shouldFillBackground:0];

    unsigned int v5 = (void *)v9;
  }
  long long v10 = [v18 textures];
  long long v11 = [v10 lastObject];
  long long v12 = [v11 metalTextureWithContext:v4];

  if (v12 && self->_edgeDistanceTexture)
  {
    [(KNBuildFromDarkness *)self p_drawWithContext:v18];
    metalShader = self->_metalShader;
    if (LOBYTE(self->_scaleMin))
    {
      double v14 = BYTE1(self->_scaleMin)
          ? &OBJC_IVAR___KNBuildFromDarkness__vertexInputMB
          : &OBJC_IVAR___KNBuildFromDarkness__vertexInput;
      [(TSDMetalShader *)metalShader setPipelineStateWithEncoder:v5 vertexBytes:(char *)self + *v14 fragmentBytes:&self->_anon_200[7]];
      [v5 setFragmentTexture:self->_edgeDistanceTexture atIndex:1];
    }
    else
    {
      uint64_t v15 = BYTE1(self->_scaleMin) ? 320 : 256;
      [(TSDMetalShader *)metalShader setPipelineStateWithEncoder:v5 vertexBytes:(char *)self + v15 fragmentBytes:&self->_edgeTextureName];
    }
    [v5 setFragmentTexture:v12 atIndex:0];
    [(TSDMTLDataBuffer *)self->_mtlDataBuffer drawWithEncoder:v5 atIndex:[(TSDMetalShader *)self->_metalShader bufferIndex]];
    if (BYTE1(self->_scaleMin))
    {
      metalMotionBlurEffect = self->_metalMotionBlurEffect;
      long long v17 = [v4 renderEncoder];
      [(TSDMetalMotionBlurEffect *)metalMotionBlurEffect drawResultWithWorkingRenderEncoder:v5 destinationRenderEncoder:v17];
    }
  }
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  metalShader = self->_metalShader;
  self->_metalShader = 0;

  mtlDataBuffer = self->_mtlDataBuffer;
  self->_mtlDataBuffer = 0;

  metalMotionBlurEffect = self->_metalMotionBlurEffect;
  self->_metalMotionBlurEffect = 0;

  edgeDistanceTexture = self->_edgeDistanceTexture;
  self->_edgeDistanceTexture = 0;

  self->_isMetalSetupComplete = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeDistanceTexture, 0);
  objc_storeStrong((id *)&self->_metalMotionBlurEffect, 0);
  objc_storeStrong((id *)&self->_mtlDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalShader, 0);

  objc_storeStrong((id *)&self->_parameterGroup, 0);
}

@end