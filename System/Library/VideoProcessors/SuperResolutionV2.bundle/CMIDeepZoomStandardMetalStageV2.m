@interface CMIDeepZoomStandardMetalStageV2
- (CMIDeepZoomStandardMetalStageV2)initWithMetalContext:(id)a3 options:(id)a4;
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
- (int)configurePostProcess:(id *)a3;
- (int)cutTilesFrom:(id)a3 to:(id)a4 params:(id *)a5 outCommandBuffer:(id *)a6;
- (int)pasteTilesFrom:(id)a3 with:(id)a4 inputFullPixelBuffers:(id)a5 to:(__CVBuffer *)a6 params:(id *)a7 outCommandBuffer:(id *)a8;
- (int)updateMetadata:(id)a3 forInputFullPixelBuffer:(__CVBuffer *)a4;
- (void)dealloc;
- (void)finishProcessing;
@end

@implementation CMIDeepZoomStandardMetalStageV2

- (CMIDeepZoomStandardMetalStageV2)initWithMetalContext:(id)a3 options:(id)a4
{
  id v6 = a3;
  v47[0] = kCVPixelBufferMetalCompatibilityKey;
  v47[1] = kCVPixelBufferIOSurfaceCoreAnimationCompatibilityKey;
  v48[0] = &__kCFBooleanTrue;
  v48[1] = &__kCFBooleanTrue;
  v47[2] = kCVPixelBufferIOSurfacePropertiesKey;
  v48[2] = &__NSDictionary0__struct;
  CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:3];
  v44.receiver = self;
  v44.super_class = (Class)CMIDeepZoomStandardMetalStageV2;
  v8 = [(CMIDeepZoomStandardMetalStageV2 *)&v44 init];
  if (!v8) {
    goto LABEL_12;
  }
  uint64_t v9 = CFPreferencesCopyAppValue(@"deepzoom_network_name", @"com.apple.coremedia");
  v10 = (void *)*((void *)v8 + 16);
  *((void *)v8 + 16) = v9;

  v11 = (void *)*((void *)v8 + 16);
  *((void *)v8 + 16) = @"deep_zoom-v2";

  uint64_t v12 = +[NSArray arrayWithObjects:@"in_img", 0];
  v13 = (void *)*((void *)v8 + 17);
  *((void *)v8 + 17) = v12;

  uint64_t v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_19198, 0);
  v15 = (void *)*((void *)v8 + 18);
  *((void *)v8 + 18) = v14;

  uint64_t v16 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_19068, 0);
  v17 = (void *)*((void *)v8 + 19);
  *((void *)v8 + 19) = v16;

  uint64_t v18 = +[NSArray arrayWithObjects:@"out_img", 0];
  v19 = (void *)*((void *)v8 + 21);
  *((void *)v8 + 21) = v18;

  uint64_t v20 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_191B0, 0);
  v21 = (void *)*((void *)v8 + 22);
  *((void *)v8 + 22) = v20;

  uint64_t v22 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_19068, 0);
  v23 = (void *)*((void *)v8 + 23);
  *((void *)v8 + 23) = v22;

  *((void *)v8 + 2) = 0x10001001C00250;
  *(void *)(v8 + 116) = 0x10001001C00250;
  objc_storeStrong((id *)v8 + 1, a3);
  if (!*((void *)v8 + 1))
  {
    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    id v25 = [objc_alloc((Class)FigMetalContext) initWithbundle:v24 andOptionalCommandQueue:0];
    v26 = (void *)*((void *)v8 + 1);
    *((void *)v8 + 1) = v25;

    if (!*((void *)v8 + 1)) {
      goto LABEL_15;
    }
  }
  id v27 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v28 = (void *)*((void *)v8 + 13);
  *((void *)v8 + 13) = v27;

  if (!*((void *)v8 + 13)) {
    goto LABEL_15;
  }
  v29 = [*((id *)v8 + 1) device];
  id v30 = [v29 newCommandQueue];
  [*((id *)v8 + 13) setObject:v30 atIndexedSubscript:0];

  v31 = [*((id *)v8 + 1) device];
  id v32 = [v31 newCommandQueue];
  [*((id *)v8 + 13) setObject:v32 atIndexedSubscript:1];

  if (sub_55D4((uint64_t)v8)
    || (v33 = [[CMIDeepZoomStandardPostProcMetalStageV2 alloc] initWithMetalContext:v6 withTileConfiguration:v8 + 16], v34 = (void *)*((void *)v8 + 12), *((void *)v8 + 12) = v33, v34, !*((void *)v8 + 12)))
  {
LABEL_15:
    sub_586C(v8);
    v42 = 0;
    goto LABEL_13;
  }
  CFStringRef v45 = kCVMetalTextureCacheMaximumTextureAgeKey;
  v46 = &off_19080;
  CFDictionaryRef v35 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  v36 = [*((id *)v8 + 1) device];
  CVReturn v37 = CVMetalTextureCacheCreate(kCFAllocatorDefault, v35, v36, 0, (CVMetalTextureCacheRef *)v8 + 3);

  if (v37) {
    goto LABEL_14;
  }
  if (CVPixelBufferCreate(kCFAllocatorDefault, 3 * *((unsigned __int16 *)v8 + 8), 3 * *((unsigned __int16 *)v8 + 9), 0x4C303068u, v7, (CVPixelBufferRef *)v8 + 8))
  {
    goto LABEL_14;
  }
  v38 = sub_2F74((__CVMetalTextureCache **)v8, *((__CVBuffer **)v8 + 8), 1);
  uint64_t v39 = [v38 objectAtIndexedSubscript:0];
  v40 = (void *)*((void *)v8 + 9);
  *((void *)v8 + 9) = v39;

  if (!*((void *)v8 + 9) || sub_3204((uint64_t)v8, *((__CVBuffer **)v8 + 8), (_WORD *)v8 + 8, v41))
  {
LABEL_14:

    goto LABEL_15;
  }

