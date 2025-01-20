@interface NUTiledProcessorCache
- (NUTiledProcessorCache)initWithImage:(id)a3;
- (void)_render:(id)a3;
@end

@implementation NUTiledProcessorCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);

  objc_storeStrong((id *)&self->_cachedTiledImage, 0);
}

- (void)_render:(id)a3
{
  id v4 = a3;
  v5 = [(NUProcessorCache *)self inputImage];
  [v5 extent];
  v52.origin.x = v6;
  v52.origin.y = v7;
  v52.size.width = v8;
  v52.size.height = v9;
  NU::RectT<long>::RectT(&v56, &v52, 3);
  CGSize size = v56.size;
  CGPoint origin = v56.origin;

  v10 = [v4 metalCommandBuffer];
  v11 = [v10 device];
  v12 = +[NUPlatform currentPlatform];
  v13 = [v12 deviceForMetalDevice:v11];

  [v4 region];
  v52.origin.x = v14;
  v52.origin.y = v15;
  v52.size.width = v16;
  v52.size.height = v17;
  NU::RectT<long>::RectT(&v56, &v52, 3);
  CGSize v29 = v56.size;
  CGPoint v30 = v56.origin;
  CGRect v52 = v56;
  v56.CGPoint origin = origin;
  v56.CGSize size = size;
  NU::RectT<long>::Intersection((uint64_t)&v55, (uint64_t *)&v52, (uint64_t *)&v56);
  CGSize v27 = v55.size;
  CGPoint v28 = v55.origin;
  CGRect v52 = v55;
  v18 = +[NURegion regionWithRect:&v52];
  v56.origin.x = 0.0;
  *(void *)&v56.origin.y = &v56;
  v56.CGSize size = (CGSize)0x2020000000uLL;
  v52.origin.x = 0.0;
  *(void *)&v52.origin.y = &v52;
  *(void *)&v52.size.width = 0x3032000000;
  *(void *)&v52.size.height = __Block_byref_object_copy__16363;
  v53 = __Block_byref_object_dispose__16364;
  id v19 = v18;
  id v54 = v19;
  textureCacheQueue = self->super._textureCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__NUTiledProcessorCache__render___block_invoke;
  block[3] = &unk_1E5D94FC8;
  block[4] = self;
  CGPoint v46 = origin;
  CGSize v47 = size;
  id v21 = v11;
  id v39 = v21;
  id v22 = v19;
  id v40 = v22;
  id v23 = v4;
  id v41 = v23;
  CGPoint v48 = v28;
  CGSize v49 = v27;
  CGPoint v50 = v30;
  CGSize v51 = v29;
  id v24 = v13;
  id v42 = v24;
  id v25 = v10;
  id v43 = v25;
  v44 = &v52;
  v45 = &v56;
  dispatch_sync(textureCacheQueue, block);
  if (![*(id *)(*(void *)&v52.origin.y + 40) isEmpty])
  {
    [v25 encodeWaitForEvent:self->super._textureCachedEvent value:*(void *)(*(void *)&v56.origin.y + 24)];
    cachedTiledImage = self->_cachedTiledImage;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __33__NUTiledProcessorCache__render___block_invoke_3;
    v33[3] = &unk_1E5D94FA0;
    CGPoint v36 = v30;
    CGSize v37 = v29;
    id v34 = v23;
    id v35 = v25;
    [(NUMutablePurgeableSurfaceImage *)cachedTiledImage readTextureRegion:v22 device:v24 withBlock:v33];
  }
  [(NUMutablePurgeableSurfaceImage *)self->_cachedTiledImage endAccessRegion:v22];

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(&v56, 8);
}

void __33__NUTiledProcessorCache__render___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[8];
  if (!v3)
  {
    id v4 = +[NUImageLayout tiledLayoutForImageSize:tileSize:](NUImageLayout, "tiledLayoutForImageSize:tileSize:", *(void *)(a1 + 112), *(void *)(a1 + 120), v2[9], v2[10]);
    v5 = [*(id *)(a1 + 32) pixelFormat];
    uint64_t v6 = +[NUImageFactory surfaceImageWithLayout:v4 format:v5 colorSpace:*(void *)(*(void *)(a1 + 32) + 88)];
    uint64_t v7 = *(void *)(a1 + 32);
    CGFloat v8 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = v6;

    uint64_t v9 = [*(id *)(a1 + 40) newEvent];
    uint64_t v10 = *(void *)(a1 + 32);
    v11 = *(void **)(v10 + 24);
    *(void *)(v10 + 24) = v9;

    [*(id *)(*(void *)(a1 + 32) + 64) endAccess];
    v3 = *(void **)(*(void *)(a1 + 32) + 64);
  }
  [v3 beginAccessRegion:*(void *)(a1 + 48)];
  v12 = (void *)[*(id *)(a1 + 48) mutableCopy];
  v13 = [*(id *)(*(void *)(a1 + 32) + 64) validRegion];
  CGFloat v14 = [v12 regionByRemovingRegion:v13];

  if (![v14 isEmpty])
  {
    id v15 = objc_alloc(MEMORY[0x1E4F1E070]);
    CGFloat v16 = [*(id *)(a1 + 56) metalTexture];
    CGFloat v17 = (void *)[v15 initWithMTLTexture:v16 commandBuffer:0];

    [v17 setFlipped:1];
    [v17 setColorSpace:0];
    [v17 setAlphaMode:0];
    uint64_t v18 = *(void *)(a1 + 128);
    uint64_t v19 = *(void *)(a1 + 136);
    double v20 = (double)v18;
    double v21 = (double)v19;
    double v22 = (double)*(uint64_t *)(a1 + 144);
    double v23 = (double)*(uint64_t *)(a1 + 152);
    double v24 = (double)(v18 - *(void *)(a1 + 160));
    double v25 = (double)(v19 - *(void *)(a1 + 168));
    v26 = [*(id *)(a1 + 56) metalContext];
    CGSize v27 = [*(id *)(a1 + 32) inputImage];
    id v28 = (id)objc_msgSend(v26, "startTaskToRender:fromRect:toDestination:atPoint:error:", v27, v17, 0, v20, v21, v22, v23, v24, v25);

    CGSize v29 = *(void **)(*(void *)(a1 + 32) + 64);
    uint64_t v35 = MEMORY[0x1E4F143A8];
    uint64_t v36 = 3221225472;
    CGSize v37 = __33__NUTiledProcessorCache__render___block_invoke_2;
    v38 = &unk_1E5D94FA0;
    long long v30 = *(_OWORD *)(a1 + 176);
    long long v41 = *(_OWORD *)(a1 + 160);
    long long v42 = v30;
    uint64_t v31 = *(void *)(a1 + 64);
    id v39 = *(id *)(a1 + 56);
    id v40 = *(id *)(a1 + 72);
    [v29 writeTextureRegion:v14 device:v31 withBlock:&v35];
    objc_msgSend(*(id *)(a1 + 72), "encodeSignalEvent:value:", *(void *)(*(void *)(a1 + 32) + 24), ++*(void *)(*(void *)(a1 + 32) + 96), v35, v36, v37, v38);
    uint64_t v32 = +[NURegion region];
    uint64_t v33 = *(void *)(*(void *)(a1 + 80) + 8);
    id v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;
  }
  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 96);
}

