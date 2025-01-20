@interface SUUISwooshArtworkLoader
- (BOOL)loadImageForObject:(id)a3 URL:(id)a4 reason:(int64_t)a5;
- (BOOL)loadImageForObject:(id)a3 artworkRequest:(id)a4 reason:(int64_t)a5;
- (SUUIImageDataConsumer)imageDataConsumer;
- (SUUIResourceLoader)artworkLoader;
- (SUUISwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4;
- (SUUISwooshViewController)swooshViewController;
- (UIImage)placeholderImage;
- (id)cachedImageForObject:(id)a3;
- (unint64_t)artworkRequestIdentifierForObject:(id)a3;
- (void)artworkRequest:(id)a3 didLoadImage:(id)a4;
- (void)deprioritizePendingImageLoads;
- (void)setImageDataConsumer:(id)a3;
- (void)setPlaceholderColorWithColorScheme:(id)a3;
@end

@implementation SUUISwooshArtworkLoader

- (SUUISwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SUUISwooshArtworkLoader;
  v9 = [(SUUISwooshArtworkLoader *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_artworkLoader, a3);
    objc_storeStrong((id *)&v10->_swooshViewController, a4);
    uint64_t v11 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:0];
    artworkRequestIDs = v10->_artworkRequestIDs;
    v10->_artworkRequestIDs = (NSMapTable *)v11;

    v13 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    outstandingRequestIDs = v10->_outstandingRequestIDs;
    v10->_outstandingRequestIDs = v13;
  }
  return v10;
}

- (unint64_t)artworkRequestIdentifierForObject:(id)a3
{
  v3 = [(NSMapTable *)self->_artworkRequestIDs objectForKey:a3];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (id)cachedImageForObject:(id)a3
{
  unint64_t v4 = [(NSMapTable *)self->_artworkRequestIDs objectForKey:a3];
  v5 = v4;
  if (v4)
  {
    v6 = -[SUUIResourceLoader cachedResourceForRequestIdentifier:](self->_artworkLoader, "cachedResourceForRequestIdentifier:", [v4 unsignedIntegerValue]);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)deprioritizePendingImageLoads
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  id v10 = 0;
  outstandingRequestIDs = self->_outstandingRequestIDs;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SUUISwooshArtworkLoader_deprioritizePendingImageLoads__block_invoke;
  v4[3] = &unk_2654014F0;
  v4[4] = self;
  v4[5] = &v5;
  [(NSMutableIndexSet *)outstandingRequestIDs enumerateIndexesUsingBlock:v4];
  if (v6[5]) {
    -[NSMutableIndexSet removeIndexes:](self->_outstandingRequestIDs, "removeIndexes:");
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __56__SUUISwooshArtworkLoader_deprioritizePendingImageLoads__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) trySetReason:0 forRequestWithIdentifier:a2];
  if ((result & 1) == 0)
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263F089C8]);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    return [v5 addIndex:a2];
  }
  return result;
}

- (BOOL)loadImageForObject:(id)a3 URL:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSMapTable *)self->_artworkRequestIDs objectForKey:v8];
  uint64_t v11 = v10;
  if (v10
    && -[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_artworkLoader, "trySetReason:forRequestWithIdentifier:", a5, [v10 unsignedIntegerValue]))
  {
    LOBYTE(v12) = 0;
  }
  else
  {
    v13 = objc_alloc_init(SUUIArtworkRequest);
    [(SUUIArtworkRequest *)v13 setDataConsumer:self->_imageDataConsumer];
    [(SUUIArtworkRequest *)v13 setDelegate:self];
    [(SUUIArtworkRequest *)v13 setURL:v9];
    BOOL v12 = [(SUUIResourceLoader *)self->_artworkLoader loadResourceWithRequest:v13 reason:1];
    if (v12)
    {
      uint64_t v14 = [(SUUIResourceRequest *)v13 requestIdentifier];
      [(NSMutableIndexSet *)self->_outstandingRequestIDs addIndex:v14];
      artworkRequestIDs = self->_artworkRequestIDs;
      objc_super v16 = [NSNumber numberWithUnsignedInteger:v14];
      [(NSMapTable *)artworkRequestIDs setObject:v16 forKey:v8];
    }
  }

  return v12;
}

