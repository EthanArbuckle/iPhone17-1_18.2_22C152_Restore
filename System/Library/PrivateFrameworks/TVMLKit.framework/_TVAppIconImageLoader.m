@interface _TVAppIconImageLoader
+ (id)sharedInstance;
- (_TVAppIconImageLoader)init;
- (id)URLForObject:(id)a3;
- (id)_createApplicationIconForIdentifier:(id)a3;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation _TVAppIconImageLoader

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_8);
  }
  v2 = (void *)sharedInstance_loader_1;
  return v2;
}

- (_TVAppIconImageLoader)init
{
  v6.receiver = self;
  v6.super_class = (Class)_TVAppIconImageLoader;
  v2 = [(_TVAppIconImageLoader *)&v6 init];
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
    objc_super v6 = NSURL;
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
    v15 = (void *)MEMORY[0x263F086D0];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __113___TVAppIconImageLoader_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v18[3] = &unk_264BA6AB0;
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
  id v3 = [MEMORY[0x263F01868] applicationProxyForIdentifier:a3];
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 scale];
  double v6 = v5;

  v7 = (void *)MEMORY[0x263F1C6B0];
  v8 = [v3 bundleIdentifier];
  v9 = [v7 _applicationIconImageForBundleIdentifier:v8 format:2 scale:v6];

  return v9;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 completionHandler:(id)a6
{
  return -[_TVAppIconImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:completionHandler:", a3, a5, 1, a6, a4.width, a4.height);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 completionHandler:(id)a7
{
  return -[_TVAppIconImageLoader loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:](self, "loadImageForObject:scaleToSize:cropToFit:imageDirection:requestLoader:completionHandler:", a3, a5, a6, 0, a7, a4.width, a4.height);
}

- (void).cxx_destruct
{
}

@end