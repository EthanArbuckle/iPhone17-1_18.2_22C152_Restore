@interface MTAVAssetCache
+ (void)_asyncPrewarm;
- (AVAssetCache)assetCache;
- (MTAVAssetCache)init;
@end

@implementation MTAVAssetCache

- (MTAVAssetCache)init
{
  v16.receiver = self;
  v16.super_class = (Class)MTAVAssetCache;
  v2 = [(MTAVAssetCache *)&v16 init];
  if (v2)
  {
    uint64_t v3 = +[MTAVAssetCachePlatformConfiguration platformConfiguration];
    uint64_t v5 = v4;
    v6 = NSTemporaryDirectory();
    v7 = [v6 stringByAppendingPathComponent:@"PodcastsAVAssetCache"];

    v8 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v9 = [v8 fileExistsAtPath:v7];

    if ((v9 & 1) == 0)
    {
      v10 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v10 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v11 = (void *)MEMORY[0x1E4F16338];
    v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
    uint64_t v13 = [v11 assetCacheWithURL:v12];
    assetCache = v2->_assetCache;
    v2->_assetCache = (AVAssetCache *)v13;

    [(AVAssetCache *)v2->_assetCache setMaxEntrySize:v3];
    [(AVAssetCache *)v2->_assetCache setMaxSize:v5];
  }
  return v2;
}

+ (void)_asyncPrewarm
{
  v2 = dispatch_get_global_queue(21, 0);
  dispatch_async(v2, &__block_literal_global_3);
}

id __31__MTAVAssetCache__asyncPrewarm__block_invoke()
{
  return +[MTSingleton sharedInstance];
}

- (AVAssetCache)assetCache
{
  return self->_assetCache;
}

- (void).cxx_destruct
{
}

@end