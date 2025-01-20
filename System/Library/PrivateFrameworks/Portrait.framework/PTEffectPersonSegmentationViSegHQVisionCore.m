@interface PTEffectPersonSegmentationViSegHQVisionCore
+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)segmentationSizeForColorSize:(SEL)a3;
- (BOOL)createEspressoBuffer:(id *)a3 fromNetwork:(int)a4 name:(id)a5 isInput:(BOOL)a6;
- (PTEffectPersonSegmentationViSegHQVisionCore)initWithMetalContext:(id)a3 colorSize:(CGSize)a4;
- (__CVBuffer)outputPixelbuffer;
- (id)debugTextures;
- (id)runPersonSegmentationForPixelBuffer:(__CVBuffer *)a3;
- (unsigned)clearIOSurface:(__IOSurface *)a3 tensorType:(int)a4 value:(float)a5;
- (unsigned)reset;
- (void)dealloc;
- (void)postProcessUpdateFrame;
- (void)reset;
@end

@implementation PTEffectPersonSegmentationViSegHQVisionCore

- (PTEffectPersonSegmentationViSegHQVisionCore)initWithMetalContext:(id)a3 colorSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v98.receiver = self;
  v98.super_class = (Class)PTEffectPersonSegmentationViSegHQVisionCore;
  v9 = [(PTEffectPersonSegmentationViSegHQVisionCore *)&v98 init];
  if (!v9)
  {
    v23 = 0;
    goto LABEL_30;
  }
  kdebug_trace();
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.portrait.PTEffectPersonSegmentationViSegHQVisionCore", 0);
  asyncDispatchQueue = v9->_asyncDispatchQueue;
  v9->_asyncDispatchQueue = (OS_dispatch_queue *)v10;

  objc_storeStrong((id *)&v9->_metalContext, a3);
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  semaphore = v9->_semaphore;
  v9->_semaphore = (OS_dispatch_semaphore *)v12;

  v14 = _PTLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = 2;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = 0;
    _os_log_impl(&dword_1D0778000, v14, OS_LOG_TYPE_INFO, "ViSegHQ version %i %i", buf, 0xEu);
  }

  v15 = (void *)[objc_alloc(MEMORY[0x1E4FB3F08]) initWithMajor:2 minor:0];
  unint64_t v16 = +[PTEffectUtil closestAspectRatio:](PTEffectUtil, "closestAspectRatio:", width, height);
  id v109 = 0;
  id v110 = 0;
  id v111 = 0;
  if (v16 == 1)
  {
    v17 = (id *)MEMORY[0x1E4FB3FC8];
    v18 = (id *)MEMORY[0x1E4FB3FB0];
    v19 = (id *)MEMORY[0x1E4FB3FA8];
    v20 = (id *)MEMORY[0x1E4FB3F90];
    v21 = (void **)MEMORY[0x1E4FB3F88];
    v22 = (void **)MEMORY[0x1E4FB3F70];
  }
  else
  {
    if (v16 != 2)
    {
      v27 = _PTLogSystem();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:]();
      }
      goto LABEL_26;
    }
    v17 = (id *)MEMORY[0x1E4FB3FC0];
    v18 = (id *)MEMORY[0x1E4FB3FB8];
    v19 = (id *)MEMORY[0x1E4FB3FA0];
    v20 = (id *)MEMORY[0x1E4FB3F98];
    v21 = (void **)MEMORY[0x1E4FB3F80];
    v22 = (void **)MEMORY[0x1E4FB3F78];
  }
  if (width < height) {
    v21 = v22;
  }
  v24 = *v21;
  if (width >= height) {
    v25 = v19;
  }
  else {
    v25 = v20;
  }
  if (width >= height) {
    v26 = v17;
  }
  else {
    v26 = v18;
  }
  id v109 = v24;
  id v110 = *v25;
  id v111 = *v26;
  v27 = +[PTInference ANEConfigForSynchronousWork];
  [v27 espressoEngine];
  uint64_t context = espresso_create_context();
  v9->_uint64_t context = (void *)context;
  if (!context)
  {
    v29 = _PTLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:]();
    }
    goto LABEL_25;
  }
  if (espresso_context_set_low_precision_accumulation())
  {
    v29 = _PTLogSystem();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.9(v29, v30, v31, v32, v33, v34, v35, v36);
    }
