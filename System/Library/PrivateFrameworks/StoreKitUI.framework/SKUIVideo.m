@interface SKUIVideo
- (NSURL)URL;
- (SKUIArtworkProviding)artworks;
- (SKUIVideo)initWithVideoDictionary:(id)a3;
@end

@implementation SKUIVideo

- (SKUIVideo)initWithVideoDictionary:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIVideo initWithVideoDictionary:]();
  }
  v15.receiver = self;
  v15.super_class = (Class)SKUIVideo;
  v5 = [(SKUIVideo *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"previewFrame"];
    uint64_t v7 = +[SKUIArtworkProvidingFactory artworkProviderForStoreResponse:v6];
    artworks = v5->_artworks;
    v5->_artworks = (SKUIArtworkProviding *)v7;

    v9 = [v4 objectForKey:@"video"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v9];
      url = v5->_url;
      v5->_url = (NSURL *)v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_12;
      }
      url = [v9 objectForKey:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:url];
        v13 = v5->_url;
        v5->_url = (NSURL *)v12;
      }
    }

LABEL_12:
  }

  return v5;
}

- (SKUIArtworkProviding)artworks
{
  return self->_artworks;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_artworks, 0);
}

- (void)initWithVideoDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIVideo initWithVideoDictionary:]";
}

@end