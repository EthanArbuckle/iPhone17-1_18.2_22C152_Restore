@interface LanguageAwareStringHandler
- (_TtC8VideosUI26LanguageAwareStringHandler)init;
- (id)makeLanguageAwareAttributedString:(id)a3 defaultParagraphStyle:(id)a4;
- (id)makeLanguageAwareString:(id)a3;
@end

@implementation LanguageAwareStringHandler

- (_TtC8VideosUI26LanguageAwareStringHandler)init
{
  return (_TtC8VideosUI26LanguageAwareStringHandler *)sub_1E2CEDED0();
}

- (id)makeLanguageAwareAttributedString:(id)a3 defaultParagraphStyle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_1E3495DC0(v6, a4);

  return v9;
}

- (id)makeLanguageAwareString:(id)a3
{
  uint64_t v4 = sub_1E387C928();
  unint64_t v6 = v5;
  id v7 = self;
  sub_1E3495FC4(v4, v6);

  swift_bridgeObjectRelease();
  v8 = (void *)sub_1E387C8E8();
  swift_bridgeObjectRelease();
  return v8;
}

@end