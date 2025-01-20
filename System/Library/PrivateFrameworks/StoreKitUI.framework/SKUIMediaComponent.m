@interface SKUIMediaComponent
- (NSString)accessibilityLabel;
- (NSString)mediaURLString;
- (NSString)title;
- (SKUIArtworkProviding)thumbnailArtworkProvider;
- (SKUILink)link;
- (SKUIMediaComponent)initWithArtwork:(id)a3;
- (SKUIMediaComponent)initWithArtworkProvider:(id)a3;
- (SKUIMediaComponent)initWithArtworkProvider:(id)a3 appearance:(int64_t)a4;
- (SKUIMediaComponent)initWithCustomPageContext:(id)a3;
- (SKUIMediaComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4;
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

@implementation SKUIMediaComponent

- (SKUIMediaComponent)initWithArtwork:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMediaComponent initWithArtwork:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMediaComponent;
  v13 = [(SKUIMediaComponent *)&v20 init];
  v14 = v13;
  if (v13)
  {
    v13->_mediaType = 0;
    v15 = objc_alloc_init(SKUIArtworkList);
    thumbnailArtworkProvider = v14->_thumbnailArtworkProvider;
    v14->_thumbnailArtworkProvider = (SKUIArtworkProviding *)v15;

    v17 = v14->_thumbnailArtworkProvider;
    v21[0] = v4;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [(SKUIArtworkProviding *)v17 setArtworks:v18];
  }
  return v14;
}

- (SKUIMediaComponent)initWithArtworkProvider:(id)a3
{
  return [(SKUIMediaComponent *)self initWithArtworkProvider:a3 appearance:0];
}

- (SKUIMediaComponent)initWithArtworkProvider:(id)a3 appearance:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIMediaComponent initWithArtworkProvider:appearance:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIMediaComponent;
  v15 = [(SKUIMediaComponent *)&v20 init];
  v16 = v15;
  if (v15)
  {
    v15->_mediaAppearance = a4;
    v15->_mediaType = 0;
    uint64_t v17 = [v6 copy];
    thumbnailArtworkProvider = v16->_thumbnailArtworkProvider;
    v16->_thumbnailArtworkProvider = (SKUIArtworkProviding *)v17;
  }
  return v16;
}

- (SKUIMediaComponent)initWithCustomPageContext:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUIMediaComponent initWithCustomPageContext:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v42.receiver = self;
  v42.super_class = (Class)SKUIMediaComponent;
  uint64_t v13 = [(SKUIPageComponent *)&v42 initWithCustomPageContext:v4];
  if (v13)
  {
    uint64_t v14 = [v4 componentDictionary];
    v15 = [v14 objectForKey:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 copy];
      accessibilityLabel = v13->_accessibilityLabel;
      v13->_accessibilityLabel = (NSString *)v16;
    }
    v18 = [v14 objectForKey:@"align"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13->_alignment = SKUIPageComponentAlignmentForString(v18);
    }
    v19 = [v14 objectForKey:@"duration"];

    if (objc_opt_respondsToSelector())
    {
      [v19 doubleValue];
      v13->_duration = v20;
    }
    v21 = [v14 objectForKey:@"link"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v4 copy];
      [v22 setComponentDictionary:v21];
      v23 = [[SKUILink alloc] initWithComponentContext:v22];
      link = v13->_link;
      v13->_link = v23;
    }
    v25 = [v14 objectForKey:@"adamId"];

    if (objc_opt_respondsToSelector()) {
      v13->_mediaIdentifier = [v25 longLongValue];
    }
    v26 = [v14 objectForKey:@"subType"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_22;
    }
    if ([v26 isEqualToString:@"audio"])
    {
      uint64_t v27 = 1;
    }
    else
    {
      if (![v26 isEqualToString:@"video"]) {
        goto LABEL_22;
      }
      uint64_t v27 = 2;
    }
    v13->_mediaType = v27;
