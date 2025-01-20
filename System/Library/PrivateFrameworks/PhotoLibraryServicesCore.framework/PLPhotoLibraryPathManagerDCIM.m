@interface PLPhotoLibraryPathManagerDCIM
+ (NSString)defaultDCIMPath;
+ (id)allPhotosPathsOnThisDevice;
- (BOOL)ensureFileProviderSyncExclusionAttributeIsSetWithError:(id *)a3;
- (BOOL)shouldUseFileIdentifierForBundleScope:(unsigned __int16)a3;
- (BOOL)updateTimeMachineExclusionAttributeForExcludePath:(id)a3 error:(id *)a4;
- (PLImportFileManager)importFileManager;
- (PLPhotoLibraryPathManagerDCIM)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4;
- (id)_externalDirectoryWithBundleIdentifier:(id)a3 createIfNeeded:(BOOL)a4;
- (id)addToPath:(id)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 type:(unsigned __int8)a4 bundleScope:(unsigned __int16)a5;
- (id)assetBaseFilenameForAdjustmentFilePath:(id)a3;
- (id)assetMainFilePathWithDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5;
- (id)basePrivateDirectoryPath;
- (id)captureSessionPathsWithClientAuthorization:(id)a3;
- (id)clientOwnedDirectoryPathsForClientAccess:(id)a3;
- (id)cloudRestoreBackgroundPhaseInProgressTokenPath;
- (id)cloudRestoreCompleteTokenPath;
- (id)cloudRestoreContextPath;
- (id)cloudRestoreForegroundPhaseCompleteTokenPath;
- (id)convertPhotoLibraryPathType:(unsigned __int8)a3;
- (id)createPathsForNewLibraries;
- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)getImportFileManager;
- (id)iTunesPhotosLastSyncMetadataFilePath;
- (id)iTunesPhotosSyncCurrentLibraryUUIDPath;
- (id)iTunesPhotosSyncDirectory;
- (id)iTunesPhotosSyncMetadataFilePath;
- (id)iTunesSyncedAssetMetadataThumbnailsDirectory;
- (id)iTunesSyncedAssetSmallThumbnailsDirectory;
- (id)iTunesSyncedAssetsDirectory;
- (id)iTunesSyncedFaceAlbumThumbnailsDirectory;
- (id)iTunesSyncedFaceDataDirectory;
- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4;
- (id)modelRestorePostProcessingCompleteTokenPath;
- (id)pathToAssetAlbumOrderStructure;
- (id)pathToAssetsToAlbumsMapping;
- (id)pathsForClientAccess:(id)a3;
- (id)pathsForExternalWriters;
- (id)pathsForFinderSyncFilesystemSizeCalculation;
- (id)pathsForLibraryFilesystemSizeCalculation;
- (id)pathsForPermissionCheck;
- (id)pathsGroupedByAssetBasePathFromFilePaths:(id)a3 populateInvalidAdjustmentPaths:(id)a4;
- (id)persistedAlbumDataDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4;
- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)photoMetadataDirectory;
- (id)photoMetadataDirectoryForMediaInMainDirectory:(id)a3;
- (id)photoMutationsDirectory;
- (id)photosDatabasePath;
- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)readOnlyUrlWithIdentifier:(id)a3;
- (id)simpleDCIMDirectory;
- (id)syncInfoPath;
- (id)unlockedCaptureSessionPaths;
- (unsigned)photoLibraryPathTypeForBundleScope:(unsigned __int16)a3;
- (void)enumerateBundleScopesWithBlock:(id)a3;
- (void)obtainAccessAndWaitWithFileWithIdentifier:(id)a3 mode:(unsigned __int8)a4 toURLWithHandler:(id)a5;
- (void)setExtendedAttributesWithIdentifier:(id)a3;
- (void)setExtendedAttributesWithIdentifier:(id)a3 andURL:(id)a4;
- (void)setImportFileManager:(id)a3;
@end

@implementation PLPhotoLibraryPathManagerDCIM

