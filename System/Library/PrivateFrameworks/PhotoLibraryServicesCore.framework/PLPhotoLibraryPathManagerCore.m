@interface PLPhotoLibraryPathManagerCore
+ (BOOL)_persistSystemPhotoLibraryPath:(id)a3 sendChangeNotification:(BOOL)a4;
+ (BOOL)backupSupportedForWellKnownLibraryIdentifier:(int64_t)a3;
+ (BOOL)ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (BOOL)isSupportedFileSystemAtURL:(id)a3;
+ (BOOL)isSystemPhotoLibraryURL:(id)a3;
+ (BOOL)setICloudBackupExclusionAttribute:(BOOL)a3 url:(id)a4 error:(id *)a5;
+ (BOOL)setSystemLibraryURL:(id)a3 options:(unsigned __int16)a4 error:(id *)a5;
+ (BOOL)setTimeMachineExclusionAttribute:(BOOL)a3 url:(id)a4 error:(id *)a5;
+ (BOOL)shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (BOOL)shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (id)_constructLegacySystemPhotoLibraryURLFromUnresolvableBookmark:(id)a3;
+ (id)_legacySystemLibraryBookmarkData;
+ (id)_legacySystemLibraryPath;
+ (id)_photosLibrariesDataVaultPathForApplicationLibrariesDomain;
+ (id)_photosLibrariesDataVaultPathForLibraryBundleName:(id)a3;
+ (id)_readSystemPhotoLibraryPath;
+ (id)allPhotosPathsOnThisDevice;
+ (id)basenameForSpatialOverCaptureFromOriginalBasename:(id)a3;
+ (id)libraryURLFromDatabaseURL:(id)a3;
+ (id)managedPathWithUuid:(const char *)a3 base:(const char *)a4 fileMarker:(const char *)a5 extension:(const char *)a6;
+ (id)photosDataVaultPath;
+ (id)photosLibrariesDataVaultPath;
+ (id)photosLibraryExtension;
+ (id)rootURLForPhotoLibraryDomain:(int64_t)a3;
+ (id)systemLibraryBaseDirectory;
+ (id)systemLibraryURL;
+ (id)systemLibraryURLIfResolvable;
+ (id)wellKnownPhotoLibraryURLForIdentifier:(int64_t)a3;
+ (int64_t)wellKnownPhotoLibraryIdentifierForURL:(id)a3;
+ (unint64_t)libraryCreateOptionsForWellKnownLibraryIdentifier:(int64_t)a3;
+ (void)_updateSystemLibraryURLWithOldValue:(id)a3;
+ (void)initialize;
+ (void)listenForSystemPhotoLibraryURLChanges;
+ (void)recordPrevSystemLibraryPath:(id)a3;
- (BOOL)createDirectoryOnceWithPath:(id)a3 mask:(unsigned __int8)a4 pathType:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)createPathsForNewLibrariesWithError:(id *)a3;
- (BOOL)ensureFileProviderSyncExclusionAttributeIsSetWithError:(id *)a3;
- (BOOL)internalValidateCreationRequestWithError:(id *)a3;
- (BOOL)isDataProtectionComplete;
- (BOOL)isDeviceRestoreSupported;
- (BOOL)path:(id)a3 isSubpathOfPhotoDirectoryWithType:(unsigned __int8)a4;
- (BOOL)pathRelativeToBundle:(id)a3 isSubpathOfPhotoDirectoryWithType:(unsigned __int8)a4;
- (BOOL)shouldUseFileIdentifierForBundleScope:(unsigned __int16)a3;
- (BOOL)updateExclusionAttributeWithPath:(id)a3 mask:(unsigned __int8)a4 pathType:(unsigned __int8)a5 error:(id *)a6;
- (BOOL)updateTimeMachineExclusionAttributeForExcludePath:(id)a3 error:(id *)a4;
- (BOOL)validateCreationRequestWithError:(id *)a3;
- (NSString)assetUUIDRecoveryMappingPath;
- (NSString)baseDirectory;
- (NSString)iTunesPhotosDirectory;
- (NSString)legacyMemoriesRelatedSnapshotDirectory;
- (NSString)legacyModelInterestDatabasePath;
- (NSURL)libraryURL;
- (PLFileSystemCapabilities)capabilities;
- (PLPhotoLibraryPathManagerCore)init;
- (PLPhotoLibraryPathManagerCore)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4;
- (id)_dataProtectionIndicatorFilePath;
- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 rootPath:(id)a4;
- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 type:(unsigned __int8)a4 bundleScope:(unsigned __int16)a5;
- (id)assetBaseFilenameForAdjustmentFilePath:(id)a3;
- (id)assetMainFilePathWithDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5;
- (id)basePrivateDirectoryPath;
- (id)clientOwnedDirectoryPathsForClientAccess:(id)a3;
- (id)cloudRestoreBackgroundPhaseInProgressTokenPath;
- (id)cloudRestoreCompleteTokenPath;
- (id)cloudRestoreContextPath;
- (id)cloudRestoreForegroundPhaseCompleteTokenPath;
- (id)convertPhotoLibraryPathType:(unsigned __int8)a3;
- (id)externalDirectoryWithSubType:(unsigned __int8)a3;
- (id)externalDirectoryWithSubType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7;
- (id)iTunesPhotosLastSyncMetadataFilePath;
- (id)iTunesPhotosSyncCurrentLibraryUUIDPath;
- (id)iTunesPhotosSyncMetadataFilePath;
- (id)iTunesSyncedAssetMetadataThumbnailsDirectory;
- (id)iTunesSyncedAssetSmallThumbnailsDirectory;
- (id)iTunesSyncedAssetsDirectory;
- (id)iTunesSyncedFaceAlbumThumbnailsDirectory;
- (id)iTunesSyncedFaceDataDirectory;
- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4;
- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4 createIfNeeded:(BOOL)a5 error:(id *)a6;
- (id)knownDBPaths;
- (id)modelRestorePostProcessingCompleteTokenPath;
- (id)pathForCPLStatus;
- (id)pathToAssetAlbumOrderStructure;
- (id)pathToAssetsToAlbumsMapping;
- (id)pathsForClientAccess:(id)a3;
- (id)pathsForExternalWriters;
- (id)pathsForFinderSyncFilesystemSizeCalculation;
- (id)pathsForLibraryFilesystemSizeCalculation;
- (id)pathsForPermissionCheck;
- (id)pathsGroupedByAssetBasePathFromFilePaths:(id)a3 populateInvalidAdjustmentPaths:(id)a4;
- (id)persistedAlbumDataDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4;
- (id)photoDirectoryWithType:(unsigned __int8)a3;
- (id)photoDirectoryWithType:(unsigned __int8)a3 additionalPathComponents:(id)a4;
- (id)photoDirectoryWithType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7;
- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 createIfNeeded:(BOOL)a5 error:(id *)a6;
- (id)photoMetadataDirectoryForMediaInMainDirectory:(id)a3;
- (id)photosAsideDatabasePath;
- (id)photosCPLDatabasePath;
- (id)photosDatabasePath;
- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3;
- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7;
- (id)privateDirectoryWithBundleIdentifier:(id)a3 createIfNeeded:(BOOL)a4;
- (id)privateDirectoryWithSubType:(unsigned __int8)a3;
- (id)privateDirectoryWithSubType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5;
- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7;
- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 createIfNeeded:(BOOL)a5 error:(id *)a6;
- (id)readOnlyUrlWithIdentifier:(id)a3;
- (id)simpleDCIMDirectory;
- (id)syncInfoPath;
- (id)temporaryDragAndDropDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4;
- (id)temporaryFileBackedDebugDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4;
- (unsigned)bundleScope;
- (unsigned)photoLibraryPathTypeForBundleScope:(unsigned __int16)a3;
- (void)enumerateBundleScopesWithBlock:(id)a3;
- (void)externalDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3;
- (void)internalDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3;
- (void)obtainAccessAndWaitWithFileWithIdentifier:(id)a3 mode:(unsigned __int8)a4 toURLWithHandler:(id)a5;
- (void)photoDirectoryCreationMaskResetWithType:(unsigned __int8)a3;
- (void)postInit;
- (void)privateCacheDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3;
- (void)privateDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3;
- (void)setAssetUUIDRecoveryMappingPath:(id)a3;
- (void)setBaseDirectory:(id)a3;
- (void)setBundleScope:(unsigned __int16)a3;
- (void)setDataProtectionComplete:(BOOL)a3;
- (void)setExtendedAttributesWithIdentifier:(id)a3;
- (void)setExtendedAttributesWithIdentifier:(id)a3 andURL:(id)a4;
- (void)setITunesPhotosDirectory:(id)a3;
- (void)setLegacyMemoriesRelatedSnapshotDirectory:(id)a3;
- (void)setLegacyModelInterestDatabasePath:(id)a3;
- (void)setLibraryURL:(id)a3;
@end

