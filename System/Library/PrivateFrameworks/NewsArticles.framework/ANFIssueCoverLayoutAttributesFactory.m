@interface ANFIssueCoverLayoutAttributesFactory
- (_TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory)init;
- (id)createAttributesWithIssueCover:(id)a3 options:(id)a4;
@end

@implementation ANFIssueCoverLayoutAttributesFactory

- (id)createAttributesWithIssueCover:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_1BF6128D0(v7);

  return v9;
}

- (_TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory)init
{
  result = (_TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory_issue));
  swift_unknownObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC12NewsArticles36ANFIssueCoverLayoutAttributesFactory_issueCoverLayoutAttributesFactory;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end