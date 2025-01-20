@interface CRLWPShapeItem
- (BOOL)allowsChangeShape;
- (BOOL)hasVisibleContents;
- (BOOL)isAutogrowingTextBox;
- (BOOL)isGEnerativePlaygroundImageItem;
- (BOOL)shouldBeDeletedWhenEndEditing;
- (BOOL)shrinkToFit;
- (BOOL)textIsVertical;
- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3 size:(id)a4;
- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 dynamicallyDraggedLayout:(id)a4;
- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 size:(CGSize)a4;
- (Class)editorClass;
- (Class)layoutClass;
- (Class)repClass;
- (NSArray)childInfos;
- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem;
- (NSArray)stringContentForSearch;
- (NSString)localizedAccessibilityDescriptionPlaceholder;
- (NSString)localizedName;
- (_TtC8Freeform12CRLWPStorage)text;
- (_TtC8Freeform12CRLWPStorage)textStorage;
- (float)textInset;
- (id)childEnumerator;
- (id)childEnumeratorForUserSearch;
- (id)generativePlaygroundStringsFor:(id)a3;
- (id)infoForSelectionPath:(id)a3;
- (id)promisedStringForCopy;
- (int64_t)verticalAlignment;
- (void)prepareBoardItemForConnectorModeDuplication;
- (void)setShrinkToFit:(BOOL)a3;
- (void)setTextInset:(float)a3;
- (void)setTextIsVertical:(BOOL)a3;
- (void)setTextStorage:(id)a3;
- (void)setVerticalAlignment:(int64_t)a3;
@end

@implementation CRLWPShapeItem

- (_TtC8Freeform12CRLWPStorage)textStorage
{
  return (_TtC8Freeform12CRLWPStorage *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage));
}

- (void)setTextStorage:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage) = (Class)a3;
  id v3 = a3;
}

- (_TtC8Freeform12CRLWPStorage)text
{
  result = *(_TtC8Freeform12CRLWPStorage **)((char *)&self->super.super.super.super.super.isa
                                           + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

- (BOOL)textIsVertical
{
  return *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textIsVertical);
}

- (void)setTextIsVertical:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textIsVertical) = a3;
}

- (BOOL)hasVisibleContents
{
  v2 = self;
  sub_100988F6C();
  char v4 = v3;

  return v4 & 1;
}

- (BOOL)isAutogrowingTextBox
{
  v2 = self;
  char v3 = sub_100989210();

  return v3 & 1;
}

- (BOOL)shouldBeDeletedWhenEndEditing
{
  v2 = self;
  BOOL v3 = sub_1009894F4();

  return v3;
}

- (NSArray)customPublicTypesToPromiseWhenCopyingSingleBoardItem
{
  uint64_t v3 = type metadata accessor for UTType();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_100988F6C();
  if (v9)
  {
    sub_1005057FC((uint64_t *)&unk_101672610);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_10117E810;
    static UTType.utf8PlainText.getter();
    uint64_t v11 = UTType.identifier.getter();
    uint64_t v13 = v12;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    *(void *)(v10 + 32) = v11;
    *(void *)(v10 + 40) = v13;
  }

  v14.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v14.super.isa;
}

- (id)promisedStringForCopy
{
  v2 = self;
  sub_10098979C();
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

  return v5;
}

- (NSString)localizedName
{
  return (NSString *)sub_10098A320(self, (uint64_t)a2, (void (*)(void))sub_10098A03C);
}

- (NSString)localizedAccessibilityDescriptionPlaceholder
{
  return (NSString *)sub_10098A320(self, (uint64_t)a2, (void (*)(void))sub_10098A390);
}

- (void)prepareBoardItemForConnectorModeDuplication
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (!v2) {
    goto LABEL_9;
  }
  uint64_t v3 = self;
  id v8 = v2;
  id v4 = [v8 range];
  BOOL v6 = __OFADD__(v4, v5);
  int64_t v7 = (int64_t)v4 + v5;
  if (v6)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v7 < (uint64_t)v4)
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return;
  }
  sub_100901520((uint64_t)v4, v7, 0, 0xE000000000000000, 1);
}

