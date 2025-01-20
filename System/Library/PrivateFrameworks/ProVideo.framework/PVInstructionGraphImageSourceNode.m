@interface PVInstructionGraphImageSourceNode
+ (void)purgeBitmapCache:(BOOL)a3;
- (BOOL)useAnimationInfo;
- (HGRef<HGNode>)applyGainMapToGraph:(HGRef<HGNode>)a3 gainMap:(HGRef<HGBitmap>)a4 withHeadroom:(float)a5;
- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (NSString)key;
- (NSURL)url;
- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4;
- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4;
- (PVImageDelegate)imageDelegate;
- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 animation:(id)a4 isExporting:(BOOL)a5 imageDelegate:(id)a6 renderingIntent:(int)a7;
- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 animation:(id)a4 isExporting:(BOOL)a5 imageDelegate:(id)a6 renderingIntent:(int)a7 fillMode:(int)a8;
- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 key:(id)a4 transform:(CGAffineTransform *)a5 isExporting:(BOOL)a6 imageDelegate:(id)a7 renderingIntent:(int)a8;
- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 key:(id)a4 transform:(CGAffineTransform *)a5 isExporting:(BOOL)a6 imageDelegate:(id)a7 renderingIntent:(int)a8 fillMode:(int)a9;
- (id).cxx_construct;
- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3;
- (id)instructionGraphNodeDescription;
- (id)loadImageTiles:(CGImage *)a3 size:(CGSize)a4 colorSpace:(id)a5 imageProperties:(PVImageProperties *)a6;
- (id)newCVPixelBufferCacheItemForGainMapWithColorSpace:(id)a3;
- (id)newCVPixelBufferCacheItemForImage:(HGRef<PVInstructionGraphContext>)a3;
- (int)fillMode;
- (int)renderingIntent;
- (void)dealloc;
- (void)enableHDRGainMap:(BOOL)a3;
- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4;
- (void)setFillMode:(int)a3;
- (void)setHDRGainMapHeadroom:(float)a3;
- (void)setImageDelegate:(id)a3;
- (void)setKey:(id)a3;
- (void)setRenderingIntent:(int)a3;
- (void)setUrl:(id)a3;
- (void)setUseAnimationInfo:(BOOL)a3;
@end

@implementation PVInstructionGraphImageSourceNode

+ (void)purgeBitmapCache:(BOOL)a3
{
  BOOL v3 = a3;
  [(id)sInputBitmapCacheLock lock];
  [(id)sInputBitmapCache purge:v3];
  [(id)sInputBitmapCacheLock unlock];
  if (v3)
  {
    v4 = (void *)sPixelBufferCache;
    [v4 removeAllObjects];
  }
}

- (void)enableHDRGainMap:(BOOL)a3
{
  LOBYTE(self->m_renderManager.m_Obj) = a3;
  if (a3)
  {
    id v6 = [(PVInstructionGraphImageSourceNode *)self key];
    uint64_t v4 = [v6 stringByAppendingString:@"_gainmap"];
    v5 = *(void **)&self->_useHDRGainMap;
    *(void *)&self->_useHDRGainMap = v4;
  }
}

- (void)setHDRGainMapHeadroom:(float)a3
{
  double v3 = a3;
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  if (v3 >= 8.0) {
    double v3 = 8.0;
  }
  float v4 = v3;
  *((float *)&self->m_renderManager.m_Obj + 1) = v4;
}

- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 key:(id)a4 transform:(CGAffineTransform *)a5 isExporting:(BOOL)a6 imageDelegate:(id)a7 renderingIntent:(int)a8
{
  long long v8 = *(_OWORD *)&a5->c;
  v11[0] = *(_OWORD *)&a5->a;
  v11[1] = v8;
  v11[2] = *(_OWORD *)&a5->tx;
  LODWORD(v10) = 1;
  return [(PVInstructionGraphImageSourceNode *)self initWithURL:a3 key:a4 transform:v11 isExporting:a6 imageDelegate:a7 renderingIntent:*(void *)&a8 fillMode:v10];
}

- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 key:(id)a4 transform:(CGAffineTransform *)a5 isExporting:(BOOL)a6 imageDelegate:(id)a7 renderingIntent:(int)a8 fillMode:(int)a9
{
  uint64_t v9 = *(void *)&a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v31.receiver = self;
  v31.super_class = (Class)PVInstructionGraphImageSourceNode;
  v18 = [(PVInstructionGraphSourceNode *)&v31 init];
  v19 = v18;
  if (!v18) {
    goto LABEL_18;
  }
  [(PVInstructionGraphImageSourceNode *)v18 setUrl:v15];
  [(PVInstructionGraphImageSourceNode *)v19 setKey:v16];
  long long v20 = *(_OWORD *)&a5->c;
  v30[0] = *(_OWORD *)&a5->a;
  v30[1] = v20;
  v30[2] = *(_OWORD *)&a5->tx;
  [(PVInstructionGraphSourceNode *)v19 setTransform:v30];
  [(PVInstructionGraphImageSourceNode *)v19 setImageDelegate:v17];
  [(PVInstructionGraphImageSourceNode *)v19 setRenderingIntent:v9];
  [(PVInstructionGraphImageSourceNode *)v19 setUseAnimationInfo:0];
  [(PVInstructionGraphSourceNode *)v19 setIsOverlayTrack:0];
  [(PVInstructionGraphImageSourceNode *)v19 setFillMode:a9];
  LOBYTE(v19->m_renderManager.m_Obj) = 0;
  HIDWORD(v19->m_renderManager.m_Obj) = 1067576197;
  v21 = *(void **)&v19->_useHDRGainMap;
  *(void *)&v19->_useHDRGainMap = 0;

  if (-[PVInstructionGraphImageSourceNode initWithURL:key:transform:isExporting:imageDelegate:renderingIntent:fillMode:]::once != -1)
  {
    dispatch_once(&-[PVInstructionGraphImageSourceNode initWithURL:key:transform:isExporting:imageDelegate:renderingIntent:fillMode:]::once, &__block_literal_global_82);
    if (a6) {
      goto LABEL_4;
    }
LABEL_6:
    if (+[PVDeviceCharacteristics architectureType] <= 2) {
      uint64_t v22 = 3;
    }
    else {
      uint64_t v22 = 6;
    }
    goto LABEL_9;
  }
  if (!a6) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v22 = 4;
LABEL_9:
  [(id)sInputBitmapCacheLock lock];
  v23 = [(id)sInputBitmapCache objectForKey:v19->_url];
  v24 = v23;
  if (v23) {
    [v23 updateLastUsedTime];
  }
  [(id)sInputBitmapCache setCountLimit:v22];
  [(id)sInputBitmapCacheLock unlock];
  CachedImageInfo::SetSourceNode((CachedImageInfo *)&v19->super._transform.ty, v19);
  PVRenderManager::INSTANCE(v25, &v29);
  lock = v19->m_cachedImageInfo._lock;
  v27 = v29;
  if (lock == v29)
  {
    if (lock) {
      (*((void (**)(HGSynchronizable *))lock->var0 + 3))(lock);
    }
  }
  else
  {
    if (lock)
    {
      (*((void (**)(HGSynchronizable *))lock->var0 + 3))(lock);
      v27 = v29;
    }
    v19->m_cachedImageInfo._lock = v27;
  }

LABEL_18:
  return v19;
}

void __114__PVInstructionGraphImageSourceNode_initWithURL_key_transform_isExporting_imageDelegate_renderingIntent_fillMode___block_invoke()
{
  v0 = objc_alloc_init(PVInputBitmapCache);
  v1 = (void *)sInputBitmapCache;
  sInputBitmapCache = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  double v3 = (void *)sPixelBufferCache;
  sPixelBufferCache = (uint64_t)v2;

  id v4 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v5 = (void *)sImageLoadLock;
  sImageLoadLock = (uint64_t)v4;

  id v6 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v7 = (void *)sInputBitmapCacheLock;
  sInputBitmapCacheLock = (uint64_t)v6;

  id v8 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  uint64_t v9 = (void *)sExportRenderAndLoadLock;
  sExportRenderAndLoadLock = (uint64_t)v8;
}

- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 animation:(id)a4 isExporting:(BOOL)a5 imageDelegate:(id)a6 renderingIntent:(int)a7
{
  return [(PVInstructionGraphImageSourceNode *)self initWithURL:a3 animation:a4 isExporting:a5 imageDelegate:a6 renderingIntent:*(void *)&a7 fillMode:1];
}

