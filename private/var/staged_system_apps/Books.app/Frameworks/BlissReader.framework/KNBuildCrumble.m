@interface KNBuildCrumble
+ (BOOL)requiresSingleTexturePerStage;
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
+ (void)downgradeAttributes:(id *)a3 animationName:(id *)a4 warning:(id *)a5 type:(int)a6 isToClassic:(BOOL)a7 version:(unint64_t)a8;
- (CGRect)frameOfEffectWithContext:(id)a3;
- (KNBuildCrumble)initWithAnimationContext:(id)a3;
- (id)p_texturedRectFromImagePath:(id)a3 metalContext:(id)a4;
- (void)animationWillBeginWithContext:(id)a3;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalRenderFrameWithContext:(id)a3;
- (void)metalTeardownAnimationsWithContext:(id)a3;
- (void)p_setupMVPMatricesWithContext:(id)a3 device:(id)a4;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNBuildCrumble

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.Crumble";
}

+ (int)animationCategory
{
  return 203;
}

+ (id)animationFilter
{
  return kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_499AB8;
}

+ (id)defaultAttributes
{
  CFStringRef v4 = @"KNBuildAttributesDuration";
  v5 = &off_498FE8;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"anim-icons-builds-crumble";
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

- (KNBuildCrumble)initWithAnimationContext:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)KNBuildCrumble;
  v3 = [(KNAnimationEffect *)&v9 initWithAnimationContext:a3];
  if (v3)
  {
    CFStringRef v4 = KNBundle();
    v5 = [v4 pathForResource:@"Crumble" ofType:@"parameterGroup"];

    uint64_t v6 = +[KNAnimParameterGroup parameterGroupForFile:v5];
    parameterGroup = v3->_parameterGroup;
    v3->_parameterGroup = (KNAnimParameterGroup *)v6;
  }
  return v3;
}

- (CGRect)frameOfEffectWithContext:(id)a3
{
  CFStringRef v4 = [a3 textures];
  v5 = [v4 objectAtIndexedSubscript:0];
  [v5 contentRect];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  CGRectGetMinX(v26);
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  CGRectGetMinY(v27);
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  CGRectGetMaxX(v28);
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  CGRectGetMaxY(v30);
  TSDRectWithPoints();
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  v34.origin.x = v22;
  v34.origin.y = v23;
  v34.size.width = v24;
  v34.size.height = v25;
  v31.origin.x = v15;
  v31.origin.y = v17;
  v31.size.width = v19;
  v31.size.height = v21;
  CGRect v32 = CGRectIntersection(v31, v34);
  CGRect result = CGRectIntegral(v32);
  self->_animationRect = result;
  self->_drawableFrame.origin.x = v7;
  self->_drawableFrame.origin.y = v9;
  self->_drawableFrame.size.width = v11;
  self->_drawableFrame.size.height = v13;
  return result;
}

