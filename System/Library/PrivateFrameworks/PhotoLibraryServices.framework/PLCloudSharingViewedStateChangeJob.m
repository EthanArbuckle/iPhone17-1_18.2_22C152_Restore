@interface PLCloudSharingViewedStateChangeJob
+ (void)markAlbum:(id)a3 asHavingUnseenContent:(BOOL)a4;
+ (void)markAssetCollection:(id)a3 asHavingUnreadComments:(BOOL)a4 inAlbum:(id)a5;
+ (void)setLastViewedCommentDate:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5;
+ (void)updateUnviewedAssetCollectionCount:(int)a3 forAlbum:(id)a4;
- (BOOL)albumHasUnseenContent;
- (BOOL)assetCollectionHasUnreadComments;
- (NSDate)assetCollectionLastViewedCommentDate;
- (NSString)albumGUID;
- (NSString)assetCollectionGUID;
- (id)description;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)albumUnviewedAssetCount;
- (int64_t)daemonOperation;
- (int64_t)jobType;
- (void)_executeAlbumUnviewedAssetCountChangedWithGroup;
- (void)_executeAlbumViewedStateChanged;
- (void)_executeAssetCommentsReadStateChangedWithGroup;
- (void)_executeAssetLastViewedCommentDateChangedWithGroup;
- (void)encodeToXPCObject:(id)a3;
- (void)runDaemonSide;
- (void)setAlbumGUID:(id)a3;
- (void)setAlbumHasUnseenContent:(BOOL)a3;
- (void)setAlbumUnviewedAssetCount:(int64_t)a3;
- (void)setAssetCollectionGUID:(id)a3;
- (void)setAssetCollectionHasUnreadComments:(BOOL)a3;
- (void)setAssetCollectionLastViewedCommentDate:(id)a3;
- (void)setJobType:(int64_t)a3;
@end

@implementation PLCloudSharingViewedStateChangeJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionLastViewedCommentDate, 0);
  objc_storeStrong((id *)&self->_assetCollectionGUID, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
}

- (void)setAssetCollectionLastViewedCommentDate:(id)a3
{
}

- (NSDate)assetCollectionLastViewedCommentDate
{
  return self->_assetCollectionLastViewedCommentDate;
}

- (void)setAssetCollectionHasUnreadComments:(BOOL)a3
{
  self->_assetCollectionHasUnreadComments = a3;
}

- (BOOL)assetCollectionHasUnreadComments
{
  return self->_assetCollectionHasUnreadComments;
}

- (void)setAssetCollectionGUID:(id)a3
{
}

- (NSString)assetCollectionGUID
{
  return self->_assetCollectionGUID;
}

- (void)setAlbumUnviewedAssetCount:(int64_t)a3
{
  self->_albumUnviewedAssetCount = a3;
}

- (int64_t)albumUnviewedAssetCount
{
  return self->_albumUnviewedAssetCount;
}

- (void)setAlbumHasUnseenContent:(BOOL)a3
{
  self->_albumHasUnseenContent = a3;
}

- (BOOL)albumHasUnseenContent
{
  return self->_albumHasUnseenContent;
}

- (void)setAlbumGUID:(id)a3
{
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setJobType:(int64_t)a3
{
  self->_jobType = a3;
}

- (int64_t)jobType
{
  return self->_jobType;
}

- (void)_executeAssetLastViewedCommentDateChangedWithGroup
{
  v3 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__PLCloudSharingViewedStateChangeJob__executeAssetLastViewedCommentDateChangedWithGroup__block_invoke;
  v5[3] = &unk_1E5875E18;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 performTransactionAndWait:v5];
}

