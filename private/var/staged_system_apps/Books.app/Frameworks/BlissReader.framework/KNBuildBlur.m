@interface KNBuildBlur
+ (BOOL)requiresSingleTexturePerStage;
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)localizedMenuString:(int)a3;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (unint64_t)directionType;
+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8;
- (CGRect)frameOfEffectWithContext:(id)a3;
- (KNBuildBlur)initWithAnimationContext:(id)a3;
- (void)animationDidEndWithContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)metalAnimationDidEndWithContext:(id)a3;
- (void)metalAnimationHasBegunWithContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalRenderFrameWithContext:(id)a3;
- (void)metalTeardownAnimationsWithContext:(id)a3;
- (void)p_prepareAnimationWithContext:(id)a3;
- (void)p_setupMVPMatricesWithContext:(id)a3;
- (void)p_teardownBlurEffects;
- (void)renderFrameWithContext:(id)a3;
- (void)teardown;
@end

@implementation KNBuildBlur

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.Blur";
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
  return &off_499A58;
}

+ (id)localizedMenuString:(int)a3
{
  v3 = KNBundle();
  v4 = [v3 localizedStringForKey:@"Blur *BlurBuild*" value:@"Blur" table:@"Keynote"];

  return v4;
}

+ (unint64_t)directionType
{
  return 8;
}

+ (id)defaultAttributes
{
  CFStringRef v4 = @"KNBuildAttributesDuration";
  v5 = &off_498FC8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-builds-blur";
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
    v12 = [a1 localizedMenuString:v8];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
}

- (KNBuildBlur)initWithAnimationContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)KNBuildBlur;
  v3 = [(KNAnimationEffect *)&v9 initWithAnimationContext:a3];
  if (v3)
  {
    CFStringRef v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 pathForResource:@"Blur" ofType:@"parameterGroup"];

    uint64_t v6 = +[KNAnimParameterGroup parameterGroupForFile:v5];
    parameterGroup = v3->_parameterGroup;
    v3->_parameterGroup = (KNAnimParameterGroup *)v6;
  }
  return v3;
}

- (void)teardown
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_blurEffects;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) teardown:v9];
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  blurEffects = self->_blurEffects;
  self->_blurEffects = 0;
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  [a3 drawableFrame];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  CGRectGetMinX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRectGetMinY(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGRectGetMaxX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  CGRectGetMaxY(v23);
  TSDRectWithPoints();
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  v27.origin.CGFloat x = v16;
  v27.origin.CGFloat y = v17;
  v27.size.CGFloat width = v18;
  v27.size.CGFloat height = v19;
  v24.origin.CGFloat x = v9;
  v24.origin.CGFloat y = v11;
  v24.size.CGFloat width = v13;
  v24.size.CGFloat height = v15;
  CGRect v25 = CGRectIntersection(v24, v27);
  CGRect result = CGRectIntegral(v25);
  self->_animationRect = result;
  self->_drawableFrame.origin.CGFloat x = x;
  self->_drawableFrame.origin.CGFloat y = y;
  self->_drawableFrame.size.CGFloat width = width;
  self->_drawableFrame.size.CGFloat height = height;
  return result;
}

