@interface PXMusicCurator
+ (OS_os_log)log;
+ (id)_fetchFlexMusicAssetsWithIdentifiers:(id)a3;
+ (id)_invalidPhotoAnalysisClientError;
+ (id)_requestDebugInformationForAppleMusicAsset:(id)a3 assetContainer:(id)a4 resultHandler:(id)a5;
+ (id)_requestDebugInformationForFlexMusicAsset:(id)a3 assetContainer:(id)a4 resultHandler:(id)a5;
+ (id)_requestQueue;
+ (id)bestLocallyAvailableAudioAssetForAssetContainer:(id)a3;
+ (id)requestAppleMusicCurationForAssetContainer:(id)a3 recentlyUsedAdamIDs:(id)a4 resultHandler:(id)a5;
+ (id)requestAudioAssetFetchResultForAdamIDs:(id)a3 requestOptions:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6;
+ (id)requestAudioAssetIdentifierForPurchasedSongID:(id)a3 requestOptions:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6;
+ (id)requestDebugInformationForAudioAsset:(id)a3 assetContainer:(id)a4 resultHandler:(id)a5;
+ (id)requestFlexMusicCurationForAssetContainer:(id)a3 recentlyUsedFlexSongIDs:(id)a4 resultHandler:(id)a5;
@end

@implementation PXMusicCurator

+ (id)_invalidPhotoAnalysisClientError
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28228];
  v7[0] = @"Invalid PhotoAnalysis Client";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  v4 = [v2 errorWithDomain:@"PXStoryErrorDomain" code:2 userInfo:v3];

  return v4;
}

+ (id)_requestDebugInformationForFlexMusicAsset:(id)a3 assetContainer:(id)a4 resultHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:2];
  v11 = [v8 photoLibrary];
  v12 = [v11 photoAnalysisClient];

  if (v12)
  {
    v13 = [v7 identifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__PXMusicCurator__requestDebugInformationForFlexMusicAsset_assetContainer_resultHandler___block_invoke;
    v18[3] = &unk_1E5DC8A48;
    id v14 = v10;
    id v19 = v14;
    id v22 = v9;
    id v20 = v8;
    id v21 = v12;
    [v21 requestFlexMusicCurationDebugInformationForSongWithUID:v13 reply:v18];

    id v15 = v21;
    id v16 = v14;
  }
  else
  {
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "totalUnitCount"));
    id v16 = +[PXMusicCurator _invalidPhotoAnalysisClientError];
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v16);
  }

  return v10;
}

void __89__PXMusicCurator__requestDebugInformationForFlexMusicAsset_assetContainer_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 setCompletedUnitCount:1];
      id v8 = [*(id *)(a1 + 40) assetCollection];
      id v9 = *(void **)(a1 + 48);
      v10 = [v8 localIdentifier];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __89__PXMusicCurator__requestDebugInformationForFlexMusicAsset_assetContainer_resultHandler___block_invoke_2;
      v11[3] = &unk_1E5DC8A20;
      id v12 = *(id *)(a1 + 32);
      id v14 = *(id *)(a1 + 56);
      id v13 = v5;
      [v9 requestFlexMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:v10 reply:v11];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v7, "totalUnitCount"));
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __89__PXMusicCurator__requestDebugInformationForFlexMusicAsset_assetContainer_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
    if (v7)
    {
      id v6 = [NSString stringWithFormat:@"\n==== [Flex Song] ====\n\n%@\n\n==== [Asset Collection] ====\n\n%@", *(void *)(a1 + 40), v7];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

+ (id)_requestDebugInformationForAppleMusicAsset:(id)a3 assetContainer:(id)a4 resultHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:2];
  v11 = [v8 photoLibrary];
  id v12 = [v11 photoAnalysisClient];

  if (v12)
  {
    id v13 = [v7 identifier];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __90__PXMusicCurator__requestDebugInformationForAppleMusicAsset_assetContainer_resultHandler___block_invoke;
    v18[3] = &unk_1E5DC8A48;
    id v14 = v10;
    id v19 = v14;
    id v22 = v9;
    id v20 = v8;
    id v21 = v12;
    [v21 requestMusicCurationDebugInformationForSongWithAdamID:v13 reply:v18];

    id v15 = v21;
    id v16 = v14;
  }
  else
  {
    objc_msgSend(v10, "setCompletedUnitCount:", objc_msgSend(v10, "totalUnitCount"));
    id v16 = +[PXMusicCurator _invalidPhotoAnalysisClientError];
    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v16);
  }

  return v10;
}

