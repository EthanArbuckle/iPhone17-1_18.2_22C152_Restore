@interface SKUICarouselItem
- (NSString)accessibilityLabel;
- (SKUIArtworkProviding)artworkProvider;
- (SKUICarouselItem)initWithComponentContext:(id)a3;
- (SKUILink)link;
- (id)artworkForSize:(CGSize)a3;
- (id)description;
- (int64_t)carouselItemIdentifier;
- (void)_setLinkItem:(id)a3;
- (void)setArtworkProvider:(id)a3;
@end

@implementation SKUICarouselItem

- (SKUICarouselItem)initWithComponentContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUICarouselItem initWithComponentContext:]();
  }
  v24.receiver = self;
  v24.super_class = (Class)SKUICarouselItem;
  v5 = [(SKUICarouselItem *)&v24 init];
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
      v10 = [[SKUILink alloc] initWithComponentContext:v9];
      link = v5->_link;
      v5->_link = v10;

      uint64_t v12 = [(SKUILink *)v5->_link title];
      accessibilityLabel = v5->_accessibilityLabel;
      v5->_accessibilityLabel = (NSString *)v12;

      if (!v5->_accessibilityLabel)
      {
        v14 = [(SKUILink *)v5->_link item];
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
    v20 = [v6 objectForKey:*MEMORY[0x1E4FA8710]];
    uint64_t v21 = +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:v20];
    artworkProvider = v5->_artworkProvider;
    v5->_artworkProvider = (SKUIArtworkProviding *)v21;
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
    v7 = objc_msgSend(MEMORY[0x1E4FB1BA8], "mainScreen", *(double *)&artworkForSize__sScreenScale);
    [v7 scale];
    artworkForSize__sScreenScale = v8;

    double v6 = *(double *)&artworkForSize__sScreenScale;
  }
  double v9 = height * v6;
  double v10 = width * v6;
  artworkProvider = self->_artworkProvider;

  return (id)-[SKUIArtworkProviding preferredExactArtworkForSize:](artworkProvider, "preferredExactArtworkForSize:", v10, v9);
}

- (void)_setLinkItem:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUICarouselItem;
  id v4 = [(SKUICarouselItem *)&v7 description];
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

- (SKUILink)link
{
  return self->_link;
}

- (SKUIArtworkProviding)artworkProvider
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

- (void)initWithComponentContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUICarouselItem initWithComponentContext:]";
}

@end