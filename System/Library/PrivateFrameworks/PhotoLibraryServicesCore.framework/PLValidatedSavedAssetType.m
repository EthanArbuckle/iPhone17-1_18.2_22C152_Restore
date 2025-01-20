@interface PLValidatedSavedAssetType
+ (BOOL)allowSavedAssetTypeMutationFrom:(signed __int16)a3 to:(signed __int16)a4;
+ (id)predicateArrayArgumentForMask:(unsigned int)a3;
+ (id)predicateForExcludeMask:(unsigned int)a3 useIndex:(BOOL)a4;
+ (id)predicateForExcludeMask:(unsigned int)a3 useIndex:(BOOL)a4 keyPathPrefix:(id)a5;
+ (id)predicateForExcludeSavedAssetType:(signed __int16)a3;
+ (id)predicateForIncludeMask:(unsigned int)a3 useIndex:(BOOL)a4;
+ (id)predicateForIncludeMask:(unsigned int)a3 useIndex:(BOOL)a4 keyPathPrefix:(id)a5;
+ (id)predicateForIncludeMask:(unsigned int)a3 useIndex:(BOOL)a4 keyPathPrefix:(id)a5 formatPrefix:(id)a6;
+ (id)predicateForIncludeSavedAssetType:(signed __int16)a3;
+ (id)subpredicatesForExcludeMask:(unsigned int)a3;
+ (id)subpredicatesForIncludeMask:(unsigned int)a3;
+ (signed)defaultSavedAssetTypeForConsolidatedAssets;
+ (signed)defaultSavedAssetTypeForLegacyMigration;
+ (signed)defaultSavedAssetTypeForPLAssetsSaver;
+ (signed)defaultSavedAssetTypeForPhotoKitAssetCreationRequest;
+ (signed)defaultSavedAssetTypeForUnknownFilesystemImportAssets;
+ (signed)defaultSavedAssetTypeForUnspecifiedImageWriterJobs;
+ (signed)savedAssetTypeForAssetsInCPLAssetsDirectory;
+ (signed)savedAssetTypeForAwakeFromInsert;
+ (signed)savedAssetTypeForCameraAsset;
+ (signed)savedAssetTypeForCloudPhotoLibraryAsset;
+ (signed)savedAssetTypeForCloudSharedAsset;
+ (signed)savedAssetTypeForCompanionSyncedAsset;
+ (signed)savedAssetTypeForDownloadedPhotoStreamAssets;
+ (signed)savedAssetTypeForDuplicateAsAlternateAsset;
+ (signed)savedAssetTypeForFinderSyncedAsset;
+ (signed)savedAssetTypeForImportedByCameraConnectionKit;
+ (signed)savedAssetTypeForInsertIntoSyndicationLibrary;
+ (signed)savedAssetTypeForMomentSharedAsset;
+ (signed)savedAssetTypeForPhotoBoothAsset;
+ (signed)savedAssetTypeForPhotoStreamPhotoSavedToCameraRoll;
+ (signed)savedAssetTypeForPlaceholder;
+ (signed)savedAssetTypeForPromoteToGuestAsset;
+ (signed)savedAssetTypeForPromoteToUserLibrary;
+ (signed)savedAssetTypeForRecoveredAsset;
+ (signed)savedAssetTypeForReferencedImport;
+ (unint64_t)mapSavedAssetType:(signed __int16)a3 unknown:(unint64_t)a4 photoBooth:(unint64_t)a5 photoStream:(unint64_t)a6 camera:(unint64_t)a7 cloudShared:(unint64_t)a8 cameraConnectionKit:(unint64_t)a9 cloudPhotoLibrary:(unint64_t)a10 wallpaper_UNUSED:(unint64_t)a11 momentShared:(unint64_t)a12 placeholder:(unint64_t)a13 referenced:(unint64_t)a14 alternate:(unint64_t)a15 guest:(unint64_t)a16 companionSynced:(unint64_t)a17 recovered:(unint64_t)a18 legacyImport:(unint64_t)a19 unrecognized:(unint64_t)a20;
+ (unsigned)_maskForCMMMutatingFrom;
+ (unsigned)_maskForCMMMutatingTo;
+ (unsigned)_maskForGuestMutatingFrom;
+ (unsigned)_maskForGuestMutatingTo;
+ (unsigned)_maskForRecoveredMutatingFrom;
+ (unsigned)_maskRecoveredForMutatingTo;
+ (unsigned)maskForAddAssetToLibraryScopeIfShareEverythingPolicyEnabled;
+ (unsigned)maskForAddingLocalVideoKeyFrameResourceExclusions;
+ (unsigned)maskForAllPhotosAlbum;
+ (unsigned)maskForAllowedForAnalysis;
+ (unsigned)maskForAllowedForMediaAnalysis;
+ (unsigned)maskForAllowedToPromoteToGuestAsset;
+ (unsigned)maskForAllowedToPromoteToUserLibrary;
+ (unsigned)maskForAllowedToResetGuestAssetPromotion;
+ (unsigned)maskForAssetStackProcessingExclusions;
+ (unsigned)maskForAssetsAllowingLockedResourceTransfer;
+ (unsigned)maskForAssetsAllowingVirtualFullSizeRender;
+ (unsigned)maskForAssetsEligibleForCloudKitTransport;
+ (unsigned)maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders;
+ (unsigned)maskForAssetsEligibleForFileSystemImportSavedAssetTypeUpdate;
+ (unsigned)maskForAssetsExcludedFromOTARestore;
+ (unsigned)maskForAssetsIncludedInMoments;
+ (unsigned)maskForAutoDeleteAssetsUponMomentShareTrash;
+ (unsigned)maskForAvalancheSupportedAssets;
+ (unsigned)maskForBurstsAlbumExclusions;
+ (unsigned)maskForCameraAsset;
+ (unsigned)maskForCameraConnectionKitAsset;
+ (unsigned)maskForCanDeleteEmptyPathForCorruptAssetsDuringFilesystemImport;
+ (unsigned)maskForCloudPhotoLibraryAsset;
+ (unsigned)maskForCloudPhotoLibrarySizesFromDBExclusions;
+ (unsigned)maskForCloudSharedAsset;
+ (unsigned)maskForCloudSharedBundleScope;
+ (unsigned)maskForCompanionSyncedAsset;
+ (unsigned)maskForCompleteStateIsRelevant;
+ (unsigned)maskForCouldBeStoredInDCIM;
+ (unsigned)maskForCplQuotaExclusions;
+ (unsigned)maskForDuplicateProcessingExclusions;
+ (unsigned)maskForFavoritesAlbumExclusions;
+ (unsigned)maskForFeatureAvailabilityForSceneAnalysis:(BOOL)a3;
+ (unsigned)maskForFinderSyncedAsset;
+ (unsigned)maskForFixIncorrectAddedDateExclusions;
+ (unsigned)maskForFixupAssetPersistenceExclusions;
+ (unsigned)maskForGenerateAddedDateExclusions;
+ (unsigned)maskForGuestAsset;
+ (unsigned)maskForIncludeInCPLCounts;
+ (unsigned)maskForIsValidForBackup;
+ (unsigned)maskForIsValidForFileSystemPersistence;
+ (unsigned)maskForLibraryScopeRuleEvaluationExclusions;
+ (unsigned)maskForMigrateLegacyVideoAdjustmentsExclusions;
+ (unsigned)maskForMomentSharedAsset;
+ (unsigned)maskForNotifyALAssetsLibraryWithChangesCloudSharedExclusions;
+ (unsigned)maskForNotifyALAssetsLibraryWithChangesExclusions;
+ (unsigned)maskForPLFetchingAlbumExclusions;
+ (unsigned)maskForPLSyncClientIncompleteAssetExclusions;
+ (unsigned)maskForPhotoBoothAsset;
+ (unsigned)maskForPhotoStreamAsset;
+ (unsigned)maskForPlaceholderAsset;
+ (unsigned)maskForPlacesAlbum;
+ (unsigned)maskForPopulateFaceRegionsExclusions;
+ (unsigned)maskForRecentlyAddedAlbumExclusions;
+ (unsigned)maskForRecentlyEditedAlbumExclusions;
+ (unsigned)maskForRecoverSupplementalResourcesForAsset;
+ (unsigned)maskForRecoveredAlbum;
+ (unsigned)maskForReferencedAsset;
+ (unsigned)maskForSearchIndexExclusions;
+ (unsigned)maskForSelfiesAlbumExclusions;
+ (unsigned)maskForSharedLibraryExclusions;
+ (unsigned)maskForSmartAlbumExclusions;
+ (unsigned)maskForSocialGroupKeyAssetFetch;
+ (unsigned)maskForStoreDemoContent;
+ (unsigned)maskForSuppressPtpInfo;
+ (unsigned)maskForSyndicationIdentifierFetchExclusions;
+ (unsigned)maskForSyndicationSyncWorkerInSyndicationLibrary;
+ (unsigned)maskForTagScreenshotsExclusions;
+ (unsigned)maskForTriggerRebuildForPathCorruptionExclusions;
+ (unsigned)maskForUpdateMogulSubtypeExclusions;
+ (unsigned)maskForUserLibrary;
+ (unsigned)maskForValidSavedAssetTypesDuringMacMigration;
+ (unsigned)maskForVideosAlbumExclusions;
+ (unsigned)validatedSavedAssetTypeMaskUnknown:(BOOL)a3 photoBooth:(BOOL)a4 photoStream:(BOOL)a5 camera:(BOOL)a6 cloudShared:(BOOL)a7 cameraConnectionKit:(BOOL)a8 cloudPhotoLibrary:(BOOL)a9 wallpaper_UNUSED:(BOOL)a10 momentShared:(BOOL)a11 placeholder:(BOOL)a12 referenced:(BOOL)a13 alternate:(BOOL)a14 guest:(BOOL)a15 companionSynced:(BOOL)a16 recovered:(BOOL)a17 legacyImport:(BOOL)a18;
+ (void)executeBlockForSavedAssetType:(signed __int16)a3 unknown:(id)a4 photoBooth:(id)a5 photoStream:(id)a6 camera:(id)a7 cloudShared:(id)a8 cameraConnectionKit:(id)a9 cloudPhotoLibrary:(id)a10 wallpaper_UNUSED:(id)a11 momentShared:(id)a12 placeholder:(id)a13 referenced:(id)a14 alternate:(id)a15 guest:(id)a16 companionSynced:(id)a17 recovered:(id)a18 legacyImport:(id)a19 unrecognized:(id)a20;
@end

