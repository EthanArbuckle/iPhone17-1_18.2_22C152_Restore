@interface SwipableCollectionViewLayout
- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4;
- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSection:(id)a3;
- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSectionProvider:(id)a3;
- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)gestureRecognizerViewForSwipeActionController:(id)a3;
- (id)itemContainerViewForSwipeActionController:(id)a3;
- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4;
- (id)swipeActionController:(id)a3 leadingSwipeConfigurationForItemAtIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 trailingSwipeConfigurationForItemAtIndexPath:(id)a4;
- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4;
- (int64_t)layoutDirectionForSwipeActionController:(id)a3;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareForTransitionFromLayout:(id)a3;
- (void)prepareForTransitionToLayout:(id)a3;
@end

@implementation SwipableCollectionViewLayout

- (void)invalidateLayoutWithContext:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  id v4 = a3;
  id v5 = v7.receiver;
  [(SwipableCollectionViewLayout *)&v7 invalidateLayoutWithContext:v4];
  if (objc_msgSend(v4, "invalidateEverything", v7.receiver, v7.super_class))
  {
    id v6 = sub_1001D17C4();
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

- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSection:(id)a3
{
  id v4 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate;
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  return [(SwipableCollectionViewLayout *)&v6 initWithSection:a3];
}

- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  objc_super v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate;
  *(_OWORD *)objc_super v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  return [(SwipableCollectionViewLayout *)&v8 initWithSection:a3 configuration:a4];
}

- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSectionProvider:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  objc_super v6 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate;
  *(_OWORD *)objc_super v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController) = 0;
  aBlock[4] = sub_1001D2C4C;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100218A94;
  aBlock[3] = &unk_1002D2850;
  objc_super v7 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  objc_super v8 = [(SwipableCollectionViewLayout *)&v10 initWithSectionProvider:v7];
  swift_release();
  _Block_release(v7);
  return v8;
}

- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  objc_super v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  objc_super v8 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate;
  *(_OWORD *)objc_super v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((void *)v8 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController) = 0;
  aBlock[4] = sub_1001D2BEC;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100218A94;
  aBlock[3] = &unk_1002D2800;
  v9 = _Block_copy(aBlock);
  id v10 = a4;
  swift_retain();
  swift_release();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  v11 = [(SwipableCollectionViewLayout *)&v13 initWithSectionProvider:v9 configuration:v10];
  swift_release();

  _Block_release(v9);
  return v11;
}

- (_TtC17SequoiaTranslator28SwipableCollectionViewLayout)initWithCoder:(id)a3
{
  id v4 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate;
  *(_OWORD *)id v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SwipableCollectionViewLayout();
  return [(SwipableCollectionViewLayout *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_10000B070((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout_swipeDelegate, &qword_1002FB078);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC17SequoiaTranslator28SwipableCollectionViewLayout____lazy_storage___swipeController);
}

- (UIEdgeInsets)swipeActionController:(id)a3 extraInsetsForItemAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  sub_1001D2768();
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
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(SwipableCollectionViewLayout *)v5 collectionView];
  if (v6)
  {
    uint64_t v7 = v6;
    [v6 endEditing:1];

    return v7;
  }
  else
  {
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (id)itemContainerViewForSwipeActionController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(SwipableCollectionViewLayout *)v5 collectionView];
  if (v6)
  {
    uint64_t v7 = v6;

    return v7;
  }
  else
  {
    id result = (id)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  return result;
}

- (id)swipeActionController:(id)a3 viewForItemAtIndexPath:(id)a4
{
  return sub_1001D255C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_100115F98);
}

- (id)swipeActionController:(id)a3 indexPathForTouchLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v8 = type metadata accessor for IndexPath();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = a3;
  double v13 = self;
  sub_1001D20D0(v11, x, y);

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
  return sub_1001D255C(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(char *))sub_1001D2A80);
}

- (int64_t)layoutDirectionForSwipeActionController:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = [(SwipableCollectionViewLayout *)v5 collectionView];
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