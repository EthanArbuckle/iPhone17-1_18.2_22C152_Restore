@interface CRLPasteboardObject
- (BOOL)hasNativeText;
- (BOOL)isSmartCopyPaste;
- (NSArray)boardItems;
- (NSString)description;
- (_TtC8Freeform19CRLPasteboardObject)init;
- (_TtC8Freeform19CRLPasteboardObject)initWithContext:(id)a3;
- (id)makeTextboxFromCopiedTextWith:(id)a3;
- (void)copyTextFrom:(id)a3;
- (void)setBoardItems:(id)a3;
- (void)setIsSmartCopyPaste:(BOOL)a3;
@end

@implementation CRLPasteboardObject

- (_TtC8Freeform19CRLPasteboardObject)initWithContext:(id)a3
{
  swift_getObjectType();
  v4 = (_TtC8Freeform19CRLPasteboardObject *)sub_100787170((uint64_t)a3, 0x1000000000000, 0x2000400000000, 0x1000000000000);
  swift_deallocPartialClassInstance();
  return v4;
}

- (BOOL)isSmartCopyPaste
{
  return (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLPasteboardObject_pasteboardData))[OBJC_IVAR____TtC8Freeform23CRLPasteboardObjectData_isSmartCopyPaste];
}

- (void)setIsSmartCopyPaste:(BOOL)a3
{
  (*(unsigned char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLPasteboardObject_pasteboardData))[OBJC_IVAR____TtC8Freeform23CRLPasteboardObjectData_isSmartCopyPaste] = a3;
}

- (NSArray)boardItems
{
  type metadata accessor for CRLBoardItem(0);
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setBoardItems:(id)a3
{
  type metadata accessor for CRLBoardItem(0);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_100781610(v4);
}

- (void)copyTextFrom:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100782008((uint64_t)v4);
}

- (id)makeTextboxFromCopiedTextWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10078250C((uint64_t)v4);

  return v6;
}

- (BOOL)hasNativeText
{
  uint64_t v3 = sub_1005057FC((uint64_t *)&unk_101674610);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(char **)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLPasteboardObject_pasteboardData)
     + OBJC_IVAR____TtC8Freeform23CRLPasteboardObjectData_textCRDT;
  swift_beginAccess();
  sub_100522E9C((uint64_t)v7, (uint64_t)v6, (uint64_t *)&unk_101674610);
  uint64_t v8 = type metadata accessor for CRLWPStorageCRDTData(0);
  LOBYTE(v7) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48))(v6, 1, v8) != 1;
  sub_100522F00((uint64_t)v6, (uint64_t *)&unk_101674610);
  return (char)v7;
}

- (_TtC8Freeform19CRLPasteboardObject)init
{
  result = (_TtC8Freeform19CRLPasteboardObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (NSString)description
{
  NSArray v2 = self;
  sub_100785400();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end