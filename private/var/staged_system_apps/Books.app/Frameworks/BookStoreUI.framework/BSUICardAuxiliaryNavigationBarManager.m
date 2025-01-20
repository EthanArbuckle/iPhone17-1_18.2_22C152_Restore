@interface BSUICardAuxiliaryNavigationBarManager
- (BSUICardAuxiliaryNavigationBarManager)init;
- (id)viewControllerIfAvailable;
- (void)createViewControllerForFeedViewController:(BSUIFeedViewController *)a3 shouldReportFigaro:(BOOL)a4 completionHandler:(id)a5;
- (void)viewControllerWhenAvailable:(id)a3;
@end

@implementation BSUICardAuxiliaryNavigationBarManager

- (BSUICardAuxiliaryNavigationBarManager)init
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSUICardAuxiliaryNavigationBarManager_pendingClosures) = (Class)_swiftEmptyArrayStorage;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CardAuxiliaryNavigationBarManager();
  return [(BSUICardAuxiliaryNavigationBarManager *)&v4 init];
}

- (void)createViewControllerForFeedViewController:(BSUIFeedViewController *)a3 shouldReportFigaro:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_63BAC((uint64_t *)&unk_3CE280);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_2E4780();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_3D3800;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_3C86C0;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_1D4150((uint64_t)v11, (uint64_t)&unk_3C86C8, (uint64_t)v16);
  swift_release();
}

- (void)viewControllerWhenAvailable:(id)a3
{
  objc_super v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_2B6460(v5, v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (id)viewControllerIfAvailable
{
  v2 = self;
  v3 = (void *)sub_2B1EEC();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end