void __90__PXMusicCurator__requestDebugInformationForAppleMusicAsset_assetContainer_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    id v7 = *(void **)(a1 + 32);
    if (v5)
    {
      [v7 setCompletedUnitCount:1];
      id v8 = [*(id *)(a1 + 40) assetCollection];
      id v9 = *(void **)(a1 + 48);
      v10 = [v8 localIdentifier];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __90__PXMusicCurator__requestDebugInformationForAppleMusicAsset_assetContainer_resultHandler___block_invoke_2;
      v11[3] = &unk_1E5DC8A20;
      id v12 = *(id *)(a1 + 32);
      id v14 = *(id *)(a1 + 56);
      id v13 = v5;
      [v9 requestMusicCurationDebugInformationForAssetCollectionWithLocalIdentifier:v10 reply:v11];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(v7, "totalUnitCount"));
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
}

void __90__PXMusicCurator__requestDebugInformationForAppleMusicAsset_assetContainer_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
    if (v7)
    {
      id v6 = [NSString stringWithFormat:@"\n==== [Music Song] ====\n\n%@\n\n==== [Asset Collection] ====\n\n%@", *(void *)(a1 + 40), v7];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

+ (id)requestDebugInformationForAudioAsset:(id)a3 assetContainer:(id)a4 resultHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [(id)objc_opt_class() _requestDebugInformationForFlexMusicAsset:v7 assetContainer:v8 resultHandler:v9];
LABEL_5:
    v11 = (void *)v10;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [(id)objc_opt_class() _requestDebugInformationForAppleMusicAsset:v7 assetContainer:v8 resultHandler:v9];
    goto LABEL_5;
  }
  id v12 = NSString;
  id v13 = (objc_class *)objc_opt_class();
  id v14 = NSStringFromClass(v13);
  id v15 = [v12 stringWithFormat:@"Unsupported audio asset class: %@", v14];

  v9[2](v9, v15, 0);
  v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "totalUnitCount"));

LABEL_7:
  return v11;
}

+ (id)_fetchFlexMusicAssetsWithIdentifiers:(id)a3
{
  id v3 = a3;
  v4 = +[PXFlexMusicLibrary sharedLibrary];
  id v5 = [v4 fetchAssetsWithIdentifiers:v3];

  return v5;
}

+ (id)requestAudioAssetIdentifierForPurchasedSongID:(id)a3 requestOptions:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  id v15 = [a1 _requestQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __110__PXMusicCurator_requestAudioAssetIdentifierForPurchasedSongID_requestOptions_photoLibrary_completionHandler___block_invoke;
  v24[3] = &unk_1E5DC89D0;
  id v30 = a1;
  id v25 = v12;
  id v16 = v14;
  id v26 = v16;
  id v27 = v11;
  id v28 = v10;
  id v29 = v13;
  id v17 = v10;
  id v18 = v11;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(v15, v24);

  id v21 = v28;
  id v22 = v16;

  return v22;
}

void __110__PXMusicCurator_requestAudioAssetIdentifierForPurchasedSongID_requestOptions_photoLibrary_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 72) log];
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 72));
  v4 = v2;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryMusicCuratorFetchIdentifierForPurchasedSongID", "", buf, 2u);
  }

  id v6 = [*(id *)(a1 + 32) photoAnalysisClient];
  if (v6)
  {
    id v7 = [*(id *)(a1 + 48) requestOptions];
    uint64_t v8 = *(void *)(a1 + 56);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __110__PXMusicCurator_requestAudioAssetIdentifierForPurchasedSongID_requestOptions_photoLibrary_completionHandler___block_invoke_247;
    v12[3] = &unk_1E5DC89F8;
    id v13 = *(id *)(a1 + 40);
    id v14 = v5;
    os_signpost_id_t v16 = v3;
    id v15 = *(id *)(a1 + 64);
    [v6 requestMusicCatalogAdamIDsForPurchasedSongID:v8 options:v7 reply:v12];

    id v9 = v13;
  }
  else
  {
    id v7 = +[PXMusicCurator _invalidPhotoAnalysisClientError];
    id v10 = PLStoryGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForPurchaasedSongID failed with error: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    id v11 = v5;
    id v9 = v11;
    if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_END, v3, "PXStoryMusicCuratorFetchIdentifierForPurchasedSongID", "", buf, 2u);
    }
  }
}

