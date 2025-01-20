@interface SUUIContentRatingArtworkResourceLoader
- (CGSize)imageSize;
- (SUUIContentRatingArtworkResourceLoader)init;
- (SUUIContentRatingArtworkResourceLoader)initWithArtworkLoader:(id)a3;
- (SUUIImageDataConsumer)imageDataConsumer;
- (SUUIResourceLoader)artworkLoader;
- (UIImage)placeholderImage;
- (id)_loadImage:(id)a3;
- (id)_urlForContentRating:(id)a3 clientContext:(id)a4;
- (id)cachedImageForContentRating:(id)a3 withClientContext:(id)a4;
- (void)addObserver:(id)a3;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)loadImageForContentRating:(id)a3 clientContent:(id)a4 reason:(int64_t)a5;
- (void)removeObserver:(id)a3;
- (void)setImageDataConsumer:(id)a3;
@end

@implementation SUUIContentRatingArtworkResourceLoader

- (SUUIContentRatingArtworkResourceLoader)init
{
  return [(SUUIContentRatingArtworkResourceLoader *)self initWithArtworkLoader:0];
}

- (SUUIContentRatingArtworkResourceLoader)initWithArtworkLoader:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SUUIContentRatingArtworkResourceLoader;
    v6 = [(SUUIContentRatingArtworkResourceLoader *)&v10 init];
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
      artworkRequestIDs = v6->_artworkRequestIDs;
      v6->_artworkRequestIDs = (NSMapTable *)v7;

      objc_storeStrong((id *)&v6->_loader, a3);
    }
  }
  else
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"nil loader"];

    v6 = 0;
  }

  return v6;
}

- (void)addObserver:(id)a3
{
  objc_initWeak(&location, a3);
  observers = self->_observers;
  if (!observers)
  {
    id v5 = (NSHashTable *)[objc_alloc(MEMORY[0x263F088B0]) initWithOptions:517 capacity:0];
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  id v7 = objc_loadWeakRetained(&location);
  [(NSHashTable *)observers addObject:v7];

  objc_destroyWeak(&location);
}

- (id)cachedImageForContentRating:(id)a3 withClientContext:(id)a4
{
  id v6 = a3;
  id v7 = [(SUUIContentRatingArtworkResourceLoader *)self _urlForContentRating:v6 clientContext:a4];
  if (v7) {
    goto LABEL_4;
  }
  v8 = [v6 contentRatingSystemName];
  int v9 = [v8 isEqualToString:@"appsBrazil"];

  if (!v9) {
    goto LABEL_4;
  }
  objc_super v10 = NSString;
  v11 = [v6 contentRank];
  v12 = [v10 stringWithFormat:@"ContentRating-appsBrazil-%@", v11];

  v13 = [(SUUIContentRatingArtworkResourceLoader *)self _loadImage:v12];

  if (!v13)
  {
LABEL_4:
    v14 = [(NSMapTable *)self->_artworkRequestIDs objectForKey:v6];
    v15 = v14;
    if (v14)
    {
      v13 = -[SUUIResourceLoader cachedResourceForRequestIdentifier:](self->_loader, "cachedResourceForRequestIdentifier:", [v14 unsignedIntegerValue]);
    }
    else
    {
      v13 = 0;
    }
  }
  return v13;
}

- (void)loadImageForContentRating:(id)a3 clientContent:(id)a4 reason:(int64_t)a5
{
  id v12 = a3;
  id v7 = -[SUUIContentRatingArtworkResourceLoader _urlForContentRating:clientContext:](self, "_urlForContentRating:clientContext:");
  if (v7)
  {
    v8 = objc_alloc_init(SUUIArtworkRequest);
    [(SUUIArtworkRequest *)v8 setDataConsumer:self->_imageDataConsumer];
    [(SUUIArtworkRequest *)v8 setDelegate:self];
    int v9 = [NSURL URLWithString:v7];
    [(SUUIArtworkRequest *)v8 setURL:v9];

    [(SUUIResourceLoader *)self->_loader loadResourceWithRequest:v8 reason:a5];
    artworkRequestIDs = self->_artworkRequestIDs;
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v8, "requestIdentifier"));
    [(NSMapTable *)artworkRequestIDs setObject:v11 forKey:v12];
  }
}

- (UIImage)placeholderImage
{
  placeholderImage = self->_placeholderImage;
  if (!placeholderImage)
  {
    imageDataConsumer = self->_imageDataConsumer;
    id v5 = [MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
    id v6 = [(SUUIImageDataConsumer *)imageDataConsumer imageForColor:v5];
    id v7 = self->_placeholderImage;
    self->_placeholderImage = v6;

    placeholderImage = self->_placeholderImage;
  }
  return placeholderImage;
}

- (CGSize)imageSize
{
  double v2 = 11.0;
  double v3 = 11.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)removeObserver:(id)a3
{
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a3 requestIdentifier];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v8 = self->_artworkRequestIDs;
  uint64_t v9 = [(NSMapTable *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      v14 = [(NSMapTable *)self->_artworkRequestIDs objectForKey:v13];
      if (v7 == [v14 unsignedIntegerValue]) {
        break;
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMapTable *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v15 = v13;

    if (!v15) {
      goto LABEL_22;
    }
    v16 = [(NSHashTable *)self->_observers allObjects];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v23 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v21 contentRatingArtworkLoader:self didLoadImage:v6 forContentRating:v15];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v18);
    }
  }
  else
  {
LABEL_9:
    v15 = v8;
  }

LABEL_22:
}

- (id)_urlForContentRating:(id)a3 clientContext:(id)a4
{
  id v5 = a3;
  id v6 = [a4 URLBag];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v21 = 0;
    v8 = [v6 valueForKey:@"imagesForRatingBadges" error:&v21];
    objc_opt_class();
    uint64_t v9 = 0;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v5 contentRatingSystemName];
      uint64_t v11 = [v8 objectForKey:v10];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [v5 contentRank];
        v13 = [v11 objectForKey:v12];

        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v14 = (void *)[v13 copy];
          if ([v14 count] < 1)
          {
            uint64_t v9 = 0;
          }
          else
          {
            v15 = [MEMORY[0x263F82B60] mainScreen];
            [v15 scale];
            double v17 = v16;

            if (v17 >= 2.0) {
              [v14 lastObject];
            }
            else {
            uint64_t v18 = [v14 firstObject];
            }
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v19 = [v18 objectForKey:@"url"];
              uint64_t v9 = (void *)[v19 copy];
            }
            else
            {
              uint64_t v9 = 0;
            }
          }
        }
        else
        {
          uint64_t v9 = 0;
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_loadImage:(id)a3
{
  double v3 = (void *)MEMORY[0x263F086E0];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [MEMORY[0x263F827E8] imageNamed:v4 inBundle:v5];

  return v6;
}

- (SUUIResourceLoader)artworkLoader
{
  return self->_loader;
}

- (SUUIImageDataConsumer)imageDataConsumer
{
  return self->_imageDataConsumer;
}

- (void)setImageDataConsumer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_loader, 0);
  objc_storeStrong((id *)&self->_imageDataConsumer, 0);
  objc_storeStrong((id *)&self->_artworkRequestIDs, 0);
}

@end