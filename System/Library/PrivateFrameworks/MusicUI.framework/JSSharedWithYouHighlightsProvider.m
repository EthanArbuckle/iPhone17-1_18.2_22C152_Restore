@interface JSSharedWithYouHighlightsProvider
- (JSValue)highlights;
- (JSValue)isEnabled;
- (JSValue)isSupported;
- (_TtC7MusicUI33JSSharedWithYouHighlightsProvider)init;
- (void)startIfNeeded;
@end

@implementation JSSharedWithYouHighlightsProvider

- (JSValue)isSupported
{
  v2 = self;
  v3 = (void *)sub_229EBEF18();

  return (JSValue *)v3;
}

- (JSValue)isEnabled
{
  v2 = self;
  v3 = (void *)sub_229EBF190();

  return (JSValue *)v3;
}

- (void)startIfNeeded
{
  v2 = self;
  sub_229EBF0AC();
}

- (JSValue)highlights
{
  v2 = self;
  v3 = (void *)sub_229EBF190();

  return (JSValue *)v3;
}

- (_TtC7MusicUI33JSSharedWithYouHighlightsProvider)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7MusicUI33JSSharedWithYouHighlightsProvider_highlightsProvider));
}

@end