LABEL_25:

LABEL_26:
    id v37 = 0;
    v23 = 0;
    goto LABEL_27;
  }
  v86 = v27;
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  id v84 = v8;
  uint64_t v42 = -1800;
  v85 = v15;
  do
  {
    uint64_t v43 = (uint64_t)*(&v109 + v41);
    id v97 = 0;
    uint64_t v44 = [MEMORY[0x1E4FB3F60] descriptorForIdentifier:v43 version:v15 error:&v97];
    id v37 = v97;
    v45 = &v9->super.isa + v41;
    Class v46 = v45[225];
    v45[225] = (Class)v44;

    if (v45[225]) {
      BOOL v47 = v37 == 0;
    }
    else {
      BOOL v47 = 0;
    }
    if (!v47)
    {
      v55 = _PTLogSystem();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        *(_WORD *)&buf[22] = 2112;
        id v108 = v37;
        _os_log_error_impl(&dword_1D0778000, v55, OS_LOG_TYPE_ERROR, "Error getting SegmentationInferenceNetworkDescriptor for %@ (%@). Error %@", buf, 0x20u);
      }

      goto LABEL_60;
    }
    uint64_t plan = espresso_create_plan();
    v45[2] = (Class)plan;
    if (!plan)
    {
      v57 = _PTLogSystem();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:]();
      }
      goto LABEL_59;
    }
    [v86 espressoPlanPriority];
    if (espresso_plan_set_priority())
    {
      v57 = _PTLogSystem();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.8();
      }
      goto LABEL_59;
    }
    v49 = [(objc_class *)v45[225] URL];
    id v50 = [v49 path];
    [v50 UTF8String];
    int v51 = espresso_plan_add_network();

    if (v51)
    {
      v57 = _PTLogSystem();
      v15 = v85;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.7(v41, (id *)((char *)&v9->super.isa - v42), v57);
      }
LABEL_59:

      id v37 = 0;
LABEL_60:
      v23 = 0;
      goto LABEL_61;
    }
    int version = espresso_network_get_version();
    v53 = _PTLogSystem();
    v54 = v53;
    if (version)
    {
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.6(&v95, v96, v54);
      }
    }
    else if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v103 = 136315394;
      v104 = buf;
      __int16 v105 = 1024;
      int v106 = v41;
      _os_log_debug_impl(&dword_1D0778000, v54, OS_LOG_TYPE_DEBUG, "PersonSegmentation network version: %s subtype %i", v103, 0x12u);
    }

    v15 = v85;
    if (espresso_plan_build())
    {
      v57 = _PTLogSystem();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.5();
      }
      goto LABEL_59;
    }
    ++v41;
    v40 += 16;
    v42 -= 8;
  }
  while (v41 != 3);
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  uint64_t v58 = [&unk_1F26C1218 countByEnumeratingWithState:&v91 objects:v102 count:16];
  if (v58)
  {
    uint64_t v59 = v58;
    uint64_t v60 = *(void *)v92;
LABEL_64:
    uint64_t v61 = 0;
    while (1)
    {
      if (*(void *)v92 != v60) {
        objc_enumerationMutation(&unk_1F26C1218);
      }
      uint64_t v62 = *(void *)(*((void *)&v91 + 1) + 8 * v61);
      v63 = [&unk_1F26C1218 objectForKeyedSubscript:v62];
      LODWORD(v62) = -[PTEffectPersonSegmentationViSegHQVisionCore createEspressoBuffer:fromNetwork:name:isInput:](v9, "createEspressoBuffer:fromNetwork:name:isInput:", v9->_ebuffer[(int)[v63 intValue]], 2, v62, 1);

      if (!v62) {
        break;
      }
      if (v59 == ++v61)
      {
        uint64_t v59 = [&unk_1F26C1218 countByEnumeratingWithState:&v91 objects:v102 count:16];
        if (v59) {
          goto LABEL_64;
        }
        goto LABEL_70;
      }
    }
LABEL_84:
    id v37 = 0;
    v23 = 0;
    v15 = v85;
LABEL_61:
    v27 = v86;
    goto LABEL_27;
  }
