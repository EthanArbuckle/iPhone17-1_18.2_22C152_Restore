@interface QuoteView
- (_TtC8AppStore9QuoteView)initWithCoder:(id)a3;
- (_TtC8AppStore9QuoteView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation QuoteView

- (_TtC8AppStore9QuoteView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore9QuoteView *)sub_1000EAFA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore9QuoteView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9QuoteView_trailingQuote) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9QuoteView_creditLabel) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC8AppStore9QuoteView_artworkAspectRatio;
  uint64_t v6 = type metadata accessor for AspectRatio();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9QuoteView_isFullWidthArtwork) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9QuoteView_artworkHasRoundedCorners) = 0;
  id v7 = a3;

  result = (_TtC8AppStore9QuoteView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000EB824();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1000ED0F4((uint64_t)self + OBJC_IVAR____TtC8AppStore9QuoteView_artworkAspectRatio);
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore9QuoteView_artworkView);
}

@end