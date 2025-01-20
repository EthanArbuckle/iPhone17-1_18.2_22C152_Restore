@interface PUWallpaperShuffleConfigurationViewModel
- (_TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel)init;
- (void)passiveContentDataSourceAvailableTypesDidChange:(id)a3;
- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3;
- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3;
@end

@implementation PUWallpaperShuffleConfigurationViewModel

- (_TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_photoLibrary));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_posterConfiguration));
  OUTLINED_FUNCTION_28_5(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_finishHandler);
  OUTLINED_FUNCTION_28_5(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_cancelHandler);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_centerMedia));
  swift_release();
  sub_1AEADA810(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel____lazy_storage___assetPreviewViewModel));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel____lazy_storage___smartAlbumDataSource));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A9BF30);
  OUTLINED_FUNCTION_16_0();
  uint64_t v3 = OUTLINED_FUNCTION_15_13();
  v4(v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A9BF38);
  OUTLINED_FUNCTION_16_0();
  uint64_t v5 = OUTLINED_FUNCTION_15_13();
  v6(v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A995B8);
  OUTLINED_FUNCTION_16_0();
  v8 = *(void (**)(void))(v7 + 8);
  OUTLINED_FUNCTION_14_13();
  v8();
  OUTLINED_FUNCTION_28_5(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_peoplePickerHandler);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel____lazy_storage___peoplePickerDataSource));
  OUTLINED_FUNCTION_28_5(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_albumPickerHandler);
  OUTLINED_FUNCTION_14_13();
  v8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A9BF40);
  OUTLINED_FUNCTION_16_0();
  uint64_t v9 = OUTLINED_FUNCTION_15_13();
  v10(v9);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1E9A9BF48);
  OUTLINED_FUNCTION_16_0();
  uint64_t v11 = OUTLINED_FUNCTION_15_13();
  v12(v11);
  OUTLINED_FUNCTION_28_5(OBJC_IVAR____TtC15PhotosUIPrivate40PUWallpaperShuffleConfigurationViewModel_manualSelectionPhotoPickerHandler);
  swift_bridgeObjectRelease();
}

- (void)passiveContentDataSourceAvailableTypesDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AEAD95C4();
}

- (void)passiveContentDataSourcePreviewAssetsDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AEAD9070();
}

- (void)passiveContentPeoplePickerDataSourceChanged:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1AEAD95C4();
}

@end