@interface SKUIArtworkItemProvider
- (NSData)imageData;
- (NSMutableArray)completionHandlers;
- (NSProgress)progress;
- (NSURL)url;
- (SKUIArtworkItemProvider)initWithURL:(id)a3 usingResourceLoader:(id)a4;
- (SKUIResourceLoader)resourceLoader;
- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)setCompletionHandlers:(id)a3;
- (void)setImageData:(id)a3;
- (void)setProgress:(id)a3;
- (void)setResourceLoader:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SKUIArtworkItemProvider

- (SKUIArtworkItemProvider)initWithURL:(id)a3 usingResourceLoader:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIArtworkItemProvider initWithURL:usingResourceLoader:]();
  }
  v18.receiver = self;
  v18.super_class = (Class)SKUIArtworkItemProvider;
  v9 = [(SKUIArtworkItemProvider *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_resourceLoader, a4);
    uint64_t v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    progress = v10->_progress;
    v10->_progress = (NSProgress *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    completionHandlers = v10->_completionHandlers;
    v10->_completionHandlers = (NSMutableArray *)v13;

    [(SKUIArtworkItemProvider *)v10 registerDataRepresentationForTypeIdentifier:*MEMORY[0x1E4F22610] visibility:3 loadHandler:&__block_literal_global_4];
    v15 = objc_alloc_init(SKUIArtworkRequest);
    [(SKUIArtworkRequest *)v15 setURL:v10->_url];
    v16 = +[SSVURLDataConsumer consumer];
    [(SKUIArtworkRequest *)v15 setDataConsumer:v16];

    [(SKUIArtworkRequest *)v15 setDelegate:v10];
    [(SKUIResourceLoader *)v10->_resourceLoader loadResourceWithRequest:v15 reason:1];
  }
  return v10;
}

uint64_t __59__SKUIArtworkItemProvider_initWithURL_usingResourceLoader___block_invoke()
{
  return 0;
}

- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, NSData *, void))a4;
  if ([v6 isEqualToString:*MEMORY[0x1E4F22610]])
  {
    if ([(NSProgress *)self->_progress isFinished])
    {
      v7[2](v7, self->_imageData, 0);
    }
    else
    {
      completionHandlers = self->_completionHandlers;
      v10 = _Block_copy(v7);
      [(NSMutableArray *)completionHandlers addObject:v10];
    }
    id v8 = self->_progress;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SKUIArtworkItemProvider;
    id v8 = [(SKUIArtworkItemProvider *)&v13 loadDataRepresentationForTypeIdentifier:v6 completionHandler:v7];
  }
  uint64_t v11 = v8;

  return v11;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (UIImage *)a4;
  [(NSProgress *)self->_progress setCompletedUnitCount:1];
  UIImageJPEGRepresentation(v7, 1.0);
  id v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  imageData = self->_imageData;
  self->_imageData = v8;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v10 = self->_completionHandlers;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v14) + 16))(*(void *)(*((void *)&v15 + 1) + 8 * v14));
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }

  [(NSMutableArray *)self->_completionHandlers removeAllObjects];
  [v6 setDelegate:0];
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (SKUIResourceLoader)resourceLoader
{
  return self->_resourceLoader;
}

- (void)setResourceLoader:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (NSMutableArray)completionHandlers
{
  return self->_completionHandlers;
}

- (void)setCompletionHandlers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_resourceLoader, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initWithURL:usingResourceLoader:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIArtworkItemProvider initWithURL:usingResourceLoader:]";
}

@end