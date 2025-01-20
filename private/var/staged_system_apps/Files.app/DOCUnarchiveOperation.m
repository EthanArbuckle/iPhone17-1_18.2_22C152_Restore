@interface DOCUnarchiveOperation
- (NSString)actionNameForUndoing;
- (_TtC5Files21DOCUnarchiveOperation)initWithItem:(id)a3 destinationFolder:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)registerUndo;
@end

@implementation DOCUnarchiveOperation

- (NSString)actionNameForUndoing
{
  v2 = self;
  sub_1003F9204();
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
  uint64_t v3 = sub_1003F9374();

  return v3;
}

- (id)operationForUndoing
{
  v2 = self;
  uint64_t v3 = (void *)sub_1003F94F4();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC5Files21DOCUnarchiveOperation)initWithItem:(id)a3 destinationFolder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC5Files21DOCUnarchiveOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void **)&self->FPUnarchiveOperation_opaque[OBJC_IVAR____TtC5Files21DOCUnarchiveOperation_undoManager];
}

@end