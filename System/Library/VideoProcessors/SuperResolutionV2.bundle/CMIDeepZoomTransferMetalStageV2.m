@interface CMIDeepZoomTransferMetalStageV2
- (CMIDeepZoomTransferMetalStageV2)initWithMetalContext:(id)a3 options:(id)a4;
- (NSArray)modelInputBindingNames;
- (NSArray)modelInputPixelFormats;
- (NSArray)modelInputSizes;
- (NSArray)modelInputSlicesCount;
- (NSArray)modelOutputBindingNames;
- (NSArray)modelOutputPixelFormats;
- (NSArray)modelOutputSizes;
- (NSArray)modelOutputSlicesCount;
- (NSString)modelNetworkBaseName;
- (__n128)tileOverlap;
- (__n128)tileSize;
- (int)clearBuffer:(__CVBuffer *)a3;
- (int)cutTilesFrom:(id)a3 to:(id)a4 params:(id *)a5 outCommandBuffer:(id *)a6;
- (int)pasteTilesFrom:(id)a3 with:(id)a4 inputFullPixelBuffers:(id)a5 to:(__CVBuffer *)a6 params:(id *)a7 outCommandBuffer:(id *)a8;
- (int)updateMetadata:(id)a3 forInputFullPixelBuffer:(__CVBuffer *)a4;
- (void)dealloc;
- (void)finishProcessing;
- (void)resetMetadata;
@end

@implementation CMIDeepZoomTransferMetalStageV2

- (CMIDeepZoomTransferMetalStageV2)initWithMetalContext:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v61[0] = kCVPixelBufferMetalCompatibilityKey;
  v61[1] = kCVPixelBufferIOSurfaceCoreAnimationCompatibilityKey;
  v62[0] = &__kCFBooleanTrue;
  v62[1] = &__kCFBooleanTrue;
  v61[2] = kCVPixelBufferIOSurfacePropertiesKey;
  v62[2] = &__NSDictionary0__struct;
  CFDictionaryRef v9 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:3];
  v58.receiver = self;
  v58.super_class = (Class)CMIDeepZoomTransferMetalStageV2;
  v10 = [(CMIDeepZoomTransferMetalStageV2 *)&v58 init];
  if (!v10) {
    goto LABEL_22;
  }
  v11 = [v8 objectForKeyedSubscript:@"DeepTransferNetwork"];
  unsigned int v12 = [v11 intValue];

  if (v12 == 2)
  {
    v13 = (void *)*((void *)v10 + 23);
    CFStringRef v14 = @"deep_transfer_stereo_photo-v2";
LABEL_8:
    *((void *)v10 + 23) = v14;
    goto LABEL_9;
  }
  if (v12 == 1)
  {
    v13 = (void *)*((void *)v10 + 23);
    CFStringRef v14 = @"deep_transfer_zoom-v2";
    goto LABEL_8;
  }
  if (v12)
  {
LABEL_26:
    sub_B034(v10);
    v56 = 0;
    goto LABEL_23;
  }
  v13 = (void *)*((void *)v10 + 23);
  *((void *)v10 + 23) = @"deep_transfer-v2";
