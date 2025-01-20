@interface SportsTagView
- (NSArray)accessibilityCustomActions;
- (NSString)accessibilityHint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtC7NewsUI213SportsTagView)initWithCoder:(id)a3;
- (_TtC7NewsUI213SportsTagView)initWithFrame:(CGRect)a3;
- (void)setAccessibilityCustomActions:(id)a3;
@end

@implementation SportsTagView

- (_TtC7NewsUI213SportsTagView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsUI213SportsTagView *)sub_1DF0E2BA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsUI213SportsTagView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DF0E3C44();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI213SportsTagView_token);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1DF0E3290(self, (uint64_t)a2, (void (*)(void))sub_1DF0E2A4C);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1DF0E3290(self, (uint64_t)a2, (void (*)(void))sub_1DF0E304C);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1DF0E3290(self, (uint64_t)a2, (void (*)(void))sub_1DF0E3310);
}

- (NSArray)accessibilityCustomActions
{
  v2 = self;
  unint64_t v3 = sub_1DF0E35E0();

  if (v3)
  {
    sub_1DEE5D3EC();
    v4 = (void *)sub_1DFDFE200();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1DEE5D3EC();
    sub_1DFDFE220();
    v6 = self;
    a3 = (id)sub_1DFDFE200();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(SportsTagView *)&v8 setAccessibilityCustomActions:a3];
}

@end