@interface NowPlayingTabController_iOS
- (BOOL)_ignoreUnselectedTabsForStateRestoration;
- (BOOL)isNowPlayingPresented;
- (NSMutableArray)mutableChildViewControllers;
- (_TtC12NowPlayingUI27NowPlayingTabController_iOS)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI27NowPlayingTabController_iOS)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12NowPlayingUI27NowPlayingTabController_iOS)initWithTabs:(id)a3;
- (id)_viewControllersInTabBar;
- (void)_rebuildTabBarItemsAnimated:(BOOL)a3;
- (void)_setViewControllers:(id)a3 animated:(BOOL)a4;
- (void)_updateLayoutForTraitCollection:(id)a3;
- (void)dismissNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)presentNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4;
- (void)setMutableChildViewControllers:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation NowPlayingTabController_iOS

- (_TtC12NowPlayingUI27NowPlayingTabController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  sub_91024();
}

- (_TtC12NowPlayingUI27NowPlayingTabController_iOS)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_91024();
}

- (void)viewDidLoad
{
  v2 = self;
  NowPlayingTabController_iOS.viewDidLoad()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  NowPlayingTabController_iOS.viewDidLayoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  NowPlayingTabController_iOS.traitCollectionDidChange(_:)(v9);
}

- (void)presentNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v8 = (void (*)(void))sub_27458;
  }
  else
  {
    v8 = 0;
    uint64_t v7 = 0;
  }
  UITraitCollection_optional v9 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_miniPlayerPaletteInteraction);
  if (v9)
  {
    v11 = self;
    id v10 = v9;
    sub_105374(v8, v7);

    sub_FB70((uint64_t)v8);
  }
  else
  {
    __break(1u);
  }
}

- (void)dismissNowPlayingWithAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_2744C;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  NowPlayingTabController_iOS.dismissNowPlaying(animated:completion:)(a3, v6, v7);
  sub_FB70((uint64_t)v6);
}

- (BOOL)isNowPlayingPresented
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  id v3 = Strong;
  if (Strong) {

  }
  return v3 != 0;
}

- (void)_setViewControllers:(id)a3 animated:(BOOL)a4
{
  sub_E67C(0, (unint64_t *)&qword_1A1770);
  uint64_t v6 = sub_129AB0();
  uint64_t v7 = self;
  NowPlayingTabController_iOS._setViewControllers(_:animated:)((Swift::OpaquePointer)v6, a4);

  swift_bridgeObjectRelease();
}

- (BOOL)_ignoreUnselectedTabsForStateRestoration
{
  return 1;
}

- (id)_viewControllersInTabBar
{
  v2 = self;
  id v3 = [(NowPlayingTabController_iOS *)v2 childViewControllers];
  sub_E67C(0, (unint64_t *)&qword_1A1770);
  unint64_t v4 = sub_129AB0();

  sub_90DFC(v4, (uint64_t)v2);
  swift_bridgeObjectRelease();

  v5.super.isa = sub_129AA0().super.isa;
  swift_bridgeObjectRelease();

  return v5.super.isa;
}

- (void)_rebuildTabBarItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems;
  char v6 = *((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems) = 1;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for NowPlayingTabController_iOS();
  id v7 = v8.receiver;
  [(NowPlayingTabController_iOS *)&v8 _rebuildTabBarItemsAnimated:v3];
  *((unsigned char *)&self->super.super.super.super.isa + v5) = v6;
}

- (void)_updateLayoutForTraitCollection:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems;
  char v6 = *((unsigned char *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_isRebuildingTabBarItems) = 1;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for NowPlayingTabController_iOS();
  id v7 = a3;
  id v8 = v9.receiver;
  [(NowPlayingTabController_iOS *)&v9 _updateLayoutForTraitCollection:v7];
  *((unsigned char *)&self->super.super.super.super.isa + v5) = v6;
}

- (NSMutableArray)mutableChildViewControllers
{
  v2 = self;
  id v3 = NowPlayingTabController_iOS.mutableChildViewControllers.getter();

  return (NSMutableArray *)v3;
}

- (void)setMutableChildViewControllers:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for NowPlayingTabController_iOS();
  [(NowPlayingTabController_iOS *)&v4 setMutableChildViewControllers:a3];
}

- (_TtC12NowPlayingUI27NowPlayingTabController_iOS)initWithTabs:(id)a3
{
  result = (_TtC12NowPlayingUI27NowPlayingTabController_iOS *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS____lazy_storage___paletteView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_miniPlayerPaletteInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS____lazy_storage___miniPlayerViewController));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_miniPlayerAnimator));
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_accessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI27NowPlayingTabController_iOS_separator));

  swift_bridgeObjectRelease();
}

@end