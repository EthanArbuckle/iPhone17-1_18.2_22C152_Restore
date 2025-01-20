@interface RevealingImageView
- (BOOL)accessibilityIgnoresInvertColors;
- (_TtC8AppStore18RevealingImageView)initWithCoder:(id)a3;
- (_TtC8AppStore18RevealingImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RevealingImageView

- (_TtC8AppStore18RevealingImageView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore18RevealingImageView *)sub_100051F10(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingImageView();
  id v2 = v3.receiver;
  [(RevealingImageView *)&v3 layoutSubviews];
  sub_100052224();
}

- (BOOL)accessibilityIgnoresInvertColors
{
  return 1;
}

- (_TtC8AppStore18RevealingImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100212D38();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingImageView_pageGrid, (uint64_t *)&unk_100983860);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingImageView_currentArtworkTemplate, &qword_1009840F0);
  sub_100082BCC((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingImageView_currentArtworkHandlerKey, &qword_100989EC0);
  sub_100092F18((uint64_t)self + OBJC_IVAR____TtC8AppStore18RevealingImageView_delegate);
  id v3 = (char *)self + OBJC_IVAR____TtC8AppStore18RevealingImageView_mirrorDelegate;

  sub_100092F18((uint64_t)v3);
}

@end