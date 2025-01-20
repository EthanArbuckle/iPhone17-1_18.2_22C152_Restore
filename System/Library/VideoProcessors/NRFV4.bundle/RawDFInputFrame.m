@interface RawDFInputFrame
+ (BOOL)isVersatileRegroupedRawFormat:(unsigned int)a3;
+ (unint64_t)getMetalFormat:(unsigned int)a3;
- ($0B57B161DD08FFA902CA30037FAFD2DD)gdcParameters;
- (BOOL)hasStandardMetadata;
- (CMIImagePyramid)pyramid;
- (MTLTexture)auxDraftDemosaicLumaTexture;
- (MTLTexture)auxDraftDemosaicRGBTexture;
- (MTLTexture)baseTex;
- (MTLTexture)rgbTex;
- (NRFFrameProperties)properties;
- (NSDictionary)cameraInfo;
- (NSDictionary)lscGainMapParameters;
- (NSDictionary)metadata;
- (NSNumber)bayerPattern;
- (RawDFInputFrame)init;
- (RawDFInputFrame)initWithMetalContext:(id)a3 cameraInfo:(id)a4 inputFrame:(id)a5 metadata:(id)a6 uniqueFrameId:(int)a7;
- (RawDFInputFrame)initWithMetalContext:(id)a3 cameraInfo:(id)a4 inputPixelBuffer:(__CVBuffer *)a5 metadata:(id)a6 uniqueFrameId:(int)a7;
- (RawDFInputFrame)initWithMetalContext:(id)a3 cameraInfo:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 uniqueFrameId:(int)a6;
- (__CVBuffer)auxDraftDemosaicPixelBuffer;
- (__CVBuffer)lscGainMapBuffer;
- (__CVBuffer)pixelBuffer;
- (int)_checkRgbTexConfig:(id)a3;
- (int)allocateAndDemosaic:(id)a3;
- (int)allocateRGB;
- (int)checkAndSetRgbTex:(id)a3;
- (int)commonInitWithMetalContext:(id)a3 cameraInfo:(id)a4 inputFrame:(id)a5 metadata:(id)a6 uniqueFrameId:(int)a7;
- (int)commonInitWithMetalContext:(id)a3 cameraInfo:(id)a4 inputPixelBuffer:(__CVBuffer *)a5 metadata:(id)a6 uniqueFrameId:(int)a7;
- (int)commonInitWithMetalContext:(id)a3 cameraInfo:(id)a4 inputSamplebuffer:(opaqueCMSampleBuffer *)a5 uniqueFrameId:(int)a6;
- (int)demosaicWithStage:(id)a3;
- (int)getGDCParametersWithCameraInfoByPortType:(id)a3;
- (int)getGDCParametersWithCameraInfoByPortType:(id)a3 withMetadata:(id)a4;
- (int)initFrameProperties;
- (int)prepareInputFrame;
- (int)uniqueFrameId;
- (unint64_t)bindingMetalFormat;
- (unint64_t)height;
- (unint64_t)heightAlignment;
- (unint64_t)sensorHeight;
- (unint64_t)sensorWidth;
- (unint64_t)strideAlignment;
- (unint64_t)width;
- (unsigned)pixelBufferFormat;
- (void)dealloc;
- (void)releaseBaseTex;
- (void)releaseRgbTex;
- (void)setBindingMetalFormat:(unint64_t)a3;
- (void)setHeightAlignment:(unint64_t)a3;
- (void)setProperties:(id)a3;
- (void)setStrideAlignment:(unint64_t)a3;
@end

@implementation RawDFInputFrame

- (RawDFInputFrame)init
{
  v3.receiver = self;
  v3.super_class = (Class)RawDFInputFrame;
  return [(RawDFInputFrame *)&v3 init];
}

+ (unint64_t)getMetalFormat:(unsigned int)a3
{
  unint64_t result = 25;
  if ((int)a3 <= 1278226535)
  {
    if ((int)a3 <= 642934848)
    {
      if (a3 != 642527288)
      {
        if (a3 == 642527336) {
          return result;
        }
        return 0;
      }
      return 10;
    }
    if (a3 != 642934849)
    {
      if (a3 != 1278226488) {
        return 0;
      }
      return 10;
    }
    return 115;
  }
  if ((int)a3 > 1651926375)
  {
    if (a3 != 1651926376)
    {
      if (a3 == 1815491698) {
        return 110;
      }
      return 0;
    }
  }
  else if (a3 != 1278226536)
  {
    if (a3 != 1380411457) {
      return 0;
    }
    return 115;
  }
  return result;
}

