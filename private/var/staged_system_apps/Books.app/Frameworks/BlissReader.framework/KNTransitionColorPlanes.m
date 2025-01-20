@interface KNTransitionColorPlanes
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (int)rendererTypeForAnimationContext:(id)a3;
+ (unint64_t)directionType;
+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8;
- (CATransform3D)p_mvpMatrixWithTexture:(SEL)a3 direction:(id)a4 percent:(unint64_t)a5 colorIndex:(double)a6;
- (KNTransitionColorPlanes)initWithAnimationContext:(id)a3;
- (void)animationWillBeginWithContext:(id)a3;
- (void)p_drawWithMetalContext:(id)a3 renderEncoder:(id)a4;
- (void)p_teardown;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNTransitionColorPlanes

- (KNTransitionColorPlanes)initWithAnimationContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)KNTransitionColorPlanes;
  result = [(KNAnimationEffect *)&v4 initWithAnimationContext:a3];
  if (result) {
    result->_colorCount = 3.0;
  }
  return result;
}

- (void)p_teardown
{
  motionBlurMetalEffect = self->_motionBlurMetalEffect;
  self->_motionBlurMetalEffect = 0;

  metalShader = self->_metalShader;
  self->_metalShader = 0;
}

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.KLNColorPlanes";
}

+ (int)animationCategory
{
  return 202;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_499860;
}

+ (unint64_t)directionType
{
  return 4;
}

+ (id)defaultAttributes
{
  CFStringRef v4 = @"KNTransitionAttributesDuration";
  v5 = &off_498F58;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-trans-colorPlanes";
}

+ (int)rendererTypeForAnimationContext:(id)a3
{
  return 2;
}

