@interface CLKUIMetalAtlas
+ (id)_createMTLTextureWithBacking:(id)a3 device:(id)a4 encoder:(id)a5;
- (CLKUIMetalAtlas)initWithUuid:(id)a3 nilTexture:(id)a4;
- (MTLTexture)nilTexture;
- (void)bind:(id)a3 slot:(unint64_t)a4;
- (void)dealloc;
- (void)prewarm;
- (void)purge;
@end

@implementation CLKUIMetalAtlas

- (CLKUIMetalAtlas)initWithUuid:(id)a3 nilTexture:(id)a4
{
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CLKUIMetalAtlas;
  v8 = [(CLKUIAtlas *)&v13 initWithUuid:a3];
  v9 = v8;
  if (v8)
  {
    v8->_prewarmState = 0;
    objc_storeStrong((id *)&v8->_nilTexture, a4);
    v10 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    prewarmLock = v9->_prewarmLock;
    v9->_prewarmLock = v10;
  }
  return v9;
}

- (void)dealloc
{
  [(CLKUIMetalAtlas *)self purge];
  if (self->_loaderQueue)
  {
    v3 = +[CLKUIResourceManager sharedInstance];
    [v3 returnTextureLoadingQueue:self->_loaderQueue];

    loaderQueue = self->_loaderQueue;
    self->_loaderQueue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)CLKUIMetalAtlas;
  [(CLKUIMetalAtlas *)&v5 dealloc];
}

+ (id)_createMTLTextureWithBacking:(id)a3 device:(id)a4 encoder:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    [v7 structure];
    +[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]();
  }

  return 0;
}

- (void)prewarm
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_super v5 = [a1 uuid];
  v6 = @"none";
  if (*a2 == 1) {
    v6 = @"prewarming";
  }
  if (*a2 == 2) {
    id v7 = @"prewarmed";
  }
  else {
    id v7 = v6;
  }
  id v8 = v7;
  int v9 = 138412546;
  v10 = v5;
  __int16 v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_1B41E7000, a3, OS_LOG_TYPE_ERROR, "Not prewarming %@ because prewarmState = %@, but the texture is already loaded", (uint8_t *)&v9, 0x16u);
}

void __26__CLKUIMetalAtlas_prewarm__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = +[CLKUIMetalAtlas _createMTLTextureWithBacking:*(void *)(a1 + 32) device:*(void *)(a1 + 40) encoder:0];
    v4 = (void *)WeakRetained[10];
    WeakRetained[10] = v3;

    objc_super v5 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [WeakRetained uuid];
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl(&dword_1B41E7000, v5, OS_LOG_TYPE_DEFAULT, "Finished prewarming texture %@", (uint8_t *)&v7, 0xCu);
    }
    if (WeakRetained[11] == 1) {
      WeakRetained[11] = 2;
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

- (void)bind:(id)a3 slot:(unint64_t)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(CLKUIAtlas *)self uuid];

  if (!v7) {
    goto LABEL_25;
  }
  id v8 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [(CLKUIAtlas *)self uuid];
    *(_DWORD *)buf = 138412290;
    v31 = v9;
    _os_log_impl(&dword_1B41E7000, v8, OS_LOG_TYPE_DEFAULT, "Binding atlas %@", buf, 0xCu);
  }
  if (self->_prewarmState && !self->_texture && self->_loaderQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__CLKUIMetalAtlas_bind_slot___block_invoke;
    block[3] = &unk_1E609E290;
    block[4] = self;
    dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    dispatch_sync((dispatch_queue_t)self->_loaderQueue, v10);
    __int16 v11 = +[CLKUIResourceManager sharedInstance];
    [v11 returnTextureLoadingQueue:self->_loaderQueue];

    loaderQueue = self->_loaderQueue;
    self->_loaderQueue = 0;
  }
  texture = self->_texture;
  v14 = CLKLoggingObjectForDomain();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (texture)
  {
    if (!v15) {
      goto LABEL_23;
    }
    v16 = [(CLKUIAtlas *)self uuid];
    *(_DWORD *)buf = 138412290;
    v31 = v16;
    _os_log_impl(&dword_1B41E7000, v14, OS_LOG_TYPE_DEFAULT, "Texture prewarmed in atlas %@", buf, 0xCu);
    goto LABEL_22;
  }
  if (v15)
  {
    v17 = [(CLKUIAtlas *)self uuid];
    *(_DWORD *)buf = 138412290;
    v31 = v17;
    _os_log_impl(&dword_1B41E7000, v14, OS_LOG_TYPE_DEFAULT, "Texure not prewarmed. %@", buf, 0xCu);
  }
  v18 = [(CLKUIAtlas *)self backing];
  v14 = v18;
  if (v18)
  {
    uint64_t v19 = [v18 bytesLength];
    v16 = +[CLKUIResourceManager sharedInstance];
    if (([v16 ensureMemoryAvailable:v19] & 1) == 0)
    {
      v20 = CLKLoggingObjectForDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = [(CLKUIAtlas *)self uuid];
        *(_DWORD *)buf = 138412290;
        v31 = v21;
        _os_log_impl(&dword_1B41E7000, v20, OS_LOG_TYPE_DEFAULT, "failed to ensure enough memory for %@", buf, 0xCu);
      }
    }
    v22 = [v6 device];
    v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      id v24 = +[CLKUIMetalResourceManager sharedDevice];
    }
    v25 = v24;

    v26 = +[CLKUIMetalAtlas _createMTLTextureWithBacking:v14 device:v25 encoder:v6];
    v27 = self->_texture;
    self->_texture = v26;

    self->_prewarmState = 2;
    [(CLKUIAtlas *)self setStatus:3];
    [v16 notifyAtlas:self willChangeToMemoryCost:v19];
    [(CLKUIAtlas *)self setMemoryCost:v19];

