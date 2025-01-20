@interface PUIAssetDownloaders
+ (PUIAssetDownloaders)sharedDownloaders;
- (PUIAssetDownloaders)init;
- (void)registerBackgroundCompletion:(id)a3 forSession:(id)a4;
@end

@implementation PUIAssetDownloaders

+ (PUIAssetDownloaders)sharedDownloaders
{
  if (qword_1EBFE0F90 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EBFE0F88;

  return (PUIAssetDownloaders *)v2;
}

- (PUIAssetDownloaders)init
{
  return (PUIAssetDownloaders *)AssetDownloaders.init()();
}

- (void)registerBackgroundCompletion:(id)a3 forSession:(id)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t v7 = sub_1E3E7CD30();
  unint64_t v9 = v8;
  v10 = self;
  sub_1E3E604F4((uint64_t)sub_1E3E60EC4, v6, v7, v9);

  swift_release();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PUIAssetDownloaders_backgroundArtworkDownloader;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE2130);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___PUIAssetDownloaders_backgroundArtworkSource;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE4320);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  uint64_t v7 = (char *)self + OBJC_IVAR___PUIAssetDownloaders_storeArtworkSource;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBFE43A0);
  v10 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v10)((void *)(v8 - 8), v7, v8);
  unint64_t v9 = (char *)self + OBJC_IVAR___PUIAssetDownloaders_libraryArtworkSource;

  v10(v9, v8);
}

@end