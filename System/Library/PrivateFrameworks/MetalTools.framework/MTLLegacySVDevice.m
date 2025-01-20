@interface MTLLegacySVDevice
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3;
- (BOOL)areWritableHeapsEnabled;
- (BOOL)supportsArgumentBuffersTier2;
- (BOOL)supportsCMPIndirectCommandBuffers;
- (BOOL)supportsForkJoin;
- (BOOL)supportsGFXIndirectCommandBuffers;
- (BOOL)supportsGlobalVariableBindings;
- (BOOL)supportsRayTracingPerPrimitiveData;
- (BOOL)supportsRaytracing;
- (BOOL)supportsRaytracingFromRender;
- (BOOL)supportsRenderDynamicLibraries;
- (BOOL)supportsResourceUsageValidation;
- (BOOL)supportsStackOverflowErrorCode;
- (MTLComputePipelineState)ICB_Inherit_Both_ComputePipelineState;
- (MTLComputePipelineState)ICB_Inherit_Buffers_ComputePipelineState;
- (MTLComputePipelineState)ICB_Inherit_None_ComputePipelineState;
- (MTLComputePipelineState)ICB_Inherit_PSO_ComputePipelineState;
- (MTLComputePipelineState)accelerationStructureComputePipelineState;
- (MTLDepthStencilState)ICB_DepthStencilState;
- (MTLLegacySVDevice)initWithBaseObject:(id)a3 parent:(id)a4;
- (MTLRenderPipelineState)ICB_Inherit_Buffers_VertexPipelineState;
- (MTLRenderPipelineState)ICB_Inherit_None_VertexPipelineState;
- (MTLRenderPipelineState)ICB_Inherit_PSO_VertexPipelineState;
- (id).cxx_construct;
- (id)_modifyComputePipelineDescriptor:(id)a3 options:(unint64_t *)a4;
- (id)_modifyRenderPipelineDescriptor:(id)a3 options:(unint64_t *)a4;
- (id)_modifyTilePipelineDescriptor:(id)a3 options:(unint64_t *)a4;
- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5;
- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4;
- (id)getDynamicLibraryForBaseObject:(id)a3;
- (id)getFunctionForBaseObject:(id)a3 library:(id)a4;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4;
- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5;
- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4;
- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5;
- (id)newAccelerationStructureWithDescriptor:(id)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4;
- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4;
- (id)newArgumentEncoderWithArguments:(id)a3;
- (id)newArgumentEncoderWithArguments:(id)a3 structType:(id *)a4;
- (id)newArgumentEncoderWithBufferBinding:(id)a3;
- (id)newArgumentEncoderWithLayout:(id)a3;
- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4;
- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5;
- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6;
- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6 deallocator:(id)a7;
- (id)newBufferWithDescriptor:(id)a3;
- (id)newBufferWithIOSurface:(__IOSurface *)a3;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 gpuAddress:(unint64_t)a5;
- (id)newCommandQueue;
- (id)newCommandQueueWithDescriptor:(id)a3;
- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3;
- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4;
- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newDagStringWithGraphs:(id)a3;
- (id)newDefaultLibrary;
- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4;
- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5;
- (id)newDynamicLibrary:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryFromURL:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
- (id)newHeapWithDescriptor:(id)a3;
- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5;
- (id)newInternalBufferWithLength:(unint64_t)a3 options:(unint64_t)a4;
- (id)newIntersectionFunctionTableWithDescriptor:(id)a3;
- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithCIFiltersForComputePipeline:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5;
- (id)newLibraryWithData:(id)a3 error:(id *)a4;
- (id)newLibraryWithFile:(id)a3 error:(id *)a4;
- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5;
- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5;
- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4;
- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4;
- (id)newLibraryWithURL:(id)a3 error:(id *)a4;
- (id)newModifyPluginData:(id)a3;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4;
- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6;
- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4;
- (id)newSharedTextureWithDescriptor:(id)a3;
- (id)newSharedTextureWithHandle:(id)a3;
- (id)newStageArgumentBuffer;
- (id)newStageBufferArgumentEncoder;
- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6;
- (id)newTextureWithDescriptor:(id)a3;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5;
- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6;
- (id)newVisibleFunctionTableWithDescriptor:(id)a3;
- (id)setGpuCompilerSPIOptionShaderValidation:(id)a3 options:(unint64_t)a4;
- (id)unwrapAndModifyComputePipelineDescriptor:(id *)a3 options:(unint64_t *)a4;
- (id)unwrapAndModifyMeshRenderPipelineDescriptor:(id)a3 options:(unint64_t *)a4;
- (id)unwrapAndModifyRenderPipelineDescriptor:(id *)a3 options:(unint64_t *)a4;
- (id)unwrapAndModifyTileRenderPipelineDescriptor:(id *)a3 options:(unint64_t *)a4;
- (id)unwrapStitchedLibraryDescriptor:(id)a3;
- (void)_modifyCompileOptions:(unint64_t *)a3;
- (void)_modifyMeshRenderPipelineDescriptor:(id)a3 options:(unint64_t *)a4;
- (void)_prepareBinaryLinkedFunctions:(id)a3;
- (void)_prepareInsertLibraries:(id)a3;
- (void)dealloc;
- (void)modifyFunctionDescriptor:(id)a3;
- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4;
- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4;
- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)onComputePipelineCreated:(id)a3;
- (void)onRenderPipelineCreated:(id)a3;
- (void)setWritableHeapsEnabled:(BOOL)a3;
- (void)validateRaytracing;
@end

@implementation MTLLegacySVDevice

