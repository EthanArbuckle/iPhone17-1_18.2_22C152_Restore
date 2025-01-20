@interface PLFileSystemPersistence
+ (id)filesystemPersistenceBatchItemForFileAtURL:(id)a3;
+ (id)persistedAttributesForFileAtURL:(id)a3;
+ (id)persistedAttributesForFileAtURL:(id)a3 exists:(BOOL *)a4 includeUnknownAttributes:(BOOL)a5;
+ (id)persistenceKeyTypes;
+ (id)sharedInstance;
+ (void)clearAllAttributesForFileAtUrl:(id)a3;
+ (void)performBlockOnWriterQueue:(id)a3;
+ (void)persistData:(id)a3 forKey:(id)a4 fileURL:(id)a5;
+ (void)persistMetadata:(id)a3 fileURL:(id)a4;
+ (void)persistString:(id)a3 forKey:(id)a4 fileURL:(id)a5;
+ (void)persistUInt16:(unsigned __int16)a3 forKey:(id)a4 fileURL:(id)a5;
+ (void)persistUUIDString:(id)a3 forKey:(id)a4 fileURL:(id)a5;
- (PLFileSystemPersistence)init;
- (void)_backgroundWriteData:(id)a3 toFileAtURL:(id)a4;
- (void)_performOnWriterQueueWithIdentifier:(const char *)a3 block:(id)a4;
@end

@implementation PLFileSystemPersistence

- (void).cxx_destruct
{
}

- (void)_performOnWriterQueueWithIdentifier:(const char *)a3 block:(id)a4
{
  id v6 = a4;
  v7 = +[PLXPCTransaction transaction:a3];
  writerQueue = self->_writerQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PLFileSystemPersistence__performOnWriterQueueWithIdentifier_block___block_invoke;
  v11[3] = &unk_1E58A1F88;
  id v12 = v7;
  id v13 = v6;
  id v9 = v7;
  id v10 = v6;
  pl_dispatch_async(writerQueue, v11);
}

uint64_t __69__PLFileSystemPersistence__performOnWriterQueueWithIdentifier_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v2 = *(void **)(a1 + 32);
  return [v2 stillAlive];
}

- (void)_backgroundWriteData:(id)a3 toFileAtURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__PLFileSystemPersistence__backgroundWriteData_toFileAtURL___block_invoke;
  v10[3] = &unk_1E58A1EF8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  -[PLFileSystemPersistence _performOnWriterQueueWithIdentifier:block:](self, "_performOnWriterQueueWithIdentifier:block:", "-[PLFileSystemPersistence _backgroundWriteData:toFileAtURL:]", v10);
}

void __60__PLFileSystemPersistence__backgroundWriteData_toFileAtURL___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v8 = 0;
  char v4 = [v2 writeToURL:v3 options:1073741825 error:&v8];
  id v5 = v8;
  if ((v4 & 1) == 0)
  {
    id v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = [*(id *)(a1 + 40) path];
      *(_DWORD *)buf = 138412546;
      id v10 = v7;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Failed to persist to \"%@\": %@", buf, 0x16u);
    }
  }
}

- (PLFileSystemPersistence)init
{
  v8.receiver = self;
  v8.super_class = (Class)PLFileSystemPersistence;
  v2 = [(PLFileSystemPersistence *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.assetsd.PLFileSystemPersistence.writer", 0);
    writerQueue = v2->_writerQueue;
    v2->_writerQueue = (OS_dispatch_queue *)v3;

    id v5 = v2->_writerQueue;
    id v6 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v5, v6);
  }
  return v2;
}

+ (void)performBlockOnWriterQueue:(id)a3
{
  id v4 = a3;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (PLIsReallyAssetsd_isAssetsd
    || (__PLIsAssetsdProxyService & 1) != 0
    || (pl_dispatch_once(&PLIsInternalTool_didCheckReadOnly, &__block_literal_global_59), PLIsInternalTool_isInternalTool))
  {
    id v5 = [a1 sharedInstance];
    [v5 _performOnWriterQueueWithIdentifier:"+[PLFileSystemPersistence performBlockOnWriterQueue:]" block:v4];
  }
  else
  {
    id v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "Unsupported client call to performBlockOnWriterQueue:", v6, 2u);
    }
  }
}