@implementation PLPhotoLibraryPathManagerCore

- (id)privateDirectoryWithBundleIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    v7 = [(PLPhotoLibraryPathManagerCore *)self basePrivateDirectoryPath];
    v8 = [v7 stringByAppendingPathComponent:v6];

    if (v4)
    {
      id v13 = 0;
      BOOL v9 = [(PLPhotoLibraryPathManagerCore *)self internalValidateCreationRequestWithError:&v13];
      id v10 = v13;
      if (v9)
      {
        v11 = [MEMORY[0x1E4F28CB8] defaultManager];
        [v11 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:0];
      }
      else
      {
        v11 = PLBackendGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          v15 = "-[PLPhotoLibraryPathManagerCore privateDirectoryWithBundleIdentifier:createIfNeeded:]";
          __int16 v16 = 2112;
          v17 = v8;
          __int16 v18 = 2112;
          id v19 = v10;
          _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_ERROR, "%{public}s: failed to create directory: %@ with error: %@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)postInit
{
  id v3 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:33 additionalPathComponents:@"assetUUIDForPath.plist"];
  [(PLPhotoLibraryPathManagerCore *)self setAssetUUIDRecoveryMappingPath:v3];
}

- (void)setAssetUUIDRecoveryMappingPath:(id)a3
{
}

- (PLPhotoLibraryPathManagerCore)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  if (!v7)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PLPhotoLibraryPathManagerCore.m", 199, @"Invalid parameter not satisfying: %@", @"libraryURL" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PLPhotoLibraryPathManagerCore;
  v8 = [(PLPhotoLibraryPathManagerCore *)&v15 init];
  BOOL v9 = v8;
  if (v8)
  {
    v8->_folderCreationAndCapabilitiesLock._os_unfair_lock_opaque = 0;
    id v10 = (void *)[v7 copy];
    [(PLPhotoLibraryPathManagerCore *)v9 setLibraryURL:v10];

    v11 = [v7 path];
    v12 = (void *)[v11 copy];
    [(PLPhotoLibraryPathManagerCore *)v9 setBaseDirectory:v12];

    [(PLPhotoLibraryPathManagerCore *)v9 setBundleScope:v4];
    *(_OWORD *)&v9->_privateCacheSubDirectoriesExists = 0u;
    *(_OWORD *)&v9->_internalDirectoriesExists = 0u;
    *(_OWORD *)&v9->_photoDirectoriesExists = 0u;
  }

  return v9;
}

+ (BOOL)isSystemPhotoLibraryURL:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 systemLibraryURL];
  id v6 = [v4 path];
  if (v6)
  {
    id v7 = [v5 path];
    char v8 = [v7 isEqualToString:v6];

    if (v8)
    {
      char v9 = 1;
      goto LABEL_21;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"libraryURLString cannot be nil"];
  }
  id v10 = [v5 path];
  id v27 = 0;
  v11 = +[PLFileUtilities realPathForPath:v10 error:&v27];
  id v12 = v27;

  if (!v11)
  {
    id v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl(&dword_19BCFB000, v13, OS_LOG_TYPE_DEFAULT, "No realpath for SPL URL %@, %@", buf, 0x16u);
    }

    v14 = [v5 URLByStandardizingPath];
    v11 = [v14 path];
  }
  id v26 = v12;
  objc_super v15 = +[PLFileUtilities realPathForPath:v6 error:&v26];
  id v16 = v26;

  if (!v15)
  {
    int v17 = PLIsErrorFileNotFound(v16);
    __int16 v18 = PLBackendGetLog();
    id v19 = v18;
    if (v17)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v29 = v4;
        __int16 v30 = 2112;
        id v31 = v16;
        uint64_t v20 = v19;
        os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
LABEL_15:
        _os_log_impl(&dword_19BCFB000, v20, v21, "No realpath for URL %@, %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v4;
      __int16 v30 = 2112;
      id v31 = v16;
      uint64_t v20 = v19;
      os_log_type_t v21 = OS_LOG_TYPE_ERROR;
      goto LABEL_15;
    }

    v22 = [v4 URLByStandardizingPath];
    objc_super v15 = [v22 path];
  }
  char v9 = 0;
  if (v11 && v15)
  {
    v23 = stringWithoutTrailingSlashes(v11);
    v24 = stringWithoutTrailingSlashes(v15);
    char v9 = [v23 isEqualToString:v24];
  }
LABEL_21:

  return v9;
}

+ (id)systemLibraryURL
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 systemLibraryURLIfResolvable];
  if (!v3)
  {
    id v4 = [a1 _legacySystemLibraryBookmarkData];
    if (v4
      && ([a1 _constructLegacySystemPhotoLibraryURLFromUnresolvableBookmark:v4],
          (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v3 = (void *)v5;
      id v6 = PLBackendGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v3 path];
        int v11 = 138412290;
        id v12 = v7;
        char v8 = "Constructed legacy SPL URL from unresolvable bookmark: %@";
LABEL_8:
        _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      id v3 = +[PLFileUtilities defaultSystemLibraryURL];
      id v6 = PLBackendGetLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = [v3 path];
        int v11 = 138412290;
        id v12 = v7;
        char v8 = "Returning default system library path (%@) as SPL";
        goto LABEL_8;
      }
    }

    os_unfair_lock_lock((os_unfair_lock_t)&splLock);
    char v9 = [v3 path];
    [a1 _persistSystemPhotoLibraryPath:v9 sendChangeNotification:0];

    os_unfair_lock_unlock((os_unfair_lock_t)&splLock);
  }
  return v3;
}

+ (id)systemLibraryURLIfResolvable
{
  return +[PLFileUtilities defaultSystemLibraryURL];
}

- (void)setLibraryURL:(id)a3
{
}

- (void)setBundleScope:(unsigned __int16)a3
{
  self->_bundleScope = a3;
}

