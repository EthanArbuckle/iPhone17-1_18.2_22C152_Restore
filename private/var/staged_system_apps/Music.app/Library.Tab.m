@interface Library.Tab
- (id)musicTabBarController:(id)a3 tab:(id)a4 itemsForBeginningDragSession:(id)a5;
- (id)tabBarController:(id)a3 displayedViewControllersForTab:(id)a4 proposedViewControllers:(id)a5;
- (id)tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5;
- (id)tabBarController:(id)a3 sidebar:(id)a4 itemForRequest:(id)a5;
- (unint64_t)musicTabBarController:(id)a3 sidebarAction:(id)a4 group:(id)a5 operationForAcceptingItemsFromDropSession:(id)a6;
- (unint64_t)tabBarController:(id)a3 tab:(id)a4 operationForAcceptingItemsFromDropSession:(id)a5;
- (void)dealloc;
- (void)musicTabBarController:(id)a3 sidebarAction:(id)a4 group:(id)a5 acceptItemsFromDropSession:(id)a6;
- (void)tabBarController:(id)a3 displayOrderDidChangeForGroup:(id)a4;
- (void)tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5;
- (void)tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5;
- (void)tabBarController:(id)a3 tab:(id)a4 acceptItemsFromDropSession:(id)a5;
- (void)tabBarController:(id)a3 visibilityDidChangeForTabs:(id)a4;
@end

@implementation Library.Tab

- (void)dealloc
{
  v2 = self;
  v3 = *(void (**)(_TtCE5MusicO9MusicCore7Library3Tab *, _UNKNOWN **))(*(void *)*CloudLibrary.StatusObserver.shared.unsafeMutableAddressor()
                                                                                + 232);
  v4 = v2;
  swift_retain();
  v3(v4, &off_100FD5870);
  swift_release();

  v5.receiver = v4;
  v5.super_class = (Class)_s3TabCMa();
  [(Library.Tab *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCE5MusicO9MusicCore7Library3Tab_createdPlaylist, &qword_10109EC90);
  swift_release();
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtCE5MusicO9MusicCore7Library3Tab____lazy_storage___playlistSortButton));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (id)musicTabBarController:(id)a3 tab:(id)a4 itemsForBeginningDragSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_100652580(v9, a5);

  swift_unknownObjectRelease();
  sub_100652E34();
  v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v11.super.isa;
}

- (unint64_t)tabBarController:(id)a3 tab:(id)a4 operationForAcceptingItemsFromDropSession:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  swift_unknownObjectRetain();
  id v9 = self;
  sub_1006502C8(v8, v7, (uint64_t)&v12);
  if (v13)
  {
    sub_100068978(&v12, (uint64_t)v14);
    unint64_t v10 = sub_100652750(v14);
    sub_1000760E4((uint64_t)v14);

    swift_unknownObjectRelease();
  }
  else
  {
    sub_1000637B8((uint64_t)&v12, (uint64_t *)&unk_1010B4A40);

    swift_unknownObjectRelease();
    return 0;
  }
  return v10;
}

- (void)tabBarController:(id)a3 tab:(id)a4 acceptItemsFromDropSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  unint64_t v10 = self;
  sub_100650650(v8, v9, (uint64_t)a5);

  swift_unknownObjectRelease();
}

- (unint64_t)musicTabBarController:(id)a3 sidebarAction:(id)a4 group:(id)a5 operationForAcceptingItemsFromDropSession:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  swift_unknownObjectRetain();
  long long v12 = self;
  sub_100650C98(v10, v9, (uint64_t)&v15);
  if (v16)
  {
    sub_100068978(&v15, (uint64_t)v17);
    unint64_t v13 = sub_100652750(v17);
    sub_1000760E4((uint64_t)v17);

    swift_unknownObjectRelease();
  }
  else
  {
    sub_1000637B8((uint64_t)&v15, (uint64_t *)&unk_1010B4A40);

    swift_unknownObjectRelease();
    return 0;
  }
  return v13;
}

- (void)musicTabBarController:(id)a3 sidebarAction:(id)a4 group:(id)a5 acceptItemsFromDropSession:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  swift_unknownObjectRetain();
  unint64_t v13 = self;
  sub_100650F54(v10, v11, (uint64_t)v12, (uint64_t)a6);

  swift_unknownObjectRelease();
}

- (void)tabBarController:(id)a3 visibilityDidChangeForTabs:(id)a4
{
  sub_100057778(0, (unint64_t *)&qword_10109AB10);
  unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  id v8 = self;
  sub_100352D58(v6);

  swift_bridgeObjectRelease();
}

- (void)tabBarController:(id)a3 displayOrderDidChangeForGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_100676924(v7);
}

- (id)tabBarController:(id)a3 displayedViewControllersForTab:(id)a4 proposedViewControllers:(id)a5
{
  sub_100057778(0, (unint64_t *)&qword_101099260);
  unint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v9 = a3;
  id v10 = a4;
  id v11 = self;
  sub_100675858(v9, (uint64_t)v10, v8);

  swift_bridgeObjectRelease();
  v12.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (id)tabBarController:(id)a3 sidebar:(id)a4 itemForRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (*)(char *, uint64_t))a5;
  id v11 = self;
  NSArray v12 = sub_100676BA4(v10);

  return v12;
}

- (void)tabBarController:(id)a3 sidebar:(id)a4 willBeginDisplayingTab:(id)a5
{
  swift_beginAccess();
  id v9 = a5;
  id v10 = a3;
  id v11 = a4;
  NSArray v12 = self;
  sub_1005EAF10(&v14, v9);
  unint64_t v13 = v14;
  swift_endAccess();
}

- (void)tabBarController:(id)a3 sidebar:(id)a4 didEndDisplayingTab:(id)a5
{
  swift_beginAccess();
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  NSArray v12 = self;
  unint64_t v13 = (void *)sub_1001C033C(v11);
  swift_endAccess();
}

- (id)tabBarController:(id)a3 sidebar:(id)a4 contextMenuConfigurationForTab:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  NSArray v12 = sub_1006777A8((uint64_t)v8, v10);

  return v12;
}

@end