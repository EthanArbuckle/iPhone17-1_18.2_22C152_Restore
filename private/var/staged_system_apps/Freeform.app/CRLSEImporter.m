@interface CRLSEImporter
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (_TtC8Freeform13CRLSEImporter)init;
- (void)exportLibrarySnapshot;
- (void)relinquishPresentedItemToWriter:(id)a3;
- (void)setPresentedItemOperationQueue:(id)a3;
- (void)setPresentedItemURL:(id)a3;
@end

@implementation CRLSEImporter

- (void)exportLibrarySnapshot
{
  v2 = self;
  sub_100A4D028();
}

- (NSURL)presentedItemURL
{
  uint64_t v3 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemURL;
  swift_beginAccess();
  sub_100522E9C((uint64_t)v7, (uint64_t)v6, &qword_101672E90);
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    v11 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (NSURL *)v11;
}

- (void)setPresentedItemURL:(id)a3
{
  uint64_t v5 = sub_1005057FC(&qword_101672E90);
  __chkstk_darwin(v5 - 8, v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = (char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemURL;
  swift_beginAccess();
  v12 = self;
  sub_100757E50((uint64_t)v8, (uint64_t)v11);
  swift_endAccess();
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemOperationQueue));
}

- (void)setPresentedItemOperationQueue:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemOperationQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemOperationQueue) = (Class)a3;
  id v3 = a3;
}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  id v4 = (void (**)(void *, void *))_Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  v8[4] = sub_100A54B1C;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = *(void *)"";
  v8[2] = sub_100679958;
  v8[3] = &unk_10151F510;
  uint64_t v6 = _Block_copy(v8);
  uint64_t v7 = self;
  swift_retain();
  swift_release();
  v4[2](v4, v6);
  _Block_release(v6);
  swift_release();
  _Block_release(v4);
}

- (_TtC8Freeform13CRLSEImporter)init
{
  result = (_TtC8Freeform13CRLSEImporter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_importFailureURL;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_librarySnapshotURL, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_pendingBoardsURL, v4);
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemURL, &qword_101672E90);
  uint64_t v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemOperationQueue);
}

@end