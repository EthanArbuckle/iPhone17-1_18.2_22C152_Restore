@interface TTRWorkflowViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithCoder:(id)a3;
- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithRootViewController:(id)a3;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)handleCachedControl:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)viewDidLoad;
@end

@implementation TTRWorkflowViewController

- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12PhotosUICore25TTRWorkflowViewController_actionCache;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1A9F9D774(MEMORY[0x1E4FBC860]);
  id v6 = a3;

  result = (_TtC12PhotosUICore25TTRWorkflowViewController *)sub_1AB23C1FC();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TTRWorkflowViewController();
  id v2 = v6.receiver;
  [(TTRWorkflowViewController *)&v6 viewDidLoad];
  objc_msgSend(v2, sel_setNavigationBarHidden_animated_, 1, 0, v6.receiver, v6.super_class);
  id v3 = objc_msgSend(v2, sel_interactivePopGestureRecognizer);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_setDelegate_, v2);
  }
  id v5 = objc_msgSend(v2, sel_interactivePopGestureRecognizer);
  objc_msgSend(v5, sel_setEnabled_, 1);
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1A9F9D938((uint64_t)v5);
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  id v3 = self;
  id v4 = sub_1A9F9DA40();

  return v4;
}

- (void)handleCachedControl:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A9F96844(v4);
}

- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  result = (_TtC12PhotosUICore25TTRWorkflowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  result = (_TtC12PhotosUICore25TTRWorkflowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICore25TTRWorkflowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(TTRWorkflowViewController *)v5 viewControllers];
  sub_1A9B21070(0, (unint64_t *)&qword_1E9820A40);
  unint64_t v7 = sub_1AB23AADC();

  if (v7 >> 62) {
    _s12PhotosUICore13SpriteBuilderV11buildEither5firstSayAA0C13Configuration_pGAG_tFZ_0();
  }
  uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);

  swift_bridgeObjectRelease();
  return v8 > 1;
}

@end