@interface FMItemMarkAsLostView
- (_TtC6FindMy20FMItemMarkAsLostView)initWithCoder:(id)a3;
- (void)handleAction;
- (void)handleStatusRowTap;
@end

@implementation FMItemMarkAsLostView

- (_TtC6FindMy20FMItemMarkAsLostView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10050D8E8();
}

- (void)handleAction
{
  v2 = self;
  sub_10050D638();
}

- (void)handleStatusRowTap
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v3 = self;
    sub_1003B2584();

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy20FMItemMarkAsLostView_delegate);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy20FMItemMarkAsLostView_lostStatusRow);
}

@end