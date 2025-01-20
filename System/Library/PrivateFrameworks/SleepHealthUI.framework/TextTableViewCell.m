@interface TextTableViewCell
- (_TtC13SleepHealthUI17TextTableViewCell)initWithCoder:(id)a3;
- (_TtC13SleepHealthUI17TextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)tintColorDidChange;
@end

@implementation TextTableViewCell

- (_TtC13SleepHealthUI17TextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1AD9DF710();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC13SleepHealthUI17TextTableViewCell *)sub_1AD981134(v4, v5);
}

- (_TtC13SleepHealthUI17TextTableViewCell)initWithCoder:(id)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR____TtC13SleepHealthUI17TextTableViewCell_model;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  id v5 = a3;

  result = (_TtC13SleepHealthUI17TextTableViewCell *)sub_1AD9E0140();
  __break(1u);
  return result;
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TextTableViewCell();
  id v2 = v3.receiver;
  [(TextTableViewCell *)&v3 tintColorDidChange];
  sub_1AD980E08();
}

- (void).cxx_destruct
{
}

@end