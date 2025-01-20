@interface ProductTapToRateView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore20ProductTapToRateView)initWithCoder:(id)a3;
- (_TtC8AppStore20ProductTapToRateView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductTapToRateView

- (_TtC8AppStore20ProductTapToRateView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20ProductTapToRateView *)sub_10060867C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20ProductTapToRateView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore20ProductTapToRateView_rateAction;
  uint64_t v6 = sub_100082C28(&qword_1009A1300);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore20ProductTapToRateView_isSingleColumn) = 0;
  id v7 = a3;

  result = (_TtC8AppStore20ProductTapToRateView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(ProductTapToRateView *)&v5 layoutSubviews];
  sub_1006092F4(v4);
  sub_100081D90(v4, v4[3]);
  [v2 bounds];
  id v3 = [v2 traitCollection];
  dispatch thunk of Placeable.place(at:with:)();

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1006092F4(v11);
  sub_100081D90(v11, v11[3]);
  id v4 = [(ProductTapToRateView *)v3 traitCollection];
  dispatch thunk of Placeable.measure(toFit:with:)();
  double v6 = v5;
  double v8 = v7;

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v11);
  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20ProductTapToRateView_ratingControl));
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore20ProductTapToRateView_rateAction, &qword_1009A1310);
}

@end