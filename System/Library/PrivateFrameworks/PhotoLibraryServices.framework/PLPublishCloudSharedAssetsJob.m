@interface PLPublishCloudSharedAssetsJob
+ (id)videoComplementURLForSharingFromAsset:(id)a3;
+ (void)publishBatchOfOriginalAssetUUIDs:(id)a3 toSharedAlbum:(id)a4 withAssetsSharingInfos:(id)a5 customExportsInfo:(id)a6 trimmedVideoPathInfo:(id)a7 isNewAlbum:(BOOL)a8 batchCommentText:(id)a9;
- (BOOL)isNewAlbum;
- (BOOL)retrieveURLsFromAssetWithUUID:(id)a3 withExportedFileURL:(id)a4 primaryURL:(id *)a5 videoComplementURL:(id *)a6;
- (BOOL)shouldArchiveXPCToDisk;
- (NSArray)originalAssetUUIDs;
- (NSArray)stillImageOnlyAssetUUIDs;
- (NSDictionary)customExportsInfo;
- (NSDictionary)trimmedVideoPathInfo;
- (NSString)batchCommentText;
- (NSString)publishAlbumCloudGUID;
- (id)description;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)daemonOperation;
- (void)encodeToXPCObject:(id)a3;
- (void)executeDaemonOperation;
- (void)runDaemonSide;
- (void)setBatchCommentText:(id)a3;
- (void)setCustomExportsInfo:(id)a3;
- (void)setIsNewAlbum:(BOOL)a3;
- (void)setOriginalAssetUUIDs:(id)a3;
- (void)setPublishAlbumCloudGUID:(id)a3;
- (void)setStillImageOnlyAssetUUIDs:(id)a3;
- (void)setTrimmedVideoPathInfo:(id)a3;
@end

@implementation PLPublishCloudSharedAssetsJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batchCommentText, 0);
  objc_storeStrong((id *)&self->_trimmedVideoPathInfo, 0);
  objc_storeStrong((id *)&self->_customExportsInfo, 0);
  objc_storeStrong((id *)&self->_stillImageOnlyAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_originalAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_publishAlbumCloudGUID, 0);
}

- (void)setBatchCommentText:(id)a3
{
}

- (NSString)batchCommentText
{
  return self->_batchCommentText;
}

- (void)setIsNewAlbum:(BOOL)a3
{
  self->_isNewAlbum = a3;
}

- (BOOL)isNewAlbum
{
  return self->_isNewAlbum;
}

- (void)setTrimmedVideoPathInfo:(id)a3
{
}

- (NSDictionary)trimmedVideoPathInfo
{
  return self->_trimmedVideoPathInfo;
}

- (void)setCustomExportsInfo:(id)a3
{
}

- (NSDictionary)customExportsInfo
{
  return self->_customExportsInfo;
}

- (void)setStillImageOnlyAssetUUIDs:(id)a3
{
}

- (NSArray)stillImageOnlyAssetUUIDs
{
  return self->_stillImageOnlyAssetUUIDs;
}

- (void)setOriginalAssetUUIDs:(id)a3
{
}

- (NSArray)originalAssetUUIDs
{
  return self->_originalAssetUUIDs;
}

- (void)setPublishAlbumCloudGUID:(id)a3
{
}

- (NSString)publishAlbumCloudGUID
{
  return self->_publishAlbumCloudGUID;
}

- (BOOL)retrieveURLsFromAssetWithUUID:(id)a3 withExportedFileURL:(id)a4 primaryURL:(id *)a5 videoComplementURL:(id *)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v39 = v10;
    __int16 v40 = 2114;
    id v41 = v9;
    _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Determining URLs to share for exported file URL: %@, asset UUID: \"%{public}@\"", buf, 0x16u);
  }

  v12 = [v10 pathExtension];
  if ([v12 isEqualToString:*MEMORY[0x1E4F8CED8]])
  {
    v13 = (void *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v10];
    v14 = [v13 imagePath];
    uint64_t v15 = [v13 videoPath];
    v16 = (void *)v15;
    if (v14) {
      BOOL v17 = v15 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    BOOL v18 = !v17;
    if (v17)
    {
      v31 = (void *)v15;
      v32 = v14;
      id v33 = v9;
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      v21 = [v20 enumeratorAtURL:v10 includingPropertiesForKeys:0 options:5 errorHandler:0];

      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v22 = v21;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v44 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v35 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = [*(id *)(*((void *)&v34 + 1) + 8 * i) pathExtension];
            [v19 addObject:v27];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v24);
      }

      v28 = PLPhotoSharingGetLog();
      id v9 = v33;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = [v19 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138412802;
        id v39 = v10;
        __int16 v40 = 2114;
        id v41 = v29;
        __int16 v42 = 2114;
        id v43 = v33;
        _os_log_impl(&dword_19B3C7000, v28, OS_LOG_TYPE_ERROR, "Failed to determine URLs to share for exported file URL: %@, with path extensions: (%{public}@), asset UUID: \"%{public}@\"", buf, 0x20u);
      }
      v16 = v31;
      v14 = v32;
    }
    else
    {
      *a5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14];
      *a6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16];
    }
  }
  else
  {
    *a5 = v10;
    BOOL v18 = 1;
  }

  return v18;
}

