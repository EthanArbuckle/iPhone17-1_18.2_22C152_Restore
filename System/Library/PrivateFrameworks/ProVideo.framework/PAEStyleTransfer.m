@interface PAEStyleTransfer
+ (BOOL)hasEspressoVersion;
- (BOOL)addParameters;
- (BOOL)buildANERenderGraph:(id)a3 withInput:(id)a4 withInfo:(id *)a5 modelName:(id)a6 qualityLevel:(int64_t)a7;
- (BOOL)buildGPURenderGraph:(id)a3 withInput:(id)a4 withInfo:(id *)a5 modelName:(id)a6 qualityLevel:(int64_t)a7;
- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5;
- (BOOL)loadANEModel:(id)a3;
- (BOOL)loadGPUModel:(id)a3;
- (BOOL)variesOverTime;
- (EspressoImage2Image)gpuNetwork;
- (PAEStyleTransfer)initWithAPIManager:(id)a3;
- (PAEStyleTransferResourceTestResult)renderResourceForQuality:(SEL)a3 forModel:(int64_t)a4;
- (TwoNetsStyleTransfer)aneNetwork;
- (double)currentAspectRatio;
- (id).cxx_construct;
- (id)_bundleForFilter;
- (id)_modelPath:(id)a3;
- (id)aneModelPath:(id)a3;
- (id)gpuModelPath:(id)a3;
- (id)pathForGPUSettings;
- (id)properties;
- (int64_t)currentQualityLevel;
- (void)dealloc;
- (void)registerGPUDefaults;
- (void)setAneNetwork:(id)a3;
- (void)setCurrentAspectRatio:(double)a3;
- (void)setCurrentQualityLevel:(int64_t)a3;
- (void)setGpuNetwork:(id)a3;
- (void)setupGPUNetwork;
@end

@implementation PAEStyleTransfer

+ (BOOL)hasEspressoVersion
{
  return (int)[MEMORY[0x1E4F611F8] featureVersion] > 0;
}

- (id)_bundleForFilter
{
  v2 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A690];
  uint64_t v4 = 0;
  [v2 getStringParameterValue:&v4 fromParm:3];
  id result = (id)[MEMORY[0x1E4F28B50] bundleWithIdentifier:v4];
  if (!result) {
    return (id)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  }
  return result;
}

- (id)_modelPath:(id)a3
{
  id v5 = [(PAEStyleTransfer *)self _bundleForFilter];
  v6 = (void *)[v5 pathForResource:a3 ofType:@"net"];
  if (v6 && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v6) & 1) != 0)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v5, "pathForResource:ofType:", a3, @"shape")))
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", objc_msgSend(v5, "pathForResource:ofType:", a3, @"weights")))return v6; {
      uint64_t v7 = [NSString stringWithFormat:@"Error: In %s %d, neural style transfer %@ weights file not found.", "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 149, a3];
      }
    }
    else
    {
      uint64_t v7 = [NSString stringWithFormat:@"Error: In %s %d, neural style transfer %@ shape file not found.", "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 145, a3];
    }
  }
  else
  {
    uint64_t v7 = [NSString stringWithFormat:@"Error: In %s %d, neural style transfer %@ model file not found.", "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 141, a3];
  }
  if (v7)
  {
    if (kLogLevel >= 2 * !self->_firstModelLoadLog) {
      NSLog(&stru_1F119C630.isa, v7);
    }
    v6 = 0;
    self->_firstModelLoadLog = 0;
  }
  return v6;
}

- (id)pathForGPUSettings
{
  v2 = objc_msgSend(-[PAEStyleTransfer _bundleForFilter](self, "_bundleForFilter"), "pathForResource:ofType:", @"StyleTransfer", @"settings");
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v2)) {
    return v2;
  }
  else {
    return 0;
  }
}

- (void)registerGPUDefaults
{
  if (!self->_gpuDefaultsLoaded)
  {
    if ((kLogLevel & 0x80000000) == 0) {
      NSLog(&stru_1F119C630.isa, a2, @"Loading defaults...");
    }
    self->_modelName = (NSString *)&stru_1F119C770;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v4 = *(void *)"";
    id v5 = __39__PAEStyleTransfer_registerGPUDefaults__block_invoke;
    v6 = &unk_1E616BC38;
    uint64_t v7 = self;
    if (-[PAEStyleTransfer registerGPUDefaults]::onceToken != -1) {
      dispatch_once(&-[PAEStyleTransfer registerGPUDefaults]::onceToken, &block);
    }
    self->_currentQualityLevel = 0;
    self->_currentAspectRatio = 1.0;
    self->_gpuDefaultsLoaded = 1;
    if ((-[PAEStyleTransfer registerGPUDefaults]::sLoadedDefaults & 1) == 0 && (kLogLevel & 0x80000000) == 0) {
      NSLog(&stru_1F119C630.isa, @"WARNING: GPU defaults were  not actually loaded for Style Transfer. ", block, v4, v5, v6, v7);
    }
  }
}