+ (void)persistMetadata:(id)a3 fileURL:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (PLIsReallyAssetsd_isAssetsd
    || (__PLIsAssetsdProxyService & 1) != 0
    || (pl_dispatch_once(&PLIsInternalTool_didCheckReadOnly, &__block_literal_global_59), PLIsInternalTool_isInternalTool))
  {
    objc_super v8 = [a1 sharedInstance];
    [v8 _backgroundWriteData:v6 toFileAtURL:v7];
  }
  else
  {
    objc_super v8 = PLBackendGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [v7 path];
      int v10 = 138543362;
      __int16 v11 = v9;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Unsupported client call to persistMetadata:fileURL: with path %{public}@", (uint8_t *)&v10, 0xCu);
    }
  }
}

+ (void)persistString:(id)a3 forKey:(id)a4 fileURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [a3 dataUsingEncoding:4];
  [a1 persistData:v10 forKey:v9 fileURL:v8];
}

+ (void)persistUInt16:(unsigned __int16)a3 forKey:(id)a4 fileURL:(id)a5
{
  unsigned __int16 v11 = a3;
  id v7 = (void *)MEMORY[0x1E4F1C9B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 dataWithBytes:&v11 length:2];
  [a1 persistData:v10 forKey:v9 fileURL:v8];
}

+ (void)persistUUIDString:(id)a3 forKey:(id)a4 fileURL:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  PLUUIDDataFromString(a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [a1 persistData:v10 forKey:v9 fileURL:v8];
}

+ (void)clearAllAttributesForFileAtUrl:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x19F38F510]();
  if (!v3) {
    goto LABEL_22;
  }
  id v5 = [v3 path];
  id v6 = (const char *)[v5 fileSystemRepresentation];

  int v7 = open(v6, 0x200000);
  if ((v7 & 0x80000000) == 0)
  {
    int v8 = v7;
    ssize_t v9 = flistxattr(v7, 0, 0, 0);
    if (v9 < 0)
    {
      v25 = PLBackendGetLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = [v3 path];
        v27 = __error();
        v28 = strerror(*v27);
        *(_DWORD *)buf = 138412546;
        v30 = v26;
        __int16 v31 = 2080;
        v32 = v28;
        _os_log_impl(&dword_19BCFB000, v25, OS_LOG_TYPE_ERROR, "Unable to get xattr for '%@' (%s).", buf, 0x16u);
      }
    }
    else
    {
      ssize_t v10 = v9;
      if (v9)
      {
        id v11 = [MEMORY[0x1E4F1CA58] dataWithLength:v9];
        if (flistxattr(v8, (char *)[v11 mutableBytes], objc_msgSend(v11, "length"), 0) == v10)
        {
          ssize_t v12 = 0;
          do
          {
            uint64_t v13 = [v11 bytes];
            v14 = (const char *)(v13 + v12);
            size_t v15 = strnlen((const char *)(v13 + v12), v10 - v12);
            if (!v15) {
              break;
            }
            size_t v16 = v15;
            if (!strncmp(v14, "com.apple.assetsd", 0x11uLL) && fremovexattr(v8, v14, 0) < 0)
            {
              v17 = PLBackendGetLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                v18 = [v3 path];
                v19 = __error();
                v20 = strerror(*v19);
                *(_DWORD *)buf = 136315650;
                v30 = v14;
                __int16 v31 = 2112;
                v32 = v18;
                __int16 v33 = 2080;
                v34 = v20;
                _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_ERROR, "Unable to remove xattr %s for '%@' (%s).", buf, 0x20u);
              }
            }
            v12 += v16 + 1;
          }
          while (v12 < v10);
        }
        close(v8);

        goto LABEL_22;
      }
    }
    close(v8);
    goto LABEL_22;
  }
  v21 = PLBackendGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = [v3 path];
    v23 = __error();
    v24 = strerror(*v23);
    *(_DWORD *)buf = 138412546;
    v30 = v22;
    __int16 v31 = 2080;
    v32 = v24;
    _os_log_impl(&dword_19BCFB000, v21, OS_LOG_TYPE_ERROR, "Unable to open file '%@' to retrieve extended attributes (%s).", buf, 0x16u);
  }
