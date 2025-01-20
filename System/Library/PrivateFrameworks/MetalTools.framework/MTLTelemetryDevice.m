@interface MTLTelemetryDevice
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3;
- (BOOL)enableTelemetry;
- (BOOL)supportsFeatureSet:(unint64_t)a3;
- (BOOL)supportsTextureSampleCount:(unint64_t)a3;
- (MTLTelemetryDevice)initWithBaseObject:(id)a3 parent:(id)a4;
- (OS_os_log)telemetryLog;
- (id).cxx_construct;
- (id)_newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)_newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)_newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6;
- (id)newBufferWithDescriptor:(id)a3;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newCommandQueue;
- (id)newCommandQueueWithDescriptor:(id)a3;
- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3;
- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newDepthStencilStateWithDescriptor:(id)a3;
- (id)newHeapWithDescriptor:(id)a3;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newSamplerStateWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5;
- (unint64_t)startTime;
- (void)_newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)_newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)_newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)emitFeatureQueryUsage;
- (void)emitTelemetry;
- (void)initDistributions;
- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)setGLMode:(BOOL)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setTimerInterval:(double)a3;
- (void)startTimerWithInterval:(double)a3;
@end

@implementation MTLTelemetryDevice

- (void)dealloc
{
  free(self->encoderDistribution);
  free(self->commandBufferDistribution);
  free(self->parallellRenderEncoderDistribution);
  free(self->attachmentCount);
  free(self->textureBindCount);
  free(self->renderTargetArrayLengthDistribution);
  free(self->viewportDistribution);
  free(self->scissorRectDistribution);
  free(self->drawDistribution);
  free(self->dispatchDistribution);
  free(self->bufferDistribution);
  free(self->renderPipelineDistribution);
  free(self->computePipelineDistribution);
  free(self->commandBufferDispatchDistribution);
  free(self->computeEncoderDispatchDistribution);
  free(self->samplerDistribution);
  free(self->depthStateDistribution);
  free(self->frontFaceStencilStateDistribution);
  free(self->backFaceStencilStateDistribution);
  free(self->depthClipModeClampDistribution);
  free(self->commandBufferDrawCallDistribution);
  free(self->renderEncoderDrawCallDistribution);
  free(self->commandBufferBlitDistribution);
  free(self->blitEncoderBlitDistribution);
  free(self->commandBufferMemoryBarrierDistribution);
  free(self->kernelDistribution);
  free(self->anisoClippedCounts);

  v3.receiver = self;
  v3.super_class = (Class)MTLTelemetryDevice;
  [(MTLToolsDevice *)&v3 dealloc];
}

