@interface JetActionHandler
- (_TtC11BookStoreUI16JetActionHandler)init;
- (void)performRawActionModel:(NSDictionary *)a3 withParentTracker:(_TtC13BookAnalytics9BATracker *)a4 shouldReportFigaro:(BOOL)a5 sourceViewController:(UIViewController *)a6 completion:(id)a7;
@end

@implementation JetActionHandler

- (void)performRawActionModel:(NSDictionary *)a3 withParentTracker:(_TtC13BookAnalytics9BATracker *)a4 shouldReportFigaro:(BOOL)a5 sourceViewController:(UIViewController *)a6 completion:(id)a7
{
  uint64_t v13 = sub_63BAC((uint64_t *)&unk_3CE280);
  __chkstk_darwin(v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(unsigned char *)(v17 + 32) = a5;
  *(void *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = sub_2E4780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_3C86B8;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_3C86C0;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a6;
  v24 = self;
  sub_1D4150((uint64_t)v15, (uint64_t)&unk_3C86C8, (uint64_t)v20);
  swift_release();
}

- (_TtC11BookStoreUI16JetActionHandler)init
{
  result = (_TtC11BookStoreUI16JetActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end