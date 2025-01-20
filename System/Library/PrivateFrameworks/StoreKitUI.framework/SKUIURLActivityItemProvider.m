@interface SKUIURLActivityItemProvider
+ (id)placeholderItem;
- (SKUIURLActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4;
- (SKUIURLActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)item;
- (id)linkPresentationImageFor:(id)a3;
@end

@implementation SKUIURLActivityItemProvider

+ (id)placeholderItem
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CB10]);

  return v2;
}

- (SKUIURLActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIURLActivityItemProvider initWithProductPageItemProvider:clientContext:]();
  }
  v8 = [[SKUIResourceLoader alloc] initWithClientContext:v6];
  resourceLoader = self->_resourceLoader;
  self->_resourceLoader = v8;

  v10 = self->_resourceLoader;
  v11 = SKUIResourceLoaderGetNameForObject(self);
  [(SKUIResourceLoader *)v10 setName:v11];

  v14.receiver = self;
  v14.super_class = (Class)SKUIURLActivityItemProvider;
  v12 = [(SKUIDeferredActivityItemProvider *)&v14 initWithProductPageItemProvider:v7 clientContext:v6];

  return v12;
}

- (SKUIURLActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIURLActivityItemProvider initWithProductPageItem:clientContext:]();
  }
  v8 = [[SKUIResourceLoader alloc] initWithClientContext:v6];
  resourceLoader = self->_resourceLoader;
  self->_resourceLoader = v8;

  v10 = self->_resourceLoader;
  v11 = SKUIResourceLoaderGetNameForObject(self);
  [(SKUIResourceLoader *)v10 setName:v11];

  v14.receiver = self;
  v14.super_class = (Class)SKUIURLActivityItemProvider;
  v12 = [(SKUIDeferredActivityItemProvider *)&v14 initWithProductPageItem:v7 clientContext:v6];

  return v12;
}

- (id)item
{
  v15[3] = *MEMORY[0x1E4F143B8];
  NSLog(&cfstr_FetchingUrlIte.isa, a2);
  uint64_t v3 = *MEMORY[0x1E4F435B0];
  v15[0] = *MEMORY[0x1E4F43590];
  v15[1] = v3;
  v15[2] = *MEMORY[0x1E4F435A0];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  v5 = [(UIActivityItemProvider *)self activityType];
  int v6 = [v4 containsObject:v5];

  id v7 = [(SKUIDeferredActivityItemProvider *)self productPageItem];
  v8 = v7;
  if (v6)
  {
    id v9 = [v7 productPageURLString];

    NSLog(&cfstr_FetchedUrlItem.isa);
    if (v9)
    {
LABEL_3:
      v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
      goto LABEL_9;
    }
  }
  else
  {
    v11 = [v7 shortenedProductPageURLString];
    v12 = v11;
    if (v11)
    {
      id v9 = v11;
    }
    else
    {
      v13 = [(SKUIDeferredActivityItemProvider *)self productPageItem];
      id v9 = [v13 productPageURLString];
    }
    if (v9) {
      goto LABEL_3;
    }
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  v4 = [(SKUIDeferredActivityItemProvider *)self productPageItem];
  v5 = [v4 title];

  return v5;
}

- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a3;
  id v10 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__59;
  v24 = __Block_byref_object_dispose__59;
  id v25 = 0;
  v11 = [(SKUIDeferredActivityItemProvider *)self productPageItem];
  v12 = [v11 artworksProvider];
  v13 = objc_msgSend(v12, "bestArtworkForScaledSize:", width, height);
  objc_super v14 = [v13 URL];

  if (v14)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4FA8338]) initWithURL:v14];
    v16 = +[SKUIStyledImageDataConsumer appIconConsumerWithSize:](SKUIStyledImageDataConsumer, "appIconConsumerWithSize:", width, height);
    [v15 setDataConsumer:v16];

    [v15 setITunesStoreRequest:0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __98__SKUIURLActivityItemProvider_activityViewController_thumbnailImageForActivityType_suggestedSize___block_invoke;
    v19[3] = &unk_1E6424970;
    v19[4] = &v20;
    [v15 setOutputBlock:v19];
    [v15 main];
  }
  id v17 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v17;
}

void __98__SKUIURLActivityItemProvider_activityViewController_thumbnailImageForActivityType_suggestedSize___block_invoke(uint64_t a1, void *a2)
{
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v4 = [(SKUIDeferredActivityItemProvider *)self productPageItem];
  v5 = [v4 shortenedProductPageURLString];
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(SKUIDeferredActivityItemProvider *)self productPageItem];
    id v7 = [v8 productPageURLString];
  }
  id v9 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  uint64_t v10 = [(SKUIDeferredActivityItemProvider *)self productPageItem];
  v11 = (void *)v10;
  id v12 = 0;
  if (v9 && v10)
  {
    v41 = v9;
    id v42 = v7;
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    objc_super v14 = [v11 screenshots];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v44 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v43 + 1) + 8 * i) URLForVariant:@"low-dpi"];
          if (v19)
          {
            uint64_t v20 = [(SKUIURLActivityItemProvider *)self linkPresentationImageFor:v19];
            [v13 addObject:v20];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v16);
    }

    v21 = [v11 videos];
    uint64_t v22 = [v21 firstObject];

    v23 = [v22 artworks];
    v24 = objc_msgSend(v23, "bestArtworkForScaledSize:", 300.0, 300.0);
    v40 = [v24 URL];

    id v12 = objc_alloc_init(MEMORY[0x1E4F30A78]);
    id v9 = v41;
    [v12 setURL:v41];
    id v25 = [v11 title];
    [v12 setTitle:v25];

    id v26 = objc_alloc_init(MEMORY[0x1E4F30B20]);
    v27 = [v11 title];
    [v26 setName:v27];

    v28 = [v11 artistName];
    [v26 setSubtitle:v28];

    v29 = [v11 artworksProvider];
    v30 = objc_msgSend(v29, "bestArtworkForScaledSize:", 40.0, 40.0);
    v31 = [v30 URL];

    if (v31)
    {
      v32 = [(SKUIURLActivityItemProvider *)self linkPresentationImageFor:v31];
      [v26 setIcon:v32];
    }
    v33 = [v11 storeIdentifier];
    v34 = [v33 stringValue];
    [v26 setStoreIdentifier:v34];

    v35 = [(SKUIDeferredActivityItemProvider *)self clientContext];
    v36 = [v35 storeFrontIdentifier];
    [v26 setStoreFrontIdentifier:v36];

    v37 = [v11 categoryName];
    [v26 setGenre:v37];

    [v26 setPlatform:@"iOS"];
    [v26 setScreenshots:v13];
    v38 = (void *)[objc_alloc(MEMORY[0x1E4F30AE8]) initWithStreamingURL:v40 hasAudio:0];
    [v26 setPreviewVideo:v38];

    [v26 setIsMessagesOnlyApp:0];
    [v26 setMessagesAppIcon:0];
    [v12 setSpecialization:v26];

    id v7 = v42;
  }

  return v12;
}

- (id)linkPresentationImageFor:(id)a3
{
  id v4 = a3;
  v5 = [[SKUIArtworkItemProvider alloc] initWithURL:v4 usingResourceLoader:self->_resourceLoader];

  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithItemProvider:v5 properties:0 placeholderImage:0];

  return v6;
}

- (void).cxx_destruct
{
}

- (void)initWithProductPageItemProvider:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIURLActivityItemProvider initWithProductPageItemProvider:clientContext:]";
}

- (void)initWithProductPageItem:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIURLActivityItemProvider initWithProductPageItem:clientContext:]";
}

@end