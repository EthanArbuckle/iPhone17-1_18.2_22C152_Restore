@interface PXFeedSectionInfo
+ (id)sectionInfoWithCloudFeedEntry:(id)a3;
+ (void)beginCachingSharedAlbumsByGUIDs;
+ (void)endCachingSharedAlbumsByGUIDs;
- (BOOL)areAllAssetsLiked;
- (BOOL)canPerformEditOperation:(unint64_t)a3;
- (BOOL)canShowAvalancheStacks;
- (BOOL)canShowComments;
- (BOOL)containsAsset:(id)a3;
- (BOOL)hasMultipleAssetsForItemAtIndex:(int64_t)a3;
- (BOOL)hasPlayableAssetForItemAtIndex:(int64_t)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLoaded;
- (BOOL)isMine;
- (BOOL)shouldBeVisibleWhenEmpty;
- (NSArray)localizedLocationNames;
- (NSCountedSet)countsByAssetDisplayType;
- (NSDate)date;
- (NSIndexSet)excludedAssetIndexes;
- (NSOrderedSet)assets;
- (NSString)albumTitle;
- (NSString)localizedTitle;
- (NSString)title;
- (NSString)transientIdentifier;
- (NSString)uuid;
- (PLCloudFeedEntry)cloudFeedEntry;
- (PLCloudSharedAlbumInvitationRecord)invitationRecord;
- (PLCloudSharedAlbumProtocol)sharedAlbum;
- (PLPhotoLibrary)photoLibrary;
- (PXFeedSectionInfo)initWithCloudFeedEntry:(id)a3;
- (id)assetForItemAtIndex:(int64_t)a3;
- (id)assetsForItemAtIndex:(int64_t)a3 maximumCount:(int64_t)a4;
- (id)batchIDForItemAtIndex:(int64_t)a3;
- (id)captionForItemAtIndex:(int64_t)a3;
- (id)commentForItemAtIndex:(int64_t)a3;
- (id)commentTextForItemAtIndex:(int64_t)a3;
- (id)commentsForItemAtIndex:(int64_t)a3;
- (id)likesForItemAtIndex:(int64_t)a3;
- (id)sharedAlbumWithGUID:(id)a3;
- (int64_t)_inboxModelTypeForCloudCommentType;
- (int64_t)cachedInboxModelType;
- (int64_t)inboxModelType;
- (int64_t)indexOfFirstItemFromLastBatch;
- (int64_t)indexOfItemWithAsset:(id)a3;
- (int64_t)indexOfItemWithComment:(id)a3;
- (int64_t)numberOfItems;
- (int64_t)sectionType;
- (int64_t)typeForItemAtIndex:(int64_t)a3;
- (unint64_t)assetsCount;
- (unint64_t)photosCount;
- (unint64_t)videosCount;
- (void)getCommentCount:(unint64_t *)a3 likeCount:(unint64_t *)a4;
- (void)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4;
- (void)reload;
- (void)setAlbumTitle:(id)a3;
- (void)setCachedInboxModelType:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setExcludedAssetIndexes:(id)a3;
- (void)setInvitationRecord:(id)a3;
- (void)setLoaded:(BOOL)a3;
- (void)setNumberOfItems:(int64_t)a3;
- (void)setSharedAlbum:(id)a3;
- (void)setShouldBeVisibleWhenEmpty:(BOOL)a3;
- (void)updateFromCloudFeedEntry;
@end

@implementation PXFeedSectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedAssetIndexes, 0);
  objc_storeStrong((id *)&self->_invitationRecord, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_sharedAlbum, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_cloudFeedEntry, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
}

- (void)setCachedInboxModelType:(int64_t)a3
{
  self->_cachedInboxModelType = a3;
}

- (int64_t)cachedInboxModelType
{
  return self->_cachedInboxModelType;
}

- (void)setExcludedAssetIndexes:(id)a3
{
}

- (NSIndexSet)excludedAssetIndexes
{
  return self->_excludedAssetIndexes;
}

- (void)setShouldBeVisibleWhenEmpty:(BOOL)a3
{
  self->_shouldBeVisibleWhenEmpty = a3;
}

- (BOOL)shouldBeVisibleWhenEmpty
{
  return self->_shouldBeVisibleWhenEmpty;
}

