@interface PXGEffect
+ (id)shaderSourceForFilename:(id)a3;
- (OS_dispatch_queue)queue;
- (PXGEffect)init;
- (PXGEffect)initWithEntityManager:(id)a3;
- (PXGEntityManager)entityManager;
- (PXGKernel)kernel;
- (PXGShader)shader;
- (double)drawingScale;
- (double)scale;
- (id)createSiblingsTextureForMainSpriteTexture:(id)a3;
- (id)description;
- (unint64_t)numberOfSiblingSprites;
- (unsigned)effectId;
- (void)configureSiblingSprites:(id *)a3 siblingsSpriteIndexRange:(_PXGSpriteIndexRange)a4 siblingsTexture:(id)a5 forMainRenderSpriteRef:(id *)a6 mainPresentationSpriteRef:(id *)a7 mainSpriteIndex:(unsigned int)a8 mainSpriteTexture:(id)a9 screenScale:(double)a10;
- (void)dealloc;
- (void)setDrawingScale:(double)a3;
- (void)setNumberOfSiblingSprites:(unint64_t)a3;
- (void)setScale:(double)a3;
@end

@implementation PXGEffect

- (PXGKernel)kernel
{
  return 0;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (unint64_t)numberOfSiblingSprites
{
  return self->_numberOfSiblingSprites;
}

- (void)setNumberOfSiblingSprites:(unint64_t)a3
{
  self->_numberOfSiblingSprites = a3;
}

- (unsigned)effectId
{
  if (!self->_didNotifyOfUse)
  {
    self->_didNotifyOfUse = 1;
    v3 = [(PXGEffect *)self entityManager];
    v4 = [v3 effectComponent];
    [v4 didUseEffect:self];
  }
  return self->_effectId;
}

- (PXGEntityManager)entityManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entityManager);

  return (PXGEntityManager *)WeakRetained;
}

- (PXGEffect)initWithEntityManager:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXGEffect.m", 52, @"Invalid parameter not satisfying: %@", @"entityManager != nil" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)PXGEffect;
  v6 = [(PXGEffect *)&v18 init];
  v7 = v6;
  if (v6)
  {
    v6->_effectId = atomic_fetch_add(initWithEntityManager__lastRequestID, 1u);
    objc_storeWeak((id *)&v6->_entityManager, v5);
    uint64_t v8 = [v5 queue];
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&v7->_scale = _Q0;
    v15 = [v5 effectComponent];
    [v15 registerEffect:v7 withEffectId:v7->_effectId];
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_entityManager);
}

- (void)setDrawingScale:(double)a3
{
  self->_drawingScale = a3;
}

- (double)drawingScale
{
  return self->_drawingScale;
}

- (double)scale
{
  return self->_scale;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)configureSiblingSprites:(id *)a3 siblingsSpriteIndexRange:(_PXGSpriteIndexRange)a4 siblingsTexture:(id)a5 forMainRenderSpriteRef:(id *)a6 mainPresentationSpriteRef:(id *)a7 mainSpriteIndex:(unsigned int)a8 mainSpriteTexture:(id)a9 screenScale:(double)a10
{
  id v12 = a5;
  id v13 = a9;
  v14 = [MEMORY[0x263F08690] currentHandler];
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v14 handleFailureInMethod:a2, self, @"PXGEffect.m", 107, @"Method %s is a responsibility of subclass %@", "-[PXGEffect configureSiblingSprites:siblingsSpriteIndexRange:siblingsTexture:forMainRenderSpriteRef:mainPresentationSpriteRef:mainSpriteIndex:mainSpriteTexture:screenScale:]", v16 object file lineNumber description];

  abort();
}

- (id)createSiblingsTextureForMainSpriteTexture:(id)a3
{
  return 0;
}

- (PXGShader)shader
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  id v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXGEffect.m", 88, @"Method %s is a responsibility of subclass %@", "-[PXGEffect shader]", v6 object file lineNumber description];

  abort();
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PXGEffect *)self effectId];
  v7 = [(PXGEffect *)self shader];
  uint64_t v8 = [v3 stringWithFormat:@"<%@:%p effectId = %d, shader = %@>", v5, self, v6, v7];;

  return v8;
}

- (void)dealloc
{
  unsigned int effectId = self->_effectId;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entityManager);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __20__PXGEffect_dealloc__block_invoke;
  block[3] = &unk_265556B00;
  id v9 = WeakRetained;
  unsigned int v10 = effectId;
  id v6 = WeakRetained;
  dispatch_async(queue, block);

  v7.receiver = self;
  v7.super_class = (Class)PXGEffect;
  [(PXGEffect *)&v7 dealloc];
}

void __20__PXGEffect_dealloc__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) effectComponent];
  [v2 unregisterEffectId:*(unsigned int *)(a1 + 40)];
}

- (PXGEffect)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGEffect.m", 48, @"%s is not available as initializer", "-[PXGEffect init]");

  abort();
}

+ (id)shaderSourceForFilename:(id)a3
{
  id v5 = a3;
  if (shaderSourceForFilename__onceToken != -1) {
    dispatch_once(&shaderSourceForFilename__onceToken, &__block_literal_global_2089);
  }
  id v6 = a1;
  objc_sync_enter(v6);
  objc_super v7 = [(id)shaderSourceForFilename__sharedCache objectForKeyedSubscript:v5];
  if (!v7)
  {
    uint64_t v8 = [v5 stringByDeletingPathExtension];
    id v9 = [v5 pathExtension];
    unsigned int v10 = [MEMORY[0x263F086E0] bundleForClass:v6];
    v11 = [v10 URLForResource:v8 withExtension:v9];

    id v16 = 0;
    id v12 = [NSString stringWithContentsOfURL:v11 encoding:4 error:&v16];
    id v13 = v16;
    if (!v12)
    {
      v15 = [MEMORY[0x263F08690] currentHandler];
      [v15 handleFailureInMethod:a2, v6, @"PXGEffect.m", 39, @"Error:%@ loading file at path:%@", v13, v11 object file lineNumber description];
    }
    objc_super v7 = [[PXGShaderSource alloc] initWithSource:v12];
    [(id)shaderSourceForFilename__sharedCache setObject:v7 forKeyedSubscript:v5];
  }
  objc_sync_exit(v6);

  return v7;
}

uint64_t __37__PXGEffect_shaderSourceForFilename___block_invoke()
{
  shaderSourceForFilename__sharedCache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF9A0]);

  return MEMORY[0x270F9A758]();
}

@end