- (MTLLegacySVDevice)initWithBaseObject:(id)a3 parent:(id)a4
{
  v43.receiver = self;
  v43.super_class = (Class)MTLLegacySVDevice;
  v5 = [(MTLToolsDevice *)&v43 initWithBaseObject:a3 parent:a4];
  if (!v5) {
    return (MTLLegacySVDevice *)v5;
  }
  if (MTLLegacySVLog(void)::onceToken != -1) {
    dispatch_once(&MTLLegacySVLog(void)::onceToken, &__block_literal_global_1);
  }
  if (os_log_type_enabled((os_log_t)MTLLegacySVLog(void)::logObject, OS_LOG_TYPE_DEBUG)) {
    -[MTLLegacySVDevice initWithBaseObject:parent:]((uint64_t)v5);
  }
  *((void *)v5 + 81) = [v5 newInternalBufferWithLength:1 options:256];
  *((void *)v5 + 33) = 0x100000008;
  *((_DWORD *)v5 + 68) = 3;
  *((_DWORD *)v5 + 70) = 1;
  [a3 supportsFamily:1001];
  uint64_t v6 = MTLGetEnvDefault();
  *((_DWORD *)v5 + 69) = v6 != 0;
  uint64_t v7 = 120403314;
  if (v6) {
    uint64_t v7 = 119800958;
  }
  *(void *)(v5 + 284) = v7 | *(void *)(v5 + 284) & 0xFFFFFFFFE8000200;
  int v8 = [a3 supportsArgumentBuffersTier2];
  uint64_t v9 = 0x1080000000;
  if (v8) {
    uint64_t v9 = 0x10A0000000;
  }
  *(void *)(v5 + 284) = v9 | *(void *)(v5 + 284) & 0xFFFFFFEF5FFFFFFFLL;
  int v10 = [a3 supportsRaytracing];
  uint64_t v11 = 0x100000000;
  if (!v10) {
    uint64_t v11 = 0;
  }
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFEFFFFFFFFLL | v11;
  int v12 = [a3 supportsFunctionPointers];
  uint64_t v13 = 0x400000000;
  if (!v12) {
    uint64_t v13 = 0;
  }
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFBFFFFFFFFLL | v13;
  v5[292] &= ~1u;
  int v14 = objc_msgSend((id)objc_msgSend(v5, "baseObject"), "supportsArgumentBuffersTier2");
  v15 = operator new(0x20uLL);
  *(void *)v15 = "Tier1";
  v15[2] = 0;
  *((void *)v15 + 2) = "Tier2";
  v15[6] = 1;
  v16 = getenv("MTL_SHADER_VALIDATION_MODE");
  if (v16)
  {
    v17 = v16;
    for (uint64_t i = 0; i != 8; i += 4)
    {
      if (!strcmp(v17, *(const char **)&v15[i]))
      {
        int v14 = v15[i + 2];
        goto LABEL_22;
      }
    }
    v19 = (FILE **)MEMORY[0x263EF8348];
    fprintf((FILE *)*MEMORY[0x263EF8348], "Invalid option for %s, valid options are:\n", "MTL_SHADER_VALIDATION_MODE");
    for (uint64_t j = 0; j != 8; j += 4)
      fprintf(*v19, "\t%s\n", *(const char **)&v15[j]);
  }
LABEL_22:
  operator delete(v15);
  if (v14 == 1)
  {
    uint64_t v22 = *(void *)(v5 + 284);
    *((_DWORD *)v5 + 69) = 1;
    unint64_t v21 = v22 & 0xFFFFFFF9FF3ECCEBLL | 0x600C10210;
    goto LABEL_26;
  }
  if (!v14)
  {
    unint64_t v21 = *(void *)(v5 + 284) & 0xFFFFFFFFFF3FEFFFLL | 0x1000;
LABEL_26:
    *(void *)(v5 + 284) = v21;
  }
  int v23 = [v5 supportsGlobalVariableRelocationCompute];
  uint64_t v24 = 0x40000000;
  if (!v23) {
    uint64_t v24 = 0;
  }
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFBFFFFFFFLL | v24;
  v5[292] &= ~4u;
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFFFFDLL | (2 * (MTLGetEnvDefault() != 0));
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 10);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 24);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFDFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 21);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFDFFFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 33);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFBFFFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 34);
  v5[292] = v5[292] & 0xF7 | (8 * (MTLGetEnvDefault() != 0));
  v25 = operator new(0x30uLL);
  *(void *)v25 = "default";
  v25[2] = 0;
  *((void *)v25 + 2) = "none";
  v25[6] = 0;
  *((void *)v25 + 4) = "full";
  v25[10] = 1;
  v26 = getenv("MTL_SHADER_VALIDATION_COMPILER_INLINING");
  if (v26)
  {
    v27 = v26;
    uint64_t v28 = 0;
    while (strcmp(v27, *(const char **)&v25[v28]))
    {
      v28 += 4;
      if (v28 == 12)
      {
        v29 = (FILE **)MEMORY[0x263EF8348];
        fprintf((FILE *)*MEMORY[0x263EF8348], "Invalid option for %s, valid options are:\n", "MTL_SHADER_VALIDATION_COMPILER_INLINING");
        for (uint64_t k = 0; k != 12; k += 4)
          fprintf(*v29, "\t%s\n", *(const char **)&v25[k]);
        goto LABEL_35;
      }
    }
    int v42 = v25[v28 + 2];
    operator delete(v25);
    if (!v42) {
      goto LABEL_36;
    }
    if (v42 == 1)
    {
      unint64_t v31 = *(void *)(v5 + 284) | 0x10;
      goto LABEL_37;
    }
  }
  else
  {
LABEL_35:
    operator delete(v25);
LABEL_36:
    unint64_t v31 = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFFFEFLL;
LABEL_37:
    *(void *)(v5 + 284) = v31;
  }
  v32 = operator new(0x20uLL);
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)(v32 + 8);
  __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v32 + 8);
  *(void *)v32 = "zerofill";
  v32[2] = 1;
  *((void *)v32 + 2) = "allow";
  v32[6] = 0;
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v32;
  MTLGetEnvCase<MTLBoundsCheck::FailMode>("MTL_SHADER_VALIDATION_FAIL_MODE", (_DWORD *)v5 + 69, (const char ***)&__p);
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v5[292] |= 2u;
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFFDFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 9);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFFFEFLL | (16 * (MTLGetEnvDefault() != 0));
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFFFFBLL | (4 * (MTLGetEnvDefault() != 0));
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFFFDFLL | (32 * (MTLGetEnvDefault() != 0));
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 6);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 8);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 11);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFFF7FLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 7);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 12);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 15);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFFDFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 13);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFFBFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 18);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFFBFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 22);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 23);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFDFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 25);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFFBFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 26);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFEFFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 28);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 30);
  v5[292] = v5[292] & 0xFE | (MTLGetEnvDefault() != 0);
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 31);
  v5[292] = v5[292] & 0xFD | (2 * (MTLGetEnvDefault() != 0));
  *(void *)(v5 + 284) = *(void *)(v5 + 284) & 0xFFFFFFFEFFFFFFFFLL | ((unint64_t)(MTLGetEnvDefault() != 0) << 32);
  v5[292] = v5[292] & 0xFB | (4 * (MTLGetEnvDefault() != 0));
  *((_DWORD *)v5 + 70) = MTLGetEnvDefault();
  v33 = getenv("MTL_SHADER_VALIDATION_ENABLE_PIPELINES");
  if (v33)
  {
    v34 = v33;
    if (MTLLegacySVLog(void)::onceToken != -1) {
      dispatch_once(&MTLLegacySVLog(void)::onceToken, &__block_literal_global_1);
    }
    v35 = MTLLegacySVLog(void)::logObject;
    if (os_log_type_enabled((os_log_t)MTLLegacySVLog(void)::logObject, OS_LOG_TYPE_DEBUG)) {
      -[MTLGPUDebugDevice initWithBaseObject:parent:](v35);
    }
    std::string::basic_string[abi:ne180100]<0>(&__p, v34);
    *((void *)v5 + 82) = MTLLegacySVParsePerPSOList(&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  v36 = getenv("MTL_SHADER_VALIDATION_DISABLE_PIPELINES");
  if (v36)
  {
    v37 = v36;
    if (MTLLegacySVLog(void)::onceToken != -1) {
      dispatch_once(&MTLLegacySVLog(void)::onceToken, &__block_literal_global_1);
    }
    v38 = MTLLegacySVLog(void)::logObject;
    if (os_log_type_enabled((os_log_t)MTLLegacySVLog(void)::logObject, OS_LOG_TYPE_DEBUG)) {
      -[MTLGPUDebugDevice initWithBaseObject:parent:](v38);
    }
    std::string::basic_string[abi:ne180100]<0>(&__p, v37);
    *((void *)v5 + 83) = MTLLegacySVParsePerPSOList(&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  *((void *)v5 + 84) = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v5 + 264 length:28 freeWhenDone:0];
  v39 = objc_msgSend(v5, "newModifyPluginData:", objc_msgSend(*((id *)v5 + 2), "pluginData"));
  [*((id *)v5 + 2) setPluginData:v39];

  if ((*(void *)(v5 + 284) & 0x810000) == 0x10000)
  {
    *((void *)v5 + 85) = objc_alloc_init(MEMORY[0x263EFF980]);
    id v40 = objc_alloc_init(MEMORY[0x263F127B8]);
    [v40 setDataType:60];
    [v40 setArrayLength:31];
    [v40 setIndex:0];
    [v40 setAccess:1];
    [*((id *)v5 + 85) addObject:v40];
  }
  if (MTLGetEnvDefault())
  {
    instrumentationHeapInit((MTLLegacySVDevice *)v5);
    indirectCommandBufferPipelineInit((MTLLegacySVDevice *)v5);
  }
  return (MTLLegacySVDevice *)v5;
}

- (void)dealloc
{
  if (MTLLegacySVLog(void)::onceToken != -1) {
    dispatch_once(&MTLLegacySVLog(void)::onceToken, &__block_literal_global_1);
  }
  if (os_log_type_enabled((os_log_t)MTLLegacySVLog(void)::logObject, OS_LOG_TYPE_DEBUG)) {
    -[MTLGPUDebugDevice dealloc]((uint64_t)self);
  }

  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVDevice;
  [(MTLToolsDevice *)&v3 dealloc];
}

- (id)newStageBufferArgumentEncoder
{
  return (id)[*((id *)self + 2) newArgumentEncoderWithArguments:*((void *)self + 85)];
}

- (id)newStageArgumentBuffer
{
  return (id)[*((id *)self + 2) newBufferWithLength:0x4000 options:256];
}

- (id)newInternalBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  return (id)[*((id *)self + 2) newBufferWithLength:a3 options:a4];
}

- (void)modifyFunctionDescriptor:(id)a3
{
  uint64_t v5 = [a3 pipelineOptions];
  [(MTLLegacySVDevice *)self _modifyCompileOptions:&v5];
  [a3 setPipelineOptions:v5 & 0xFFFFFFFFFFFEFFFCLL];
}

- (void)_modifyCompileOptions:(unint64_t *)a3
{
  unint64_t v3 = *a3;
  *a3 |= 0x1800003uLL;
  if ((*((unsigned char *)self + 284) & 0x10) != 0) {
    *a3 = v3 | 0x11800003;
  }
}

- (id)newModifyPluginData:(id)a3
{
  if (a3) {
    id v4 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:a3];
  }
  else {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  uint64_t v5 = v4;
  [v4 setObject:*((void *)self + 84) forKeyedSubscript:@"MTLBoundsCheck::Options"];
  return v5;
}

- (void)_prepareBinaryLinkedFunctions:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v3 = objc_msgSend(a3, "binaryFunctions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) prepareForBinaryFunctionUsage];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_prepareInsertLibraries:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(a3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) prepareForUsage];
      }
      while (v5 != v7);
      uint64_t v5 = [a3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_modifyRenderPipelineDescriptor:(id)a3 options:(unint64_t *)a4
{
  v22[1] = *MEMORY[0x263EF8340];
  v20 = 0;
  [a3 setForceSoftwareVertexFetch:1];
  objc_msgSend((id)objc_msgSend(a3, "vertexFunction"), "prepareForRenderPipelineUsage");
  objc_msgSend((id)objc_msgSend(a3, "fragmentFunction"), "prepareForRenderPipelineUsage");
  -[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", [a3 vertexLinkedFunctions]);
  -[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", [a3 fragmentLinkedFunctions]);
  objc_msgSend((id)objc_msgSend(a3, "meshFunction"), "prepareForRenderPipelineUsage");
  objc_msgSend((id)objc_msgSend(a3, "objectFunction"), "prepareForRenderPipelineUsage");
  -[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", [a3 meshLinkedFunctions]);
  uint64_t v7 = (void *)MEMORY[0x23ECD5710](-[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", [a3 objectLinkedFunctions]));
  id v8 = -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:error:", [a3 vertexFunction], objc_msgSend(a3, "vertexPreloadedLibraries"), &v20);
  long long v9 = v20;
  if (v20) {
    goto LABEL_5;
  }
  id v10 = v8;
  [a3 setVertexPreloadedLibraries:v8];
  [(MTLLegacySVDevice *)self _prepareInsertLibraries:v10];
  id v11 = -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:error:", [a3 fragmentFunction], objc_msgSend(a3, "fragmentPreloadedLibraries"), &v20);
  long long v9 = v20;
  if (v20) {
    goto LABEL_5;
  }
  id v12 = v11;
  [a3 setFragmentPreloadedLibraries:v11];
  [(MTLLegacySVDevice *)self _prepareInsertLibraries:v12];
  id v13 = -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:error:", [a3 meshFunction], objc_msgSend(a3, "meshPreloadedLibraries"), &v20);
  long long v9 = v20;
  if (v20
    || (id v14 = v13,
        [a3 setMeshPreloadedLibraries:v13],
        [(MTLLegacySVDevice *)self _prepareInsertLibraries:v14],
        v15 = -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:error:", [a3 objectFunction], objc_msgSend(a3, "objectPreloadedLibraries"), &v20), (long long v9 = v20) != 0))
  {
LABEL_5:
  }
  else
  {
    id v17 = v15;
    [a3 setObjectPreloadedLibraries:v15];
    [(MTLLegacySVDevice *)self _prepareInsertLibraries:v17];
    v18 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:20];
    uint64_t v19 = [v18 bytes];
    *(unsigned char *)uint64_t v19 = [a3 isAlphaToCoverageEnabled];
    *(_DWORD *)(v19 + 4) = [a3 maxVertexCallStackDepth];
    *(_DWORD *)(v19 + 8) = [a3 maxFragmentCallStackDepth];
    *(_DWORD *)(v19 + 12) = [a3 maxMeshCallStackDepth];
    *(_DWORD *)(v19 + 16) = [a3 maxObjectCallStackDepth];
    unint64_t v21 = @"MTLBoundsCheck::RenderPipelineData";
    v22[0] = v18;
    objc_msgSend(a3, "setPluginData:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, &v21, 1));

    objc_msgSend(a3, "setGpuCompilerSPIOptions:", objc_msgSend(NSDictionary, "dictionaryWithDictionary:", -[MTLLegacySVDevice setGpuCompilerSPIOptionShaderValidation:options:](self, "setGpuCompilerSPIOptionShaderValidation:options:", objc_msgSend(a3, "gpuCompilerSPIOptions"), *a4)));
    return v20;
  }
  return v9;
}

- (id)unwrapAndModifyRenderPipelineDescriptor:(id *)a3 options:(unint64_t *)a4
{
  *a3 = (id)[*a3 copy];
  [(MTLLegacySVDevice *)self _modifyCompileOptions:a4];
  [(MTLLegacySVDevice *)self _modifyRenderPipelineDescriptor:*a3 options:a4];
  id v7 = *a3;

  return [(MTLToolsDevice *)self unwrapMTLRenderPipelineDescriptor:v7];
}

- (id)setGpuCompilerSPIOptionShaderValidation:(id)a3 options:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v6, "setObject:forKey:", objc_msgSend(a3, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v10)), *(void *)(*((void *)&v13 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [a3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  if ((a4 & 0x800000000) != 0)
  {
    id v11 = @"enable-shader-validation";
    goto LABEL_12;
  }
  if ((a4 & 0x1000000000) != 0)
  {
    id v11 = @"disable-shader-validation";
LABEL_12:
    objc_msgSend(v6, "setObject:forKey:", objc_msgSend(MEMORY[0x263EFF9D0], "null"), v11);
  }
  return v6;
}

- (id)_modifyComputePipelineDescriptor:(id)a3 options:(unint64_t *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v12 = 0;
  objc_msgSend((id)objc_msgSend(a3, "computeFunction"), "prepareForComputePipelineUsage");
  id v7 = [(MTLLegacySVDevice *)self loadDynamicLibrariesForComputeDescriptor:a3 error:&v12];
  uint64_t v8 = v7;
  if (v12)
  {
  }
  else
  {
    [a3 setPreloadedLibraries:v7];

    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:4];
    uint64_t v10 = (_DWORD *)[v9 bytes];
    *uint64_t v10 = [a3 maxCallStackDepth];
    long long v13 = @"MTLBoundsCheck::ComputePipelineData";
    v14[0] = v9;
    objc_msgSend(a3, "setPluginData:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));

    -[MTLLegacySVDevice _prepareInsertLibraries:](self, "_prepareInsertLibraries:", [a3 preloadedLibraries]);
    -[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", [a3 linkedFunctions]);
    objc_msgSend(a3, "setGpuCompilerSPIOptions:", objc_msgSend(NSDictionary, "dictionaryWithDictionary:", -[MTLLegacySVDevice setGpuCompilerSPIOptionShaderValidation:options:](self, "setGpuCompilerSPIOptionShaderValidation:options:", objc_msgSend(a3, "gpuCompilerSPIOptions"), *a4)));
  }
  return v12;
}

- (id)unwrapAndModifyComputePipelineDescriptor:(id *)a3 options:(unint64_t *)a4
{
  id v7 = (id)[*a3 copy];
  *a3 = v7;
  [(MTLLegacySVDevice *)self _modifyComputePipelineDescriptor:v7 options:a4];
  [(MTLLegacySVDevice *)self _modifyCompileOptions:a4];
  id v8 = *a3;

  return [(MTLToolsDevice *)self unwrapMTLComputePipelineDescriptor:v8];
}

- (id)_modifyTilePipelineDescriptor:(id)a3 options:(unint64_t *)a4
{
  v14[1] = *MEMORY[0x263EF8340];
  id v12 = 0;
  objc_msgSend((id)objc_msgSend(a3, "tileFunction"), "prepareForRenderPipelineUsage");
  -[MTLLegacySVDevice _prepareBinaryLinkedFunctions:](self, "_prepareBinaryLinkedFunctions:", [a3 linkedFunctions]);
  id v7 = -[MTLLegacySVDevice loadDynamicLibrariesForFunction:insertLibraries:error:](self, "loadDynamicLibrariesForFunction:insertLibraries:error:", [a3 tileFunction], objc_msgSend(a3, "preloadedLibraries"), &v12);
  id v8 = v7;
  if (v12)
  {
  }
  else
  {
    [a3 setPreloadedLibraries:v7];

    -[MTLLegacySVDevice _prepareInsertLibraries:](self, "_prepareInsertLibraries:", [a3 preloadedLibraries]);
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:4];
    uint64_t v10 = (_DWORD *)[v9 bytes];
    *uint64_t v10 = [a3 maxCallStackDepth];
    long long v13 = @"MTLBoundsCheck::ComputePipelineData";
    v14[0] = v9;
    objc_msgSend(a3, "setPluginData:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1));

    objc_msgSend(a3, "setGpuCompilerSPIOptions:", objc_msgSend(NSDictionary, "dictionaryWithDictionary:", -[MTLLegacySVDevice setGpuCompilerSPIOptionShaderValidation:options:](self, "setGpuCompilerSPIOptionShaderValidation:options:", objc_msgSend(a3, "gpuCompilerSPIOptions"), *a4)));
  }
  return v12;
}

- (id)unwrapAndModifyTileRenderPipelineDescriptor:(id *)a3 options:(unint64_t *)a4
{
  id v7 = (id)[*a3 copy];
  *a3 = v7;
  [(MTLLegacySVDevice *)self _modifyTilePipelineDescriptor:v7 options:a4];
  [(MTLLegacySVDevice *)self _modifyCompileOptions:a4];
  id v8 = *a3;

  return [(MTLToolsDevice *)self unwrapMTLTileRenderPipelineDescriptor:v8];
}

- (void)_modifyMeshRenderPipelineDescriptor:(id)a3 options:(unint64_t *)a4
{
  v10[1] = *MEMORY[0x263EF8340];
  id v7 = (void *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:20];
  id v8 = (unsigned char *)[v7 bytes];
  *id v8 = [a3 isAlphaToCoverageEnabled];
  uint64_t v9 = @"MTLBoundsCheck::RenderPipelineData";
  v10[0] = v7;
  objc_msgSend(a3, "setPluginData:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));

  objc_msgSend(a3, "setGpuCompilerSPIOptions:", objc_msgSend(NSDictionary, "dictionaryWithDictionary:", -[MTLLegacySVDevice setGpuCompilerSPIOptionShaderValidation:options:](self, "setGpuCompilerSPIOptionShaderValidation:options:", objc_msgSend(a3, "gpuCompilerSPIOptions"), *a4)));
}

- (id)unwrapAndModifyMeshRenderPipelineDescriptor:(id)a3 options:(unint64_t *)a4
{
  id v6 = (id)[a3 copy];
  [(MTLLegacySVDevice *)self _modifyCompileOptions:a4];
  [(MTLLegacySVDevice *)self _modifyMeshRenderPipelineDescriptor:v6 options:a4];

  return [(MTLToolsDevice *)self unwrapMTLMeshRenderPipelineDescriptor:v6];
}

- (void)onRenderPipelineCreated:(id)a3
{
  LogInstrumentationFailures((MTLLegacySVImageData *)[a3 vertexFunctionData], (MTLDebugInstrumentationData *)objc_msgSend(a3, "vertexDebugInstrumentationData"));
  LogInstrumentationFailures((MTLLegacySVImageData *)[a3 fragmentFunctionData], (MTLDebugInstrumentationData *)objc_msgSend(a3, "fragmentDebugInstrumentationData"));
  uint64_t v4 = (MTLLegacySVImageData *)[a3 tileFunctionData];
  uint64_t v5 = (MTLDebugInstrumentationData *)[a3 tileDebugInstrumentationData];

  LogInstrumentationFailures(v4, v5);
}

- (void)onComputePipelineCreated:(id)a3
{
  uint64_t v4 = (MTLLegacySVImageData *)[a3 kernelFunctionData];
  uint64_t v5 = (MTLDebugInstrumentationData *)[a3 debugInstrumentationData];

  LogInstrumentationFailures(v4, v5);
}

- (id)newCommandQueueWithDescriptor:(id)a3
{
  instrumentationHeapInit(self);
  uint64_t v5 = objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newCommandQueueWithDescriptor:", a3);
  id v6 = [[MTLLegacySVCommandQueue alloc] initWithCommandQueue:v5 device:self];

  return v6;
}

- (id)newCommandQueue
{
  uint64_t v3 = [MEMORY[0x263F12818] commandQueueDescriptor];

  return [(MTLLegacySVDevice *)self newCommandQueueWithDescriptor:v3];
}

- (id)newCommandQueueWithMaxCommandBufferCount:(unint64_t)a3
{
  uint64_t v5 = (void *)[MEMORY[0x263F12818] commandQueueDescriptor];
  [v5 setMaxCommandBufferCount:a3];

  return [(MTLLegacySVDevice *)self newCommandQueueWithDescriptor:v5];
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  return [(MTLLegacySVDevice *)self newRenderPipelineStateWithDescriptor:a3 options:0 reflection:0 error:a4];
}

- (id)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  int v8 = a4;
  unint64_t v24 = a4;
  id v25 = a3;
  instrumentationHeapInit(self);
  id v11 = (void *)MEMORY[0x23ECD5710]();
  id v12 = (void *)[a3 vertexFunction];
  long long v13 = (void *)[a3 fragmentFunction];
  uint64_t v14 = [a3 label];
  uint64_t v15 = [a3 shaderValidation];
  [a3 shaderValidationState];
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v12, v13, 0, v14, v15, &v24);
  id v16 = [(MTLLegacySVDevice *)self unwrapAndModifyRenderPipelineDescriptor:&v25 options:&v24];
  uint64_t v23 = 0;
  id v17 = (void *)[*((id *)self + 2) newRenderPipelineStateWithDescriptor:v16 options:v24 reflection:&v23 error:a6];
  if (a6 && *a6) {
    id v18 = *a6;
  }
  if (v17)
  {
    uint64_t v19 = [MTLLegacySVRenderPipelineState alloc];
    v20 = [(MTLLegacySVRenderPipelineState *)v19 initWithRenderPipelineState:v17 descriptor:v25 unwrappedDescriptor:v16 reflection:v23 device:self pipelineOptions:v24];
  }
  else
  {
    v20 = 0;
  }

  if (a6 && *a6) {
    id v21 = *a6;
  }
  if (v20)
  {
    if (a5 && (*(void *)&v8 & 0x40003) != 0)
    {
      *a5 = [(MTLLegacySVRenderPipelineState *)v20 userReflection];
    }
    else if ((*((unsigned char *)self + 292) & 1) == 0)
    {
      [(MTLLegacySVRenderPipelineState *)v20 releaseReflection];
    }
    [(MTLLegacySVDevice *)self onRenderPipelineCreated:v20];
  }
  return v20;
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__MTLLegacySVDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_264E12DD8;
  v4[4] = a4;
  [(MTLLegacySVDevice *)self newRenderPipelineStateWithDescriptor:a3 options:0 completionHandler:v4];
}

uint64_t __76__MTLLegacySVDevice_newRenderPipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newRenderPipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  int v6 = a4;
  unint64_t v18 = a4;
  id v19 = a3;
  instrumentationHeapInit(self);
  BOOL v9 = (*(void *)&v6 & 0x40003) != 0;
  uint64_t v10 = (void *)MEMORY[0x23ECD5710]();
  id v11 = (void *)[a3 vertexFunction];
  id v12 = (void *)[a3 fragmentFunction];
  uint64_t v13 = [a3 label];
  uint64_t v14 = [a3 shaderValidation];
  [a3 shaderValidationState];
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v11, v12, 0, v13, v14, &v18);
  id v15 = [(MTLLegacySVDevice *)self unwrapAndModifyRenderPipelineDescriptor:&v19 options:&v18];
  id v16 = (void *)*((void *)self + 2);
  LOBYTE(v17) = v9;
  objc_msgSend(v16, "newRenderPipelineStateWithDescriptor:options:completionHandler:", MEMORY[0x263EF8330], 3221225472, __84__MTLLegacySVDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke, &unk_264E12E28, v19, v15, self, a5, v18, v17);
}

uint64_t __84__MTLLegacySVDevice_newRenderPipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v4 = [[MTLLegacySVRenderPipelineState alloc] initWithRenderPipelineState:a2 descriptor:*(void *)(a1 + 32) unwrappedDescriptor:*(void *)(a1 + 40) reflection:a3 device:*(void *)(a1 + 48) pipelineOptions:*(void *)(a1 + 64)];
  }
  else {
    uint64_t v4 = 0;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    [(MTLLegacySVRenderPipelineState *)v4 userReflection];
  }
  else if ((*(unsigned char *)(*(void *)(a1 + 48) + 292) & 1) == 0)
  {
    [(MTLLegacySVRenderPipelineState *)v4 releaseReflection];
  }
  [*(id *)(a1 + 48) onRenderPipelineCreated:v4];
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v5();
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  int v8 = a4;
  unint64_t v21 = a4;
  id v22 = a3;
  instrumentationHeapInit(self);
  id v11 = (void *)[a3 tileFunction];
  uint64_t v12 = [a3 label];
  uint64_t v13 = [a3 shaderValidation];
  [a3 shaderValidationState];
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v11, 0, 0, v12, v13, &v21);
  id v14 = [(MTLLegacySVDevice *)self unwrapAndModifyTileRenderPipelineDescriptor:&v22 options:&v21];
  uint64_t v20 = 0;
  uint64_t v15 = [*((id *)self + 2) newRenderPipelineStateWithTileDescriptor:v14 options:v21 reflection:&v20 error:a6];
  if (!v15) {
    return 0;
  }
  id v16 = (void *)v15;
  uint64_t v17 = [MTLLegacySVRenderPipelineState alloc];
  unint64_t v18 = [(MTLLegacySVRenderPipelineState *)v17 initWithRenderPipelineState:v16 tileDescriptor:v22 reflection:v20 device:self pipelineOptions:v21];

  if (a5 && (*(void *)&v8 & 0x40003) != 0)
  {
    *a5 = [(MTLLegacySVRenderPipelineState *)v18 userReflection];
  }
  else if ((*((unsigned char *)self + 292) & 1) == 0)
  {
    [(MTLLegacySVRenderPipelineState *)v18 releaseReflection];
  }
  [(MTLLegacySVDevice *)self onRenderPipelineCreated:v18];
  return v18;
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__MTLLegacySVDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_264E12DD8;
  v4[4] = a4;
  [(MTLLegacySVDevice *)self newRenderPipelineStateWithTileDescriptor:a3 options:0 completionHandler:v4];
}

uint64_t __80__MTLLegacySVDevice_newRenderPipelineStateWithTileDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)newRenderPipelineStateWithTileDescriptor:(id)a3 error:(id *)a4
{
  return [(MTLLegacySVDevice *)self newRenderPipelineStateWithTileDescriptor:a3 options:0 reflection:0 error:a4];
}

- (void)newRenderPipelineStateWithTileDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v11 = a3;
  unint64_t v10 = a4;
  instrumentationHeapInit(self);
  id v7 = (void *)[a3 tileFunction];
  uint64_t v8 = [a3 label];
  uint64_t v9 = [a3 shaderValidation];
  [a3 shaderValidationState];
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v7, 0, 0, v8, v9, &v10);
  objc_msgSend(*((id *)self + 2), "newRenderPipelineStateWithTileDescriptor:options:completionHandler:", -[MTLLegacySVDevice unwrapAndModifyTileRenderPipelineDescriptor:options:](self, "unwrapAndModifyTileRenderPipelineDescriptor:options:", &v11, &v10));
}

void __88__MTLLegacySVDevice_newRenderPipelineStateWithTileDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v4 = [[MTLLegacySVRenderPipelineState alloc] initWithRenderPipelineState:a2 tileDescriptor:*(void *)(a1 + 32) reflection:a3 device:*(void *)(a1 + 40) pipelineOptions:*(void *)(a1 + 56)];
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;
  if (*(unsigned char *)(a1 + 64))
  {
    [(MTLLegacySVRenderPipelineState *)v4 userReflection];
  }
  else if ((*(unsigned char *)(*(void *)(a1 + 40) + 292) & 1) == 0)
  {
    [(MTLLegacySVRenderPipelineState *)v4 releaseReflection];
  }
  [*(id *)(a1 + 40) onRenderPipelineCreated:v5];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  int v8 = a4;
  unint64_t v23 = a4;
  instrumentationHeapInit(self);
  id v11 = (void *)[a3 meshFunction];
  uint64_t v12 = (void *)[a3 fragmentFunction];
  uint64_t v13 = (void *)[a3 objectFunction];
  uint64_t v14 = [a3 label];
  uint64_t v15 = [a3 shaderValidation];
  [a3 shaderValidationState];
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v11, v12, v13, v14, v15, &v23);
  id v16 = [(MTLLegacySVDevice *)self unwrapAndModifyMeshRenderPipelineDescriptor:a3 options:&v23];
  uint64_t v22 = 0;
  uint64_t v17 = [*((id *)self + 2) newRenderPipelineStateWithMeshDescriptor:v16 options:v23 reflection:&v22 error:a6];
  if (!v17) {
    return 0;
  }
  unint64_t v18 = (void *)v17;
  id v19 = [MTLLegacySVRenderPipelineState alloc];
  uint64_t v20 = [(MTLLegacySVRenderPipelineState *)v19 initWithRenderPipelineState:v18 meshDescriptor:a3 unwrappedDescriptor:v16 reflection:v22 device:self pipelineOptions:v23];

  if (a5 && (*(void *)&v8 & 0x40003) != 0)
  {
    *a5 = [(MTLLegacySVRenderPipelineState *)v20 userReflection];
  }
  else if ((*((unsigned char *)self + 292) & 1) == 0)
  {
    [(MTLLegacySVRenderPipelineState *)v20 releaseReflection];
  }
  [(MTLLegacySVDevice *)self onRenderPipelineCreated:v20];
  return v20;
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__MTLLegacySVDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_264E12DD8;
  v4[4] = a4;
  [(MTLLegacySVDevice *)self newRenderPipelineStateWithMeshDescriptor:a3 options:0 completionHandler:v4];
}