- (PVInstructionGraphImageSourceNode)initWithURL:(id)a3 animation:(id)a4 isExporting:(BOOL)a5 imageDelegate:(id)a6 renderingIntent:(int)a7 fillMode:(int)a8
{
  uint64_t v8 = *(void *)&a8;
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  v36.receiver = self;
  v36.super_class = (Class)PVInstructionGraphImageSourceNode;
  id v17 = [(PVInstructionGraphSourceNode *)&v36 init];
  v18 = v17;
  if (!v17) {
    goto LABEL_18;
  }
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v33 = *MEMORY[0x1E4F1DAB8];
  long long v34 = v19;
  long long v35 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PVInstructionGraphImageSourceNode *)v17 setUrl:v14];
  long long v20 = [v14 path];
  v21 = objc_msgSend(v20, "stringByAppendingFormat:", @"_ri%d", v9);
  [(PVInstructionGraphImageSourceNode *)v18 setKey:v21];

  v32[0] = v33;
  v32[1] = v34;
  v32[2] = v35;
  [(PVInstructionGraphSourceNode *)v18 setTransform:v32];
  [(PVInstructionGraphSourceNode *)v18 setTransformAnimation:v15];
  [(PVInstructionGraphImageSourceNode *)v18 setImageDelegate:v16];
  [(PVInstructionGraphImageSourceNode *)v18 setRenderingIntent:v9];
  [(PVInstructionGraphImageSourceNode *)v18 setUseAnimationInfo:1];
  [(PVInstructionGraphSourceNode *)v18 setIsOverlayTrack:0];
  [(PVInstructionGraphImageSourceNode *)v18 setFillMode:v8];
  LOBYTE(v18->m_renderManager.m_Obj) = 0;
  HIDWORD(v18->m_renderManager.m_Obj) = 1067576197;
  uint64_t v22 = *(void **)&v18->_useHDRGainMap;
  *(void *)&v18->_useHDRGainMap = 0;

  if (-[PVInstructionGraphImageSourceNode initWithURL:animation:isExporting:imageDelegate:renderingIntent:fillMode:]::once != -1)
  {
    dispatch_once(&-[PVInstructionGraphImageSourceNode initWithURL:animation:isExporting:imageDelegate:renderingIntent:fillMode:]::once, &__block_literal_global_91);
    if (a5) {
      goto LABEL_4;
    }
LABEL_6:
    if (+[PVDeviceCharacteristics architectureType] <= 2) {
      uint64_t v23 = 3;
    }
    else {
      uint64_t v23 = 6;
    }
    goto LABEL_9;
  }
  if (!a5) {
    goto LABEL_6;
  }
LABEL_4:
  uint64_t v23 = 4;
LABEL_9:
  [(id)sInputBitmapCacheLock lock];
  v24 = (void *)sInputBitmapCache;
  v25 = [(PVInstructionGraphImageSourceNode *)v18 key];
  v26 = [v24 objectForKey:v25];

  if (v26) {
    [v26 updateLastUsedTime];
  }
  [(id)sInputBitmapCache setCountLimit:v23];
  [(id)sInputBitmapCacheLock unlock];
  CachedImageInfo::SetSourceNode((CachedImageInfo *)&v18->super._transform.ty, v18);
  PVRenderManager::INSTANCE(v27, &v31);
  lock = v18->m_cachedImageInfo._lock;
  v29 = v31;
  if (lock == v31)
  {
    if (lock) {
      (*((void (**)(HGSynchronizable *))lock->var0 + 3))(lock);
    }
  }
  else
  {
    if (lock)
    {
      (*((void (**)(HGSynchronizable *))lock->var0 + 3))(lock);
      v29 = v31;
    }
    v18->m_cachedImageInfo._lock = v29;
  }

LABEL_18:
  return v18;
}

void __110__PVInstructionGraphImageSourceNode_initWithURL_animation_isExporting_imageDelegate_renderingIntent_fillMode___block_invoke()
{
  v0 = objc_alloc_init(PVInputBitmapCache);
  v1 = (void *)sInputBitmapCache;
  sInputBitmapCache = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  double v3 = (void *)sPixelBufferCache;
  sPixelBufferCache = (uint64_t)v2;

  id v4 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v5 = (void *)sImageLoadLock;
  sImageLoadLock = (uint64_t)v4;

  id v6 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v7 = (void *)sInputBitmapCacheLock;
  sInputBitmapCacheLock = (uint64_t)v6;

  id v8 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  uint64_t v9 = (void *)sExportRenderAndLoadLock;
  sExportRenderAndLoadLock = (uint64_t)v8;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PVInstructionGraphImageSourceNode;
  [(PVInstructionGraphImageSourceNode *)&v2 dealloc];
}

- (void)loadIGNode:(HGRef<PVInstructionGraphContext>)a3 returnLoadedEffects:(id)a4
{
  id v6 = a4;
  v7 = [(PVInstructionGraphImageSourceNode *)self key];
  if (HIDWORD(self->_keyHDRGainMap) == 1) {
    [(id)sExportRenderAndLoadLock lock];
  }
  CGFloat v8 = *MEMORY[0x1E4F1DB30];
  CGFloat v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  [(id)sInputBitmapCacheLock lock];
  uint64_t v10 = [(id)sInputBitmapCache objectForKey:v7];
  [(id)sInputBitmapCacheLock unlock];
  if (!v10)
  {
    [(id)sImageLoadLock lock];
    [(id)sInputBitmapCacheLock lock];
    v11 = [(id)sInputBitmapCache objectForKey:v7];
    [(id)sInputBitmapCacheLock unlock];
    if (v11)
    {
      LOBYTE(v12) = 0;
      goto LABEL_24;
    }
    id v12 = [(id)sPixelBufferCache objectForKey:v7];
    if (!v12)
    {
      uint64_t v13 = *(void *)a3.m_Obj;
      uint64_t v28 = v13;
      if (v13) {
        (*(void (**)(uint64_t))(*(void *)v13 + 16))(v13);
      }
      id v12 = [(PVInstructionGraphImageSourceNode *)self newCVPixelBufferCacheItemForImage:&v28];
      if (v28) {
        (*(void (**)(uint64_t))(*(void *)v28 + 24))(v28);
      }
      if (v7)
      {
        if (v12)
        {
          [(id)sPixelBufferCache setObject:v12 forKey:v7];
          unsigned __int8 v14 = atomic_load(HGLogger::_enabled);
          if (v14)
          {
            uint64_t v15 = [v7 UTF8String];
            HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)2, (HGLogger *)"PVIGImageSourceNode (%p): loadIGNode: Created CVPixel Buffer for key: %s\n", v16, v17, self, v15);
          }
        }
      }
      if (LOBYTE(self->m_renderManager.m_Obj) && *(void *)&self->_useHDRGainMap && v12)
      {
        v18 = [v12 colorSpace];
        id v19 = [(PVInstructionGraphImageSourceNode *)self newCVPixelBufferCacheItemForGainMapWithColorSpace:v18];

        if (v19)
        {
          [(id)sPixelBufferCache setObject:v19 forKey:*(void *)&self->_useHDRGainMap];
          unsigned __int8 v20 = atomic_load(HGLogger::_enabled);
          if (v20)
          {
            uint64_t v21 = [*(id *)&self->_useHDRGainMap UTF8String];
            HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)2, (HGLogger *)"PVIGImageSourceNode (%p): loadIGNode: Created GainMap CVPixelBuffer for key: %s\n", v22, v23, self, v21);
          }
        }
      }
      else if (!v12)
      {
        goto LABEL_24;
      }
    }
    [v12 fullSize];
    CGFloat v8 = v24;
    CGFloat v9 = v25;

    LOBYTE(v12) = 1;
LABEL_24:
    [(id)sImageLoadLock unlock];
    uint64_t v10 = v11;
    if (!v11) {
      goto LABEL_26;
    }
  }
  [v10 fullSize];
  CGFloat v8 = v26;
  CGFloat v9 = v27;
  LOBYTE(v12) = 1;
  v11 = v10;
LABEL_26:
  v29.width = v8;
  v29.height = v9;
  CachedImageInfo::Init((CachedImageInfo *)&self->super._transform.ty, (BOOL)v12, v29);
  if (HIDWORD(self->_keyHDRGainMap) == 1) {
    [(id)sExportRenderAndLoadLock unlock];
  }
}