+ (BOOL)isVersatileRegroupedRawFormat:(unsigned int)a3
{
  return a3 == 1380411457 || a3 == 642934849;
}

- (int)prepareInputFrame
{
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
    unint64_t bindingMetalFormat = self->_bindingMetalFormat;
    if (!bindingMetalFormat)
    {
      unint64_t bindingMetalFormat = +[RawDFInputFrame getMetalFormat:PixelFormatType];
      self->_unint64_t bindingMetalFormat = bindingMetalFormat;
      if (!bindingMetalFormat) {
        goto LABEL_9;
      }
    }
    v6 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:self->_pixelBuffer pixelFormat:bindingMetalFormat usage:7 plane:0 widthAlignmentFactor:self->_strideAlignment heightAlignmentFactor:self->_heightAlignment];
    baseTex = self->_baseTex;
    self->_baseTex = v6;

    v8 = self->_baseTex;
    if (!v8)
    {
LABEL_9:
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      int v10 = -73323;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      return v10;
    }
  }
  else
  {
    v8 = self->_baseTex;
  }
  char isVeratileRegroupedPixelFormat = self->_isVeratileRegroupedPixelFormat;
  self->_width = [(MTLTexture *)v8 width] << isVeratileRegroupedPixelFormat;
  int v10 = 0;
  self->_height = [(MTLTexture *)self->_baseTex height] << isVeratileRegroupedPixelFormat;
  return v10;
}

- (int)commonInitWithMetalContext:(id)a3 cameraInfo:(id)a4 inputPixelBuffer:(__CVBuffer *)a5 metadata:(id)a6 uniqueFrameId:(int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  if (!v13)
  {
    v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    int v25 = -73323;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_8;
  }
  if (a7 < 0) {
    goto LABEL_14;
  }
  objc_storeStrong((id *)&self->_metal, a3);
  self->_uniqueFrameId = a7;
  if (!a5) {
    goto LABEL_14;
  }
  self->_pixelBuffer = a5;
  CFRetain(a5);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(self->_pixelBuffer);
  self->_pixelBufferFormat = PixelFormatType;
  self->_char isVeratileRegroupedPixelFormat = +[RawDFInputFrame isVersatileRegroupedRawFormat:PixelFormatType];
  v17 = (NRFFrameProperties *)objc_opt_new();
  properties = self->_properties;
  self->_properties = v17;

  if (!self->_properties) {
    goto LABEL_14;
  }
  objc_storeStrong((id *)&self->_cameraInfo, a4);
  objc_storeStrong((id *)&self->_metadata, a6);
  v19 = (NSNumber *)CVBufferCopyAttachment(a5, (CFStringRef)*MEMORY[0x263F04238], 0);
  bayerPattern = self->_bayerPattern;
  self->_bayerPattern = v19;

  char isVeratileRegroupedPixelFormat = self->_isVeratileRegroupedPixelFormat;
  self->_width = CVPixelBufferGetWidthOfPlane(self->_pixelBuffer, 0) << isVeratileRegroupedPixelFormat;
  self->_height = CVPixelBufferGetHeightOfPlane(self->_pixelBuffer, 0) << isVeratileRegroupedPixelFormat;
  int v22 = [(RawDFInputFrame *)self initFrameProperties];
  if (v22)
  {
    int v25 = v22;
    v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
LABEL_15:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_8;
  }
  v23 = [[CMIImagePyramid alloc] initWithMetalContext:self->_metal];
  pyramid = self->_pyramid;
  self->_pyramid = v23;

  if (!self->_pyramid)
  {
LABEL_14:
    v28 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    int v25 = -73323;
    goto LABEL_15;
  }
  int v25 = 0;
  self->_unint64_t bindingMetalFormat = 0;
  *(int64x2_t *)&self->_strideAlignment = vdupq_n_s64(1uLL);
LABEL_8:

  return v25;
}

