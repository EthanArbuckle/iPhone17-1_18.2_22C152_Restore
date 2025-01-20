@interface CRLCommandSetLocked
- (BOOL)locked;
- (NSUUID)id;
- (_TtC8Freeform19CRLCommandSetLocked)init;
- (_TtC8Freeform19CRLCommandSetLocked)initWithBoardItem:(id)a3 locked:(BOOL)a4;
- (_TtC8Freeform19CRLCommandSetLocked)initWithId:(id)a3 locked:(BOOL)a4;
@end

@implementation CRLCommandSetLocked

- (NSUUID)id
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (BOOL)locked
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLCommandSetLocked_locked);
}

- (_TtC8Freeform19CRLCommandSetLocked)initWithId:(id)a3 locked:(BOOL)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR____TtC8Freeform19CRLCommandSetLocked_id, v10, v6);
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform19CRLCommandSetLocked_locked) = a4;
  v11 = (objc_class *)type metadata accessor for CRLCommandSetLocked();
  v14.receiver = self;
  v14.super_class = v11;
  v12 = [(CRLCommand *)&v14 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v12;
}

- (_TtC8Freeform19CRLCommandSetLocked)initWithBoardItem:(id)a3 locked:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void (**)(void))((swift_isaMask & *(void *)a3) + 0x88);
  id v13 = a3;
  v12();
  Class isa = UUID._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  v15 = [(CRLCommandSetLocked *)self initWithId:isa locked:v4];

  return v15;
}

- (_TtC8Freeform19CRLCommandSetLocked)init
{
  result = (_TtC8Freeform19CRLCommandSetLocked *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  NSUUID v2 = (char *)self + OBJC_IVAR____TtC8Freeform19CRLCommandSetLocked_id;
  uint64_t v3 = type metadata accessor for UUID();
  BOOL v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end