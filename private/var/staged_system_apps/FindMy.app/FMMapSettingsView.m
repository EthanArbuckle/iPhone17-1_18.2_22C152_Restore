@interface FMMapSettingsView
- (_TtC6FindMy17FMMapSettingsView)init;
- (_TtC6FindMy17FMMapSettingsView)initWithCoder:(id)a3;
- (void)handleModeTap;
- (void)handleUnitTap;
@end

@implementation FMMapSettingsView

- (void)handleModeTap
{
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 8);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (void)handleUnitTap
{
  v3 = (char *)self + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v4 = *((void *)v3 + 1);
    swift_getObjectType();
    v5 = *(void (**)(void))(v4 + 16);
    v6 = self;
    v5();

    swift_unknownObjectRelease();
  }
}

- (_TtC6FindMy17FMMapSettingsView)init
{
  uint64_t v3 = OBJC_IVAR____TtC6FindMy17FMMapSettingsView_modeSettingRow;
  uint64_t v4 = (objc_class *)type metadata accessor for FMSettingRowView();
  id v5 = objc_allocWithZone(v4);
  v6 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)sub_100512828(1, 0.0);
  uint64_t v7 = OBJC_IVAR____TtC6FindMy17FMMapSettingsView_unitSettingRow;
  id v8 = objc_allocWithZone(v4);
  *(Class *)((char *)&v6->super.super.super.super.isa + v7) = (Class)sub_100512828(1, 0.0);
  *(void *)&v6->super.contentStackView[OBJC_IVAR____TtC6FindMy17FMMapSettingsView_delegate] = 0;
  swift_unknownObjectWeakInit();

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for FMMapSettingsView();
  return [(FMPlatterGroupView *)&v10 init];
}

- (_TtC6FindMy17FMMapSettingsView)initWithCoder:(id)a3
{
  return (_TtC6FindMy17FMMapSettingsView *)sub_1004147F8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_modeSettingRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_unitSettingRow));
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6FindMy17FMMapSettingsView_delegate;

  sub_100068760((uint64_t)v3);
}

@end