LABEL_12:
  v42 = v8;
LABEL_13:

  return v42;
}

- (void)dealloc
{
  sub_586C(self);
  v3.receiver = self;
  v3.super_class = (Class)CMIDeepZoomStandardMetalStageV2;
  [(CMIDeepZoomStandardMetalStageV2 *)&v3 dealloc];
}

- (int)clearBuffer:(__CVBuffer *)a3
{
  if (!a3)
  {
    v19 = 0;
    uint64_t v18 = 0;
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
    uint64_t v16 = [(NSMutableArray *)self->_commandQueues objectAtIndexedSubscript:currentCommandQueueIndex];
    v17 = [v16 commandBuffer];

    if (!v17)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v32 = FigSignalErrorAt();
      v19 = 0;
      uint64_t v18 = 0;
      goto LABEL_12;
    }
    uint64_t v18 = [v17 computeCommandEncoder];
    if (!v18)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v32 = FigSignalErrorAt();
      v19 = 0;
      goto LABEL_12;
    }
    v19 = sub_2F74(&self->super.isa, a3, 2);
    if ([v19 count] != (char *)&dword_0 + 2)
    {
      int v32 = -12786;
      goto LABEL_12;
    }
    [v18 setComputePipelineState:self->_clearTexturePipelineState];
    uint64_t v20 = [v19 objectAtIndexedSubscript:0];
    [v18 setTexture:v20 atIndex:0];

    unint64_t v21 = (unint64_t)[(MTLComputePipelineState *)self->_clearTexturePipelineState threadExecutionWidth];
    unint64_t v22 = (unint64_t)[(MTLComputePipelineState *)self->_clearTexturePipelineState maxTotalThreadsPerThreadgroup]/ v21;
    v23 = [v19 objectAtIndexedSubscript:0];
    id v24 = [v23 width];
    id v25 = [v19 objectAtIndexedSubscript:0];
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
    v29 = [v19 objectAtIndexedSubscript:1];
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
  v19 = 0;
  uint64_t v18 = 0;
  v17 = 0;
LABEL_11:
  int v32 = 0;
LABEL_12:

  return v32;
}

- (int)updateMetadata:(id)a3 forInputFullPixelBuffer:(__CVBuffer *)a4
{
  return 0;
}

