@interface PXGMetalRenderStatePoolEntry
- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteOriginalGeometriesBufferWithCount:(int64_t)a3;
- ($225AF24142A77900D29617A74D173C5F)spriteStylesBufferWithCount:(int64_t)a3;
- ($738B17BD11CC339B30296C0EA03CEC2B)spriteEntitiesBufferWithCount:(int64_t)a3;
- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)spriteInfosBufferWithCount:(int64_t)a3;
- ($7EE80C0E926C3D0A8A931DD48CC5E4D3)uniforms;
- ($AA326A5DBD509210F9E8D229FB9C128C)values;
- ($C28CD4A45FD07A4F97CC9D5F91F25271)resizableCapInsetsBufferWithCount:(int64_t)a3;
- ($E2C29196C7A5C696474C6955C5A9CE06)spriteGeometriesBufferWithCount:(int64_t)a3;
- (BOOL)hasParsedRenderTextures;
- (MTLBuffer)resizableCapInsetsBuffer;
- (MTLBuffer)spriteEntitiesBuffer;
- (MTLBuffer)spriteGeometriesBuffer;
- (MTLBuffer)spriteInfosBuffer;
- (MTLBuffer)spriteOriginalGeometriesBuffer;
- (MTLBuffer)spriteStylesBuffer;
- (MTLDevice)device;
- (NSArray)captureSpriteTextures;
- (NSArray)textures;
- (PXGEffectComponent)effectComponent;
- (PXGMetalRenderPassState)currentRenderPassState;
- (PXGMetalRenderStatePool)pool;
- (PXGMetalRenderStatePoolEntry)initWithReusableRenderState:(id)a3 pool:(id)a4;
- (PXGMetalRenderTextureStore)opaqueTextures;
- (PXGMetalRenderTextureStore)translucentTextures;
- (PXGReusableMetalRenderState)renderState;
- (const)spriteEntities;
- (const)spriteGeometries;
- (const)spriteInfos;
- (const)spriteOriginalGeometries;
- (const)spriteStyles;
- (id)renderPassStateForSpriteCount:(int64_t)a3;
- (void)dealloc;
- (void)keepAlive;
- (void)prepareForRender:(int64_t)a3;
- (void)setCaptureSpriteTextures:(id)a3;
- (void)setHasParsedRenderTextures:(BOOL)a3;
- (void)setTextures:(id)a3;
- (void)setValues:(id *)a3;
@end

@implementation PXGMetalRenderStatePoolEntry

- (PXGMetalRenderTextureStore)translucentTextures
{
  return [(PXGReusableMetalRenderState *)self->_renderState translucentTextures];
}

- (PXGMetalRenderTextureStore)opaqueTextures
{
  return [(PXGReusableMetalRenderState *)self->_renderState opaqueTextures];
}

- (const)spriteGeometries
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteGeometries];
}

- (NSArray)textures
{
  return [(PXGReusableMetalRenderState *)self->_renderState textures];
}

- ($225AF24142A77900D29617A74D173C5F)spriteStylesBufferWithCount:(int64_t)a3
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteStylesBufferWithCount:a3];
}

- (const)spriteOriginalGeometries
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteOriginalGeometries];
}

- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteOriginalGeometriesBufferWithCount:(int64_t)a3
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteOriginalGeometriesBufferWithCount:a3];
}

- (const)spriteInfos
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteInfos];
}

- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)spriteInfosBufferWithCount:(int64_t)a3
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteInfosBufferWithCount:a3];
}

- ($E2C29196C7A5C696474C6955C5A9CE06)spriteGeometriesBufferWithCount:(int64_t)a3
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteGeometriesBufferWithCount:a3];
}

- ($738B17BD11CC339B30296C0EA03CEC2B)spriteEntitiesBufferWithCount:(int64_t)a3
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteEntitiesBufferWithCount:a3];
}

- (void)setValues:(id *)a3
{
  renderState = self->_renderState;
  CGSize size = a3->var3.size;
  v8[4] = a3->var3.origin;
  v8[5] = size;
  long long v5 = *(_OWORD *)&a3->var6;
  v8[6] = *(_OWORD *)&a3->var4;
  v8[7] = v5;
  CGPoint var1 = a3->var1;
  v8[0] = a3->var0;
  v8[1] = var1;
  CGSize v7 = a3->var2.size;
  v8[2] = a3->var2.origin;
  v8[3] = v7;
  [(PXGReusableMetalRenderState *)renderState setValues:v8];
}

- (void)setTextures:(id)a3
{
}

- (void)setHasParsedRenderTextures:(BOOL)a3
{
}