- (void)p_setupMVPMatricesWithContext:(id)a3 device:(id)a4
{
  v5 = [a3 textures];
  double v6 = [v5 firstObject];

  [v6 frameOnCanvas];
  CGFloat v8 = v7 - CGRectGetMinX(self->_animationRect);
  [v6 frameOnCanvas];
  double v10 = v9 - CGRectGetMaxY(self->_animationRect);
  double height = self->_animationRect.size.height;
  [(KNAnimationContext *)self->super.mAnimationContext fieldOfViewInRadians];
  long double v13 = tan(v12 * 0.5);
  long double v14 = height / (v13 + v13);
  memset(&v29, 0, sizeof(v29));
  [(KNAnimationContext *)self->super.mAnimationContext fieldOfViewInRadians];
  TSDTransform3DMakeProjection();
  memset(&v28, 0, sizeof(v28));
  CATransform3DMakeTranslation(&v28, self->_animationRect.size.width * -0.5, self->_animationRect.size.height * -0.5, -v14);
  memset(&v27, 0, sizeof(v27));
  CATransform3DMakeTranslation(&v27, v8, -v10, 0.0);
  p_projectionMatrix = &self->_projectionMatrix;
  CATransform3D a = v28;
  CATransform3D v24 = v29;
  CATransform3DConcat(&b, &a, &v24);
  CATransform3D v24 = v27;
  CATransform3DConcat(&a, &v24, &b);
  self = (KNBuildCrumble *)((char *)self + 496);
  long long v16 = *(_OWORD *)&a.m33;
  *(_OWORD *)&p_projectionMatrix->m31 = *(_OWORD *)&a.m31;
  *(_OWORD *)&p_projectionMatrix->m33 = v16;
  long long v17 = *(_OWORD *)&a.m43;
  *(_OWORD *)&p_projectionMatrix->m41 = *(_OWORD *)&a.m41;
  *(_OWORD *)&p_projectionMatrix->m43 = v17;
  long long v18 = *(_OWORD *)&a.m13;
  *(_OWORD *)&p_projectionMatrix->m11 = *(_OWORD *)&a.m11;
  *(_OWORD *)&p_projectionMatrix->m13 = v18;
  long long v19 = *(_OWORD *)&a.m23;
  *(_OWORD *)&p_projectionMatrix->m21 = *(_OWORD *)&a.m21;
  *(_OWORD *)&p_projectionMatrix->m23 = v19;
  TSDTransform3DMakeOrtho();
  long long v20 = *(_OWORD *)&a.m33;
  *(_OWORD *)&self->_crumbleUniforms.Percent = *(_OWORD *)&a.m31;
  *(_OWORD *)&self->_crumbleUniforms.Gravity = v20;
  long long v21 = *(_OWORD *)&a.m43;
  *(_OWORD *)&self->_crumbleUniforms.CrackStartTime = *(_OWORD *)&a.m41;
  *(_OWORD *)&self->_anon_68[8] = v21;
  long long v22 = *(_OWORD *)&a.m13;
  self->super = *(KNAnimationEffect *)&a.m11;
  *(_OWORD *)&self->_parameterGroup = v22;
  long long v23 = *(_OWORD *)&a.m23;
  *(_OWORD *)&self->_shadowShatterSystem = *(_OWORD *)&a.m21;
  *(_OWORD *)&self->_metalSmokeTexture = v23;
}

- (void)animationWillBeginWithContext:(id)a3
{
  id v4 = a3;
  [(KNBuildCrumble *)self frameOfEffectWithContext:v4];
  [(KNBuildCrumble *)self metalPrepareAnimationWithContext:v4];
}

- (void)renderFrameWithContext:(id)a3
{
}

