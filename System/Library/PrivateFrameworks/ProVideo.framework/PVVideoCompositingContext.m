@interface PVVideoCompositingContext
+ (BOOL)supportsSecureCoding;
+ (id)createContextForCPUDisplay;
+ (id)createContextForCPUExport;
+ (id)createContextForGPUDisplay;
+ (id)createContextForGPUExport;
+ (id)defaultOutputColorSpaceWithRenderingIntent:(int)a3;
+ (id)defaultWorkingColorSpaceWithOutputColorSpace:(id)a3;
+ (id)dotGraphLoggingDirectory;
- (BOOL)concatenationFlag;
- (BOOL)dynamicPlayback;
- (BOOL)powerFriendlyExport;
- (BOOL)renderStatsFlag;
- (BOOL)textureBorder;
- (PVColorSpace)outputColorSpace;
- (PVColorSpace)workingColorSpace;
- (PVVideoCompositingContext)initWithCoder:(id)a3;
- (PVVideoCompositingContext)initWithDevice:(int)a3 defaultColorSpace:(id)a4;
- (PVVideoCompositingContext)initWithDevice:(int)a3 workingColorSpace:(id)a4 outputColorSpace:(id)a5;
- (PVVideoCompositingContext)initWithDeviceForDisplay:(int)a3;
- (PVVideoCompositingContext)initWithDeviceForExport:(int)a3;
- (int)bufferFormat;
- (int)dotGraphLevel;
- (int)filterMode;
- (int)gpuRenderAPI;
- (int)instructionGraphDotTreeLevel;
- (int)instructionGraphDumpLevel;
- (int)numCPUThreads;
- (int)pageSize;
- (int)renderDevice;
- (int)renderGraphDumpLevel;
- (int)renderStatsMaxVals;
- (int)renderStatsWarmUp;
- (int)shaderFormat;
- (int)signPostLevel;
- (int)tileSize;
- (int)traceGLLevel;
- (int)traceMetalLevel;
- (int)workingColorSpaceConformIntent;
- (void)dumpContext;
- (void)encodeWithCoder:(id)a3;
- (void)setBufferFormat:(int)a3;
- (void)setConcatenationFlag:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDotGraphLevel:(int)a3;
- (void)setDynamicPlayback:(BOOL)a3;
- (void)setFilterMode:(int)a3;
- (void)setGpuRenderAPI:(int)a3;
- (void)setInstructionGraphDotTreeLevel:(int)a3;
- (void)setInstructionGraphDumpLevel:(int)a3;
- (void)setIntermediateBufferFormatForWorkingColorSpace;
- (void)setNumCPUThreads:(int)a3;
- (void)setOutputColorSpace:(id)a3;
- (void)setPageSize:(int)a3;
- (void)setPowerFriendlyExport:(BOOL)a3;
- (void)setRenderDevice:(int)a3;
- (void)setRenderGraphDumpLevel:(int)a3;
- (void)setRenderStatsFlag:(BOOL)a3;
- (void)setRenderStatsMaxVals:(int)a3;
- (void)setRenderStatsWarmUp:(int)a3;
- (void)setShaderFormat:(int)a3;
- (void)setSignPostLevel:(int)a3;
- (void)setTextureBorder:(BOOL)a3;
- (void)setTileSize:(int)a3;
- (void)setTraceGLLevel:(int)a3;
- (void)setTraceMetalLevel:(int)a3;
- (void)setWorkingColorSpace:(id)a3;
- (void)setWorkingColorSpaceConformIntent:(int)a3;
@end

@implementation PVVideoCompositingContext

+ (id)dotGraphLoggingDirectory
{
  if (+[PVVideoCompositingContext dotGraphLoggingDirectory]::onceToken != -1) {
    dispatch_once(&+[PVVideoCompositingContext dotGraphLoggingDirectory]::onceToken, &__block_literal_global_17);
  }
  v2 = (void *)+[PVVideoCompositingContext dotGraphLoggingDirectory]::s_str;

  return v2;
}