LABEL_9:

  uint64_t v15 = objc_opt_new();
  v16 = (void *)*((void *)v10 + 11);
  *((void *)v10 + 11) = v15;

  v17 = (void *)*((void *)v10 + 11);
  v18 = [v8 objectForKeyedSubscript:@"TuningParameters"];
  LODWORD(v17) = [v17 readPlist:v18];

  if (v17)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_26;
  }
  uint64_t v19 = +[NSArray arrayWithObjects:@"in_img_1", @"in_img_2", 0];
  v20 = (void *)*((void *)v10 + 24);
  *((void *)v10 + 24) = v19;

  uint64_t v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_191C8, &off_191E0, 0);
  v22 = (void *)*((void *)v10 + 25);
  *((void *)v10 + 25) = v21;

  v23 = +[NSNumber numberWithUnsignedInt:1278226536];
  v24 = +[NSNumber numberWithUnsignedInt:1278226536];
  uint64_t v25 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v23, v24, 0);
  v26 = (void *)*((void *)v10 + 26);
  *((void *)v10 + 26) = v25;

  uint64_t v27 = +[NSArray arrayWithObjects:@"out_img", 0];
  v28 = (void *)*((void *)v10 + 28);
  *((void *)v10 + 28) = v27;

  uint64_t v29 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_191F8, 0);
  v30 = (void *)*((void *)v10 + 29);
  *((void *)v10 + 29) = v29;

  v31 = +[NSNumber numberWithUnsignedInt:1278226536];
  uint64_t v32 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v31, 0);
  v33 = (void *)*((void *)v10 + 30);
  *((void *)v10 + 30) = v32;

  *((void *)v10 + 2) = 0x10001001C001F0;
  *(void *)(v10 + 172) = 0x10001001C001F0;
  objc_storeStrong((id *)v10 + 1, a3);
  if (!*((void *)v10 + 1))
  {
    v34 = +[NSBundle bundleForClass:objc_opt_class()];
    id v35 = [objc_alloc((Class)FigMetalContext) initWithbundle:v34 andOptionalCommandQueue:0];
    v36 = (void *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v35;

    if (!*((void *)v10 + 1)) {
      goto LABEL_26;
    }
  }
  id v37 = objc_alloc_init((Class)NSMutableDictionary);
  v38 = (void *)*((void *)v10 + 16);
  *((void *)v10 + 16) = v37;

  if (!*((void *)v10 + 16)) {
    goto LABEL_26;
  }
  id v39 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v40 = (void *)*((void *)v10 + 20);
  *((void *)v10 + 20) = v39;

  if (!*((void *)v10 + 20)) {
    goto LABEL_26;
  }
  v41 = [*((id *)v10 + 1) device];
  id v42 = [v41 newCommandQueue];
  [*((id *)v10 + 20) setObject:v42 atIndexedSubscript:0];

  v43 = [*((id *)v10 + 1) device];
  id v44 = [v43 newCommandQueue];
  [*((id *)v10 + 20) setObject:v44 atIndexedSubscript:1];

  if (sub_A758((uint64_t)v10)) {
    goto LABEL_26;
  }
  v45 = [[CMIDeepZoomTransferPreProcMetalStageV2 alloc] initWithMetalContext:v7 withTileConfiguration:v10 + 16];
  v46 = (void *)*((void *)v10 + 18);
  *((void *)v10 + 18) = v45;

  if (!*((void *)v10 + 18)) {
    goto LABEL_26;
  }
  v47 = [[CMIDeepZoomTransferPostProcMetalStageV2 alloc] initWithMetalContext:v7 withTileConfiguration:v10 + 16];
  v48 = (void *)*((void *)v10 + 19);
  *((void *)v10 + 19) = v47;

  if (!*((void *)v10 + 19)) {
    goto LABEL_26;
  }
  CFStringRef v59 = kCVMetalTextureCacheMaximumTextureAgeKey;
  v60 = &off_190C8;
  CFDictionaryRef v49 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
  v50 = [*((id *)v10 + 1) device];
  CVReturn v51 = CVMetalTextureCacheCreate(kCFAllocatorDefault, v49, v50, 0, (CVMetalTextureCacheRef *)v10 + 3);

  if (v51) {
    goto LABEL_24;
  }
  if (CVPixelBufferCreate(kCFAllocatorDefault, 3 * *((unsigned __int16 *)v10 + 8), 3 * *((unsigned __int16 *)v10 + 9), 0x4C303068u, v9, (CVPixelBufferRef *)v10 + 12))
  {
    goto LABEL_24;
  }
  v52 = sub_AC84((uint64_t)v10, *((CVPixelBufferRef *)v10 + 12), 1);
  uint64_t v53 = [v52 objectAtIndexedSubscript:0];
  v54 = (void *)*((void *)v10 + 13);
  *((void *)v10 + 13) = v53;

  if (!*((void *)v10 + 13) || sub_3204((uint64_t)v10, *((__CVBuffer **)v10 + 12), (_WORD *)v10 + 8, v55))
  {
LABEL_24:

    goto LABEL_26;
  }

LABEL_22:
  v56 = v10;
LABEL_23:

  return v56;
}

- (void)dealloc
{
  sub_B034(self);
  v3.receiver = self;
  v3.super_class = (Class)CMIDeepZoomTransferMetalStageV2;
  [(CMIDeepZoomTransferMetalStageV2 *)&v3 dealloc];
}