void __110__PXMusicCurator_requestAudioAssetIdentifierForPurchasedSongID_requestOptions_photoLibrary_completionHandler___block_invoke_247(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v7 = PLStoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetIdentifierForPurchasedSongID was cancelled -> exiting without calling resultHandler.", (uint8_t *)&v19, 2u);
    }

    uint64_t v8 = *(id *)(a1 + 40);
    id v9 = v8;
    os_signpost_id_t v10 = *(void *)(a1 + 56);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PXStoryMusicCuratorFetchIdentifierForPurchasedSongID", "", (uint8_t *)&v19, 2u);
    }
LABEL_14:

    goto LABEL_15;
  }
  id v11 = PLStoryGetLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v12)
    {
      int v19 = 134217984;
      uint64_t v20 = [v5 count];
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetIdentifierForPurchasedSongID finished successfully with fetchResult of length: %ld.", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
    id v9 = [v5 firstObject];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v13 = *(id *)(a1 + 40);
    id v14 = v13;
    os_signpost_id_t v15 = *(void *)(a1 + 56);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PXStoryMusicCuratorFetchIdentifierForPurchasedSongID", "", (uint8_t *)&v19, 2u);
    }

    goto LABEL_14;
  }
  if (v12)
  {
    int v19 = 138412290;
    uint64_t v20 = (uint64_t)v6;
    _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetIdentifierForPurchasedSongID failed with error %@", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  os_signpost_id_t v16 = *(id *)(a1 + 40);
  id v17 = v16;
  os_signpost_id_t v18 = *(void *)(a1 + 56);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PXStoryMusicCuratorFetchIdentifierForPurchasedSongID", "", (uint8_t *)&v19, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_15:
}

+ (id)requestAudioAssetFetchResultForAdamIDs:(id)a3 requestOptions:(id)a4 photoLibrary:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  os_signpost_id_t v15 = [a1 _requestQueue];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __103__PXMusicCurator_requestAudioAssetFetchResultForAdamIDs_requestOptions_photoLibrary_completionHandler___block_invoke;
  v24[3] = &unk_1E5DC89D0;
  id v30 = a1;
  id v25 = v10;
  id v16 = v14;
  id v26 = v16;
  id v27 = v12;
  id v28 = v11;
  id v29 = v13;
  id v17 = v11;
  id v18 = v12;
  id v19 = v13;
  id v20 = v10;
  dispatch_async(v15, v24);

  uint64_t v21 = v28;
  id v22 = v16;

  return v22;
}

void __103__PXMusicCurator_requestAudioAssetFetchResultForAdamIDs_requestOptions_photoLibrary_completionHandler___block_invoke(id *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [a1[9] log];
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, a1[9]);
  v4 = v2;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "PXStoryMusicCuratorFetchFromAdamIDs", "", buf, 2u);
  }

  if ([a1[4] count])
  {
    id v6 = [a1[6] photoAnalysisClient];
    if (v6)
    {
      id v7 = [a1[7] requestOptions];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __103__PXMusicCurator_requestAudioAssetFetchResultForAdamIDs_requestOptions_photoLibrary_completionHandler___block_invoke_242;
      v11[3] = &unk_1E5DC89A8;
      id v8 = a1[4];
      id v12 = a1[5];
      id v15 = a1[8];
      id v13 = a1[6];
      id v14 = v5;
      os_signpost_id_t v16 = v3;
      [v6 requestSongsForAdamIDs:v8 options:v7 reply:v11];
    }
    else
    {
      id v7 = +[PXMusicCurator _invalidPhotoAnalysisClientError];
      id v10 = PLStoryGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v7;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs failed with error: %@", buf, 0xCu);
      }

      objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
      (*((void (**)(void))a1[8] + 2))();
    }
  }
  else
  {
    id v9 = PLStoryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs returning an empty fetch result because no adamIDs were requested", buf, 2u);
    }

    objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
    id v6 = PXAudioAssetFetchResultWithArray(MEMORY[0x1E4F1CBF0]);
    (*((void (**)(void))a1[8] + 2))();
  }
}

