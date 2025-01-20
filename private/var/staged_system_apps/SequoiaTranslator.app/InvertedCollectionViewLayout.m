@interface InvertedCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4;
- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSection:(id)a3;
- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSectionProvider:(id)a3;
- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)gestureRecognizerViewForSwipeActionController:(id)a3;
- (id)itemContainerViewForSwipeActionController:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4;
- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4;
- (int64_t)layoutDirectionForSwipeActionController:(id)a3;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForTransitionFromLayout:(id)a3;
- (void)prepareForTransitionToLayout:(id)a3;
@end

@implementation InvertedCollectionViewLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  unint64_t v8 = sub_1001144D8(x, y, width, height);

  if (v8)
  {
    sub_10000B0CC(0, (unint64_t *)&qword_1002EF298);
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = self;
  id v9 = sub_1001149C8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for InvertedCollectionViewLayout();
  id v4 = a3;
  id v5 = v7.receiver;
  [(InvertedCollectionViewLayout *)&v7 invalidateLayoutWithContext:v4];
  if (objc_msgSend(v4, "invalidateEverything", v7.receiver, v7.super_class))
  {
    id v6 = sub_10011445C();
    [v6 resetSwipedItemAnimated:0 completion:0];

    id v4 = v5;
    id v5 = v6;
  }
}

- (void)prepareForTransitionFromLayout:(id)a3
{
}

- (void)prepareForTransitionToLayout:(id)a3
{
}

- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSection:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_cachedAttributes) = (Class)_swiftEmptyArrayStorage;
  id v4 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_swipeDelegate;
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout____lazy_storage___swipeController) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InvertedCollectionViewLayout();
  return [(InvertedCollectionViewLayout *)&v6 initWithSection:a3];
}

- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_cachedAttributes) = (Class)_swiftEmptyArrayStorage;
  objc_super v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_swipeDelegate;
  *(_OWORD *)objc_super v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout____lazy_storage___swipeController) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for InvertedCollectionViewLayout();
  return [(InvertedCollectionViewLayout *)&v8 initWithSection:a3 configuration:a4];
}

- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSectionProvider:(id)a3
{
  v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (_TtC17SequoiaTranslator28InvertedCollectionViewLayout *)sub_1001150B0((uint64_t)sub_10001AE10, v4);
}

- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  id v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtC17SequoiaTranslator28InvertedCollectionViewLayout *)sub_100115214((uint64_t)sub_10001AD58, v6, a4);
}

- (_TtC17SequoiaTranslator28InvertedCollectionViewLayout)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_cachedAttributes) = (Class)_swiftEmptyArrayStorage;
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_swipeDelegate;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout____lazy_storage___swipeController) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InvertedCollectionViewLayout();
  return [(InvertedCollectionViewLayout *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout_swipeDelegate, (uint64_t *)&unk_1002F02B0);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator28InvertedCollectionViewLayout____lazy_storage___swipeController);
}

- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  uint64_t v11 = self;
  sub_100115DD0();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (id)gestureRecognizerViewForSwipeActionController:(id)a3
{
  return sub_100115618(self, (uint64_t)a2, a3);
}

- (id)itemContainerViewForSwipeActionController:(id)a3
{
  return sub_100115618(self, (uint64_t)a2, a3);
}

- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4
{
  return sub_100115B64(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_100115F98);
}

- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  double v13 = self;
  sub_1001156F4((uint64_t)v11, x, y);

  v14.super.isa = IndexPath._bridgeToObjectiveC()().super.isa;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v14.super.isa;
}

- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return 0;
}

- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4
{
  return sub_100115B64(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_10011606C);
}

- (int64_t)layoutDirectionForSwipeActionController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(InvertedCollectionViewLayout *)v5 collectionView];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = [v6 traitCollection];
    id v9 = [v8 layoutDirection];

    return (int64_t)v9;
  }
  else
  {
    int64_t result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

@end