@interface NUTiledProviderCache
- (NUTiledProviderCache)initWithImage:(id)a3;
- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9;
@end

@implementation NUTiledProviderCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorSpace, 0);

  objc_storeStrong((id *)&self->_cachedTiledImage, 0);
}

- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9
{
  v16 = [(NUProcessorCache *)self pixelFormat];
  int v17 = [v16 CIFormat];

  v18 = [(NUProcessorCache *)self inputImage];
  [v18 extent];
  v52.origin.x = v19;
  v52.origin.y = v20;
  v52.size.width = v21;
  v52.size.height = v22;
  NU::RectT<long>::RectT(&v56, &v52, 3);
  long long v30 = v57;
  long long v31 = v56;

  *(void *)&v23.x = a5;
  *(void *)&v23.y = a6;
  *(void *)&v24.width = a7;
  *(void *)&v24.height = a8;
  v52.CGPoint origin = v23;
  v52.CGSize size = v24;
  long long v56 = v31;
  long long v57 = v30;
  NU::RectT<long>::Intersection((uint64_t)&v55, (uint64_t *)&v52, (uint64_t *)&v56);
  CGSize size = v55.size;
  CGPoint origin = v55.origin;
  CGRect v52 = v55;
  v25 = +[NURegion regionWithRect:&v52];
  v52.origin.x = 0.0;
  *(void *)&v52.origin.y = &v52;
  *(void *)&v52.size.width = 0x3032000000;
  *(void *)&v52.size.height = __Block_byref_object_copy__16363;
  v53 = __Block_byref_object_dispose__16364;
  id v54 = v25;
  textureCacheQueue = self->super.super._textureCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__NUTiledProviderCache_provideImageData_bytesPerRow_origin::size::userInfo___block_invoke;
  block[3] = &unk_1E5D94FF0;
  long long v35 = v31;
  long long v36 = v30;
  block[4] = self;
  id v33 = v54;
  v37 = a3;
  unint64_t v38 = a7;
  unint64_t v39 = a8;
  unint64_t v40 = a4;
  int v51 = v17;
  CGPoint v41 = origin;
  CGSize v42 = size;
  unint64_t v43 = a5;
  unint64_t v44 = a6;
  unint64_t v45 = a7;
  unint64_t v46 = a8;
  unint64_t v47 = a5;
  unint64_t v48 = a6;
  unint64_t v49 = a7;
  unint64_t v50 = a8;
  v34 = &v52;
  id v27 = v54;
  dispatch_sync(textureCacheQueue, block);

  _Block_object_dispose(&v52, 8);
}

void __76__NUTiledProviderCache_provideImageData_bytesPerRow_origin::size::userInfo___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)v2[9];
  if (!v3)
  {
    v4 = +[NUImageLayout tiledLayoutForImageSize:tileSize:](NUImageLayout, "tiledLayoutForImageSize:tileSize:", *(void *)(a1 + 72), *(void *)(a1 + 80), v2[10], v2[11]);
    v5 = [*(id *)(a1 + 32) pixelFormat];
    uint64_t v6 = +[NUImageFactory bufferImageWithLayout:v4 format:v5 colorSpace:*(void *)(*(void *)(a1 + 32) + 96)];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 72);
    *(void *)(v7 + 72) = v6;

    v3 = *(void **)(*(void *)(a1 + 32) + 72);
  }
  [v3 beginAccessRegion:*(void *)(a1 + 40)];
  v9 = (void *)[*(id *)(a1 + 40) mutableCopy];
  v10 = [*(id *)(*(void *)(a1 + 32) + 72) validRegion];
  v11 = [v9 regionByRemovingRegion:v10];

  if ([v11 isEmpty])
  {
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 72);
    uint64_t v13 = *(void *)(a1 + 88);
    uint64_t v14 = *(void *)(a1 + 112);
    long long v15 = *(_OWORD *)(a1 + 200);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 184);
    long long v43 = v15;
    +[NUImageUtilities copyPixelsFromImage:v12 rect:buf destPtr:v13 destPtrRowBytes:v14];
  }
  else
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithBitmapData:*(void *)(a1 + 88) width:*(void *)(a1 + 96) height:*(void *)(a1 + 104) bytesPerRow:*(void *)(a1 + 112) format:*(unsigned int *)(a1 + 216)];
    [v16 setFlipped:0];
    [v16 setColorSpace:0];
    [v16 setAlphaMode:0];
    uint64_t v17 = *(void *)(a1 + 120);
    uint64_t v18 = *(void *)(a1 + 128);
    double v19 = (double)v17;
    double v20 = (double)v18;
    double v21 = (double)*(uint64_t *)(a1 + 136);
    double v22 = (double)(v17 - *(void *)(a1 + 152));
    double v23 = (double)(v18 - *(void *)(a1 + 160));
    double v24 = (double)*(uint64_t *)(a1 + 144);
    v25 = *(void **)(a1 + 32);
    v26 = (void *)v25[8];
    id v27 = [v25 inputImage];
    id v41 = 0;
    v28 = objc_msgSend(v26, "startTaskToRender:fromRect:toDestination:atPoint:error:", v27, v16, &v41, v19, v20, v21, v24, v22, v23);
    id v29 = v41;

    if (!v28)
    {
      if (_NULogOnceToken != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_111_16386);
      }
      long long v30 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v29;
        _os_log_error_impl(&dword_1A9892000, v30, OS_LOG_TYPE_ERROR, "NUTiledProviderCache: failed to render: %@", buf, 0xCu);
      }
    }
    id v40 = v29;
    long long v31 = [v28 waitUntilCompletedAndReturnError:&v40];
    id v32 = v40;

    uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 72);
    uint64_t v34 = *(void *)(a1 + 88);
    uint64_t v35 = *(void *)(a1 + 112);
    long long v36 = *(_OWORD *)(a1 + 200);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 184);
    long long v43 = v36;
    +[NUImageUtilities copyPixelsToImage:v33 rect:buf srcPtr:v34 srcPtrRowBytes:v35];
    uint64_t v37 = +[NURegion region];
    uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v39 = *(void **)(v38 + 40);
    *(void *)(v38 + 40) = v37;
  }
  [*(id *)(*(void *)(a1 + 32) + 72) endAccessRegion:*(void *)(a1 + 40)];
}

- (NUTiledProviderCache)initWithImage:(id)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)NUTiledProviderCache;
  v3 = [(NUProcessorCache *)&v11 initWithImage:a3];
  v3->_tileSize = ($5BB7312FFE32F1AB3F1F5957C99A58B3)vdupq_n_s64(0x400uLL);
  uint64_t v4 = +[NUColorSpace workingColorSpace];
  colorSpace = v3->_colorSpace;
  v3->_colorSpace = (NUColorSpace *)v4;

  uint64_t v6 = (void *)MEMORY[0x1E4F1E018];
  uint64_t v12 = *MEMORY[0x1E4F1E1E0];
  v13[0] = MEMORY[0x1E4F1CC28];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  uint64_t v8 = [v6 contextWithOptions:v7];
  ctx = v3->super._ctx;
  v3->super._ctx = (CIContext *)v8;

  return v3;
}

@end