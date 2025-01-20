@interface FMStewieSettingsView
- (_TtC6FindMy20FMStewieSettingsView)init;
- (_TtC6FindMy20FMStewieSettingsView)initWithCoder:(id)a3;
- (void)handleButtonRowAction;
@end

@implementation FMStewieSettingsView

- (void)handleButtonRowAction
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    v3 = self;
    sub_10007F31C(1);

    swift_unknownObjectRelease();
  }
}

- (_TtC6FindMy20FMStewieSettingsView)init
{
  return (_TtC6FindMy20FMStewieSettingsView *)sub_100421334();
}

- (_TtC6FindMy20FMStewieSettingsView)initWithCoder:(id)a3
{
  return (_TtC6FindMy20FMStewieSettingsView *)sub_100421648(a3);
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_headerRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_statusRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_learnMoreRow));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy20FMStewieSettingsView_updateLocationButton);
}

@end