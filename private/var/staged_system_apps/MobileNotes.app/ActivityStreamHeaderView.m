@interface ActivityStreamHeaderView
- (_TtC11MobileNotes24ActivityStreamHeaderView)initWithCoder:(id)a3;
- (_TtC11MobileNotes24ActivityStreamHeaderView)initWithFrame:(CGRect)a3;
- (int64_t)_accessibilitySortPriority;
- (void)updateUI;
@end

@implementation ActivityStreamHeaderView

- (int64_t)_accessibilitySortPriority
{
  return 1000;
}

- (_TtC11MobileNotes24ActivityStreamHeaderView)initWithCoder:(id)a3
{
}

- (void)updateUI
{
  v2 = self;
  sub_10001A6F4();
}

- (_TtC11MobileNotes24ActivityStreamHeaderView)initWithFrame:(CGRect)a3
{
  result = (_TtC11MobileNotes24ActivityStreamHeaderView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10015E5E8((uint64_t)self + OBJC_IVAR____TtC11MobileNotes24ActivityStreamHeaderView_coordinator);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes24ActivityStreamHeaderView____lazy_storage___label));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes24ActivityStreamHeaderView____lazy_storage___closeButton);
}

@end