@interface NTKCubicSplineMatrixCache
+ (id)sharedInstance;
- ($6F5639B62F6C861EB4A71773F5DCFA27)closedSplineMatrixWithDimension:(int)a3;
- ($6F5639B62F6C861EB4A71773F5DCFA27)openSplineMatrixWithDimension:(int)a3;
- ($6F5639B62F6C861EB4A71773F5DCFA27)splineMatrixWithDimension:(int)a3 cache:(id)a4 matrixGenerator:(id)a5;
- (NTKCubicSplineMatrixCache)init;
@end

@implementation NTKCubicSplineMatrixCache

- (NTKCubicSplineMatrixCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCubicSplineMatrixCache;
  v2 = [(NTKCubicSplineMatrixCache *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    openMatrixCache = v2->_openMatrixCache;
    v2->_openMatrixCache = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    closedMatrixCache = v2->_closedMatrixCache;
    v2->_closedMatrixCache = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("NTKCubic Spline Matrix Cache Queue", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_17);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

void __43__NTKCubicSplineMatrixCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(NTKCubicSplineMatrixCache);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
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
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__NTKCubicSplineMatrixCache_splineMatrixWithDimension_cache_matrixGenerator___block_invoke;
  v15[3] = &unk_1E62C15D8;
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

void __77__NTKCubicSplineMatrixCache_splineMatrixWithDimension_cache_matrixGenerator___block_invoke(uint64_t a1)
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
    v4 = (void **)NTKSplineMatrixInversionWorkspace_new(*(_DWORD *)(a1 + 56));
    NTKSplineMatrix_invert(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), (uint64_t)v4);
    NTKSplineMatrixInversionWorkspace_destroy(v4);
    NTKSplineMatrix_convert_to_single_precision(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    NTKSplineMatrix_discard_double_precision(*(void ***)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
    id v7 = [MEMORY[0x1E4F29238] valueWithPointer:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    uint64_t v5 = *(void **)(a1 + 32);
    v6 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
}

- ($6F5639B62F6C861EB4A71773F5DCFA27)openSplineMatrixWithDimension:(int)a3
{
  openMatrixCache = self->_openMatrixCache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__NTKCubicSplineMatrixCache_openSplineMatrixWithDimension___block_invoke;
  v5[3] = &__block_descriptor_36_e14______d_fi_8__0l;
  int v6 = a3;
  return [(NTKCubicSplineMatrixCache *)self splineMatrixWithDimension:*(void *)&a3 cache:openMatrixCache matrixGenerator:v5];
}

void *__59__NTKCubicSplineMatrixCache_openSplineMatrixWithDimension___block_invoke(uint64_t a1)
{
  return generateOpenSplineMatrix(*(_DWORD *)(a1 + 32));
}

- ($6F5639B62F6C861EB4A71773F5DCFA27)closedSplineMatrixWithDimension:(int)a3
{
  closedMatrixCache = self->_closedMatrixCache;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__NTKCubicSplineMatrixCache_closedSplineMatrixWithDimension___block_invoke;
  v5[3] = &__block_descriptor_36_e14______d_fi_8__0l;
  int v6 = a3;
  return [(NTKCubicSplineMatrixCache *)self splineMatrixWithDimension:*(void *)&a3 cache:closedMatrixCache matrixGenerator:v5];
}

void *__61__NTKCubicSplineMatrixCache_closedSplineMatrixWithDimension___block_invoke(uint64_t a1)
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