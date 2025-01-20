@interface BadgeLabel
- (UIColor)textColor;
- (_TtC16MusicApplication10BadgeLabel)init;
- (_TtC16MusicApplication10BadgeLabel)initWithCoder:(id)a3;
- (_TtC16MusicApplication10BadgeLabel)initWithFrame:(CGRect)a3;
- (void)setTextColor:(id)a3;
@end

@implementation BadgeLabel

- (_TtC16MusicApplication10BadgeLabel)init
{
  return (_TtC16MusicApplication10BadgeLabel *)sub_2A0EB8();
}

- (_TtC16MusicApplication10BadgeLabel)initWithCoder:(id)a3
{
  result = (_TtC16MusicApplication10BadgeLabel *)sub_AB8280();
  __break(1u);
  return result;
}

- (UIColor)textColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for BadgeLabel();
  v2 = [(BadgeLabel *)&v4 textColor];

  return v2;
}

- (void)setTextColor:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_2A1248((uint64_t)a3);
}

- (_TtC16MusicApplication10BadgeLabel)initWithFrame:(CGRect)a3
{
  result = (_TtC16MusicApplication10BadgeLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end