- (PLPhotoLibraryPathManagerDCIM)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v72.receiver = self;
  v72.super_class = (Class)PLPhotoLibraryPathManagerDCIM;
  v7 = [(PLPhotoLibraryPathManagerCore *)&v72 initWithLibraryURL:v6 bundleScope:v4];
  v8 = v7;
  if (v7)
  {
    v9 = [(PLPhotoLibraryPathManagerCore *)v7 baseDirectory];
    uint64_t v10 = [v9 stringByAppendingPathComponent:@"PhotoData"];
    photoDataDirectory = v8->_photoDataDirectory;
    v8->_photoDataDirectory = (NSString *)v10;

    uint64_t v12 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"Caches"];
    photoDataCachesDirectory = v8->_photoDataCachesDirectory;
    v8->_photoDataCachesDirectory = (NSString *)v12;

    uint64_t v14 = [(NSString *)v8->_photoDataCachesDirectory stringByAppendingPathComponent:@"Analytics"];
    photoDataAnalyticsDirectory = v8->_photoDataAnalyticsDirectory;
    v8->_photoDataAnalyticsDirectory = (NSString *)v14;

    uint64_t v16 = [(NSString *)v8->_photoDataCachesDirectory stringByAppendingPathComponent:@"SmartSharing"];
    photoDataSmartSharingDirectory = v8->_photoDataSmartSharingDirectory;
    v8->_photoDataSmartSharingDirectory = (NSString *)v16;

    uint64_t v18 = [(NSString *)v8->_photoDataCachesDirectory stringByAppendingPathComponent:@"search"];
    photoDataSearchDirectory = v8->_photoDataSearchDirectory;
    v8->_photoDataSearchDirectory = (NSString *)v18;

    uint64_t v20 = [(NSString *)v8->_photoDataCachesDirectory stringByAppendingPathComponent:@"Restore"];
    restoreInfoDirectory = v8->_restoreInfoDirectory;
    v8->_restoreInfoDirectory = (NSString *)v20;

    uint64_t v22 = [(NSString *)v8->_photoDataCachesDirectory stringByAppendingPathComponent:@"Compute"];
    photoDataComputeDirectory = v8->_photoDataComputeDirectory;
    v8->_photoDataComputeDirectory = (NSString *)v22;

    v24 = [(PLPhotoLibraryPathManagerCore *)v8 baseDirectory];
    uint64_t v25 = [v24 stringByAppendingPathComponent:@"DCIM"];
    dcimDirectory = v8->_dcimDirectory;
    v8->_dcimDirectory = (NSString *)v25;

    uint64_t v27 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"CPLAssets"];
    cplAssetsDirectory = v8->_cplAssetsDirectory;
    v8->_cplAssetsDirectory = (NSString *)v27;

    uint64_t v29 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"CMMAssets"];
    cmmAssetsDirectory = v8->_cmmAssetsDirectory;
    v8->_cmmAssetsDirectory = (NSString *)v29;

    uint64_t v31 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"Journals"];
    journalsDirectory = v8->_journalsDirectory;
    v8->_journalsDirectory = (NSString *)v31;

    uint64_t v33 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"Projects"];
    projectsDirectory = v8->_projectsDirectory;
    v8->_projectsDirectory = (NSString *)v33;

    v35 = PLBundleIdentifier();
    uint64_t v36 = [(PLPhotoLibraryPathManagerCore *)v8 privateDirectoryWithBundleIdentifier:v35 createIfNeeded:0];
    privateDirectory = v8->_privateDirectory;
    v8->_privateDirectory = (NSString *)v36;

    uint64_t v38 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"resources/partialvideo"];
    partialVideoDirectory = v8->_partialVideoDirectory;
    v8->_partialVideoDirectory = (NSString *)v38;

    uint64_t v40 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"internal"];
    internalDirectory = v8->_internalDirectory;
    v8->_internalDirectory = (NSString *)v40;

    v42 = PLBundleIdentifier();
    uint64_t v43 = [(PLPhotoLibraryPathManagerDCIM *)v8 _externalDirectoryWithBundleIdentifier:v42 createIfNeeded:0];
    externalDirectory = v8->_externalDirectory;
    v8->_externalDirectory = (NSString *)v43;

    uint64_t v45 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"Locked"];
    lockedDirectory = v8->_lockedDirectory;
    v8->_lockedDirectory = (NSString *)v45;

    uint64_t v47 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"changes"];
    changeStoreDatabasePath = v8->_changeStoreDatabasePath;
    v8->_changeStoreDatabasePath = (NSString *)v47;

    uint64_t v49 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"Thumbnails"];
    thumbnailsDirectory = v8->_thumbnailsDirectory;
    v8->_thumbnailsDirectory = (NSString *)v49;

    uint64_t v51 = [(NSString *)v8->_thumbnailsDirectory stringByAppendingPathComponent:@"V2"];
    thumbnailsV2Directory = v8->_thumbnailsV2Directory;
    v8->_thumbnailsV2Directory = (NSString *)v51;

    uint64_t v53 = [(NSString *)v8->_thumbnailsDirectory stringByAppendingPathComponent:@"VideoKeyFrames"];
    thumbnailsVideoKeyFramesDirectory = v8->_thumbnailsVideoKeyFramesDirectory;
    v8->_thumbnailsVideoKeyFramesDirectory = (NSString *)v53;

    v55 = [(PLPhotoLibraryPathManagerCore *)v8 baseDirectory];
    v56 = [v55 stringByAppendingPathComponent:@"Photos"];
    [(PLPhotoLibraryPathManagerCore *)v8 setITunesPhotosDirectory:v56];

    v57 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"ModelInterest.sqlite"];
    [(PLPhotoLibraryPathManagerCore *)v8 setLegacyModelInterestDatabasePath:v57];

    v58 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"MemoriesRelated"];
    [(PLPhotoLibraryPathManagerCore *)v8 setLegacyMemoriesRelatedSnapshotDirectory:v58];

    id v59 = objc_alloc(MEMORY[0x1E4F1CB10]);
    v60 = [(NSString *)v8->_photoDataDirectory stringByAppendingPathComponent:@"UBF"];
    v61 = (void *)[v59 initFileURLWithPath:v60 isDirectory:1];

    id v62 = objc_initWeak(&location, v8);
    v63 = [PLLazyObject alloc];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __64__PLPhotoLibraryPathManagerDCIM_initWithLibraryURL_bundleScope___block_invoke;
    v68[3] = &unk_1E589F5F8;
    objc_copyWeak(&v70, &location);
    id v64 = v61;
    id v69 = v64;
    uint64_t v65 = [(PLLazyObject *)v63 initWithBlock:v68];

    objc_destroyWeak(&v70);
    objc_destroyWeak(&location);
    lazyPathManagerForUBFOnDCIM = v8->_lazyPathManagerForUBFOnDCIM;
    v8->_lazyPathManagerForUBFOnDCIM = (PLLazyObject *)v65;

    [(PLPhotoLibraryPathManagerCore *)v8 postInit];
  }

  return v8;
}

- (id)basePrivateDirectoryPath
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v6[0] = self->_photoDataDirectory;
  v6[1] = @"private";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  uint64_t v4 = [v2 pathWithComponents:v3];

  return v4;
}

- (id)_externalDirectoryWithBundleIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = NSString;
  v14[0] = self->_photoDataDirectory;
  v14[1] = @"external";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v9 = [v7 pathWithComponents:v8];

  if (v6)
  {
    id v10 = [v9 stringByAppendingPathComponent:v6];
  }
  else
  {
    id v10 = v9;
  }
  v11 = v10;
  if (v4)
  {
    uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v12 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];
  }
  return v11;
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  v9 = [(PLPhotoLibraryPathManagerDCIM *)self convertPhotoLibraryPathType:v6];
  id v10 = [(PLPhotoLibraryPathManagerDCIM *)self addToPath:v9 leafType:v5 additionalPathComponents:v8];

  return v10;
}

- (id)addToPath:(id)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  int v6 = a4;
  id v7 = a3;
  id v8 = a5;
  switch(v6)
  {
    case 0:
    case 4:
      id v9 = v7;
      goto LABEL_9;
    case 1:
    case 3:
      id v10 = v7;
      goto LABEL_6;
    case 2:
      id v10 = [v7 stringByAppendingPathComponent:@"derivatives"];
LABEL_6:
      id v9 = v10;
      goto LABEL_7;
    default:
      id v9 = 0;
LABEL_7:
      if ([v8 length])
      {
        uint64_t v11 = [v9 stringByAppendingPathComponent:v8];

        id v9 = (id)v11;
      }
LABEL_9:

      return v9;
  }
}