- (void)initDistributions
{
  self->encoderDistribution = (MTLTelemetryEncoderDistributionRec *)malloc_type_calloc(1uLL, 0x78uLL, 0x10000400012A6C3uLL);
  self->commandBufferDistribution = (MTLTelemetryCommandBufferCounttRec *)malloc_type_calloc(1uLL, 8uLL, 0x100004000313F17uLL);
  self->parallellRenderEncoderDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->attachmentCount = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->textureBindCount = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->renderTargetArrayLengthDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->viewportDistribution = (MTLTelemetryViewportDistributionRec *)malloc_type_calloc(1uLL, 0x58uLL, 0x100004038113C5CuLL);
  self->scissorRectDistribution = (MTLTelemetryScissorRectDistributionRec *)malloc_type_calloc(1uLL, 0x38uLL, 0x100004095CF6A33uLL);
  self->drawDistribution = (MTLTelemetryDrawDistributionRec *)malloc_type_calloc(1uLL, 0x9D8uLL, 0x100004010114EAEuLL);
  self->dispatchDistribution = (MTLTelemetryDispatchDistributionRec *)malloc_type_calloc(1uLL, 0xF8uLL, 0x10000406AFDB319uLL);
  self->bufferDistribution = (MTLTelemetryBufferDistributionRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->renderPipelineDistribution = (MTLTelemetryRenderPipelineDistributionRec *)malloc_type_calloc(1uLL, 0x80uLL, 0x1000040C89A4E27uLL);
  self->computePipelineDistribution = (MTLTelemetryComputePipelineDistributionRec *)malloc_type_calloc(1uLL, 0x14uLL, 0x1000040A86A77D5uLL);
  self->commandBufferDispatchDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->computeEncoderDispatchDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->samplerDistribution = (MTLTelemetrySamplerDistributionRec *)malloc_type_calloc(1uLL, 0x2308uLL, 0x10000405F8ED335uLL);
  self->depthStateDistribution = (MTLTelemetryDepthStateDistributionRec *)malloc_type_calloc(1uLL, 0x24uLL, 0x10000408AA14F5FuLL);
  self->frontFaceStencilStateDistribution = (MTLTelemetryStencilStateDistributionRec *)malloc_type_calloc(1uLL, 0x300uLL, 0x1000040C91E451AuLL);
  self->backFaceStencilStateDistribution = (MTLTelemetryStencilStateDistributionRec *)malloc_type_calloc(1uLL, 0x300uLL, 0x1000040C91E451AuLL);
  self->depthClipModeClampDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->commandBufferDrawCallDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->renderEncoderDrawCallDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->commandBufferBlitDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->blitEncoderBlitDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->commandBufferMemoryBarrierDistribution = (MTLTelemetryStatisticUIRec *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000400CE834B2uLL);
  self->kernelDistribution = (MTLTelemetryKernelDistributionRec *)malloc_type_calloc(1uLL, 0x60uLL, 0x10000402D9D9CE9uLL);
  self->anisoClippedCounts = (MTLTelemetryAnisoClippedCountsRec *)malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
  self->_isGLMTL = 0;
}

- (void)setTimerInterval:(double)a3
{
  timer = self->_timer;
  dispatch_time_t v5 = dispatch_time(0, 5000000000);

  dispatch_source_set_timer(timer, v5, (unint64_t)(a3 * 1000000000.0), 0x5F5E100uLL);
}

- (MTLTelemetryDevice)initWithBaseObject:(id)a3 parent:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)MTLTelemetryDevice;
  id v4 = [(MTLToolsDevice *)&v14 initWithBaseObject:a3 parent:a4];
  if (v4)
  {
    NSLog(&cfstr_STelemetryDevi.isa, "-[MTLTelemetryDevice initWithBaseObject:parent:]");
    snprintf(__str, 0x400uLL, "telemetry::%s", (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "infoDictionary"), "objectForKey:", @"CFBundleName"), "UTF8String"));
    *((void *)v4 + 104) = os_log_create("com.apple.Metal", __str);
    initLogMode();
    [v4 initDistributions];
    *((void *)v4 + 91) = dispatch_queue_create("com.apple.Metal.telemetryQ", 0);
    mach_timebase_info((mach_timebase_info_t)v4 + 92);
    LODWORD(v5) = *((_DWORD *)v4 + 184);
    LODWORD(v6) = *((_DWORD *)v4 + 185);
    *((double *)v4 + 93) = (double)v5 / (double)v6 / 1000000000.0;
    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"MetalTelemetryInterval", @"com.apple.Metal", &keyExistsAndHasValidFormat);
    if (AppIntegerValue <= 0 || keyExistsAndHasValidFormat == 0) {
      double v9 = 60.0;
    }
    else {
      double v9 = (double)AppIntegerValue;
    }
    *((void *)v4 + 94) = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v4 + 91));
    [v4 setTimerInterval:v9];
    v10 = *((void *)v4 + 94);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __48__MTLTelemetryDevice_initWithBaseObject_parent___block_invoke;
    handler[3] = &unk_264E13C28;
    handler[4] = v4;
    dispatch_source_set_event_handler(v10, handler);
    dispatch_resume(*((dispatch_object_t *)v4 + 94));
  }
  return (MTLTelemetryDevice *)v4;
}

uint64_t __48__MTLTelemetryDevice_initWithBaseObject_parent___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) emitTelemetry];
}

