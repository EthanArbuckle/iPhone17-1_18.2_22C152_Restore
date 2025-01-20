@interface AudioFeedViewController
- (_TtC7NewsUI223AudioFeedViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI223AudioFeedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)offlineStatusBannerRequestedForceReload;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AudioFeedViewController

- (_TtC7NewsUI223AudioFeedViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_mastheadViewProviderDelegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC7NewsUI223AudioFeedViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI223AudioFeedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI223AudioFeedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_blueprintViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_barCompressionManager));
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_mastheadViewProviderDelegate;
  sub_1DEB1DDEC((uint64_t)v3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DF8AB020();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = v9.receiver;
  [(AudioFeedViewController *)&v9 viewWillAppear:v3];
  id v5 = objc_msgSend(v4, sel_view, v9.receiver, v9.super_class);
  if (v5)
  {
    v6 = v5;
    v7 = (void *)sub_1DFDFF3A0();

    if (v7)
    {
      sub_1DFDF30E0();
      uint64_t v8 = sub_1DFDF26C0();
      swift_release();
      sub_1DFDFF3C0();

      id v4 = (id)v8;
    }
  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(AudioFeedViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI223AudioFeedViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
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

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(AudioFeedViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DF8AD200();
}

- (void)offlineStatusBannerRequestedForceReload
{
  v2 = self;
  sub_1DF8AB720();
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