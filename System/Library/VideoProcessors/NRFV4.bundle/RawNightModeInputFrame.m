@interface RawNightModeInputFrame
- (CGSize)size;
- (RawNightModeInputFrame)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 cameraInfoByPortType:(id)a4;
- (float)calculateNormalisedFaceScore;
- (float)calculateNormalisedGlobalScore;
- (float)maxFaceArea;
- (float)normalisedFaceSharpness;
- (float)normalisedGlobalSharpness;
- (id)description;
- (id)portType;
- (int)initFrameProperties;
- (int)numberOfRelevantFaces;
- (int)updateGDCParameters;
- (uint64_t)bindTexturesWithConfig:(void *)a3 metalContext:;
- (uint64_t)blendingWeight;
- (uint64_t)cfaLayout;
- (uint64_t)firstPix;
- (uint64_t)gdcParams;
- (uint64_t)lensShadingCorrectionGainMapParameters;
- (uint64_t)lscGainsTex;
- (uint64_t)metadata;
- (uint64_t)pixelBuffer;
- (uint64_t)processingConfig;
- (uint64_t)properties;
- (uint64_t)quadraBinningFactor;
- (uint64_t)sampleBuffer;
- (uint64_t)shiftMap;
- (uint64_t)textures;
- (void)dealloc;
- (void)releaseInputResources;
- (void)setBlendingWeight:(uint64_t)a1;
- (void)setLensShadingCorrectionGainMapParameters:(uint64_t)a1;
- (void)setLscGainsTex:(uint64_t)a1;
- (void)setShiftMap:(uint64_t)a1;
@end

@implementation RawNightModeInputFrame

- (uint64_t)sampleBuffer
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)pixelBuffer
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (RawNightModeInputFrame)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 cameraInfoByPortType:(id)a4
{
  id v7 = a4;
  if (!a3
    || (v36.receiver = self,
        v36.super_class = (Class)RawNightModeInputFrame,
        v8 = [(RawNightModeInputFrame *)&v36 init],
        (self = v8) == 0))
  {
    FigDebugAssert3();
LABEL_30:
    v22 = 0;
    goto LABEL_33;
  }
  objc_storeStrong((id *)&v8->_cameraInfoByPortType, a4);
  if (!self->_cameraInfoByPortType) {
    goto LABEL_30;
  }
  CMSampleBufferGetPresentationTimeStamp(&v35, a3);
  self->_pts = ($95D729B680665BEAEFA1D6FCA8238556)v35;
  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x263F2EF78], 0);
  v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  metadata = self->_metadata;
  self->_metadata = v9;

  if (!self->_metadata) {
    goto LABEL_30;
  }
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer) {
    goto LABEL_30;
  }
  v12 = ImageBuffer;
  v13 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:*MEMORY[0x263F2F510]];
  v14 = v13;
  if (v13) {
    unsigned __int16 v15 = [v13 unsignedIntValue];
  }
  else {
    unsigned __int16 v15 = 0;
  }
  v16 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:*MEMORY[0x263F2F6C0]];

  if (v16) {
    char v17 = [v16 intValue];
  }
  else {
    char v17 = -1;
  }
  v18 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:*MEMORY[0x263F2F3C8]];

  if (v18) {
    char v19 = [v18 intValue];
  }
  else {
    char v19 = -1;
  }
  v20 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:*MEMORY[0x263F2F638]];

  if (v20) {
    char v21 = [v20 BOOLValue];
  }
  else {
    char v21 = 0;
  }
  v22 = [(NSMutableDictionary *)self->_metadata objectForKeyedSubscript:*MEMORY[0x263F2F5D8]];

  if (v22) {
    char v23 = [v22 BOOLValue];
  }
  else {
    char v23 = 0;
  }
  self->_frameID.var0.captureIndex = v15;
  self->_frameID.var0.isSIFR = v21;
  self->_frameID.var0.isPB = v23;
  self->_frameID.var0.timeMachineIndex = v17;
  self->_frameID.var0.bracketedCaptureIndex = v19;
  *((_WORD *)&self->_frameID.var0 + 3) = 0;
  self->_sampleBuffer = (opaqueCMSampleBuffer *)CFRetain(a3);
  self->_pixelBuffer = CVPixelBufferRetain(v12);
  v24 = (NRFFrameProperties *)objc_opt_new();
  properties = self->_properties;
  self->_properties = v24;

  if (!self->_properties || [(RawNightModeInputFrame *)self initFrameProperties]) {
    goto LABEL_33;
  }
  int Pixel = determineFirstPixel(self->_pixelBuffer, self->_metadata);
  self->_firstPix = Pixel;
  if (Pixel == -1
    || (int v27 = determineCFALayout(self->_pixelBuffer, self->_metadata), (self->_cfaLayout = v27) == 0))
  {
    FigDebugAssert3();
    goto LABEL_32;
  }
  v28 = ($0B57B161DD08FFA902CA30037FAFD2DD *)malloc_type_calloc(1uLL, 0x70uLL, 0x1000040E517AD6CuLL);
  self->_gdcParams = v28;
  if (!v28)
  {
LABEL_33:
    v33 = 0;
    goto LABEL_28;
  }
  unsigned int v29 = [(NSMutableDictionary *)self->_metadata cmi_unsignedIntValueForKey:*MEMORY[0x263F2F5E0] defaultValue:1 found:0];
  self->_quadraBinningFactor = v29;
  if (!v29)
  {
LABEL_32:
    FigSignalErrorAt();
    goto LABEL_33;
  }
  v30 = CMSampleBufferGetImageBuffer(self->_sampleBuffer);
  self->_size.width = (double)CVPixelBufferGetWidthOfPlane(v30, 0);
  self->_size.height = (double)CVPixelBufferGetHeightOfPlane(v30, 0);
  [(RawNightModeInputFrame *)self calculateNormalisedFaceScore];
  self->_normalisedFaceSharpness = v31;
  [(RawNightModeInputFrame *)self calculateNormalisedGlobalScore];
  self->_normalisedGlobalSharpness = v32;
  self = self;
  v33 = self;
