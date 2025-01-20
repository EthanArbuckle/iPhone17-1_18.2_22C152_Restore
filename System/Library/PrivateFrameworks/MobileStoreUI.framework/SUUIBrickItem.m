@interface SUUIBrickItem
- (NSString)accessibilityLabel;
- (SUUIArtwork)artwork;
- (SUUIBrickItem)initWithBannerRoomContext:(id)a3;
- (SUUIBrickItem)initWithComponentContext:(id)a3;
- (SUUICountdown)countdown;
- (SUUIEditorialComponent)editorial;
- (SUUILink)link;
- (id)description;
- (int64_t)brickIdentifier;
- (void)_setLinkInfoWithLinkDictionary:(id)a3 context:(id)a4;
- (void)_setLinkItem:(id)a3;
@end

@implementation SUUIBrickItem

- (SUUIBrickItem)initWithBannerRoomContext:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SUUIBrickItem;
  v5 = [(SUUIBrickItem *)&v20 init];
  if (v5)
  {
    v6 = [v4 componentDictionary];
    v7 = [v6 objectForKey:@"link"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SUUIBrickItem *)v5 _setLinkInfoWithLinkDictionary:v7 context:v4];
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
      v12 = [[SUUIEditorialComponent alloc] initWithBrickRoomText:v11];
      editorial = v5->_editorial;
      v5->_editorial = v12;
    }
    v14 = [v6 objectForKey:@"imageUrl"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = (void *)[objc_alloc(NSURL) initWithString:v14];
      if (v15)
      {
        v16 = [[SUUIArtwork alloc] initWithURL:v15 size:SUUIBrickItemSize()];
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

- (SUUIBrickItem)initWithComponentContext:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)SUUIBrickItem;
  v5 = [(SUUIBrickItem *)&v27 init];
  if (!v5) {
    goto LABEL_22;
  }
  v6 = [v4 componentDictionary];
  v7 = [v6 objectForKey:@"link"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SUUIBrickItem *)v5 _setLinkInfoWithLinkDictionary:v7 context:v4];
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
    v13 = [[SUUIEditorialComponent alloc] initWithCustomPageContext:v12];
    editorial = v5->_editorial;
    v5->_editorial = v13;
  }
  v15 = [v6 objectForKey:*MEMORY[0x263F7B9E8]];
  double v16 = SUUIBrickItemSize();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v17 = v15;
    v18 = [[SUUIArtwork alloc] initWithArtworkDictionary:v17];

    artwork = v5->_artwork;
    v5->_artwork = v18;
LABEL_14:

    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v20 = +[SUUIArtworkList artworkForSize:(uint64_t)v16 artworkDictionaries:v15];
    artwork = v5->_artwork;
    v5->_artwork = (SUUIArtwork *)v20;
    goto LABEL_14;
  }
LABEL_15:
  v21 = [v6 objectForKey:@"fcKind"];
  v22 = [v6 objectForKey:@"type"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v21 integerValue] == 290
    || [v22 isEqualToString:@"counter"])
  {
    v23 = [[SUUICountdown alloc] initWithCountdownDictionary:v6];
    countdown = v5->_countdown;
    v5->_countdown = v23;
  }
  v25 = [v6 objectForKey:@"adamId"];
  if (objc_opt_respondsToSelector()) {
    v5->_brickIdentifier = [v25 longLongValue];
  }

LABEL_22:
  return v5;
}

- (void)_setLinkItem:(id)a3
{
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SUUIBrickItem;
  id v4 = [(SUUIBrickItem *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: \"%@\", %@", v4, self->_accessibilityLabel, self->_link];

  return v5;
}

- (void)_setLinkInfoWithLinkDictionary:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v14 = (id)[a4 copy];
  [v14 setComponentDictionary:v6];

  objc_super v7 = [[SUUILink alloc] initWithComponentContext:v14];
  link = self->_link;
  self->_link = v7;

  uint64_t v9 = [(SUUILink *)self->_link title];
  accessibilityLabel = self->_accessibilityLabel;
  self->_accessibilityLabel = v9;

  if (!self->_accessibilityLabel)
  {
    v11 = [(SUUILink *)self->_link item];
    v12 = [v11 title];
    v13 = self->_accessibilityLabel;
    self->_accessibilityLabel = v12;
  }
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (SUUIArtwork)artwork
{
  return self->_artwork;
}

- (int64_t)brickIdentifier
{
  return self->_brickIdentifier;
}

- (SUUICountdown)countdown
{
  return self->_countdown;
}

- (SUUIEditorialComponent)editorial
{
  return self->_editorial;
}

- (SUUILink)link
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

@end