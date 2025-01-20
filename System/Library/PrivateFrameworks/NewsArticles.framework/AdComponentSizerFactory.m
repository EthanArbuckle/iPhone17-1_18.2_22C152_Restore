@interface AdComponentSizerFactory
- (NSString)type;
- (_TtC12NewsArticles23AdComponentSizerFactory)init;
- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6;
- (int)role;
@end

@implementation AdComponentSizerFactory

- (NSString)type
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BF7E3998();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int)role
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles23AdComponentSizerFactory_role);
}

- (id)sizerForComponent:(id)a3 componentLayout:(id)a4 layoutOptions:(id)a5 DOMObjectProvider:(id)a6
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v11 = a5;
  swift_unknownObjectRetain();
  v12 = self;
  id v13 = sub_1BF68A984((uint64_t)a3, (uint64_t)a4, v11, a6);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v13;
}

- (_TtC12NewsArticles23AdComponentSizerFactory)init
{
  result = (_TtC12NewsArticles23AdComponentSizerFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles23AdComponentSizerFactory_layoutStore);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles23AdComponentSizerFactory_bannerAdFactory;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end