@interface URLPreviewViewControllerFactory
- (_TtC12NewsArticles31URLPreviewViewControllerFactory)init;
- (id)createViewControllerForURL:(id)a3;
@end

@implementation URLPreviewViewControllerFactory

- (id)createViewControllerForURL:(id)a3
{
  uint64_t v3 = sub_1BF7DD068();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF7DD018();
  id v7 = _s12NewsArticles31URLPreviewViewControllerFactoryC06createdE03forSo06UIViewE0CSg10Foundation3URLV_tF_0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7;
}

- (_TtC12NewsArticles31URLPreviewViewControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(URLPreviewViewControllerFactory *)&v3 init];
}

@end