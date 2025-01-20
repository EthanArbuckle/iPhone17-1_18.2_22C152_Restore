@interface MoveModeSettingsCell
- (_TtC10FitnessApp20MoveModeSettingsCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp20MoveModeSettingsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation MoveModeSettingsCell

- (_TtC10FitnessApp20MoveModeSettingsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp20MoveModeSettingsCell *)sub_1003EAC94(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MoveModeSettingsCell();
  v2 = (char *)v3.receiver;
  [(MoveModeSettingsCell *)&v3 prepareForReuse];
  *(void *)&v2[OBJC_IVAR____TtC10FitnessApp20MoveModeSettingsCell_delegate + 8] = 0;
  swift_unknownObjectWeakAssign();
}

- (_TtC10FitnessApp20MoveModeSettingsCell)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC10FitnessApp20MoveModeSettingsCell_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp20MoveModeSettingsCell_moveTimeSwitch) = 0;
  id v5 = a3;

  result = (_TtC10FitnessApp20MoveModeSettingsCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp20MoveModeSettingsCell_delegate);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp20MoveModeSettingsCell_moveTimeSwitch);
}

@end