void __39__PAEStyleTransfer_registerGPUDefaults__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) pathForGPUSettings] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E4F611F8], "performSelector:withObject:", sel_loadStylesConfigAtPath_, objc_msgSend(*(id *)(a1 + 32), "pathForGPUSettings"));
    if ((kLogLevel & 0x80000000) == 0) {
      NSLog(&stru_1F119C630.isa, @"GPU Defaults Loaded...");
    }
    -[PAEStyleTransfer registerGPUDefaults]::sLoadedDefaults = 1;
  }
}

- (void)setupGPUNetwork
{
  id v4 = MTLCreateSystemDefaultDevice();
  v3 = (void *)[v4 newCommandQueue];
  self->_gpuNetwork = (EspressoImage2Image *)[objc_alloc(MEMORY[0x1E4F611F8]) initWithQueue:v3];
}

- (id)gpuModelPath:(id)a3
{
  uint64_t v4 = [a3 stringByAppendingString:@".espresso"];

  return [(PAEStyleTransfer *)self _modelPath:v4];
}

- (BOOL)loadGPUModel:(id)a3
{
  aneNetwork = self->_aneNetwork;
  if (aneNetwork)
  {

    self->_aneNetwork = 0;
    HStyleTransfer_ANE::RenderContext::ReleaseRenderContext(&self->_aneRenderContext.m_Obj);
    self->_firstModelLoadLog = 1;
  }
  id v6 = [(PAEStyleTransfer *)self gpuModelPath:a3];
  if (v6)
  {
    id v7 = v6;
    self->_modelName = (NSString *)a3;
    if (!self->_gpuNetwork) {
      [(PAEStyleTransfer *)self setupGPUNetwork];
    }
    int v8 = [(EspressoImage2Image *)[(PAEStyleTransfer *)self gpuNetwork] load:v7 resolutionPreset:[(PAEStyleTransfer *)self currentQualityLevel]];
    if (v8)
    {
      printf("Espresso error: %d at line %s:%d\n", v8, "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 273);
      uint64_t v9 = [NSString stringWithFormat:@"Error: In %s %d, neural style transfer %@ shape failed to load GPU Model.", "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 276, a3];
      if ((kLogLevel & 0x80000000) == 0) {
        NSLog(&stru_1F119C630.isa, v9);
      }
    }
  }
  return 1;
}

- (id)aneModelPath:(id)a3
{
  uint64_t v4 = [a3 stringByAppendingString:@"_ANE_HQ.espresso"];

  return [(PAEStyleTransfer *)self _modelPath:v4];
}

- (BOOL)loadANEModel:(id)a3
{
  gpuNetwork = self->_gpuNetwork;
  if (gpuNetwork)
  {

    self->_gpuNetwork = 0;
    self->_firstModelLoadLog = 1;
  }
  aneNetwork = self->_aneNetwork;
  if (aneNetwork)
  {

    self->_aneNetwork = 0;
    self->_firstModelLoadLog = 1;
  }
  if (!self->_aneRenderContext.m_Obj)
  {
    HStyleTransfer_ANE::RenderContext::GetRetainedRenderContext((HGObject **)&v14);
    m_Obj = self->_aneRenderContext.m_Obj;
    int v8 = v14;
    if (m_Obj == v14)
    {
      if (m_Obj) {
        (*(void (**)(RenderContext *))(*(void *)m_Obj + 24))(m_Obj);
      }
    }
    else
    {
      if (m_Obj)
      {
        (*(void (**)(RenderContext *))(*(void *)m_Obj + 24))(m_Obj);
        int v8 = v14;
      }
      self->_aneRenderContext.m_Obj = v8;
    }
  }
  id v9 = [(PAEStyleTransfer *)self aneModelPath:a3];
  if (v9)
  {
    id v10 = v9;
    self->_modelName = (NSString *)a3;
    self->_aneNetwork = (TwoNetsStyleTransfer *)objc_alloc_init(MEMORY[0x1E4F61208]);
    int v11 = [(TwoNetsStyleTransfer *)[(PAEStyleTransfer *)self aneNetwork] load:v10 outputName:@"output-ane"];
    if (v11)
    {
      printf("Espresso error: %d at line %s:%d\n", v11, "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 334);
      uint64_t v12 = [NSString stringWithFormat:@"Error: In %s %d, neural style transfer %@ shape failed to load for ANE.", "/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEStyleTransfer.mm", 337, a3];
      if ((kLogLevel & 0x80000000) == 0) {
        NSLog(&stru_1F119C630.isa, v12);
      }
    }
  }
  return 1;
}

- (PAEStyleTransfer)initWithAPIManager:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PAEStyleTransfer;
  v3 = [(PAESharedDefaultBase *)&v6 initWithAPIManager:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_gpuDefaultsLoaded = 0;
    v3->_firstModelLoadLog = 1;
    if (-[PAEStyleTransfer initWithAPIManager:]::onceToken != -1) {
      dispatch_once(&-[PAEStyleTransfer initWithAPIManager:]::onceToken, &__block_literal_global_29);
    }
  }
  return v4;
}

void *__39__PAEStyleTransfer_initWithAPIManager___block_invoke()
{
  id result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"PAEStyleTransferLogLevel");
  if (result)
  {
    id result = (void *)[result integerValue];
    kLogLevel = (int)result;
  }
  return result;
}

- (void)dealloc
{
  HStyleTransfer_ANE::RenderContext::ReleaseRenderContext(&self->_aneRenderContext.m_Obj);
  v3.receiver = self;
  v3.super_class = (Class)PAEStyleTransfer;
  [(PAESharedDefaultBase *)&v3 dealloc];
}

- (id)properties
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v3 = [NSNumber numberWithBool:0];
  uint64_t v4 = [NSNumber numberWithBool:1];
  uint64_t v5 = [NSNumber numberWithInt:1];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:65792];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:590080];
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", &unk_1F11EC280, @"PixelTransformSupport", v3, @"MayRemapTime", v4, @"SupportsHeliumRendering", v5, @"PixelTransformSupport", v6, @"SDRWorkingSpace", v7, @"HDRWorkingSpace", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", 1), @"AutoColorProcessingSupport", 0);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (BOOL)addParameters
{
  v9.receiver = self;
  v9.super_class = (Class)PAEStyleTransfer;
  [(PAESharedDefaultBase *)&v9 addParameters];
  uint64_t v3 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121CE48];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    uint64_t v5 = (void *)[MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    LODWORD(v3) = objc_msgSend(v4, "addStringParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"PAEStyleTransferModelName", 0, 0), 1, &stru_1F119C770, 1);
    if (v3)
    {
      LODWORD(v8) = 17;
      int v6 = objc_msgSend(v4, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"PAEStyleTransferQualityLevel", 0, 0), 2, 0, 0, 6, 0, 0x100000006, v8);
      LOBYTE(v3) = 0;
      if (v6) {
        LOBYTE(v3) = objc_msgSend(v4, "addStringParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", @"PAEStyleTransferAppBundleID", 0, 0), 3, &stru_1F119C770, 1);
      }
    }
  }
  return v3;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  objc_super v9 = (void *)[(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121A608];
  uint64_t v10 = [(PROAPIAccessing *)self->super.super._apiManager apiForProtocol:&unk_1F121E208];
  if (v9) {
    BOOL v11 = v10 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11) {
    goto LABEL_10;
  }
  [(PAEStyleTransfer *)self registerGPUDefaults];
  int v25 = 0;
  [v9 getIntValue:&v25 fromParm:2 atFxTime:a5->var0.var1];
  uint64_t v12 = v25;
  uint64_t v24 = 0;
  [v9 getStringParameterValue:&v24 fromParm:1];
  int v13 = [(PAESharedDefaultBase *)self getRenderMode:a5->var0.var1];
  if (!v13) {
    return v13;
  }
  if ([a4 imageType] != 3)
  {
LABEL_10:
    LOBYTE(v13) = 0;
    return v13;
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  [(PAEStyleTransfer *)self renderResourceForQuality:v12 forModel:v24];
  v14 = NSString;
  uint64_t v15 = [a4 width];
  uint64_t v16 = [a4 height];
  uint64_t v17 = [v14 stringWithFormat:@"StyleTransfer: inputSize [%lu x %lu] | modelName %@ | quality %ld | aneModelExists %d | forceResource %@ | renderResource %d", v15, v16, v24, v12, 0, 0, 0];
  if (kLogLevel >= 1) {
    NSLog(&stru_1F119C630.isa, v17);
  }
  long long v18 = *(_OWORD *)&a5->var2;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v18;
  v20[2] = *(_OWORD *)&a5->var4;
  LOBYTE(v13) = [(PAEStyleTransfer *)self buildGPURenderGraph:a3 withInput:a4 withInfo:v20 modelName:v24 qualityLevel:v12];
  return v13;
}

- (PAEStyleTransferResourceTestResult)renderResourceForQuality:(SEL)a3 forModel:(int64_t)a4
{
  int v8 = 0;
  retstr->var0 = 0;
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if ([MEMORY[0x1E4F61208] supportsANE])
    {
      int v8 = 1;
      retstr->var0 = 1;
    }
    else
    {
      int v8 = 0;
    }
  }
  objc_super v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "objectForKey:", @"PAEStyleTransfer_ResourceOverride");
  retstr->var1 = v9;
  if (v9)
  {
    int v8 = [v9 integerValue];
    retstr->var0 = v8;
  }
  id result = [(PAEStyleTransfer *)self aneModelPath:a5];
  retstr->var2 = result != 0;
  if (v8 == 1 && !result) {
    retstr->var0 = 0;
  }
  return result;
}

