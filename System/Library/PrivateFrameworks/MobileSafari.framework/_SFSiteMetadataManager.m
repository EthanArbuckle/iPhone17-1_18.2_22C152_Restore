@interface _SFSiteMetadataManager
+ (BOOL)hasSharedSiteMetadataManager;
+ (id)sharedSiteMetadataManager;
+ (void)setSharedSiteMetadataManager:(id)a3;
+ (void)setSharedSiteMetadataManagerProvider:(id)a3;
- (WBSLPLinkMetadataProvider)linkPresentationMetadataProvider;
- (WBSLeadImageCache)leadImageCache;
- (WBSLinkPresentationIconCache)linkPresentationIconCache;
- (WBSTabGroupTouchIconProvider)tabGroupIconProvider;
- (_SFFaviconProvider)faviconProvider;
- (_SFSavedAccountTouchIconCache)savedAccountTouchIconCache;
- (_SFSiteMetadataManager)initWithInjectedBundleURL:(id)a3 imageCacheDirectoryURL:(id)a4 cacheIsReadOnly:(BOOL)a5 metadataType:(unint64_t)a6;
- (_SFTouchIconCache)touchIconCache;
- (void)scheduleLowPriorityRequestForBookmarks:(id)a3;
@end

@implementation _SFSiteMetadataManager

+ (id)sharedSiteMetadataManager
{
  v2 = (void *)sharedSiteMetadataManager;
  if (!sharedSiteMetadataManager)
  {
    id WeakRetained = objc_loadWeakRetained(&sharedSiteMetadataManagerProvider);
    objc_storeWeak(&sharedSiteMetadataManagerProvider, 0);
    uint64_t v4 = [WeakRetained newSharedSiteMetadataManager];
    v5 = (void *)sharedSiteMetadataManager;
    sharedSiteMetadataManager = v4;

    v2 = (void *)sharedSiteMetadataManager;
  }

  return v2;
}

