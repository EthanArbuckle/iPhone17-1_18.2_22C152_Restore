@interface TSDMetalEdgeDistanceFieldMorphEffect
+ (void)didEndWithDevice:(id)a3;
+ (void)willBeginWithDevice:(id)a3 pixelFormat:(unint64_t)a4 motionBlur:(BOOL)a5 motionBlurIgnoreTextureOpacity:(BOOL)a6;
- ($1AB5FA073B851C12C2339EC22442E995)textureMatchingTextureAdjustment;
- (BOOL)isTextStyleIdenticalExceptSize;
- (BOOL)p_fillScanlineCenters:(CGPoint *)a3 scanlineMinMaxZeroes:(CGPoint *)a4 samples:(unint64_t)a5 fromTexture:(id)a6 textureSize:(CGSize)a7;
- (CGAffineTransform)p_affineTransformWithTextureAdjustment:(SEL)a3 textureSize:(id)a4;
- (CGContext)newContextFromTexture:(id)a3;
- (CGRect)p_actualPixelBoundsOfTexturedRectangle:(id)a3;
- (TSDMetalEdgeDistanceFieldMorphEffect)initWithOutgoingTR:(id)a3 incomingTR:(id)a4 metalContext:(id)a5 motionBlur:(BOOL)a6 motionBlurIgnoreTextureOpacity:(BOOL)a7 capabilities:(id)a8;
- (TSDMetalTextureInfo)incomingTextureInfo;
- (TSDMetalTextureInfo)outgoingTextureInfo;
- (double)p_errorFromApplyingTextureAdjustment:(id)a3 toOutgoingScanlineCenters:(CGPoint *)a4 outgoingScanlineZeroes:(CGPoint *)a5 incomingScanlineCenters:(CGPoint *)a6 incomingScanlineZeroes:(CGPoint *)a7 samples:(unint64_t)a8;
- (double)p_errorFromApplyingTextureAdjustment:(id)a3 toOutgoingValue:(double)a4 incomingValue:(double)a5 sample:(unint64_t)a6 sampleCount:(unint64_t)a7;
- (id)initWithOutgoingTextureName:(double)a3 outgoingTextureSize:(double)a4 outgoingTextBounds:(double)a5 outgoingColor:(double)a6 incomingTextureName:(double)a7 incomingTextureSize:(uint64_t)a8 incomingTextBounds:(void *)a9 incomingColor:(void *)a10 metalContext:(void *)a11 motionBlur:(uint64_t)a12 motionBlurIgnoreTextureOpacity:(uint64_t)a13 capabilities:(void *)a14;
- (void)dealloc;
- (void)encodeWith:(id)a3 morphPercent:(double)a4 MVPMatrix:(CATransform3D *)a5 opacity:(double)a6 generateTextureMatrices:(BOOL)a7;
- (void)encodeWith:(id)a3 morphPercent:(double)a4 MVPMatrix:(CATransform3D *)a5 opacity:(double)a6 outgoingTextureMatrix:(CGAffineTransform *)a7 incomingTextureMatrix:(CGAffineTransform *)a8;
- (void)setIsTextStyleIdenticalExceptSize:(BOOL)a3;
- (void)teardown;
@end

@implementation TSDMetalEdgeDistanceFieldMorphEffect

+ (void)willBeginWithDevice:(id)a3 pixelFormat:(unint64_t)a4 motionBlur:(BOOL)a5 motionBlurIgnoreTextureOpacity:(BOOL)a6
{
  id v10 = a3;
  if (!s_TSDMetalEdgeDistanceFieldMorphEffect_shader)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F129B0]);
    [v7 setPixelFormat:a4];
    [v7 setBlendingEnabled:1];
    [v7 setRgbBlendOperation:0];
    [v7 setAlphaBlendOperation:0];
    [v7 setSourceRGBBlendFactor:1];
    [v7 setSourceAlphaBlendFactor:1];
    [v7 setDestinationRGBBlendFactor:5];
    [v7 setDestinationAlphaBlendFactor:5];
    id v8 = [[TSDMetalShader alloc] initCustomShaderWithVertexShader:@"TSDMetalEdgeDistanceField_Morph_VertexShader" fragmentShader:@"TSDMetalEdgeDistanceField_Morph_FragmentShader" device:v10 library:@"KeynoteMetalLibrary" colorAttachment:v7];
    v9 = (void *)s_TSDMetalEdgeDistanceFieldMorphEffect_shader;
    s_TSDMetalEdgeDistanceFieldMorphEffect_shader = (uint64_t)v8;
  }
  +[TSDMetalEdgeDistanceField willBeginWithDevice:v10];
  ++s_TSDMetalEdgeDistanceFieldMorphEffectPipelineReferenceCount;
}

+ (void)didEndWithDevice:(id)a3
{
  +[TSDMetalEdgeDistanceField didEndWithDevice:a3];
  uint64_t v3 = s_TSDMetalEdgeDistanceFieldMorphEffectPipelineReferenceCount;
  uint64_t v4 = --s_TSDMetalEdgeDistanceFieldMorphEffectPipelineReferenceCount;
  if (v3 <= 0)
  {
    v5 = [MEMORY[0x263F7C7F0] currentHandler];
    v6 = [NSString stringWithUTF8String:"+[TSDMetalEdgeDistanceFieldMorphEffect didEndWithDevice:]"];
    id v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    [v5 handleFailureInFunction:v6 file:v7 lineNumber:553 description:@"overreleasing pipeline reference count!"];

    if (s_TSDMetalEdgeDistanceFieldMorphEffectPipelineReferenceCount) {
      return;
    }
  }
  else if (v4)
  {
    return;
  }
  id v8 = (void *)s_TSDMetalEdgeDistanceFieldMorphEffect_shader;
  s_TSDMetalEdgeDistanceFieldMorphEffect_shader = 0;
}

