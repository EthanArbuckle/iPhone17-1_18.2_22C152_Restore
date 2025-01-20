@interface ArticleThumbnailComponentSizerFactory
- (NSString)type;
- (_TtC12NewsArticles37ArticleThumbnailComponentSizerFactory)init;
- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6;
- (int)role;
@end

@implementation ArticleThumbnailComponentSizerFactory

- (NSString)type
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BF7E3998();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int)role
{
  return *(_DWORD *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC12NewsArticles37ArticleThumbnailComponentSizerFactory_role);
}

- (_TtC12NewsArticles37ArticleThumbnailComponentSizerFactory)init
{
  result = (_TtC12NewsArticles37ArticleThumbnailComponentSizerFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC12NewsArticles37ArticleThumbnailComponentSizerFactory_linkedContentProvider);
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v11 = a5;
  swift_unknownObjectRetain();
  v12 = self;
  id v13 = objc_msgSend(a6, sel_componentStyleForComponent_, a3);
  v14 = *(Class *)((char *)&v12->super.isa
                 + OBJC_IVAR____TtC12NewsArticles37ArticleThumbnailComponentSizerFactory_linkedContentProvider);
  v15 = (objc_class *)type metadata accessor for ArticleThumbnailComponentSizer();
  v16 = (char *)objc_allocWithZone(v15);
  *(void *)&v16[OBJC_IVAR____TtC12NewsArticles30ArticleThumbnailComponentSizer_linkedContentProvider] = v14;
  v20.receiver = v16;
  v20.super_class = v15;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v17 = v14;
  v18 = [(ArticleThumbnailComponentSizerFactory *)&v20 initWithComponent:a3 componentLayout:a4 componentStyle:v13 DOMObjectProvider:a6 layoutOptions:v11];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease_n();
  swift_unknownObjectRelease_n();
  swift_unknownObjectRelease();
  return v18;
}

@end