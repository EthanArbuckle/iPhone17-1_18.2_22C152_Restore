@interface PUSessionInfo
- (BOOL)allowSelectingNonEditableAlbums;
- (BOOL)allowsMultipleSelection;
- (BOOL)allowsSwipeToSelect;
- (BOOL)excludesHiddenAlbum;
- (BOOL)excludesNewAlbumCreation;
- (BOOL)excludesSharedAlbums;
- (BOOL)hasClearBackgroundColor;
- (BOOL)isForAlbumPicker;
- (BOOL)isForAssetPicker;
- (BOOL)isLimitedLibraryPicker;
- (BOOL)isSelectingAssets;
- (BOOL)isSelectingTargetAlbum;
- (BOOL)reverseSortOrder;
- (BOOL)scrollToSourceAlbumWhenPresented;
- (BOOL)showCheckmarkOnSourceAlbum;
- (BOOL)showsFileSizePicker;
- (BOOL)wantsNumberedSelectionStyle;
- (NSOrderedSet)transferredAssets;
- (NSPredicate)assetsFilterPredicate;
- (NSString)localizedPrompt;
- (NSString)pickerClientBundleIdentifier;
- (NSString)targetAlbumName;
- (PHAssetCollection)sourceAlbum;
- (PHAssetCollection)targetAlbum;
- (PUPhotoSelectionManager)photoSelectionManager;
- (PUSessionInfo)init;
- (PXLoadingStatusManager)loadingStatusManager;
- (PXPhotosViewDelegate)photosViewDelegate;
- (PXSelectionCoordinator)selectionCoordinator;
- (id)bannerGenerator;
- (int64_t)contentStartingPosition;
- (int64_t)noContentPlaceholderType;
- (int64_t)promptLocation;
- (int64_t)status;
- (unint64_t)assetTypesToInclude;
- (void)_enumerateObserversWithBlock:(id)a3;
- (void)addSessionInfoObserver:(id)a3;
- (void)photoSelectionManagerSelectionDidChange:(id)a3;
- (void)removeSessionInfoObserver:(id)a3;
- (void)setAllowSelectingNonEditableAlbums:(BOOL)a3;
- (void)setAllowsMultipleSelection:(BOOL)a3;
- (void)setAllowsSwipeToSelect:(BOOL)a3;
- (void)setAssetTypesToInclude:(unint64_t)a3;
- (void)setAssetsFilterPredicate:(id)a3;
- (void)setBannerGenerator:(id)a3;
- (void)setContentStartingPosition:(int64_t)a3;
- (void)setExcludesHiddenAlbum:(BOOL)a3;
- (void)setExcludesNewAlbumCreation:(BOOL)a3;
- (void)setExcludesSharedAlbums:(BOOL)a3;
- (void)setHasClearBackgroundColor:(BOOL)a3;
- (void)setLoadingStatusManager:(id)a3;
- (void)setLocalizedPrompt:(id)a3;
- (void)setNoContentPlaceholderType:(int64_t)a3;
- (void)setPhotoSelectionManager:(id)a3;
- (void)setPhotosViewDelegate:(id)a3;
- (void)setPickerClientBundleIdentifier:(id)a3;
- (void)setPromptLocation:(int64_t)a3;
- (void)setReverseSortOrder:(BOOL)a3;
- (void)setScrollToSourceAlbumWhenPresented:(BOOL)a3;
- (void)setSelectingTargetAlbum:(BOOL)a3;
- (void)setSelectionCoordinator:(id)a3;
- (void)setShowCheckmarkOnSourceAlbum:(BOOL)a3;
- (void)setShowsFileSizePicker:(BOOL)a3;
- (void)setSourceAlbum:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTargetAlbum:(id)a3;
- (void)setTargetAlbumName:(id)a3;
- (void)setTransferredAssets:(id)a3;
- (void)setWantsNumberedSelectionStyle:(BOOL)a3;
@end

@implementation PUSessionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerClientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_selectionCoordinator, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_destroyWeak((id *)&self->_photosViewDelegate);
  objc_storeStrong(&self->_bannerGenerator, 0);
  objc_storeStrong((id *)&self->_localizedPrompt, 0);
  objc_storeStrong((id *)&self->_assetsFilterPredicate, 0);
  objc_storeStrong((id *)&self->_targetAlbumName, 0);
  objc_storeStrong((id *)&self->_targetAlbum, 0);
  objc_storeStrong((id *)&self->_transferredAssets, 0);
  objc_storeStrong((id *)&self->_sourceAlbum, 0);
  objc_storeStrong((id *)&self->_photoSelectionManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)setPickerClientBundleIdentifier:(id)a3
{
}