- (BOOL)enableTelemetry
{
  return os_log_type_enabled((os_log_t)self->_telemetryLog, OS_LOG_TYPE_DEFAULT);
}

- (void)setGLMode:(BOOL)a3
{
  queue = self->queue;
  if (queue)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __32__MTLTelemetryDevice_setGLMode___block_invoke;
    v5[3] = &unk_264E13C78;
    BOOL v6 = a3;
    v5[4] = self;
    dispatch_sync(queue, v5);
  }
}

uint64_t __32__MTLTelemetryDevice_setGLMode___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    *(unsigned char *)(*(void *)(result + 32) + 760) = 1;
  }
  return result;
}

- (void)emitFeatureQueryUsage
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  p_supportQuery = &self->supportQuery;
  id v4 = (_DWORD *)MEMORY[0x263F12D18];
  if (self->supportQuery.featureSetCount.__table_.__p2_.__value_)
  {
    unint64_t v5 = (void *)[MEMORY[0x263F089D8] stringWithString:@"FeatureSet, "];
    for (i = (const std::string::value_type *)p_supportQuery->featureSetCount.__table_.__p1_.__value_.__next_;
          i;
          i = *(const std::string::value_type **)i)
    {
      if (i[39] < 0) {
        std::string::__init_copy_ctor_external(&v18, *((const std::string::value_type **)i + 2), *((void *)i + 3));
      }
      else {
        std::string v18 = *(std::string *)(i + 16);
      }
      uint64_t v7 = *((unsigned int *)i + 10);
      *(_DWORD *)v19 = *((_DWORD *)i + 10);
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v8 = &v18;
      }
      else {
        v8 = (std::string *)v18.__r_.__value_.__r.__words[0];
      }
      [v5 appendFormat:@"%s=%u, ", v8, v7];
      if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v18.__r_.__value_.__l.__data_);
      }
    }
    if (*v4)
    {
      if (*v4 != 1) {
        goto LABEL_17;
      }
      printf("\n\n%s", (const char *)[v5 UTF8String]);
    }
    telemetryLog = self->_telemetryLog;
    if (os_log_type_enabled(telemetryLog, OS_LOG_TYPE_DEFAULT))
    {
      std::string::size_type v10 = [v5 UTF8String];
      LODWORD(v18.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v18.__r_.__value_.__r.__words + 4) = v10;
      _os_log_impl(&dword_23BD25000, telemetryLog, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v18, 0xCu);
    }
  }
LABEL_17:
  unsigned int count = p_supportQuery->texSampleCount.count;
  if (!count) {
    return;
  }
  if (*v4)
  {
    if (*v4 != 1) {
      return;
    }
    printf("\n\nTextureSampleCountQueries, minSamples=%u, maxSamples=%u, avgSamples=%f, totalSamples=%llu, countSamples=%u", p_supportQuery->texSampleCount.min, p_supportQuery->texSampleCount.max, (float)((float)p_supportQuery->texSampleCount.total / (float)count), p_supportQuery->texSampleCount.total, count);
  }
  v12 = self->_telemetryLog;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int min = p_supportQuery->texSampleCount.min;
    unsigned int max = p_supportQuery->texSampleCount.max;
    unsigned int v15 = p_supportQuery->texSampleCount.count;
    unint64_t total = p_supportQuery->texSampleCount.total;
    if (v15) {
      double v17 = (float)((float)total / (float)v15);
    }
    else {
      double v17 = 0.0;
    }
    LODWORD(v18.__r_.__value_.__l.__data_) = 67110144;
    HIDWORD(v18.__r_.__value_.__r.__words[0]) = min;
    LOWORD(v18.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&v18.__r_.__value_.__r.__words[1] + 2) = max;
    HIWORD(v18.__r_.__value_.__r.__words[1]) = 2048;
    *(double *)&v18.__r_.__value_.__r.__words[2] = v17;
    *(_WORD *)v19 = 2048;
    *(void *)&v19[2] = total;
    __int16 v20 = 1024;
    unsigned int v21 = v15;
    _os_log_impl(&dword_23BD25000, v12, OS_LOG_TYPE_DEFAULT, "TextureSampleCountQueries, minSamples=%u, maxSamples=%u, avgSamples=%f, totalSamples=%llu, countSamples=%u", (uint8_t *)&v18, 0x28u);
  }
}

