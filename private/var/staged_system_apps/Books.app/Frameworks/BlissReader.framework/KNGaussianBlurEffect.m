@interface KNGaussianBlurEffect
- (BOOL)p_textureSizeIsValid:(CGSize)a3;
- (BOOL)saturateBlurTextures;
- (CATransform3D)MVPMatrix;
- (KNGaussianBlurEffect)initWithContext:(id)a3;
- (TSDTexturedRectangle)texture;
- (double)opacity;
- (double)p_scaleFactorForTextureToFitWithinMaxSizeWithSize:(CGSize)a3 scaleFactor:(double)a4 maxTextureSize:(CGSize)a5;
- (void)createBlurTexturesUsingShadersWithBlurSteps:(unint64_t)a3 maxBlurRadius:(double)a4 stepsToDecreaseRadius:(double)a5 commandBuffer:(id)a6 capabilities:(id)a7;
- (void)createBlurTexturesWithBlurSteps:(unint64_t)a3 maxBlurRadius:(double)a4 stepsToDecreaseRadius:(double)a5 commandBuffer:(id)a6 capabilities:(id)a7;
- (void)renderEffectAtPercent:(double)a3 withContext:(id)a4;
- (void)setMVPMatrix:(CATransform3D *)a3;
- (void)setOpacity:(double)a3;
- (void)setSaturateBlurTextures:(BOOL)a3;
- (void)setTexture:(id)a3;
- (void)setupEffectIfNecessary;
- (void)teardown;
@end

@implementation KNGaussianBlurEffect

- (KNGaussianBlurEffect)initWithContext:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)KNGaussianBlurEffect;
  v5 = [(KNGaussianBlurEffect *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 metalContext];
    v7 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v6;

    long long v8 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)(v5 + 264) = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)(v5 + 280) = v8;
    long long v9 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)(v5 + 296) = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)(v5 + 312) = v9;
    long long v10 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)(v5 + 200) = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)(v5 + 216) = v10;
    long long v11 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)(v5 + 232) = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)(v5 + 248) = v11;
    *((void *)v5 + 24) = 0x3FF0000000000000;
    v5[176] = 0;
  }

  return (KNGaussianBlurEffect *)v5;
}

- (BOOL)p_textureSizeIsValid:(CGSize)a3
{
  return a3.width > 0.0 || a3.width < 0.0;
}

- (double)p_scaleFactorForTextureToFitWithinMaxSizeWithSize:(CGSize)a3 scaleFactor:(double)a4 maxTextureSize:(CGSize)a5
{
  if (a4 == 0.0)
  {
    v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNGaussianBlurEffect p_scaleFactorForTextureToFitWithinMaxSizeWithSize:scaleFactor:maxTextureSize:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNGaussianBlurEffect.m"];
    CFStringRef v8 = @"Scale factor cannot be zero.";
    long long v9 = v5;
    long long v10 = v6;
    long long v11 = v7;
    uint64_t v12 = 153;
LABEL_10:
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:v12 description:v8];

    return 1.0;
  }
  double height = a5.height;
  double width = a5.width;
  double v15 = a4;
  if (!-[KNGaussianBlurEffect p_textureSizeIsValid:](self, "p_textureSizeIsValid:")
    || !-[KNGaussianBlurEffect p_textureSizeIsValid:](self, "p_textureSizeIsValid:", width, height))
  {
    v5 = +[TSUAssertionHandler currentHandler];
    uint64_t v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNGaussianBlurEffect p_scaleFactorForTextureToFitWithinMaxSizeWithSize:scaleFactor:maxTextureSize:]");
    v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNGaussianBlurEffect.m"];
    CFStringRef v8 = @"Invalid texture size";
    long long v9 = v5;
    long long v10 = v6;
    long long v11 = v7;
    uint64_t v12 = 158;
    goto LABEL_10;
  }
  TSDMultiplySizeScalar();
  if (v17 >= width)
  {
    double v15 = v15 / (width / v17);
    TSDMultiplySizeScalar();
  }
  if (v18 >= height) {
    return v15 / (height / v18);
  }
  return v15;
}