uint64_t __80__MTLLegacySVDevice_newRenderPipelineStateWithMeshDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)newRenderPipelineStateWithMeshDescriptor:(id)a3 error:(id *)a4
{
  return [(MTLLegacySVDevice *)self newRenderPipelineStateWithMeshDescriptor:a3 options:0 reflection:0 error:a4];
}

- (void)newRenderPipelineStateWithMeshDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  unint64_t v12 = a4;
  instrumentationHeapInit(self);
  id v7 = (void *)[a3 meshFunction];
  int v8 = (void *)[a3 fragmentFunction];
  uint64_t v9 = (void *)[a3 objectFunction];
  uint64_t v10 = [a3 label];
  uint64_t v11 = [a3 shaderValidation];
  [a3 shaderValidationState];
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v7, v8, v9, v10, v11, &v12);
  [(MTLLegacySVDevice *)self unwrapAndModifyMeshRenderPipelineDescriptor:a3 options:&v12];
  objc_msgSend(*((id *)self + 2), "newRenderPipelineStateWithMeshDescriptor:options:completionHandler:");
}

void __88__MTLLegacySVDevice_newRenderPipelineStateWithMeshDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v4 = [[MTLLegacySVRenderPipelineState alloc] initWithRenderPipelineState:a2 meshDescriptor:*(void *)(a1 + 32) unwrappedDescriptor:*(void *)(a1 + 40) reflection:a3 device:*(void *)(a1 + 48) pipelineOptions:*(void *)(a1 + 64)];
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;
  if (*(unsigned char *)(a1 + 72))
  {
    [(MTLLegacySVRenderPipelineState *)v4 userReflection];
  }
  else if ((*(unsigned char *)(*(void *)(a1 + 48) + 292) & 1) == 0)
  {
    [(MTLLegacySVRenderPipelineState *)v4 releaseReflection];
  }
  [*(id *)(a1 + 48) onRenderPipelineCreated:v5];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 error:(id *)a4
{
  return [(MTLLegacySVDevice *)self newComputePipelineStateWithDescriptor:a3 options:0 reflection:0 error:a4];
}