- (NSString)pickerClientBundleIdentifier
{
  return self->_pickerClientBundleIdentifier;
}

- (void)setSelectionCoordinator:(id)a3
{
}

- (PXSelectionCoordinator)selectionCoordinator
{
  return self->_selectionCoordinator;
}

- (void)setLoadingStatusManager:(id)a3
{
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (void)setPhotosViewDelegate:(id)a3
{
}

- (PXPhotosViewDelegate)photosViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_photosViewDelegate);
  return (PXPhotosViewDelegate *)WeakRetained;
}

- (BOOL)isForAlbumPicker
{
  return self->_isForAlbumPicker;
}

- (BOOL)isLimitedLibraryPicker
{
  return self->_isLimitedLibraryPicker;
}

- (BOOL)isForAssetPicker
{
  return self->_isForAssetPicker;
}

- (void)setContentStartingPosition:(int64_t)a3
{
  self->_contentStartingPosition = a3;
}

- (int64_t)contentStartingPosition
{
  return self->_contentStartingPosition;
}

- (void)setReverseSortOrder:(BOOL)a3
{
  self->_reverseSortOrder = a3;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (void)setExcludesNewAlbumCreation:(BOOL)a3
{
  self->_excludesNewAlbumCreation = a3;
}

- (BOOL)excludesNewAlbumCreation
{
  return self->_excludesNewAlbumCreation;
}

- (void)setExcludesHiddenAlbum:(BOOL)a3
{
  self->_excludesHiddenAlbum = a3;
}

- (BOOL)excludesHiddenAlbum
{
  return self->_excludesHiddenAlbum;
}

- (void)setExcludesSharedAlbums:(BOOL)a3
{
  self->_excludesSharedAlbums = a3;
}

- (BOOL)excludesSharedAlbums
{
  return self->_excludesSharedAlbums;
}

- (void)setAllowsSwipeToSelect:(BOOL)a3
{
  self->_allowsSwipeToSelect = a3;
}

- (BOOL)allowsSwipeToSelect
{
  return self->_allowsSwipeToSelect;
}

- (void)setHasClearBackgroundColor:(BOOL)a3
{
  self->_hasClearBackgroundColor = a3;
}

- (BOOL)hasClearBackgroundColor
{
  return self->_hasClearBackgroundColor;
}

- (void)setShowsFileSizePicker:(BOOL)a3
{
  self->_showsFileSizePicker = a3;
}

- (BOOL)showsFileSizePicker
{
  return self->_showsFileSizePicker;
}

- (void)setAllowsMultipleSelection:(BOOL)a3
{
  self->_allowsMultipleSelection = a3;
}

- (BOOL)allowsMultipleSelection
{
  return self->_allowsMultipleSelection;
}

- (void)setNoContentPlaceholderType:(int64_t)a3
{
  self->_noContentPlaceholderType = a3;
}

- (int64_t)noContentPlaceholderType
{
  return self->_noContentPlaceholderType;
}

- (void)setWantsNumberedSelectionStyle:(BOOL)a3
{
  self->_wantsNumberedSelectionStyle = a3;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (id)bannerGenerator
{
  return self->_bannerGenerator;
}

- (void)setPromptLocation:(int64_t)a3
{
  self->_promptLocation = a3;
}

- (int64_t)promptLocation
{
  return self->_promptLocation;
}

- (void)setLocalizedPrompt:(id)a3
{
}

- (NSString)localizedPrompt
{
  return self->_localizedPrompt;
}

- (void)setAssetTypesToInclude:(unint64_t)a3
{
  self->_assetTypesToInclude = a3;
}

- (unint64_t)assetTypesToInclude
{
  return self->_assetTypesToInclude;
}

- (void)setAssetsFilterPredicate:(id)a3
{
}

- (NSPredicate)assetsFilterPredicate
{
  return self->_assetsFilterPredicate;
}

- (void)setTargetAlbumName:(id)a3
{
}

- (NSString)targetAlbumName
{
  return self->_targetAlbumName;
}

- (void)setTargetAlbum:(id)a3
{
}

- (PHAssetCollection)targetAlbum
{
  return self->_targetAlbum;
}

- (void)setTransferredAssets:(id)a3
{
}

- (NSOrderedSet)transferredAssets
{
  return self->_transferredAssets;
}

- (void)setScrollToSourceAlbumWhenPresented:(BOOL)a3
{
  self->_scrollToSourceAlbumWhenPresented = a3;
}

- (BOOL)scrollToSourceAlbumWhenPresented
{
  return self->_scrollToSourceAlbumWhenPresented;
}

- (void)setShowCheckmarkOnSourceAlbum:(BOOL)a3
{
  self->_showCheckmarkOnSourceAlbum = a3;
}

- (BOOL)showCheckmarkOnSourceAlbum
{
  return self->_showCheckmarkOnSourceAlbum;
}

- (void)setSourceAlbum:(id)a3
{
}

- (PHAssetCollection)sourceAlbum
{
  return self->_sourceAlbum;
}

- (PUPhotoSelectionManager)photoSelectionManager
{
  return self->_photoSelectionManager;
}

- (void)setSelectingTargetAlbum:(BOOL)a3
{
  self->_selectingTargetAlbum = a3;
}

- (BOOL)isSelectingTargetAlbum
{
  return self->_selectingTargetAlbum;
}

- (void)setAllowSelectingNonEditableAlbums:(BOOL)a3
{
  self->_allowSelectingNonEditableAlbums = a3;
}

- (BOOL)allowSelectingNonEditableAlbums
{
  return self->_allowSelectingNonEditableAlbums;
}

- (int64_t)status
{
  return self->_status;
}

- (void)photoSelectionManagerSelectionDidChange:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PUSessionInfo_photoSelectionManagerSelectionDidChange___block_invoke;
  v3[3] = &unk_1E5F2BF28;
  v3[4] = self;
  [(PUSessionInfo *)self _enumerateObserversWithBlock:v3];
}

void __57__PUSessionInfo_photoSelectionManagerSelectionDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sessionInfoPhotoSelectionDidChange:*(void *)(a1 + 32)];
  }
}

