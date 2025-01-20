@interface TVRMSNowPlayingArtworkCache
+ (id)sharedArtworkCache;
- (TVRMSNowPlayingArtworkCache)init;
- (id)artworkDataForIdentifier:(id)a3;
- (id)artworkDataForNowPlayingInfo:(id)a3;
- (void)setArtworkData:(id)a3 forIdentifier:(id)a4;
- (void)setArtworkData:(id)a3 forNowPlayingInfo:(id)a4;
@end

@implementation TVRMSNowPlayingArtworkCache

+ (id)sharedArtworkCache
{
  if (sharedArtworkCache_onceToken != -1) {
    dispatch_once(&sharedArtworkCache_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedArtworkCache_sharedArtworkCache;

  return v2;
}

uint64_t __49__TVRMSNowPlayingArtworkCache_sharedArtworkCache__block_invoke()
{
  sharedArtworkCache_sharedArtworkCache = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (TVRMSNowPlayingArtworkCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)TVRMSNowPlayingArtworkCache;
  v2 = [(TVRMSNowPlayingArtworkCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSCache *)v3;

    [(NSCache *)v2->_cache setCountLimit:5];
    [(NSCache *)v2->_cache setEvictsObjectsWithDiscardedContent:0];
  }
  return v2;
}

- (id)artworkDataForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(NSCache *)self->_cache objectForKey:v4];
  objc_super v6 = [v5 artworkData];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
LABEL_5:
    v11 = v8;
    goto LABEL_7;
  }
  v9 = [(_RMSNowPlayingArtworkCacheItem *)self->_lastItem artworkIdentifier];
  int v10 = [v4 isEqualToString:v9];

  if (v10)
  {
    id v8 = [(_RMSNowPlayingArtworkCacheItem *)self->_lastItem artworkData];
    goto LABEL_5;
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (id)artworkDataForNowPlayingInfo:(id)a3
{
  id v4 = [a3 artworkIdentifier];
  v5 = [(TVRMSNowPlayingArtworkCache *)self artworkDataForIdentifier:v4];

  return v5;
}

- (void)setArtworkData:(id)a3 forIdentifier:(id)a4
{
  if (a3 && a4)
  {
    lastItem = self->_lastItem;
    id v7 = a4;
    id v8 = a3;
    [(_RMSNowPlayingArtworkCacheItem *)lastItem endContentAccess];
    v9 = (_RMSNowPlayingArtworkCacheItem *)objc_opt_new();
    [(_RMSNowPlayingArtworkCacheItem *)v9 setArtworkData:v8];

    [(_RMSNowPlayingArtworkCacheItem *)v9 setArtworkIdentifier:v7];
    [(_RMSNowPlayingArtworkCacheItem *)v9 beginContentAccess];
    [(NSCache *)self->_cache setObject:v9 forKey:v7];

    int v10 = self->_lastItem;
    self->_lastItem = v9;
  }
}

- (void)setArtworkData:(id)a3 forNowPlayingInfo:(id)a4
{
  id v6 = a3;
  id v7 = [a4 artworkIdentifier];
  [(TVRMSNowPlayingArtworkCache *)self setArtworkData:v6 forIdentifier:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_lastItem, 0);
}

@end