LABEL_22:
  }
LABEL_23:

  if (!self->_texture)
  {
LABEL_25:
    nilTexture = self->_nilTexture;
    goto LABEL_26;
  }
  [(CLKUIAtlas *)self setBoundTime:CACurrentMediaTime()];
  nilTexture = self->_texture;
LABEL_26:
  [v6 setFragmentTexture:nilTexture atIndex:a4];
}

void __29__CLKUIMetalAtlas_bind_slot___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uuid];
    int v6 = 138412290;
    int v7 = v3;
    _os_log_impl(&dword_1B41E7000, v2, OS_LOG_TYPE_DEFAULT, "Loading prewarmed texture %@", (uint8_t *)&v6, 0xCu);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(*(void *)(a1 + 32) + 80));
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = 0;
}

- (void)purge
{
  uint64_t v3 = [(CLKUIAtlas *)self uuid];

  if (v3)
  {
    if (self->_loaderQueue)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __24__CLKUIMetalAtlas_purge__block_invoke;
      block[3] = &unk_1E609E290;
      block[4] = self;
      dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
      dispatch_sync((dispatch_queue_t)self->_loaderQueue, v4);
    }
    if (self->_texture)
    {
      if ([(CLKUIAtlas *)self isPurgable])
      {
        texture = self->_texture;
        self->_texture = 0;

        [(CLKUIAtlas *)self setStatus:4];
        int v6 = +[CLKUIResourceManager sharedInstance];
        [v6 notifyAtlas:self willChangeToMemoryCost:0];
        [(CLKUIAtlas *)self setMemoryCost:0];
        self->_prewarmState = 0;
      }
    }
  }
}

void __24__CLKUIMetalAtlas_purge__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = CLKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uuid];
    int v6 = 138412290;
    int v7 = v3;
    _os_log_impl(&dword_1B41E7000, v2, OS_LOG_TYPE_DEFAULT, "Purging prewarming texture %@", (uint8_t *)&v6, 0xCu);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), *(id *)(*(void *)(a1 + 32) + 80));
  uint64_t v4 = *(void *)(a1 + 32);
  objc_super v5 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = 0;
}

- (MTLTexture)nilTexture
{
  return self->_nilTexture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nilTexture, 0);
  objc_storeStrong((id *)&self->_prewarmLock, 0);
  objc_storeStrong((id *)&self->_loaderQueue_prewarmedTexture, 0);
  objc_storeStrong((id *)&self->_loaderQueue, 0);
  objc_storeStrong((id *)&self->_texture, 0);
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.1()
{
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.2()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 221, "opt.width <= CLKUITextureMaxDimension && opt.height <= CLKUITextureMaxDimension");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.3()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 222, "(opt.planes == 1) || (opt.planes == 6)");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.4()
{
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.5()
{
  __assert_rtn("_CLKUICalculateNumCompressedTexMipmaps", "CLKUIMetalTexture.m", 100, "mipCount != 0");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.6()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 304, "planeStart == (uint8_t*)opt.bytes + opt.bytesLength");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.7()
{
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.8()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 225, "!isCubeMap || (opt.width == opt.height)");
}

+ (void)_createMTLTextureWithBacking:device:encoder:.cold.9()
{
  __assert_rtn("+[CLKUIMetalAtlas _createMTLTextureWithBacking:device:encoder:]", "CLKUIMetalTexture.m", 223, "isCompressed || ((opt.width * opt.bytesPerPixel) == (opt.planeLength / opt.height))");
}

@end