- (id)convertPhotoLibraryPathType:(unsigned __int8)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0u:
    case 0x23u:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid path type conversion: %s", "-[PLPhotoLibraryPathManagerDCIM convertPhotoLibraryPathType:]");
      goto LABEL_33;
    case 1u:
    case 0x1Fu:
      id v4 = [(PLPhotoLibraryPathManagerCore *)self baseDirectory];
      goto LABEL_4;
    case 2u:
    case 0x1Cu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
      uint64_t v3 = 136;
      goto LABEL_3;
    case 3u:
      uint64_t v3 = 168;
      goto LABEL_3;
    case 4u:
      uint64_t v3 = 192;
      goto LABEL_3;
    case 5u:
      uint64_t v3 = 232;
      goto LABEL_3;
    case 6u:
      uint64_t v3 = 144;
      goto LABEL_3;
    case 7u:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid legacy path type: %s", "-[PLPhotoLibraryPathManagerDCIM convertPhotoLibraryPathType:]");
      goto LABEL_33;
    case 8u:
      uint64_t v3 = 216;
      goto LABEL_3;
    case 9u:
      id v4 = [(PLPhotoLibraryPathManagerDCIM *)self photoMutationsDirectory];
      goto LABEL_4;
    case 0xAu:
      id v4 = [(PLPhotoLibraryPathManagerDCIM *)self photoMetadataDirectory];
      goto LABEL_4;
    case 0xBu:
      uint64_t v3 = 280;
      goto LABEL_3;
    case 0xCu:
      uint64_t v3 = 288;
      goto LABEL_3;
    case 0xDu:
      photoDataDirectory = self->_photoDataDirectory;
      id v7 = @"CPL";
      goto LABEL_27;
    case 0xEu:
      id v8 = [(PLPhotoLibraryPathManagerCore *)self baseDirectory];
      uint64_t v9 = [v8 stringByAppendingPathComponent:@"PhotoStreamsData"];
      goto LABEL_35;
    case 0xFu:
      uint64_t v3 = 224;
      goto LABEL_3;
    case 0x10u:
      id v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3A8];
      uint64_t v12 = @"Invalid projects legacy path type (macOS only)";
      goto LABEL_32;
    case 0x11u:
      uint64_t v3 = 152;
      goto LABEL_3;
    case 0x12u:
      uint64_t v3 = 184;
      goto LABEL_3;
    case 0x13u:
      uint64_t v3 = 248;
      goto LABEL_3;
    case 0x14u:
      uint64_t v3 = 160;
      goto LABEL_3;
    case 0x15u:
      id v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3A8];
      uint64_t v12 = @"Invalid cloud shared legacy path type (macOS only)";
      goto LABEL_32;
    case 0x16u:
      photoDataDirectory = self->_photoDataDirectory;
      id v7 = @"PhotoCloudSharingData";
LABEL_27:
      id v4 = [(NSString *)photoDataDirectory stringByAppendingPathComponent:v7];
      goto LABEL_4;
    case 0x17u:
      v13 = NSString;
      id v8 = [(PLPhotoLibraryPathManagerDCIM *)self photoMetadataDirectory];
      v21[0] = v8;
      v21[1] = @"PhotoData";
      v21[2] = @"PhotoCloudSharingData";
      uint64_t v14 = (void *)MEMORY[0x1E4F1C978];
      v15 = v21;
      uint64_t v16 = 3;
      goto LABEL_30;
    case 0x18u:
      v13 = NSString;
      id v8 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:22];
      v20[0] = v8;
      v20[1] = @"Caches";
      uint64_t v14 = (void *)MEMORY[0x1E4F1C978];
      v15 = v20;
      uint64_t v16 = 2;
LABEL_30:
      v17 = [v14 arrayWithObjects:v15 count:v16];
      uint64_t v5 = [v13 pathWithComponents:v17];

      goto LABEL_36;
    case 0x19u:
      id v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3A8];
      uint64_t v12 = @"Invalid moment shared legacy path type (macOS only)";
LABEL_32:
      objc_msgSend(v10, "raise:format:", v11, v12, v19);
      goto LABEL_33;
    case 0x1Au:
      id v8 = [(PLLazyObject *)self->_lazyPathManagerForUBFOnDCIM objectValue];
      uint64_t v9 = [v8 photoDirectoryWithType:26];
LABEL_35:
      uint64_t v5 = (void *)v9;
LABEL_36:

      break;
    case 0x1Bu:
      uint64_t v3 = 264;
      goto LABEL_3;
    case 0x1Du:
      uint64_t v3 = 200;
      goto LABEL_3;
    case 0x1Eu:
      uint64_t v3 = 296;
LABEL_3:
      id v4 = *(id *)((char *)&self->super.super.isa + v3);
LABEL_4:
      uint64_t v5 = v4;
      break;
    default:
LABEL_33:
      uint64_t v5 = 0;
      break;
  }
  return v5;
}

PLPhotoLibraryPathManagerUBF *__64__PLPhotoLibraryPathManagerDCIM_initWithLibraryURL_bundleScope___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    uint64_t v3 = [[PLPhotoLibraryPathManagerUBF alloc] initWithLibraryURL:*(void *)(a1 + 32) bundleScope:0];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)photoMutationsDirectory
{
  return [(NSString *)self->_photoDataDirectory stringByAppendingPathComponent:@"Mutations"];
}

- (id)photoMetadataDirectory
{
  return [(NSString *)self->_photoDataDirectory stringByAppendingPathComponent:@"Metadata"];
}

+ (NSString)defaultDCIMPath
{
  return (NSString *)@"/var/mobile/Media/DCIM";
}

- (void)enumerateBundleScopesWithBlock:(id)a3
{
  id v14 = a3;
  if ([(PLPhotoLibraryPathManagerCore *)self bundleScope])
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PLPhotoLibraryPathManagerDCIM.m" lineNumber:649 description:@"can only enumerate bundle scopes on main bundle scoped path manager"];
  }
  unsigned __int16 v5 = 0;
  id v6 = v14;
  do
  {
    id v7 = (void *)MEMORY[0x19F38F510](v6);
    unsigned int v8 = v5;
    if ([(PLPhotoLibraryPathManagerDCIM *)self shouldUseFileIdentifierForBundleScope:v5])
    {
      uint64_t v9 = [PLPhotoLibraryPathManager alloc];
      id v10 = [(PLLazyObject *)self->_lazyPathManagerForUBFOnDCIM objectValue];
      uint64_t v11 = [v10 libraryURL];
      uint64_t v12 = [(PLPhotoLibraryPathManager *)v9 initWithLibraryURL:v11 bundleScope:v5 libraryFormat:2];

      (*((void (**)(id, void, void, PLPhotoLibraryPathManager *))v14 + 2))(v14, v5, [(PLPhotoLibraryPathManagerDCIM *)self photoLibraryPathTypeForBundleScope:v5], v12);
    }
    ++v5;
  }
  while (v8 < 4);
}