- (int)commonInitWithMetalContext:(id)a3 cameraInfo:(id)a4 inputSamplebuffer:(opaqueCMSampleBuffer *)a5 uniqueFrameId:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  if (a5)
  {
    self->_sampleBuffer = a5;
    CFRetain(a5);
    v12 = CMGetAttachment(self->_sampleBuffer, (CFStringRef)*MEMORY[0x263F2EF78], 0);
    int v13 = [(RawDFInputFrame *)self commonInitWithMetalContext:v10 cameraInfo:v11 inputPixelBuffer:CMSampleBufferGetImageBuffer(self->_sampleBuffer) metadata:v12 uniqueFrameId:v6];
  }
  else
  {
    id v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    int v13 = -73323;
  }

  return v13;
}

- (int)commonInitWithMetalContext:(id)a3 cameraInfo:(id)a4 inputFrame:(id)a5 metadata:(id)a6 uniqueFrameId:(int)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (!v13)
  {
    v44 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
    int v42 = -73323;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_14;
  }
  if (a7 < 0) {
    goto LABEL_20;
  }
  objc_storeStrong((id *)&self->_metal, a3);
  self->_uniqueFrameId = a7;
  self->_pixelBuffer = 0;
  v17 = [v15 attachments];
  v18 = [v17 objectForKeyedSubscript:*MEMORY[0x263F2EF60]];
  self->_lscGainMapBuffer = v18;

  lscGainMapBuffer = self->_lscGainMapBuffer;
  if (lscGainMapBuffer) {
    CFRetain(lscGainMapBuffer);
  }
  v20 = [v15 attachments];
  v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263F2EF68]];
  lscGainMapParameters = self->_lscGainMapParameters;
  self->_lscGainMapParameters = v21;

  v23 = [v15 attachments];
  v24 = [v23 objectForKeyedSubscript:*MEMORY[0x263F2EF58]];
  self->_auxDraftDemosaicPixelBuffer = v24;

  auxDraftDemosaicPixelBuffer = self->_auxDraftDemosaicPixelBuffer;
  if (auxDraftDemosaicPixelBuffer)
  {
    v26 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:auxDraftDemosaicPixelBuffer pixelFormat:11 usage:7 plane:0];
    auxDraftDemosaicLumaTexture = self->_auxDraftDemosaicLumaTexture;
    self->_auxDraftDemosaicLumaTexture = v26;

    if (!self->_auxDraftDemosaicLumaTexture) {
      goto LABEL_20;
    }
    v28 = [(FigMetalContext *)self->_metal bindPixelBufferToMTL2DTexture:self->_auxDraftDemosaicPixelBuffer pixelFormat:520 usage:7 plane:0];
    auxDraftDemosaicRGBTexture = self->_auxDraftDemosaicRGBTexture;
    self->_auxDraftDemosaicRGBTexture = v28;

    if (!self->_auxDraftDemosaicRGBTexture) {
      goto LABEL_20;
    }
  }
  uint64_t v30 = [v15 matchingPixelBufferFormat];
  if (!v30) {
    goto LABEL_20;
  }
  self->_char isVeratileRegroupedPixelFormat = +[RawDFInputFrame isVersatileRegroupedRawFormat:v30];
  v31 = (NRFFrameProperties *)objc_opt_new();
  properties = self->_properties;
  self->_properties = v31;

  if (!self->_properties) {
    goto LABEL_20;
  }
  objc_storeStrong((id *)&self->_cameraInfo, a4);
  objc_storeStrong((id *)&self->_metadata, a6);
  v33 = [v15 texture];

  if (!v33) {
    goto LABEL_20;
  }
  v34 = [v15 texture];
  baseTex = self->_baseTex;
  self->_baseTex = v34;

  FigMetalIncRef();
  self->_unint64_t bindingMetalFormat = [(MTLTexture *)self->_baseTex pixelFormat];
  uint64_t v36 = [v15 attachments];
  v37 = [(id)v36 objectForKeyedSubscript:*MEMORY[0x263F04238]];
  bayerPattern = self->_bayerPattern;
  self->_bayerPattern = v37;

  self->_pixelBufferFormat = [v15 matchingPixelBufferFormat];
  LOBYTE(v36) = self->_isVeratileRegroupedPixelFormat;
  self->_width = [(MTLTexture *)self->_baseTex width] << v36;
  self->_height = [(MTLTexture *)self->_baseTex height] << v36;
  int v39 = [(RawDFInputFrame *)self initFrameProperties];
  if (v39)
  {
    int v42 = v39;
    v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
LABEL_21:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_14;
  }
  v40 = [[CMIImagePyramid alloc] initWithMetalContext:self->_metal];
  pyramid = self->_pyramid;
  self->_pyramid = v40;

  if (!self->_pyramid)
  {
LABEL_20:
    v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
    int v42 = -73323;
    goto LABEL_21;
  }
  int v42 = 0;
  *(int64x2_t *)&self->_strideAlignment = vdupq_n_s64(1uLL);
