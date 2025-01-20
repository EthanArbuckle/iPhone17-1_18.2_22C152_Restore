@interface PostPlayDocumentViewController
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (_TtC8VideosUI30PostPlayDocumentViewController)initWithCoder:(id)a3;
- (double)playbackUpNextViewHeight;
- (void)setPlaybackUpNextContextData:(id)a3;
- (void)setPlaybackUpNextDelegate:(id)a3;
- (void)startAutoPlayAnimation;
@end

@implementation PostPlayDocumentViewController

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  unsigned __int8 v3 = sub_1E37FDF6C((SEL *)&selRef_prefersStatusBarHidden);

  return v3 & 1;
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  v2 = self;
  unsigned __int8 v3 = sub_1E37FDF6C((SEL *)&selRef_prefersHomeIndicatorAutoHidden);

  return v3 & 1;
}

- (_TtC8VideosUI30PostPlayDocumentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E37FE174();
}

- (void).cxx_destruct
{
  sub_1E2F6ABF0((uint64_t)self + OBJC_IVAR____TtC8VideosUI30PostPlayDocumentViewController_playbackUpNextDelegate);
  swift_bridgeObjectRelease();
}

- (void)setPlaybackUpNextDelegate:(id)a3
{
}

- (void)setPlaybackUpNextContextData:(id)a3
{
  uint64_t v4 = sub_1E387C678();
  v5 = self;
  sub_1E37FE4D8(v4);

  swift_bridgeObjectRelease();
}

- (void)startAutoPlayAnimation
{
  v2 = self;
  sub_1E37FE688();
}

- (double)playbackUpNextViewHeight
{
  v2 = self;
  sub_1E37FE7A4();
  double v4 = v3;

  return v4;
}

@end