LABEL_70:
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  uint64_t v64 = [&unk_1F26C1240 countByEnumeratingWithState:&v87 objects:v101 count:16];
  if (v64)
  {
    uint64_t v65 = v64;
    uint64_t v66 = *(void *)v88;
LABEL_72:
    uint64_t v67 = 0;
    while (1)
    {
      if (*(void *)v88 != v66) {
        objc_enumerationMutation(&unk_1F26C1240);
      }
      uint64_t v68 = *(void *)(*((void *)&v87 + 1) + 8 * v67);
      v69 = [&unk_1F26C1240 objectForKeyedSubscript:v68];
      LODWORD(v68) = -[PTEffectPersonSegmentationViSegHQVisionCore createEspressoBuffer:fromNetwork:name:isInput:](v9, "createEspressoBuffer:fromNetwork:name:isInput:", &v9->_ebuffer[(int)[v69 intValue]][1], 2, v68, 0);

      if (!v68) {
        goto LABEL_84;
      }
      if (v65 == ++v67)
      {
        uint64_t v65 = [&unk_1F26C1240 countByEnumeratingWithState:&v87 objects:v101 count:16];
        if (v65) {
          goto LABEL_72;
        }
        break;
      }
    }
  }
  memset(buf, 0, sizeof(buf));
  +[PTEffectPersonSegmentationViSegHQVisionCore segmentationSizeForColorSize:](PTEffectPersonSegmentationViSegHQVisionCore, "segmentationSizeForColorSize:", width, height);
  uint64_t v70 = 0;
  CFAllocatorRef allocator = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v82 = *MEMORY[0x1E4F24D20];
  uint64_t v71 = *MEMORY[0x1E4F24C98];
  pixelBufferMatting = v9->_pixelBufferMatting;
  textureMatting = v9->_textureMatting;
  char v74 = 1;
  do
  {
    char v75 = v74;
    v99[0] = v82;
    v99[1] = v71;
    v100[0] = MEMORY[0x1E4F1CC08];
    v100[1] = &unk_1F26C0CE8;
    CVPixelBufferCreate(allocator, *(size_t *)buf, *(size_t *)&buf[8], 0x4C303068u, (CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v100 forKeys:v99 count:2], &pixelBufferMatting[v70]);
    v76 = pixelBufferMatting[v70];
    v77 = [(PTMetalContext *)v9->_metalContext device];
    uint64_t v78 = +[PTPixelBufferUtil createTextureFromPixelBuffer:v76 device:v77];
    v79 = textureMatting[v70];
    textureMatting[v70] = (MTLTexture *)v78;

    char v74 = 0;
    uint64_t v70 = 1;
  }
  while ((v75 & 1) != 0);
  int v80 = [(PTEffectPersonSegmentationViSegHQVisionCore *)v9 reset];
  [v85 major];
  [v85 minor];
  kdebug_trace();
  if (v80)
  {
    v81 = _PTLogSystem();
    v27 = v86;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore initWithMetalContext:colorSize:].cold.4(v80, v81);
    }

    v23 = 0;
    v15 = v85;
  }
  else
  {
    v23 = v9;
    v15 = v85;
    v27 = v86;
  }
  id v37 = 0;
  id v8 = v84;
LABEL_27:

  for (uint64_t i = 16; i != -8; i -= 8)
LABEL_30:

  return v23;
}

