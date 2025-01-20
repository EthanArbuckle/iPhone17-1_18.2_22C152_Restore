@interface CMIVideoDeghostingRepairV1
- ($2EE007E8DB0A29FF0870D731F0956162)ghostInformationLookAheadPointer;
- (CMIVideoDeghostingRepairV1)initWithMetalContext:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5;
- (MTLCommandQueue)metalCommandQueue;
- (NSArray)detectedGhostBoundingBoxes;
- (NSDictionary)cameraInfoByPortType;
- (NSDictionary)tuningParameters;
- (float)blendingStrength;
- (id)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4;
- (int)_compileShaders;
- (int)_copyImageTileFromPixelBuffer:(__CVBuffer *)a3 mergeWithMask:(id)a4 outputTilePixelBuffer:(__CVBuffer *)a5 commandBuffer:(id)a6;
- (int)_copyImageTileFromPixelBuffer:(__CVBuffer *)a3 outputImageTileTexture:(id)a4 commandBuffer:(id)a5;
- (int)_copyMaskTileFromPixelBuffer:(__CVBuffer *)a3 outputMaskTileTexture:(id)a4 commandBuffer:(id)a5;
- (int)_dilateMask:(id)a3 outputDilatedMask:(id)a4 commandBuffer:(id)a5;
- (int)_featherMask:(id)a3 outputFeatheredMask:(id)a4 commandBuffer:(id)a5;
- (int)_generateMaskTile:(id)a3 commandBuffer:(id)a4 circleParams:(RepairCircleParams)a5;
- (int)_pasteRepairedTile:(__CVBuffer *)a3 inputTileTexture:(id)a4 blendingMask:(id)a5 outputPixelBuffer:(__CVBuffer *)a6 commandBuffer:(id)a7;
- (int)_repair:(__CVBuffer *)a3 ghostROI:(CGRect)a4 inputROI:;
- (int)finishProcessing;
- (int)prepareToProcess:(unsigned int)a3;
- (int)prewarm;
- (int)process;
- (int)purgeResources;
- (int)resetState;
- (int)setup;
- (opaqueCMSampleBuffer)inputSampleBuffer;
- (void)_clampGhostROI:(CGRect *)a3;
- (void)dealloc;
- (void)setBlendingStrength:(float)a3;
- (void)setCameraInfoByPortType:(id)a3;
- (void)setDetectedGhostBoundingBoxes:(id)a3;
- (void)setGhostInformationLookAheadPointer:(id *)a3;
- (void)setInputSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setMetalCommandQueue:(id)a3;
- (void)setTuningParameters:(id)a3;
@end

@implementation CMIVideoDeghostingRepairV1

- (CMIVideoDeghostingRepairV1)initWithMetalContext:(id)a3 imageDimensions:(id)a4 tuningParameters:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)CMIVideoDeghostingRepairV1;
    v10 = [(CMIVideoDeghostingRepairV1 *)&v14 init];
    if (v10)
    {
      uint64_t v11 = [v8 commandQueue];
      metalCommandQueue = v10->_metalCommandQueue;
      v10->_metalCommandQueue = (MTLCommandQueue *)v11;

      v10->_imageDimensions = ($470D365275581EF16070F5A11344F73E)a4;
      objc_storeStrong((id *)&v10->_tuningParameters, a5);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();

    v10 = 0;
  }

  return v10;
}

- (int)setup
{
  v118[0] = kCVPixelBufferMetalCompatibilityKey;
  v118[1] = kCVPixelBufferIOSurfaceCoreAnimationCompatibilityKey;
  v119[0] = &__kCFBooleanTrue;
  v119[1] = &__kCFBooleanTrue;
  v118[2] = kCVPixelBufferIOSurfacePropertiesKey;
  v119[2] = &__NSDictionary0__struct;
  CFDictionaryRef v3 = +[NSDictionary dictionaryWithObjects:v119 forKeys:v118 count:3];
  uint64_t v4 = FigCapturePlatformIdentifierString();
  uint64_t ModelSpecificName = FigCaptureGetModelSpecificName();
  v6 = +[NSString stringWithFormat:@"^.+(\\.|_)(%@|%@)(\\.|_).+$", v4, ModelSpecificName];
  v97 = (void *)v4;
  v101 = (void *)ModelSpecificName;
  if (FigCapturePlatformGetVariant() == 3)
  {
    id v7 = +[NSString stringWithFormat:@"^.+(\\.|_)(%@G|%@)(\\.|_).+$", v4, ModelSpecificName];
  }
  else
  {
    id v7 = v6;
  }
  id v8 = v7;
  id v109 = 0;
  v100 = v6;
  id v103 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v6 options:1 error:&v109];
  id v9 = v109;
  id v108 = v9;
  v99 = v8;
  id v102 = [objc_alloc((Class)NSRegularExpression) initWithPattern:v8 options:1 error:&v108];
  id v98 = v108;

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  v10 = +[NSMutableArray array];
  uint64_t v11 = +[NSFileManager defaultManager];
  id v114 = 0;
  v12 = [v11 contentsOfDirectoryAtPath:@"/System/Library/ImagingNetworks/" error:&v114];
  id v13 = v114;

  if (v12)
  {
    id v95 = v13;
    CFDictionaryRef v14 = v3;
    v15 = self;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v16 = v12;
    id v17 = [v16 countByEnumeratingWithState:&v110 objects:v120 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v111;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v111 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v110 + 1) + 8 * i);
          if ([v21 hasSuffix:@".net"]) {
            [v10 addObject:v21];
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v110 objects:v120 count:16];
      }
      while (v18);
    }

    self = v15;
    CFDictionaryRef v3 = v14;
    id v13 = v95;
  }
  if (![v10 count])
  {

    v10 = 0;
  }

  id v22 = [v10 countByEnumeratingWithState:&v104 objects:v117 count:16];
  if (v22)
  {
    id v23 = v22;
    CFDictionaryRef v96 = v3;
    uint64_t v24 = *(void *)v105;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v105 != v24) {
          objc_enumerationMutation(v10);
        }
        v26 = *(void **)(*((void *)&v104 + 1) + 8 * (void)j);
        unsigned int v27 = [v26 hasSuffix:@".bundle"];
        v28 = v103;
        if (v27) {
          v28 = v102;
        }
        id v29 = v28;
        v30 = self;
        v31 = [(NSDictionary *)self->_tuningParameters objectForKeyedSubscript:@"NetworkName"];
        if ([v26 hasPrefix:v31])
        {
          id v32 = objc_msgSend(v29, "numberOfMatchesInString:options:range:", v26, 0, 0, objc_msgSend(v26, "length"));

          if (v32)
          {
            id v33 = v26;

            CFDictionaryRef v3 = v96;
            self = v30;
            goto LABEL_32;
          }
        }
        else
        {
        }
        self = v30;
      }
      id v23 = [v10 countByEnumeratingWithState:&v104 objects:v117 count:16];
    }
    while (v23);
    id v33 = 0;
    CFDictionaryRef v3 = v96;
  }
  else
  {
    id v33 = 0;
  }
