@interface VUIJetPackURL
- (NSURL)url;
- (_TtC8VideosUI13VUIJetPackURL)init;
@end

@implementation VUIJetPackURL

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8VideosUI13VUIJetPackURL_url;
  sub_1E38760D8();
  OUTLINED_FUNCTION_2();
  v5 = *(void (**)(char *, uint64_t))(v4 + 8);
  v5(v2, v3);
}

- (NSURL)url
{
  return (NSURL *)sub_1E2CCF7C0((uint64_t)self, (uint64_t)a2, (void (*)(void))VUIJetPackURL.url.getter);
}

- (_TtC8VideosUI13VUIJetPackURL)init
{
}

@end