@interface FMMapOptionsView
- (_TtC6FindMy16FMMapOptionsView)initWithCoder:(id)a3;
- (_TtC6FindMy16FMMapOptionsView)initWithFrame:(CGRect)a3;
- (void)mapSettingsButtonAction;
- (void)perspectiveButtonActionWithSender:(id)a3;
@end

@implementation FMMapOptionsView

- (_TtC6FindMy16FMMapOptionsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002D2A9C();
}

- (void)mapSettingsButtonAction
{
  v2 = self;
  sub_1002D1A0C();
}

- (void)perspectiveButtonActionWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1002D2C34();
}

- (_TtC6FindMy16FMMapOptionsView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy16FMMapOptionsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_firstPlatterSeparatorView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_userLocationButton));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_perspectiveButtonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_perspective2dButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy16FMMapOptionsView_perspective3dButton));
  swift_release();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end