LABEL_32:

  v34 = +[NSString stringWithFormat:@"/System/Library/ImagingNetworks/%@", v33];

  v35 = +[NSFileManager defaultManager];
  unsigned int v36 = [v35 fileExistsAtPath:v34];

  if (!v36)
  {
    CFDictionaryRef v46 = 0;
    id v53 = 0;
    v37 = 0;
    v89 = v97;
LABEL_62:
    [(CMIVideoDeghostingRepairV1 *)self purgeResources];
    int v90 = 1;
    goto LABEL_52;
  }
  v37 = +[NSBundle bundleForClass:objc_opt_class()];
  if (!v37) {
    goto LABEL_55;
  }
  v38 = (FigMetalContext *)[objc_alloc((Class)FigMetalContext) initWithbundle:v37 andOptionalCommandQueue:self->_metalCommandQueue];
  metalContext = self->_metalContext;
  self->_metalContext = v38;

  if (!self->_metalContext)
  {
LABEL_53:
    CFDictionaryRef v46 = 0;
LABEL_54:
    id v53 = 0;
LABEL_60:
    v89 = v97;
LABEL_61:
    FigSignalErrorAt();
    goto LABEL_62;
  }
  id v40 = objc_alloc((Class)FigMetalAllocator);
  v41 = [(FigMetalContext *)self->_metalContext device];
  id v42 = [v40 initWithDevice:v41 allocatorType:3];
  [(FigMetalContext *)self->_metalContext setAllocator:v42];

  v43 = [(FigMetalContext *)self->_metalContext allocator];

  if (!v43)
  {
LABEL_55:
    CFDictionaryRef v46 = 0;
    goto LABEL_56;
  }
  if (!self->_metalCommandQueue)
  {
    v44 = [(FigMetalContext *)self->_metalContext commandQueue];
    metalCommandQueue = self->_metalCommandQueue;
    self->_metalCommandQueue = v44;

    if (!self->_metalCommandQueue) {
      goto LABEL_53;
    }
  }
  if ([(CMIVideoDeghostingRepairV1 *)self _compileShaders]) {
    goto LABEL_53;
  }
  CFStringRef v115 = kCVMetalTextureCacheMaximumTextureAgeKey;
  v116 = &off_2D900;
  CFDictionaryRef v46 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
  v47 = [(FigMetalContext *)self->_metalContext device];
  CVReturn v48 = CVMetalTextureCacheCreate(kCFAllocatorDefault, v46, v47, 0, &self->_cvMetalTextureCacheRef);

  if (v48)
  {
LABEL_56:
    id v53 = 0;
    goto LABEL_60;
  }
  self->_espressoEngine = 10006;
  context = (void *)espresso_create_context();
  self->_espressoContext = context;
  if (!context) {
    goto LABEL_54;
  }
  plan = (void *)espresso_create_plan();
  self->_espressoPlan = plan;
  if (!plan) {
    goto LABEL_54;
  }
  [v34 UTF8String];
  if (espresso_plan_add_network() || espresso_plan_build()) {
    goto LABEL_54;
  }
  *(void *)self->_anon_24c = 0x9000900800080;
  *(_DWORD *)&self->_anon_24c[8] = 327685;
  FigGetCFPreferenceDoubleWithDefault();
  *(float *)&double v51 = v51;
  self->_blendingStrength = *(float *)&v51;
  v52 = [(FigMetalContext *)self->_metalContext allocator];
  id v53 = [v52 newTextureDescriptor];

  if (!v53) {
    goto LABEL_59;
  }
  v54 = [v53 desc];
  [v54 setCompressionMode:2];

  v55 = [v53 desc];
  [v55 setCompressionFootprint:0];

  v56 = [v53 desc];
  [v56 setUsage:7];

  v57 = [v53 desc];
  [v57 setPixelFormat:25];

  uint64_t v58 = *(unsigned __int16 *)self->_anon_24c;
  v59 = [v53 desc];
  [v59 setWidth:v58];

  uint64_t v60 = 3 * *(unsigned __int16 *)&self->_anon_24c[2];
  v61 = [v53 desc];
  [v61 setHeight:v60];

  [v53 setLabel:0];
  v62 = [(FigMetalContext *)self->_metalContext allocator];
  v63 = (MTLTexture *)[v62 newTextureWithDescriptor:v53];
  tileInputImageTexture = self->_tileInputImageTexture;
  self->_tileInputImageTexture = v63;

  if (!self->_tileInputImageTexture) {
    goto LABEL_59;
  }
  v65 = [v53 desc];
  [v65 setPixelFormat:25];

  uint64_t v66 = (*(unsigned __int16 *)self->_anon_24c + 1) & 0x1FFFE;
  v67 = [v53 desc];
  [v67 setWidth:v66];

  uint64_t v68 = (*(unsigned __int16 *)&self->_anon_24c[2] + 1) & 0x1FFFE;
  v69 = [v53 desc];
  [v69 setHeight:v68];

  [v53 setLabel:0];
  v70 = [(FigMetalContext *)self->_metalContext allocator];
  v71 = (MTLTexture *)[v70 newTextureWithDescriptor:v53];
  tileInputMaskTexture = self->_tileInputMaskTexture;
  self->_tileInputMaskTexture = v71;

  if (!self->_tileInputImageTexture) {
    goto LABEL_59;
  }
  v73 = [v53 desc];
  [v73 setPixelFormat:25];

  uint64_t v74 = (*(unsigned __int16 *)self->_anon_24c + 1) & 0x1FFFE;
  v75 = [v53 desc];
  [v75 setWidth:v74];

  uint64_t v76 = (*(unsigned __int16 *)&self->_anon_24c[2] + 1) & 0x1FFFE;
  v77 = [v53 desc];
  [v77 setHeight:v76];

  [v53 setLabel:0];
  v78 = [(FigMetalContext *)self->_metalContext allocator];
  v79 = (MTLTexture *)[v78 newTextureWithDescriptor:v53];
  tileDilatedMaskTexture = self->_tileDilatedMaskTexture;
  self->_tileDilatedMaskTexture = v79;

  if (!self->_tileDilatedMaskTexture) {
    goto LABEL_59;
  }
  v81 = [v53 desc];
  [v81 setPixelFormat:25];

  uint64_t v82 = (*(unsigned __int16 *)self->_anon_24c + 1) & 0x1FFFE;
  v83 = [v53 desc];
  [v83 setWidth:v82];

  uint64_t v84 = (*(unsigned __int16 *)&self->_anon_24c[2] + 1) & 0x1FFFE;
  v85 = [v53 desc];
  [v85 setHeight:v84];

  [v53 setLabel:0];
  v86 = [(FigMetalContext *)self->_metalContext allocator];
  v87 = (MTLTexture *)[v86 newTextureWithDescriptor:v53];
  tileBlendingMaskTexture = self->_tileBlendingMaskTexture;
  self->_tileBlendingMaskTexture = v87;

  if (!self->_tileBlendingMaskTexture)
  {
LABEL_59:
    fig_log_get_emitter();
    uint64_t v93 = v94;
    LODWORD(v92) = 0;
    FigDebugAssert3();
    goto LABEL_60;
  }
  v89 = v97;
  if (CVPixelBufferCreate(kCFAllocatorDefault, *(unsigned __int16 *)self->_anon_24c, 4 * *(unsigned __int16 *)&self->_anon_24c[2], 0x4C303068u, v3, &self->_tileInputPixelBuffer)|| CVPixelBufferCreate(kCFAllocatorDefault, *(unsigned __int16 *)self->_anon_24c, 3 * *(unsigned __int16 *)&self->_anon_24c[2], 0x4C303068u, v3, &self->_tileOutputPixelBuffer))
  {
    goto LABEL_61;
  }
  int v90 = 0;
