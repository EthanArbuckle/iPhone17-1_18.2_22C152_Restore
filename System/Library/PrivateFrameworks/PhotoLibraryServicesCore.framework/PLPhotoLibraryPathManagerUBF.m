@interface PLPhotoLibraryPathManagerUBF
+ (id)allPhotosPathsOnThisDevice;
- (BOOL)createPathsForNewLibrariesWithError:(id *)a3;
- (BOOL)ensureFileProviderSyncExclusionAttributeIsSetWithError:(id *)a3;
- (BOOL)shouldUseFileIdentifierForBundleScope:(unsigned __int16)a3;
- (BOOL)updateTimeMachineExclusionAttributeForExcludePath:(id)a3 error:(id *)a4;
- (PLPhotoLibraryPathManagerUBF)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4;
- (id)_externalDirectoryWithBundleIdentifier:(id)a3 createIfNeeded:(BOOL)a4;
- (id)_scopedInternalPathManagerWithBundleScope:(unsigned __int16)a3;
- (id)addToPath:(id)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 type:(unsigned __int8)a4 bundleScope:(unsigned __int16)a5;
- (id)assetMainFilePathWithDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5;
- (id)basePrivateDirectoryPath;
- (id)clientOwnedDirectoryPathsForClientAccess:(id)a3;
- (id)cloudRestoreBackgroundPhaseInProgressTokenPath;
- (id)cloudRestoreCompleteTokenPath;
- (id)cloudRestoreContextPath;
- (id)cloudRestoreForegroundPhaseCompleteTokenPath;
- (id)convertPhotoLibraryPathType:(unsigned __int8)a3;
- (id)corePathsWithError:(id *)a3 directDatabaseAccess:(BOOL)a4 limitedLibrary:(BOOL)a5;
- (id)extendedPathsWithError:(id *)a3;
- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4;
- (id)modelRestorePostProcessingCompleteTokenPath;
- (id)pathToAssetsToAlbumsMapping;
- (id)pathsForClientAccess:(id)a3;
- (id)pathsForExternalWriters;
- (id)pathsForFinderSyncFilesystemSizeCalculation;
- (id)pathsForLibraryFilesystemSizeCalculation;
- (id)pathsForPermissionCheck;
- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)photosDatabasePath;
- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5;
- (id)syncInfoPath;
- (id)urlWithIdentifier:(id)a3;
- (unsigned)photoLibraryPathTypeForBundleScope:(unsigned __int16)a3;
- (void)enumerateBundleScopesWithBlock:(id)a3;
- (void)obtainAccessAndWaitWithFileWithIdentifier:(id)a3 mode:(unsigned __int8)a4 toURLWithHandler:(id)a5;
- (void)setExtendedAttributesWithIdentifier:(id)a3;
- (void)setExtendedAttributesWithIdentifier:(id)a3 andURL:(id)a4;
@end

@implementation PLPhotoLibraryPathManagerUBF

