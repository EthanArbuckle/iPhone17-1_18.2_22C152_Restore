@interface PTRenderPipelineState
+ (Class)classForVersion:(unint64_t)a3;
- (BOOL)prepareForRendering;
- (BOOL)prepareForRendering:(BOOL)a3;
- (CGRect)totalSensorCrop;
- (NSString)description;
- (PTRenderPipelineState)initWithPipelineDescriptor:(id)a3 metalContext:(id)a4 quality:(int)a5;
- (double)visCropFactor;
- (float)cameraIntrinsicMatrix;
- (float)focalLenIn35mmFilm;
- (float)networkBias;
- (float)noiseScaleFactor;
- (int)conversionGain;
- (int)encodeRenderTo:(id)a3 withRenderRequest:(id)a4;
- (int)hwModelID;
- (int)quality;
- (int)rawSensorHeight;
- (int)rawSensorWidth;
- (int)readNoise_1x;
- (int)readNoise_8x;
- (int)sensorID;
- (int)sourceColorBitDepth;
- (unint64_t)renderingVersion;
- (void)adjustScissorRect:(id)a3;
- (void)setConversionGain:(int)a3;
- (void)setFocalLenIn35mmFilm:(float)a3;
- (void)setHwModelID:(int)a3;
- (void)setNetworkBias:(float)a3;
- (void)setNoiseScaleFactor:(float)a3;
- (void)setRawSensorHeight:(int)a3;
- (void)setRawSensorWidth:(int)a3;
- (void)setReadNoise_1x:(int)a3;
- (void)setReadNoise_8x:(int)a3;
- (void)setRenderingVersion:(unint64_t)a3;
- (void)setSensorID:(int)a3;
- (void)setSourceColorBitDepth:(int)a3;
- (void)setTotalSensorCrop:(CGRect)a3;
- (void)setVisCropFactor:(PTRenderPipelineState *)self;
@end

@implementation PTRenderPipelineState

- (void)setSourceColorBitDepth:(int)a3
{
  self->sourceColorBitDepth = a3;
}

- (BOOL)prepareForRendering:(BOOL)a3
{
  renderIntegration = self->_renderIntegration;
  if (renderIntegration) {
    BOOL v4 = !a3;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return renderIntegration != 0;
  }
  kdebug_trace();
  v6 = +[PTRenderPipelineState classForVersion:[(PTRenderPipelineState *)self renderingVersion]];
  [(PTRenderPipelineDescriptor *)self->_pipelineDescritor colorOutputSize];
  self->_colorOutputSize.double width = v7;
  self->_colorOutputSize.double height = v8;
  p_colorOutputSize = (int8x16_t *)&self->_colorOutputSize;
  pipelineDescritor = self->_pipelineDescritor;
  if (pipelineDescritor) {
    [(PTRenderPipelineDescriptor *)pipelineDescritor preferredTransform];
  }
  else {
    memset(v53, 0, sizeof(v53));
  }
  int v11 = +[PTUtil getRotationDegreesFromAffineTransform:v53];
  self->_colorOutputRotationDegrees = v11;
  if (v11 == 270 || v11 == 90)
  {
    int8x16_t *p_colorOutputSize = vextq_s8(*p_colorOutputSize, *p_colorOutputSize, 8uLL);
    goto LABEL_15;
  }
  if (v11 != -1)
  {
LABEL_15:
    self->_colorOutputSizeCropped = (CGSize)*p_colorOutputSize;
    double width = self->_colorOutputSizeCropped.width;
    double height = self->_colorOutputSizeCropped.height;
    if ((int)height >= 0) {
      int v23 = (int)height & 1;
    }
    else {
      int v23 = -((int)height & 1);
    }
    double v24 = height - (double)v23;
    if ((int)width >= 0) {
      int v25 = (int)width & 1;
    }
    else {
      int v25 = -((int)width & 1);
    }
    self->_colorOutputSizeCropped.double width = width - (double)v25;
    self->_colorOutputSizeCropped.double height = v24;
    if (v11)
    {
      BOOL v26 = [(PTRenderPipelineDescriptor *)self->_pipelineDescritor useRGBA];
      v27 = [(PTMetalContext *)self->_metalContext textureUtil];
      v28 = v27;
      unint64_t v29 = (unint64_t)self->_colorOutputSize.width;
      unint64_t v30 = (unint64_t)self->_colorOutputSize.height;
      if (v26)
      {
        v31 = [v27 createWithWidth:v29 height:v30 pixelFormat:115];
        v32 = +[PTTexture createRGBA:v31];
        intermediateOutput = self->_intermediateOutput;
        self->_intermediateOutput = v32;
      }
      else
      {
        v31 = [v27 createWithWidth:v29 height:v30 pixelFormat:25];
        intermediateOutput = [(PTMetalContext *)self->_metalContext textureUtil];
        v34 = [intermediateOutput createWithWidth:(unint64_t)(self->_colorOutputSize.width * 0.5) height:(unint64_t)(self->_colorOutputSize.height * 0.5) pixelFormat:65];
        v35 = +[PTTexture createYUV420:v31 chroma:v34];
        v36 = self->_intermediateOutput;
        self->_intermediateOutput = v35;
      }
      v37 = [[PTUtil alloc] initWithMetalContext:self->_metalContext];
      util = self->_util;
      self->_util = v37;
    }
    v39 = (RenderingIntegration *)[v6 alloc];
    v40 = self->_renderIntegration;
    self->_renderIntegration = v39;

    v41 = self->_renderIntegration;
    renderEffects = self->_renderEffects;
    metalContext = self->_metalContext;
    [(PTRenderPipelineDescriptor *)self->_pipelineDescritor disparitySize];
    double v45 = v44;
    double v47 = v46;
    int64_t v48 = [(PTRenderPipelineDescriptor *)self->_pipelineDescritor debugRendering];
    BOOL v49 = [(PTRenderPipelineDescriptor *)self->_pipelineDescritor verbose];
    v50 = [(PTRenderPipelineDescriptor *)self->_pipelineDescritor options];
    v51 = -[RenderingIntegration initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:](v41, "initWithMetalContext:renderEffects:colorSize:disparitySize:debugRendering:verbose:options:quality:", metalContext, renderEffects, v48, v49, v50, self->_quality, self->_colorOutputSizeCropped.width, self->_colorOutputSizeCropped.height, v45, v47);
    v52 = self->_renderIntegration;
    self->_renderIntegration = v51;

    kdebug_trace();
    renderIntegration = self->_renderIntegration;
    return renderIntegration != 0;
  }
  v12 = _PTLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[PTRenderPipelineState prepareForRendering:](v12, v13, v14, v15, v16, v17, v18, v19);
  }

  return 0;
}

