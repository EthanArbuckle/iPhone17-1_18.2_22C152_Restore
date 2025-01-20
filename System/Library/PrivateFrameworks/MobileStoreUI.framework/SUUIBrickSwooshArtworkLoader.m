@interface SUUIBrickSwooshArtworkLoader
- (BOOL)loadImageForBrick:(id)a3 reason:(int64_t)a4;
- (SUUIBrickSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4;
- (void)loadImagesForNextPageWithReason:(int64_t)a3;
- (void)setImage:(id)a3 forRequest:(id)a4;
@end

@implementation SUUIBrickSwooshArtworkLoader

- (SUUIBrickSwooshArtworkLoader)initWithArtworkLoader:(id)a3 swoosh:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SUUIBrickSwooshArtworkLoader;
  v7 = [(SUUISwooshArtworkLoader *)&v16 initWithArtworkLoader:a3 swoosh:v6];
  if (v7)
  {
    v8 = +[SUUIStyledImageDataConsumer brickConsumer];
    v9 = [v6 colorScheme];
    v10 = [v9 backgroundColor];
    [v8 setBackgroundColor:v10];

    [(SUUISwooshArtworkLoader *)v7 setImageDataConsumer:v8];
    [v8 imageSize];
    double v12 = v11;
    v13 = [MEMORY[0x263F82B60] mainScreen];
    [v13 scale];
    v7->_artworkSize = (uint64_t)(v12 * v14);
  }
  return v7;
}

- (BOOL)loadImageForBrick:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v7 = [v6 artwork];
  v8 = [v7 URL];

  if (v8) {
    BOOL v9 = [(SUUISwooshArtworkLoader *)self loadImageForObject:v6 URL:v8 reason:a4];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)loadImagesForNextPageWithReason:(int64_t)a3
{
  v5 = [(SUUISwooshArtworkLoader *)self swooshViewController];
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
      BOOL v11 = [(SUUIBrickSwooshArtworkLoader *)self loadImageForBrick:v10 reason:a3];

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
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v19 = a4;
  uint64_t v7 = [v19 requestIdentifier];
  unint64_t v8 = [(SUUISwooshArtworkLoader *)self swooshViewController];
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
        v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_super v16 = objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v15, "item", v18));
        if ([(SUUISwooshArtworkLoader *)self artworkRequestIdentifierForObject:v16] == v7)
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
  v20.super_class = (Class)SUUIBrickSwooshArtworkLoader;
  [(SUUISwooshArtworkLoader *)&v20 setImage:v6 forRequest:v19];
}

@end