uint64_t __53__PVVideoCompositingContext_dotGraphLoggingDirectory__block_invoke(PVRenderManager *a1)
{
  v1 = NSString;
  v2 = (PVRenderManager *)PVRenderManager::INSTANCE(a1, &v7);
  PVRenderManager::DotGraphLoggingDirectory(v2, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v4 = [v1 stringWithUTF8String:p_p];
  v5 = (void *)+[PVVideoCompositingContext dotGraphLoggingDirectory]::s_str;
  +[PVVideoCompositingContext dotGraphLoggingDirectory]::s_str = v4;

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  uint64_t result = v7;
  if (v7) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v7 + 24))(v7);
  }
  return result;
}

+ (id)createContextForGPUDisplay
{
  v2 = [[PVVideoCompositingContext alloc] initWithDeviceForDisplay:0];

  return v2;
}

+ (id)createContextForCPUDisplay
{
  v2 = [[PVVideoCompositingContext alloc] initWithDeviceForDisplay:1];

  return v2;
}

+ (id)createContextForGPUExport
{
  v2 = [[PVVideoCompositingContext alloc] initWithDeviceForExport:0];

  return v2;
}

+ (id)createContextForCPUExport
{
  v2 = [[PVVideoCompositingContext alloc] initWithDeviceForExport:1];

  return v2;
}

+ (id)defaultOutputColorSpaceWithRenderingIntent:(int)a3
{
  if ((a3 - 2) < 2) {
    goto LABEL_4;
  }
  if (a3 == 1)
  {
    v3 = +[PVHostApplicationDelegateHandler sharedInstance];
    uint64_t v4 = [v3 preferredExportColorSpace];
    goto LABEL_6;
  }
  if (!a3)
  {
LABEL_4:
    v3 = +[PVHostApplicationDelegateHandler sharedInstance];
    uint64_t v4 = [v3 preferredDisplayColorSpace];
LABEL_6:
    v5 = (void *)v4;

    goto LABEL_8;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

+ (id)defaultWorkingColorSpaceWithOutputColorSpace:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if ([v3 isHDRSpace])
  {
    uint64_t v4 = +[PVColorSpace rec2020LinearColorSpace];
  }

  return v4;
}

- (PVVideoCompositingContext)initWithDeviceForDisplay:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = +[PVVideoCompositingContext defaultOutputColorSpaceWithRenderingIntent:0];
  v6 = [(PVVideoCompositingContext *)self initWithDevice:v3 defaultColorSpace:v5];

  return v6;
}

- (PVVideoCompositingContext)initWithDeviceForExport:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = +[PVVideoCompositingContext defaultOutputColorSpaceWithRenderingIntent:1];
  v6 = [(PVVideoCompositingContext *)self initWithDevice:v3 defaultColorSpace:v5];

  return v6;
}

- (PVVideoCompositingContext)initWithDevice:(int)a3 defaultColorSpace:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = +[PVVideoCompositingContext defaultWorkingColorSpaceWithOutputColorSpace:v6];
  v8 = [(PVVideoCompositingContext *)self initWithDevice:v4 workingColorSpace:v7 outputColorSpace:v6];

  return v8;
}