- (void)setBaseDirectory:(id)a3
{
}

- (void)setLegacyModelInterestDatabasePath:(id)a3
{
}

- (void)setLegacyMemoriesRelatedSnapshotDirectory:(id)a3
{
}

- (void)setITunesPhotosDirectory:(id)a3
{
}

- (NSString)baseDirectory
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 additionalPathComponents:(id)a4
{
  return [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:a3 leafType:1 additionalPathComponents:a4];
}

- (id)photoDirectoryWithType:(unsigned __int8)a3
{
  return [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:a3 additionalPathComponents:0];
}

- (unsigned)bundleScope
{
  return self->_bundleScope;
}

- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4 createIfNeeded:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v8 = a3;
  id v10 = a4;
  int v11 = [(PLPhotoLibraryPathManagerCore *)self internalDirectoryWithSubType:v8 additionalPathComponents:v10];
  if (v7)
  {
    if ([v10 length]) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 6;
    }
    [(PLPhotoLibraryPathManagerCore *)self createDirectoryOnceWithPath:v11 mask:v12 pathType:v8 error:a6];
  }

  return v11;
}

- (id)pathForCPLStatus
{
  v2 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:13 leafType:3 createIfNeeded:1 error:0];
  id v3 = [v2 stringByAppendingPathComponent:@"syncstatus.plist"];

  return v3;
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 createIfNeeded:(BOOL)a5 error:(id *)a6
{
  return [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:a3 leafType:a4 additionalPathComponents:0 createIfNeeded:a5 error:a6];
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  id v12 = a5;
  uint64_t v13 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:v10 leafType:v9 additionalPathComponents:v12];
  if (v8)
  {
    if (v9 == 1 && [v12 length])
    {
      unsigned __int8 v14 = 1;
    }
    else if (v9 > 1)
    {
      unsigned __int8 v14 = 1;
    }
    else
    {
      unsigned __int8 v14 = 2;
    }
    [(PLPhotoLibraryPathManagerCore *)self createDirectoryOnceWithPath:v13 mask:v14 pathType:v10 error:a7];
  }

  return v13;
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  return [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:a3 leafType:0 createIfNeeded:a4 error:a5];
}

- (BOOL)createDirectoryOnceWithPath:(id)a3 mask:(unsigned __int8)a4 pathType:(unsigned __int8)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  uint64_t v8 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (v7 >= 0x3F)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLPhotoLibraryPathManagerCore.m", 311, @"Invalid parameter not satisfying: %@", @"(sizeof(PLExistsMask) * 8 - 1) > pathType" object file lineNumber description];
  }
  id v27 = 0;
  BOOL v12 = [(PLPhotoLibraryPathManagerCore *)self internalValidateCreationRequestWithError:&v27];
  id v13 = v27;
  if (v12)
  {
    uint64_t v26 = 0;
    p_photoDirectoriesExists = (unint64_t *)&v26;
    switch((int)v8)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid maskType for directory creation in %s", "-[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:]");
        goto LABEL_31;
      case 1:
        goto LABEL_20;
      case 2:
        p_photoDirectoriesExists = &self->_photoDirectoriesExists;
        if (!v11) {
          goto LABEL_31;
        }
        goto LABEL_21;
      case 3:
        p_photoDirectoriesExists = &self->_privateSubDirectoriesExists;
        if (!v11) {
          goto LABEL_31;
        }
        goto LABEL_21;
      case 4:
        p_photoDirectoriesExists = &self->_privateCacheSubDirectoriesExists;
        if (!v11) {
          goto LABEL_31;
        }
        goto LABEL_21;
      case 5:
        p_photoDirectoriesExists = &self->_externalDirectoriesExists;
        if (!v11) {
          goto LABEL_31;
        }
        goto LABEL_21;
      case 6:
        p_photoDirectoriesExists = &self->_internalDirectoriesExists;
LABEL_20:
        if (v11) {
          goto LABEL_21;
        }
        goto LABEL_31;
      case 7:
        p_photoDirectoriesExists = &self->_persistedAlbumDataDirectoryExists;
        if (!v11) {
          goto LABEL_31;
        }
LABEL_21:
        p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
        os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
        if ((*p_photoDirectoriesExists & (1 << v7)) != 0)
        {
          id v18 = v13;
          goto LABEL_30;
        }
        id v25 = v13;
        BOOL v19 = +[PLFileUtilities createDirectoryAtPath:v11 error:&v25];
        id v18 = v25;

        if (v19)
        {
          *p_photoDirectoriesExists ^= 1 << v7;
          id v24 = v18;
          [(PLPhotoLibraryPathManagerCore *)self updateExclusionAttributeWithPath:v11 mask:v8 pathType:v7 error:&v24];
          id v20 = v24;

          id v18 = v20;
LABEL_29:
          p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
          goto LABEL_30;
        }
        if (a6)
        {
          id v18 = v18;
          *a6 = v18;
          goto LABEL_29;
        }
        v22 = PLBackendGetLog();
        p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136446722;
          id v29 = "-[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:]";
          __int16 v30 = 2112;
          id v31 = v11;
          __int16 v32 = 2112;
          id v33 = v18;
          _os_log_impl(&dword_19BCFB000, v22, OS_LOG_TYPE_ERROR, "%{public}s: failed to create directory: %@ with error: %@", buf, 0x20u);
        }

LABEL_30:
        os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
        id v13 = v18;