LABEL_14:

  return v42;
}

- (RawDFInputFrame)initWithMetalContext:(id)a3 cameraInfo:(id)a4 inputPixelBuffer:(__CVBuffer *)a5 metadata:(id)a6 uniqueFrameId:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)RawDFInputFrame;
  id v15 = [(RawDFInputFrame *)&v20 init];
  id v16 = v15;
  if (v15)
  {
    if ([(RawDFInputFrame *)v15 commonInitWithMetalContext:v12 cameraInfo:v13 inputPixelBuffer:a5 metadata:v14 uniqueFrameId:v7])
    {
      v17 = 0;
    }
    else
    {
      v17 = v16;
    }
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  return v18;
}

- (RawDFInputFrame)initWithMetalContext:(id)a3 cameraInfo:(id)a4 inputFrame:(id)a5 metadata:(id)a6 uniqueFrameId:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21.receiver = self;
  v21.super_class = (Class)RawDFInputFrame;
  id v16 = [(RawDFInputFrame *)&v21 init];
  v17 = v16;
  if (v16)
  {
    if ([(RawDFInputFrame *)v16 commonInitWithMetalContext:v12 cameraInfo:v13 inputFrame:v14 metadata:v15 uniqueFrameId:v7])
    {
      v18 = 0;
    }
    else
    {
      v18 = v17;
    }
  }
  else
  {
    v18 = 0;
  }
  v19 = v18;

  return v19;
}

- (RawDFInputFrame)initWithMetalContext:(id)a3 cameraInfo:(id)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 uniqueFrameId:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)RawDFInputFrame;
  id v12 = [(RawDFInputFrame *)&v17 init];
  id v13 = v12;
  if (v12)
  {
    if ([(RawDFInputFrame *)v12 commonInitWithMetalContext:v10 cameraInfo:v11 inputSamplebuffer:a5 uniqueFrameId:v6])
    {
      id v14 = 0;
    }
    else
    {
      id v14 = v13;
    }
  }
  else
  {
    id v14 = 0;
  }
  id v15 = v14;

  return v15;
}

- (int)getGDCParametersWithCameraInfoByPortType:(id)a3 withMetadata:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (NSDictionary *)a4;
  if (!v7)
  {
    if (!self->_hasStandardMetadata || (metadata = self->_metadata) == 0)
    {
      objc_super v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      int v14 = -73323;
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      uint64_t v7 = 0;
LABEL_15:
      free(self->_gdcParameters);
      self->_gdcParameters = 0;
      goto LABEL_8;
    }
    uint64_t v7 = metadata;
  }
  if (self->_gdcParameters
    || (v9 = ($0B57B161DD08FFA902CA30037FAFD2DD *)malloc_type_calloc(1uLL, 0x70uLL, 0x1000040E517AD6CuLL),
        (self->_gdcParameters = v9) == 0))
  {
    id v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    int v14 = -73323;
LABEL_14:
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_15;
  }
  id v10 = v9;
  id v11 = (void *)MEMORY[0x263F2ED78];
  id v12 = [(NSDictionary *)v7 objectForKeyedSubscript:*MEMORY[0x263F2F5C8]];
  id v13 = [v6 objectForKeyedSubscript:v12];
  int v14 = [v11 getGDCParams:v10 cameraInfo:v13 metadata:v7];

  if (v14)
  {
    id v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    goto LABEL_14;
  }
LABEL_8:

  return v14;
}

