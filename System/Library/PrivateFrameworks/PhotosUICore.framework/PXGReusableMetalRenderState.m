@interface PXGReusableMetalRenderState
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
- (NSString)description;
- (PXGEffectComponent)effectComponent;
- (PXGMetalRenderPassState)currentRenderPassState;
- (PXGMetalRenderTextureStore)opaqueTextures;
- (PXGMetalRenderTextureStore)translucentTextures;
- (PXGReusableMetalRenderState)initWithDevice:(id)a3;
- (const)spriteEntities;
- (const)spriteGeometries;
- (const)spriteInfos;
- (const)spriteOriginalGeometries;
- (const)spriteStyles;
- (id)_resizedBufferIfNeeded:(id)a3 neededLength:(int64_t)a4;
- (id)renderPassStateForSpriteCount:(int64_t)a3;
- (void)prepareForRender:(int64_t)a3;
- (void)prepareForReuse;
- (void)setCaptureSpriteTextures:(id)a3;
- (void)setHasParsedRenderTextures:(BOOL)a3;
- (void)setTextures:(id)a3;
- (void)setValues:(id *)a3;
@end

@implementation PXGReusableMetalRenderState

- (MTLDevice)device
{
  return self->_device;
}

- (void)prepareForReuse
{
  renderedFrameIds = self->_renderedFrameIds;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PXGReusableMetalRenderState_prepareForReuse__block_invoke;
  v6[3] = &unk_1E5DD3010;
  v6[4] = self;
  [(NSMutableIndexSet *)renderedFrameIds enumerateIndexesUsingBlock:v6];
  [(NSMutableIndexSet *)self->_renderedFrameIds removeAllIndexes];
  [(PXGReusableMetalRenderState *)self setTextures:0];
  [(PXGReusableMetalRenderState *)self setCaptureSpriteTextures:0];
  [(PXGReusableMetalRenderState *)self setHasParsedRenderTextures:0];
  v4 = [(PXGReusableMetalRenderState *)self opaqueTextures];
  [v4 removeAllTextures];

  v5 = [(PXGReusableMetalRenderState *)self translucentTextures];
  [v5 removeAllTextures];
}

- (void)setHasParsedRenderTextures:(BOOL)a3
{
  self->_hasParsedRenderTextures = a3;
}

- (const)spriteGeometries
{
  return (const $E2C29196C7A5C696474C6955C5A9CE06 *)[(MTLBuffer *)self->_spriteGeometriesBuffer contents];
}

- (const)spriteOriginalGeometries
{
  return (const $16EC8B44B1C22DB88FC318D5A7EDDAB2 *)[(MTLBuffer *)self->_spriteOriginalGeometriesBuffer contents];
}

- (const)spriteInfos
{
  return (const $786F7D2F4E5B3A0CBB66DF574B7D98CF *)[(MTLBuffer *)self->_spriteInfosBuffer contents];
}

- (id)renderPassStateForSpriteCount:(int64_t)a3
{
  v5 = [(PXGReusableMetalRenderState *)self currentRenderPassState];
  v6 = v5;
  if (!v5 || [(PXGMetalRenderPassState *)v5 capacity] < a3)
  {
    uint64_t v7 = [(PXGMetalRenderPassState *)v6 capacity];
    uint64_t v8 = 2;
    if (v7 > 2) {
      uint64_t v8 = v7;
    }
    do
    {
      int64_t v9 = v8;
      v8 *= 2;
    }
    while (v9 < a3);
    v10 = [[PXGMetalRenderPassState alloc] initWithDevice:self->_device capacity:v9];

    objc_storeStrong((id *)&self->_currentRenderPassState, v10);
    v6 = v10;
  }
  return v6;
}

- (PXGMetalRenderPassState)currentRenderPassState
{
  return self->_currentRenderPassState;
}

- (BOOL)hasParsedRenderTextures
{
  return self->_hasParsedRenderTextures;
}

- (void)setTextures:(id)a3
{
}

- (void)setCaptureSpriteTextures:(id)a3
{
}

- ($16EC8B44B1C22DB88FC318D5A7EDDAB2)spriteOriginalGeometriesBufferWithCount:(int64_t)a3
{
  v4 = [(PXGReusableMetalRenderState *)self _resizedBufferIfNeeded:self->_spriteOriginalGeometriesBuffer neededLength:32 * a3];
  spriteOriginalGeometriesBuffer = self->_spriteOriginalGeometriesBuffer;
  self->_spriteOriginalGeometriesBuffer = v4;

  v6 = self->_spriteOriginalGeometriesBuffer;
  return ($16EC8B44B1C22DB88FC318D5A7EDDAB2 *)[(MTLBuffer *)v6 contents];
}