- (BOOL)shouldUseFileIdentifierForBundleScope:(unsigned __int16)a3
{
  return a3 < 6u && (a3 & 0x3F) == 3;
}

- (unsigned)photoLibraryPathTypeForBundleScope:(unsigned __int16)a3
{
  unint64_t v3 = 0x11A000001uLL >> (8 * a3);
  if (a3 >= 6u) {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)setImportFileManager:(id)a3
{
}

- (id)pathsForClientAccess:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v4 directDatabaseWriteAuthorized])
  {
    uint64_t v6 = MEMORY[0x1E4F1CC38];
  }
  else
  {
    if (![v4 directDatabaseAccessAuthorized]) {
      goto LABEL_6;
    }
    uint64_t v6 = MEMORY[0x1E4F1CC28];
  }
  [v5 setObject:v6 forKeyedSubscript:self->_photoDataDirectory];
LABEL_6:
  id v7 = [(PLPhotoLibraryPathManagerDCIM *)self captureSessionPathsWithClientAuthorization:v4];
  [v5 addEntriesFromDictionary:v7];

  unsigned int v8 = [(PLPhotoLibraryPathManagerDCIM *)self clientOwnedDirectoryPathsForClientAccess:v4];
  [v5 addEntriesFromDictionary:v8];
  uint64_t v9 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:17 createIfNeeded:1 error:0];
  if ([v4 analyticsCacheWriteEntitled])
  {
    uint64_t v10 = MEMORY[0x1E4F1CC38];
LABEL_10:
    [v5 setObject:v10 forKeyedSubscript:v9];
    goto LABEL_11;
  }
  if ([v4 analyticsCacheReadEntitled])
  {
    uint64_t v10 = MEMORY[0x1E4F1CC28];
    goto LABEL_10;
  }
LABEL_11:
  if (([v4 smartSharingCacheWriteEntitled] & 1) != 0
    || [v4 smartSharingCacheReadEntitled])
  {
    uint64_t v11 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:20 createIfNeeded:1 error:0];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "smartSharingCacheWriteEntitled"));
    [v5 setObject:v12 forKeyedSubscript:v11];
  }
  if ([v4 internalDataReadWriteAuthorized])
  {
    v13 = [(PLPhotoLibraryPathManagerCore *)self internalDirectoryWithSubType:1 additionalPathComponents:0 createIfNeeded:1 error:0];
    uint64_t v14 = MEMORY[0x1E4F1CC38];
    [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v13];
    v15 = [(PLPhotoLibraryPathManagerCore *)self internalDirectoryWithSubType:3 additionalPathComponents:0 createIfNeeded:1 error:0];
    [v5 setObject:v14 forKeyedSubscript:v15];
    uint64_t v16 = [(PLPhotoLibraryPathManagerCore *)self internalDirectoryWithSubType:4 additionalPathComponents:0 createIfNeeded:1 error:0];
    [v5 setObject:v14 forKeyedSubscript:v16];
  }
  v17 = [(PLPhotoLibraryPathManagerCore *)self pathForCPLStatus];
  if (v17) {
    [v5 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v17];
  }
  if (([v4 coreSceneUnderstandingTaxonomyReadAuthorized] & 1) != 0
    || [v4 coreSceneUnderstandingTaxonomyWriteAuthorized])
  {
    uint64_t v18 = [(PLPhotoLibraryPathManagerCore *)self internalDirectoryWithSubType:5 additionalPathComponents:0 createIfNeeded:1 error:0];
    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "coreSceneUnderstandingTaxonomyWriteAuthorized"));
    [v5 setObject:v19 forKeyedSubscript:v18];
  }
  return v5;
}

- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  switch(v4)
  {
    case 0:
    case 6:
      uint64_t v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_FAULT, "Invalid subtype for internal location", v17, 2u);
      }

      goto LABEL_6;
    case 1:
    case 3:
    case 4:
      internalDirectory = self->_internalDirectory;
      unsigned int v8 = off_1E58A1740[v4];
      uint64_t v9 = -[__CFString substringFromIndex:](v8, "substringFromIndex:", [@"PLPhotoLibraryInternalPathType" length]);
      uint64_t v10 = [v9 lowercaseString];

      uint64_t v11 = [(NSString *)internalDirectory stringByAppendingPathComponent:v10];

      break;
    case 2:
      v13 = self->_internalDirectory;
      uint64_t v14 = @"lofr";
      goto LABEL_9;
    case 5:
      v13 = self->_internalDirectory;
      uint64_t v14 = @"csutaxonomy";
LABEL_9:
      uint64_t v11 = [(NSString *)v13 stringByAppendingPathComponent:v14];
      break;
    default:
LABEL_6:
      uint64_t v11 = 0;
      break;
  }
  v15 = [(PLPhotoLibraryPathManagerDCIM *)self addToPath:v11 leafType:1 additionalPathComponents:v6];

  return v15;
}

- (id)clientOwnedDirectoryPathsForClientAccess:(id)a3
{
  int v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 trustedCallerBundleID];

  unsigned int v8 = [(PLPhotoLibraryPathManagerDCIM *)self _externalDirectoryWithBundleIdentifier:v7 createIfNeeded:1];
  if (v8) {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v8];
  }
  uint64_t v9 = [(PLPhotoLibraryPathManagerCore *)self privateDirectoryWithBundleIdentifier:v7 createIfNeeded:1];
  if (v9) {
    [v6 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v9];
  }

  return v6;
}

- (id)photosDatabasePath
{
  return [(NSString *)self->_photoDataDirectory stringByAppendingPathComponent:@"Photos.sqlite"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importFileManager, 0);
  objc_storeStrong((id *)&self->_lazyPathManagerForUBFOnDCIM, 0);
  objc_storeStrong((id *)&self->_simpleDCIMDirectory, 0);
  objc_storeStrong((id *)&self->_thumbnailsVideoKeyFramesDirectory, 0);
  objc_storeStrong((id *)&self->_thumbnailsV2Directory, 0);
  objc_storeStrong((id *)&self->_thumbnailsDirectory, 0);
  objc_storeStrong((id *)&self->_changeStoreDatabasePath, 0);
  objc_storeStrong((id *)&self->_lockedDirectory, 0);
  objc_storeStrong((id *)&self->_externalDirectory, 0);
  objc_storeStrong((id *)&self->_partialVideoDirectory, 0);
  objc_storeStrong((id *)&self->_internalDirectory, 0);
  objc_storeStrong((id *)&self->_privateDirectory, 0);
  objc_storeStrong((id *)&self->_projectsDirectory, 0);
  objc_storeStrong((id *)&self->_journalsDirectory, 0);
  objc_storeStrong((id *)&self->_cmmAssetsDirectory, 0);
  objc_storeStrong((id *)&self->_cplAssetsDirectory, 0);
  objc_storeStrong((id *)&self->_dcimDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataComputeDirectory, 0);
  objc_storeStrong((id *)&self->_restoreInfoDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataSearchDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataSmartSharingDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataAnalyticsDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataCachesDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataDirectory, 0);
}