- (CATransform3D)p_mvpMatrixWithTexture:(SEL)a3 direction:(id)a4 percent:(unint64_t)a5 colorIndex:(double)a6
{
  int v7 = a7;
  id v11 = a4;
  TSUReverseSquare();
  double v13 = v12;
  [v11 size];
  double v15 = v14;
  double v17 = v16;
  TSUSineMap();
  double v19 = v18;
  TSUSineMap();
  double v21 = v20;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  mAnimationContext = self->super.mAnimationContext;
  if (mAnimationContext) {
    [(KNAnimationContext *)mAnimationContext slideProjectionMatrix];
  }
  else {
    memset(&v84, 0, sizeof(v84));
  }
  unint64_t v23 = a5 - 11;
  double v24 = sin(v13 * -2.0 * 3.14159265);
  [v11 offset];
  CGFloat v26 = v25;
  [v11 offset];
  CATransform3DTranslate(retstr, &v84, v26, v27, 0.0);
  double v28 = 1.0;
  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 0xC) {
    double v28 = -1.0;
  }
  if (v23 >= 2) {
    double v29 = v17;
  }
  else {
    double v29 = v15;
  }
  double v30 = v21 * 180.0 * 0.0174532925;
  double v31 = v13 * v24 * v29;
  long long v32 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v82.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v82.m33 = v32;
  double v33 = v29 * v19 * 0.25;
  long long v34 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v82.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v82.m43 = v34;
  long long v35 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v82.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v82.m13 = v35;
  long long v36 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v82.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v82.m23 = v36;
  if (v23 >= 2) {
    double v37 = v28;
  }
  else {
    double v37 = 0.0;
  }
  if (v23 >= 2) {
    double v38 = 0.0;
  }
  else {
    double v38 = v28;
  }
  CATransform3DTranslate(&v83, &v82, 0.0, 0.0, v31);
  long long v39 = *(_OWORD *)&v83.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v83.m31;
  *(_OWORD *)&retstr->m33 = v39;
  long long v40 = *(_OWORD *)&v83.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v83.m41;
  *(_OWORD *)&retstr->m43 = v40;
  long long v41 = *(_OWORD *)&v83.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v83.m11;
  *(_OWORD *)&retstr->m13 = v41;
  long long v42 = *(_OWORD *)&v83.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v83.m21;
  *(_OWORD *)&retstr->m23 = v42;
  [v11 size:*(_OWORD *)&v82.m11, *(_OWORD *)&v82.m13, *(_OWORD *)&v82.m21, *(_OWORD *)&v82.m23, *(_OWORD *)&v82.m31, *(_OWORD *)&v82.m33, *(_OWORD *)&v82.m41, *(_OWORD *)&v82.m43];
  CGFloat v44 = v43 * 0.5;
  [v11 size];
  long long v46 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v82.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v82.m33 = v46;
  long long v47 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v82.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v82.m43 = v47;
  long long v48 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v82.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v82.m13 = v48;
  long long v49 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v82.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v82.m23 = v49;
  CATransform3DTranslate(&v83, &v82, v44, v45 * 0.5, 0.0);
  long long v50 = *(_OWORD *)&v83.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v83.m31;
  *(_OWORD *)&retstr->m33 = v50;
  long long v51 = *(_OWORD *)&v83.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v83.m41;
  *(_OWORD *)&retstr->m43 = v51;
  long long v52 = *(_OWORD *)&v83.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v83.m11;
  *(_OWORD *)&retstr->m13 = v52;
  long long v53 = *(_OWORD *)&v83.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v83.m21;
  *(_OWORD *)&retstr->m23 = v53;
  long long v54 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v82.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v82.m33 = v54;
  long long v55 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v82.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v82.m43 = v55;
  long long v56 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v82.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v82.m13 = v56;
  long long v57 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v82.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v82.m23 = v57;
  CATransform3DRotate(&v83, &v82, v30, v37, v38, 0.0);
  long long v58 = *(_OWORD *)&v83.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v83.m31;
  *(_OWORD *)&retstr->m33 = v58;
  long long v59 = *(_OWORD *)&v83.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v83.m41;
  *(_OWORD *)&retstr->m43 = v59;
  long long v60 = *(_OWORD *)&v83.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v83.m11;
  *(_OWORD *)&retstr->m13 = v60;
  long long v61 = *(_OWORD *)&v83.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v83.m21;
  *(_OWORD *)&retstr->m23 = v61;
  long long v62 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v82.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v82.m33 = v62;
  long long v63 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v82.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v82.m43 = v63;
  long long v64 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v82.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v82.m13 = v64;
  long long v65 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v82.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v82.m23 = v65;
  CATransform3DTranslate(&v83, &v82, 0.0, 0.0, v33 * (double)(v7 - 1));
  long long v66 = *(_OWORD *)&v83.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v83.m31;
  *(_OWORD *)&retstr->m33 = v66;
  long long v67 = *(_OWORD *)&v83.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v83.m41;
  *(_OWORD *)&retstr->m43 = v67;
  long long v68 = *(_OWORD *)&v83.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v83.m11;
  *(_OWORD *)&retstr->m13 = v68;
  long long v69 = *(_OWORD *)&v83.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v83.m21;
  *(_OWORD *)&retstr->m23 = v69;
  [v11 size];
  CGFloat v71 = v70 * -0.5;
  [v11 size];
  long long v73 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v82.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v82.m33 = v73;
  long long v74 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v82.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v82.m43 = v74;
  long long v75 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v82.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v82.m13 = v75;
  long long v76 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v82.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v82.m23 = v76;
  CATransform3DTranslate(&v83, &v82, v71, v72 * -0.5, 0.0);
  long long v77 = *(_OWORD *)&v83.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v83.m31;
  *(_OWORD *)&retstr->m33 = v77;
  long long v78 = *(_OWORD *)&v83.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v83.m41;
  *(_OWORD *)&retstr->m43 = v78;
  long long v79 = *(_OWORD *)&v83.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v83.m11;
  *(_OWORD *)&retstr->m13 = v79;
  long long v80 = *(_OWORD *)&v83.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v83.m21;
  *(_OWORD *)&retstr->m23 = v80;

  return result;
}