- (PVVideoCompositingContext)initWithDevice:(int)a3 workingColorSpace:(id)a4 outputColorSpace:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PVVideoCompositingContext;
  v10 = [(PVVideoCompositingContext *)&v16 init];
  v11 = v10;
  if (v10)
  {
    [(PVVideoCompositingContext *)v10 setRenderDevice:v6];
    [(PVVideoCompositingContext *)v11 setGpuRenderAPI:1];
    BOOL v12 = +[PVDeviceCharacteristics hasExtendedColorDisplay];
    [(PVVideoCompositingContext *)v11 setOutputColorSpace:v9];
    [(PVVideoCompositingContext *)v11 setWorkingColorSpace:v8];
    [(PVVideoCompositingContext *)v11 setWorkingColorSpaceConformIntent:!v12];
    [(PVVideoCompositingContext *)v11 setShaderFormat:28];
    [(PVVideoCompositingContext *)v11 setConcatenationFlag:1];
    [(PVVideoCompositingContext *)v11 setRenderGraphDumpLevel:0];
    [(PVVideoCompositingContext *)v11 setDotGraphLevel:0];
    [(PVVideoCompositingContext *)v11 setTileSize:48];
    [(PVVideoCompositingContext *)v11 setNumCPUThreads:2];
    [(PVVideoCompositingContext *)v11 setTextureBorder:1];
    [(PVVideoCompositingContext *)v11 setDynamicPlayback:0];
    [(PVVideoCompositingContext *)v11 setSignPostLevel:1];
    [(PVVideoCompositingContext *)v11 setTraceGLLevel:0];
    [(PVVideoCompositingContext *)v11 setTraceMetalLevel:0];
    [(PVVideoCompositingContext *)v11 setPageSize:+[PVEnvironment PVPageSize]];
    [(PVVideoCompositingContext *)v11 setInstructionGraphDumpLevel:0];
    [(PVVideoCompositingContext *)v11 setInstructionGraphDotTreeLevel:0];
    [(PVVideoCompositingContext *)v11 setPowerFriendlyExport:0];
    v13 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v14 = [v13 dictionaryRepresentation];
    [(PVVideoCompositingContext *)v11 setContext:v14];
  }
  return v11;
}

- (void)setContext:(id)a3
{
  uint64_t v4 = (NSDictionary *)a3;
  [(PVVideoCompositingContext *)self setRenderDevice:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_0.isa, [(PVVideoCompositingContext *)self renderDevice])];
  [(PVVideoCompositingContext *)self setGpuRenderAPI:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_1.isa, [(PVVideoCompositingContext *)self gpuRenderAPI])];
  [(PVVideoCompositingContext *)self setNumCPUThreads:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_2.isa, [(PVVideoCompositingContext *)self numCPUThreads])];
  [(PVVideoCompositingContext *)self setBufferFormat:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_3.isa, [(PVVideoCompositingContext *)self bufferFormat])];
  [(PVVideoCompositingContext *)self setShaderFormat:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_4.isa, [(PVVideoCompositingContext *)self shaderFormat])];
  [(PVVideoCompositingContext *)self setFilterMode:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_5.isa, [(PVVideoCompositingContext *)self filterMode])];
  [(PVVideoCompositingContext *)self setConcatenationFlag:getDefaultsBoolValue(v4, &cfstr_Pvvideocomposi_6.isa, [(PVVideoCompositingContext *)self concatenationFlag])];
  [(PVVideoCompositingContext *)self setTileSize:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_7.isa, [(PVVideoCompositingContext *)self tileSize])];
  [(PVVideoCompositingContext *)self setPageSize:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_8.isa, [(PVVideoCompositingContext *)self pageSize])];
  [(PVVideoCompositingContext *)self setTextureBorder:getDefaultsBoolValue(v4, &cfstr_Pvvideocomposi_9.isa, [(PVVideoCompositingContext *)self textureBorder])];
  [(PVVideoCompositingContext *)self setDynamicPlayback:getDefaultsBoolValue(v4, &cfstr_Pvvideocomposi_10.isa, [(PVVideoCompositingContext *)self dynamicPlayback])];
  [(PVVideoCompositingContext *)self setRenderGraphDumpLevel:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_11.isa, [(PVVideoCompositingContext *)self renderGraphDumpLevel])];
  [(PVVideoCompositingContext *)self setRenderStatsFlag:getDefaultsBoolValue(v4, &cfstr_Pvvideocomposi_12.isa, [(PVVideoCompositingContext *)self renderStatsFlag])];
  [(PVVideoCompositingContext *)self setRenderStatsWarmUp:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_13.isa, [(PVVideoCompositingContext *)self renderStatsWarmUp])];
  [(PVVideoCompositingContext *)self setRenderStatsMaxVals:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_14.isa, [(PVVideoCompositingContext *)self renderStatsMaxVals])];
  [(PVVideoCompositingContext *)self setDotGraphLevel:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_15.isa, [(PVVideoCompositingContext *)self dotGraphLevel])];
  [(PVVideoCompositingContext *)self setSignPostLevel:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_16.isa, [(PVVideoCompositingContext *)self signPostLevel])];
  [(PVVideoCompositingContext *)self setTraceGLLevel:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_17.isa, [(PVVideoCompositingContext *)self traceGLLevel])];
  [(PVVideoCompositingContext *)self setTraceMetalLevel:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_18.isa, [(PVVideoCompositingContext *)self traceMetalLevel])];
  [(PVVideoCompositingContext *)self setInstructionGraphDumpLevel:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_19.isa, [(PVVideoCompositingContext *)self instructionGraphDumpLevel])];
  [(PVVideoCompositingContext *)self setInstructionGraphDotTreeLevel:getDefaultsIntValue(v4, &cfstr_Pvvideocomposi_20.isa, [(PVVideoCompositingContext *)self instructionGraphDotTreeLevel])];
  [(PVVideoCompositingContext *)self setPowerFriendlyExport:getDefaultsBoolValue(v4, &cfstr_Pvvideocomposi_21.isa, [(PVVideoCompositingContext *)self powerFriendlyExport])];
}

