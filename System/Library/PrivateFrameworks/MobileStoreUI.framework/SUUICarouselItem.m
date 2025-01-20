@interface SUUICarouselItem
- (NSString)accessibilityLabel;
- (SUUIArtworkProviding)artworkProvider;
- (SUUICarouselItem)initWithComponentContext:(id)a3;
- (SUUILink)link;
- (id)artworkForSize:(CGSize)a3;
- (id)description;
- (int64_t)carouselItemIdentifier;
- (void)_setLinkItem:(id)a3;
- (void)setArtworkProvider:(id)a3;
@end

@implementation SUUICarouselItem

- (SUUICarouselItem)initWithComponentContext:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SUUICarouselItem;
  v5 = [(SUUICarouselItem *)&v24 init];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"adamId"];
    if (objc_opt_respondsToSelector()) {
      v5->_carouselItemIdentifier = [v7 longLongValue];
    }
    v8 = [v6 objectForKey:@"link"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v4 copy];
      [v9 setComponentDictionary:v8];
      v10 = [[SUUILink alloc] initWithComponentContext:v9];
      link = v5->_link;
      v5->_link = v10;

      uint64_t v12 = [(SUUILink *)v5->_link title];
      accessibilityLabel = v5->_accessibilityLabel;
      v5->_accessibilityLabel = (NSString *)v12;

      if (!v5->_accessibilityLabel)
      {
        v14 = [(SUUILink *)v5->_link item];
        uint64_t v15 = [v14 title];
        v16 = v5->_accessibilityLabel;
        v5->_accessibilityLabel = (NSString *)v15;
      }
    }
    if (v5->_accessibilityLabel)
    {
      v17 = v7;
    }
    else
    {
      v17 = [v6 objectForKey:@"designLabel"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v18 = [v17 copy];
        v19 = v5->_accessibilityLabel;
        v5->_accessibilityLabel = (NSString *)v18;
      }
    }
    v20 = [v6 objectForKey:*MEMORY[0x263F7B9E8]];
    uint64_t v21 = +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:v20];
    artworkProvider = v5->_artworkProvider;
    v5->_artworkProvider = (SUUIArtworkProviding *)v21;
  }
  return v5;
}

- (id)artworkForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = *(double *)&artworkForSize__sScreenScale;
  if (*(double *)&artworkForSize__sScreenScale < 0.00000011920929)
  {
    v7 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", *(double *)&artworkForSize__sScreenScale);
    [v7 scale];
    artworkForSize__sScreenScale = v8;

    double v6 = *(double *)&artworkForSize__sScreenScale;
  }
  double v9 = height * v6;
  double v10 = width * v6;
  artworkProvider = self->_artworkProvider;
  return (id)-[SUUIArtworkProviding preferredExactArtworkForSize:](artworkProvider, "preferredExactArtworkForSize:", v10, v9);
}

- (void)_setLinkItem:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUICarouselItem;
  id v4 = [(SUUICarouselItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: \"%@\", %@", v4, self->_accessibilityLabel, self->_link];

  return v5;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (int64_t)carouselItemIdentifier
{
  return self->_carouselItemIdentifier;
}

- (SUUILink)link
{
  return self->_link;
}

- (SUUIArtworkProviding)artworkProvider
{
  return self->_artworkProvider;
}

- (void)setArtworkProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkProvider, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end