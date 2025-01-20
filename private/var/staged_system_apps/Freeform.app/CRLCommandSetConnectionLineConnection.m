@interface CRLCommandSetConnectionLineConnection
- (CRLConnectionLinePathSource)pathSource;
- (NSUUID)connectedItemID;
- (NSUUID)connectionLineID;
- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)init;
- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)initWithConnectionLine:(id)a3 connectedItem:(id)a4 chirality:(int64_t)a5;
- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)initWithConnectionLine:(id)a3 connectedItem:(id)a4 chirality:(int64_t)a5 pathSource:(id)a6;
- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)initWithConnectionLineID:(id)a3 connectedItemID:(id)a4 chirality:(int64_t)a5 pathSource:(id)a6;
- (int64_t)chirality;
@end

@implementation CRLCommandSetConnectionLineConnection

- (NSUUID)connectionLineID
{
  v2.super.isa = UUID._bridgeToObjectiveC()().super.isa;

  return (NSUUID *)v2.super.isa;
}

- (NSUUID)connectedItemID
{
  uint64_t v3 = sub_1005057FC((uint64_t *)&unk_101674520);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1005107BC((uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_connectedItemID, (uint64_t)v6);
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    Class isa = UUID._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v6, v7);
  }

  return (NSUUID *)isa;
}

- (int64_t)chirality
{
  return *(int64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_chirality);
}

- (CRLConnectionLinePathSource)pathSource
{
  return (CRLConnectionLinePathSource *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                                + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_pathSource));
}

- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)initWithConnectionLineID:(id)a3 connectedItemID:(id)a4 chirality:(int64_t)a5 pathSource:(id)a6
{
  uint64_t v10 = sub_1005057FC((uint64_t *)&unk_101674520);
  __chkstk_darwin(v10 - 8, v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = 0;
  }
  else
  {
    uint64_t v19 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v19, 1, v14);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))((char *)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_connectionLineID, v18, v14);
  sub_1005107BC((uint64_t)v13, (uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_connectedItemID);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_chirality) = (Class)a5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_pathSource) = (Class)a6;
  v20 = (objc_class *)type metadata accessor for CRLCommandSetConnectionLineConnection();
  v24.receiver = self;
  v24.super_class = v20;
  id v21 = a6;
  v22 = [(CRLCommand *)&v24 init];
  sub_100510824((uint64_t)v13);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  return v22;
}

- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)initWithConnectionLine:(id)a3 connectedItem:(id)a4 chirality:(int64_t)a5 pathSource:(id)a6
{
  v9 = (char *)a3;
  id v10 = a4;
  id v11 = a6;
  return (_TtC8Freeform37CRLCommandSetConnectionLineConnection *)sub_100BDEAB8(v9, a4, a5, a6);
}

- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)initWithConnectionLine:(id)a3 connectedItem:(id)a4 chirality:(int64_t)a5
{
  uint64_t v7 = (char *)a3;
  id v8 = a4;
  return (_TtC8Freeform37CRLCommandSetConnectionLineConnection *)sub_100BDEDE0(v7, a4, a5);
}

- (_TtC8Freeform37CRLCommandSetConnectionLineConnection)init
{
  result = (_TtC8Freeform37CRLCommandSetConnectionLineConnection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_connectionLineID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100510824((uint64_t)self + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_connectedItemID);
  uint64_t v5 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform37CRLCommandSetConnectionLineConnection_pathSource);
}

@end