@interface MTToggleTestActionCell
- (_TtC8Podcasts22MTToggleTestActionCell)initWithCoder:(id)a3;
- (_TtC8Podcasts22MTToggleTestActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)switchActionWithSender:(id)a3;
@end

@implementation MTToggleTestActionCell

- (_TtC8Podcasts22MTToggleTestActionCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Podcasts22MTToggleTestActionCell_switchView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Podcasts22MTToggleTestActionCell_toggleAction) = 0;
  id v4 = a3;

  result = (_TtC8Podcasts22MTToggleTestActionCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC8Podcasts22MTToggleTestActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8Podcasts22MTToggleTestActionCell *)sub_1001F74A0(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1001F7598();
}

- (void)switchActionWithSender:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    uint64_t v5 = self;
  }
  sub_1001F78D8();

  sub_100172424((uint64_t)v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts22MTToggleTestActionCell_switchView));

  swift_release();
}

@end