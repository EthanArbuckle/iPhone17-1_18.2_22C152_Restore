@interface PLCloudSharedCommentsJob
+ (void)assetsdLocallyProcessAddedComments:(id)a3 assetGUID:(id)a4 albumGUID:(id)a5 info:(id)a6 libraryServicesManager:(id)a7;
+ (void)deleteSharedCommentFromServer:(id)a3;
+ (void)locallyProcessAddedComments:(id)a3 assetGUID:(id)a4 albumGUID:(id)a5 info:(id)a6;
+ (void)locallyProcessDeletedComments:(id)a3 info:(id)a4;
+ (void)publishCommentToServer:(id)a3;
- (BOOL)shouldArchiveXPCToDisk;
- (NSArray)msASComments;
- (NSDictionary)mstreamdInfoDictionary;
- (NSString)albumGUID;
- (NSString)assetGUID;
- (NSString)commentGUID;
- (id)description;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)daemonOperation;
- (int64_t)jobType;
- (void)encodeToXPCObject:(id)a3;
- (void)executeDeleteCommentFromServer;
- (void)executeProcessServerNotificationOfCommentChanges;
- (void)executePublishCommentToServer;
- (void)runDaemonSide;
- (void)setAlbumGUID:(id)a3;
- (void)setAssetGUID:(id)a3;
- (void)setCommentGUID:(id)a3;
- (void)setJobType:(int64_t)a3;
- (void)setMsASComments:(id)a3;
- (void)setMstreamdInfoDictionary:(id)a3;
@end

@implementation PLCloudSharedCommentsJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mstreamdInfoDictionary, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_assetGUID, 0);
  objc_storeStrong((id *)&self->_commentGUID, 0);
  objc_storeStrong((id *)&self->_msASComments, 0);
}

- (void)setMstreamdInfoDictionary:(id)a3
{
}

- (NSDictionary)mstreamdInfoDictionary
{
  return self->_mstreamdInfoDictionary;
}

- (void)setAlbumGUID:(id)a3
{
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setAssetGUID:(id)a3
{
}

- (NSString)assetGUID
{
  return self->_assetGUID;
}

- (void)setCommentGUID:(id)a3
{
}

- (NSString)commentGUID
{
  return self->_commentGUID;
}

- (void)setMsASComments:(id)a3
{
}

- (NSArray)msASComments
{
  return self->_msASComments;
}

- (void)setJobType:(int64_t)a3
{
  self->_jobType = a3;
}

- (int64_t)jobType
{
  return self->_jobType;
}

- (void)executeDeleteCommentFromServer
{
  id v2 = [(PLCloudSharedCommentsJob *)self commentGUID];
  +[PLPhotoSharingHelper deleteCommentWithGUIDFromServer:v2];
}

- (void)executePublishCommentToServer
{
  v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "executePublishCommentToServer", buf, 2u);
  }

  v4 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  v5 = [(PLCloudSharedCommentsJob *)self commentGUID];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__PLCloudSharedCommentsJob_executePublishCommentToServer__block_invoke;
  v8[3] = &unk_1E5875E18;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [v6 performTransactionAndWait:v8];
}

void __57__PLCloudSharedCommentsJob_executePublishCommentToServer__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = +[PLCloudSharedComment cloudSharedCommentWithGUID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  if (!v2)
  {
    v3 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v12 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "ERROR: did not find comment with GUID %@ to publish", buf, 0xCu);
    }
    goto LABEL_17;
  }
  +[PLPhotoSharingHelper publishCloudSharedCommentToServer:v2];
  if ([v2 isInterestingForAlbumsSorting])
  {
    v3 = [v2 asset];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v4 = [v3 albums];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v15;
      *(void *)&long long v6 = 138412546;
      long long v13 = v6;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v4);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EEC33B20, v13))
          {
            v11 = [v2 commentDate];
            [v10 updateCloudLastInterestingChangeDateWithDate:v11];
          }
          else
          {
            v11 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v13;
              v19 = v3;
              __int16 v20 = 2112;
              v21 = v10;
              _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "ERROR: cloud asset in a non-cloud album. Asset: %@, album: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
      }
      while (v7);
    }

LABEL_17:
  }
}

