@interface EditorsChoiceView
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore17EditorsChoiceView)initWithCoder:(id)a3;
- (_TtC8AppStore17EditorsChoiceView)initWithFrame:(CGRect)a3;
- (double)lastBaselineFromBottom;
- (double)lastBaselineMaxY;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation EditorsChoiceView

- (_TtC8AppStore17EditorsChoiceView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100302B24();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  swift_getObjectType();
  char v4 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_preferredLineCount);
  int v5 = *((unsigned __int8 *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_shouldCapWidthByAvailableWidth);
  char v6 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_useAdsLocale);
  unsigned __int8 v7 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_useCase);
  char v8 = *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_size);
  v9 = self;
  sub_1001855B4(v8, v4, v5, v9, v6, v7);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  unsigned __int8 v7 = self;
  -[EditorsChoiceView sizeThatFits:](v7, "sizeThatFits:", width, height);
  double v9 = v8;
  double v11 = v10;
  [(EditorsChoiceView *)v7 lastBaselineFromBottom];
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v9;
  double v15 = v11;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10030110C();
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unsigned __int8 v7 = self;
  sub_10030165C(x, y, width, height);
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_100301998();
}

- (double)lastBaselineMaxY
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_titleLabel) lastBaselineMaxY];
  return result;
}

- (double)lastBaselineFromBottom
{
  [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_titleLabel) lastBaselineFromBottom];
  return result;
}

- (_TtC8AppStore17EditorsChoiceView)initWithFrame:(CGRect)a3
{
  double result = (_TtC8AppStore17EditorsChoiceView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore17EditorsChoiceView_rightLaurelView);
}

@end