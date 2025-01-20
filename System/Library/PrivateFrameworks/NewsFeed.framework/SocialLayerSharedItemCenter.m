@interface SocialLayerSharedItemCenter
- (_TtC8NewsFeed27SocialLayerSharedItemCenter)init;
- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4;
- (void)highlightCenterDidAddHighlights:(id)a3;
@end

@implementation SocialLayerSharedItemCenter

- (_TtC8NewsFeed27SocialLayerSharedItemCenter)init
{
  return (_TtC8NewsFeed27SocialLayerSharedItemCenter *)SocialLayerSharedItemCenter.init()();
}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  sub_1BFC39268(0, (unint64_t *)&unk_1EB87C428);
  unint64_t v6 = sub_1C151EBCC();
  id v7 = a3;
  v8 = self;
  SocialLayerSharedItemCenter.highlightCenter(_:didRemove:)(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s8NewsFeed27SocialLayerSharedItemCenterC09highlightG16DidAddHighlightsyySo011SLHighlightG0CF_0();
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed27SocialLayerSharedItemCenter_delegate;
  sub_1C019B9B4((uint64_t)v3);
}

@end