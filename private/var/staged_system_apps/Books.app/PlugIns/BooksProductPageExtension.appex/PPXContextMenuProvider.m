@interface PPXContextMenuProvider
- (_TtC25BooksProductPageExtension22PPXContextMenuProvider)init;
- (id)analyticsAssetPropertyProviderForDataModel:(id)a3;
- (id)menuElementsForViewController:(id)a3 dataModel:(id)a4;
- (void)showShareSheetWithDataModel:(BSUIContextActionDataModel *)a3 forViewController:(UIViewController *)a4 completion:(id)a5;
@end

@implementation PPXContextMenuProvider

- (id)menuElementsForViewController:(id)a3 dataModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1000192CC(v7, v6);

  sub_100010418(0, &qword_100039588);
  v9.super.isa = sub_100023520().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)analyticsAssetPropertyProviderForDataModel:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)_s25BooksProductPageExtension22PPXContextMenuProviderC022analyticsAssetPropertyG03forSo07BAAssetjG0_pSg11BookStoreUI22ContextActionDataModelC_tF_0(v4);

  return v6;
}

- (void)showShareSheetWithDataModel:(BSUIContextActionDataModel *)a3 forViewController:(UIViewController *)a4 completion:(id)a5
{
  uint64_t v9 = sub_1000084A8(&qword_100039540);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1000235B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100039550;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100039560;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_10001DD1C((uint64_t)v11, (uint64_t)&unk_100039570, (uint64_t)v16);
  swift_release();
}

- (_TtC25BooksProductPageExtension22PPXContextMenuProvider)init
{
  result = (_TtC25BooksProductPageExtension22PPXContextMenuProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100008AAC((uint64_t)self + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider);
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end