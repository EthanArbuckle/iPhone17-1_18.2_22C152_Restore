@interface KNBuildDiffuse
+ (BOOL)requiresSingleTexturePerStage;
+ (id)animationFilter;
+ (id)animationName;
+ (id)defaultAttributes;
+ (id)supportedTypes;
+ (id)thumbnailImageNameForType:(int)a3;
+ (int)animationCategory;
- (CGRect)frameOfEffectWithFrame:(CGRect)a3 context:(id)a4;
- (void)dealloc;
- (void)metalPrepareAnimationWithContext:(id)a3;
- (void)metalRenderFrameWithContext:(id)a3;
- (void)metalTeardownAnimationsWithContext:(id)a3;
- (void)p_setupParticleSystemWithImage:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6;
- (void)renderFrameWithContext:(id)a3;
@end

@implementation KNBuildDiffuse

+ (id)animationName
{
  return @"com.apple.iWork.Keynote.KLNDiffuse";
}

+ (int)animationCategory
{
  return 203;
}

+ (id)animationFilter
{
  return (id)kTSDAnimationFilterStandard;
}

+ (id)supportedTypes
{
  return &off_499848;
}

+ (id)defaultAttributes
{
  v2 = +[NSNumber numberWithDouble:2.0];

  return +[NSDictionary dictionaryWithObject:v2 forKey:@"KNBuildAttributesDuration"];
}

+ (id)thumbnailImageNameForType:(int)a3
{
  return @"kn-mac-anim-icons-builds-diffuse";
}

+ (BOOL)requiresSingleTexturePerStage
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KNBuildDiffuse;
  [(KNBuildDiffuse *)&v3 dealloc];
}

- (CGRect)frameOfEffectWithFrame:(CGRect)a3 context:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = self;
  self->mDrawableFrame = a3;
  CGRectGetMinX(a3);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  CGRectGetMinY(v9);
  v10.origin.CGFloat x = x;
  v10.origin.CGFloat y = y;
  v10.size.CGFloat width = width;
  v10.size.CGFloat height = height;
  CGRectGetMaxX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetMaxY(v11);
  [(KNAnimationContext *)v8->super.mAnimationContext slideRect];
  CGRectGetMinY(v12);
  [(KNAnimationContext *)v8->super.mAnimationContext slideRect];
  CGRectGetMaxY(v13);
  [(KNAnimationContext *)v8->super.mAnimationContext slideRect];
  CGRectGetMinX(v14);
  [(KNAnimationContext *)v8->super.mAnimationContext slideRect];
  CGRectGetMaxX(v15);
  v8 = (KNBuildDiffuse *)((char *)v8 + 272);
  TSDRectWithPoints();
  *(CGRect *)&v8->super.super.isa = v16;
  CGRect result = CGRectIntegral(v16);
  *(CGRect *)&v8->super.super.isa = result;
  return result;
}

- (void)renderFrameWithContext:(id)a3
{
}

