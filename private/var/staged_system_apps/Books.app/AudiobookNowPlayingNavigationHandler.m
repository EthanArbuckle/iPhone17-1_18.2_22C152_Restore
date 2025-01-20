@interface AudiobookNowPlayingNavigationHandler
- (_TtC5Books36AudiobookNowPlayingNavigationHandler)init;
@end

@implementation AudiobookNowPlayingNavigationHandler

- (_TtC5Books36AudiobookNowPlayingNavigationHandler)init
{
  *(void *)&self->delegate[OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate] = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AudiobookNowPlayingNavigationHandler();
  return [(AudiobookNowPlayingNavigationHandler *)&v4 init];
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC5Books36AudiobookNowPlayingNavigationHandler_viewController;

  sub_10023E454((uint64_t)v3);
}

@end