- (void)executeProcessServerNotificationOfCommentChanges
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(PLCloudSharedCommentsJob *)self msASComments];
    *(_DWORD *)buf = 138412290;
    long long v14 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "executeProcessServerNotificationOfCommentAdditions %@", buf, 0xCu);
  }
  uint64_t v5 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  BOOL v6 = [(PLCloudSharedCommentsJob *)self jobType] == 1;
  int64_t v7 = [(PLCloudSharedCommentsJob *)self jobType];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PLCloudSharedCommentsJob_executeProcessServerNotificationOfCommentChanges__block_invoke;
  v9[3] = &unk_1E58707A8;
  v9[4] = self;
  id v10 = v5;
  BOOL v11 = v6;
  BOOL v12 = v7 == 2;
  id v8 = v5;
  [v8 performTransactionAndWait:v9];
}

void __76__PLCloudSharedCommentsJob_executeProcessServerNotificationOfCommentChanges__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) msASComments];
  uint64_t v67 = [obj countByEnumeratingWithState:&v77 objects:v89 count:16];
  if (v67)
  {
    uint64_t v66 = *(void *)v78;
    *(void *)&long long v2 = 134217984;
    long long v63 = v2;
    uint64_t v65 = v1;
    do
    {
      for (uint64_t i = 0; i != v67; uint64_t i = v28 + 1)
      {
        if (*(void *)v78 != v66) {
          objc_enumerationMutation(obj);
        }
        uint64_t v68 = i;
        v4 = *(void **)(*((void *)&v77 + 1) + 8 * i);
        uint64_t v5 = objc_msgSend(v4, "GUID", v63);
        id v6 = +[PLCloudSharedComment cloudSharedCommentWithGUID:v5 inLibrary:*(void *)(v1 + 40)];

        if (!v6)
        {
          int64_t v7 = [v4 content];
          uint64_t v8 = [v4 isLike];
          id v9 = [v4 timestamp];
          id v10 = [*(id *)(v1 + 40) managedObjectContext];
          BOOL v11 = +[PLCloudSharedComment cloudSharedCommentsWithCommentDate:v9 inManagedObjectContext:v10];

          long long v75 = 0u;
          long long v76 = 0u;
          long long v73 = 0u;
          long long v74 = 0u;
          id v12 = v11;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v73 objects:v88 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v74;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v74 != v15) {
                  objc_enumerationMutation(v12);
                }
                long long v17 = *(void **)(*((void *)&v73 + 1) + 8 * j);
                if ([v17 matchesCommentText:v7 isLike:v8])
                {
                  id v6 = v17;
                  goto LABEL_17;
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v73 objects:v88 count:16];
              if (v14) {
                continue;
              }
              break;
            }
            id v6 = 0;
LABEL_17:
            uint64_t v1 = v65;
          }
          else
          {
            id v6 = 0;
          }
        }
        if (*(unsigned char *)(v1 + 48))
        {
          v18 = (void *)MEMORY[0x1E4F1C978];
          v19 = [*(id *)(v1 + 32) assetGUID];
          __int16 v20 = [v18 arrayWithObject:v19];
          v21 = +[PLManagedAsset cloudSharedAssetsWithGUIDs:v20 inLibrary:*(void *)(v1 + 40)];
          v22 = [v21 lastObject];

          if (v22)
          {
            if (!v6) {
              goto LABEL_23;
            }
            goto LABEL_40;
          }
          v29 = [*(id *)(v1 + 40) pathManager];
          v30 = [v29 directoryPathForInFlightComments:1];
          v31 = [*(id *)(v1 + 32) assetGUID];
          v32 = [v30 stringByAppendingPathComponent:v31];

          if (v32)
          {
            v33 = [MEMORY[0x1E4F1CA48] arrayWithContentsOfFile:v32];
            if (!v33)
            {
              v33 = [MEMORY[0x1E4F1CA48] array];
            }
          }
          else
          {
            v33 = 0;
          }
          v35 = [v4 GUID];
          [v33 addObject:v35];

          v36 = [MEMORY[0x1E4F28CB8] defaultManager];
          [v36 removeItemAtPath:v32 error:0];

          v37 = PLPhotoSharingGetLog();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = [v4 GUID];
            v39 = [*(id *)(v65 + 32) assetGUID];
            uint64_t v40 = [v33 count];
            *(_DWORD *)buf = 138412802;
            uint64_t v83 = (uint64_t)v38;
            __int16 v84 = 2112;
            v85 = v39;
            __int16 v86 = 2048;
            uint64_t v87 = v40;
            _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_DEFAULT, "saving inflight comment GUID %@ for asset %@, total inflight count for this asset %lu", buf, 0x20u);
          }
          v41 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v33 format:100 options:0 error:0];
          if ([v41 writeToFile:v32 options:1073741825 error:0])
          {

            uint64_t v1 = v65;
            if (!v6)
            {
LABEL_23:
              uint64_t v23 = [v4 timestamp];
              [v4 content];
              v25 = uint64_t v24 = v1;
              +[PLCloudSharedComment insertNewCommentIntoAsset:commentDate:withText:isLike:isMyComment:inLibrary:](PLCloudSharedComment, "insertNewCommentIntoAsset:commentDate:withText:isLike:isMyComment:inLibrary:", v22, v23, v25, [v4 isLike], objc_msgSend(v4, "isMine"), *(void *)(v24 + 40));
              id v6 = (id)objc_claimAutoreleasedReturnValue();

              v26 = PLPhotoSharingGetLog();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v83 = (uint64_t)v6;
                _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "inserting new PLCloudSharedComment %@", buf, 0xCu);
              }

              uint64_t v1 = v65;
            }