- (PLImportFileManager)importFileManager
{
  return self->_importFileManager;
}

- (BOOL)ensureFileProviderSyncExclusionAttributeIsSetWithError:(id *)a3
{
  return 1;
}

- (BOOL)updateTimeMachineExclusionAttributeForExcludePath:(id)a3 error:(id *)a4
{
  return 1;
}

- (id)pathsGroupedByAssetBasePathFromFilePaths:(id)a3 populateInvalidAdjustmentPaths:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v25 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v32;
    *(void *)&long long v8 = 138543618;
    long long v24 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "rangeOfString:", @"Mutations", v24);
        if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
          [v12 stringByDeletingPathExtension];
        }
        else {
        uint64_t v14 = [(PLPhotoLibraryPathManagerDCIM *)self assetBaseFilenameForAdjustmentFilePath:v12];
        }
        if (v14)
        {
          id v15 = [v6 objectForKeyedSubscript:v14];
          if (!v15)
          {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v6 setObject:v15 forKeyedSubscript:v14];
          }
          [v15 addObject:v12];
        }
        else
        {
          uint64_t v16 = PLBackendGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v17 = @"adjustment resource";
            if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
              v17 = @"original resource";
            }
            uint64_t v36 = v17;
            __int16 v37 = 2112;
            uint64_t v38 = v12;
            _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_ERROR, "Failed to resolve path base from %{public}@ path %@, skipping", buf, 0x16u);
          }

          if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
            [v25 addObject:v12];
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v9);
  }

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __105__PLPhotoLibraryPathManagerDCIM_pathsGroupedByAssetBasePathFromFilePaths_populateInvalidAdjustmentPaths___block_invoke;
  v28[3] = &unk_1E589F648;
  id v19 = v6;
  id v29 = v19;
  id v30 = v18;
  id v20 = v18;
  [v19 enumerateKeysAndObjectsUsingBlock:v28];
  [v19 removeObjectsForKeys:v20];
  v21 = v30;
  id v22 = v19;

  return v22;
}

void __105__PLPhotoLibraryPathManagerDCIM_pathsGroupedByAssetBasePathFromFilePaths_populateInvalidAdjustmentPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __105__PLPhotoLibraryPathManagerDCIM_pathsGroupedByAssetBasePathFromFilePaths_populateInvalidAdjustmentPaths___block_invoke_2;
  v10[3] = &unk_1E589F620;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v13 = v6;
  id v14 = *(id *)(a1 + 40);
  id v7 = v6;
  id v8 = v5;
  uint64_t v9 = (void (**)(void, void))MEMORY[0x19F38F770](v10);
  ((void (**)(void, __CFString *))v9)[2](v9, @"S");
  ((void (**)(void, __CFString *))v9)[2](v9, @"D");
  ((void (**)(void, __CFString *))v9)[2](v9, @"X");
}

void __105__PLPhotoLibraryPathManagerDCIM_pathsGroupedByAssetBasePathFromFilePaths_populateInvalidAdjustmentPaths___block_invoke_2(id *a1, uint64_t a2)
{
  id v4 = [a1[4] stringByAppendingString:a2];
  unint64_t v3 = objc_msgSend(a1[5], "objectForKeyedSubscript:");
  if (v3)
  {
    [a1[6] addObjectsFromArray:v3];
    [a1[7] addObject:v4];
  }
}

- (id)assetBaseFilenameForAdjustmentFilePath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x19F38F510]();
  id v6 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:9];
  uint64_t v7 = [v4 rangeOfString:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || (v9 = v7, uint64_t v10 = v8, [v4 length] <= (unint64_t)(v7 + v8 + 14)))
  {
    id v15 = 0;
    goto LABEL_12;
  }
  id v11 = [v4 substringFromIndex:v9 + v10 + 1];
  uint64_t v12 = [v11 rangeOfString:@"Adjustments"];
  if (!v12)
  {
    uint64_t v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_19BCFB000, v16, OS_LOG_TYPE_ERROR, "Found invalid adjustment path %@", (uint8_t *)&v18, 0xCu);
    }

    goto LABEL_10;
  }
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_10:
    id v15 = 0;
    goto LABEL_11;
  }
  id v13 = [v11 substringToIndex:v12 - 1];
  id v14 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:1];
  id v15 = [v14 stringByAppendingPathComponent:v13];

LABEL_11:
LABEL_12:

  return v15;
}

- (id)persistedAlbumDataDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v7 = [(NSString *)self->_photoDataDirectory stringByAppendingPathComponent:@"AlbumsMetadata"];
  if (v5) {
    [(PLPhotoLibraryPathManagerCore *)self createDirectoryOnceWithPath:v7 mask:7 pathType:0 error:a4];
  }
  return v7;
}

- (id)iTunesPhotosSyncCurrentLibraryUUIDPath
{
  v2 = [(PLPhotoLibraryPathManagerDCIM *)self iTunesPhotosSyncDirectory];
  unint64_t v3 = [v2 stringByAppendingPathComponent:@"CurrentLibraryUUID.plist"];

  return v3;
}

- (id)iTunesPhotosSyncMetadataFilePath
{
  v2 = [(PLPhotoLibraryPathManagerDCIM *)self iTunesPhotosSyncDirectory];
  unint64_t v3 = [v2 stringByAppendingPathComponent:@"PhotoLibrary.plist"];

  return v3;
}

- (id)iTunesPhotosLastSyncMetadataFilePath
{
  v2 = [(PLPhotoLibraryPathManagerDCIM *)self iTunesPhotosSyncDirectory];
  unint64_t v3 = [v2 stringByAppendingPathComponent:@"PhotoLibrary.plist.lastsynced"];

  return v3;
}

- (id)iTunesSyncedAssetSmallThumbnailsDirectory
{
  void v6[3] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  v6[0] = self->_thumbnailsV2Directory;
  v6[1] = @"PhotoData";
  v6[2] = @"Sync";
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  id v4 = [v2 pathWithComponents:v3];

  return v4;
}

