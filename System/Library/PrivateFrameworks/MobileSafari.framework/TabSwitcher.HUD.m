@interface TabSwitcher.HUD
- (_TtCC12MobileSafari11TabSwitcher3HUD)initWithCoder:(id)a3;
- (_TtCC12MobileSafari11TabSwitcher3HUD)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
@end

@implementation TabSwitcher.HUD

- (void)layoutSubviews
{
  v2 = self;
  sub_18C360D1C();
}

- (_TtCC12MobileSafari11TabSwitcher3HUD)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari11TabSwitcher3HUD *)sub_18C4606F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)sceneWillEnterForeground:(id)a3
{
}

- (_TtCC12MobileSafari11TabSwitcher3HUD)initWithCoder:(id)a3
{
  return (_TtCC12MobileSafari11TabSwitcher3HUD *)sub_18C5D1B0C(a3);
}

- (void)sceneDidEnterBackground:(id)a3
{
}

- (void).cxx_destruct
{
  sub_18C35B2F4((uint64_t)self + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_content, &qword_1E9177248);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_captureView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_blurrableContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_materialView));

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari11TabSwitcher3HUD_systemSnapshotBackgroundView);
}

@end