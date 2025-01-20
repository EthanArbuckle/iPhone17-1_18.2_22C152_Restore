@interface RawNightModeTiledInferenceProvider
- (FigMetalContext)metalContext;
- (NSArray)networkURLs;
- (RawNightModeInferenceTiledConfig)config;
- (RawNightModeTiledInferenceMetalStage)postInferenceMetalStage;
- (RawNightModeTiledInferenceMetalStage)preInferenceMetalStage;
- (int)allocateMemory;
- (int)deallocateMemory;
- (int)executionTarget;
- (int)preWarm;
- (int)resetState;
- (int)runInference;
- (int)setup;
- (void)setConfig:(id)a3;
- (void)setExecutionTarget:(int)a3;
- (void)setMetalContext:(id)a3;
- (void)setNetworkURLs:(id)a3;
- (void)setPostInferenceMetalStage:(id)a3;
- (void)setPreInferenceMetalStage:(id)a3;
- (void)waitForResetStateCompletion;
@end

@implementation RawNightModeTiledInferenceProvider

- (int)setup
{
  block[25] = *MEMORY[0x263EF8340];
  if (self->_config)
  {
    if (self->_executionTarget == 3
      || (networkURLs = self->_networkURLs) != 0 && [(NSArray *)networkURLs count] == 1)
    {
      if (self->_metalContext)
      {
        if (self->_preInferenceMetalStage)
        {
          if (self->_postInferenceMetalStage)
          {
            v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
            v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.raw-night-mode-tip-espresso-callback-queue", v4);
            espressoCallBackQueue = self->_espressoCallBackQueue;
            self->_espressoCallBackQueue = v5;

            if (self->_espressoCallBackQueue)
            {
              int v7 = [(RawNightModeTiledInferenceMetalStage *)self->_preInferenceMetalStage setContext:self->_metalContext];
              if (v7)
              {
                int v39 = v7;
              }
              else
              {
                int v8 = [(RawNightModeTiledInferenceMetalStage *)self->_postInferenceMetalStage setContext:self->_metalContext];
                if (!v8)
                {
                  if (self->_executionTarget != 3)
                  {
                    v9 = [(NSArray *)self->_networkURLs objectAtIndexedSubscript:0];
                    networkURL = self->_networkURL;
                    self->_networkURL = v9;

                    v11 = [[RawNightModeInferenceEspresso alloc] initWithExecutionTarget:self->_executionTarget];
                    espressoContext = self->_espressoContext;
                    self->_espressoContext = v11;
                  }
                  uint64_t v13 = 0;
                  inputSurfaces = self->_inputSurfaces;
                  outputSurfaces = self->_outputSurfaces;
                  char v15 = 1;
                  do
                  {
                    char v16 = v15;
                    v17 = objc_opt_new();
                    if (!v17)
                    {
LABEL_31:
                      int v41 = FigSignalErrorAt();

                      return v41;
                    }
                    v18 = [(RawNightModeTiledInferenceProvider *)self config];
                    v19 = [v18 networkInputNames];
                    uint64_t v20 = [v19 count];

                    if (v20)
                    {
                      unint64_t v21 = 0;
                      do
                      {
                        v22 = objc_opt_new();
                        [v17 addObject:v22];

                        ++v21;
                        v23 = [(RawNightModeTiledInferenceProvider *)self config];
                        v24 = [v23 networkInputNames];
                        unint64_t v25 = [v24 count];
                      }
                      while (v25 > v21);
                    }
                    objc_storeStrong((id *)&inputSurfaces[v13], v17);
                    if (self->_executionTarget != 3)
                    {
                      uint64_t v26 = objc_opt_new();
                      if (!v26) {
                        goto LABEL_31;
                      }
                      v27 = (NSArray *)v26;
                      v28 = [(RawNightModeTiledInferenceProvider *)self config];
                      v29 = [v28 networkOutputNames];
                      uint64_t v30 = [v29 count];

                      if (v30)
                      {
                        unint64_t v31 = 0;
                        do
                        {
                          v32 = objc_opt_new();
                          [(NSArray *)v27 addObject:v32];

                          ++v31;
                          v33 = [(RawNightModeTiledInferenceProvider *)self config];
                          v34 = [v33 networkOutputNames];
                          unint64_t v35 = [v34 count];
                        }
                        while (v35 > v31);
                      }
                      v36 = outputSurfaces[v13];
                      outputSurfaces[v13] = v27;

                      inputSurfaces = self->_inputSurfaces;
                    }

                    char v15 = 0;
                    uint64_t v13 = 1;
                  }
                  while ((v16 & 1) != 0);
                  if (self->_executionTarget != 3)
                  {
                    v37 = self->_espressoCallBackQueue;
                    block[0] = MEMORY[0x263EF8330];
                    block[1] = 3221225472;
                    block[2] = __43__RawNightModeTiledInferenceProvider_setup__block_invoke;
                    block[3] = &unk_2655C72D0;
                    block[4] = self;
                    dispatch_async(v37, block);
                  }
                  if (dword_26B430EA8)
                  {
                    v38 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  return 0;
                }
                int v39 = v8;
              }
              FigDebugAssert3();
              return v39;
            }
          }
        }
      }
    }
  }

  return FigSignalErrorAt();
}

uint64_t __43__RawNightModeTiledInferenceProvider_setup__block_invoke(uint64_t a1)
{
  v2 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 104) ktraceID];
    kdebug_trace();
  }
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "loadEspressoNetworkFromPath:withStorageType:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "UTF8String"), objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "espressoStorageType"));
  if (*v2 == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 104) ktraceID];
    return kdebug_trace();
  }
  return result;
}