@implementation PLValidatedSavedAssetType

+ (unsigned)maskForCloudSharedAsset
{
  return 16;
}

+ (unsigned)maskForGuestAsset
{
  return 4096;
}

+ (unsigned)maskForPhotoStreamAsset
{
  return 4;
}

+ (id)predicateForExcludeMask:(unsigned int)a3 useIndex:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [a1 predicateArrayArgumentForMask:*(void *)&a3];
  if (v4) {
    v6 = @"NOT (savedAssetType IN %@)";
  }
  else {
    v6 = @"NOT (noindex:(savedAssetType) IN %@)";
  }
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v6, v5);

  return v7;
}

+ (id)predicateForIncludeMask:(unsigned int)a3 useIndex:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [a1 predicateArrayArgumentForMask:*(void *)&a3];
  if (v4) {
    v6 = @"savedAssetType IN %@";
  }
  else {
    v6 = @"noindex:(savedAssetType) IN %@";
  }
  v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v6, v5);

  return v7;
}

+ (id)predicateArrayArgumentForMask:(unsigned int)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PLValidatedSavedAssetType_predicateArrayArgumentForMask___block_invoke;
  v9[3] = &unk_1E589FB40;
  id v5 = v4;
  id v10 = v5;
  v6 = v9;
  uint64_t v7 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v12 = __PLValidatedSavedAssetTypeForEnabledTypesExecuteBlock_block_invoke;
  v13 = &unk_1E589FB68;
  unsigned int v15 = a3;
  id v14 = v6;
  do
    v12((uint64_t)v11, word_19BDC7300[v7++]);
  while (v7 != 16);

  return v5;
}

