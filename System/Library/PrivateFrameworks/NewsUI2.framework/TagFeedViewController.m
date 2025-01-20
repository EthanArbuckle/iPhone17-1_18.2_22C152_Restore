@interface TagFeedViewController
- (_TtC7NewsUI221TagFeedViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI221TagFeedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)didPullToRefreshWithSender:(id)a3;
- (void)gutterViewBoundsDidChange;
- (void)offlineStatusBannerRequestedForceReload;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation TagFeedViewController

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1DFDF0490();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(TagFeedViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_feedDescriptor));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_blueprintViewController));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_refreshControl));
  swift_release();
  objc_release(*(id *)((char *)&self->super._view
                     + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_debugButtonConfiguration));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_tipModelAvailability;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (_TtC7NewsUI221TagFeedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DEEC7B30();
}

- (_TtC7NewsUI221TagFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI221TagFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DEEC0C64();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(TagFeedViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI221TagFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    id v4 = v3;
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

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DEEC1C90(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(TagFeedViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DEEC7D90();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DEEC234C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(TagFeedViewController *)&v5 viewWillDisappear:v3];
  sub_1DFDF1640();
  sub_1DFDF04A0();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v5.receiver;
  [(TagFeedViewController *)&v5 viewDidDisappear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC7NewsUI221TagFeedViewController_refreshControl], sel_endRefreshing, v5.receiver, v5.super_class);
}

- (void)viewSafeAreaInsetsDidChange
{
  v2 = self;
  sub_1DEEC299C();
}

- (void)didPullToRefreshWithSender:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1DFDECD00();
}

- (void)offlineStatusBannerRequestedForceReload
{
  v2 = self;
  sub_1DEEC18F8();
}

- (void)gutterViewBoundsDidChange
{
  v2 = self;
  sub_1DEEC4120();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_1DEEC6B84(v4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  uint64_t v5 = sub_1DFDF9080();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  double v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  objc_super v15 = self;
  if (sub_1DFDFE950())
  {
    uint64_t v10 = *(uint64_t *)((char *)&v15->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_eventHandler);
    (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E4F7FE70], v5);
    uint64_t v11 = *(void *)(v10 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 112))(v8, ObjectType, v11);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {

    double v13 = v15;
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  uint64_t v7 = sub_1DFDF9080();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  v17 = self;
  if ((sub_1DFDFE950() & 1) != 0 && !a4)
  {
    uint64_t v13 = *(uint64_t *)((char *)&v17->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_eventHandler);
    (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, *MEMORY[0x1E4F7FE70], v7);
    uint64_t v14 = *(void *)(v13 + 40);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 112))(v10, ObjectType, v14);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {

    double v12 = v17;
  }
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_1DFDF30E0();
  id v5 = (id)sub_1DFDF26C0();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_dismissKeyboard_, v3, (char *)objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedViewController_feedDescriptor), sel_feedConfiguration)- 12 < (char *)0xFFFFFFFFFFFFFFFDLL);
}

@end