- (HGRef<HGNode>)applyGainMapToGraph:(HGRef<HGNode>)a3 gainMap:(HGRef<HGBitmap>)a4 withHeadroom:(float)a5
{
  v7 = v5;
  CGFloat v8 = *(HGBitmap **)a4.m_Obj;
  if (*(void *)a4.m_Obj)
  {
    v11 = self;
    id v12 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
    HGBitmapLoader::HGBitmapLoader(v12, v8);
    double v13 = *(double *)&v11->m_cachedImageInfo.cached;
    double width = v11->m_cachedImageInfo.size.width;
    uint64_t v15 = HGObject::operator new(0x1D0uLL);
    v15[27] = 0u;
    v15[28] = 0u;
    v15[25] = 0u;
    v15[26] = 0u;
    v15[23] = 0u;
    v15[24] = 0u;
    v15[21] = 0u;
    v15[22] = 0u;
    v15[19] = 0u;
    v15[20] = 0u;
    v15[17] = 0u;
    v15[18] = 0u;
    v15[15] = 0u;
    v15[16] = 0u;
    v15[13] = 0u;
    v15[14] = 0u;
    v15[11] = 0u;
    v15[12] = 0u;
    v15[9] = 0u;
    v15[10] = 0u;
    v15[7] = 0u;
    v15[8] = 0u;
    v15[5] = 0u;
    v15[6] = 0u;
    v15[3] = 0u;
    v15[4] = 0u;
    v15[1] = 0u;
    v15[2] = 0u;
    *uint64_t v15 = 0u;
    HGNode::HGNode((HGNode *)v15);
    *(void *)uint64_t v15 = &unk_1F119B230;
    *((void *)v15 + 51) = 0;
    *((_DWORD *)v15 + 104) = 1065353216;
    *(_OWORD *)((char *)v15 + 424) = 0u;
    *(_OWORD *)((char *)v15 + 440) = 0u;
    off_1F119B2A8((HGNode *)v15, 0, *(HGNode **)a3.var0);
    (*(void (**)(_OWORD *, uint64_t, HGBitmapLoader *))(*(void *)v15 + 120))(v15, 1, v12);
    (*(void (**)(_OWORD *, void, float, double, double, double))(*(void *)v15 + 96))(v15, 0, a5, 0.0, 0.0, 0.0);
    float v16 = v13;
    float v17 = width;
    (*(void (**)(_OWORD *, uint64_t, float, float, double, double))(*(void *)v15 + 96))(v15, 1, v16, v17, 0.0, 0.0);
    self = (PVInstructionGraphImageSourceNode *)(*(uint64_t (**)(_OWORD *, uint64_t, float, float, double, double))(*(void *)v15 + 96))(v15, 2, (float)(*(_DWORD *)(*(void *)a4.m_Obj + 28)- *(_DWORD *)(*(void *)a4.m_Obj + 20)), (float)(*(_DWORD *)(*(void *)a4.m_Obj + 32)- *(_DWORD *)(*(void *)a4.m_Obj + 24)), 0.0, 0.0);
    void *v7 = v15;
    if (v12) {
      return (HGRef<HGNode>)(*(uint64_t (**)(HGBitmapLoader *))(*(void *)v12 + 24))(v12);
    }
  }
  else
  {
    void *v5 = *(void *)a3.var0;
    *(void *)a3.var0 = 0;
  }
  return (HGRef<HGNode>)self;
}

- (id)newCVPixelBufferCacheItemForGainMapWithColorSpace:(id)a3
{
  id v4 = a3;
  if (self->_key
    && (objc_opt_respondsToSelector() & 1) != 0
    && (v5 = (CGImage *)[(NSString *)self->_key hdrGainMapImageForURL:*(void *)&self->_fillMode renderingIntent:HIDWORD(self->_keyHDRGainMap)], (id v6 = v5) != 0))
  {
    size_t Width = CGImageGetWidth(v5);
    size_t Height = CGImageGetHeight(v6);
    uint64_t v13 = [v4 cgColorSpace];
    uint64_t v11 = 0x842475241;
    int v12 = 8194;
    CGFloat v9 = -[PVInstructionGraphImageSourceNode loadImageTiles:size:colorSpace:imageProperties:](self, "loadImageTiles:size:colorSpace:imageProperties:", v6, v4, &v11, (double)Width, (double)Height);
    CGImageRelease(v6);
  }
  else
  {
    CGFloat v9 = 0;
  }

  return v9;
}

- (id)newCVPixelBufferCacheItemForImage:(HGRef<PVInstructionGraphContext>)a3
{
  size_t Height = (CGImage *)[(NSString *)self->_key imageForURL:*(void *)&self->_fillMode renderingIntent:HIDWORD(self->_keyHDRGainMap)];
  v5 = Height;
  if (Height)
  {
    size_t Width = CGImageGetWidth(Height);
    size_t Height = (CGImage *)CGImageGetHeight(v5);
  }
  else
  {
    size_t Width = 0;
  }
  double v7 = (double)Width;
  double v8 = (double)(unint64_t)Height;
  v20.double width = (double)Width;
  v20.height = (double)(unint64_t)Height;
  CachedImageInfo::Init((CachedImageInfo *)&self->super._transform.ty, v5 != 0, v20);
  if (!v5) {
    return 0;
  }
  ColorSpace = CGImageGetColorSpace(v5);
  uint64_t v10 = +[PVColorSpace pvColorSpaceFromCGColorSpace:ColorSpace];
  if (v10)
  {
    uint64_t v11 = (PVColorSpace *)v10;
  }
  else
  {
    if (ColorSpace && CGColorSpaceIsWideGamutRGB(ColorSpace))
    {
      unsigned __int8 v14 = +[PVColorSpace p3d65GammaColorSpace];
    }
    else
    {
      unsigned __int8 v14 = +[PVColorSpace sRGBColorSpace];
    }
    uint64_t v11 = v14;
    CopyWithColorSpace = CGImageCreateCopyWithColorSpace(v5, [(PVColorSpace *)v14 cgColorSpace]);
    if (CopyWithColorSpace)
    {
      CGImageRelease(v5);
      ColorSpace = CGImageGetColorSpace(CopyWithColorSpace);
      goto LABEL_15;
    }
  }
  CopyWithColorSpace = v5;
LABEL_15:
  if ([(PVColorSpace *)v11 isExtendedSRGBColorSpace])
  {
    uint64_t v15 = +[PVColorSpace pvColorSpaceFromCGColorSpace:ColorSpace];
    float v16 = v15;
    if (v15
      && (([v15 isSRGBColorSpace] & 1) != 0 || objc_msgSend(v16, "isRec709GammaColorSpace")))
    {
      float v17 = v16;

      uint64_t v11 = v17;
    }
  }
  memset(v19, 0, sizeof(v19));
  PVImagePropertiesForColorSpace(v11, 1, (uint64_t)v19);
  uint64_t v13 = -[PVInstructionGraphImageSourceNode loadImageTiles:size:colorSpace:imageProperties:](self, "loadImageTiles:size:colorSpace:imageProperties:", CopyWithColorSpace, v11, v19, v7, v8);
  CGImageRelease(CopyWithColorSpace);

  return v13;
}

