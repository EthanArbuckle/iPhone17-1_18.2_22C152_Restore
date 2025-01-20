@interface PVVideoCompositingExporter
- (PVVideoCompositingExporter)init;
- (id)preferredDestinationPixelBufferFormat;
- (id)requiredPixelBufferAttributesForRenderContext;
- (void)setupEffectScheduler;
- (void)setupTextureFactories;
@end

@implementation PVVideoCompositingExporter

- (id)requiredPixelBufferAttributesForRenderContext
{
  v10[1] = *MEMORY[0x1E4F143B8];
  destinationBufferPoolAttributes = self->super._destinationBufferPoolAttributes;
  if (!destinationBufferPoolAttributes)
  {
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (+[PVEnvironment PV_ENABLE_BGRA_OUTPUT_EXPORT])
    {
      v5 = &unk_1F11EC0D0;
    }
    else
    {
      v5 = [(PVVideoCompositingExporter *)self preferredDestinationPixelBufferFormat];
    }
    v10[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    [(NSDictionary *)v4 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F24D70]];

    [(NSDictionary *)v4 setObject:MEMORY[0x1E4F1CC08] forKeyedSubscript:*MEMORY[0x1E4F24D20]];
    p_destinationBufferPoolAttributes = &self->super._destinationBufferPoolAttributes;
    v8 = *p_destinationBufferPoolAttributes;
    *p_destinationBufferPoolAttributes = v4;

    destinationBufferPoolAttributes = *p_destinationBufferPoolAttributes;
  }

  return destinationBufferPoolAttributes;
}

- (id)preferredDestinationPixelBufferFormat
{
  v3 = [(PVRendererBase *)self compositingContext];
  v4 = [v3 outputColorSpace];
  if ([v4 isHDRSpace])
  {
    v5 = [(PVRendererBase *)self compositingContext];
    int v6 = [v5 gpuRenderAPI];

    if (v6) {
      return &unk_1F11EC148;
    }
    else {
      return &unk_1F11EC118;
    }
  }
  else
  {

    return &unk_1F11EC118;
  }
}

- (PVVideoCompositingExporter)init
{
  v16.receiver = self;
  v16.super_class = (Class)PVVideoCompositingExporter;
  v2 = [(PVVideoCompositing *)&v16 init];
  if (v2)
  {
    if (+[PVDeviceCharacteristics isLowMemDevice])
    {
      uint64_t v3 = +[PVEnvironment PVPageSizeLowMemExport];
      v4 = [(PVRendererBase *)v2 compositingContext];
      [v4 setPageSize:v3];
    }
    v5 = +[PVHostApplicationDelegateHandler sharedInstance];
    int v6 = [v5 preferredExportColorSpace];
    [(PVRendererBase *)v2 setOutputColorSpace:v6];

    v7 = [[PVTaskTokenPool alloc] initWithOffset:+[PVAVFRenderJobDelegate jobTypeTag] + 100];
    tokenPool = v2->super._tokenPool;
    v2->super._tokenPool = v7;

    v9 = +[PVHostApplicationDelegateHandler sharedInstance];
    v10 = [v9 preferredExportColorSpace];
    int v11 = [v10 isHDRSpace];

    if (v11)
    {
      v12 = +[PVColorSpace rec2020LinearColorSpace];
      v13 = [(PVRendererBase *)v2 compositingContext];
      [v13 setWorkingColorSpace:v12];
    }
    else
    {
      v12 = +[PVHostApplicationDelegateHandler sharedInstance];
      v13 = [v12 preferredExportColorSpace];
      v14 = [(PVRendererBase *)v2 compositingContext];
      [v14 setWorkingColorSpace:v13];
    }
  }
  return v2;
}

- (void)setupTextureFactories
{
  BOOL v3 = +[PVDeviceCharacteristics isLowMemDevice];
  float v4 = 0.5;
  if (v3) {
    float v4 = 0.0;
  }
  m_Obj = self->super._renderManager.m_Obj;

  PVRenderManager::SetupTextureFactories(m_Obj, v4);
}

- (void)setupEffectScheduler
{
  BOOL v3 = objc_alloc_init(PVEffectScheduler);
  effectScheduler = self->super._effectScheduler;
  self->super._effectScheduler = v3;

  v5 = self->super._effectScheduler;

  [(PVEffectScheduler *)v5 setIsExporting:1];
}

@end