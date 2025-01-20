@interface SharedWithYouFeedViewController
- (_TtC7NewsUI231SharedWithYouFeedViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI231SharedWithYouFeedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation SharedWithYouFeedViewController

- (_TtC7NewsUI231SharedWithYouFeedViewController)initWithCoder:(id)a3
{
  result = (_TtC7NewsUI231SharedWithYouFeedViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI231SharedWithYouFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI231SharedWithYouFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI231SharedWithYouFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231SharedWithYouFeedViewController_blueprintViewController));
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231SharedWithYouFeedViewController_userInfo));
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF363258();
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(SharedWithYouFeedViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI231SharedWithYouFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DF3638DC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_1DF363D30(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(SharedWithYouFeedViewController *)&v5 viewWillDisappear:v3];
  swift_getObjectType();
  sub_1DFDF2040();
  sub_1DFDF1640();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(SharedWithYouFeedViewController *)&v5 viewDidDisappear:v3];
  sub_1DFDF2390();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(SharedWithYouFeedViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF365550();
}

- (void)scrollToTopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_1DFDF30E0();
  id v5 = (id)sub_1DFDF26C0();
  swift_release();
  objc_msgSend(v5, sel_ts_scrollToTop_, v3);
}

@end