- (unint64_t)renderingVersion
{
  return self->_renderingVersion;
}

- (PTRenderPipelineState)initWithPipelineDescriptor:(id)a3 metalContext:(id)a4 quality:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PTRenderPipelineState;
  v10 = [(PTRenderPipelineState *)&v19 init];
  int v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_metalContext, a4);
    uint64_t v12 = [v8 copy];
    pipelineDescritor = v11->_pipelineDescritor;
    v11->_pipelineDescritor = (PTRenderPipelineDescriptor *)v12;

    v11->_quality = a5;
    v11->_renderingVersion = [v8 version];
    *(void *)&v11->noiseScaleFactor = 2143289344;
    [v8 colorInputSize];
    CGFloat v15 = v14;
    [v8 colorInputSize];
    v11->_colorInputSize.double width = v15;
    v11->_colorInputSize.double height = v16;
    uint64_t v17 = v11;
  }

  return v11;
}

+ (Class)classForVersion:(unint64_t)a3
{
  v9[7] = *MEMORY[0x1E4F143B8];
  v8[0] = &unk_1F26C0A30;
  v9[0] = objc_opt_class();
  v8[1] = &unk_1F26C0A48;
  v9[1] = objc_opt_class();
  v8[2] = &unk_1F26C0A60;
  v9[2] = objc_opt_class();
  v8[3] = &unk_1F26C0A78;
  v9[3] = objc_opt_class();
  v8[4] = &unk_1F26C0A90;
  v9[4] = objc_opt_class();
  v8[5] = &unk_1F26C0AA8;
  v9[5] = objc_opt_class();
  v8[6] = &unk_1F26C0AC0;
  v9[6] = objc_opt_class();
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:7];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  v6 = [v4 objectForKeyedSubscript:v5];

  return (Class)v6;
}