- ($786F7D2F4E5B3A0CBB66DF574B7D98CF)spriteInfosBufferWithCount:(int64_t)a3
{
  v4 = [(PXGReusableMetalRenderState *)self _resizedBufferIfNeeded:self->_spriteInfosBuffer neededLength:40 * a3];
  spriteInfosBuffer = self->_spriteInfosBuffer;
  self->_spriteInfosBuffer = v4;

  v6 = self->_spriteInfosBuffer;
  return ($786F7D2F4E5B3A0CBB66DF574B7D98CF *)[(MTLBuffer *)v6 contents];
}

- ($225AF24142A77900D29617A74D173C5F)spriteStylesBufferWithCount:(int64_t)a3
{
  v4 = [(PXGReusableMetalRenderState *)self _resizedBufferIfNeeded:self->_spriteStylesBuffer neededLength:160 * a3];
  spriteStylesBuffer = self->_spriteStylesBuffer;
  self->_spriteStylesBuffer = v4;

  v6 = self->_spriteStylesBuffer;
  return ($225AF24142A77900D29617A74D173C5F *)[(MTLBuffer *)v6 contents];
}

- (id)_resizedBufferIfNeeded:(id)a3 neededLength:(int64_t)a4
{
  id v6 = a3;
  if (a4) {
    int64_t v7 = a4;
  }
  else {
    int64_t v7 = 1;
  }
  id v8 = v6;
  int64_t v9 = v8;
  if (v7 > (unint64_t)[v8 length])
  {
    uint64_t v10 = [v8 length];
    if (v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v7;
    }
    do
    {
      int64_t v12 = v11;
      v11 *= 2;
    }
    while (v12 < v7);
    int64_t v9 = (void *)-[MTLDevice newBufferWithLength:options:](self->_device, "newBufferWithLength:options:");
  }
  return v9;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)spriteEntitiesBufferWithCount:(int64_t)a3
{
  v4 = [(PXGReusableMetalRenderState *)self _resizedBufferIfNeeded:self->_spriteEntitiesBuffer neededLength:4 * a3];
  spriteEntitiesBuffer = self->_spriteEntitiesBuffer;
  self->_spriteEntitiesBuffer = v4;

  id v6 = self->_spriteEntitiesBuffer;
  return ($738B17BD11CC339B30296C0EA03CEC2B *)[(MTLBuffer *)v6 contents];
}

- ($C28CD4A45FD07A4F97CC9D5F91F25271)resizableCapInsetsBufferWithCount:(int64_t)a3
{
  v4 = [(PXGReusableMetalRenderState *)self _resizedBufferIfNeeded:self->_resizableCapInsetsBuffer neededLength:16 * a3];
  resizableCapInsetsBuffer = self->_resizableCapInsetsBuffer;
  self->_resizableCapInsetsBuffer = v4;

  id v6 = self->_resizableCapInsetsBuffer;
  return ($C28CD4A45FD07A4F97CC9D5F91F25271 *)[(MTLBuffer *)v6 contents];
}

- (void)setValues:(id *)a3
{
  CGSize var0 = a3->var0;
  CGPoint var1 = a3->var1;
  CGSize size = a3->var2.size;
  self->_values.renderBoundsInPoints.CGPoint origin = a3->var2.origin;
  self->_values.renderBoundsInPoints.CGSize size = size;
  self->_values.renderSize = var0;
  self->_values.renderOrigin = var1;
  CGPoint origin = a3->var3.origin;
  CGSize v7 = a3->var3.size;
  long long v8 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_values.offscreenEffectScale = *(_OWORD *)&a3->var4;
  *(_OWORD *)&self->_values.sampleCount = v8;
  self->_values.visibleRectInRenderCoordinates.CGPoint origin = origin;
  self->_values.visibleRectInRenderCoordinates.CGSize size = v7;
}

- ($E2C29196C7A5C696474C6955C5A9CE06)spriteGeometriesBufferWithCount:(int64_t)a3
{
  v4 = [(PXGReusableMetalRenderState *)self _resizedBufferIfNeeded:self->_spriteGeometriesBuffer neededLength:20 * a3];
  spriteGeometriesBuffer = self->_spriteGeometriesBuffer;
  self->_spriteGeometriesBuffer = v4;

  id v6 = self->_spriteGeometriesBuffer;
  return ($E2C29196C7A5C696474C6955C5A9CE06 *)[(MTLBuffer *)v6 contents];
}