void __88__PLCloudSharingViewedStateChangeJob__executeAssetLastViewedCommentDateChangedWithGroup__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [*(id *)(a1 + 32) assetCollectionGUID];
  id v4 = [v2 arrayWithObject:v3];
  v5 = +[PLManagedAsset cloudSharedAssetsWithGUIDs:v4 inLibrary:*(void *)(a1 + 40)];

  if ((unint64_t)[v5 count] >= 2)
  {
    id v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [*(id *)(a1 + 32) assetCollectionGUID];
      int v18 = 138412546;
      v19 = v7;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Found more than one asset with cloudAssetGUID %@, returning last one in array %@", (uint8_t *)&v18, 0x16u);
    }
  }
  v8 = [v5 lastObject];
  if (!v8)
  {
    v9 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      v11 = *(void **)(a1 + 32);
      id v12 = v10;
      v13 = [v11 assetCollectionGUID];
      int v18 = 138412546;
      v19 = v10;
      __int16 v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "ERROR %@:couldn't find asset %@", (uint8_t *)&v18, 0x16u);
    }
  }
  v14 = [*(id *)(a1 + 32) assetCollectionLastViewedCommentDate];
  if (v8)
  {
    v15 = [v8 cloudLastViewedCommentDate];
    [v15 timeIntervalSinceDate:v14];
    double v17 = fabs(v16);

    if (v17 > 1.0) {
      [v8 setCloudLastViewedCommentDate:v14];
    }
  }
}

- (void)_executeAssetCommentsReadStateChangedWithGroup
{
  v3 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__PLCloudSharingViewedStateChangeJob__executeAssetCommentsReadStateChangedWithGroup__block_invoke;
  v5[3] = &unk_1E5875E18;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 performTransactionAndWait:v5];
}

void __84__PLCloudSharingViewedStateChangeJob__executeAssetCommentsReadStateChangedWithGroup__block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C978];
  v3 = [*(id *)(a1 + 32) assetCollectionGUID];
  id v4 = [v2 arrayWithObject:v3];
  v5 = +[PLManagedAsset cloudSharedAssetsWithGUIDs:v4 inLibrary:*(void *)(a1 + 40)];

  if ((unint64_t)[v5 count] >= 2)
  {
    id v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [*(id *)(a1 + 32) assetCollectionGUID];
      int v16 = 138412546;
      double v17 = v7;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Found more than one asset with cloudAssetGUID %@, returning last one in array %@", (uint8_t *)&v16, 0x16u);
    }
  }
  v8 = [v5 lastObject];
  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 32) assetCollectionHasUnreadComments];
    if (v9 != [v8 cloudHasUnseenComments])
    {
      [v8 setCloudHasUnseenComments:v9];
      v10 = +[PLNotificationManager sharedManager];
      [v10 noteSharedAssetCommentsUnreadStatusDidChange:v8];
    }
  }
  else
  {
    v11 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = objc_opt_class();
      v13 = *(void **)(a1 + 32);
      id v14 = v12;
      v15 = [v13 assetCollectionGUID];
      int v16 = 138412546;
      double v17 = v12;
      __int16 v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "ERROR %@:couldn't find asset %@", (uint8_t *)&v16, 0x16u);
    }
    [*(id *)(a1 + 32) assetCollectionHasUnreadComments];
  }
}

- (void)_executeAlbumUnviewedAssetCountChangedWithGroup
{
  v3 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __85__PLCloudSharingViewedStateChangeJob__executeAlbumUnviewedAssetCountChangedWithGroup__block_invoke;
  v5[3] = &unk_1E5875E18;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 performTransactionAndWait:v5];
}

void __85__PLCloudSharingViewedStateChangeJob__executeAlbumUnviewedAssetCountChangedWithGroup__block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) albumGUID];
  v3 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v2 inLibrary:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) albumUnviewedAssetCount];
    v5 = [v3 unseenAssetsCount];
    uint64_t v6 = [v5 integerValue];

    if (v6 != v4)
    {
      v7 = [NSNumber numberWithLongLong:v4];
      [v3 setUnseenAssetsCount:v7];
    }
  }
  else
  {
    v8 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      v10 = *(void **)(a1 + 32);
      id v11 = v9;
      id v12 = [v10 albumGUID];
      int v13 = 138412546;
      id v14 = v9;
      __int16 v15 = 2112;
      int v16 = v12;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "ERROR %@:couldn't find album %@", (uint8_t *)&v13, 0x16u);
    }
    [*(id *)(a1 + 32) albumUnviewedAssetCount];
  }
}

