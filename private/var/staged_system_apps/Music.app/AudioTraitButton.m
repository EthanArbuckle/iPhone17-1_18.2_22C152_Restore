@interface AudioTraitButton
- (BOOL)isHighlighted;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)hitRect;
- (_TtC5Music16AudioTraitButton)initWithCoder:(id)a3;
- (_TtC5Music16AudioTraitButton)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation AudioTraitButton

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioTraitButton();
  return [(AudioTraitButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_10017329C(a3);
}

- (CGRect)hitRect
{
  v2 = self;
  double v3 = sub_1001733A0();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = self;
  if (UIViewIgnoresTouchEvents())
  {
  }
  else
  {
    unsigned __int8 v9 = -[AudioTraitButton pointInside:withEvent:](v8, "pointInside:withEvent:", v7, x, y);

    if (v9) {
      goto LABEL_5;
    }
  }

  double v8 = 0;
LABEL_5:

  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  double v8 = self;
  [(AudioTraitButton *)v8 hitRect];
  v11.CGFloat x = x;
  v11.CGFloat y = y;
  BOOL v9 = CGRectContainsPoint(v12, v11);

  return v9;
}

- (_TtC5Music16AudioTraitButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Music16AudioTraitButton_isShowingDisclosure) = 0;
  double v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music16AudioTraitButton_hitRectMinimumSize);
  BOOL v9 = (objc_class *)type metadata accessor for AudioTraitButton();
  *double v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[AudioTraitButton initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC5Music16AudioTraitButton)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Music16AudioTraitButton_isShowingDisclosure) = 0;
  double v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music16AudioTraitButton_hitRectMinimumSize);
  double v6 = (objc_class *)type metadata accessor for AudioTraitButton();
  *double v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(AudioTraitButton *)&v8 initWithCoder:a3];
}

@end