+ (id)subpredicatesForExcludeMask:(unsigned int)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v10 = __57__PLValidatedSavedAssetType_subpredicatesForExcludeMask___block_invoke;
  v11 = &unk_1E589FB18;
  unsigned int v14 = a3;
  id v6 = v5;
  uint64_t v7 = 0;
  id v12 = v6;
  id v13 = a1;
  do
    v10((uint64_t)v9, word_19BDC7300[v7++]);
  while (v7 != 16);

  return v6;
}

void __57__PLValidatedSavedAssetType_subpredicatesForExcludeMask___block_invoke(uint64_t a1, uint64_t a2)
{
  if (PLValidatedSavedAssetTypeApplies(*(_DWORD *)(a1 + 48), a2))
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) predicateForExcludeSavedAssetType:a2];
    [v4 addObject:v5];
  }
}

+ (id)predicateForExcludeSavedAssetType:(signed __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(savedAssetType) != %d", a3);
}

void __59__PLValidatedSavedAssetType_predicateArrayArgumentForMask___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28ED0] numberWithShort:a2];
  [v2 addObject:v3];
}

+ (unsigned)maskForPlacesAlbum
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 0, 1, 0x1010101010001, v3);
}

+ (unsigned)maskForFavoritesAlbumExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x10001010000, v3);
}

