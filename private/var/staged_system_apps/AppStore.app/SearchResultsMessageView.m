@interface SearchResultsMessageView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStore24SearchResultsMessageView)initWithCoder:(id)a3;
- (_TtC8AppStore24SearchResultsMessageView)initWithFrame:(CGRect)a3;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
@end

@implementation SearchResultsMessageView

- (_TtC8AppStore24SearchResultsMessageView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore24SearchResultsMessageView *)sub_10049CF70(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore24SearchResultsMessageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10049E370();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10049D2C4();
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(SearchResultsMessageView *)&v3 layoutMarginsDidChange];
  [v2 setNeedsLayout];
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_10049E168();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24SearchResultsMessageView_primaryLabel));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore24SearchResultsMessageView_secondaryLabel);
}

@end