- (TSDMetalEdgeDistanceFieldMorphEffect)initWithOutgoingTR:(id)a3 incomingTR:(id)a4 metalContext:(id)a5 motionBlur:(BOOL)a6 motionBlurIgnoreTextureOpacity:(BOOL)a7 capabilities:(id)a8
{
  BOOL v9 = a7;
  uint64_t v10 = a6;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v67 = a8;
  v17 = [v16 device];
  objc_msgSend((id)objc_opt_class(), "willBeginWithDevice:pixelFormat:motionBlur:motionBlurIgnoreTextureOpacity:", v17, objc_msgSend(v16, "pixelFormat"), v10, v9);
  v68 = v17;
  objc_storeStrong((id *)&self->_metalDevice, v17);
  [(TSDMetalEdgeDistanceFieldMorphEffect *)self p_actualPixelBoundsOfTexturedRectangle:v14];
  double v65 = v19;
  double v66 = v18;
  double v63 = v21;
  double v64 = v20;
  long long v71 = 0u;
  long long v72 = 0u;
  v22 = [v14 textColor];
  if (!v22)
  {
    v23 = [MEMORY[0x263F7C7F0] currentHandler];
    BOOL v24 = v9;
    v25 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldMorphEffect initWithOutgoingTR:incomingTR:metalContext:motionBlur:motionBlurIgnoreTextureOpacity:capabilities:]"];
    v26 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    [v23 handleFailureInFunction:v25 file:v26 lineNumber:578 description:@"outgoingColor is nil!"];

    BOOL v9 = v24;
  }
  [v22 getRGBAComponents:&v71];
  long long v27 = v71;
  long long v28 = v72;
  [(TSDMetalEdgeDistanceFieldMorphEffect *)self p_actualPixelBoundsOfTexturedRectangle:v15];
  uint64_t v61 = v30;
  uint64_t v62 = v29;
  uint64_t v59 = v32;
  uint64_t v60 = v31;
  long long v69 = 0u;
  long long v70 = 0u;
  v33 = [v15 textColor];
  if (!v33)
  {
    v34 = [MEMORY[0x263F7C7F0] currentHandler];
    [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldMorphEffect initWithOutgoingTR:incomingTR:metalContext:motionBlur:motionBlurIgnoreTextureOpacity:capabilities:]"];
    unsigned int v58 = v10;
    v36 = BOOL v35 = v9;
    v37 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    [v34 handleFailureInFunction:v36 file:v37 lineNumber:586 description:@"incomingColor is nil!"];

    BOOL v9 = v35;
    uint64_t v10 = v58;
  }
  *(float *)&unsigned int v38 = *((double *)&v28 + 1);
  *(float *)&unsigned int v39 = *(double *)&v28;
  unint64_t v57 = __PAIR64__(v38, v39);
  *(float *)&unsigned int v40 = *((double *)&v27 + 1);
  *(float *)&unsigned int v41 = *(double *)&v27;
  [v33 getRGBAComponents:&v69];
  *(float *)&unsigned int v42 = *(double *)&v69;
  *(float *)&unsigned int v43 = *((double *)&v69 + 1);
  *(float *)&unsigned int v44 = *(double *)&v70;
  *(float *)&unsigned int v45 = *((double *)&v70 + 1);
  v46 = [v16 device];
  [v15 setupMetalTextureForDevice:v46];

  v47 = [v14 metalTexture];
  [v14 size];
  double v49 = v48;
  double v51 = v50;
  v52 = [v15 metalTexture];
  [v15 size];
  v55 = -[TSDMetalEdgeDistanceFieldMorphEffect initWithOutgoingTextureName:outgoingTextureSize:outgoingTextBounds:outgoingColor:incomingTextureName:incomingTextureSize:incomingTextBounds:incomingColor:metalContext:motionBlur:motionBlurIgnoreTextureOpacity:capabilities:](self, "initWithOutgoingTextureName:outgoingTextureSize:outgoingTextBounds:outgoingColor:incomingTextureName:incomingTextureSize:incomingTextBounds:incomingColor:metalContext:motionBlur:motionBlurIgnoreTextureOpacity:capabilities:", v47, v52, v16, v10, v9, v67, v49, v51, v66, v65, v64, v63, __PAIR64__(v40, v41), v57, v53, v54,
          v62,
          v61,
          v60,
          v59,
          __PAIR64__(v43, v42),
          __PAIR64__(v45, v44));

  return v55;
}

