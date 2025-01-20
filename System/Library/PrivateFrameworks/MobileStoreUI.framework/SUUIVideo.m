@interface SUUIVideo
- (NSURL)URL;
- (SUUIArtworkProviding)artworks;
- (SUUIVideo)initWithVideoDictionary:(id)a3;
@end

@implementation SUUIVideo

- (SUUIVideo)initWithVideoDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIVideo;
  v5 = [(SUUIVideo *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"previewFrame"];
    uint64_t v7 = +[SUUIArtworkProvidingFactory artworkProviderForStoreResponse:v6];
    artworks = v5->_artworks;
    v5->_artworks = (SUUIArtworkProviding *)v7;

    v9 = [v4 objectForKey:@"video"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [objc_alloc(NSURL) initWithString:v9];
      url = v5->_url;
      v5->_url = (NSURL *)v10;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      url = [v9 objectForKey:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [objc_alloc(NSURL) initWithString:url];
        v13 = v5->_url;
        v5->_url = (NSURL *)v12;
      }
    }

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (SUUIArtworkProviding)artworks
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

@end