LABEL_31:
        BOOL v16 = v13 == 0;
        break;
      default:
        goto LABEL_31;
    }
  }
  else
  {
    objc_super v15 = PLBackendGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      id v29 = "-[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:]";
      __int16 v30 = 2112;
      id v31 = v11;
      __int16 v32 = 2112;
      id v33 = v13;
      _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_ERROR, "%{public}s: failed to create directory: %@ with error: %@", buf, 0x20u);
    }

    if (a6)
    {
      id v13 = v13;
      BOOL v16 = 0;
      *a6 = v13;
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (BOOL)validateCreationRequestWithError:(id *)a3
{
  v17[3] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(PLPhotoLibraryPathManagerCore *)self libraryURL];
  id v15 = 0;
  char v6 = [v5 checkResourceIsReachableAndReturnError:&v15];
  id v7 = v15;

  if ((v6 & 1) == 0)
  {
    v16[0] = *MEMORY[0x1E4F289D0];
    uint64_t v8 = [(PLPhotoLibraryPathManagerCore *)self libraryURL];
    uint64_t v9 = *MEMORY[0x1E4F28A50];
    v17[0] = v8;
    v17[1] = v7;
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v16[1] = v9;
    v16[2] = v10;
    v17[2] = @"Bundle root was unreachable";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:3];

    BOOL v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.error" code:46802 userInfo:v11];
    id v13 = v12;
    if (a3) {
      *a3 = v12;
    }
  }
  return v6;
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)updateExclusionAttributeWithPath:(id)a3 mask:(unsigned __int8)a4 pathType:(unsigned __int8)a5 error:(id *)a6
{
  int v7 = a5;
  int v8 = a4;
  id v10 = a3;
  id v11 = v10;
  if (v8 == 6)
  {
    if (v7 == 6)
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid pathType for exclusion attribute in %s", "-[PLPhotoLibraryPathManagerCore updateExclusionAttributeWithPath:mask:pathType:error:]");
      goto LABEL_12;
    }
    if (v7 == 5) {
      goto LABEL_7;
    }
LABEL_12:
    BOOL v13 = 1;
    goto LABEL_13;
  }
  if (v8 != 4) {
    goto LABEL_12;
  }
  if ((v7 - 1) >= 0x10)
  {
    if (v7 != 17)
    {
      if (v7) {
        goto LABEL_12;
      }
LABEL_7:
      BOOL v13 = [(PLPhotoLibraryPathManagerCore *)self updateTimeMachineExclusionAttributeForExcludePath:v10 error:a6];
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  BOOL v12 = [v10 stringByDeletingLastPathComponent];
  BOOL v13 = [(PLPhotoLibraryPathManagerCore *)self updateTimeMachineExclusionAttributeForExcludePath:v12 error:a6];

LABEL_13:
  return v13;
}

+ (void)listenForSystemPhotoLibraryURLChanges
{
  v2 = dispatch_get_global_queue(0, 0);
  notify_register_dispatch("com.apple.photos.systemphotolibraryurl", &splURLChangeNotificationToken, v2, &__block_literal_global_10688);
}

+ (void)initialize
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
  {
    [a1 listenForSystemPhotoLibraryURLChanges];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyMemoriesRelatedSnapshotDirectory, 0);
  objc_storeStrong((id *)&self->_legacyModelInterestDatabasePath, 0);
  objc_storeStrong((id *)&self->_iTunesPhotosDirectory, 0);
  objc_storeStrong((id *)&self->_assetUUIDRecoveryMappingPath, 0);
  objc_storeStrong((id *)&self->_baseDirectory, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

+ (int64_t)wellKnownPhotoLibraryIdentifierForURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 lastPathComponent];
  char v6 = [&unk_1EEC14DD8 objectForKeyedSubscript:v5];

  if (v6)
  {
    int64_t v7 = [v6 integerValue];
    if (v7 >= 2)
    {
      int v8 = [a1 wellKnownPhotoLibraryURLForIdentifier:v7];
      BOOL v9 = +[PLFileUtilities fileURL:v4 isEqualToFileURL:v8];

      if (!v9) {
        int64_t v7 = 0;
      }
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (NSString)legacyMemoriesRelatedSnapshotDirectory
{
  return self->_legacyMemoriesRelatedSnapshotDirectory;
}

- (NSString)legacyModelInterestDatabasePath
{
  return self->_legacyModelInterestDatabasePath;
}

- (NSString)iTunesPhotosDirectory
{
  return self->_iTunesPhotosDirectory;
}

- (NSString)assetUUIDRecoveryMappingPath
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (id)simpleDCIMDirectory
{
  return 0;
}

- (id)pathsGroupedByAssetBasePathFromFilePaths:(id)a3 populateInvalidAdjustmentPaths:(id)a4
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)assetBaseFilenameForAdjustmentFilePath:(id)a3
{
  return 0;
}

- (id)photoMetadataDirectoryForMediaInMainDirectory:(id)a3
{
  return 0;
}

- (id)persistedAlbumDataDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4
{
  return 0;
}

- (id)iTunesSyncedFaceDataDirectory
{
  return 0;
}

- (id)iTunesSyncedFaceAlbumThumbnailsDirectory
{
  return 0;
}

- (id)iTunesSyncedAssetsDirectory
{
  return 0;
}

- (id)iTunesSyncedAssetSmallThumbnailsDirectory
{
  return 0;
}

- (id)iTunesSyncedAssetMetadataThumbnailsDirectory
{
  return 0;
}

- (id)iTunesPhotosSyncMetadataFilePath
{
  return 0;
}

- (id)iTunesPhotosSyncCurrentLibraryUUIDPath
{
  return 0;
}

- (id)iTunesPhotosLastSyncMetadataFilePath
{
  return 0;
}

- (id)modelRestorePostProcessingCompleteTokenPath
{
  return 0;
}

- (id)cloudRestoreContextPath
{
  return 0;
}

- (id)cloudRestoreCompleteTokenPath
{
  return 0;
}

- (id)cloudRestoreBackgroundPhaseInProgressTokenPath
{
  return 0;
}

- (id)cloudRestoreForegroundPhaseCompleteTokenPath
{
  return 0;
}

- (id)pathToAssetAlbumOrderStructure
{
  return 0;
}

- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 rootPath:(id)a4
{
  uint64_t v5 = (__CFString *)a3;
  id v6 = a4;
  if ([(__CFString *)v5 hasPrefix:v6])
  {
    int64_t v7 = v5;
    goto LABEL_3;
  }
  if ([(__CFString *)v5 hasPrefix:@"/private/"]
    && ([v6 hasPrefix:@"/private/"] & 1) == 0)
  {
    int64_t v7 = -[__CFString substringFromIndex:](v5, "substringFromIndex:", [@"/private" length]);
    if (![v7 hasPrefix:v6])
    {
LABEL_10:

      goto LABEL_11;
    }

LABEL_3:
    uint64_t v8 = [v7 length];
    if (v8 == [v6 length])
    {
      uint64_t v5 = &stru_1EEBF74F0;
    }
    else
    {
      objc_msgSend(v7, "substringFromIndex:", objc_msgSend(v6, "length") + 1);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 type:(unsigned __int8)a4 bundleScope:(unsigned __int16)a5
{
  return 0;
}

- (BOOL)ensureFileProviderSyncExclusionAttributeIsSetWithError:(id *)a3
{
  return 0;
}

- (BOOL)isDeviceRestoreSupported
{
  return 1;
}

- (void)setDataProtectionComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PLPhotoLibraryPathManagerCore *)self _dataProtectionIndicatorFilePath];
  PLMakeIndicatorFileExistAtPath(v4, v3);
}

- (BOOL)isDataProtectionComplete
{
  v2 = [(PLPhotoLibraryPathManagerCore *)self _dataProtectionIndicatorFilePath];
  BOOL v3 = PLDoesIndicatorFileExistAtPath(v2);

  return v3;
}

- (id)_dataProtectionIndicatorFilePath
{
  return [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:2 additionalPathComponents:@"protection"];
}

- (id)pathsForFinderSyncFilesystemSizeCalculation
{
  [(PLPhotoLibraryPathManagerCore *)self doesNotRecognizeSelector:a2];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  return (id)[v2 set];
}

- (id)pathsForLibraryFilesystemSizeCalculation
{
  [(PLPhotoLibraryPathManagerCore *)self doesNotRecognizeSelector:a2];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  return (id)[v2 set];
}

- (void)obtainAccessAndWaitWithFileWithIdentifier:(id)a3 mode:(unsigned __int8)a4 toURLWithHandler:(id)a5
{
}

- (void)setExtendedAttributesWithIdentifier:(id)a3 andURL:(id)a4
{
}

- (void)setExtendedAttributesWithIdentifier:(id)a3
{
}

- (id)readOnlyUrlWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)shouldUseFileIdentifierForBundleScope:(unsigned __int16)a3
{
  return 0;
}

- (id)temporaryDragAndDropDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = NSTemporaryDirectory();
  int64_t v7 = [v6 stringByAppendingPathComponent:@"com.apple.photos.drag-and-drop"];

  if (v5)
  {
    id v13 = 0;
    BOOL v8 = +[PLFileUtilities createDirectoryAtPath:v7 error:&v13];
    id v9 = v13;
    id v10 = v9;
    if (!v8)
    {
      if (a4)
      {
        *a4 = v9;
      }
      else
      {
        id v11 = PLBackendGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          id v15 = "-[PLPhotoLibraryPathManagerCore temporaryDragAndDropDirectoryCreateIfNeeded:error:]";
          __int16 v16 = 2112;
          int v17 = v7;
          __int16 v18 = 2112;
          BOOL v19 = v10;
          _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_ERROR, "%s: failed to create directory: %@ with error: %@", buf, 0x20u);
        }
      }
    }
  }
  return v7;
}

- (id)temporaryFileBackedDebugDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = NSTemporaryDirectory();
  int64_t v7 = [v6 stringByAppendingPathComponent:@"com.apple.photos.file-backed-datasource"];

  if (v5)
  {
    id v13 = 0;
    BOOL v8 = +[PLFileUtilities createDirectoryAtPath:v7 error:&v13];
    id v9 = v13;
    id v10 = v9;
    if (!v8)
    {
      if (a4)
      {
        *a4 = v9;
        id v11 = v7;
        int64_t v7 = 0;
      }
      else
      {
        id v11 = PLBackendGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          id v15 = "-[PLPhotoLibraryPathManagerCore temporaryFileBackedDebugDirectoryCreateIfNeeded:error:]";
          __int16 v16 = 2112;
          int v17 = v7;
          __int16 v18 = 2112;
          BOOL v19 = v10;
          _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_ERROR, "%s: failed to create directory: %@ with error: %@", buf, 0x20u);
        }
      }
    }
  }
  return v7;
}

- (id)knownDBPaths
{
  v9[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PLPhotoLibraryPathManagerCore *)self photosDatabasePath];
  v9[0] = v3;
  id v4 = [(PLPhotoLibraryPathManagerCore *)self photosAsideDatabasePath];
  v9[1] = v4;
  BOOL v5 = [(PLPhotoLibraryPathManagerCore *)self privateDirectoryWithSubType:3];
  v9[2] = v5;
  id v6 = [(PLPhotoLibraryPathManagerCore *)self photosCPLDatabasePath];
  v9[3] = v6;
  int64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:4];

  return v7;
}

- (id)syncInfoPath
{
  return 0;
}

- (id)pathToAssetsToAlbumsMapping
{
  return 0;
}

- (id)assetMainFilePathWithDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5
{
  return 0;
}

- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4
{
  return 0;
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  id v12 = a5;
  id v13 = [(PLPhotoLibraryPathManagerCore *)self externalDirectoryWithSubType:v10 leafType:v9 additionalPathComponents:v12];
  if (v8)
  {
    if (v9 == 1 && [v12 length])
    {
      uint64_t v14 = 1;
    }
    else if (v9 == 2)
    {
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 5;
    }
    [(PLPhotoLibraryPathManagerCore *)self createDirectoryOnceWithPath:v13 mask:v14 pathType:v10 error:a7];
  }

  return v13;
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  return [(PLPhotoLibraryPathManagerCore *)self externalDirectoryWithSubType:a3 leafType:0 additionalPathComponents:0 createIfNeeded:a4 error:a5];
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  return 0;
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3
{
  return [(PLPhotoLibraryPathManagerCore *)self externalDirectoryWithSubType:a3 leafType:0 additionalPathComponents:0];
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  id v12 = a5;
  id v13 = [(PLPhotoLibraryPathManagerCore *)self privateCacheDirectoryWithSubType:v10 leafType:v9 additionalPathComponents:v12];
  if (v8)
  {
    uint64_t v14 = 4;
    if (v9 == 1)
    {
      if ([v12 length]) {
        uint64_t v14 = 1;
      }
      else {
        uint64_t v14 = 4;
      }
    }
    [(PLPhotoLibraryPathManagerCore *)self createDirectoryOnceWithPath:v13 mask:v14 pathType:v10 error:a7];
  }

  return v13;
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  return [(PLPhotoLibraryPathManagerCore *)self privateCacheDirectoryWithSubType:a3 leafType:0 additionalPathComponents:0 createIfNeeded:a4 error:a5];
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  return 0;
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3
{
  return [(PLPhotoLibraryPathManagerCore *)self privateCacheDirectoryWithSubType:a3 leafType:0 additionalPathComponents:0];
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5 createIfNeeded:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  uint64_t v9 = a4;
  uint64_t v10 = a3;
  id v12 = a5;
  id v13 = [(PLPhotoLibraryPathManagerCore *)self privateDirectoryWithSubType:v10 leafType:v9 additionalPathComponents:v12];
  if (v8)
  {
    if (v9 == 1 && [v12 length])
    {
      uint64_t v14 = 1;
    }
    else if (v9 == 2)
    {
      uint64_t v14 = 1;
    }
    else
    {
      uint64_t v14 = 3;
    }
    [(PLPhotoLibraryPathManagerCore *)self createDirectoryOnceWithPath:v13 mask:v14 pathType:v10 error:a7];
  }

  return v13;
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 createIfNeeded:(BOOL)a5 error:(id *)a6
{
  return [(PLPhotoLibraryPathManagerCore *)self privateDirectoryWithSubType:a3 leafType:a4 additionalPathComponents:0 createIfNeeded:a5 error:a6];
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 createIfNeeded:(BOOL)a4 error:(id *)a5
{
  return [(PLPhotoLibraryPathManagerCore *)self privateDirectoryWithSubType:a3 leafType:0 additionalPathComponents:0 createIfNeeded:a4 error:a5];
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  return 0;
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3
{
  return [(PLPhotoLibraryPathManagerCore *)self privateDirectoryWithSubType:a3 leafType:0 additionalPathComponents:0];
}

- (BOOL)pathRelativeToBundle:(id)a3 isSubpathOfPhotoDirectoryWithType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  int64_t v7 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:1];
  BOOL v8 = [v7 stringByAppendingPathComponent:v6];

  LOBYTE(v4) = [(PLPhotoLibraryPathManagerCore *)self path:v8 isSubpathOfPhotoDirectoryWithType:v4];
  return v4;
}

- (BOOL)path:(id)a3 isSubpathOfPhotoDirectoryWithType:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int64_t v7 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:v4];
  BOOL v8 = [v7 pathComponents];
  uint64_t v9 = [v6 pathComponents];
  unint64_t v10 = [v9 count];
  if (v10 <= [v8 count])
  {
    BOOL v19 = 0;
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v21 = v6;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v11);
          }
          int v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          __int16 v18 = [v9 objectAtIndexedSubscript:v14 + i];
          LODWORD(v17) = [v17 isEqualToString:v18];

          if (!v17)
          {
            BOOL v19 = 0;
            goto LABEL_13;
          }
        }
        v14 += i;
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v19 = 1;
LABEL_13:
      id v6 = v21;
    }
    else
    {
      BOOL v19 = 1;
    }
  }
  return v19;
}

- (void)enumerateBundleScopesWithBlock:(id)a3
{
}

- (id)pathsForExternalWriters
{
  [(PLPhotoLibraryPathManagerCore *)self doesNotRecognizeSelector:a2];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  return v2;
}

- (BOOL)createPathsForNewLibrariesWithError:(id *)a3
{
  return 0;
}

- (id)pathsForPermissionCheck
{
  [(PLPhotoLibraryPathManagerCore *)self doesNotRecognizeSelector:a2];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  return v2;
}