- (id)initWithOutgoingTextureName:(double)a3 outgoingTextureSize:(double)a4 outgoingTextBounds:(double)a5 outgoingColor:(double)a6 incomingTextureName:(double)a7 incomingTextureSize:(uint64_t)a8 incomingTextBounds:(void *)a9 incomingColor:(void *)a10 metalContext:(void *)a11 motionBlur:(uint64_t)a12 motionBlurIgnoreTextureOpacity:(uint64_t)a13 capabilities:(void *)a14
{
  id v38 = a9;
  id v39 = a10;
  id v40 = a11;
  id v41 = a14;
  v64.receiver = a1;
  v64.super_class = (Class)TSDMetalEdgeDistanceFieldMorphEffect;
  id v42 = objc_msgSendSuper2(&v64, sel_init);
  if (v42)
  {
    uint64_t v43 = [v40 device];
    unsigned int v44 = (void *)*((void *)v42 + 30);
    *((void *)v42 + 30) = v43;

    double v45 = a3 / 3.0;
    if (a2 > a3 / 3.0) {
      double v45 = a2;
    }
    double v46 = a22 / 3.0;
    if (a21 > a22 / 3.0) {
      double v46 = a21;
    }
    double v60 = a7;
    double v61 = a6;
    double v47 = round(v45 * -0.05);
    double v48 = round(v46 * -0.05);
    uint64_t v49 = +[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:](TSDMetalEdgeDistanceField, "distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:", v38, 0, 1, 0, v40, v41, a2, a3, 0.0, v47, 0.0, v47, 1.0);
    double v50 = (void *)*((void *)v42 + 32);
    *((void *)v42 + 32) = v49;

    uint64_t v51 = +[TSDMetalEdgeDistanceField distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:](TSDMetalEdgeDistanceField, "distanceFieldTextureWithTexture:textureSize:maxDistance:edgeInsets:downsampleScale:floatTexture:makeCPUReadable:metalContext:capabilities:", v39, 0, 1, 0, v40, v41, a21, a22, 0.0, v48, 0.0, v48, 1.0);
    v52 = (void *)*((void *)v42 + 33);
    *((void *)v42 + 33) = v51;

    CGAffineTransformMakeScale(&v63, a2 / (double)[*((id *)v42 + 32) width], a3 / (double)objc_msgSend(*((id *)v42 + 32), "height"));
    long long v53 = *(_OWORD *)&v63.c;
    *((_OWORD *)v42 + 7) = *(_OWORD *)&v63.a;
    *((_OWORD *)v42 + 8) = v53;
    *((_OWORD *)v42 + 9) = *(_OWORD *)&v63.tx;
    long long v54 = *((_OWORD *)v42 + 8);
    *(_OWORD *)&v62.a = *((_OWORD *)v42 + 7);
    *(_OWORD *)&v62.c = v54;
    *(_OWORD *)&v62.tx = *((_OWORD *)v42 + 9);
    CGAffineTransformTranslate(&v63, &v62, -v47 / a2, -0.0 / a3);
    long long v55 = *(_OWORD *)&v63.c;
    *((_OWORD *)v42 + 7) = *(_OWORD *)&v63.a;
    *((_OWORD *)v42 + 8) = v55;
    *((_OWORD *)v42 + 9) = *(_OWORD *)&v63.tx;
    CGAffineTransformMakeScale(&v63, a21 / (double)[*((id *)v42 + 33) width], a22 / (double)objc_msgSend(*((id *)v42 + 33), "height"));
    long long v56 = *(_OWORD *)&v63.c;
    *((_OWORD *)v42 + 10) = *(_OWORD *)&v63.a;
    *((_OWORD *)v42 + 11) = v56;
    *((_OWORD *)v42 + 12) = *(_OWORD *)&v63.tx;
    long long v57 = *((_OWORD *)v42 + 11);
    *(_OWORD *)&v62.a = *((_OWORD *)v42 + 10);
    *(_OWORD *)&v62.c = v57;
    *(_OWORD *)&v62.tx = *((_OWORD *)v42 + 12);
    CGAffineTransformTranslate(&v63, &v62, -v48 / a21, -0.0 / a22);
    long long v58 = *(_OWORD *)&v63.c;
    *((_OWORD *)v42 + 10) = *(_OWORD *)&v63.a;
    *((_OWORD *)v42 + 11) = v58;
    *((_OWORD *)v42 + 12) = *(_OWORD *)&v63.tx;
    *((double *)v42 + 2) = a4;
    *((double *)v42 + 3) = a5;
    *((double *)v42 + 4) = v61;
    *((double *)v42 + 5) = v60;
    *((void *)v42 + 6) = a23;
    *((void *)v42 + 7) = a24;
    *((void *)v42 + 8) = a25;
    *((void *)v42 + 9) = a26;
    *((_DWORD *)v42 + 20) = a17;
    *((_DWORD *)v42 + 21) = a18;
    *((_DWORD *)v42 + 22) = a19;
    *((_DWORD *)v42 + 23) = a20;
    *((_DWORD *)v42 + 24) = a27;
    *((_DWORD *)v42 + 25) = a28;
    *((_DWORD *)v42 + 26) = a29;
    *((_DWORD *)v42 + 27) = a30;
  }

  return v42;
}

- (void)dealloc
{
  [(TSDMetalEdgeDistanceFieldMorphEffect *)self teardown];
  v3.receiver = self;
  v3.super_class = (Class)TSDMetalEdgeDistanceFieldMorphEffect;
  [(TSDMetalEdgeDistanceFieldMorphEffect *)&v3 dealloc];
}

- (void)teardown
{
  if (!self->_didTeardown) {
    self->_didTeardown = 1;
  }
}

