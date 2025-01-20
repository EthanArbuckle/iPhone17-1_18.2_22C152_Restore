@interface FlexiblePaywallCollectionViewDelegate
- (_TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate)init;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
@end

@implementation FlexiblePaywallCollectionViewDelegate

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1BFBD2038();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2008();
  swift_getObjectType();
  if (swift_conformsToProtocol2()) {
    id v12 = a4;
  }
  else {
    id v12 = 0;
  }
  if (v12)
  {
    id v13 = a4;
    id v15 = a3;
    v14 = self;
    sub_1BFBD35A8();
    swift_getObjectType();
    sub_1BFBD38D8();
    sub_1BFBD38C8();
    sub_1BFBD3828();

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_1BFBD2038();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2008();
  swift_getObjectType();
  if (swift_conformsToProtocol2()) {
    id v12 = a4;
  }
  else {
    id v12 = 0;
  }
  if (v12)
  {
    uint64_t v16 = v8;
    id v13 = a4;
    id v15 = a3;
    v14 = self;
    sub_1BFBD35C8();
    swift_getObjectType();
    sub_1BFBD38D8();
    sub_1BFBD38C8();
    uint64_t v8 = v16;
    sub_1BFBD3838();

    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_1BFBD2038();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2008();
  swift_getObjectType();
  if (swift_conformsToProtocol2()) {
    id v13 = a4;
  }
  else {
    id v13 = 0;
  }
  if (v13)
  {
    id v14 = a3;
    id v15 = a4;
    uint64_t v16 = self;
    sub_1BFBD35A8();
    swift_getObjectType();
    sub_1BFBD3848();
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 didEndDisplayingSupplementaryView:(id)a4 forElementOfKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_1BFBD2038();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  id v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD2008();
  swift_getObjectType();
  if (swift_conformsToProtocol2()) {
    id v13 = a4;
  }
  else {
    id v13 = 0;
  }
  if (v13)
  {
    id v14 = a3;
    id v15 = a4;
    uint64_t v16 = self;
    sub_1BFBD35C8();
    swift_getObjectType();
    sub_1BFBD3858();
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (_TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_1BFBD35D8();
  MEMORY[0x1F4188790](v4);
  uint64_t v5 = OBJC_IVAR____TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate_viewportMonitor;
  uint64_t v10 = MEMORY[0x1E4FBC860];
  sub_1BFBC9F04((unint64_t *)&unk_1EBA88580, MEMORY[0x1E4FACB08]);
  sub_1BFBC9EAC();
  sub_1BFBC9F04((unint64_t *)&unk_1EBA88600, (void (*)(uint64_t))sub_1BFBC9EAC);
  v6 = self;
  sub_1BFBD4C88();
  id v7 = objc_allocWithZone((Class)sub_1BFBD35F8());
  *(Class *)((char *)&self->super.isa + v5) = (Class)sub_1BFBD35E8();

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return [(FlexiblePaywallCollectionViewDelegate *)&v9 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription37FlexiblePaywallCollectionViewDelegate_viewportMonitor));
}

@end