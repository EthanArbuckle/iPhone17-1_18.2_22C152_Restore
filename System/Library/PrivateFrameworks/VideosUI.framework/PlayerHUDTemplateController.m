@interface PlayerHUDTemplateController
- (_TtC8VideosUI27PlayerHUDTemplateController)initWithCoder:(id)a3;
- (void)dealloc;
- (void)handlePIPingDidChange:(id)a3;
- (void)handlePlayerDismissedAfterPIPing:(id)a3;
- (void)vui_viewDidDisappear:(BOOL)a3;
- (void)vui_viewDidLayoutSubviews;
- (void)vui_viewDidLoad;
- (void)vui_viewWillAppear:(BOOL)a3;
@end

@implementation PlayerHUDTemplateController

- (void)vui_viewDidLoad
{
  v2 = self;
  sub_1E2FA67A8();
}

- (void)vui_viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1E2FA6A2C(a3, (SEL *)&selRef_vui_viewWillAppear_);
}

- (void)vui_viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1E2FA6A2C(a3, (SEL *)&selRef_vui_viewDidDisappear_);
}

- (void)vui_viewDidLayoutSubviews
{
  v2 = self;
  sub_1E2FA6D78();
}

- (void)dealloc
{
  v2 = self;
  sub_1E2FA6EC0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI27PlayerHUDTemplateController_nowPlayingTabDelegate);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI27PlayerHUDTemplateController_targetResponderForPendingEventHandling));
  swift_bridgeObjectRelease();
}

- (void)handlePlayerDismissedAfterPIPing:(id)a3
{
}

- (void)handlePIPingDidChange:(id)a3
{
}

- (_TtC8VideosUI27PlayerHUDTemplateController)initWithCoder:(id)a3
{
  return (_TtC8VideosUI27PlayerHUDTemplateController *)sub_1E2FA9D64(a3);
}

@end