- (CGContext)newContextFromTexture:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && (v5 = (CGImage *)[v3 image]) != 0)
  {
    v6 = v5;
    double Width = (double)CGImageGetWidth(v5);
    CGImageGetHeight(v6);
    id v8 = TSDBitmapContextCreate(3, Width);
    v10.origin.x = TSDRectWithSize();
    CGContextDrawImage(v8, v10, v6);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (CGRect)p_actualPixelBoundsOfTexturedRectangle:(id)a3
{
  id v4 = a3;
  v5 = [(TSDMetalEdgeDistanceFieldMorphEffect *)self newContextFromTexture:v4];
  v6 = v5;
  if (v5 && (size_t BytesPerRow = CGBitmapContextGetBytesPerRow(v5), (Data = CGBitmapContextGetData(v6)) != 0))
  {
    BOOL v9 = Data;
    [v4 size];
    double v11 = v10;
    [v4 contentRect];
    double v13 = v12;
    [v4 size];
    double v15 = v14;
    [v4 contentRect];
    int64_t v17 = vcvtmd_s64_f64(v15 * v16);
    [v4 size];
    double v19 = v18;
    [v4 contentRect];
    double v21 = v20;
    [v4 size];
    double v23 = v22;
    [v4 contentRect];
    uint64_t v27 = vcvtpd_s64_f64(v23 * v26);
    if (v17 >= v27)
    {
LABEL_11:
      CGContextRelease(v6);
      id v38 = [MEMORY[0x263F7C7F0] currentHandler];
      id v39 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldMorphEffect p_actualPixelBoundsOfTexturedRectangle:]"];
      id v40 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
      [v38 handleFailureInFunction:v39 file:v40 lineNumber:717 description:@"Couldn't find non-zero pixel from bottom!"];
    }
    else
    {
      int64_t v28 = vcvtmd_s64_f64(v11 * v13);
      double v29 = v19 * v21;
      uint64_t v30 = vcvtpd_s64_f64(v19 * v21);
      size_t v31 = BytesPerRow >> 2;
      unint64_t v32 = (unint64_t)(v28 + v17 * (BytesPerRow >> 2)) << 32;
      size_t v33 = BytesPerRow >> 2 << 32;
      uint64_t v34 = v17;
      while (1)
      {
        uint64_t v35 = v32;
        uint64_t v36 = v30;
        if (v30 > v28)
        {
          while (1)
          {
            LOBYTE(v29) = v9[(v35 >> 30) + 3];
            float v37 = (double)*(unint64_t *)&v29 * 0.00390640259;
            double v29 = v37;
            if (v29 > 0.05) {
              break;
            }
            --v36;
            v35 += 0x100000000;
            if (v28 == v36) {
              goto LABEL_10;
            }
          }
          if (v34 != -1) {
            break;
          }
        }
LABEL_10:
        ++v34;
        v32 += v33;
        if (v34 == v27) {
          goto LABEL_11;
        }
      }
      double v52 = (double)v34;
      unint64_t v53 = ((unint64_t)(v31 * (v27 - 1)) << 32) + (v28 << 32);
      do
      {
        if (v27 <= v17)
        {
          long long v58 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", -1.0, v52, 0.00390640259, 0.05);
          uint64_t v59 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldMorphEffect p_actualPixelBoundsOfTexturedRectangle:]"];
          double v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
          double v61 = @"Couldn't find non-zero pixel from top!";
          CGAffineTransform v62 = v58;
          CGAffineTransform v63 = v59;
          objc_super v64 = v60;
          uint64_t v65 = 735;
          goto LABEL_25;
        }
        --v27;
        double v54 = -1.0;
        uint64_t v55 = v53;
        uint64_t v56 = v30 - v28;
        if (v30 > v28)
        {
          while (1)
          {
            LOBYTE(v24) = v9[(v55 >> 30) + 3];
            float v57 = (double)*(unint64_t *)&v24 * 0.00390640259;
            double v24 = v57;
            if (v24 > 0.05) {
              break;
            }
            v55 += 0x100000000;
            if (!--v56) {
              goto LABEL_22;
            }
          }
          double v54 = (double)v27;
        }
LABEL_22:
        v53 -= v33;
      }
      while (v54 == -1.0);
      if (v30 <= v28)
      {
LABEL_34:
        long long v58 = [MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v59 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldMorphEffect p_actualPixelBoundsOfTexturedRectangle:]"];
        double v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
        double v61 = @"Couldn't find non-zero pixel from left!";
        CGAffineTransform v62 = v58;
        CGAffineTransform v63 = v59;
        objc_super v64 = v60;
        uint64_t v65 = 755;
      }
      else
      {
        uint64_t v66 = (uint64_t)v52;
        *(void *)&double v67 = (uint64_t)v52;
        double v68 = (double)(uint64_t)v52;
        unint64_t v69 = (unint64_t)(v28 + (uint64_t)v52 * v31) << 32;
        uint64_t v70 = v28;
        while (1)
        {
          uint64_t v71 = (uint64_t)v52 + 1;
          uint64_t v72 = v69;
          if (v54 >= v68)
          {
            while (1)
            {
              LOBYTE(v67) = v9[(v72 >> 30) + 3];
              float v73 = (double)*(unint64_t *)&v67 * 0.00390640259;
              double v67 = v73;
              if (v67 > 0.05) {
                break;
              }
              double v67 = (double)v71;
              v72 += v33;
              ++v71;
              if (v54 < v67) {
                goto LABEL_33;
              }
            }
            if (v70 != -1) {
              break;
            }
          }
LABEL_33:
          ++v70;
          v69 += 0x100000000;
          if (v70 == v30) {
            goto LABEL_34;
          }
        }
        double v74 = (double)v70;
        unint64_t v75 = (unint64_t)(v30 + v66 * v31 - 1) << 32;
        uint64_t v76 = v66 + 1;
        while (v30 > v28)
        {
          --v30;
          double v77 = -1.0;
          uint64_t v78 = v76;
          uint64_t v79 = v75;
          if (v54 >= v68)
          {
            while (1)
            {
              LOBYTE(v25) = v9[(v79 >> 30) + 3];
              float v80 = (double)*(unint64_t *)&v25 * 0.00390640259;
              double v25 = v80;
              if (v25 > 0.05) {
                break;
              }
              double v25 = (double)v78;
              v79 += v33;
              ++v78;
              if (v54 < v25) {
                goto LABEL_42;
              }
            }
            double v77 = (double)v30;
          }
LABEL_42:
          v75 -= 0x100000000;
          if (v77 != -1.0)
          {
            double v81 = TSDAddPoints(v74, v52, 0.5);
            double v83 = v82;
            double v84 = TSDAddPoints(v77, v54, 0.5);
            double v86 = v85;
            [v4 size];
            double v87 = TSDRectWithSize();
            double v90 = TSDNormalizedPointInRect(v81, v83, v87, v88, v89);
            double v92 = v91;
            [v4 size];
            double v93 = TSDRectWithSize();
            double v96 = TSDNormalizedPointInRect(v84, v86, v93, v94, v95);
            double v41 = TSDRectWithPoints(v90, v92, v96);
            double v42 = v97;
            double v43 = v98;
            double v44 = v99;
            CGContextRelease(v6);
            goto LABEL_14;
          }
        }
        long long v58 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", v74);
        uint64_t v59 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldMorphEffect p_actualPixelBoundsOfTexturedRectangle:]"];
        double v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
        double v61 = @"Couldn't find non-zero pixel from right!";
        CGAffineTransform v62 = v58;
        CGAffineTransform v63 = v59;
        objc_super v64 = v60;
        uint64_t v65 = 775;
      }
LABEL_25:
      [v62 handleFailureInFunction:v63 file:v64 lineNumber:v65 description:v61];

      CGContextRelease(v6);
    }
    double v41 = *MEMORY[0x263F001A8];
    double v42 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v43 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v44 = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  else
  {
    CGContextRelease(v6);
    [v4 size];
    double v41 = TSDRectWithSize();
    double v42 = v45;
    double v43 = v46;
    double v44 = v47;
  }
