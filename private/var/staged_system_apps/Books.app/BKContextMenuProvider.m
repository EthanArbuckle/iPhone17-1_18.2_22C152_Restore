@interface BKContextMenuProvider
+ (id)getInstance;
- (BKContextMenuProvider)init;
- (id)analyticsAssetPropertyProviderForDataModel:(id)a3;
- (id)menuElementsForViewController:(id)a3 dataModel:(id)a4;
- (void)menuElementsWithDataModel:(BSUIContextActionDataModel *)a3 viewController:(UIViewController *)a4 completion:(id)a5;
- (void)performRemoveWithDataModel:(id)a3 forViewController:(id)a4 completion:(id)a5;
- (void)showShareSheetWithDataModel:(BSUIContextActionDataModel *)a3 forViewController:(UIViewController *)a4 completion:(id)a5;
@end

@implementation BKContextMenuProvider

+ (id)getInstance
{
  if (qword_100B22A80 != -1) {
    swift_once();
  }
  v0 = (void *)static ContextMenuProvider.shared;

  return v0;
}

- (id)menuElementsForViewController:(id)a3 dataModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100416954(v7, v6);

  sub_10004A860(0, (unint64_t *)&qword_100B2C170);
  v9.super.isa = sub_1007FDFE0().super.isa;
  swift_bridgeObjectRelease();

  return v9.super.isa;
}

- (id)analyticsAssetPropertyProviderForDataModel:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = (void *)_s5Books19ContextMenuProviderC022analyticsAssetPropertyD03forSo07BAAssetgD0_pSg11BookStoreUI0B15ActionDataModelC_tF_0(v4);

  return v6;
}

- (void)showShareSheetWithDataModel:(BSUIContextActionDataModel *)a3 forViewController:(UIViewController *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100B33078;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100B33080;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1006EB59C((uint64_t)v11, (uint64_t)&unk_100B33088, (uint64_t)v16);
  swift_release();
}

- (void)performRemoveWithDataModel:(id)a3 forViewController:(id)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_100242DB4;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  ContextMenuProvider.performRemove(with:for:on:)(v10, v11, (uint64_t)v8, v9);
  sub_10003E138((uint64_t)v8);
}

- (BKContextMenuProvider)init
{
  result = (BKContextMenuProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR___BKContextMenuProvider_figaroProvider);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)menuElementsWithDataModel:(BSUIContextActionDataModel *)a3 viewController:(UIViewController *)a4 completion:(id)a5
{
  uint64_t v9 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_100B33050;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_100B2C0F0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1006EB59C((uint64_t)v11, (uint64_t)&unk_100B33060, (uint64_t)v16);
  swift_release();
}

@end