- (void)setNumberOfItems:(int64_t)a3
{
  self->_numberOfItems = a3;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (void)setInvitationRecord:(id)a3
{
}

- (PLCloudSharedAlbumInvitationRecord)invitationRecord
{
  return self->_invitationRecord;
}

- (void)setAlbumTitle:(id)a3
{
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setSharedAlbum:(id)a3
{
}

- (PLCloudSharedAlbumProtocol)sharedAlbum
{
  return self->_sharedAlbum;
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (BOOL)isLoaded
{
  return self->_loaded;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (PLCloudFeedEntry)cloudFeedEntry
{
  return self->_cloudFeedEntry;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PXFeedSectionInfo *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(PXFeedSectionInfo *)self uuid];
      v7 = [(PXFeedSectionInfo *)v5 uuid];

      char v8 = [v6 isEqualToString:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (NSString)transientIdentifier
{
  transientIdentifier = self->_transientIdentifier;
  if (!transientIdentifier)
  {
    v4 = objc_opt_new();
    v5 = [v4 UUIDString];
    v6 = self->_transientIdentifier;
    self->_transientIdentifier = v5;

    transientIdentifier = self->_transientIdentifier;
  }
  return transientIdentifier;
}

- (id)sharedAlbumWithGUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)cacheOfSharedAlbumsByGUIDs objectForKey:v4];
  v6 = (void *)v5;
  if (v4 && !v5)
  {
    v7 = (void *)MEMORY[0x1E4F8A720];
    char v8 = [(PXFeedSectionInfo *)self photoLibrary];
    v6 = [v7 cloudSharedAlbumWithGUID:v4 inLibrary:v8];

    if (!v6)
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
    }
    [(id)cacheOfSharedAlbumsByGUIDs setObject:v6 forKey:v4];
  }
  v9 = [MEMORY[0x1E4F1CA98] null];

  if (v6 == v9)
  {

    v6 = 0;
  }

  return v6;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (BOOL)canShowAvalancheStacks
{
  return 0;
}

- (BOOL)canShowComments
{
  return 1;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = [(PXFeedSectionInfo *)self sharedAlbum];
  v6 = [(PXFeedSectionInfo *)self photoLibrary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__PXFeedSectionInfo_canPerformEditOperation___block_invoke;
  v9[3] = &unk_1E5DCDEC8;
  v11 = &v13;
  id v7 = v5;
  id v10 = v7;
  unint64_t v12 = a3;
  [v6 performBlockAndWait:v9];

  LOBYTE(a3) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return a3;
}

uint64_t __45__PXFeedSectionInfo_canPerformEditOperation___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) canPerformEditOperation:*(void *)(a1 + 48)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isMine
{
  return 0;
}

- (BOOL)isEmpty
{
  return [(PXFeedSectionInfo *)self numberOfItems] == 0;
}

- (unint64_t)videosCount
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedSectionInfo.m", 360, @"%s not implemented yet", "-[PXFeedSectionInfo videosCount]");

  return 0;
}

- (unint64_t)photosCount
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFeedSectionInfo.m", 355, @"%s not implemented yet", "-[PXFeedSectionInfo photosCount]");

  return 0;
}

- (unint64_t)assetsCount
{
  return 0;
}

- (NSString)localizedTitle
{
  v3 = [(PXFeedSectionInfo *)self sharedAlbum];
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__48840;
  uint64_t v15 = __Block_byref_object_dispose__48841;
  id v16 = 0;
  id v4 = [(PXFeedSectionInfo *)self photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__PXFeedSectionInfo_localizedTitle__block_invoke;
  v8[3] = &unk_1E5DD0588;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 performBlockAndWait:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

void __35__PXFeedSectionInfo_localizedTitle__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localizedTitle];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSOrderedSet)assets
{
  return 0;
}

- (NSString)title
{
  uint64_t v3 = [(PXFeedSectionInfo *)self sharedAlbum];
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__48840;
  uint64_t v15 = __Block_byref_object_dispose__48841;
  id v16 = 0;
  id v4 = [(PXFeedSectionInfo *)self photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26__PXFeedSectionInfo_title__block_invoke;
  v8[3] = &unk_1E5DD0588;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  [v4 performBlockAndWait:v8];

  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

void __26__PXFeedSectionInfo_title__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) title];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSString)uuid
{
  uint64_t v2 = [(PXFeedSectionInfo *)self cloudFeedEntry];
  uint64_t v3 = [v2 objectID];
  id v4 = [v3 URIRepresentation];
  id v5 = [v4 absoluteString];

  return (NSString *)v5;
}