- (PLPhotoLibraryPathManagerUBF)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4
{
  v89.receiver = self;
  v89.super_class = (Class)PLPhotoLibraryPathManagerUBF;
  v4 = [(PLPhotoLibraryPathManagerCore *)&v89 initWithLibraryURL:a3 bundleScope:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(PLPhotoLibraryPathManagerCore *)v4 baseDirectory];
    uint64_t v7 = [v6 stringByAppendingPathComponent:@"database"];
    databaseDirectory = v5->_databaseDirectory;
    v5->_databaseDirectory = (NSString *)v7;

    uint64_t v9 = [(NSString *)v5->_databaseDirectory stringByAppendingPathComponent:@"search"];
    searchDatabaseDirectory = v5->_searchDatabaseDirectory;
    v5->_searchDatabaseDirectory = (NSString *)v9;

    v11 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v12 = [v11 stringByAppendingPathComponent:@"originals"];
    originalsDirectory = v5->_originalsDirectory;
    v5->_originalsDirectory = (NSString *)v12;

    v14 = PLBundleIdentifier();
    uint64_t v15 = [(PLPhotoLibraryPathManagerCore *)v5 privateDirectoryWithBundleIdentifier:v14 createIfNeeded:0];
    privateDirectory = v5->_privateDirectory;
    v5->_privateDirectory = (NSString *)v15;

    uint64_t v17 = [(NSString *)v5->_privateDirectory stringByAppendingPathComponent:@"caches"];
    privateCacheDirectory = v5->_privateCacheDirectory;
    v5->_privateCacheDirectory = (NSString *)v17;

    uint64_t v19 = [(NSString *)v5->_privateCacheDirectory stringByAppendingPathComponent:@"restore"];
    restoreInfoDirectory = v5->_restoreInfoDirectory;
    v5->_restoreInfoDirectory = (NSString *)v19;

    v21 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v22 = [v21 stringByAppendingPathComponent:@"scopes"];
    scopesBaseDirectory = v5->_scopesBaseDirectory;
    v5->_scopesBaseDirectory = (NSString *)v22;

    uint64_t v24 = [(NSString *)v5->_scopesBaseDirectory stringByAppendingPathComponent:@"cloudsharing"];
    scopesPhotoCloudSharingDirectory = v5->_scopesPhotoCloudSharingDirectory;
    v5->_scopesPhotoCloudSharingDirectory = (NSString *)v24;

    uint64_t v26 = [(NSString *)v5->_scopesPhotoCloudSharingDirectory stringByAppendingPathComponent:@"data"];
    scopesPhotoCloudSharingDataDirectory = v5->_scopesPhotoCloudSharingDataDirectory;
    v5->_scopesPhotoCloudSharingDataDirectory = (NSString *)v26;

    uint64_t v28 = [(NSString *)v5->_scopesPhotoCloudSharingDirectory stringByAppendingPathComponent:@"metadata"];
    scopesPhotoCloudSharingMetadataDirectory = v5->_scopesPhotoCloudSharingMetadataDirectory;
    v5->_scopesPhotoCloudSharingMetadataDirectory = (NSString *)v28;

    uint64_t v30 = [(NSString *)v5->_scopesPhotoCloudSharingDirectory stringByAppendingPathComponent:@"caches"];
    scopesPhotoCloudSharingCacheDirectory = v5->_scopesPhotoCloudSharingCacheDirectory;
    v5->_scopesPhotoCloudSharingCacheDirectory = (NSString *)v30;

    uint64_t v32 = [(NSString *)v5->_scopesBaseDirectory stringByAppendingPathComponent:@"momentshared"];
    scopesMomentSharedDirectory = v5->_scopesMomentSharedDirectory;
    v5->_scopesMomentSharedDirectory = (NSString *)v32;

    uint64_t v34 = [(NSString *)v5->_scopesBaseDirectory stringByAppendingPathComponent:@"syndication"];
    scopesSyndicationDirectory = v5->_scopesSyndicationDirectory;
    v5->_scopesSyndicationDirectory = (NSString *)v34;

    uint64_t v36 = [(NSString *)v5->_scopesBaseDirectory stringByAppendingPathComponent:@"locked"];
    scopesLockedDirectory = v5->_scopesLockedDirectory;
    v5->_scopesLockedDirectory = (NSString *)v36;

    v38 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v39 = [v38 stringByAppendingPathComponent:@"resources"];
    resourcesDirectory = v5->_resourcesDirectory;
    v5->_resourcesDirectory = (NSString *)v39;

    v41 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v42 = [v41 stringByAppendingPathComponent:@"resources/renders"];
    rendersDirectory = v5->_rendersDirectory;
    v5->_rendersDirectory = (NSString *)v42;

    v44 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v45 = [v44 stringByAppendingPathComponent:@"resources/derivatives"];
    derivativesDirectory = v5->_derivativesDirectory;
    v5->_derivativesDirectory = (NSString *)v45;

    v47 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v48 = [v47 stringByAppendingPathComponent:@"resources/derivatives/thumbs"];
    derivativesThumbsDirectory = v5->_derivativesThumbsDirectory;
    v5->_derivativesThumbsDirectory = (NSString *)v48;

    v50 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v51 = [v50 stringByAppendingPathComponent:@"resources/derivatives/masters"];
    derivativesMasterThumbsDirectory = v5->_derivativesMasterThumbsDirectory;
    v5->_derivativesMasterThumbsDirectory = (NSString *)v51;

    v53 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v54 = [v53 stringByAppendingPathComponent:@"resources/journals"];
    journalsDirectory = v5->_journalsDirectory;
    v5->_journalsDirectory = (NSString *)v54;

    v56 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v57 = [v56 stringByAppendingPathComponent:@"resources/cpl"];
    resourcesCPLDataDirectory = v5->_resourcesCPLDataDirectory;
    v5->_resourcesCPLDataDirectory = (NSString *)v57;

    v59 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v60 = [v59 stringByAppendingPathComponent:@"resources/streams"];
    resourcesPhotoStreamsDataDirectory = v5->_resourcesPhotoStreamsDataDirectory;
    v5->_resourcesPhotoStreamsDataDirectory = (NSString *)v60;

    v62 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v63 = [v62 stringByAppendingPathComponent:@"resources/projects/data"];
    resourcesProjectsDataDirectory = v5->_resourcesProjectsDataDirectory;
    v5->_resourcesProjectsDataDirectory = (NSString *)v63;

    v65 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v66 = [v65 stringByAppendingPathComponent:@"resources/projects/legacy"];
    resourcesProjectsLegacyDirectory = v5->_resourcesProjectsLegacyDirectory;
    v5->_resourcesProjectsLegacyDirectory = (NSString *)v66;

    v68 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v69 = [v68 stringByAppendingPathComponent:@"resources/caches/analytics"];
    resourcesAnalyticsDirectory = v5->_resourcesAnalyticsDirectory;
    v5->_resourcesAnalyticsDirectory = (NSString *)v69;

    v71 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v72 = [v71 stringByAppendingPathComponent:@"resources/caches/compute"];
    resourcesComputeDirectory = v5->_resourcesComputeDirectory;
    v5->_resourcesComputeDirectory = (NSString *)v72;

    v74 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v75 = [v74 stringByAppendingPathComponent:@"resources/smartsharing"];
    resourcesSmartSharingDirectory = v5->_resourcesSmartSharingDirectory;
    v5->_resourcesSmartSharingDirectory = (NSString *)v75;

    v77 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v78 = [v77 stringByAppendingPathComponent:@"resources/partialvideo"];
    resourcesPartialVideoDirectory = v5->_resourcesPartialVideoDirectory;
    v5->_resourcesPartialVideoDirectory = (NSString *)v78;

    v80 = PLBundleIdentifier();
    uint64_t v81 = [(PLPhotoLibraryPathManagerUBF *)v5 _externalDirectoryWithBundleIdentifier:v80 createIfNeeded:0];
    externalDirectory = v5->_externalDirectory;
    v5->_externalDirectory = (NSString *)v81;

    v83 = [(PLPhotoLibraryPathManagerCore *)v5 baseDirectory];
    uint64_t v84 = [v83 stringByAppendingPathComponent:@"internal"];
    internalDirectory = v5->_internalDirectory;
    v5->_internalDirectory = (NSString *)v84;

    v86 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E4F28CB8]);
    fm = v5->_fm;
    v5->_fm = v86;

    [(PLPhotoLibraryPathManagerCore *)v5 postInit];
  }
  return v5;
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5 = a4;
  uint64_t v6 = a3;
  id v8 = a5;
  uint64_t v9 = [(PLPhotoLibraryPathManagerUBF *)self convertPhotoLibraryPathType:v6];
  v10 = [(PLPhotoLibraryPathManagerUBF *)self addToPath:v9 leafType:v5 additionalPathComponents:v8];

  return v10;
}

