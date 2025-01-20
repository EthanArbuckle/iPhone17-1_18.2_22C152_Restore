@interface PHPhotoLibrary(CountsManager)
- (PXSharedLibrarySharingSuggestionsCountsManager)px_sharedLibrarySharingSuggestionsCountsManager;
@end

@implementation PHPhotoLibrary(CountsManager)

- (PXSharedLibrarySharingSuggestionsCountsManager)px_sharedLibrarySharingSuggestionsCountsManager
{
  id v1 = a1;
  objc_sync_enter(v1);
  objc_getAssociatedObject(v1, sel_px_sharedLibrarySharingSuggestionsCountsManager);
  v2 = (PXSharedLibrarySharingSuggestionsCountsManager *)objc_claimAutoreleasedReturnValue();
  if (!v2) {
    v2 = [[PXSharedLibrarySharingSuggestionsCountsManager alloc] initWithPhotoLibrary:v1];
  }
  objc_setAssociatedObject(v1, sel_px_sharedLibrarySharingSuggestionsCountsManager, v2, (void *)0x301);
  objc_sync_exit(v1);

  return v2;
}

@end