+ (unsigned)maskForVideosAlbumExclusions
{
  return [a1 maskForPLFetchingAlbumExclusions] | 4;
}

+ (unsigned)maskForAllPhotosAlbum
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 0, 1, 0x101000100000001, v3);
}

+ (unsigned)maskForPLFetchingAlbumExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForRecoveredAlbum
{
  return 0x4000;
}

+ (unsigned)maskForFinderSyncedAsset
{
  return 0x8000;
}

+ (unsigned)maskForSelfiesAlbumExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForSocialGroupKeyAssetFetch
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 1, 1, 0x100000001, v3);
}

+ (unsigned)maskForFeatureAvailabilityForSceneAnalysis:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [a1 maskForUserLibrary];
  if (v3) {
    int v5 = 32784;
  }
  else {
    int v5 = 0x8000;
  }
  return v4 | v5;
}

+ (unsigned)maskForCplQuotaExclusions
{
  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x101010101010000, v3);
}

+ (unsigned)maskForAssetsAllowingVirtualFullSizeRender
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x100000001, v3);
}

+ (unsigned)maskForAssetsAllowingLockedResourceTransfer
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 1, v3);
}

+ (unsigned)maskForAssetStackProcessingExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x101010001010100, v3);
}

+ (unsigned)maskForDuplicateProcessingExclusions
{
  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x101010101010100, v3);
}

+ (unsigned)maskForSyndicationIdentifierFetchExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 16842752, v3);
}

+ (unsigned)maskForSyndicationSyncWorkerInSyndicationLibrary
{
  int v3 = [a1 maskForAllowedToPromoteToGuestAsset];
  return [a1 maskForGuestAsset] | v3;
}

+ (unsigned)maskForAllowedToPromoteToUserLibrary
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x1000000000000, v3);
}

+ (unsigned)maskForAllowedToResetGuestAssetPromotion
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 1, 0, 0, 0x1000000000000, v3);
}

+ (unsigned)maskForAllowedToPromoteToGuestAsset
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 1, 0, 0, 0x1000000000000, v3);
}

+ (unsigned)maskForLibraryScopeRuleEvaluationExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x100010001010000, v3);
}

+ (unsigned)maskForCompleteStateIsRelevant
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x101000100000101, v3);
}

+ (unsigned)maskForSuppressPtpInfo
{
  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x10000010100, v3);
}

+ (unsigned)maskForRecoverSupplementalResourcesForAsset
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 0, 0, 1, 0, 1, 0x101000000000000, v3);
}

+ (unsigned)maskForIsValidForFileSystemPersistence
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 0, 1, 0x100010000000101, v3);
}

+ (unsigned)maskForIsValidForBackup
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 1, 1, 1, 1, 1, 0x101010100010001, v3);
}

+ (unsigned)maskForSearchIndexExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForCloudPhotoLibrarySizesFromDBExclusions
{
  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x101010000000000, v3);
}

+ (unsigned)maskForAssetsExcludedFromOTARestore
{
  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 16843008, v3);
}

+ (unsigned)maskForNotifyALAssetsLibraryWithChangesCloudSharedExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForNotifyALAssetsLibraryWithChangesExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x1000000, v3);
}

+ (unsigned)maskForUpdateMogulSubtypeExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x100000000, v3);
}

+ (unsigned)maskForAddingLocalVideoKeyFrameResourceExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0, v3);
}

+ (unsigned)maskForFixupAssetPersistenceExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForTagScreenshotsExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForFixIncorrectAddedDateExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForGenerateAddedDateExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForPopulateFaceRegionsExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842752, v3);
}

