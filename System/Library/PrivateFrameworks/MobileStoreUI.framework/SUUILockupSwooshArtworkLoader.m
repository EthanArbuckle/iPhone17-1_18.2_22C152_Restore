@interface SUUILockupSwooshArtworkLoader
- (BOOL)loadImageForItem:(id)a3 reason:(int64_t)a4;
- (BOOL)loadImageForVideo:(id)a3 reason:(int64_t)a4;
- (SUUILockupSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4;
- (id)placeholderImageForItem:(id)a3;
- (id)placeholderImageForVideo:(id)a3;
- (void)loadImagesForNextPageWithReason:(int64_t)a3;
- (void)setImage:(id)a3 forRequest:(id)a4;
@end

@implementation SUUILockupSwooshArtworkLoader

- (SUUILockupSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SUUILockupSwooshArtworkLoader;
  v7 = [(SUUISwooshArtworkLoader *)&v13 initWithArtworkLoader:a3 swoosh:v6];
  if (v7)
  {
    uint64_t v8 = [v6 artworkContext];
    context = v7->_context;
    v7->_context = (SUUIItemArtworkContext *)v8;

    uint64_t v10 = [v6 videoImageConsumer];
    videoImageConsumer = v7->_videoImageConsumer;
    v7->_videoImageConsumer = (SUUIVideoImageDataConsumer *)v10;
  }
  return v7;
}

- (BOOL)loadImageForItem:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v7 = [(SUUIItemArtworkContext *)self->_context URLForItem:v6];
  if (v7)
  {
    uint64_t v8 = objc_alloc_init(SUUIArtworkRequest);
    v9 = [(SUUIItemArtworkContext *)self->_context dataConsumerForItem:v6];
    [(SUUIArtworkRequest *)v8 setDataConsumer:v9];

    [(SUUIArtworkRequest *)v8 setURL:v7];
    BOOL v10 = [(SUUISwooshArtworkLoader *)self loadImageForObject:v6 artworkRequest:v8 reason:a4];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)loadImageForVideo:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  [(SUUIVideoImageDataConsumer *)self->_videoImageConsumer landscapeSize];
  double v8 = v7;
  double v10 = v9;
  v11 = [v6 artworks];
  v12 = objc_msgSend(v11, "bestArtworkForScaledSize:", v8, v10);
  objc_super v13 = [v12 URL];

  if (v13)
  {
    v14 = objc_alloc_init(SUUIArtworkRequest);
    [(SUUIArtworkRequest *)v14 setDataConsumer:self->_videoImageConsumer];
    [(SUUIArtworkRequest *)v14 setURL:v13];
    BOOL v15 = [(SUUISwooshArtworkLoader *)self loadImageForObject:v6 artworkRequest:v14 reason:a4];
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (id)placeholderImageForItem:(id)a3
{
  id v4 = a3;
  v5 = [(SUUISwooshArtworkLoader *)self swooshViewController];
  id v6 = [v5 artworkContext];
  double v7 = [v6 placeholderImageForItem:v4];

  return v7;
}

- (id)placeholderImageForVideo:(id)a3
{
  videoPlaceholderImage = self->_videoPlaceholderImage;
  if (!videoPlaceholderImage)
  {
    v5 = [(SUUIVideoImageDataConsumer *)self->_videoImageConsumer imageForColor:0 orientation:2];
    id v6 = self->_videoPlaceholderImage;
    self->_videoPlaceholderImage = v5;

    videoPlaceholderImage = self->_videoPlaceholderImage;
  }
  return videoPlaceholderImage;
}

- (void)loadImagesForNextPageWithReason:(int64_t)a3
{
  v5 = [(SUUISwooshArtworkLoader *)self swooshViewController];
  id v15 = [v5 lockups];

  uint64_t v6 = [v15 count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = 1;
    do
    {
      double v10 = [v15 objectAtIndex:v9 - 1];
      v11 = [v10 item];
      if (v11)
      {
        BOOL v12 = [(SUUILockupSwooshArtworkLoader *)self loadImageForItem:v11 reason:a3];
        objc_super v13 = [v11 videos];
        v14 = [v13 firstObject];

        if (v14) {
          [(SUUILockupSwooshArtworkLoader *)self loadImageForVideo:v14 reason:a3];
        }
        v8 += v12;
      }
      if (v9 >= v7) {
        break;
      }
      ++v9;
    }
    while (v8 < 7);
  }
}

- (void)setImage:(id)a3 forRequest:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v20 = a4;
  uint64_t v7 = [v20 requestIdentifier];
  uint64_t v8 = [(SUUISwooshArtworkLoader *)self swooshViewController];
  v22 = [v8 lockups];
  [v8 indexPathsForVisibleItems];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    v18 = v8;
    id v19 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(obj);
        }
        objc_super v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        v14 = objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v13, "item"));
        id v15 = [v14 item];
        if (v15)
        {
          if ([(SUUISwooshArtworkLoader *)self artworkRequestIdentifierForObject:v15] == v7)
          {
            uint64_t v8 = v18;
            id v6 = v19;
            objc_msgSend(v18, "setImage:forItemAtIndex:", v19, objc_msgSend(v13, "item"));
LABEL_16:

            goto LABEL_17;
          }
          v16 = [v15 videos];
          v17 = [v16 firstObject];

          if (v17
            && [(SUUISwooshArtworkLoader *)self artworkRequestIdentifierForObject:v17] == v7)
          {
            uint64_t v8 = v18;
            id v6 = v19;
            objc_msgSend(v18, "setVideoThumbnail:forItemAtIndex:", v19, objc_msgSend(v13, "item"));

            goto LABEL_16;
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      uint64_t v8 = v18;
      id v6 = v19;
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  v23.receiver = self;
  v23.super_class = (Class)SUUILockupSwooshArtworkLoader;
  [(SUUISwooshArtworkLoader *)&v23 setImage:v6 forRequest:v20];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_videoImageConsumer, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end