@interface FMDeviceMarkAsLostView
- (_TtC6FindMy22FMDeviceMarkAsLostView)initWithCoder:(id)a3;
- (void)handleAction;
- (void)handleStatusRowTap;
@end

@implementation FMDeviceMarkAsLostView

- (_TtC6FindMy22FMDeviceMarkAsLostView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100283C0C();
}

- (void)handleAction
{
  v2 = self;
  sub_1002838F4();
}

- (void)handleStatusRowTap
{
  id v3 = (char *)self + OBJC_IVAR____TtC6FindMy22FMDeviceMarkAsLostView_delegate;
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

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy22FMDeviceMarkAsLostView_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy22FMDeviceMarkAsLostView_lostStatusRow);
}

@end