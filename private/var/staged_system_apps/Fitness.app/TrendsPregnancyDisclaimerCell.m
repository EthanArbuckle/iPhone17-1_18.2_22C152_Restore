@interface TrendsPregnancyDisclaimerCell
- (_TtC10FitnessApp29TrendsPregnancyDisclaimerCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp29TrendsPregnancyDisclaimerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TrendsPregnancyDisclaimerCell

- (_TtC10FitnessApp29TrendsPregnancyDisclaimerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp29TrendsPregnancyDisclaimerCell *)sub_1005A88CC(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp29TrendsPregnancyDisclaimerCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC10FitnessApp29TrendsPregnancyDisclaimerCell_textView;
  sub_10007E2D8(0, &qword_100953458);
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)sub_1005CA0D4();

  result = (_TtC10FitnessApp29TrendsPregnancyDisclaimerCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp29TrendsPregnancyDisclaimerCell_textView));
}

@end