- (void)dealloc
{
  for (uint64_t i = 16; i != 40; i += 8)
    espresso_plan_destroy();
  espresso_context_destroy();
  uint64_t v4 = 0;
  char v5 = 1;
  do
  {
    char v6 = v5;
    CVPixelBufferRelease(self->_pixelBufferMatting[v4]);
    v7 = (char *)self + 168 * v4;
    for (uint64_t j = 88; j != 1768; j += 336)
      free(*(void **)&v7[j]);
    char v5 = 0;
    uint64_t v4 = 1;
  }
  while ((v6 & 1) != 0);
  v9.receiver = self;
  v9.super_class = (Class)PTEffectPersonSegmentationViSegHQVisionCore;
  [(PTEffectPersonSegmentationViSegHQVisionCore *)&v9 dealloc];
}

- (BOOL)createEspressoBuffer:(id *)a3 fromNetwork:(int)a4 name:(id)a5 isInput:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  v11 = self->_viSegHQDescriptor[a4];
  if (v6)
  {
    uint64_t v22 = 0;
    dispatch_semaphore_t v12 = (id *)&v22;
    uint64_t v13 = [(VisionCoreVideoSegmentationInferenceNetworkDescriptor *)v11 inputNamed:v10 error:&v22];
  }
  else
  {
    uint64_t v21 = 0;
    dispatch_semaphore_t v12 = (id *)&v21;
    uint64_t v13 = [(VisionCoreVideoSegmentationInferenceNetworkDescriptor *)v11 outputNamed:v10 error:&v21];
  }
  v14 = (void *)v13;
  id v15 = *v12;
  if (v15)
  {
    unint64_t v16 = _PTLogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore createEspressoBuffer:fromNetwork:name:isInput:]();
    }
  }
  else
  {
    v17 = [v14 shape];
    [v17 rank];
    unint64_t v16 = v17;
    [v16 sizes];
    if (!espresso_buffer_pack_tensor_shape())
    {
      BOOL v19 = 1;
      a3->var0 = malloc_type_calloc(1uLL, [v14 storageByteCount], 0xB2064E28uLL);
      goto LABEL_12;
    }
    v18 = _PTLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore createEspressoBuffer:fromNetwork:name:isInput:]();
    }
  }
  BOOL v19 = 0;
LABEL_12:

  return v19;
}

- (unsigned)reset
{
  self->_frameCount = 0;
  IOSurfaceRef IOSurface = CVPixelBufferGetIOSurface(self->_pixelBufferMatting[0]);
  LODWORD(v4) = -1.0;
  unsigned int v5 = [(PTEffectPersonSegmentationViSegHQVisionCore *)self clearIOSurface:IOSurface tensorType:0 value:v4];
  unsigned int v6 = [(PTEffectPersonSegmentationViSegHQVisionCore *)self clearIOSurface:CVPixelBufferGetIOSurface(self->_pixelBufferMatting[1]) tensorType:0 value:0.0] | v5;
  bzero(self->_ebuffer[4][0].data, self->_ebuffer[4][0].stride[3]);
  bzero(self->_ebuffer[1][1].data, self->_ebuffer[4][0].stride[3]);
  if (v6)
  {
    v7 = _PTLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore reset]();
    }
  }
  return v6;
}

- (unsigned)clearIOSurface:(__IOSurface *)a3 tensorType:(int)a4 value:(float)a5
{
  if (!a3)
  {
    BOOL v19 = _PTLogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore clearIOSurface:tensorType:value:]();
    }

    return -1;
  }
  _S8 = a5;
  if (IOSurfaceGetPixelFormat(a3) != 1278226536)
  {
    v20 = _PTLogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore clearIOSurface:tensorType:value:](a3, v20);
    }

    return -1;
  }
  IOSurfaceLock(a3, 0, 0);
  size_t Width = IOSurfaceGetWidth(a3);
  size_t Height = IOSurfaceGetHeight(a3);
  size_t BytesPerRow = IOSurfaceGetBytesPerRow(a3);
  BaseAddress = (char *)IOSurfaceGetBaseAddress(a3);
  if (Height)
  {
    uint64_t v11 = 0;
    __asm { FCVT            H0, S8 }
    do
    {
      if (Width)
      {
        for (uint64_t i = 0; i != Width; ++i)
          *(_WORD *)&BaseAddress[2 * i] = _H0;
      }
      BaseAddress += BytesPerRow;
      ++v11;
    }
    while (v11 != Height);
  }
  IOSurfaceUnlock(a3, 0, 0);
  return 0;
}