- (id)pathsForClientAccess:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)clientOwnedDirectoryPathsForClientAccess:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  return 0;
}

- (id)photosAsideDatabasePath
{
  id v2 = [(PLPhotoLibraryPathManagerCore *)self photosDatabasePath];
  BOOL v3 = [v2 stringByAppendingPathExtension:@"aside"];

  return v3;
}

- (id)photosCPLDatabasePath
{
  v7[3] = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  BOOL v3 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:13 leafType:3 additionalPathComponents:0];
  v7[0] = v3;
  v7[1] = @"storage";
  v7[2] = @"store.cloudphotodb";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  BOOL v5 = [v2 pathWithComponents:v4];

  return v5;
}

- (id)photosDatabasePath
{
  return 0;
}

- (unsigned)photoLibraryPathTypeForBundleScope:(unsigned __int16)a3
{
  return 0;
}

- (id)convertPhotoLibraryPathType:(unsigned __int8)a3
{
  return 0;
}

- (id)basePrivateDirectoryPath
{
  return 0;
}

- (BOOL)updateTimeMachineExclusionAttributeForExcludePath:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)internalDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3
{
  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  self->_internalDirectoriesExists &= ~(1 << a3);
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
}

- (void)externalDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3
{
  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  self->_externalDirectoriesExists &= ~(1 << a3);
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
}

- (void)privateCacheDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3
{
  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  self->_privateCacheSubDirectoriesExists &= ~(1 << a3);
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
}

- (void)privateDirectoryCreationMaskResetWithSubType:(unsigned __int8)a3
{
  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  self->_privateSubDirectoriesExists &= ~(1 << a3);
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
}

- (void)photoDirectoryCreationMaskResetWithType:(unsigned __int8)a3
{
  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  self->_photoDirectoriesExists &= ~(1 << a3);
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
}

- (BOOL)internalValidateCreationRequestWithError:(id *)a3
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (PLIsReallyAssetsd_isAssetsd || (__PLIsAssetsdProxyService & 1) != 0) {
    return 1;
  }
  return [(PLPhotoLibraryPathManagerCore *)self validateCreationRequestWithError:a3];
}

- (PLFileSystemCapabilities)capabilities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_folderCreationAndCapabilitiesLock = &self->_folderCreationAndCapabilitiesLock;
  os_unfair_lock_lock(&self->_folderCreationAndCapabilitiesLock);
  capabilities = self->_capabilities;
  if (!capabilities)
  {
    BOOL v5 = objc_alloc_init(PLFileSystemCapabilities);
    id v6 = self->_capabilities;
    self->_capabilities = v5;

    int64_t v7 = self->_capabilities;
    BOOL v8 = [(PLPhotoLibraryPathManagerCore *)self libraryURL];
    id v16 = 0;
    BOOL v9 = [(PLFileSystemCapabilities *)v7 determineCapabilitiesWithURL:v8 error:&v16];
    id v10 = v16;

    if (!v9)
    {
      id v11 = PLBackendGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [(PLPhotoLibraryPathManagerCore *)self libraryURL];
        uint64_t v13 = +[PLFilePathDescription descriptionWithFileURL:v12];
        *(_DWORD *)buf = 138412546;
        __int16 v18 = v13;
        __int16 v19 = 2112;
        id v20 = v10;
        _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_ERROR, "Error determining capabilities for %@: %@", buf, 0x16u);
      }
    }

    capabilities = self->_capabilities;
  }
  uint64_t v14 = capabilities;
  os_unfair_lock_unlock(p_folderCreationAndCapabilitiesLock);
  return v14;
}

- (PLPhotoLibraryPathManagerCore)init
{
  return 0;
}

+ (id)basenameForSpatialOverCaptureFromOriginalBasename:(id)a3
{
  return (id)[a3 stringByAppendingString:@"S"];
}

+ (id)rootURLForPhotoLibraryDomain:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) < 2)
  {
    uint64_t v11 = [a1 _photosLibrariesDataVaultPathForApplicationLibrariesDomain];
LABEL_7:
    BOOL v3 = (void *)v11;
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    uint64_t v11 = [a1 photosLibrariesDataVaultPath];
    goto LABEL_7;
  }
  if (!a3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"PLPhotoLibraryPathManagerCore.m" lineNumber:1308 description:@"API misuse: requesting URL for unknown domain"];

    int64_t v7 = (void *)MEMORY[0x1E4F1CB10];
    BOOL v8 = [MEMORY[0x1E4F29128] UUID];
    BOOL v9 = [v8 UUIDString];
    id v10 = [@"/" stringByAppendingPathComponent:v9];
    BOOL v3 = [v7 fileURLWithPath:v10];
  }
LABEL_8:
  return v3;
}

+ (BOOL)shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

+ (BOOL)ignoreFilesystemCheckForWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 > 0;
}

+ (BOOL)shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 > 1;
}

+ (BOOL)backupSupportedForWellKnownLibraryIdentifier:(int64_t)a3
{
  return (unint64_t)a3 < 2;
}

+ (unint64_t)libraryCreateOptionsForWellKnownLibraryIdentifier:(int64_t)a3
{
  if (a3 == 3) {
    unint64_t v3 = 3;
  }
  else {
    unint64_t v3 = 0;
  }
  if (a3 == 2) {
    return 19;
  }
  else {
    return v3;
  }
}

+ (id)wellKnownPhotoLibraryURLForIdentifier:(int64_t)a3
{
  unint64_t v3 = a1;
  switch(a3)
  {
    case 0:
      BOOL v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:v3 file:@"PLPhotoLibraryPathManagerCore.m" lineNumber:1209 description:@"API misuse: requesting URL for a non-well-known library"];

      id v6 = (void *)MEMORY[0x1E4F1CB10];
      int64_t v7 = [MEMORY[0x1E4F29128] UUID];
      BOOL v8 = [v7 UUIDString];
      BOOL v9 = [@"/" stringByAppendingPathComponent:v8];
      unint64_t v3 = [v6 fileURLWithPath:v9];

      break;
    case 1:
      uint64_t v10 = [a1 systemLibraryURL];
      goto LABEL_7;
    case 2:
      uint64_t v11 = @"Messages.photoslibrary";
      goto LABEL_6;
    case 3:
      uint64_t v11 = @"Syndication.photoslibrary";
LABEL_6:
      uint64_t v10 = [a1 _photosLibrariesDataVaultPathForLibraryBundleName:v11];
LABEL_7:
      unint64_t v3 = (void *)v10;
      break;
    default:
      break;
  }
  return v3;
}

+ (id)photosLibraryExtension
{
  return @"photoslibrary";
}

+ (id)_photosLibrariesDataVaultPathForApplicationLibrariesDomain
{
  id v2 = [a1 photosLibrariesDataVaultPath];
  unint64_t v3 = [v2 URLByAppendingPathComponent:@"Application" isDirectory:1];

  return v3;
}

+ (id)photosLibrariesDataVaultPath
{
  id v2 = [a1 photosDataVaultPath];
  unint64_t v3 = [v2 URLByAppendingPathComponent:@"Libraries" isDirectory:1];

  return v3;
}

+ (id)photosDataVaultPath
{
  id v2 = +[PLFileUtilities embeddedHomeDirectory];
  unint64_t v3 = [v2 stringByAppendingPathComponent:@"Library"];

  uint64_t v4 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v5 = [v3 stringByAppendingPathComponent:@"Photos"];
  id v6 = [v4 fileURLWithPath:v5 isDirectory:1];

  return v6;
}

