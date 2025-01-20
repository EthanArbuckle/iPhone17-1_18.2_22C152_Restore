@interface ArticleThumbnailComponentViewFactory
- (NSString)type;
- (_TtC12NewsArticles36ArticleThumbnailComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6;
- (id)componentViewForComponent:(id)a3;
- (int)role;
@end

@implementation ArticleThumbnailComponentViewFactory

- (NSString)type
{
  v2 = (void *)sub_1BF7E3998();
  return (NSString *)v2;
}

- (int)role
{
  return 0;
}

- (_TtC12NewsArticles36ArticleThumbnailComponentViewFactory)initWithDOMObjectProvider:(id)a3 viewport:(id)a4 presentationDelegateProvider:(id)a5 componentStyleRendererFactory:(id)a6
{
  swift_unknownObjectRetain();
  id v7 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  result = (_TtC12NewsArticles36ArticleThumbnailComponentViewFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles36ArticleThumbnailComponentViewFactory_resolver);
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC12NewsArticles36ArticleThumbnailComponentViewFactory_linkedContentProvider);
}

- (id)componentViewForComponent:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  v5 = (void *)sub_1BF6E5640();
  swift_unknownObjectRelease();

  return v5;
}

@end