- (void)emitTelemetry
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_super v3 = (int *)MEMORY[0x263F12D18];
  int v4 = *MEMORY[0x263F12D18];
  if (*MEMORY[0x263F12D18])
  {
    if (v4 != 1) {
      goto LABEL_7;
    }
    printf("\n\nBeginMetalTelemetry");
  }
  unint64_t v5 = [(MTLTelemetryDevice *)self telemetryLog];
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23BD25000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "BeginMetalTelemetry", buf, 2u);
  }
  int v4 = *v3;
LABEL_7:
  if (v4)
  {
    if (v4 != 1) {
      goto LABEL_18;
    }
    if (self->_isGLMTL) {
      BOOL v6 = "GLonMetal";
    }
    else {
      BOOL v6 = "Metal";
    }
    printf("\n\nAPI, %s", v6);
  }
  uint64_t v7 = [(MTLTelemetryDevice *)self telemetryLog];
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_isGLMTL) {
      v8 = "GLonMetal";
    }
    else {
      v8 = "Metal";
    }
    *(_DWORD *)buf = 136315138;
    unsigned int v21 = v8;
    _os_log_impl(&dword_23BD25000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "API, %s", buf, 0xCu);
  }
LABEL_18:
  [(MTLTelemetryDevice *)self emitFeatureQueryUsage];
  emitBufferDistribution(self, self->bufferDistribution);
  std::unordered_map<MTLPixelFormat,MTLTelemetryTextureDistribution>::unordered_map((uint64_t)v19, (uint64_t)&self->textureMap);
  emitTextureDistribution(self, (uint64_t)v19);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)v19);
  emitEncoderDistribution(self, self->encoderDistribution);
  parallellRenderEncoderDistribution = self->parallellRenderEncoderDistribution;
  if (parallellRenderEncoderDistribution->count)
  {
    long long v10 = *(_OWORD *)&parallellRenderEncoderDistribution->min;
    *(void *)&v18.unsigned int count = *(void *)&parallellRenderEncoderDistribution->count;
    *(_OWORD *)&v18.unsigned int min = v10;
    emitParallellRenderEncoderDistribution(self, &v18);
  }
  std::unordered_map<MTLPixelFormat,MTLTelemetryRenderTargetDistribution>::unordered_map((uint64_t)v17, (uint64_t)&self->renderTargetMap);
  emitRenderTargetDistribution(self, (uint64_t)v17);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)v17);
  emitDrawDistribution(self, self->drawDistribution);
  std::unordered_map<MTLPixelFormat,MTLTelemetryBlitDistribution>::unordered_map((uint64_t)v16, (uint64_t)&self->blitMap);
  emitBlitDistribution(self, (uint64_t)v16);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)v16);
  emitDispatchDistribution(self, self->dispatchDistribution);
  std::unordered_map<unsigned int,MTLTelemetryRenderPipelineUsageRec>::unordered_map((uint64_t)v15, (uint64_t)&self->renderPipeUsageMap);
  std::unordered_map<unsigned int,MTLTelemetryRenderFuncUsageRec>::unordered_map((uint64_t)v14, (uint64_t)&self->renderFuncUsageMap);
  emitRenderPipelineUsage(self, (uint64_t)v15, (uint64_t)v14);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)v14);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)v15);
  emitRenderPipelineStats(self, (uint64_t)&self->vtxStatDistributionMap, (uint64_t)&self->fragStatDistributionMap, (int *)self->renderPipelineDistribution);
  std::unordered_map<unsigned int,MTLTelemetryComputePipelineUsageRec>::unordered_map((uint64_t)v13, (uint64_t)&self->computePipeUsageMap);
  std::unordered_map<unsigned int,MTLTelemetryKernelUsageRec>::unordered_map((uint64_t)v12, (uint64_t)&self->kernelUsageMap);
  emitComputePipelineUsage(self, (uint64_t)v13, (uint64_t)v12);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)v12);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)v13);
  emitComputePipelineStats(self, (uint64_t)&self->computeStatDistributionMap, &self->computePipelineDistribution->var0);
  emitSamplerDistribution(self, self->samplerDistribution);
  emitDepthStencilDistribution(self, self->depthStateDistribution, self->frontFaceStencilStateDistribution, self->backFaceStencilStateDistribution);
  emitRenderPassAttributes(self, self->depthClipModeClampDistribution);
  emitKernelTelemetry(self);
  emitAnisoClippedCounts(self, self->anisoClippedCounts);
  if (*v3)
  {
    if (*v3 != 1) {
      return;
    }
    printf("\n\nEndMetalTelemetry");
  }
  v11 = [(MTLTelemetryDevice *)self telemetryLog];
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23BD25000, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "EndMetalTelemetry", buf, 2u);
  }
}

