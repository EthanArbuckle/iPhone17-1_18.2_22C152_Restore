@interface MacSyncedAlbumsAvailabilityObserver
- (_TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver)init;
- (void)dealloc;
- (void)outputEventSignaledForCoalescer:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
@end

@implementation MacSyncedAlbumsAvailabilityObserver

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver_photoLibrary);
  v3 = self;
  objc_msgSend(v2, sel_unregisterChangeObserver_, v3);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(uint64_t))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v3->super.isa) + 0x130))(KeyPath);
  swift_release();
  objc_msgSend(*(id *)((char *)&v3->super.isa+ OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver__refreshCoalescer), sel_unregisterObserver_, v3);
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for MacSyncedAlbumsAvailabilityObserver();
  [(MacSyncedAlbumsAvailabilityObserver *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver_photoLibrary));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver_macSyncedAlbumsFetchResult));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver_internalSettingsObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver__refreshCoalescer));
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver___observationRegistrar;
  uint64_t v4 = sub_1AB230BAC();
  objc_super v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (_TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver)init
{
  result = (_TtC12PhotosUICore35MacSyncedAlbumsAvailabilityObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)outputEventSignaledForCoalescer:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  _s12PhotosUICore35MacSyncedAlbumsAvailabilityObserverC19outputEventSignaled3forySo16PXEventCoalescerC_tF_0();
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  MacSyncedAlbumsAvailabilityObserver.photoLibraryDidChange(_:)((PHChange)v4);
}

@end