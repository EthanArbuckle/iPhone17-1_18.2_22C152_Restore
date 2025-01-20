@interface NowPlayingTransportButton
- (BOOL)isEnabled;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (_TtC5Music25NowPlayingTransportButton)initWithCoder:(id)a3;
- (_TtC5Music25NowPlayingTransportButton)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)layoutSubviews;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation NowPlayingTransportButton

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingTransportButton();
  v2 = (char *)v6.receiver;
  [(NowPlayingTransportButton *)&v6 tintColorDidChange];
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageView];
  if (v3)
  {
    v4 = v3;
    id v5 = [v2 tintColor];
    (*(void (**)(id))((swift_isaMask & *v4) + 0xD8))(v5);

    v2 = (char *)v4;
  }
}

- (_TtC5Music25NowPlayingTransportButton)initWithFrame:(CGRect)a3
{
  sub_100027784(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100032F40();
}

- (CGSize)intrinsicContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for NowPlayingTransportButton();
  v2 = (char *)v10.receiver;
  [(NowPlayingTransportButton *)&v10 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = *(double *)&v2[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_highlightIndicatorWidth];

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

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = (objc_class *)type metadata accessor for NowPlayingTransportButton();
  v11.receiver = self;
  v11.super_class = v5;
  double v6 = self;
  unsigned int v7 = [(NowPlayingTransportButton *)&v11 isEnabled];
  v10.receiver = v6;
  v10.super_class = v5;
  [(NowPlayingTransportButton *)&v10 setEnabled:v3];
  if (v7 != [(NowPlayingTransportButton *)v6 isEnabled])
  {
    unsigned int v8 = [(NowPlayingTransportButton *)v6 isEnabled];
    double v9 = 0.5;
    if (v8) {
      double v9 = 1.0;
    }
    [(NowPlayingTransportButton *)v6 setAlpha:v9];
  }
}

- (BOOL)isEnabled
{
  return sub_100053CCC(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (BOOL)isHighlighted
{
  return sub_100053CCC(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (_TtC5Music25NowPlayingTransportButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003915F4();
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingTransportButton();
  id v4 = v5.receiver;
  [(NowPlayingTransportButton *)&v5 setHighlighted:v3];
  sub_100390FC8();
}

- (void).cxx_destruct
{
  sub_100053B68(*(void *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition], *(void *)&self->packageView[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition], *(void **)&self->packageDefinition[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition]);
  BOOL v3 = *(void **)&self->MPButton_opaque[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_highlightIndicatorWidthConstraint];
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = self;
  double v9 = (void *)sub_1003916A4();

  return v9;
}

@end