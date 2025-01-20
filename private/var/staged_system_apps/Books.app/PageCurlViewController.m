@interface PageCurlViewController
- (BOOL)canNavigateInDirection:(int64_t)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)passThroughView:(id)a3 gestureRecognizer:(id)a4 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a5;
- (BOOL)passThroughView:(id)a3 shouldPassthroughHitAtPoint:(CGPoint)a4;
- (_TtC5Books22PageCurlViewController)initWithCoder:(id)a3;
- (_TtC5Books22PageCurlViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5;
- (double)interactiveAnimationDuration;
- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4;
- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4;
- (int64_t)validateTapDirection:(int64_t)a3;
- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6;
- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PageCurlViewController

- (_TtC5Books22PageCurlViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005E9AA8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1005DDE04();
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(PageCurlViewController *)&v6 viewDidLayoutSubviews];
  id v3 = [v2 viewIfLoaded];
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 window];

    if (v5)
    {
      sub_1005DE354(v5);

      id v2 = v5;
    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1005E9D38();
}

- (BOOL)canNavigateInDirection:(int64_t)a3
{
  v4 = self;
  LOBYTE(a3) = sub_1005E1890(a3);

  return a3 & 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = sub_100058D18((uint64_t *)&unk_100B3DF30);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14.receiver = self;
  v14.super_class = ObjectType;
  swift_unknownObjectRetain();
  v12 = self;
  -[PageCurlViewController viewWillTransitionToSize:withTransitionCoordinator:](&v14, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v13 = sub_1007FC9F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  sub_1005DF47C((uint64_t)v11);
  sub_10005AFE8((uint64_t)v11, (uint64_t *)&unk_100B3DF30);
  swift_unknownObjectRelease();
}

- (_TtC5Books22PageCurlViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  result = (_TtC5Books22PageCurlViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
  sub_1002F0080((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_containerBuilder]);
  swift_release();
  sub_10023E454((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_contentLayoutProviderProviding]);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_weakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_10023E454((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_readingSettingsProvider]);
  swift_bridgeObjectRelease();
  sub_10005AFE8((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_spreadForResetAfterCurlEnd], (uint64_t *)&unk_100B3DF30);

  sub_10005AFE8((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_spreadBeforeCurl], (uint64_t *)&unk_100B3DF30);
  sub_10005AFE8((uint64_t)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController_pendingDestinationSpread], (uint64_t *)&unk_100B3DF30);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(void **)&self->BEPageViewController_opaque[OBJC_IVAR____TtC5Books22PageCurlViewController____lazy_storage___panGestureRecognizer];
}

- (double)interactiveAnimationDuration
{
  id v2 = self;
  double v3 = sub_1005E5930();

  return v3;
}

- (id)pageViewController:(id)a3 viewControllerBeforeViewController:(id)a4
{
  return sub_1005E5E3C(self, (uint64_t)a2, a3, a4, 1);
}

- (id)pageViewController:(id)a3 viewControllerAfterViewController:(id)a4
{
  return sub_1005E5E3C(self, (uint64_t)a2, a3, a4, 0);
}

- (void)pageViewController:(id)a3 willTransitionToViewControllers:(id)a4
{
  sub_10004A860(0, (unint64_t *)&qword_100B2D950);
  unint64_t v6 = sub_1007FDFF0();
  id v7 = a3;
  v8 = self;
  sub_1005E5EE4(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)pageViewController:(id)a3 didFinishAnimating:(BOOL)a4 previousViewControllers:(id)a5 transitionCompleted:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = a3;
  uint64_t v9 = self;
  sub_1005EA608(v8, v6);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return sub_1005E7BF4(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_gestureRecognizer_shouldRecognizeSimultaneouslyWithGestureRecognizer_);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  char v9 = sub_1005E7954(v6, (uint64_t)v7);

  return v9 & 1;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  sub_10004A860(0, (unint64_t *)&qword_100B2E980);
  id v5 = (_TtC5Books22PageCurlViewController *)a3;
  id v6 = self;
  id v7 = sub_1005DDC24();
  LOBYTE(self) = sub_1007FEB20();

  if ((self & 1) != 0
    && (Strong = (_TtC5Books22PageCurlViewController *)swift_unknownObjectWeakLoadStrong()) != 0)
  {
    char v9 = Strong;
    unsigned __int8 v10 = [(PageCurlViewController *)Strong gestureRecognizerShouldBegin:v5];

    id v5 = v6;
    id v6 = v9;
  }
  else
  {
    unsigned __int8 v10 = 1;
  }

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return sub_1005E7BF4(self, (uint64_t)a2, a3, a4, (SEL *)&selRef_gestureRecognizer_shouldRequireFailureOfGestureRecognizer_);
}

- (int64_t)validateTapDirection:(int64_t)a3
{
  v4 = self;
  int64_t v5 = sub_1005E7CE4(a3);

  return v5;
}

- (BOOL)passThroughView:(id)a3 gestureRecognizer:(id)a4 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a5
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unsigned __int8 v10 = (void *)Strong;
    v11 = (objc_class *)a3;
    v12 = (objc_class *)a4;
    uint64_t v13 = (objc_class *)a5;
    objc_super v14 = self;
    v15.super.super.isa = v11;
    v16.super.isa = v12;
    v17.super.isa = v13;
    BOOL v18 = sub_1007FB060(v15, v16, v17);
  }
  else
  {
    return 0;
  }
  return v18;
}

- (BOOL)passThroughView:(id)a3 shouldPassthroughHitAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = self;
  LOBYTE(self) = sub_1005E803C(v7, x, y);

  return self & 1;
}

@end