- (void)executeDaemonOperation
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(PLPublishCloudSharedAssetsJob *)self originalAssetUUIDs];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__74876;
  v24[4] = __Block_byref_object_dispose__74877;
  id v25 = 0;
  v6 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  v7 = [v6 pathManager];
  v8 = [v7 capabilities];

  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__74876;
  v22[4] = __Block_byref_object_dispose__74877;
  id v23 = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke;
  v16[3] = &unk_1E5874840;
  v20 = v24;
  v16[4] = self;
  id v9 = v6;
  id v17 = v9;
  id v10 = v8;
  id v18 = v10;
  id v19 = v5;
  v21 = v22;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke_73;
  v12[3] = &unk_1E5875A90;
  id v11 = v19;
  id v13 = v11;
  v14 = v24;
  uint64_t v15 = v22;
  [v9 performTransactionAndWait:v16 completionHandler:v12];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
}

void __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke(uint64_t a1)
{
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  v123 = +[PLPhotoSharingHelper sharingPersonID];
  if (v123)
  {
    v1 = [*(id *)(a1 + 32) publishAlbumCloudGUID];
    uint64_t v2 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v1 inLibrary:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      if ([*(id *)(a1 + 32) isNewAlbum]) {
        +[PLPhotoSharingHelper publishCloudSharedAlbumToServer:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      }
      v5 = [*(id *)(a1 + 32) originalAssetUUIDs];
      v6 = +[PLManagedAsset assetsWithUUIDs:v5 options:1 inLibrary:*(void *)(a1 + 40)];

      uint64_t v7 = [v6 count];
      v8 = [*(id *)(a1 + 32) originalAssetUUIDs];
      uint64_t v9 = [v8 count];

      if (v7 != v9)
      {
        id v10 = PLPhotoSharingGetLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          uint64_t v11 = [v6 count];
          v12 = [*(id *)(a1 + 32) originalAssetUUIDs];
          *(_DWORD *)buf = 134218240;
          *(void *)&uint8_t buf[4] = v11;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = [v12 count];
          _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "ERROR: Only found %lu originalAssets, expected %lu", buf, 0x16u);
        }
      }
      v138 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
      long long v169 = 0u;
      long long v170 = 0u;
      long long v167 = 0u;
      long long v168 = 0u;
      obj = v6;
      uint64_t v13 = [obj countByEnumeratingWithState:&v167 objects:v174 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v168;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v168 != v14) {
              objc_enumerationMutation(obj);
            }
            v16 = *(void **)(*((void *)&v167 + 1) + 8 * i);
            id v17 = [v16 uuid];
            [v138 setObject:v16 forKey:v17];
          }
          uint64_t v13 = [obj countByEnumeratingWithState:&v167 objects:v174 count:16];
        }
        while (v13);
      }

      v121 = [MEMORY[0x1E4F8BA08] UUIDString];
      v122 = [MEMORY[0x1E4F1C9C8] date];
      v120 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) mutableAssets];
      id v18 = [*(id *)(a1 + 32) batchCommentText];
      uint64_t v119 = [v18 length];

      id v19 = (void *)MEMORY[0x1E4F1CAD0];
      v20 = [*(id *)(a1 + 32) stillImageOnlyAssetUUIDs];
      v116 = [v19 setWithArray:v20];

      [*(id *)(a1 + 32) originalAssetUUIDs];
      long long v165 = 0u;
      long long v166 = 0u;
      long long v163 = 0u;
      long long v164 = 0u;
      id v124 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v129 = [v124 countByEnumeratingWithState:&v163 objects:v173 count:16];
      if (v129)
      {
        uint64_t v128 = *(void *)v164;
        v118 = (void *)*MEMORY[0x1E4F15768];
        uint64_t v117 = *MEMORY[0x1E4F15AA8];
        do
        {
          uint64_t v21 = 0;
          do
          {
            if (*(void *)v164 != v128)
            {
              uint64_t v22 = v21;
              objc_enumerationMutation(v124);
              uint64_t v21 = v22;
            }
            uint64_t v137 = v21;
            uint64_t v23 = *(void *)(*((void *)&v163 + 1) + 8 * v21);
            uint64_t v24 = [v138 objectForKey:v23];
            if (v24)
            {
              context = (void *)MEMORY[0x19F38D3B0]();
              int v25 = [v24 isVideo];
              unsigned int v126 = [v24 playbackVariation];
              v26 = [*(id *)(a1 + 32) customExportsInfo];
              v27 = [v24 uuid];
              v131 = [v26 objectForKey:v27];

              v28 = [*(id *)(a1 + 32) trimmedVideoPathInfo];
              v29 = [v24 uuid];
              v140 = [v28 objectForKey:v29];

              if (v140)
              {
                v142 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
                v30 = PLPhotoSharingGetLog();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v142;
                  _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "Original video is trimmed, use the trimmed file %@", buf, 0xCu);
                }
                v139 = 0;
                os_log_t oslog = 0;
                BOOL v127 = 0;
LABEL_26:
                int v31 = 1;
LABEL_27:

                v32 = [MEMORY[0x1E4F29128] UUID];
                v136 = [v32 UUIDString];

                v132 = [v142 pathExtension];
                id v33 = [*(id *)(a1 + 32) publishAlbumCloudGUID];
                long long v34 = [*(id *)(a1 + 40) pathManager];
                long long v35 = +[PLCloudSharedAssetSaveJob nextDCIMSaveFileURLForCloudPersonID:v123 cloudAlbumGUID:v33 pathManager:v34 fileExtension:v132 assetUUID:v136];

                if (v139)
                {
                  long long v36 = [v35 URLByDeletingLastPathComponent];
                  long long v37 = [v35 lastPathComponent];
                  v38 = [v37 stringByDeletingPathExtension];

                  id v39 = [v139 pathExtension];
                  __int16 v40 = [v39 uppercaseString];
                  id v41 = [v38 stringByAppendingPathExtension:v40];

                  v133 = [v36 URLByAppendingPathComponent:v41];
                }
                else
                {
                  v133 = 0;
                }
                if (v140) {
                  int v45 = 1;
                }
                else {
                  int v45 = v25 ^ 1;
                }
                if (((v31 | v45) & 1) == 0
                  && [v24 isDefaultAdjustedSlomo]
                  && [v24 isPlayableVideo:0])
                {
                  v46 = PLPhotoSharingGetLog();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v35;
                    _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEFAULT, "Original is a slow-mo, flatten the video to %@", buf, 0xCu);
                  }

                  id v47 = v118;
                  dispatch_semaphore_t v48 = dispatch_semaphore_create(0);
                  *(void *)buf = 0;
                  *(void *)&buf[8] = buf;
                  *(void *)&buf[16] = 0x2020000000;
                  LOBYTE(v172) = 0;
                  v49 = +[PLSlalomUtilities videoAVObjectBuilderForManagedAsset:v24 applyVideoAdjustments:1];
                  v155[0] = MEMORY[0x1E4F143A8];
                  v155[1] = 3221225472;
                  v155[2] = __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke_65;
                  v155[3] = &unk_1E586F2E0;
                  v156 = v142;
                  id v50 = v35;
                  id v157 = v50;
                  v159 = buf;
                  v51 = v48;
                  v158 = v51;
                  long long v153 = *MEMORY[0x1E4F1FA48];
                  uint64_t v154 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
                  long long v151 = v153;
                  uint64_t v152 = v154;
                  +[PLVideoTranscoder transcodeVideoWithObjectBuilder:v49 outputURL:v50 startTime:&v153 endTime:&v151 presetName:v47 outputFileType:v117 metadata:0 completionHandler:v155];
                  dispatch_semaphore_wait(v51, 0xFFFFFFFFFFFFFFFFLL);
                  BOOL v52 = *(unsigned char *)(*(void *)&buf[8] + 24) == 0;

                  _Block_object_dispose(buf, 8);
                  if (!v52) {
                    goto LABEL_103;
                  }
LABEL_52:
                  BOOL v61 = v127;
                  if (!v133) {
                    BOOL v61 = 0;
                  }
                  if (v61)
                  {
                    v62 = PLPhotoSharingGetLog();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      *(void *)&uint8_t buf[4] = v139;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v133;
                      _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_DEFAULT, "Moving video complement from %@ to %@, for an in-place video complement creation later", buf, 0x16u);
                    }

                    uint64_t v63 = *(void *)(a1 + 48);
                    id v148 = 0;
                    char v64 = [MEMORY[0x1E4F8B908] secureMoveItemAtURL:v139 toURL:v133 capabilities:v63 error:&v148];
                    id v65 = v148;
                    if (v64)
                    {
                      id v66 = v133;

                      v139 = v66;
                      uint64_t v67 = 2;
                      goto LABEL_60;
                    }
                    v87 = PLPhotoSharingGetLog();
                    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
                    {
                      v88 = [v139 path];
                      v89 = [v133 path];
                      *(_DWORD *)buf = 138412802;
                      *(void *)&uint8_t buf[4] = v88;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v89;
                      *(_WORD *)&buf[22] = 2112;
                      id v172 = v65;
                      _os_log_impl(&dword_19B3C7000, v87, OS_LOG_TYPE_ERROR, "Unable to move \"%@\" to \"%@\": %@", buf, 0x20u);
                    }
LABEL_103:

                    v86 = oslog;
LABEL_104:

                    goto LABEL_105;
                  }
                  uint64_t v67 = 0;