- (int)clearBuffer:(__CVBuffer *)a3
{
  if (!a3)
  {
    uint64_t v19 = 0;
    v18 = 0;
    v17 = 0;
    int v32 = -12780;
    goto LABEL_12;
  }
  p_tileOutputPixelBuffer = &self->_tileOutputPixelBuffer;
  tileOutputPixelBuffer = self->_tileOutputPixelBuffer;
  self->_uint64_t currentCommandQueueIndex = 0;
  if (tileOutputPixelBuffer)
  {
    uint64_t currentCommandQueueIndex = 0;
LABEL_7:
    v16 = [(NSMutableArray *)self->_commandQueues objectAtIndexedSubscript:currentCommandQueueIndex];
    v17 = [v16 commandBuffer];

    if (!v17)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v32 = FigSignalErrorAt();
      uint64_t v19 = 0;
      v18 = 0;
      goto LABEL_12;
    }
    v18 = [v17 computeCommandEncoder];
    if (!v18)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v32 = FigSignalErrorAt();
      uint64_t v19 = 0;
      goto LABEL_12;
    }
    uint64_t v19 = sub_AC84((uint64_t)self, a3, 2);
    if ([v19 count] != (char *)&dword_0 + 2)
    {
      int v32 = -12786;
      goto LABEL_12;
    }
    [v18 setComputePipelineState:self->_clearTexturePipelineState];
    v20 = [v19 objectAtIndexedSubscript:0];
    [v18 setTexture:v20 atIndex:0];

    unint64_t v21 = (unint64_t)[(MTLComputePipelineState *)self->_clearTexturePipelineState threadExecutionWidth];
    unint64_t v22 = (unint64_t)[(MTLComputePipelineState *)self->_clearTexturePipelineState maxTotalThreadsPerThreadgroup]/ v21;
    v23 = [v19 objectAtIndexedSubscript:0];
    id v24 = [v23 width];
    uint64_t v25 = [v19 objectAtIndexedSubscript:0];
    v37[0] = v24;
    v37[1] = [v25 height];
    v37[2] = 1;
    v36[0] = v21;
    v36[1] = v22;
    v36[2] = 1;
    [v18 dispatchThreads:v37 threadsPerThreadgroup:v36];

    [v18 setComputePipelineState:self->_clearTexturePipelineState];
    v26 = [v19 objectAtIndexedSubscript:1];
    [v18 setTexture:v26 atIndex:0];

    unint64_t v27 = (unint64_t)[(MTLComputePipelineState *)self->_clearTexturePipelineState threadExecutionWidth];
    unint64_t v28 = (unint64_t)[(MTLComputePipelineState *)self->_clearTexturePipelineState maxTotalThreadsPerThreadgroup]/ v27;
    uint64_t v29 = [v19 objectAtIndexedSubscript:1];
    id v30 = [v29 width];
    v31 = [v19 objectAtIndexedSubscript:1];
    v35[0] = v30;
    v35[1] = [v31 height];
    v35[2] = 1;
    v34[0] = v27;
    v34[1] = v28;
    v34[2] = 1;
    [v18 dispatchThreads:v35 threadsPerThreadgroup:v34];

    [v18 endEncoding];
    [v17 commit];
    goto LABEL_11;
  }
  size_t v8 = *(unsigned __int16 *)self->_anon_10;
  size_t v9 = *(unsigned __int16 *)&self->_anon_10[2];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CFDictionaryRef Attributes = (const __CFDictionary *)CVPixelBufferGetAttributes();
  if (!CVPixelBufferCreate(kCFAllocatorDefault, v8, v9, PixelFormatType, Attributes, &self->_tileOutputEnhancedPixelBuffer))
  {
    size_t v12 = *(unsigned __int16 *)self->_anon_10;
    size_t v13 = *(unsigned __int16 *)&self->_anon_10[2];
    OSType v14 = CVPixelBufferGetPixelFormatType(a3);
    CFDictionaryRef v15 = (const __CFDictionary *)CVPixelBufferGetAttributes();
    if (!CVPixelBufferCreate(kCFAllocatorDefault, v12, v13, v14, v15, p_tileOutputPixelBuffer))
    {
      uint64_t currentCommandQueueIndex = self->_currentCommandQueueIndex;
      goto LABEL_7;
    }
  }
  uint64_t v19 = 0;
  v18 = 0;
  v17 = 0;
LABEL_11:
  int v32 = 0;
LABEL_12:

  return v32;
}

- (void)resetMetadata
{
}

- (int)updateMetadata:(id)a3 forInputFullPixelBuffer:(__CVBuffer *)a4
{
  metadataForPixelBuffers = self->_metadataForPixelBuffers;
  id v6 = a3;
  id v7 = +[NSNumber numberWithLong:a4];
  [(NSMutableDictionary *)metadataForPixelBuffers setObject:v6 forKeyedSubscript:v7];

  return 0;
}