- (id)convertPhotoLibraryPathType:(unsigned __int8)a3
{
  switch(a3)
  {
    case 0u:
    case 0x23u:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid path type conversion: %s", "-[PLPhotoLibraryPathManagerUBF convertPhotoLibraryPathType:]");
      goto LABEL_38;
    case 1u:
    case 0x1Cu:
      id v5 = [(PLPhotoLibraryPathManagerCore *)self baseDirectory];
      goto LABEL_34;
    case 2u:
      uint64_t v4 = 128;
      goto LABEL_33;
    case 3u:
      uint64_t v4 = 136;
      goto LABEL_33;
    case 4u:
    case 0x1Du:
    case 0x1Fu:
      uint64_t v4 = 144;
      goto LABEL_33;
    case 5u:
    case 0x21u:
      uint64_t v4 = 152;
      goto LABEL_33;
    case 6u:
      uint64_t v4 = 160;
      goto LABEL_33;
    case 7u:
      uint64_t v4 = 240;
      goto LABEL_33;
    case 8u:
      uint64_t v4 = 248;
      goto LABEL_33;
    case 9u:
      uint64_t v4 = 256;
      goto LABEL_33;
    case 0xAu:
      uint64_t v4 = 264;
      goto LABEL_33;
    case 0xBu:
      uint64_t v4 = 272;
      goto LABEL_33;
    case 0xCu:
      uint64_t v4 = 280;
      goto LABEL_33;
    case 0xDu:
    case 0x22u:
      uint64_t v4 = 288;
      goto LABEL_33;
    case 0xEu:
      uint64_t v4 = 296;
      goto LABEL_33;
    case 0xFu:
      uint64_t v4 = 304;
      goto LABEL_33;
    case 0x10u:
      uint64_t v4 = 312;
      goto LABEL_33;
    case 0x11u:
      uint64_t v4 = 320;
      goto LABEL_33;
    case 0x12u:
      uint64_t v4 = 328;
      goto LABEL_33;
    case 0x13u:
      uint64_t v4 = 344;
      goto LABEL_33;
    case 0x14u:
      uint64_t v4 = 336;
      goto LABEL_33;
    case 0x15u:
      uint64_t v4 = 184;
      goto LABEL_33;
    case 0x16u:
      uint64_t v4 = 192;
      goto LABEL_33;
    case 0x17u:
      uint64_t v4 = 200;
      goto LABEL_33;
    case 0x18u:
      uint64_t v4 = 208;
      goto LABEL_33;
    case 0x19u:
      uint64_t v4 = 224;
      goto LABEL_33;
    case 0x1Au:
      uint64_t v4 = 216;
      goto LABEL_33;
    case 0x1Bu:
      uint64_t v4 = 232;
LABEL_33:
      id v5 = *(id *)((char *)&self->super.super.isa + v4);
      goto LABEL_34;
    case 0x1Eu:
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid video key frames legacy path type (non-UBF only): %s", "-[PLPhotoLibraryPathManagerUBF convertPhotoLibraryPathType:]");
LABEL_38:
      id v5 = 0;
      goto LABEL_34;
    case 0x20u:
      id v5 = [(PLPhotoLibraryPathManagerUBF *)self photoDirectoryWithType:13 leafType:3 additionalPathComponents:0];
LABEL_34:
      break;
    default:
      id v5 = 0;
      break;
  }
  return v5;
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
      goto LABEL_10;
    case 1:
      id v10 = v7;
      goto LABEL_7;
    case 2:
      v11 = @"PLPhotoLibrarySubPathLeafTypeDerivatives";
      uint64_t v12 = [@"PLPhotoLibrarySubPathLeafTypeDerivatives" substringFromIndex:objc_msgSend(@"PLPhotoLibrarySubPathLeafType", "length")];
      v13 = [v12 lowercaseString];

      id v9 = [v7 stringByAppendingPathComponent:v13];

      goto LABEL_8;
    case 3:
      id v10 = [v7 stringByAppendingPathComponent:@"cloudsync.noindex"];
LABEL_7:
      id v9 = v10;
      goto LABEL_8;
    default:
      id v9 = 0;
LABEL_8:
      if ([v8 length])
      {
        uint64_t v14 = [v9 stringByAppendingPathComponent:v8];

        id v9 = (id)v14;
      }
LABEL_10:

      return v9;
  }
}

- (id)basePrivateDirectoryPath
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v2 = NSString;
  uint64_t v3 = [(PLPhotoLibraryPathManagerCore *)self baseDirectory];
  v7[0] = v3;
  v7[1] = @"private";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  id v5 = [v2 pathWithComponents:v4];

  return v5;
}

- (id)_externalDirectoryWithBundleIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = NSString;
  id v8 = [(PLPhotoLibraryPathManagerCore *)self baseDirectory];
  v24[0] = v8;
  v24[1] = @"external";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  id v10 = [v7 pathWithComponents:v9];

  if (v6)
  {
    id v11 = [v10 stringByAppendingPathComponent:v6];
  }
  else
  {
    id v11 = v10;
  }
  uint64_t v12 = v11;
  if (v4)
  {
    id v17 = 0;
    BOOL v13 = [(PLPhotoLibraryPathManagerCore *)self internalValidateCreationRequestWithError:&v17];
    id v14 = v17;
    if (v13)
    {
      uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v15 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:0 error:0];
    }
    else
    {
      uint64_t v15 = PLBackendGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        uint64_t v19 = "-[PLPhotoLibraryPathManagerUBF _externalDirectoryWithBundleIdentifier:createIfNeeded:]";
        __int16 v20 = 2112;
        v21 = v12;
        __int16 v22 = 2112;
        id v23 = v14;
        _os_log_impl(&dword_19BCFB000, v15, OS_LOG_TYPE_ERROR, "%{public}s: failed to create directory: %@ with error: %@", buf, 0x20u);
      }
    }
  }
  return v12;
}

- (unsigned)photoLibraryPathTypeForBundleScope:(unsigned __int16)a3
{
  unint64_t v3 = 0x1B1A151901uLL >> (8 * a3);
  if (a3 >= 6u) {
    LOBYTE(v3) = 0;
  }
  return v3 & 0x1F;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fm, 0);
  objc_storeStrong((id *)&self->_internalDirectory, 0);
  objc_storeStrong((id *)&self->_externalDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesPartialVideoDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesSmartSharingDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesComputeDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesAnalyticsDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesProjectsLegacyDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesProjectsDataDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesPhotoStreamsDataDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesCPLDataDirectory, 0);
  objc_storeStrong((id *)&self->_derivativesMasterThumbsDirectory, 0);
  objc_storeStrong((id *)&self->_derivativesThumbsDirectory, 0);
  objc_storeStrong((id *)&self->_derivativesDirectory, 0);
  objc_storeStrong((id *)&self->_rendersDirectory, 0);
  objc_storeStrong((id *)&self->_journalsDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesDirectory, 0);
  objc_storeStrong((id *)&self->_scopesLockedDirectory, 0);
  objc_storeStrong((id *)&self->_scopesMomentSharedDirectory, 0);
  objc_storeStrong((id *)&self->_scopesSyndicationDirectory, 0);
  objc_storeStrong((id *)&self->_scopesPhotoCloudSharingCacheDirectory, 0);
  objc_storeStrong((id *)&self->_scopesPhotoCloudSharingMetadataDirectory, 0);
  objc_storeStrong((id *)&self->_scopesPhotoCloudSharingDataDirectory, 0);
  objc_storeStrong((id *)&self->_scopesPhotoCloudSharingDirectory, 0);
  objc_storeStrong((id *)&self->_scopesBaseDirectory, 0);
  objc_storeStrong((id *)&self->_restoreInfoDirectory, 0);
  objc_storeStrong((id *)&self->_privateCacheDirectory, 0);
  objc_storeStrong((id *)&self->_privateDirectory, 0);
  objc_storeStrong((id *)&self->_originalsDirectory, 0);
  objc_storeStrong((id *)&self->_searchDatabaseDirectory, 0);
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
}