- (id)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  int v8 = a4;
  unint64_t v21 = a4;
  id v22 = a3;
  instrumentationHeapInit(self);
  uint64_t v11 = (void *)[a3 computeFunction];
  uint64_t v12 = [a3 label];
  uint64_t v13 = [a3 shaderValidation];
  [a3 shaderValidationState];
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v11, 0, 0, v12, v13, &v21);
  id v14 = [(MTLLegacySVDevice *)self unwrapAndModifyComputePipelineDescriptor:&v22 options:&v21];
  uint64_t v20 = 0;
  uint64_t v15 = [*((id *)self + 2) newComputePipelineStateWithDescriptor:v14 options:v21 reflection:&v20 error:a6];
  if (!v15) {
    return 0;
  }
  id v16 = (void *)v15;
  uint64_t v17 = [MTLLegacySVComputePipelineState alloc];
  unint64_t v18 = [(MTLLegacySVComputePipelineState *)v17 initWithComputePipelineState:v16 descriptor:v22 unwrappedDescriptor:v14 reflection:v20 device:self pipelineOptions:v21];

  if (a5 && (*(void *)&v8 & 0x40003) != 0)
  {
    *a5 = [(MTLLegacySVComputePipelineState *)v18 userReflection];
  }
  else if ((*((unsigned char *)self + 292) & 1) == 0)
  {
    [(MTLLegacySVComputePipelineState *)v18 releaseReflection];
  }
  [(MTLLegacySVDevice *)self onComputePipelineCreated:v18];
  return v18;
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 completionHandler:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__MTLLegacySVDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke;
  v4[3] = &unk_264E12E50;
  v4[4] = a4;
  [(MTLLegacySVDevice *)self newComputePipelineStateWithDescriptor:a3 options:0 completionHandler:v4];
}

