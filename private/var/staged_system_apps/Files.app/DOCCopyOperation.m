@interface DOCCopyOperation
- (NSDictionary)transferResults;
- (NSString)actionNameForUndoing;
- (_TtC5Files16DOCCopyOperation)initWithItems:(id)a3 destinationFolder:(id)a4;
- (_TtC5Files16DOCCopyOperation)initWithItems:(id)a3 destinationURL:(id)a4;
- (_TtC5Files16DOCCopyOperation)initWithSourceURLs:(id)a3 destinationFolder:(id)a4;
- (_TtC5Files16DOCCopyOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4;
- (_TtC5Files16DOCCopyOperation)initWithURLs:(id)a3 destinationFolder:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)actionMain;
- (void)presendNotifications;
- (void)registerUndo;
@end

@implementation DOCCopyOperation

- (void)presendNotifications
{
  v2 = self;
  if (DOCCopyOperation.handlePresendNotifications_asDSCopy()())
  {
  }
  else
  {
    v3.receiver = v2;
    v3.super_class = (Class)type metadata accessor for DOCCopyOperation();
    [(DOCCopyOperation *)&v3 presendNotifications];
  }
}

- (void)actionMain
{
  v2 = self;
  DOCCopyOperation.actionMain()();
}

- (NSString)actionNameForUndoing
{
  uint64_t v2 = *(void *)(*(void *)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC5Files16DOCCopyOperation_sourceURLs] + 16);
  objc_super v3 = self;
  if (v2) {
    sub_1002F41C8();
  }
  else {
    sub_1002F3C80();
  }
  uint64_t v5 = v4;

  if (v5)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }

  return (NSString *)v6;
}

- (id)operationForRedoing
{
  uint64_t v2 = self;
  objc_super v3 = DOCCopyOperation.operationForRedoing()();

  return v3;
}

- (id)operationForUndoing
{
  uint64_t v2 = self;
  id v3 = DOCCopyOperation.operationForUndoing()();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC5Files16DOCCopyOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
}

- (_TtC5Files16DOCCopyOperation)initWithURLs:(id)a3 destinationFolder:(id)a4
{
}

- (_TtC5Files16DOCCopyOperation)initWithItems:(id)a3 destinationURL:(id)a4
{
  uint64_t v4 = type metadata accessor for URL();
  __chkstk_darwin(v4 - 8);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  result = (_TtC5Files16DOCCopyOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Files16DOCCopyOperation)initWithSourceURLs:(id)a3 destinationFolder:(id)a4
{
}

- (_TtC5Files16DOCCopyOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(void **)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC5Files16DOCCopyOperation_undoManager];
}

- (NSDictionary)transferResults
{
  uint64_t v2 = self;
  uint64_t v3 = DOCCopyOperation.transferResults.getter();

  if (v3)
  {
    sub_10009E6C4(0, (unint64_t *)&qword_1007069C0);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSDictionary *)v4.super.isa;
}

@end