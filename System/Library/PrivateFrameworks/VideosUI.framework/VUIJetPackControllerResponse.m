@interface VUIJetPackControllerResponse
- (NSString)source;
- (NSURL)url;
- (_TtC8VideosUI28VUIJetPackControllerResponse)init;
@end

@implementation VUIJetPackControllerResponse

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8VideosUI28VUIJetPackControllerResponse_url;
  sub_1E38760D8();
  OUTLINED_FUNCTION_2();
  (*(void (**)(char *))(v3 + 8))(v2);
  swift_bridgeObjectRelease();
}

- (NSString)source
{
  VUIJetPackControllerResponse.source.getter();
  v2 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSURL)url
{
  return (NSURL *)sub_1E2CCF7C0((uint64_t)self, (uint64_t)a2, (void (*)(void))VUIJetPackControllerResponse.url.getter);
}

- (_TtC8VideosUI28VUIJetPackControllerResponse)init
{
}

@end