LABEL_22:
}

+ (id)persistedAttributesForFileAtURL:(id)a3 exists:(BOOL *)a4 includeUnknownAttributes:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = (void *)MEMORY[0x19F38F510]();
  if (!v7)
  {
LABEL_13:
    if (a4) {
      *a4 = 0;
    }
    goto LABEL_20;
  }
  id v9 = [v7 path];
  ssize_t v10 = (const char *)[v9 fileSystemRepresentation];

  int v11 = open(v10, 0x200000);
  if (v11 < 0)
  {
    v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = [v7 path];
      v19 = __error();
      v20 = strerror(*v19);
      *(_DWORD *)buf = 138412546;
      v53 = v18;
      __int16 v54 = 2080;
      v55 = v20;
      _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_ERROR, "Unable to open file '%@' to retrieve extended attributes (%s).", buf, 0x16u);
    }
    goto LABEL_13;
  }
  int v12 = v11;
  if (a4) {
    *a4 = 1;
  }
  ssize_t v13 = flistxattr(v11, 0, 0, 0);
  if (v13 < 0)
  {
    v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [v7 path];
      v23 = __error();
      v24 = strerror(*v23);
      *(_DWORD *)buf = 138412546;
      v53 = v22;
      __int16 v54 = 2080;
      v55 = v24;
      _os_log_impl(&dword_19BCFB000, v21, OS_LOG_TYPE_ERROR, "Unable to get xattr for '%@' (%s).", buf, 0x16u);
    }
    goto LABEL_18;
  }
  ssize_t v14 = v13;
  if (!v13)
  {
LABEL_18:
    close(v12);
LABEL_20:
    v25 = 0;
    goto LABEL_21;
  }
  id v15 = [MEMORY[0x1E4F1CA58] dataWithLength:v13];
  if (flistxattr(v12, (char *)[v15 mutableBytes], objc_msgSend(v15, "length"), 0) != v14)
  {
    close(v12);

    goto LABEL_20;
  }
  id v50 = v15;
  int v49 = v12;
  v47 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:20];
  context = v8;
  id v45 = v7;
  v43 = v10;
  if (v5)
  {
    v46 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:20];
  }
  else
  {
    v46 = 0;
  }
  ssize_t v27 = 0;
  *(void *)&long long v16 = 136315650;
  long long v42 = v16;
  v28 = v15;
  BOOL v51 = v5;
  ssize_t v48 = v14;
  do
  {
    id v29 = v28;
    uint64_t v30 = [v29 bytes];
    __int16 v31 = (const char *)(v30 + v27);
    size_t v32 = strnlen((const char *)(v30 + v27), v14 - v27);
    if (!v32) {
      break;
    }
    size_t v33 = v32;
    int v34 = strncmp(v31, "com.apple.assetsd", 0x11uLL);
    if (!v34 || v5)
    {
      uint64_t v35 = objc_msgSend(NSString, "stringWithUTF8String:", v31, v42);
      if (v35)
      {
        ssize_t v36 = fgetxattr(v12, v31, 0, 0, 0, 0);
        if (v36 < 0)
        {
          v38 = PLBackendGetLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            v40 = __error();
            v41 = strerror(*v40);
            *(_DWORD *)buf = v42;
            v53 = v43;
            __int16 v54 = 2080;
            v55 = (void *)v31;
            __int16 v56 = 2080;
            v57 = v41;
            _os_log_impl(&dword_19BCFB000, v38, OS_LOG_TYPE_DEFAULT, "unexpected issue getting xttr length for %s %s: %s", buf, 0x20u);
          }
        }
        else
        {
          ssize_t v37 = v36;
          v38 = [MEMORY[0x1E4F1CA58] dataWithLength:v36];
          if (v37 == fgetxattr(v12, v31, (void *)[v38 mutableBytes], [v38 length], 0, 0))
          {
            if (v34) {
              v39 = v46;
            }
            else {
              v39 = v47;
            }
            [v39 setObject:v38 forKey:v35];
          }
          int v12 = v49;
          ssize_t v14 = v48;
        }
        v28 = v50;
      }
      BOOL v5 = v51;
    }
    v27 += v33 + 1;
  }
  while (v27 < v14);
  v25 = [[PLFileSystemPersistenceAttributes alloc] initWithAttributes:v47 unknownAttributes:v46];
  close(v12);

  id v7 = v45;
