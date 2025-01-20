@interface VUILaunchConfig
- (BOOL)alwaysPrefetchAppConfiguration;
- (BOOL)collectionUseIdForReuseIdEnabled;
- (BOOL)deferRichTextViewUpdate;
- (BOOL)gridViewUseItemIdAsReuseId;
- (BOOL)memoryImageCacheEnabled;
- (BOOL)minimalSessionImageLoading;
- (BOOL)prefetchLastSelectedTab;
- (BOOL)prewarmImageConnection;
- (BOOL)prewarmJetpackLoading;
- (BOOL)prewarmUTSConnection;
- (BOOL)useConfigCacheIgnoreExpiry;
- (BOOL)useSharedURLSession;
- (NSString)prewarmImageUrl;
- (VUILaunchConfig)init;
- (double)extendedCacheExpireDuration;
- (double)prefetchedTabExpirationDuration;
- (int64_t)imageInMemoryCacheSizeLimitInBytes;
- (int64_t)layoutReuseIdleTimeToLive;
- (void)setAlwaysPrefetchAppConfiguration:(BOOL)a3;
- (void)setCollectionUseIdForReuseIdEnabled:(BOOL)a3;
- (void)setDeferRichTextViewUpdate:(BOOL)a3;
- (void)setExtendedCacheExpireDuration:(double)a3;
- (void)setGridViewUseItemIdAsReuseId:(BOOL)a3;
- (void)setImageInMemoryCacheSizeLimitInBytes:(int64_t)a3;
- (void)setLayoutReuseIdleTimeToLive:(int64_t)a3;
- (void)setMemoryImageCacheEnabled:(BOOL)a3;
- (void)setMinimalSessionImageLoading:(BOOL)a3;
- (void)setPrefetchLastSelectedTab:(BOOL)a3;
- (void)setPrefetchedTabExpirationDuration:(double)a3;
- (void)setPrewarmImageConnection:(BOOL)a3;
- (void)setPrewarmImageUrl:(id)a3;
- (void)setPrewarmJetpackLoading:(BOOL)a3;
- (void)setPrewarmUTSConnection:(BOOL)a3;
- (void)setUseConfigCacheIgnoreExpiry:(BOOL)a3;
- (void)setUseSharedURLSession:(BOOL)a3;
@end

@implementation VUILaunchConfig

- (BOOL)useSharedURLSession
{
  return self->_useSharedURLSession;
}

- (BOOL)prewarmUTSConnection
{
  return self->_prewarmUTSConnection;
}

- (BOOL)prewarmJetpackLoading
{
  return self->_prewarmJetpackLoading;
}

- (NSString)prewarmImageUrl
{
  return self->_prewarmImageUrl;
}

- (BOOL)prewarmImageConnection
{
  return self->_prewarmImageConnection;
}

- (double)prefetchedTabExpirationDuration
{
  return self->_prefetchedTabExpirationDuration;
}

- (BOOL)prefetchLastSelectedTab
{
  return self->_prefetchLastSelectedTab;
}

- (BOOL)gridViewUseItemIdAsReuseId
{
  return self->_gridViewUseItemIdAsReuseId;
}

- (double)extendedCacheExpireDuration
{
  return self->_extendedCacheExpireDuration;
}

- (BOOL)alwaysPrefetchAppConfiguration
{
  return self->_alwaysPrefetchAppConfiguration;
}

- (BOOL)minimalSessionImageLoading
{
  return self->_minimalSessionImageLoading;
}

- (BOOL)collectionUseIdForReuseIdEnabled
{
  return self->_collectionUseIdForReuseIdEnabled;
}

- (BOOL)useConfigCacheIgnoreExpiry
{
  return self->_useConfigCacheIgnoreExpiry;
}