LABEL_14:

  double v48 = v41;
  double v49 = v42;
  double v50 = v43;
  double v51 = v44;
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

- (BOOL)p_fillScanlineCenters:(CGPoint *)a3 scanlineMinMaxZeroes:(CGPoint *)a4 samples:(unint64_t)a5 fromTexture:(id)a6 textureSize:(CGSize)a7
{
  double height = a7.height;
  double width = a7.width;
  id v12 = a6;
  double v74 = a3;
  if (a3)
  {
    if (a4) {
      goto LABEL_3;
    }
LABEL_50:
    double v61 = [MEMORY[0x263F7C7F0] currentHandler];
    CGAffineTransform v62 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldMorphEffect p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:]"];
    CGAffineTransform v63 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    [v61 handleFailureInFunction:v62 file:v63 lineNumber:828 description:@"scanlineZeroes is NULL!"];

    if (a5) {
      goto LABEL_4;
    }
    goto LABEL_51;
  }
  long long v58 = [MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v59 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldMorphEffect p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:]"];
  double v60 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
  [v58 handleFailureInFunction:v59 file:v60 lineNumber:827 description:@"scanlineCenters is NULL!"];

  if (!a4) {
    goto LABEL_50;
  }
LABEL_3:
  if (a5) {
    goto LABEL_4;
  }
LABEL_51:
  objc_super v64 = [MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v65 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldMorphEffect p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:]"];
  uint64_t v66 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
  [v64 handleFailureInFunction:v65 file:v66 lineNumber:829 description:@"sampleCount is 0!"];

LABEL_4:
  uint64_t v13 = (uint64_t)width;
  memset(v79, 0, 24);
  v79[3] = (uint64_t)width;
  uint64_t v72 = 8 * (uint64_t)width;
  uint64_t v73 = (uint64_t)height;
  v79[4] = (uint64_t)height;
  v79[5] = 1;
  double v14 = (char *)malloc_type_malloc(v72 * (uint64_t)height, 0xDEA0744CuLL);
  [v12 getBytes:v14 bytesPerRow:v72 fromRegion:v79 mipmapLevel:0];
  double v15 = objc_opt_new();
  if (a5)
  {
    uint64_t v16 = 0;
    unint64_t v17 = 0;
    double v18 = (double)(a5 + 2);
    double v19 = (double)(v13 - 1);
    double v75 = (double)v13;
    float64x2_t v68 = (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v13), 0);
    uint64_t v20 = 2 - v13;
    uint64_t v69 = v13;
    uint64_t v70 = a4;
    unint64_t v71 = a5;
    do
    {
      uint64_t v77 = v16 + 1;
      unint64_t v78 = v17;
      double v21 = (double)(unint64_t)((v16 + 1) * v73) / v18;
      unint64_t v22 = (unint64_t)v21;
      unint64_t v76 = (unint64_t)v21;
      if (v13 < 3)
      {
        uint64_t v28 = -1000;
      }
      else
      {
        char v23 = 0;
        double v24 = &v14[8 * v22 * v13];
        double v25 = COERCE_FLOAT(((*((unsigned __int16 *)v24 + 4) << 16) & 0x80000000 | (((*((unsigned __int16 *)v24 + 4) >> 10) & 0x1F) << 23) | ((*((_WORD *)v24 + 4) & 0x3FF) << 13))+ 939524096);
        double v26 = COERCE_FLOAT(((*(unsigned __int16 *)v24 << 16) & 0x80000000 | (((*(unsigned __int16 *)v24 >> 10) & 0x1F) << 23) | ((*(_WORD *)v24 & 0x3FF) << 13))+ 939524096);
        uint64_t v27 = &v14[v72 * v22 + 16];
        uint64_t v28 = -1000;
        double v29 = 1.79769313e308;
        uint64_t v30 = 1;
        do
        {
          double v31 = v26;
          unsigned int v32 = *(unsigned __int16 *)v27;
          v27 += 8;
          double v26 = v25;
          double v25 = COERCE_FLOAT(((v32 << 16) & 0x80000000 | (((v32 >> 10) & 0x1F) << 23) | ((v32 & 0x3FF) << 13)) + 939524096);
          if (v26 >= v31 && v26 >= v25 && v26 != v25)
          {
            uint64_t v35 = [NSNumber numberWithInt:v30];
            [v15 addObject:v35];
          }
          double v36 = fabs(v26);
          double v37 = fabs(v29);
          BOOL v38 = v36 < v37;
          BOOL v39 = v36 >= v37;
          if (v36 < v37) {
            double v21 = v26;
          }
          else {
            double v21 = v29;
          }
          if (v38) {
            uint64_t v40 = v30;
          }
          else {
            uint64_t v40 = v28;
          }
          BOOL v41 = (v23 & 1) == 0;
          char v23 = (v23 & 1) != 0 || v39;
          if (v41) {
            double v29 = v21;
          }
          if (v41) {
            uint64_t v28 = v40;
          }
          ++v30;
        }
        while (v20 + v30 != 1);
      }
      double v42 = -1.0;
      double v43 = -1.0;
      if (objc_msgSend(v15, "count", v21))
      {
        double v44 = [v15 firstObject];
        [v44 doubleValue];
        double v43 = v45 / v75;
      }
      uint64_t v13 = v69;
      if ((unint64_t)[v15 count] >= 2)
      {
        double v46 = [v15 lastObject];
        [v46 doubleValue];
        double v42 = v47 / v75;
      }
      p_x = &v74[v16].x;
      double *p_x = v43;
      p_x[1] = v42;
      if (v42 <= v19)
      {
        a5 = v71;
        double v50 = &v14[v72 - 8 + v72 * v76];
        uint64_t v51 = -1000;
        double v52 = 1.79769313e308;
        uint64_t v53 = v69;
        while (1)
        {
          uint64_t v49 = v51;
          unsigned int v54 = *(unsigned __int16 *)v50;
          v50 -= 8;
          uint64_t v51 = v53;
          double v55 = fabs(v52);
          double v52 = COERCE_FLOAT(((v54 << 16) & 0x80000000 | (((v54 >> 10) & 0x1F) << 23) | ((v54 & 0x3FF) << 13)) + 939524096);
          if (fabs(v52) > v55) {
            break;
          }
          --v53;
          if (v42 > (double)(v51 - 2))
          {
            uint64_t v49 = v51;
            break;
          }
        }
      }
      else
      {
        uint64_t v49 = -1000;
        a5 = v71;
      }
      v56.i64[0] = v28;
      v56.i64[1] = v49;
      v70[v16] = (CGPoint)vdivq_f64(vcvtq_f64_s64(v56), v68);
      BOOL v57 = v42 != -1.0 || v43 != -1.0;
      unint64_t v17 = v78 + v57;
      [v15 removeAllObjects];
      ++v16;
    }
    while (v77 != a5);
  }
  else
  {
    unint64_t v17 = 0;
  }
  free(v14);

  return v17 > a5 >> 1;
}