- (int64_t)_inboxModelTypeForCloudCommentType
{
  int64_t v3 = [(PXFeedSectionInfo *)self numberOfItems];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  id v4 = [(PXFeedSectionInfo *)self photoLibrary];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __55__PXFeedSectionInfo__inboxModelTypeForCloudCommentType__block_invoke;
  v20[3] = &unk_1E5DCCCF8;
  v20[4] = self;
  v20[5] = &v25;
  v20[6] = &v21;
  v20[7] = v3;
  [v4 performBlockAndWait:v20];

  unint64_t v5 = v26[3];
  BOOL v6 = v5 == 0;
  uint64_t v7 = v22[3];
  BOOL v8 = v5 > 1;
  BOOL v9 = v5 == 1;
  int v10 = v8;
  BOOL v11 = v7 == 0;
  if (!v7) {
    BOOL v6 = 0;
  }
  BOOL v12 = v7 == 0;
  if (v11) {
    char v13 = 0;
  }
  else {
    char v13 = v10;
  }
  int v14 = v10 & v12;
  BOOL v11 = v14 == 0;
  char v15 = v6 | v14 | v13;
  uint64_t v16 = 7;
  if (v11) {
    uint64_t v16 = 8;
  }
  BOOL v11 = !v6;
  uint64_t v17 = 2;
  if (v11) {
    uint64_t v17 = v16;
  }
  if (v15) {
    int64_t v18 = v17;
  }
  else {
    int64_t v18 = v9;
  }
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  return v18;
}

void __55__PXFeedSectionInfo__inboxModelTypeForCloudCommentType__block_invoke(uint64_t a1)
{
  if (*(uint64_t *)(a1 + 56) >= 1)
  {
    uint64_t v2 = 0;
    while (1)
    {
      uint64_t v3 = [*(id *)(a1 + 32) typeForItemAtIndex:v2];
      if (v3 == 2) {
        break;
      }
      if (v3 == 1)
      {
        id v4 = [*(id *)(a1 + 32) commentForItemAtIndex:v2];
        unint64_t v5 = [v4 isMyComment];
        char v6 = [v5 BOOLValue];

        if ((v6 & 1) == 0) {
          ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        }
        goto LABEL_8;
      }
LABEL_9:
      if (++v2 >= *(void *)(a1 + 56)) {
        return;
      }
    }
    id v4 = [*(id *)(a1 + 32) cloudFeedEntry];
    uint64_t v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"isMyComment == NO AND cloudFeedLikeCommentEntry == %@", v4];
    BOOL v8 = (void *)MEMORY[0x1E4F1C0D0];
    BOOL v9 = [MEMORY[0x1E4F8A730] entityName];
    int v10 = [v8 fetchRequestWithEntityName:v9];

    [v10 setFetchLimit:1];
    [v10 setPredicate:v7];
    [v10 setResultType:4];
    [v10 setIncludesPropertyValues:0];
    BOOL v11 = [*(id *)(a1 + 32) photoLibrary];
    BOOL v12 = [v11 managedObjectContext];

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v12 countForFetchRequest:v10 error:0];
LABEL_8:

    goto LABEL_9;
  }
}

- (int64_t)inboxModelType
{
  int64_t v3 = [(PXFeedSectionInfo *)self cachedInboxModelType];
  if (!v3)
  {
    int64_t v3 = 0;
    switch([(PXFeedSectionInfo *)self sectionType])
    {
      case 0:
        int64_t v3 = 3;
        break;
      case 1:
        int64_t v3 = [(PXFeedSectionInfo *)self _inboxModelTypeForCloudCommentType];
        break;
      case 2:
        int64_t v3 = 6;
        break;
      case 3:
      case 5:
        break;
      case 4:
        *(void *)buf = 0;
        BOOL v9 = buf;
        uint64_t v10 = 0x2020000000;
        int v11 = 0;
        unint64_t v5 = [(PXFeedSectionInfo *)self photoLibrary];
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __35__PXFeedSectionInfo_inboxModelType__block_invoke;
        v7[3] = &unk_1E5DD0588;
        v7[4] = self;
        v7[5] = buf;
        [v5 performBlockAndWait:v7];

        if (*((_DWORD *)v9 + 6) == 2) {
          int64_t v3 = 4;
        }
        else {
          int64_t v3 = 5;
        }
        _Block_object_dispose(buf, 8);
        break;
      default:
        id v4 = PLUIGetLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEBUG, "Invalid section type", buf, 2u);
        }

        int64_t v3 = 0;
        break;
    }
    [(PXFeedSectionInfo *)self setCachedInboxModelType:v3];
  }
  return v3;
}