void __103__PXMusicCurator_requestAudioAssetFetchResultForAdamIDs_requestOptions_photoLibrary_completionHandler___block_invoke_242(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v7 = PLStoryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs was cancelled -> exiting without calling resultHandler.", buf, 2u);
    }
  }
  else if ([v5 length])
  {
    id v8 = [v5 dataUsingEncoding:4];
    id v19 = 0;
    id v9 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:&v19];
    id v10 = v19;
    if ([v9 count])
    {
      id v11 = +[PXAppleMusicCuration parseAppleMusicAssetsFromJSONArray:v9 photoLibrary:*(void *)(a1 + 40)];
      id v12 = PLStoryGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = [v11 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v21 = v13;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs finished successfully with fetchResult of length: %ld.", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      id v14 = *(id *)(a1 + 48);
      id v15 = v14;
      os_signpost_id_t v16 = *(void *)(a1 + 64);
      if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PXStoryMusicCuratorFetchFromAdamIDs", "", buf, 2u);
      }
    }
    else
    {
      id v18 = PLStoryGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = (uint64_t)v10;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs failed with json serialization error: %@", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      [v11 setObject:@"Photo Analysis response contained no songs" forKeyedSubscript:*MEMORY[0x1E4F28228]];
      id v15 = [objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PXMusicCuratorErrorDomain" code:0 userInfo:v11];
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    id v17 = PLStoryGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = (uint64_t)v6;
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestAudioAssetFetchResultForAdamIDs failed with error: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

+ (id)requestFlexMusicCurationForAssetContainer:(id)a3 recentlyUsedFlexSongIDs:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  id v12 = [a1 _requestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__PXMusicCurator_requestFlexMusicCurationForAssetContainer_recentlyUsedFlexSongIDs_resultHandler___block_invoke;
  block[3] = &unk_1E5DC8980;
  id v25 = a1;
  id v21 = v8;
  id v13 = v11;
  id v23 = v9;
  id v24 = v10;
  id v22 = v13;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  dispatch_async(v12, block);

  id v17 = v23;
  id v18 = v13;

  return v18;
}

void __98__PXMusicCurator_requestFlexMusicCurationForAssetContainer_recentlyUsedFlexSongIDs_resultHandler___block_invoke(id *a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1[8] log];
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, a1[8]);
  v4 = v2;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StoryMusicCuratorFlexMusic", "", buf, 2u);
  }

  id v6 = [a1[4] photoLibrary];
  id v7 = [v6 photoAnalysisClient];

  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__PXMusicCurator_requestFlexMusicCurationForAssetContainer_recentlyUsedFlexSongIDs_resultHandler___block_invoke_231;
    aBlock[3] = &unk_1E5DC89A8;
    id v21 = a1[4];
    id v22 = a1[5];
    id v24 = a1[7];
    id v23 = v5;
    os_signpost_id_t v25 = v3;
    id v8 = _Block_copy(aBlock);
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v10 = (void *)[a1[6] copy];
    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F8B030]];

    id v11 = [a1[4] container];
    id v12 = [v11 localIdentifier];
    [v9 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F8AE60]];

    id v13 = [a1[4] assetCollection];
    if ([v13 isTransient])
    {
      id v14 = [v13 photoLibrary];
      id v15 = [v14 librarySpecificFetchOptions];

      v27[0] = *MEMORY[0x1E4F394A8];
      id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
      [v15 setFetchPropertySets:v16];

      [v15 setWantsIncrementalChangeDetails:0];
      [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v13 options:v15];
      objc_claimAutoreleasedReturnValue();
      PXMap();
    }
    id v19 = [v13 localIdentifier];
    [v7 requestFlexMusicCurationForAssetCollectionLocalIdentifier:v19 options:v9 reply:v8];

    id v18 = v21;
  }
  else
  {
    objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
    id v17 = (void (**)(id, void, void *))a1[7];
    id v18 = +[PXMusicCurator _invalidPhotoAnalysisClientError];
    v17[2](v17, 0, v18);
  }
}