- (id)loadImageTiles:(CGImage *)a3 size:(CGSize)a4 colorSpace:(id)a5 imageProperties:(PVImageProperties *)a6
{
  double height = a4.height;
  double width = a4.width;
  objc_super v31 = (PVColorSpace *)a5;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v9 = (unint64_t)height;
  if ((unint64_t)height)
  {
    int v27 = 0;
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    while (1)
    {
      size_t v11 = v9 >= 0x1000 ? 4096 : v9;
      if ((unint64_t)width) {
        break;
      }
LABEL_15:
      v27 += 4096;
      v9 -= v11;
      if (!v9) {
        goto LABEL_16;
      }
    }
    int v12 = 0;
    unint64_t v13 = (unint64_t)width;
    while (1)
    {
      size_t v14 = v13 >= 0x1000 ? 4096 : v13;
      PVPixelBufferCreationOptions();
      CFDictionaryRef v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CVPixelBufferRef pixelBufferOut = 0;
      CVPixelBufferCreate(v10, v14, v11, a6->var0, v15, &pixelBufferOut);
      if (!pixelBufferOut) {
        break;
      }
      CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
      size_t var1 = a6->var1;
      size_t BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
      id v19 = CGBitmapContextCreate(BaseAddress, v14, v11, var1, BytesPerRow, a6->var3, a6->var2);
      v35.origin.x = (double)v12;
      v35.origin.y = (double)v27;
      v35.size.double width = (double)v14;
      v35.size.double height = (double)v11;
      CGSize v20 = CGImageCreateWithImageInRect(a3, v35);
      v36.origin.x = 0.0;
      v36.origin.y = 0.0;
      v36.size.double width = (double)v14;
      v36.size.double height = (double)v11;
      CGContextDrawImage(v19, v36, v20);
      CGImageRelease(v20);
      CGContextRelease(v19);
      CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
      unsigned __int8 v23 = atomic_load(HGLogger::_enabled);
      if (v23) {
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)2, (HGLogger *)"PVIGImageSourceNode (%p): createCVPixelBuffer for image. w=%zu, h=%zu, size=%lu\n", v21, v22, self, v13, v9, ((v13 * v9) >> 18) & 0x1FFFFFFFFFFLL);
      }
      [v32 addObject:pixelBufferOut];
      CVPixelBufferRelease(pixelBufferOut);
      PVAddColorSpaceAttributesToCVPixelBuffer(pixelBufferOut, v31);
      double v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", (double)v12, (double)v27, (double)v14, (double)v11);
      [v30 addObject:v24];

      v13 -= v14;
      v12 += 4096;
      if (!v13) {
        goto LABEL_15;
      }
    }

    double v25 = 0;
  }
  else
  {
LABEL_16:
    double v25 = -[CVPixelBufferCacheItem initWithCVPixelBuffers:DODs:fullSize:colorSpace:]([CVPixelBufferCacheItem alloc], "initWithCVPixelBuffers:DODs:fullSize:colorSpace:", v32, v30, v31, width, height);
  }

  return v25;
}

- (HGRef<HGNode>)internalHGNodeForTime:(id *)a3 trackInputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  v182 = v6;
  uint64_t v229 = *MEMORY[0x1E4F143B8];
  id v184 = [(PVInstructionGraphImageSourceNode *)self key];
  HGTraceGuard::HGTraceGuard((HGTraceGuard *)v227, "kPVInstructionGraphToHeliumGraphLogContext", 1, "-[PVInstructionGraphImageSourceNode hgNodeForTime:...]");
  unsigned __int8 v7 = atomic_load(HGLogger::_enabled);
  if (v7)
  {
    uint64_t v8 = [v184 UTF8String];
    HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)1, (HGLogger *)"Image Key: %s\n", v9, v10, v8);
  }
  if (HIDWORD(self->_keyHDRGainMap) == 1) {
    [(id)sExportRenderAndLoadLock lock];
  }
  [(id)sInputBitmapCacheLock lock];
  size_t v11 = [(id)sInputBitmapCache objectForKey:v184];
  int v12 = v11;
  if (v11) {
    [(HGInputBitmapCacheItem *)v11 updateLastUsedTime];
  }
  [(id)sInputBitmapCacheLock unlock];
  if (v12) {
    goto LABEL_63;
  }
  [(id)sImageLoadLock lock];
  [(id)sInputBitmapCacheLock lock];
  unint64_t v13 = [(id)sInputBitmapCache objectForKey:v184];
  int v12 = v13;
  if (v13) {
    [(HGInputBitmapCacheItem *)v13 updateLastUsedTime];
  }
  [(id)sInputBitmapCacheLock unlock];
  if (!v12)
  {
    id v186 = [(id)sPixelBufferCache objectForKey:v184];
    if (!v186)
    {
      uint64_t v15 = *(void *)a6.m_Obj;
      uint64_t v226 = v15;
      if (v15) {
        (*(void (**)(uint64_t))(*(void *)v15 + 16))(v15);
      }
      id v186 = [(PVInstructionGraphImageSourceNode *)self newCVPixelBufferCacheItemForImage:&v226];
      if (v226) {
        (*(void (**)(uint64_t))(*(void *)v226 + 24))(v226);
      }
      if (!v186)
      {
        [(id)sImageLoadLock unlock];
        if (HIDWORD(self->_keyHDRGainMap) == 1) {
          [(id)sExportRenderAndLoadLock unlock];
        }
        v142 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
        HGSolidColor::HGSolidColor(v142);
      }
      unsigned __int8 v16 = atomic_load(HGLogger::_enabled);
      if (v16)
      {
        uint64_t v17 = [v184 UTF8String];
        HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)2, (HGLogger *)"PVIGImageSourceNode (%p): hgNodeForTime: Created CVPixel Buffer for key: %s\n", v18, v19, self, v17);
      }
    }
    if (LOBYTE(self->m_renderManager.m_Obj))
    {
      id v177 = [(id)sPixelBufferCache objectForKey:*(void *)&self->_useHDRGainMap];
      if (!v177)
      {
        size_t v14 = [v186 colorSpace];
        id v177 = [(PVInstructionGraphImageSourceNode *)self newCVPixelBufferCacheItemForGainMapWithColorSpace:v14];
      }
    }
    else
    {
      id v177 = 0;
    }
    [(id)sInputBitmapCacheLock lock];
    memset(&v205, 0, 24);
    long long v222 = 0u;
    long long v223 = 0u;
    long long v224 = 0u;
    long long v225 = 0u;
    CGSize v20 = [v186 buffers];
    uint64_t v21 = [v20 countByEnumeratingWithState:&v222 objects:v228 count:16];
    if (v21)
    {
      int v22 = 0;
      uint64_t v23 = *(void *)v223;
      do
      {
        uint64_t v24 = 0;
        uint64_t v25 = v22;
        do
        {
          if (*(void *)v223 != v23) {
            objc_enumerationMutation(v20);
          }
          double v26 = *(__CVBuffer **)(*((void *)&v222 + 1) + 8 * v24);
          PixelFormatType = (HGCV *)CVPixelBufferGetPixelFormatType(v26);
          int v29 = HGCV::HGFormatForCVPixelFormat(PixelFormatType, 0, v28);
          HGCVBitmap::create((HGCVPixelBuffer *)v26, v29, 0, &v204);
          id v30 = [v186 DODs];
          objc_super v31 = [v30 objectAtIndex:v25 + v24];
          [v31 CGRectValue];
          double v33 = v32;
          double v35 = v34;
          double v37 = v36;
          double v39 = v38;

          float v40 = v33;
          float v41 = v35;
          float v42 = v33 + v37;
          float v43 = v35 + v39;
          uint64_t v45 = HGRectMake4f(v44, v40, v41, v42, v43);
          CGFloat a = v204.a;
          *(void *)(*(void *)&v204.a + 20) = v45;
          *(void *)(*(void *)&a + 28) = v47;
          (*(void (**)(CGFloat))(**(void **)&a + 16))(COERCE_CGFLOAT(*(void *)&a));
          CGFloat b = v205.b;
          if (*(void *)&v205.b >= *(void *)&v205.c)
          {
            uint64_t v50 = (uint64_t)(*(void *)&v205.b - *(void *)&v205.a) >> 3;
            if ((unint64_t)(v50 + 1) >> 61) {
              std::vector<double>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v51 = (uint64_t)(*(void *)&v205.c - *(void *)&v205.a) >> 2;
            if (v51 <= v50 + 1) {
              unint64_t v51 = v50 + 1;
            }
            if (*(void *)&v205.c - *(void *)&v205.a >= 0x7FFFFFFFFFFFFFF8uLL) {
              unint64_t v52 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v52 = v51;
            }
            double v210 = COERCE_DOUBLE((CGAffineTransform *)&v205.c);
            if (v52) {
              v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v205.c, v52);
            }
            else {
              v53 = 0;
            }
            v54 = (CGFloat *)&v53[8 * v50];
            *(void *)&long long v208 = v53;
            *((void *)&v208 + 1) = v54;
            *((void *)&v209 + 1) = &v53[8 * v52];
            CGFloat *v54 = a;
            *(void *)&long long v209 = v54 + 1;
            std::vector<HGRef<HGBitmap>>::__swap_out_circular_buffer((uint64_t *)&v205, &v208);
            CGFloat v49 = v205.b;
            std::__split_buffer<HGRef<HGBitmap>>::~__split_buffer((void **)&v208);
          }
          else
          {
            **(CGFloat **)&v205.CGFloat b = a;
            *(void *)&CGFloat v49 = *(void *)&b + 8;
          }
          v205.CGFloat b = v49;
          if (*(void *)&v204.a) {
            (*(void (**)(void))(**(void **)&v204.a + 24))(*(void *)&v204.a);
          }
          ++v24;
        }
        while (v21 != v24);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v222 objects:v228 count:16];
        int v22 = v25 + v24;
      }
      while (v21);
    }

    if (v177)
    {
      v55 = [v177 buffers];
      v56 = [v55 objectAtIndexedSubscript:0];

      v57 = (HGCV *)CVPixelBufferGetPixelFormatType((CVPixelBufferRef)v56);
      int v59 = HGCV::HGFormatForCVPixelFormat(v57, 0, v58);
      HGCVBitmap::create(v56, v59, 0, &v208);
      v60 = [v177 DODs];
      v61 = [v60 objectAtIndex:0];
      [v61 CGRectValue];
      double v63 = v62;
      double v65 = v64;
      double v67 = v66;
      double v69 = v68;

      float v70 = v63;
      float v71 = v65;
      float v72 = v63 + v67;
      float v73 = v65 + v69;
      uint64_t v75 = HGRectMake4f(v74, v70, v71, v72, v73);
      uint64_t v76 = v208;
      *(void *)(v208 + 20) = v75;
      *(void *)(v76 + 28) = v77;
      (*(void (**)(uint64_t))(*(void *)v76 + 16))(v76);
      if ((void)v208) {
        (*(void (**)(void))(*(void *)v208 + 24))(v208);
      }
    }
    else
    {
      uint64_t v76 = 0;
    }
    v78 = [HGInputBitmapCacheItem alloc];
    [v186 fullSize];
    double v80 = v79;
    double v82 = v81;
    v83 = [v186 colorSpace];
    uint64_t v221 = v76;
    if (v76) {
      (*(void (**)(uint64_t))(*(void *)v76 + 16))(v76);
    }
    int v12 = -[HGInputBitmapCacheItem initWithHGBitmap:fullSize:colorSpace:gainMap:](v78, "initWithHGBitmap:fullSize:colorSpace:gainMap:", &v205, v83, &v221, v80, v82);
    if (v221) {
      (*(void (**)(uint64_t))(*(void *)v221 + 24))(v221);
    }

    if (v184 && v12)
    {
      [(id)sInputBitmapCache setObject:v12 forKey:v184];
      [(HGInputBitmapCacheItem *)v12 updateLastUsedTime];
    }
    [(id)sInputBitmapCacheLock unlock];
    unsigned __int8 v84 = atomic_load(HGLogger::_enabled);
    if (v84)
    {
      uint64_t v85 = [v184 UTF8String];
      HGLogger::log((HGLogger *)"kPVInstructionGraphToHeliumGraphLogContext", (const char *)2, (HGLogger *)"PVIGImageSourceNode (%p): Cached Texture for key: %s\n", v86, v87, self, v85);
    }
    [(id)sPixelBufferCache removeObjectForKey:v184];
    if (v177) {
      [(id)sPixelBufferCache removeObjectForKey:*(void *)&self->_useHDRGainMap];
    }
    if (v76) {
      (*(void (**)(uint64_t))(*(void *)v76 + 24))(v76);
    }
    *(void *)&long long v208 = &v205;
    std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v208);
  }
  [(id)sImageLoadLock unlock];
  if (v12)
  {
LABEL_63:
    [(HGInputBitmapCacheItem *)v12 bitmaps];
    char v88 = 0;
    uint64_t v89 = *((void *)&v208 + 1);
    uint64_t v90 = v208;
  }
  else
  {
    uint64_t v90 = 0;
    uint64_t v89 = 0;
    long long v208 = 0uLL;
    char v88 = 1;
    *(void *)&long long v209 = 0;
  }
  unint64_t v91 = v89 - v90;
  *(void *)&v205.CGFloat a = &v208;
  std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v205);
  if (v91 < 9)
  {
    [(HGInputBitmapCacheItem *)v12 bitmaps];
    v93 = *(HGBitmap **)v208;
    CGFloat v92 = COERCE_DOUBLE(HGObject::operator new(0x1F0uLL));
    HGBitmapLoader::HGBitmapLoader(*(HGBitmapLoader **)&v92, v93);
    *(void *)&v205.CGFloat a = &v208;
    std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v205);
    goto LABEL_80;
  }
  CGFloat v92 = COERCE_DOUBLE(HGObject::operator new(0x1A0uLL));
  HGOverwrite::HGOverwrite(*(HGOverwrite **)&v92);
  if (v88)
  {
    long long v208 = 0uLL;
    *(void *)&long long v209 = 0;
    goto LABEL_78;
  }
  [(HGInputBitmapCacheItem *)v12 bitmaps];
  v95 = (HGBitmap **)*((void *)&v208 + 1);
  v94 = (HGBitmap **)v208;
  if ((void)v208 == *((void *)&v208 + 1))
  {
LABEL_78:
    *(void *)&v205.CGFloat a = &v208;
    std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v205);
    if (v92 == 0.0) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
  uint64_t v96 = 0;
  do
  {
    v97 = *v94;
    if (*v94) {
      (*(void (**)(HGBitmap *))(*(void *)v97 + 16))(*v94);
    }
    v98 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
    HGBitmapLoader::HGBitmapLoader(v98, v97);
    (*(void (**)(CGFloat, uint64_t, HGBitmapLoader *))(**(void **)&v92 + 120))(COERCE_CGFLOAT(*(void *)&v92), v96, v98);
    if (v98) {
      (*(void (**)(HGBitmapLoader *))(*(void *)v98 + 24))(v98);
    }
    if (v97) {
      (*(void (**)(HGBitmap *))(*(void *)v97 + 24))(v97);
    }
    ++v94;
    uint64_t v96 = (v96 + 1);
  }
  while (v94 != v95);
  *(void *)&v205.CGFloat a = &v208;
  std::vector<HGRef<HGBitmap>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v205);