- (double)p_errorFromApplyingTextureAdjustment:(id)a3 toOutgoingValue:(double)a4 incomingValue:(double)a5 sample:(unint64_t)a6 sampleCount:(unint64_t)a7
{
  double var0 = a3.var0;
  double result = 0.0;
  if (a4 >= 0.0 && a5 >= 0.0)
  {
    double var2 = a3.var2;
    double var1 = a3.var1;
    double v14 = (double)(a6 + 1) / (double)(a7 + 2);
    [(TSDMetalTextureInfo *)self->_outgoingTextureInfo size];
    -[TSDMetalEdgeDistanceFieldMorphEffect p_affineTransformWithTextureAdjustment:textureSize:](self, "p_affineTransformWithTextureAdjustment:textureSize:", var0, var1, var2, v15, v16);
    return vabdd_f64(v14 * 0.0 + 0.0 * a4 + 0.0, a5);
  }
  return result;
}

- (double)p_errorFromApplyingTextureAdjustment:(id)a3 toOutgoingScanlineCenters:(CGPoint *)a4 outgoingScanlineZeroes:(CGPoint *)a5 incomingScanlineCenters:(CGPoint *)a6 incomingScanlineZeroes:(CGPoint *)a7 samples:(unint64_t)a8
{
  if (!a8) {
    return 0.0;
  }
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v13 = 0;
  p_y = &a7->y;
  double v15 = &a4->y;
  double v16 = &a5->y;
  unint64_t v17 = &a6->y;
  double v18 = 0.0;
  do
  {
    double v19 = *v15;
    double v20 = *v17;
    -[TSDMetalEdgeDistanceFieldMorphEffect p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:](self, "p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:", v13, a8, var0, var1, var2, *(v15 - 1), *(v17 - 1));
    double v22 = v21 + 0.0;
    -[TSDMetalEdgeDistanceFieldMorphEffect p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:](self, "p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:", v13, a8, var0, var1, var2, v19, v20);
    double v24 = v22 + v23;
    double v25 = *v16;
    double v26 = *p_y;
    -[TSDMetalEdgeDistanceFieldMorphEffect p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:](self, "p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:", v13, a8, var0, var1, var2, *(v16 - 1), *(p_y - 1));
    double v28 = v27 + 0.0;
    -[TSDMetalEdgeDistanceFieldMorphEffect p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:](self, "p_errorFromApplyingTextureAdjustment:toOutgoingValue:incomingValue:sample:sampleCount:", v13++, a8, var0, var1, var2, v25, v26);
    p_y += 2;
    double v18 = v18 + v24 + (v28 + v29) * 0.25;
    v15 += 2;
    v16 += 2;
    v17 += 2;
  }
  while (a8 != v13);
  return v18;
}

- (CGAffineTransform)p_affineTransformWithTextureAdjustment:(SEL)a3 textureSize:(id)a4
{
  retstr->a = a4.var2;
  retstr->b = 0.0;
  retstr->c = a4.var0;
  retstr->d = 1.0;
  retstr->tx = a4.var1;
  retstr->ty = 0.0;
  return self;
}

- ($1AB5FA073B851C12C2339EC22442E995)textureMatchingTextureAdjustment
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (self->_didSetupTextureAdjustment)
  {
    double skewOffset = self->_textureAdjustment.skewOffset;
    double skew = self->_textureAdjustment.skew;
    double scale = self->_textureAdjustment.scale;
  }
  else
  {
    v5 = [(TSDMetalTextureInfo *)self->_outgoingTextureInfo name];
    [(TSDMetalTextureInfo *)self->_outgoingTextureInfo size];
    BOOL v6 = -[TSDMetalEdgeDistanceFieldMorphEffect p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:](self, "p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:", v28, v27, 10, v5);

    double scale = 1.0;
    double skew = 0.0;
    if (v6)
    {
      id v7 = [(TSDMetalTextureInfo *)self->_incomingTextureInfo name];
      [(TSDMetalTextureInfo *)self->_incomingTextureInfo size];
      BOOL v8 = -[TSDMetalEdgeDistanceFieldMorphEffect p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:](self, "p_fillScanlineCenters:scanlineMinMaxZeroes:samples:fromTexture:textureSize:", v26, v25, 10, v7);

      double skewOffset = 0.0;
      if (v8)
      {
        uint64_t v9 = 0;
        double v21 = 0.0;
        double v22 = 0.0;
        double v10 = 1.79769313e308;
        double v11 = 1.0;
        double skew = 0.0;
        do
        {
          long double v12 = 1.0 / exp2((double)v9);
          double v23 = v12 * 0.5;
          double v13 = v12 * 0.25;
          for (uint64_t i = -1; i != 2; ++i)
          {
            for (uint64_t j = -1; j != 2; ++j)
            {
              for (uint64_t k = -1; k != 2; ++k)
              {
                -[TSDMetalEdgeDistanceFieldMorphEffect p_errorFromApplyingTextureAdjustment:toOutgoingScanlineCenters:outgoingScanlineZeroes:incomingScanlineCenters:incomingScanlineZeroes:samples:](self, "p_errorFromApplyingTextureAdjustment:toOutgoingScanlineCenters:outgoingScanlineZeroes:incomingScanlineCenters:incomingScanlineZeroes:samples:", v28, v27, v26, v25, 10, v21 + (double)i * v23, v22 + (double)j * v23, v11 + (double)k * v13);
                if (v17 < v10)
                {
                  double v10 = v17;
                  double skew = v21 + (double)i * v23;
                  double skewOffset = v22 + (double)j * v23;
                  double scale = v11 + (double)k * v13;
                }
              }
            }
          }
          ++v9;
          double v11 = scale;
          double v21 = skew;
          double v22 = skewOffset;
        }
        while (v9 != 10);
      }
    }
    else
    {
      double skewOffset = 0.0;
    }
    self->_textureAdjustment.double skew = skew;
    self->_textureAdjustment.double skewOffset = skewOffset;
    self->_textureAdjustment.double scale = scale;
    self->_didSetupTextureAdjustment = 1;
  }
  double v18 = skew;
  double v19 = skewOffset;
  double v20 = scale;
  result.double var2 = v20;
  result.double var1 = v19;
  result.double var0 = v18;
  return result;
}

