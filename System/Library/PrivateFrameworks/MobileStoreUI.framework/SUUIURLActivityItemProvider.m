@interface SUUIURLActivityItemProvider
+ (id)placeholderItem;
- (SUUIURLActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4;
- (SUUIURLActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewController:(id)a3 thumbnailImageForActivityType:(id)a4 suggestedSize:(CGSize)a5;
- (id)activityViewControllerLinkMetadata:(id)a3;
- (id)item;
- (id)linkPresentationImageFor:(id)a3;
@end

@implementation SUUIURLActivityItemProvider

+ (id)placeholderItem
{
  id v2 = objc_alloc_init(NSURL);
  return v2;
}

- (SUUIURLActivityItemProvider)initWithProductPageItemProvider:(id)a3 clientContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[SUUIResourceLoader alloc] initWithClientContext:v6];
  resourceLoader = self->_resourceLoader;
  self->_resourceLoader = v8;

  v10 = self->_resourceLoader;
  v11 = SUUIResourceLoaderGetNameForObject(self);
  [(SUUIResourceLoader *)v10 setName:v11];

  v14.receiver = self;
  v14.super_class = (Class)SUUIURLActivityItemProvider;
  v12 = [(SUUIDeferredActivityItemProvider *)&v14 initWithProductPageItemProvider:v7 clientContext:v6];

  return v12;
}

- (SUUIURLActivityItemProvider)initWithProductPageItem:(id)a3 clientContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[SUUIResourceLoader alloc] initWithClientContext:v6];
  resourceLoader = self->_resourceLoader;
  self->_resourceLoader = v8;

  v10 = self->_resourceLoader;
  v11 = SUUIResourceLoaderGetNameForObject(self);
  [(SUUIResourceLoader *)v10 setName:v11];

  v14.receiver = self;
  v14.super_class = (Class)SUUIURLActivityItemProvider;
  v12 = [(SUUIDeferredActivityItemProvider *)&v14 initWithProductPageItem:v7 clientContext:v6];

  return v12;
}

- (id)item
{
  v15[3] = *MEMORY[0x263EF8340];
  NSLog(&cfstr_FetchingUrlIte.isa, a2);
  uint64_t v3 = *MEMORY[0x263F1CFB8];
  v15[0] = *MEMORY[0x263F1CFA0];
  v15[1] = v3;
  v15[2] = *MEMORY[0x263F1CFB0];
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];
  v5 = [(UIActivityItemProvider *)self activityType];
  int v6 = [v4 containsObject:v5];

  id v7 = [(SUUIDeferredActivityItemProvider *)self productPageItem];
  v8 = v7;
  if (v6)
  {
    id v9 = [v7 productPageURLString];

    NSLog(&cfstr_FetchedUrlItem.isa);
    if (v9)
    {
LABEL_3:
      v10 = [NSURL URLWithString:v9];
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
      v13 = [(SUUIDeferredActivityItemProvider *)self productPageItem];
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
  v4 = [(SUUIDeferredActivityItemProvider *)self productPageItem];
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
  v23 = __Block_byref_object_copy__28;
  v24 = __Block_byref_object_dispose__28;
  id v25 = 0;
  v11 = [(SUUIDeferredActivityItemProvider *)self productPageItem];
  v12 = [v11 artworksProvider];
  v13 = objc_msgSend(v12, "bestArtworkForScaledSize:", width, height);
  objc_super v14 = [v13 URL];

  if (v14)
  {
    v15 = (void *)[objc_alloc(MEMORY[0x263F7B3A0]) initWithURL:v14];
    v16 = +[SUUIStyledImageDataConsumer appIconConsumerWithSize:](SUUIStyledImageDataConsumer, "appIconConsumerWithSize:", width, height);
    [v15 setDataConsumer:v16];

    [v15 setITunesStoreRequest:0];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __98__SUUIURLActivityItemProvider_activityViewController_thumbnailImageForActivityType_suggestedSize___block_invoke;
    v19[3] = &unk_265401318;
    v19[4] = &v20;
    [v15 setOutputBlock:v19];
    [v15 main];
  }
  id v17 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v17;
}

void __98__SUUIURLActivityItemProvider_activityViewController_thumbnailImageForActivityType_suggestedSize___block_invoke(uint64_t a1, void *a2)
{
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v4 = [(SUUIDeferredActivityItemProvider *)self productPageItem];
  v5 = [v4 shortenedProductPageURLString];
  int v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v8 = [(SUUIDeferredActivityItemProvider *)self productPageItem];
    id v7 = [v8 productPageURLString];
  }
  id v9 = [NSURL URLWithString:v7];
  uint64_t v10 = [(SUUIDeferredActivityItemProvider *)self productPageItem];
  v11 = (void *)v10;
  id v12 = 0;
  if (v9 && v10)
  {
    v41 = v9;
    id v42 = v7;
    v13 = [MEMORY[0x263EFF980] array];
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
            uint64_t v20 = [(SUUIURLActivityItemProvider *)self linkPresentationImageFor:v19];
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

    id v12 = objc_alloc_init(MEMORY[0x263F103D8]);
    id v9 = v41;
    [v12 setURL:v41];
    id v25 = [v11 title];
    [v12 setTitle:v25];

    id v26 = objc_alloc_init(MEMORY[0x263F10428]);
    v27 = [v11 title];
    [v26 setName:v27];

    v28 = [v11 artistName];
    [v26 setSubtitle:v28];

    v29 = [v11 artworksProvider];
    v30 = objc_msgSend(v29, "bestArtworkForScaledSize:", 40.0, 40.0);
    v31 = [v30 URL];

    if (v31)
    {
      v32 = [(SUUIURLActivityItemProvider *)self linkPresentationImageFor:v31];
      [v26 setIcon:v32];
    }
    v33 = [v11 storeIdentifier];
    v34 = [v33 stringValue];
    [v26 setStoreIdentifier:v34];

    v35 = [(SUUIDeferredActivityItemProvider *)self clientContext];
    v36 = [v35 storeFrontIdentifier];
    [v26 setStoreFrontIdentifier:v36];

    v37 = [v11 categoryName];
    [v26 setGenre:v37];

    [v26 setPlatform:@"iOS"];
    [v26 setScreenshots:v13];
    v38 = (void *)[objc_alloc(MEMORY[0x263F10408]) initWithStreamingURL:v40 hasAudio:0];
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
  v5 = [[SUUIArtworkItemProvider alloc] initWithURL:v4 usingResourceLoader:self->_resourceLoader];

  int v6 = (void *)[objc_alloc(MEMORY[0x263F103C0]) initWithItemProvider:v5 properties:0 placeholderImage:0];
  return v6;
}

- (void).cxx_destruct
{
}

@end