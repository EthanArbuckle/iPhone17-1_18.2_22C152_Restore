@interface TTRIBoardColumnCollectionViewLayout
+ (Class)layoutAttributesClass;
- (CGSize)collectionViewContentSize;
- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithCoder:(id)a3;
- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSection:(id)a3;
- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSectionProvider:(id)a3;
- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)_extendedAttributesQueryIncludingOrthogonalScrollingRegions:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation TTRIBoardColumnCollectionViewLayout

- (void)prepareLayout
{
  v2 = self;
  sub_1000716FC();
}

+ (Class)layoutAttributesClass
{
  type metadata accessor for TTRBoardColumnItemLayoutAttributes();

  return (Class)swift_getObjCClassFromMetadata();
}

- (CGSize)collectionViewContentSize
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v2 = v9.receiver;
  [(TTRIBoardColumnCollectionViewLayout *)&v9 collectionViewContentSize];
  TTRBoardColumnCollectionViewLayoutHelper.collectionViewContentSize(baseSize:)();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  double v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  objc_super v9 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14.receiver = v9;
  v14.super_class = ObjectType;
  id v11 = [(TTRIBoardColumnCollectionViewLayout *)&v14 layoutAttributesForItemAtIndexPath:isa];

  if (v11)
  {
    v12 = (void *)TTRBoardColumnCollectionViewLayoutHelper.layoutAttributesForItem(at:baseAttributes:)();
  }
  else
  {

    v12 = 0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v12;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double v3 = self;
  TTRBoardColumnCollectionViewLayoutHelper.layoutAttributesForElements(in:baseLayoutAttributesForElementsInRect:)();

  sub_1000726F0();
  v4.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (id)_extendedAttributesQueryIncludingOrthogonalScrollingRegions:(CGRect)a3
{
  double v3 = self;
  TTRBoardColumnCollectionViewLayoutHelper.layoutAttributesForElements(in:baseLayoutAttributesForElementsInRect:)();

  sub_1000726F0();
  v4.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSection:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = OBJC_IVAR____TtC9Reminders35TTRIBoardColumnCollectionViewLayout_helper;
  uint64_t v7 = qword_100785798;
  id v8 = a3;
  objc_super v9 = self;
  if (v7 != -1) {
    swift_once();
  }
  if (qword_1007857A0 != -1) {
    swift_once();
  }
  type metadata accessor for TTRBoardColumnCollectionViewLayoutHelper();
  swift_allocObject();
  *(Class *)((char *)&v9->super.super.super.isa + v6) = (Class)TTRBoardColumnCollectionViewLayoutHelper.init(topLevelItemSpacing:subtaskSpacing:)();

  v12.receiver = v9;
  v12.super_class = ObjectType;
  v10 = [(TTRIBoardColumnCollectionViewLayout *)&v12 initWithSection:v8];

  return v10;
}

- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = OBJC_IVAR____TtC9Reminders35TTRIBoardColumnCollectionViewLayout_helper;
  uint64_t v9 = qword_100785798;
  id v10 = a3;
  id v11 = a4;
  objc_super v12 = self;
  if (v9 != -1) {
    swift_once();
  }
  if (qword_1007857A0 != -1) {
    swift_once();
  }
  type metadata accessor for TTRBoardColumnCollectionViewLayoutHelper();
  swift_allocObject();
  *(Class *)((char *)&v12->super.super.super.isa + v8) = (Class)TTRBoardColumnCollectionViewLayoutHelper.init(topLevelItemSpacing:subtaskSpacing:)();

  v15.receiver = v12;
  v15.super_class = ObjectType;
  v13 = [(TTRIBoardColumnCollectionViewLayout *)&v15 initWithSection:v10 configuration:v11];

  return v13;
}

- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSectionProvider:(id)a3
{
  double v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout *)sub_1000720DC((uint64_t)sub_10007277C, v4);
}

- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout *)sub_1000722D8((uint64_t)sub_1000726A8, v6, a4);
}

- (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout)initWithCoder:(id)a3
{
  return (_TtC9Reminders35TTRIBoardColumnCollectionViewLayout *)sub_1000724F8(a3);
}

- (void).cxx_destruct
{
}

@end