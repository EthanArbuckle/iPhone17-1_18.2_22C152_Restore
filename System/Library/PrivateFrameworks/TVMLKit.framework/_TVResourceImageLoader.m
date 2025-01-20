@interface _TVResourceImageLoader
+ (id)sharedInstance;
- (_TVResourceImageLoader)init;
- (id)URLForObject:(id)a3;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _TVResourceImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_loader_0;
  return v2;
}

- (_TVResourceImageLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)_TVResourceImageLoader;
  v2 = [(_TVResourceImageLoader *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08A48] mainQueue];
    imageLoaderQueue = v2->_imageLoaderQueue;
    v2->_imageLoaderQueue = (NSOperationQueue *)v3;
  }
  return v2;
}

- (id)imageKeyForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)URLForObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
  {
    objc_super v6 = NSURL;
    v7 = [NSString stringWithFormat:@"resource://%@", v3];
    id v5 = [v6 URLWithString:v7];
  }
  return v5;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a8;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v15 = v12;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;
  BOOL v17 = a6 == 1;
  if (v16)
  {
    v18 = [(_TVResourceImageLoader *)self URLForObject:v12];
    v19 = v18;
    if (v18)
    {
      id v20 = v18;
    }
    else
    {
      v22 = NSURL;
      v23 = NSString;
      v24 = [(_TVResourceImageLoader *)self imageKeyForObject:v12];
      v25 = [v23 stringWithFormat:@"imageKey://%@", v24];
      id v20 = [v22 URLWithString:v25];
    }
    v26 = [v13 recordForResource:3 withInitiator:2];
    v27 = [MEMORY[0x263F08BD8] requestWithURL:v20];
    [v26 willSendRequest:v27];

    v28 = (void *)MEMORY[0x263F086D0];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __114___TVResourceImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v31[3] = &unk_264BA6A88;
    BOOL v35 = v17;
    id v32 = v16;
    id v33 = v26;
    id v34 = v14;
    id v29 = v26;
    v21 = [v28 blockOperationWithBlock:v31];
    [(NSOperationQueue *)self->_imageLoaderQueue addOperation:v21];
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void)cancelLoad:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v3 cancel];
  }
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6
{
  return -[_TVResourceImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", a3, a5, 1, a6, a4.width, a4.height);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7
{
  return -[_TVResourceImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", a3, a5, a6, 0, a7, a4.width, a4.height);
}

- (void).cxx_destruct
{
}

@end