- (id)p_texturedRectFromImagePath:(id)a3 metalContext:(id)a4
{
  id v5 = a4;
  double v6 = +[TSUImage imageWithContentsOfFile:a3];
  id v7 = [v6 CGImage];

  id v8 = [objc_alloc((Class)TSDTexturedRectangle) initWithCGImage:v7];
  double v9 = [v5 device];

  [v8 setupMetalTextureForDevice:v9];

  return v8;
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 textures];
  v127 = [v4 animatedBuild];
  double v6 = [v4 metalContext];
  uint64_t v7 = [v6 device];
  if ([v5 count] != (char *)&dword_0 + 1)
  {
    id v8 = +[TSUAssertionHandler currentHandler];
    double v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildCrumble metalPrepareAnimationWithContext:]");
    double v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildCrumble.m"];
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 368, @"Effect expects one texture. Passed (%lu) textures.", objc_msgSend(v5, "count"));
  }
  v126 = v5;
  v128 = [v5 lastObject];
  CGFloat v11 = KNBundle();
  uint64_t v12 = [v11 pathForResource:@"KNBuildAnvil-Smoke" ofType:@"png"];

  v124 = (void *)v12;
  long double v13 = [(KNBuildCrumble *)self p_texturedRectFromImagePath:v12 metalContext:v6];
  metalSmokeTexture = self->_metalSmokeTexture;
  self->_metalSmokeTexture = v13;

  [(KNBuildCrumble *)self frameOfEffectWithContext:v4];
  [(KNBuildCrumble *)self p_setupMVPMatricesWithContext:v4 device:v7];
  __asm { FMOV            V1.2D, #0.5 }
  self->_shadowFboSize = (CGSize)vrndaq_f64(vmulq_f64((float64x2_t)self->_animationRect.size, _Q1));
  id v20 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v20 setPixelFormat:[v6 pixelFormat]];
  long long v21 = [objc_alloc((Class)TSDMetalRenderTarget) initWithSize:v6 metalContext:self->_shadowFboSize.width, self->_shadowFboSize.height];
  shadowRenderTarget = self->_shadowRenderTarget;
  self->_shadowRenderTarget = v21;

  id v23 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v23 setPixelFormat:[v6 pixelFormat]];
  [v23 setBlendingEnabled:1];
  [v23 setSourceRGBBlendFactor:1];
  [v23 setSourceAlphaBlendFactor:1];
  [v23 setDestinationRGBBlendFactor:5];
  [v23 setDestinationAlphaBlendFactor:5];
  CATransform3D v24 = [objc_alloc((Class)TSDMetalRenderTarget) initWithSize:v6 metalContext:self->_shadowFboSize.width, self->_shadowFboSize.height];
  blurRenderTarget = self->_blurRenderTarget;
  self->_blurRenderTarget = v24;

  id v26 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  objc_msgSend(v26, "setPixelFormat:", objc_msgSend(v6, "pixelFormat"));
  [v26 setBlendingEnabled:1];
  [v26 setSourceRGBBlendFactor:1];
  [v26 setSourceAlphaBlendFactor:1];
  [v26 setDestinationRGBBlendFactor:5];
  [v26 setDestinationAlphaBlendFactor:5];
  v123 = v20;
  CATransform3D v27 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildCrumbleVertexShader" fragmentShader:@"buildCrumbleFragmentShader" device:v7 library:@"KeynoteMetalLibrary" colorAttachment:v20];
  metalShadowShatterSystemShader = self->_metalShadowShatterSystemShader;
  self->_metalShadowShatterSystemShader = v27;

  CATransform3D v29 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildCrumbleVertexShader" fragmentShader:@"buildCrumbleFragmentShader" device:v7 library:@"KeynoteMetalLibrary" colorAttachment:v26];
  metalShatterSystemShader = self->_metalShatterSystemShader;
  self->_metalShatterSystemShader = v29;

  CGRect v31 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildCrumbleSmokeVertexShader" fragmentShader:@"buildCrumbleSmokeFragmentShader" device:v7 library:@"KeynoteMetalLibrary" colorAttachment:v26];
  metalSmokeSystemShader = self->_metalSmokeSystemShader;
  self->_metalSmokeSystemShader = v31;

  v122 = v23;
  v33 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultGaussianBlurShaderWithDevice:v7 colorAttachment:v23 halfSizedRadius:0];
  metalBlurShader = self->_metalBlurShader;
  self->_metalBlurShader = v33;

  TSDRectWithSize();
  v125 = (void *)v7;
  v35 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:textureFlipped:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:textureFlipped:device:", 1, v7);
  metalBlurDataBuffer = self->_metalBlurDataBuffer;
  self->_metalBlurDataBuffer = v35;

  [v128 frame];
  double v38 = v37;
  double v40 = v39;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v42 = v41;
  double v44 = v43;
  [v4 duration];
  double v119 = v45;
  v46 = (char *)[v4 direction];
  if ([v127 isBuildIn])
  {
    v47 = v4;
  }
  else
  {
    v47 = v4;
    switch((unint64_t)v46)
    {
      case 0xBuLL:
        v46 = (char *)&dword_C;
        break;
      case 0xCuLL:
        v46 = (unsigned char *)(&dword_8 + 3);
        break;
      case 0xDuLL:
        v46 = (unsigned char *)(&dword_C + 2);
        break;
      case 0xEuLL:
        v46 = (unsigned char *)(&dword_C + 1);
        break;
      case 0xFuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x19uLL:
      case 0x1AuLL:
      case 0x1BuLL:
      case 0x1CuLL:
      case 0x1DuLL:
      case 0x1EuLL:
      case 0x21uLL:
      case 0x22uLL:
      case 0x23uLL:
      case 0x24uLL:
      case 0x25uLL:
      case 0x26uLL:
      case 0x27uLL:
      case 0x28uLL:
        break;
      case 0x15uLL:
        v46 = (char *)&dword_18;
        break;
      case 0x16uLL:
        v46 = (unsigned char *)(&dword_14 + 3);
        break;
      case 0x17uLL:
        v46 = (unsigned char *)(&dword_14 + 2);
        break;
      case 0x18uLL:
        v46 = (unsigned char *)(&dword_14 + 1);
        break;
      case 0x1FuLL:
        v46 = (unsigned char *)&stru_20;
        break;
      case 0x20uLL:
        v46 = (unsigned char *)(&dword_1C + 3);
        break;
      case 0x29uLL:
        v46 = (unsigned char *)(&stru_20 + 10);
        break;
      case 0x2AuLL:
        v46 = (unsigned char *)(&stru_20 + 9);
        break;
      case 0x2BuLL:
        v46 = (unsigned char *)(&stru_20 + 12);
        break;
      case 0x2CuLL:
        v46 = (unsigned char *)(&stru_20 + 11);
        break;
      default:
        switch((unint64_t)v46)
        {
          case 'o':
            v46 = (unsigned char *)(&stru_68 + 8);
            break;
          case 'p':
            v46 = (unsigned char *)(&stru_68 + 7);
            break;
          case 'r':
            v46 = (unsigned char *)(&stru_68 + 11);
            break;
          case 's':
            v46 = (unsigned char *)(&stru_68 + 10);
            break;
          case 'y':
            v46 = (unsigned char *)(&stru_68 + 18);
            break;
          case 'z':
            v46 = (unsigned char *)(&stru_68 + 17);
            break;
          default:
            goto LABEL_5;
        }
        break;
    }
  }