LABEL_28:

  return v33;
}

- (int)initFrameProperties
{
  size_t WidthOfPlane = CVPixelBufferGetWidthOfPlane(self->_pixelBuffer, 0);
  size_t HeightOfPlane = CVPixelBufferGetHeightOfPlane(self->_pixelBuffer, 0);
  metadata = self->_metadata;
  v6 = [(NRFFrameProperties *)self->_properties meta];
  int FrameMetadata = loadFrameMetadata(metadata, v6, WidthOfPlane, HeightOfPlane, WidthOfPlane, HeightOfPlane, 1, 0);

  if (FrameMetadata)
  {
    FigDebugAssert3();
  }
  else
  {
    v8 = [(NRFFrameProperties *)self->_properties colorSpaceConversionParameters];
    v9 = v8;
    uint64_t v10 = 0;
    *(_OWORD *)&v8[2].transferFunctionInv.nonLinearBias = xmmword_26337FFE0;
    *(_OWORD *)&v8[2].chromaBias = xmmword_26337FFF0;
    *(void *)&v8[3].transferFunctionFwd.nonLinearScale = 0x3F80000000000000;
    long long v31 = *(_OWORD *)byte_263380000;
    long long v32 = *(_OWORD *)&byte_263380000[16];
    simd_float4 v34 = 0u;
    simd_float4 v35 = 0u;
    simd_float4 v36 = 0u;
    long long v33 = *(_OWORD *)&byte_263380000[32];
    do
    {
      *(float32x4_t *)((char *)&v34 + v10) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(*(long long *)((char *)&v31 + v10))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v31 + v10), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v31 + v10), 2);
      v10 += 16;
    }
    while (v10 != 48);
    v37.columns[0] = v34;
    v37.columns[1] = v35;
    v37.columns[2] = v36;
    *(simd_float4 *)&v8->chromaBias = v34;
    *(simd_float4 *)&v8[1].transferFunctionFwd.nonLinearScale = v37.columns[1];
    *(simd_float4 *)&v8[1].transferFunctionInv.linearThreshold = v37.columns[2];
    v37.columns[3] = (simd_float4)xmmword_263380060;
    simd_float4x4 v38 = __invert_f4(v37);
    *(simd_float4 *)&v9->transferFunctionFwd.linearScale = v38.columns[0];
    *(simd_float4 *)&v9->transferFunctionFwd.nonLinearPower = v38.columns[1];
    *(simd_float4 *)&v9->transferFunctionInv.nonLinearBias = v38.columns[2];
    v9[3].transferFunctionFwd.nonLinearPower = 1.0 / v9[3].transferFunctionInv.linearScale;
    uint64_t v11 = MEMORY[0x263EF89A0];
    long long v29 = *(_OWORD *)(MEMORY[0x263EF89A0] + 16);
    long long v30 = *MEMORY[0x263EF89A0];
    *(_OWORD *)&v9[1].finalScaleFwd = *MEMORY[0x263EF89A0];
    *(_OWORD *)&v9[2].transferFunctionFwd.linearScale = v29;
    long long v28 = *(_OWORD *)(v11 + 32);
    *(_OWORD *)&v9[2].transferFunctionFwd.nonLinearPower = v28;
    LODWORD(v9[3].transferFunctionInv.nonLinearScale) = 65792;
    *(void *)&v9[3].transferFunctionInv.linearScale = 0x3F0000003F800000;
    [(NRFFrameProperties *)self->_properties setInputColorSpace:2];
    v12 = [(NRFFrameProperties *)self->_properties colorSpaceConversionParameters];
    *(_OWORD *)&v12[2].transferFunctionInv.nonLinearBias = xmmword_26337FFE0;
    *(_OWORD *)&v12[2].chromaBias = xmmword_26337FFF0;
    *(void *)&v12[3].transferFunctionFwd.nonLinearScale = 0x3F80000000000000;
    v13 = [(NRFFrameProperties *)self->_properties colorSpaceConversionParameters];
    uint64_t v14 = 0;
    long long v31 = *(_OWORD *)byte_263380000;
    long long v32 = *(_OWORD *)&byte_263380000[16];
    long long v33 = *(_OWORD *)&byte_263380000[32];
    simd_float4 v34 = 0u;
    simd_float4 v35 = 0u;
    simd_float4 v36 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v34 + v14) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_2633802E0, COERCE_FLOAT(*(long long *)((char *)&v31 + v14))), (float32x4_t)xmmword_263380310, *(float32x2_t *)((char *)&v31 + v14), 1), (float32x4_t)xmmword_26337FF50, *(float32x4_t *)((char *)&v31 + v14), 2);
      v14 += 16;
    }
    while (v14 != 48);
    simd_float4 v15 = v35;
    simd_float4 v16 = v36;
    *(simd_float4 *)&v13->chromaBias = v34;
    *(simd_float4 *)&v13[1].transferFunctionFwd.nonLinearScale = v15;
    *(simd_float4 *)&v13[1].transferFunctionInv.linearThreshold = v16;
    char v17 = [(NRFFrameProperties *)self->_properties colorSpaceConversionParameters];
    v39.columns[0] = *(simd_float4 *)&v17->chromaBias;
    v39.columns[1] = *(simd_float4 *)&v17[1].transferFunctionFwd.nonLinearScale;
    v39.columns[2] = *(simd_float4 *)&v17[1].transferFunctionInv.linearThreshold;
    v39.columns[3] = (simd_float4)xmmword_263380060;
    simd_float4x4 v40 = __invert_f4(v39);
    *(simd_float4 *)&v17->transferFunctionFwd.linearScale = v40.columns[0];
    *(simd_float4 *)&v17->transferFunctionFwd.nonLinearPower = v40.columns[1];
    *(simd_float4 *)&v17->transferFunctionInv.nonLinearBias = v40.columns[2];
    v17[3].transferFunctionFwd.nonLinearPower = 1.0 / v17[3].transferFunctionInv.linearScale;
    [(NRFFrameProperties *)self->_properties setToneCurve:0xFFFFFFFFLL];
    *(unsigned char *)([(NRFFrameProperties *)self->_properties colorSpaceConversionParameters]
             + 196) = 1;
    *(unsigned char *)([(NRFFrameProperties *)self->_properties colorSpaceConversionParameters]
             + 198) = 0;
    v18 = [(NRFFrameProperties *)self->_properties colorSpaceConversionParameters];
    char v19 = [(NRFFrameProperties *)self->_properties meta];
    [v19 colorCorrectionMatrix];
    v18[1].chromaBias = v20;
    v18[2].transferFunctionFwd.nonLinearScale = v21;
    *(void *)&v18[1].finalScaleFwd = v22;
    *(void *)&v18[2].transferFunctionFwd.linearScale = v23;
    v18[2].transferFunctionInv.linearThreshold = v24;
    *(void *)&v18[2].transferFunctionFwd.nonLinearPower = v25;

    v26 = [(NRFFrameProperties *)self->_properties regHomography];
    *(_OWORD *)v26 = v30;
    *((_OWORD *)v26 + 1) = v29;
    *((_OWORD *)v26 + 2) = v28;
  }
  return FrameMetadata;
}

