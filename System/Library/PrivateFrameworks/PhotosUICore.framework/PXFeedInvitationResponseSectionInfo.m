@interface PXFeedInvitationResponseSectionInfo
- (id)assets;
- (int64_t)sectionType;
- (int64_t)typeForItemAtIndex:(int64_t)a3;
- (void)updateFromCloudFeedEntry;
@end

@implementation PXFeedInvitationResponseSectionInfo

- (id)assets
{
  v2 = [(PXFeedSectionInfo *)self sharedAlbum];
  v3 = [v2 assets];

  return v3;
}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 3;
}

- (void)updateFromCloudFeedEntry
{
  v38.receiver = self;
  v38.super_class = (Class)PXFeedInvitationResponseSectionInfo;
  [(PXFeedSectionInfo *)&v38 updateFromCloudFeedEntry];
  v3 = [(PXFeedSectionInfo *)self cloudFeedEntry];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__225660;
  v36 = __Block_byref_object_dispose__225661;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__225660;
  v30 = __Block_byref_object_dispose__225661;
  id v31 = 0;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__225660;
  v24 = __Block_byref_object_dispose__225661;
  id v25 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 1;
  v4 = [(PXFeedSectionInfo *)self photoLibrary];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  v8 = __63__PXFeedInvitationResponseSectionInfo_updateFromCloudFeedEntry__block_invoke;
  v9 = &unk_1E5DC6F98;
  id v5 = v3;
  id v10 = v5;
  v11 = self;
  v12 = &v20;
  v13 = &v32;
  v14 = &v26;
  v15 = &v16;
  [v4 performBlockAndWait:&v6];

  -[PXFeedSectionInfo setNumberOfItems:](self, "setNumberOfItems:", v17[3], v6, v7, v8, v9);
  [(PXFeedSectionInfo *)self setSharedAlbum:v33[5]];
  [(PXFeedSectionInfo *)self setAlbumTitle:v27[5]];
  [(PXFeedSectionInfo *)self setInvitationRecord:v21[5]];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

void __63__PXFeedInvitationResponseSectionInfo_updateFromCloudFeedEntry__block_invoke(uint64_t a1)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) entryInvitationRecordGUID];
  v3 = (void *)MEMORY[0x1E4F8A728];
  v16[0] = v2;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  id v5 = [*(id *)(a1 + 40) photoLibrary];
  uint64_t v6 = [v3 cloudSharedAlbumInvitationRecordsWithGUIDs:v4 inLibrary:v5];
  uint64_t v7 = [v6 firstObject];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) album];
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) localizedTitle];
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    NSLog(&cfstr_NoInvitationRe.isa, *(void *)(a1 + 40), *(void *)(a1 + 32));
  }
}

- (int64_t)sectionType
{
  return 4;
}

@end