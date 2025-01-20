@interface FollowingViewController
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (_TtC7NewsUI223FollowingViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI223FollowingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)contentScrollView;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)scrollToTopAnimated:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)tabBarControllerDidDoubleTapBarButtonItem:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation FollowingViewController

- (_TtC7NewsUI223FollowingViewController)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI223FollowingViewController_previousSelectedIndexPath;
  uint64_t v6 = sub_1DFDE79A0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC7NewsUI223FollowingViewController_viewHasAppearedAtLeastOnce) = 0;
  id v7 = a3;

  result = (_TtC7NewsUI223FollowingViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  swift_retain();
  sub_1DFDF0490();
  swift_release();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(FollowingViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223FollowingViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223FollowingViewController_blueprintViewController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223FollowingViewController_purchaseController));
  swift_unknownObjectRelease();
  sub_1DFACEFE8((uint64_t)self + OBJC_IVAR____TtC7NewsUI223FollowingViewController_previousSelectedIndexPath, (uint64_t (*)(void))sub_1DEA0D580);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223FollowingViewController_offlineProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223FollowingViewController_followingTabGroupManager));
  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DFACA5A0();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1DFACACA0(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1DFACAF28(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(FollowingViewController *)&v5 viewWillDisappear:v3];
  sub_1DFDF04A0();
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_1DFACB23C(a3);
}

- (void)viewWillLayoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)swift_getObjectType();
  v2 = (char *)v15.receiver;
  [(FollowingViewController *)&v15 viewWillLayoutSubviews];
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI223FollowingViewController_blueprintViewController], sel_view, v15.receiver, v15.super_class);
  if (v3)
  {
    id v4 = v3;
    id v5 = objc_msgSend(v2, sel_view);
    if (v5)
    {
      uint64_t v6 = v5;
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

- (void)viewSafeAreaInsetsDidChange
{
  v2 = self;
  sub_1DFACB844();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v7.receiver;
  [(FollowingViewController *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_1DFAD00CC();
}

- (id)contentScrollView
{
  v2 = self;
  sub_1DFDF30E0();
  id v3 = (void *)sub_1DFDF26C0();

  swift_release();
  return v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v5 = a3;
  id v6 = self;
  sub_1DFACB3B8(v5, a4);
}

- (void)delete:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1DFDFF780();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    BOOL v5 = self;
  }
  sub_1DFACBC90();

  sub_1DFACEFE8((uint64_t)v6, (uint64_t (*)(void))sub_1DE9E4C7C);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (a4)
  {
    id v6 = self;
    swift_unknownObjectRetain();
    sub_1DFDFF780();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    objc_super v7 = self;
  }
  char v8 = sub_1DFACC520((uint64_t)a3, (uint64_t)v10);

  sub_1DFACEFE8((uint64_t)v10, (uint64_t (*)(void))sub_1DE9E4C7C);
  return v8 & 1;
}

- (_TtC7NewsUI223FollowingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI223FollowingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)tabBarControllerDidDoubleTapBarButtonItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = self;
  sub_1DFDF30E0();
  id v6 = (id)sub_1DFDF26C0();
  swift_release();
  objc_msgSend(v6, sel_scrollRectToVisible_animated_, 1, 0.0, 0.0, 1.0, 1.0);
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