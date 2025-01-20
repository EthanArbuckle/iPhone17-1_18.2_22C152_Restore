@interface PXGColorGradingTexturesStore
+ (id)colorGradingTextureStoreForContext:(id)a3;
- (PXGColorGradingTexturesStore)init;
- (PXGColorGradingTexturesStore)initWithMetalContext:(id)a3;
- (id)colorGradingTextureWithColorLookupCube:(id)a3;
- (void)_createPlaceholderCube;
@end

@implementation PXGColorGradingTexturesStore

uint64_t __53__PXGColorGradingTexturesStore_initWithMetalContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createPlaceholderCube];
}

uint64_t __54__PXGColorGradingTexturesStore__createPlaceholderCube__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFF990] dataWithLength:32];
  v1 = (void *)_createPlaceholderCube_data;
  _createPlaceholderCube_data = v0;

  uint64_t result = [(id)_createPlaceholderCube_data bytes];
  uint64_t v3 = 0;
  v4 = &xmmword_2603C3720;
  float32x4_t v5 = (float32x4_t)vdupq_n_s32(0x437F0000u);
  do
  {
    float32x4_t v7 = (float32x4_t)v4[2];
    float32x4_t v6 = (float32x4_t)v4[3];
    float32x4_t v9 = (float32x4_t)*v4;
    float32x4_t v8 = (float32x4_t)v4[1];
    v4 += 4;
    *(int16x4_t *)v7.f32 = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v7, v5)));
    *(int16x4_t *)&v7.u32[2] = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v6, v5)));
    *(int16x4_t *)v6.f32 = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v8, v5)));
    *(int16x4_t *)v8.f32 = vmovn_s32(vcvtq_s32_f32(vmulq_f32(v9, v5)));
    v8.i64[1] = v6.i64[0];
    *(int8x16_t *)(result + v3) = vuzp1q_s8((int8x16_t)v8, (int8x16_t)v7);
    v3 += 16;
  }
  while (v3 != 32);
  return result;
}

- (void)_createPlaceholderCube
{
  if (_createPlaceholderCube_onceToken != -1) {
    dispatch_once(&_createPlaceholderCube_onceToken, &__block_literal_global_18);
  }
  v4 = [PXGTextureDataColorLookupCube alloc];
  float32x4_t v5 = [(PXGTextureDataColorLookupCube *)v4 initWithData:_createPlaceholderCube_data edgeSize:2 pixelFormat:70];
  placeholderCube = self->_placeholderCube;
  self->_placeholderCube = v5;

  if (!self->_placeholderCube)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"PXGColorGradingTexturesStore.m", 104, @"Invalid parameter not satisfying: %@", @"_placeholderCube != nil" object file lineNumber description];
  }
}

- (PXGColorGradingTexturesStore)initWithMetalContext:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGColorGradingTexturesStore;
  float32x4_t v6 = [(PXGColorGradingTexturesStore *)&v17 init];
  if (v6)
  {
    id v7 = (NSCache *)objc_alloc_init(MEMORY[0x263EFF8E0]);
    cachedTextures = v6->_cachedTextures;
    v6->_cachedTextures = v7;

    [(NSCache *)v6->_cachedTextures setCountLimit:12];
    objc_storeStrong((id *)&v6->_metalRenderContext, a3);
    float32x4_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.photos.color-grading-textures-store", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    v13 = v6->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__PXGColorGradingTexturesStore_initWithMetalContext___block_invoke;
    block[3] = &unk_265556768;
    v16 = v6;
    dispatch_async(v13, block);
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
  objc_storeStrong((id *)&self->_placeholderCube, 0);
  objc_storeStrong((id *)&self->_cachedTextures, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)colorGradingTextureWithColorLookupCube:(id)a3
{
  id v5 = (PXGColorLookupCube *)a3;
  if (!v5)
  {
    id v5 = self->_placeholderCube;
    if (!v5)
    {
      dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_106);
      id v5 = self->_placeholderCube;
      if (!v5)
      {
        float32x4_t v9 = [MEMORY[0x263F08690] currentHandler];
        [v9 handleFailureInMethod:a2, self, @"PXGColorGradingTexturesStore.m", 58, @"Invalid parameter not satisfying: %@", @"cube != nil" object file lineNumber description];

        id v5 = 0;
      }
    }
  }
  float32x4_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXGColorLookupCube hash](v5, "hash"));
  id v7 = [(NSCache *)self->_cachedTextures objectForKey:v6];
  if (!v7)
  {
    id v7 = [(PXGColorLookupCube *)v5 createTextureWithContext:self->_metalRenderContext];
    if (v7)
    {
      if ([(PXGColorLookupCube *)v5 shouldCache]) {
        [(NSCache *)self->_cachedTextures setObject:v7 forKey:v6];
      }
    }
  }

  return v7;
}

- (PXGColorGradingTexturesStore)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGColorGradingTexturesStore.m", 35, @"%s is not available as initializer", "-[PXGColorGradingTexturesStore init]");

  abort();
}

+ (id)colorGradingTextureStoreForContext:(id)a3
{
  id v4 = a3;
  id v5 = a1;
  objc_sync_enter(v5);
  float32x4_t v6 = [v4 device];
  objc_getAssociatedObject(v6, sel_colorGradingTextureStoreForContext_);
  id v7 = (PXGColorGradingTexturesStore *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    id v7 = [[PXGColorGradingTexturesStore alloc] initWithMetalContext:v4];
    float32x4_t v8 = [v4 device];
    objc_setAssociatedObject(v8, sel_colorGradingTextureStoreForContext_, v7, (void *)0x301);
  }
  objc_sync_exit(v5);

  return v7;
}

@end