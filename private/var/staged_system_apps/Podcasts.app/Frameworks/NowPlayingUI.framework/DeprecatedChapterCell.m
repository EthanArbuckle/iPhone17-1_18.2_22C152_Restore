@interface DeprecatedChapterCell
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)accessibilityWantsNowPlayingIndicator;
- (BOOL)wantsNowPlayingIndicator;
- (NSString)accessibilityTitle;
- (NSString)title;
- (_TtC12NowPlayingUI21DeprecatedChapterCell)initWithCoder:(id)a3;
- (_TtC12NowPlayingUI21DeprecatedChapterCell)initWithFrame:(CGRect)a3;
- (double)accessibilityDuration;
- (int64_t)accessibilityPlaybackState;
- (void)layoutSubviews;
- (void)setAccessibilityDuration:(double)a3;
- (void)setTitle:(id)a3;
- (void)setWantsNowPlayingIndicator:(BOOL)a3;
@end

@implementation DeprecatedChapterCell

- (_TtC12NowPlayingUI21DeprecatedChapterCell)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI21DeprecatedChapterCell *)sub_1250BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI21DeprecatedChapterCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1267B0();
}

- (NSString)title
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_1299B0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setTitle:(id)a3
{
  uint64_t v4 = sub_1299F0();
  uint64_t v6 = v5;
  v7 = self;
  sub_125420(v4, v6);
}

- (BOOL)wantsNowPlayingIndicator
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_wantsNowPlayingIndicator];
}

- (void)setWantsNowPlayingIndicator:(BOOL)a3
{
  int v3 = self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_wantsNowPlayingIndicator];
  self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_wantsNowPlayingIndicator] = a3;
  if (v3 != a3) {
    [(DeprecatedChapterCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  NSString v2 = self;
  sub_12573C();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  return 0;
}

- (double)accessibilityDuration
{
  return *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_accessibilityDuration];
}

- (void)setAccessibilityDuration:(double)a3
{
  *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_accessibilityDuration] = a3;
}

- (NSString)accessibilityTitle
{
  swift_bridgeObjectRetain();
  NSString v2 = sub_1299B0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)accessibilityWantsNowPlayingIndicator
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_wantsNowPlayingIndicator];
}

- (int64_t)accessibilityPlaybackState
{
  return *(void *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_playbackState];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  int v3 = *(void **)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI21DeprecatedChapterCell_titleTextDrawingView];
}

@end