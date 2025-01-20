@interface CMIDeepZoomLiteMetalStageV2
- (CMIDeepZoomLiteMetalStageV2)initWithMetalContext:(id)a3 options:(id)a4;
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
@end

@implementation CMIDeepZoomLiteMetalStageV2

- (CMIDeepZoomLiteMetalStageV2)initWithMetalContext:(id)a3 options:(id)a4
{
  id v6 = a3;
  v58[0] = kCVPixelBufferMetalCompatibilityKey;
  v58[1] = kCVPixelBufferIOSurfaceCoreAnimationCompatibilityKey;
  v59[0] = &__kCFBooleanTrue;
  v59[1] = &__kCFBooleanTrue;
  v58[2] = kCVPixelBufferIOSurfacePropertiesKey;
  v59[2] = &__NSDictionary0__struct;
  CFDictionaryRef v7 = +[NSDictionary dictionaryWithObjects:v59 forKeys:v58 count:3];
  v55.receiver = self;
  v55.super_class = (Class)CMIDeepZoomLiteMetalStageV2;
  v8 = [(CMIDeepZoomLiteMetalStageV2 *)&v55 init];
  uint64_t v9 = (uint64_t)v8;
  if (!v8) {
    goto LABEL_16;
  }
  modelNetworkBaseName = v8->_modelNetworkBaseName;
  v8->_modelNetworkBaseName = (NSString *)@"deep_zoom-lite-v2";

  uint64_t v11 = +[NSArray arrayWithObjects:@"in_img", 0];
  v12 = *(void **)(v9 + 192);
  *(void *)(v9 + 192) = v11;

  uint64_t v13 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_19168, 0);
  v14 = *(void **)(v9 + 200);
  *(void *)(v9 + 200) = v13;

  uint64_t v15 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_18FF0, 0);
  v16 = *(void **)(v9 + 208);
  *(void *)(v9 + 208) = v15;

  uint64_t v17 = +[NSArray arrayWithObjects:@"out_img", 0];
  v18 = *(void **)(v9 + 224);
  *(void *)(v9 + 224) = v17;

  uint64_t v19 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_19180, 0);
  v20 = *(void **)(v9 + 232);
  *(void *)(v9 + 232) = v19;

  uint64_t v21 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_18FF0, 0);
  v22 = *(void **)(v9 + 240);
  *(void *)(v9 + 240) = v21;

  *(void *)(v9 + 16) = 0x10001001C00250;
  *(void *)(v9 + 176) = 0x10001001C00250;
  objc_storeStrong((id *)(v9 + 8), a3);
  if (!*(void *)(v9 + 8))
  {
    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    id v24 = [objc_alloc((Class)FigMetalContext) initWithbundle:v23 andOptionalCommandQueue:0];
    v25 = *(void **)(v9 + 8);
    *(void *)(v9 + 8) = v24;

    if (!*(void *)(v9 + 8)) {
      goto LABEL_20;
    }
  }
  id v26 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v27 = *(void **)(v9 + 152);
  *(void *)(v9 + 152) = v26;

  if (!*(void *)(v9 + 152)) {
    goto LABEL_20;
  }
  v28 = [*(id *)(v9 + 8) device];
  id v29 = [v28 newCommandQueue];
  [*(id *)(v9 + 152) setObject:v29 atIndexedSubscript:0];

  v30 = [*(id *)(v9 + 8) device];
  id v31 = [v30 newCommandQueue];
  [*(id *)(v9 + 152) setObject:v31 atIndexedSubscript:1];

  if (sub_2A34(v9))
  {
LABEL_20:
    sub_381C((void *)v9);
    v53 = 0;
    goto LABEL_17;
  }
  CFStringRef v56 = kCVMetalTextureCacheMaximumTextureAgeKey;
  v57 = &off_19020;
  CFDictionaryRef v32 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  v33 = [*(id *)(v9 + 8) device];
  CVReturn v34 = CVMetalTextureCacheCreate(kCFAllocatorDefault, v32, v33, 0, (CVMetalTextureCacheRef *)(v9 + 24));

  if (v34) {
    goto LABEL_19;
  }
  if (CVPixelBufferCreate(kCFAllocatorDefault, 3 * *(unsigned __int16 *)(v9 + 16), 3 * *(unsigned __int16 *)(v9 + 18), 0x4C303068u, v7, (CVPixelBufferRef *)(v9 + 104)))
  {
    goto LABEL_19;
  }
  v35 = sub_2F74((__CVMetalTextureCache **)v9, *(__CVBuffer **)(v9 + 104), 1);
  uint64_t v36 = [v35 objectAtIndexedSubscript:0];
  v37 = *(void **)(v9 + 112);
  *(void *)(v9 + 112) = v36;

  if (!*(void *)(v9 + 112) || sub_3204(v9, *(__CVBuffer **)(v9 + 104), (_WORD *)(v9 + 16), v38))
  {
LABEL_19:

    goto LABEL_20;
  }
  id v39 = objc_alloc_init((Class)MTLTextureDescriptor);
  v40 = v39;
  if (!v39) {
    goto LABEL_18;
  }
  [v39 setWidth:*(unsigned __int16 *)(v9 + 16)];
  [v40 setHeight:*(unsigned __int16 *)(v9 + 18)];
  [v40 setPixelFormat:25];
  [v40 setUsage:3];
  v41 = [*(id *)(v9 + 8) device];
  id v42 = [v41 newTextureWithDescriptor:v40];
  v43 = *(void **)(v9 + 120);
  *(void *)(v9 + 120) = v42;

  if (!*(void *)(v9 + 120)) {
    goto LABEL_18;
  }
  [v40 setWidth:*(unsigned __int16 *)(v9 + 16)];
  [v40 setHeight:*(unsigned __int16 *)(v9 + 18)];
  [v40 setPixelFormat:25];
  v44 = [*(id *)(v9 + 8) device];
  id v45 = [v44 newTextureWithDescriptor:v40];
  v46 = *(void **)(v9 + 136);
  *(void *)(v9 + 136) = v45;

  if (!*(void *)(v9 + 136)) {
    goto LABEL_18;
  }
  [v40 setWidth:*(unsigned __int16 *)(v9 + 16)];
  [v40 setHeight:*(unsigned __int16 *)(v9 + 18)];
  [v40 setPixelFormat:25];
  v47 = [*(id *)(v9 + 8) device];
  id v48 = [v47 newTextureWithDescriptor:v40];
  v49 = *(void **)(v9 + 144);
  *(void *)(v9 + 144) = v48;

  if (!*(void *)(v9 + 144)) {
    goto LABEL_18;
  }
  [v40 setWidth:*(unsigned __int16 *)(v9 + 18)];
  [v40 setHeight:*(unsigned __int16 *)(v9 + 16)];
  [v40 setPixelFormat:25];
  v50 = [*(id *)(v9 + 8) device];
  id v51 = [v50 newTextureWithDescriptor:v40];
  v52 = *(void **)(v9 + 128);
  *(void *)(v9 + 128) = v51;

  if (!*(void *)(v9 + 128))
  {
LABEL_18:
    fig_log_get_emitter();
    FigDebugAssert3();
    FigSignalErrorAt();

    goto LABEL_19;
  }