void __98__PXMusicCurator_requestFlexMusicCurationForAssetContainer_recentlyUsedFlexSongIDs_resultHandler___block_invoke_231(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLStoryGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138412290;
    v32 = v8;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestFlexMusicCuration received reply for asset container (%@).", buf, 0xCu);
  }
  if ([*(id *)(a1 + 40) isCancelled])
  {
    id v9 = PLStoryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412290;
      v32 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestFlexMusicCuration for asset container (%@) was cancelled -> exiting without calling resultHandler.", buf, 0xCu);
    }
  }
  else if ([v5 length])
  {
    id v11 = [v5 dataUsingEncoding:4];
    id v30 = 0;
    id v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v11 options:0 error:&v30];
    id v13 = v30;
    if ([v12 count])
    {
      id v29 = v13;
      id v14 = [v12 objectForKeyedSubscript:@"bestSongSuggestions"];
      id v15 = +[PXMusicCurator _fetchFlexMusicAssetsWithIdentifiers:v14];

      id v16 = [v12 objectForKeyedSubscript:@"secondarySongSuggestions"];
      id v17 = +[PXMusicCurator _fetchFlexMusicAssetsWithIdentifiers:v16];

      id v18 = [[PXFlexMusicCuration alloc] initWithBestSongSuggestions:v15 secondarySongSuggestions:v17];
      id v19 = PLStoryGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [*(id *)(a1 + 32) identifier];
        uint64_t v21 = [v15 count];
        *(_DWORD *)buf = 138412546;
        v32 = v20;
        __int16 v33 = 2048;
        uint64_t v34 = v21;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestFlexMusicCuration finished successfully for asset container (%@) with bestSongSuggestions count: %ld.", buf, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      id v22 = *(id *)(a1 + 48);
      id v23 = v22;
      os_signpost_id_t v24 = *(void *)(a1 + 64);
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "StoryMusicCuratorFlexMusic", "", buf, 2u);
      }

      id v13 = v29;
    }
    else
    {
      id v27 = PLStoryGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        id v28 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 138412546;
        v32 = v28;
        __int16 v33 = 2112;
        uint64_t v34 = (uint64_t)v13;
        _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestFlexMusicCuration failed for asset container (%@) with JSON serialization error: %@.", buf, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    os_signpost_id_t v25 = PLStoryGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412546;
      v32 = v26;
      __int16 v33 = 2112;
      uint64_t v34 = (uint64_t)v6;
      _os_log_impl(&dword_1A9AE7000, v25, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestFlexMusicCuration for asset container (%@) failed with error: %@.", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __98__PXMusicCurator_requestFlexMusicCurationForAssetContainer_recentlyUsedFlexSongIDs_resultHandler___block_invoke_239(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

+ (id)requestAppleMusicCurationForAssetContainer:(id)a3 recentlyUsedAdamIDs:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  id v12 = [a1 _requestQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__PXMusicCurator_requestAppleMusicCurationForAssetContainer_recentlyUsedAdamIDs_resultHandler___block_invoke;
  block[3] = &unk_1E5DC8980;
  id v25 = a1;
  id v21 = v8;
  id v13 = v11;
  id v23 = v9;
  id v24 = v10;
  id v22 = v13;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  dispatch_async(v12, block);

  id v17 = v23;
  id v18 = v13;

  return v18;
}

void __95__PXMusicCurator_requestAppleMusicCurationForAssetContainer_recentlyUsedAdamIDs_resultHandler___block_invoke(id *a1)
{
  v40[3] = *MEMORY[0x1E4F143B8];
  v2 = [a1[8] log];
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, a1[8]);
  v4 = v2;
  id v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StoryMusicCuratorAppleMusic", "", buf, 2u);
  }

  id v6 = [a1[4] photoLibrary];
  id v7 = [v6 photoAnalysisClient];
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __95__PXMusicCurator_requestAppleMusicCurationForAssetContainer_recentlyUsedAdamIDs_resultHandler___block_invoke_214;
    aBlock[3] = &unk_1E5DC8938;
    id v31 = a1[4];
    id v32 = a1[5];
    id v35 = a1[7];
    id v29 = v6;
    id v33 = v6;
    uint64_t v34 = v5;
    os_signpost_id_t v36 = v3;
    id v28 = _Block_copy(aBlock);
    id v8 = +[PXMemoriesRelatedSettings sharedInstance];
    uint64_t v9 = [v8 useOnlyMusicForTopicInTopPickSuggestions];
    uint64_t v10 = [v8 includeChillMixInMusicForYou];
    uint64_t v11 = [v8 includeGetUpMixInMusicForYou];
    id v12 = objc_alloc(MEMORY[0x1E4F1CA60]);
    v39[0] = *MEMORY[0x1E4F8B290];
    id v13 = [NSNumber numberWithBool:v9];
    v40[0] = v13;
    v39[1] = *MEMORY[0x1E4F8B228];
    id v14 = [NSNumber numberWithBool:v10];
    v40[1] = v14;
    v39[2] = *MEMORY[0x1E4F8B230];
    id v15 = [NSNumber numberWithBool:v11];
    v40[2] = v15;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];
    id v17 = (void *)[v12 initWithDictionary:v16];

    id v18 = (void *)[a1[6] copy];
    [v17 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F8B038]];

    id v19 = [a1[4] originalContainer];
    id v20 = [v19 localIdentifier];
    [v17 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4F8AE60]];

    id v21 = [a1[4] assetCollection];
    if ([v21 isTransient])
    {
      id v22 = [v21 photoLibrary];
      id v23 = [v22 librarySpecificFetchOptions];

      uint64_t v38 = *MEMORY[0x1E4F394A8];
      id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      [v23 setFetchPropertySets:v24];

      [v23 setWantsIncrementalChangeDetails:0];
      [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v21 options:v23];
      objc_claimAutoreleasedReturnValue();
      PXMap();
    }
    id v27 = [v21 localIdentifier];
    [v7 requestMusicCurationForAssetCollectionLocalIdentifier:v27 options:v17 reply:v28];

    id v26 = v31;
    id v6 = v29;
  }
  else
  {
    objc_msgSend(a1[5], "setCompletedUnitCount:", objc_msgSend(a1[5], "totalUnitCount"));
    id v25 = (void (**)(id, void, void *))a1[7];
    id v26 = +[PXMusicCurator _invalidPhotoAnalysisClientError];
    v25[2](v25, 0, v26);
  }
}