- (void)createBlurTexturesWithBlurSteps:(unint64_t)a3 maxBlurRadius:(double)a4 stepsToDecreaseRadius:(double)a5 commandBuffer:(id)a6 capabilities:(id)a7
{
}

- (void)createBlurTexturesUsingShadersWithBlurSteps:(unint64_t)a3 maxBlurRadius:(double)a4 stepsToDecreaseRadius:(double)a5 commandBuffer:(id)a6 capabilities:(id)a7
{
  id v119 = a6;
  id v12 = a7;
  objc_super v13 = [(TSDMetalContext *)self->_metalContext device];
  [v12 maximumMetalTextureSizeForDevice:v13];
  double v108 = v15;
  double v109 = v14;
  id v16 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
  [v16 setPixelFormat:[self->_metalContext pixelFormat]];
  id v118 = [objc_alloc((Class)TSDMetalShader) initDefaultTextureShaderWithDevice:v13 colorAttachment:v16];
  id v117 = [objc_alloc((Class)TSDMetalShader) initDefaultGaussianBlurShaderWithDevice:v13 colorAttachment:v16 halfSizedRadius:1];
  double v17 = +[NSMutableArray array];
  v116 = +[NSMutableArray array];
  double Width = (double)CGImageGetWidth((CGImageRef)[(TSDTexturedRectangle *)self->_texture image]);
  double Height = (double)CGImageGetHeight((CGImageRef)[(TSDTexturedRectangle *)self->_texture image]);
  [(TSDTexturedRectangle *)self->_texture size];
  double v21 = v20;
  [(TSDTexturedRectangle *)self->_texture size];
  double v23 = v22;
  TSDRectWithSize();
  double v106 = v25;
  double v107 = v24;
  double v105 = v26;
  double r2 = v27;
  double v111 = TSDRectUnit[1];
  double v112 = TSDRectUnit[0];
  double v110 = TSDRectUnit[2];
  double v113 = TSDRectUnit[3];
  v114 = self;
  id v115 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v13);
  uint64_t v28 = [(TSDTexturedRectangle *)self->_texture metalTextureWithContext:self->_metalContext];
  v29 = (void *)v28;
  if (v28)
  {
    id v97 = v16;
    id v98 = v12;
    unint64_t v30 = 0;
    double v126 = Width;
    double v100 = Width / v21;
    double x = CGRectNull.origin.x;
    double y = CGRectNull.origin.y;
    double v33 = CGRectNull.size.width;
    double v34 = CGRectNull.size.height;
    double v124 = (double)a3;
    double v125 = Height;
    double v35 = 1.0;
    double v99 = Height / v23;
    v103 = v17;
    v104 = v13;
    double v127 = a4;
    double v128 = a5;
    unint64_t v101 = a3;
    v102 = (void *)v28;
    do
    {
      double v36 = (double)v30 / v124 * ((double)v30 / v124) * a4;
      double v37 = 2.0;
      if (a5 != 0.0)
      {
        double v38 = floor(v36 / a5);
        if (v38 <= v35) {
          double v37 = 2.0;
        }
        else {
          double v37 = v38 + v38;
        }
      }
      if (v36 <= 0.0)
      {
        v82 = -[KNGaussianBlurTexture initWithMetalTexture:frame:blurAmount:]([KNGaussianBlurTexture alloc], "initWithMetalTexture:frame:blurAmount:", v29, v107, v106, v105, r2, v36);
        v152.origin.double x = x;
        v152.origin.double y = y;
        v152.size.double width = v33;
        v152.size.double height = v34;
        v155.origin.double x = v107;
        v155.origin.double y = v106;
        v155.size.double width = v105;
        a4 = v127;
        a5 = v128;
        v155.size.double height = r2;
        CGRect v153 = CGRectUnion(v152, v155);
        double x = v153.origin.x;
        double y = v153.origin.y;
        double v33 = v153.size.width;
        double v34 = v153.size.height;
      }
      else
      {
        TSDMultiplySizeScalar();
        double v41 = v36 / v37;
        double v123 = v41;
        if (fabs(v41 + -5.0) > 0.100000001)
        {
          double v37 = v37 / (5.0 / v41);
          TSDMultiplySizeScalar();
          if (v39 >= v126)
          {
            double v37 = 1.0;
            double v40 = v125;
            double v39 = v126;
          }
        }
        -[KNGaussianBlurEffect p_scaleFactorForTextureToFitWithinMaxSizeWithSize:scaleFactor:maxTextureSize:](v114, "p_scaleFactorForTextureToFitWithinMaxSizeWithSize:scaleFactor:maxTextureSize:", v39, v40, v37, v109, v108);
        double v43 = v42;
        TSDMultiplySizeScalar();
        double v120 = v44;
        double v121 = v45;
        [(TSDTexturedRectangle *)v114->_texture offset];
        double v47 = fabs(v46) * v100 + 10.0;
        [(TSDTexturedRectangle *)v114->_texture offset];
        double v49 = v43;
        double v50 = v43 * (v47 + 5.0);
        double v51 = v43 * (fabs(v48) * v99 + 10.0 + 5.0);
        float64x2_t v145 = 0u;
        float64x2_t v146 = 0u;
        float64x2_t v143 = 0u;
        float64x2_t v144 = 0u;
        float64x2_t v141 = 0u;
        float64x2_t v142 = 0u;
        float64x2_t v139 = 0u;
        float64x2_t v140 = 0u;
        TSDTransform3DMakeOrtho();
        memset(&v138, 0, sizeof(v138));
        CATransform3DMakeTranslation(&v138, v50 * 0.5, v51 * 0.5, 0.0);
        CATransform3D a = v138;
        *(float64x2_t *)&b.m31 = v143;
        *(float64x2_t *)&b.m33 = v144;
        *(float64x2_t *)&b.m41 = v145;
        *(float64x2_t *)&b.m43 = v146;
        *(float64x2_t *)&b.m11 = v139;
        *(float64x2_t *)&b.m13 = v140;
        *(float64x2_t *)&b.m21 = v141;
        *(float64x2_t *)&b.m23 = v142;
        CATransform3DConcat(&v137, &a, &b);
        float64x2_t v143 = *(float64x2_t *)&v137.m31;
        float64x2_t v144 = *(float64x2_t *)&v137.m33;
        float64x2_t v145 = *(float64x2_t *)&v137.m41;
        float64x2_t v146 = *(float64x2_t *)&v137.m43;
        float64x2_t v139 = *(float64x2_t *)&v137.m11;
        float64x2_t v140 = *(float64x2_t *)&v137.m13;
        float64x2_t v141 = *(float64x2_t *)&v137.m21;
        float64x2_t v142 = *(float64x2_t *)&v137.m23;
        sdouble x = v49;
        double v52 = v51 / v49;
        double v53 = v120 + v50 / v49;
        memset(&v137, 0, sizeof(v137));
        TSDTransform3DMakeOrtho();
        id v54 = [objc_alloc((Class)TSDMetalRenderTarget) initWithSize:v114->_metalContext metalContext:v53, v121 + v52];
        v55 = [v54 passDescriptor];
        v56 = [v119 renderCommandEncoderWithDescriptor:v55];

        *(float32x4_t *)&a.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v139), v140);
        *(float32x4_t *)&a.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v141), v142);
        *(float32x4_t *)&a.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v143), v144);
        *(float32x4_t *)&a.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v145), v146);
        [v118 setPipelineStateWithEncoder:v56 vertexBytes:&a];
        [v56 setFragmentTexture:v29 atIndex:0];
        [v115 drawWithEncoder:v56 atIndex:[v118 bufferIndex]];
        [v56 endEncoding];
        TSDRectWithSize();
        id v57 = +[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v13);
        id v58 = [objc_alloc((Class)TSDMetalRenderTarget) initWithSize:v114->_metalContext metalContext:v53 size:v121 + v52];
        v59 = [v58 passDescriptor];
        v60 = [v119 renderCommandEncoderWithDescriptor:v59];

        *(float32x4_t *)&a.m11 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v137.m11), *(float64x2_t *)&v137.m13);
        *(float32x4_t *)&a.m13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v137.m21), *(float64x2_t *)&v137.m23);
        *(float32x4_t *)&a.m21 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v137.m31), *(float64x2_t *)&v137.m33);
        *(float32x4_t *)&a.m23 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&v137.m41), *(float64x2_t *)&v137.m43);
        *(float *)&CGFloat v61 = 1.0 / v53;
        float v62 = 1.0 / (v121 + v52);
        *((float *)&v61 + 1) = v62;
        b.m11 = v61;
        *(void *)&b.m12 = 1;
        [v117 setPipelineStateWithEncoder:v60 vertexBytes:&a fragmentBytes:&b];
        v63 = [v54 texture];
        [v60 setFragmentTexture:v63 atIndex:0];

        objc_msgSend(v57, "drawWithEncoder:atIndex:", v60, objc_msgSend(v117, "bufferIndex"));
        [v60 endEncoding];
        id v64 = [objc_alloc((Class)TSDMetalRenderTarget) initWithSize:v114->_metalContext metalContext:v53, v121 + v52];
        v65 = [v64 passDescriptor];
        v66 = [v119 renderCommandEncoderWithDescriptor:v65];

        LOBYTE(b.m12) = 0;
        [v117 setPipelineStateWithEncoder:v66 vertexBytes:&a fragmentBytes:&b];
        v67 = [v58 texture];
        [v66 setFragmentTexture:v67 atIndex:0];

        [v57 drawWithEncoder:v66 atIndex:[v117 bufferIndex]];
        [v66 endEncoding];
        TSDRectWithOriginAndSize();
        CGFloat v69 = v68;
        CGFloat v71 = v70;
        CGFloat v73 = v72;
        CGFloat v75 = v74;
        CGAffineTransformMakeScale(&v134, sx, sx);
        v148.origin.double x = v69;
        v148.origin.double y = v71;
        v148.size.double width = v73;
        v148.size.double height = v75;
        CGRect v149 = CGRectApplyAffineTransform(v148, &v134);
        double v76 = v149.origin.x;
        double v77 = v149.origin.y;
        double v78 = v149.size.width;
        double v79 = v149.size.height;
        v80 = [KNGaussianBlurTexture alloc];
        v81 = [v64 texture];
        v82 = -[KNGaussianBlurTexture initWithMetalTexture:frame:blurAmount:](v80, "initWithMetalTexture:frame:blurAmount:", v81, v76, v77, v78, v79, v123);

        v83 = [v64 texture];
        [v116 addObject:v83];

        v150.origin.double x = x;
        v150.origin.double y = y;
        v150.size.double width = v33;
        v150.size.double height = v34;
        v154.origin.double x = v76;
        v154.origin.double y = v77;
        v154.size.double width = v78;
        v154.size.double height = v79;
        CGRect v151 = CGRectUnion(v150, v154);
        double x = v151.origin.x;
        double y = v151.origin.y;
        double v33 = v151.size.width;
        double v34 = v151.size.height;

        v29 = v102;
        objc_super v13 = v104;

        double v17 = v103;
        a4 = v127;
        a5 = v128;
        a3 = v101;
      }
      [v17 addObject:v82];

      ++v30;
      double v35 = 1.0;
    }
    while (v30 <= a3);
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id v84 = v17;
    id v85 = [v84 countByEnumeratingWithState:&v130 objects:v147 count:16];
    if (v85)
    {
      id v86 = v85;
      uint64_t v87 = *(void *)v131;
      do
      {
        for (i = 0; i != v86; i = (char *)i + 1)
        {
          if (*(void *)v131 != v87) {
            objc_enumerationMutation(v84);
          }
          v89 = *(void **)(*((void *)&v130 + 1) + 8 * i);
          [v89 frame];
          TSDAddPoints();
          TSDNormalizedPointInRect();
          TSDNormalizedPointInRect();
          TSDRectWithPoints();
          [v89 setBounds:];
        }
        id v86 = [v84 countByEnumeratingWithState:&v130 objects:v147 count:16];
      }
      while (v86);
    }

    objc_storeStrong((id *)&v114->_blurTextures, v17);
    [(TSDTexturedRectangle *)v114->_texture size];
    double v91 = v90 / (double)CGImageGetWidth((CGImageRef)[(TSDTexturedRectangle *)v114->_texture image]);
    [(TSDTexturedRectangle *)v114->_texture size];
    double v93 = v92;
    size_t v94 = CGImageGetHeight((CGImageRef)[(TSDTexturedRectangle *)v114->_texture image]);
    v95 = (TSDMTLDataBuffer *)+[TSDGPUDataBuffer newDataBufferWithVertexRect:textureRect:device:](TSDGPUDataBuffer, "newDataBufferWithVertexRect:textureRect:device:", v13, x * v91, y * (v93 / (double)v94), v33 * v91, v34 * (v93 / (double)v94), v112, v111, v110, v113);
    metalDataBuffer = v114->_metalDataBuffer;
    v114->_metalDataBuffer = v95;

    id v16 = v97;
    id v12 = v98;
  }
}

