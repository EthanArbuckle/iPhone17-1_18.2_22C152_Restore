@interface _ICQPhotosInfo
+ (BOOL)hasPhotoBulkCreation;
+ (BOOL)isPhotosSyncOverQuota;
+ (id)_photosShutdownQueue;
+ (id)mockCount:(id)a3;
+ (void)_shutDownPhotoLibrary;
+ (void)getInfoWithCompletion:(id)a3;
+ (void)hasPhotoBulkCreation;
- (unint64_t)photoCount;
- (unint64_t)videoCount;
- (void)setPhotoCount:(unint64_t)a3;
- (void)setVideoCount:(unint64_t)a3;
@end

@implementation _ICQPhotosInfo

+ (id)_photosShutdownQueue
{
  if (_photosShutdownQueue_onceToken != -1) {
    dispatch_once(&_photosShutdownQueue_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)_photosShutdownQueue_photosShutdownQueue;
  return v2;
}

+ (id)mockCount:(id)a3
{
  v3 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, @"com.apple.cloud.quota");
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_respondsToSelector())
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "longLongValue"));

    v3 = (void *)v4;
  }
  return v3;
}

+ (void)getInfoWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, _ICQPhotosInfo *, void))a3;
  uint64_t v4 = +[_ICQPhotosInfo mockCount:@"_ICQMockPhotoCount"];
  uint64_t v5 = +[_ICQPhotosInfo mockCount:@"_ICQMockVideoCount"];
  if (v4 | v5)
  {
    v6 = objc_alloc_init(_ICQPhotosInfo);
    -[_ICQPhotosInfo setPhotoCount:](v6, "setPhotoCount:", [(id)v4 longLongValue]);
    -[_ICQPhotosInfo setVideoCount:](v6, "setVideoCount:", [(id)v5 longLongValue]);
    v3[2](v3, v6, 0);
  }
  else
  {
    v7 = (void *)MEMORY[0x1D9453DC0]();
    v8 = [MEMORY[0x1E4F8B980] systemLibraryURL];
    id v14 = 0;
    v9 = (void *)[MEMORY[0x1E4F8AA78] newPhotoLibraryWithName:"+[_ICQPhotosInfo getInfoWithCompletion:]" loadedFromURL:v8 options:0 error:&v14];
    id v10 = v14;
    if (v10)
    {
      v11 = _ICQGetLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v10;
        _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "Error loading PLPhotoLibrary: (%@)", buf, 0xCu);
      }

      ((void (**)(id, _ICQPhotosInfo *, id))v3)[2](v3, 0, v10);
    }
    else if (v9)
    {
      v13 = v3;
      PLRequestCloudPhotoLibraryTransferProgressForLibrary();
    }
    else
    {
      v12 = _ICQGetLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D5851000, v12, OS_LOG_TYPE_DEFAULT, "System Photo Library is nil, avoiding calling PLRequest on a nil PLPhotoLibrary", buf, 2u);
      }

      v3[2](v3, 0, 0);
    }
  }
}

+ (BOOL)isPhotosSyncOverQuota
{
  return MEMORY[0x1F413F460](a1, a2);
}

+ (BOOL)hasPhotoBulkCreation
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v3 = _ICQGetLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D5851000, v3, OS_LOG_TYPE_DEFAULT, "Checking for photo bulk creation", buf, 2u);
  }

  uint64_t v4 = (void *)MEMORY[0x1D9453DC0]();
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-172800.0];
  id v6 = objc_alloc(MEMORY[0x1E4F39228]);
  v7 = [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
  v8 = (void *)[v6 initWithPhotoLibraryURL:v7];

  v9 = [v8 librarySpecificFetchOptions];
  id v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"creationDate >= %@", v5];
  [v9 setPredicate:v10];

  v11 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:0];
  v34[0] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  [v9 setSortDescriptors:v12];

  v13 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v9];
  id v14 = _ICQGetLogSystem();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[_ICQPhotosInfo hasPhotoBulkCreation];
  }

  if ((unint64_t)[v13 count] < 0x1E)
  {
    BOOL v27 = 0;
  }
  else
  {
    v29 = v4;
    id v15 = a1;
    unint64_t v16 = 29;
    while (1)
    {
      uint64_t v17 = [v13 objectAtIndexedSubscript:v16 - 29];
      v18 = [v13 objectAtIndexedSubscript:v16];
      v19 = [v17 creationDate];
      [v19 timeIntervalSince1970];
      double v21 = v20;
      v22 = [v18 creationDate];
      [v22 timeIntervalSince1970];
      double v24 = v21 - v23;

      v25 = _ICQGetLogSystem();
      v26 = v25;
      if (v24 <= 86400.0) {
        break;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v31 = v17;
        __int16 v32 = 2112;
        v33 = v18;
        _os_log_debug_impl(&dword_1D5851000, v26, OS_LOG_TYPE_DEBUG, "No bulk creation found for assets %@ and %@", buf, 0x16u);
      }

      ++v16;
      if ([v13 count] <= v16)
      {
        BOOL v27 = 0;
        a1 = v15;
        goto LABEL_16;
      }
    }
    a1 = v15;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v26, OS_LOG_TYPE_DEFAULT, "Found bulk creation!", buf, 2u);
    }

    BOOL v27 = 1;
LABEL_16:
    uint64_t v4 = v29;
  }
  [a1 _shutDownPhotoLibrary];

  return v27;
}

+ (void)_shutDownPhotoLibrary
{
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v3 bundleIdentifier];
  char v5 = [v4 isEqualToString:@"com.apple.ind"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
    v7 = (void *)os_transaction_create();
    v8 = _ICQGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v8, OS_LOG_TYPE_DEFAULT, "Shutting down photos library.", buf, 2u);
    }

    v9 = [a1 _photosShutdownQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39___ICQPhotosInfo__shutDownPhotoLibrary__block_invoke;
    v12[3] = &unk_1E6A52678;
    id v13 = v6;
    id v14 = v7;
    id v10 = v7;
    v11 = v6;
    dispatch_async(v9, v12);
  }
  else
  {
    v11 = _ICQGetLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D5851000, v11, OS_LOG_TYPE_DEFAULT, "Process is not ind daemon, not shutting down another app's Photo Library", buf, 2u);
    }
  }
}

- (unint64_t)photoCount
{
  return self->_photoCount;
}

- (void)setPhotoCount:(unint64_t)a3
{
  self->_photoCount = a3;
}

- (unint64_t)videoCount
{
  return self->_videoCount;
}

- (void)setVideoCount:(unint64_t)a3
{
  self->_videoCount = a3;
}

+ (void)hasPhotoBulkCreation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 count];
  _os_log_debug_impl(&dword_1D5851000, a2, OS_LOG_TYPE_DEBUG, "Checking for photo bulk creation with %lu assets", (uint8_t *)&v3, 0xCu);
}

@end