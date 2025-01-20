@interface _TVSymbolImageLoader
+ (id)sharedInstance;
- (BOOL)hasImageCache;
- (_TVSymbolImageLoader)init;
- (id)URLForObject:(id)a3;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _TVSymbolImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_loader;
  return v2;
}

- (_TVSymbolImageLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)_TVSymbolImageLoader;
  v2 = [(_TVSymbolImageLoader *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    imageLoaderQueue = v2->_imageLoaderQueue;
    v2->_imageLoaderQueue = (NSOperationQueue *)v3;
  }
  return v2;
}

- (BOOL)hasImageCache
{
  return 1;
}

- (id)imageKeyForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    v5 = [v4 symbolName];
    objc_super v6 = [v4 imageSymbolConfiguration];
    if (v6)
    {
      v7 = [v5 stringByAppendingString:@"_"];

      v8 = _UIImageSymbolConfigurationTextualSummary();
      v9 = objc_msgSend(v8, "tv_MD5String");
      v5 = [v7 stringByAppendingString:v9];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)URLForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 symbolName];
    if (v4)
    {
      v5 = NSURL;
      objc_super v6 = [NSString stringWithFormat:@"symbol://%@", v4];
      v7 = [v5 URLWithString:v6];
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v11 = a3;
  id v12 = a7;
  id v13 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v11;
    id v15 = [v14 symbolName];
    id v16 = [v14 imageSymbolConfiguration];

    if (v15)
    {
      v17 = [(_TVSymbolImageLoader *)self URLForObject:v14];
      v18 = v17;
      if (v17)
      {
        id v19 = v17;
      }
      else
      {
        v29 = NSURL;
        v21 = NSString;
        v22 = [(_TVSymbolImageLoader *)self imageKeyForObject:v14];
        v23 = [v21 stringWithFormat:@"imageKey://%@", v22];
        id v19 = [v29 URLWithString:v23];
      }
      v24 = [v12 recordForResource:3 withInitiator:2];
      v25 = [MEMORY[0x263F08BD8] requestWithURL:v19];
      [v24 willSendRequest:v25];

      v26 = (void *)MEMORY[0x263F086D0];
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      v30[2] = __112___TVSymbolImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
      v30[3] = &unk_264BA64F0;
      id v15 = v15;
      id v31 = v15;
      id v16 = v16;
      id v32 = v16;
      id v33 = v24;
      id v34 = v13;
      id v27 = v24;
      v20 = [v26 blockOperationWithBlock:v30];
      [(NSOperationQueue *)self->_imageLoaderQueue addOperation:v20];

      goto LABEL_9;
    }
  }
  else
  {
    id v15 = 0;
    id v16 = 0;
  }
  v20 = 0;
LABEL_9:

  return v20;
}

- (void)cancelLoad:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 cancel];
  }
}

- (void).cxx_destruct
{
}

@end