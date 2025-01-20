@interface PaginationOperation
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (NSString)description;
- (_TtC8BookEPUB19PaginationOperation)init;
- (void)cancel;
- (void)dealloc;
- (void)main;
- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5;
- (void)navigationHandlerWebContentLoadFailed:(id)a3 reason:(id)a4;
- (void)navigationHandlerWillCancelCurrentNavigation:(id)a3;
- (void)start;
@end

@implementation PaginationOperation

- (void)dealloc
{
  v2 = self;
  PaginationOperation.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_release();
  sub_5BE90((uint64_t)self + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_result, &qword_405918);
  sub_183A94((uint64_t)self + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_parameters);
  sub_4F924((uint64_t)self + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_annotationProviderService);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_log;
  uint64_t v4 = sub_2FB8A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8BookEPUB19PaginationOperation_operationID;
  uint64_t v6 = sub_2FB570();
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

- (void)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PaginationOperation(0);
  id v2 = v5.receiver;
  [(PaginationOperation *)&v5 cancel];
  NSString v3 = sub_2FC140();
  [v2 willChangeValueForKey:v3];

  *((unsigned char *)v2 + OBJC_IVAR____TtC8BookEPUB19PaginationOperation__cancelled) = 1;
  NSString v4 = sub_2FC140();
  [v2 didChangeValueForKey:v4];

  sub_17CECC((uint64_t)"FAILURE: #PaginationOperation Set to Cancel", 43, 2, (void (*)(__n128))&static os_signpost_type_t.end.getter, "#PaginationOperation: %s end event:%s");
}

- (BOOL)isCancelled
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8BookEPUB19PaginationOperation__cancelled);
}

- (BOOL)isExecuting
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8BookEPUB19PaginationOperation__executing);
}

- (BOOL)isFinished
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8BookEPUB19PaginationOperation__finished);
}

- (BOOL)isReady
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8BookEPUB19PaginationOperation__ready);
}

- (NSString)description
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for PaginationOperation(0);
  id v2 = v9.receiver;
  NSString v3 = [(PaginationOperation *)&v9 description];
  uint64_t v4 = sub_2FC180();
  uint64_t v6 = v5;

  uint64_t v10 = v4;
  uint64_t v11 = v6;
  v13._countAndFlagsBits = 2108704;
  v13._object = (void *)0xE300000000000000;
  sub_2FC260(v13);
  sub_2FB570();
  sub_1874C8((unint64_t *)&qword_3FE890, (void (*)(uint64_t))&type metadata accessor for UUID);
  v14._countAndFlagsBits = sub_2FD1A0();
  sub_2FC260(v14);

  swift_bridgeObjectRelease();
  NSString v7 = sub_2FC140();
  swift_bridgeObjectRelease();

  return (NSString *)v7;
}

- (_TtC8BookEPUB19PaginationOperation)init
{
  result = (_TtC8BookEPUB19PaginationOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)start
{
  id v2 = self;
  PaginationOperation.start()();
}

- (void)main
{
  id v2 = self;
  PaginationOperation.main()();
}

- (void)navigationHandler:(id)a3 failedToLoadURL:(id)a4 error:(id)a5
{
  uint64_t v9 = sub_371F4((uint64_t *)&unk_400C70);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_2FB400();
    uint64_t v12 = sub_2FB440();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_2FB440();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  id v14 = a3;
  id v15 = a5;
  v16 = self;
  sub_184618((uint64_t)v11, (uint64_t)a5);

  sub_5BE90((uint64_t)v11, (uint64_t *)&unk_400C70);
}

- (void)navigationHandlerWebContentLoadFailed:(id)a3 reason:(id)a4
{
  id v6 = a3;
  NSString v7 = self;
  id v8 = a4;
  sub_184AA4((uint64_t)a4);
}

- (void)navigationHandlerWillCancelCurrentNavigation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_17658C((uint64_t)"navigationHandlerWillCancelCurrentNavigation", 44, 2);
  [(PaginationOperation *)v5 cancel];
}

@end