- (BOOL)buildGPURenderGraph:(id)a3 withInput:(id)a4 withInfo:(id *)a5 modelName:(id)a6 qualityLevel:(int64_t)a7
{
  if (+[PAEStyleTransfer hasEspressoVersion]
    && self->_gpuNetwork
    && [(NSString *)self->_modelName isEqualToString:a6]
    || [(PAEStyleTransfer *)self loadGPUModel:a6])
  {
    if ([(PAEStyleTransfer *)self currentQualityLevel] != a7)
    {
      [(EspressoImage2Image *)[(PAEStyleTransfer *)self gpuNetwork] reshapeToResolutionPreset:a7];
      [(PAEStyleTransfer *)self setCurrentQualityLevel:a7];
    }
    self->_modelName = (NSString *)a6;
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v12 = [(PAEStyleTransfer *)self gpuNetwork];
    int v13 = (HStyleTransfer_GPU *)HGObject::operator new(0x1B0uLL);
    HStyleTransfer_GPU::HStyleTransfer_GPU(v13, v12);
    (*(void (**)(HStyleTransfer_GPU *, void, uint64_t))(*(void *)v13 + 120))(v13, 0, v16);
    uint64_t v15 = v13;
    (*(void (**)(HStyleTransfer_GPU *))(*(void *)v13 + 16))(v13);
    [a3 setHeliumRef:&v15];
    if (v15) {
      (*(void (**)(HStyleTransfer_GPU *))(*(void *)v15 + 24))(v15);
    }
    (*(void (**)(HStyleTransfer_GPU *))(*(void *)v13 + 24))(v13);
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 24))(v16);
    }
  }
  return 1;
}