- (void)_executeAlbumViewedStateChanged
{
  v3 = [(PLCloudSharingJob *)self transientPhotoLibrary];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  char v13 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__91205;
  v10[4] = __Block_byref_object_dispose__91206;
  id v11 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PLCloudSharingViewedStateChangeJob__executeAlbumViewedStateChanged__block_invoke;
  v6[3] = &unk_1E5874900;
  v8 = v10;
  v6[4] = self;
  id v4 = v3;
  id v7 = v4;
  uint64_t v9 = v12;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __69__PLCloudSharingViewedStateChangeJob__executeAlbumViewedStateChanged__block_invoke_62;
  v5[3] = &unk_1E5872BD0;
  v5[4] = v12;
  void v5[5] = v10;
  [v4 performTransactionAndWait:v6 completionHandler:v5];

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v12, 8);
}

void __69__PLCloudSharingViewedStateChangeJob__executeAlbumViewedStateChanged__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) albumGUID];
  uint64_t v3 = +[PLCloudSharedAlbum cloudSharedAlbumWithGUID:v2 inLibrary:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = objc_opt_class();
      v8 = *(void **)(a1 + 32);
      id v9 = v7;
      v10 = [v8 albumGUID];
      int v22 = 138412546;
      v23 = v7;
      __int16 v24 = 2112;
      uint64_t v25 = (uint64_t)v10;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "ERROR %@:couldn't find album %@", (uint8_t *)&v22, 0x16u);
    }
  }
  uint64_t v11 = [*(id *)(a1 + 32) albumHasUnseenContent];
  id v12 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v12 && v11 != [v12 hasUnseenContentBoolValue])
  {
    char v13 = PLPhotoSharingGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_opt_class();
      __int16 v15 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v16 = v14;
      uint64_t v17 = [v15 localizedTitle];
      __int16 v18 = (void *)v17;
      v19 = @"NO";
      int v22 = 138412802;
      v23 = v14;
      __int16 v24 = 2112;
      if (v11) {
        v19 = @"YES";
      }
      uint64_t v25 = v17;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "%@ : _executeAlbumViewedStateChanged marking album \"%@\" setHasUnseenContent:%@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v21 = [NSNumber numberWithBool:v11];
    [v20 setHasUnseenContent:v21];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __69__PLCloudSharingViewedStateChangeJob__executeAlbumViewedStateChanged__block_invoke_62(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v2 = +[PLNotificationManager sharedManager];
    [v2 noteSharedAlbumUnseenStatusDidChange:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
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
    char v13 = self;
    id v4 = v11;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "%@ : runDaemonSide %@", buf, 0x16u);
  }
  v5 = [MEMORY[0x1E4F8BA48] transaction:"-[PLCloudSharingViewedStateChangeJob runDaemonSide]"];
  uint64_t v6 = [(id)objc_opt_class() lowPriorityOperationQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__PLCloudSharingViewedStateChangeJob_runDaemonSide__block_invoke;
  v8[3] = &unk_1E5875E18;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 addOperationWithBlock:v8];
}

void __51__PLCloudSharingViewedStateChangeJob_runDaemonSide__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x19F38D3B0]();
  switch([*(id *)(a1 + 32) jobType])
  {
    case 1:
      [*(id *)(a1 + 32) _executeAlbumViewedStateChanged];
      break;
    case 2:
      [*(id *)(a1 + 32) _executeAlbumUnviewedAssetCountChangedWithGroup];
      break;
    case 3:
      [*(id *)(a1 + 32) _executeAssetCommentsReadStateChangedWithGroup];
      break;
    case 4:
      [*(id *)(a1 + 32) _executeAssetLastViewedCommentDateChangedWithGroup];
      break;
    default:
      uint64_t v3 = PLPhotoSharingGetLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        id v4 = objc_opt_class();
        v5 = *(void **)(a1 + 32);
        id v6 = v4;
        *(_DWORD *)buf = 138412546;
        id v9 = v4;
        __int16 v10 = 2048;
        uint64_t v11 = [v5 jobType];
        _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "ERROR %@:invalid job type: %lld", buf, 0x16u);
      }
      break;
  }
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)PLCloudSharingViewedStateChangeJob;
  objc_msgSendSuper2(&v7, sel_runDaemonSide);
  [*(id *)(a1 + 40) stillAlive];
}