- (void)encodeWith:(id)a3 morphPercent:(double)a4 MVPMatrix:(CATransform3D *)a5 opacity:(double)a6 outgoingTextureMatrix:(CGAffineTransform *)a7 incomingTextureMatrix:(CGAffineTransform *)a8
{
  id v14 = a3;
  if (self->_didTeardown)
  {
    double v15 = [MEMORY[0x263F7C7F0] currentHandler];
    double v16 = [NSString stringWithUTF8String:"-[TSDMetalEdgeDistanceFieldMorphEffect encodeWith:morphPercent:MVPMatrix:opacity:outgoingTextureMatrix:incomingTextureMatrix:]"];
    double v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalEdgeDistanceField.m"];
    [v15 handleFailureInFunction:v16 file:v17 lineNumber:1116 description:@"Trying to draw after calling teardown!"];
  }
  long long v18 = *(_OWORD *)&self->_outgoingTextureEdgeInsetsAdjustmentMatrix.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_outgoingTextureEdgeInsetsAdjustmentMatrix.a;
  *(_OWORD *)&t1.c = v18;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_outgoingTextureEdgeInsetsAdjustmentMatrix.tx;
  long long v19 = *(_OWORD *)&a7->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a7->a;
  *(_OWORD *)&t2.c = v19;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a7->tx;
  CGAffineTransformConcat(&v34, &t1, &t2);
  long long v20 = *(_OWORD *)&v34.c;
  *(_OWORD *)&a7->a = *(_OWORD *)&v34.a;
  *(_OWORD *)&a7->c = v20;
  *(_OWORD *)&a7->tx = *(_OWORD *)&v34.tx;
  long long v21 = *(_OWORD *)&self->_incomingTextureEdgeInsetsAdjustmentMatrix.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_incomingTextureEdgeInsetsAdjustmentMatrix.a;
  *(_OWORD *)&t1.c = v21;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_incomingTextureEdgeInsetsAdjustmentMatrix.tx;
  long long v22 = *(_OWORD *)&a8->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&a8->a;
  *(_OWORD *)&t2.c = v22;
  *(_OWORD *)&t2.tx = *(_OWORD *)&a8->tx;
  CGAffineTransformConcat(&v34, &t1, &t2);
  long long v23 = *(_OWORD *)&v34.c;
  *(_OWORD *)&a8->a = *(_OWORD *)&v34.a;
  *(_OWORD *)&a8->c = v23;
  *(_OWORD *)&a8->tx = *(_OWORD *)&v34.tx;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  float32x2_t v24 = vcvt_f32_f64(*(float64x2_t *)&a7->a);
  *(float32x2_t *)&long long v23 = vcvt_f32_f64(*(float64x2_t *)&a7->c);
  float32x2_t v25 = vcvt_f32_f64(*(float64x2_t *)&a7->tx);
  DWORD2(v36) = 0;
  *(float32x2_t *)&long long v36 = v24;
  DWORD2(v37) = 0;
  *(void *)&long long v37 = v23;
  DWORD2(v38) = 1065353216;
  *(float32x2_t *)&long long v38 = v25;
  float32x2_t v26 = vcvt_f32_f64(*(float64x2_t *)&a8->a);
  *(float32x2_t *)&long long v23 = vcvt_f32_f64(*(float64x2_t *)&a8->c);
  float32x2_t v27 = vcvt_f32_f64(*(float64x2_t *)&a8->tx);
  DWORD2(v39) = 0;
  *(float32x2_t *)&long long v39 = v26;
  DWORD2(v40) = 0;
  *(void *)&long long v40 = v23;
  DWORD2(v41) = 1065353216;
  *(float32x2_t *)&long long v41 = v27;
  float32x4_t v28 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m21), *(float64x2_t *)&a5->m23);
  float32x4_t v29 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m31), *(float64x2_t *)&a5->m33);
  float32x4_t v30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m41), *(float64x2_t *)&a5->m43);
  *(float32x4_t *)&v34.a = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&a5->m11), *(float64x2_t *)&a5->m13);
  *(float32x4_t *)&v34.c = v28;
  *(float32x4_t *)&v34.tx = v29;
  float32x4_t v35 = v30;
  t1.b = 0.0;
  v26.f32[0] = a4;
  *(float *)&long long v23 = a6;
  *(void *)&t1.a = __PAIR64__(v26.u32[0], v23);
  $43F634250C0E94E2A09AB0840E4770D1 incomingTextColor = self->_incomingTextColor;
  *($43F634250C0E94E2A09AB0840E4770D1 *)&t1.c = self->_outgoingTextColor;
  *($43F634250C0E94E2A09AB0840E4770D1 *)&t1.tx = incomingTextColor;
  [(id)s_TSDMetalEdgeDistanceFieldMorphEffect_shader setPipelineStateWithEncoder:v14 vertexBytes:&v34 fragmentBytes:&t1];
  unsigned int v32 = [(TSDMetalTextureInfo *)self->_outgoingTextureInfo name];
  [v14 setFragmentTexture:v32 atIndex:0];

  size_t v33 = [(TSDMetalTextureInfo *)self->_incomingTextureInfo name];
  [v14 setFragmentTexture:v33 atIndex:1];
}