LABEL_16:
  v53 = (CMIDeepZoomLiteMetalStageV2 *)(id)v9;
LABEL_17:

  return v53;
}

- (void)dealloc
{
  sub_381C(self);
  v3.receiver = self;
  v3.super_class = (Class)CMIDeepZoomLiteMetalStageV2;
  [(CMIDeepZoomLiteMetalStageV2 *)&v3 dealloc];
}

- (int)clearBuffer:(__CVBuffer *)a3
{
  if (!a3)
  {
    uint64_t v11 = 0;
    v10 = 0;
    uint64_t v9 = 0;
    int v28 = -12780;
    goto LABEL_11;
  }
  p_tileOutputPixelBuffer = &self->_tileOutputPixelBuffer;
  tileOutputPixelBuffer = self->_tileOutputPixelBuffer;
  self->_uint64_t currentCommandQueueIndex = 0;
  if (tileOutputPixelBuffer)
  {
    uint64_t currentCommandQueueIndex = 0;
LABEL_4:
    v8 = [(NSMutableArray *)self->_commandQueues objectAtIndexedSubscript:currentCommandQueueIndex];
    uint64_t v9 = [v8 commandBuffer];

    if (!v9)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v28 = FigSignalErrorAt();
      uint64_t v11 = 0;
      v10 = 0;
      goto LABEL_11;
    }
    v10 = [v9 computeCommandEncoder];
    if (!v10)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v28 = FigSignalErrorAt();
      uint64_t v11 = 0;
      goto LABEL_11;
    }
    uint64_t v11 = sub_2F74(&self->super.isa, a3, 2);
    if ([v11 count] != (char *)&dword_0 + 2)
    {
      int v28 = -12786;
      goto LABEL_11;
    }
    [v10 setComputePipelineState:self->_clearTexturePipelineState];
    v12 = [v11 objectAtIndexedSubscript:0];
    [v10 setTexture:v12 atIndex:0];

    unint64_t v13 = (unint64_t)[(MTLComputePipelineState *)self->_clearTexturePipelineState threadExecutionWidth];
    unint64_t v14 = (unint64_t)[(MTLComputePipelineState *)self->_clearTexturePipelineState maxTotalThreadsPerThreadgroup]/ v13;
    uint64_t v15 = [v11 objectAtIndexedSubscript:0];
    id v16 = [v15 width];
    uint64_t v17 = [v11 objectAtIndexedSubscript:0];
    v33[0] = v16;
    v33[1] = [v17 height];
    v33[2] = 1;
    v32[0] = v13;
    v32[1] = v14;
    v32[2] = 1;
    [v10 dispatchThreads:v33 threadsPerThreadgroup:v32];

    [v10 setComputePipelineState:self->_clearTexturePipelineState];
    v18 = [v11 objectAtIndexedSubscript:1];
    [v10 setTexture:v18 atIndex:0];

    unint64_t v19 = (unint64_t)[(MTLComputePipelineState *)self->_clearTexturePipelineState threadExecutionWidth];
    unint64_t v20 = (unint64_t)[(MTLComputePipelineState *)self->_clearTexturePipelineState maxTotalThreadsPerThreadgroup]/ v19;
    uint64_t v21 = [v11 objectAtIndexedSubscript:1];
    id v22 = [v21 width];
    v23 = [v11 objectAtIndexedSubscript:1];
    v31[0] = v22;
    v31[1] = [v23 height];
    v31[2] = 1;
    v30[0] = v19;
    v30[1] = v20;
    v30[2] = 1;
    [v10 dispatchThreads:v31 threadsPerThreadgroup:v30];

    [v10 endEncoding];
    [v9 commit];
    goto LABEL_10;
  }
  size_t v24 = *(unsigned __int16 *)self->_anon_10;
  size_t v25 = *(unsigned __int16 *)&self->_anon_10[2];
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  CFDictionaryRef Attributes = (const __CFDictionary *)CVPixelBufferGetAttributes();
  if (!CVPixelBufferCreate(kCFAllocatorDefault, v24, v25, PixelFormatType, Attributes, p_tileOutputPixelBuffer))
  {
    uint64_t currentCommandQueueIndex = self->_currentCommandQueueIndex;
    goto LABEL_4;
  }
  uint64_t v11 = 0;
  v10 = 0;
  uint64_t v9 = 0;