LABEL_52:

  return v90;
}

- (void)dealloc
{
  [(CMIVideoDeghostingRepairV1 *)self finishProcessing];
  [(CMIVideoDeghostingRepairV1 *)self purgeResources];
  v3.receiver = self;
  v3.super_class = (Class)CMIVideoDeghostingRepairV1;
  [(CMIVideoDeghostingRepairV1 *)&v3 dealloc];
}

- (int)prepareToProcess:(unsigned int)a3
{
  return 0;
}

- (int)finishProcessing
{
  return 0;
}

- (int)purgeResources
{
  tileInputPixelBuffer = self->_tileInputPixelBuffer;
  if (tileInputPixelBuffer)
  {
    CFRelease(tileInputPixelBuffer);
    self->_tileInputPixelBuffer = 0;
  }
  tileOutputPixelBuffer = self->_tileOutputPixelBuffer;
  if (tileOutputPixelBuffer)
  {
    CFRelease(tileOutputPixelBuffer);
    self->_tileOutputPixelBuffer = 0;
  }
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  FigMetalDecRef();
  if (self->_espressoInputImageBuffer.data && espresso_network_unbind_buffer()
    || self->_espressoOutputBuffer.data && espresso_network_unbind_buffer())
  {
    goto LABEL_18;
  }
  if (self->_espressoPlan)
  {
    if (espresso_plan_destroy()) {
      goto LABEL_18;
    }
    self->_espressoPlan = 0;
  }
  if (!self->_espressoContext) {
    goto LABEL_15;
  }
  if (espresso_context_destroy())
  {
LABEL_18:
    fig_log_get_emitter();
    FigDebugAssert3();
    LODWORD(cvMetalTextureCacheRef) = 2;
    return (int)cvMetalTextureCacheRef;
  }
  self->_espressoContext = 0;
LABEL_15:
  CVMetalTextureCacheFlush(self->_cvMetalTextureCacheRef, 0);
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef)
  {
    CFRelease(cvMetalTextureCacheRef);
    LODWORD(cvMetalTextureCacheRef) = 0;
    self->_cvMetalTextureCacheRef = 0;
  }
  return (int)cvMetalTextureCacheRef;
}