LABEL_60:
                  if (oslog)
                  {
                    v68 = [MEMORY[0x1E4F28CB8] defaultManager];
                    id v147 = 0;
                    [v68 removeItemAtURL:oslog error:&v147];
                    id v69 = v147;

                    if (v69)
                    {
                      v70 = PLPhotoSharingGetLog();
                      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(void *)&uint8_t buf[4] = oslog;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = v69;
                        _os_log_impl(&dword_19B3C7000, v70, OS_LOG_TYPE_DEFAULT, "Unable to opportunistically clean up temporary directory: \"%@\" Error: %@", buf, 0x16u);
                      }
                    }
                  }
                  *(void *)&long long v153 = 0;
                  uint64_t v71 = *(void *)(a1 + 40);
                  uint64_t v72 = [MEMORY[0x1E4F8BA10] savedAssetTypeForCloudSharedAsset];
                  id v146 = 0;
                  v73 = +[PLManagedAsset insertAssetIntoPhotoLibrary:v71 mainFileURL:v35 savedAssetType:v72 bundleScope:2 uuid:v136 replacementUUID:0 imageSource:&v153 imageData:&v146];
                  id v74 = v146;
                  v75 = +[PLPhotoSharingHelper photoSharingOriginalFilenameForAsset:v24];
                  [v73 setOriginalFilename:v75];

                  if (!v73)
                  {
                    osloga = PLPhotoSharingGetLog();
                    if (os_log_type_enabled(osloga, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v35;
                      _os_log_impl(&dword_19B3C7000, osloga, OS_LOG_TYPE_ERROR, "ERROR: couldn't insert new asset for file at %@", buf, 0xCu);
                    }
                    goto LABEL_102;
                  }
                  if ([v73 isVideo])
                  {
                    id v145 = 0;
                    char v76 = [v73 isPlayableVideo:&v145];
                    osloga = v145;
                    if ((v76 & 1) == 0)
                    {
                      v77 = PLPhotoSharingGetLog();
                      if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        *(void *)&uint8_t buf[4] = v35;
                        *(_WORD *)&buf[12] = 2112;
                        *(void *)&buf[14] = osloga;
                        _os_log_impl(&dword_19B3C7000, v77, OS_LOG_TYPE_ERROR, "ERROR: can't play new asset for file at %@, with codec: %@", buf, 0x16u);
                      }

LABEL_102:
                      os_log_t oslog = 0;
                      goto LABEL_103;
                    }
                  }
                  else
                  {
                    osloga = 0;
                  }
                  [v73 setVisibilityState:2];
                  v90 = PLPhotoSharingGetLog();
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v23;
                    _os_log_impl(&dword_19B3C7000, v90, OS_LOG_TYPE_DEFAULT, "Generating new thumbnails for asset with UUID %@", buf, 0xCu);
                  }

                  [v73 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:(void)v153 imageData:v74 forceSRGBConversion:1];
                  v91 = [MEMORY[0x1E4F8BA08] UUIDString];
                  v92 = [v24 additionalAttributes];
                  v93 = [v92 originalFilename];
                  v94 = [v73 additionalAttributes];
                  [v94 setOriginalFilename:v93];

                  [v73 setCloudAssetGUID:v91];
                  [v73 setCloudBatchID:v121];
                  [v73 setCloudBatchPublishDate:v122];
                  [v73 setCloudPlaceholderKind:5];
                  [v73 setCloudIsMyAsset:1];
                  [v73 setCloudIsDeletable:1];
                  [v73 setPlaybackVariationAndLoopingPlaybackStyleWithPlaybackVariation:v126];
                  if ((v45 & 1) == 0)
                  {
                    v95 = [v24 uuid];
                    [v73 setOriginalAssetsUUID:v95];

                    v96 = PLPhotoSharingGetLog();
                    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                    {
                      v97 = [v73 originalAssetsUUID];
                      *(_DWORD *)buf = 138412290;
                      *(void *)&uint8_t buf[4] = v97;
                      _os_log_impl(&dword_19B3C7000, v96, OS_LOG_TYPE_DEFAULT, "Saved original video uuid %@ for later playback", buf, 0xCu);
                    }
                  }
                  if (v139)
                  {
                    v98 = [v24 mediaGroupUUID];
                    [v24 photoIrisVideoDuration];
                    [v24 photoIrisStillDisplayTime];
                    [v73 becomePhotoIrisWithMediaGroupUUID:v98 mainFileMetadata:0 videoURL:v139 videoDuration:v144 stillDisplayTime:v143 options:v67];
                  }
                  [v120 addObject:v73];
                  v99 = PLPhotoSharingGetLog();
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                  {
                    v100 = [v35 path];
                    *(_DWORD *)buf = 138412802;
                    *(void *)&uint8_t buf[4] = v142;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v100;
                    *(_WORD *)&buf[22] = 2112;
                    id v172 = v91;
                    _os_log_impl(&dword_19B3C7000, v99, OS_LOG_TYPE_DEFAULT, "Created copy of original asset at %@ to %@ and assigned it new cloudAssetGUID %@", buf, 0x20u);
                  }
                  [*(id *)(a1 + 56) addObject:v73];
                  if (v119 && !*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
                  {
                    v101 = [*(id *)(a1 + 32) batchCommentText];
                    uint64_t v102 = +[PLCloudSharedComment insertNewCommentIntoAsset:v73 commentDate:0 withText:v101 isLike:0 isMyComment:1 inLibrary:*(void *)(a1 + 40)];
                    uint64_t v103 = *(void *)(*(void *)(a1 + 72) + 8);
                    v104 = *(void **)(v103 + 40);
                    *(void *)(v103 + 40) = v102;

                    v105 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
                    v106 = [NSNumber numberWithBool:1];
                    [v105 setIsCaption:v106];

                    v107 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
                    v108 = [NSNumber numberWithBool:1];
                    [v107 setIsBatchComment:v108];
                  }
                  +[PLResourceInstaller installInternalResourcesForExistingAsset:v73 assumeNoExistingResources:1 referencedResourceURLs:0 error:0];

                  goto LABEL_102;
                }
                if (v31)
                {
                  v53 = PLPhotoSharingGetLog();
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(void *)&uint8_t buf[4] = v142;
                    *(_WORD *)&buf[12] = 2112;
                    *(void *)&buf[14] = v35;
                    _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_DEFAULT, "Moving result from %@ to %@", buf, 0x16u);
                  }

                  uint64_t v54 = *(void *)(a1 + 48);
                  id v150 = 0;
                  char v55 = [MEMORY[0x1E4F8B908] secureMoveItemAtURL:v142 toURL:v35 capabilities:v54 error:&v150];
                  id v56 = v150;
                  if ((v55 & 1) == 0)
                  {
                    v57 = PLPhotoSharingGetLog();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                    {
                      v58 = [v142 path];
                      v59 = [v35 path];
                      *(_DWORD *)buf = 138412802;
                      *(void *)&uint8_t buf[4] = v58;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v59;
                      *(_WORD *)&buf[22] = 2112;
                      id v172 = v56;
                      _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Unable to move \"%@\" to \"%@\": %@", buf, 0x20u);
                    }
