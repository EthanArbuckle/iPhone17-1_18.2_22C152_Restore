@interface FollowingNotificationsViewController
- (_TtC7NewsUI236FollowingNotificationsViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI236FollowingNotificationsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FollowingNotificationsViewController

- (_TtC7NewsUI236FollowingNotificationsViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_blueprintReadableContentGuide;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1940]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC7NewsUI236FollowingNotificationsViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (_TtC7NewsUI236FollowingNotificationsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI236FollowingNotificationsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_blueprintViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_blueprintReadableContentGuide));
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_followingNotificationsPrewarm;
  sub_1DEB00924((uint64_t)v3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DEC4CC30();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(FollowingNotificationsViewController *)&v4 viewWillAppear:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4 = self;
  sub_1DEC4CFD8(a3);
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(FollowingNotificationsViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI236FollowingNotificationsViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    objc_super v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      id v6 = v5;
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
  id v5 = a3;
  id v6 = self;
  sub_1DEC4D580((uint64_t)a3);
}

@end