LABEL_5:
  double v48 = sqrt(sqrt(v38 * (v40 / v44) / v42));
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Smoke Particles Count"];
  double v115 = v48 * v49;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Crumble Points"];
  unint64_t v51 = (unint64_t)(v48 * v50);
  [(TSDTexturedRectangle *)self->_metalSmokeTexture size];
  if (v42 >= v44) {
    double v52 = v44;
  }
  else {
    double v52 = v42;
  }
  double v117 = v52;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Smoke Scale Begin"];
  TSDMultiplySizeScalar();
  double v113 = v54;
  double v114 = v53;
  [v128 size];
  double v56 = v55;
  double v58 = v57;
  v59 = self->_metalShatterSystemShader;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Crumble Cells Split"];
  double v61 = v60;
  v62 = v47;
  v63 = [v47 randomGenerator];
  v64 = +[KNBuildCrumbleSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:shader:percentOfCellsToSplit:randomGenerator:metalContext:](KNBuildCrumbleSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:shader:percentOfCellsToSplit:randomGenerator:metalContext:", v51, v46, v59, v63, v6, v56, v58, v42, v44, v119, v61);
  shatterSystem = self->_shatterSystem;
  self->_shatterSystem = v64;

  double v66 = (double)[(KNBuildCrumbleSystem *)self->_shatterSystem triangleCount];
  [v128 size];
  double v68 = v67;
  double v70 = v69;
  v71 = [v62 randomGenerator];
  double height = CGSizeZero.height;
  v73 = (KNBuildShadowSystem *)+[KNBuildShadowSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildShadowSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v46, v71, self->_metalShadowShatterSystemShader, v6, CGSizeZero.width, height, v66, 1.0, v68, v70, v42, v44, *(void *)&v119);
  shadowShatterSystem = self->_shadowShatterSystem;
  self->_shadowShatterSystem = v73;

  [v128 size];
  double v76 = v75;
  double v78 = v77;
  v79 = [v62 randomGenerator];
  v80 = (KNBuildSmokeSystem *)+[KNBuildSmokeSystem newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildSmokeSystem, "newParticleSystemWithParticleSize:particleSystemSize:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", v46, v79, self->_metalSmokeSystemShader, v6, v114, v113, (double)(unint64_t)v115, 1.0, v76, v78, v42, v44, *(void *)&v119);
  smokeSystem = self->_smokeSystem;
  self->_smokeSystem = v80;

  [(KNBuildShadowSystem *)self->_shadowShatterSystem setCrumbleSystem:self->_shatterSystem];
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Rotation Max"];
  [(KNBuildCrumbleSystem *)self->_shatterSystem setRotationMax:v82 * 0.0174532925];
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"LifeSpan Randomness"];
  -[KNBuildCrumbleSystem setLifeSpanRandomness:](self->_shatterSystem, "setLifeSpanRandomness:");
  if (v46 == (unsigned char *)&stru_20.maxprot + 3) {
    CFStringRef v83 = @"LifeSpan Delay For Random";
  }
  else {
    CFStringRef v83 = @"LifeSpan Delay";
  }
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:v83];
  -[KNBuildCrumbleSystem setLifeSpanDelay:](self->_shatterSystem, "setLifeSpanDelay:");
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Crumble Speed Max"];
  [(KNBuildCrumbleSystem *)self->_shatterSystem setSpeedMax:v117 * v84];
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Crumble Speed Max Limiter"];
  -[KNBuildCrumbleSystem setSpeedMaxLimiter:](self->_shatterSystem, "setSpeedMaxLimiter:");
  -[KNBuildCrumbleSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self->_shatterSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, height);
  [(KNBuildCrumbleSystem *)self->_shatterSystem rotationMax];
  -[KNBuildShadowSystem setRotationMax:](self->_shadowShatterSystem, "setRotationMax:");
  [(KNBuildCrumbleSystem *)self->_shatterSystem lifeSpanRandomness];
  -[KNBuildShadowSystem setLifeSpanRandomness:](self->_shadowShatterSystem, "setLifeSpanRandomness:");
  [(KNBuildCrumbleSystem *)self->_shatterSystem lifeSpanDelay];
  -[KNBuildShadowSystem setLifeSpanDelay:](self->_shadowShatterSystem, "setLifeSpanDelay:");
  [(KNBuildCrumbleSystem *)self->_shatterSystem speedMax];
  -[KNBuildShadowSystem setSpeedMax:](self->_shadowShatterSystem, "setSpeedMax:");
  [(KNBuildCrumbleSystem *)self->_shatterSystem speedMaxLimiter];
  -[KNBuildShadowSystem setSpeedMaxLimiter:](self->_shadowShatterSystem, "setSpeedMaxLimiter:");
  -[KNBuildShadowSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self->_shadowShatterSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, height);
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Smoke Rotation Max"];
  [(KNBuildSmokeSystem *)self->_smokeSystem setRotationMax:v85 * 0.0174532925];
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Smoke Scale Max"];
  -[KNBuildSmokeSystem setScaleMax:](self->_smokeSystem, "setScaleMax:");
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:v83];
  -[KNBuildSmokeSystem setLifeSpanDelay:](self->_smokeSystem, "setLifeSpanDelay:");
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Smoke Speed Max"];
  [(KNBuildSmokeSystem *)self->_smokeSystem setSpeedMax:v117 * v86];
  -[KNBuildSmokeSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](self->_smokeSystem, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, height);
  [(KNAnimationEffect *)self perspectiveMVPMatrixWithContext:v62];
  $C1DFD4E0A10081BF298E754D91354697 v120 = ($C1DFD4E0A10081BF298E754D91354697)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v132), v133);
  float32x4_t v118 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v134), v135);
  float32x4_t v116 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v136), v137);
  float32x4_t v121 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v138), v139);
  *(_DWORD *)&self->_anon_68[44] = 0;
  *($C1DFD4E0A10081BF298E754D91354697 *)&self->_crumbleUniforms.Percent = v120;
  *(float32x4_t *)&self->_crumbleUniforms.GravitCGFloat y = v118;
  *(float32x4_t *)&self->_crumbleUniforms.CrackStartTime = v116;
  *(float32x4_t *)&self->_anon_68[8] = v121;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  float v88 = v87 * 1.5;
  *(float *)&self->_anon_68[40] = v88;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Shadow Opacity Ramp Up"];
  *(float *)&double v89 = v89;
  *(_DWORD *)&self->_anon_68[48] = LODWORD(v89);
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Crack Amount"];
  *(float *)&double v90 = v90 / 1000.0;
  *(_DWORD *)&self->_anon_68[60] = LODWORD(v90);
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Crack Start Time"];
  *(float *)&double v91 = v91;
  *(float *)&self->_anon_68[56] = -*(float *)&v91;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Shadow Opacity"];
  *(float *)&double v92 = v92;
  *(_DWORD *)&self->_anon_68[52] = LODWORD(v92);
  [(KNBuildCrumbleSystem *)self->_shatterSystem rotationMax];
  *(float *)&double v93 = v93;
  *(_DWORD *)&self->_anon_68[32] = LODWORD(v93);
  [(KNBuildCrumbleSystem *)self->_shatterSystem speedMax];
  *(float *)&double v94 = v94;
  *(_DWORD *)&self->_anon_68[36] = LODWORD(v94);
  *(_DWORD *)&self->_anon_d8[44] = 1065353216;
  float32x4_t v95 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m21), *(float64x2_t *)&self->_projectionMatrix.m23);
  float32x4_t v96 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m31), *(float64x2_t *)&self->_projectionMatrix.m33);
  float32x4_t v97 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m41), *(float64x2_t *)&self->_projectionMatrix.m43);
  *(float32x4_t *)&self->_crumbleShadowUniforms.Percent = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_projectionMatrix.m11), *(float64x2_t *)&self->_projectionMatrix.m13);
  *(float32x4_t *)&self->_crumbleShadowUniforms.GravitCGFloat y = v95;
  *(float32x4_t *)&self->_crumbleShadowUniforms.CrackStartTime = v96;
  *(float32x4_t *)&self->_anon_d8[8] = v97;
  *(_DWORD *)&self->_anon_d8[40] = *(_DWORD *)&self->_anon_68[40];
  *(_OWORD *)&self->_anon_d8[48] = *(_OWORD *)&self->_anon_68[48];
  *(void *)&self->_anon_d8[32] = *(void *)&self->_anon_68[32];
  self->_smokeUniforms = v120;
  *(float32x4_t *)self->_anon_130 = v118;
  *(float32x4_t *)&self->_anon_130[16] = v116;
  *(float32x4_t *)&self->_anon_130[32] = v121;
  [(KNBuildSmokeSystem *)self->_smokeSystem rotationMax];
  *(float *)&double v98 = v98;
  *(_DWORD *)&self->_anon_130[48] = LODWORD(v98);
  [(KNBuildSmokeSystem *)self->_smokeSystem speedMax];
  *(float *)&double v99 = v99;
  *(_DWORD *)&self->_anon_130[52] = LODWORD(v99);
  float32x4_t v100 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_shadowFBOProjectionMatrix.m21), *(float64x2_t *)&self->_shadowFBOProjectionMatrix.m23);
  float32x4_t v101 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_shadowFBOProjectionMatrix.m31), *(float64x2_t *)&self->_shadowFBOProjectionMatrix.m33);
  float32x4_t v102 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_shadowFBOProjectionMatrix.m41), *(float64x2_t *)&self->_shadowFBOProjectionMatrix.m43);
  *(float32x4_t *)self->_anon_340 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_shadowFBOProjectionMatrix.m11), *(float64x2_t *)&self->_shadowFBOProjectionMatrix.m13);
  *(float32x4_t *)&self->_anon_340[16] = v100;
  *(float32x4_t *)&self->_anon_340[32] = v101;
  *(float32x4_t *)&self->_anon_340[48] = v102;
  __asm { FMOV            V1.2D, #1.0 }
  self[1].super.super.isCATransform3D a = (Class)vcvt_f32_f64(vdivq_f64(_Q1, (float64x2_t)self->_animationRect.size));
  LOBYTE(self[1].super.mAnimationContext) = 0;
  v104 = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initDefaultTextureShaderWithDevice:v125 colorAttachment:v26];
  metalFboShader = self->_metalFboShader;
  self->_metalFboShader = v104;

  TSDRectWithSize();
  v106 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v125);
  metalFboDataBuffer = self->_metalFboDataBuffer;
  self->_metalFboDataBuffer = v106;

  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  memset(&v131, 0, sizeof(v131));
  TSDTransform3DMakeOrtho();
  CGFloat x = self->_animationRect.origin.x;
  CGFloat y = self->_animationRect.origin.y;
  memset(&v129, 0, sizeof(v129));
  CATransform3DTranslate(&v130, &v129, x, y, 0.0);
  CATransform3D v131 = v130;
  float32x4_t v110 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v130.m21), *(float64x2_t *)&v130.m23);
  float32x4_t v111 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v130.m31), *(float64x2_t *)&v130.m33);
  float32x4_t v112 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v130.m41), *(float64x2_t *)&v130.m43);
  *(float32x4_t *)self->_anon_300 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v130.m11), *(float64x2_t *)&v130.m13);
  *(float32x4_t *)&self->_anon_300[16] = v110;
  *(float32x4_t *)&self->_anon_300[32] = v111;
  *(float32x4_t *)&self->_anon_300[48] = v112;
}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v4 = a3;
  [v4 percent];
  double v6 = v5;
  uint64_t v7 = [v4 textures];
  id v8 = [v7 lastObject];

  [v8 singleTextureOpacity];
  double v10 = v9;
  [(KNAnimParameterGroup *)self->_parameterGroup valueForConstant:@"Smoke Opacity"];
  double v12 = v11;
  long double v13 = [v4 metalContext];
  long double v14 = [v8 metalTextureWithContext:v13];

  if (v14)
  {
    CGFloat v15 = [v4 metalContext];
    long long v16 = [v15 commandQueue];
    long long v17 = [v16 commandBuffer];

    long long v18 = [(TSDMetalRenderTarget *)self->_shadowRenderTarget passDescriptor];
    long long v19 = [v17 renderCommandEncoderWithDescriptor:v18];

    uint64_t v30 = 0;
    uint64_t v31 = 0;
    CGSize shadowFboSize = self->_shadowFboSize;
    long long v33 = xmmword_3450F0;
    [v19 setViewport:&v30];
    float v20 = v6;
    float v21 = v10;
    *(float *)&self->_anon_d8[24] = v20;
    *(float *)&self->_anon_d8[28] = v21;
    [v19 setFragmentTexture:v14 atIndex:0];
    [(TSDMetalShader *)self->_metalShadowShatterSystemShader setPipelineStateWithEncoder:v19 vertexBytes:&self->_crumbleShadowUniforms fragmentBytes:&self->_crumbleShadowUniforms];
    [(KNBuildShadowSystem *)self->_shadowShatterSystem drawMetalWithEncoder:v19];
    [v19 endEncoding];
    long long v22 = [(TSDMetalRenderTarget *)self->_blurRenderTarget passDescriptor];
    id v23 = [v17 renderCommandEncoderWithDescriptor:v22];

    uint64_t v30 = 0;
    uint64_t v31 = 0;
    CGSize shadowFboSize = self->_shadowFboSize;
    long long v33 = xmmword_3450F0;
    [v23 setViewport:&v30];
    CATransform3D v24 = [(TSDMetalRenderTarget *)self->_shadowRenderTarget texture];
    [v23 setFragmentTexture:v24 atIndex:0];

    [(TSDMetalShader *)self->_metalBlurShader setPipelineStateWithEncoder:v23 vertexBytes:self->_anon_340 fragmentBytes:&self[1]];
    [(TSDMTLDataBuffer *)self->_metalBlurDataBuffer drawWithEncoder:v23 atIndex:[(TSDMetalShader *)self->_metalBlurShader bufferIndex]];
    [v23 endEncoding];
    [v17 commit];
    CGFloat v25 = [v4 metalContext];
    id v26 = [v25 renderEncoder];

    CATransform3D v27 = [(TSDMetalRenderTarget *)self->_blurRenderTarget texture];
    [v26 setFragmentTexture:v27 atIndex:0];

    [(TSDMetalShader *)self->_metalFboShader setPipelineStateWithEncoder:v26 vertexBytes:self->_anon_300];
    [(TSDMTLDataBuffer *)self->_metalFboDataBuffer drawWithEncoder:v26 atIndex:[(TSDMetalShader *)self->_metalFboShader bufferIndex]];
    *(float *)&self->_anon_68[24] = v20;
    *(float *)&self->_anon_68[28] = v21;
    [(TSDMetalShader *)self->_metalShatterSystemShader setPipelineStateWithEncoder:v26 vertexBytes:&self->_crumbleUniforms fragmentBytes:&self->_crumbleUniforms];
    [v26 setFragmentTexture:v14 atIndex:0];
    [(KNBuildCrumbleSystem *)self->_shatterSystem drawMetalWithEncoder:v26];
    float v28 = v12;
    *(float *)&self->_anon_130[56] = v20;
    *(float *)&self->_anon_130[60] = v28;
    -[TSDMetalShader setPipelineStateWithEncoder:vertexBytes:](self->_metalSmokeSystemShader, "setPipelineStateWithEncoder:vertexBytes:", v26);
    CATransform3D v29 = [(TSDTexturedRectangle *)self->_metalSmokeTexture metalTexture];
    [v26 setFragmentTexture:v29 atIndex:0];

    [(KNBuildSmokeSystem *)self->_smokeSystem drawMetalWithEncoder:v26];
  }
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  metalShatterSystemShader = self->_metalShatterSystemShader;
  self->_metalShatterSystemShader = 0;

  metalShadowShatterSystemShader = self->_metalShadowShatterSystemShader;
  self->_metalShadowShatterSystemShader = 0;

  metalSmokeSystemShader = self->_metalSmokeSystemShader;
  self->_metalSmokeSystemShader = 0;

  metalFboShader = self->_metalFboShader;
  self->_metalFboShader = 0;

  metalFboDataBuffer = self->_metalFboDataBuffer;
  self->_metalFboDataBuffer = 0;

  metalBlurShader = self->_metalBlurShader;
  self->_metalBlurShader = 0;

  metalBlurDataBuffer = self->_metalBlurDataBuffer;
  self->_metalBlurDataBuffer = 0;

  shadowRenderTarget = self->_shadowRenderTarget;
  self->_shadowRenderTarget = 0;

  blurRenderTarget = self->_blurRenderTarget;
  self->_blurRenderTarget = 0;

  metalSmokeTexture = self->_metalSmokeTexture;

  [(TSDTexturedRectangle *)metalSmokeTexture teardown];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurRenderTarget, 0);
  objc_storeStrong((id *)&self->_shadowRenderTarget, 0);
  objc_storeStrong((id *)&self->_metalBlurDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalBlurShader, 0);
  objc_storeStrong((id *)&self->_metalFboDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalFboShader, 0);
  objc_storeStrong((id *)&self->_metalSmokeSystemShader, 0);
  objc_storeStrong((id *)&self->_metalShadowShatterSystemShader, 0);
  objc_storeStrong((id *)&self->_metalShatterSystemShader, 0);
  objc_storeStrong((id *)&self->_metalSmokeTexture, 0);
  objc_storeStrong((id *)&self->_smokeSystem, 0);
  objc_storeStrong((id *)&self->_shadowShatterSystem, 0);
  objc_storeStrong((id *)&self->_shatterSystem, 0);

  objc_storeStrong((id *)&self->_parameterGroup, 0);
}

@end