LABEL_49:

                    goto LABEL_103;
                  }
                }
                else
                {
                  id v149 = 0;
                  char v60 = [MEMORY[0x1E4F8B908] copyItemAtURL:v142 toURL:v35 error:&v149];
                  id v56 = v149;
                  if ((v60 & 1) == 0)
                  {
                    v57 = PLPhotoSharingGetLog();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                    {
                      v78 = [v142 path];
                      v79 = [v35 path];
                      *(_DWORD *)buf = 138412802;
                      *(void *)&uint8_t buf[4] = v78;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v79;
                      *(_WORD *)&buf[22] = 2112;
                      id v172 = v56;
                      _os_log_impl(&dword_19B3C7000, v57, OS_LOG_TYPE_ERROR, "Unable to copy \"%@\" to \"%@\": %@", buf, 0x20u);
                    }
                    goto LABEL_49;
                  }
                }

                goto LABEL_52;
              }
              if (v131)
              {
                v30 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
                __int16 v42 = *(void **)(a1 + 32);
                id v162 = 0;
                id v161 = 0;
                int v43 = [v42 retrieveURLsFromAssetWithUUID:v23 withExportedFileURL:v30 primaryURL:&v162 videoComplementURL:&v161];
                v142 = v162;
                id v44 = v161;
                if (v43)
                {
                  v139 = v44;
                  BOOL v127 = v44 != 0;
                  os_log_t oslog = [v30 URLByDeletingLastPathComponent];
                  goto LABEL_26;
                }
                v85 = v44;

                v86 = v142;
                goto LABEL_104;
              }
              int v80 = [v24 isLoopingVideo];
              if (v80)
              {
                v81 = PLPhotoSharingGetLog();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&uint8_t buf[4] = v126;
                  _os_log_impl(&dword_19B3C7000, v81, OS_LOG_TYPE_DEFAULT, "Sharing looping video with playback variation %ld", buf, 0xCu);
                }

                if (v25)
                {
                  v30 = [v24 pathForVideoFile];
                  v82 = PLPhotoSharingGetLog();
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v30;
                    v83 = v82;
                    v84 = "Original is a looping video, use the original file %@";
                    goto LABEL_117;
                  }
