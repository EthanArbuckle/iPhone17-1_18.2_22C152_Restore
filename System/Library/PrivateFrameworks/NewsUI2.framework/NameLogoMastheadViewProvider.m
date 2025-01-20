@interface NameLogoMastheadViewProvider
- (_TtC7NewsUI228NameLogoMastheadViewProvider)init;
@end

@implementation NameLogoMastheadViewProvider

- (_TtC7NewsUI228NameLogoMastheadViewProvider)init
{
  result = (_TtC7NewsUI228NameLogoMastheadViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228NameLogoMastheadViewProvider_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI228NameLogoMastheadViewProvider_layoutAttributesFactory);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI228NameLogoMastheadViewProvider_margins;
  uint64_t v4 = sub_1DFDF2A50();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI228NameLogoMastheadViewProvider_model);
  swift_unknownObjectRelease();
}

@end