void __95__PXMusicCurator_requestAppleMusicCurationForAssetContainer_recentlyUsedAdamIDs_resultHandler___block_invoke_214(uint64_t a1, void *a2, void *a3)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = PLStoryGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138412290;
    v40 = v8;
    _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration received reply for asset container (%@).", buf, 0xCu);
  }
  if ([*(id *)(a1 + 40) isCancelled])
  {
    uint64_t v9 = PLStoryGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)buf = 138412290;
      v40 = v10;
      _os_log_impl(&dword_1A9AE7000, v9, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration was cancelled for asset container (%@) -> exiting without calling resultHandler.", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = +[PXStorySettings sharedInstance];
    if ([v9 musicSimulatedFailureMode] == 3)
    {
      id v17 = PXStoryErrorCreateWithCodeDebugFormat(5, @"Simulated Error", v11, v12, v13, v14, v15, v16, v36);
      id v18 = PLStoryGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = [*(id *)(a1 + 32) identifier];
        *(_DWORD *)buf = 138412546;
        v40 = v19;
        __int16 v41 = 2112;
        uint64_t v42 = (uint64_t)v17;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration failed for asset container (%@) with error: %@.", buf, 0x16u);
      }
      objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      if ([v9 musicSimulatedFailureMode] == 2) {
        [MEMORY[0x1E4F29060] sleepForTimeInterval:10.0];
      }
      if ([v5 length])
      {
        id v20 = [v5 dataUsingEncoding:4];
        id v38 = 0;
        id v21 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v20 options:0 error:&v38];
        id v22 = v38;
        if ([v21 count])
        {
          id v23 = +[PXAppleMusicCuration curationFromDictionary:v21 photoLibrary:*(void *)(a1 + 48)];
          id v24 = PLStoryGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            id v25 = [*(id *)(a1 + 32) identifier];
            [v23 bestMusicSuggestions];
            v37 = v20;
            v27 = id v26 = v22;
            uint64_t v28 = [v27 count];
            *(_DWORD *)buf = 138412546;
            v40 = v25;
            __int16 v41 = 2048;
            uint64_t v42 = v28;
            _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration finished successfully for asset container (%@) with bestMusicSuggestions count: %ld.", buf, 0x16u);

            id v22 = v26;
            id v20 = v37;
          }
          objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          id v29 = *(id *)(a1 + 56);
          id v30 = v29;
          os_signpost_id_t v31 = *(void *)(a1 + 72);
          if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v30, OS_SIGNPOST_INTERVAL_END, v31, "StoryMusicCuratorAppleMusic", "", buf, 2u);
          }
        }
        else
        {
          uint64_t v34 = PLStoryGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            id v35 = [*(id *)(a1 + 32) identifier];
            *(_DWORD *)buf = 138412546;
            v40 = v35;
            __int16 v41 = 2112;
            uint64_t v42 = (uint64_t)v22;
            _os_log_impl(&dword_1A9AE7000, v34, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration failed for asset container (%@) with JSON serialization error: %@.", buf, 0x16u);
          }
          objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        }
      }
      else
      {
        id v32 = PLStoryGetLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          id v33 = [*(id *)(a1 + 32) identifier];
          *(_DWORD *)buf = 138412546;
          v40 = v33;
          __int16 v41 = 2112;
          uint64_t v42 = (uint64_t)v6;
          _os_log_impl(&dword_1A9AE7000, v32, OS_LOG_TYPE_ERROR, "[MemoriesMusic] (PXMusicCurator) requestMusicCuration failed for asset container (%@) with error: %@.", buf, 0x16u);
        }
        objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "totalUnitCount"));
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
    }
  }
}

