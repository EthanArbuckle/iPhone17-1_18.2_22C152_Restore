@interface StackTemplateController
- (BOOL)shouldRubberbandElementWithCategory:(unint64_t)a3 in:(id)a4 at:(id)a5;
- (BOOL)vuiScrollViewShouldScrollToTop:(id)a3;
- (_TtC8VideosUI23StackTemplateController)initWithCoder:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (void)dealloc;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)vuiScrollViewDidEndScrollingAnimation:(id)a3;
- (void)vuiScrollViewDidScroll:(id)a3;
- (void)vuiScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)vui_didMoveToParentViewController:(id)a3;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillDisappear:(BOOL)a3;
- (void)vui_willMoveToParentViewController:(id)a3;
- (void)willEnterForeground:(id)a3;
@end

@implementation StackTemplateController

- (_TtC8VideosUI23StackTemplateController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3564EC8();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E356505C();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E3565D70();
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3567430(v4);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  id v3 = self;
  OUTLINED_FUNCTION_8_8();
  sub_1E35674CC();
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E3567788(v4);
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E35679B0();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1E3568F7C((uint64_t)a4, width, height);
  swift_unknownObjectRelease();
}

- (void)vui_willMoveToParentViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  v6 = (void *)OUTLINED_FUNCTION_8_8();
  sub_1E3569164(v6);
}

- (void)vui_didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = OUTLINED_FUNCTION_8_8();
  sub_1E3569218(v6);
}

- (int64_t)preferredStatusBarStyle
{
  v2 = self;
  id v3 = sub_1E35692FC();

  return (int64_t)v3;
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (void)willEnterForeground:(id)a3
{
  OUTLINED_FUNCTION_128();
  sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v4);
  OUTLINED_FUNCTION_14();
  sub_1E3875BE8();
  id v5 = v3;
  sub_1E356935C();

  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_86_0();
  v6();
}

- (void)vuiScrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  uint64_t v6 = (void *)OUTLINED_FUNCTION_0_25();
  sub_1E356A76C(v6);
}

- (BOOL)vuiScrollViewShouldScrollToTop:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  uint64_t v7 = OUTLINED_FUNCTION_12_15();
  LOBYTE(self) = sub_1E356ADBC(v7);

  return self & 1;
}

- (BOOL)shouldRubberbandElementWithCategory:(unint64_t)a3 in:(id)a4 at:(id)a5
{
  OUTLINED_FUNCTION_44_7();
  uint64_t v7 = v6;
  v9 = v8;
  sub_1E38764B8();
  OUTLINED_FUNCTION_0_4();
  MEMORY[0x1F4188790](v10);
  OUTLINED_FUNCTION_6();
  sub_1E3876448();
  id v11 = v7;
  id v12 = v9;
  uint64_t v13 = OUTLINED_FUNCTION_12_15();
  sub_1E356AE88(v13, (uint64_t)v11, v5);

  OUTLINED_FUNCTION_53_0();
  v14();
  OUTLINED_FUNCTION_69();
  return result;
}

- (void)vuiScrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7 = a3;
  id v11 = self;
  double v8 = OUTLINED_FUNCTION_11_2();
  sub_1E356B01C(v8, v10, v9, &a5->x);
}

- (void)vuiScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  OUTLINED_FUNCTION_0_25();
  sub_1E356B308();
}

- (void)dealloc
{
  v2 = self;
  sub_1E356C6F4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23StackTemplateController_navBarGradientView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23StackTemplateController_statusBarGradientView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23StackTemplateController_accountMessageViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI23StackTemplateController_targetParentController));
  id v3 = (char *)self + OBJC_IVAR____TtC8VideosUI23StackTemplateController_pagePerformanceProvider;
  sub_1E2F6ABF0((uint64_t)v3);
}

@end