- (PXGReusableMetalRenderState)initWithDevice:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGReusableMetalRenderState;
  id v6 = [(PXGReusableMetalRenderState *)&v17 init];
  CGSize v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    uint64_t v8 = [off_1E5DA67B0 createWithDefaultDataStore];
    effectComponent = v7->_effectComponent;
    v7->_effectComponent = (PXGEffectComponent *)v8;

    uint64_t v10 = objc_alloc_init(PXGMetalRenderTextureStore);
    opaqueTextures = v7->_opaqueTextures;
    v7->_opaqueTextures = v10;

    int64_t v12 = objc_alloc_init(PXGMetalRenderTextureStore);
    translucentTextures = v7->_translucentTextures;
    v7->_translucentTextures = v12;

    v14 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E4F28E60]);
    renderedFrameIds = v7->_renderedFrameIds;
    v7->_renderedFrameIds = v14;
  }
  return v7;
}

void __46__PXGReusableMetalRenderState_prepareForReuse__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = objc_msgSend(*(id *)(a1 + 32), "textures", 0);
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) cleanupAfterRender:a2];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- ($7EE80C0E926C3D0A8A931DD48CC5E4D3)uniforms
{
  return ($7EE80C0E926C3D0A8A931DD48CC5E4D3 *)self->_anon_10;
}

- (MTLBuffer)spriteStylesBuffer
{
  return self->_spriteStylesBuffer;
}

- (MTLBuffer)spriteGeometriesBuffer
{
  return self->_spriteGeometriesBuffer;
}

- (MTLBuffer)resizableCapInsetsBuffer
{
  return self->_resizableCapInsetsBuffer;
}

- (PXGEffectComponent)effectComponent
{
  return self->_effectComponent;
}

- ($AA326A5DBD509210F9E8D229FB9C128C)values
{
  CGSize v3 = *(CGSize *)&self[3].var6;
  retstr->var3.CGPoint origin = *(CGPoint *)&self[3].var4;
  retstr->var3.CGPoint size = v3;
  CGPoint var1 = self[4].var1;
  *(CGSize *)&retstr->var4 = self[4].var0;
  *(CGPoint *)&retstr->var6 = var1;
  CGPoint size = (CGPoint)self[3].var2.size;
  retstr->CGSize var0 = (CGSize)self[3].var2.origin;
  retstr->CGPoint var1 = size;
  CGSize v6 = self[3].var3.size;
  retstr->var2.CGPoint origin = self[3].var3.origin;
  retstr->var2.CGPoint size = v6;
  return self;
}

- (const)spriteStyles
{
  return (const $225AF24142A77900D29617A74D173C5F *)[(MTLBuffer *)self->_spriteStylesBuffer contents];
}

- (const)spriteEntities
{
  return (const $738B17BD11CC339B30296C0EA03CEC2B *)[(MTLBuffer *)self->_spriteEntitiesBuffer contents];
}

- (void)prepareForRender:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PXGReusableMetalRenderState *)self textures];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v9++) prepareForRender:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  [(NSMutableIndexSet *)self->_renderedFrameIds addIndex:a3];
  long long v10 = [(PXGReusableMetalRenderState *)self opaqueTextures];
  [v10 prepareForRender];

  long long v11 = [(PXGReusableMetalRenderState *)self translucentTextures];
  [v11 prepareForRender];
}

- (PXGMetalRenderTextureStore)translucentTextures
{
  return self->_translucentTextures;
}

- (PXGMetalRenderTextureStore)opaqueTextures
{
  return self->_opaqueTextures;
}

- (NSArray)textures
{
  return self->_textures;
}

- (NSArray)captureSpriteTextures
{
  return self->_captureSpriteTextures;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translucentTextures, 0);
  objc_storeStrong((id *)&self->_opaqueTextures, 0);
  objc_storeStrong((id *)&self->_effectComponent, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_spriteOriginalGeometriesBuffer, 0);
  objc_storeStrong((id *)&self->_spriteInfosBuffer, 0);
  objc_storeStrong((id *)&self->_spriteStylesBuffer, 0);
  objc_storeStrong((id *)&self->_spriteGeometriesBuffer, 0);
  objc_storeStrong((id *)&self->_spriteEntitiesBuffer, 0);
  objc_storeStrong((id *)&self->_textures, 0);
  objc_storeStrong((id *)&self->_resizableCapInsetsBuffer, 0);
  objc_storeStrong((id *)&self->_currentRenderPassState, 0);
  objc_storeStrong((id *)&self->_captureSpriteTextures, 0);
  objc_storeStrong((id *)&self->_renderedFrameIds, 0);
}

- (MTLBuffer)spriteOriginalGeometriesBuffer
{
  return self->_spriteOriginalGeometriesBuffer;
}

- (MTLBuffer)spriteInfosBuffer
{
  return self->_spriteInfosBuffer;
}

- (MTLBuffer)spriteEntitiesBuffer
{
  return self->_spriteEntitiesBuffer;
}

- (NSString)description
{
  CGSize v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; currentRenderPassState:%@>",
    v5,
    self,
  uint64_t v6 = self->_currentRenderPassState);

  return (NSString *)v6;
}

@end