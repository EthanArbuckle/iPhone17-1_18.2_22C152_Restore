@interface SKUIBrickSwooshArtworkLoader
- (BOOL)loadImageForBrick:(id)a3 reason:(int64_t)a4;
- (SKUIBrickSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4;
- (void)loadImagesForNextPageWithReason:(int64_t)a3;
- (void)setImage:(id)a3 forRequest:(id)a4;
@end

@implementation SKUIBrickSwooshArtworkLoader

- (SKUIBrickSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrickSwooshArtworkLoader initWithArtworkLoader:swoosh:]();
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUIBrickSwooshArtworkLoader;
  v8 = [(SKUISwooshArtworkLoader *)&v17 initWithArtworkLoader:v6 swoosh:v7];
  if (v8)
  {
    v9 = +[SKUIStyledImageDataConsumer brickConsumer];
    v10 = [v7 colorScheme];
    v11 = [v10 backgroundColor];
    [v9 setBackgroundColor:v11];

    [(SKUISwooshArtworkLoader *)v8 setImageDataConsumer:v9];
    [v9 imageSize];
    double v13 = v12;
    v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v14 scale];
    v8->_artworkSize = (uint64_t)(v13 * v15);
  }
  return v8;
}

- (BOOL)loadImageForBrick:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  id v7 = [v6 artwork];
  v8 = [v7 URL];

  if (v8) {
    BOOL v9 = [(SKUISwooshArtworkLoader *)self loadImageForObject:v6 URL:v8 reason:a4];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)loadImagesForNextPageWithReason:(int64_t)a3
{
  v5 = [(SKUISwooshArtworkLoader *)self swooshViewController];
  id v12 = [v5 bricks];

  uint64_t v6 = [v12 count];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = 1;
    do
    {
      v10 = [v12 objectAtIndex:v9 - 1];
      BOOL v11 = [(SKUIBrickSwooshArtworkLoader *)self loadImageForBrick:v10 reason:a3];

      if (v9 >= v7) {
        break;
      }
      v8 += v11;
      ++v9;
    }
    while (v8 < 4);
  }
}

- (void)setImage:(id)a3 forRequest:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v19 = a4;
  uint64_t v7 = [v19 requestIdentifier];
  unint64_t v8 = [(SKUISwooshArtworkLoader *)self swooshViewController];
  uint64_t v9 = [v8 bricks];
  [v8 indexPathsForVisibleItems];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    id v18 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        double v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v16 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v15, "item", v18));
        if ([(SKUISwooshArtworkLoader *)self artworkRequestIdentifierForObject:v16] == v7)
        {
          uint64_t v17 = [v15 item];
          id v6 = v18;
          [v8 setImage:v18 forItemAtIndex:v17];

          goto LABEL_11;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      id v6 = v18;
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v20.receiver = self;
  v20.super_class = (Class)SKUIBrickSwooshArtworkLoader;
  [(SKUISwooshArtworkLoader *)&v20 setImage:v6 forRequest:v19];
}

- (void)initWithArtworkLoader:swoosh:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBrickSwooshArtworkLoader initWithArtworkLoader:swoosh:]";
}

@end