- (int)process
{
  CGSize size = CGRectNull.size;
  rect.origin = CGRectNull.origin;
  rect.CGSize size = size;
  inputSampleBuffer = self->_inputSampleBuffer;
  if (!inputSampleBuffer || (CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(inputSampleBuffer)) == 0)
  {
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
    LODWORD(v8) = 3;
    return v8;
  }
  float blendingStrength = self->_blendingStrength;
  if (blendingStrength < 0.0 || blendingStrength > 1.0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    CVImageBufferRef v7 = ImageBuffer;
    NSUInteger v8 = [(NSArray *)self->_detectedGhostBoundingBoxes count];
    if (!v8) {
      return v8;
    }
    CFDictionaryRef v9 = [(NSArray *)self->_detectedGhostBoundingBoxes objectAtIndexedSubscript:0];
    CGRectMakeWithDictionaryRepresentation(v9, &rect);

    if (!CGRectIsEmpty(rect))
    {
      [(CMIVideoDeghostingRepairV1 *)self _clampGhostROI:&rect];
      v10.i32[0] = *(unsigned __int16 *)self->_anon_24c;
      v10.i32[1] = *(unsigned __int16 *)&self->_anon_24c[2];
      __asm { FMOV            V3.2D, #0.5 }
      v16.i64[0] = *(unsigned __int16 *)self->_anon_24c;
      v16.i64[1] = *(unsigned __int16 *)&self->_anon_24c[2];
      *(int32x2_t *)&_Q3.f64[0] = vmax_s32(vmovn_s64(vcvtq_s64_f64(vsubq_f64(vaddq_f64((float64x2_t)rect.origin, vmulq_f64((float64x2_t)rect.size, _Q3)), vmulq_f64(vcvtq_f64_u64(v16), _Q3)))), 0);
      LODWORD(v8) = -[CMIVideoDeghostingRepairV1 _repair:ghostROI:inputROI:](self, "_repair:ghostROI:inputROI:", v7, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, COERCE_DOUBLE(vuzp1_s16((int16x4_t)vbsl_s8((int8x8_t)vcgt_s32(vadd_s32(*(int32x2_t *)&_Q3.f64[0], v10), (int32x2_t)self->_imageDimensions), (int8x8_t)vsub_s32((int32x2_t)self->_imageDimensions, v10), *(int8x8_t *)&_Q3.f64[0]), (int16x4_t)v10)));
      if (!v8) {
        return v8;
      }
      fig_log_get_emitter();
      goto LABEL_14;
    }
  }
  LODWORD(v8) = 0;
  return v8;
}

- (int)prewarm
{
  return 0;
}

- (int)resetState
{
  return 0;
}

- (void)_clampGhostROI:(CGRect *)a3
{
  double width = a3->size.width;
  if (width > 64.0)
  {
    a3->origin.x = (width + -64.0) * 0.5 + a3->origin.x;
    a3->size.double width = 64.0;
  }
  double height = a3->size.height;
  if (height > 64.0)
  {
    a3->origin.y = (height + -64.0) * 0.5 + a3->origin.y;
    a3->size.double height = 64.0;
  }
}

- (int)_repair:(__CVBuffer *)a3 ghostROI:(CGRect)a4 inputROI:
{
  if (!a3) {
    goto LABEL_24;
  }
  _ZF = !*(_WORD *)self->_anon_24c || *(_WORD *)&self->_anon_24c[2] == 0;
  if (_ZF
    || ((v7 = v4.u16[3], v4.i16[2]) ? (BOOL v8 = v4.u16[3] == 0) : (BOOL v8 = 1),
        v8
     || (CGFloat height = a4.size.height,
         CGFloat width = a4.size.width,
         CGFloat x = a4.origin.x,
         CGFloat y = a4.origin.y,
         uint16x4_t v34 = v4,
         CVPixelBufferGetWidth(a3) < v4.u16[0] + (unint64_t)v4.u16[2])
     || CVPixelBufferGetHeight(a3) < v34.u16[1] + (unint64_t)v7))
  {
LABEL_24:
    fig_log_get_emitter();
    FigDebugAssert3();
    v12 = 0;
    int v28 = -12780;
  }
  else
  {
    int16x4_t v10 = (int16x4_t)vand_s8((int8x8_t)*(_OWORD *)&vmovl_u16(v34), (int8x8_t)vdup_n_s32(0xFFFEu));
    v10.i32[0] = vuzp1_s16(v10, v10).u32[0];
    v10.i32[1] = v34.i32[1];
    *(int16x4_t *)self->_inputROI = v10;
    uint64_t v11 = [(FigMetalContext *)self->_metalContext commandQueue];
    v12 = [v11 commandBuffer];

    unsigned int v13 = [(CMIVideoDeghostingRepairV1 *)self _copyImageTileFromPixelBuffer:a3 outputImageTileTexture:self->_tileInputImageTexture commandBuffer:v12];
    if (v13) {
      goto LABEL_25;
    }
    v14.f64[0] = width;
    v14.f64[1] = height;
    __asm { FMOV            V0.2D, #0.5 }
    float64x2_t v19 = vmulq_f64(v14, _Q0);
    float v20 = v19.f64[0];
    v21.f64[0] = x;
    v21.f64[1] = y;
    unint64_t v22 = vmovl_u16(*(uint16x4_t *)self->_inputROI).u64[0];
    v23.i64[0] = v22;
    v23.i64[1] = HIDWORD(v22);
    float32x2_t v24 = vcvt_f32_f64(vsubq_f64(vaddq_f64(v21, v19), vcvtq_f64_u64(v23)));
    unsigned int v13 = -[CMIVideoDeghostingRepairV1 _generateMaskTile:commandBuffer:circleParams:](self, "_generateMaskTile:commandBuffer:circleParams:", self->_tileInputMaskTexture, v12, *(void *)&v24, COERCE_UNSIGNED_INT(v20 * v20));
    if (v13
      || (LOWORD(v25) = *(_WORD *)&self->_anon_24c[4],
          (unsigned int v13 = -[CMIVideoDeghostingRepairV1 _generateMaskTile:commandBuffer:circleParams:](self, "_generateMaskTile:commandBuffer:circleParams:", self->_tileDilatedMaskTexture, v12, *(void *)&v24, COERCE_UNSIGNED_INT((float)(v20 + (float)v25) * (float)(v20 + (float)v25)))) != 0)|| (unsigned int v13 = [(CMIVideoDeghostingRepairV1 *)self _featherMask:self->_tileInputMaskTexture outputFeatheredMask:self->_tileBlendingMaskTexture commandBuffer:v12]) != 0|| (unsigned int v13 = [(CMIVideoDeghostingRepairV1 *)self _copyImageTileFromPixelBuffer:a3 mergeWithMask:self->_tileDilatedMaskTexture outputTilePixelBuffer:self->_tileInputPixelBuffer commandBuffer:v12]) != 0)
    {
LABEL_25:
      int v28 = v13;
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      [v12 commit];
      [v12 waitUntilScheduled];
      if (espresso_network_bind_direct_cvpixelbuffer()
        || espresso_network_bind_direct_cvpixelbuffer()
        || espresso_plan_execute_sync())
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v28 = -12782;
      }
      else
      {
        v26 = [(FigMetalContext *)self->_metalContext commandQueue];
        unsigned int v27 = [v26 commandBuffer];

        int v28 = [(CMIVideoDeghostingRepairV1 *)self _pasteRepairedTile:self->_tileOutputPixelBuffer inputTileTexture:self->_tileInputImageTexture blendingMask:self->_tileBlendingMaskTexture outputPixelBuffer:a3 commandBuffer:v27];
        [v27 commit];
        [v27 waitUntilScheduled];
        if (v28)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
        v12 = v27;
      }
    }
  }

  return v28;
}

- (int)_copyImageTileFromPixelBuffer:(__CVBuffer *)a3 outputImageTileTexture:(id)a4 commandBuffer:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  int16x4_t v10 = v9;
  int v23 = 0;
  if (a3 && v8 && v9)
  {
    uint64_t v11 = [(CMIVideoDeghostingRepairV1 *)self _cachedTexturesFromPixelBuffer:a3 usage:1];
    if ([v11 count] == (char *)&dword_0 + 2)
    {
      uint32x4_t v12 = vmovl_u16(*(uint16x4_t *)self->_inputROI);
      HIWORD(v23) = v12.i16[2];
      LOWORD(v23) = v12.i16[0];
      unsigned int v13 = [v10 computeCommandEncoder];
      [v13 setComputePipelineState:self->_pipelineStates[1]];
      float64x2_t v14 = [v11 objectAtIndexedSubscript:0];
      [v13 setTexture:v14 atIndex:0];

      v15 = [v11 objectAtIndexedSubscript:1];
      [v13 setTexture:v15 atIndex:1];

      [v13 setTexture:v8 atIndex:2];
      [v13 setBytes:&v23 length:4 atIndex:0];
      unint64_t v16 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[1] threadExecutionWidth];
      unint64_t v17 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[1] maxTotalThreadsPerThreadgroup];
      uint64_t v18 = *(unsigned __int16 *)&self->_anon_24c[2];
      v22[0] = *(unsigned __int16 *)self->_anon_24c;
      v22[1] = v18;
      v22[2] = 1;
      v21[0] = v16;
      v21[1] = v17 / v16;
      v21[2] = 1;
      [v13 dispatchThreads:v22 threadsPerThreadgroup:v21];
      [v13 endEncoding];

      int v19 = 0;
    }
    else
    {
      int v19 = -12786;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v11 = 0;
    int v19 = -12780;
  }

  return v19;
}

