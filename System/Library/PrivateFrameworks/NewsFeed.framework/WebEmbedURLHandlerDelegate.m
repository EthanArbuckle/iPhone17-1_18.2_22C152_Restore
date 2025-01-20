@interface WebEmbedURLHandlerDelegate
- (_TtC8NewsFeed26WebEmbedURLHandlerDelegate)init;
- (void)URLHandler:(id)a3 wantsToPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)URLHandler:(id)a3 willOpenURL:(id)a4;
@end

@implementation WebEmbedURLHandlerDelegate

- (void)URLHandler:(id)a3 wantsToPresentViewController:(id)a4 animated:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  sub_1C03E4AF8((uint64_t)v9, a5);
}

- (void)URLHandler:(id)a3 willOpenURL:(id)a4
{
  uint64_t v6 = sub_1C1515FDC();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C1515F1C();
  id v10 = a3;
  v11 = self;
  sub_1C03E4C18((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC8NewsFeed26WebEmbedURLHandlerDelegate)init
{
  result = (_TtC8NewsFeed26WebEmbedURLHandlerDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end