@interface NUProviderCache
- (id)outputImage;
- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9;
@end

@implementation NUProviderCache

- (void).cxx_destruct
{
}

- (void)provideImageData:(void *)a3 bytesPerRow:(unint64_t)a4 origin:(unint64_t)a5 :(unint64_t)a6 size:(unint64_t)a7 :(unint64_t)a8 userInfo:(id)a9
{
  v16 = [(NUProcessorCache *)self pixelFormat];
  uint64_t v17 = [v16 CIFormat];

  textureCacheQueue = self->super._textureCacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NUProviderCache_provideImageData_bytesPerRow_origin::size::userInfo___block_invoke;
  block[3] = &unk_1E5D95E68;
  block[4] = self;
  dispatch_sync(textureCacheQueue, block);
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F1E070]) initWithBitmapData:a3 width:a7 height:a8 bytesPerRow:a4 format:v17];
  [v19 setFlipped:0];
  v20 = [(NUProcessorCache *)self colorSpace];
  objc_msgSend(v19, "setColorSpace:", objc_msgSend(v20, "CGColorSpace"));

  [v19 setAlphaMode:0];
  ctx = self->_ctx;
  v22 = [(NUProcessorCache *)self inputImage];
  v23 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](ctx, "startTaskToRender:fromRect:toDestination:atPoint:error:", v22, v19, 0, (double)(uint64_t)a5, (double)(uint64_t)a6, (double)(uint64_t)a7, (double)(uint64_t)a8, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  id v24 = (id)[v23 waitUntilCompletedAndReturnError:0];
}

void __71__NUProviderCache_provideImageData_bytesPerRow_origin::size::userInfo___block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(a1 + 32) + 64))
  {
    v2 = (void *)MEMORY[0x1E4F1E018];
    uint64_t v7 = *MEMORY[0x1E4F1E1E0];
    v8[0] = MEMORY[0x1E4F1CC28];
    v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    uint64_t v4 = [v2 contextWithOptions:v3];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 64);
    *(void *)(v5 + 64) = v4;
  }
}

- (id)outputImage
{
  v24[4] = *MEMORY[0x1E4F143B8];
  v3 = [(NUProcessorCache *)self inputImage];
  [v3 extent];
  v22.origin.x = v4;
  v22.origin.y = v5;
  v22.size.width = v6;
  v22.size.height = v7;
  NU::RectT<long>::RectT(&v20, &v22, 3);
  long long v19 = v21;

  v8 = [(NUProcessorCache *)self pixelFormat];
  uint64_t v9 = [v8 CIFormat];

  v10 = [(NUProcessorCache *)self colorSpace];
  uint64_t v11 = [v10 CGColorSpace];

  id v12 = objc_alloc(MEMORY[0x1E4F1E050]);
  v23[0] = *MEMORY[0x1E4F1E3D8];
  v13 = [(NUProcessorCache *)self label];
  uint64_t v14 = *MEMORY[0x1E4F1E3E8];
  v24[0] = v13;
  v24[1] = &unk_1F004A088;
  uint64_t v15 = *MEMORY[0x1E4F1E3A0];
  v23[1] = v14;
  v23[2] = v15;
  v23[3] = *MEMORY[0x1E4F1E328];
  v24[2] = MEMORY[0x1E4F1CC28];
  v24[3] = MEMORY[0x1E4F1CC38];
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
  uint64_t v17 = objc_msgSend(v12, "initWithImageProvider:size::format:colorSpace:options:", self, v19, v9, v11, v16);

  return v17;
}

@end