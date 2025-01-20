@interface TTRISeparator
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)backgroundColor;
- (_TtC15RemindersUICore13TTRISeparator)initWithCoder:(id)a3;
- (_TtC15RemindersUICore13TTRISeparator)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation TTRISeparator

- (_TtC15RemindersUICore13TTRISeparator)initWithFrame:(CGRect)a3
{
}

- (_TtC15RemindersUICore13TTRISeparator)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore13TTRISeparator *)TTRISeparator.init(coder:)(a3);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  TTRISeparator.intrinsicContentSize.getter();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  TTRISeparator.intrinsicContentSize.getter();
  double v7 = v6;
  double v9 = v8;
  double v10 = *MEMORY[0x1E4FB30D8];

  if (v7 == v10) {
    double v11 = width;
  }
  else {
    double v11 = v7;
  }
  if (v9 == v10) {
    double v12 = height;
  }
  else {
    double v12 = v9;
  }
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  TTRISeparator.layoutSubviews()();
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC15RemindersUICore13TTRISeparator_internalBackgroundColor));
}

- (void)setBackgroundColor:(id)a3
{
  id v6 = a3;
  double v5 = self;
  sub_1B97F4AD0(a3);
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore13TTRISeparator_internalBackgroundColor);
}

@end