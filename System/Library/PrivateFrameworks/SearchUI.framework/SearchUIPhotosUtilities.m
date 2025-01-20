@interface SearchUIPhotosUtilities
+ (id)fetchOptionsForLibrary:(id)a3;
+ (id)fetchResultForPersonIdentifiers:(id)a3 isSyndicated:(BOOL)a4;
+ (id)fetchResultForPhotoIdentifiers:(id)a3 isSyndicated:(BOOL)a4;
+ (id)sharedPhotoLibraryIsSyndicated:(BOOL)a3;
+ (void)shutdownPhotoLibraries;
@end

@implementation SearchUIPhotosUtilities

+ (id)sharedPhotoLibraryIsSyndicated:(BOOL)a3
{
  BOOL v3 = a3;
  if (sharedPhotoLibraryIsSyndicated__enableMultiLibraryModeOnceToken != -1) {
    dispatch_once(&sharedPhotoLibraryIsSyndicated__enableMultiLibraryModeOnceToken, &__block_literal_global_23);
  }
  v4 = SearchUIGeneralLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E45B5000, v4, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: attempting to grab a lock for opening a photo library", buf, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&sPhotoLibraryLock);
  v5 = SearchUIGeneralLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E45B5000, v5, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: opening photo library", buf, 2u);
  }

  v6 = &systemPhotoLibrary;
  if (v3) {
    v7 = &syndicatedPhotoLibrary;
  }
  else {
    v7 = &systemPhotoLibrary;
  }
  id v8 = (id)*v7;
  if (!v8)
  {
    if (v3) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 1;
    }
    id v16 = 0;
    if (v3) {
      v6 = &syndicatedPhotoLibrary;
    }
    id v8 = [MEMORY[0x1E4F39228] openPhotoLibraryWithWellKnownIdentifier:v9 error:&v16];
    id v10 = v16;
    objc_storeStrong((id *)v6, v8);
    if (v10)
    {
      v11 = SearchUIGeneralLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:v11];
      }
    }
    if (!v8)
    {
      v12 = SearchUIGeneralLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:](v12);
      }
    }
  }
  v13 = SearchUIGeneralLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E45B5000, v13, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: returning lock", buf, 2u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sPhotoLibraryLock);
  v14 = SearchUIGeneralLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E45B5000, v14, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: lock returned", buf, 2u);
  }

  return v8;
}

uint64_t __58__SearchUIPhotosUtilities_sharedPhotoLibraryIsSyndicated___block_invoke()
{
  return [MEMORY[0x1E4F39228] enableMultiLibraryMode];
}

+ (void)shutdownPhotoLibraries
{
  v2 = SearchUIGeneralLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E45B5000, v2, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: attempting to grab a lock for clearing a photo library", buf, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&sPhotoLibraryLock);
  BOOL v3 = SearchUIGeneralLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_1E45B5000, v3, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: clearing photo library", v16, 2u);
  }

  if (systemPhotoLibrary)
  {
    v4 = [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
    if (v4)
    {
      [MEMORY[0x1E4F39228] unsafeShutdownLibraryWithPhotoLibraryURL:v4];
      v5 = (void *)systemPhotoLibrary;
      systemPhotoLibrary = 0;

      v6 = SearchUIGeneralLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1E45B5000, v6, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: cleared systemPhotoLibrary", v15, 2u);
      }
    }
  }
  if (syndicatedPhotoLibrary)
  {
    v7 = [MEMORY[0x1E4F39228] wellKnownPhotoLibraryURLForIdentifier:3];
    if (v7)
    {
      [MEMORY[0x1E4F39228] unsafeShutdownLibraryWithPhotoLibraryURL:v7];
      id v8 = (void *)syndicatedPhotoLibrary;
      syndicatedPhotoLibrary = 0;

      uint64_t v9 = SearchUIGeneralLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1E45B5000, v9, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: cleared syndicatedPhotoLibrary", v14, 2u);
      }
    }
  }
  id v10 = SearchUIGeneralLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1E45B5000, v10, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: returning lock", v13, 2u);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&sPhotoLibraryLock);
  v11 = SearchUIGeneralLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1E45B5000, v11, OS_LOG_TYPE_DEFAULT, "SearchUIPhotoUtilities: lock returned", v12, 2u);
  }
}

+ (id)fetchResultForPhotoIdentifiers:(id)a3 isSyndicated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [a1 sharedPhotoLibraryIsSyndicated:v4];
  if (v7)
  {
    id v8 = [a1 fetchOptionsForLibrary:v7];
    if (v4) {
      [MEMORY[0x1E4F38EB8] fetchAssetsWithSyndicationIdentifiers:v6 options:v8 includeRejected:1];
    }
    else {
    uint64_t v9 = [MEMORY[0x1E4F38EB8] fetchAssetsWithLocalIdentifiers:v6 options:v8];
    }
    if (!v9)
    {
      id v10 = SearchUIGeneralLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v12 = [NSNumber numberWithBool:v4];
        int v13 = 138412802;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v8;
        __int16 v17 = 2112;
        v18 = v12;
        _os_log_error_impl(&dword_1E45B5000, v10, OS_LOG_TYPE_ERROR, "SearchUIPhotoUtilities: fetchResult failed for photoIdentifier: %@, fetchOptions %@, isSyndicated %@", (uint8_t *)&v13, 0x20u);
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)fetchResultForPersonIdentifiers:(id)a3 isSyndicated:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[SearchUIPhotosUtilities sharedPhotoLibraryIsSyndicated:v4];
  v7 = +[SearchUIPhotosUtilities fetchOptionsForLibrary:v6];
  id v8 = [MEMORY[0x1E4F391F0] fetchPersonsWithLocalIdentifiers:v5 options:v7];

  return v8;
}

+ (id)fetchOptionsForLibrary:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 librarySpecificFetchOptions];
  v8[0] = *MEMORY[0x1E4F39458];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v4 addFetchPropertySets:v5];

  [v4 setIncludeGuestAssets:1];
  uint64_t v6 = [v3 wellKnownPhotoLibraryIdentifier];

  if (v6 == 1) {
    [v4 setIncludeAssetSourceTypes:7];
  }
  return v4;
}

+ (void)sharedPhotoLibraryIsSyndicated:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E45B5000, log, OS_LOG_TYPE_ERROR, "SearchUIPhotoUtilities: missing photo library after opening", v1, 2u);
}

+ (void)sharedPhotoLibraryIsSyndicated:(NSObject *)a3 .cold.2(uint64_t a1, char a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = [NSNumber numberWithBool:a2 & 1];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1E45B5000, a3, OS_LOG_TYPE_ERROR, "SearchUIPhotoUtilities: Error opening photo library: %@, %@", (uint8_t *)&v6, 0x16u);
}

@end