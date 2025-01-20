@interface PUIMediaLibraryStorageController
+ (PUIMediaLibraryStorageController)shared;
- (BOOL)shouldDisplayStorageCleanupTip;
- (PUIMediaLibraryStorageController)init;
- (int64_t)observeStorageCleanupChange:(id)a3;
- (void)dealloc;
- (void)ignoreStorageCleanupPrompt;
- (void)mediaLibraryDidChange;
- (void)refreshDownloadedAssets;
- (void)removeStorageCleanupChangeObserverWith:(int64_t)a3;
- (void)setShouldDisplayStorageCleanupTip:(BOOL)a3;
@end

@implementation PUIMediaLibraryStorageController

+ (PUIMediaLibraryStorageController)shared
{
  if (qword_1EBFE1D40 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBFE1D30;

  return (PUIMediaLibraryStorageController *)v2;
}

- (BOOL)shouldDisplayStorageCleanupTip
{
  swift_beginAccess();
  v3 = self;
  sub_1E3E775E0();
  sub_1E3E7ADD0();

  swift_release();
  return v5;
}

- (void)setShouldDisplayStorageCleanupTip:(BOOL)a3
{
  v3 = self;
  sub_1E3DDCFD0();
}

- (PUIMediaLibraryStorageController)init
{
  return (PUIMediaLibraryStorageController *)sub_1E3DDD704();
}

- (void)dealloc
{
  v2 = self;
  MediaLibraryStorageController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR___PUIMediaLibraryStorageController__shouldDisplayStorageCleanupTipPublisher;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBFE2500);
  BOOL v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (int64_t)observeStorageCleanupChange:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  BOOL v5 = self;
  sub_1E3E775E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2120);
  sub_1E3E78AA0();

  swift_release();
  swift_release();
  return 0;
}

- (void)removeStorageCleanupChangeObserverWith:(int64_t)a3
{
  v3 = self;
  sub_1E3E775E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2120);
  sub_1E3E78AA0();

  swift_release();
}

- (void)mediaLibraryDidChange
{
  v2 = self;
  MediaLibraryStorageController.refreshDownloadedAssets()();
  sub_1E3DDDE4C((uint64_t)sub_1E3DDF7F4, (uint64_t)&block_descriptor_33);
}

- (void)refreshDownloadedAssets
{
  v2 = self;
  MediaLibraryStorageController.refreshDownloadedAssets()();
}

- (void)ignoreStorageCleanupPrompt
{
  v2 = self;
  MediaLibraryStorageController.ignoreStorageCleanupPrompt()();
}

@end