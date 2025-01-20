@interface FMEmptyListButton
- (NSString)accessibilityLabel;
- (_TtC6FindMy17FMEmptyListButton)initWithCoder:(id)a3;
@end

@implementation FMEmptyListButton

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMEmptyListButton_textColor));
}

- (_TtC6FindMy17FMEmptyListButton)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy17FMEmptyListButton_textColor;
  v6 = self;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 systemBlueColor];
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC6FindMy17FMEmptyListButton_isEnabled) = 1;

  result = (_TtC6FindMy17FMEmptyListButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (NSString)accessibilityLabel
{
  v2 = self;
  sub_10028E99C();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

@end