- (int)getGDCParametersWithCameraInfoByPortType:(id)a3
{
  return [(RawDFInputFrame *)self getGDCParametersWithCameraInfoByPortType:a3 withMetadata:0];
}

- (int)allocateRGB
{
  objc_super v3 = [(FigMetalContext *)self->_metal allocator];
  v4 = (void *)[v3 newTextureDescriptor];

  if (v4)
  {
    char isVeratileRegroupedPixelFormat = self->_isVeratileRegroupedPixelFormat;
    id v6 = [v4 desc];
    [v6 setTextureType:2];

    uint64_t v7 = [(MTLTexture *)self->_baseTex width] << isVeratileRegroupedPixelFormat;
    v8 = [v4 desc];
    [v8 setWidth:v7];

    uint64_t v9 = [(MTLTexture *)self->_baseTex height] << isVeratileRegroupedPixelFormat;
    id v10 = [v4 desc];
    [v10 setHeight:v9];

    id v11 = [v4 desc];
    [v11 setUsage:7];

    id v12 = [v4 desc];
    [v12 setPixelFormat:115];

    [v4 setLabel:0];
    id v13 = [(FigMetalContext *)self->_metal allocator];
    int v14 = (MTLTexture *)[v13 newTextureWithDescriptor:v4];
    rgbTex = self->_rgbTex;
    self->_rgbTex = v14;

    if (self->_rgbTex)
    {
      int v16 = 0;
    }
    else
    {
      v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      int v16 = -73323;
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    int v16 = -73323;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v16;
}

- (int)allocateAndDemosaic:(id)a3
{
  id v4 = a3;
  int v5 = [(RawDFInputFrame *)self allocateRGB];
  if (v5)
  {
    int v6 = v5;
    goto LABEL_5;
  }
  int v6 = [(RawDFInputFrame *)self demosaicWithStage:v4];
  if (v6) {
LABEL_5:
  }
    FigDebugAssert3();

  return v6;
}

- (int)_checkRgbTexConfig:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (v4
    && (!self->_baseTex
     || (char isVeratileRegroupedPixelFormat = self->_isVeratileRegroupedPixelFormat,
         uint64_t v7 = [v4 width],
         v7 == [(MTLTexture *)self->_baseTex width] << isVeratileRegroupedPixelFormat)
     && (uint64_t v8 = [v5 height],
         v8 == [(MTLTexture *)self->_baseTex height] << isVeratileRegroupedPixelFormat))
    && [v5 pixelFormat] == 115)
  {
    int v9 = 0;
  }
  else
  {
    id v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    int v9 = -73323;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v9;
}

- (int)checkAndSetRgbTex:(id)a3
{
  id v5 = a3;
  int v6 = [(RawDFInputFrame *)self _checkRgbTexConfig:v5];
  if (v6)
  {
    FigDebugAssert3();
  }
  else
  {
    FigMetalIncRef();
    FigMetalDecRef();
    objc_storeStrong((id *)&self->_rgbTex, a3);
  }

  return v6;
}

- (int)demosaicWithStage:(id)a3
{
  id v4 = a3;
  if (v4 && self->_metadata && self->_rgbTex)
  {
    unsigned int PixelWithBayerPattern = determineFirstPixelWithBayerPattern(self->_pixelBufferFormat, self->_bayerPattern);
    if (self->_pixelBufferFormat == 1278226536) {
      unsigned int v6 = 1;
    }
    else {
      unsigned int v6 = -1;
    }
    if (PixelWithBayerPattern == -1) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = PixelWithBayerPattern;
    }
    uint64_t v8 = determineCFALayoutWithBayerPattern(self->_pixelBufferFormat, self->_bayerPattern, self->_metadata);
    __int16 v9 = [(MTLTexture *)self->_baseTex width];
    __int16 v10 = [(MTLTexture *)self->_baseTex height];
    v11.i16[0] = v9;
    v11.i16[1] = v10;
    double v12 = COERCE_DOUBLE(vzip1_s32(0, v11));
    __int16 v13 = [(MTLTexture *)self->_rgbTex width];
    __int16 v14 = [(MTLTexture *)self->_rgbTex height];
    v15.i16[0] = v13;
    v15.i16[1] = v14;
    int v16 = objc_msgSend(v4, "runWithInputTex:inputROI:inputMetadata:firstPix:cfaLayout:outputRGBATex:outputROI:", self->_baseTex, self->_metadata, v7, v8, self->_rgbTex, v12, COERCE_DOUBLE(vzip1_s32(0, v15)));
    if (v16) {
      FigDebugAssert3();
    }
  }
  else
  {
    v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    int v16 = -73323;
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v16;
}

- (void)releaseRgbTex
{
}

- (void)releaseBaseTex
{
}

- (void)dealloc
{
  free(self->_gdcParameters);
  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer)
  {
    CFRelease(sampleBuffer);
    self->_sampleBuffer = 0;
  }
  pixelBuffer = self->_pixelBuffer;
  if (pixelBuffer)
  {
    CFRelease(pixelBuffer);
    self->_pixelBuffer = 0;
  }
  lscGainMapBuffer = self->_lscGainMapBuffer;
  if (lscGainMapBuffer)
  {
    CFRelease(lscGainMapBuffer);
    self->_lscGainMapBuffer = 0;
  }
  auxDraftDemosaicLumaTexture = self->_auxDraftDemosaicLumaTexture;
  self->_auxDraftDemosaicLumaTexture = 0;
  self->_auxDraftDemosaicPixelBuffer = 0;

  auxDraftDemosaicRGBTexture = self->_auxDraftDemosaicRGBTexture;
  self->_auxDraftDemosaicRGBTexture = 0;

  properties = self->_properties;
  self->_properties = 0;

  [(RawDFInputFrame *)self releaseRgbTex];
  [(RawDFInputFrame *)self releaseBaseTex];
  v9.receiver = self;
  v9.super_class = (Class)RawDFInputFrame;
  [(RawDFInputFrame *)&v9 dealloc];
}

- (int)initFrameProperties
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  unint64_t width = self->_width;
  unint64_t height = self->_height;
  id v5 = [(NSDictionary *)self->_cameraInfo objectForKeyedSubscript:*MEMORY[0x263F2EEF8]];
  unsigned int v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2EF50]];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2EF38]];
  unint64_t v8 = width;
  if (v6) {
    unint64_t v8 = [v6 unsignedIntValue];
  }
  self->_sensorWidth = v8;
  unint64_t v9 = height;
  if (v7) {
    unint64_t v9 = [v7 unsignedIntValue];
  }
  self->_sensorHeight = v9;
  __int16 v10 = [(NSDictionary *)self->_metadata objectForKeyedSubscript:*MEMORY[0x263F2F668]];
  properties = self->_properties;
  if (!properties) {
    goto LABEL_16;
  }
  if (v10)
  {
    double v12 = [(NRFFrameProperties *)properties meta];

    if (v12)
    {
      v40 = v5;
      __int16 v13 = v7;
      __int16 v14 = v6;
      int32x2_t v15 = v10;
      metadata = self->_metadata;
      objc_super v17 = [(NRFFrameProperties *)self->_properties meta];
      int FrameMetadata = loadFrameMetadata(metadata, v17, width, height, self->_sensorWidth, self->_sensorHeight, 1, 0);

      if (FrameMetadata)
      {
        int v39 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();

        __int16 v10 = v15;
        unsigned int v6 = v14;
        uint64_t v7 = v13;
        id v5 = v40;
        goto LABEL_15;
      }
      self->_hasStandardMetadata = 1;
      properties = self->_properties;
      __int16 v10 = v15;
      unsigned int v6 = v14;
      uint64_t v7 = v13;
      id v5 = v40;
      goto LABEL_10;
    }
LABEL_16:
    v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
    int FrameMetadata = -73323;
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    goto LABEL_15;
  }
