@interface SUUIMediaComponent
- (NSString)accessibilityLabel;
- (NSString)mediaURLString;
- (NSString)title;
- (SUUIArtworkProviding)thumbnailArtworkProvider;
- (SUUILink)link;
- (SUUIMediaComponent)initWithArtwork:(id)a3;
- (SUUIMediaComponent)initWithArtworkProvider:(id)a3;
- (SUUIMediaComponent)initWithArtworkProvider:(id)a3 appearance:(int64_t)a4;
- (SUUIMediaComponent)initWithCustomPageContext:(id)a3;
- (SUUIMediaComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
- (double)duration;
- (float)titleFontSize;
- (id)bestThumbnailArtwork;
- (id)bestThumbnailForWidth:(double)a3;
- (id)metricsElementName;
- (id)valueForMetricsField:(id)a3;
- (int64_t)alignment;
- (int64_t)componentType;
- (int64_t)mediaAppearance;
- (int64_t)mediaIdentifier;
- (int64_t)mediaType;
- (int64_t)titleFontWeight;
@end

@implementation SUUIMediaComponent

- (SUUIMediaComponent)initWithArtwork:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIMediaComponent;
  v5 = [(SUUIMediaComponent *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_mediaType = 0;
    v7 = objc_alloc_init(SUUIArtworkList);
    thumbnailArtworkProvider = v6->_thumbnailArtworkProvider;
    v6->_thumbnailArtworkProvider = (SUUIArtworkProviding *)v7;

    v9 = v6->_thumbnailArtworkProvider;
    v13[0] = v4;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [(SUUIArtworkProviding *)v9 setArtworks:v10];
  }
  return v6;
}

- (SUUIMediaComponent)initWithArtworkProvider:(id)a3
{
  return [(SUUIMediaComponent *)self initWithArtworkProvider:a3 appearance:0];
}

- (SUUIMediaComponent)initWithArtworkProvider:(id)a3 appearance:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIMediaComponent;
  v7 = [(SUUIMediaComponent *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_mediaAppearance = a4;
    v7->_mediaType = 0;
    uint64_t v9 = [v6 copy];
    thumbnailArtworkProvider = v8->_thumbnailArtworkProvider;
    v8->_thumbnailArtworkProvider = (SUUIArtworkProviding *)v9;
  }
  return v8;
}

- (SUUIMediaComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SUUIMediaComponent;
  v5 = [(SUUIPageComponent *)&v34 initWithCustomPageContext:v4];
  if (!v5) {
    goto LABEL_32;
  }
  id v6 = [v4 componentDictionary];
  v7 = [v6 objectForKey:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v7 copy];
    accessibilityLabel = v5->_accessibilityLabel;
    v5->_accessibilityLabel = (NSString *)v8;
  }
  v10 = [v6 objectForKey:@"align"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5->_alignment = SUUIPageComponentAlignmentForString(v10);
  }
  v11 = [v6 objectForKey:@"duration"];

  if (objc_opt_respondsToSelector())
  {
    [v11 doubleValue];
    v5->_duration = v12;
  }
  v13 = [v6 objectForKey:@"link"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = (void *)[v4 copy];
    [v14 setComponentDictionary:v13];
    v15 = [[SUUILink alloc] initWithComponentContext:v14];
    link = v5->_link;
    v5->_link = v15;
  }
  v17 = [v6 objectForKey:@"adamId"];

  if (objc_opt_respondsToSelector()) {
    v5->_mediaIdentifier = [v17 longLongValue];
  }
  v18 = [v6 objectForKey:@"subType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v18 isEqualToString:@"audio"])
    {
      uint64_t v19 = 1;
    }
    else
    {
      if (![v18 isEqualToString:@"video"]) {
        goto LABEL_18;
      }
      uint64_t v19 = 2;
    }
    v5->_mediaType = v19;
  }
LABEL_18:
  v20 = [v6 objectForKey:@"url"];

  if (!v20)
  {
    v20 = [v6 objectForKey:@"audioUrl"];
    if (!v20)
    {
      v20 = [v6 objectForKey:@"videoUrl"];
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v21 = [v20 copy];
    mediaURLString = v5->_mediaURLString;
    v5->_mediaURLString = (NSString *)v21;
  }
  v23 = [v6 objectForKey:@"artwork"];

  uint64_t v24 = +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:v23];
  thumbnailArtworkProvider = v5->_thumbnailArtworkProvider;
  v5->_thumbnailArtworkProvider = (SUUIArtworkProviding *)v24;

  v26 = [v6 objectForKey:@"title"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v27 = [v26 copy];
    title = v5->_title;
    v5->_title = (NSString *)v27;
  }
  v29 = [v6 objectForKey:@"titleSize"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *(float *)&double v30 = SUUIEditorialTitleSizeForString(v29);
  }
  else
  {
    char v31 = objc_opt_respondsToSelector();
    LODWORD(v30) = 17.0;
    if (v31) {
      objc_msgSend(v29, "floatValue", v30);
    }
  }
  v5->_titleFontSize = *(float *)&v30;
  v32 = [v6 objectForKey:@"titleWeight"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5->_titleFontWeight = SUUIPageComponentFontWeightForString(v32);
  }

LABEL_32:
  return v5;
}