- (int)cutTilesFrom:(id)a3 to:(id)a4 params:(id *)a5 outCommandBuffer:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if ([v10 count] != (char *)&dword_0 + 2)
  {
    int v13 = -12780;
    goto LABEL_33;
  }
  id v12 = [v11 count];
  int v13 = -12780;
  if (a5 && v12)
  {
    int v14 = sub_BFF8(self, v10, (uint64_t)a5);
    if (!v14)
    {
      CFDictionaryRef v15 = [(NSMutableArray *)self->_commandQueues objectAtIndexedSubscript:self->_currentCommandQueueIndex];
      v16 = [v15 commandBuffer];

      if (v16)
      {
        uint64_t v17 = [v16 computeCommandEncoder];
        if (v17)
        {
          v18 = (void *)v17;
          long long v19 = *((_OWORD *)a5 + 1);
          long long v131 = *(_OWORD *)a5;
          long long v132 = v19;
          v20 = [v10 objectAtIndexedSubscript:1];
          unsigned int Width = CVPixelBufferGetWidth(v20);

          unint64_t v22 = [v10 objectAtIndexedSubscript:1];
          unsigned int Height = CVPixelBufferGetHeight(v22);

          v24.i16[2] = HIWORD(v132);
          v24.i16[0] = WORD6(v132);
          int8x8_t v116 = v24;
          long long v127 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          id obj = [v11 allKeys];
          id v114 = [obj countByEnumeratingWithState:&v127 objects:v133 count:16];
          if (v114)
          {
            v108 = a5;
            v100 = a6;
            v101 = v16;
            v26 = 0;
            unint64_t v27 = 0;
            *(float32x2_t *)&long long v25 = vdiv_f32(vcvt_f32_u32((uint32x2_t)vand_s8(v116, (int8x8_t)0xFFFF0000FFFFLL)), vcvt_f32_u32((uint32x2_t)__PAIR64__(Height, Width)));
            long long v115 = v25;
            uint64_t v112 = *(void *)v128;
            v113 = v11;
            simd_float3 v110 = matrix_identity_float3x3.columns[1];
            simd_float3 v111 = matrix_identity_float3x3.columns[0];
            simd_float3 v109 = matrix_identity_float3x3.columns[2];
            __asm { FMOV            V9.2S, #1.0 }
            id v102 = v10;
            while (2)
            {
              v33 = 0;
              v34 = v26;
              id v35 = v27;
              do
              {
                if (*(void *)v128 != v112) {
                  objc_enumerationMutation(obj);
                }
                v36 = *(void **)(*((void *)&v127 + 1) + 8 * (void)v33);
                simd_float3 v124 = v111;
                simd_float3 v125 = v110;
                simd_float3 v126 = v109;
                id v37 = [(NSArray *)self->_modelInputBindingNames objectAtIndexedSubscript:0];
                unsigned int v38 = [v36 isEqual:v37];

                unsigned int v117 = v38;
                if (v38)
                {
                  float64x2_t v122 = 0u;
                  float64x2_t v123 = 0u;
                  metadataForPixelBuffers = self->_metadataForPixelBuffers;
                  v40 = [v10 objectAtIndexedSubscript:0];
                  v41 = +[NSNumber numberWithLong:v40];
                  id v42 = [(NSMutableDictionary *)metadataForPixelBuffers objectForKeyedSubscript:v41];

                  FigCFDictionaryGetCGRectIfPresent();
                  v43 = [v10 objectAtIndexedSubscript:1];
                  float v44 = (float)CVPixelBufferGetWidth(v43);
                  v45 = [v10 objectAtIndexedSubscript:0];
                  *(float *)v46.i32 = v44 / (float)CVPixelBufferGetWidth(v45);
                  *(int32x2_t *)&long long v132 = vdup_lane_s32(v46, 0);

                  *((void *)&v47 + 1) = *((void *)&v115 + 1);
                  float v48 = *(float *)&v115 / v123.f64[0];
                  *(float32x2_t *)&long long v132 = vmul_n_f32(*(float32x2_t *)&v132, v48);
                  *(float32x2_t *)&long long v47 = vcvt_f32_f64(v123);
                  long long v115 = v47;
                  float32x2_t v49 = vcvt_f32_f64(v122);
                  v50 = [v10 objectAtIndexedSubscript:0];
                  LODWORD(v45) = CVPixelBufferGetWidth(v50);

                  CVReturn v51 = [v10 objectAtIndexedSubscript:0];
                  v52.i64[0] = __PAIR64__(CVPixelBufferGetHeight(v51), v45);
                  simd_float3 v107 = v52;

                  uint64_t v53 = 0;
                  float32x2_t v54 = vcvt_f32_u32(*(uint32x2_t *)v107.f32);
                  uint32x2_t v55 = vcvt_n_u32_f32(vrnda_f32(vmul_f32(vmul_f32(v49, v54), (float32x2_t)0x3F0000003F000000)), 1uLL);
                  WORD5(v132) = v55.i16[2];
                  WORD4(v132) = v55.i16[0];
                  uint32x2_t v56 = vcvt_n_u32_f32(vrnda_f32(vmul_f32(vmul_f32(*(float32x2_t *)&v115, v54), (float32x2_t)0x3F0000003F000000)), 1uLL);
                  HIWORD(v132) = v56.i16[2];
                  WORD6(v132) = v56.i16[0];
                }
                else
                {
                  *(void *)&long long v132 = _D9;
                  id v42 = [(NSMutableArray *)self->_localHomographiesTable objectAtIndexedSubscript:0];
                  if ([v42 count] != (char *)&dword_8 + 1)
                  {

                    goto LABEL_32;
                  }
                  v57 = [v42 objectAtIndexedSubscript:0];
                  [v57 floatValue];
                  v107.i64[0] = v58;
                  CFStringRef v59 = [v42 objectAtIndexedSubscript:1];
                  [v59 floatValue];
                  __int32 v104 = v60;
                  v61 = [v42 objectAtIndexedSubscript:2];
                  [v61 floatValue];
                  simd_float3 v62 = v107;
                  v62.i32[1] = v104;
                  v62.i32[2] = v63;
                  simd_float3 v124 = v62;

                  v64 = [v42 objectAtIndexedSubscript:3];
                  [v64 floatValue];
                  v107.i64[0] = v65;
                  v66 = [v42 objectAtIndexedSubscript:4];
                  [v66 floatValue];
                  __int32 v105 = v67;
                  v68 = [v42 objectAtIndexedSubscript:5];
                  [v68 floatValue];
                  simd_float3 v69 = v107;
                  v69.i32[1] = v105;
                  v69.i32[2] = v70;
                  simd_float3 v125 = v69;

                  v71 = [v42 objectAtIndexedSubscript:6];
                  [v71 floatValue];
                  v107.i64[0] = v72;
                  v73 = [v42 objectAtIndexedSubscript:7];
                  [v73 floatValue];
                  __int32 v106 = v74;
                  v75 = [v42 objectAtIndexedSubscript:8];
                  [v75 floatValue];
                  simd_float3 v76 = v107;
                  v76.i32[1] = v106;
                  v76.i32[2] = v77;
                  simd_float3 v126 = v76;

                  id v10 = v102;
                  uint64_t v53 = 1;
                }

                v78 = [v10 objectAtIndexedSubscript:v53];
                unint64_t v27 = sub_AC84((uint64_t)self, v78, 1);

                if ([v27 count] != (char *)&dword_0 + 2) {
                  goto LABEL_30;
                }
                v79 = [v113 objectForKeyedSubscript:v36];
                v26 = sub_AC84((uint64_t)self, v79, 2);

                if (![v26 count])
                {
                  v34 = v26;
LABEL_30:
                  id v35 = v27;
LABEL_32:

                  int v13 = -12786;
                  id v11 = v113;
                  goto LABEL_33;
                }
                if ([v26 count] == (char *)&dword_0 + 3)
                {
                  [v18 setComputePipelineState:self->_tileCutInSlicesPipelineState];
                  v80 = [v27 objectAtIndexedSubscript:0];
                  [v18 setTexture:v80 atIndex:0];

                  v81 = [v27 objectAtIndexedSubscript:1];
                  [v18 setTexture:v81 atIndex:1];

                  v82 = [v26 objectAtIndexedSubscript:0];
                  [v18 setTexture:v82 atIndex:2];

                  v83 = [v26 objectAtIndexedSubscript:1];
                  [v18 setTexture:v83 atIndex:3];

                  v84 = [v26 objectAtIndexedSubscript:2];
                  [v18 setTexture:v84 atIndex:4];

                  [v18 setBytes:&v131 length:32 atIndex:0];
                  [v18 setBytes:&v124 length:48 atIndex:1];
                  uint64_t v85 = 80;
                  if (v117) {
                    uint64_t v85 = 72;
                  }
                  [v18 setSamplerState:*(Class *)((char *)&self->super.isa + v85) atIndex:0];
                  unint64_t v86 = (unint64_t)[(MTLComputePipelineState *)self->_tileCutInSlicesPipelineState threadExecutionWidth];
                  unint64_t v87 = (unint64_t)[(MTLComputePipelineState *)self->_tileCutInSlicesPipelineState maxTotalThreadsPerThreadgroup];
                  uint64_t v88 = *((unsigned __int16 *)v108 + 1);
                  v121[0] = *(_WORD *)v108;
                  v121[1] = v88;
                  v121[2] = 1;
                  v120[0] = v86;
                  v120[1] = v87 / v86;
                  v120[2] = 1;
                  v89 = v121;
                  v90 = v120;
                }
                else
                {
                  [v18 setComputePipelineState:self->_tileCutPipelineState];
                  v91 = [v27 objectAtIndexedSubscript:0];
                  [v18 setTexture:v91 atIndex:0];

                  v92 = [v27 objectAtIndexedSubscript:1];
                  [v18 setTexture:v92 atIndex:1];

                  v93 = [v26 objectAtIndexedSubscript:0];
                  [v18 setTexture:v93 atIndex:2];

                  [v18 setBytes:&v131 length:32 atIndex:0];
                  [v18 setBytes:&v124 length:48 atIndex:1];
                  uint64_t v94 = 80;
                  if (v117) {
                    uint64_t v94 = 72;
                  }
                  [v18 setSamplerState:*(Class *)((char *)&self->super.isa + v94) atIndex:0];
                  unint64_t v95 = (unint64_t)[(MTLComputePipelineState *)self->_tileCutPipelineState threadExecutionWidth];
                  unint64_t v96 = (unint64_t)[(MTLComputePipelineState *)self->_tileCutPipelineState maxTotalThreadsPerThreadgroup];
                  uint64_t v97 = *((unsigned __int16 *)v108 + 1);
                  v119[0] = *(_WORD *)v108;
                  v119[1] = v97;
                  v119[2] = 1;
                  v118[0] = v95;
                  v118[1] = v96 / v95;
                  v118[2] = 1;
                  v89 = v119;
                  v90 = v118;
                }
                [v18 dispatchThreads:v89 threadsPerThreadgroup:v90];
                v33 = (char *)v33 + 1;
                v34 = v26;
                id v35 = v27;
              }
              while (v114 != v33);
              id v114 = [obj countByEnumeratingWithState:&v127 objects:v133 count:16];
              if (v114) {
                continue;
              }
              break;
            }

            id v11 = v113;
            a6 = v100;
            v16 = v101;
          }

          [v18 endEncoding];
          id v98 = v16;
          *a6 = v98;

          int v13 = 0;
        }
        else
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          int v13 = FigSignalErrorAt();
        }
        goto LABEL_33;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      int v14 = FigSignalErrorAt();
    }
    int v13 = v14;
  }
LABEL_33:

  return v13;
}

