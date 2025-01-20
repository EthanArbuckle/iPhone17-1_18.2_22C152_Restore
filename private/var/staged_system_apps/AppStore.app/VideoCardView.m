@interface VideoCardView
- (_TtC8AppStore13VideoCardView)initWithCoder:(id)a3;
- (_TtC8AppStore13VideoCardView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation VideoCardView

- (_TtC8AppStore13VideoCardView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore13VideoCardView *)sub_10022DAA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore13VideoCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10022F868();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10022E3E4();
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore13VideoCardView_overlayStyle;
  uint64_t v4 = type metadata accessor for MediaOverlayStyle();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectWeakDestroy();

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore13VideoCardView_metrics;

  sub_1000A4EE8((uint64_t)v5);
}

@end