- (VUILaunchConfig)init
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)VUILaunchConfig;
  v2 = [(VUILaunchConfig *)&v31 init];
  v3 = v2;
  if (v2)
  {
    char v4 = 1;
    v2->_useConfigCacheIgnoreExpiry = 1;
    v2->_extendedCacheExpireDuration = 84600.0;
    v2->_layoutReuseIdleTimeToLive = 64;
    *(_DWORD *)&v2->_useSharedURLSession = 16842753;
    *(_WORD *)&v2->_prewarmImageConnection = 257;
    prewarmImageUrl = v2->_prewarmImageUrl;
    v2->_prefetchedTabExpirationDuration = 60.0;
    v2->_prewarmImageUrl = 0;

    v3->_minimalSessionImageLoading = 1;
    v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v7 = [v6 objectForKey:@"collectionUseIdForReuseIdEnabled"];

    if (v7) {
      char v4 = [v7 BOOLValue];
    }
    v3->_BOOL collectionUseIdForReuseIdEnabled = v4;
    v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BOOL collectionUseIdForReuseIdEnabled = v3->_collectionUseIdForReuseIdEnabled;
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = collectionUseIdForReuseIdEnabled;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: collectionUseIdForReuseIdEnabled: %d", buf, 8u);
    }

    v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v11 = [v10 objectForKey:@"gridViewUseItemIdAsReuseId"];

    if (v11) {
      char v12 = [v11 BOOLValue];
    }
    else {
      char v12 = 1;
    }
    v3->_BOOL gridViewUseItemIdAsReuseId = v12;
    v13 = VUIDefaultLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL gridViewUseItemIdAsReuseId = v3->_gridViewUseItemIdAsReuseId;
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = gridViewUseItemIdAsReuseId;
      _os_log_impl(&dword_1E2BD7000, v13, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: gridViewUseItemIdAsReuseId: %d", buf, 8u);
    }

    v15 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v16 = [v15 objectForKey:@"memoryImageCacheEnabled"];

    if (v16) {
      char v17 = [v16 BOOLValue];
    }
    else {
      char v17 = 0;
    }
    v3->_BOOL memoryImageCacheEnabled = v17;
    v18 = VUIDefaultLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      BOOL memoryImageCacheEnabled = v3->_memoryImageCacheEnabled;
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = memoryImageCacheEnabled;
      _os_log_impl(&dword_1E2BD7000, v18, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: memoryImageCacheEnabled: %d", buf, 8u);
    }

    v20 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v21 = [v20 objectForKey:@"deferRichTextViewUpdate"];

    if (v21) {
      char v22 = [v21 BOOLValue];
    }
    else {
      char v22 = 0;
    }
    v3->_BOOL deferRichTextViewUpdate = v22;
    v23 = VUIDefaultLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BOOL deferRichTextViewUpdate = v3->_deferRichTextViewUpdate;
      *(_DWORD *)buf = 67109120;
      LODWORD(v33) = deferRichTextViewUpdate;
      _os_log_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: deferRichTextViewUpdate: %d", buf, 8u);
    }

    v25 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v26 = [v25 objectForKey:@"imageInMemoryCacheSizeLimitInBytes"];

    if (v26) {
      uint64_t v27 = [v26 integerValue];
    }
    else {
      uint64_t v27 = 0;
    }
    v3->_int64_t imageInMemoryCacheSizeLimitInBytes = v27;
    v28 = VUIDefaultLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int64_t imageInMemoryCacheSizeLimitInBytes = v3->_imageInMemoryCacheSizeLimitInBytes;
      *(_DWORD *)buf = 134217984;
      int64_t v33 = imageInMemoryCacheSizeLimitInBytes;
      _os_log_impl(&dword_1E2BD7000, v28, OS_LOG_TYPE_DEFAULT, "FeaturesConfiguration:: imageInMemoryCacheSizeLimitInBytes: %ld", buf, 0xCu);
    }
  }
  return v3;
}

- (void)setUseConfigCacheIgnoreExpiry:(BOOL)a3
{
  self->_useConfigCacheIgnoreExpiry = a3;
}

- (void)setExtendedCacheExpireDuration:(double)a3
{
  self->_extendedCacheExpireDuration = a3;
}

- (int64_t)layoutReuseIdleTimeToLive
{
  return self->_layoutReuseIdleTimeToLive;
}

- (void)setLayoutReuseIdleTimeToLive:(int64_t)a3
{
  self->_layoutReuseIdleTimeToLive = a3;
}

- (void)setCollectionUseIdForReuseIdEnabled:(BOOL)a3
{
  self->_BOOL collectionUseIdForReuseIdEnabled = a3;
}

- (void)setGridViewUseItemIdAsReuseId:(BOOL)a3
{
  self->_BOOL gridViewUseItemIdAsReuseId = a3;
}

- (BOOL)memoryImageCacheEnabled
{
  return self->_memoryImageCacheEnabled;
}

- (void)setMemoryImageCacheEnabled:(BOOL)a3
{
  self->_BOOL memoryImageCacheEnabled = a3;
}

- (int64_t)imageInMemoryCacheSizeLimitInBytes
{
  return self->_imageInMemoryCacheSizeLimitInBytes;
}

- (void)setImageInMemoryCacheSizeLimitInBytes:(int64_t)a3
{
  self->_int64_t imageInMemoryCacheSizeLimitInBytes = a3;
}

- (void)setUseSharedURLSession:(BOOL)a3
{
  self->_useSharedURLSession = a3;
}

- (void)setAlwaysPrefetchAppConfiguration:(BOOL)a3
{
  self->_alwaysPrefetchAppConfiguration = a3;
}

- (void)setPrewarmUTSConnection:(BOOL)a3
{
  self->_prewarmUTSConnection = a3;
}

- (void)setPrefetchLastSelectedTab:(BOOL)a3
{
  self->_prefetchLastSelectedTab = a3;
}

- (void)setPrefetchedTabExpirationDuration:(double)a3
{
  self->_prefetchedTabExpirationDuration = a3;
}

- (void)setPrewarmImageConnection:(BOOL)a3
{
  self->_prewarmImageConnection = a3;
}

- (void)setPrewarmJetpackLoading:(BOOL)a3
{
  self->_prewarmJetpackLoading = a3;
}

- (void)setPrewarmImageUrl:(id)a3
{
}

- (void)setMinimalSessionImageLoading:(BOOL)a3
{
  self->_minimalSessionImageLoading = a3;
}

- (BOOL)deferRichTextViewUpdate
{
  return self->_deferRichTextViewUpdate;
}

- (void)setDeferRichTextViewUpdate:(BOOL)a3
{
  self->_BOOL deferRichTextViewUpdate = a3;
}

- (void).cxx_destruct
{
}

@end