- (void)setBannerGenerator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_bannerGenerator == v4) {
      goto LABEL_6;
    }
    id v7 = v4;
  }
  else
  {
    id v7 = 0;
    id v4 = &__block_literal_global_84846;
  }
  v5 = (void *)[v4 copy];
  id bannerGenerator = self->_bannerGenerator;
  self->_id bannerGenerator = v5;

  id v4 = v7;
LABEL_6:
}

uint64_t __36__PUSessionInfo_setBannerGenerator___block_invoke()
{
  return 0;
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  v6 = (void (**)(id, void *))a3;
  if ([(NSPointerArray *)self->_observers count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [(NSPointerArray *)self->_observers pointerAtIndex:v4];
      v6[2](v6, v5);

      ++v4;
    }
    while (v4 < [(NSPointerArray *)self->_observers count]);
  }
}

- (void)setPhotoSelectionManager:(id)a3
{
  v5 = (PUPhotoSelectionManager *)a3;
  photoSelectionManager = self->_photoSelectionManager;
  if (photoSelectionManager != v5)
  {
    id v7 = v5;
    [(PUPhotoSelectionManager *)photoSelectionManager unregisterChangeObserver:self];
    objc_storeStrong((id *)&self->_photoSelectionManager, a3);
    [(PUPhotoSelectionManager *)self->_photoSelectionManager registerChangeObserver:self];
    v5 = v7;
  }
}

- (void)setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __27__PUSessionInfo_setStatus___block_invoke;
    v3[3] = &unk_1E5F2BF28;
    v3[4] = self;
    [(PUSessionInfo *)self _enumerateObserversWithBlock:v3];
  }
}

void __27__PUSessionInfo_setStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sessionInfoStatusDidChange:*(void *)(a1 + 32)];
  }
}

- (void)removeSessionInfoObserver:(id)a3
{
  id v5 = a3;
  if ([(NSPointerArray *)self->_observers count])
  {
    uint64_t v4 = 0;
    while ([(NSPointerArray *)self->_observers pointerAtIndex:v4] != v5)
    {
      if (++v4 >= [(NSPointerArray *)self->_observers count]) {
        goto LABEL_7;
      }
    }
    [(NSPointerArray *)self->_observers removePointerAtIndex:v4];
  }
LABEL_7:
}

- (void)addSessionInfoObserver:(id)a3
{
}

- (BOOL)isSelectingAssets
{
  return 0;
}

- (PUSessionInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUSessionInfo;
  v2 = [(PUSessionInfo *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

    v2->_allowsSwipeToSelect = 1;
    [(PUSessionInfo *)v2 setBannerGenerator:0];
  }
  return v2;
}

@end