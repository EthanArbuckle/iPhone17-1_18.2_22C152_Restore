@interface PXFeedCommentsSectionInfo
- (BOOL)_hasLikes;
- (BOOL)containsAsset:(id)a3;
- (BOOL)hasMultipleAssetsForItemAtIndex:(int64_t)a3;
- (BOOL)isMine;
- (id)assetForItemAtIndex:(int64_t)a3;
- (id)assets;
- (id)assetsForItemAtIndex:(int64_t)a3 maximumCount:(int64_t)a4;
- (id)cloudFeedCommentsEntry;
- (id)commentForItemAtIndex:(int64_t)a3;
- (id)commentTextForItemAtIndex:(int64_t)a3;
- (id)likesForItemAtIndex:(int64_t)a3;
- (int64_t)indexOfItemWithAsset:(id)a3;
- (int64_t)indexOfItemWithComment:(id)a3;
- (int64_t)sectionType;
- (int64_t)typeForItemAtIndex:(int64_t)a3;
- (unint64_t)assetsCount;
- (void)_setHasLikes:(BOOL)a3;
- (void)getCommentCount:(unint64_t *)a3 likeCount:(unint64_t *)a4;
- (void)updateFromCloudFeedEntry;
@end

@implementation PXFeedCommentsSectionInfo

- (void)_setHasLikes:(BOOL)a3
{
  self->__hasLikes = a3;
}

- (BOOL)_hasLikes
{
  return self->__hasLikes;
}

- (BOOL)isMine
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 1;
  v3 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
  v4 = [(PXFeedSectionInfo *)self photoLibrary];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__PXFeedCommentsSectionInfo_isMine__block_invoke;
  v7[3] = &unk_1E5DD0588;
  id v5 = v3;
  id v8 = v5;
  v9 = &v10;
  [v4 performBlockAndWait:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v4;
}

void __35__PXFeedCommentsSectionInfo_isMine__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) entryComments];
  v3 = (void *)[v2 mutableCopy];

  v4 = [*(id *)(a1 + 32) entryLikeComments];
  [v3 unionOrderedSet:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "isMyComment", (void)v12);
        char v11 = [v10 BOOLValue];

        if ((v11 & 1) == 0)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (unint64_t)assetsCount
{
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v3 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
  v4 = [(PXFeedSectionInfo *)self photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__PXFeedCommentsSectionInfo_assetsCount__block_invoke;
  v8[3] = &unk_1E5DD0588;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = &v11;
  [v4 performBlockAndWait:v8];

  unint64_t v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

void __40__PXFeedCommentsSectionInfo_assetsCount__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) entryCloudAssetGUID];

  if (v2)
  {
    uint64_t v3 = 1;
  }
  else
  {
    v4 = [*(id *)(a1 + 32) entryLikeComments];
    uint64_t v3 = [v4 count];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (id)assets
{
  if ([(PXFeedCommentsSectionInfo *)self hasMultipleAssetsForItemAtIndex:0])
  {
    uint64_t v3 = [(PXFeedCommentsSectionInfo *)self assetsForItemAtIndex:0 maximumCount:0x7FFFFFFFFFFFFFFFLL];
  }
  else
  {
    v4 = [(PXFeedCommentsSectionInfo *)self assetForItemAtIndex:0];
    uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CAA0], "orderedSetWithObjects:", v4, 0);
  }
  return v3;
}

- (int64_t)indexOfItemWithComment:(id)a3
{
  id v4 = a3;
  if ([(PXFeedSectionInfo *)self numberOfItems] < 1)
  {
    int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    id v5 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
    if ([v4 isLikeBoolValue])
    {
      unint64_t v6 = [v5 entryLikeComments];
      int v7 = [v6 containsObject:v4];

      if (v7) {
        int64_t v8 = 0;
      }
      else {
        int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      id v9 = [v5 entryComments];
      uint64_t v10 = [v9 indexOfObject:v4];

      int64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v8 = v10 + [(PXFeedCommentsSectionInfo *)self _hasLikes];
      }
    }
  }
  return v8;
}

- (int64_t)indexOfItemWithAsset:(id)a3
{
  id v4 = a3;
  int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(PXFeedSectionInfo *)self numberOfItems] >= 1
    && [(PXFeedCommentsSectionInfo *)self containsAsset:v4])
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (BOOL)containsAsset:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  unint64_t v6 = [(PXFeedSectionInfo *)self photoLibrary];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__PXFeedCommentsSectionInfo_containsAsset___block_invoke;
  v10[3] = &unk_1E5DCA7A8;
  id v7 = v5;
  id v11 = v7;
  uint64_t v14 = &v15;
  id v8 = v4;
  id v12 = v8;
  uint64_t v13 = self;
  [v6 performBlockAndWait:v10];

  LOBYTE(self) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)self;
}