- (BOOL)ensureFileProviderSyncExclusionAttributeIsSetWithError:(id *)a3
{
  return 1;
}

- (BOOL)updateTimeMachineExclusionAttributeForExcludePath:(id)a3 error:(id *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
LABEL_8:
    BOOL v7 = 1;
    goto LABEL_9;
  }
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
  {
    pl_dispatch_once(&PLIsInternalTool_didCheckReadOnly, &__block_literal_global_59);
    if (!PLIsInternalTool_isInternalTool)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        int v9 = 138412290;
        id v10 = v5;
        _os_log_fault_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unauthorized client attempting to set time machine exclusion attribute on path: %@", (uint8_t *)&v9, 0xCu);
      }
      goto LABEL_8;
    }
  }
  id v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:1];
  BOOL v7 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:1 url:v6 error:a4];

LABEL_9:
  return v7;
}

- (id)_scopedInternalPathManagerWithBundleScope:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  id v5 = self;
  if ([(PLPhotoLibraryPathManagerCore *)v5 bundleScope] != v3)
  {
    if ([(PLPhotoLibraryPathManagerCore *)v5 bundleScope])
    {
      uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:v5 file:@"PLPhotoLibraryPathManagerUBF.m" lineNumber:931 description:@"Requesting a scoped path managed from a non-main scoped path manager is not supported"];
    }
    id v6 = [(PLPhotoLibraryPathManagerCore *)v5 photoDirectoryWithType:[(PLPhotoLibraryPathManagerUBF *)v5 photoLibraryPathTypeForBundleScope:v3]];
    BOOL v7 = [PLPhotoLibraryPathManagerUBF alloc];
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:1];
    uint64_t v9 = [(PLPhotoLibraryPathManagerUBF *)v7 initWithLibraryURL:v8 bundleScope:v3];

    id v5 = (PLPhotoLibraryPathManagerUBF *)v9;
  }
  return v5;
}

- (id)assetMainFilePathWithDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    __int16 v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLPhotoLibraryPathManagerUBF.m", 899, @"Invalid parameter not satisfying: %@", @"directory" object file lineNumber description];
  }
  if ([(PLPhotoLibraryPathManagerCore *)self bundleScope])
  {
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"PLPhotoLibraryPathManagerUBF.m" lineNumber:900 description:@"can only access asset main file path on main bundle scoped path manager"];
  }
  if (([v9 hasPrefix:@"/"] & 1) == 0)
  {
    if (v5 <= 4)
    {
      if (((1 << v5) & 0x1A) != 0)
      {
        uint64_t v11 = [PLPhotoLibraryPathManager alloc];
        uint64_t v12 = [(PLPhotoLibraryPathManagerCore *)self libraryURL];
        BOOL v13 = [(PLPhotoLibraryPathManager *)v11 initWithLibraryURL:v12 bundleScope:v5 libraryFormat:2];

        if (v13)
        {
LABEL_9:
          if (v5 == 2) {
            uint64_t v14 = 22;
          }
          else {
            uint64_t v14 = 4;
          }
          uint64_t v15 = [(PLPhotoLibraryPathManagerCore *)v13 photoDirectoryWithType:v14];
          uint64_t v16 = [v15 stringByAppendingPathComponent:v9];

          id v9 = (id)v16;
          goto LABEL_13;
        }
      }
      else
      {
        BOOL v13 = self;
        if (v13) {
          goto LABEL_9;
        }
      }
    }
    uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLPhotoLibraryPathManagerUBF.m", 917, @"Cannot resolve path manager from invalid bundle scope %d", v5);

    BOOL v13 = 0;
    goto LABEL_9;
  }
LABEL_13:
  id v17 = [v9 stringByAppendingPathComponent:v10];

  return v17;
}

- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 type:(unsigned __int8)a4 bundleScope:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = [(PLPhotoLibraryPathManagerUBF *)self _scopedInternalPathManagerWithBundleScope:v5];
  id v10 = [v9 photoDirectoryWithType:v6];
  uint64_t v11 = [(PLPhotoLibraryPathManagerCore *)self assetAbbreviatedMetadataDirectoryForDirectory:v8 rootPath:v10];

  return v11;
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

- (void)obtainAccessAndWaitWithFileWithIdentifier:(id)a3 mode:(unsigned __int8)a4 toURLWithHandler:(id)a5
{
  int v6 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *, id))a5;
  id v10 = [(PLPhotoLibraryPathManagerUBF *)self urlWithIdentifier:v8];
  if (v9)
  {
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
    id v11 = 0;
    if (v6 == 2 && (PLIsReallyAssetsd_isAssetsd != 0) | __PLIsAssetsdProxyService & 1)
    {
      uint64_t v12 = [v10 URLByDeletingLastPathComponent];
      BOOL v13 = [v12 path];
      id v15 = 0;
      BOOL v14 = +[PLFileUtilities createDirectoryAtPath:v13 error:&v15];
      id v11 = v15;

      if (!v14)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v17 = v10;
          __int16 v18 = 2112;
          id v19 = v11;
          _os_log_error_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to create intermediate path for write request to url: %@ Create dir error: %@", buf, 0x16u);
        }

        id v10 = 0;
      }
    }
    v9[2](v9, v10, v11);
  }
  else
  {
    id v11 = 0;
  }

  if (v6 == 2) {
    [(PLPhotoLibraryPathManagerUBF *)self setExtendedAttributesWithIdentifier:v8 andURL:v10];
  }
}