+ (unsigned)maskForCanDeleteEmptyPathForCorruptAssetsDuringFilesystemImport
{
  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 0, 1, 0x101010000000100, v3);
}

+ (unsigned)maskForTriggerRebuildForPathCorruptionExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0, v3);
}

+ (unsigned)maskForAutoDeleteAssetsUponMomentShareTrash
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 16842752, v3);
}

+ (unsigned)maskForAllowedForMediaAnalysis
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x1000100000001, v3);
}

+ (unsigned)maskForAllowedForAnalysis
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x1010100000001, v3);
}

+ (unsigned)maskForIncludeInCPLCounts
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 1, 1, 1, v3);
}

+ (unsigned)maskForAddAssetToLibraryScopeIfShareEverythingPolicyEnabled
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 1, 0, 1, 1, v3);
}

+ (unsigned)maskForPLSyncClientIncompleteAssetExclusions
{
  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 1, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForStoreDemoContent
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 1, 0, 0, 0x100000000000001, v3);
}

+ (unsigned)maskForValidSavedAssetTypesDuringMacMigration
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 1, 1, 0x101010100010001, v3);
}

+ (unsigned)maskForMigrateLegacyVideoAdjustmentsExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 16842753, v3);
}

+ (unsigned)maskForCouldBeStoredInDCIM
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x101010000000001, v3);
}

+ (unsigned)maskForSharedLibraryExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForAssetsEligibleForFileSystemImportSavedAssetTypeUpdate
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 0, 0, 1, 0, 1, 1, v3);
}

+ (unsigned)maskForRecentlyEditedAlbumExclusions
{
  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x100010001010000, v3);
}

+ (unsigned)maskForBurstsAlbumExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 0, 0, 0x10001010000, v3);
}

+ (unsigned)maskForRecentlyAddedAlbumExclusions
{
  LOWORD(v3) = 257;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10001010000, v3);
}

+ (unsigned)maskForSmartAlbumExclusions
{
  LOWORD(v3) = 1;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 0, 1, 0, 0x10000, v3);
}

+ (unsigned)maskForAvalancheSupportedAssets
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 0, 0, 0, 1, 0, 1, 0x10100000001, v3);
}

+ (unsigned)maskForAssetsIncludedInMoments
{
  LOWORD(v3) = 256;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 1, 1, 0, 1, 0x1000100000001, v3);
}

+ (unsigned)maskForCompanionSyncedAsset
{
  return 0x2000;
}

+ (unsigned)maskForReferencedAsset
{
  return 1024;
}

+ (unsigned)maskForCloudSharedBundleScope
{
  return 16;
}

+ (unsigned)maskForCloudPhotoLibraryAsset
{
  return 64;
}

+ (unsigned)maskForPlaceholderAsset
{
  return 512;
}

+ (unsigned)maskForMomentSharedAsset
{
  return 256;
}

+ (unsigned)maskForPhotoBoothAsset
{
  return 2;
}

+ (unsigned)maskForCameraConnectionKitAsset
{
  return 32;
}

+ (unsigned)maskForCameraAsset
{
  return 8;
}

+ (unsigned)maskForAssetsEligibleForCloudKitTransportWithoutMomentSharesAndPlaceholders
{
  return [a1 maskForAssetsEligibleForCloudKitTransport] & 0xFFFFFCFF;
}

+ (unsigned)maskForAssetsEligibleForCloudKitTransport
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 16842753, v3);
}

+ (unsigned)maskForUserLibrary
{
  LOWORD(v3) = 0;
  return objc_msgSend(a1, "validatedSavedAssetTypeMaskUnknown:photoBooth:photoStream:camera:cloudShared:cameraConnectionKit:cloudPhotoLibrary:wallpaper_UNUSED:momentShared:placeholder:referenced:alternate:guest:companionSynced:recovered:legacyImport:", 1, 1, 0, 1, 0, 1, 0x100000001, v3);
}

+ (id)subpredicatesForIncludeMask:(unsigned int)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  id v10 = __57__PLValidatedSavedAssetType_subpredicatesForIncludeMask___block_invoke;
  v11 = &unk_1E589FB18;
  unsigned int v14 = a3;
  id v6 = v5;
  uint64_t v7 = 0;
  id v12 = v6;
  id v13 = a1;
  do
    v10((uint64_t)v9, word_19BDC7300[v7++]);
  while (v7 != 16);

  return v6;
}