- (BOOL)buildANERenderGraph:(id)a3 withInput:(id)a4 withInfo:(id *)a5 modelName:(id)a6 qualityLevel:(int64_t)a7
{
  if (self->_aneNetwork && -[NSString isEqualToString:](self->_modelName, "isEqualToString:", a6, a4, a5, a6, a7)
    || (BOOL v11 = -[PAEStyleTransfer loadANEModel:](self, "loadANEModel:", a6, a4, a5, a6, a7)))
  {
    if (a4) {
      [a4 heliumRef];
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v12 = (RenderContext *)HGObject::operator new(0x1B0uLL);
    aneNetwork = self->_aneNetwork;
    m_Obj = self->_aneRenderContext.m_Obj;
    uint64_t v17 = m_Obj;
    if (m_Obj) {
      (*(void (**)(RenderContext *))(*(void *)m_Obj + 16))(m_Obj);
    }
    HStyleTransfer_ANE::HStyleTransfer_ANE(v12, aneNetwork, &v17);
    if (v17) {
      (*(void (**)(RenderContext *))(*(void *)v17 + 24))(v17);
    }
    (*(void (**)(RenderContext *, void, uint64_t))(*(void *)v12 + 120))(v12, 0, v16);
    uint64_t v17 = v12;
    (*(void (**)(RenderContext *))(*(void *)v12 + 16))(v12);
    [a3 setHeliumRef:&v17];
    if (v17) {
      (*(void (**)(RenderContext *))(*(void *)v17 + 24))(v17);
    }
    (*(void (**)(RenderContext *))(*(void *)v12 + 24))(v12);
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 24))(v16);
    }
    LOBYTE(v11) = 1;
  }
  return v11;
}

- (EspressoImage2Image)gpuNetwork
{
  return self->_gpuNetwork;
}

- (void)setGpuNetwork:(id)a3
{
}

- (TwoNetsStyleTransfer)aneNetwork
{
  return self->_aneNetwork;
}

- (void)setAneNetwork:(id)a3
{
}

- (int64_t)currentQualityLevel
{
  return self->_currentQualityLevel;
}

- (void)setCurrentQualityLevel:(int64_t)a3
{
  self->_currentQualityLevel = a3;
}

- (double)currentAspectRatio
{
  return self->_currentAspectRatio;
}

- (void)setCurrentAspectRatio:(double)a3
{
  self->_currentAspectRatio = a3;
}

- (void).cxx_destruct
{
  m_Obj = self->_aneRenderContext.m_Obj;
  if (m_Obj) {
    (*(void (**)(RenderContext *, SEL))(*(void *)m_Obj + 24))(m_Obj, a2);
  }
}

- (id).cxx_construct
{
  *((void *)self + 5) = 0;
  return self;
}

@end