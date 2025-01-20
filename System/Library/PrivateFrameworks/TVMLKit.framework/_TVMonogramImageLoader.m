@interface _TVMonogramImageLoader
+ (id)sharedInstance;
- (_TVMonogramImageLoader)init;
- (id)URLForObject:(id)a3;
- (id)_imageLoadError;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _TVMonogramImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_18);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

- (_TVMonogramImageLoader)init
{
  v12[6] = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)_TVMonogramImageLoader;
  v2 = [(_TVMonogramImageLoader *)&v10 init];
  if (v2)
  {
    v3 = objc_opt_new();
    v11[0] = &unk_26E59E2A8;
    v4 = objc_opt_new();
    v12[0] = v4;
    v11[1] = &unk_26E59E2C0;
    v5 = objc_opt_new();
    v12[1] = v5;
    v11[2] = &unk_26E59E2D8;
    v6 = objc_opt_new();
    v12[2] = v6;
    v12[3] = v3;
    v11[3] = &unk_26E59E2F0;
    v11[4] = &unk_26E59E308;
    v11[5] = &unk_26E59E320;
    v12[4] = v3;
    v12[5] = v3;
    uint64_t v7 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];
    generatorByType = v2->_generatorByType;
    v2->_generatorByType = (NSDictionary *)v7;
  }
  return v2;
}

- (id)imageKeyForObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    generatorByType = self->_generatorByType;
    v6 = NSNumber;
    id v7 = v4;
    v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "preferedMonogramType"));
    v9 = [(NSDictionary *)generatorByType objectForKey:v8];

    objc_super v10 = [v9 imageKeyForObject:v7];
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (id)URLForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 imageURL];
    if (+[_TVMonogramAppleAccountImageGenerator isAppleAccountsURL:v4])
    {
      v5 = 0;
    }
    else
    {
      v5 = v4;
    }
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  BOOL v11 = a5;
  double height = a4.height;
  double width = a4.width;
  id v15 = a3;
  id v16 = a7;
  id v17 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v18 = v15;
    v19 = v18;
    if (v16)
    {
      id v20 = v16;
    }
    else
    {
      id v20 = [v18 requestLoader];
    }
    uint64_t v22 = objc_msgSend(v19, "preferedMonogramType", v20);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __114___TVMonogramImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v31[3] = &unk_264BA72A8;
    id v32 = v17;
    v23 = (void (**)(void, void, void, void, void, void))MEMORY[0x230FC9DC0](v31);
    generatorByType = self->_generatorByType;
    v25 = [NSNumber numberWithUnsignedInteger:v22];
    v26 = [(NSDictionary *)generatorByType objectForKey:v25];

    if (v26)
    {
      v27 = v30;
      v21 = objc_msgSend(v26, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", v19, v11, a6, v30, v23, width, height);
      objc_msgSend(v21, "tv_setGeneratorType:", v22);
    }
    else
    {
      v28 = [MEMORY[0x263F087E8] errorWithDomain:@"TVMLKitErrorDomain" code:11 userInfo:0];
      ((void (**)(void, void, void, void, void, void *))v23)[2](v23, 0, 0, 0, 0, v28);

      v21 = 0;
      v27 = v30;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)cancelLoad:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "tv_generatorType");
  generatorByType = self->_generatorByType;
  id v7 = [NSNumber numberWithUnsignedInteger:v5];
  id v8 = [(NSDictionary *)generatorByType objectForKey:v7];

  [v8 cancelLoad:v4];
}

- (id)_imageLoadError
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08410] code:-18 userInfo:0];
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6
{
  return -[_TVMonogramImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", a3, a5, 1, a6, a4.width, a4.height);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7
{
  return -[_TVMonogramImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", a3, a5, a6, 0, a7, a4.width, a4.height);
}

- (void).cxx_destruct
{
}

@end