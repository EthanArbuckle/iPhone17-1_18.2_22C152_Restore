@interface TrendListFooter
- (_TtC10FitnessApp15TrendListFooter)initWithCoder:(id)a3;
- (_TtC10FitnessApp15TrendListFooter)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TrendListFooter

- (_TtC10FitnessApp15TrendListFooter)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC10FitnessApp15TrendListFooter *)sub_10041AE2C(a3, (uint64_t)a4, v6);
}

- (_TtC10FitnessApp15TrendListFooter)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC10FitnessApp15TrendListFooter_textView;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_10041A6DC();

  result = (_TtC10FitnessApp15TrendListFooter *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp15TrendListFooter_textView));
}

@end