- (void)encodeWith:(id)a3 morphPercent:(double)a4 MVPMatrix:(CATransform3D *)a5 opacity:(double)a6 generateTextureMatrices:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  long long v13 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v46.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v46.c = v13;
  *(_OWORD *)&v46.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v45.a = *(_OWORD *)&v46.a;
  *(_OWORD *)&v45.c = v13;
  *(_OWORD *)&v45.tx = *(_OWORD *)&v46.tx;
  if (v7)
  {
    if (![(TSDMetalEdgeDistanceFieldMorphEffect *)self isTextStyleIdenticalExceptSize]) {
      goto LABEL_5;
    }
    CGFloat v14 = *MEMORY[0x263F001A8];
    CGFloat v15 = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat v16 = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat v17 = *(double *)(MEMORY[0x263F001A8] + 24);
    v47.origin.x = *(CGFloat *)MEMORY[0x263F001A8];
    v47.origin.y = v15;
    v47.size.double width = v16;
    v47.size.double height = v17;
    if (CGRectEqualToRect(v47, self->_outgoingTextBounds)
      || (v48.origin.x = v14,
          v48.origin.y = v15,
          v48.size.double width = v16,
          v48.size.double height = v17,
          CGRectEqualToRect(v48, self->_incomingTextBounds)))
    {
LABEL_5:
      [(TSDMetalEdgeDistanceFieldMorphEffect *)self textureMatchingTextureAdjustment];
      double v18 = TSDMetalEdgeDistanceFieldTextureAdjustmentMix();
      double v20 = v19;
      double v22 = v21;
      double v23 = TSDMetalEdgeDistanceFieldTextureAdjustmentMix();
      double v25 = v24;
      double v27 = v26;
      [(TSDMetalTextureInfo *)self->_outgoingTextureInfo size];
      -[TSDMetalEdgeDistanceFieldMorphEffect p_affineTransformWithTextureAdjustment:textureSize:](self, "p_affineTransformWithTextureAdjustment:textureSize:", v18, v20, v22, v28, v29);
      [(TSDMetalTextureInfo *)self->_incomingTextureInfo size];
      -[TSDMetalEdgeDistanceFieldMorphEffect p_affineTransformWithTextureAdjustment:textureSize:](self, "p_affineTransformWithTextureAdjustment:textureSize:", v23, v25, v27, v30, v31);
    }
    else
    {
      double width = self->_outgoingTextBounds.size.width;
      if (width > 0.2)
      {
        double height = self->_outgoingTextBounds.size.height;
        if (height > 0.2)
        {
          double v38 = self->_incomingTextBounds.size.width;
          if (v38 > 0.2)
          {
            double v39 = self->_incomingTextBounds.size.height;
            if (v39 > 0.2)
            {
              TSDTransformConvertingRectToRectAtPercent((uint64_t)&v44, self->_outgoingTextBounds.origin.x, width, height, self->_incomingTextBounds.origin.x, self->_incomingTextBounds.origin.y, v38, v39, a4);
              CGAffineTransformInvert(&v46, &v44);
              TSDTransformConvertingRectToRectAtPercent((uint64_t)&v43, self->_incomingTextBounds.origin.x, self->_incomingTextBounds.size.width, self->_incomingTextBounds.size.height, self->_outgoingTextBounds.origin.x, self->_outgoingTextBounds.origin.y, self->_outgoingTextBounds.size.width, self->_outgoingTextBounds.size.height, 1.0 - a4);
              CGAffineTransformInvert(&v45, &v43);
            }
          }
        }
      }
    }
  }
  long long v32 = *(_OWORD *)&a5->m33;
  v42[4] = *(_OWORD *)&a5->m31;
  v42[5] = v32;
  long long v33 = *(_OWORD *)&a5->m43;
  v42[6] = *(_OWORD *)&a5->m41;
  v42[7] = v33;
  long long v34 = *(_OWORD *)&a5->m13;
  v42[0] = *(_OWORD *)&a5->m11;
  v42[1] = v34;
  long long v35 = *(_OWORD *)&a5->m23;
  v42[2] = *(_OWORD *)&a5->m21;
  v42[3] = v35;
  CGAffineTransform v41 = v46;
  CGAffineTransform v40 = v45;
  [(TSDMetalEdgeDistanceFieldMorphEffect *)self encodeWith:v12 morphPercent:v42 MVPMatrix:&v41 opacity:&v40 outgoingTextureMatrix:a4 incomingTextureMatrix:a6];
}

- (TSDMetalTextureInfo)outgoingTextureInfo
{
  return self->_outgoingTextureInfo;
}

- (TSDMetalTextureInfo)incomingTextureInfo
{
  return self->_incomingTextureInfo;
}

- (BOOL)isTextStyleIdenticalExceptSize
{
  return self->isTextStyleIdenticalExceptSize;
}

- (void)setIsTextStyleIdenticalExceptSize:(BOOL)a3
{
  self->isTextStyleIdenticalExceptSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingTextureInfo, 0);
  objc_storeStrong((id *)&self->_outgoingTextureInfo, 0);

  objc_storeStrong((id *)&self->_metalDevice, 0);
}

@end