- (void)dumpContext
{
  NSLog(&stru_1F11AC510.isa, a2);
  NSLog(&cfstr_CustomVideoCom.isa);
  if (self->renderDevice) {
    uint64_t v3 = @"CPU";
  }
  else {
    uint64_t v3 = @"GPU";
  }
  NSLog(&cfstr_RenderDevice.isa, v3);
  if (self->gpuRenderAPI) {
    uint64_t v4 = @"Metal";
  }
  else {
    uint64_t v4 = @"OpenGL";
  }
  NSLog(&cfstr_GpuRenderApi.isa, v4);
  NSLog(&cfstr_BufferFormatD.isa, self->bufferFormat);
  NSLog(&cfstr_ShaderFormatD.isa, self->shaderFormat);
  NSLog(&cfstr_ConcatenationD.isa, self->concatenationFlag);
  NSLog(&cfstr_GraphDumpLevel.isa, self->renderGraphDumpLevel);
  NSLog(&cfstr_DotGraphLevelD.isa, self->dotGraphLevel);
  NSLog(&cfstr_TilesizeD.isa, self->tileSize);
  NSLog(&cfstr_TextureBorderD.isa, self->textureBorder);
  NSLog(&cfstr_DynamicPlaybac.isa, self->dynamicPlayback);
  NSLog(&cfstr_NumCpuThreadsD.isa, self->numCPUThreads);
  NSLog(&cfstr_SignPostLevelD.isa, self->signPostLevel);
  NSLog(&cfstr_TraceGlLevelD.isa, self->traceGLLevel);
  NSLog(&cfstr_TraceMetalLeve.isa, self->traceMetalLevel);
  NSLog(&cfstr_PageSizeD.isa, self->pageSize);
  NSLog(&cfstr_InstructionGra.isa, self->instructionGraphDumpLevel);
  NSLog(&cfstr_InstructionGra_0.isa, self->instructionGraphDotTreeLevel);
  NSLog(&cfstr_PowerFriendlyE.isa, self->powerFriendlyExport);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVVideoCompositingContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[PVVideoCompositingContext initWithDevice:](self, "initWithDevice:", [v4 decodeIntForKey:@"PVVideoCompositingContextDeviceIDKey"]);
  -[PVVideoCompositingContext setGpuRenderAPI:](v5, "setGpuRenderAPI:", [v4 decodeIntegerForKey:@"PVVideoCompositingContextGPURenderAPIKey"]);
  -[PVVideoCompositingContext setNumCPUThreads:](v5, "setNumCPUThreads:", [v4 decodeIntForKey:@"PVVideoCompositingContextNumCPUThreadsKey"]);
  -[PVVideoCompositingContext setBufferFormat:](v5, "setBufferFormat:", [v4 decodeIntForKey:@"PVVideoCompositingContextBufferFormatKey"]);
  -[PVVideoCompositingContext setShaderFormat:](v5, "setShaderFormat:", [v4 decodeIntForKey:@"PVVideoCompositingContextShaderFormatKey"]);
  -[PVVideoCompositingContext setFilterMode:](v5, "setFilterMode:", [v4 decodeIntForKey:@"PVVideoCompositingContextFilterModeKey"]);
  -[PVVideoCompositingContext setConcatenationFlag:](v5, "setConcatenationFlag:", [v4 decodeBoolForKey:@"PVVideoCompositingContextConcatentationKey"]);
  -[PVVideoCompositingContext setTileSize:](v5, "setTileSize:", [v4 decodeBoolForKey:@"PVVideoCompositingContextTileSizeKey"]);
  -[PVVideoCompositingContext setPageSize:](v5, "setPageSize:", [v4 decodeBoolForKey:@"PVVideoCompositingContextPageSizeKey"]);
  -[PVVideoCompositingContext setTextureBorder:](v5, "setTextureBorder:", [v4 decodeBoolForKey:@"PVVideoCompositingContextTextureBorderKey"]);
  -[PVVideoCompositingContext setDynamicPlayback:](v5, "setDynamicPlayback:", [v4 decodeBoolForKey:@"PVVideoCompositingContextDynamicPlaybackKey"]);
  -[PVVideoCompositingContext setRenderGraphDumpLevel:](v5, "setRenderGraphDumpLevel:", [v4 decodeIntForKey:@"PVVideoCompositingContextGraphDumpLevelKey"]);
  -[PVVideoCompositingContext setRenderStatsFlag:](v5, "setRenderStatsFlag:", [v4 decodeIntForKey:@"PVVideoCompositingContextStatsFlagKey"] != 0);
  -[PVVideoCompositingContext setRenderStatsWarmUp:](v5, "setRenderStatsWarmUp:", [v4 decodeIntForKey:@"PVVideoCompositingContextStatsWarmUpKey"]);
  -[PVVideoCompositingContext setRenderStatsMaxVals:](v5, "setRenderStatsMaxVals:", [v4 decodeIntForKey:@"PVVideoCompositingContextStatsMaxValsKey"]);
  -[PVVideoCompositingContext setDotGraphLevel:](v5, "setDotGraphLevel:", [v4 decodeIntForKey:@"PVVideoCompositingContextDotGraphLevelKey"]);
  -[PVVideoCompositingContext setSignPostLevel:](v5, "setSignPostLevel:", [v4 decodeIntForKey:@"PVVideoCompositingContextSignPostLevelKey"]);
  -[PVVideoCompositingContext setTraceGLLevel:](v5, "setTraceGLLevel:", [v4 decodeIntegerForKey:@"PVVideoCompositingContextTraceGLLevelKey"]);
  -[PVVideoCompositingContext setTraceMetalLevel:](v5, "setTraceMetalLevel:", [v4 decodeIntegerForKey:@"PVVideoCompositingContextTraceMetalLevelKey"]);
  -[PVVideoCompositingContext setInstructionGraphDumpLevel:](v5, "setInstructionGraphDumpLevel:", [v4 decodeIntForKey:@"PVVideoCompositingContextInstructionGraphDumpLevelKey"]);
  -[PVVideoCompositingContext setInstructionGraphDotTreeLevel:](v5, "setInstructionGraphDotTreeLevel:", [v4 decodeIntForKey:@"PVVideoCompositingContextInstructionGraphDotTreeLevelKey"]);
  -[PVVideoCompositingContext setPowerFriendlyExport:](v5, "setPowerFriendlyExport:", [v4 decodeBoolForKey:@"PVVideoCompositingContextPowerFriendlyExport"]);

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext renderDevice](self, "renderDevice"), @"PVVideoCompositingContextDeviceIDKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext gpuRenderAPI](self, "gpuRenderAPI"), @"PVVideoCompositingContextGPURenderAPIKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext numCPUThreads](self, "numCPUThreads"), @"PVVideoCompositingContextNumCPUThreadsKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext bufferFormat](self, "bufferFormat"), @"PVVideoCompositingContextBufferFormatKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext shaderFormat](self, "shaderFormat"), @"PVVideoCompositingContextShaderFormatKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext filterMode](self, "filterMode"), @"PVVideoCompositingContextFilterModeKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext concatenationFlag](self, "concatenationFlag"), @"PVVideoCompositingContextConcatentationKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext tileSize](self, "tileSize"), @"PVVideoCompositingContextTileSizeKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext pageSize](self, "pageSize"), @"PVVideoCompositingContextPageSizeKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext textureBorder](self, "textureBorder"), @"PVVideoCompositingContextTextureBorderKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext dynamicPlayback](self, "dynamicPlayback"), @"PVVideoCompositingContextDynamicPlaybackKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext renderGraphDumpLevel](self, "renderGraphDumpLevel"), @"PVVideoCompositingContextGraphDumpLevelKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext renderStatsFlag](self, "renderStatsFlag"), @"PVVideoCompositingContextStatsFlagKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext renderStatsWarmUp](self, "renderStatsWarmUp"), @"PVVideoCompositingContextStatsWarmUpKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext renderStatsMaxVals](self, "renderStatsMaxVals"), @"PVVideoCompositingContextStatsMaxValsKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext dotGraphLevel](self, "dotGraphLevel"), @"PVVideoCompositingContextDotGraphLevelKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext signPostLevel](self, "signPostLevel"), @"PVVideoCompositingContextSignPostLevelKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext traceGLLevel](self, "traceGLLevel"), @"PVVideoCompositingContextTraceGLLevelKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext traceMetalLevel](self, "traceMetalLevel"), @"PVVideoCompositingContextTraceMetalLevelKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext instructionGraphDumpLevel](self, "instructionGraphDumpLevel"), @"PVVideoCompositingContextInstructionGraphDumpLevelKey");
  objc_msgSend(v4, "encodeInt:forKey:", -[PVVideoCompositingContext instructionGraphDotTreeLevel](self, "instructionGraphDotTreeLevel"), @"PVVideoCompositingContextInstructionGraphDotTreeLevelKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[PVVideoCompositingContext powerFriendlyExport](self, "powerFriendlyExport"), @"PVVideoCompositingContextPowerFriendlyExport");
}