LABEL_21:

  return v25;
}

+ (id)persistedAttributesForFileAtURL:(id)a3
{
  return (id)[a1 persistedAttributesForFileAtURL:a3 exists:0 includeUnknownAttributes:0];
}

+ (void)persistData:(id)a3 forKey:(id)a4 fileURL:(id)a5
{
  if (a5)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = a3;
    ssize_t v10 = [[PLFileSystemPersistenceBatchItem alloc] initWithFileURL:v7];

    [(PLFileSystemPersistenceBatchItem *)v10 setData:v9 forKey:v8];
    [(PLFileSystemPersistenceBatchItem *)v10 persist];
  }
}

+ (id)filesystemPersistenceBatchItemForFileAtURL:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[PLFileSystemPersistenceBatchItem alloc] initWithFileURL:v3];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (id)sharedInstance
{
  pl_dispatch_once(&sharedInstance_onceToken_8820, &__block_literal_global_8821);
  v2 = (void *)sharedInstance_myInstance;
  return v2;
}

uint64_t __41__PLFileSystemPersistence_sharedInstance__block_invoke()
{
  sharedInstance_myInstance = objc_alloc_init(PLFileSystemPersistence);
  return MEMORY[0x1F41817F8]();
}

+ (id)persistenceKeyTypes
{
  v5[44] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.assetsd.UUID";
  v4[1] = @"com.apple.assetsd.assetType";
  v5[0] = &unk_1EEC14C98;
  v5[1] = &unk_1EEC14CB0;
  v4[2] = @"com.apple.assetsd.avalanche.UUID";
  v4[3] = @"com.apple.assetsd.avalanche.type";
  v5[2] = &unk_1EEC14C98;
  v5[3] = &unk_1EEC14CB0;
  v4[4] = @"com.apple.assetsd.hidden";
  v4[5] = @"com.apple.assetsd.favorite";
  v5[4] = &unk_1EEC14CB0;
  v5[5] = &unk_1EEC14CB0;
  v4[6] = @"com.apple.assetsd.trashed";
  v4[7] = @"com.apple.assetsd.deferredProcessing";
  v5[6] = &unk_1EEC14CB0;
  v5[7] = &unk_1EEC14CB0;
  v4[8] = @"com.apple.assetsd.customCreationDate";
  v4[9] = @"com.apple.assetsd.customLocation";
  v5[8] = &unk_1EEC14CC8;
  v5[9] = &unk_1EEC14CE0;
  v4[10] = @"com.apple.assetsd.addedDate";
  v4[11] = @"com.apple.assetsd.cloudAsset.UUID";
  v5[10] = &unk_1EEC14CC8;
  v5[11] = &unk_1EEC14CF8;
  v4[12] = @"com.apple.assetsd.creatorBundleID";
  v4[13] = @"com.apple.assetsd.originalAssetUUID";
  v5[12] = &unk_1EEC14CF8;
  v5[13] = &unk_1EEC14C98;
  v4[14] = @"com.apple.assetsd.publicGlobalUUID";
  v4[15] = @"com.apple.assetsd.title";
  v5[14] = &unk_1EEC14CF8;
  v5[15] = &unk_1EEC14CF8;
  v4[16] = @"com.apple.assetsd.accessibilityDescription";
  v4[17] = @"com.apple.assetsd.timeZoneName";
  v5[16] = &unk_1EEC14CF8;
  v5[17] = &unk_1EEC14CF8;
  v4[18] = @"com.apple.assetsd.timeZoneOffset";
  v4[19] = @"com.apple.assetsd.description";
  v5[18] = &unk_1EEC14D10;
  v5[19] = &unk_1EEC14CF8;
  v4[20] = @"com.apple.assetsd.originalFilename";
  v4[21] = @"com.apple.assetsd.placeAnnotationData";
  v5[20] = &unk_1EEC14CF8;
  v5[21] = &unk_1EEC14CC8;
  v4[22] = @"com.apple.assetsd.importedBy";
  v4[23] = @"com.apple.assetsd.sceneAnalysisIsFromPreivew";
  v5[22] = &unk_1EEC14CB0;
  v5[23] = &unk_1EEC14CB0;
  v4[24] = @"com.apple.assetsd.viewPresentation";
  v4[25] = @"com.apple.assetsd.mediaGroupUUID";
  v5[24] = &unk_1EEC14CB0;
  v5[25] = &unk_1EEC14CF8;
  v4[26] = @"com.apple.assetsd.socGroupIdentifier";
  v4[27] = @"com.apple.assetsd.extraDurationData";
  v5[26] = &unk_1EEC14CF8;
  v5[27] = &unk_1EEC14CE0;
  v4[28] = @"com.apple.assetsd.videoComplementVisibility";
  v4[29] = @"com.apple.assetsd.syndicationIdentifier";
  v5[28] = &unk_1EEC14CB0;
  v5[29] = &unk_1EEC14CF8;
  v4[30] = @"com.apple.assetsd.syndicationHistory";
  v4[31] = @"com.apple.assetsd.libraryScopeShareState";
  v5[30] = &unk_1EEC14CB0;
  v5[31] = &unk_1EEC14D28;
  v4[32] = @"com.apple.assetsd.libraryScopeAssetContributorsToUpdate";
  v4[33] = @"com.apple.assetsd.currentSleetCast";
  v5[32] = &unk_1EEC14CE0;
  v5[33] = &unk_1EEC14CB0;
  v4[34] = @"com.apple.assetsd.dbRebuildUuid";
  v4[35] = @"com.apple.assetsd.dbRebuildInProgress";
  v5[34] = &unk_1EEC14CF8;
  v5[35] = &unk_1EEC14CB0;
  v4[36] = @"com.apple.assetsd.inProgress.publishable";
  v4[37] = @"com.apple.assetsd.inProgress.destinationPath";
  v5[36] = &unk_1EEC14CB0;
  v5[37] = &unk_1EEC14CF8;
  v4[38] = @"com.apple.assetsd.inProgress.cameraAdjustmentsData";
  v4[39] = @"com.apple.assetsd.inProgress.filteredPreviewImagePath";
  v5[38] = &unk_1EEC14CF8;
  v5[39] = &unk_1EEC14CF8;
  v4[40] = @"com.apple.assetsd.inProgress.semanticDevelopment";
  v4[41] = @"com.apple.assetsd.cloudJobRecoveryCount";
  v5[40] = &unk_1EEC14D10;
  v5[41] = &unk_1EEC14CB0;
  v4[42] = @"com.apple.assetsd.resourceType";
  v4[43] = @"com.apple.assetsd.cloudAsset.placeholderKind";
  v5[42] = &unk_1EEC14CB0;
  v5[43] = &unk_1EEC14CB0;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:44];
  return v2;
}

@end