- (_SFSiteMetadataManager)initWithInjectedBundleURL:(id)a3 imageCacheDirectoryURL:(id)a4 cacheIsReadOnly:(BOOL)a5 metadataType:(unint64_t)a6
{
  __int16 v6 = a6;
  BOOL v7 = a5;
  v64[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  v61.receiver = self;
  v61.super_class = (Class)_SFSiteMetadataManager;
  v11 = [(WBSSiteMetadataManager *)&v61 initWithInjectedBundleURL:a3];
  if (v11)
  {
    if (v6)
    {
      v12 = objc_alloc_init(_SFBookmarkFolderTouchIconProvider);
      [(WBSSiteMetadataManager *)v11 registerSiteMetadataProvider:v12];
    }
    if ((v6 & 0x40) != 0)
    {
      v13 = (WBSTabGroupTouchIconProvider *)objc_alloc_init(MEMORY[0x1E4F98F00]);
      tabGroupIconProvider = v11->_tabGroupIconProvider;
      v11->_tabGroupIconProvider = v13;
      v15 = v13;

      [(WBSSiteMetadataManager *)v11 registerSiteMetadataProvider:v15];
    }
    id v16 = v10;
    v17 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __ensureImageCacheDirectory_block_invoke;
    block[3] = &unk_1E54E9858;
    id v63 = v16;
    dispatch_async(v17, block);

    if ((v6 & 2) != 0)
    {
      v26 = [_SFTouchIconCache alloc];
      v27 = [v16 URLByAppendingPathComponent:@"Touch Icons" isDirectory:1];
      uint64_t v28 = [(WBSTouchIconCache *)v26 initWithCacheDirectoryURL:v27 isReadOnly:v7];
      touchIconCache = v11->_touchIconCache;
      v11->_touchIconCache = (_SFTouchIconCache *)v28;

      [(WBSSiteMetadataManager *)v11 registerSiteMetadataProvider:v11->_touchIconCache];
      if ((v6 & 0x10) == 0)
      {
LABEL_8:
        if ((v6 & 0x20) == 0) {
          goto LABEL_9;
        }
        goto LABEL_17;
      }
    }
    else if ((v6 & 0x10) == 0)
    {
      goto LABEL_8;
    }
    id v30 = objc_alloc(MEMORY[0x1E4F98BF8]);
    v31 = [v16 URLByAppendingPathComponent:@"Lead Images" isDirectory:1];
    uint64_t v32 = [v30 initWithImageDirectoryURL:v31];
    leadImageCache = v11->_leadImageCache;
    v11->_leadImageCache = (WBSLeadImageCache *)v32;

    [(WBSSiteMetadataManager *)v11 registerSiteMetadataProvider:v11->_leadImageCache];
    if ((v6 & 0x20) == 0)
    {
LABEL_9:
      if ((v6 & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_18;
    }
LABEL_17:
    id v34 = objc_alloc(MEMORY[0x1E4F98C10]);
    v35 = [v16 URLByAppendingPathComponent:@"Link Presentation Icons"];
    uint64_t v36 = [v34 initWithImageDirectoryURL:v35];
    linkPresentationIconCache = v11->_linkPresentationIconCache;
    v11->_linkPresentationIconCache = (WBSLinkPresentationIconCache *)v36;

    [(WBSSiteMetadataManager *)v11 registerSiteMetadataProvider:v11->_linkPresentationIconCache];
    if ((v6 & 4) == 0)
    {
LABEL_10:
      if ((v6 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_19;
    }
LABEL_18:
    v38 = [_SFSavedAccountTouchIconCache alloc];
    v39 = [v16 URLByAppendingPathComponent:@"Password Icons" isDirectory:1];
    uint64_t v40 = [(WBSTouchIconCache *)v38 initWithCacheDirectoryURL:v39 isReadOnly:0 protectionType:3 allowFetchingOverCellularNetwork:0 fileMappingStyle:1 canFetchOutsideOfUserLoadedWebpage:1];
    savedAccountTouchIconCache = v11->_savedAccountTouchIconCache;
    v11->_savedAccountTouchIconCache = (_SFSavedAccountTouchIconCache *)v40;

    [(WBSSiteMetadataManager *)v11 registerSiteMetadataProvider:v11->_savedAccountTouchIconCache];
    if ((v6 & 8) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0)
      {
LABEL_13:
        v24 = v11;
        goto LABEL_14;
      }
LABEL_12:
      id v18 = objc_alloc(MEMORY[0x1E4F98BE8]);
      v19 = (void *)MEMORY[0x1E4F1CB10];
      v20 = _SFSafariMetadataCacheDirectoryPath();
      v21 = [v19 fileURLWithPath:v20 isDirectory:1];
      uint64_t v22 = [v18 initWithCacheDirectoryURL:v21];
      linkPresentationMetadataProvider = v11->_linkPresentationMetadataProvider;
      v11->_linkPresentationMetadataProvider = (WBSLPLinkMetadataProvider *)v22;

      [(WBSSiteMetadataManager *)v11 registerSiteMetadataProvider:v11->_linkPresentationMetadataProvider];
      goto LABEL_13;
    }
LABEL_19:
    v42 = [v16 URLByAppendingPathComponent:@"Favicons" isDirectory:1];
    v43 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v43 scale];
    double v45 = v44;

    v46 = [_SFFaviconProvider alloc];
    [MEMORY[0x1E4F98AE0] defaultFaviconSize];
    double v48 = v47;
    double v50 = v49;
    v51 = [NSNumber numberWithDouble:v45];
    v64[0] = v51;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:1];
    uint64_t v56 = MEMORY[0x1E4F143A8];
    uint64_t v57 = 3221225472;
    v58 = __104___SFSiteMetadataManager_initWithInjectedBundleURL_imageCacheDirectoryURL_cacheIsReadOnly_metadataType___block_invoke;
    v59 = &unk_1E54EC628;
    id v60 = v42;
    id v53 = v42;
    uint64_t v54 = [(_SFFaviconProvider *)v46 initWithPersistenceBaseURL:v53, @"Favicons", v52, v7, &v56, v48, v50, v45 persistenceName preferredIconSize atScale allScales isReadOnly shouldCheckIntegrityWhenOpeningDatabaseBlock];
    faviconProvider = v11->_faviconProvider;
    v11->_faviconProvider = (_SFFaviconProvider *)v54;

    -[WBSFaviconProvider setUpWithCompletionHandler:](v11->_faviconProvider, "setUpWithCompletionHandler:", 0, v56, v57, v58, v59);
    [(WBSSiteMetadataManager *)v11 registerSiteMetadataProvider:v11->_faviconProvider];

    if ((v6 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_14:

  return v11;
}

- (WBSTabGroupTouchIconProvider)tabGroupIconProvider
{
  return self->_tabGroupIconProvider;
}

+ (void)setSharedSiteMetadataManager:(id)a3
{
}

- (void)scheduleLowPriorityRequestForBookmarks:(id)a3
{
  objc_msgSend(a3, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_42);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if ([v4 count]) {
    [(WBSSiteMetadataManager *)self preloadRequests:v4 withPriority:0 responseHandler:0];
  }
}

+ (void)setSharedSiteMetadataManagerProvider:(id)a3
{
}

+ (BOOL)hasSharedSiteMetadataManager
{
  return sharedSiteMetadataManager != 0;
}

- (_SFFaviconProvider)faviconProvider
{
  return self->_faviconProvider;
}

- (_SFSavedAccountTouchIconCache)savedAccountTouchIconCache
{
  return self->_savedAccountTouchIconCache;
}

- (_SFTouchIconCache)touchIconCache
{
  return self->_touchIconCache;
}

- (WBSLeadImageCache)leadImageCache
{
  return self->_leadImageCache;
}

- (WBSLinkPresentationIconCache)linkPresentationIconCache
{
  return self->_linkPresentationIconCache;
}

- (WBSLPLinkMetadataProvider)linkPresentationMetadataProvider
{
  return self->_linkPresentationMetadataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkPresentationMetadataProvider, 0);
  objc_storeStrong((id *)&self->_linkPresentationIconCache, 0);
  objc_storeStrong((id *)&self->_leadImageCache, 0);
  objc_storeStrong((id *)&self->_touchIconCache, 0);
  objc_storeStrong((id *)&self->_savedAccountTouchIconCache, 0);
  objc_storeStrong((id *)&self->_faviconProvider, 0);

  objc_storeStrong((id *)&self->_tabGroupIconProvider, 0);
}

@end