uint64_t __77__MTLLegacySVDevice_newComputePipelineStateWithDescriptor_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)newComputePipelineStateWithDescriptor:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  int v6 = a4;
  id v16 = a3;
  unint64_t v15 = a4;
  instrumentationHeapInit(self);
  BOOL v9 = (*(void *)&v6 & 0x40003) != 0;
  uint64_t v10 = (void *)[a3 computeFunction];
  uint64_t v11 = [a3 label];
  uint64_t v12 = [a3 shaderValidation];
  [a3 shaderValidationState];
  MTLLegacySVSetValidationChecksOptions((uint64_t)self, v10, 0, 0, v11, v12, &v15);
  id v13 = [(MTLLegacySVDevice *)self unwrapAndModifyComputePipelineDescriptor:&v16 options:&v15];
  LOBYTE(v14) = v9;
  objc_msgSend(*((id *)self + 2), "newComputePipelineStateWithDescriptor:options:completionHandler:", MEMORY[0x263EF8330], 3221225472, __85__MTLLegacySVDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke, &unk_264E13B70, v16, v13, self, a5, v15, v14);
}

void __85__MTLLegacySVDevice_newComputePipelineStateWithDescriptor_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v4 = [[MTLLegacySVComputePipelineState alloc] initWithComputePipelineState:a2 descriptor:*(void *)(a1 + 32) unwrappedDescriptor:*(void *)(a1 + 40) reflection:a3 device:*(void *)(a1 + 48) pipelineOptions:*(void *)(a1 + 64)];
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v4;
  if (*(unsigned char *)(a1 + 72))
  {
    [(MTLLegacySVComputePipelineState *)v4 userReflection];
  }
  else if ((*(unsigned char *)(*(void *)(a1 + 48) + 292) & 1) == 0)
  {
    [(MTLLegacySVComputePipelineState *)v4 releaseReflection];
  }
  [*(id *)(a1 + 48) onComputePipelineCreated:v5];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)newComputePipelineStateWithFunction:(id)a3 error:(id *)a4
{
  id v7 = objc_opt_new();
  [v7 setComputeFunction:a3];
  id v8 = [(MTLLegacySVDevice *)self newComputePipelineStateWithDescriptor:v7 error:a4];

  return v8;
}

- (void)newComputePipelineStateWithFunction:(id)a3 completionHandler:(id)a4
{
  id v7 = (id)objc_opt_new();
  [v7 setComputeFunction:a3];
  [(MTLLegacySVDevice *)self newComputePipelineStateWithDescriptor:v7 completionHandler:a4];
}

- (void)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = (id)objc_opt_new();
  [v9 setComputeFunction:a3];
  [(MTLLegacySVDevice *)self newComputePipelineStateWithDescriptor:v9 options:a4 completionHandler:a5];
}

- (id)newComputePipelineStateWithFunction:(id)a3 options:(unint64_t)a4 reflection:(id *)a5 error:(id *)a6
{
  uint64_t v11 = objc_opt_new();
  [v11 setComputeFunction:a3];
  id v12 = [(MTLLegacySVDevice *)self newComputePipelineStateWithDescriptor:v11 options:a4 reflection:a5 error:a6];

  return v12;
}

- (id)newIndirectCommandBufferWithDescriptor:(id)a3 maxCommandCount:(unint64_t)a4 options:(unint64_t)a5
{
  if ((*((unsigned char *)self + 287) & 0x20) != 0)
  {
    indirectCommandBufferPipelineInit(self);
    uint64_t v10 = (void *)[a3 copy];
    [v10 setMaxVertexBufferBindCount:31];
    [v10 setMaxFragmentBufferBindCount:31];
    [v10 setMaxKernelBufferBindCount:31];
    if (([v10 inheritPipelineState] & 1) == 0) {
      [v10 setInheritBuffers:0];
    }
    if (([v10 commandTypes] & 0x60) != 0) {
      [v10 setInheritBuffers:0];
    }
    uint64_t v11 = (void *)[*((id *)self + 2) newIndirectCommandBufferWithDescriptor:v10 maxCommandCount:a4 options:a5 & 0xFFFFFFFFFFFFFF0FLL];
    id v12 = [[MTLLegacySVIndirectCommandBuffer alloc] initWithIndirectCommandBuffer:v11 descriptor:a3 maxCommandCount:a4 resourceOptions:a5 device:self];

    return v12;
  }
  else
  {
    MTLReportFailure();
    return 0;
  }
}

- (MTLRenderPipelineState)ICB_Inherit_PSO_VertexPipelineState
{
  return (MTLRenderPipelineState *)*((void *)self + 88);
}

- (MTLRenderPipelineState)ICB_Inherit_None_VertexPipelineState
{
  return (MTLRenderPipelineState *)*((void *)self + 89);
}

- (MTLRenderPipelineState)ICB_Inherit_Buffers_VertexPipelineState
{
  return (MTLRenderPipelineState *)*((void *)self + 90);
}

- (MTLDepthStencilState)ICB_DepthStencilState
{
  return (MTLDepthStencilState *)*((void *)self + 91);
}

- (MTLComputePipelineState)ICB_Inherit_PSO_ComputePipelineState
{
  return (MTLComputePipelineState *)*((void *)self + 92);
}

- (MTLComputePipelineState)ICB_Inherit_None_ComputePipelineState
{
  return (MTLComputePipelineState *)*((void *)self + 93);
}

- (MTLComputePipelineState)ICB_Inherit_Buffers_ComputePipelineState
{
  return (MTLComputePipelineState *)*((void *)self + 94);
}

- (MTLComputePipelineState)ICB_Inherit_Both_ComputePipelineState
{
  return (MTLComputePipelineState *)*((void *)self + 95);
}

- (id)newLibraryWithCIFiltersForComputePipeline:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  instrumentationHeapInit(self);
  id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "baseObject"));
      }
      uint64_t v11 = [a3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }
  char v14 = objc_opt_respondsToSelector();
  unint64_t v15 = (void *)*((void *)self + 2);
  if (v14) {
    id v16 = (void *)[v15 newLibraryWithCIFiltersForComputePipeline:v9 imageFilterFunctionInfo:a4 error:a5];
  }
  else {
    id v16 = (void *)[v15 newLibraryWithCIFilters:v9 imageFilterFunctionInfo:a4 error:a5];
  }
  uint64_t v17 = v16;
  if (!v16) {
    return 0;
  }
  [v16 setShaderValidationEnabled:1];
  unint64_t v18 = [[MTLLegacySVLibrary alloc] initWithLibrary:v17 device:self];

  return v18;
}

- (id)newLibraryWithImageFilterFunctionsSPI:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  instrumentationHeapInit(self);
  id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13++), "baseObject"));
      }
      while (v11 != v13);
      uint64_t v11 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
  char v14 = (void *)[*((id *)self + 2) newLibraryWithImageFilterFunctionsSPI:v9 imageFilterFunctionInfo:a4 error:a5];
  if (!v14) {
    return 0;
  }
  unint64_t v15 = v14;
  [v14 setShaderValidationEnabled:1];
  id v16 = [[MTLLegacySVLibrary alloc] initWithLibrary:v15 device:self];

  return v16;
}

- (id)newLibraryWithCIFilters:(id)a3 imageFilterFunctionInfo:(id *)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  instrumentationHeapInit(self);
  id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(a3, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v10 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(a3);
        }
        objc_msgSend(v9, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v13++), "baseObject"));
      }
      while (v11 != v13);
      uint64_t v11 = [a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }
  char v14 = (void *)[*((id *)self + 2) newLibraryWithCIFilters:v9 imageFilterFunctionInfo:a4 error:a5];
  if (!v14) {
    return 0;
  }
  unint64_t v15 = v14;
  [v14 setShaderValidationEnabled:1];
  id v16 = [[MTLLegacySVLibrary alloc] initWithLibrary:v15 device:self];

  return v16;
}

- (id)newDefaultLibrary
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newDefaultLibrary];
  if (result)
  {
    id v4 = result;
    [result setShaderValidationEnabled:1];
    uint64_t v5 = [[MTLLegacySVLibrary alloc] initWithLibrary:v4 device:self];

    return v5;
  }
  return result;
}

- (id)newDefaultLibraryWithBundle:(id)a3 error:(id *)a4
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newDefaultLibraryWithBundle:a3 error:a4];
  if (result)
  {
    id v8 = result;
    [result setShaderValidationEnabled:1];
    id v9 = [[MTLLegacySVLibrary alloc] initWithLibrary:v8 device:self];

    return v9;
  }
  return result;
}