LABEL_79:
  (*(void (**)(CGFloat))(**(void **)&v92 + 16))(COERCE_CGFLOAT(*(void *)&v92));
  (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
LABEL_80:
  if (v12)
  {
    [(HGInputBitmapCacheItem *)v12 fullSize];
  }
  else
  {
    uint64_t v99 = *MEMORY[0x1E4F1DB30];
    uint64_t v100 = *(void *)(MEMORY[0x1E4F1DB30] + 8);
  }
  CachedImageInfo::Init((CachedImageInfo *)&self->super._transform.ty, v12 != 0, *(CGSize *)&v99);
  if (LOBYTE(self->m_renderManager.m_Obj))
  {
    if ((v88 & 1) == 0)
    {
      [(HGInputBitmapCacheItem *)v12 gainMap];
      if ((void)v208)
      {
        (*(void (**)(void))(*(void *)v208 + 24))(v208);
        v101 = [(HGInputBitmapCacheItem *)v12 colorSpace];
        id v102 = [v101 nclcTriplet];

        PVCreateColorConform([v102 hgColorPrimary], objc_msgSend(v102, "hgTransferFunction"), 0, 3, 8, 0, (HGColorConform **)&v208);
        (*(void (**)(void, void, CGFloat))(*(void *)v208 + 120))(v208, 0, COERCE_CGFLOAT(*(void *)&v92));
        if (*(void *)&v92 == (void)v208)
        {
          CGFloat v220 = v92;
          if (v92 != 0.0) {
            goto LABEL_118;
          }
        }
        else
        {
          if (v92 == 0.0)
          {
            CGFloat v92 = *(double *)&v208;
            if ((void)v208) {
              goto LABEL_89;
            }
          }
          else
          {
            (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
            CGFloat v92 = *(double *)&v208;
            if ((void)v208)
            {
LABEL_89:
              (*(void (**)(CGFloat))(**(void **)&v92 + 16))(COERCE_CGFLOAT(*(void *)&v92));
              CGFloat v220 = v92;
LABEL_118:
              (*(void (**)(CGFloat))(**(void **)&v92 + 16))(COERCE_CGFLOAT(*(void *)&v92));
              char v134 = 0;
              goto LABEL_122;
            }
          }
          CGFloat v220 = 0.0;
        }
        char v134 = 1;
LABEL_122:
        [(HGInputBitmapCacheItem *)v12 gainMap];
        LODWORD(v135) = HIDWORD(self->m_renderManager.m_Obj);
        [(PVInstructionGraphImageSourceNode *)self applyGainMapToGraph:&v220 gainMap:&v219 withHeadroom:v135];
        CGFloat v136 = v205.a;
        if (*(void *)&v92 == *(void *)&v205.a)
        {
          if (v92 != 0.0) {
            (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
          }
        }
        else
        {
          if ((v134 & 1) == 0)
          {
            (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
            CGFloat v136 = v205.a;
          }
          v205.CGFloat a = 0.0;
          CGFloat v92 = v136;
        }
        if (v219) {
          (*(void (**)(uint64_t))(*(void *)v219 + 24))(v219);
        }
        if (v220 != 0.0) {
          (*(void (**)(CGFloat))(**(void **)&v220 + 24))(COERCE_CGFLOAT(*(void *)&v220));
        }
        PVCreateColorConform(3, 8, 0, 3, 1, 0, (HGColorConform **)&v205);
        (*(void (**)(void, void, CGFloat))(**(void **)&v205.a + 120))(*(void *)&v205.a, 0, COERCE_CGFLOAT(*(void *)&v92));
        if (*(void *)&v92 != *(void *)&v205.a)
        {
          if (v92 == 0.0)
          {
            CGFloat v92 = v205.a;
            if (!*(void *)&v205.a) {
              goto LABEL_138;
            }
          }
          else
          {
            (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
            CGFloat v92 = v205.a;
            if (!*(void *)&v205.a) {
              goto LABEL_138;
            }
          }
          (*(void (**)(CGFloat))(**(void **)&v92 + 16))(COERCE_CGFLOAT(*(void *)&v92));
        }
LABEL_138:
        double v137 = COERCE_DOUBLE(HGObject::operator new(0x1B0uLL));
        HGHLG::SDRToHLG::SDRToHLG(*(uint64_t *)&v137, 2, 1);
        (*(void (**)(double, void, CGFloat))(**(void **)&v137 + 120))(COERCE_DOUBLE(*(void *)&v137), 0, COERCE_CGFLOAT(*(void *)&v92));
        if (*(void *)&v92 != *(void *)&v137)
        {
          if (v92 != 0.0) {
            (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
          }
          CGFloat v92 = v137;
          (*(void (**)(double))(**(void **)&v137 + 16))(COERCE_DOUBLE(*(void *)&v137));
        }
        v138 = PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
        v139 = [v138 nclcTriplet];

        PVCreateColorConform(3, 8, 0, [v139 hgColorPrimary], objc_msgSend(v139, "hgTransferFunction"), 0, (HGColorConform **)&v204);
        (*(void (**)(void, void, CGFloat))(**(void **)&v204.a + 120))(*(void *)&v204.a, 0, COERCE_CGFLOAT(*(void *)&v92));
        if (*(void *)&v92 == *(void *)&v204.a)
        {
          CGFloat v140 = v92;
          if (v92 == 0.0) {
            goto LABEL_151;
          }
          goto LABEL_150;
        }
        if (v92 == 0.0)
        {
          CGFloat v92 = v204.a;
          if (!*(void *)&v204.a) {
            goto LABEL_151;
          }
        }
        else
        {
          (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
          CGFloat v92 = v204.a;
          if (!*(void *)&v204.a) {
            goto LABEL_151;
          }
        }
        (*(void (**)(CGFloat))(**(void **)&v92 + 16))(COERCE_CGFLOAT(*(void *)&v92));
        CGFloat v140 = v204.a;
        if (*(void *)&v204.a) {
LABEL_150:
        }
          (*(void (**)(CGFloat))(**(void **)&v140 + 24))(COERCE_CGFLOAT(*(void *)&v140));
LABEL_151:

        (*(void (**)(double))(**(void **)&v137 + 24))(COERCE_DOUBLE(*(void *)&v137));
        if (*(void *)&v205.a) {
          (*(void (**)(void))(**(void **)&v205.a + 24))(*(void *)&v205.a);
        }
        if ((void)v208) {
          (*(void (**)(void))(*(void *)v208 + 24))(v208);
        }
        goto LABEL_102;
      }
    }
  }
  CGFloat v218 = v92;
  if (v92 != 0.0) {
    (*(void (**)(CGFloat))(**(void **)&v92 + 16))(COERCE_CGFLOAT(*(void *)&v92));
  }
  v103 = [(HGInputBitmapCacheItem *)v12 colorSpace];
  v104 = PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
  int v105 = PVInstructionGraphContext::WorkingColorSpaceConformIntent(*(PVInstructionGraphContext **)a6.m_Obj);
  id v217 = 0;
  ColorConformInput((HGColorConform **)&v218, v103, v104, v105, &v217, (HGColorConform **)&v208);
  id v102 = v217;
  if (*(void *)&v92 == (void)v208)
  {
    if (v92 != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
    }
  }
  else
  {
    if (v92 != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
    }
    CGFloat v92 = *(double *)&v208;
    *(void *)&long long v208 = 0;
  }

  if (v218 != 0.0) {
    (*(void (**)(CGFloat))(**(void **)&v218 + 24))(COERCE_CGFLOAT(*(void *)&v218));
  }
  if (v102)
  {
    v106 = [(HGInputBitmapCacheItem *)v12 colorSpace];
    v107 = PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
    NSLog(&cfstr_ErrorInColorCo.isa, v106, v107);
  }
LABEL_102:

  v108 = (double *)MEMORY[0x1E4F1DAB8];
  long long v109 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v215 = *MEMORY[0x1E4F1DAB8];
  long long v216 = v109;
  if (!LOBYTE(self->m_cachedImageInfo.size.height))
  {
    if (HIDWORD(self->_keyHDRGainMap) == 1) {
      [(id)sExportRenderAndLoadLock unlock];
    }
    v127 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v127);
  }
  if ([(PVInstructionGraphImageSourceNode *)self useAnimationInfo])
  {
    long long v110 = *((_OWORD *)v108 + 1);
    long long v213 = *(_OWORD *)v108;
    long long v214 = v110;
    double v111 = v108[4];
    CGFloat v112 = v108[5];
    double v114 = *(double *)&self->m_cachedImageInfo.cached;
    double width = self->m_cachedImageInfo.size.width;
    double v115 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
    float v116 = (*(float (**)(void))(**(void **)a6.m_Obj + 48))();
    (*(void (**)(void))(**(void **)a6.m_Obj + 40))();
    double v118 = v117;
    float v119 = (*(float (**)(void))(**(void **)a6.m_Obj + 48))();
    CGFloat v178 = v111;
    uint64_t v120 = [(PVInstructionGraphSourceNode *)self transformAnimationContentMode];
    uint64_t v121 = v120;
    double v122 = v115 * v116;
    double v123 = v118 * v119;
    double v124 = v123;
    double v125 = v122;
    if (!v120) {
      goto LABEL_167;
    }
    double v124 = v123;
    double v125 = v122;
    if (v120 == 3) {
      goto LABEL_167;
    }
    int v126 = *(_DWORD *)&self->_useAnimationInfo;
    if (v126 > 2)
    {
      double v125 = v122;
      double v124 = v123;
      if (v126 != 3)
      {
        if (v126 == 13)
        {
          double v124 = v122 / (v114 / width);
          double v125 = v122;
        }
        else
        {
          double v125 = v114;
          double v124 = width;
          if (v126 == 14)
          {
            double v125 = v114 / width * v123;
            double v124 = v123;
          }
        }
      }
      goto LABEL_164;
    }
    if (v126 == 1)
    {
      if (v122 <= v123)
      {
        double v141 = v123 / width;
        if (v114 * (v123 / width) < v122) {
          double v141 = v122 / v114;
        }
      }
      else
      {
        double v141 = v122 / v114;
        if (width * (v122 / v114) < v123) {
          double v141 = v123 / width;
        }
      }
    }
    else
    {
      double v125 = v114;
      double v124 = width;
      if (v126 != 2)
      {
LABEL_164:
        v143 = [(PVInstructionGraphSourceNode *)self transformAnimation];
        [v143 aspectRatio];
        switch(*(_DWORD *)&self->_useAnimationInfo)
        {
          case 1:
            if (v125 / v144 <= v124) {
              double v124 = v125 / v144;
            }
            double v125 = v144 * v124;
            break;
          case 2:
            if (v125 <= v124)
            {
              double v175 = v124;
              if (v124 * v144 < v125) {
                double v175 = v125 / v144;
              }
            }
            else
            {
              double v175 = v125 / v144;
              if (v125 / v144 < v124) {
                double v175 = v124;
              }
            }
            double v125 = v144 * v175;
            double v124 = v175;
            break;
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 0xA:
          case 0xB:
          case 0xC:
            double v124 = 1.0;
            double v125 = v144;
            break;
          case 0xD:
            double v124 = v125 / v144;
            break;
          case 0xE:
            double v125 = v124 * v144;
            break;
          default:
            break;
        }

LABEL_167:
        v145 = [(PVInstructionGraphSourceNode *)self transformAnimation];
        long long v206 = *(_OWORD *)&a3->var0;
        int64_t var3 = a3->var3;
        BOOL v146 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v145, &v206, v121, 0, &v208, v125, v124);

        double v187 = width;
        double v147 = v122;
        *(double *)&v181 = v123;
        if (v146)
        {
          float v148 = v211;
          float v149 = *((double *)&v209 + 1);
          float v176 = v149;
          float v150 = v210;
          float v180 = v150;
          float v151 = v212;
        }
        else
        {
          float v176 = 0.0;
          float v148 = 1.0;
          float v180 = 0.0;
          float v151 = 0.0;
        }
        float v152 = v114 * -0.5;
        float v153 = v187 * -0.5;
        memset(&v205, 0, sizeof(v205));
        double v154 = v152;
        double v155 = v153;
        CGAffineTransformMakeTranslation(&v205, v152, v153);
        *(_OWORD *)&t1.CGFloat a = v213;
        *(_OWORD *)&t1.c = v214;
        t1.CGFloat tx = v178;
        t1.CGFloat ty = v112;
        CGAffineTransform t2 = v205;
        CGAffineTransformConcat(&v204, &t1, &t2);
        long long v213 = *(_OWORD *)&v204.a;
        long long v214 = *(_OWORD *)&v204.c;
        CGFloat tx = v204.tx;
        CGFloat ty = v204.ty;
        long long v158 = *((_OWORD *)v108 + 1);
        *(_OWORD *)&v204.CGFloat a = *(_OWORD *)v108;
        *(_OWORD *)&v204.c = v158;
        *(_OWORD *)&v204.CGFloat tx = *((_OWORD *)v108 + 2);
        if (v151 != 0.0)
        {
          long long v159 = *((_OWORD *)v108 + 1);
          *(_OWORD *)&v201.CGFloat a = *(_OWORD *)v108;
          *(_OWORD *)&v201.c = v159;
          *(_OWORD *)&v201.CGFloat tx = *((_OWORD *)v108 + 2);
          CGAffineTransformRotate(&v204, &v201, v151 * 3.14159265 / 180.0);
        }
        long long v160 = *((_OWORD *)v108 + 1);
        *(_OWORD *)&v199.CGFloat a = *(_OWORD *)v108;
        *(_OWORD *)&v199.c = v160;
        *(_OWORD *)&v199.CGFloat tx = *((_OWORD *)v108 + 2);
        CGAffineTransformTranslate(&v200, &v199, v154, v155);
        int v161 = *(_DWORD *)&self->_useAnimationInfo;
        if (v161)
        {
          double v162 = fabs(v114 * v200.b + v187 * v200.d);
          double v163 = fabs(v114 * v200.a + v187 * v200.c);
          if (v161 <= 2)
          {
            if (v161 == 1)
            {
              if (v147 <= *(double *)&v181)
              {
                double v168 = *(double *)&v181 / v162;
                if (v163 * (*(double *)&v181 / v162) < v147) {
                  double v168 = v147 / v163;
                }
              }
              else
              {
                double v168 = v147 / v163;
                if (v162 * (v147 / v163) < *(double *)&v181) {
                  double v168 = *(double *)&v181 / v162;
                }
              }
              double v164 = v163 * v168;
              goto LABEL_195;
            }
            if (v161 == 2)
            {
              double v166 = v162 * (v147 / v163);
              double v167 = *(double *)&v181 / v162;
              if (v166 <= *(double *)&v181) {
                double v167 = v147 / v163;
              }
              double v164 = v163 * v167;
              goto LABEL_195;
            }
            goto LABEL_188;
          }
          double v164 = v147;
          if (v161 == 3)
          {
LABEL_195:
            double v165 = v164 / v163;
            goto LABEL_196;
          }
          if (v161 != 13)
          {
            if (v161 == 14)
            {
              double v164 = *(double *)&v181 * (v163 / v162);
              goto LABEL_195;
            }
LABEL_188:
            double v164 = v163;
            goto LABEL_195;
          }
          double v165 = v147 / (v163 / v162) / v162;
        }
        else
        {
          double v165 = 1.0;
        }
LABEL_196:
        memset(&v200, 0, sizeof(v200));
        CGAffineTransformMakeScale(&v200, v165 * v148, v165 * v148);
        if (v151 != 0.0)
        {
          *(_OWORD *)&v197.CGFloat a = v213;
          *(_OWORD *)&v197.c = v214;
          v197.CGFloat tx = tx;
          v197.CGFloat ty = ty;
          CGAffineTransform v196 = v204;
          CGAffineTransformConcat(&v198, &v197, &v196);
          long long v213 = *(_OWORD *)&v198.a;
          long long v214 = *(_OWORD *)&v198.c;
          CGFloat tx = v198.tx;
          CGFloat ty = v198.ty;
        }
        *(_OWORD *)&v195.CGFloat a = v213;
        *(_OWORD *)&v195.c = v214;
        v195.CGFloat tx = tx;
        v195.CGFloat ty = ty;
        CGAffineTransform v194 = v200;
        CGAffineTransformConcat(&v198, &v195, &v194);
        long long v213 = *(_OWORD *)&v198.a;
        long long v214 = *(_OWORD *)&v198.c;
        CGFloat v169 = v198.tx;
        CGFloat v170 = v198.ty;
        float v171 = v114 * 0.5 + floor(v147 - v114) * 0.5 + v176;
        float v172 = v187 * 0.5 + floor(*(double *)&v181 - v187) * 0.5 + v180;
        CGAffineTransformMakeTranslation(&v198, v171, v172);
        CGAffineTransform v205 = v198;
        *(_OWORD *)&v193.CGFloat a = v213;
        *(_OWORD *)&v193.c = v214;
        v193.CGFloat tx = v169;
        v193.CGFloat ty = v170;
        CGAffineTransform v192 = v198;
        CGAffineTransformConcat(&v198, &v193, &v192);
        long long v213 = *(_OWORD *)&v198.a;
        long long v214 = *(_OWORD *)&v198.c;
        double v128 = v198.tx;
        double v129 = v198.ty;
        long long v215 = *(_OWORD *)&v198.a;
        long long v216 = *(_OWORD *)&v198.c;
        goto LABEL_199;
      }
      double v141 = v122 / v114;
      if (width * (v122 / v114) > v123) {
        double v141 = v123 / width;
      }
    }
    double v125 = v114 * v141;
    double v124 = width * v141;
    goto LABEL_164;
  }
  [(PVInstructionGraphSourceNode *)self transform];
  long long v215 = v208;
  long long v216 = v209;
  double v128 = v210;
  double v129 = v211;
  if (![(PVInstructionGraphSourceNode *)self isOverlayTrack])
  {
    double v130 = *(double *)&self->m_cachedImageInfo.cached;
    double v131 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
    double v132 = self->m_cachedImageInfo.size.width;
    (*(void (**)(void))(**(void **)a6.m_Obj + 40))();
    double v128 = v128 * (v130 / v131);
    double v129 = v129 * (v132 / v133);
  }
LABEL_199:
  CGFloat v191 = v92;
  if (v92 != 0.0) {
    (*(void (**)(CGFloat))(**(void **)&v92 + 16))(COERCE_CGFLOAT(*(void *)&v92));
  }
  v188[0] = v215;
  v188[1] = v216;
  double v189 = v128;
  double v190 = v129;
  int v173 = (*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))();
  HGXFormForCGAffineTransform((HGXForm **)&v191, v188, v173, (HGXForm **)&v208);
  if (*(void *)&v92 == (void)v208)
  {
    if (v92 != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
    }
  }
  else
  {
    if (v92 != 0.0) {
      (*(void (**)(CGFloat))(**(void **)&v92 + 24))(COERCE_CGFLOAT(*(void *)&v92));
    }
    CGFloat v92 = *(double *)&v208;
    *(void *)&long long v208 = 0;
  }
  if (v191 != 0.0) {
    (*(void (**)(CGFloat))(**(void **)&v191 + 24))(COERCE_CGFLOAT(*(void *)&v191));
  }
  if (HIDWORD(self->_keyHDRGainMap) == 1) {
    [(id)sExportRenderAndLoadLock unlock];
  }
  CGFloat *v182 = v92;

  HGTraceGuard::~HGTraceGuard((HGTraceGuard *)v227);
  return v174;
}

- (PCRect<double>)inputSizeForPVEffect:(id)a3 igContext:(HGRef<PVInstructionGraphContext>)a4
{
  uint64_t v6 = v4;
  id v22 = a3;
  *(void *)uint64_t v6 = 0;
  *(void *)(v6 + 8) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v6 + 16) = _Q0;
  p_CGFloat ty = &self->super._transform.ty;
  CachedImageInfo::Init((CachedImageInfo *)p_ty);
  if (*((unsigned char *)p_ty + 24))
  {
    double v14 = p_ty[1];
    double v13 = p_ty[2];
    [v22 outputSize];
    if (v13 >= v14) {
      double v17 = v13 / v16;
    }
    else {
      double v17 = v14 / v15;
    }
    *(float64x2_t *)(v6 + 16) = vdivq_f64(*(float64x2_t *)(p_ty + 1), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v17, 0));
  }

  result.int64_t var3 = v21;
  result.var2 = v20;
  result.size_t var1 = v19;
  result.var0 = v18;
  return result;
}

- (PCMatrix44Tmpl<double>)pixelTransformForPVEffect:(SEL)a3 igContext:(id)a4
{
  id v32 = a4;
  retstr->var0[3][3] = 1.0;
  retstr->var0[2][2] = 1.0;
  retstr->var0[1][1] = 1.0;
  retstr->var0[0][0] = 1.0;
  *(_OWORD *)&retstr->var0[0][1] = 0u;
  *(_OWORD *)&retstr->var0[0][3] = 0u;
  *(_OWORD *)&retstr->var0[1][2] = 0u;
  *(_OWORD *)&retstr->var0[2][0] = 0u;
  *(_OWORD *)&retstr->var0[2][3] = 0u;
  *(_OWORD *)&retstr->var0[3][1] = 0u;
  CachedImageInfo::Init((CachedImageInfo *)&self->super._transform.ty);
  if (LOBYTE(self->m_cachedImageInfo.size.height))
  {
    if ([(PVInstructionGraphImageSourceNode *)self useAnimationInfo]
      || [(PVInstructionGraphSourceNode *)self isOverlayTrack])
    {
      double v8 = (*(double (**)(void))(**(void **)a5.m_Obj + 40))();
      double v10 = v9;
      float v11 = 1.0;
      if (![(PVInstructionGraphSourceNode *)self isOverlayTrack]) {
        float v11 = (*(float (**)(void))(**(void **)a5.m_Obj + 48))();
      }
      [v32 outputSize];
      double v13 = v12;
      [v32 outputSize];
      float v14 = v8;
      float v15 = v10;
      float v16 = v11 * v14;
      float v17 = v11 * v15;
      double v19 = v13 / v18;
      double v20 = (float)(v14 / v15);
      if (vabdd_f64(v19, v20) >= 0.0000001)
      {
        if (v19 > v20)
        {
LABEL_10:
          [v32 outputSize];
          double v22 = v17 / v21;
LABEL_15:
          float64x2_t v28 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, v22, -v22, 1.0);
          v28.f64[0] = v16;
          double v29 = v17;
LABEL_19:
          v28.f64[0] = v28.f64[0] * 0.5;
          PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)retstr, v28, v29 * 0.5, 0.0);
          goto LABEL_20;
        }
      }
      else if (v17 > v16)
      {
        goto LABEL_10;
      }
      [v32 outputSize];
      double v22 = v16 / v27;
      goto LABEL_15;
    }
    if ([v32 conformToInputAspect])
    {
      double v23 = *(double *)&self->m_cachedImageInfo.cached;
      double width = self->m_cachedImageInfo.size.width;
      if (width >= v23)
      {
        [v32 outputSize];
        double v26 = width / v25;
LABEL_18:
        float64x2_t v28 = PCMatrix44Tmpl<double>::leftScale((float64x2_t *)retstr, v26, -v26, 1.0);
        v28.f64[0] = *(float64_t *)&self->m_cachedImageInfo.cached;
        double v29 = self->m_cachedImageInfo.size.width;
        goto LABEL_19;
      }
    }
    else
    {
      double v23 = *(double *)&self->m_cachedImageInfo.cached;
    }
    [v32 outputSize];
    double v26 = v23 / v30;
    goto LABEL_18;
  }