- (int)_generateMaskTile:(id)a3 commandBuffer:(id)a4 circleParams:(RepairCircleParams)a5
{
  uint64_t v20 = v5;
  uint64_t v21 = v6;
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = v10;
  if (v9 && v10)
  {
    uint32x4_t v12 = [v10 computeCommandEncoder];
    [v12 setComputePipelineState:self->_pipelineStates[8]];
    [v12 setTexture:v9 atIndex:0];
    [v12 setBytes:&v20 length:16 atIndex:0];
    unint64_t v13 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[8] threadExecutionWidth];
    unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[8] maxTotalThreadsPerThreadgroup];
    uint64_t v15 = *(unsigned __int16 *)&self->_anon_24c[2];
    v19[0] = *(unsigned __int16 *)self->_anon_24c;
    v19[1] = v15;
    v19[2] = 1;
    v18[0] = v13;
    v18[1] = v14 / v13;
    v18[2] = 1;
    [v12 dispatchThreads:v19 threadsPerThreadgroup:v18];
    [v12 endEncoding];

    int v16 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v16 = -12780;
  }

  return v16;
}

- (int)_copyMaskTileFromPixelBuffer:(__CVBuffer *)a3 outputMaskTileTexture:(id)a4 commandBuffer:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  int v22 = 0;
  if (a3 && v8 && v9)
  {
    uint64_t v11 = [(CMIVideoDeghostingRepairV1 *)self _cachedTexturesFromPixelBuffer:a3 usage:1];
    if ([v11 count] == (char *)&dword_0 + 1)
    {
      uint32x4_t v12 = vmovl_u16(*(uint16x4_t *)self->_inputROI);
      HIWORD(v22) = v12.i16[2];
      LOWORD(v22) = v12.i16[0];
      unint64_t v13 = [v10 computeCommandEncoder];
      [v13 setComputePipelineState:self->_pipelineStates[0]];
      unint64_t v14 = [v11 objectAtIndexedSubscript:0];
      [v13 setTexture:v14 atIndex:0];

      [v13 setTexture:v8 atIndex:1];
      [v13 setBytes:&v22 length:4 atIndex:0];
      unint64_t v15 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[0] threadExecutionWidth];
      unint64_t v16 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[0] maxTotalThreadsPerThreadgroup];
      uint64_t v17 = *(unsigned __int16 *)&self->_anon_24c[2];
      v21[0] = *(unsigned __int16 *)self->_anon_24c;
      v21[1] = v17;
      v21[2] = 1;
      v20[0] = v15;
      v20[1] = v16 / v15;
      v20[2] = 1;
      [v13 dispatchThreads:v21 threadsPerThreadgroup:v20];
      [v13 endEncoding];

      int v18 = 0;
    }
    else
    {
      int v18 = -12786;
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    uint64_t v11 = 0;
    int v18 = -12780;
  }

  return v18;
}

- (int)_dilateMask:(id)a3 outputDilatedMask:(id)a4 commandBuffer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  int v38 = 0;
  id v37 = 0;
  if (v8 && v9 && v10)
  {
    uint32x4_t v12 = [(FigMetalContext *)self->_metalContext allocator];
    id v13 = [v12 newTextureDescriptor];

    if (v13)
    {
      unint64_t v14 = [v13 desc];
      [v14 setCompressionMode:2];

      unint64_t v15 = [v13 desc];
      [v15 setCompressionFootprint:0];

      unint64_t v16 = [v13 desc];
      [v16 setUsage:7];

      id v17 = [v8 pixelFormat];
      int v18 = [v13 desc];
      [v18 setPixelFormat:v17];

      id v19 = [v8 width];
      uint64_t v20 = [v13 desc];
      [v20 setWidth:v19];

      id v21 = [v8 height];
      int v22 = [v13 desc];
      [v22 setHeight:v21];

      [v13 setLabel:0];
      int v23 = [(FigMetalContext *)self->_metalContext allocator];
      id v24 = [v23 newTextureWithDescriptor:v13];
      id v37 = v24;

      if (v24)
      {
        unsigned int v25 = [v11 computeCommandEncoder];
        int v38 = *(unsigned __int16 *)&self->_anon_24c[4];
        [v25 setComputePipelineState:self->_pipelineStates[2]];
        [v25 setTexture:v8 atIndex:0];
        [v25 setTexture:v24 atIndex:1];
        [v25 setBytes:&v38 length:4 atIndex:0];
        unint64_t v26 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[2] threadExecutionWidth];
        unint64_t v27 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[2] maxTotalThreadsPerThreadgroup]/ v26;
        int v28 = v11;
        v36[0] = [v9 width] >> 1;
        v36[1] = [v9 height] >> 1;
        v36[2] = 1;
        v35[0] = v26;
        v35[1] = v27;
        v35[2] = 1;
        [v25 dispatchThreads:v36 threadsPerThreadgroup:v35];
        int v38 = *(unsigned __int16 *)&self->_anon_24c[6];
        [v25 setComputePipelineState:self->_pipelineStates[3]];
        [v25 setTexture:v24 atIndex:0];
        [v25 setTexture:v9 atIndex:1];
        [v25 setBytes:&v38 length:4 atIndex:0];
        unint64_t v29 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[3] threadExecutionWidth];
        unint64_t v30 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[3] maxTotalThreadsPerThreadgroup]/ v29;
        v34[0] = [v9 width] >> 1;
        v34[1] = [v9 height] >> 1;
        v34[2] = 1;
        v33[0] = v29;
        v33[1] = v30;
        uint64_t v11 = v28;
        v33[2] = 1;
        [v25 dispatchThreads:v34 threadsPerThreadgroup:v33];
        [v25 endEncoding];

        int v31 = 0;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v31 = FigSignalErrorAt();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v31 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v31 = -12780;
  }
  FigMetalDecRef();

  return v31;
}