- (void)startTimerWithInterval:(double)a3
{
  queue = self->queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__MTLTelemetryDevice_startTimerWithInterval___block_invoke;
  v5[3] = &unk_264E13C28;
  v5[4] = self;
  self->_timer = (OS_dispatch_source *)createTimerWithInterval(queue, v5, a3);
}

uint64_t __45__MTLTelemetryDevice_startTimerWithInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) emitTelemetry];
}

- (id)newCommandQueue
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueue");
  if (result)
  {
    id v4 = result;
    unint64_t v5 = [(MTLToolsCommandQueue *)[MTLTelemetryCommandQueue alloc] initWithBaseObject:result parent:self];

    return v5;
  }
  return result;
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithMaxCommandBufferCount:", a3);
  if (result)
  {
    id v5 = result;
    BOOL v6 = [(MTLToolsCommandQueue *)[MTLTelemetryCommandQueue alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithDescriptor:", a3);
  if (result)
  {
    id v5 = result;
    BOOL v6 = [(MTLToolsCommandQueue *)[MTLTelemetryCommandQueue alloc] initWithBaseObject:result parent:self];

    return v6;
  }
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapTextureSizeAndAlignWithDescriptor:(id)a3
{
  id v4 = [(MTLToolsObject *)self baseObject];

  unint64_t v5 = [v4 heapTextureSizeAndAlignWithDescriptor:a3];
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)heapBufferSizeAndAlignWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  id v6 = [(MTLToolsObject *)self baseObject];

  unint64_t v7 = [v6 heapBufferSizeAndAlignWithLength:a3 options:a4];
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (id)newHeapWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newHeapWithDescriptor:", a3);
  if (result)
  {
    id v6 = result;
    unint64_t v7 = [[MTLTelemetryHeap alloc] initWithHeap:result descriptor:a3 device:self];

    return v7;
  }
  return result;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithLength:options:", a3, a4);
  if (result)
  {
    id v7 = result;
    unint64_t v8 = [[MTLTelemetryBuffer alloc] initWithBuffer:result device:self options:a4];

    return v8;
  }
  return result;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytes:length:options:", a3, a4, a5);
  if (result)
  {
    id v8 = result;
    double v9 = [[MTLTelemetryBuffer alloc] initWithBuffer:result device:self options:a5];

    return v9;
  }
  return result;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithBytesNoCopy:length:options:deallocator:", a3, a4, a5, a6);
  if (result)
  {
    id v10 = result;
    v11 = [[MTLTelemetryBuffer alloc] initWithBuffer:result device:self bytes:a3 options:a5];

    return v11;
  }
  return result;
}

- (id)newBufferWithDescriptor:(id)a3
{
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBufferWithDescriptor:", a3);
  if (!v5) {
    return 0;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [a3 contents];
  id v8 = [MTLTelemetryBuffer alloc];
  if (v7) {
    uint64_t v9 = -[MTLTelemetryBuffer initWithBuffer:device:bytes:options:](v8, "initWithBuffer:device:bytes:options:", v6, self, [a3 contents], objc_msgSend(a3, "resourceOptions"));
  }
  else {
    uint64_t v9 = -[MTLTelemetryBuffer initWithBuffer:device:options:](v8, "initWithBuffer:device:options:", v6, self, [a3 resourceOptions]);
  }
  id v10 = (void *)v9;

  return v10;
}

- (id)newDepthStencilStateWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newDepthStencilStateWithDescriptor:", a3);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = [[MTLTelemetryDepthStencilState alloc] initWithBaseDepthStencilState:result device:self descriptor:a3];

    return v7;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:", a3);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = [[MTLTelemetryTexture alloc] initWithBaseTexture:result device:self descriptor:a3];

    return v7;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newTextureWithDescriptor:iosurface:plane:", a3, a4, a5);
  if (result)
  {
    id v9 = result;
    id v10 = [[MTLTelemetryTexture alloc] initWithBaseTexture:result device:self descriptor:a3 plane:a5];

    return v10;
  }
  return result;
}

- (id)newSamplerStateWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newSamplerStateWithDescriptor:", a3);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = [[MTLTelemetrySamplerState alloc] initWithBaseSamplerState:result device:self descriptor:a3];

    return v7;
  }
  return result;
}

