@interface PXCMMPublishToSharedStreamActionPerformer
- (void)performBackgroundTask;
@end

@implementation PXCMMPublishToSharedStreamActionPerformer

- (void)performBackgroundTask
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v3 = [(PXCMMActionPerformer *)self session];
  uint64_t v4 = [v3 sourceType];

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "px_errorWithDomain:code:debugDescription:", @"PXCMMErrorDomain", -1006, @"Publish to shared streams is only supported from Photos");
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    [(PXActionPerformer *)self completeBackgroundTaskWithSuccess:0 error:v34];
  }
  else
  {
    v5 = [(PXCMMActionPerformer *)self session];
    v6 = [v5 viewModel];
    v7 = [v6 selectionManager];
    v8 = [v7 selectionSnapshot];

    v9 = [v8 dataSource];
    uint64_t v10 = [v9 totalNumberOfItems];

    v11 = [v8 selectedIndexPaths];
    uint64_t v12 = [v11 count];

    v13 = PLSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v12;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      _os_log_impl(&dword_1A9AE7000, v13, OS_LOG_TYPE_DEFAULT, "Publishing to shared stream with %lu assets selected out of %lu", buf, 0x16u);
    }

    v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
    if (v8)
    {
      v15 = [v8 dataSource];
      v16 = [v8 selectedIndexPaths];
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke;
      v51[3] = &unk_1E5DCA3B8;
      id v52 = v14;
      id v17 = v15;
      id v53 = v17;
      [v16 enumerateItemIndexPathsUsingBlock:v51];

      long long v49 = xmmword_1AB359AA0;
      uint64_t v48 = [v17 identifier];
      uint64_t v50 = 0x7FFFFFFFFFFFFFFFLL;
      v18 = [v17 assetCollectionAtSectionIndexPath:&v48];
      if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v19 = [v18 localizedTitle];
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
    v20 = NSString;
    v21 = [MEMORY[0x1E4F29128] UUID];
    v22 = [v21 UUIDString];
    v23 = [v22 substringToIndex:4];
    v24 = [v20 stringWithFormat:@"CMM-Test-%@", v23];

    if (v19)
    {
      uint64_t v25 = [v24 stringByAppendingString:v19];

      v24 = (void *)v25;
    }
    v26 = [MEMORY[0x1E4F8AA78] cloudSharingPhotoLibrary];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v55 = __Block_byref_object_copy__175336;
    v56 = __Block_byref_object_dispose__175337;
    id v57 = 0;
    v27 = [(PXCMMActionPerformer *)self session];
    v28 = [v27 viewModel];
    v29 = [v28 recipients];

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke_202;
    v43[3] = &unk_1E5DCA7A8;
    v47 = buf;
    id v44 = v24;
    id v30 = v26;
    id v45 = v30;
    id v31 = v29;
    id v46 = v31;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke_2;
    v35[3] = &unk_1E5DC1FF8;
    id v32 = v14;
    id v36 = v32;
    long long v37 = 0u;
    long long v38 = 0u;
    char v42 = 1;
    v41 = buf;
    v39 = self;
    id v33 = v44;
    id v40 = v33;
    [v30 performTransaction:v43 completionHandler:v35];

    _Block_object_dispose(buf, 8);
  }
}

void __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, _OWORD *a2)
{
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  long long v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  v5 = [v2 assetAtItemIndexPath:v6];
  [v3 addObject:v5];
}

void __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke_202(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F8A848];
  uint64_t v3 = *(void *)(a1 + 32);
  long long v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [v2 insertNewCloudSharedAlbumWithTitle:v3 lastInterestingDate:v4 intoLibrary:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = MEMORY[0x1E4F1CC38];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIsOwned:MEMORY[0x1E4F1CC38]];
  uint64_t v9 = MEMORY[0x1E4F1CC28];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCloudPublicURLEnabled:MEMORY[0x1E4F1CC28]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCloudPublicURLEnabledLocal:v9];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCloudMultipleContributorsEnabled:v8];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCloudMultipleContributorsEnabledLocal:v8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v23 = a1;
  id obj = *(id *)(a1 + 48);
  uint64_t v24 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v25 = (void *)MEMORY[0x1E4F8A728];
        uint64_t v12 = *(void *)(*(void *)(*(void *)(v23 + 56) + 8) + 40);
        v13 = [v11 firstName];
        v14 = [v11 lastName];
        v15 = [v11 localizedName];
        v16 = [v11 allEmails];
        id v17 = [v16 allObjects];
        v18 = [v11 allPhones];
        v19 = [v18 allObjects];
        id v20 = (id)[v25 insertNewInvitationRecordIntoAlbum:v12 withFirstName:v13 lastName:v14 fullName:v15 emails:v17 phones:v19 inLibrary:*(void *)(v23 + 40)];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v24);
  }
}

void __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) valueForKeyPath:@"uuid"];
  uint64_t v3 = *(void **)(a1 + 40);
  long long v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v5 = [v3 stringByTrimmingCharactersInSet:v4];

  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) publishBatchOfOriginalAssetUUIDs:v2 withBatchCommentText:v5 assetsSharingInfos:*(void *)(a1 + 48) customExportsInfo:*(void *)(a1 + 56) andTrimmedVideoPathInfo:*(void *)(a1 + 64) isNewAlbum:*(unsigned __int8 *)(a1 + 96)];
  *(id *)(a1 + 80);
  px_dispatch_on_main_queue();
}

uint64_t __66__PXCMMPublishToSharedStreamActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = PXURLForCMMShare(*(void **)(a1 + 40), 0);
  [*(id *)(a1 + 32) setPublishedURL:v2];

  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 completeBackgroundTaskWithSuccess:1 error:0];
}

@end