LABEL_118:

                  if (v30)
                  {
                    v142 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v30 isDirectory:0];
                    if ([v24 canPlayPhotoIris]
                      && ([v24 uuid],
                          v110 = objc_claimAutoreleasedReturnValue(),
                          int v111 = [v116 containsObject:v110],
                          v110,
                          ((v80 | v111) & 1) == 0))
                    {
                      v139 = [(id)objc_opt_class() videoComplementURLForSharingFromAsset:v24];
                    }
                    else
                    {
                      v139 = 0;
                    }
                    os_log_t oslog = 0;
                    BOOL v127 = 0;
                    int v31 = 0;
                    goto LABEL_27;
                  }
                  v86 = PLPhotoSharingGetLog();
                  if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&uint8_t buf[4] = v23;
                    _os_log_impl(&dword_19B3C7000, v86, OS_LOG_TYPE_ERROR, "No local file path on disk to support sharing asset %@", buf, 0xCu);
                  }
                  goto LABEL_104;
                }
                v30 = [v24 pathForFullsizeRenderVideoFile];
                v82 = PLPhotoSharingGetLog();
                if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_118;
                }
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v30;
                v83 = v82;
                v84 = "Original is a regular photo, use the full size render video file %@";
              }
              else if (v25)
              {
                if ([v24 isPlayableVideo:0]) {
                  [v24 pathForVideoFile];
                }
                else {
                v30 = [v24 pathForMediumVideoFile];
                }
                v82 = PLPhotoSharingGetLog();
                if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_118;
                }
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v30;
                v83 = v82;
                v84 = "Original is a video, use the video file %@";
              }
              else
              {
                id v160 = 0;
                id v109 = +[PLResourceChooser fileReservationForLargeDisplayableImageFileForAsset:v24 format:0 allowMetadataSnapshot:0 forceLarge:1 outFilePath:&v160 outImageType:0];
                v30 = v160;
                v82 = PLPhotoSharingGetLog();
                if (!os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_118;
                }
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v30;
                v83 = v82;
                v84 = "Original is not a video, use the large displayable image file %@";
              }