- (id)_newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  objc_super v14 = 0;
  uint64_t v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newRenderPipelineStateWithDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:"), a4 | 0x40000, &v14, a6);
  id v10 = (void *)v9;
  if (a5) {
    *a5 = v14;
  }
  if (!v9) {
    return 0;
  }
  v11 = [MTLTelemetryRenderPipelineState alloc];
  v12 = [(MTLTelemetryRenderPipelineState *)v11 initWithPipelineState:v10 reflection:v14 parent:self descriptor:a3];

  return v12;
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return [(MTLTelemetryDevice *)self _newRenderPipelineStateWithDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL reflection:a5 error:a6];
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0;
  return [(MTLTelemetryDevice *)self _newRenderPipelineStateWithDescriptor:a3 options:0x20000 reflection:&v5 error:a4];
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__MTLTelemetryDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_264E12DD8;
  v4[4] = a4;
  [(MTLTelemetryDevice *)self _newRenderPipelineStateWithDescriptor:a3 options:0x20000 completionHandler:v4];
}

uint64_t __77__MTLTelemetryDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __85__MTLTelemetryDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_264E12DD8;
  v5[4] = a5;
  [(MTLTelemetryDevice *)self _newRenderPipelineStateWithDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL completionHandler:v5];
}

uint64_t __85__MTLTelemetryDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = -[MTLToolsDevice unwrapMTLRenderPipelineDescriptor:](self, "unwrapMTLRenderPipelineDescriptor:");
  id v10 = [(MTLToolsObject *)self baseObject];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__MTLTelemetryDevice__newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v11[3] = &unk_264E13CA0;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = a5;
  [v10 newRenderPipelineStateWithDescriptor:v9 options:a4 | 0x40000 completionHandler:v11];
}

void __86__MTLTelemetryDevice__newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(void *a1, MTLTelemetryRenderPipelineState *a2, uint64_t a3)
{
  if (a2) {
    a2 = [[MTLTelemetryRenderPipelineState alloc] initWithPipelineState:a2 reflection:a3 parent:a1[4] descriptor:a1[5]];
  }
  id v4 = a2;
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0;
  return [(MTLTelemetryDevice *)self _newComputePipelineStateWithDescriptor:a3 options:0x20000 reflection:&v5 error:a4];
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return [(MTLTelemetryDevice *)self _newComputePipelineStateWithDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL reflection:a5 error:a6];
}