- (void)p_drawWithMetalContext:(id)a3 renderEncoder:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 metalContext];
  id v9 = [v8 currentBuffer];

  v10 = [v6 textures];
  id v44 = [v6 direction];
  [v6 percent];
  double v12 = v11;
  double v13 = [v10 objectAtIndexedSubscript:1];
  long long v42 = v10;
  double v14 = [v10 objectAtIndexedSubscript:0];
  double v15 = [v6 metalContext];
  double v16 = [v13 metalTextureWithContext:v15];

  double v45 = v6;
  double v17 = [v6 metalContext];
  double v43 = [v14 metalTextureWithContext:v17];

  if (v16 && v43)
  {
    int8x8_t v18 = vbic_s8(vbsl_s8((int8x8_t)vcgtd_u64(2uLL, (unint64_t)v44 - 13), (int8x8_t)0x3F80000000000000, (int8x8_t)1065353216), (int8x8_t)vcgtd_f64(0.5, v12));
    double v19 = v12 >= 0.5 ? v16 : v43;
    [v7 setFragmentTexture:v19 atIndex:0];
    *((int8x8_t *)&self[3].super.mAnimationContext + 20 * (void)v9) = v18;
    double colorCount = self->_colorCount;
    if (colorCount > 0.0)
    {
      unint64_t v21 = 0;
      v22 = (float32x4_t *)&self[1] + 10 * (void)v9;
      double v23 = 0.0;
      double v24 = &selRef_setBackgroundScrollView_;
      do
      {
        double v25 = +[TSUColor colorWithHue:v23 / colorCount saturation:1.0 brightness:1.0 alpha:1.0 / colorCount];
        [v25 redComponent];
        float64_t v48 = v26;
        [v25 greenComponent];
        float64_t v47 = v27;
        [v25 blueComponent];
        float64_t v46 = v28;
        [v25 alphaComponent];
        v29.f64[0] = v46;
        v29.f64[1] = v30;
        v31.f64[0] = v48;
        v31.f64[1] = v47;
        v22[9] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v31), v29);
        float64x2_t v72 = 0u;
        float64x2_t v73 = 0u;
        float64x2_t v70 = 0u;
        float64x2_t v71 = 0u;
        float64x2_t v68 = 0u;
        float64x2_t v69 = 0u;
        float64x2_t v66 = 0u;
        float64x2_t v67 = 0u;
        [(KNTransitionColorPlanes *)self p_mvpMatrixWithTexture:v13 direction:v44 percent:v21 colorIndex:v12];
        if ([v45 isMotionBlurred])
        {
          [(TSDMetalMotionBlurEffect *)self->_motionBlurMetalEffect velocityScale];
          v33.f64[1] = v32;
          *(float32x2_t *)v22[8].f32 = vcvt_f32_f64(v33);
          motionBlurMetalEffect = self->_motionBlurMetalEffect;
          if (motionBlurMetalEffect)
          {
            float64x2_t v54 = v70;
            float64x2_t v55 = v71;
            float64x2_t v56 = v72;
            float64x2_t v57 = v73;
            float64x2_t v50 = v66;
            float64x2_t v51 = v67;
            float64x2_t v52 = v68;
            float64x2_t v53 = v69;
            [(TSDMetalMotionBlurEffect *)motionBlurMetalEffect adjustTransformForMotionBlurBuffer:&v50];
          }
          else
          {
            float64x2_t v64 = 0u;
            float64x2_t v65 = 0u;
            float64x2_t v62 = 0u;
            float64x2_t v63 = 0u;
            float64x2_t v60 = 0u;
            float64x2_t v61 = 0u;
            float64x2_t v58 = 0u;
            float64x2_t v59 = 0u;
          }
          float64x2_t v70 = v62;
          float64x2_t v71 = v63;
          float64x2_t v72 = v64;
          float64x2_t v73 = v65;
          float64x2_t v66 = v58;
          float64x2_t v67 = v59;
          float64x2_t v68 = v60;
          float64x2_t v69 = v61;
          [v45 duration];
          TSUClamp();
          float64x2_t v64 = 0u;
          float64x2_t v65 = 0u;
          float64x2_t v62 = 0u;
          float64x2_t v63 = 0u;
          float64x2_t v60 = 0u;
          float64x2_t v61 = 0u;
          float64x2_t v58 = 0u;
          float64x2_t v59 = 0u;
          -[KNTransitionColorPlanes p_mvpMatrixWithTexture:direction:percent:colorIndex:](self, "p_mvpMatrixWithTexture:direction:percent:colorIndex:", v13, v44, v21);
          long long v35 = self->_motionBlurMetalEffect;
          if (v35)
          {
            v49[4] = v62;
            v49[5] = v63;
            v49[6] = v64;
            v49[7] = v65;
            v49[0] = v58;
            v49[1] = v59;
            v49[2] = v60;
            v49[3] = v61;
            [(TSDMetalMotionBlurEffect *)v35 adjustTransformForMotionBlurBuffer:v49];
          }
          else
          {
            float64x2_t v56 = 0u;
            float64x2_t v57 = 0u;
            float64x2_t v54 = 0u;
            float64x2_t v55 = 0u;
            float64x2_t v52 = 0u;
            float64x2_t v53 = 0u;
            float64x2_t v50 = 0u;
            float64x2_t v51 = 0u;
          }
          double v24 = &selRef_setBackgroundScrollView_;
          float64x2_t v58 = v50;
          float64x2_t v59 = v51;
          float64x2_t v64 = v56;
          float64x2_t v65 = v57;
          float64x2_t v62 = v54;
          float64x2_t v63 = v55;
          float64x2_t v60 = v52;
          float64x2_t v61 = v53;
          float32x4_t v36 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v52), v53);
          float32x4_t v37 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v54), v55);
          float32x4_t v38 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v56), v57);
          v22[4] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v50), v51);
          v22[5] = v36;
          v22[6] = v37;
          v22[7] = v38;
        }
        float32x4_t v39 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v68), v69);
        float32x4_t v40 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v70), v71);
        float32x4_t v41 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v72), v73);
        float32x4_t *v22 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v66), v67);
        v22[1] = v39;
        v22[2] = v40;
        v22[3] = v41;
        [v7 setVertexBytes:v22 length:160 atIndex:1];
        [*(id *)((char *)&self->super.super.isa + *((int *)v24 + 646)) setPipelineStateWithEncoder:v7 vertexBytes:v22];
        [(TSDMTLDataBuffer *)self->_metalColorDataBuffer drawWithEncoder:v7 atIndex:0];

        double v23 = (double)++v21;
        double colorCount = self->_colorCount;
      }
      while (colorCount > (double)v21);
    }
  }
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v35 = a3;
  CFStringRef v4 = [v35 textures];
  v5 = [v4 objectAtIndexedSubscript:0];
  id v6 = [v35 metalContext];
  id v7 = [v6 device];

  v8 = [v35 metalContext];
  id v9 = [v8 pixelFormat];

  id v10 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v10 setPixelFormat:v9];
  [v10 setBlendingEnabled:1];
  [v10 setDestinationRGBBlendFactor:1];
  [v10 setDestinationAlphaBlendFactor:1];
  id v11 = 0;
  if ([v35 isMotionBlurred])
  {
    id v11 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    [v11 setPixelFormat:v9];
    [v11 setDestinationRGBBlendFactor:1];
    [v11 setDestinationAlphaBlendFactor:5];
    id v12 = objc_alloc((Class)TSDMetalMotionBlurEffect);
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v14 = v13;
    double v16 = v15;
    [(KNAnimationContext *)self->super.mAnimationContext slideRect];
    double v18 = v17;
    double v20 = v19;
    unint64_t v21 = [v35 randomGenerator];
    v22 = [v35 metalContext];
    double v23 = [v12 initWithFramebufferSize:v21 slideSize:v22 randomGenerator:v14 metalContext:v16, v18, v20];
    motionBlurMetalEffect = self->_motionBlurMetalEffect;
    self->_motionBlurMetalEffect = v23;
  }
  unsigned int v25 = [v35 isMotionBlurred];
  double v26 = @"transitionColorPlanesVertexShader";
  if (v25) {
    double v26 = @"transitionColorPlanesMBVertexShader";
  }
  double v27 = v26;
  unsigned int v28 = [v35 isMotionBlurred];
  float64x2_t v29 = @"transitionColorPlanesFragmentShader";
  if (v28) {
    float64x2_t v29 = @"transitionColorPlanesMBFragmentShader";
  }
  float64_t v30 = v29;
  float64x2_t v31 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:v27 fragmentShader:v30 device:v7 library:@"KeynoteMetalLibrary" colorAttachment:v10 velocityAttachment:v11];

  metalShader = self->_metalShader;
  self->_metalShader = v31;

  [v5 size];
  TSDRectWithSize();
  float64x2_t v33 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v7);
  metalColorDataBuffer = self->_metalColorDataBuffer;
  self->_metalColorDataBuffer = v33;
}