- (id)runPersonSegmentationForPixelBuffer:(__CVBuffer *)a3
{
  int frameCount = self->_frameCount;
  CVPixelBufferGetWidth(a3);
  CVPixelBufferGetHeight(a3);
  kdebug_trace();
  if (frameCount)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    [@"input_image" UTF8String];
    if (espresso_network_bind_cvpixelbuffer())
    {
      unsigned int v6 = _PTLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    [@"mask" UTF8String];
    if (espresso_network_bind_cvpixelbuffer())
    {
      v14 = _PTLogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
    [@"hidden_state" UTF8String];
    if (espresso_network_bind_buffer())
    {
      uint64_t v22 = _PTLogSystem();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    [@"hidden" UTF8String];
    if (espresso_network_bind_buffer())
    {
      uint64_t v30 = _PTLogSystem();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v30, v31, v32, v33, v34, v35, v36, v37);
      }
    }
    [@"key" UTF8String];
    if (espresso_network_bind_buffer())
    {
      v38 = _PTLogSystem();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v38, v39, v40, v41, v42, v43, v44, v45);
      }
    }
    [@"value" UTF8String];
    if (espresso_network_bind_buffer())
    {
      Class v46 = _PTLogSystem();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v46, v47, v48, v49, v50, v51, v52, v53);
      }
    }
    if (espresso_plan_execute_sync())
    {
      v54 = _PTLogSystem();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v54, v55, v56, v57, v58, v59, v60, v61);
      }
    }
  }
  int v62 = self->_frameCount;
  int v63 = v62 + 1;
  self->_int frameCount = v62 + 1;
  BOOL v64 = __OFADD__(v62, 2);
  v62 += 2;
  char v65 = (v62 < 0) ^ v64;
  int v66 = v62 & 1;
  if (v65) {
    int v67 = -v66;
  }
  else {
    int v67 = v66;
  }
  int v68 = v63 % 5;
  if (v63 % 5) {
    int v69 = 1;
  }
  else {
    int v69 = 2;
  }
  [@"input_image" UTF8String];
  if (espresso_network_bind_cvpixelbuffer())
  {
    uint64_t v70 = _PTLogSystem();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v70, v71, v72, v73, v74, v75, v76, v77);
    }
  }
  [@"input_matting" UTF8String];
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    uint64_t v78 = _PTLogSystem();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v78, v79, v80, v81, v82, v83, v84, v85);
    }
  }
  [@"input_prob" UTF8String];
  if (espresso_network_bind_buffer())
  {
    v86 = _PTLogSystem();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v86, v87, v88, v89, v90, v91, v92, v93);
    }
  }
  [@"prev_key" UTF8String];
  if (espresso_network_bind_buffer())
  {
    long long v94 = _PTLogSystem();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v94, v95, v96, v97, v98, v99, v100, v101);
    }
  }
  [@"prev_value" UTF8String];
  if (espresso_network_bind_buffer())
  {
    v102 = _PTLogSystem();
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v102, v103, v104, v105, v106, v107, v108, v109);
    }
  }
  [@"hidden_state" UTF8String];
  if (espresso_network_bind_buffer())
  {
    id v110 = _PTLogSystem();
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v110, v111, v112, v113, v114, v115, v116, v117);
    }
  }
  [@"output_matting" UTF8String];
  if (espresso_network_bind_direct_cvpixelbuffer())
  {
    v118 = _PTLogSystem();
    if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v118, v119, v120, v121, v122, v123, v124, v125);
    }
  }
  [@"output" UTF8String];
  if (espresso_network_bind_buffer())
  {
    v126 = _PTLogSystem();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v126, v127, v128, v129, v130, v131, v132, v133);
    }
  }
  [@"hidden" UTF8String];
  if (espresso_network_bind_buffer())
  {
    v134 = _PTLogSystem();
    if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v134, v135, v136, v137, v138, v139, v140, v141);
    }
  }
  if (!v68)
  {
    [@"key" UTF8String];
    if (espresso_network_bind_buffer())
    {
      v142 = _PTLogSystem();
      if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v142, v143, v144, v145, v146, v147, v148, v149);
      }
    }
    [@"value" UTF8String];
    if (espresso_network_bind_buffer())
    {
      v150 = _PTLogSystem();
      if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR)) {
        -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v150, v151, v152, v153, v154, v155, v156, v157);
      }
    }
  }
  v169[0] = MEMORY[0x1E4F143A8];
  v169[1] = 3221225472;
  v169[2] = __83__PTEffectPersonSegmentationViSegHQVisionCore_runPersonSegmentationForPixelBuffer___block_invoke;
  v169[3] = &unk_1E6884688;
  int v170 = v69;
  v169[4] = self;
  v158 = (void *)MEMORY[0x1D25E44D0](v169);
  if (espresso_plan_submit())
  {
    v159 = _PTLogSystem();
    if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
      -[PTEffectPersonSegmentationViSegHQVisionCore runPersonSegmentationForPixelBuffer:](v159, v160, v161, v162, v163, v164, v165, v166);
    }
  }
  v167 = self->_textureMatting[v67];

  return v167;
}