void __43__PXFeedCommentsSectionInfo_containsAsset___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) entryCloudAssetGUID];
  v2 = [*(id *)(a1 + 40) cloudAssetGUID];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 isEqualToString:v4];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    && [*(id *)(a1 + 48) hasMultipleAssetsForItemAtIndex:0])
  {
    uint64_t v3 = [*(id *)(a1 + 48) assetsForItemAtIndex:0 maximumCount:0x7FFFFFFFFFFFFFFFLL];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 containsObject:*(void *)(a1 + 40)];
  }
}

- (void)getCommentCount:(unint64_t *)a3 likeCount:(unint64_t *)a4
{
  if (![(PXFeedSectionInfo *)self isLoaded])
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PXFeedCommentsSectionInfo.m" lineNumber:156 description:@"section info should be loaded at this point"];
  }
  id v8 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  id v9 = [(PXFeedSectionInfo *)self photoLibrary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PXFeedCommentsSectionInfo_getCommentCount_likeCount___block_invoke;
  v12[3] = &unk_1E5DCCE38;
  uint64_t v14 = &v20;
  id v10 = v8;
  id v13 = v10;
  uint64_t v15 = &v16;
  [v9 performBlockAndWait:v12];

  if (a3) {
    *a3 = v21[3];
  }
  if (a4) {
    *a4 = v17[3];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
}

void __55__PXFeedCommentsSectionInfo_getCommentCount_likeCount___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) entryComments];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];

  id v3 = [*(id *)(a1 + 32) entryLikeComments];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 count];
}

- (id)likesForItemAtIndex:(int64_t)a3
{
  id v4 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__8861;
  uint64_t v16 = __Block_byref_object_dispose__8862;
  id v17 = 0;
  int64_t v5 = [(PXFeedSectionInfo *)self photoLibrary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PXFeedCommentsSectionInfo_likesForItemAtIndex___block_invoke;
  v9[3] = &unk_1E5DD0588;
  id v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__PXFeedCommentsSectionInfo_likesForItemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entryLikeComments];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)commentTextForItemAtIndex:(int64_t)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__8861;
  id v13 = __Block_byref_object_dispose__8862;
  id v14 = 0;
  int64_t v5 = [(PXFeedSectionInfo *)self photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PXFeedCommentsSectionInfo_commentTextForItemAtIndex___block_invoke;
  v8[3] = &unk_1E5DCDEC8;
  v8[5] = &v9;
  v8[6] = a3;
  void v8[4] = self;
  [v5 performBlockAndWait:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __55__PXFeedCommentsSectionInfo_commentTextForItemAtIndex___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) commentForItemAtIndex:*(void *)(a1 + 48)];
  uint64_t v2 = [v5 commentText];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)commentForItemAtIndex:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
  unint64_t v6 = a3 - [(PXFeedCommentsSectionInfo *)self _hasLikes];
  id v7 = [v5 entryComments];
  id v8 = v7;
  if ((v6 & 0x8000000000000000) != 0 || v6 >= [v7 count])
  {
    id v10 = PLUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218496;
      unint64_t v13 = v6;
      __int16 v14 = 2048;
      int64_t v15 = a3;
      __int16 v16 = 1024;
      BOOL v17 = [(PXFeedCommentsSectionInfo *)self _hasLikes];
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Attempting to get a comment at invalid index [%ld] from original index [%ld] due to _hasLikes=[%d]", (uint8_t *)&v12, 0x1Cu);
    }

    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [v8 objectAtIndex:v6];
  }

  return v9;
}

