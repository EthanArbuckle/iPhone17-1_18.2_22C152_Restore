@interface MagazineFeedViewController
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (_TtC7NewsUI226MagazineFeedViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI226MagazineFeedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)deselect;
- (void)offlineStatusBannerRequestedForceReload;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)startTraversingWithDirection:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MagazineFeedViewController

- (_TtC7NewsUI226MagazineFeedViewController)initWithCoder:(id)a3
{
  result = (_TtC7NewsUI226MagazineFeedViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI226MagazineFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI226MagazineFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_blueprintViewController));
  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_offlineAlertControllerFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_feedPaywallConfigFactory);
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DEE64338();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DEE64BF0(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DEE64FF0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(MagazineFeedViewController *)&v5 viewWillDisappear:v3];
  sub_1DFDF1640();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = v6.receiver;
  [(MagazineFeedViewController *)&v6 viewDidDisappear:v3];
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DFE1BB30;
  *(unsigned char *)(v5 + 32) = 2;
  sub_1DFDF2390();

  swift_release();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(MagazineFeedViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      objc_super v6 = v5;
      objc_msgSend(v5, sel_bounds);
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      objc_msgSend(v4, sel_setFrame_, v8, v10, v12, v14);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(MagazineFeedViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DEE67E1C();
}

- (void)offlineStatusBannerRequestedForceReload
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_eventHandler);
  id v3 = self;
  sub_1DFDF3160();
  id v4 = objc_allocWithZone((Class)sub_1DFDF3BB0());
  id v7 = (id)sub_1DFDF3B90();
  uint64_t v5 = *(void *)(v2 + 40);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(id, uint64_t, uint64_t))(v5 + 64))(v7, ObjectType, v5);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  uint64_t v5 = (*(void **)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC7NewsUI226MagazineFeedViewController_eventHandler))[5];
  uint64_t ObjectType = swift_getObjectType();
  id v7 = *(void (**)(uint64_t, uint64_t))(v5 + 80);
  id v8 = a3;
  double v9 = self;
  v7(ObjectType, v5);

  return 1;
}

- (void)startTraversingWithDirection:(int64_t)a3
{
  id v3 = self;
  sub_1DFDF3100();
}

- (void)deselect
{
  uint64_t v2 = self;
  sub_1DFDF30E0();
  id v3 = (id)sub_1DFDF26C0();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_1DFDF30E0();
  id v5 = (id)sub_1DFDF26C0();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_dismissKeyboard_, v3, 1);
}

@end