- (void)setSignPostLevel:(int)a3
{
  uint64_t v3 = *(const char **)&a3;
  obj = self;
  objc_sync_enter(obj);
  obj->signPostLevel = (int)v3;
  HGLogger::setLevel((HGLogger *)"PVSignPost", v3);
  objc_sync_exit(obj);
}

- (void)setInstructionGraphDumpLevel:(int)a3
{
  uint64_t v3 = *(const char **)&a3;
  obj = self;
  objc_sync_enter(obj);
  obj->instructionGraphDumpLevel = (int)v3;
  HGLogger::setLevel((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", v3);
  objc_sync_exit(obj);
}

- (void)setTraceMetalLevel:(int)a3
{
  uint64_t v3 = *(const char **)&a3;
  obj = self;
  objc_sync_enter(obj);
  obj->traceMetalLevel = (int)v3;
  HGLogger::setLevel((HGLogger *)"metal", v3);
  objc_sync_exit(obj);
}

- (void)setOutputColorSpace:(id)a3
{
  id v4 = (PVColorSpace *)a3;
  obj = self;
  objc_sync_enter(obj);
  outputColorSpace = obj->_outputColorSpace;
  obj->_outputColorSpace = v4;

  objc_sync_exit(obj);
}

- (void)setWorkingColorSpace:(id)a3
{
  id v6 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (![(PVColorSpace *)v5->_workingColorSpace isEqual:v6])
  {
    objc_storeStrong((id *)&v5->_workingColorSpace, a3);
    [(PVVideoCompositingContext *)v5 setIntermediateBufferFormatForWorkingColorSpace];
  }
  objc_sync_exit(v5);
}

- (void)setIntermediateBufferFormatForWorkingColorSpace
{
  obj = self;
  objc_sync_enter(obj);
  v2 = [(PVVideoCompositingContext *)obj workingColorSpace];
  int v3 = [v2 isWideGamutSpace];

  if (v3) {
    uint64_t v4 = 27;
  }
  else {
    uint64_t v4 = 24;
  }
  [(PVVideoCompositingContext *)obj setBufferFormat:v4];
  objc_sync_exit(obj);
}

- (int)renderDevice
{
  return self->renderDevice;
}

- (void)setRenderDevice:(int)a3
{
  self->renderDevice = a3;
}

- (BOOL)concatenationFlag
{
  return self->concatenationFlag;
}

- (void)setConcatenationFlag:(BOOL)a3
{
  self->concatenationFlag = a3;
}

- (int)gpuRenderAPI
{
  return self->gpuRenderAPI;
}

- (void)setGpuRenderAPI:(int)a3
{
  self->gpuRenderAPI = a3;
}

- (int)numCPUThreads
{
  return self->numCPUThreads;
}

- (void)setNumCPUThreads:(int)a3
{
  self->numCPUThreads = a3;
}

- (int)bufferFormat
{
  return self->bufferFormat;
}

- (void)setBufferFormat:(int)a3
{
  self->bufferFormat = a3;
}

- (int)filterMode
{
  return self->filterMode;
}

- (void)setFilterMode:(int)a3
{
  self->filterMode = a3;
}

- (int)renderGraphDumpLevel
{
  return self->renderGraphDumpLevel;
}

- (void)setRenderGraphDumpLevel:(int)a3
{
  self->renderGraphDumpLevel = a3;
}

- (BOOL)renderStatsFlag
{
  return self->renderStatsFlag;
}

- (void)setRenderStatsFlag:(BOOL)a3
{
  self->renderStatsFlag = a3;
}

- (int)renderStatsWarmUp
{
  return self->renderStatsWarmUp;
}

- (void)setRenderStatsWarmUp:(int)a3
{
  self->renderStatsWarmUp = a3;
}

- (int)renderStatsMaxVals
{
  return self->renderStatsMaxVals;
}

- (void)setRenderStatsMaxVals:(int)a3
{
  self->renderStatsMaxVals = a3;
}

- (int)dotGraphLevel
{
  return self->dotGraphLevel;
}

- (void)setDotGraphLevel:(int)a3
{
  self->dotGraphLevel = a3;
}

- (int)tileSize
{
  return self->tileSize;
}

- (void)setTileSize:(int)a3
{
  self->tileSize = a3;
}

- (int)shaderFormat
{
  return self->shaderFormat;
}

- (void)setShaderFormat:(int)a3
{
  self->shaderFormat = a3;
}

- (int)traceGLLevel
{
  return self->traceGLLevel;
}

- (void)setTraceGLLevel:(int)a3
{
  self->traceGLLevel = a3;
}

- (int)traceMetalLevel
{
  return self->traceMetalLevel;
}

- (int)signPostLevel
{
  return self->signPostLevel;
}

- (int)pageSize
{
  return self->pageSize;
}

- (void)setPageSize:(int)a3
{
  self->pageSize = a3;
}

- (BOOL)textureBorder
{
  return self->textureBorder;
}

- (void)setTextureBorder:(BOOL)a3
{
  self->textureBorder = a3;
}

- (BOOL)dynamicPlayback
{
  return self->dynamicPlayback;
}

- (void)setDynamicPlayback:(BOOL)a3
{
  self->dynamicPlayback = a3;
}

- (int)instructionGraphDumpLevel
{
  return self->instructionGraphDumpLevel;
}

- (int)instructionGraphDotTreeLevel
{
  return self->instructionGraphDotTreeLevel;
}

- (void)setInstructionGraphDotTreeLevel:(int)a3
{
  self->instructionGraphDotTreeLevel = a3;
}

- (BOOL)powerFriendlyExport
{
  return self->powerFriendlyExport;
}

- (void)setPowerFriendlyExport:(BOOL)a3
{
  self->powerFriendlyExport = a3;
}

- (int)workingColorSpaceConformIntent
{
  return self->workingColorSpaceConformIntent;
}

- (void)setWorkingColorSpaceConformIntent:(int)a3
{
  self->workingColorSpaceConformIntent = a3;
}

- (PVColorSpace)outputColorSpace
{
  return self->_outputColorSpace;
}

- (PVColorSpace)workingColorSpace
{
  return self->_workingColorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workingColorSpace, 0);

  objc_storeStrong((id *)&self->_outputColorSpace, 0);
}

@end