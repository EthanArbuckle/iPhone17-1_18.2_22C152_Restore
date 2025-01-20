@interface JSCookieStorage
- (void)handleCookieDidExpire:(id)a3;
@end

@implementation JSCookieStorage

- (void)handleCookieDidExpire:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_9BC82C();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11MusicJSCore15JSCookieStorage_defaultURL;
  uint64_t v3 = sub_AB0930();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

@end