- (int)allocateMemory
{
  v2 = self;
  uint64_t v72 = *MEMORY[0x263EF8340];
  v3 = (_DWORD *)MEMORY[0x263F00E10];
  if (*MEMORY[0x263F00E10] == 1)
  {
    [(RawNightModeInferenceTiledConfig *)self->_config ktraceID];
    kdebug_trace();
  }
  if (!v2->_config) {
    goto LABEL_64;
  }
  if (v2->_memoryInitialized)
  {
    FigDebugAssert3();
    int v53 = 0;
    goto LABEL_59;
  }
  if (v2->_executionTarget != 3)
  {
    dispatch_sync((dispatch_queue_t)v2->_espressoCallBackQueue, &__block_literal_global_0);
    if (![(RawNightModeInferenceEspresso *)v2->_espressoContext valid])
    {
LABEL_64:
      int v53 = FigSignalErrorAt();
      goto LABEL_59;
    }
  }
  uint64_t v4 = 0;
  inputSurfaces = v2->_inputSurfaces;
  uint64_t v60 = *MEMORY[0x263F04130];
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  char v6 = 1;
  v63 = v2;
  location = (id *)v2->_outputSurfaces;
  v59 = v2->_inputSurfaces;
  while (1)
  {
    char v57 = v6;
    int v7 = [(RawNightModeTiledInferenceProvider *)v2 config];
    int v8 = [v7 networkInputNames];
    uint64_t v9 = [v8 count];

    uint64_t v62 = v4;
    if (v9) {
      break;
    }
LABEL_25:
    uint64_t v30 = location;
    if (v2->_executionTarget != 3)
    {
      unint64_t v31 = [(RawNightModeTiledInferenceProvider *)v2 config];
      v32 = [v31 networkOutputNames];
      uint64_t v33 = [v32 count];

      if (v33)
      {
        unint64_t v34 = 0;
        do
        {
          unint64_t v35 = objc_msgSend(v30[v4], "objectAtIndexedSubscript:", v34, v55, v56);
          if (!v35) {
            goto LABEL_46;
          }
          v12 = v35;
          if (![v35 iosurface])
          {
            CVPixelBufferRef pixelBufferOut = 0;
            v36 = [(RawNightModeInferenceTiledConfig *)v2->_config networkOutputNames];
            v37 = [v36 objectAtIndexedSubscript:v34];

            [(RawNightModeInferenceEspresso *)v2->_espressoContext espressoNetwork];
            id v38 = [v37 objectForKeyedSubscript:@"Name"];
            [v38 UTF8String];
            espresso_network_query_blob_dimensions();

            if (!v34)
            {
              int v39 = [NSNumber numberWithInt:v69];
              [(RawNightModeInferenceTiledConfig *)v2->_config setTileWidth:v39];

              v40 = [NSNumber numberWithInt:v70];
              [(RawNightModeInferenceTiledConfig *)v2->_config setTileHeight:v40];
            }
            uint64_t v41 = [v37 objectForKeyedSubscript:@"PixelBufferFormat"];
            if (!v41)
            {
              int v53 = FigSignalErrorAt();
LABEL_56:

              goto LABEL_57;
            }
            v42 = (void *)v41;
            v43 = [v37 objectForKeyedSubscript:@"MetalPixelFormat"];
            if (!v43) {
              goto LABEL_55;
            }
            size_t v44 = v69;
            size_t v45 = v71 * v70;
            OSType v46 = [v42 unsignedIntValue];
            uint64_t v65 = v60;
            uint64_t v66 = MEMORY[0x263EFFA78];
            if (CVPixelBufferCreate(allocator, v44, v45, v46, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1], &pixelBufferOut))
            {
              goto LABEL_55;
            }
            [v12 setPixelBuffer:pixelBufferOut];
            if (![v12 pixelBuffer]) {
              goto LABEL_55;
            }
            [v12 setIosurface:CVPixelBufferGetIOSurface(pixelBufferOut)];
            if (![v12 iosurface]
              || (-[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](v2->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", pixelBufferOut, [v43 unsignedIntValue], 7, 0), v47 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v12, "setTexture:", v47), v47, objc_msgSend(v12, "texture"), v48 = objc_claimAutoreleasedReturnValue(), v48, !v48))
            {
LABEL_55:
              int v53 = FigSignalErrorAt();

              goto LABEL_56;
            }
            if (dword_26B430EA8)
            {
              v49 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();

              v2 = v63;
              uint64_t v30 = location;
            }

            uint64_t v4 = v62;
          }

          ++v34;
          v50 = [(RawNightModeTiledInferenceProvider *)v2 config];
          v51 = [v50 networkOutputNames];
          unint64_t v52 = [v51 count];
        }
        while (v52 > v34);
      }
    }
    char v6 = 0;
    uint64_t v4 = 1;
    inputSurfaces = v59;
    if ((v57 & 1) == 0)
    {
      if (v2->_executionTarget == 3)
      {
        objc_storeStrong(v30, v2->_inputSurfaces[0]);
        objc_storeStrong((id *)&v2->_outputSurfaces[1], v2->_inputSurfaces[1]);
      }
      int v53 = 0;
      v2->_memoryInitialized = 1;
      goto LABEL_58;
    }
  }
  unint64_t v10 = 0;
  while (1)
  {
    v11 = -[NSArray objectAtIndexedSubscript:](inputSurfaces[v4], "objectAtIndexedSubscript:", v10, v55);
    if (!v11)
    {
LABEL_46:
      int v53 = FigSignalErrorAt();
      goto LABEL_58;
    }
    v12 = v11;
    if ([v11 iosurface]) {
      goto LABEL_24;
    }
    CVPixelBufferRef pixelBufferOut = 0;
    uint64_t v13 = [(RawNightModeInferenceTiledConfig *)v2->_config networkInputNames];
    v14 = [v13 objectAtIndexedSubscript:v10];

    if (v2->_executionTarget == 3)
    {
      char v15 = [v14 objectForKeyedSubscript:@"Width"];
      size_t v69 = (int)[v15 intValue];

      char v16 = [v14 objectForKeyedSubscript:@"Height"];
      uint64_t v70 = (int)[v16 intValue];

      uint64_t v71 = 1;
    }
    else
    {
      [(RawNightModeInferenceEspresso *)v2->_espressoContext espressoNetwork];
      id v17 = [v14 objectForKeyedSubscript:@"Name"];
      [v17 UTF8String];
      espresso_network_query_blob_dimensions();
    }
    uint64_t v18 = [v14 objectForKeyedSubscript:@"PixelBufferFormat"];
    if (!v18)
    {
      int v53 = FigSignalErrorAt();
      goto LABEL_53;
    }
    v19 = (void *)v18;
    uint64_t v20 = [v14 objectForKeyedSubscript:@"MetalPixelFormat"];
    if (!v20) {
      goto LABEL_52;
    }
    size_t v21 = v69;
    size_t v22 = v71 * v70;
    OSType v23 = [v19 unsignedIntValue];
    uint64_t v67 = v60;
    uint64_t v68 = MEMORY[0x263EFFA78];
    if (CVPixelBufferCreate(allocator, v21, v22, v23, (CFDictionaryRef)[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1], &pixelBufferOut))
    {
      break;
    }
    [v12 setPixelBuffer:pixelBufferOut];
    v2 = v63;
    if (![v12 pixelBuffer]) {
      goto LABEL_52;
    }
    [v12 setIosurface:CVPixelBufferGetIOSurface(pixelBufferOut)];
    if (![v12 iosurface]) {
      goto LABEL_52;
    }
    v24 = -[FigMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:](v63->_metalContext, "bindPixelBufferToMTL2DTexture:pixelFormat:usage:plane:", pixelBufferOut, [v20 unsignedIntValue], 7, 0);
    [v12 setTexture:v24];

    unint64_t v25 = [v12 texture];

    if (!v25) {
      goto LABEL_52;
    }
    if (dword_26B430EA8)
    {
      uint64_t v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

      v2 = v63;
    }

    uint64_t v4 = v62;
LABEL_24:

    ++v10;
    v27 = [(RawNightModeTiledInferenceProvider *)v2 config];
    v28 = [v27 networkInputNames];
    unint64_t v29 = [v28 count];

    if (v29 <= v10) {
      goto LABEL_25;
    }
  }
  FigDebugAssert3();
  v2 = v63;
LABEL_52:
  int v53 = FigSignalErrorAt();

LABEL_53:
LABEL_57:

LABEL_58:
  v3 = (_DWORD *)MEMORY[0x263F00E10];
LABEL_59:
  if (*v3 == 1)
  {
    [(RawNightModeInferenceTiledConfig *)v2->_config ktraceID];
    kdebug_trace();
  }
  return v53;
}

- (int)preWarm
{
  preInferenceMetalStage = self->_preInferenceMetalStage;
  if (preInferenceMetalStage) {
    LODWORD(preInferenceMetalStage) = [(RawNightModeTiledInferenceMetalStage *)preInferenceMetalStage preWarm];
  }
  if (self->_postInferenceMetalStage)
  {
    postInferenceMetalStage = self->_postInferenceMetalStage;
    LODWORD(preInferenceMetalStage) = [(RawNightModeTiledInferenceMetalStage *)postInferenceMetalStage preWarm];
  }
  return (int)preInferenceMetalStage;
}

- (int)runInference
{
  espressoCallBackQueue = self->_espressoCallBackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__RawNightModeTiledInferenceProvider_runInference__block_invoke;
  block[3] = &unk_2655C72D0;
  block[4] = self;
  dispatch_async(espressoCallBackQueue, block);
  if (!self->_preInferenceMetalStage
    || !self->_postInferenceMetalStage
    || !self->_memoryInitialized
    || ![(RawNightModeInferenceEspresso *)self->_espressoContext valid] && self->_executionTarget != 3)
  {
    int v58 = FigSignalErrorAt();
    goto LABEL_43;
  }
  uint64_t v4 = [(RawNightModeInferenceTiledConfig *)self->_config tileWidth];
  int v5 = [v4 intValue];

  char v6 = [(RawNightModeInferenceTiledConfig *)self->_config tileHeight];
  int v7 = [v6 intValue];

  int v8 = [(RawNightModeInferenceTiledConfig *)self->_config tilePadding];
  int v9 = [(RawNightModeInferenceTiledConfig *)self->_config tilePadding];
  int v70 = [(RawNightModeInferenceTiledConfig *)self->_config tilePadding];
  signed int v65 = [(RawNightModeInferenceTiledConfig *)self->_config outputWidth];
  int v64 = [(RawNightModeInferenceTiledConfig *)self->_config outputHeight];
  int v10 = [(RawNightModeInferenceTiledConfig *)self->_config tilePadding];
  if (![(RawNightModeInferenceTiledConfig *)self->_config outputWidth])
  {
    int v58 = 0;
    goto LABEL_43;
  }
  unint64_t v71 = 0;
  LOBYTE(v11) = 0;
  int v66 = -v10;
  inputSurfaces = self->_inputSurfaces;
  outputSurfaces = self->_outputSurfaces;
  int v67 = v7 - 2 * v9;
  signed int v61 = v5 - 2 * v8;
  int v13 = -1;
  int v14 = v5;
  int v62 = v7;
  int v63 = v5;
  int v15 = v7;
  while (1)
  {
    int v16 = [(RawNightModeInferenceTiledConfig *)self->_config tilePadding];
    if ([(RawNightModeInferenceTiledConfig *)self->_config outputHeight]) {
      break;
    }
    unint64_t v57 = v71 + v61;
    int v19 = v66 + v61;
LABEL_38:
    unint64_t v71 = v57;
    int v66 = v19;
    if ([(RawNightModeInferenceTiledConfig *)self->_config outputWidth] <= v57)
    {
      int v58 = 0;
      goto LABEL_43;
    }
  }
  unint64_t v17 = 0;
  int v18 = -v16;
  int v19 = v66 + v61;
  while (1)
  {
    ++v13;
    BOOL v20 = v11;
    BOOL v11 = !v11;
    int v72 = v17;
    if (!(v71 | v17)) {
      break;
    }
LABEL_13:
    unint64_t v73 = v17 + v67;
    int v68 = v18;
    int v69 = v13;
    if ([(RawNightModeInferenceTiledConfig *)self->_config outputWidth] > v71 + v61
      || [(RawNightModeInferenceTiledConfig *)self->_config outputHeight] > v73)
    {
      if ([(RawNightModeInferenceTiledConfig *)self->_config outputHeight] <= v73)
      {
        unsigned int v28 = 0;
        int v25 = -(int)[(RawNightModeInferenceTiledConfig *)self->_config tilePadding];
        int v26 = v19;
        unsigned int v27 = v61 + v71;
      }
      else
      {
        int v25 = v18 + v67;
        int v26 = v66;
        unsigned int v27 = v71;
        unsigned int v28 = v17 + v67;
      }
      signed int v29 = v61;
      if ((int)([(RawNightModeInferenceTiledConfig *)self->_config outputWidth] - v27) < v61) {
        signed int v29 = [(RawNightModeInferenceTiledConfig *)self->_config outputWidth] - v27;
      }
      int v30 = [(RawNightModeInferenceTiledConfig *)self->_config outputHeight];
      int v31 = v67;
      if ((int)(v30 - v28) < v67) {
        int v31 = [(RawNightModeInferenceTiledConfig *)self->_config outputHeight] - v28;
      }
      preInferenceMetalStage = self->_preInferenceMetalStage;
      uint64_t v33 = inputSurfaces[v20];
      unint64_t v34 = outputSurfaces[v20];
      int v76 = v20;
      int v77 = v26;
      int v78 = v25;
      int v15 = v62;
      int v14 = v63;
      int v79 = v63;
      int v80 = v62;
      unint64_t v81 = __PAIR64__(v28, v27);
      signed int v82 = v29;
      int v83 = v31;
      int v84 = v70;
      int v35 = [(RawNightModeTiledInferenceMetalStage *)preInferenceMetalStage encodeWithTileBounds:&v76 inputTiles:v33 outputTiles:v34];
      if (v35)
      {
        int v58 = v35;
        goto LABEL_47;
      }
      [(FigMetalContext *)self->_metalContext waitForSchedule];
      int v18 = v68;
      int v13 = v69;
      int v19 = v66 + v61;
    }
    if (self->_executionTarget != 3)
    {
      v36 = [(RawNightModeInferenceTiledConfig *)self->_config networkInputNames];
      uint64_t v37 = [v36 count];

      if (v37)
      {
        unint64_t v38 = 0;
        do
        {
          int v39 = [(RawNightModeInferenceTiledConfig *)self->_config networkInputNames];
          v40 = [v39 objectAtIndexedSubscript:v38];

          uint64_t v41 = [v40 objectForKeyedSubscript:@"Name"];
          v42 = [(NSArray *)inputSurfaces[v11] objectAtIndexedSubscript:v38];
          [(RawNightModeInferenceEspresso *)self->_espressoContext espressoNetwork];
          id v43 = v41;
          [v43 UTF8String];
          [v42 pixelBuffer];
          if (espresso_network_bind_direct_cvpixelbuffer()) {
            goto LABEL_40;
          }

          ++v38;
          size_t v44 = [(RawNightModeInferenceTiledConfig *)self->_config networkInputNames];
          unint64_t v45 = [v44 count];
        }
        while (v45 > v38);
      }
      OSType v46 = [(RawNightModeInferenceTiledConfig *)self->_config networkOutputNames];
      uint64_t v47 = [v46 count];

      if (v47)
      {
        unint64_t v48 = 0;
        while (1)
        {
          v49 = [(RawNightModeInferenceTiledConfig *)self->_config networkOutputNames];
          v40 = [v49 objectAtIndexedSubscript:v48];

          v50 = [v40 objectForKeyedSubscript:@"Name"];
          v42 = [(NSArray *)outputSurfaces[v11] objectAtIndexedSubscript:v48];
          [(RawNightModeInferenceEspresso *)self->_espressoContext espressoNetwork];
          id v43 = v50;
          [v43 UTF8String];
          [v42 pixelBuffer];
          if (espresso_network_bind_direct_cvpixelbuffer()) {
            break;
          }

          ++v48;
          v51 = [(RawNightModeInferenceTiledConfig *)self->_config networkOutputNames];
          unint64_t v52 = [v51 count];

          if (v52 <= v48) {
            goto LABEL_33;
          }
        }
LABEL_40:
        int v58 = FigSignalErrorAt();

        goto LABEL_43;
      }
LABEL_33:
      [(RawNightModeInferenceEspresso *)self->_espressoContext espressoPlan];
      int v15 = v62;
      int v14 = v63;
      int v18 = v68;
      int v13 = v69;
      int v19 = v66 + v61;
      LODWORD(v17) = v72;
      if (espresso_plan_submit())
      {
        int v58 = FigSignalErrorAt();
        goto LABEL_43;
      }
    }
    postInferenceMetalStage = self->_postInferenceMetalStage;
    v54 = inputSurfaces[v11];
    uint64_t v55 = outputSurfaces[v11];
    int v76 = v13;
    int v77 = v66;
    int v78 = v18;
    int v79 = v14;
    int v80 = v15;
    unint64_t v81 = __PAIR64__(v17, v71);
    signed int v82 = v65;
    int v83 = v64;
    int v84 = v70;
    int v56 = [(RawNightModeTiledInferenceMetalStage *)postInferenceMetalStage encodeWithTileBounds:&v76 inputTiles:v54 outputTiles:v55];
    if (v56)
    {
      int v58 = v56;
      goto LABEL_47;
    }
    v18 += v67;
    unint64_t v17 = v73;
    if ([(RawNightModeInferenceTiledConfig *)self->_config outputHeight] <= v73)
    {
      unint64_t v57 = v71 + v61;
      goto LABEL_38;
    }
  }
  size_t v21 = self->_preInferenceMetalStage;
  size_t v22 = inputSurfaces[v11];
  OSType v23 = outputSurfaces[v11];
  int v76 = v13;
  int v77 = v66;
  int v78 = v18;
  int v79 = v14;
  int v80 = v15;
  unint64_t v81 = 0;
  signed int v82 = v65;
  int v83 = v64;
  int v84 = v70;
  int v24 = [(RawNightModeTiledInferenceMetalStage *)v21 encodeWithTileBounds:&v76 inputTiles:v22 outputTiles:v23];
  if (!v24)
  {
    [(FigMetalContext *)self->_metalContext waitForSchedule];
    goto LABEL_13;
  }
  int v58 = v24;
LABEL_47:
  FigDebugAssert3();
LABEL_43:
  v59 = self->_espressoCallBackQueue;
  v75[0] = MEMORY[0x263EF8330];
  v75[1] = 3221225472;
  v75[2] = __50__RawNightModeTiledInferenceProvider_runInference__block_invoke_3;
  v75[3] = &unk_2655C72D0;
  v75[4] = self;
  dispatch_async(v59, v75);
  return v58;
}

uint64_t __50__RawNightModeTiledInferenceProvider_runInference__block_invoke(uint64_t result)
{
  if (*MEMORY[0x263F00E10] == 1)
  {
    [*(id *)(*(void *)(result + 32) + 104) ktraceID];
    return kdebug_trace();
  }
  return result;
}

uint64_t __50__RawNightModeTiledInferenceProvider_runInference__block_invoke_3(uint64_t result)
{
  if (*MEMORY[0x263F00E10] == 1)
  {
    [*(id *)(*(void *)(result + 32) + 104) ktraceID];
    return kdebug_trace();
  }
  return result;
}

- (int)resetState
{
  espressoCallBackQueue = self->_espressoCallBackQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__RawNightModeTiledInferenceProvider_resetState__block_invoke;
  block[3] = &unk_2655C72D0;
  block[4] = self;
  dispatch_async(espressoCallBackQueue, block);
  [(RawNightModeTiledInferenceProvider *)self deallocateMemory];
  return 0;
}

uint64_t __48__RawNightModeTiledInferenceProvider_resetState__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) resetState];
}