- (id)newLibraryWithDAG:(id)a3 functions:(id)a4 error:(id *)a5
{
  id v8 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:a4];
  if ([v8 count])
  {
    uint64_t v9 = 0;
    unsigned int v10 = 1;
    do
    {
      objc_msgSend(v8, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v8, "objectAtIndexedSubscript:", v9), "baseObject"), v9);
      uint64_t v9 = v10;
    }
    while ([v8 count] > (unint64_t)v10++);
  }
  instrumentationHeapInit(self);
  uint64_t v12 = (void *)[*((id *)self + 2) newLibraryWithDAG:a3 functions:v8 error:a5];
  if (v12)
  {
    uint64_t v13 = v12;
    [v12 setShaderValidationEnabled:1];
    char v14 = [[MTLLegacySVLibrary alloc] initWithLibrary:v13 device:self];
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (id)unwrapStitchedLibraryDescriptor:(id)a3
{
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithArray:", objc_msgSend(a3, "functions"));
  if ([v4 count])
  {
    uint64_t v5 = 0;
    unsigned int v6 = 1;
    do
    {
      objc_msgSend(v4, "setObject:atIndexedSubscript:", objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", v5), "baseObject"), v5);
      uint64_t v5 = v6;
    }
    while ([v4 count] > (unint64_t)v6++);
  }
  [a3 setFunctions:v4];

  return a3;
}

- (id)newLibraryWithStitchedDescriptor:(id)a3 error:(id *)a4
{
  id v6 = [(MTLLegacySVDevice *)self unwrapStitchedLibraryDescriptor:a3];
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newLibraryWithStitchedDescriptor:v6 error:a4];
  if (result)
  {
    id v8 = result;
    [result setShaderValidationEnabled:1];
    uint64_t v9 = [[MTLLegacySVLibrary alloc] initWithLibrary:v8 device:self];

    return v9;
  }
  return result;
}

- (void)newLibraryWithStitchedDescriptor:(id)a3 completionHandler:(id)a4
{
  id v6 = [(MTLLegacySVDevice *)self unwrapStitchedLibraryDescriptor:a3];
  id v7 = (void *)*((void *)self + 2);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__MTLLegacySVDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke;
  v8[3] = &unk_264E12EA0;
  v8[4] = self;
  v8[5] = a4;
  [v7 newLibraryWithStitchedDescriptor:v6 completionHandler:v8];
}

uint64_t __72__MTLLegacySVDevice_newLibraryWithStitchedDescriptor_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    [a2 setShaderValidationEnabled:1];
    [[MTLLegacySVLibrary alloc] initWithLibrary:a2 device:*(void *)(a1 + 32)];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (id)newLibraryWithStitchedDescriptorSPI:(id)a3 error:(id *)a4
{
  id v6 = [(MTLLegacySVDevice *)self unwrapStitchedLibraryDescriptor:a3];
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newLibraryWithStitchedDescriptorSPI:v6 error:a4];
  if (result)
  {
    id v8 = result;
    [result setShaderValidationEnabled:1];
    uint64_t v9 = [[MTLLegacySVLibrary alloc] initWithLibrary:v8 device:self];

    return v9;
  }
  return result;
}

- (id)newDagStringWithGraphs:(id)a3
{
  return (id)[*((id *)self + 2) newDagStringWithGraphs:a3];
}

- (id)newLibraryWithFile:(id)a3 error:(id *)a4
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newLibraryWithFile:a3 error:a4];
  if (result)
  {
    id v8 = result;
    [result setShaderValidationEnabled:1];
    uint64_t v9 = [[MTLLegacySVLibrary alloc] initWithLibrary:v8 device:self];

    return v9;
  }
  return result;
}

- (id)newLibraryWithData:(id)a3 error:(id *)a4
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newLibraryWithData:a3 error:a4];
  if (result)
  {
    id v8 = result;
    [result setShaderValidationEnabled:1];
    uint64_t v9 = [[MTLLegacySVLibrary alloc] initWithLibrary:v8 device:self];

    return v9;
  }
  return result;
}

- (id)newLibraryWithURL:(id)a3 error:(id *)a4
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newLibraryWithURL:a3 error:a4];
  if (result)
  {
    id v8 = result;
    [result setShaderValidationEnabled:1];
    uint64_t v9 = [[MTLLegacySVLibrary alloc] initWithLibrary:v8 device:self];

    return v9;
  }
  return result;
}

- (id)newLibraryWithSource:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = DebugCompileOptions((MTLGPUDebugDevice *)self, (MTLCompileOptions *)a4);
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newLibraryWithSource:a3 options:v8 error:a5];
  if (result)
  {
    id v10 = result;
    [result setShaderValidationEnabled:1];
    uint64_t v11 = [[MTLLegacySVLibrary alloc] initWithLibrary:v10 device:self];

    return v11;
  }
  return result;
}

- (void)newLibraryWithSource:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8 = DebugCompileOptions((MTLGPUDebugDevice *)self, (MTLCompileOptions *)a4);
  uint64_t v9 = (void *)*((void *)self + 2);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __68__MTLLegacySVDevice_newLibraryWithSource_options_completionHandler___block_invoke;
  v10[3] = &unk_264E12EA0;
  v10[4] = self;
  v10[5] = a5;
  [v9 newLibraryWithSource:a3 options:v8 completionHandler:v10];
}

uint64_t __68__MTLLegacySVDevice_newLibraryWithSource_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [[MTLLegacySVLibrary alloc] initWithLibrary:a2 device:*(void *)(a1 + 32)];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (id)newDynamicLibraryWithURL:(id)a3 error:(id *)a4
{
  return [(MTLLegacySVDevice *)self newDynamicLibraryWithURL:a3 options:2 error:a4];
}

- (id)newDynamicLibraryFromURL:(id)a3 error:(id *)a4
{
  return [(MTLLegacySVDevice *)self newDynamicLibraryWithURL:a3 options:2 error:a4];
}

- (id)newDynamicLibraryWithURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  unint64_t v8 = a4 | 2;
  char v14 = self;
  instrumentationHeapInit(self);
  uint64_t v9 = [*((id *)self + 2) newDynamicLibraryWithURL:a3 options:v8 error:a5];
  if (!v9) {
    return 0;
  }
  id v10 = (void *)v9;
  uint64_t v11 = (void *)*((void *)self + 7);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = ___ZZL18WrapDynamicLibraryIZ60__MTLLegacySVDevice_newDynamicLibraryWithURL_options_error__E4__13EP25MTLLegacySVDynamicLibraryP17MTLLegacySVDeviceT_ENKUlS5_E_clIPU28objcproto17MTLDynamicLibrary11objc_objectEEDaS5__block_invoke;
  v15[3] = &unk_264E12F40;
  v15[4] = v10;
  v15[5] = &v14;
  uint64_t v12 = (void *)[v11 getCachedObjectForKey:v10 onMiss:v15];

  return v12;
}

- (id)newDynamicLibrary:(id)a3 error:(id *)a4
{
  uint64_t v12 = self;
  instrumentationHeapInit(self);
  uint64_t v7 = objc_msgSend(*((id *)self + 2), "newDynamicLibrary:error:", objc_msgSend(a3, "baseObject"), a4);
  if (!v7) {
    return 0;
  }
  unint64_t v8 = (void *)v7;
  uint64_t v9 = (void *)*((void *)self + 7);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = ___ZZL18WrapDynamicLibraryIZ45__MTLLegacySVDevice_newDynamicLibrary_error__E4__14EP25MTLLegacySVDynamicLibraryP17MTLLegacySVDeviceT_ENKUlS5_E_clIPU28objcproto17MTLDynamicLibrary11objc_objectEEDaS5__block_invoke;
  v13[3] = &unk_264E12F40;
  v13[4] = v8;
  v13[5] = &v12;
  id v10 = (void *)[v9 getCachedObjectForKey:v8 onMiss:v13];

  return v10;
}

- (id)newDynamicLibrary:(id)a3 computeDescriptor:(id)a4 error:(id *)a5
{
  id v14 = a4;
  unint64_t v15 = self;
  instrumentationHeapInit(self);
  v16[0] = 0;
  id v8 = [(MTLLegacySVDevice *)self unwrapAndModifyComputePipelineDescriptor:&v14 options:v16];
  MTLDynamicLibraryLoadOptionsFromPipelineOptions();
  uint64_t v9 = objc_msgSend(*((id *)self + 2), "newDynamicLibrary:computeDescriptor:error:", objc_msgSend(a3, "baseObject", v14, v15), v8, a5);
  if (!v9) {
    return 0;
  }
  id v10 = (void *)v9;
  uint64_t v11 = (void *)*((void *)self + 7);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = ___ZZL18WrapDynamicLibraryIZ63__MTLLegacySVDevice_newDynamicLibrary_computeDescriptor_error__E4__15EP25MTLLegacySVDynamicLibraryP17MTLLegacySVDeviceT_ENKUlS5_E_clIPU28objcproto17MTLDynamicLibrary11objc_objectEEDaS5__block_invoke;
  v16[3] = &unk_264E12F40;
  v16[4] = v10;
  v16[5] = &v15;
  uint64_t v12 = (void *)[v11 getCachedObjectForKey:v10 onMiss:v16];

  return v12;
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 error:(id *)a4
{
  uint64_t v7 = [a3 computeFunction];
  uint64_t v8 = [a3 preloadedLibraries];

  return [(MTLLegacySVDevice *)self loadDynamicLibrariesForFunction:v7 insertLibraries:v8 options:0 error:a4];
}

- (id)loadDynamicLibrariesForComputeDescriptor:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  uint64_t v8 = [a3 computeFunction];
  uint64_t v9 = [a3 preloadedLibraries];

  return [(MTLLegacySVDevice *)self loadDynamicLibrariesForFunction:v8 insertLibraries:v9 options:0 error:a5];
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 error:(id *)a5
{
  return [(MTLLegacySVDevice *)self loadDynamicLibrariesForFunction:a3 insertLibraries:a4 options:0 error:a5];
}

- (id)loadDynamicLibrariesForFunction:(id)a3 insertLibraries:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  if (!a3) {
    return 0;
  }
  context = (void *)MEMORY[0x23ECD5710](self, a2);
  unint64_t v11 = a5 | 2;
  if (a4)
  {
    id v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a4, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    uint64_t v13 = [a4 countByEnumeratingWithState:&v35 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v36 != v15) {
            objc_enumerationMutation(a4);
          }
          objc_msgSend(v12, "addObject:", objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "baseObject"));
        }
        uint64_t v14 = [a4 countByEnumeratingWithState:&v35 objects:v42 count:16];
      }
      while (v14);
    }
  }
  else
  {
    id v12 = 0;
  }
  long long v18 = objc_msgSend(*((id *)self + 2), "loadDynamicLibrariesForFunction:insertLibraries:options:error:", objc_msgSend(a3, "baseObject"), v12, v11, a6);
  if (v18)
  {
    long long v19 = v18;
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v18, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          unint64_t v24 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          v39 = self;
          instrumentationHeapInit(self);
          id v25 = v24;
          if (v25)
          {
            v26 = v25;
            v27 = (void *)*((void *)self + 7);
            v40[0] = MEMORY[0x263EF8330];
            v40[1] = 3221225472;
            v40[2] = ___ZZL18WrapDynamicLibraryIZ83__MTLLegacySVDevice_loadDynamicLibrariesForFunction_insertLibraries_options_error__E4__16EP25MTLLegacySVDynamicLibraryP17MTLLegacySVDeviceT_ENKUlS5_E_clIPU28objcproto17MTLDynamicLibrary11objc_objectEEDaS5__block_invoke;
            v40[3] = &unk_264E12F40;
            v40[4] = v26;
            v40[5] = &v39;
            uint64_t v28 = [v27 getCachedObjectForKey:v26 onMiss:v40];
          }
          else
          {
            uint64_t v28 = 0;
          }
          [v17 addObject:v28];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v41 count:16];
      }
      while (v21);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  return v17;
}

