@interface EpicInlineViewController
- (_TtC8VideosUI24EpicInlineViewController)initWithCoder:(id)a3;
- (_TtC8VideosUI24EpicInlineViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dealloc;
- (void)handleAppDidEnterBackground:(id)a3;
- (void)handleAppWillEnterForeground:(id)a3;
- (void)handleIsPlaybackUIBeingShownDidChange:(id)a3;
- (void)handleVPPADismissed:(id)a3;
- (void)handleVPPAPresented:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)vui_loadView;
- (void)vui_viewDidAppear:(BOOL)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewWillLayoutSubviews;
- (void)vui_willMoveToParentViewController:(id)a3;
@end

@implementation EpicInlineViewController

- (void)vui_loadView
{
  v2 = self;
  sub_1E31F2FA4();
}

- (void)vui_willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1E31F3478((uint64_t)a3);
}

- (void)vui_viewDidAppear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E31F35A8(v4);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  v3 = self;
  char v4 = OUTLINED_FUNCTION_8_8();
  sub_1E31F3BB8(v4);
}

- (void)vui_viewWillLayoutSubviews
{
  v2 = self;
  sub_1E31F3D28();
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E31F3F2C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1E31F49F8(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_1E31F4D14();
}

- (void).cxx_destruct
{
  sub_1E31F2CBC((uint64_t)self + OBJC_IVAR____TtC8VideosUI24EpicInlineViewController_collectionImpressioner);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24EpicInlineViewController_horizontalStackViewController));
  swift_release();
}

- (void)handleIsPlaybackUIBeingShownDidChange:(id)a3
{
  uint64_t v5 = sub_1E3875C38();
  OUTLINED_FUNCTION_0_4();
  uint64_t v7 = v6;
  MEMORY[0x1F4188790](v8);
  OUTLINED_FUNCTION_14();
  sub_1E3875BE8();
  v9 = self;
  sub_1E31F4ED4();

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v5);
}

- (void)handleAppWillEnterForeground:(id)a3
{
}

- (void)handleAppDidEnterBackground:(id)a3
{
}

- (void)handleVPPADismissed:(id)a3
{
}

- (void)handleVPPAPresented:(id)a3
{
}

- (_TtC8VideosUI24EpicInlineViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E387C928();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8VideosUI24EpicInlineViewController *)sub_1E31F5644(v5, v7, a4);
}

- (_TtC8VideosUI24EpicInlineViewController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI24EpicInlineViewController *)sub_1E31F5758(a3);
}

@end