- (int)deallocateMemory
{
  if (self->_memoryInitialized)
  {
    uint64_t v3 = 0;
    inputSurfaces = self->_inputSurfaces;
    outputSurfaces = self->_outputSurfaces;
    char v6 = 1;
    do
    {
      char v7 = v6;
      int v8 = [(RawNightModeInferenceTiledConfig *)self->_config networkInputNames];
      uint64_t v9 = [v8 count];

      if (v9)
      {
        unint64_t v10 = 0;
        do
        {
          BOOL v11 = [(NSArray *)inputSurfaces[v3] objectAtIndexedSubscript:v10];
          CVPixelBufferRelease((CVPixelBufferRef)[v11 pixelBuffer]);
          [v11 setIosurface:0];
          [v11 setPixelBuffer:0];
          [v11 setTexture:0];

          ++v10;
          v12 = [(RawNightModeInferenceTiledConfig *)self->_config networkInputNames];
          unint64_t v13 = [v12 count];
        }
        while (v13 > v10);
      }
      int v14 = [(RawNightModeInferenceTiledConfig *)self->_config networkOutputNames];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        unint64_t v16 = 0;
        do
        {
          unint64_t v17 = [(NSArray *)outputSurfaces[v3] objectAtIndexedSubscript:v16];
          CVPixelBufferRelease((CVPixelBufferRef)[v17 pixelBuffer]);
          [v17 setIosurface:0];
          [v17 setPixelBuffer:0];
          [v17 setTexture:0];

          ++v16;
          int v18 = [(RawNightModeInferenceTiledConfig *)self->_config networkOutputNames];
          unint64_t v19 = [v18 count];
        }
        while (v19 > v16);
      }
      char v6 = 0;
      uint64_t v3 = 1;
    }
    while ((v7 & 1) != 0);
    self->_memoryInitialized = 0;
  }
  return 0;
}