- (int)_featherMask:(id)a3 outputFeatheredMask:(id)a4 commandBuffer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  v46[0] = 0;
  id v45 = 0;
  if (v8 && v9 && v10)
  {
    uint32x4_t v12 = [(FigMetalContext *)self->_metalContext allocator];
    id v13 = [v12 newTextureDescriptor];

    if (v13)
    {
      unint64_t v14 = [v13 desc];
      [v14 setCompressionMode:2];

      unint64_t v15 = [v13 desc];
      [v15 setCompressionFootprint:0];

      unint64_t v16 = [v13 desc];
      [v16 setUsage:7];

      id v17 = [v8 pixelFormat];
      int v18 = [v13 desc];
      [v18 setPixelFormat:v17];

      id v19 = [v8 width];
      uint64_t v20 = [v13 desc];
      [v20 setWidth:v19];

      id v21 = [v8 height];
      int v22 = [v13 desc];
      [v22 setHeight:v21];

      [v13 setLabel:0];
      int v23 = [(FigMetalContext *)self->_metalContext allocator];
      id v24 = [v23 newTextureWithDescriptor:v13];
      id v45 = v24;

      if (v24)
      {
        unsigned int v25 = [v11 computeCommandEncoder];
        v46[0] = *(unsigned __int16 *)&self->_anon_24c[8];
        [v25 setComputePipelineState:self->_pipelineStates[2]];
        [v25 setTexture:v8 atIndex:0];
        [v25 setTexture:v24 atIndex:1];
        [v25 setBytes:v46 length:4 atIndex:0];
        unint64_t v26 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[2] threadExecutionWidth];
        unint64_t v27 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[2] maxTotalThreadsPerThreadgroup]/ v26;
        unsigned int v36 = v11;
        v44[0] = [v9 width] >> 1;
        v44[1] = [v9 height] >> 1;
        v44[2] = 1;
        v43[0] = v26;
        v43[1] = v27;
        v43[2] = 1;
        [v25 dispatchThreads:v44 threadsPerThreadgroup:v43];
        v46[0] = *(unsigned __int16 *)&self->_anon_24c[10];
        [v25 setComputePipelineState:self->_pipelineStates[3]];
        [v25 setTexture:v24 atIndex:0];
        [v25 setTexture:v9 atIndex:1];
        [v25 setBytes:v46 length:4 atIndex:0];
        unint64_t v28 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[3] threadExecutionWidth];
        unint64_t v29 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[3] maxTotalThreadsPerThreadgroup]/ v28;
        v42[0] = [v9 width] >> 1;
        v42[1] = [v9 height] >> 1;
        v42[2] = 1;
        v41[0] = v28;
        v41[1] = v29;
        v41[2] = 1;
        [v25 dispatchThreads:v42 threadsPerThreadgroup:v41];
        v46[0] = *(unsigned __int16 *)&self->_anon_24c[8];
        [v25 setComputePipelineState:self->_pipelineStates[4]];
        [v25 setTexture:v9 atIndex:0];
        [v25 setTexture:v24 atIndex:1];
        [v25 setBytes:v46 length:4 atIndex:0];
        unint64_t v30 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[4] threadExecutionWidth];
        unint64_t v31 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[4] maxTotalThreadsPerThreadgroup]/ v30;
        v40[0] = [v9 width] >> 1;
        v40[1] = [v9 height] >> 1;
        v40[2] = 1;
        v39[0] = v30;
        v39[1] = v31;
        v39[2] = 1;
        [v25 dispatchThreads:v40 threadsPerThreadgroup:v39];
        v46[0] = *(unsigned __int16 *)&self->_anon_24c[10];
        [v25 setComputePipelineState:self->_pipelineStates[5]];
        [v25 setTexture:v45 atIndex:0];
        [v25 setTexture:v9 atIndex:1];
        [v25 setBytes:v46 length:4 atIndex:0];
        unint64_t v32 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[5] threadExecutionWidth];
        unint64_t v33 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[5] maxTotalThreadsPerThreadgroup]/ v32;
        v38[0] = [v9 width] >> 1;
        v38[1] = [v9 height] >> 1;
        v38[2] = 1;
        v37[0] = v32;
        v37[1] = v33;
        uint64_t v11 = v36;
        v37[2] = 1;
        [v25 dispatchThreads:v38 threadsPerThreadgroup:v37];
        [v25 endEncoding];

        int v34 = 0;
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        int v34 = FigSignalErrorAt();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v34 = FigSignalErrorAt();
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v34 = -12780;
  }
  FigMetalDecRef();

  return v34;
}

- (int)_copyImageTileFromPixelBuffer:(__CVBuffer *)a3 mergeWithMask:(id)a4 outputTilePixelBuffer:(__CVBuffer *)a5 commandBuffer:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  int v25 = 0;
  if (!a3 || !v10)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a5 = 0;
LABEL_10:
    uint32x4_t v12 = 0;
    int v21 = -12780;
    goto LABEL_7;
  }
  if (!a5)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_10;
  }
  uint32x4_t v12 = [(CMIVideoDeghostingRepairV1 *)self _cachedTexturesFromPixelBuffer:a3 usage:1];
  if ([v12 count] != (char *)&dword_0 + 2)
  {
    a5 = 0;
    goto LABEL_12;
  }
  a5 = [(CMIVideoDeghostingRepairV1 *)self _cachedTexturesFromPixelBuffer:a5 usage:2];
  if ([(__CVBuffer *)a5 count] != (char *)&dword_0 + 1)
  {
LABEL_12:
    int v21 = -12786;
    goto LABEL_7;
  }
  uint32x4_t v13 = vmovl_u16(*(uint16x4_t *)self->_inputROI);
  HIWORD(v25) = v13.i16[2];
  LOWORD(v25) = v13.i16[0];
  unint64_t v14 = [v11 computeCommandEncoder];
  [v14 setComputePipelineState:self->_pipelineStates[6]];
  unint64_t v15 = [v12 objectAtIndexedSubscript:0];
  [v14 setTexture:v15 atIndex:0];

  unint64_t v16 = [v12 objectAtIndexedSubscript:1];
  [v14 setTexture:v16 atIndex:1];

  [v14 setTexture:v10 atIndex:2];
  id v17 = [(__CVBuffer *)a5 objectAtIndexedSubscript:0];
  [v14 setTexture:v17 atIndex:3];

  [v14 setBytes:&v25 length:4 atIndex:0];
  unint64_t v18 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[6] threadExecutionWidth];
  unint64_t v19 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[6] maxTotalThreadsPerThreadgroup];
  uint64_t v20 = *(unsigned __int16 *)&self->_anon_24c[2];
  v24[0] = *(unsigned __int16 *)self->_anon_24c;
  v24[1] = v20;
  v24[2] = 1;
  v23[0] = v18;
  v23[1] = v19 / v18;
  v23[2] = 1;
  [v14 dispatchThreads:v24 threadsPerThreadgroup:v23];
  [v14 endEncoding];

  int v21 = 0;
LABEL_7:

  return v21;
}