- (id)newBinaryArchiveWithDescriptor:(id)a3 error:(id *)a4
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryArchiveWithDescriptor:error:", a3, a4);
  if (result)
  {
    id v6 = result;
    uint64_t v7 = [[MTLLegacySVBinaryArchive alloc] initWithBinaryArchive:result device:self];

    return v7;
  }
  return result;
}

- (id)newBinaryLibraryWithOptions:(unint64_t)a3 url:(id)a4 error:(id *)a5
{
  id result = (id)objc_msgSend(-[MTLToolsObject baseObject](self, "baseObject"), "newBinaryLibraryWithOptions:url:error:", a3, a4, a5);
  if (result)
  {
    id v7 = result;
    uint64_t v8 = [[MTLLegacySVBinaryArchive alloc] initWithBinaryArchive:result device:self];

    return v8;
  }
  return result;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newBufferWithLength:a3 options:a4];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [[MTLLegacySVBuffer alloc] initWithBuffer:result device:self];

    return v9;
  }
  return result;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newBufferWithBytes:a3 length:a4 options:a5];
  if (result)
  {
    id v10 = result;
    unint64_t v11 = [[MTLLegacySVBuffer alloc] initWithBuffer:result device:self];

    return v11;
  }
  return result;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 deallocator:(id)a6
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newBufferWithBytesNoCopy:a3 length:a4 options:a5 deallocator:a6];
  if (result)
  {
    id v12 = result;
    uint64_t v13 = [[MTLLegacySVBuffer alloc] initWithBuffer:result device:self];

    return v13;
  }
  return result;
}

- (id)newBufferWithIOSurface:(__IOSurface *)a3
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newBufferWithIOSurface:a3];
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLLegacySVBuffer alloc] initWithBuffer:result device:self];

    return v7;
  }
  return result;
}

- (id)newBufferWithLength:(unint64_t)a3 options:(unint64_t)a4 gpuAddress:(unint64_t)a5
{
  return 0;
}

- (id)newBufferWithBytes:(const void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6
{
  return 0;
}

- (id)newBufferWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 options:(unint64_t)a5 gpuAddress:(unint64_t)a6 deallocator:(id)a7
{
  return 0;
}

- (id)newBufferWithDescriptor:(id)a3
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newBufferWithDescriptor:a3];
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLLegacySVBuffer alloc] initWithBuffer:result device:self];

    return v7;
  }
  return result;
}

- (id)newHeapWithDescriptor:(id)a3
{
  instrumentationHeapInit(self);
  id result = (id)[*((id *)self + 2) newHeapWithDescriptor:a3];
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLLegacySVHeap alloc] initWithHeap:result descriptor:a3 device:self];

    return v7;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3
{
  id result = (id)[*((id *)self + 2) newTextureWithDescriptor:a3];
  if (result)
  {
    id v5 = result;
    id v6 = [[MTLLegacySVTexture alloc] initWithTexture:result heap:0 device:self];

    return v6;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5
{
  id result = (id)[*((id *)self + 2) newTextureWithDescriptor:a3 iosurface:a4 plane:a5];
  if (result)
  {
    id v7 = result;
    id v8 = [[MTLLegacySVTexture alloc] initWithTexture:result heap:0 device:self];

    return v8;
  }
  return result;
}

- (id)newSharedTextureWithHandle:(id)a3
{
  id result = (id)[*((id *)self + 2) newSharedTextureWithHandle:a3];
  if (result)
  {
    id v5 = result;
    id v6 = [[MTLLegacySVTexture alloc] initWithTexture:result heap:0 device:self];

    return v6;
  }
  return result;
}

- (id)newSharedTextureWithDescriptor:(id)a3
{
  id result = (id)[*((id *)self + 2) newSharedTextureWithDescriptor:a3];
  if (result)
  {
    id v5 = result;
    id v6 = [[MTLLegacySVTexture alloc] initWithTexture:result heap:0 device:self];

    return v6;
  }
  return result;
}

- (id)newTextureWithDescriptor:(id)a3 iosurface:(__IOSurface *)a4 plane:(unint64_t)a5 slice:(unint64_t)a6
{
  id result = (id)[*((id *)self + 2) newTextureWithDescriptor:a3 iosurface:a4 plane:a5 slice:a6];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [[MTLLegacySVTexture alloc] initWithTexture:result heap:0 device:self];

    return v9;
  }
  return result;
}

- (id)newTextureWithBytesNoCopy:(void *)a3 length:(unint64_t)a4 descriptor:(id)a5 deallocator:(id)a6
{
  id result = (id)[*((id *)self + 2) newTextureWithBytesNoCopy:a3 length:a4 descriptor:a5 deallocator:a6];
  if (result)
  {
    id v8 = result;
    uint64_t v9 = [[MTLLegacySVTexture alloc] initWithTexture:result heap:0 device:self];

    return v9;
  }
  return result;
}

- (id)newArgumentEncoderWithArguments:(id)a3 structType:(id *)a4
{
  if ((*((unsigned char *)self + 286) & 0x80) != 0)
  {
    if (a4) {
      *a4 = (id)MTLCreateStructTypeFromArgumentDescriptors();
    }
    return [(MTLLegacySVDevice *)self newArgumentEncoderWithArguments:a3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MTLLegacySVDevice;
    return [(MTLToolsDevice *)&v7 newArgumentEncoderWithArguments:a3 structType:a4];
  }
}

- (id)newArgumentEncoderWithArguments:(id)a3
{
  if ((*((unsigned char *)self + 286) & 0x80) != 0)
  {
    id v5 = (void *)[a3 mutableCopy];
    if ([v5 count])
    {
      unint64_t v6 = 0;
      char v7 = 0;
      do
      {
        id v8 = (void *)[v5 objectAtIndexedSubscript:v6];
        BOOL v9 = [v8 constantBlockAlignment] != 0;
        uint64_t v10 = [v8 dataType];
        if ((unint64_t)(v10 - 60) <= 0x3A && ((1 << (v10 - 60)) & 0x600000000000001) != 0) {
          [v8 setDataType:30];
        }
        v7 |= v9;
        ++v6;
      }
      while ([v5 count] > v6);
      if ((v7 & 1) != 0 && [v5 count])
      {
        unsigned int v12 = 0;
        unsigned int v13 = 0;
        do
        {
          unsigned int v14 = v12 + 1;
          uint64_t v15 = (void *)[v5 objectAtIndexedSubscript:v12];
          uint64_t v16 = [v15 dataType];
          if ((unint64_t)(v16 - 58) > 0x16 || ((1 << (v16 - 58)) & 0x700007) == 0)
          {
            int Alignment = [v15 constantBlockAlignment];
            [v15 setConstantBlockAlignment:0];
            if (!Alignment)
            {
              [v15 dataType];
              int Alignment = MTLDataTypeGetAlignment();
            }
            int v19 = (v13 + Alignment - 1) & -Alignment;
            unsigned int v20 = v19 - v13;
            if (v19 != v13)
            {
              uint64_t v21 = v19 - v13;
              do
              {
                id v22 = objc_alloc_init(MEMORY[0x263F127B8]);
                [v22 setDataType:45];
                objc_msgSend(v22, "setIndex:", objc_msgSend(v5, "count"));
                [v5 insertObject:v22 atIndex:v12];

                ++v12;
                --v21;
              }
              while (v21);
              v14 += v20;
            }
            [v15 dataType];
            unsigned int v13 = v19 + MTLDataTypeGetSize();
          }
          else
          {
            unsigned int v13 = ((v13 + 7) & 0xFFFFFFF8) + 8;
          }
          unsigned int v12 = v14;
        }
        while (v14 < [v5 count]);
      }
    }
    uint64_t v23 = (void *)[*((id *)self + 2) newArgumentEncoderWithArguments:v5];

    unint64_t v24 = [[MTLLegacySVArgumentEncoder alloc] initWithArgumentEncoder:v23 layout:0 device:self];
    return v24;
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)MTLLegacySVDevice;
    return [(MTLToolsDevice *)&v25 newArgumentEncoderWithArguments:a3];
  }
}

- (id)newArgumentEncoderWithLayout:(id)a3
{
  return 0;
}

- (void)validateRaytracing
{
  if (![(MTLLegacySVDevice *)self supportsRaytracing])
  {
    MTLReportFailure();
  }
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)accelerationStructureSizesWithDescriptor:(SEL)a3
{
  [(MTLLegacySVDevice *)self validateRaytracing];
  id v7 = [(MTLToolsObject *)self baseObject];
  id result = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)unwrapAccelerationStructureDescriptor(a4);
  if (v7)
  {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[v7 accelerationStructureSizesWithDescriptor:result];
  }
  else
  {
    retstr->var0 = 0;
    retstr->var1 = 0;
    retstr->var2 = 0;
  }
  return result;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3
{
  id v5 = (void *)MEMORY[0x23ECD5710]([(MTLLegacySVDevice *)self validateRaytracing]);
  uint64_t v6 = [*((id *)self + 2) newAccelerationStructureWithSize:a3];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [[MTLLegacySVAccelerationStructure alloc] initWithAccelerationStructure:v6 device:self];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)newAccelerationStructureWithDescriptor:(id)a3
{
  id v5 = (void *)MEMORY[0x23ECD5710]([(MTLLegacySVDevice *)self validateRaytracing]);
  uint64_t v6 = [*((id *)self + 2) newAccelerationStructureWithDescriptor:unwrapAccelerationStructureDescriptor(a3)];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [[MTLLegacySVAccelerationStructure alloc] initWithAccelerationStructure:v6 device:self];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 resourceIndex:(unint64_t)a4
{
  id v7 = (void *)MEMORY[0x23ECD5710]([(MTLLegacySVDevice *)self validateRaytracing]);
  uint64_t v8 = [*((id *)self + 2) newAccelerationStructureWithSize:a3 resourceIndex:a4];
  if (v8)
  {
    BOOL v9 = (void *)v8;
    uint64_t v10 = [[MTLLegacySVAccelerationStructure alloc] initWithAccelerationStructure:v8 device:self];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4
{
  id v7 = (void *)MEMORY[0x23ECD5710]([(MTLLegacySVDevice *)self validateRaytracing]);
  uint64_t v8 = objc_msgSend(*((id *)self + 2), "newAccelerationStructureWithBuffer:offset:", objc_msgSend(a3, "baseObject"), a4);
  if (v8)
  {
    BOOL v9 = (void *)v8;
    uint64_t v10 = [[MTLLegacySVAccelerationStructure alloc] initWithAccelerationStructure:v8 device:self];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)newAccelerationStructureWithBuffer:(id)a3 offset:(unint64_t)a4 resourceIndex:(unint64_t)a5
{
  BOOL v9 = (void *)MEMORY[0x23ECD5710]([(MTLLegacySVDevice *)self validateRaytracing]);
  uint64_t v10 = objc_msgSend(*((id *)self + 2), "newAccelerationStructureWithBuffer:offset:resourceIndex:", objc_msgSend(a3, "baseObject"), a4, a5);
  if (v10)
  {
    unint64_t v11 = (void *)v10;
    unsigned int v12 = [[MTLLegacySVAccelerationStructure alloc] initWithAccelerationStructure:v10 device:self];
  }
  else
  {
    unsigned int v12 = 0;
  }
  return v12;
}

- (id)deserializePrimitiveAccelerationStructureFromBytes:(void *)a3 withDescriptor:(id)a4
{
  id v7 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v8 = [*((id *)self + 2) deserializePrimitiveAccelerationStructureFromBytes:a3 withDescriptor:unwrapAccelerationStructureDescriptor(a4)];
  if (v8)
  {
    BOOL v9 = (void *)v8;
    uint64_t v10 = [[MTLLegacySVAccelerationStructure alloc] initWithAccelerationStructure:v8 device:self type:1];
  }
  else
  {
    uint64_t v10 = 0;
  }
  return v10;
}

- (id)deserializeInstanceAccelerationStructureFromBytes:(void *)a3 primitiveAccelerationStructures:(id)a4 withDescriptor:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v9 = (void *)MEMORY[0x23ECD5710](self, a2);
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(a4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v11 = [a4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(a4);
        }
        objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14++), "baseObject"));
      }
      while (v12 != v14);
      uint64_t v12 = [a4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  uint64_t v15 = (void *)[*((id *)self + 2) deserializeInstanceAccelerationStructureFromBytes:a3 primitiveAccelerationStructures:v10 withDescriptor:unwrapAccelerationStructureDescriptor(a5)];

  if (v15)
  {
    uint64_t v16 = [[MTLLegacySVAccelerationStructure alloc] initWithAccelerationStructure:v15 device:self type:2];
  }
  else
  {
    uint64_t v16 = 0;
  }
  return v16;
}

- (id)newAccelerationStructureWithSize:(unint64_t)a3 withDescriptor:(id)a4
{
  id result = (id)[*((id *)self + 2) newAccelerationStructureWithSize:a3 withDescriptor:a4];
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLLegacySVAccelerationStructure alloc] initWithAccelerationStructure:result device:self];

    return v7;
  }
  return result;
}

