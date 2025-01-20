@interface UrlActivityItemProvider
- (_TtC23ShelfKitCollectionViews23UrlActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)item;
@end

@implementation UrlActivityItemProvider

- (id)item
{
  return sub_268940(self, (uint64_t)a2, (void (*)(void *__return_ptr))sub_2683F0);
}

- (_TtC23ShelfKitCollectionViews23UrlActivityItemProvider)initWithPlaceholderItem:(id)a3
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23UrlActivityItemProvider_url;
  uint64_t v4 = sub_37AFA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews23UrlActivityItemProvider_shortUrl;

  sub_125600((uint64_t)v5);
}

@end