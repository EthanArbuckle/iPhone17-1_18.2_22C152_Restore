@interface DOCTrashOperation
- (NSString)actionNameForUndoing;
- (_TtC5Files17DOCTrashOperation)initWithItems:(id)a3;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)actionMain;
- (void)registerUndo;
@end

@implementation DOCTrashOperation

- (void)actionMain
{
  v2 = self;
  sub_10032D2E8();
}

- (NSString)actionNameForUndoing
{
  v2 = self;
  sub_1002FF338();
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
  uint64_t v3 = sub_10032D4D4();

  return v3;
}

- (id)operationForUndoing
{
  v2 = self;
  uint64_t v3 = sub_10032D6A8();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC5Files17DOCTrashOperation)initWithItems:(id)a3
{
  result = (_TtC5Files17DOCTrashOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void **)&self->FPTrashOperation_opaque[OBJC_IVAR____TtC5Files17DOCTrashOperation_undoManager];
}

@end