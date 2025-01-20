@interface WebViewControllerFactory
- (_TtC7NewsKit24WebViewControllerFactory)init;
- (id)createViewControllerForURL:(id)a3;
@end

@implementation WebViewControllerFactory

- (id)createViewControllerForURL:(id)a3
{
  uint64_t v3 = sub_2286DD7E8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2286DD7D8();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return 0;
}

- (_TtC7NewsKit24WebViewControllerFactory)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(WebViewControllerFactory *)&v3 init];
}

@end