@interface PXHiddenAlbumVisibilityPreferenceObserver
- (_TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver)init;
- (void)dealloc;
- (void)preferencesDidChange;
@end

@implementation PXHiddenAlbumVisibilityPreferenceObserver

- (void)dealloc
{
  v2 = self;
  PXUnregisterPreferencesObserver(v2);
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for PXHiddenAlbumVisibilityPreferenceObserver();
  [(PXHiddenAlbumVisibilityPreferenceObserver *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver_photoLibrary));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver___observationRegistrar;
  uint64_t v4 = sub_1AB230BAC();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (_TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver)init
{
  result = (_TtC12PhotosUICore41PXHiddenAlbumVisibilityPreferenceObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)preferencesDidChange
{
  uint64_t v4 = self;
  BOOL IsHiddenAlbumVisible = PXPreferencesIsHiddenAlbumVisible();
  objc_super v3 = (void *)MEMORY[0x1E4FBC8C8];
  if (IsHiddenAlbumVisible != ((*(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v4->super.isa) + 0x80))() & 1)) {
    (*(void (**)(BOOL))((*v3 & (uint64_t)v4->super.isa) + 0x88))(IsHiddenAlbumVisible);
  }
}

@end