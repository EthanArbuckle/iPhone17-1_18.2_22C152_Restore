@interface NMSAudiobookCacheItemMetadata
+ (id)metaDataForMediaItem:(id)a3;
- (BOOL)_loadForMediaItem:(id)a3;
- (double)cachedDuration;
- (double)cachedStartTime;
- (id)_baseDirectoryForMediaItem:(id)a3;
- (void)setCachedDuration:(double)a3;
- (void)setCachedStartTime:(double)a3;
@end

@implementation NMSAudiobookCacheItemMetadata

+ (id)metaDataForMediaItem:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(NMSAudiobookCacheItemMetadata);
  BOOL v5 = [(NMSAudiobookCacheItemMetadata *)v4 _loadForMediaItem:v3];

  if (v5) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }

  return v6;
}

- (id)_baseDirectoryForMediaItem:(id)a3
{
  id v3 = NSURL;
  v4 = (void *)MEMORY[0x263F57448];
  id v5 = a3;
  v6 = [v4 mediaFolderPath];
  v7 = [v3 fileURLWithPath:v6];

  v8 = NSString;
  uint64_t v9 = [v5 persistentID];

  v10 = objc_msgSend(v8, "stringWithFormat:", @"ManagedPurchases/Books/%llu.m4bpkg/", v9);
  v11 = [NSURL fileURLWithPath:v10 isDirectory:1 relativeToURL:v7];

  return v11;
}

- (BOOL)_loadForMediaItem:(id)a3
{
  v4 = [(NMSAudiobookCacheItemMetadata *)self _baseDirectoryForMediaItem:a3];
  id v5 = [v4 URLByAppendingPathComponent:@"Metadata.plist"];
  v6 = [NSDictionary dictionaryWithContentsOfURL:v5];
  v7 = [v6 objectForKeyedSubscript:@"BLAudiobookCacheMetadataKeyCachedStartTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = [v6 objectForKeyedSubscript:@"BLAudiobookCacheMetadataKeyCachedStartTime"];
  }
  else
  {
    v8 = 0;
  }

  uint64_t v9 = [v6 objectForKeyedSubscript:@"BLAudiobookCacheMetadataKeyCachedDuration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v6 objectForKeyedSubscript:@"BLAudiobookCacheMetadataKeyCachedDuration"];

    BOOL v11 = 0;
    if (v8 && v10)
    {
      [v8 doubleValue];
      -[NMSAudiobookCacheItemMetadata setCachedStartTime:](self, "setCachedStartTime:");
      [v10 doubleValue];
      -[NMSAudiobookCacheItemMetadata setCachedDuration:](self, "setCachedDuration:");
      BOOL v11 = 1;
    }
  }
  else
  {

    BOOL v11 = 0;
    v10 = 0;
  }

  return v11;
}

- (double)cachedStartTime
{
  return self->_cachedStartTime;
}

- (void)setCachedStartTime:(double)a3
{
  self->_cachedStartTime = a3;
}

- (double)cachedDuration
{
  return self->_cachedDuration;
}

- (void)setCachedDuration:(double)a3
{
  self->_cachedDuration = a3;
}

@end