- (void)setupEffectIfNecessary
{
  if (!self->_texture)
  {
    v3 = +[TSUAssertionHandler currentHandler];
    id v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[KNGaussianBlurEffect setupEffectIfNecessary]");
    v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/KNGaussianBlurEffect.m"];
    [v3 handleFailureInFunction:v4 file:v5 lineNumber:363 description:@"invalid nil value for '%s'", "_texture"];
  }
  if (self->_metalContext)
  {
    id v15 = objc_alloc_init((Class)MTLRenderPipelineColorAttachmentDescriptor);
    [v15 setPixelFormat:[self->_metalContext pixelFormat]];
    [v15 setBlendingEnabled:1];
    [v15 setDestinationRGBBlendFactor:5];
    [v15 setDestinationAlphaBlendFactor:5];
    if (self->_saturateBlurTextures) {
      uint64_t v6 = @"KNBuildBlurColorizedFragmentShader";
    }
    else {
      uint64_t v6 = @"KNBuildBlurFragmentShader";
    }
    v7 = v6;
    id v8 = objc_alloc((Class)TSDMetalShader);
    long long v9 = [(TSDMetalContext *)self->_metalContext device];
    long long v10 = (TSDMetalShader *)[v8 initCustomShaderWithVertexShader:@"KNBuildBlurVertexShader" fragmentShader:v7 device:v9 library:@"KeynoteMetalLibrary" colorAttachment:v15];

    metalShader = self->_metalShader;
    self->_metalShader = v10;

    float32x4_t v12 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_MVPMatrix.m21), *(float64x2_t *)&self->_MVPMatrix.m23);
    float32x4_t v13 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_MVPMatrix.m31), *(float64x2_t *)&self->_MVPMatrix.m33);
    float32x4_t v14 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_MVPMatrix.m41), *(float64x2_t *)&self->_MVPMatrix.m43);
    *(float32x4_t *)self->_anon_30 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)&self->_MVPMatrix.m11), *(float64x2_t *)&self->_MVPMatrix.m13);
    *(float32x4_t *)&self->_anon_30[16] = v12;
    *(float32x4_t *)&self->_anon_30[32] = v13;
    *(float32x4_t *)&self->_anon_30[48] = v14;
  }
}

