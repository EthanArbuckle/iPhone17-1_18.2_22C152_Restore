@interface FMAccessoryDetailView
- (_TtC6FindMy21FMAccessoryDetailView)initWithCoder:(id)a3;
- (void)handleAction;
- (void)handleFirmwareUpdate;
- (void)handleSerialReveal;
@end

@implementation FMAccessoryDetailView

- (_TtC6FindMy21FMAccessoryDetailView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002E3F90();
}

- (void)handleAction
{
  v2 = self;
  sub_1002E34EC();
}

- (void)handleFirmwareUpdate
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = Strong;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v6 = self;
    swift_unknownObjectRetain();
    sub_1003B3B94((uint64_t)sub_1002E3F88, v5);

    swift_unknownObjectRelease();
    swift_release();
  }
}

- (void)handleSerialReveal
{
  v2 = self;
  sub_1002E3758();
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_manufacturerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_serialNumber));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_firmware));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy21FMAccessoryDetailView_firmwareUpdate);
}

@end