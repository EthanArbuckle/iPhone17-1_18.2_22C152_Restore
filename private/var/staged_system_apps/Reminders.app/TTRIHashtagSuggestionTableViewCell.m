@interface TTRIHashtagSuggestionTableViewCell
- (_TtC9Reminders34TTRIHashtagSuggestionTableViewCell)initWithCoder:(id)a3;
- (_TtC9Reminders34TTRIHashtagSuggestionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation TTRIHashtagSuggestionTableViewCell

- (_TtC9Reminders34TTRIHashtagSuggestionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC9Reminders34TTRIHashtagSuggestionTableViewCell *)sub_1000A1964(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders34TTRIHashtagSuggestionTableViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders34TTRIHashtagSuggestionTableViewCell____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9Reminders34TTRIHashtagSuggestionTableViewCell____lazy_storage___leadingImageView) = 0;
  id v4 = a3;

  result = (_TtC9Reminders34TTRIHashtagSuggestionTableViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders34TTRIHashtagSuggestionTableViewCell____lazy_storage___titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders34TTRIHashtagSuggestionTableViewCell____lazy_storage___leadingImageView);
}

@end