LABEL_40:
            v42 = [v4 GUID];
            [v6 setCloudGUID:v42];

            v43 = [v4 personID];
            [v6 setCommenterHashedPersonID:v43];

            v44 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isDeletable"));
            [v6 setIsDeletable:v44];

            v45 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isLike"));
            [v6 setIsLike:v45];

            v46 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isCaption"));
            [v6 setIsCaption:v46];

            v47 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isBatchComment"));
            [v6 setIsBatchComment:v47];

            v48 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isMine"));
            [v6 setIsMyComment:v48];

            v49 = [v4 content];
            [v6 setCommentText:v49];

            v50 = [v4 clientTimestamp];
            [v6 setCommentClientDate:v50];

            v51 = [v6 asset];

            if (v22 && !v51) {
              [v22 addComment:v6];
            }
            v52 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v83 = (uint64_t)v6;
              __int16 v84 = 2112;
              v85 = v4;
              _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_DEFAULT, "resulting comment %@ for MSASComment %@", buf, 0x16u);
            }

            if (v22)
            {
              int v53 = [v6 isLikeBoolValue];
              v54 = +[PLNotificationManager sharedManager];
              v55 = [*(id *)(v1 + 32) mstreamdInfoDictionary];
              if (v53) {
                [v54 noteDidReceiveLike:v6 mstreamdInfo:v55];
              }
              else {
                [v54 noteDidReceiveComment:v6 mstreamdInfo:v55];
              }

              if ([v6 isInterestingForAlbumsSorting])
              {
                long long v71 = 0u;
                long long v72 = 0u;
                long long v69 = 0u;
                long long v70 = 0u;
                v33 = [v22 albums];
                uint64_t v56 = [v33 countByEnumeratingWithState:&v69 objects:v81 count:16];
                if (v56)
                {
                  uint64_t v57 = v56;
                  uint64_t v58 = *(void *)v70;
                  do
                  {
                    for (uint64_t k = 0; k != v57; ++k)
                    {
                      if (*(void *)v70 != v58) {
                        objc_enumerationMutation(v33);
                      }
                      v60 = *(void **)(*((void *)&v69 + 1) + 8 * k);
                      if ([v60 conformsToProtocol:&unk_1EEC33B20])
                      {
                        v61 = [v6 commentDate];
                        [v60 updateCloudLastInterestingChangeDateWithDate:v61];
                      }
                      else
                      {
                        v61 = PLPhotoSharingGetLog();
                        if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412546;
                          uint64_t v83 = (uint64_t)v22;
                          __int16 v84 = 2112;
                          v85 = v60;
                          _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_ERROR, "ERROR: cloud asset in a non-cloud album. Asset: %@, album: %@", buf, 0x16u);
                        }
                      }
                    }
                    uint64_t v57 = [v33 countByEnumeratingWithState:&v69 objects:v81 count:16];
                  }
                  while (v57);
                  goto LABEL_65;
                }
                goto LABEL_66;
              }
            }
          }
          else
          {
            v62 = PLPhotoSharingGetLog();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v83 = (uint64_t)v32;
              _os_log_impl(&dword_19B3C7000, v62, OS_LOG_TYPE_ERROR, "could not write asset inflight comment to path %@, skipping adding comment", buf, 0xCu);
            }

