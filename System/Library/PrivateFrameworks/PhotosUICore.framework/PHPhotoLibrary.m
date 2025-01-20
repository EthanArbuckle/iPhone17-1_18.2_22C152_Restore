@interface PHPhotoLibrary
@end

@implementation PHPhotoLibrary

PXPhotoLibraryLocalDefaults *__48__PHPhotoLibrary_PhotosUICore__px_localDefaults__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    v2 = [[PXPhotoLibraryLocalDefaults alloc] initWithPhotoLibrary:WeakRetained];
  }
  else {
    v2 = 0;
  }

  return v2;
}

void __50__PHPhotoLibrary_PhotosUICore__px_appPhotoLibrary__block_invoke()
{
  id v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  px_appPhotoLibrary_appProvidesPhotoLibrary = [v0 conformsToProtocol:&unk_1F050E778];
}

PXPeoplePetsHomeVisibilitySource *__59__PHPhotoLibrary_PhotosUICore__px_peoplePetsHomeVisibility__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    v2 = [[PXPeoplePetsHomeVisibilitySource alloc] initWithPhotoLibrary:WeakRetained];
  }
  else {
    v2 = 0;
  }

  return v2;
}

PXPhotoKitVirtualCollections *__53__PHPhotoLibrary_PhotosUICore__px_virtualCollections__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    v2 = [[PXPhotoKitVirtualCollections alloc] initWithPhotoLibrary:WeakRetained];
  }
  else {
    v2 = 0;
  }

  return v2;
}

id __58__PHPhotoLibrary_PhotosUICore__px_rootAlbumCollectionList__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = [MEMORY[0x1E4F39008] fetchRootAlbumCollectionListWithOptions:*(void *)(a1 + 32)];
    v4 = [v3 firstObject];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end