LABEL_117:
              _os_log_impl(&dword_19B3C7000, v83, OS_LOG_TYPE_DEFAULT, v84, buf, 0xCu);
              goto LABEL_118;
            }
LABEL_105:

            uint64_t v21 = v137 + 1;
          }
          while (v129 != v137 + 1);
          uint64_t v112 = [v124 countByEnumeratingWithState:&v163 objects:v173 count:16];
          uint64_t v129 = v112;
        }
        while (v112);
      }

      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) updateCloudLastInterestingChangeDateWithDate:v122];
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) updateCloudLastContributionDateWithDate:v122];

      v113 = obj;
    }
    else
    {
      v114 = PLPhotoSharingGetLog();
      v113 = v114;
      if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
      {
        v115 = [*(id *)(a1 + 32) publishAlbumCloudGUID];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v115;
        _os_log_impl(&dword_19B3C7000, v114, OS_LOG_TYPE_ERROR, "ERROR: couldn't find album with cloud GUID %@ to publish assets from", buf, 0xCu);

        v113 = v114;
      }
    }
  }
  else
  {
    v113 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v113, OS_LOG_TYPE_ERROR, "ERROR: sharingPersonID is nil, ending job", buf, 2u);
    }
  }
}

uint64_t __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke_73(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    uint64_t result = +[PLPhotoSharingHelper enqueueCloudSharedAssetsForPublishToServer:*(void *)(a1 + 32) inSharedAlbum:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      return +[PLPhotoSharingHelper publishCloudSharedCommentToServer:](PLPhotoSharingHelper, "publishCloudSharedCommentToServer:");
    }
  }
  return result;
}

