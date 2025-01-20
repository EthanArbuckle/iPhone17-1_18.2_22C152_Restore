@interface PXGEffectWrappingTexture
+ (id)_dequeueTexture;
+ (id)_reusableTextures;
+ (id)createTexture;
+ (void)_reuseTexture:(id)a3;
- (BOOL)isAtlas;
- (BOOL)isCaptureTexture;
- (BOOL)isOpaque;
- (CGImage)imageRepresentation;
- (CGImage)sourceCGImage;
- (CGSize)pixelSize;
- (MTLTexture)chromaTexture;
- (MTLTexture)texture;
- (PXGColorProgram)colorProgram;
- (PXGEffectWrappingTexture)init;
- (PXGImageTexture)imageTextureParent;
- (PXGMetalSpriteTexture)parent;
- (__CVBuffer)sourceCVPixelBuffer;
- (__n128)orientationTransform;
- (float)alpha;
- (int)shaderFlags;
- (int64_t)estimatedByteSize;
- (int64_t)renderPipelineIndex;
- (unsigned)presentationType;
- (void)cleanupAfterRender:(int64_t)a3;
- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9;
- (void)prepareForRender:(int64_t)a3;
- (void)setParent:(id)a3;
- (void)setRenderPipelineIndex:(int64_t)a3;
@end

@implementation PXGEffectWrappingTexture

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageTextureParent, 0);
  objc_storeStrong((id *)&self->_parent, 0);

  objc_storeStrong((id *)&self->_lock_activeRenders, 0);
}

- (PXGImageTexture)imageTextureParent
{
  return self->_imageTextureParent;
}

- (PXGMetalSpriteTexture)parent
{
  return self->_parent;
}

- (__n128)orientationTransform
{
  v1 = [a1 imageTextureParent];
  [v1 orientationTransform];
  long long v4 = v2;

  return (__n128)v4;
}

- (__CVBuffer)sourceCVPixelBuffer
{
  long long v2 = [(PXGEffectWrappingTexture *)self imageTextureParent];
  v3 = (__CVBuffer *)[v2 sourceCVPixelBuffer];

  return v3;
}

- (CGImage)sourceCGImage
{
  long long v2 = [(PXGEffectWrappingTexture *)self imageTextureParent];
  v3 = (CGImage *)[v2 sourceCGImage];

  return v3;
}

- (CGImage)imageRepresentation
{
  long long v2 = [(PXGEffectWrappingTexture *)self imageTextureParent];
  v3 = (CGImage *)[v2 imageRepresentation];

  return v3;
}

- (unsigned)presentationType
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  unsigned __int8 v3 = [v2 presentationType];

  return v3;
}

- (int64_t)estimatedByteSize
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  int64_t v3 = [v2 estimatedByteSize];

  return v3;
}

- (CGSize)pixelSize
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  [v2 pixelSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int)shaderFlags
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  int v3 = [v2 shaderFlags];

  return v3;
}

- (BOOL)isCaptureTexture
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  char v3 = [v2 isCaptureTexture];

  return v3;
}

- (float)alpha
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  [v2 alpha];
  float v4 = v3;

  return v4;
}

- (BOOL)isOpaque
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  char v3 = [v2 isOpaque];

  return v3;
}

- (BOOL)isAtlas
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  char v3 = [v2 isAtlas];

  return v3;
}

- (void)setRenderPipelineIndex:(int64_t)a3
{
  id v4 = [(PXGEffectWrappingTexture *)self parent];
  [v4 setRenderPipelineIndex:a3];
}

- (int64_t)renderPipelineIndex
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  int64_t v3 = [v2 renderPipelineIndex];

  return v3;
}

- (void)cleanupAfterRender:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableIndexSet *)self->_lock_activeRenders removeIndex:a3];
  uint64_t v6 = [(NSMutableIndexSet *)self->_lock_activeRenders count];
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    [(PXGEffectWrappingTexture *)self setParent:0];
    [(PXGBaseTexture *)self removeAllSpriteIndexes];
    double v7 = objc_opt_class();
    [v7 _reuseTexture:self];
  }
}

- (void)prepareForRender:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableIndexSet *)self->_lock_activeRenders addIndex:a3];

  os_unfair_lock_unlock(p_lock);
}

- (PXGColorProgram)colorProgram
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  int64_t v3 = [v2 colorProgram];

  return (PXGColorProgram *)v3;
}

- (void)getTextureInfos:(id *)a3 forSpriteIndexes:(const unsigned int *)a4 geometries:(id *)a5 spriteStyles:(id *)a6 spriteInfos:(id *)a7 screenScale:(double)a8 count:(unsigned int)a9
{
  if (a9)
  {
    uint64_t v16 = a9;
    do
    {
      unsigned int v17 = *a4++;
      int v19 = *((void *)&a7[1].var0 + 5 * v17);
      v18 = [(PXGEffectWrappingTexture *)self parent];
      [v18 getTextureInfos:a3 forSpriteIndexes:&v19 geometries:a5 spriteStyles:a6 spriteInfos:a7 screenScale:1 count:a8];

      a3 += 16;
      --v16;
    }
    while (v16);
  }
}

- (MTLTexture)texture
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  int64_t v3 = [v2 texture];

  return (MTLTexture *)v3;
}

- (MTLTexture)chromaTexture
{
  long long v2 = [(PXGEffectWrappingTexture *)self parent];
  int64_t v3 = [v2 chromaTexture];

  return (MTLTexture *)v3;
}

- (void)setParent:(id)a3
{
  uint64_t v6 = (PXGMetalSpriteTexture *)a3;
  if (self->_parent != v6)
  {
    objc_storeStrong((id *)&self->_parent, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v5 = v6;
    }
    else {
      double v5 = 0;
    }
    objc_storeStrong((id *)&self->_imageTextureParent, v5);
  }
}

- (PXGEffectWrappingTexture)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXGEffectWrappingTexture;
  long long v2 = [(PXGImageTexture *)&v7 init];
  int64_t v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    lock_activeRenders = v3->_lock_activeRenders;
    v3->_lock_activeRenders = v4;
  }
  return v3;
}

+ (id)createTexture
{
  long long v2 = [a1 _dequeueTexture];
  if (!v2) {
    long long v2 = objc_alloc_init(PXGEffectWrappingTexture);
  }

  return v2;
}

+ (void)_reuseTexture:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_reuseLock);
  double v5 = [a1 _reusableTextures];
  [v5 addObject:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&_reuseLock);
}

+ (id)_dequeueTexture
{
  os_unfair_lock_lock((os_unfair_lock_t)&_reuseLock);
  int64_t v3 = [a1 _reusableTextures];
  id v4 = objc_msgSend(v3, "px_popFirst");

  os_unfair_lock_unlock((os_unfair_lock_t)&_reuseLock);

  return v4;
}

+ (id)_reusableTextures
{
  if (_reusableTextures_onceToken != -1) {
    dispatch_once(&_reusableTextures_onceToken, &__block_literal_global);
  }
  long long v2 = (void *)_reusableTextures_reusableTextures;

  return v2;
}

uint64_t __45__PXGEffectWrappingTexture__reusableTextures__block_invoke()
{
  _reusableTextures_reusableTextures = (uint64_t)objc_alloc_init(MEMORY[0x263EFF980]);

  return MEMORY[0x270F9A758]();
}

@end