LABEL_65:
            uint64_t v1 = v65;
LABEL_66:
          }
          uint64_t v28 = v68;
          goto LABEL_68;
        }
        if (*(unsigned char *)(v1 + 49))
        {
          v27 = [v6 asset];

          uint64_t v28 = v68;
          if (v27)
          {
            v22 = [v6 asset];
            [v22 deleteComment:v6];
          }
          else
          {
            v22 = [v6 managedObjectContext];
            [v22 deleteObject:v6];
          }
        }
        else
        {
          v22 = PLPhotoSharingGetLog();
          uint64_t v28 = v68;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v34 = [*(id *)(v1 + 32) jobType];
            *(_DWORD *)buf = v63;
            uint64_t v83 = v34;
            _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "ERROR: unknown comment change job type %lld", buf, 0xCu);
          }
        }
LABEL_68:
      }
      uint64_t v67 = [obj countByEnumeratingWithState:&v77 objects:v89 count:16];
    }
    while (v67);
  }
}

- (void)runDaemonSide
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = PLPhotoSharingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = (id)objc_opt_class();
    __int16 v12 = 2112;
    uint64_t v13 = self;
    id v4 = v11;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);
  }
  uint64_t v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudSharedCommentsJob runDaemonSide]"];
  id v6 = [(id)objc_opt_class() highPriorityOperationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__PLCloudSharedCommentsJob_runDaemonSide__block_invoke;
  v8[3] = &unk_1E5875E18;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 addOperationWithBlock:v8];
}

void __41__PLCloudSharedCommentsJob_runDaemonSide__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  long long v2 = (void *)MEMORY[0x19F38D3B0]();
  switch([*(id *)(a1 + 32) jobType])
  {
    case 1:
    case 2:
      [*(id *)(a1 + 32) executeProcessServerNotificationOfCommentChanges];
      break;
    case 4:
      [*(id *)(a1 + 32) executePublishCommentToServer];
      break;
    case 5:
      [*(id *)(a1 + 32) executeDeleteCommentFromServer];
      break;
    default:
      v3 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v7 = v4;
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Error: unknown job type for %@", buf, 0xCu);
      }

      break;
  }
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)PLCloudSharedCommentsJob;
  objc_msgSendSuper2(&v5, sel_runDaemonSide);
  [*(id *)(a1 + 40) stillAlive];
}

- (BOOL)shouldArchiveXPCToDisk
{
  long long v2 = [(PLCloudSharedCommentsJob *)self mstreamdInfoDictionary];
  BOOL v3 = v2 != 0;

  return v3;
}

- (int64_t)daemonOperation
{
  return 8;
}