- (int)pasteTilesFrom:(id)a3 with:(id)a4 inputFullPixelBuffers:(id)a5 to:(__CVBuffer *)a6 params:(id *)a7 outCommandBuffer:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint32x2_t v56 = v14;
  uint32x2_t v55 = v15;
  float32x2_t v54 = v16;
  if (![v14 count] || !objc_msgSend(v15, "count"))
  {
    v18 = 0;
    v20 = 0;
    unint64_t v21 = 0;
    unint64_t v22 = 0;
    v23 = 0;
    int8x8_t v24 = 0;
    id v25 = 0;
    int v19 = -12780;
    goto LABEL_16;
  }
  id v17 = [v16 count];
  v18 = 0;
  int v19 = -12780;
  if (!a7 || !a6)
  {
    v20 = 0;
    unint64_t v21 = 0;
    unint64_t v22 = 0;
    v23 = 0;
    int8x8_t v24 = 0;
    id v25 = 0;
    goto LABEL_16;
  }
  simd_float3 v52 = a8;
  uint64_t v53 = a7;
  v20 = 0;
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  v23 = 0;
  int8x8_t v24 = 0;
  id v25 = 0;
  if (v17)
  {
    v26 = [(NSMutableArray *)self->_commandQueues objectAtIndexedSubscript:self->_currentCommandQueueIndex];
    uint64_t v27 = [v26 commandBuffer];

    id v25 = (id)v27;
    if (!v27)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();
      v18 = 0;
      v20 = 0;
      unint64_t v21 = 0;
      unint64_t v22 = 0;
      v23 = 0;
      int8x8_t v24 = 0;
      goto LABEL_16;
    }
    unint64_t v28 = [(NSArray *)self->_modelInputBindingNames objectAtIndexedSubscript:0];
    uint64_t v29 = [v56 objectForKeyedSubscript:v28];
    v23 = sub_AC84((uint64_t)self, v29, 1);

    if ([v23 count])
    {
      id v30 = [(NSArray *)self->_modelOutputBindingNames objectAtIndexedSubscript:0];
      v31 = [v55 objectForKeyedSubscript:v30];
      v18 = sub_AC84((uint64_t)self, v31, 1);

      if ([v18 count])
      {
        unint64_t v21 = sub_AC84((uint64_t)self, self->_tileOutputEnhancedPixelBuffer, 3);
        if ([v21 count] == (char *)&dword_0 + 2)
        {
          unint64_t v22 = sub_AC84((uint64_t)self, self->_tileOutputPixelBuffer, 3);
          if ([v22 count] == (char *)&dword_0 + 2)
          {
            v20 = sub_AC84((uint64_t)self, a6, 3);
            if ([v20 count] == (char *)&dword_0 + 2)
            {
              unsigned int v32 = [(CMIDeepZoomTransferPostProcMetalStageV2 *)self->_deepZoomPostProcStage processTileFrom:v23 with:v18 to:v21 commandBuffer:v25];
              if (v32)
              {
                int v19 = v32;
                int8x8_t v24 = 0;
              }
              else
              {
                v33 = [v25 computeCommandEncoder];
                if (v33)
                {
                  v34 = v33;
                  [v33 setComputePipelineState:self->_tileMergePipelineState];
                  id v35 = [v21 objectAtIndexedSubscript:0];
                  [v34 setTexture:v35 atIndex:0];

                  v36 = [v21 objectAtIndexedSubscript:1];
                  [v34 setTexture:v36 atIndex:1];

                  [v34 setTexture:self->_tileInputWeightsTexture atIndex:2];
                  id v37 = [v20 objectAtIndexedSubscript:0];
                  [v34 setTexture:v37 atIndex:3];

                  unsigned int v38 = [v20 objectAtIndexedSubscript:1];
                  [v34 setTexture:v38 atIndex:4];

                  id v39 = [v22 objectAtIndexedSubscript:0];
                  [v34 setTexture:v39 atIndex:5];

                  v40 = [v22 objectAtIndexedSubscript:1];
                  [v34 setTexture:v40 atIndex:6];

                  [v34 setBytes:v53 length:24 atIndex:0];
                  unint64_t v41 = (unint64_t)[(MTLComputePipelineState *)self->_tileMergePipelineState threadExecutionWidth];
                  unint64_t v42 = (unint64_t)[(MTLComputePipelineState *)self->_tileMergePipelineState maxTotalThreadsPerThreadgroup];
                  unint64_t v43 = (unint64_t)*((unsigned __int16 *)v53 + 1) >> 1;
                  v60[0] = (unint64_t)*(_WORD *)v53 >> 1;
                  v60[1] = v43;
                  v60[2] = 1;
                  v59[0] = v41;
                  v59[1] = v42 / v41;
                  v59[2] = 1;
                  [v34 dispatchThreads:v60 threadsPerThreadgroup:v59];
                  [v34 endEncoding];
                  int8x8_t v24 = [v25 computeCommandEncoder];

                  if (v24)
                  {
                    [v24 setComputePipelineState:self->_tilePastePipelineState];
                    float v44 = [v22 objectAtIndexedSubscript:0];
                    [v24 setTexture:v44 atIndex:0];

                    v45 = [v22 objectAtIndexedSubscript:1];
                    [v24 setTexture:v45 atIndex:1];

                    int32x2_t v46 = [v20 objectAtIndexedSubscript:0];
                    [v24 setTexture:v46 atIndex:2];

                    long long v47 = [v20 objectAtIndexedSubscript:1];
                    [v24 setTexture:v47 atIndex:3];

                    [v24 setBytes:v53 length:24 atIndex:0];
                    unint64_t v48 = (unint64_t)[(MTLComputePipelineState *)self->_tilePastePipelineState threadExecutionWidth];
                    unint64_t v49 = (unint64_t)[(MTLComputePipelineState *)self->_tilePastePipelineState maxTotalThreadsPerThreadgroup];
                    unint64_t v50 = (unint64_t)*((unsigned __int16 *)v53 + 1) >> 1;
                    v58[0] = (unint64_t)*(_WORD *)v53 >> 1;
                    v58[1] = v50;
                    v58[2] = 1;
                    v57[0] = v48;
                    v57[1] = v49 / v48;
                    v57[2] = 1;
                    [v24 dispatchThreads:v58 threadsPerThreadgroup:v57];
                    [v24 endEncoding];
                    id v25 = v25;
                    int v19 = 0;
                    id *v52 = v25;
                    self->_uint64_t currentCommandQueueIndex = (self->_currentCommandQueueIndex & 1) == 0;
                  }
                  else
                  {
                    fig_log_get_emitter();
                    FigDebugAssert3();
                    int v19 = FigSignalErrorAt();
                  }
                }
                else
                {
                  fig_log_get_emitter();
                  FigDebugAssert3();
                  int v19 = FigSignalErrorAt();
                  int8x8_t v24 = 0;
                }
              }
              goto LABEL_16;
            }
          }
          else
          {
            v20 = 0;
          }
LABEL_25:
          int8x8_t v24 = 0;
          int v19 = -12786;
          goto LABEL_16;
        }
        v20 = 0;
LABEL_23:
        unint64_t v22 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      v18 = 0;
    }
    v20 = 0;
    unint64_t v21 = 0;
    goto LABEL_23;
  }