LABEL_22:
    v28 = [v14 objectForKey:@"url"];

    if (!v28)
    {
      v28 = [v14 objectForKey:@"audioUrl"];
      if (!v28)
      {
        v28 = [v14 objectForKey:@"videoUrl"];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = [v28 copy];
      mediaURLString = v13->_mediaURLString;
      v13->_mediaURLString = (NSString *)v29;
    }
    v31 = [v14 objectForKey:@"artwork"];

    uint64_t v32 = +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:v31];
    thumbnailArtworkProvider = v13->_thumbnailArtworkProvider;
    v13->_thumbnailArtworkProvider = (SKUIArtworkProviding *)v32;

    v34 = [v14 objectForKey:@"title"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v35 = [v34 copy];
      title = v13->_title;
      v13->_title = (NSString *)v35;
    }
    v37 = [v14 objectForKey:@"titleSize"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      *(float *)&double v38 = SKUIEditorialTitleSizeForString(v37);
    }
    else
    {
      char v39 = objc_opt_respondsToSelector();
      LODWORD(v38) = 17.0;
      if (v39) {
        objc_msgSend(v37, "floatValue", v38);
      }
    }
    v13->_titleFontSize = *(float *)&v38;
    v40 = [v14 objectForKey:@"titleWeight"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13->_titleFontWeight = SKUIPageComponentFontWeightForString(v40);
    }
  }
  return v13;
}

- (SKUIMediaComponent)initWithFeaturedContentContext:(id)a3 kind:(int64_t)a4
{
  id v6 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v7) {
        -[SKUIMediaComponent initWithFeaturedContentContext:kind:](v7, v8, v9, v10, v11, v12, v13, v14);
      }
    }
  }
  v21.receiver = self;
  v21.super_class = (Class)SKUIMediaComponent;
  v15 = [(SKUIPageComponent *)&v21 initWithFeaturedContentContext:v6 kind:a4];
  if (v15)
  {
    uint64_t v16 = [v6 componentDictionary];
    uint64_t v17 = [v16 objectForKey:@"artwork"];
    uint64_t v18 = +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:v17];
    thumbnailArtworkProvider = v15->_thumbnailArtworkProvider;
    v15->_thumbnailArtworkProvider = (SKUIArtworkProviding *)v18;

    v15->_mediaType = 0;
  }

  return v15;
}

- (id)bestThumbnailArtwork
{
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 scale];
  double v5 = v4;

  thumbnailArtworkProvider = self->_thumbnailArtworkProvider;
  if (v5 == 2.0) {
    [(SKUIArtworkProviding *)thumbnailArtworkProvider largestArtwork];
  }
  else {
  BOOL v7 = [(SKUIArtworkProviding *)thumbnailArtworkProvider smallestArtwork];
  }

  return v7;
}

- (id)bestThumbnailForWidth:(double)a3
{
  double v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v5 scale];
  double v7 = v6 * a3;

  uint64_t v8 = [(SKUIArtworkProviding *)self->_thumbnailArtworkProvider artworkForSize:(uint64_t)v7];
  if (!v8)
  {
    uint64_t v8 = [(SKUIMediaComponent *)self bestThumbnailArtwork];
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
  if ([v4 isEqualToString:*MEMORY[0x1E4FA8890]])
  {
    uint64_t v5 = [NSNumber numberWithLongLong:self->_mediaIdentifier];
LABEL_6:
    double v6 = (void *)v5;
    goto LABEL_7;
  }
  if (([v4 isEqualToString:*MEMORY[0x1E4FA88A0]] & 1) != 0
    || [v4 isEqualToString:*MEMORY[0x1E4FA88A8]])
  {
    uint64_t v5 = [(SKUIMediaComponent *)self title];
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

- (SKUILink)link
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

- (SKUIArtworkProviding)thumbnailArtworkProvider
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

- (void)initWithArtwork:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithArtworkProvider:(uint64_t)a3 appearance:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCustomPageContext:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithFeaturedContentContext:(uint64_t)a3 kind:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end