- (id)description
{
  unint64_t v3 = [(PLCloudSharedCommentsJob *)self jobType] - 1;
  if (v3 < 5 && ((0x1Bu >> v3) & 1) != 0)
  {
    uint64_t v4 = off_1E58707C8[v3];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown job type %lld", -[PLCloudSharedCommentsJob jobType](self, "jobType"));
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_super v5 = NSString;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [(PLCloudSharedCommentsJob *)self msASComments];
  uint64_t v8 = [(PLCloudSharedCommentsJob *)self commentGUID];
  id v9 = [(PLCloudSharedCommentsJob *)self assetGUID];
  id v10 = [(PLCloudSharedCommentsJob *)self albumGUID];
  id v11 = [(PLCloudSharedCommentsJob *)self mstreamdInfoDictionary];
  __int16 v12 = [v5 stringWithFormat:@"%@ (%@ MSASComments=%@ commmentGUID=%@ assetGUID=%@ albumGUID=%@ info=%@) ", v6, v4, v7, v8, v9, v10, v11];

  return v12;
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLCloudSharedCommentsJob;
  id v7 = [(PLCloudSharingJob *)&v19 initFromXPCObject:v6 libraryServicesManager:a4];
  if (v7)
  {
    uint64_t v8 = PLDataFromXPCDictionary();
    id v9 = (void *)MEMORY[0x1E4F28DC0];
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    __int16 v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = objc_msgSend(v9, "pl_safeUnarchiveObjectFromData:classes:", v8, v12);

    if (v13) {
      [v7 setMsASComments:v13];
    }
    uint64_t v14 = PLStringFromXPCDictionary();
    [v7 setCommentGUID:v14];

    uint64_t v15 = PLStringFromXPCDictionary();
    [v7 setAssetGUID:v15];

    long long v16 = PLStringFromXPCDictionary();
    [v7 setAlbumGUID:v16];

    long long v17 = PLDictionaryFromXPCDictionary();
    [v7 setMstreamdInfoDictionary:v17];

    objc_msgSend(v7, "setJobType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyCommentJobType));
  }

  return v7;
}

- (void)encodeToXPCObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PLCloudSharedCommentsJob;
  id v4 = a3;
  [(PLDaemonJob *)&v15 encodeToXPCObject:v4];
  objc_super v5 = (void *)MEMORY[0x1E4F28DB0];
  id v6 = [(PLCloudSharedCommentsJob *)self msASComments];
  id v14 = 0;
  id v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v14];
  id v8 = v14;

  if (!v7)
  {
    id v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Failed to archive msASCommentsData, error: %@", buf, 0xCu);
    }
  }
  PLXPCDictionarySetData();
  id v10 = [(PLCloudSharedCommentsJob *)self commentGUID];
  PLXPCDictionarySetString();

  uint64_t v11 = [(PLCloudSharedCommentsJob *)self assetGUID];
  PLXPCDictionarySetString();

  __int16 v12 = [(PLCloudSharedCommentsJob *)self albumGUID];
  PLXPCDictionarySetString();

  uint64_t v13 = [(PLCloudSharedCommentsJob *)self mstreamdInfoDictionary];
  PLXPCDictionarySetDictionary();

  xpc_dictionary_set_int64(v4, (const char *)propertyKeyCommentJobType, [(PLCloudSharedCommentsJob *)self jobType]);
}

+ (void)locallyProcessDeletedComments:(id)a3 info:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setJobType:2];
  [v7 setMsASComments:v6];

  [v7 setMstreamdInfoDictionary:v5];
  [v7 runAndWaitForMessageToBeSent];
}

+ (void)assetsdLocallyProcessAddedComments:(id)a3 assetGUID:(id)a4 albumGUID:(id)a5 info:(id)a6 libraryServicesManager:(id)a7
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  if (PLIsAssetsd())
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PLCloudSharedCommentsJob.m", 94, @"Invalid parameter not satisfying: %@", @"PLIsAssetsd()" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  objc_super v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"PLCloudSharedCommentsJob.m", 95, @"Invalid parameter not satisfying: %@", @"libraryServicesManager" object file lineNumber description];

LABEL_3:
  id v20 = objc_alloc_init((Class)objc_opt_class());
  [v20 setJobType:1];
  [v20 setMsASComments:v17];

  [v20 setAssetGUID:v16];
  [v20 setAlbumGUID:v15];

  [v20 setMstreamdInfoDictionary:v14];
  [v20 setLibraryServicesManager:v13];

  [v20 runDaemonSide];
}

+ (void)locallyProcessAddedComments:(id)a3 assetGUID:(id)a4 albumGUID:(id)a5 info:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init((Class)objc_opt_class());
  [v13 setJobType:1];
  [v13 setMsASComments:v12];

  [v13 setAssetGUID:v11];
  [v13 setAlbumGUID:v10];

  [v13 setMstreamdInfoDictionary:v9];
  [v13 runAndWaitForMessageToBeSent];
}

+ (void)deleteSharedCommentFromServer:(id)a3
{
  id v3 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setJobType:5];
  id v4 = [v3 cloudGUID];
  [v7 setCommentGUID:v4];

  id v5 = [v3 asset];

  id v6 = [v5 cloudAssetGUID];
  [v7 setAssetGUID:v6];

  [v7 run];
}

+ (void)publishCommentToServer:(id)a3
{
  id v3 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setJobType:4];
  id v4 = [v3 cloudGUID];
  [v7 setCommentGUID:v4];

  id v5 = [v3 asset];

  id v6 = [v5 cloudAssetGUID];
  [v7 setAssetGUID:v6];

  [v7 run];
}

@end