LABEL_16:

  return v19;
}

- (void)finishProcessing
{
  [(FigMetalContext *)self->_metalContext waitForIdle];
  cvMetalTextureCacheRef = self->_cvMetalTextureCacheRef;
  if (cvMetalTextureCacheRef) {
    CVMetalTextureCacheFlush(cvMetalTextureCacheRef, 0);
  }
  tileOutputPixelBuffer = self->_tileOutputPixelBuffer;
  if (tileOutputPixelBuffer)
  {
    CFRelease(tileOutputPixelBuffer);
    self->_tileOutputPixelBuffer = 0;
  }
  tileOutputEnhancedPixelBuffer = self->_tileOutputEnhancedPixelBuffer;
  if (tileOutputEnhancedPixelBuffer)
  {
    CFRelease(tileOutputEnhancedPixelBuffer);
    self->_tileOutputEnhancedPixelBuffer = 0;
  }
}

- (NSString)modelNetworkBaseName
{
  return self->_modelNetworkBaseName;
}

- (NSArray)modelInputBindingNames
{
  return self->_modelInputBindingNames;
}

- (NSArray)modelInputSizes
{
  return self->_modelInputSizes;
}

- (NSArray)modelInputPixelFormats
{
  return self->_modelInputPixelFormats;
}

- (NSArray)modelInputSlicesCount
{
  return self->_modelInputSlicesCount;
}