- (void)p_setupMVPMatricesWithContext:(id)a3
{
  id v4 = [a3 textures];
  id v5 = [v4 firstObject];

  [v5 frameOnCanvas];
  CGFloat v7 = v6 - CGRectGetMinX(self->_animationRect);
  [v5 frameOnCanvas];
  double v9 = v8;
  [v5 frame];
  double v11 = v9 + v10 - CGRectGetMaxY(self->_animationRect);
  CGRectGetWidth(self->_animationRect);
  CGRectGetHeight(self->_animationRect);
  double height = self->_animationRect.size.height;
  [(KNAnimationContext *)self->super.mAnimationContext fieldOfViewInRadians];
  long double v14 = tan(v13 * 0.5);
  long double v15 = height / (v14 + v14);
  memset(&v25, 0, sizeof(v25));
  [(KNAnimationContext *)self->super.mAnimationContext fieldOfViewInRadians];
  TSDTransform3DMakeProjection();
  memset(&v24, 0, sizeof(v24));
  CATransform3DMakeTranslation(&v24, self->_animationRect.size.width * -0.5, self->_animationRect.size.height * -0.5, -v15);
  memset(&v23, 0, sizeof(v23));
  CATransform3DMakeTranslation(&v23, v7, -v11, 0.0);
  self = (KNBuildBlur *)((char *)self + 152);
  CATransform3D a = v24;
  CATransform3D v20 = v25;
  CATransform3DConcat(&b, &a, &v20);
  CATransform3D v20 = v23;
  CATransform3DConcat(&a, &v20, &b);
  long long v16 = *(_OWORD *)&a.m33;
  *(_OWORD *)&self->_anon_30[16] = *(_OWORD *)&a.m31;
  *(_OWORD *)&self->_anon_30[32] = v16;
  long long v17 = *(_OWORD *)&a.m43;
  *(_OWORD *)&self->_anon_30[48] = *(_OWORD *)&a.m41;
  *(_OWORD *)&self->_anon_30[64] = v17;
  long long v18 = *(_OWORD *)&a.m13;
  self->super = *(KNAnimationEffect *)&a.m11;
  *(_OWORD *)&self->_parameterGroup = v18;
  long long v19 = *(_OWORD *)&a.m23;
  *(_OWORD *)&self->_metalShader = *(_OWORD *)&a.m21;
  *(_OWORD *)self->_anon_30 = v19;
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  [(KNBuildBlur *)self frameOfEffectWithContext:v4];
  [(KNBuildBlur *)self metalPrepareAnimationWithContext:v4];
  [(KNBuildBlur *)self metalAnimationHasBegunWithContext:v4];
}

- (void)renderFrameWithContext:(id)a3
{
}

- (void)animationDidEndWithContext:(id)a3
{
  id v4 = a3;
  [(KNBuildBlur *)self metalAnimationDidEndWithContext:v4];
  [(KNBuildBlur *)self metalTeardownAnimationsWithContext:v4];
}

- (void)p_prepareAnimationWithContext:(id)a3
{
  id v4 = a3;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  self->_drawableFrame.origin.CGFloat x = v5;
  self->_drawableFrame.origin.CGFloat y = v6;
  self->_drawableFrame.size.CGFloat width = v7;
  self->_drawableFrame.size.double height = v8;
  CGSize size = self->_drawableFrame.size;
  self->_animationRect.origin = self->_drawableFrame.origin;
  self->_animationRect.CGSize size = size;
  p_projectionMatriCGFloat x = &self->_projectionMatrix;
  [(KNAnimationEffect *)self perspectiveMVPMatrixWithContext:v4];
  long long v11 = v62;
  *(_OWORD *)&self->_projectionMatrix.m31 = v61;
  *(_OWORD *)&self->_projectionMatrix.m33 = v11;
  long long v12 = v64;
  *(_OWORD *)&self->_projectionMatrix.m41 = v63;
  *(_OWORD *)&self->_projectionMatrix.m43 = v12;
  long long v13 = v58;
  *(_OWORD *)&self->_projectionMatrix.m11 = v57;
  *(_OWORD *)&self->_projectionMatrix.m13 = v13;
  long long v14 = v60;
  *(_OWORD *)&self->_projectionMatrix.m21 = v59;
  *(_OWORD *)&self->_projectionMatrix.m23 = v14;
  long double v15 = [v4 metalContext];
  uint64_t v16 = [v15 device];
  id v17 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v17, "setPixelFormat:", objc_msgSend(v15, "pixelFormat"));
  [v17 setBlendingEnabled:1];
  [v17 setDestinationRGBBlendFactor:5];
  [v17 setDestinationAlphaBlendFactor:5];
  v47 = v17;
  v48 = (void *)v16;
  long long v18 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"KNBuildBlurVertexShader" fragmentShader:@"KNBuildBlurFragmentShader" device:v16 library:@"KeynoteMetalLibrary" colorAttachment:v17];
  metalShader = self->_metalShader;
  self->_metalShader = v18;

  float32x4_t v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m21), *(float64x2_t *)&self->_projectionMatrix.m23);
  float32x4_t v21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m31), *(float64x2_t *)&self->_projectionMatrix.m33);
  float32x4_t v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m41), *(float64x2_t *)&self->_projectionMatrix.m43);
  *(float32x4_t *)self->_anon_30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m11), *(float64x2_t *)&self->_projectionMatrix.m13);
  *(float32x4_t *)&self->_anon_30[16] = v20;
  *(float32x4_t *)&self->_anon_30[32] = v21;
  *(float32x4_t *)&self->_anon_30[48] = v22;
  v51 = v4;
  CATransform3D v23 = [v4 textures];
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Blur Steps"];
  double v25 = v24;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Blur Radius Max"];
  double v27 = v26;
  v28 = self;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Half Size Radius Every"];
  double v30 = v29;
  v31 = +[NSMutableArray array];
  v49 = v15;
  v46 = [v15 commandQueue];
  v32 = [v46 commandBuffer];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v23;
  id v33 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v33)
  {
    id v34 = v33;
    unint64_t v35 = (unint64_t)fmax(v25, 1.0);
    uint64_t v36 = *(void *)v54;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v54 != v36) {
          objc_enumerationMutation(obj);
        }
        v38 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v39 = [[KNGaussianBlurEffect alloc] initWithContext:v51];
        long long v40 = *(_OWORD *)&p_projectionMatrix->m33;
        v52[4] = *(_OWORD *)&p_projectionMatrix->m31;
        v52[5] = v40;
        long long v41 = *(_OWORD *)&p_projectionMatrix->m43;
        v52[6] = *(_OWORD *)&p_projectionMatrix->m41;
        v52[7] = v41;
        long long v42 = *(_OWORD *)&p_projectionMatrix->m13;
        v52[0] = *(_OWORD *)&p_projectionMatrix->m11;
        v52[1] = v42;
        long long v43 = *(_OWORD *)&p_projectionMatrix->m23;
        v52[2] = *(_OWORD *)&p_projectionMatrix->m21;
        v52[3] = v43;
        [(KNGaussianBlurEffect *)v39 setMVPMatrix:v52];
        [(KNGaussianBlurEffect *)v39 setTexture:v38];
        [v38 singleTextureOpacity];
        -[KNGaussianBlurEffect setOpacity:](v39, "setOpacity:");
        [(KNGaussianBlurEffect *)v39 setupEffectIfNecessary];
        v44 = [(KNAnimationContext *)v28->super.mAnimationContext capabilities];
        [(KNGaussianBlurEffect *)v39 createBlurTexturesWithBlurSteps:v35 maxBlurRadius:v32 stepsToDecreaseRadius:v44 commandBuffer:v27 capabilities:v30];

        [(NSMutableArray *)v31 addObject:v39];
      }
      id v34 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v34);
  }

  [v32 commit];
  blurEffects = v28->_blurEffects;
  v28->_blurEffects = v31;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v6 = a3;
  id v4 = [v6 animatedBuild];
  unsigned int v5 = [v4 isBuildIn];

  if (v5) {
    [(KNBuildBlur *)self p_prepareAnimationWithContext:v6];
  }
}

