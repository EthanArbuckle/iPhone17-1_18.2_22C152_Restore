@interface SUArtworkCellConfiguration
+ (id)copyDefaultContext;
- (id)_artworkImageForURL:(id)a3 dataProvider:(id)a4;
- (id)artworkImageForItemImage:(id)a3;
- (id)artworkImageForURL:(id)a3;
- (id)copyImageDataProvider;
- (void)cancelArtworkRequests;
- (void)dealloc;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)reloadAfterArtworkLoad;
- (void)setRepresentedObject:(id)a3;
@end

@implementation SUArtworkCellConfiguration

- (void)dealloc
{
  [(SUArtworkCellConfiguration *)self cancelArtworkRequests];

  self->_artworkLoadOperations = 0;
  self->_artworkByURL = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUArtworkCellConfiguration;
  [(SUArrayCellConfiguration *)&v3 dealloc];
}

- (id)artworkImageForItemImage:(id)a3
{
  uint64_t v5 = [a3 URL];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = [(SUArtworkCellConfiguration *)self copyImageDataProvider];
    [a3 imageScale];
    objc_msgSend(v7, "setInputImageScale:");
    id v8 = [(SUArtworkCellConfiguration *)self _artworkImageForURL:v6 dataProvider:v7];

    return v8;
  }
  else
  {
    id context = self->super.super._context;
    return (id)[context placeholderImage];
  }
}

- (id)artworkImageForURL:(id)a3
{
  if (a3)
  {
    id v5 = [(SUArtworkCellConfiguration *)self copyImageDataProvider];
    id v6 = [(SUArtworkCellConfiguration *)self _artworkImageForURL:a3 dataProvider:v5];

    return v6;
  }
  else
  {
    id context = self->super.super._context;
    return (id)[context placeholderImage];
  }
}

- (void)cancelArtworkRequests
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[self->super.super._context imagePool];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  artworkLoadOperations = self->_artworkLoadOperations;
  uint64_t v5 = [(NSMutableArray *)artworkLoadOperations countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(artworkLoadOperations);
        }
        v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 setDelegate:0];
        [v3 cancelOperation:v9];
      }
      uint64_t v6 = [(NSMutableArray *)artworkLoadOperations countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  [(NSMutableDictionary *)self->_artworkByURL removeAllObjects];
  [(NSMutableArray *)self->_artworkLoadOperations removeAllObjects];
}

- (id)copyImageDataProvider
{
  v2 = (void *)[self->super.super._context imageProvider];

  return (id)[v2 copy];
}

- (void)reloadAfterArtworkLoad
{
  [(SUArrayCellConfiguration *)self reloadData];
  objc_super v3 = [(SUCellConfiguration *)self view];

  [(SUCellConfigurationView *)v3 reloadView];
}

+ (id)copyDefaultContext
{
  return objc_alloc_init(SUArtworkCellContext);
}

- (void)setRepresentedObject:(id)a3
{
  if (self->super.super._representedObject != a3)
  {
    [(SUArtworkCellConfiguration *)self cancelArtworkRequests];
    v5.receiver = self;
    v5.super_class = (Class)SUArtworkCellConfiguration;
    [(SUCellConfiguration *)&v5 setRepresentedObject:a3];
  }
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  objc_msgSend(a3, "setDelegate:", 0, a4);
  artworkLoadOperations = self->_artworkLoadOperations;

  [(NSMutableArray *)artworkLoadOperations removeObject:a3];
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  if (a4)
  {
    if (!self->_artworkByURL) {
      self->_artworkByURL = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a3, "requestProperties"), "URL");
    [(NSMutableDictionary *)self->_artworkByURL setObject:a4 forKey:v7];
    objc_msgSend((id)objc_msgSend(self->super.super._context, "imageCache"), "addImage:forURL:dataProvider:", a4, v7, objc_msgSend(a3, "dataProvider"));
    [(SUArtworkCellConfiguration *)self reloadAfterArtworkLoad];
  }
  [a3 setDelegate:0];
  artworkLoadOperations = self->_artworkLoadOperations;

  [(NSMutableArray *)artworkLoadOperations removeObject:a3];
}

- (id)_artworkImageForURL:(id)a3 dataProvider:(id)a4
{
  id result = (id)-[NSMutableDictionary objectForKey:](self->_artworkByURL, "objectForKey:");
  if (!result)
  {
    id result = (id)objc_msgSend((id)objc_msgSend(self->super.super._context, "imageCache"), "imageForURL:dataProvider:", a3, a4);
    if (!result)
    {
      id v8 = objc_alloc_init(MEMORY[0x263F89528]);
      [v8 setDataProvider:a4];
      [v8 setDelegate:self];
      [v8 setUrlKnownToBeTrusted:1];
      [v8 setShouldMessageMainThread:1];
      v9 = (void *)[objc_alloc(MEMORY[0x263F7B368]) initWithURL:a3];
      [v8 setRequestProperties:v9];

      artworkLoadOperations = self->_artworkLoadOperations;
      if (!artworkLoadOperations)
      {
        artworkLoadOperations = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
        self->_artworkLoadOperations = artworkLoadOperations;
      }
      [(NSMutableArray *)artworkLoadOperations addObject:v8];
      objc_msgSend((id)objc_msgSend(self->super.super._context, "imagePool"), "addOperation:withFlags:", v8, 1);
      long long v11 = (void *)[self->super.super._context placeholderImage];

      return v11;
    }
  }
  return result;
}

@end