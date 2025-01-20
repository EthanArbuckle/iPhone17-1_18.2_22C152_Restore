@interface ANFIssueCoverViewProvider
- (_TtC12NewsArticles25ANFIssueCoverViewProvider)init;
- (id)viewForIssueCover:(id)a3;
- (void)presentIssueCover:(id)a3 onView:(id)a4 options:(id)a5;
@end

@implementation ANFIssueCoverViewProvider

- (id)viewForIssueCover:(id)a3
{
  id v3 = objc_msgSend(objc_allocWithZone((Class)sub_1BF7E2AB8()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  return v3;
}

- (void)presentIssueCover:(id)a3 onView:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1BF4D87F0(v9, v10);
}

- (_TtC12NewsArticles25ANFIssueCoverViewProvider)init
{
  result = (_TtC12NewsArticles25ANFIssueCoverViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles25ANFIssueCoverViewProvider_layoutAttributesFactory);
  id v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles25ANFIssueCoverViewProvider_renderer;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end