- (int)cutTilesFrom:(id)a3 to:(id)a4 params:(id *)a5 outCommandBuffer:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (![v10 count])
  {
    size_t v13 = 0;
    CFDictionaryRef v15 = 0;
    uint64_t v16 = 0;
    id v17 = 0;
    int v14 = -12780;
    goto LABEL_9;
  }
  id v12 = [v11 count];
  size_t v13 = 0;
  int v14 = -12780;
  if (!a5)
  {
    CFDictionaryRef v15 = 0;
    uint64_t v16 = 0;
    id v17 = 0;
    goto LABEL_9;
  }
  v29 = a6;
  CFDictionaryRef v15 = 0;
  uint64_t v16 = 0;
  id v17 = 0;
  if (v12)
  {
    uint64_t v18 = [(NSMutableArray *)self->_commandQueues objectAtIndexedSubscript:self->_currentCommandQueueIndex];
    id v17 = [v18 commandBuffer];

    if (v17)
    {
      size_t v13 = [v17 computeCommandEncoder];
      if (v13)
      {
        v19 = [v10 objectAtIndexedSubscript:0];
        CFDictionaryRef v15 = sub_2F74(&self->super.isa, v19, 1);

        if ([v15 count] == (char *)&dword_0 + 2)
        {
          uint64_t v20 = [(NSArray *)self->_modelInputBindingNames objectAtIndexedSubscript:0];
          unint64_t v21 = [v11 objectForKeyedSubscript:v20];
          uint64_t v16 = sub_2F74(&self->super.isa, v21, 2);

          if ([v16 count] == (char *)&dword_0 + 1)
          {
            [v13 setComputePipelineState:self->_tileCutPipelineState];
            unint64_t v22 = [v15 objectAtIndexedSubscript:0];
            [v13 setTexture:v22 atIndex:0];

            v23 = [v15 objectAtIndexedSubscript:1];
            [v13 setTexture:v23 atIndex:1];

            id v24 = [v16 objectAtIndexedSubscript:0];
            [v13 setTexture:v24 atIndex:2];

            [v13 setBytes:a5 length:32 atIndex:0];
            unint64_t v25 = (unint64_t)[(MTLComputePipelineState *)self->_tileCutPipelineState threadExecutionWidth];
            unint64_t v26 = (unint64_t)[(MTLComputePipelineState *)self->_tileCutPipelineState maxTotalThreadsPerThreadgroup];
            uint64_t v27 = *((unsigned __int16 *)a5 + 1);
            v31[0] = *(_WORD *)a5;
            v31[1] = v27;
            v31[2] = 1;
            v30[0] = v25;
            v30[1] = v26 / v25;
            v30[2] = 1;
            [v13 dispatchThreads:v31 threadsPerThreadgroup:v30];
            [v13 endEncoding];
            id v17 = v17;
            int v14 = 0;
            id *v29 = v17;
            goto LABEL_9;
          }
        }
        else
        {
          uint64_t v16 = 0;
        }
        int v14 = -12786;
        goto LABEL_9;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      int v14 = FigSignalErrorAt();
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v14 = FigSignalErrorAt();
      size_t v13 = 0;
    }
    CFDictionaryRef v15 = 0;
    uint64_t v16 = 0;
  }
LABEL_9:

  return v14;
}