void __33__NUTiledProcessorCache__render___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  long long v5 = 0uLL;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v6 = 0uLL;
  if (v3)
  {
    [v3 frameRect];
    long long v6 = v21;
    long long v5 = v22;
  }
  long long v7 = *(_OWORD *)(a1 + 64);
  v26[0] = *(_OWORD *)(a1 + 48);
  v26[1] = v7;
  v25[0] = v6;
  v25[1] = v5;
  NU::RectT<long>::Intersection((uint64_t)&v23, (uint64_t *)v26, (uint64_t *)v25);
  int64x2_t v14 = v24;
  int64x2_t v8 = vaddq_s64(v23, v24);
  *(void *)&long long v9 = v23.i64[0] - v21;
  *((void *)&v9 + 1) = *((void *)&v22 + 1) + *((void *)&v21 + 1) - v8.i64[1];
  long long v12 = v9;
  *(void *)&long long v9 = v23.i64[0] - *(void *)(a1 + 48);
  *((void *)&v9 + 1) = *(void *)(a1 + 72) + *(void *)(a1 + 56) - v8.i64[1];
  long long v13 = v9;
  uint64_t v10 = [v4 texture];
  long long v17 = v12;
  uint64_t v18 = 0;
  int64x2_t v19 = v14;
  uint64_t v20 = 1;
  v11 = [*(id *)(a1 + 32) metalTexture];
  long long v15 = v13;
  uint64_t v16 = 0;
  +[NUCopyKernel copyFromTexture:v10 region:&v17 toTexture:v11 atPoint:&v15 withCommandBuffer:*(void *)(a1 + 40)];
}

void __33__NUTiledProcessorCache__render___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  long long v5 = 0uLL;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v6 = 0uLL;
  if (v3)
  {
    [v3 frameRect];
    long long v6 = v21;
    long long v5 = v22;
  }
  long long v7 = *(_OWORD *)(a1 + 64);
  v26[0] = *(_OWORD *)(a1 + 48);
  v26[1] = v7;
  v25[0] = v6;
  v25[1] = v5;
  NU::RectT<long>::Intersection((uint64_t)&v23, (uint64_t *)v26, (uint64_t *)v25);
  int64x2_t v13 = v24;
  int64x2_t v8 = vaddq_s64(v23, v24);
  *(void *)&long long v9 = v23.i64[0] - v21;
  *((void *)&v9 + 1) = *((void *)&v22 + 1) + *((void *)&v21 + 1) - v8.i64[1];
  long long v14 = v9;
  *(void *)&long long v9 = v23.i64[0] - *(void *)(a1 + 48);
  *((void *)&v9 + 1) = *(void *)(a1 + 72) + *(void *)(a1 + 56) - v8.i64[1];
  long long v12 = v9;
  uint64_t v10 = [*(id *)(a1 + 32) metalTexture];
  long long v17 = v12;
  uint64_t v18 = 0;
  int64x2_t v19 = v13;
  uint64_t v20 = 1;
  v11 = [v4 texture];
  long long v15 = v14;
  uint64_t v16 = 0;
  +[NUCopyKernel copyFromTexture:v10 region:&v17 toTexture:v11 atPoint:&v15 withCommandBuffer:*(void *)(a1 + 40)];
}

- (NUTiledProcessorCache)initWithImage:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NUTiledProcessorCache;
  id v3 = [(NUProcessorCache *)&v7 initWithImage:a3];
  *(int64x2_t *)(v3 + 72) = vdupq_n_s64(0x400uLL);
  uint64_t v4 = +[NUColorSpace workingColorSpace];
  long long v5 = (void *)*((void *)v3 + 11);
  *((void *)v3 + 11) = v4;

  return (NUTiledProcessorCache *)v3;
}

@end