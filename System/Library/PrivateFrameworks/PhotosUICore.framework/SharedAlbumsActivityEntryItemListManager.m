@interface SharedAlbumsActivityEntryItemListManager
- (_TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager)init;
- (void)activityEntryRepositoryDidChange:(id)a3;
- (void)photoLibraryDidChange:(id)a3;
@end

@implementation SharedAlbumsActivityEntryItemListManager

- (void)activityEntryRepositoryDidChange:(id)a3
{
  id v4 = a3;
  self;
  sub_1AA215EC4();
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  self;
  sub_1AA21315C(v4);
}

- (_TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager)init
{
  result = (_TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager_photoLibrary));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager__itemList));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager_observable));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager_activityEntryRepository));
  sub_1A9C62F64((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager___cachedLastSeenUnreadDate);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12PhotosUICore40SharedAlbumsActivityEntryItemListManager___observationRegistrar;
  uint64_t v4 = sub_1AB230BAC();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end