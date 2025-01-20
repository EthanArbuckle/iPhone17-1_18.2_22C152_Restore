@interface NowPlayingActivityViewController
- (BOOL)_shouldShowSystemActivityType:(id)a3;
- (_TtC12NewsArticles32NowPlayingActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4;
@end

@implementation NowPlayingActivityViewController

- (BOOL)_shouldShowSystemActivityType:(id)a3
{
  return 0;
}

- (_TtC12NewsArticles32NowPlayingActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1BF7E3C78();
  if (a4)
  {
    sub_1BF4D2078();
    a4 = (id)sub_1BF7E3C78();
  }
  v7 = (void *)sub_1BF7E3C68();
  swift_bridgeObjectRelease();
  if (a4)
  {
    sub_1BF4D2078();
    v8 = (void *)sub_1BF7E3C68();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = [(NowPlayingActivityViewController *)&v11 initWithActivityItems:v7 applicationActivities:v8];

  return v9;
}

@end