uint64_t __83__PTEffectPersonSegmentationViSegHQVisionCore_runPersonSegmentationForPixelBuffer___block_invoke(uint64_t a1, int *a2)
{
  if (a2)
  {
    double v4 = _PTLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__PTEffectPersonSegmentationViSegHQVisionCore_runPersonSegmentationForPixelBuffer___block_invoke_cold_1(a2, v4);
    }
  }
  if (*(_DWORD *)(a1 + 40) == 2) {
    [*(id *)(a1 + 32) postProcessUpdateFrame];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 1832));
  [*(id *)(*(void *)(a1 + 32) + 1784) width];
  [*(id *)(*(void *)(a1 + 32) + 1784) height];
  return kdebug_trace();
}

- (__CVBuffer)outputPixelbuffer
{
  int frameCount = self->_frameCount;
  BOOL v3 = __OFADD__(frameCount++, 1);
  char v4 = (frameCount < 0) ^ v3;
  int v5 = frameCount & 1;
  if (v4) {
    int v5 = -v5;
  }
  return self->_pixelBufferMatting[v5];
}

- (void)postProcessUpdateFrame
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1D0778000, v1, OS_LOG_TYPE_ERROR, "postProcessing error %@ success %i", v2, 0x12u);
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)segmentationSizeForColorSize:(SEL)a3
{
  float64x2_t v12 = *(float64x2_t *)&a4.height;
  result = +[PTEffectUtil closestAspectRatio:](PTEffectUtil, "closestAspectRatio:");
  if (result == ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)2)
  {
    int8x16_t v6 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v12, (float64x2_t)a4).i64[0], 0);
    int8x16_t v7 = (int8x16_t)xmmword_1D0820250;
    int8x16_t v8 = (int8x16_t)xmmword_1D0820260;
    goto LABEL_5;
  }
  if (result == ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)1)
  {
    int8x16_t v6 = (int8x16_t)vdupq_lane_s64(vcgtq_f64(v12, (float64x2_t)a4).i64[0], 0);
    int8x16_t v7 = (int8x16_t)xmmword_1D0820270;
    int8x16_t v8 = (int8x16_t)xmmword_1D0820280;
LABEL_5:
    int8x16_t v9 = vbslq_s8(v6, v8, v7);
    goto LABEL_9;
  }
  uint64_t v10 = _PTLogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[PTEffectPersonSegmentationViSegHQVisionCore segmentationSizeForColorSize:v12.f64[0]];
  }

  int8x16_t v9 = (int8x16_t)xmmword_1D0820250;
LABEL_9:
  *(int8x16_t *)&retstr->var0 = v9;
  retstr->var2 = 1;
  return result;
}

