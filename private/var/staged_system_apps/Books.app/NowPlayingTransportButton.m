@interface NowPlayingTransportButton
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (_TtC5Books25NowPlayingTransportButton)initWithCoder:(id)a3;
- (_TtC5Books25NowPlayingTransportButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation NowPlayingTransportButton

- (_TtC5Books25NowPlayingTransportButton)initWithFrame:(CGRect)a3
{
  sub_100650E64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC5Books25NowPlayingTransportButton)initWithCoder:(id)a3
{
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Books25NowPlayingTransportButton_highlightIndicatorView] = 0;
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Books25NowPlayingTransportButton_highlightIndicatorWidthConstraint] = 0;
  *(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Books25NowPlayingTransportButton_highlightIndicatorWidth] = 0x4046000000000000;
  id v4 = a3;

  result = (_TtC5Books25NowPlayingTransportButton *)sub_1007FF260();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  return sub_10065182C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingTransportButton();
  id v4 = v5.receiver;
  [(NowPlayingTransportButton *)&v5 setHighlighted:v3];
  sub_1006513E8();
}

- (BOOL)isEnabled
{
  return sub_10065182C(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NowPlayingTransportButton();
  id v4 = v7.receiver;
  [(NowPlayingTransportButton *)&v7 setEnabled:v3];
  if (objc_msgSend(v4, "isEnabled", v7.receiver, v7.super_class)) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.5;
  }
  id v6 = [objc_allocWithZone((Class)UIColor) initWithWhite:0.0 alpha:v5];
  [v4 setTintColor:v6];
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for NowPlayingTransportButton();
  v2 = (char *)v10.receiver;
  [(NowPlayingTransportButton *)&v10 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = *(double *)&v2[OBJC_IVAR____TtC5Books25NowPlayingTransportButton_highlightIndicatorWidth];

  if (v4 > v7) {
    double v8 = v4;
  }
  else {
    double v8 = v7;
  }
  if (v6 > v7) {
    double v9 = v6;
  }
  else {
    double v9 = v7;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1006519B4();
}

- (void).cxx_destruct
{
  double v3 = *(void **)&self->MPButton_opaque[OBJC_IVAR____TtC5Books25NowPlayingTransportButton_highlightIndicatorWidthConstraint];
}

@end