void __57__PLValidatedSavedAssetType_subpredicatesForIncludeMask___block_invoke(uint64_t a1, uint64_t a2)
{
  if (PLValidatedSavedAssetTypeApplies(*(_DWORD *)(a1 + 48), a2))
  {
    int v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) predicateForIncludeSavedAssetType:a2];
    [v4 addObject:v5];
  }
}

+ (id)predicateForExcludeMask:(unsigned int)a3 useIndex:(BOOL)a4 keyPathPrefix:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v9 = [a1 predicateArrayArgumentForMask:v6];
  if (v5) {
    id v10 = @"NOT %K.savedAssetType IN %@";
  }
  else {
    id v10 = @"NOT noindex:(%K.savedAssetType) IN %@";
  }
  v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v10, v8, v9);

  return v11;
}

+ (id)predicateForIncludeMask:(unsigned int)a3 useIndex:(BOOL)a4 keyPathPrefix:(id)a5 formatPrefix:(id)a6
{
  BOOL v7 = a4;
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [a1 predicateArrayArgumentForMask:v8];
  id v13 = @"noindex:(%K.savedAssetType) IN %@";
  if (v7) {
    id v13 = @"%K.savedAssetType IN %@";
  }
  unsigned int v14 = v13;
  if (v11)
  {
    uint64_t v15 = [NSString stringWithFormat:@"%@ %@", v11, v14];

    unsigned int v14 = (__CFString *)v15;
  }
  v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v14, v10, v12);

  return v16;
}

+ (id)predicateForIncludeMask:(unsigned int)a3 useIndex:(BOOL)a4 keyPathPrefix:(id)a5
{
  return +[PLValidatedSavedAssetType predicateForIncludeMask:*(void *)&a3 useIndex:a4 keyPathPrefix:a5 formatPrefix:0];
}

+ (id)predicateForIncludeSavedAssetType:(signed __int16)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(savedAssetType) == %d", a3);
}

+ (signed)savedAssetTypeForRecoveredAsset
{
  return 14;
}

+ (signed)savedAssetTypeForPromoteToUserLibrary
{
  return 3;
}

+ (signed)savedAssetTypeForCompanionSyncedAsset
{
  return 13;
}

+ (signed)savedAssetTypeForPromoteToGuestAsset
{
  return 12;
}

+ (signed)savedAssetTypeForInsertIntoSyndicationLibrary
{
  return 3;
}

+ (signed)savedAssetTypeForPhotoBoothAsset
{
  return 1;
}

+ (signed)savedAssetTypeForCameraAsset
{
  return 3;
}

+ (signed)savedAssetTypeForAwakeFromInsert
{
  return 0;
}

+ (signed)savedAssetTypeForCloudSharedAsset
{
  return 4;
}

+ (signed)savedAssetTypeForCloudPhotoLibraryAsset
{
  return 6;
}

+ (signed)savedAssetTypeForMomentSharedAsset
{
  return 8;
}

+ (signed)savedAssetTypeForAssetsInCPLAssetsDirectory
{
  return 6;
}

+ (signed)savedAssetTypeForFinderSyncedAsset
{
  return 256;
}

+ (signed)savedAssetTypeForPlaceholder
{
  return 9;
}

+ (signed)savedAssetTypeForReferencedImport
{
  return 10;
}

+ (signed)savedAssetTypeForDuplicateAsAlternateAsset
{
  return 11;
}

+ (signed)savedAssetTypeForImportedByCameraConnectionKit
{
  return 5;
}

+ (signed)savedAssetTypeForPhotoStreamPhotoSavedToCameraRoll
{
  return 3;
}

+ (signed)savedAssetTypeForDownloadedPhotoStreamAssets
{
  return 2;
}

+ (signed)defaultSavedAssetTypeForLegacyMigration
{
  return 0;
}

+ (signed)defaultSavedAssetTypeForUnknownFilesystemImportAssets
{
  return 3;
}

+ (signed)defaultSavedAssetTypeForPLAssetsSaver
{
  return 3;
}

+ (signed)defaultSavedAssetTypeForUnspecifiedImageWriterJobs
{
  return 0;
}

+ (signed)defaultSavedAssetTypeForConsolidatedAssets
{
  return 0;
}

