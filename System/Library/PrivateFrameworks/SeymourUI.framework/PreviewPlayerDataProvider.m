@interface PreviewPlayerDataProvider
- (_TtC9SeymourUI25PreviewPlayerDataProvider)init;
- (void)playerFinished:(id)a3;
@end

@implementation PreviewPlayerDataProvider

- (void)playerFinished:(id)a3
{
  uint64_t v4 = sub_23A7F5F48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F5F18();
  v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_display;
  if (MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_display))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v11 = *(void (**)(uint64_t, uint64_t))(v9 + 40);
    v12 = self;
    v11(ObjectType, v9);

    swift_unknownObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC9SeymourUI25PreviewPlayerDataProvider)init
{
  result = (_TtC9SeymourUI25PreviewPlayerDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_preview;
  uint64_t v4 = sub_23A7F7AF8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_display);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_assetClient);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_marketingItemProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_marketingMetricFieldsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_subscriptionCache);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_dynamicOfferCoordinator));
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI25PreviewPlayerDataProvider_purchaseHandler);
}

@end