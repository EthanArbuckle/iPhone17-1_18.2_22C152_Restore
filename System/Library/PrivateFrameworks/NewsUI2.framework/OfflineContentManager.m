@interface OfflineContentManager
- (NSSet)listenableArticleIDs;
- (NSSet)readableArticleIDs;
- (_TtC7NewsUI221OfflineContentManager)init;
- (void)downloadFinishedForRequest:(id)a3 error:(id)a4;
- (void)downloadProgressedForRequest:(id)a3 contentArchive:(id)a4;
- (void)downloadProgressedForRequest:(id)a3 progress:(double)a4;
- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4;
@end

@implementation OfflineContentManager

- (_TtC7NewsUI221OfflineContentManager)init
{
  result = (_TtC7NewsUI221OfflineContentManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI221OfflineContentManager____lazy_storage___requestProcessingThrottler));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (NSSet)readableArticleIDs
{
  v2 = self;
  swift_retain();
  sub_1DFDED020();
  swift_release();
  sub_1DFABB7BC(v5);

  v3 = (void *)sub_1DFDFE5C0();
  swift_release();
  return (NSSet *)v3;
}

- (NSSet)listenableArticleIDs
{
  v2 = self;
  sub_1DFAB92FC();

  v3 = (void *)sub_1DFDFE5C0();
  swift_bridgeObjectRelease();
  return (NSSet *)v3;
}

- (void)downloadProgressedForRequest:(id)a3 contentArchive:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1DFAB9510(v6, v7);
}

- (void)downloadProgressedForRequest:(id)a3 progress:(double)a4
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = self;
  *(void *)(v7 + 24) = a3;
  *(double *)(v7 + 32) = a4;
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  sub_1DFDEE310();

  swift_release();
}

- (void)downloadFinishedForRequest:(id)a3 error:(id)a4
{
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = self;
  v7[3] = a3;
  v7[4] = a4;
  id v8 = a3;
  v9 = self;
  id v10 = a4;
  v11 = v9;
  id v12 = v8;
  id v13 = v10;
  sub_1DFDEE310();

  swift_release();
}

- (void)operationThrottler:(id)a3 performAsyncOperationWithCompletion:(id)a4
{
  swift_getObjectType();
  id v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  swift_unknownObjectRetain();
  uint64_t v7 = self;
  sub_1DFDEE090();
  id v8 = (void *)sub_1DFDEDCE0();
  sub_1DFDEDE10();
  swift_release();

  v9 = (void *)sub_1DFDEDCE0();
  sub_1DFDEDEA0();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
}

@end