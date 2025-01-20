@interface AirplayAndSettingsControlsView
- (_TtC9SeymourUI30AirplayAndSettingsControlsView)init;
- (_TtC9SeymourUI30AirplayAndSettingsControlsView)initWithCoder:(id)a3;
- (_TtC9SeymourUI30AirplayAndSettingsControlsView)initWithFrame:(CGRect)a3;
- (void)airplayTouchUpInside:(id)a3;
- (void)settingsTouchUpInside:(id)a3;
@end

@implementation AirplayAndSettingsControlsView

- (_TtC9SeymourUI30AirplayAndSettingsControlsView)init
{
  return (_TtC9SeymourUI30AirplayAndSettingsControlsView *)sub_239EBBC7C();
}

- (_TtC9SeymourUI30AirplayAndSettingsControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EBC9F0();
}

- (void)airplayTouchUpInside:(id)a3
{
}

- (void)settingsTouchUpInside:(id)a3
{
}

- (_TtC9SeymourUI30AirplayAndSettingsControlsView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI30AirplayAndSettingsControlsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI30AirplayAndSettingsControlsView_onTapAirplay));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI30AirplayAndSettingsControlsView_onTapSettings));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30AirplayAndSettingsControlsView_airplayButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI30AirplayAndSettingsControlsView_settingsButton);
}

@end