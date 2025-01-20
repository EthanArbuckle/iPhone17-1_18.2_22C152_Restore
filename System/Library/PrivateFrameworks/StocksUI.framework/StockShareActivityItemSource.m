@interface StockShareActivityItemSource
- (_TtC8StocksUI28StockShareActivityItemSource)init;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4;
- (id)activityViewControllerPlaceholderItem:(id)a3;
@end

@implementation StockShareActivityItemSource

- (_TtC8StocksUI28StockShareActivityItemSource)init
{
  result = (_TtC8StocksUI28StockShareActivityItemSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI28StockShareActivityItemSource_stock;
  uint64_t v4 = sub_20A8C3F00();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8StocksUI28StockShareActivityItemSource_quote;

  sub_20A5199D4((uint64_t)v5);
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  uint64_t v5 = sub_20A8C2530();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  v11 = (char *)&v16 - v10;
  id v12 = a3;
  v13 = self;
  sub_20A8C3E30();

  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
  v14 = (void *)sub_20A8CF7B0();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);

  return v14;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_20A51BB54(a4, (uint64_t)v17);

  uint64_t v9 = v18;
  if (v18)
  {
    uint64_t v10 = __swift_project_boxed_opaque_existential_1(v17, v18);
    uint64_t v11 = *(void *)(v9 - 8);
    double v12 = MEMORY[0x270FA5388](v10);
    v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, double))(v11 + 16))(v14, v12);
    v15 = (void *)sub_20A8CF740();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_20A8C3EF0();
  swift_bridgeObjectRetain();
  sub_20A8CE3D0();
  swift_bridgeObjectRelease();
  sub_20A8C3E60();
  swift_bridgeObjectRetain();
  sub_20A8CE3D0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_20A8CE240();
  swift_bridgeObjectRelease();

  return v9;
}

@end