- (SUUIMediaComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIMediaComponent;
  v7 = [(SUUIPageComponent *)&v13 initWithFeaturedContentContext:v6 kind:a4];
  if (v7)
  {
    uint64_t v8 = [v6 componentDictionary];
    uint64_t v9 = [v8 objectForKey:@"artwork"];
    uint64_t v10 = +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:v9];
    thumbnailArtworkProvider = v7->_thumbnailArtworkProvider;
    v7->_thumbnailArtworkProvider = (SUUIArtworkProviding *)v10;

    v7->_mediaType = 0;
  }

  return v7;
}

- (id)bestThumbnailArtwork
{
  v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 scale];
  double v5 = v4;

  thumbnailArtworkProvider = self->_thumbnailArtworkProvider;
  if (v5 == 2.0) {
    [(SUUIArtworkProviding *)thumbnailArtworkProvider largestArtwork];
  }
  else {
  v7 = [(SUUIArtworkProviding *)thumbnailArtworkProvider smallestArtwork];
  }
  return v7;
}

- (id)bestThumbnailForWidth:(double)a3
{
  double v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 scale];
  double v7 = v6 * a3;

  uint64_t v8 = [(SUUIArtworkProviding *)self->_thumbnailArtworkProvider artworkForSize:(uint64_t)v7];
  if (!v8)
  {
    uint64_t v8 = [(SUUIMediaComponent *)self bestThumbnailArtwork];
  }
  return v8;
}

- (int64_t)componentType
{
  return 10;
}

- (id)metricsElementName
{
  return @"media";
}

- (id)valueForMetricsField:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:*MEMORY[0x263F7BB68]])
  {
    uint64_t v5 = [NSNumber numberWithLongLong:self->_mediaIdentifier];
LABEL_6:
    double v6 = (void *)v5;
    goto LABEL_7;
  }
  if (([v4 isEqualToString:*MEMORY[0x263F7BB78]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x263F7BB80]])
  {
    uint64_t v5 = [(SUUIMediaComponent *)self title];
    goto LABEL_6;
  }
  double v6 = 0;
LABEL_7:

  return v6;
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (double)duration
{
  return self->_duration;
}

- (SUUILink)link
{
  return self->_link;
}

- (int64_t)mediaAppearance
{
  return self->_mediaAppearance;
}

- (int64_t)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)mediaURLString
{
  return self->_mediaURLString;
}

- (NSString)title
{
  return self->_title;
}

- (float)titleFontSize
{
  return self->_titleFontSize;
}

- (int64_t)titleFontWeight
{
  return self->_titleFontWeight;
}

- (SUUIArtworkProviding)thumbnailArtworkProvider
{
  return self->_thumbnailArtworkProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailArtworkProvider, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_mediaURLString, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
}

@end