- (int)_pasteRepairedTile:(__CVBuffer *)a3 inputTileTexture:(id)a4 blendingMask:(id)a5 outputPixelBuffer:(__CVBuffer *)a6 commandBuffer:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v28 = 0;
  if (!a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_11:
    a6 = 0;
LABEL_13:
    id v17 = 0;
    int v24 = -12780;
    goto LABEL_8;
  }
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a3 = 0;
    goto LABEL_11;
  }
  if (!a6)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    a3 = 0;
    goto LABEL_13;
  }
  uint32x4_t v15 = vmovl_u16(*(uint16x4_t *)self->_inputROI);
  WORD1(v28) = v15.i16[2];
  LOWORD(v28) = v15.i16[0];
  HIDWORD(v28) = LODWORD(self->_blendingStrength);
  a3 = [(CMIVideoDeghostingRepairV1 *)self _cachedTexturesFromPixelBuffer:a3 usage:1];
  if ([(__CVBuffer *)a3 count] != (char *)&dword_0 + 1)
  {
    a6 = 0;
    goto LABEL_15;
  }
  a6 = [(CMIVideoDeghostingRepairV1 *)self _cachedTexturesFromPixelBuffer:a6 usage:3];
  if ([(__CVBuffer *)a6 count] != (char *)&dword_0 + 2)
  {
LABEL_15:
    id v17 = 0;
    int v24 = -12786;
    goto LABEL_8;
  }
  unint64_t v16 = [v14 computeCommandEncoder];
  id v17 = v16;
  if (v16)
  {
    [v16 setComputePipelineState:self->_pipelineStates[7]];
    unint64_t v18 = [(__CVBuffer *)a3 objectAtIndexedSubscript:0];
    [v17 setTexture:v18 atIndex:0];

    [v17 setTexture:v12 atIndex:1];
    [v17 setTexture:v13 atIndex:2];
    unint64_t v19 = [(__CVBuffer *)a6 objectAtIndexedSubscript:0];
    [v17 setTexture:v19 atIndex:3];

    uint64_t v20 = [(__CVBuffer *)a6 objectAtIndexedSubscript:1];
    [v17 setTexture:v20 atIndex:4];

    [v17 setBytes:&v28 length:8 atIndex:0];
    unint64_t v21 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[7] threadExecutionWidth];
    unint64_t v22 = (unint64_t)[(MTLComputePipelineState *)self->_pipelineStates[7] maxTotalThreadsPerThreadgroup];
    unint64_t v23 = (unint64_t)*(unsigned __int16 *)&self->_anon_24c[2] >> 1;
    v27[0] = (unint64_t)*(unsigned __int16 *)self->_anon_24c >> 1;
    v27[1] = v23;
    v27[2] = 1;
    v26[0] = v21;
    v26[1] = v22 / v21;
    v26[2] = 1;
    [v17 dispatchThreads:v27 threadsPerThreadgroup:v26];
    [v17 endEncoding];
    int v24 = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    int v24 = FigSignalErrorAt();
  }
LABEL_8:

  return v24;
}

