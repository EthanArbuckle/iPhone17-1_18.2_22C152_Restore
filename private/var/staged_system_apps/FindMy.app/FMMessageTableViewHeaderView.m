@interface FMMessageTableViewHeaderView
- (_TtC6FindMy28FMMessageTableViewHeaderView)initWithCoder:(id)a3;
- (_TtC6FindMy28FMMessageTableViewHeaderView)initWithReuseIdentifier:(id)a3;
- (void)layoutSubviews;
@end

@implementation FMMessageTableViewHeaderView

- (void)layoutSubviews
{
  v2 = self;
  sub_100427D18();
}

- (_TtC6FindMy28FMMessageTableViewHeaderView)initWithReuseIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  return (_TtC6FindMy28FMMessageTableViewHeaderView *)sub_100427E90(v3, v4);
}

- (_TtC6FindMy28FMMessageTableViewHeaderView)initWithCoder:(id)a3
{
  return (_TtC6FindMy28FMMessageTableViewHeaderView *)sub_100427FE4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy28FMMessageTableViewHeaderView_style));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy28FMMessageTableViewHeaderView_remainingCharsLabel);
}

@end