- (NSArray)modelOutputBindingNames
{
  return self->_modelOutputBindingNames;
}

- (NSArray)modelOutputSizes
{
  return self->_modelOutputSizes;
}

- (NSArray)modelOutputPixelFormats
{
  return self->_modelOutputPixelFormats;
}

- (NSArray)modelOutputSlicesCount
{
  return self->_modelOutputSlicesCount;
}

- (__n128)tileSize
{
  LOWORD(v1) = *(_WORD *)(a1 + 172);
  WORD2(v1) = *(_WORD *)(a1 + 174);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (__n128)tileOverlap
{
  LOWORD(v1) = *(_WORD *)(a1 + 176);
  WORD2(v1) = *(_WORD *)(a1 + 178);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelOutputSlicesCount, 0);
  objc_storeStrong((id *)&self->_modelOutputPixelFormats, 0);
  objc_storeStrong((id *)&self->_modelOutputSizes, 0);
  objc_storeStrong((id *)&self->_modelOutputBindingNames, 0);
  objc_storeStrong((id *)&self->_modelInputSlicesCount, 0);
  objc_storeStrong((id *)&self->_modelInputPixelFormats, 0);
  objc_storeStrong((id *)&self->_modelInputSizes, 0);
  objc_storeStrong((id *)&self->_modelInputBindingNames, 0);
  objc_storeStrong((id *)&self->_modelNetworkBaseName, 0);
  objc_storeStrong((id *)&self->_commandQueues, 0);
  objc_storeStrong((id *)&self->_deepZoomPostProcStage, 0);
  objc_storeStrong((id *)&self->_deepZoomPreProcStage, 0);
  objc_storeStrong((id *)&self->_localHomographiesTable, 0);
  objc_storeStrong((id *)&self->_metadataForPixelBuffers, 0);
  objc_storeStrong((id *)&self->_tileInputWeightsTexture, 0);
  objc_storeStrong((id *)&self->_computeLocalHompographyConfig, 0);
  objc_storeStrong((id *)&self->_tileCutBicubicSamplerState, 0);
  objc_storeStrong((id *)&self->_tileCutBilinearSamplerState, 0);
  objc_storeStrong((id *)&self->_tileMergePipelineState, 0);
  objc_storeStrong((id *)&self->_tilePastePipelineState, 0);
  objc_storeStrong((id *)&self->_tileCutInSlicesPipelineState, 0);
  objc_storeStrong((id *)&self->_tileCutPipelineState, 0);
  objc_storeStrong((id *)&self->_clearTexturePipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end