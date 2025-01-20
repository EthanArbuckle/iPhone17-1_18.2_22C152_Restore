@interface PXPhotosViewLensAllowedActionsForCuratedLens
@end

@implementation PXPhotosViewLensAllowedActionsForCuratedLens

void ___PXPhotosViewLensAllowedActionsForCuratedLens_block_invoke()
{
  v4[43] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"PXAssetCollectionActionTypePersonInfo";
  v4[1] = @"PXPhotosGridActionSetAllLibrariesFilter";
  v4[2] = @"PXPhotosGridActionSetPersonalLibraryFilter";
  v4[3] = @"PXPhotosGridActionSetSharedLibraryFilter";
  v4[4] = @"PXPhotosGridActionToggleSharedLibraryBadge";
  v4[5] = @"PXPhotosGridActionToggleFaceMode";
  v4[6] = @"PXAssetCollectionActionTypePlayMovie";
  v4[7] = @"PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer";
  v4[8] = @"PXAssetCollectionActionTypeRename";
  v4[9] = @"PXAssetCollectionActionTypeCustomize";
  v4[10] = @"PXAssetCollectionActionTypeCustomizeMemory";
  v4[11] = @"PXAssetCollectionActionTypeToggleFavorite";
  v4[12] = @"PXAssetCollectionActionTypeDelete";
  v4[13] = @"PXAssetCollectionActionTypeDeleteMemory";
  v4[14] = @"PXAssetCollectionActionTypeFavoritePerson";
  v4[15] = @"PXAssetCollectionActionTypeCustomizePeopleAlbum";
  v4[16] = @"PXAssetCollectionActionTypeCustomizeSocialGroupAlbum";
  v4[17] = @"PXAssetCollectionActionTypeMoveOut";
  v4[18] = @"PXAssetCollectionActionTypeRemoveSocialGroupFromHome";
  v4[19] = @"PXAssetCollectionActionTypePeopleInternalPromoteAsMagic";
  v4[20] = @"PXAssetCollectionActionTypeBlockPerson";
  v4[21] = @"PXAssetCollectionActionTypeAddPersonToHome";
  v4[22] = @"PXAssetCollectionActionTypeRemovePersonFromHome";
  v4[23] = @"PXAssetCollectionActionTypeChangePersonSortOrder";
  v4[24] = @"PXAssetCollectionActionTypeAddFrom";
  v4[25] = @"PXAssetCollectionActionTypeShowMap";
  v4[26] = @"PXAssetCollectionActionTypeFileRadar";
  v4[27] = @"PXAssetCollectionActionTypeDebugCuration";
  v4[28] = @"PXAssetCollectionActionTypeCopyInternalURL";
  v4[29] = @"PXPhotosGridActionShare";
  v4[30] = @"PXAssetCollectionActionTypeAddPersonToAutoCounter";
  v4[31] = @"PXPhotosGridActionShowFilters";
  v4[32] = @"PXPhotosGridActionUnfilter";
  v4[33] = @"PXPhotosGridActionToggleFavoritesFilter";
  v4[34] = @"PXPhotosGridActionToggleImagesFilter";
  v4[35] = @"PXPhotosGridActionToggleEditedFilter";
  v4[36] = @"PXPhotosGridActionToggleVideosFilter";
  v4[37] = @"PXPhotosGridActionToggleShowOnlyScreenshotsFilter";
  v4[38] = @"PXPhotosGridActionToggleAspectFit";
  v4[39] = @"PXPhotosGridActionSearch";
  v4[40] = @"PXPhotosGridActionToggleIncludeOthersInSocialGroupAssetsFilter";
  v4[41] = @"PXPhotosGridActionTogglePreviewHeader";
  v4[42] = @"PXAssetCollectionActionTypeImprovePeopleRecognition";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:43];
  uint64_t v2 = [v0 setWithArray:v1];
  v3 = (void *)_PXPhotosViewLensAllowedActionsForCuratedLens_allowedActions;
  _PXPhotosViewLensAllowedActionsForCuratedLens_allowedActions = v2;
}

@end