- (void)renderEffectAtPercent:(double)a3 withContext:(id)a4
{
  if (self->_metalDataBuffer)
  {
    id v25 = [a4 renderEncoder];
    double v6 = (double)([(NSArray *)self->_blurTextures count] - 1) * a3;
    double v7 = 1.0;
    long double v8 = fmod(v6, 1.0);
    long long v9 = (char *)vcvtmd_u64_f64(v6);
    long long v10 = v9 + 1;
    if (v9 + 1 >= (char *)[(NSArray *)self->_blurTextures count])
    {
      long long v10 = (char *)[(NSArray *)self->_blurTextures count] - 1;
      long long v9 = (char *)[(NSArray *)self->_blurTextures count] - 2;
    }
    else
    {
      double v7 = v8;
    }
    long long v11 = [(NSArray *)self->_blurTextures objectAtIndexedSubscript:v9];
    float32x4_t v12 = [(NSArray *)self->_blurTextures objectAtIndexedSubscript:v10];
    [v11 bounds];
    v14.f64[1] = v13;
    v16.f64[1] = v15;
    *(float32x4_t *)&self->_anon_30[64] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v16), v14);
    [v12 bounds];
    opacitdouble y = self->_opacity;
    self->_fragmentUniforms.Opacitdouble y = opacity;
    p_fragmentUniforms = &self->_fragmentUniforms;
    v20.f64[1] = v19;
    v22.f64[1] = v21;
    *(float32x4_t *)&p_fragmentUniforms[-2].Opacitdouble y = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v22), v20);
    *(float *)v22.f64 = v7;
    p_fragmentUniforms->Percent = *(float *)v22.f64;
    [*(id *)&p_fragmentUniforms[-15] setPipelineStateWithEncoder:v25 vertexBytes:&p_fragmentUniforms[-12] fragmentBytes:p_fragmentUniforms];
    double v23 = [v11 texture];
    [v25 setFragmentTexture:v23 atIndex:0];

    double v24 = [v12 texture];
    [v25 setFragmentTexture:v24 atIndex:1];

    [*(id *)&p_fragmentUniforms[-14] drawWithEncoder:v25 atIndex:[*(id *)&p_fragmentUniforms[-15] bufferIndex]];
  }
}