LABEL_10:
  uint64_t v19 = [(NRFFrameProperties *)properties colorSpaceConversionParameters];
  uint64_t v20 = v19;
  uint64_t v21 = 0;
  *(_OWORD *)(v19 + 144) = xmmword_26337FFE0;
  *(_OWORD *)(v19 + 160) = xmmword_26337FFF0;
  *(void *)(v19 + 176) = 0x3F80000000000000;
  long long v44 = *(_OWORD *)byte_263380000;
  long long v45 = *(_OWORD *)&byte_263380000[16];
  simd_float4 v41 = 0u;
  simd_float4 v42 = 0u;
  simd_float4 v43 = 0u;
  long long v46 = *(_OWORD *)&byte_263380000[32];
  do
  {
    *(float32x4_t *)((char *)&v41 + v21) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_263380030, COERCE_FLOAT(*(long long *)((char *)&v44 + v21))), (float32x4_t)xmmword_263380040, *(float32x2_t *)((char *)&v44 + v21), 1), (float32x4_t)xmmword_263380050, *(float32x4_t *)((char *)&v44 + v21), 2);
    v21 += 16;
  }
  while (v21 != 48);
  v48.columns[0] = v41;
  v48.columns[1] = v42;
  v48.columns[2] = v43;
  *(simd_float4 *)(v19 + 48) = v41;
  *(simd_float4 *)(v19 + 64) = v48.columns[1];
  *(simd_float4 *)(v19 + 80) = v48.columns[2];
  v48.columns[3] = (simd_float4)xmmword_263380060;
  simd_float4x4 v49 = __invert_f4(v48);
  *(simd_float4 *)uint64_t v20 = v49.columns[0];
  *(simd_float4 *)(v20 + 16) = v49.columns[1];
  *(simd_float4 *)(v20 + 32) = v49.columns[2];
  *(float *)(v20 + 184) = 1.0 / *(float *)(v20 + 188);
  uint64_t v22 = MEMORY[0x263EF89A0];
  v49.columns[1] = *(simd_float4 *)(MEMORY[0x263EF89A0] + 16);
  *(_OWORD *)(v20 + 96) = *MEMORY[0x263EF89A0];
  *(simd_float4 *)(v20 + 112) = v49.columns[1];
  *(_OWORD *)(v20 + 128) = *(_OWORD *)(v22 + 32);
  *(_DWORD *)(v20 + 196) = 65792;
  *(void *)(v20 + 188) = 0x3F0000003F800000;
  [(NRFFrameProperties *)self->_properties setInputColorSpace:2];
  v23 = [(NRFFrameProperties *)self->_properties colorSpaceConversionParameters];
  *(_OWORD *)&v23[2].transferFunctionInv.nonLinearBias = xmmword_26337FFE0;
  *(_OWORD *)&v23[2].chromaBias = xmmword_26337FFF0;
  *(void *)&v23[3].transferFunctionFwd.nonLinearScale = 0x3F80000000000000;
  v24 = [(NRFFrameProperties *)self->_properties colorSpaceConversionParameters];
  uint64_t v25 = 0;
  long long v44 = *(_OWORD *)byte_263380000;
  long long v45 = *(_OWORD *)&byte_263380000[16];
  long long v46 = *(_OWORD *)&byte_263380000[32];
  simd_float4 v41 = 0u;
  simd_float4 v42 = 0u;
  simd_float4 v43 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v41 + v25) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_2633802E0, COERCE_FLOAT(*(long long *)((char *)&v44 + v25))), (float32x4_t)xmmword_263380310, *(float32x2_t *)((char *)&v44 + v25), 1), (float32x4_t)xmmword_26337FF50, *(float32x4_t *)((char *)&v44 + v25), 2);
    v25 += 16;
  }
  while (v25 != 48);
  simd_float4 v26 = v42;
  simd_float4 v27 = v43;
  *(simd_float4 *)&v24->chromaBias = v41;
  *(simd_float4 *)&v24[1].transferFunctionFwd.nonLinearScale = v26;
  *(simd_float4 *)&v24[1].transferFunctionInv.linearThreshold = v27;
  v28 = [(NRFFrameProperties *)self->_properties colorSpaceConversionParameters];
  v50.columns[0] = *(simd_float4 *)&v28->chromaBias;
  v50.columns[1] = *(simd_float4 *)&v28[1].transferFunctionFwd.nonLinearScale;
  v50.columns[2] = *(simd_float4 *)&v28[1].transferFunctionInv.linearThreshold;
  v50.columns[3] = (simd_float4)xmmword_263380060;
  simd_float4x4 v51 = __invert_f4(v50);
  *(simd_float4 *)&v28->transferFunctionFwd.linearScale = v51.columns[0];
  *(simd_float4 *)&v28->transferFunctionFwd.nonLinearPower = v51.columns[1];
  *(simd_float4 *)&v28->transferFunctionInv.nonLinearBias = v51.columns[2];
  v28[3].transferFunctionFwd.nonLinearPower = 1.0 / v28[3].transferFunctionInv.linearScale;
  [(NRFFrameProperties *)self->_properties setToneCurve:0xFFFFFFFFLL];
  *(unsigned char *)([(NRFFrameProperties *)self->_properties colorSpaceConversionParameters]
           + 196) = 1;
  *(unsigned char *)([(NRFFrameProperties *)self->_properties colorSpaceConversionParameters]
           + 198) = 0;
  v29 = [(NRFFrameProperties *)self->_properties colorSpaceConversionParameters];
  uint64_t v30 = [(NRFFrameProperties *)self->_properties meta];
  [v30 colorCorrectionMatrix];
  v29[1].chromaBias = v31;
  v29[2].transferFunctionFwd.nonLinearScale = v32;
  *(void *)&v29[1].finalScaleFwd = v33;
  *(void *)&v29[2].transferFunctionFwd.linearScale = v34;
  v29[2].transferFunctionInv.linearThreshold = v35;
  *(void *)&v29[2].transferFunctionFwd.nonLinearPower = v36;

  int FrameMetadata = 0;