LABEL_20:

  return result;
}

- (id)dotTreeLabel:(HGRef<PVInstructionGraphContext>)a3
{
  uint64_t v8 = *(void *)a3.m_Obj;
  if (v8) {
    (*(void (**)(uint64_t, SEL))(*(void *)v8 + 16))(v8, a2);
  }
  v7.receiver = self;
  v7.super_class = (Class)PVInstructionGraphImageSourceNode;
  uint64_t v4 = [(PVInstructionGraphNode *)&v7 dotTreeLabel:&v8];
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 24))(v8);
  }
  v5 = [v4 stringByAppendingFormat:@" [%.0f, %.0f]", *(void *)&self->m_cachedImageInfo.cached, *(void *)&self->m_cachedImageInfo.size.width];

  return v5;
}

- (id)instructionGraphNodeDescription
{
  v12.receiver = self;
  v12.super_class = (Class)PVInstructionGraphImageSourceNode;
  double v3 = [(PVInstructionGraphSourceNode *)&v12 instructionGraphNodeDescription];
  uint64_t v4 = (void *)[v3 mutableCopy];

  v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  [v4 setObject:v6 forKeyedSubscript:@"class"];

  objc_super v7 = [*(id *)&self->_fillMode absoluteString];
  if (v7)
  {
    uint64_t v8 = [*(id *)&self->_fillMode absoluteString];
  }
  else
  {
    uint64_t v8 = @"unable to get url.path as string";
  }
  [v4 setObject:v8 forKeyedSubscript:@"imageURL"];
  if (v7) {

  }
  double v9 = [(PVInstructionGraphImageSourceNode *)self key];
  [v4 setObject:v9 forKeyedSubscript:@"imageKey"];

  double v10 = [NSNumber numberWithInt:HIDWORD(self->_keyHDRGainMap)];
  [v4 setObject:v10 forKeyedSubscript:@"renderingIntent"];

  return v4;
}

