@interface CRLConnectionLineItem
+ (id)commandActionStringForConnectingFrom:(id)a3 oldConnectedFrom:(id)a4 newConnectedTo:(id)a5 oldConnectedTo:(id)a6;
- (BOOL)allowsChangeShape;
- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock;
- (BOOL)hasOneArrowhead;
- (BOOL)hasOneLineEnd;
- (BOOL)isConnectedWithBoardItem:(id)a3 boardItemOwner:(id)a4;
- (BOOL)isLine;
- (BOOL)isTailEndOnLeftBestGuess;
- (BOOL)supportsFill;
- (CRLConnectionLinePathSource)connectionLinePathSource;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (_TtC8Freeform21CRLConnectionLineItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5 pathSource:(id)a6 stroke:(id)a7 headLineEnd:(id)a8 tailLineEnd:(id)a9;
- (id)commandToConnectWithBoardItems:(id)a3;
- (id)getConnectedFromWithBoardItemOwner:(id)a3;
- (id)getConnectedToWithBoardItemOwner:(id)a3;
- (void)applyConnectionLineStylingsFromConnectionLineLayoutToUse:(id)a3;
- (void)setConnectedFrom:(id)a3;
- (void)setConnectedTo:(id)a3;
@end

@implementation CRLConnectionLineItem

- (BOOL)allowsParentGroupToBeResizedWithoutAspectRatioLock
{
  v2 = self;
  char v3 = sub_1009B9908();

  return v3 & 1;
}

- (BOOL)supportsFill
{
  return 0;
}

- (BOOL)isTailEndOnLeftBestGuess
{
  v2 = self;
  char v3 = sub_1009B9A58();

  return v3 & 1;
}

- (BOOL)allowsChangeShape
{
  return 0;
}

- (Class)layoutClass
{
  v2 = self;
  sub_1009BA99C();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  sub_10050BF48(0, (unint64_t *)&unk_10168A0F0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  sub_10050BF48(0, (unint64_t *)&unk_1016951D0);

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)isLine
{
  return 1;
}

- (BOOL)hasOneArrowhead
{
  v2 = self;
  char v3 = sub_1009BAD20();

  return v3 & 1;
}

- (BOOL)hasOneLineEnd
{
  v2 = self;
  char v3 = sub_1009BB7DC();

  return v3 & 1;
}

+ (id)commandActionStringForConnectingFrom:(id)a3 oldConnectedFrom:(id)a4 newConnectedTo:(id)a5 oldConnectedTo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  sub_1009C2B4C(a3, a4, a5, a6);

  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v14;
}

- (id)getConnectedFromWithBoardItemOwner:(id)a3
{
  return sub_1009BF17C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, id, uint64_t))sub_1009C1FA8);
}

- (void)setConnectedFrom:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1009BEC7C(a3);
}

- (id)getConnectedToWithBoardItemOwner:(id)a3
{
  return sub_1009BF17C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, id, uint64_t))sub_1009C2340);
}

- (void)setConnectedTo:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1009BF200(a3);
}

- (BOOL)isConnectedWithBoardItem:(id)a3 boardItemOwner:(id)a4
{
  swift_getObjectType();
  id v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  char v9 = sub_1009C1EB8(v7, a4, (uint64_t)v8);

  swift_unknownObjectRelease();
  return v9 & 1;
}

- (id)commandToConnectWithBoardItems:(id)a3
{
  type metadata accessor for CRLBoardItem(0);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = self;
  sub_1009BF768(v4);
  id v7 = v6;

  swift_bridgeObjectRelease();

  return v7;
}

- (void)applyConnectionLineStylingsFromConnectionLineLayoutToUse:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1009BFCC8(a3);
}

- (CRLConnectionLinePathSource)connectionLinePathSource
{
  uint64_t v3 = **(void **)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC8Freeform16CRLBoardItemBase_itemData);
  result = (CRLConnectionLinePathSource *)swift_conformsToProtocol2();
  if (result)
  {
    id v5 = *(uint64_t (**)(uint64_t))(v3 + 704);
    v6 = self;
    uint64_t v7 = swift_retain();
    v8 = (void *)v5(v7);
    swift_release();
    self;
    char v9 = (void *)swift_dynamicCastObjCClass();

    if (!v9) {
    return (CRLConnectionLinePathSource *)v9;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC8Freeform21CRLConnectionLineItem)initWithStore:(id)a3 parentContainerUUID:(id)a4 geometry:(id)a5 pathSource:(id)a6 stroke:(id)a7 headLineEnd:(id)a8 tailLineEnd:(id)a9
{
  uint64_t v14 = type metadata accessor for UUID();
  __chkstk_darwin(v14 - 8, v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  return (_TtC8Freeform21CRLConnectionLineItem *)sub_1009C16B0((uint64_t)v18, (uint64_t)v17, v19, v20, a7, a8, a9);
}

@end