- (void)metalAnimationHasBegunWithContext:(id)a3
{
  id v6 = a3;
  id v4 = [v6 animatedBuild];
  unsigned int v5 = [v4 isBuildOut];

  if (v5) {
    [(KNBuildBlur *)self p_prepareAnimationWithContext:v6];
  }
}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v4 = a3;
  [v4 percent];
  double v6 = v5;
  CGFloat v7 = [v4 animatedBuild];
  unsigned int v8 = [v7 isBuildIn];

  if (v8) {
    double v6 = 1.0 - v6;
  }
  [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"Opacity Fade" atPercent:v6];
  double v10 = v9;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForAnimationCurve:@"Blur Radius Curve" atPercent:sqrt(v6)];
  double v12 = v11;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v13 = self->_blurEffects;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v14)
  {
    id v15 = v14;
    double v16 = 1.0 - v10;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v13);
        }
        long long v19 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        float32x4_t v20 = [v19 texture:v24];
        [v20 singleTextureOpacity];
        double v22 = v21;

        [v19 setOpacity:v16 * v22];
        CATransform3D v23 = [v4 metalContext];
        [v19 renderEffectAtPercent:v23 withContext:v12];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }
}

- (void)p_teardownBlurEffects
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_blurEffects;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      CGFloat v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) teardown:v9];
        CGFloat v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  blurEffects = self->_blurEffects;
  self->_blurEffects = 0;
}

- (void)metalAnimationDidEndWithContext:(id)a3
{
  id v4 = [a3 animatedBuild];
  unsigned int v5 = [v4 isBuildOut];

  if (v5)
  {
    [(KNBuildBlur *)self p_teardownBlurEffects];
  }
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  if (self->_blurEffects) {
    [(KNBuildBlur *)self p_teardownBlurEffects];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalShader, 0);
  objc_storeStrong((id *)&self->_blurEffects, 0);

  objc_storeStrong((id *)&self->_parameterGroup, 0);
}

@end