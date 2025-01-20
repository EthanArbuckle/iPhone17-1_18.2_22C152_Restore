@interface LibraryCollectionsService
- (_TtC5Books25LibraryCollectionsService)init;
- (void)controllerDidChangeContent:(id)a3;
@end

@implementation LibraryCollectionsService

- (_TtC5Books25LibraryCollectionsService)init
{
  return (_TtC5Books25LibraryCollectionsService *)sub_10002A70C();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC5Books25LibraryCollectionsService__defaultCollections;
  uint64_t v4 = sub_100058D18((uint64_t *)&unk_100B31810);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC5Books25LibraryCollectionsService__userCollections, v4);
  v6 = (char *)self + OBJC_IVAR____TtC5Books25LibraryCollectionsService__state;
  uint64_t v7 = sub_100058D18(&qword_100B379D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);

  v8 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books25LibraryCollectionsService_userCollectionsFRC);
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004D9220(v4);
}

@end