@interface SKUIBrickItem
- (NSString)accessibilityLabel;
- (SKUIArtwork)artwork;
- (SKUIBrickItem)initWithBannerRoomContext:(id)a3;
- (SKUIBrickItem)initWithComponentContext:(id)a3;
- (SKUICountdown)countdown;
- (SKUIEditorialComponent)editorial;
- (SKUILink)link;
- (id)description;
- (int64_t)brickIdentifier;
- (void)_setLinkInfoWithLinkDictionary:(id)a3 context:(id)a4;
- (void)_setLinkItem:(id)a3;
@end

@implementation SKUIBrickItem

- (SKUIBrickItem)initWithBannerRoomContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrickItem initWithBannerRoomContext:]();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIBrickItem;
  v5 = [(SKUIBrickItem *)&v20 init];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"link"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKUIBrickItem *)v5 _setLinkInfoWithLinkDictionary:v7 context:v4];
    }
    if (!v5->_accessibilityLabel)
    {
      v8 = [v6 objectForKey:@"imageAltText"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v8 copy];
        accessibilityLabel = v5->_accessibilityLabel;
        v5->_accessibilityLabel = (NSString *)v9;
      }
    }
    v11 = [v6 objectForKey:@"text"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[SKUIEditorialComponent alloc] initWithBrickRoomText:v11];
      editorial = v5->_editorial;
      v5->_editorial = v12;
    }
    v14 = [v6 objectForKey:@"imageUrl"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v14];
      if (v15)
      {
        v16 = [[SKUIArtwork alloc] initWithURL:v15 size:SKUIBrickItemSize()];
        artwork = v5->_artwork;
        v5->_artwork = v16;
      }
    }
    v18 = [v6 objectForKey:@"adamId"];

    if (objc_opt_respondsToSelector()) {
      v5->_brickIdentifier = [v18 longLongValue];
    }
  }
  return v5;
}

- (SKUIBrickItem)initWithComponentContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIBrickItem initWithComponentContext:]();
  }
  v27.receiver = self;
  v27.super_class = (Class)SKUIBrickItem;
  v5 = [(SKUIBrickItem *)&v27 init];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"link"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKUIBrickItem *)v5 _setLinkInfoWithLinkDictionary:v7 context:v4];
    }
    if (!v5->_accessibilityLabel)
    {
      v8 = [v6 objectForKey:@"designLabel"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v9 = [v8 copy];
        accessibilityLabel = v5->_accessibilityLabel;
        v5->_accessibilityLabel = (NSString *)v9;
      }
    }
    v11 = [v6 objectForKey:@"editorial"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v4 copy];
      [v12 setComponentDictionary:v11];
      v13 = [[SKUIEditorialComponent alloc] initWithCustomPageContext:v12];
      editorial = v5->_editorial;
      v5->_editorial = v13;
    }
    v15 = [v6 objectForKey:*MEMORY[0x1E4FA8710]];
    double v16 = SKUIBrickItemSize();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = v15;
      v18 = [[SKUIArtwork alloc] initWithArtworkDictionary:v17];

      artwork = v5->_artwork;
      v5->_artwork = v18;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_19:
        v21 = [v6 objectForKey:@"fcKind"];
        v22 = [v6 objectForKey:@"type"];
        if ((objc_opt_respondsToSelector() & 1) != 0 && [v21 integerValue] == 290
          || [v22 isEqualToString:@"counter"])
        {
          v23 = [[SKUICountdown alloc] initWithCountdownDictionary:v6];
          countdown = v5->_countdown;
          v5->_countdown = v23;
        }
        v25 = [v6 objectForKey:@"adamId"];
        if (objc_opt_respondsToSelector()) {
          v5->_brickIdentifier = [v25 longLongValue];
        }

        goto LABEL_26;
      }
      uint64_t v20 = +[SKUIArtworkList artworkForSize:(uint64_t)v16 artworkDictionaries:v15];
      artwork = v5->_artwork;
      v5->_artwork = (SKUIArtwork *)v20;
    }

    goto LABEL_19;
  }
LABEL_26:

  return v5;
}

- (void)_setLinkItem:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIBrickItem;
  id v4 = [(SKUIBrickItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: \"%@\", %@", v4, self->_accessibilityLabel, self->_link];

  return v5;
}

- (void)_setLinkInfoWithLinkDictionary:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v14 = (id)[a4 copy];
  [v14 setComponentDictionary:v6];

  objc_super v7 = [[SKUILink alloc] initWithComponentContext:v14];
  link = self->_link;
  self->_link = v7;

  uint64_t v9 = [(SKUILink *)self->_link title];
  accessibilityLabel = self->_accessibilityLabel;
  self->_accessibilityLabel = v9;

  if (!self->_accessibilityLabel)
  {
    v11 = [(SKUILink *)self->_link item];
    v12 = [v11 title];
    v13 = self->_accessibilityLabel;
    self->_accessibilityLabel = v12;
  }
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (SKUIArtwork)artwork
{
  return self->_artwork;
}

- (int64_t)brickIdentifier
{
  return self->_brickIdentifier;
}

- (SKUICountdown)countdown
{
  return self->_countdown;
}

- (SKUIEditorialComponent)editorial
{
  return self->_editorial;
}

- (SKUILink)link
{
  return self->_link;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_editorial, 0);
  objc_storeStrong((id *)&self->_countdown, 0);
  objc_storeStrong((id *)&self->_artwork, 0);

  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

- (void)initWithBannerRoomContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBrickItem initWithBannerRoomContext:]";
}

- (void)initWithComponentContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIBrickItem initWithComponentContext:]";
}

@end