- (void)setExtendedAttributesWithIdentifier:(id)a3 andURL:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (PLIsReallyAssetsd_isAssetsd) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = __PLIsAssetsdProxyService == 0;
  }
  if (!v8 && ![v6 resourceVersion])
  {
    id v9 = [v6 originalFilename];
    uint64_t v10 = [v9 length];

    if (v10)
    {
      unsigned __int8 v25 = 0;
      fm = self->_fm;
      uint64_t v12 = [v7 path];
      LODWORD(fm) = [(NSFileManager *)fm fileExistsAtPath:v12 isDirectory:&v25];
      int v13 = v25;

      if (fm) {
        BOOL v14 = v13 == 0;
      }
      else {
        BOOL v14 = 0;
      }
      if (v14)
      {
        id v16 = [v6 originalFilename];
        id v17 = (const char *)[v16 UTF8String];

        __int16 v18 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v17 length:strlen(v17)];
        id v19 = (const char *)[@"com.apple.assetsd.originalFilename" UTF8String];
        id v20 = [v7 path];
        v21 = (const char *)[v20 UTF8String];
        id v15 = v18;
        LODWORD(v19) = setxattr(v21, v19, (const void *)[v15 bytes], objc_msgSend(v15, "length"), 0, 0);

        if (v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          __int16 v22 = [v6 originalFilename];
          id v23 = __error();
          uint64_t v24 = strerror(*v23);
          *(_DWORD *)buf = 138412802;
          id v27 = v22;
          __int16 v28 = 2112;
          id v29 = v7;
          __int16 v30 = 2080;
          v31 = v24;
          _os_log_error_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to write originalFilename (\"%@\") to url: %@ Error: %s", buf, 0x20u);
        }
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        id v15 = [v6 originalFilename];
        *(_DWORD *)buf = 138412546;
        id v27 = v15;
        __int16 v28 = 2112;
        id v29 = v7;
        _os_log_debug_impl(&dword_19BCFB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Failed to write originalfilename (\"%@\") to url: %@", buf, 0x16u);
LABEL_17:
      }
    }
  }
}

- (void)setExtendedAttributesWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PLPhotoLibraryPathManagerUBF *)self urlWithIdentifier:v4];
  [(PLPhotoLibraryPathManagerUBF *)self setExtendedAttributesWithIdentifier:v4 andURL:v5];
}

- (id)urlWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if ([v4 bundleScope])
  {
    uint64_t v6 = -[PLPhotoLibraryPathManagerUBF _scopedInternalPathManagerWithBundleScope:](v5, "_scopedInternalPathManagerWithBundleScope:", [v4 bundleScope]);

    id v5 = (PLPhotoLibraryPathManagerUBF *)v6;
  }
  id v25 = [v4 uuid];
  uint64_t v23 = [v25 UTF8String];
  id v24 = [v4 extension];
  uint64_t v22 = [v24 UTF8String];
  unsigned int v21 = [v4 resourceType];
  int v20 = [v4 resourceVersion];
  unsigned int v19 = [v4 recipeId];
  char v18 = [v4 isData];
  id v7 = [(PLPhotoLibraryPathManagerCore *)v5 photoDirectoryWithType:4];
  uint64_t v17 = [v7 UTF8String];
  id v8 = [(PLPhotoLibraryPathManagerCore *)v5 photoDirectoryWithType:9];
  uint64_t v9 = [v8 UTF8String];
  id v10 = [(PLPhotoLibraryPathManagerCore *)v5 photoDirectoryWithType:10];
  uint64_t v11 = [v10 UTF8String];
  id v12 = [(PLPhotoLibraryPathManagerCore *)v5 photoDirectoryWithType:18];
  uint64_t v13 = [v12 UTF8String];
  id v14 = [(PLPhotoLibraryPathManagerCore *)v5 photoDirectoryWithType:12];
  id v15 = PLURLForResourceProperties(v23, v22, v21, v20, v19, v18, v17, v9, v11, v13, [v14 UTF8String]);

  return v15;
}

- (BOOL)shouldUseFileIdentifierForBundleScope:(unsigned __int16)a3
{
  return 1;
}

- (void)enumerateBundleScopesWithBlock:(id)a3
{
  id v13 = a3;
  if ([(PLPhotoLibraryPathManagerCore *)self bundleScope])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PLPhotoLibraryPathManagerUBF.m" lineNumber:796 description:@"can only enumerate bundle scopes on main bundle scoped path manager"];
  }
  int v5 = 0;
  id v6 = v13;
  do
  {
    id v7 = (void *)MEMORY[0x19F38F510](v6);
    id v8 = [PLPhotoLibraryPathManager alloc];
    uint64_t v9 = [(PLPhotoLibraryPathManagerCore *)self libraryURL];
    unsigned int v10 = (unsigned __int16)v5;
    uint64_t v11 = [(PLPhotoLibraryPathManager *)v8 initWithLibraryURL:v9 bundleScope:(unsigned __int16)v5 libraryFormat:2];

    (*((void (**)(id, void, void, PLPhotoLibraryPathManager *))v13 + 2))(v13, (unsigned __int16)v5, [(PLPhotoLibraryPathManagerUBF *)self photoLibraryPathTypeForBundleScope:(unsigned __int16)v5], v11);
    ++v5;
  }
  while (v10 < 4);
}

- (id)syncInfoPath
{
  return [(NSString *)self->_privateDirectory stringByAppendingPathComponent:@"syncInfo.plist"];
}

- (id)pathToAssetsToAlbumsMapping
{
  return [(NSString *)self->_privateDirectory stringByAppendingPathComponent:@"assetsToAlbumsMapping.plist"];
}

- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  switch(v4)
  {
    case 0:
    case 6:
      id v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_19BCFB000, v12, OS_LOG_TYPE_FAULT, "Invalid subtype for internal location", v17, 2u);
      }

      goto LABEL_6;
    case 1:
    case 3:
    case 4:
      internalDirectory = self->_internalDirectory;
      id v8 = off_1E58A1740[v4];
      uint64_t v9 = -[__CFString substringFromIndex:](v8, "substringFromIndex:", [@"PLPhotoLibraryInternalPathType" length]);
      unsigned int v10 = [v9 lowercaseString];

      uint64_t v11 = [(NSString *)internalDirectory stringByAppendingPathComponent:v10];

      break;
    case 2:
      id v13 = self->_internalDirectory;
      id v14 = @"lofr";
      goto LABEL_9;
    case 5:
      id v13 = self->_internalDirectory;
      id v14 = @"csutaxonomy";
LABEL_9:
      uint64_t v11 = [(NSString *)v13 stringByAppendingPathComponent:v14];
      break;
    default:
