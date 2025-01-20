@interface PXShadowImageCache
+ (PXShadowImageCache)sharedInstance;
- (PXShadowImageCache)init;
- (id)stretchableShadowImageFor:(id)a3 cornerRadius:(double)a4 screenScale:(double)a5;
@end

@implementation PXShadowImageCache

- (void).cxx_destruct
{
}

- (id)stretchableShadowImageFor:(id)a3 cornerRadius:(double)a4 screenScale:(double)a5
{
  v16[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = 0;
  if (v8 && a5 != 0.0)
  {
    id v10 = objc_alloc((Class)off_1E5DA9660);
    v16[0] = v8;
    v11 = [NSNumber numberWithDouble:a4];
    v16[1] = v11;
    v12 = [NSNumber numberWithDouble:a5];
    v16[2] = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:3];
    v14 = (void *)[v10 initWithObjects:v13];

    v9 = [(NSMapTable *)self->_weakCache objectForKey:v14];
    if (!v9) {
      PXGCreateResizableShadowImage(v8);
    }
  }
  return v9;
}

- (PXShadowImageCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXShadowImageCache;
  v2 = [(PXShadowImageCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:0x10000 valueOptions:5 capacity:0];
    weakCache = v2->_weakCache;
    v2->_weakCache = (NSMapTable *)v3;
  }
  return v2;
}

+ (PXShadowImageCache)sharedInstance
{
  if (sharedInstance_onceToken_191305 != -1) {
    dispatch_once(&sharedInstance_onceToken_191305, &__block_literal_global_191306);
  }
  v2 = (void *)sharedInstance_sharedInstance_191307;
  return (PXShadowImageCache *)v2;
}

void __36__PXShadowImageCache_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(PXShadowImageCache);
  v1 = (void *)sharedInstance_sharedInstance_191307;
  sharedInstance_sharedInstance_191307 = (uint64_t)v0;
}

@end