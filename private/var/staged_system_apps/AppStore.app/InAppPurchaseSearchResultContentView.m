@interface InAppPurchaseSearchResultContentView
- (_TtC8AppStore36InAppPurchaseSearchResultContentView)initWithCoder:(id)a3;
- (_TtC8AppStore36InAppPurchaseSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InAppPurchaseSearchResultContentView

- (_TtC8AppStore36InAppPurchaseSearchResultContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36InAppPurchaseSearchResultContentView *)sub_1005EAEFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36InAppPurchaseSearchResultContentView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_metrics;
  uint64_t v5 = qword_10097FCC0;
  id v6 = a3;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = type metadata accessor for InAppPurchaseSearchResultLayout.Metrics();
  uint64_t v8 = sub_100087728(v7, (uint64_t)qword_1009E5F58);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 16))((char *)self + v4, v8, v7);
  uint64_t v9 = OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_bodyBackgroundColor;
  sub_100084CF0(0, (unint64_t *)&qword_100981AA0);
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)static UIColor.componentBackgroundStandout.getter();

  result = (_TtC8AppStore36InAppPurchaseSearchResultContentView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005EB990();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  id v6 = self;
  sub_1005EBDF0(a3);
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_metrics;
  uint64_t v4 = type metadata accessor for InAppPurchaseSearchResultLayout.Metrics();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_bodyBackgroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_inAppPurchaseLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_offerButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_body));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_iconView));
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore36InAppPurchaseSearchResultContentView_inAppDescription);
}

@end