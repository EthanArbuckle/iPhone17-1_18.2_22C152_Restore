@interface NewSecondaryLabelStack
- (_TtC7Measure22NewSecondaryLabelStack)initWithCoder:(id)a3;
- (_TtC7Measure22NewSecondaryLabelStack)initWithFrame:(CGRect)a3;
@end

@implementation NewSecondaryLabelStack

- (_TtC7Measure22NewSecondaryLabelStack)initWithFrame:(CGRect)a3
{
  return (_TtC7Measure22NewSecondaryLabelStack *)sub_10015EC24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Measure22NewSecondaryLabelStack)initWithCoder:(id)a3
{
  return (_TtC7Measure22NewSecondaryLabelStack *)sub_10015EDB4(a3);
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure22NewSecondaryLabelStack_bottomLabel);
}

@end