- (int64_t)daemonOperation
{
  return 9;
}

- (id)description
{
  switch([(PLCloudSharingViewedStateChangeJob *)self jobType])
  {
    case 1:
      uint64_t v3 = NSString;
      uint64_t v4 = objc_opt_class();
      v5 = [(PLCloudSharingViewedStateChangeJob *)self albumGUID];
      BOOL v6 = [(PLCloudSharingViewedStateChangeJob *)self albumHasUnseenContent];
      objc_super v7 = @"NO";
      if (v6) {
        objc_super v7 = @"YES";
      }
      [v3 stringWithFormat:@"%@ (PLViewedStateChangeAlbumReadState albumGUID=%@ hasUnseenContent=%@) ", v4, v5, v7];
      goto LABEL_7;
    case 2:
      id v9 = NSString;
      uint64_t v10 = objc_opt_class();
      v5 = [(PLCloudSharingViewedStateChangeJob *)self albumGUID];
      [v9 stringWithFormat:@"%@ (PLViewedStateChangeAlbumUnviewedAssetCount albumGUID=%@ unviewedAssetCollectionCount=%lld) ", v10, v5, -[PLCloudSharingViewedStateChangeJob albumUnviewedAssetCount](self, "albumUnviewedAssetCount")];
      v8 = LABEL_7:;
      goto LABEL_13;
    case 3:
      uint64_t v11 = NSString;
      uint64_t v12 = objc_opt_class();
      v5 = [(PLCloudSharingViewedStateChangeJob *)self albumGUID];
      char v13 = [(PLCloudSharingViewedStateChangeJob *)self assetCollectionGUID];
      BOOL v14 = [(PLCloudSharingViewedStateChangeJob *)self assetCollectionHasUnreadComments];
      __int16 v15 = @"NO";
      if (v14) {
        __int16 v15 = @"YES";
      }
      v8 = [v11 stringWithFormat:@"%@ (PLViewedStateChangeAssetCommentsReadState albumGUID=%@ collectionGUID=%@ hasUnreadComments=%@) ", v12, v5, v13, v15];
      goto LABEL_12;
    case 4:
      id v16 = NSString;
      uint64_t v17 = objc_opt_class();
      v5 = [(PLCloudSharingViewedStateChangeJob *)self albumGUID];
      char v13 = [(PLCloudSharingViewedStateChangeJob *)self assetCollectionGUID];
      __int16 v18 = [(PLCloudSharingViewedStateChangeJob *)self assetCollectionLastViewedCommentDate];
      v8 = [v16 stringWithFormat:@"%@ (PLViewedStateChangeAssetLastViewedCommentDate albumGUID=%@ collectionGUID=%@ lasViewedCommentDate=%@) ", v17, v5, v13, v18];

LABEL_12:
LABEL_13:

      break;
    default:
      v8 = [NSString stringWithFormat:@"%@ unknown job type %lld ", objc_opt_class(), -[PLCloudSharingViewedStateChangeJob jobType](self, "jobType")];
      break;
  }
  return v8;
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLCloudSharingViewedStateChangeJob;
  id v7 = [(PLCloudSharingJob *)&v12 initFromXPCObject:v6 libraryServicesManager:a4];
  if (v7)
  {
    objc_msgSend(v7, "setJobType:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyViewStateChangeJobType));
    v8 = PLStringFromXPCDictionary();
    [v7 setAlbumGUID:v8];

    objc_msgSend(v7, "setAlbumHasUnseenContent:", xpc_dictionary_get_BOOL(v6, (const char *)propertyKeyAlbumHasUnseenContent));
    objc_msgSend(v7, "setAlbumUnviewedAssetCount:", xpc_dictionary_get_int64(v6, (const char *)propertyKeyAlbumUnviewedAssetCount));
    id v9 = PLStringFromXPCDictionary();
    [v7 setAssetCollectionGUID:v9];

    objc_msgSend(v7, "setAssetCollectionHasUnreadComments:", xpc_dictionary_get_BOOL(v6, (const char *)propertyKeyAssetCollectionHasUnreadComments));
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", (double)xpc_dictionary_get_date(v6, (const char *)propertyKeyAssetCollectionLastViewedCommentDate));
    [v7 setAssetCollectionLastViewedCommentDate:v10];
  }
  return v7;
}

- (void)encodeToXPCObject:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PLCloudSharingViewedStateChangeJob;
  id v4 = a3;
  [(PLDaemonJob *)&v10 encodeToXPCObject:v4];
  xpc_dictionary_set_int64(v4, (const char *)propertyKeyViewStateChangeJobType, [(PLCloudSharingViewedStateChangeJob *)self jobType]);
  v5 = [(PLCloudSharingViewedStateChangeJob *)self albumGUID];
  PLXPCDictionarySetString();

  xpc_dictionary_set_BOOL(v4, (const char *)propertyKeyAlbumHasUnseenContent, [(PLCloudSharingViewedStateChangeJob *)self albumHasUnseenContent]);
  xpc_dictionary_set_int64(v4, (const char *)propertyKeyAlbumUnviewedAssetCount, [(PLCloudSharingViewedStateChangeJob *)self albumUnviewedAssetCount]);
  id v6 = [(PLCloudSharingViewedStateChangeJob *)self assetCollectionGUID];
  PLXPCDictionarySetString();

  xpc_dictionary_set_BOOL(v4, (const char *)propertyKeyAssetCollectionHasUnreadComments, [(PLCloudSharingViewedStateChangeJob *)self assetCollectionHasUnreadComments]);
  id v7 = (const char *)propertyKeyAssetCollectionLastViewedCommentDate;
  v8 = [(PLCloudSharingViewedStateChangeJob *)self assetCollectionLastViewedCommentDate];
  [v8 timeIntervalSinceReferenceDate];
  xpc_dictionary_set_date(v4, v7, (uint64_t)v9);
}