void __35__PXFeedSectionInfo_inboxModelType__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) invitationRecord];
  uint64_t v2 = [v3 invitationState];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 intValue];
}

- (int64_t)indexOfItemWithComment:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)indexOfItemWithAsset:(id)a3
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsAsset:(id)a3
{
  return 0;
}

- (BOOL)areAllAssetsLiked
{
  return 0;
}

- (NSCountedSet)countsByAssetDisplayType
{
  return 0;
}

- (void)getCommentCount:(unint64_t *)a3 likeCount:(unint64_t *)a4
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
}

- (void)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
}

- (id)likesForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)commentsForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)commentTextForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)commentForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)indexOfFirstItemFromLastBatch
{
  return 0;
}

- (id)batchIDForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)captionForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)assetsForItemAtIndex:(int64_t)a3 maximumCount:(int64_t)a4
{
  return 0;
}

- (BOOL)hasPlayableAssetForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (BOOL)hasMultipleAssetsForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (id)assetForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (void)updateFromCloudFeedEntry
{
  id v3 = [(PXFeedSectionInfo *)self cloudFeedEntry];
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x3032000000;
  char v15 = __Block_byref_object_copy__48840;
  uint64_t v16 = __Block_byref_object_dispose__48841;
  id v17 = 0;
  id v4 = [(PXFeedSectionInfo *)self photoLibrary];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  BOOL v8 = __45__PXFeedSectionInfo_updateFromCloudFeedEntry__block_invoke;
  BOOL v9 = &unk_1E5DD0588;
  int v11 = &v12;
  id v5 = v3;
  id v10 = v5;
  [v4 performBlockAndWait:&v6];

  -[PXFeedSectionInfo setDate:](self, "setDate:", v13[5], v6, v7, v8, v9);
  _Block_object_dispose(&v12, 8);
}

void __45__PXFeedSectionInfo_updateFromCloudFeedEntry__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entryDate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)reload
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:self file:@"PXFeedSectionInfo.m" lineNumber:93 description:@"Attempted to reload PXFeedSectionInfo on background thread!"];
  }
  [(PXFeedSectionInfo *)self updateFromCloudFeedEntry];
  [(PXFeedSectionInfo *)self setLoaded:1];
  [(PXFeedSectionInfo *)self setCachedInboxModelType:0];
  [(PXFeedSectionInfo *)self inboxModelType];
}

- (PLPhotoLibrary)photoLibrary
{
  uint64_t v2 = [(PXFeedSectionInfo *)self cloudFeedEntry];
  uint64_t v3 = [v2 photoLibrary];

  return (PLPhotoLibrary *)v3;
}

- (PXFeedSectionInfo)initWithCloudFeedEntry:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFeedSectionInfo;
  uint64_t v6 = [(PXFeedSectionInfo *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_cloudFeedEntry, a3);
  }

  return v7;
}

+ (void)endCachingSharedAlbumsByGUIDs
{
  if (!--sharedAlbumsCacheRequestCount)
  {
    uint64_t v2 = (void *)cacheOfSharedAlbumsByGUIDs;
    cacheOfSharedAlbumsByGUIDs = 0;
  }
}

+ (void)beginCachingSharedAlbumsByGUIDs
{
  if (!sharedAlbumsCacheRequestCount++)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1C998]);
    id v4 = (void *)cacheOfSharedAlbumsByGUIDs;
    cacheOfSharedAlbumsByGUIDs = (uint64_t)v3;
  }
}

+ (id)sectionInfoWithCloudFeedEntry:(id)a3
{
  id v5 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  uint64_t v6 = [v5 photoLibrary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PXFeedSectionInfo_sectionInfoWithCloudFeedEntry___block_invoke;
  v12[3] = &unk_1E5DD0588;
  uint64_t v14 = &v15;
  id v7 = v5;
  id v13 = v7;
  [v6 performBlockAndWait:v12];

  switch(v16[3])
  {
    case 0:
      int v11 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"PXFeedSectionInfo.m", 72, @"%s: Unknown entry type", "+[PXFeedSectionInfo sectionInfoWithCloudFeedEntry:]");

      abort();
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      BOOL v8 = (objc_class *)objc_opt_class();
      break;
    default:
      BOOL v8 = 0;
      break;
  }
  objc_super v9 = (void *)[[v8 alloc] initWithCloudFeedEntry:v7];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __51__PXFeedSectionInfo_sectionInfoWithCloudFeedEntry___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) entryType];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end