void __55__PLPublishCloudSharedAssetsJob_executeDaemonOperation__block_invoke_65(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = PLPhotoSharingGetLog();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 32) path];
      v8 = [*(id *)(a1 + 40) path];
      int v11 = 138412802;
      v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "could not generate trimmed video for %@ to %@ error %@", (uint8_t *)&v11, 0x20u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 32) path];
      id v10 = [*(id *)(a1 + 40) path];
      int v11 = 138412546;
      v12 = v9;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "generated trimmed video of %@ to %@ ", (uint8_t *)&v11, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)runDaemonSide
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    __int16 v13 = self;
    id v4 = v11;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);
  }
  v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLPublishCloudSharedAssetsJob runDaemonSide]"];
  v6 = [(id)objc_opt_class() highPriorityOperationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__PLPublishCloudSharedAssetsJob_runDaemonSide__block_invoke;
  v8[3] = &unk_1E5875E18;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 addOperationWithBlock:v8];
}

void __46__PLPublishCloudSharedAssetsJob_runDaemonSide__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x19F38D3B0]();
  [*(id *)(a1 + 32) executeDaemonOperation];
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)PLPublishCloudSharedAssetsJob;
  objc_msgSendSuper2(&v3, sel_runDaemonSide);
  [*(id *)(a1 + 40) stillAlive];
}

- (BOOL)shouldArchiveXPCToDisk
{
  return 0;
}

- (int64_t)daemonOperation
{
  return 6;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(PLPublishCloudSharedAssetsJob *)self publishAlbumCloudGUID];
  v6 = [(PLPublishCloudSharedAssetsJob *)self originalAssetUUIDs];
  if ([(PLPublishCloudSharedAssetsJob *)self isNewAlbum]) {
    id v7 = @"YES";
  }
  else {
    id v7 = @"NO";
  }
  v8 = [(PLPublishCloudSharedAssetsJob *)self batchCommentText];
  id v9 = [v3 stringWithFormat:@"%@ (albumGUID=%@ originalAssetUUIDs=%@ isNewAlbum=%@ batchComment=%@)", v4, v5, v6, v7, v8];

  return v9;
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PLPublishCloudSharedAssetsJob;
  id v7 = [(PLCloudSharingJob *)&v15 initFromXPCObject:v6 libraryServicesManager:a4];
  if (v7)
  {
    v8 = PLStringFromXPCDictionary();
    [v7 setPublishAlbumCloudGUID:v8];

    id v9 = PLArrayFromXPCDictionary();
    [v7 setOriginalAssetUUIDs:v9];

    id v10 = PLArrayFromXPCDictionary();
    [v7 setStillImageOnlyAssetUUIDs:v10];

    objc_msgSend(v7, "setIsNewAlbum:", xpc_dictionary_get_BOOL(v6, (const char *)propertyKeyIsNewAlbum));
    id v11 = PLStringFromXPCDictionary();
    [v7 setBatchCommentText:v11];

    __int16 v12 = PLDictionaryFromXPCDictionary();
    [v7 setCustomExportsInfo:v12];

    __int16 v13 = PLDictionaryFromXPCDictionary();
    [v7 setTrimmedVideoPathInfo:v13];
  }
  return v7;
}

