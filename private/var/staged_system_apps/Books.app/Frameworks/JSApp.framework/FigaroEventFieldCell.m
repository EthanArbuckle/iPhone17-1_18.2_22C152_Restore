@interface FigaroEventFieldCell
- (_TtC5JSApp20FigaroEventFieldCell)initWithCoder:(id)a3;
- (_TtC5JSApp20FigaroEventFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation FigaroEventFieldCell

- (_TtC5JSApp20FigaroEventFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    sub_86860();
    NSString v5 = sub_86830();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FigaroEventFieldCell();
  v6 = [(FigaroEventFieldCell *)&v8 initWithStyle:3 reuseIdentifier:v5];

  return v6;
}

- (_TtC5JSApp20FigaroEventFieldCell)initWithCoder:(id)a3
{
  result = (_TtC5JSApp20FigaroEventFieldCell *)sub_86F70();
  __break(1u);
  return result;
}

@end