- (float)calculateNormalisedFaceScore
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  char v49 = 0;
  v3 = objc_opt_new();
  *(void *)&self->_float maxFaceArea = 0;
  v4 = self->_metadata;
  v5 = v4;
  if (!v4
    || ([(NSMutableDictionary *)v4 objectForKeyedSubscript:@"SharpnessScore"],
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
LABEL_32:
    double v18 = 0.0;
    goto LABEL_29;
  }
  id v7 = v6;
  uint64_t v8 = [v6 objectForKeyedSubscript:@"FaceScores"];
  if (!v8)
  {
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_32;
  }
  v9 = (void *)v8;
  simd_float4x4 v40 = v7;
  simd_float4x4 v38 = v5;
  uint64_t v10 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:*MEMORY[0x263F2F440]];
  uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F2F288]];
  v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F2F290]];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v46 != v16) {
          objc_enumerationMutation(v13);
        }
        [v3 addObject:*(void *)(*((void *)&v45 + 1) + 8 * i)];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v15);
  }

  double v18 = 0.0;
  simd_float4x4 v39 = v10;
  if (v3)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v19 = v3;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v41 objects:v50 count:16];
    float v21 = (uint64_t *)MEMORY[0x263F2F620];
    if (v20)
    {
      uint64_t v22 = v20;
      uint64_t v23 = *(void *)v42;
      uint64_t v24 = *MEMORY[0x263F2F620];
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v42 != v23) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * j), "cmi_cgRectForKey:defaultValue:found:", v24, &v49, 0.0, 0.0, 0.0, 0.0);
          if (v26 * v27 <= self->_maxFaceArea) {
            float maxFaceArea = self->_maxFaceArea;
          }
          else {
            float maxFaceArea = v26 * v27;
          }
          self->_float maxFaceArea = maxFaceArea;
        }
        uint64_t v22 = [v19 countByEnumeratingWithState:&v41 objects:v50 count:16];
      }
      while (v22);
    }

    uint64_t v29 = [v9 count];
    if (v29 == [v19 count])
    {
      v5 = v38;
      if ([v19 count])
      {
        unint64_t v30 = 0;
        uint64_t v31 = *v21;
        double v18 = 0.0;
        do
        {
          long long v32 = [v19 objectAtIndexedSubscript:v30];
          objc_msgSend(v32, "cmi_cgRectForKey:defaultValue:found:", v31, &v49, 0.0, 0.0, 0.0, 0.0);
          if (v33 * v34 > self->_maxFaceArea * 0.25)
          {
            ++self->_numberOfRelevantFaces;
            simd_float4 v35 = objc_msgSend(v9, "objectAtIndexedSubscript:", v30, v33 * v34);
            [v35 doubleValue];
            double v18 = v18 + v36;
          }
          ++v30;
        }
        while ([v19 count] > v30);
      }
      goto LABEL_28;
    }
    FigDebugAssert3();
    FigSignalErrorAt();
  }
  v5 = v38;