- (void)setRenderingVersion:(unint64_t)a3
{
  if (self->_renderIntegration)
  {
    if (self->_renderingVersion != a3)
    {
      v3 = _PTLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        -[PTRenderPipelineState setRenderingVersion:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  else
  {
    self->_renderingVersion = a3;
  }
}

- (void)adjustScissorRect:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  long long v15 = 0u;
  int64x2_t v16 = 0u;
  if (!v4)
  {
    int64x2_t v16 = 0uLL;
LABEL_10:
    long long v15 = 0uLL;
    uint64_t v12 = [v5 destinationColor];
    v16.i64[0] = [v12 width];

    uint64_t v13 = [v5 destinationColor];
    v16.i64[1] = [v13 height];

    goto LABEL_11;
  }
  [v4 scissorRect];
  if (*(_OWORD *)&v16 == 0 || ![(PTMetalContext *)self->_metalContext imageblocksSupported]) {
    goto LABEL_10;
  }
  int v6 = v15;
  if (v15)
  {
    int v6 = v15 - 1;
    *(void *)&long long v15 = v15 - 1;
    ++v16.i64[0];
  }
  int v7 = DWORD2(v15);
  if (BYTE8(v15))
  {
    int v7 = DWORD2(v15) - 1;
    --*((void *)&v15 + 1);
    ++v16.i64[1];
  }
  int32x2_t v8 = vmovn_s64(v16);
  v9.i64[0] = v6;
  v9.i64[1] = v7;
  float64x2_t v10 = vsubq_f64((float64x2_t)self->_colorOutputSizeCropped, vcvtq_f64_s64(v9));
  v9.i64[0] = v8.i32[0] | 1;
  v9.i64[1] = v8.i32[1] | 1;
  float64x2_t v11 = vcvtq_f64_s64(v9);
  int64x2_t v16 = (int64x2_t)vcvtq_u64_f64((float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v10, v11), (int8x16_t)v11, (int8x16_t)v10));
LABEL_11:
  v14[0] = v15;
  v14[1] = v16;
  [v5 setScissorRect:v14];
}

- (int)encodeRenderTo:(id)a3 withRenderRequest:(id)a4
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(PTRenderPipelineState *)self prepareForRendering:0])
  {
    if (![v6 status] || objc_msgSend(v6, "status") == 1)
    {
      if (!self->_intermediateOutput)
      {
        [(PTRenderPipelineState *)self adjustScissorRect:v7];
        int64x2_t v9 = 0;
        goto LABEL_26;
      }
      int32x2_t v8 = [v7 destinationColor];
      [v8 copyMetadataTo:self->_intermediateOutput];

      int64x2_t v9 = [v7 destinationColor];
      [v7 setDestinationColor:self->_intermediateOutput];
      if (v7)
      {
        double width = self->_colorOutputSize.width;
        double height = self->_colorOutputSize.height;
        [v7 scissorRect];
        if (!(void)v89
          && __PAIR128__(*((unint64_t *)&v89 + 1), 0) == (unint64_t)v90
          && !*((void *)&v90 + 1))
        {
          memset(buf, 0, sizeof(buf));
          goto LABEL_24;
        }
        [v7 scissorRect];
        if (v86[2] != 0 || v87 != (unint64_t)width || v88 != (unint64_t)height)
        {
          uint64_t v12 = _PTLogSystem();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.6(v12, v13, v14, v15, v16, v17, v18, v19);
          }

LABEL_16:
          int v20 = -2;
LABEL_59:

          goto LABEL_60;
        }
      }
      else
      {
        long long v89 = 0u;
        long long v90 = 0u;
      }
      memset(buf, 0, sizeof(buf));
      if (!v7)
      {
        *(_OWORD *)&buf[16] = 0uLL;
LABEL_25:
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        *(void *)&buf[16] = [(PTTexture *)self->_intermediateOutput width];
        *(void *)&buf[24] = [(PTTexture *)self->_intermediateOutput height];
        v86[0] = *(_OWORD *)buf;
        v86[1] = *(_OWORD *)&buf[16];
        [v7 setScissorRect:v86];
LABEL_26:
        v21 = [v7 sourceColor];
        uint64_t v22 = [v21 width];
        [(PTRenderPipelineDescriptor *)self->_pipelineDescritor colorInputSize];
        if (v22 == (int)v23)
        {
          double v24 = [v7 sourceColor];
          uint64_t v25 = [v24 height];
          [(PTRenderPipelineDescriptor *)self->_pipelineDescritor colorInputSize];
          int v27 = (int)v26;

          if (v25 == v27) {
            goto LABEL_35;
          }
        }
        else
        {
        }
        v28 = _PTLogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.5((id *)&self->_pipelineDescritor, v7, v28);
        }

        unint64_t v29 = _PTLogSystem();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.4(v29, v30, v31, v32, v33, v34, v35, v36);
        }

