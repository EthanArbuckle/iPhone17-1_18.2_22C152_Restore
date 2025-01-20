@interface LibTransitionDetailsViewController
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (UIViewController)detailsViewController;
- (_TtC8VideosUI34LibTransitionDetailsViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI34LibTransitionDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setDetailsViewController:(id)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
- (void)vui_viewWillDisappear:(BOOL)a3;
@end

@implementation LibTransitionDetailsViewController

- (UIViewController)detailsViewController
{
  v2 = sub_1E367C4D8();
  return (UIViewController *)v2;
}

- (void)setDetailsViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E367C564(a3);
}

- (_TtC8VideosUI34LibTransitionDetailsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E367CB30();
}

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E367CC04();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E367CDEC();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E367CF1C(v4);
}

- (void)vui_viewWillDisappear:(BOOL)a3
{
  id v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E367D060(v4);
}

- (_TtC8VideosUI34LibTransitionDetailsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1E387C928();
  }
  id v5 = a4;
  sub_1E367ED40();
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8VideosUI34LibTransitionDetailsViewController_mediaEntity);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34LibTransitionDetailsViewController_detailsViewController));
  sub_1E2BEA314((uint64_t)self + OBJC_IVAR____TtC8VideosUI34LibTransitionDetailsViewController_navigationItemCancellable, &qword_1EBFB29F0);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI34LibTransitionDetailsViewController_navBarTintColor);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

@end