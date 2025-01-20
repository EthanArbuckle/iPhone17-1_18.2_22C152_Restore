@interface BKObjectGraphHost
- (BKObjectGraphHost)init;
- (void)resolveAsyncDependenciesWithLibraryItemStateProvider:(id)a3 downloadProgressCenter:(id)a4 assetActionHandler:(id)a5 figaroPageContextProvider:(id)a6 sceneManager:(id)a7 serviceCenter:(id)a8;
@end

@implementation BKObjectGraphHost

- (BKObjectGraphHost)init
{
  uint64_t v3 = OBJC_IVAR___BKObjectGraphHost_dependenciesPromise;
  sub_100058D18((uint64_t *)&unk_100B23750);
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_1007FD9E0();
  swift_retain();
  uint64_t v5 = sub_10003AFD0();
  swift_release();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___BKObjectGraphHost_objectGraph) = (Class)v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for ObjectGraphHost();
  return [(BKObjectGraphHost *)&v7 init];
}

- (void)resolveAsyncDependenciesWithLibraryItemStateProvider:(id)a3 downloadProgressCenter:(id)a4 assetActionHandler:(id)a5 figaroPageContextProvider:(id)a6 sceneManager:(id)a7 serviceCenter:(id)a8
{
  swift_unknownObjectRetain();
  id v15 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v16 = a7;
  id v17 = a8;
  v18 = self;
  ObjectGraphHost.resolveAsyncDependencies(libraryItemStateProvider:downloadProgressCenter:assetActionHandler:figaroPageContextProvider:sceneManager:serviceCenter:)((uint64_t)a3, v15, (uint64_t)a5, (uint64_t)a6, v16, v17);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end