- (void)waitForResetStateCompletion
{
  dispatch_sync((dispatch_queue_t)self->_espressoCallBackQueue, &__block_literal_global_90);
  if (dword_26B430EA8)
  {
    v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (FigMetalContext)metalContext
{
  return self->_metalContext;
}

- (void)setMetalContext:(id)a3
{
}

- (NSArray)networkURLs
{
  return self->_networkURLs;
}

- (void)setNetworkURLs:(id)a3
{
}

- (int)executionTarget
{
  return self->_executionTarget;
}

- (void)setExecutionTarget:(int)a3
{
  self->_executionTarget = a3;
}

- (RawNightModeTiledInferenceMetalStage)preInferenceMetalStage
{
  return self->_preInferenceMetalStage;
}

- (void)setPreInferenceMetalStage:(id)a3
{
}

- (RawNightModeTiledInferenceMetalStage)postInferenceMetalStage
{
  return self->_postInferenceMetalStage;
}

- (void)setPostInferenceMetalStage:(id)a3
{
}

- (RawNightModeInferenceTiledConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_postInferenceMetalStage, 0);
  objc_storeStrong((id *)&self->_preInferenceMetalStage, 0);
  objc_storeStrong((id *)&self->_networkURLs, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  objc_storeStrong((id *)&self->_espressoCallBackQueue, 0);
  for (uint64_t i = 48; i != 32; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i != 16);
  objc_storeStrong((id *)&self->_espressoContext, 0);

  objc_storeStrong((id *)&self->_networkURL, 0);
}

@end