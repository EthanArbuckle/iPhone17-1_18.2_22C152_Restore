@interface PHCollectionList
@end

@implementation PHCollectionList

void __109__PHCollectionList_PhotosUICore__px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__otherAlbumsCollectionDictionary;
  px_otherAlbumsCollectionListIncludeDeleted_includeHidden_includeDuplicates__otherAlbumsCollectionDictionary = (uint64_t)v0;
}

void __79__PHCollectionList_PhotosUICore__px_transientIdentifierForWellKnownFolderName___block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v2[0] = @"media-types";
  v2[1] = @"shared-albums";
  v3[0] = @"PXMediaTypesVirtualCollection";
  v3[1] = @"PXSharedAlbumsAndActivityVirtualCollection";
  v2[2] = @"my-albums";
  v3[2] = @"PXMyAlbumsVirtualCollection";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  v1 = (void *)px_transientIdentifierForWellKnownFolderName__transientIdentifiers;
  px_transientIdentifierForWellKnownFolderName__transientIdentifiers = v0;
}

@end