uint64_t __95__PXMusicCurator_requestAppleMusicCurationForAssetContainer_recentlyUsedAdamIDs_resultHandler___block_invoke_227(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

+ (id)bestLocallyAvailableAudioAssetForAssetContainer:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 log];
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, a1);
  id v7 = v5;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "StoryMusicCuratorBestLocallyAvailable", "", (uint8_t *)&v21, 2u);
  }

  uint64_t v9 = [v4 container];
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v10 = v9;

    if (v10)
    {
      uint64_t v11 = [v10 suggestedMood];
      goto LABEL_10;
    }
  }
  else
  {

    id v10 = 0;
  }
  uint64_t v11 = 16;
LABEL_10:
  uint64_t v12 = +[PXFlexMusicLibrary sharedLibrary];
  uint64_t v13 = [v12 fetchLocalAssetForMood:v11];
  uint64_t v14 = [v13 firstObject];

  uint64_t v15 = PLStoryGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [v4 identifier];
    id v17 = [v14 identifier];
    int v21 = 138412546;
    id v22 = v16;
    __int16 v23 = 2112;
    id v24 = v17;
    _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_INFO, "[MemoriesMusic] (PXMusicCurator) bestLocallyAvailableAudioAssetForAssetContainer finished successfully for asset container (%@) with song: %@.", (uint8_t *)&v21, 0x16u);
  }
  id v18 = v8;
  id v19 = v18;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    LOWORD(v21) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v19, OS_SIGNPOST_INTERVAL_END, v6, "StoryMusicCuratorBestLocallyAvailable", "", (uint8_t *)&v21, 2u);
  }

  return v14;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21__PXMusicCurator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (log_onceToken_234261 != -1) {
    dispatch_once(&log_onceToken_234261, block);
  }
  v2 = (void *)log_log_234262;
  return (OS_os_log *)v2;
}

void __21__PXMusicCurator_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v1 = objc_claimAutoreleasedReturnValue();
  v2 = (const char *)[v1 UTF8String];

  os_log_t v3 = os_log_create((const char *)*MEMORY[0x1E4F8C518], v2);
  id v4 = (void *)log_log_234262;
  log_log_234262 = (uint64_t)v3;
}

+ (id)_requestQueue
{
  if (_requestQueue_onceToken != -1) {
    dispatch_once(&_requestQueue_onceToken, &__block_literal_global_234263);
  }
  v2 = (void *)_requestQueue_queue;
  return v2;
}

void __31__PXMusicCurator__requestQueue__block_invoke()
{
  os_log_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  dispatch_queue_t v1 = dispatch_queue_create("PXMusicCuration", v0);
  v2 = (void *)_requestQueue_queue;
  _requestQueue_queue = (uint64_t)v1;
}

@end