- (BOOL)loadImageForObject:(id)a3 artworkRequest:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(NSMapTable *)self->_artworkRequestIDs objectForKey:v8];
  uint64_t v11 = v10;
  if (v10
    && -[SUUIResourceLoader trySetReason:forRequestWithIdentifier:](self->_artworkLoader, "trySetReason:forRequestWithIdentifier:", a5, [v10 unsignedIntegerValue])|| (objc_msgSend(v9, "setDelegate:", self), !-[SUUIResourceLoader loadResourceWithRequest:reason:](self->_artworkLoader, "loadResourceWithRequest:reason:", v9, 1)))
  {
    BOOL v15 = 0;
  }
  else
  {
    uint64_t v12 = [v9 requestIdentifier];
    [(NSMutableIndexSet *)self->_outstandingRequestIDs addIndex:v12];
    artworkRequestIDs = self->_artworkRequestIDs;
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:v12];
    [(NSMapTable *)artworkRequestIDs setObject:v14 forKey:v8];

    BOOL v15 = 1;
  }

  return v15;
}

- (UIImage)placeholderImage
{
  placeholderImage = self->_placeholderImage;
  if (!placeholderImage)
  {
    unint64_t v4 = [(SUUISwooshArtworkLoader *)self imageDataConsumer];
    uint64_t v5 = [MEMORY[0x263F825C8] colorWithWhite:0.8 alpha:1.0];
    id v6 = [v4 imageForColor:v5];
    uint64_t v7 = self->_placeholderImage;
    self->_placeholderImage = v6;

    placeholderImage = self->_placeholderImage;
  }
  return placeholderImage;
}

- (void)setImageDataConsumer:(id)a3
{
  uint64_t v5 = (SUUIImageDataConsumer *)a3;
  if (self->_imageDataConsumer != v5)
  {
    placeholderImage = self->_placeholderImage;
    self->_placeholderImage = 0;
    uint64_t v7 = v5;

    objc_storeStrong((id *)&self->_imageDataConsumer, a3);
    uint64_t v5 = v7;
  }
}

- (void)setPlaceholderColorWithColorScheme:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    switch([v4 schemeStyle])
    {
      case 0:
      case 2:
        uint64_t v5 = (void *)MEMORY[0x263F825C8];
        double v6 = 0.2;
        double v7 = 0.0;
        goto LABEL_6;
      case 1:
      case 3:
        uint64_t v5 = (void *)MEMORY[0x263F825C8];
        double v6 = 0.2;
        double v7 = 1.0;
        goto LABEL_6;
      default:
        id v8 = 0;
        break;
    }
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263F825C8];
    double v7 = 0.8;
    double v6 = 1.0;
LABEL_6:
    id v8 = [v5 colorWithWhite:v7 alpha:v6];
  }
  id v9 = [(SUUISwooshArtworkLoader *)self imageDataConsumer];
  id v10 = [v9 imageForColor:v8];
  placeholderImage = self->_placeholderImage;
  self->_placeholderImage = v10;
}

- (void)artworkRequest:(id)a3 didLoadImage:(id)a4
{
  outstandingRequestIDs = self->_outstandingRequestIDs;
  id v7 = a4;
  id v8 = a3;
  -[NSMutableIndexSet removeIndex:](outstandingRequestIDs, "removeIndex:", [v8 requestIdentifier]);
  [(SUUISwooshArtworkLoader *)self setImage:v7 forRequest:v8];

  [v8 setDelegate:0];
}

- (SUUIResourceLoader)artworkLoader
{
  return self->_artworkLoader;
}

- (SUUIImageDataConsumer)imageDataConsumer
{
  return self->_imageDataConsumer;
}

- (SUUISwooshViewController)swooshViewController
{
  return self->_swooshViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swooshViewController, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_outstandingRequestIDs, 0);
  objc_storeStrong((id *)&self->_imageDataConsumer, 0);
  objc_storeStrong((id *)&self->_artworkRequestIDs, 0);
  objc_storeStrong((id *)&self->_artworkLoader, 0);
}

@end