LABEL_35:
        v37 = [v7 destinationColor];
        if ([v37 width] == (int)self->_colorOutputSize.width)
        {
          v38 = [v7 destinationColor];
          uint64_t v39 = [v38 height];
          int v40 = (int)self->_colorOutputSize.height;

          if (v39 == v40) {
            goto LABEL_44;
          }
        }
        else
        {
        }
        v41 = _PTLogSystem();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          CGFloat v79 = self->_colorOutputSize.width;
          CGFloat v80 = self->_colorOutputSize.height;
          v81 = [v7 destinationColor];
          uint64_t v82 = [v81 width];
          v83 = [v7 destinationColor];
          uint64_t v84 = [v83 height];
          *(_DWORD *)buf = 134218752;
          *(CGFloat *)&buf[4] = v79;
          *(_WORD *)&buf[12] = 2048;
          *(CGFloat *)&buf[14] = v80;
          *(_WORD *)&buf[22] = 2048;
          *(void *)&buf[24] = v82;
          __int16 v92 = 2048;
          uint64_t v93 = v84;
          _os_log_error_impl(&dword_1D0778000, v41, OS_LOG_TYPE_ERROR, "Invalid output size. Expected %f %f. Was %lu %lu", buf, 0x2Au);
        }
        v42 = _PTLogSystem();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          -[PTRenderPipelineState encodeRenderTo:withRenderRequest:](v42, v43, v44, v45, v46, v47, v48, v49);
        }

LABEL_44:
        v50 = [v7 sourceColor];
        v51 = [v50 transferFunction];
        v52 = [v7 destinationColor];
        v53 = [v52 transferFunction];
        if ([v51 isEqual:v53])
        {
        }
        else
        {
          v54 = [v7 sourceColor];
          v55 = [v54 transferFunction];
          if (v55)
          {
          }
          else
          {
            [v7 destinationColor];
            v56 = v85 = v9;
            v57 = [v56 transferFunction];

            int64x2_t v9 = v85;
            if (!v57) {
              goto LABEL_54;
            }
          }
          v58 = _PTLogSystem();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
            -[PTRenderPipelineState encodeRenderTo:withRenderRequest:](v7, v58);
          }

          v50 = _PTLogSystem();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
            -[PTRenderPipelineState encodeRenderTo:withRenderRequest:](v50, v59, v60, v61, v62, v63, v64, v65);
          }
        }

LABEL_54:
        int v20 = [(RenderingIntegration *)self->_renderIntegration renderContinuousWithSource:v6 renderRequest:v7];
        if (self->_intermediateOutput)
        {
          BOOL v66 = [(PTRenderPipelineDescriptor *)self->_pipelineDescritor useRGBA];
          util = self->_util;
          intermediateOutput = self->_intermediateOutput;
          int64x2_t v9 = v9;
          v69 = intermediateOutput;
          v70 = v69;
          if (v66)
          {
            v71 = [(PTTexture *)v69 texRGBA];
            v72 = [v9 texRGBA];

            uint64_t colorOutputRotationDegrees = self->_colorOutputRotationDegrees;
            v74 = util;
          }
          else
          {
            v75 = [(PTTexture *)v69 texLuma];
            v76 = [v9 texLuma];
            [(PTUtil *)util rotateTexture:v6 inTex:v75 outTex:v76 rotationDegrees:self->_colorOutputRotationDegrees];

            v77 = self->_util;
            v71 = [(PTTexture *)v70 texChroma];
            v72 = [v9 texChroma];

            uint64_t colorOutputRotationDegrees = self->_colorOutputRotationDegrees;
            v74 = v77;
          }
          [(PTUtil *)v74 rotateTexture:v6 inTex:v71 outTex:v72 rotationDegrees:colorOutputRotationDegrees];

          [v7 setDestinationColor:v9];
        }
        goto LABEL_59;
      }
LABEL_24:
      [v7 scissorRect];
      goto LABEL_25;
    }
    int64x2_t v9 = _PTLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[PTRenderPipelineState encodeRenderTo:withRenderRequest:].cold.7(v6, v9);
    }
    goto LABEL_16;
  }
  int v20 = -1;
LABEL_60:

  return v20;
}