- (id)newVisibleFunctionTableWithDescriptor:(id)a3
{
  id result = (id)objc_msgSend(*((id *)self + 2), "newVisibleFunctionTableWithDescriptor:");
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLLegacySVVisibleFunctionTable alloc] initWithVisibleFunctionTable:result descriptor:a3 device:self];

    return v7;
  }
  return result;
}

- (id)newIntersectionFunctionTableWithDescriptor:(id)a3
{
  [(MTLLegacySVDevice *)self validateRaytracing];
  id result = (id)[*((id *)self + 2) newIntersectionFunctionTableWithDescriptor:a3];
  if (result)
  {
    id v6 = result;
    id v7 = [[MTLLegacySVIntersectionFunctionTable alloc] initWithIntersectionFunctionTable:result device:self descriptor:a3];

    return v7;
  }
  return result;
}

- (id)newResidencySetWithDescriptor:(id)a3 error:(id *)a4
{
  id v6 = (void *)[*((id *)self + 2) newResidencySetWithDescriptor:a3 error:a4];
  if (v6) {
    id v7 = [[MTLLegacySVResidencySet alloc] initWithResidencySet:v6 device:self descriptor:a3];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)supportsArgumentBuffersTier2
{
  return *((unsigned __int8 *)self + 286) >> 7;
}

- (BOOL)supportsCMPIndirectCommandBuffers
{
  if ((*((unsigned char *)self + 287) & 0x20) != 0) {
    return [*((id *)self + 2) supportsCMPIndirectCommandBuffers];
  }
  else {
    return 0;
  }
}

- (BOOL)supportsGFXIndirectCommandBuffers
{
  return 0;
}

- (BOOL)supportsRenderDynamicLibraries
{
  v6.receiver = self;
  v6.super_class = (Class)MTLLegacySVDevice;
  BOOL v3 = [(MTLToolsDevice *)&v6 supportsRenderDynamicLibraries];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTLLegacySVDevice;
    LOBYTE(v3) = [(MTLToolsDevice *)&v5 supportsGlobalVariableRelocationRender];
  }
  return v3;
}

- (BOOL)supportsRaytracing
{
  return *((unsigned char *)self + 288) & 1;
}

- (BOOL)supportsRaytracingFromRender
{
  if (*((unsigned char *)self + 288)) {
    return [*((id *)self + 2) supportsRaytracingFromRender];
  }
  else {
    return 0;
  }
}

- (BOOL)supportsStackOverflowErrorCode
{
  return 0;
}

- (BOOL)supportsForkJoin
{
  return 0;
}

- (BOOL)supportsGlobalVariableBindings
{
  return 1;
}

- (id)getDynamicLibraryForBaseObject:(id)a3
{
  BOOL v3 = (void *)*((void *)self + 7);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__MTLLegacySVDevice_getDynamicLibraryForBaseObject___block_invoke;
  v5[3] = &unk_264E12EC8;
  v5[4] = a3;
  v5[5] = self;
  return (id)[v3 getCachedObjectForKey:a3 onMiss:v5];
}

uint64_t __52__MTLLegacySVDevice_getDynamicLibraryForBaseObject___block_invoke(uint64_t a1)
{
  v2 = [MTLLegacySVDynamicLibrary alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return (uint64_t)[(MTLLegacySVDynamicLibrary *)v2 initWithDynamicLibrary:v3 device:v4];
}

- (id)getFunctionForBaseObject:(id)a3 library:(id)a4
{
  uint64_t v4 = (void *)*((void *)self + 9);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__MTLLegacySVDevice_getFunctionForBaseObject_library___block_invoke;
  v6[3] = &unk_264E12EF0;
  v6[4] = a3;
  v6[5] = a4;
  return (id)[v4 getCachedObjectForKey:a3 onMiss:v6];
}

uint64_t __54__MTLLegacySVDevice_getFunctionForBaseObject_library___block_invoke(uint64_t a1)
{
  v2 = [MTLLegacySVFunction alloc];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return (uint64_t)[(MTLLegacySVFunction *)v2 initWithFunction:v3 library:v4];
}

- (BOOL)supportsResourceUsageValidation
{
  return (*((unsigned __int8 *)self + 288) >> 1) & 1;
}

- (id)newArgumentEncoderWithBufferBinding:(id)a3
{
  return 0;
}

- (BOOL)supportsRayTracingPerPrimitiveData
{
  return 1;
}

- (BOOL)areWritableHeapsEnabled
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return [v2 areWritableHeapsEnabled];
}

- (void)setWritableHeapsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTLToolsObject *)self baseObject];

  [v4 setWritableHeapsEnabled:v3];
}

- (MTLComputePipelineState)accelerationStructureComputePipelineState
{
  return (MTLComputePipelineState *)*((void *)self + 96);
}

- (void).cxx_destruct
{
  BOOL v3 = (char *)self + 552;
  std::__list_imp<objc_object  {objcproto9MTLBuffer}*>::clear((void *)self + 78);
  std::mutex::~mutex((std::mutex *)(v3 + 8));
  std::__hash_table<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::__unordered_map_hasher<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,GPUDebugConstantBufferCache::Key::Hash,std::equal_to<GPUDebugConstantBufferCache::Key>,true>,std::__unordered_map_equal<GPUDebugConstantBufferCache::Key,std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>,std::equal_to<GPUDebugConstantBufferCache::Key>,GPUDebugConstantBufferCache::Key::Hash,true>,std::allocator<std::__hash_value_type<GPUDebugConstantBufferCache::Key,GPUDebugConstantBufferCache::Value>>>::~__hash_table((uint64_t)self + 504);
  std::mutex::~mutex((std::mutex *)((char *)self + 440));
  id v4 = (void *)*((void *)self + 48);
  if (v4)
  {
    *((void *)self + 49) = v4;
    operator delete(v4);
  }
  objc_super v5 = (void *)*((void *)self + 45);
  if (v5)
  {
    *((void *)self + 46) = v5;
    operator delete(v5);
  }
  std::mutex::~mutex((std::mutex *)((char *)self + 296));

  LegacySVMetalBufferHeap::~LegacySVMetalBufferHeap((std::mutex *)((char *)self + 112));
}

- (id).cxx_construct
{
  *((void *)self + 14) = 850045863;
  *((void *)self + 27) = 0;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 184) = 0u;
  *(_OWORD *)((char *)self + 168) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *((_DWORD *)self + 56) = -1;
  *(_OWORD *)((char *)self + 232) = 0u;
  *(_OWORD *)((char *)self + 248) = 0u;
  *((void *)self + 37) = 850045863;
  *((_OWORD *)self + 19) = 0u;
  *((_OWORD *)self + 20) = 0u;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((_OWORD *)self + 23) = 0u;
  *((_OWORD *)self + 24) = 0u;
  *((void *)self + 50) = 0;
  *((void *)self + 52) = 0;
  *((void *)self + 53) = 0;
  *((_OWORD *)self + 27) = xmmword_23BE4ABB0;
  *((_OWORD *)self + 28) = 0u;
  *((_OWORD *)self + 29) = 0u;
  *((_OWORD *)self + 30) = 0u;
  *((_OWORD *)self + 31) = 0u;
  *((_OWORD *)self + 32) = 0u;
  *((void *)self + 66) = 0;
  *((_DWORD *)self + 134) = 1065353216;
  *((void *)self + 70) = 850045863;
  *(_OWORD *)((char *)self + 568) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 600) = 0u;
  *((void *)self + 77) = 0;
  *((void *)self + 78) = (char *)self + 624;
  *((void *)self + 86) = 0;
  *((void *)self + 79) = (char *)self + 624;
  *((void *)self + 80) = 0;
  *((void *)self + 87) = 0;
  return self;
}

- (void)initWithBaseObject:(uint64_t)a1 parent:.cold.3(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "name"), "UTF8String");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_23BD25000, v1, v2, "Device Alloc - %s, %p", v3, v4, v5, v6, v7);
}

@end