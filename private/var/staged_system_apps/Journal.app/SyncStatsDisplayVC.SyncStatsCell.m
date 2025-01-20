@interface SyncStatsDisplayVC.SyncStatsCell
- (_TtCC7Journal18SyncStatsDisplayVC13SyncStatsCell)initWithCoder:(id)a3;
- (_TtCC7Journal18SyncStatsDisplayVC13SyncStatsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation SyncStatsDisplayVC.SyncStatsCell

- (_TtCC7Journal18SyncStatsDisplayVC13SyncStatsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtCC7Journal18SyncStatsDisplayVC13SyncStatsCell *)sub_100265E18(a3, (uint64_t)a4, v6);
}

- (_TtCC7Journal18SyncStatsDisplayVC13SyncStatsCell)initWithCoder:(id)a3
{
  result = (_TtCC7Journal18SyncStatsDisplayVC13SyncStatsCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC7Journal18SyncStatsDisplayVC13SyncStatsCell_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC7Journal18SyncStatsDisplayVC13SyncStatsCell_descriptionLabel);
}

@end