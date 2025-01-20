@interface DOCArchiveOperation
- (NSString)actionNameForUndoing;
- (_TtC5Files19DOCArchiveOperation)initWithItems:(id)a3 destinationFolder:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)registerUndo;
@end

@implementation DOCArchiveOperation

- (NSString)actionNameForUndoing
{
  v2 = self;
  sub_10038FB94();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (id)operationForRedoing
{
  v2 = self;
  uint64_t v3 = sub_10038FE88();

  return v3;
}

- (id)operationForUndoing
{
  v2 = self;
  uint64_t v3 = (void *)sub_100390008();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC5Files19DOCArchiveOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
  id v4 = a4;
  result = (_TtC5Files19DOCArchiveOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1000A7258(*(void *)&self->FPArchiveOperation_opaque[OBJC_IVAR____TtC5Files19DOCArchiveOperation_progressHandler]);
  uint64_t v3 = *(void **)&self->FPArchiveOperation_opaque[OBJC_IVAR____TtC5Files19DOCArchiveOperation_progressObservation];
}

@end