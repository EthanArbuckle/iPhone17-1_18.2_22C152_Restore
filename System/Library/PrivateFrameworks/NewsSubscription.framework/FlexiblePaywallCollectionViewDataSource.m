@interface FlexiblePaywallCollectionViewDataSource
- (_TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource)init;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
@end

@implementation FlexiblePaywallCollectionViewDataSource

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource_layoutProvider), *(void *)&self->layoutProvider[OBJC_IVAR____TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource_layoutProvider+ 16]);
  id v6 = a3;
  v7 = self;
  swift_retain();
  sub_1BFBD25E8();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v8 = *(void *)(v10 + 16);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1BFBD2038();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2008();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_1BFB72684((uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  uint64_t v7 = sub_1BFBD2038();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2008();
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_1BFB72FAC((uint64_t)v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (_TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource)init
{
  result = (_TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource_layoutProvider);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource_feedItemSupplementaryRenderer);
  sub_1BFA51A44((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription39FlexiblePaywallCollectionViewDataSource_delegate);
  swift_release();
}

@end