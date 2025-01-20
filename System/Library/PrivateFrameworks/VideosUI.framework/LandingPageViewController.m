@interface LandingPageViewController
- (_TtC8VideosUI25LandingPageViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI25LandingPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleAppWillEnterForeground:(id)a3;
- (void)handleNLSBubbleTipDidDismissWithNotification:(id)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillDisappear:(BOOL)a3;
- (void)vui_willMoveToParentViewController:(id)a3;
@end

@implementation LandingPageViewController

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E2C4CC38();
}

- (_TtC8VideosUI25LandingPageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E35CD740();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E35CD8EC(v4);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E35CDF8C(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E35CE048(v4);
}

- (void)vui_willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E35CF4FC((uint64_t)a3);
}

- (_TtC8VideosUI25LandingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E35CFC58();
}

- (void).cxx_destruct
{
  sub_1E2BEA2C0((uint64_t)self + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_collectionImpressioner, &qword_1EBF8B120);
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_stackViewController));
  sub_1E2BEA2C0((uint64_t)self + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_lastRefreshTime, (uint64_t *)&unk_1EBF83FD0);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25LandingPageViewController_notificationCenter));
  sub_1E3116404(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8VideosUI25LandingPageViewController_naturalLanguageSearchData), *(void *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC8VideosUI25LandingPageViewController_naturalLanguageSearchData), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC8VideosUI25LandingPageViewController_naturalLanguageSearchData), *(uint64_t *)((char *)&self->super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC8VideosUI25LandingPageViewController_naturalLanguageSearchData));
  swift_release();
  swift_release();
  swift_release();
}

- (void)handleAppWillEnterForeground:(id)a3
{
  OUTLINED_FUNCTION_128();
  uint64_t v5 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_14();
  sub_1E3875BE8();
  id v9 = v3;
  sub_1E35D0374();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v5);
}

- (void)handleNLSBubbleTipDidDismissWithNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E35D0478();
}

@end