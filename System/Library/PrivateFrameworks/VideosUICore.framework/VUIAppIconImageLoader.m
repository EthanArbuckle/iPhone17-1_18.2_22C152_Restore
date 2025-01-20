@interface VUIAppIconImageLoader
+ (id)sharedInstance;
- (VUIAppIconImageLoader)init;
- (id)URLForObject:(id)a3;
- (id)_createApplicationIconForIdentifier:(id)a3;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation VUIAppIconImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_loader;
  return v2;
}

uint64_t __39__VUIAppIconImageLoader_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_loader;
  sharedInstance_loader = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (VUIAppIconImageLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)VUIAppIconImageLoader;
  v2 = [(VUIAppIconImageLoader *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    imageLoaderQueue = v2->_imageLoaderQueue;
    v2->_imageLoaderQueue = (NSOperationQueue *)v3;
  }
  return v2;
}

- (id)URLForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CB10];
    v7 = [NSString stringWithFormat:@"app://%@", v3];
    v5 = [v6 URLWithString:v7];
  }
  return v5;
}

- (id)imageKeyForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 stringByAppendingString:@"-2"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v10 = a3;
  id v11 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v10;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;
  v14 = v13;
  if (v13)
  {
    v15 = (void *)MEMORY[0x1E4F28B48];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __113__VUIAppIconImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v18[3] = &unk_1E6DDCC68;
    v18[4] = self;
    id v19 = v13;
    id v20 = v11;
    v16 = [v15 blockOperationWithBlock:v18];
    [(NSOperationQueue *)self->_imageLoaderQueue addOperation:v16];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __113__VUIAppIconImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _createApplicationIconForIdentifier:*(void *)(a1 + 40)];
  v2 = -[VUIImage initWithCGImageRef:preserveAlpha:]([VUIImage alloc], "initWithCGImageRef:preserveAlpha:", [v6 vuiCGImage], 1);
  id v3 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    if (v2)
    {
      (*(void (**)(uint64_t, VUIImage *, void, void, void, void))(v4 + 16))(v4, v2, 0, 0, 0, 0);
    }
    else
    {
      v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:0];
      (*(void (**)(uint64_t, void, void, void, void, void *))(v4 + 16))(v4, 0, 0, 0, 0, v5);
    }
  }
}

- (void)cancelLoad:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 cancel];
  }
}

- (id)_createApplicationIconForIdentifier:(id)a3
{
  id v3 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:a3];
  uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 scale];
  double v6 = v5;

  v7 = (void *)MEMORY[0x1E4F42A80];
  v8 = [v3 bundleIdentifier];
  v9 = [v7 _applicationIconImageForBundleIdentifier:v8 format:2 scale:v6];

  return v9;
}

- (void).cxx_destruct
{
}

@end