- (void)teardown
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_blurTextures;
  id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v7) teardown:v11];
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  blurTextures = self->_blurTextures;
  self->_blurTextures = 0;

  metalDataBuffer = self->_metalDataBuffer;
  self->_metalDataBuffer = 0;

  metalShader = self->_metalShader;
  self->_metalShader = 0;
}

- (TSDTexturedRectangle)texture
{
  return self->_texture;
}

- (void)setTexture:(id)a3
{
  self->_texture = (TSDTexturedRectangle *)a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)setOpacity:(double)a3
{
  self->_opacitdouble y = a3;
}

- (CATransform3D)MVPMatrix
{
  long long v3 = *(_OWORD *)&self[1].m34;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[1].m32;
  *(_OWORD *)&retstr->m13 = v3;
  long long v4 = *(_OWORD *)&self[1].m44;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m42;
  *(_OWORD *)&retstr->m23 = v4;
  long long v5 = *(_OWORD *)&self[2].m14;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[2].m12;
  *(_OWORD *)&retstr->m33 = v5;
  long long v6 = *(_OWORD *)&self[2].m24;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[2].m22;
  *(_OWORD *)&retstr->m43 = v6;
  return self;
}

- (void)setMVPMatrix:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_MVPMatrix.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_MVPMatrix.m21 = v5;
  *(_OWORD *)&self->_MVPMatrix.m13 = v4;
  *(_OWORD *)&self->_MVPMatrix.m11 = v3;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_MVPMatrix.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_MVPMatrix.m43 = v8;
  *(_OWORD *)&self->_MVPMatrix.m31 = v6;
  *(_OWORD *)&self->_MVPMatrix.m33 = v7;
}

- (BOOL)saturateBlurTextures
{
  return self->_saturateBlurTextures;
}

- (void)setSaturateBlurTextures:(BOOL)a3
{
  self->_saturateBlurTextures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalDataBuffer, 0);
  objc_storeStrong((id *)&self->_metalShader, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_blurTextures, 0);
}

@end