LABEL_15:

  return FrameMetadata;
}

- (int)uniqueFrameId
{
  return self->_uniqueFrameId;
}

- (MTLTexture)baseTex
{
  return self->_baseTex;
}

- (MTLTexture)rgbTex
{
  return self->_rgbTex;
}

- (NRFFrameProperties)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (BOOL)hasStandardMetadata
{
  return self->_hasStandardMetadata;
}

- (NSDictionary)cameraInfo
{
  return self->_cameraInfo;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (__CVBuffer)lscGainMapBuffer
{
  return self->_lscGainMapBuffer;
}

- (MTLTexture)auxDraftDemosaicRGBTexture
{
  return self->_auxDraftDemosaicRGBTexture;
}

- (MTLTexture)auxDraftDemosaicLumaTexture
{
  return self->_auxDraftDemosaicLumaTexture;
}

- (__CVBuffer)auxDraftDemosaicPixelBuffer
{
  return self->_auxDraftDemosaicPixelBuffer;
}

- (NSDictionary)lscGainMapParameters
{
  return self->_lscGainMapParameters;
}

- (CMIImagePyramid)pyramid
{
  return self->_pyramid;
}

- ($0B57B161DD08FFA902CA30037FAFD2DD)gdcParameters
{
  return self->_gdcParameters;
}

- (NSNumber)bayerPattern
{
  return self->_bayerPattern;
}

- (unsigned)pixelBufferFormat
{
  return self->_pixelBufferFormat;
}

- (unint64_t)strideAlignment
{
  return self->_strideAlignment;
}

- (void)setStrideAlignment:(unint64_t)a3
{
  self->_strideAlignment = a3;
}

- (unint64_t)heightAlignment
{
  return self->_heightAlignment;
}

- (void)setHeightAlignment:(unint64_t)a3
{
  self->_heightAlignment = a3;
}

- (unint64_t)width
{
  return self->_width;
}

- (unint64_t)height
{
  return self->_height;
}

- (unint64_t)sensorWidth
{
  return self->_sensorWidth;
}

- (unint64_t)sensorHeight
{
  return self->_sensorHeight;
}

- (unint64_t)bindingMetalFormat
{
  return self->_bindingMetalFormat;
}

- (void)setBindingMetalFormat:(unint64_t)a3
{
  self->_unint64_t bindingMetalFormat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bayerPattern, 0);
  objc_storeStrong((id *)&self->_pyramid, 0);
  objc_storeStrong((id *)&self->_lscGainMapParameters, 0);
  objc_storeStrong((id *)&self->_auxDraftDemosaicLumaTexture, 0);
  objc_storeStrong((id *)&self->_auxDraftDemosaicRGBTexture, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_cameraInfo, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_rgbTex, 0);
  objc_storeStrong((id *)&self->_baseTex, 0);

  objc_storeStrong((id *)&self->_metal, 0);
}

@end