- (id)iTunesSyncedAssetMetadataThumbnailsDirectory
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  unint64_t v3 = [(PLPhotoLibraryPathManagerDCIM *)self photoMetadataDirectory];
  v7[0] = v3;
  v7[1] = @"PhotoData";
  v7[2] = @"Sync";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  BOOL v5 = [v2 pathWithComponents:v4];

  return v5;
}

- (id)iTunesSyncedFaceAlbumThumbnailsDirectory
{
  v2 = [(PLPhotoLibraryPathManagerDCIM *)self iTunesSyncedAssetsDirectory];
  unint64_t v3 = [v2 stringByAppendingPathComponent:@"FaceAlbumThumbnails"];

  return v3;
}

- (id)iTunesSyncedFaceDataDirectory
{
  v2 = [(PLPhotoLibraryPathManagerDCIM *)self iTunesSyncedAssetsDirectory];
  unint64_t v3 = [v2 stringByAppendingPathComponent:@"FaceData"];

  return v3;
}

- (id)iTunesSyncedAssetsDirectory
{
  return [(NSString *)self->_photoDataDirectory stringByAppendingPathComponent:@"Sync"];
}

- (id)iTunesPhotosSyncDirectory
{
  v2 = [(PLPhotoLibraryPathManagerCore *)self iTunesPhotosDirectory];
  unint64_t v3 = [v2 stringByAppendingPathComponent:@"Sync"];

  return v3;
}

- (id)modelRestorePostProcessingCompleteTokenPath
{
  return [(NSString *)self->_restoreInfoDirectory stringByAppendingPathComponent:@"ModelRestorePostProcessingComplete"];
}

- (id)cloudRestoreContextPath
{
  return [(NSString *)self->_restoreInfoDirectory stringByAppendingPathComponent:@"CloudRestoreContext.plist"];
}

- (id)cloudRestoreCompleteTokenPath
{
  return [(NSString *)self->_restoreInfoDirectory stringByAppendingPathComponent:@"CloudRestoreComplete"];
}

- (id)cloudRestoreBackgroundPhaseInProgressTokenPath
{
  return [(NSString *)self->_restoreInfoDirectory stringByAppendingPathComponent:@"CloudRestoreBackgroundInProgress"];
}

- (id)cloudRestoreForegroundPhaseCompleteTokenPath
{
  return [(NSString *)self->_restoreInfoDirectory stringByAppendingPathComponent:@"CloudRestoreForegroundComplete"];
}

- (id)assetMainFilePathWithDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PLPhotoLibraryPathManagerDCIM.m", 729, @"Invalid parameter not satisfying: %@", @"directory" object file lineNumber description];
  }
  if ([(PLPhotoLibraryPathManagerCore *)self bundleScope])
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"PLPhotoLibraryPathManagerDCIM.m" lineNumber:730 description:@"can only access asset main file path on main bundle scoped path manager"];
  }
  if ([(PLPhotoLibraryPathManagerDCIM *)self shouldUseFileIdentifierForBundleScope:v5])
  {
    id v11 = [(PLLazyObject *)self->_lazyPathManagerForUBFOnDCIM objectValue];
    uint64_t v12 = [v11 assetMainFilePathWithDirectory:v9 filename:v10 bundleScope:v5];
  }
  else
  {
    if (([v9 hasPrefix:@"/"] & 1) == 0)
    {
      id v13 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:1];
      uint64_t v14 = [v13 stringByAppendingPathComponent:v9];

      id v9 = (id)v14;
    }
    uint64_t v12 = [v9 stringByAppendingPathComponent:v10];
  }

  return v12;
}

- (id)pathToAssetAlbumOrderStructure
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PLPhotoLibraryPathManagerDCIM_pathToAssetAlbumOrderStructure__block_invoke;
  block[3] = &unk_1E58A1EC0;
  block[4] = self;
  if (pathToAssetAlbumOrderStructure_onceToken != -1) {
    dispatch_once(&pathToAssetAlbumOrderStructure_onceToken, block);
  }
  return (id)pathToAssetAlbumOrderStructure_path;
}

void __63__PLPhotoLibraryPathManagerDCIM_pathToAssetAlbumOrderStructure__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) iTunesSyncedAssetsDirectory];
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 304))
  {
    v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v2 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

    *(unsigned char *)(*(void *)(a1 + 32) + 304) = 1;
  }
  unint64_t v3 = [v6 stringByAppendingPathComponent:@"assetsAlbumOrder"];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = (void *)pathToAssetAlbumOrderStructure_path;
  pathToAssetAlbumOrderStructure_path = v4;
}

- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 type:(unsigned __int8)a4 bundleScope:(unsigned __int16)a5
{
  uint64_t v5 = a4;
  id v7 = a3;
  uint64_t v8 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:v5];
  id v9 = [(PLPhotoLibraryPathManagerCore *)self assetAbbreviatedMetadataDirectoryForDirectory:v7 rootPath:v8];

  return v9;
}

- (id)photoMetadataDirectoryForMediaInMainDirectory:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLPhotoLibraryPathManagerDCIM *)self photoMetadataDirectory];
  id v6 = [(PLPhotoLibraryPathManagerDCIM *)self assetAbbreviatedMetadataDirectoryForDirectory:v4 type:31 bundleScope:0];

  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

- (void)obtainAccessAndWaitWithFileWithIdentifier:(id)a3 mode:(unsigned __int8)a4 toURLWithHandler:(id)a5
{
  uint64_t v5 = a4;
  lazyPathManagerForUBFOnDCIM = self->_lazyPathManagerForUBFOnDCIM;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(PLLazyObject *)lazyPathManagerForUBFOnDCIM objectValue];
  [v10 obtainAccessAndWaitWithFileWithIdentifier:v9 mode:v5 toURLWithHandler:v8];
}

- (void)setExtendedAttributesWithIdentifier:(id)a3 andURL:(id)a4
{
  lazyPathManagerForUBFOnDCIM = self->_lazyPathManagerForUBFOnDCIM;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PLLazyObject *)lazyPathManagerForUBFOnDCIM objectValue];
  [v8 setExtendedAttributesWithIdentifier:v7 andURL:v6];
}

- (void)setExtendedAttributesWithIdentifier:(id)a3
{
  lazyPathManagerForUBFOnDCIM = self->_lazyPathManagerForUBFOnDCIM;
  id v4 = a3;
  id v5 = [(PLLazyObject *)lazyPathManagerForUBFOnDCIM objectValue];
  [v5 setExtendedAttributesWithIdentifier:v4];
}