- (void)p_setupParticleSystemWithImage:(id)a3 build:(id)a4 randomGenerator:(id)a5 metalContext:(id)a6
{
  if (!a5) {
    [TSUAssertionHandler currentHandler] handleFailureInFunction:[NSString stringWithUTF8String:"-[KNBuildDiffuse p_setupParticleSystemWithImage:build:randomGenerator:metalContext:]"] file:[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildDiffuse.m"] lineNumber:160 description:@"invalid nil value for '%s'", "randGen"];
  }
  [a3 frame];
  double v12 = v11;
  double v14 = v13;
  [(KNAnimationContext *)self->super.mAnimationContext slideRect];
  double v16 = v15;
  double v18 = v17;
  [a4 duration];
  id v19 = [a4 direction];
  if (([a4 isBuildIn] & 1) == 0)
  {
    switch((unint64_t)v19)
    {
      case 0xBuLL:
        id v19 = &dword_C;
        break;
      case 0xCuLL:
        id v19 = &dword_8 + 3;
        break;
      case 0xDuLL:
        id v19 = &dword_C + 2;
        break;
      case 0xEuLL:
        id v19 = &dword_C + 1;
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
        id v19 = &dword_18;
        break;
      case 0x16uLL:
        id v19 = &dword_14 + 3;
        break;
      case 0x17uLL:
        id v19 = &dword_14 + 2;
        break;
      case 0x18uLL:
        id v19 = &dword_14 + 1;
        break;
      case 0x1FuLL:
        id v19 = &stru_20;
        break;
      case 0x20uLL:
        id v19 = &dword_1C + 3;
        break;
      case 0x29uLL:
        id v19 = &stru_20 + 10;
        break;
      case 0x2AuLL:
        id v19 = &stru_20 + 9;
        break;
      case 0x2BuLL:
        id v19 = &stru_20 + 12;
        break;
      case 0x2CuLL:
        id v19 = &stru_20 + 11;
        break;
      default:
        switch((unint64_t)v19)
        {
          case 'o':
            id v19 = &stru_68 + 8;
            break;
          case 'p':
            id v19 = &stru_68 + 7;
            break;
          case 'r':
            id v19 = &stru_68 + 11;
            break;
          case 's':
            id v19 = &stru_68 + 10;
            break;
          case 'y':
            id v19 = &stru_68 + 18;
            break;
          case 'z':
            id v19 = &stru_68 + 17;
            break;
          default:
            goto LABEL_4;
        }
        break;
    }
  }
LABEL_4:
  [a3 size];
  v20 = (KNBuildDiffuseSystem *)+[KNBuildDiffuseSystem newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:](KNBuildDiffuseSystem, "newParticleSystemWithNumberOfParticles:objectSize:slideSize:duration:direction:randomGenerator:shader:metalContext:", (unint64_t)(sqrt(sqrt(v12 * (v14 / v18) / v16)) * 4000.0), v19, a5, self->mDiffuseMetalShader, a6);
  self->mDiffuseSystem = v20;
  double height = CGSizeZero.height;

  -[KNBuildDiffuseSystem setupWithTexture:particleTextureSize:reverseDrawOrder:](v20, "setupWithTexture:particleTextureSize:reverseDrawOrder:", 0, 0, CGSizeZero.width, height);
}

- (void)metalPrepareAnimationWithContext:(id)a3
{
  id v5 = [a3 metalContext];
  id v6 = [v5 device];
  id v7 = [a3 textures];
  id v8 = [a3 animatedBuild];
  id v9 = [v7 lastObject];
  id v10 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v10 setPixelFormat:[v5 pixelFormat]];
  [v10 setBlendingEnabled:1];
  [v10 setDestinationAlphaBlendFactor:5];
  [v10 setDestinationRGBBlendFactor:5];
  self->mDiffuseMetalShader = (TSDMetalShader *)[objc_alloc((Class)TSDMetalShader) initCustomShaderWithVertexShader:@"buildDiffuseVertexShader" fragmentShader:@"buildDiffuseFragmentShader" device:v6 library:@"KeynoteMetalLibrary" colorAttachment:v10];
  [(KNAnimationEffect *)self perspectiveMVPMatrixWithContext:a3];
  self->mBaseTransform = v17;
  -[KNBuildDiffuse p_setupParticleSystemWithImage:build:randomGenerator:metalContext:](self, "p_setupParticleSystemWithImage:build:randomGenerator:metalContext:", v9, v8, [a3 randomGenerator], v5);
  float32x4_t v11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->mBaseTransform.m21), *(float64x2_t *)&self->mBaseTransform.m23);
  float32x4_t v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->mBaseTransform.m31), *(float64x2_t *)&self->mBaseTransform.m33);
  float32x4_t v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->mBaseTransform.m41), *(float64x2_t *)&self->mBaseTransform.m43);
  self->mDiffuseShaderUniforms = ($045A307E38343445EB0ECC42A557D6CA)vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->mBaseTransform.m11), *(float64x2_t *)&self->mBaseTransform.m13);
  *(float32x4_t *)self->_anon_30 = v11;
  *(float32x4_t *)&self->_anon_30[16] = v12;
  *(float32x4_t *)&self->_anon_30[32] = v13;
  [v9 singleTextureOpacity];
  *(float *)&double v14 = v14;
  *(_DWORD *)&self->_anon_30[52] = LODWORD(v14);
  [(KNBuildDiffuseSystem *)self->mDiffuseSystem rotationMax];
  *(float *)&double v15 = v15;
  *(_DWORD *)&self->_anon_30[56] = LODWORD(v15);
  [(KNBuildDiffuseSystem *)self->mDiffuseSystem speedMax];
  *(float *)&double v16 = v16;
  *(_DWORD *)&self->_anon_30[60] = LODWORD(v16);
}

- (void)metalRenderFrameWithContext:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "metalContext"), "renderEncoder");
  if (!v5) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNBuildDiffuse metalRenderFrameWithContext:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/Animations/Builds/KNBuildDiffuse.m") lineNumber:230 description:@"invalid nil value for '%s'", "renderEncoder"];
  }
  id v6 = objc_msgSend(objc_msgSend(a3, "textures"), "lastObject");
  [a3 percent];
  *(float *)&double v7 = v7;
  *(_DWORD *)&self->_anon_30[48] = LODWORD(v7);
  id v8 = [v6 metalTextureWithContext:[a3 metalContext]];
  if (v8)
  {
    id v9 = v8;
    [(TSDMetalShader *)self->mDiffuseMetalShader setPipelineStateWithEncoder:v5 vertexBytes:&self->mDiffuseShaderUniforms];
    [v5 setFragmentTexture:v9 atIndex:0];
    mDiffuseSystem = self->mDiffuseSystem;
    [(KNBuildDiffuseSystem *)mDiffuseSystem drawMetalWithEncoder:v5];
  }
}

- (void)metalTeardownAnimationsWithContext:(id)a3
{
  self->mDiffuseMetalShader = 0;
  self->mDiffuseSystem = 0;
}

@end