LABEL_6:
      uint64_t v11 = 0;
      break;
  }
  id v15 = [(PLPhotoLibraryPathManagerUBF *)self addToPath:v11 leafType:1 additionalPathComponents:v6];

  return v15;
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5 = a4;
  int v6 = a3;
  id v8 = a5;
  if ((v6 - 1) >= 3)
  {
    if (v6 != 4 && v6)
    {
      id v13 = 0;
    }
    else
    {
      id v13 = [(PLPhotoLibraryPathManagerUBF *)self _externalDirectoryWithBundleIdentifier:0 createIfNeeded:0];
    }
  }
  else
  {
    externalDirectory = self->_externalDirectory;
    unsigned int v10 = off_1E58A1720[v6];
    uint64_t v11 = -[__CFString substringFromIndex:](v10, "substringFromIndex:", [@"PLPhotoLibraryExternalPathType" length]);
    id v12 = [v11 lowercaseString];

    id v13 = [(NSString *)externalDirectory stringByAppendingPathComponent:v12];
  }
  id v14 = [(PLPhotoLibraryPathManagerUBF *)self addToPath:v13 leafType:v5 additionalPathComponents:v8];

  return v14;
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5 = a4;
  unsigned int v6 = a3;
  id v8 = a5;
  uint64_t v9 = self->_privateCacheDirectory;
  if (v6)
  {
    privateCacheDirectory = self->_privateCacheDirectory;
    if (v6 < 0x11)
    {
      uint64_t v11 = off_1E58A1698[v6];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid type %d: %s", v6, "NSString *PLStringFromPLPhotoLibraryCacheSubPathType(PLPhotoLibraryCacheSubPathType)");
      uint64_t v11 = @"PLPhotoLibraryCacheSubPathTypeLast";
    }
    id v12 = v11;
    id v13 = -[__CFString substringFromIndex:](v12, "substringFromIndex:", [@"PLPhotoLibraryCacheSubPathType" length]);
    id v14 = [v13 lowercaseString];

    uint64_t v15 = [(NSString *)privateCacheDirectory stringByAppendingPathComponent:v14];

    uint64_t v9 = (NSString *)v15;
  }
  id v16 = [(PLPhotoLibraryPathManagerUBF *)self addToPath:v9 leafType:v5 additionalPathComponents:v8];

  return v16;
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5 = a4;
  unsigned int v6 = a3;
  id v8 = a5;
  uint64_t v9 = self->_privateDirectory;
  if (v6)
  {
    privateDirectory = self->_privateDirectory;
    if (v6 < 0x11)
    {
      if (v6 <= 0xA)
      {
        uint64_t v11 = off_1E58A1620[v6];
LABEL_7:
        id v12 = v11;
        id v13 = -[__CFString substringFromIndex:](v12, "substringFromIndex:", [@"PLPhotoLibrarySubPathType" length]);
        id v14 = [v13 lowercaseString];

        uint64_t v15 = [(NSString *)privateDirectory stringByAppendingPathComponent:v14];

        uint64_t v9 = (NSString *)v15;
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Invalid type %d: %s", v6, "NSString *PLStringFromPLPhotoLibrarySubPathType(PLPhotoLibrarySubPathType)");
    }
    uint64_t v11 = @"PLPhotoLibrarySubPathTypeLast";
    goto LABEL_7;
  }
LABEL_8:
  id v16 = [(PLPhotoLibraryPathManagerUBF *)self addToPath:v9 leafType:v5 additionalPathComponents:v8];

  return v16;
}

- (id)pathsForFinderSyncFilesystemSizeCalculation
{
  return (id)[MEMORY[0x1E4F1CAD0] set];
}

- (id)pathsForLibraryFilesystemSizeCalculation
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = [(PLPhotoLibraryPathManagerCore *)self baseDirectory];
  int v4 = [v2 setWithObject:v3];

  return v4;
}

- (id)extendedPathsWithError:(id *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v21 = 0;
  unsigned int v6 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:5 createIfNeeded:1 error:&v21];
  id v7 = v21;
  if (v6) {
    [v5 addObject:v6];
  }

  if (v7)
  {
    id v8 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:8 createIfNeeded:1 error:0];
    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  id v20 = 0;
  id v8 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:8 createIfNeeded:1 error:&v20];
  id v7 = v20;
  if (v8) {
LABEL_5:
  }
    [v5 addObject:v8];
LABEL_6:

  if (v7)
  {
    uint64_t v9 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:25 createIfNeeded:1 error:0];
    if (!v9) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v19 = 0;
  uint64_t v9 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:25 createIfNeeded:1 error:&v19];
  id v7 = v19;
  if (v9) {
LABEL_8:
  }
    [v5 addObject:v9];
LABEL_9:

  if (v7)
  {
    unsigned int v10 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:21 createIfNeeded:1 error:0];
    if (!v10) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  id v18 = 0;
  unsigned int v10 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:21 createIfNeeded:1 error:&v18];
  id v7 = v18;
  if (v10) {
LABEL_11:
  }
    [v5 addObject:v10];
LABEL_12:

  if (v7)
  {
    uint64_t v11 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:26 createIfNeeded:1 error:0];
    if (!v11) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v17 = 0;
  uint64_t v11 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:26 createIfNeeded:1 error:&v17];
  id v7 = v17;
  if (v11) {
LABEL_14:
  }
    [v5 addObject:v11];
LABEL_15:

  if (v7)
  {
    id v12 = [(PLPhotoLibraryPathManagerCore *)self privateCacheDirectoryWithSubType:15 createIfNeeded:1 error:0];
    if (!v12) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  id v16 = 0;
  id v12 = [(PLPhotoLibraryPathManagerCore *)self privateCacheDirectoryWithSubType:15 createIfNeeded:1 error:&v16];
  id v7 = v16;
  if (v12) {
LABEL_17:
  }
    [v5 addObject:v12];
LABEL_18:

  if (a3) {
    *a3 = v7;
  }
  if (v7) {
    id v13 = 0;
  }
  else {
    id v13 = v5;
  }
  id v14 = v13;

  return v14;
}

- (id)corePathsWithError:(id *)a3 directDatabaseAccess:(BOOL)a4 limitedLibrary:(BOOL)a5
{
  BOOL v6 = a4;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (!v6)
  {
    if (a5)
    {
      id v11 = 0;
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  id v20 = 0;
  unsigned int v10 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:2 createIfNeeded:1 error:&v20];
  id v11 = v20;
  if (v10) {
    [v9 addObject:v10];
  }

  if (!a5)
  {
    if (v11)
    {
      id v12 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:4 createIfNeeded:1 error:0];
      if (!v12)
      {
LABEL_12:

        if (v11)
        {
          id v13 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:7 createIfNeeded:1 error:0];
          if (!v13)
          {
LABEL_15:

            goto LABEL_16;
          }
        }
        else
        {
          id v18 = 0;
          id v13 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:7 createIfNeeded:1 error:&v18];
          id v11 = v18;
          if (!v13) {
            goto LABEL_15;
          }
        }
        [v9 addObject:v13];
        goto LABEL_15;
      }
LABEL_11:
      [v9 addObject:v12];
      goto LABEL_12;
    }