LABEL_10:
  int v28 = 0;
LABEL_11:

  return v28;
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
    unint64_t v13 = 0;
    uint64_t v15 = 0;
    id v16 = 0;
    id v17 = 0;
    int v14 = -12780;
    goto LABEL_9;
  }
  id v12 = [v11 count];
  unint64_t v13 = 0;
  int v14 = -12780;
  if (!a5)
  {
    uint64_t v15 = 0;
    id v16 = 0;
    id v17 = 0;
    goto LABEL_9;
  }
  int v28 = a6;
  uint64_t v15 = 0;
  id v16 = 0;
  id v17 = 0;
  if (v12)
  {
    v18 = [(NSMutableArray *)self->_commandQueues objectAtIndexedSubscript:self->_currentCommandQueueIndex];
    id v17 = [v18 commandBuffer];

    if (v17)
    {
      unint64_t v13 = [v17 computeCommandEncoder];
      if (v13)
      {
        unint64_t v19 = [v10 objectAtIndexedSubscript:0];
        uint64_t v15 = sub_2F74(&self->super.isa, v19, 1);

        if ([v15 count] == (char *)&dword_0 + 2)
        {
          unint64_t v20 = [(NSArray *)self->_modelInputBindingNames objectAtIndexedSubscript:0];
          uint64_t v21 = [v11 objectForKeyedSubscript:v20];
          id v16 = sub_2F74(&self->super.isa, v21, 2);

          if ([v16 count] == (char *)&dword_0 + 1)
          {
            [v13 setComputePipelineState:self->_tileCutPipelineState];
            id v22 = [v15 objectAtIndexedSubscript:0];
            [v13 setTexture:v22 atIndex:0];

            v23 = [v16 objectAtIndexedSubscript:0];
            [v13 setTexture:v23 atIndex:1];

            [v13 setBytes:a5 length:32 atIndex:0];
            unint64_t v24 = (unint64_t)[(MTLComputePipelineState *)self->_tileCutPipelineState threadExecutionWidth];
            unint64_t v25 = (unint64_t)[(MTLComputePipelineState *)self->_tileCutPipelineState maxTotalThreadsPerThreadgroup];
            unint64_t v26 = (unint64_t)*((unsigned __int16 *)a5 + 1) >> 1;
            v30[0] = (unint64_t)*(_WORD *)a5 >> 1;
            v30[1] = v26;
            v30[2] = 1;
            v29[0] = v24;
            v29[1] = v25 / v24;
            v29[2] = 1;
            [v13 dispatchThreads:v30 threadsPerThreadgroup:v29];
            [v13 endEncoding];
            id v17 = v17;
            int v14 = 0;
            id *v28 = v17;
            goto LABEL_9;
          }
        }
        else
        {
          id v16 = 0;
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
      unint64_t v13 = 0;
    }
    uint64_t v15 = 0;
    id v16 = 0;
  }
LABEL_9:

  return v14;
}

- (int)pasteTilesFrom:(id)a3 with:(id)a4 inputFullPixelBuffers:(id)a5 to:(__CVBuffer *)a6 params:(id *)a7 outCommandBuffer:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v75 = v14;
  v74 = v16;
  if (![v14 count] || !objc_msgSend(v15, "count"))
  {
    v18 = 0;
    unint64_t v20 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    v23 = 0;
    unint64_t v24 = 0;
    id v25 = 0;
    int v19 = -12780;
    goto LABEL_27;
  }
  id v17 = [v16 count];
  v18 = 0;
  int v19 = -12780;
  if (!a7 || !a6)
  {
    unint64_t v20 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    v23 = 0;
    unint64_t v24 = 0;
    id v25 = 0;
    goto LABEL_27;
  }
  v77 = a6;
  v71 = a8;
  unint64_t v20 = 0;
  uint64_t v21 = 0;
  id v22 = 0;
  v23 = 0;
  unint64_t v24 = 0;
  id v25 = 0;
  if (v17)
  {
    v76 = v15;
    unint64_t v26 = [(NSMutableArray *)self->_commandQueues objectAtIndexedSubscript:self->_currentCommandQueueIndex];
    v27 = [v26 commandBuffer];

    if (!v27)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      int v19 = FigSignalErrorAt();
      v18 = 0;
      unint64_t v20 = 0;
      uint64_t v21 = 0;
      id v22 = 0;
      v23 = 0;
      unint64_t v24 = 0;
      id v25 = 0;
LABEL_35:
      id v15 = v76;
      goto LABEL_27;
    }
    int v28 = [(NSArray *)self->_modelInputBindingNames objectAtIndexedSubscript:0];
    id v29 = [v75 objectForKeyedSubscript:v28];
    v30 = sub_2F74(&self->super.isa, v29, 1);

    v73 = v30;
    if ([v30 count] == (char *)&dword_0 + 1)
    {
      v18 = sub_2F74(&self->super.isa, self->_tileOutputPixelBuffer, 3);
      if ([v18 count] == (char *)&dword_0 + 2)
      {
        id v31 = [(NSArray *)self->_modelOutputBindingNames objectAtIndexedSubscript:0];
        CFDictionaryRef v32 = [v76 objectForKeyedSubscript:v31];
        v33 = sub_2F74(&self->super.isa, v32, 1);

        if ([v33 count] == (char *)&dword_0 + 1)
        {
          v78 = sub_2F74(&self->super.isa, v77, 3);
          if ([v78 count] != (char *)&dword_0 + 2)
          {
            id v22 = 0;
            id v25 = v27;
            unint64_t v24 = 0;
            int v19 = -12786;
            unint64_t v20 = v33;
            v23 = v73;
            id v15 = v76;
            uint64_t v21 = v78;
            goto LABEL_27;
          }
          CVReturn v34 = [v74 objectAtIndexedSubscript:0];
          v35 = sub_2F74(&self->super.isa, v34, 1);

          v72 = v35;
          if ([v35 count] == (char *)&dword_0 + 2)
          {
            uint64_t v36 = [v73 objectAtIndexedSubscript:0];
            v37 = [v33 objectAtIndexedSubscript:0];
            int v38 = *(_WORD *)a7 >> 1;
            int v39 = *((unsigned __int16 *)a7 + 1) >> 1;
            id v85 = v27;
            sub_49F0((uint64_t)self, v36, v37, v38, v39, &v85);

            v40 = [v27 computeCommandEncoder];
            if (v40)
            {
              v41 = v40;
              [v40 setComputePipelineState:self->_tileMergePipelineState];
              [v41 setTexture:self->_tileEnhancedLumaTexture atIndex:0];
              [v41 setTexture:self->_tileInputWeightsTexture atIndex:1];
              uint64_t v21 = v78;
              id v42 = [v78 objectAtIndexedSubscript:0];
              [v41 setTexture:v42 atIndex:2];

              v43 = [v18 objectAtIndexedSubscript:0];
              [v41 setTexture:v43 atIndex:3];

              [v41 setBytes:a7 length:24 atIndex:0];
              unint64_t v44 = (unint64_t)[(MTLComputePipelineState *)self->_tileMergePipelineState threadExecutionWidth];
              unint64_t v45 = (unint64_t)[(MTLComputePipelineState *)self->_tileMergePipelineState maxTotalThreadsPerThreadgroup];
              unint64_t v46 = (unint64_t)*((unsigned __int16 *)a7 + 1) >> 1;
              v84[0] = (unint64_t)*(_WORD *)a7 >> 1;
              v84[1] = v46;
              v84[2] = 1;
              v83[0] = v44;
              v83[1] = v45 / v44;
              v83[2] = 1;
              [v41 dispatchThreads:v84 threadsPerThreadgroup:v83];
              [v41 endEncoding];
              id v70 = v27;
              unint64_t v24 = [v27 computeCommandEncoder];

              if (!v24)
              {
                fig_log_get_emitter();
                FigDebugAssert3();
                int v19 = FigSignalErrorAt();
                id v25 = v27;
                unint64_t v20 = v33;
                v23 = v73;
                id v15 = v76;
                goto LABEL_26;
              }
              v68 = v33;
              [v24 setComputePipelineState:self->_tilePastePipelineState];
              v69 = v18;
              v47 = [v18 objectAtIndexedSubscript:0];
              [v24 setTexture:v47 atIndex:0];

              id v48 = [v78 objectAtIndexedSubscript:0];
              [v24 setTexture:v48 atIndex:1];

              [v24 setBytes:a7 length:24 atIndex:0];
              unint64_t v49 = (unint64_t)[(MTLComputePipelineState *)self->_tilePastePipelineState threadExecutionWidth];
              unint64_t v50 = (unint64_t)[(MTLComputePipelineState *)self->_tilePastePipelineState maxTotalThreadsPerThreadgroup];
              unint64_t v51 = (unint64_t)*((unsigned __int16 *)a7 + 1) >> 1;
              v82[0] = (unint64_t)*(_WORD *)a7 >> 1;
              v82[1] = v51;
              v82[2] = 1;
              v81[0] = v49;
              v81[1] = v50 / v49;
              v81[2] = 1;
              [v24 dispatchThreads:v82 threadsPerThreadgroup:v81];
              id v15 = v76;
              if (!(*((unsigned __int16 *)a7 + 4) | *((unsigned __int16 *)a7 + 5)))
              {
                [v24 setComputePipelineState:self->_tilePaste2xFullChromaPipelineState];
                v52 = [v72 objectAtIndexedSubscript:1];
                [v24 setTexture:v52 atIndex:0];

                v53 = [v78 objectAtIndexedSubscript:1];
                [v24 setTexture:v53 atIndex:1];

                [v24 setBytes:a7 length:24 atIndex:0];
                unint64_t v54 = (*((unsigned __int16 *)a7 + 10) + (*(_WORD *)a7 >> 1) - 1)
                    / (*(_WORD *)a7 >> 1)
                    * (*(_WORD *)a7 >> 1);
                unint64_t v55 = (*((unsigned __int16 *)a7 + 11) + (*((unsigned __int16 *)a7 + 1) >> 1) - 1)
                    / (*((unsigned __int16 *)a7 + 1) >> 1)
                    * (*((unsigned __int16 *)a7 + 1) >> 1);
                unint64_t v56 = (unint64_t)[(MTLComputePipelineState *)self->_tilePaste2xFullChromaPipelineState threadExecutionWidth];
                unint64_t v57 = (unint64_t)[(MTLComputePipelineState *)self->_tilePaste2xFullChromaPipelineState maxTotalThreadsPerThreadgroup];
                v67 = [v78 objectAtIndexedSubscript:1];
                id v58 = (id)v54;
                id v59 = [v67 width];
                if ((unint64_t)v59 < v54)
                {
                  v66 = [v78 objectAtIndexedSubscript:1];
                  id v58 = [v66 width];
                }
                unint64_t v60 = v57 / v56;
                v61 = [v78 objectAtIndexedSubscript:1];
                id v62 = [v61 height];
                id v63 = (id)v55;
                if ((unint64_t)v62 < v55)
                {
                  v65 = [v78 objectAtIndexedSubscript:1];
                  id v63 = [v65 height];
                }
                v80[0] = v58;
                v80[1] = v63;
                v80[2] = 1;
                v79[0] = v56;
                v79[1] = v60;
                v79[2] = 1;
                [v24 dispatchThreads:v80 threadsPerThreadgroup:v79];
                if ((unint64_t)v62 < v55) {

                }
                id v15 = v76;
                if ((unint64_t)v59 < v54) {
              }
                }
              [v24 endEncoding];
              id v25 = v70;
              int v19 = 0;
              id *v71 = v25;
              self->_uint64_t currentCommandQueueIndex = (self->_currentCommandQueueIndex & 1) == 0;
              v23 = v73;
              unint64_t v20 = v68;
              v18 = v69;
LABEL_25:
              uint64_t v21 = v78;
LABEL_26:
              id v22 = v72;
              goto LABEL_27;
            }
            fig_log_get_emitter();
            FigDebugAssert3();
            int v19 = FigSignalErrorAt();
            id v25 = v27;
            unint64_t v24 = 0;
            unint64_t v20 = v33;
            v23 = v73;
          }
          else
          {
            id v25 = v27;
            unint64_t v24 = 0;
            int v19 = -12786;
            unint64_t v20 = v33;
            v23 = v73;
          }
          id v15 = v76;
          goto LABEL_25;
        }
        uint64_t v21 = 0;
        id v22 = 0;
        id v25 = v27;
        unint64_t v24 = 0;
        int v19 = -12786;
        unint64_t v20 = v33;
        goto LABEL_34;
      }
    }
    else
    {
      v18 = 0;
    }
    unint64_t v20 = 0;
    uint64_t v21 = 0;
    id v22 = 0;
    id v25 = v27;
    unint64_t v24 = 0;
    int v19 = -12786;
LABEL_34:
    v23 = v73;
    goto LABEL_35;
  }