- (id)debugTextures
{
  v8[1] = *MEMORY[0x1E4F143B8];
  int frameCount = self->_frameCount;
  BOOL v3 = __OFADD__(frameCount++, 1);
  char v4 = (frameCount < 0) ^ v3;
  int v5 = frameCount & 1;
  if (v4) {
    int v5 = -v5;
  }
  v8[0] = self->_textureMatting[v5];
  int8x16_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncDispatchQueue, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_metalContext, 0);
  for (uint64_t i = 0; i != -3; --i)
    objc_storeStrong((id *)&self->_viSegHQDescriptor[i + 2], 0);
  uint64_t v4 = 0;
  int v5 = &self->_textureMatting[1];
  do
    objc_storeStrong((id *)&v5[v4--], 0);
  while (v4 != -2);
}

- (void)initWithMetalContext:colorSize:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Unsupported aspect ratio", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:colorSize:.cold.2()
{
  espresso_get_last_error();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v0, v1, "Error creating espresso context %s", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:colorSize:.cold.3()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Error creating espresso plan", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:(int)a1 colorSize:(NSObject *)a2 .cold.4(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Error during reset %i", (uint8_t *)v2, 8u);
}

- (void)initWithMetalContext:colorSize:.cold.5()
{
  espresso_get_last_error();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v0, v1, "Espresso error building plan: %s", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:(os_log_t)log colorSize:.cold.6(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "unknown version of espresso model loaded", buf, 2u);
}

- (void)initWithMetalContext:(NSObject *)a3 colorSize:.cold.7(int a1, id *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t last_error = espresso_get_last_error();
  int8x16_t v7 = [*a2 URL];
  int v8 = 136315650;
  uint64_t v9 = last_error;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 1024;
  int v13 = a1;
  _os_log_error_impl(&dword_1D0778000, a3, OS_LOG_TYPE_ERROR, "Error espresso plan add network: %s for %@ subtype %i", (uint8_t *)&v8, 0x1Cu);
}

- (void)initWithMetalContext:colorSize:.cold.8()
{
  espresso_get_last_error();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_1(&dword_1D0778000, v0, v1, "Error espresso set priority: %s", v2, v3, v4, v5, v6);
}

- (void)initWithMetalContext:(uint64_t)a3 colorSize:(uint64_t)a4 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)createEspressoBuffer:fromNetwork:name:isInput:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "espresso_buffer_pack_tensor_shape failed!", v2, v3, v4, v5, v6);
}

- (void)createEspressoBuffer:fromNetwork:name:isInput:.cold.2()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Failed to get VisionCoreTensorDescriptor!", v2, v3, v4, v5, v6);
}

- (void)reset
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "Error resetting segmentation", v2, v3, v4, v5, v6);
}

- (void)clearIOSurface:tensorType:value:.cold.1()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3_2(&dword_1D0778000, v0, v1, "iosurface not found", v2, v3, v4, v5, v6);
}

- (void)clearIOSurface:(__IOSurface *)a1 tensorType:(NSObject *)a2 value:.cold.2(__IOSurface *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109120;
  v3[1] = IOSurfaceGetPixelFormat(a1);
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "Unsupported pixelformat %ul", (uint8_t *)v3, 8u);
}

- (void)runPersonSegmentationForPixelBuffer:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __83__PTEffectPersonSegmentationViSegHQVisionCore_runPersonSegmentationForPixelBuffer___block_invoke_cold_1(int *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *((void *)a1 + 1);
  int v3 = *a1;
  int v4 = a1[1];
  int v5 = 136315650;
  uint64_t v6 = v2;
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl(&dword_1D0778000, a2, OS_LOG_TYPE_ERROR, "espresso_plan_submit callback. %s %i %i", (uint8_t *)&v5, 0x18u);
}

+ (void)segmentationSizeForColorSize:(double)a3 .cold.1(os_log_t log, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl(&dword_1D0778000, log, OS_LOG_TYPE_ERROR, "Unknown aspect ratio for (%f x %f)", (uint8_t *)&v3, 0x16u);
}

@end