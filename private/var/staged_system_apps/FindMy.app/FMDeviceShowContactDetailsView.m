@interface FMDeviceShowContactDetailsView
- (_TtC6FindMy30FMDeviceShowContactDetailsView)initWithCoder:(id)a3;
- (void)setupSubviews;
- (void)showContactDetailsRowTap;
@end

@implementation FMDeviceShowContactDetailsView

- (_TtC6FindMy30FMDeviceShowContactDetailsView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC6FindMy30FMDeviceShowContactDetailsView_showContactDetailsSwitch;
  uint64_t v5 = qword_1006AE460;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  if (qword_1006AE228 != -1) {
    swift_once();
  }
  double v7 = *(double *)&qword_1006D20C8;
  id v8 = objc_allocWithZone((Class)type metadata accessor for FMSettingRowView());
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_100512828(1, v7);
  *(void *)&self->super.titleLabel[OBJC_IVAR____TtC6FindMy30FMDeviceShowContactDetailsView_delegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC6FindMy30FMDeviceShowContactDetailsView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)setupSubviews
{
  v2 = self;
  sub_10044D154();
}

- (void)showContactDetailsRowTap
{
  v2 = self;
  sub_10044D480();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy30FMDeviceShowContactDetailsView_showContactDetailsSwitch));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy30FMDeviceShowContactDetailsView_delegate);

  swift_bridgeObjectRelease();
}

@end