+ (id)_photosLibrariesDataVaultPathForLibraryBundleName:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 photosLibrariesDataVaultPath];
  id v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:1];

  return v6;
}

+ (id)managedPathWithUuid:(const char *)a3 base:(const char *)a4 fileMarker:(const char *)a5 extension:(const char *)a6
{
  size_t v11 = strlen(a4);
  size_t v12 = v11 + strlen(a3) + 4;
  if (a5 && a6)
  {
    size_t v13 = strlen(a5);
    v12 += v13 + strlen(a6) + 2;
    uint64_t v14 = (char *)malloc_type_calloc(1uLL, v12, 0x73B04F21uLL);
    int v15 = snprintf(v14, v12, "%s/%c/%s_%s.%s");
  }
  else if (a5)
  {
    v12 += strlen(a5) + 1;
    uint64_t v14 = (char *)malloc_type_calloc(1uLL, v12, 0xFB767AA4uLL);
    int v15 = snprintf(v14, v12, "%s/%c/%s_%s");
  }
  else if (a6)
  {
    v12 += strlen(a6) + 1;
    uint64_t v14 = (char *)malloc_type_calloc(1uLL, v12, 0xA2FE7322uLL);
    int v15 = snprintf(v14, v12, "%s/%c/%s.%s");
  }
  else
  {
    uint64_t v14 = (char *)malloc_type_calloc(1uLL, v12, 0x5E796146uLL);
    int v15 = snprintf(v14, v12, "%s/%c/%s");
  }
  if (v12 <= v15)
  {
    __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PLPhotoLibraryPathManagerCore.m", 1161, @"Invalid parameter not satisfying: %@", @"formattedLen < urlStringLen" object file lineNumber description];
  }
  id v16 = [NSString stringWithUTF8String:v14];
  free(v14);
  return v16;
}

+ (BOOL)_persistSystemPhotoLibraryPath:(id)a3 sendChangeNotification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&splLock);
  int64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.photolibraryd.private"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v6)
    {
      uint64_t v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        size_t v11 = (objc_class *)objc_opt_class();
        size_t v12 = NSStringFromClass(v11);
        int v17 = 138412290;
        id v18 = v12;
        _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "object being saved as SPL path is not valid: %@", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      [v7 removeObjectForKey:@"SystemLibraryPath"];
      uint64_t v14 = [v7 objectForKey:@"SystemLibraryPath"];

      if (!v14)
      {
        BOOL v8 = PLBackendGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "Removed SPL path from private group container", (uint8_t *)&v17, 2u);
        }
        goto LABEL_19;
      }
    }
LABEL_15:
    BOOL v15 = 0;
    goto LABEL_16;
  }
  [v7 setObject:v6 forKey:@"SystemLibraryPath"];
  BOOL v8 = [v7 objectForKey:@"SystemLibraryPath"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v8 isEqualToString:v6])
  {
    size_t v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_19BCFB000, v13, OS_LOG_TYPE_ERROR, "Failed to write SPL path to private group container", (uint8_t *)&v17, 2u);
    }

    goto LABEL_15;
  }
  BOOL v9 = PLBackendGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_DEFAULT, "Successfully wrote SPL path to private group container: %@", (uint8_t *)&v17, 0xCu);
  }

LABEL_19:
  objc_storeStrong((id *)&sSystemLibraryPath, a3);
  if (v4) {
    notify_post("com.apple.photos.systemphotolibraryurl");
  }
  BOOL v15 = 1;
LABEL_16:

  return v15;
}

+ (id)_readSystemPhotoLibraryPath
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner((const os_unfair_lock *)&splLock);
  unint64_t v3 = (void *)sSystemLibraryPath;
  if (!sSystemLibraryPath)
  {
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"group.com.apple.photolibraryd.private"];
    uint64_t v5 = [v4 objectForKey:@"SystemLibraryPath"];
    id v6 = (void *)sSystemLibraryPath;
    sSystemLibraryPath = v5;

    if (sSystemLibraryPath)
    {
LABEL_13:

      unint64_t v3 = (void *)sSystemLibraryPath;
      goto LABEL_14;
    }
    int64_t v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    BOOL v8 = [v7 stringForKey:@"SystemLibraryPath"];

    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (![a1 _persistSystemPhotoLibraryPath:v8 sendChangeNotification:0])
      {
LABEL_12:

        goto LABEL_13;
      }
      BOOL v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_DEFAULT, "Removing SPL path from NSUserDefaults", (uint8_t *)&v12, 2u);
      }

      uint64_t v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      [v10 removeObjectForKey:@"SystemLibraryPath"];
    }
    else
    {
      uint64_t v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        size_t v13 = v8;
        _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_DEFAULT, "No SPL stored, and SPL from standard defaults was %@", (uint8_t *)&v12, 0xCu);
      }
    }

    goto LABEL_12;
  }
LABEL_14:
  return v3;
}

+ (void)recordPrevSystemLibraryPath:(id)a3
{
  if (a3)
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F1CB18];
    id v4 = a3;
    uint64_t v5 = [v3 standardUserDefaults];
    id v6 = [v5 objectForKey:@"PrevSystemLibraryPathsByDate"];
    id v15 = (id)[v6 mutableCopy];

    id v7 = v15;
    if (!v15) {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    id v16 = v7;
    if ((unint64_t)[v7 count] >= 0xA)
    {
      BOOL v8 = [v16 allKeys];
      BOOL v9 = [v8 sortedArrayUsingSelector:sel_compare_];

      uint64_t v10 = [v9 firstObject];
      [v16 removeObjectForKey:v10];
    }
    if (recordPrevSystemLibraryPath__onceToken != -1) {
      dispatch_once(&recordPrevSystemLibraryPath__onceToken, &__block_literal_global_274);
    }
    size_t v11 = (void *)recordPrevSystemLibraryPath__formatter;
    int v12 = [MEMORY[0x1E4F1C9C8] date];
    size_t v13 = [v11 stringFromDate:v12];

    [v16 setObject:v4 forKey:v13];
    uint64_t v14 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v14 setObject:v16 forKey:@"PrevSystemLibraryPathsByDate"];
  }
}

void __61__PLPhotoLibraryPathManagerCore_recordPrevSystemLibraryPath___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)recordPrevSystemLibraryPath__formatter;
  recordPrevSystemLibraryPath__formatter = (uint64_t)v0;

  [(id)recordPrevSystemLibraryPath__formatter setDateFormat:@"yyyy-MM-dd HH.mm.ss.SSS"];
  id v2 = (void *)recordPrevSystemLibraryPath__formatter;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US"];
  [v2 setLocale:v3];
}

