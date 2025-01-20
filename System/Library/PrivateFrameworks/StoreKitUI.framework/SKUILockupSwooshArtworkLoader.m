@interface SKUILockupSwooshArtworkLoader
- (BOOL)loadImageForItem:(id)a3 reason:(int64_t)a4;
- (BOOL)loadImageForVideo:(id)a3 reason:(int64_t)a4;
- (SKUILockupSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4;
- (id)placeholderImageForItem:(id)a3;
- (id)placeholderImageForVideo:(id)a3;
- (void)loadImagesForNextPageWithReason:(int64_t)a3;
- (void)setImage:(id)a3 forRequest:(id)a4;
@end

@implementation SKUILockupSwooshArtworkLoader

- (SKUILockupSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUILockupSwooshArtworkLoader initWithArtworkLoader:swoosh:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUILockupSwooshArtworkLoader;
  v8 = [(SKUISwooshArtworkLoader *)&v14 initWithArtworkLoader:v6 swoosh:v7];
  if (v8)
  {
    uint64_t v9 = [v7 artworkContext];
    context = v8->_context;
    v8->_context = (SKUIItemArtworkContext *)v9;

    uint64_t v11 = [v7 videoImageConsumer];
    videoImageConsumer = v8->_videoImageConsumer;
    v8->_videoImageConsumer = (SKUIVideoImageDataConsumer *)v11;
  }
  return v8;
}

- (BOOL)loadImageForItem:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(SKUIItemArtworkContext *)self->_context URLForItem:v6];
  if (v7)
  {
    v8 = objc_alloc_init(SKUIArtworkRequest);
    uint64_t v9 = [(SKUIItemArtworkContext *)self->_context dataConsumerForItem:v6];
    [(SKUIArtworkRequest *)v8 setDataConsumer:v9];

    [(SKUIArtworkRequest *)v8 setURL:v7];
    BOOL v10 = [(SKUISwooshArtworkLoader *)self loadImageForObject:v6 artworkRequest:v8 reason:a4];
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
  [(SKUIVideoImageDataConsumer *)self->_videoImageConsumer landscapeSize];
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [v6 artworks];
  v12 = objc_msgSend(v11, "bestArtworkForScaledSize:", v8, v10);
  v13 = [v12 URL];

  if (v13)
  {
    objc_super v14 = objc_alloc_init(SKUIArtworkRequest);
    [(SKUIArtworkRequest *)v14 setDataConsumer:self->_videoImageConsumer];
    [(SKUIArtworkRequest *)v14 setURL:v13];
    BOOL v15 = [(SKUISwooshArtworkLoader *)self loadImageForObject:v6 artworkRequest:v14 reason:a4];
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
  v5 = [(SKUISwooshArtworkLoader *)self swooshViewController];
  id v6 = [v5 artworkContext];
  double v7 = [v6 placeholderImageForItem:v4];

  return v7;
}

- (id)placeholderImageForVideo:(id)a3
{
  videoPlaceholderImage = self->_videoPlaceholderImage;
  if (!videoPlaceholderImage)
  {
    v5 = [(SKUIVideoImageDataConsumer *)self->_videoImageConsumer imageForColor:0 orientation:2];
    id v6 = self->_videoPlaceholderImage;
    self->_videoPlaceholderImage = v5;

    videoPlaceholderImage = self->_videoPlaceholderImage;
  }

  return videoPlaceholderImage;
}

- (void)loadImagesForNextPageWithReason:(int64_t)a3
{
  v5 = [(SKUISwooshArtworkLoader *)self swooshViewController];
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
      uint64_t v11 = [v10 item];
      if (v11)
      {
        BOOL v12 = [(SKUILockupSwooshArtworkLoader *)self loadImageForItem:v11 reason:a3];
        v13 = [v11 videos];
        objc_super v14 = [v13 firstObject];

        if (v14) {
          [(SKUILockupSwooshArtworkLoader *)self loadImageForVideo:v14 reason:a3];
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
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = a4;
  uint64_t v7 = [v20 requestIdentifier];
  uint64_t v8 = [(SKUISwooshArtworkLoader *)self swooshViewController];
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
        v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_super v14 = objc_msgSend(v22, "objectAtIndex:", objc_msgSend(v13, "item"));
        id v15 = [v14 item];
        if (v15)
        {
          if ([(SKUISwooshArtworkLoader *)self artworkRequestIdentifierForObject:v15] == v7)
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
            && [(SKUISwooshArtworkLoader *)self artworkRequestIdentifierForObject:v17] == v7)
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
  v23.super_class = (Class)SKUILockupSwooshArtworkLoader;
  [(SKUISwooshArtworkLoader *)&v23 setImage:v6 forRequest:v20];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlaceholderImage, 0);
  objc_storeStrong((id *)&self->_videoImageConsumer, 0);

  objc_storeStrong((id *)&self->_context, 0);
}

- (void)initWithArtworkLoader:swoosh:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUILockupSwooshArtworkLoader initWithArtworkLoader:swoosh:]";
}

@end