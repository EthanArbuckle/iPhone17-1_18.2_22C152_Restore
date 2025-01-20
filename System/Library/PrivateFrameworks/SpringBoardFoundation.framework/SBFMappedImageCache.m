@interface SBFMappedImageCache
+ (id)systemAppPersistenteCache;
- (SBFMappedImageCache)initWithDescription:(id)a3;
- (id)imageForKey:(id)a3 cacheOptions:(unint64_t)a4 generateImageWithBlockIfNecessary:(id)a5;
- (id)imageForKey:(id)a3 generateImageWithBlockIfNecessary:(id)a4;
- (id)imageForKey:(id)a3 options:(int)a4;
- (id)imageForKey:(id)a3 options:(int)a4 generateImageWithBlockIfNecessary:(id)a5;
@end

@implementation SBFMappedImageCache

+ (id)systemAppPersistenteCache
{
  v4 = (void *)MEMORY[0x1E4F43630];
  if (([(id)*MEMORY[0x1E4F43630] isFrontBoard] & 1) == 0 && *v4)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:a1 file:@"SBFMappedImageCache.m" lineNumber:24 description:@"-[SBFMappedImageCache systemAppPersistenteCache] Allowed only in system app"];
  }
  if (systemAppPersistenteCache___once != -1) {
    dispatch_once(&systemAppPersistenteCache___once, &__block_literal_global_13);
  }
  v5 = (void *)systemAppPersistenteCache___cache;
  return v5;
}

uint64_t __48__SBFMappedImageCache_systemAppPersistenteCache__block_invoke()
{
  v0 = [[SBFMappedImageCache alloc] initWithUniqueIdentifier:@"Persistent"];
  uint64_t v1 = systemAppPersistenteCache___cache;
  systemAppPersistenteCache___cache = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (SBFMappedImageCache)initWithDescription:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBFMappedImageCache;
  return [(SBFMappedImageCache *)&v4 initWithUniqueIdentifier:a3];
}

- (id)imageForKey:(id)a3 generateImageWithBlockIfNecessary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__SBFMappedImageCache_imageForKey_generateImageWithBlockIfNecessary___block_invoke;
    v12[3] = &unk_1E548D520;
    id v13 = v7;
    v9 = (void *)MEMORY[0x18C133210](v12);
  }
  else
  {
    v9 = 0;
  }
  v10 = [(SBFMappedImageCache *)self _imageForKey:v6 withCPBitmapReadFlags:0 generatingIfNecessaryWithBlock:v9];

  return v10;
}

uint64_t __69__SBFMappedImageCache_imageForKey_generateImageWithBlockIfNecessary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)imageForKey:(id)a3 options:(int)a4 generateImageWithBlockIfNecessary:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__SBFMappedImageCache_imageForKey_options_generateImageWithBlockIfNecessary___block_invoke;
    v14[3] = &unk_1E548D520;
    id v15 = v9;
    v11 = (void *)MEMORY[0x18C133210](v14);
  }
  else
  {
    v11 = 0;
  }
  v12 = [(SBFMappedImageCache *)self _imageForKey:v8 withCPBitmapReadFlags:v6 generatingIfNecessaryWithBlock:v11];

  return v12;
}

uint64_t __77__SBFMappedImageCache_imageForKey_options_generateImageWithBlockIfNecessary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)imageForKey:(id)a3 options:(int)a4
{
  return (id)[(SBFMappedImageCache *)self _imageForKey:a3 withCPBitmapReadFlags:*(void *)&a4 generatingIfNecessaryWithBlock:0];
}

- (id)imageForKey:(id)a3 cacheOptions:(unint64_t)a4 generateImageWithBlockIfNecessary:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __82__SBFMappedImageCache_imageForKey_cacheOptions_generateImageWithBlockIfNecessary___block_invoke;
    v17 = &unk_1E548D548;
    unint64_t v19 = a4;
    id v18 = v9;
    v11 = (void *)MEMORY[0x18C133210](&v14);
  }
  else
  {
    v11 = 0;
  }
  v12 = -[SBFMappedImageCache _imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:](self, "_imageForKey:withCPBitmapReadFlags:generatingIfNecessaryWithBlock:", v8, 0, v11, v14, v15, v16, v17);

  return v12;
}

uint64_t __82__SBFMappedImageCache_imageForKey_cacheOptions_generateImageWithBlockIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40)) {
    *a2 = 1;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end