+ (BOOL)setSystemLibraryURL:(id)a3 options:(unsigned __int16)a4 error:(id *)a5
{
  char v6 = a4;
  v31[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
LABEL_4:
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
    if (PLIsReallyAssetsd_isAssetsd)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&splLock);
      if ((v6 & 2) != 0)
      {
        if (v6)
        {
          long long v25 = (void *)sSystemPhotoLibraryOverridePath;
          sSystemPhotoLibraryOverridePath = 0;

          id v23 = 0;
          char v15 = 1;
        }
        else
        {
          long long v24 = PLBackendGetLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19BCFB000, v24, OS_LOG_TYPE_DEFAULT, "Resetting persisted system photo library path", buf, 2u);
          }

          char v15 = 1;
          [a1 _persistSystemPhotoLibraryPath:0 sendChangeNotification:1];
          id v23 = 0;
        }
      }
      else
      {
        int v12 = [v8 path];
        id v28 = 0;
        size_t v13 = +[PLFileUtilities realPathForPath:v12 error:&v28];
        id v14 = v28;

        char v15 = v13 != 0;
        if (v13)
        {
          if (v6) {
            objc_storeStrong((id *)&sSystemPhotoLibraryOverridePath, v13);
          }
          else {
            [a1 _persistSystemPhotoLibraryPath:v13 sendChangeNotification:1];
          }
          id v23 = 0;
        }
        else
        {
          id v23 = v14;
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&splLock);
      if (!a5) {
        goto LABEL_28;
      }
    }
    else
    {
      uint64_t v21 = objc_alloc_init(PLNonBindingAssetsdClient);
      long long v22 = [(PLNonBindingAssetsdClient *)v21 libraryManagementClient];
      id v27 = 0;
      char v15 = [v22 setSystemPhotoLibraryURL:v8 error:&v27];
      id v23 = v27;

      if (!a5)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    if (v23) {
      *a5 = v23;
    }
    goto LABEL_28;
  }
  buf[0] = 0;
  BOOL v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v10 = [v8 path];
  int v11 = [v9 fileExistsAtPath:v10 isDirectory:buf];

  if (!v11)
  {
    uint64_t v16 = 41015;
    if (!a5) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v17 = *MEMORY[0x1E4F289D0];
    v31[0] = v8;
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v30[0] = v17;
    v30[1] = v18;
    uint64_t v19 = NSStringFromPLErrorCode(v16);
    v31[1] = v19;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];

    *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.error" code:v16 userInfo:v20];

    goto LABEL_11;
  }
  if (+[PLPhotoLibraryPathManagerCore isSupportedFileSystemAtURL:v8])
  {
    goto LABEL_4;
  }
  uint64_t v16 = 46107;
  if (a5) {
    goto LABEL_10;
  }
LABEL_11:
  char v15 = 0;
LABEL_29:

  return v15;
}

+ (id)_constructLegacySystemPhotoLibraryURLFromUnresolvableBookmark:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v5 = *MEMORY[0x1E4F1C700];
  v23[0] = *MEMORY[0x1E4F1C700];
  char v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v7 = [v4 resourceValuesForKeys:v6 fromBookmarkData:v3];

  if (v7)
  {
    id v8 = [v7 objectForKeyedSubscript:v5];
    if (v8)
    {
      BOOL v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:1];
      uint64_t v10 = PLBackendGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412290;
        long long v22 = v9;
        _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_DEFAULT, "Constructed legacy SPL URL based on unresolvable bookmark: %@", (uint8_t *)&v21, 0xCu);
      }

      if (v9)
      {
        id v11 = v9;

        goto LABEL_16;
      }
    }
    else
    {
      int v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_DEFAULT, "No NSURLPathKey available from unresolvable bookmark", (uint8_t *)&v21, 2u);
      }
    }
  }
  size_t v13 = 0;
  do
  {
    id v14 = v13;
    char v15 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v16 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v17 = [v16 UUIDString];
    uint64_t v18 = [@"/Volumes/" stringByAppendingPathComponent:v17];
    size_t v13 = [v15 fileURLWithPath:v18 isDirectory:1];
  }
  while (([v13 checkResourceIsReachableAndReturnError:0] & 1) != 0);
  uint64_t v19 = PLBackendGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412290;
    long long v22 = v13;
    _os_log_impl(&dword_19BCFB000, v19, OS_LOG_TYPE_DEFAULT, "Legacy system photo library URL exists but it is not resolvable. Returning bogus URL: %@", (uint8_t *)&v21, 0xCu);
  }

  id v11 = v13;
LABEL_16:

  return v11;
}

+ (id)_legacySystemLibraryPath
{
  return 0;
}

+ (id)_legacySystemLibraryBookmarkData
{
  return 0;
}

+ (void)_updateSystemLibraryURLWithOldValue:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(PLNonBindingAssetsdClient);
  uint64_t v5 = [(PLNonBindingAssetsdClient *)v4 systemLibraryURLReadOnlyClient];
  id v10 = 0;
  char v6 = [v5 systemPhotoLibraryURLWithError:&v10];
  id v7 = v10;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&splLock);
    if ((id)sCurrentSystemPhotoLibraryURL == v3) {
      objc_storeStrong((id *)&sCurrentSystemPhotoLibraryURL, v6);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&splLock);
  }
}

+ (id)allPhotosPathsOnThisDevice
{
  return 0;
}

+ (id)systemLibraryBaseDirectory
{
  id v2 = [a1 systemLibraryURL];
  id v3 = [v2 path];

  return v3;
}

+ (BOOL)isSupportedFileSystemAtURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PLFileSystemCapabilities capabilitiesWithURL:v3];
  char v5 = [v4 isWholeFileLockCapable];
  if ((v5 & 1) == 0)
  {
    char v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 error];
      int v9 = 138412546;
      id v10 = v3;
      __int16 v11 = 2112;
      int v12 = v7;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_DEFAULT, "Not a valid system library URL because it not a supported filesystem %@: %@", (uint8_t *)&v9, 0x16u);
    }
  }

  return v5;
}

void __70__PLPhotoLibraryPathManagerCore_listenForSystemPhotoLibraryURLChanges__block_invoke()
{
  os_unfair_lock_lock((os_unfair_lock_t)&splLock);
  id v0 = (void *)sCurrentSystemPhotoLibraryURL;
  sCurrentSystemPhotoLibraryURL = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&splLock);
}

+ (id)libraryURLFromDatabaseURL:(id)a3
{
  id v3 = [a3 URLByDeletingLastPathComponent];
  id v4 = [v3 URLByDeletingLastPathComponent];

  return v4;
}

+ (BOOL)setICloudBackupExclusionAttribute:(BOOL)a3 url:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F28ED0];
  id v8 = a4;
  int v9 = [v7 numberWithBool:v6];
  LOBYTE(v7) = [v8 setResourceValue:v9 forKey:*MEMORY[0x1E4F1CE10] error:a5];

  if (v7 & 1) != 0 || (PLIsErrorFileNotFound(0)) {
    return 1;
  }
  BOOL result = 0;
  if (a5) {
    *a5 = 0;
  }
  return result;
}

+ (BOOL)setTimeMachineExclusionAttribute:(BOOL)a3 url:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F28ED0];
  id v8 = a4;
  int v9 = [v7 numberWithBool:v6];
  uint64_t v10 = *MEMORY[0x1E4F1C630];
  id v18 = 0;
  int v11 = [v8 setResourceValue:v9 forKey:v10 error:&v18];

  id v12 = v18;
  if (v11)
  {
    id v13 = v12;
LABEL_4:
    BOOL v16 = 1;
    goto LABEL_5;
  }
  char v14 = PLIsErrorFileNotFound(v12);
  id v15 = v12;
  if (v14) {
    goto LABEL_4;
  }
  BOOL v16 = 0;
  if (a5) {
    *a5 = v15;
  }
LABEL_5:

  return v16;
}

@end