- (id)_newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  objc_super v14 = 0;
  uint64_t v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithDescriptor:options:reflection:error:", -[MTLToolsDevice unwrapMTLComputePipelineDescriptor:](self, "unwrapMTLComputePipelineDescriptor:"), a4 | 0x40000, &v14, a6);
  id v10 = (void *)v9;
  if (a5) {
    *a5 = v14;
  }
  if (!v9) {
    return 0;
  }
  v11 = [MTLTelemetryComputePipelineState alloc];
  v12 = [(MTLTelemetryComputePipelineState *)v11 initWithComputePipelineState:v10 reflection:v14 parent:self descriptor:a3];

  return v12;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__MTLTelemetryDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_264E12E50;
  v4[4] = a4;
  [(MTLTelemetryDevice *)self _newComputePipelineStateWithDescriptor:a3 options:0x20000 completionHandler:v4];
}

uint64_t __78__MTLTelemetryDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __86__MTLTelemetryDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v5[3] = &unk_264E12E50;
  v5[4] = a5;
  [(MTLTelemetryDevice *)self _newComputePipelineStateWithDescriptor:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL completionHandler:v5];
}

uint64_t __86__MTLTelemetryDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v8 = [a3 copy];
  id v9 = [(MTLToolsDevice *)self unwrapMTLComputePipelineDescriptor:v8];
  id v10 = [(MTLToolsObject *)self baseObject];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __87__MTLTelemetryDevice__newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke;
  v11[3] = &unk_264E13CC8;
  v11[4] = self;
  v11[5] = v8;
  v11[6] = a5;
  [v10 newComputePipelineStateWithDescriptor:v9 options:a4 | 0x40000 completionHandler:v11];
}

void __87__MTLTelemetryDevice__newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(void *a1, MTLTelemetryComputePipelineState *a2, uint64_t a3)
{
  if (a2) {
    a2 = [[MTLTelemetryComputePipelineState alloc] initWithComputePipelineState:a2 reflection:a3 parent:a1[4] descriptor:a1[5]];
  }
  id v4 = a2;
  (*(void (**)(void))(a1[6] + 16))();
}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  uint64_t v5 = 0;
  return [(MTLTelemetryDevice *)self _newComputePipelineStateWithFunction:a3 options:0x20000 reflection:&v5 error:a4];
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  return [(MTLTelemetryDevice *)self _newComputePipelineStateWithFunction:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL reflection:a5 error:a6];
}

- (id)_newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  unsigned int v15 = 0;
  uint64_t v9 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newComputePipelineStateWithFunction:options:reflection:error:", objc_msgSend(a3, "baseObject"), a4 | 0x40000, &v15, a6);
  id v10 = (void *)v9;
  if (a5) {
    *a5 = v15;
  }
  if (!v9) {
    return 0;
  }
  v11 = objc_opt_new();
  [v11 setComputeFunction:a3];
  v12 = [MTLTelemetryComputePipelineState alloc];
  v13 = [(MTLTelemetryComputePipelineState *)v12 initWithComputePipelineState:v10 reflection:v15 parent:self descriptor:v11];

  return v13;
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__MTLTelemetryDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke;
  v4[3] = &unk_264E12E50;
  v4[4] = a4;
  [(MTLTelemetryDevice *)self _newComputePipelineStateWithFunction:a3 options:0x20000 completionHandler:v4];
}

uint64_t __76__MTLTelemetryDevice_newComputePipelineStateWithFunction_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__MTLTelemetryDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v5[3] = &unk_264E12E50;
  v5[4] = a5;
  [(MTLTelemetryDevice *)self _newComputePipelineStateWithFunction:a3 options:a4 & 0xFFFFFFFFFFFDFFFFLL completionHandler:v5];
}

uint64_t __84__MTLTelemetryDevice_newComputePipelineStateWithFunction_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  unint64_t v8 = a4 | 0x40000;
  id v9 = [(MTLToolsObject *)self baseObject];
  uint64_t v10 = [a3 baseObject];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__MTLTelemetryDevice__newComputePipelineStateWithFunction_options_completionHandler___block_invoke;
  v11[3] = &unk_264E13CC8;
  v11[4] = a3;
  v11[5] = self;
  v11[6] = a5;
  [v9 newComputePipelineStateWithFunction:v10 options:v8 completionHandler:v11];
}

