@interface SGCubicSplineMatrixCache
+ (id)sharedInstance;
- ($6F5639B62F6C861EB4A71773F5DCFA27)closedSplineMatrixWithDimension:(int)a3;
- ($6F5639B62F6C861EB4A71773F5DCFA27)openSplineMatrixWithDimension:(int)a3;
- ($6F5639B62F6C861EB4A71773F5DCFA27)splineMatrixWithDimension:(int)a3 cache:(id)a4 matrixGenerator:(id)a5;
- (SGCubicSplineMatrixCache)init;
@end

@implementation SGCubicSplineMatrixCache

- (SGCubicSplineMatrixCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)SGCubicSplineMatrixCache;
  v2 = [(SGCubicSplineMatrixCache *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    openMatrixCache = v2->_openMatrixCache;
    v2->_openMatrixCache = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    closedMatrixCache = v2->_closedMatrixCache;
    v2->_closedMatrixCache = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("SGCubic Spline Matrix Cache Queue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance___sharedInstance_0;
  return v2;
}

uint64_t __42__SGCubicSplineMatrixCache_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance_0 = objc_alloc_init(SGCubicSplineMatrixCache);
  return MEMORY[0x270F9A758]();
}

- ($6F5639B62F6C861EB4A71773F5DCFA27)splineMatrixWithDimension:(int)a3 cache:(id)a4 matrixGenerator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  internalQueue = self->_internalQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __76__SGCubicSplineMatrixCache_splineMatrixWithDimension_cache_matrixGenerator___block_invoke;
  v15[3] = &unk_2654284A0;
  int v19 = a3;
  id v17 = v9;
  v18 = &v20;
  id v16 = v8;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(internalQueue, v15);
  v13 = ($6F5639B62F6C861EB4A71773F5DCFA27 *)v21[3];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __76__SGCubicSplineMatrixCache_splineMatrixWithDimension_cache_matrixGenerator___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  id v7 = [v2 objectForKeyedSubscript:v3];

  if (v7)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v7 pointerValue];
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    v4 = (void **)SGSplineMatrixInversionWorkspace_new(*(_DWORD *)(a1 + 56));
    SGSplineMatrix_invert(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), (uint64_t)v4);
    SGSplineMatrixInversionWorkspace_destroy(v4);
    SGSplineMatrix_convert_to_single_precision(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    SGSplineMatrix_discard_double_precision(*(void ***)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    id v7 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v5 = *(void **)(a1 + 32);
    v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
}

- ($6F5639B62F6C861EB4A71773F5DCFA27)openSplineMatrixWithDimension:(int)a3
{
  openMatrixCache = self->_openMatrixCache;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __58__SGCubicSplineMatrixCache_openSplineMatrixWithDimension___block_invoke;
  v5[3] = &__block_descriptor_36_e14______d_fi_8__0l;
  int v6 = a3;
  return [(SGCubicSplineMatrixCache *)self splineMatrixWithDimension:*(void *)&a3 cache:openMatrixCache matrixGenerator:v5];
}

void *__58__SGCubicSplineMatrixCache_openSplineMatrixWithDimension___block_invoke(uint64_t a1)
{
  return generateOpenSplineMatrix(*(_DWORD *)(a1 + 32));
}

- ($6F5639B62F6C861EB4A71773F5DCFA27)closedSplineMatrixWithDimension:(int)a3
{
  closedMatrixCache = self->_closedMatrixCache;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__SGCubicSplineMatrixCache_closedSplineMatrixWithDimension___block_invoke;
  v5[3] = &__block_descriptor_36_e14______d_fi_8__0l;
  int v6 = a3;
  return [(SGCubicSplineMatrixCache *)self splineMatrixWithDimension:*(void *)&a3 cache:closedMatrixCache matrixGenerator:v5];
}

void *__60__SGCubicSplineMatrixCache_closedSplineMatrixWithDimension___block_invoke(uint64_t a1)
{
  return generateClosedSplineMatrix(*(_DWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_closedMatrixCache, 0);
  objc_storeStrong((id *)&self->_openMatrixCache, 0);
}

@end