- (void)renderFrameWithContext:(id)a3
{
  id v14 = a3;
  CFStringRef v4 = [v14 metalContext];
  v5 = [v4 renderEncoder];
  if (!v5)
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    id v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNTransitionColorPlanes renderFrameWithContext:]");
    v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Transitions/KNTransitionColorPlanes.m"];
    [v6 handleFailureInFunction:v7 file:v8 lineNumber:294 description:@"invalid nil value for '%s'", "workingEncoder"];
  }
  if ([v14 isMotionBlurred])
  {
    motionBlurMetalEffect = self->_motionBlurMetalEffect;
    id v10 = [v14 metalContext];
    uint64_t v11 = [(TSDMetalMotionBlurEffect *)motionBlurMetalEffect bindColorAndVelocityWithMetalContext:v10 shouldFillBackground:0];

    v5 = (void *)v11;
  }
  [(KNTransitionColorPlanes *)self p_drawWithMetalContext:v14 renderEncoder:v5];
  if ([v14 isMotionBlurred])
  {
    id v12 = self->_motionBlurMetalEffect;
    double v13 = [v4 renderEncoder];
    [(TSDMetalMotionBlurEffect *)v12 drawResultWithWorkingRenderEncoder:v5 destinationRenderEncoder:v13];
  }
}

+ (void)upgradeAttributes:(id *)a3 animationName:(id)a4 warning:(id *)a5 type:(int)a6 isFromClassic:(BOOL)a7 version:(unint64_t)a8
{
  if (a6 == 3 && a8 <= 0x174876E7FFLL && a7)
  {
    id v10 = [*a3 mutableCopy];
    *a3 = v10;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalColorDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalShader, 0);

  objc_storeStrong((id *)&self->_motionBlurMetalEffect, 0);
}

@end