- (NSURL)url
{
  return *(NSURL **)&self->_fillMode;
}

- (void)setUrl:(id)a3
{
}

- (NSString)key
{
  return (NSString *)&self->_url->super.isa;
}

- (void)setKey:(id)a3
{
}

- (PVImageDelegate)imageDelegate
{
  return (PVImageDelegate *)self->_key;
}

- (void)setImageDelegate:(id)a3
{
}

- (int)renderingIntent
{
  return HIDWORD(self->_keyHDRGainMap);
}

- (void)setRenderingIntent:(int)a3
{
  HIDWORD(self->_keyHDRGainMap) = a3;
}

- (BOOL)useAnimationInfo
{
  return (BOOL)self->_keyHDRGainMap;
}

- (void)setUseAnimationInfo:(BOOL)a3
{
  LOBYTE(self->_keyHDRGainMap) = a3;
}

- (int)fillMode
{
  return *(_DWORD *)&self->_useAnimationInfo;
}

- (void)setFillMode:(int)a3
{
  *(_DWORD *)&self->_useAnimationInfo = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_fillMode, 0);
  objc_storeStrong((id *)&self->_useHDRGainMap, 0);
  lock = self->m_cachedImageInfo._lock;
  if (lock) {
    (*((void (**)(HGSynchronizable *))lock->var0 + 3))(lock);
  }

  CachedImageInfo::~CachedImageInfo((CachedImageInfo *)&self->super._transform.ty);
}

- (id).cxx_construct
{
}

@end