- (id)readOnlyUrlWithIdentifier:(id)a3
{
  lazyPathManagerForUBFOnDCIM = self->_lazyPathManagerForUBFOnDCIM;
  id v4 = a3;
  id v5 = [(PLLazyObject *)lazyPathManagerForUBFOnDCIM objectValue];
  id v6 = [v5 readOnlyUrlWithIdentifier:v4];

  return v6;
}

- (id)syncInfoPath
{
  return [(NSString *)self->_photoDataDirectory stringByAppendingPathComponent:@"syncInfo.plist"];
}

- (id)pathToAssetsToAlbumsMapping
{
  return [(NSString *)self->_photoDataDirectory stringByAppendingPathComponent:@"assetsToAlbumsMapping.plist"];
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5 = a4;
  int v6 = a3;
  id v8 = a5;
  if ((v6 - 2) < 2)
  {
    externalDirectory = self->_externalDirectory;
    id v10 = off_1E58A1720[v6];
    id v11 = -[__CFString substringFromIndex:](v10, "substringFromIndex:", [@"PLPhotoLibraryExternalPathType" length]);
    uint64_t v12 = [v11 lowercaseString];

    id v13 = [(NSString *)externalDirectory stringByAppendingPathComponent:v12];
LABEL_5:

    goto LABEL_7;
  }
  if (v6 == 1)
  {
    uint64_t v12 = [(PLPhotoLibraryPathManagerDCIM *)self getImportFileManager];
    uint64_t v14 = [v12 urlForNewDCIMFolderWithFolderNumber:0];
    id v13 = [v14 path];

    goto LABEL_5;
  }
  id v13 = 0;
LABEL_7:
  id v15 = [(PLPhotoLibraryPathManagerDCIM *)self addToPath:v13 leafType:v5 additionalPathComponents:v8];

  return v15;
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5 = a4;
  int v6 = a3;
  id v8 = a5;
  p_photoDataCachesDirectory = &self->_photoDataCachesDirectory;
  id v10 = self->_photoDataCachesDirectory;
  id v11 = @"changes";
  switch(v6)
  {
    case 1:
      goto LABEL_17;
    case 2:
      id v11 = @"ClientServerTransactions";
      goto LABEL_17;
    case 3:
      id v11 = @"PhotoCloudSharingDataReimportCache";
      goto LABEL_17;
    case 4:
      id v11 = @"GraphService";
      goto LABEL_17;
    case 5:
      id v11 = @"VisionService";
      goto LABEL_17;
    case 6:
      id v11 = @"MiroCache";
      goto LABEL_17;
    case 7:
      id v11 = @"VariationCache";
      goto LABEL_17;
    case 8:
      id v11 = @"libraryavailable";
      goto LABEL_17;
    case 9:
      id v11 = @"streamsupdatingexpired";
      goto LABEL_17;
    case 10:
      id v11 = @"StackedImages";
      goto LABEL_17;
    case 11:
      id v11 = @"AutoloopCache";
      goto LABEL_17;
    case 12:
      p_photoDataCachesDirectory = &self->_photoDataDirectory;
      id v11 = @"Caches/Internal/MemoriesRelated";
      goto LABEL_17;
    case 13:
      p_photoDataCachesDirectory = &self->_photoDataDirectory;
      id v11 = @"MISC";
      goto LABEL_17;
    case 14:
      id v11 = @"PhotosPickerLogs";
      goto LABEL_17;
    case 15:
      id v11 = @"ComputeCache";
      goto LABEL_17;
    case 16:
      id v11 = @"StoryMusicCache";
LABEL_17:
      uint64_t v12 = [(NSString *)*p_photoDataCachesDirectory stringByAppendingPathComponent:v11];

      id v10 = (NSString *)v12;
      break;
    default:
      break;
  }
  id v13 = [(PLPhotoLibraryPathManagerDCIM *)self addToPath:v10 leafType:v5 additionalPathComponents:v8];

  return v13;
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5 = a4;
  int v6 = a3;
  id v8 = a5;
  switch(v6)
  {
    case 0:
    case 11:
      uint64_t v9 = 232;
      goto LABEL_10;
    case 1:
      photoDataDirectory = self->_photoDataDirectory;
      id v11 = @"imagewriter";
      goto LABEL_14;
    case 2:
      photoDataDirectory = self->_photoDataDirectory;
      id v11 = @"OutgoingTemp";
      goto LABEL_14;
    case 3:
      uint64_t v9 = 272;
      goto LABEL_10;
    case 4:
      photoDataDirectory = self->_photoDataDirectory;
      id v11 = @"AlbumsMetadata";
      goto LABEL_14;
    case 5:
      photoDataDirectory = self->_photoDataDirectory;
      id v11 = @"FacesMetadata";
      goto LABEL_14;
    case 6:
      photoDataDirectory = self->_dcimDirectory;
      id v11 = @"ASSETS";
      goto LABEL_14;
    case 7:
      uint64_t v9 = 208;
LABEL_10:
      id v12 = *(id *)((char *)&self->super.super.isa + v9);
      goto LABEL_15;
    case 8:
      photoDataDirectory = self->_photoDataDirectory;
      id v11 = @"CaptureDebug";
      goto LABEL_14;
    case 9:
      photoDataDirectory = self->_photoDataDirectory;
      id v11 = @"CameraMetadata";
      goto LABEL_14;
    case 10:
      photoDataDirectory = self->_privateDirectory;
      id v11 = @"computecache";
LABEL_14:
      id v12 = [(NSString *)photoDataDirectory stringByAppendingPathComponent:v11];
LABEL_15:
      id v13 = v12;
      break;
    default:
      id v13 = 0;
      break;
  }
  uint64_t v14 = [(PLPhotoLibraryPathManagerDCIM *)self addToPath:v13 leafType:v5 additionalPathComponents:v8];

  return v14;
}

- (id)pathsForFinderSyncFilesystemSizeCalculation
{
  v12[4] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [(PLPhotoLibraryPathManagerCore *)self iTunesPhotosDirectory];
  v12[0] = v4;
  uint64_t v5 = [(PLPhotoLibraryPathManagerCore *)self iTunesPhotosDirectory];
  int v6 = [(PLPhotoLibraryPathManagerDCIM *)self photoMetadataDirectoryForMediaInMainDirectory:v5];
  v12[1] = v6;
  id v7 = [(PLPhotoLibraryPathManagerDCIM *)self iTunesSyncedAssetsDirectory];
  v12[2] = v7;
  id v8 = [(PLPhotoLibraryPathManagerDCIM *)self iTunesSyncedAssetMetadataThumbnailsDirectory];
  v12[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  id v10 = [v3 setWithArray:v9];

  return v10;
}

- (id)pathsForLibraryFilesystemSizeCalculation
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v3 = [(PLPhotoLibraryPathManagerCore *)self iTunesPhotosDirectory];
  v7[2] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  uint64_t v5 = [v2 setWithArray:v4];

  return v5;
}