- (float)textInset
{
  uint64_t v3 = type metadata accessor for CRLWPShapeItemCRDTData(0);
  __chkstk_darwin(v3, v4);
  BOOL v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CRLWPShapeItemData(0);
  uint64_t v7 = *(void *)swift_dynamicCastClassUnconditional();
  (*(void (**)(void))(v7 + 760))();
  id v8 = self;
  swift_retain();
  sub_1005057FC(&qword_101689320);
  CRRegister.wrappedValue.getter();
  float v9 = *(float *)&v11[3];
  sub_10099112C((uint64_t)v6, type metadata accessor for CRLWPShapeItemCRDTData);

  swift_release();
  return v9;
}

- (void)setTextInset:(float)a3
{
  uint64_t v3 = self;
  sub_10098AA68();
}

- (int64_t)verticalAlignment
{
  type metadata accessor for CRLWPShapeItemData(0);
  swift_dynamicCastClassUnconditional();
  uint64_t v3 = self;
  swift_retain();
  int64_t v4 = sub_1005DB5E0();

  swift_release();
  return v4;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  uint64_t v3 = self;
  sub_10098AE04();
}

- (BOOL)shrinkToFit
{
  uint64_t v3 = type metadata accessor for CRLWPShapeItemCRDTData(0);
  __chkstk_darwin(v3, v4);
  BOOL v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for CRLWPShapeItemData(0);
  uint64_t v7 = *(void *)swift_dynamicCastClassUnconditional();
  (*(void (**)(void))(v7 + 760))();
  type metadata accessor for CRLWPShapeItemCRDTData.WPShapeStyleData(0);
  id v8 = self;
  swift_retain();
  sub_1005057FC((uint64_t *)&unk_101689310);
  CRRegister.wrappedValue.getter();
  char v9 = v11[15];
  sub_10099112C((uint64_t)v6, type metadata accessor for CRLWPShapeItemCRDTData);

  swift_release();
  return v9;
}

- (void)setShrinkToFit:(BOOL)a3
{
  uint64_t v3 = self;
  sub_10098B368();
}

- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 dynamicallyDraggedLayout:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  double v9 = sub_10098B818(v6, v7);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)autosizePositionOffsetForGeometry:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  id v8 = self;
  double v9 = sub_10098B9D0(v7, width, height);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGAffineTransform)autosizedTransformForInfoGeometry:(SEL)a3 size:(id)a4
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a4;
  double v10 = self;
  sub_10098BB30(v9, v14, width, height);

  long long v12 = v14[1];
  long long v13 = v14[2];
  *(_OWORD *)&retstr->a = v14[0];
  *(_OWORD *)&retstr->c = v12;
  *(_OWORD *)&retstr->tx = v13;
  return result;
}

- (BOOL)allowsChangeShape
{
  v2 = self;
  char v3 = sub_10098BED4();

  return v3 & 1;
}

- (Class)layoutClass
{
  v2 = self;
  sub_10098C178();

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)repClass
{
  v2 = self;
  uint64_t v3 = sub_10098C1E4();

  if (!v3) {
    return 0;
  }

  return (Class)swift_getObjCClassFromMetadata();
}

- (Class)editorClass
{
  v2 = self;
  sub_10098C344();

  return (Class)swift_getObjCClassFromMetadata();
}

- (NSArray)stringContentForSearch
{
  v2 = self;
  sub_10098F5F8();

  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage));
}

- (NSArray)childInfos
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8Freeform14CRLWPShapeItem_textStorage);
  if (v2)
  {
    sub_1005057FC((uint64_t *)&unk_101676C10);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_101177E70;
    *(void *)(v3 + 32) = v2;
    specialized Array._endMutation()();
  }
  id v4 = v2;
  sub_1005057FC(&qword_101673060);
  v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v5.super.isa;
}

- (id)infoForSelectionPath:(id)a3
{
  id v4 = a3;
  NSArray v5 = self;
  id v6 = sub_10098FAC8(v4);

  return v6;
}

- (id)childEnumerator
{
  v2 = self;
  uint64_t v3 = [(CRLWPShapeItem *)v2 childInfos];
  sub_1005057FC(&qword_101673060);
  unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100590A28(v4);
  swift_bridgeObjectRelease();
  id v5 = objc_allocWithZone((Class)NSArray);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v5 initWithArray:isa];

  id v8 = [v7 objectEnumerator];

  return v8;
}

- (id)childEnumeratorForUserSearch
{
  v2 = self;
  id v3 = sub_10098FDE0();

  return v3;
}

- (BOOL)isGEnerativePlaygroundImageItem
{
  return 0;
}

- (id)generativePlaygroundStringsFor:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_100FB43FC(v4);

  v6.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

@end