- (float)cameraIntrinsicMatrix
{
  +[PTRaytracingUtils frameWidth];
  float v3 = v2 / *(double *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 184);
  if (*(float *)&v4 < *((float *)&v4 + 1)) {
    LODWORD(v4) = HIDWORD(*(void *)(a1 + 184));
  }
  float v5 = *(float *)(a1 + 144) / 1000.0 * *(float *)&v4;
  __asm { FMOV            V2.4S, #1.0 }
  return v5 / v3;
}

- (BOOL)prepareForRendering
{
  return [(PTRenderPipelineState *)self prepareForRendering:0];
}

- (int)quality
{
  return self->quality;
}

- (NSString)description
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (int)sourceColorBitDepth
{
  return self->sourceColorBitDepth;
}

- (float)noiseScaleFactor
{
  return self->noiseScaleFactor;
}

- (void)setNoiseScaleFactor:(float)a3
{
  self->noiseScaleFactor = a3;
}

- (int)hwModelID
{
  return self->hwModelID;
}

- (void)setHwModelID:(int)a3
{
  self->hwModelID = a3;
}

- (float)focalLenIn35mmFilm
{
  return self->focalLenIn35mmFilm;
}

- (void)setFocalLenIn35mmFilm:(float)a3
{
  self->focalLenIn35mmFilm = a3;
}

- (int)conversionGain
{
  return self->conversionGain;
}

- (void)setConversionGain:(int)a3
{
  self->conversionGain = a3;
}

- (int)readNoise_1x
{
  return self->readNoise_1x;
}

- (void)setReadNoise_1x:(int)a3
{
  self->readNoise_1x = a3;
}

- (int)readNoise_8x
{
  return self->readNoise_8x;
}

- (void)setReadNoise_8x:(int)a3
{
  self->readNoise_8x = a3;
}

- (int)rawSensorHeight
{
  return self->rawSensorHeight;
}

- (void)setRawSensorHeight:(int)a3
{
  self->rawSensorHeight = a3;
}

- (int)rawSensorWidth
{
  return self->rawSensorWidth;
}

- (void)setRawSensorWidth:(int)a3
{
  self->rawSensorWidth = a3;
}

- (CGRect)totalSensorCrop
{
  double x = self->totalSensorCrop.origin.x;
  double y = self->totalSensorCrop.origin.y;
  double width = self->totalSensorCrop.size.width;
  double height = self->totalSensorCrop.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTotalSensorCrop:(CGRect)a3
{
  self->totalSensorCrop = a3;
}

- (double)visCropFactor
{
  return *(double *)(a1 + 184);
}

- (void)setVisCropFactor:(PTRenderPipelineState *)self
{
  *(void *)self->visCropFactor = v2;
}

- (int)sensorID
{
  return self->sensorID;
}

- (void)setSensorID:(int)a3
{
  self->sensorID = a3;
}

- (float)networkBias
{
  return self->networkBias;
}

- (void)setNetworkBias:(float)a3
{
  self->networkBias = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->description, 0);
  objc_storeStrong((id *)&self->_intermediateOutput, 0);
  objc_storeStrong((id *)&self->_util, 0);
  objc_storeStrong((id *)&self->_renderEffects, 0);
  objc_storeStrong((id *)&self->_renderIntegration, 0);
  objc_storeStrong((id *)&self->_pipelineDescritor, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

- (void)setRenderingVersion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)prepareForRendering:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeRenderTo:(uint64_t)a3 withRenderRequest:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeRenderTo:(void *)a1 withRenderRequest:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 sourceColor];
  float v5 = [v4 transferFunction];
  id v6 = [a1 destinationColor];
  id v7 = [v6 transferFunction];
  int v8 = 138412546;
  int64x2_t v9 = v5;
  __int16 v10 = 2112;
  float64x2_t v11 = v7;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Invalid transferfunction. Input %@ output %@", (uint8_t *)&v8, 0x16u);
}

- (void)encodeRenderTo:(uint64_t)a3 withRenderRequest:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeRenderTo:(uint64_t)a3 withRenderRequest:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeRenderTo:(NSObject *)a3 withRenderRequest:.cold.5(id *a1, void *a2, NSObject *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [*a1 colorInputSize];
  uint64_t v7 = v6;
  [*a1 colorInputSize];
  uint64_t v9 = v8;
  __int16 v10 = [a2 sourceColor];
  uint64_t v11 = [v10 width];
  uint64_t v12 = [a2 sourceColor];
  int v13 = 134218752;
  uint64_t v14 = v7;
  __int16 v15 = 2048;
  uint64_t v16 = v9;
  __int16 v17 = 2048;
  uint64_t v18 = v11;
  __int16 v19 = 2048;
  uint64_t v20 = [v12 height];
  _os_log_error_impl(&dword_1D0778000, a3, OS_LOG_TYPE_ERROR, "Invalid input size. Expected %f %f. Was %lu %lu", (uint8_t *)&v13, 0x2Au);
}

- (void)encodeRenderTo:(uint64_t)a3 withRenderRequest:(uint64_t)a4 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeRenderTo:(void *)a1 withRenderRequest:(NSObject *)a2 .cold.7(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 status];
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Invalid commandbuffer state %lu", (uint8_t *)&v3, 0xCu);
}

@end