LABEL_10:
    id v19 = 0;
    id v12 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:4 createIfNeeded:1 error:&v19];
    id v11 = v19;
    if (!v12) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_16:
  id v14 = [(PLPhotoLibraryPathManagerUBF *)self _externalDirectoryWithBundleIdentifier:0 createIfNeeded:1];
  if (v14) {
    [v9 addObject:v14];
  }

  if (a3) {
    *a3 = v11;
  }
  if (v11) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = v9;
  }
  id v16 = v15;

  return v16;
}

- (BOOL)createPathsForNewLibrariesWithError:(id *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (!PLIsReallyAssetsd_isAssetsd && !PFProcessIsLaunchedToExecuteTests())
  {
    id v7 = 0;
    goto LABEL_7;
  }
  id v38 = 0;
  BOOL v5 = [(PLPhotoLibraryPathManagerUBF *)self ensureFileProviderSyncExclusionAttributeIsSetWithError:&v38];
  id v6 = v38;
  id v7 = v6;
  if (!v5)
  {
LABEL_7:
    id v8 = [NSString stringWithFormat:@"Invalid client access"];
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28568];
    v40 = v8;
    unsigned int v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    id v12 = [v11 errorWithDomain:@"com.apple.photos.error" code:46800 userInfo:v10];
LABEL_29:
    BOOL v21 = 0;
    goto LABEL_30;
  }
  id v37 = v6;
  id v8 = [(PLPhotoLibraryPathManagerUBF *)self corePathsWithError:&v37 directDatabaseAccess:1 limitedLibrary:0];
  id v9 = v37;

  if (v9)
  {
    unsigned int v10 = [(PLPhotoLibraryPathManagerUBF *)self extendedPathsWithError:0];
  }
  else
  {
    id v36 = 0;
    unsigned int v10 = [(PLPhotoLibraryPathManagerUBF *)self extendedPathsWithError:&v36];
    id v9 = v36;
  }
  uint64_t v13 = [v8 count];
  uint64_t v14 = [v10 count];
  [v8 unionSet:v10];
  if (!v13 || !v14 || [v8 count] != v14 + v13 || v9)
  {
    uint64_t v22 = [NSString stringWithFormat:@"Failed expected directory count"];
    id v7 = (id)v22;
    if (v9)
    {
      v43[0] = *MEMORY[0x1E4F28568];
      v43[1] = *MEMORY[0x1E4F28A50];
      v44[0] = v22;
      v44[1] = v9;
      uint64_t v23 = (void *)MEMORY[0x1E4F1C9E8];
      id v24 = v44;
      id v25 = v43;
      uint64_t v26 = 2;
    }
    else
    {
      uint64_t v41 = *MEMORY[0x1E4F28568];
      uint64_t v42 = v22;
      uint64_t v23 = (void *)MEMORY[0x1E4F1C9E8];
      id v24 = &v42;
      id v25 = &v41;
      uint64_t v26 = 1;
    }
    id v27 = [v23 dictionaryWithObjects:v24 forKeys:v25 count:v26];
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.error" code:46800 userInfo:v27];

    goto LABEL_29;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v8;
  uint64_t v15 = [v7 countByEnumeratingWithState:&v32 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v7);
        }
        uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        char v31 = 0;
        if ([(NSFileManager *)self->_fm fileExistsAtPath:v19 isDirectory:&v31]) {
          BOOL v20 = v31 == 0;
        }
        else {
          BOOL v20 = 1;
        }
        if (v20)
        {
          id v29 = [NSString stringWithFormat:@"Failed to validate path exists: %@", v19];
          uint64_t v45 = *MEMORY[0x1E4F28568];
          v46 = v29;
          __int16 v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.error" code:46800 userInfo:v30];

          BOOL v21 = 0;
          goto LABEL_35;
        }
      }
      uint64_t v16 = [v7 countByEnumeratingWithState:&v32 objects:v47 count:16];
      BOOL v21 = 1;
      if (v16) {
        continue;
      }
      break;
    }
    id v12 = 0;
  }
  else
  {
    id v12 = 0;
    BOOL v21 = 1;
  }
LABEL_35:
  id v8 = v7;
LABEL_30:

  if (a3) {
    *a3 = v12;
  }

  return v21;
}

- (id)pathsForExternalWriters
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CAD0];
  int v4 = [(PLPhotoLibraryPathManagerUBF *)self basePrivateDirectoryPath];
  v9[0] = v4;
  BOOL v5 = [(PLPhotoLibraryPathManagerUBF *)self _externalDirectoryWithBundleIdentifier:0 createIfNeeded:0];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v7 = [v3 setWithArray:v6];

  return v7;
}

- (id)pathsForPermissionCheck
{
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_54_3819);
  if (!PLIsReallyAssetsd_isAssetsd) {
    goto LABEL_5;
  }
  id v3 = [(PLPhotoLibraryPathManagerUBF *)self corePathsWithError:0 directDatabaseAccess:1 limitedLibrary:0];
  int v4 = [(PLPhotoLibraryPathManagerUBF *)self basePrivateDirectoryPath];
  [v3 addObject:v4];

  BOOL v5 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:11 createIfNeeded:1 error:0];
  if (v5) {
    [v3 addObject:v5];
  }

  if (!v3) {
LABEL_5:
  }
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  return v3;
}