- (void)setCaptureSpriteTextures:(id)a3
{
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)resizableCapInsetsBufferWithCount:(int64_t)a3
{
  return [(PXGReusableMetalRenderState *)self->_renderState resizableCapInsetsBufferWithCount:a3];
}

- (id)renderPassStateForSpriteCount:(int64_t)a3
{
  return [(PXGReusableMetalRenderState *)self->_renderState renderPassStateForSpriteCount:a3];
}

- (BOOL)hasParsedRenderTextures
{
  return [(PXGReusableMetalRenderState *)self->_renderState hasParsedRenderTextures];
}

- (PXGMetalRenderStatePoolEntry)initWithReusableRenderState:(id)a3 pool:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXGMetalRenderStatePoolEntry;
  v10 = [(PXGMetalRenderStatePoolEntry *)&v13 init];
  if (v10)
  {
    if (!v8)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      [v12 handleFailureInMethod:a2, v10, @"PXGMetalRenderStatePool.m", 84, @"Invalid parameter not satisfying: %@", @"reusableRenderState != nil" object file lineNumber description];
    }
    objc_storeStrong((id *)&v10->_renderState, a3);
    objc_storeWeak((id *)&v10->_pool, v9);
  }

  return v10;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pool);
  if (WeakRetained)
  {
    v4 = self->_renderState;
    [(PXGReusableMetalRenderState *)v4 prepareForReuse];
    long long v5 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__PXGMetalRenderStatePoolEntry_dealloc__block_invoke;
    block[3] = &unk_1E5DD32A8;
    id v9 = WeakRetained;
    v10 = v4;
    v6 = v4;
    dispatch_async(v5, block);
  }
  v7.receiver = self;
  v7.super_class = (Class)PXGMetalRenderStatePoolEntry;
  [(PXGMetalRenderStatePoolEntry *)&v7 dealloc];
}

uint64_t __39__PXGMetalRenderStatePoolEntry_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkinRenderState:*(void *)(a1 + 40)];
}

- ($7EE80C0E926C3D0A8A931DD48CC5E4D3)uniforms
{
  return [(PXGReusableMetalRenderState *)self->_renderState uniforms];
}

- (PXGEffectComponent)effectComponent
{
  return [(PXGReusableMetalRenderState *)self->_renderState effectComponent];
}

- ($AA326A5DBD509210F9E8D229FB9C128C)values
{
  result = ($AA326A5DBD509210F9E8D229FB9C128C *)self->_renderState;
  if (result) {
    return ($AA326A5DBD509210F9E8D229FB9C128C *)[($AA326A5DBD509210F9E8D229FB9C128C *)result values];
  }
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  retstr->var3.origin = 0u;
  retstr->var3.CGSize size = 0u;
  retstr->var2.origin = 0u;
  retstr->var2.CGSize size = 0u;
  retstr->var0 = 0u;
  retstr->CGPoint var1 = 0u;
  return result;
}

- (const)spriteStyles
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteStyles];
}

- (const)spriteEntities
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteEntities];
}

- (MTLBuffer)spriteStylesBuffer
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteStylesBuffer];
}

- (MTLBuffer)spriteGeometriesBuffer
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteGeometriesBuffer];
}

- (MTLBuffer)resizableCapInsetsBuffer
{
  return [(PXGReusableMetalRenderState *)self->_renderState resizableCapInsetsBuffer];
}

- (void)prepareForRender:(int64_t)a3
{
}

- (PXGMetalRenderPassState)currentRenderPassState
{
  return [(PXGReusableMetalRenderState *)self->_renderState currentRenderPassState];
}

- (NSArray)captureSpriteTextures
{
  return [(PXGReusableMetalRenderState *)self->_renderState captureSpriteTextures];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pool);
  objc_storeStrong((id *)&self->_renderState, 0);
}

- (void)keepAlive
{
}

- (PXGMetalRenderStatePool)pool
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pool);
  return (PXGMetalRenderStatePool *)WeakRetained;
}

- (PXGReusableMetalRenderState)renderState
{
  return self->_renderState;
}

- (MTLBuffer)spriteOriginalGeometriesBuffer
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteOriginalGeometriesBuffer];
}

- (MTLBuffer)spriteInfosBuffer
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteInfosBuffer];
}

- (MTLBuffer)spriteEntitiesBuffer
{
  return [(PXGReusableMetalRenderState *)self->_renderState spriteEntitiesBuffer];
}

- (MTLDevice)device
{
  return [(PXGReusableMetalRenderState *)self->_renderState device];
}

@end