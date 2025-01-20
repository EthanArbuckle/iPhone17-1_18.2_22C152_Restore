@interface FMLocationSettingsView
- (_TtC6FindMy22FMLocationSettingsView)init;
- (_TtC6FindMy22FMLocationSettingsView)initWithCoder:(id)a3;
- (void)handleChangeMeDevice;
- (void)handleEditLocationName;
@end

@implementation FMLocationSettingsView

- (_TtC6FindMy22FMLocationSettingsView)init
{
  return (_TtC6FindMy22FMLocationSettingsView *)sub_1002EC424();
}

- (_TtC6FindMy22FMLocationSettingsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002EE0CC();
}

- (void)handleChangeMeDevice
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v3 = self;
    sub_10007FD34();

    swift_unknownObjectRelease();
  }
}

- (void)handleEditLocationName
{
  if ((*(unsigned char **)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_locationRow))[OBJC_IVAR____TtC6FindMy22FMSettingSingleRowView_isSelectable] == 1
    && swift_unknownObjectWeakLoadStrong())
  {
    id v3 = self;
    sub_10007FD54();

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_meDeviceRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_locationRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_fromRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_changeMeDeviceButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_shareLocationSwitch));
  sub_100003F10((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMLocationSettingsView_meLocation, (uint64_t *)&unk_1006AF710);
}

@end