LABEL_27:

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
  LOWORD(v1) = *(_WORD *)(a1 + 176);
  WORD2(v1) = *(_WORD *)(a1 + 178);
  result.n128_u32[0] = v1;
  result.n128_u16[2] = WORD2(v1);
  return result;
}

- (__n128)tileOverlap
{
  LOWORD(v1) = *(_WORD *)(a1 + 180);
  WORD2(v1) = *(_WORD *)(a1 + 182);
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
  objc_storeStrong((id *)&self->_tileEnhancedIntermediateLumaTexture, 0);
  objc_storeStrong((id *)&self->_tileEnhancedLumaTexture, 0);
  objc_storeStrong((id *)&self->_tileMaskFlippedTexture, 0);
  objc_storeStrong((id *)&self->_tileMaskTexture, 0);
  objc_storeStrong((id *)&self->_tileInputWeightsTexture, 0);
  objc_storeStrong((id *)&self->_tilePaste2xFullChromaPipelineState, 0);
  objc_storeStrong((id *)&self->_tileBlendEnhancedPipelineState, 0);
  objc_storeStrong((id *)&self->_tileComputeMaskPipelineState, 0);
  objc_storeStrong((id *)&self->_tileGaussian5x5PipelineState, 0);
  objc_storeStrong((id *)&self->_tileEnhancePipelineState, 0);
  objc_storeStrong((id *)&self->_tilePastePipelineState, 0);
  objc_storeStrong((id *)&self->_tileMergePipelineState, 0);
  objc_storeStrong((id *)&self->_tileCutPipelineState, 0);
  objc_storeStrong((id *)&self->_clearTexturePipelineState, 0);

  objc_storeStrong((id *)&self->_metalContext, 0);
}

@end