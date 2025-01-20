@interface LibraryAssetStateObserver
- (_TtC11BookStoreUI25LibraryAssetStateObserver)init;
- (void)dealloc;
- (void)dynamicProgressChanged:(id)a3;
- (void)libraryItemStateCenter:(id)a3 didUpdateItemState:(id)a4 forIdentifier:(id)a5;
@end

@implementation LibraryAssetStateObserver

- (void)dealloc
{
  v2 = self;
  LibraryAssetStateObserver.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver__libraryAssetState;
  uint64_t v4 = sub_2E0620();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_untrackedLibraryAssetState, v4);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_downloadProgressCenter));
  swift_release();
  v6 = (char *)self + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver___observationRegistrar;
  uint64_t v7 = sub_2DE050();
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);

  v8(v6, v7);
}

- (void)libraryItemStateCenter:(id)a3 didUpdateItemState:(id)a4 forIdentifier:(id)a5
{
  sub_2E4420();
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_lockProtectedData);
  v8 = (double *)(v7 + 16);
  v9 = (os_unfair_lock_s *)(v7 + 40);
  id v10 = a3;
  swift_unknownObjectRetain();
  v11 = self;
  os_unfair_lock_lock(v9);
  sub_1487BC(v8);
  os_unfair_lock_unlock(v9);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

- (void)dynamicProgressChanged:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = [a3 progress];
  [v6 doubleValue];

  uint64_t v7 = *(os_unfair_lock_s **)((char *)&v5->super.isa
                            + OBJC_IVAR____TtC11BookStoreUI25LibraryAssetStateObserver_lockProtectedData);
  uint64_t v8 = (uint64_t)&v7[4];
  v9 = v7 + 10;
  os_unfair_lock_lock(v7 + 10);
  sub_1487F0(v8);
  os_unfair_lock_unlock(v9);

  swift_unknownObjectRelease();
}

- (_TtC11BookStoreUI25LibraryAssetStateObserver)init
{
  result = (_TtC11BookStoreUI25LibraryAssetStateObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end