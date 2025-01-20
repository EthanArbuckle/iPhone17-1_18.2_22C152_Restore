@interface FMInsetLabel
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC6FindMy12FMInsetLabel)initWithCoder:(id)a3;
- (_TtC6FindMy12FMInsetLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation FMInsetLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_10010423C(x, y, width, height);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v6 = sub_10010434C(width, height);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_100104470();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (_TtC6FindMy12FMInsetLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_topInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_leftInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_bottomInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_rightInset) = (Class)0x4020000000000000;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMInsetLabel();
  return -[FMInsetLabel initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6FindMy12FMInsetLabel)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_topInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_leftInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_bottomInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_rightInset) = (Class)0x4020000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMInsetLabel();
  return [(FMInsetLabel *)&v5 initWithCoder:a3];
}

@end