+ (void)setLastViewedCommentDate:(id)a3 forAssetCollection:(id)a4 inAlbum:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v12 = objc_alloc_init((Class)objc_opt_class());
  [v12 setJobType:4];
  [v12 setAssetCollectionLastViewedCommentDate:v9];

  objc_super v10 = [v8 GUID];

  [v12 setAssetCollectionGUID:v10];
  uint64_t v11 = [v7 GUID];

  [v12 setAlbumGUID:v11];
  [v12 run];
}

+ (void)markAssetCollection:(id)a3 asHavingUnreadComments:(BOOL)a4 inAlbum:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v11 = objc_alloc_init((Class)objc_opt_class());
  [v11 setJobType:3];
  id v9 = [v8 GUID];

  [v11 setAssetCollectionGUID:v9];
  [v11 setAssetCollectionHasUnreadComments:v5];
  objc_super v10 = [v7 GUID];

  [v11 setAlbumGUID:v10];
  [v11 run];
}

+ (void)updateUnviewedAssetCollectionCount:(int)a3 forAlbum:(id)a4
{
  id v5 = a4;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setJobType:2];
  id v6 = [v5 GUID];

  [v7 setAlbumGUID:v6];
  [v7 setAlbumUnviewedAssetCount:a3];
  [v7 run];
}

+ (void)markAlbum:(id)a3 asHavingUnseenContent:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v7 = objc_alloc_init((Class)objc_opt_class());
  [v7 setJobType:1];
  id v6 = [v5 GUID];

  [v7 setAlbumGUID:v6];
  [v7 setAlbumHasUnseenContent:v4];
  [v7 run];
}

@end