- (int)pasteTilesFrom:(id)a3 with:(id)a4 inputFullPixelBuffers:(id)a5 to:(__CVBuffer *)a6 params:(id *)a7 outCommandBuffer:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v56 = v14;
  v55 = v15;
  v54 = v16;
  if (![v14 count] || !objc_msgSend(v15, "count"))
  {
    uint64_t v18 = 0;
    uint64_t v20 = 0;
    unint64_t v21 = 0;
    unint64_t v22 = 0;
    v23 = 0;
    id v24 = 0;
    id v25 = 0;
    int v19 = -12780;
    goto LABEL_16;
  }
  id v17 = [v16 count];
  uint64_t v18 = 0;
  int v19 = -12780;
  if (!a7 || !a6)
  {
    uint64_t v20 = 0;
    unint64_t v21 = 0;
    unint64_t v22 = 0;
    v23 = 0;
    id v24 = 0;
    id v25 = 0;
    goto LABEL_16;
  }
  v52 = a8;
  v53 = a7;
  uint64_t v20 = 0;
  unint64_t v21 = 0;
  unint64_t v22 = 0;
  v23 = 0;
  id v24 = 0;
  id v25 = 0;
  if (v17)
  {
    unint64_t v26 = [(NSMutableArray *)self->_commandQueues objectAtIndexedSubscript:self->_currentCommandQueueIndex];
    uint64_t v27 = [v26 commandBuffer];

    id v25 = (id)v27;
    if (!v27)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();
      uint64_t v18 = 0;
      uint64_t v20 = 0;
      unint64_t v21 = 0;
      unint64_t v22 = 0;
      v23 = 0;
      id v24 = 0;
      goto LABEL_16;
    }
    unint64_t v28 = [(NSArray *)self->_modelInputBindingNames objectAtIndexedSubscript:0];
    v29 = [v56 objectForKeyedSubscript:v28];
    v23 = sub_2F74(&self->super.isa, v29, 1);

    if ([v23 count] == (char *)&dword_0 + 1)
    {
      id v30 = [(NSArray *)self->_modelOutputBindingNames objectAtIndexedSubscript:0];
      v31 = [v55 objectForKeyedSubscript:v30];
      uint64_t v18 = sub_2F74(&self->super.isa, v31, 1);

      if ([v18 count] == (char *)&dword_0 + 1)
      {
        unint64_t v21 = sub_2F74(&self->super.isa, self->_tileOutputEnhancedPixelBuffer, 3);
        if ([v21 count] == (char *)&dword_0 + 2)
        {
          unint64_t v22 = sub_2F74(&self->super.isa, self->_tileOutputPixelBuffer, 3);
          if ([v22 count] == (char *)&dword_0 + 2)
          {
            uint64_t v20 = sub_2F74(&self->super.isa, a6, 3);
            if ([v20 count] == (char *)&dword_0 + 2)
            {
              unsigned int v32 = [(CMIDeepZoomStandardPostProcMetalStageV2 *)self->_deepZoomPostProcStage processTileFrom:v23 with:v18 to:v21 commandBuffer:v25];
              if (v32)
              {
                int v19 = v32;
                id v24 = 0;
              }
              else
              {
                v33 = [v25 computeCommandEncoder];
                if (v33)
                {
                  v34 = v33;
                  [v33 setComputePipelineState:self->_tileMergePipelineState];
                  CFDictionaryRef v35 = [v21 objectAtIndexedSubscript:0];
                  [v34 setTexture:v35 atIndex:0];

                  v36 = [v21 objectAtIndexedSubscript:1];
                  [v34 setTexture:v36 atIndex:1];

                  [v34 setTexture:self->_tileInputWeightsTexture atIndex:2];
                  CVReturn v37 = [v20 objectAtIndexedSubscript:0];
                  [v34 setTexture:v37 atIndex:3];

                  v38 = [v20 objectAtIndexedSubscript:1];
                  [v34 setTexture:v38 atIndex:4];

                  uint64_t v39 = [v22 objectAtIndexedSubscript:0];
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
                  id v24 = [v25 computeCommandEncoder];

                  if (v24)
                  {
                    [v24 setComputePipelineState:self->_tilePastePipelineState];
                    objc_super v44 = [v22 objectAtIndexedSubscript:0];
                    [v24 setTexture:v44 atIndex:0];

                    CFStringRef v45 = [v22 objectAtIndexedSubscript:1];
                    [v24 setTexture:v45 atIndex:1];

                    v46 = [v20 objectAtIndexedSubscript:0];
                    [v24 setTexture:v46 atIndex:2];

                    v47 = [v20 objectAtIndexedSubscript:1];
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
                  id v24 = 0;
                }
              }
              goto LABEL_16;
            }
          }
          else
          {
            uint64_t v20 = 0;
          }
LABEL_25:
          id v24 = 0;
          int v19 = -12786;
          goto LABEL_16;
        }
        uint64_t v20 = 0;
LABEL_23:
        unint64_t v22 = 0;
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
    uint64_t v20 = 0;
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

- (int)configurePostProcess:(id *)a3
{
  return [(CMIDeepZoomStandardPostProcMetalStageV2 *)self->_deepZoomPostProcStage configureLumaGainLUT:a3];
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
  LOWORD(v1) = *(_WORD *)(a1 + 116);
  WORD2(v1) = *(_WORD *)(a1 + 118);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (__n128)tileOverlap
{
  LOWORD(v1) = *(_WORD *)(a1 + 120);
  WORD2(v1) = *(_WORD *)(a1 + 122);
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
  objc_storeStrong((id *)&self->_tileInputWeightsTexture, 0);
  objc_storeStrong((id *)&self->_tileMergePipelineState, 0);
  objc_storeStrong((id *)&self->_tilePastePipelineState, 0);
  objc_storeStrong((id *)&self->_tileCutPipelineState, 0);
  objc_storeStrong((id *)&self->_clearTexturePipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end