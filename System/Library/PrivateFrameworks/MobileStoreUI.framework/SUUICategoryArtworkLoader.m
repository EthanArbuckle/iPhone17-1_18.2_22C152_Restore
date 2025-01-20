@interface SUUICategoryArtworkLoader
- (CGSize)imageSize;
- (SUUICategoryArtworkLoader)init;
- (SUUICategoryArtworkLoader)initWithArtworkLoader:(id)a3;
- (SUUIImageDataConsumer)imageDataConsumer;
- (SUUIResourceLoader)artworkLoader;
- (UIImage)placeholderImage;
- (id)cachedImageForCategory:(id)a3;
- (void)addObserver:(id)a3;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)loadImageForCategory:(id)a3 reason:(int64_t)a4;
- (void)removeObserver:(id)a3;
- (void)setImageDataConsumer:(id)a3;
@end

@implementation SUUICategoryArtworkLoader

- (SUUICategoryArtworkLoader)init
{
  return [(SUUICategoryArtworkLoader *)self initWithArtworkLoader:0];
}

- (SUUICategoryArtworkLoader)initWithArtworkLoader:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SUUICategoryArtworkLoader;
    v6 = [(SUUICategoryArtworkLoader *)&v10 init];
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

- (id)cachedImageForCategory:(id)a3
{
  v4 = [(NSMapTable *)self->_artworkRequestIDs objectForKey:a3];
  id v5 = v4;
  if (v4)
  {
    v6 = -[SUUIResourceLoader cachedResourceForRequestIdentifier:](self->_loader, "cachedResourceForRequestIdentifier:", [v4 unsignedIntegerValue]);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)loadImageForCategory:(id)a3 reason:(int64_t)a4
{
  id v17 = a3;
  v6 = -[NSMapTable objectForKey:](self->_artworkRequestIDs, "objectForKey:");
  id v7 = v6;
  if (!v6
    || !-[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_loader, "trySetReason:forRequestWithIdentifier:", a4, [v6 unsignedIntegerValue]))
  {
    v8 = [MEMORY[0x263F82B60] mainScreen];
    [v8 scale];
    double v10 = v9;

    if (v10 == 2.0) {
      uint64_t v11 = 100;
    }
    else {
      uint64_t v11 = 50;
    }
    v12 = [v17 artworkProvider];
    v13 = [v12 artworkURLForSize:v11];

    if (v13)
    {
      v14 = objc_alloc_init(SUUIArtworkRequest);
      [(SUUIArtworkRequest *)v14 setDataConsumer:self->_imageDataConsumer];
      [(SUUIArtworkRequest *)v14 setDelegate:self];
      [(SUUIArtworkRequest *)v14 setURL:v13];
      [(SUUIResourceLoader *)self->_loader loadResourceWithRequest:v14 reason:a4];
      artworkRequestIDs = self->_artworkRequestIDs;
      v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SUUIResourceRequest requestIdentifier](v14, "requestIdentifier"));
      [(NSMapTable *)artworkRequestIDs setObject:v16 forKey:v17];
    }
  }
}

- (UIImage)placeholderImage
{
  placeholderImage = self->_placeholderImage;
  if (!placeholderImage)
  {
    imageDataConsumer = self->_imageDataConsumer;
    id v5 = [MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
    v6 = [(SUUIImageDataConsumer *)imageDataConsumer imageForColor:v5];
    id v7 = self->_placeholderImage;
    self->_placeholderImage = v6;

    placeholderImage = self->_placeholderImage;
  }
  return placeholderImage;
}

- (CGSize)imageSize
{
  double v2 = 33.0;
  double v3 = 33.0;
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
            [v21 categoryArtworkLoader:self didLoadImage:v6 forCategory:v15];
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