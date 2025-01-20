@interface TodayViewController
- (BOOL)scrollViewShouldScrollToTop:(id)a3;
- (_TtC7NewsUI219TodayViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI219TodayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)deselect;
- (void)didPullToRefresh;
- (void)dismissKeyboard;
- (void)offlineStatusBannerRequestedForceReload;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidScrollToTop:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)significantTimeChangeDidOccur;
- (void)startTraversingWithDirection:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TodayViewController

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(TodayViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI219TodayViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      v6 = v5;
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

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DEA099A0(v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DE99D6D4(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DE9BD0E4(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DE9EA794();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  swift_retain();
  sub_1DFDF0490();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(TodayViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219TodayViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI219TodayViewController_blueprintViewController));
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI219TodayViewController_barCompressionManager));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI219TodayViewController_refreshControl));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI219TodayViewController_mastheadViewProviderDelegate);
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI219TodayViewController_miniMastheadViewProviderDelegate);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI219TodayViewController_tipModelAvailability);
  swift_release();
}

- (_TtC7NewsUI219TodayViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF9593B4();
}

- (_TtC7NewsUI219TodayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI219TodayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1DF9551E4(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1DF9553A8(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(TodayViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF95962C();
}

- (void)dismissKeyboard
{
  v2 = self;
  id v3 = [(TodayViewController *)v2 view];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v3, sel_endEditing_, 1);
  }
  else
  {
    __break(1u);
  }
}

- (void)didPullToRefresh
{
  v2 = self;
  sub_1DFDECD00();
}

- (void)significantTimeChangeDidOccur
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = sub_1DEA0D964((unint64_t *)&qword_1EBAADC08, v4, (void (*)(uint64_t))type metadata accessor for TodayViewController);
  double v9 = self;
  uint64_t v6 = MEMORY[0x1E01DF1F0](ObjectType, v5);
  if (v6)
  {
    objc_super v7 = (_TtC7NewsUI219TodayViewController *)v6;
    swift_getObjectType();
    sub_1DFDF3A50();

    double v8 = v7;
  }
  else
  {
    double v8 = v9;
  }
}

- (void)offlineStatusBannerRequestedForceReload
{
  v2 = self;
  sub_1DF954FB4();
}

- (void)startTraversingWithDirection:(int64_t)a3
{
  id v3 = self;
  sub_1DFDF3100();
}

- (void)deselect
{
  v2 = self;
  sub_1DFDF30E0();
  id v3 = (id)sub_1DFDF26C0();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    objc_super v7 = self;
    sub_1DEA09AB4();
  }
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  if ((objc_msgSend(v4, sel_ts_isScrolling) & 1) == 0) {
    sub_1DEA09AB4();
  }
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  uint64_t v5 = (*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI219TodayViewController_eventHandler))[5];
  uint64_t ObjectType = swift_getObjectType();
  objc_super v7 = *(void (**)(uint64_t, uint64_t))(v5 + 136);
  id v8 = a3;
  double v9 = self;
  v7(ObjectType, v5);

  return 1;
}

- (void)scrollViewDidScrollToTop:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1DEA09AB4();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = (_TtC7NewsUI219TodayViewController *)a3;
  uint64_t v5 = self;
  id v6 = (_TtC7NewsUI219TodayViewController *)[(TodayViewController *)v5 presentedViewController];
  if (v6)
  {
    id v8 = v6;
    type metadata accessor for ContinueReadingViewController();
    objc_super v7 = (void *)swift_dynamicCastClass();
    if (v7) {
      sub_1DFC0AA30(v7);
    }

    id v4 = v5;
  }
  else
  {
    id v8 = v5;
  }
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