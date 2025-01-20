@interface TableOfContentsURLHandler
- (_TtC12NewsArticles25TableOfContentsURLHandler)init;
- (id)viewControllerForURL:(id)a3;
- (void)commitViewController:(id)a3 URL:(id)a4;
- (void)openURL:(id)a3;
@end

@implementation TableOfContentsURLHandler

- (_TtC12NewsArticles25TableOfContentsURLHandler)init
{
  result = (_TtC12NewsArticles25TableOfContentsURLHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25TableOfContentsURLHandler_actionHandler);
  swift_unknownObjectWeakDestroy();
}

- (void)openURL:(id)a3
{
  uint64_t v4 = sub_1BF7DD068();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF7DD018();
  v8 = self;
  sub_1BF4D8138((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (id)viewControllerForURL:(id)a3
{
  uint64_t v4 = sub_1BF7DD068();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF7DD018();
  v8 = self;
  sub_1BF4D8138((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0;
}

- (void)commitViewController:(id)a3 URL:(id)a4
{
  uint64_t v4 = sub_1BF7DD068();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BF7DD018();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end