+ (signed)defaultSavedAssetTypeForPhotoKitAssetCreationRequest
{
  return 3;
}

+ (unsigned)_maskForGuestMutatingTo
{
  return 4096;
}

+ (unsigned)_maskForGuestMutatingFrom
{
  return 8;
}

+ (unsigned)_maskRecoveredForMutatingTo
{
  return [a1 maskForAssetsEligibleForFileSystemImportSavedAssetTypeUpdate] & 0xFFFF7FFE | 0x8000;
}

+ (unsigned)_maskForRecoveredMutatingFrom
{
  return [a1 maskForAssetsEligibleForFileSystemImportSavedAssetTypeUpdate] | 0x4000;
}

+ (unsigned)_maskForCMMMutatingTo
{
  return 328;
}

+ (unsigned)_maskForCMMMutatingFrom
{
  return 512;
}

+ (BOOL)allowSavedAssetTypeMutationFrom:(signed __int16)a3 to:(signed __int16)a4
{
  if (!a3) {
    return 1;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (a3 == a4
    || PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskForCMMMutatingFrom](PLValidatedSavedAssetType, "_maskForCMMMutatingFrom"), a3)&& (PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskForCMMMutatingTo], v4) & 1) != 0)
  {
    return 1;
  }
  if PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskForRecoveredMutatingFrom](PLValidatedSavedAssetType, "_maskForRecoveredMutatingFrom"), v5)&& (PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskRecoveredForMutatingTo](PLValidatedSavedAssetType, "_maskRecoveredForMutatingTo"), v4) & 1) != 0|| PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskForGuestMutatingFrom](PLValidatedSavedAssetType, "_maskForGuestMutatingFrom"), v5)&& (PLValidatedSavedAssetTypeApplies(+[PLValidatedSavedAssetType _maskForGuestMutatingTo], v4))
  {
    return 1;
  }
  return PFProcessIsLaunchedToExecuteTests();
}

+ (void)executeBlockForSavedAssetType:(signed __int16)a3 unknown:(id)a4 photoBooth:(id)a5 photoStream:(id)a6 camera:(id)a7 cloudShared:(id)a8 cameraConnectionKit:(id)a9 cloudPhotoLibrary:(id)a10 wallpaper_UNUSED:(id)a11 momentShared:(id)a12 placeholder:(id)a13 referenced:(id)a14 alternate:(id)a15 guest:(id)a16 companionSynced:(id)a17 recovered:(id)a18 legacyImport:(id)a19 unrecognized:(id)a20
{
  int v35 = a3;
  v44 = (void (**)(void))a4;
  id v37 = a5;
  id v36 = a6;
  v24 = (void (**)(void))a7;
  v25 = (void (**)(void))a8;
  v43 = (void (**)(void))a9;
  v42 = (void (**)(void))a10;
  v41 = (void (**)(void))a11;
  v40 = (void (**)(void))a12;
  v39 = (void (**)(void))a13;
  v38 = (void (**)(void))a14;
  v26 = (void (**)(void))a15;
  v27 = (void (**)(void))a16;
  v28 = (void (**)(void))a17;
  v29 = (void (**)(void))a18;
  v30 = (void (**)(void))a19;
  v31 = (void (**)(void))a20;
  v32 = v44;
  v34 = v36;
  v33 = v37;
  switch(v35)
  {
    case 0:
      break;
    case 1:
      v32 = (void (**)(void))v37;
      break;
    case 2:
      v32 = (void (**)(void))v36;
      break;
    case 3:
      v32 = v24;
      break;
    case 4:
      v32 = v25;
      break;
    case 5:
      v32 = v43;
      break;
    case 6:
      v32 = v42;
      break;
    case 7:
      v32 = v41;
      break;
    case 8:
      v32 = v40;
      break;
    case 9:
      v32 = v39;
      break;
    case 10:
      v32 = v38;
      break;
    case 11:
      v32 = v26;
      break;
    case 12:
      v32 = v27;
      break;
    case 13:
      v32 = v28;
      break;
    case 14:
      v32 = v29;
      break;
    default:
      v32 = v30;
      v34 = v36;
      v33 = v37;
      if (v35 != 256) {
        v32 = v31;
      }
      break;
  }
  v32[2]();
}

