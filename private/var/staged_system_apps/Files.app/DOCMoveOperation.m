@interface DOCMoveOperation
- (NSString)actionNameForUndoing;
- (_TtC5Files16DOCMoveOperation)initWithItems:(id)a3 destinationFolder:(id)a4;
- (_TtC5Files16DOCMoveOperation)initWithItems:(id)a3 destinationURL:(id)a4;
- (_TtC5Files16DOCMoveOperation)initWithSourceURLs:(id)a3 destinationFolder:(id)a4;
- (_TtC5Files16DOCMoveOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4;
- (_TtC5Files16DOCMoveOperation)initWithURLs:(id)a3 destinationFolder:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
- (void)registerUndo;
@end

@implementation DOCMoveOperation

- (_TtC5Files16DOCMoveOperation)initWithURLs:(id)a3 destinationFolder:(id)a4
{
  type metadata accessor for URL();
  uint64_t v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC5Files16DOCMoveOperation *)sub_100198B90(v5, a4);
}

- (void)presendNotifications
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCMoveOperation();
  id v2 = v4.receiver;
  [(DOCMoveOperation *)&v4 presendNotifications];
  id v3 = [self defaultCenter];
  if (qword_100704EB8 != -1) {
    swift_once();
  }
  [v3 postNotificationName:qword_100736E88 object:v2];
}

- (void)actionMain
{
  id v2 = self;
  sub_100198ED8();
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    v9 = self;
  }
  sub_10019906C((uint64_t)v10, a4);

  sub_10006273C((uint64_t)v10);
}

- (NSString)actionNameForUndoing
{
  id v2 = self;
  sub_1001995DC();
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
  id v2 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_undoManager];
  if (v2)
  {
    uint64_t v4 = *(void *)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_sourceItems];
    NSString v5 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_destinationFolderItem];
    objc_allocWithZone((Class)type metadata accessor for DOCMoveOperation());
    id v6 = self;
    id v7 = v2;
    swift_bridgeObjectRetain();
    id v8 = sub_100198CE0(v4, v5, v7);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)operationForUndoing
{
  id v2 = self;
  uint64_t v3 = sub_1001999C4();

  return v3;
}

- (void)registerUndo
{
  uint64_t v3 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_undoManager];
  if (v3) {
    [v3 registerUndoOperationForSender:self];
  }
}

- (_TtC5Files16DOCMoveOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
}

- (_TtC5Files16DOCMoveOperation)initWithItems:(id)a3 destinationURL:(id)a4
{
  uint64_t v4 = type metadata accessor for URL();
  __chkstk_darwin(v4 - 8);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  result = (_TtC5Files16DOCMoveOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Files16DOCMoveOperation)initWithSourceURLs:(id)a3 destinationFolder:(id)a4
{
}

- (_TtC5Files16DOCMoveOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC5Files16DOCMoveOperation_undoManager];
}

@end