- (id)pathsForExternalWriters
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  unint64_t v3 = [(PLPhotoLibraryPathManagerDCIM *)self _externalDirectoryWithBundleIdentifier:0 createIfNeeded:0];
  id v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)createPathsForNewLibraries
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  return v2;
}

- (id)pathsForPermissionCheck
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  return v2;
}

- (id)unlockedCaptureSessionPaths
{
  v17[9] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:4 createIfNeeded:1 error:0];
  v17[0] = v3;
  id v4 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:13 createIfNeeded:1 error:0];
  v17[1] = v4;
  uint64_t v5 = [(PLPhotoLibraryPathManagerDCIM *)self photoMetadataDirectory];
  v17[2] = v5;
  int v6 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:9 createIfNeeded:1 error:0];
  v17[3] = v6;
  id v7 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:22 createIfNeeded:1 error:0];
  v17[4] = v7;
  id v8 = [(PLPhotoLibraryPathManagerDCIM *)self iTunesPhotosSyncDirectory];
  v17[5] = v8;
  uint64_t v9 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:11 createIfNeeded:1 error:0];
  v17[6] = v9;
  id v10 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:14 createIfNeeded:1 error:0];
  v17[7] = v10;
  id v11 = [(PLPhotoLibraryPathManagerDCIM *)self syncInfoPath];
  v17[8] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:9];

  id v13 = PLBackendGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v15 = 138412290;
    uint64_t v16 = v12;
    _os_log_impl(&dword_19BCFB000, v13, OS_LOG_TYPE_DEBUG, "Unlocked capture session paths: paths: %@", (uint8_t *)&v15, 0xCu);
  }

  return v12;
}

- (id)captureSessionPathsWithClientAuthorization:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 captureSessionState];
  if (([v4 limitedLibraryMode] & 1) != 0 || objc_msgSend(v5, "type") != 3)
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    int v6 = [(PLPhotoLibraryPathManagerDCIM *)self unlockedCaptureSessionPaths];
    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      uint64_t v12 = MEMORY[0x1E4F1CC28];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    uint64_t v14 = (void *)[v7 copy];
  }

  return v14;
}

- (id)getImportFileManager
{
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_importFileManager)
  {
    unint64_t v3 = objc_alloc_init(PLImportFileManager);
    importFileManager = v2->_importFileManager;
    v2->_importFileManager = v3;
  }
  objc_sync_exit(v2);

  uint64_t v5 = v2->_importFileManager;
  return v5;
}

- (id)simpleDCIMDirectory
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  objc_sync_enter(v2);
  if (!v2->_simpleDCIMDirectory)
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F1CB10];
    id v4 = [(PLPhotoLibraryPathManagerCore *)v2 photoDirectoryWithType:4];
    uint64_t v5 = [v3 fileURLWithPath:v4 isDirectory:1];

    int v6 = [(PLPhotoLibraryPathManagerCore *)v2 privateCacheDirectoryWithSubType:13 createIfNeeded:1 error:0];
    id v7 = +[PLSimpleDCIMDirectory cameraRollPlistName];
    id v8 = [v6 stringByAppendingPathComponent:v7];

    if (v5 && v8)
    {
      uint64_t v9 = [[PLSimpleDCIMDirectory alloc] initWithDirectoryURL:v5 subDirectorySuffix:0 perDirectoryLimit:999 userInfoPath:v8];
      simpleDCIMDirectory = v2->_simpleDCIMDirectory;
      v2->_simpleDCIMDirectory = v9;

      [(PLSimpleDCIMDirectory *)v2->_simpleDCIMDirectory setRepresentsCameraRoll:1];
    }
    else
    {
      uint64_t v11 = PLBackendGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v14 = 138412546;
        int v15 = v5;
        __int16 v16 = 2112;
        long long v17 = v8;
        _os_log_impl(&dword_19BCFB000, v11, OS_LOG_TYPE_ERROR, "Failed to get either DCIM directory (%@) or user info path (%@)", (uint8_t *)&v14, 0x16u);
      }
    }
  }
  objc_sync_exit(v2);

  uint64_t v12 = v2->_simpleDCIMDirectory;
  return v12;
}

+ (id)allPhotosPathsOnThisDevice
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PLPhotoLibraryPathManagerDCIM_allPhotosPathsOnThisDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allPhotosPathsOnThisDevice_onceToken_2402 != -1) {
    dispatch_once(&allPhotosPathsOnThisDevice_onceToken_2402, block);
  }
  id v2 = (void *)allPhotosPathsOnThisDevice_bundlePaths_2403;
  return v2;
}

void __59__PLPhotoLibraryPathManagerDCIM_allPhotosPathsOnThisDevice__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v3 = 0;
  while (1)
  {
    if (v3 == 1)
    {
      id v4 = [PLPhotoLibraryPathManagerDCIM alloc];
      uint64_t v5 = [*(id *)(a1 + 32) systemLibraryURL];
      int v6 = [(PLPhotoLibraryPathManagerDCIM *)v4 initWithLibraryURL:v5 bundleScope:0];

      id v7 = [(PLPhotoLibraryPathManagerCore *)v6 photoDirectoryWithType:2];
      [v2 addObject:v7];

      id v8 = [(PLPhotoLibraryPathManagerCore *)v6 photoDirectoryWithType:4];
      [v2 addObject:v8];

      uint64_t v9 = [(PLPhotoLibraryPathManagerCore *)v6 photoDirectoryWithType:14];
      [v2 addObject:v9];

      uint64_t v10 = [(PLPhotoLibraryPathManagerCore *)v6 iTunesPhotosDirectory];
      [v2 addObject:v10];

      goto LABEL_6;
    }
    if (v3 == 3) {
      break;
    }
LABEL_6:
    if (++v3 == 4) {
      goto LABEL_11;
    }
  }
  uint64_t v11 = +[PLPhotoLibraryPathManagerCore wellKnownPhotoLibraryURLForIdentifier:3];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = [v11 path];
    [v2 addObject:v13];
  }
LABEL_11:
  int v14 = (void *)allPhotosPathsOnThisDevice_bundlePaths_2403;
  allPhotosPathsOnThisDevice_bundlePaths_2403 = (uint64_t)v2;
}

@end