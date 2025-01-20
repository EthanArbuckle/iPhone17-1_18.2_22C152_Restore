@interface FlexiblePaywallCollectionViewLayout
- (CGSize)collectionViewContentSize;
- (_TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout)init;
- (_TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)prepareLayout;
@end

@implementation FlexiblePaywallCollectionViewLayout

- (_TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout)initWithCoder:(id)a3
{
  result = (_TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *)sub_1BFBD4E58();
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  v2 = self;
  sub_1BFB52A14();
}

- (CGSize)collectionViewContentSize
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout_layoutProvider), *(void *)((char *)&self->super._collectionViewBoundsSize.height+ OBJC_IVAR____TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout_layoutProvider));
  v3 = self;
  swift_retain();
  sub_1BFBD25E8();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  double v4 = v6;
  double v5 = v7;
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_1BFBD2038();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  double v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2008();
  v8 = self;
  v9 = (void *)sub_1BFB53DF4((uint64_t)v7, &OBJC_IVAR____TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout_itemAttributes);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_1BFBD2038();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2008();
  v9 = self;
  v10 = (void *)sub_1BFB53DF4((uint64_t)v8, &OBJC_IVAR____TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout_supplementaryItemAttributes);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = self;
  uint64_t v8 = sub_1BFB53984(x, y, width, height);

  if (v8)
  {
    sub_1BFB53DB4();
    v9 = (void *)sub_1BFBD4808();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (_TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout)init
{
  CGSize result = (_TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription35FlexiblePaywallCollectionViewLayout_layoutProvider);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end