void __85__MTLTelemetryDevice__newComputePipelineStateWithFunction_options_completionHandler___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    id v6 = objc_opt_new();
    [v6 setComputeFunction:a1[4]];
    uint64_t v7 = [[MTLTelemetryComputePipelineState alloc] initWithComputePipelineState:a2 reflection:a3 parent:a1[5] descriptor:v6];
  }
  else
  {
    uint64_t v7 = 0;
  }
  (*(void (**)(void))(a1[6] + 16))();
}

- (BOOL)supportsFeatureSet:(unint64_t)a3
{
  p_supportQuery = &self->supportQuery;
  if (a3 > 0x12) {
    id v6 = "Unknown";
  }
  else {
    id v6 = off_264E13CE8[a3];
  }
  std::string::basic_string[abi:ne180100]<0>(__p, v6);
  v11 = __p;
  uint64_t v7 = std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_supportQuery, (unsigned __int8 *)__p, (uint64_t)&std::piecewise_construct, (long long **)&v11);
  ++v7[10];
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  return objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "supportsFeatureSet:", a3);
}

- (BOOL)supportsTextureSampleCount:(unint64_t)a3
{
  if (a3)
  {
    unsigned int count = self->supportQuery.texSampleCount.count;
    if (count)
    {
      if (self->supportQuery.texSampleCount.max < a3) {
        self->supportQuery.texSampleCount.unsigned int max = a3;
      }
      if (self->supportQuery.texSampleCount.min <= a3) {
        goto LABEL_9;
      }
    }
    else
    {
      self->supportQuery.texSampleCount.unsigned int max = a3;
    }
    self->supportQuery.texSampleCount.unsigned int min = a3;
LABEL_9:
    self->supportQuery.texSampleCount.total += a3;
    self->supportQuery.texSampleCount.unsigned int count = count + 1;
  }
  id v5 = [(MTLToolsObject *)self baseObject];

  return [v5 supportsTextureSampleCount:a3];
}

- (OS_os_log)telemetryLog
{
  return self->_telemetryLog;
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table((uint64_t)&self->supportQuery);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->blitMap);
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table((uint64_t)&self->computeStatDistributionMap);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->kernelUsageMap);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->computePipeUsageMap);
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table((uint64_t)&self->fragStatDistributionMap);
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::~__hash_table((uint64_t)&self->vtxStatDistributionMap);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->renderFuncUsageMap);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->renderPipeUsageMap);
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->textureMap);

  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)&self->renderTargetMap);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 11) = 0u;
  *((_OWORD *)self + 12) = 0u;
  *((_DWORD *)self + 52) = 1065353216;
  *((_OWORD *)self + 14) = 0u;
  *((_OWORD *)self + 15) = 0u;
  *((_DWORD *)self + 64) = 1065353216;
  *((_OWORD *)self + 17) = 0u;
  *((_OWORD *)self + 18) = 0u;
  *((_DWORD *)self + 76) = 1065353216;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *((_DWORD *)self + 86) = 1065353216;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 376) = 0u;
  *((_DWORD *)self + 98) = 1065353216;
  *((_OWORD *)self + 25) = 0u;
  *((_OWORD *)self + 26) = 0u;
  *((_DWORD *)self + 108) = 1065353216;
  *(_OWORD *)((char *)self + 472) = 0u;
  *(_OWORD *)((char *)self + 488) = 0u;
  *((_DWORD *)self + 126) = 1065353216;
  *((_OWORD *)self + 32) = 0u;
  *((_OWORD *)self + 33) = 0u;
  *((_DWORD *)self + 136) = 1065353216;
  *((_OWORD *)self + 35) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *((_DWORD *)self + 148) = 1065353216;
  *(_OWORD *)((char *)self + 648) = 0u;
  *(_OWORD *)((char *)self + 664) = 0u;
  *((_DWORD *)self + 170) = 1065353216;
  *((_OWORD *)self + 48) = 0u;
  *((_OWORD *)self + 49) = 0u;
  *((_DWORD *)self + 200) = 1065353216;
  return self;
}

@end