+ (unint64_t)mapSavedAssetType:(signed __int16)a3 unknown:(unint64_t)a4 photoBooth:(unint64_t)a5 photoStream:(unint64_t)a6 camera:(unint64_t)a7 cloudShared:(unint64_t)a8 cameraConnectionKit:(unint64_t)a9 cloudPhotoLibrary:(unint64_t)a10 wallpaper_UNUSED:(unint64_t)a11 momentShared:(unint64_t)a12 placeholder:(unint64_t)a13 referenced:(unint64_t)a14 alternate:(unint64_t)a15 guest:(unint64_t)a16 companionSynced:(unint64_t)a17 recovered:(unint64_t)a18 legacyImport:(unint64_t)a19 unrecognized:(unint64_t)a20
{
  int v20 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      return a4;
    case 1:
      a4 = a5;
      break;
    case 2:
      a4 = a6;
      break;
    case 3:
      a4 = a7;
      break;
    case 4:
      a4 = a8;
      break;
    case 5:
      a4 = a9;
      break;
    case 6:
      a4 = a10;
      break;
    case 7:
      a4 = a11;
      break;
    case 8:
      a4 = a12;
      break;
    case 9:
      a4 = a13;
      break;
    case 10:
      a4 = a14;
      break;
    case 11:
      a4 = a15;
      break;
    case 12:
      a4 = a16;
      break;
    case 13:
      a4 = a17;
      break;
    case 14:
      a4 = a18;
      break;
    default:
      if (a3 == 256)
      {
        a4 = a19;
      }
      else
      {
        a4 = a20;
        v22 = PLBackendGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          v24[0] = 67109376;
          v24[1] = v20;
          __int16 v25 = 2048;
          unint64_t v26 = a20;
          _os_log_impl(&dword_19BCFB000, v22, OS_LOG_TYPE_FAULT, "Unexpected savedAssetType %d, returning %tu", (uint8_t *)v24, 0x12u);
        }
      }
      break;
  }
  return a4;
}

+ (unsigned)validatedSavedAssetTypeMaskUnknown:(BOOL)a3 photoBooth:(BOOL)a4 photoStream:(BOOL)a5 camera:(BOOL)a6 cloudShared:(BOOL)a7 cameraConnectionKit:(BOOL)a8 cloudPhotoLibrary:(BOOL)a9 wallpaper_UNUSED:(BOOL)a10 momentShared:(BOOL)a11 placeholder:(BOOL)a12 referenced:(BOOL)a13 alternate:(BOOL)a14 guest:(BOOL)a15 companionSynced:(BOOL)a16 recovered:(BOOL)a17 legacyImport:(BOOL)a18
{
  if (a4) {
    int v18 = 2;
  }
  else {
    int v18 = 0;
  }
  int v19 = v18 | a3;
  if (a5) {
    int v20 = 4;
  }
  else {
    int v20 = 0;
  }
  if (a6) {
    int v21 = 8;
  }
  else {
    int v21 = 0;
  }
  int v22 = v19 | v20 | v21;
  if (a7) {
    int v23 = 16;
  }
  else {
    int v23 = 0;
  }
  if (a8) {
    int v24 = 32;
  }
  else {
    int v24 = 0;
  }
  if (a9) {
    int v25 = 64;
  }
  else {
    int v25 = 0;
  }
  int v26 = v22 | v23 | v24;
  if (a10) {
    int v27 = 128;
  }
  else {
    int v27 = 0;
  }
  if (a11) {
    int v28 = 256;
  }
  else {
    int v28 = 0;
  }
  if (a12) {
    int v29 = 512;
  }
  else {
    int v29 = 0;
  }
  if (a13) {
    int v30 = 1024;
  }
  else {
    int v30 = 0;
  }
  if (a14) {
    int v31 = 2048;
  }
  else {
    int v31 = 0;
  }
  if (a15) {
    int v32 = 4096;
  }
  else {
    int v32 = 0;
  }
  if (a16) {
    int v33 = 0x2000;
  }
  else {
    int v33 = 0;
  }
  if (a17) {
    int v34 = 0x4000;
  }
  else {
    int v34 = 0;
  }
  if (a18) {
    int v35 = 0x8000;
  }
  else {
    int v35 = 0;
  }
  return v26 | v25 | v27 | v28 | v29 | v30 | v31 | v32 | v33 | v34 | v35;
}

@end