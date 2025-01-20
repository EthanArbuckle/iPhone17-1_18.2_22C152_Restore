@interface SleepButton
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (NSString)largeContentTitle;
- (_TtC5Books11SleepButton)initWithCoder:(id)a3;
- (_TtC5Books11SleepButton)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setAccessibilityTraits:(unint64_t)a3;
- (void)setImage:(id)a3 forState:(unint64_t)a4;
@end

@implementation SleepButton

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  v5 = self;
  if (a3)
  {
    [a3 size];
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = (Class *)((char *)&v5->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_imageSize);
  void *v8 = v6;
  v8[1] = v7;
  id v9 = [(SleepButton *)v5 state];
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for SleepButton();
  [(SleepButton *)&v10 setImage:a3 forState:v9];
}

- (CGSize)intrinsicContentSize
{
  v2 = (double *)((char *)self + OBJC_IVAR____TtC5Books11SleepButton_calculatedSize);
  double v3 = *(double *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_calculatedSize);
  v4 = self;
  if (v3 == 0.0)
  {
    sub_1003ED3A0();
    double v3 = *v2;
  }
  double v5 = v2[1];

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1003ECAF4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = (double *)((char *)self + OBJC_IVAR____TtC5Books11SleepButton_calculatedSize);
  double v4 = *(double *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_calculatedSize);
  double v5 = self;
  if (v4 == 0.0)
  {
    sub_1003ED3A0();
    double v4 = *v3;
  }
  double v6 = v3[1];

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)accessibilityLabel
{
  uint64_t v2 = qword_100B229F8;
  double v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();

  NSString v4 = sub_1007FDC30();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1003ED154(self, (uint64_t)a2, (void (*)(void))sub_1003ED078);
}

- (NSString)largeContentTitle
{
  return (NSString *)sub_1003ED154(self, (uint64_t)a2, (void (*)(void))sub_1003ED1D4);
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SleepButton();
  id v2 = v7.receiver;
  unint64_t v3 = [(SleepButton *)&v7 accessibilityTraits];
  if (*((unsigned char *)v2 + OBJC_IVAR____TtC5Books11SleepButton_showsDuration) == 1)
  {
    UIAccessibilityTraits v4 = UIAccessibilityTraitUpdatesFrequently;

    if ((v4 & ~v3) != 0) {
      UIAccessibilityTraits v5 = v4;
    }
    else {
      UIAccessibilityTraits v5 = 0;
    }
    v3 |= v5;
  }
  else
  {
  }
  return v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SleepButton();
  [(SleepButton *)&v4 setAccessibilityTraits:a3];
}

- (_TtC5Books11SleepButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_fixedHeight) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_internalPadding) = 0;
  objc_super v7 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_calculatedSize);
  *objc_super v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_duration) = 0;
  double v8 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_imageSize);
  void *v8 = 0;
  v8[1] = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_showsDuration) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_showsHours) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SleepButton();
  return -[SleepButton initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books11SleepButton)initWithCoder:(id)a3
{
  return (_TtC5Books11SleepButton *)sub_1003ED66C(a3);
}

@end