- (int)_compileShaders
{
  objc_super v3 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingRepair::extractMaskTile" constants:0];
  uint16x4_t v4 = self->_pipelineStates[0];
  self->_pipelineStates[0] = v3;

  if (self->_pipelineStates[0])
  {
    uint64_t v5 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingRepair::extractImageTile" constants:0];
    uint64_t v6 = self->_pipelineStates[1];
    self->_pipelineStates[1] = v5;

    if (self->_pipelineStates[1])
    {
      unsigned __int16 v7 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingRepair::dilateMaskHorizontal" constants:0];
      id v8 = self->_pipelineStates[2];
      self->_pipelineStates[2] = v7;

      if (self->_pipelineStates[2])
      {
        id v9 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingRepair::dilateMaskVerticalBinary" constants:0];
        id v10 = self->_pipelineStates[3];
        self->_pipelineStates[3] = v9;

        if (self->_pipelineStates[3])
        {
          id v11 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingRepair::horizontalBoxFilter" constants:0];
          id v12 = self->_pipelineStates[4];
          self->_pipelineStates[4] = v11;

          if (self->_pipelineStates[4])
          {
            id v13 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingRepair::verticalBoxFilter" constants:0];
            id v14 = self->_pipelineStates[5];
            self->_pipelineStates[5] = v13;

            if (self->_pipelineStates[4])
            {
              uint32x4_t v15 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingRepair::extractImageTileAndMergeMask" constants:0];
              unint64_t v16 = self->_pipelineStates[6];
              self->_pipelineStates[6] = v15;

              if (self->_pipelineStates[6])
              {
                id v17 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingRepair::pasteTileAndBlendWithMaskKernel" constants:0];
                unint64_t v18 = self->_pipelineStates[7];
                self->_pipelineStates[7] = v17;

                if (self->_pipelineStates[7])
                {
                  unint64_t v19 = [(FigMetalContext *)self->_metalContext computePipelineStateFor:@"videoDeghostingRepair::drawFilledCircle" constants:0];
                  uint64_t v20 = self->_pipelineStates[8];
                  self->_pipelineStates[8] = v19;

                  if (self->_pipelineStates[8]) {
                    return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  fig_log_get_emitter();
  FigDebugAssert3();

  return FigSignalErrorAt();
}

- (id)_cachedTexturesFromPixelBuffer:(__CVBuffer *)a3 usage:(unint64_t)a4
{
  CVMetalTextureRef image = 0;
  if (!a3)
  {
    id v8 = 0;
    id v6 = 0;
LABEL_89:
    CFDictionaryRef v13 = 0;
    goto LABEL_83;
  }
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  if (!v6)
  {
    id v8 = 0;
    goto LABEL_89;
  }
  signed int PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  id v8 = 0;
  int v9 = 1;
  MTLPixelFormat v10 = MTLPixelFormatR8Unorm;
  if (PixelFormatType > 796423727)
  {
    if (PixelFormatType <= 1751527983)
    {
      if (PixelFormatType > 875704437)
      {
        switch(PixelFormatType)
        {
          case 875704438:
            goto LABEL_38;
          case 1278226534:
            int v9 = 0;
            MTLPixelFormat v10 = MTLPixelFormatR32Float;
            goto LABEL_38;
          case 1278226536:
            int v9 = 0;
            MTLPixelFormat v10 = MTLPixelFormatR16Float;
            goto LABEL_38;
        }
LABEL_36:
        CFDictionaryRef v13 = 0;
        goto LABEL_83;
      }
      if (PixelFormatType == 796423728) {
        goto LABEL_37;
      }
      int v12 = 875704422;
    }
    else
    {
      if (PixelFormatType > 2084075055)
      {
        if (PixelFormatType == 2084075056) {
          goto LABEL_38;
        }
        if (PixelFormatType == 2088265264) {
          goto LABEL_37;
        }
        int v11 = 2088269360;
        goto LABEL_29;
      }
      if (PixelFormatType == 1751527984 || PixelFormatType == 2016686640)
      {
        MTLPixelFormat v10 = MTLPixelFormatR16Unorm;
        goto LABEL_38;
      }
      int v12 = 2084070960;
    }
LABEL_35:
    if (PixelFormatType == v12) {
      goto LABEL_38;
    }
    goto LABEL_36;
  }
  if (PixelFormatType <= 758674991)
  {
    if (PixelFormatType <= 645424687)
    {
      if (PixelFormatType == 641230384) {
        goto LABEL_38;
      }
      int v12 = 641234480;
    }
    else
    {
      if (PixelFormatType == 645424688 || PixelFormatType == 645428784) {
        goto LABEL_37;
      }
      int v12 = 758670896;
    }
    goto LABEL_35;
  }
  if (PixelFormatType > 792225327)
  {
    if (PixelFormatType == 792225328 || PixelFormatType == 792229424) {
      goto LABEL_38;
    }
    int v11 = 796419632;
LABEL_29:
    if (PixelFormatType != v11) {
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  if (PixelFormatType != 758674992)
  {
    if (PixelFormatType != 762865200)
    {
      int v11 = 762869296;
      goto LABEL_29;
    }
LABEL_37:
    MTLPixelFormat v10 = 588;
  }
LABEL_38:
  unsigned int WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  unsigned int HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  CFStringRef v16 = kCVMetalTextureUsage;
  CFStringRef v38 = kCVMetalTextureUsage;
  id v17 = +[NSNumber numberWithUnsignedInteger:a4];
  v39 = v17;
  CFDictionaryRef v13 = +[NSDictionary dictionaryWithObjects:&v39 forKeys:&v38 count:1];

  CVReturn v18 = CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, self->_cvMetalTextureCacheRef, a3, v13, v10, WidthOfPlane, HeightOfPlane, 0, &image);
  CVMetalTextureRef v19 = image;
  if (v18) {
    goto LABEL_91;
  }
  uint64_t v20 = CVMetalTextureGetTexture(image);
  [v6 setObject:v20 atIndexedSubscript:0];

  unint64_t v21 = [v6 objectAtIndexedSubscript:0];

  CVMetalTextureRef v19 = image;
  if (!v21) {
    goto LABEL_91;
  }
  if (image) {
    CFRelease(image);
  }
  if (!v9)
  {
    CFDictionaryRef v25 = v13;
LABEL_82:
    id v8 = v6;
    id v6 = v8;
    CFDictionaryRef v13 = v25;
    goto LABEL_83;
  }
  signed int v22 = CVPixelBufferGetPixelFormatType(a3);
  id v8 = 0;
  MTLPixelFormat v23 = MTLPixelFormatRG8Unorm;
  if (v22 <= 796419631)
  {
    if (v22 <= 758674991)
    {
      if (v22 > 645424687)
      {
        if (v22 != 645424688 && v22 != 645428784)
        {
          int v24 = 758670896;
          goto LABEL_75;
        }
        goto LABEL_72;
      }
      if (v22 == 641230384) {
        goto LABEL_78;
      }
      int v24 = 641234480;
LABEL_75:
      if (v22 != v24) {
        goto LABEL_83;
      }
      goto LABEL_78;
    }
    if (v22 > 762869295)
    {
      if (v22 != 762869296)
      {
        if (v22 == 792225328) {
          goto LABEL_78;
        }
        int v24 = 792229424;
        goto LABEL_75;
      }
LABEL_72:
      MTLPixelFormat v23 = MTLPixelFormatRGBA8Uint|0x204;
      goto LABEL_78;
    }
    if (v22 == 758674992) {
      goto LABEL_78;
    }
    int v26 = 762865200;
LABEL_71:
    if (v22 != v26) {
      goto LABEL_83;
    }
    goto LABEL_72;
  }
  if (v22 > 2016686639)
  {
    if (v22 > 2084075055)
    {
      if (v22 == 2084075056) {
        goto LABEL_78;
      }
      if (v22 == 2088265264) {
        goto LABEL_72;
      }
      int v26 = 2088269360;
      goto LABEL_71;
    }
    if (v22 != 2016686640)
    {
      int v24 = 2084070960;
      goto LABEL_75;
    }
  }
  else
  {
    if (v22 <= 875704421)
    {
      if (v22 == 796419632) {
        goto LABEL_72;
      }
      int v26 = 796423728;
      goto LABEL_71;
    }
    if (v22 == 875704422 || v22 == 875704438) {
      goto LABEL_78;
    }
    if (v22 != 1751527984) {
      goto LABEL_83;
    }
  }
  MTLPixelFormat v23 = MTLPixelFormatRG16Unorm;
LABEL_78:
  unsigned int v27 = CVPixelBufferGetWidthOfPlane(a3, 1uLL);
  unsigned int v28 = CVPixelBufferGetHeightOfPlane(a3, 1uLL);
  CFStringRef v36 = v16;
  unint64_t v29 = +[NSNumber numberWithUnsignedInteger:a4];
  id v37 = v29;
  CFDictionaryRef v25 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

  CVReturn v30 = CVMetalTextureCacheCreateTextureFromImage(kCFAllocatorDefault, self->_cvMetalTextureCacheRef, a3, v25, v23, v27, v28, 1uLL, &image);
  CVMetalTextureRef v19 = image;
  if (!v30)
  {
    unint64_t v31 = CVMetalTextureGetTexture(image);
    [v6 setObject:v31 atIndexedSubscript:1];

    unint64_t v32 = [v6 objectAtIndexedSubscript:1];

    CVMetalTextureRef v19 = image;
    if (v32)
    {
      if (image) {
        CFRelease(image);
      }
      goto LABEL_82;
    }
  }
  CFDictionaryRef v13 = v25;
LABEL_91:
  if (v19) {
    CFRelease(v19);
  }
  id v8 = 0;
LABEL_83:

  return v8;
}

- (opaqueCMSampleBuffer)inputSampleBuffer
{
  return self->_inputSampleBuffer;
}

- (void)setInputSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_inputSampleBuffer = a3;
}

- (float)blendingStrength
{
  return self->_blendingStrength;
}

- (void)setBlendingStrength:(float)a3
{
  self->_float blendingStrength = a3;
}

- (NSDictionary)tuningParameters
{
  return self->_tuningParameters;
}

- (void)setTuningParameters:(id)a3
{
}

- (NSDictionary)cameraInfoByPortType
{
  return self->_cameraInfoByPortType;
}

- (void)setCameraInfoByPortType:(id)a3
{
}

- (MTLCommandQueue)metalCommandQueue
{
  return self->_metalCommandQueue;
}

- (void)setMetalCommandQueue:(id)a3
{
}

- (NSArray)detectedGhostBoundingBoxes
{
  return self->_detectedGhostBoundingBoxes;
}

- (void)setDetectedGhostBoundingBoxes:(id)a3
{
}

- ($2EE007E8DB0A29FF0870D731F0956162)ghostInformationLookAheadPointer
{
  return self->_ghostInformationLookAheadPointer;
}

- (void)setGhostInformationLookAheadPointer:(id *)a3
{
  self->_ghostInformationLookAheadPointer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedGhostBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_metalCommandQueue, 0);
  objc_storeStrong((id *)&self->_cameraInfoByPortType, 0);
  objc_storeStrong((id *)&self->_tuningParameters, 0);
  for (uint64_t i = 0; i != -9; --i)
    objc_storeStrong((id *)&self->_pipelineStates[i + 8], 0);
  objc_storeStrong((id *)&self->_tileBlendingMaskTexture, 0);
  objc_storeStrong((id *)&self->_tileDilatedMaskTexture, 0);
  objc_storeStrong((id *)&self->_tileInputMaskTexture, 0);
  objc_storeStrong((id *)&self->_tileInputImageTexture, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);

  objc_storeStrong((id *)&self->_repairParameters, 0);
}

@end