- (void)encodeToXPCObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLPublishCloudSharedAssetsJob;
  [(PLDaemonJob *)&v13 encodeToXPCObject:v4];
  v5 = [(PLPublishCloudSharedAssetsJob *)self publishAlbumCloudGUID];
  PLXPCDictionarySetString();

  id v6 = [(PLPublishCloudSharedAssetsJob *)self originalAssetUUIDs];
  PLXPCDictionarySetArray();

  id v7 = [(PLPublishCloudSharedAssetsJob *)self stillImageOnlyAssetUUIDs];
  PLXPCDictionarySetArray();

  xpc_dictionary_set_BOOL(v4, (const char *)propertyKeyIsNewAlbum, [(PLPublishCloudSharedAssetsJob *)self isNewAlbum]);
  v8 = [(PLPublishCloudSharedAssetsJob *)self batchCommentText];
  PLXPCDictionarySetString();

  id v9 = [(PLPublishCloudSharedAssetsJob *)self customExportsInfo];

  if (v9)
  {
    id v10 = [(PLPublishCloudSharedAssetsJob *)self customExportsInfo];
    PLXPCDictionarySetDictionary();
  }
  id v11 = [(PLPublishCloudSharedAssetsJob *)self trimmedVideoPathInfo];

  if (v11)
  {
    __int16 v12 = [(PLPublishCloudSharedAssetsJob *)self trimmedVideoPathInfo];
    PLXPCDictionarySetDictionary();
  }
}

+ (id)videoComplementURLForSharingFromAsset:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 uuid];
    *(_DWORD *)buf = 138412290;
    v20 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "Determining video complement path to use. UUID: \"%@\"", buf, 0xCu);
  }
  id v18 = 0;
  int v6 = [v3 isPlayableVideo:&v18];
  id v7 = (__CFString *)v18;
  if (v6)
  {
    int v8 = [v3 hasAdjustedVideoComplement];
    id v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (v8) {
        id v10 = @"adjusted";
      }
      else {
        id v10 = @"original";
      }
      id v11 = [v3 uuid];
      *(_DWORD *)buf = 138412546;
      v20 = v10;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Using the %@ original video component. UUID: \"%@\"", buf, 0x16u);
    }
    if (v8) {
      [v3 pathForFullsizeRenderVideoFile];
    }
    else {
    uint64_t v12 = [v3 pathForVideoComplementFile];
    }
  }
  else
  {
    objc_super v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v3 uuid];
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Falling back to medium, since the original video component is unsupported. Codec: \"%@\", UUID: \"%@\"", buf, 0x16u);
    }
    uint64_t v12 = [v3 pathForMediumVideoFile];
  }
  objc_super v15 = (void *)v12;
  id v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12 isDirectory:0];

  return v16;
}

+ (void)publishBatchOfOriginalAssetUUIDs:(id)a3 toSharedAlbum:(id)a4 withAssetsSharingInfos:(id)a5 customExportsInfo:(id)a6 trimmedVideoPathInfo:(id)a7 isNewAlbum:(BOOL)a8 batchCommentText:(id)a9
{
  if (a4)
  {
    BOOL v9 = a8;
    id v15 = a9;
    id v16 = a7;
    id v17 = a6;
    id v18 = a5;
    id v19 = a4;
    id v20 = a3;
    id v21 = objc_alloc_init((Class)objc_opt_class());
    [v21 setOriginalAssetUUIDs:v20];

    uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __170__PLPublishCloudSharedAssetsJob_publishBatchOfOriginalAssetUUIDs_toSharedAlbum_withAssetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_isNewAlbum_batchCommentText___block_invoke;
    v25[3] = &unk_1E586F060;
    id v26 = v22;
    id v23 = v22;
    [v18 enumerateKeysAndObjectsUsingBlock:v25];

    [v21 setStillImageOnlyAssetUUIDs:v23];
    uint64_t v24 = [v19 cloudGUID];

    [v21 setPublishAlbumCloudGUID:v24];
    [v21 setIsNewAlbum:v9];
    [v21 setBatchCommentText:v15];

    [v21 setCustomExportsInfo:v17];
    [v21 setTrimmedVideoPathInfo:v16];

    [v21 run];
  }
}

void __170__PLPublishCloudSharedAssetsJob_publishBatchOfOriginalAssetUUIDs_toSharedAlbum_withAssetsSharingInfos_customExportsInfo_trimmedVideoPathInfo_isNewAlbum_batchCommentText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  v5 = [a3 objectForKeyedSubscript:@"useStillImageOnly"];
  int v6 = [v5 BOOLValue];

  if (v6) {
    [*(id *)(a1 + 32) addObject:v7];
  }
}

@end