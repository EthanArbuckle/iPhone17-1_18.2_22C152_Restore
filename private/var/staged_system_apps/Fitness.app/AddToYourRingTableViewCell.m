@interface AddToYourRingTableViewCell
- (_TtC10FitnessApp26AddToYourRingTableViewCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp26AddToYourRingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation AddToYourRingTableViewCell

- (_TtC10FitnessApp26AddToYourRingTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp26AddToYourRingTableViewCell *)sub_1003344F4(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp26AddToYourRingTableViewCell)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10FitnessApp26AddToYourRingTableViewCell____lazy_storage___heightConstraint) = 0;
  id v5 = a3;

  result = (_TtC10FitnessApp26AddToYourRingTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp26AddToYourRingTableViewCell____lazy_storage___heightConstraint);
}

@end