LABEL_28:

LABEL_29:
  return v18;
}

- (float)calculateNormalisedGlobalScore
{
  char v14 = 0;
  v2 = self->_metadata;
  v3 = v2;
  if (!v2
    || ([(NSMutableDictionary *)v2 objectForKeyedSubscript:@"SharpnessScore"],
        (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    FigDebugAssert3();
    FigSignalErrorAt();
    double v7 = 0.0;
    goto LABEL_9;
  }
  v5 = v4;
  objc_msgSend(v4, "cmi_doubleValueForKey:defaultValue:found:", @"ImageScore", &v14, 0.0);
  double v7 = v6;
  if (!v14) {
    goto LABEL_11;
  }
  [(NSMutableDictionary *)v3 cmi_floatValueForKey:*MEMORY[0x263F2F468] defaultValue:&v14 found:0.0];
  if (!v14) {
    goto LABEL_12;
  }
  float v9 = v8;
  [(NSMutableDictionary *)v3 cmi_floatValueForKey:*MEMORY[0x263F2F2C0] defaultValue:&v14 found:0.0];
  if (!v14) {
    goto LABEL_12;
  }
  float v11 = v9 * v10;
  if (v11 < 0.0)
  {
LABEL_11:
    FigDebugAssert3();
LABEL_12:
    FigSignalErrorAt();
    goto LABEL_8;
  }
  double v7 = v7 / v11;
LABEL_8:

LABEL_9:
  return v7;
}

- (void)dealloc
{
  -[RawNightModeInputFrame releaseInputResources]((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)RawNightModeInputFrame;
  [(RawNightModeInputFrame *)&v3 dealloc];
}

- (void)releaseInputResources
{
  if (a1)
  {
    if (dword_26B430EA8)
    {
      v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_super v3 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 40));
    *(void *)(a1 + 40) = 0;
    v4 = *(const void **)(a1 + 32);
    if (v4)
    {
      CFRelease(v4);
      *(void *)(a1 + 32) = 0;
    }
    FigMetalDecRef();
    FigMetalDecRef();
    free(*(void **)(a1 + 112));
  }
}

- (id)portType
{
  if (a1)
  {
    a1 = [a1[7] objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  CMTime time = (CMTime)self->_pts;
  Float64 Seconds = CMTimeGetSeconds(&time);
  uint64_t captureIndex = self->_frameID.var0.captureIndex;
  uint64_t timeMachineIndex = self->_frameID.var0.timeMachineIndex;
  uint64_t bracketedCaptureIndex = self->_frameID.var0.bracketedCaptureIndex;
  BOOL isSIFR = self->_frameID.var0.isSIFR;
  BOOL isPB = self->_frameID.var0.isPB;
  float v11 = -[RawNightModeInputFrame portType]((id *)&self->super.isa);
  v12 = [v3 stringWithFormat:@"<%@ %p> PTS=%f, captureIdx=%u, tmIdx=%d, bracketIdx=%d, isSIFR=%u, isPB=%u, portType=%@, sbuf:%p, pbuf:%p", v4, self, *(void *)&Seconds, captureIndex, timeMachineIndex, bracketedCaptureIndex, isSIFR, isPB, v11, self->_sampleBuffer, self->_pixelBuffer];

  return v12;
}

- (uint64_t)bindTexturesWithConfig:(void *)a3 metalContext:
{
  id v6 = a2;
  id v7 = a3;
  float v8 = v7;
  if (!a1) {
    goto LABEL_11;
  }
  if (!v6
    || !v7
    || *(void *)(a1 + 48)
    || ([v6 inputMTLPixelFormatForPlane],
        float v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        (uint64_t v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:v10]) == 0))
  {
    uint64_t v21 = FigSignalErrorAt();
    goto LABEL_12;
  }
  v12 = (void *)v11;
  if (!v10)
  {
LABEL_10:
    id v19 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v12;
    id v20 = v12;

    objc_storeStrong((id *)(a1 + 120), a2);
LABEL_11:
    uint64_t v21 = 0;
    goto LABEL_12;
  }
  uint64_t v13 = 0;
  while (1)
  {
    char v14 = [v6 inputMTLPixelFormatForPlane];
    uint64_t v15 = [v14 objectAtIndexedSubscript:v13];
    uint64_t v16 = [v15 unsignedIntegerValue];

    uint64_t v17 = [v8 bindPixelBufferToMTL2DTexture:*(void *)(a1 + 40) pixelFormat:v16 usage:17 plane:v13];
    if (!v17) {
      break;
    }
    double v18 = (void *)v17;
    [v12 addObject:v17];

    if (v10 == ++v13) {
      goto LABEL_10;
    }
  }
  uint64_t v21 = FigSignalErrorAt();

LABEL_12:
  return v21;
}

- (int)updateGDCParameters
{
  objc_super v3 = (void *)MEMORY[0x263F2ED78];
  gdcParams = self->_gdcParams;
  cameraInfoByPortType = self->_cameraInfoByPortType;
  id v6 = -[RawNightModeInputFrame portType]((id *)&self->super.isa);
  id v7 = [(NSDictionary *)cameraInfoByPortType objectForKeyedSubscript:v6];
  int v8 = [v3 getGDCParams:gdcParams cameraInfo:v7 metadata:self->_metadata];

  if (v8) {
    FigDebugAssert3();
  }
  return v8;
}

- (uint64_t)textures
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (uint64_t)metadata
{
  if (result) {
    return *(void *)(result + 56);
  }
  return result;
}

- (uint64_t)properties
{
  if (result) {
    return *(void *)(result + 72);
  }
  return result;
}

- (uint64_t)shiftMap
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (void)setShiftMap:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (uint64_t)blendingWeight
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (void)setBlendingWeight:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (uint64_t)firstPix
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

- (uint64_t)cfaLayout
{
  if (result) {
    return *(unsigned int *)(result + 12);
  }
  return result;
}

- (uint64_t)quadraBinningFactor
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (uint64_t)gdcParams
{
  if (result) {
    return *(void *)(result + 112);
  }
  return result;
}

- (uint64_t)processingConfig
{
  if (result) {
    return *(void *)(result + 120);
  }
  return result;
}

- (uint64_t)lensShadingCorrectionGainMapParameters
{
  if (result) {
    return *(void *)(result + 128);
  }
  return result;
}

- (void)setLensShadingCorrectionGainMapParameters:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (uint64_t)lscGainsTex
{
  if (result) {
    return *(void *)(result + 136);
  }
  return result;
}

- (void)setLscGainsTex:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 136), a2);
  }
}

- (float)normalisedFaceSharpness
{
  return self->_normalisedFaceSharpness;
}

- (float)normalisedGlobalSharpness
{
  return self->_normalisedGlobalSharpness;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (float)maxFaceArea
{
  return self->_maxFaceArea;
}

- (int)numberOfRelevantFaces
{
  return self->_numberOfRelevantFaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lscGainsTex, 0);
  objc_storeStrong((id *)&self->_lensShadingCorrectionGainMapParameters, 0);
  objc_storeStrong((id *)&self->_processingConfig, 0);
  objc_storeStrong((id *)&self->_blendingWeight, 0);
  objc_storeStrong((id *)&self->_shiftMap, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_textures, 0);
}

@end