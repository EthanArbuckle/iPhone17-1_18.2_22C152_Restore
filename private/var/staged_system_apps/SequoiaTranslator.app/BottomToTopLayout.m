@interface BottomToTopLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSection:(id)a3;
- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSectionProvider:(id)a3;
- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation BottomToTopLayout

- (void)prepareLayout
{
  v2 = self;
  sub_100019D48();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  swift_beginAccess();
  uint64_t v7 = swift_bridgeObjectRetain();
  sub_10001A28C(v7, x, y, width, height);
  sub_10001ADD0();
  v8.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v8.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  NSArray v8 = self;
  v9 = sub_10001A54C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSection:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes) = (Class)&_swiftEmptyDictionarySingleton;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BottomToTopLayout();
  return [(BottomToTopLayout *)&v5 initWithSection:a3];
}

- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSection:(id)a3 configuration:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes) = (Class)&_swiftEmptyDictionarySingleton;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for BottomToTopLayout();
  return [(BottomToTopLayout *)&v7 initWithSection:a3 configuration:a4];
}

- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSectionProvider:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes) = (Class)&_swiftEmptyDictionarySingleton;
  aBlock[4] = sub_10001AE10;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100218A94;
  aBlock[3] = &unk_1002C9EE8;
  uint64_t v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for BottomToTopLayout();
  objc_super v7 = [(BottomToTopLayout *)&v9 initWithSectionProvider:v6];
  swift_release();
  _Block_release(v6);
  return v7;
}

- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  uint64_t v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes) = (Class)&_swiftEmptyDictionarySingleton;
  aBlock[4] = sub_10001AD58;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100218A94;
  aBlock[3] = &unk_1002C9E98;
  NSArray v8 = _Block_copy(aBlock);
  id v9 = a4;
  swift_retain();
  swift_release();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for BottomToTopLayout();
  v10 = [(BottomToTopLayout *)&v12 initWithSectionProvider:v8 configuration:v9];
  swift_release();

  _Block_release(v8);
  return v10;
}

- (_TtC17SequoiaTranslator17BottomToTopLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator17BottomToTopLayout_cachedAttributes) = (Class)&_swiftEmptyDictionarySingleton;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BottomToTopLayout();
  return [(BottomToTopLayout *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end