- (id)pathsForClientAccess:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 directDatabaseAccessAuthorized];
  id v6 = [(PLPhotoLibraryPathManagerUBF *)self _externalDirectoryWithBundleIdentifier:0 createIfNeeded:0];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  int v46 = v5;
  id v8 = -[PLPhotoLibraryPathManagerUBF corePathsWithError:directDatabaseAccess:limitedLibrary:](self, "corePathsWithError:directDatabaseAccess:limitedLibrary:", 0, v5, [v4 limitedLibraryMode]);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    uint64_t v12 = MEMORY[0x1E4F1CC28];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (([v14 hasPrefix:v6] & 1) == 0) {
          [v7 setObject:v12 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v10);
  }

  v47 = [(PLPhotoLibraryPathManagerUBF *)self clientOwnedDirectoryPathsForClientAccess:v4];
  objc_msgSend(v7, "addEntriesFromDictionary:");
  if (([v4 limitedLibraryMode] & 1) == 0) {
    [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:self->_scopesBaseDirectory];
  }
  if ([v4 cloudInternalEntitled])
  {
    uint64_t v15 = [v4 trustedCallerBundleID];
    if ([v15 isEqualToString:@"com.apple.mediastream.mstreamd"])
    {
      uint64_t v16 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:21];
      if (v16) {
        [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v16];
      }
      uint64_t v17 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:14];
      if (v17) {
        [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v17];
      }
    }
  }
  id v18 = objc_opt_class();
  uint64_t v19 = [(PLPhotoLibraryPathManagerCore *)self libraryURL];
  unint64_t v20 = [v18 wellKnownPhotoLibraryIdentifierForURL:v19];

  if (v20 <= 1)
  {
    BOOL v21 = [(PLPhotoLibraryPathManagerCore *)self pathForCPLStatus];
    if (v21) {
      [v7 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v21];
    }
  }
  if (v46 && [v4 directDatabaseWriteAuthorized])
  {
    uint64_t v22 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:2 createIfNeeded:0 error:0];
    if (v22)
    {
      uint64_t v23 = [v7 objectForKeyedSubscript:v22];

      if (!v23)
      {
        v44 = [MEMORY[0x1E4F28B00] currentHandler];
        [v44 handleFailureInMethod:a2, self, @"PLPhotoLibraryPathManagerUBF.m", 545, @"Invalid parameter not satisfying: %@", @"dict[databaseDirectory] != nil" object file lineNumber description];
      }
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v22];
    }
  }
  id v24 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:17 createIfNeeded:1 error:0];
  if ([v4 analyticsCacheWriteEntitled])
  {
    uint64_t v25 = MEMORY[0x1E4F1CC38];
LABEL_35:
    [v7 setObject:v25 forKeyedSubscript:v24];
    goto LABEL_36;
  }
  if ([v4 analyticsCacheReadEntitled])
  {
    uint64_t v25 = MEMORY[0x1E4F1CC28];
    goto LABEL_35;
  }
LABEL_36:
  if (([v4 analyticsCacheWriteEntitled] & 1) != 0
    || [v4 analyticsCacheReadEntitled])
  {
    uint64_t v26 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:17 createIfNeeded:1 error:0];
    id v27 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "analyticsCacheWriteEntitled"));
    [v7 setObject:v27 forKeyedSubscript:v26];
  }
  if (([v4 smartSharingCacheWriteEntitled] & 1) != 0
    || [v4 smartSharingCacheReadEntitled])
  {
    __int16 v28 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:20 createIfNeeded:1 error:0];
    id v29 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "smartSharingCacheWriteEntitled"));
    [v7 setObject:v29 forKeyedSubscript:v28];
  }
  if ([v4 internalDataReadWriteAuthorized])
  {
    __int16 v30 = [(PLPhotoLibraryPathManagerCore *)self internalDirectoryWithSubType:1 additionalPathComponents:0 createIfNeeded:1 error:0];
    uint64_t v31 = MEMORY[0x1E4F1CC38];
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v30];
    long long v32 = [(PLPhotoLibraryPathManagerCore *)self internalDirectoryWithSubType:3 additionalPathComponents:0 createIfNeeded:1 error:0];
    [v7 setObject:v31 forKeyedSubscript:v32];
    long long v33 = [(PLPhotoLibraryPathManagerCore *)self internalDirectoryWithSubType:4 additionalPathComponents:0 createIfNeeded:1 error:0];
    [v7 setObject:v31 forKeyedSubscript:v33];
  }
  long long v34 = [(PLPhotoLibraryPathManagerCore *)self capabilities];
  int v35 = [v34 isNetworkVolume];

  if (v35)
  {
    id v36 = [(PLPhotoLibraryPathManagerUBF *)self photosDatabasePath];
    id v37 = +[PLFileUtilities proxyLockFilePathForDatabasePath:v36];
    id v38 = [v37 stringByDeletingLastPathComponent];

    if (v38) {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v38];
    }
    uint64_t v39 = [(PLPhotoLibraryPathManagerCore *)self photoDirectoryWithType:2 createIfNeeded:0 error:0];
    v40 = +[PLFileUtilities proxyLockCoordinatingFilePathForDatabaseDirectory:v39 databaseName:@"Photos.sqlite"];
    if (v40) {
      [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v40];
    }
  }
  if (([v4 coreSceneUnderstandingTaxonomyReadAuthorized] & 1) != 0
    || [v4 coreSceneUnderstandingTaxonomyWriteAuthorized])
  {
    uint64_t v41 = [(PLPhotoLibraryPathManagerCore *)self internalDirectoryWithSubType:5 additionalPathComponents:0 createIfNeeded:1 error:0];
    uint64_t v42 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "coreSceneUnderstandingTaxonomyWriteAuthorized"));
    [v7 setObject:v42 forKeyedSubscript:v41];
  }
  return v7;
}

- (id)clientOwnedDirectoryPathsForClientAccess:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = [v5 trustedCallerBundleID];

  id v8 = [(PLPhotoLibraryPathManagerUBF *)self _externalDirectoryWithBundleIdentifier:v7 createIfNeeded:1];
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
  return [(NSString *)self->_databaseDirectory stringByAppendingPathComponent:@"Photos.sqlite"];
}

+ (id)allPhotosPathsOnThisDevice
{
  if (allPhotosPathsOnThisDevice_onceToken != -1) {
    dispatch_once(&allPhotosPathsOnThisDevice_onceToken, &__block_literal_global_179);
  }
  v2 = (void *)allPhotosPathsOnThisDevice_bundlePaths;
  return v2;
}

void __58__PLPhotoLibraryPathManagerUBF_allPhotosPathsOnThisDevice__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 0; i != 4; ++i)
  {
    if ((i | 2) == 3)
    {
      v2 = +[PLPhotoLibraryPathManagerCore wellKnownPhotoLibraryURLForIdentifier:i];
      id v3 = v2;
      if (v2)
      {
        id v4 = [v2 path];
        [v0 addObject:v4];
      }
    }
  }
  id v5 = (void *)allPhotosPathsOnThisDevice_bundlePaths;
  allPhotosPathsOnThisDevice_bundlePaths = (uint64_t)v0;
}

@end