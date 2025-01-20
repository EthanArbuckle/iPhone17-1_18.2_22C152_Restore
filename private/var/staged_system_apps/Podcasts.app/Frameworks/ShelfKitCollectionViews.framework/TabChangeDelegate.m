@interface TabChangeDelegate
- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4;
- (_TtC23ShelfKitCollectionViews17TabChangeDelegate)init;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)tabBarController:(id)a3 didSelectViewController:(id)a4;
@end

@implementation TabChangeDelegate

- (BOOL)tabBarController:(id)a3 shouldSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_CC7C0(v6, v7);

  return 1;
}

- (void)tabBarController:(id)a3 didSelectViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_CE1A4();
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  v5 = *(void (**)(id, BOOL))((char *)&self->super.isa
                                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_navigationStackUpdateHandler);
  if (v5)
  {
    BOOL v6 = a5;
    id v9 = a3;
    id v10 = a4;
    v11 = self;
    sub_3C800((uint64_t)v5);
    v5(v9, v6);
    sub_27760((uint64_t)v5);
  }
}

- (_TtC23ShelfKitCollectionViews17TabChangeDelegate)init
{
  result = (_TtC23ShelfKitCollectionViews17TabChangeDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_metricsPipeline;
  uint64_t v4 = sub_383E20();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_storeDataProvider);
  swift_unknownObjectWeakDestroy();
  sub_27760(*(uint64_t *)((char *)&self->super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_navigationStackUpdateHandler));
  uint64_t v5 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews17TabChangeDelegate_tabChangeUpdateHandler);

  sub_27760(v5);
}

@end