- (id)assetsForItemAtIndex:(int64_t)a3 maximumCount:(int64_t)a4
{
  unint64_t v6 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__8861;
  uint64_t v19 = __Block_byref_object_dispose__8862;
  id v20 = 0;
  id v7 = [(PXFeedSectionInfo *)self photoLibrary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__PXFeedCommentsSectionInfo_assetsForItemAtIndex_maximumCount___block_invoke;
  v11[3] = &unk_1E5DCDEC8;
  id v8 = v6;
  id v12 = v8;
  unint64_t v13 = &v15;
  int64_t v14 = a4;
  [v7 performBlockAndWait:v11];

  id v9 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v9;
}

void __63__PXFeedCommentsSectionInfo_assetsForItemAtIndex_maximumCount___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) entryLikeComments];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA70];
  unint64_t v4 = *(void *)(a1 + 48);
  unint64_t v5 = [v2 count];
  if (v4 >= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  uint64_t v7 = [v3 orderedSetWithCapacity:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v2;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "asset", (void)v19);
        if (v15)
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v15];
          if ((unint64_t)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count] >= *(void *)(a1 + 48))
          {

            goto LABEL_15;
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    __int16 v16 = [*(id *)(a1 + 32) entryComments];
    uint64_t v17 = [v16 firstObject];

    uint64_t v18 = [v17 asset];
    if (v18) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v18];
    }
  }
}

- (BOOL)hasMultipleAssetsForItemAtIndex:(int64_t)a3
{
  unint64_t v4 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  unint64_t v5 = [(PXFeedSectionInfo *)self photoLibrary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PXFeedCommentsSectionInfo_hasMultipleAssetsForItemAtIndex___block_invoke;
  v8[3] = &unk_1E5DD0588;
  id v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 performBlockAndWait:v8];

  LOBYTE(v5) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __61__PXFeedCommentsSectionInfo_hasMultipleAssetsForItemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entryCloudAssetGUID];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == 0;
}

- (id)assetForItemAtIndex:(int64_t)a3
{
  unint64_t v4 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__8861;
  __int16 v16 = __Block_byref_object_dispose__8862;
  id v17 = 0;
  unint64_t v5 = [(PXFeedSectionInfo *)self photoLibrary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__PXFeedCommentsSectionInfo_assetForItemAtIndex___block_invoke;
  v9[3] = &unk_1E5DD0588;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 performBlockAndWait:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__PXFeedCommentsSectionInfo_assetForItemAtIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entryLikeComments];
  uint64_t v3 = [v2 firstObject];
  unint64_t v4 = v3;
  if (v3)
  {
    id v9 = v3;
  }
  else
  {
    unint64_t v5 = [*(id *)(a1 + 32) entryComments];
    id v9 = [v5 firstObject];
  }
  uint64_t v6 = [v9 asset];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  if (((a3 == 0) & [(PXFeedCommentsSectionInfo *)self _hasLikes]) != 0) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void)updateFromCloudFeedEntry
{
  v29.receiver = self;
  v29.super_class = (Class)PXFeedCommentsSectionInfo;
  [(PXFeedSectionInfo *)&v29 updateFromCloudFeedEntry];
  uint64_t v3 = [(PXFeedCommentsSectionInfo *)self cloudFeedCommentsEntry];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__8861;
  long long v19 = __Block_byref_object_dispose__8862;
  id v20 = 0;
  unint64_t v4 = [(PXFeedSectionInfo *)self photoLibrary];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__PXFeedCommentsSectionInfo_updateFromCloudFeedEntry__block_invoke;
  v9[3] = &unk_1E5DB1118;
  uint64_t v12 = &v25;
  id v5 = v3;
  uint64_t v13 = &v21;
  uint64_t v14 = &v15;
  id v10 = v5;
  uint64_t v11 = self;
  [v4 performBlockAndWait:v9];

  uint64_t v6 = v26[3];
  uint64_t v7 = v22[3];
  if (v6 >= 1) {
    v22[3] = ++v7;
  }
  [(PXFeedSectionInfo *)self setNumberOfItems:v7];
  [(PXFeedSectionInfo *)self setSharedAlbum:v16[5]];
  uint64_t v8 = [(id)v16[5] localizedTitle];
  [(PXFeedSectionInfo *)self setAlbumTitle:v8];

  [(PXFeedCommentsSectionInfo *)self _setHasLikes:v6 > 0];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

void __53__PXFeedCommentsSectionInfo_updateFromCloudFeedEntry__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) entryLikeComments];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 count];

  uint64_t v3 = [*(id *)(a1 + 32) entryComments];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v3 count];

  id v7 = [*(id *)(a1 + 32) entryAlbumGUID];
  uint64_t v4 = [*(id *)(a1 + 40) sharedAlbumWithGUID:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)cloudFeedCommentsEntry
{
  uint64_t v4 = [(PXFeedSectionInfo *)self cloudFeedEntry];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXFeedCommentsSectionInfo.m" lineNumber:34 description:@"unexpected cloud feed entry class"];
  }
  return v4;
}

- (int64_t)sectionType
{
  return 1;
}

@end