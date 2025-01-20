@interface MarketingPaletteBannerPresenter
- (_TtC9SeymourUI31MarketingPaletteBannerPresenter)init;
- (void)textSizeChanged:(id)a3;
@end

@implementation MarketingPaletteBannerPresenter

- (void)textSizeChanged:(id)a3
{
  uint64_t v4 = sub_23A7F5F48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F5F18();
  v8 = self;
  sub_239F6C964();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC9SeymourUI31MarketingPaletteBannerPresenter)init
{
  result = (_TtC9SeymourUI31MarketingPaletteBannerPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_contentAvailabilityClient);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_placementProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_subscriptionCache);
  swift_release();
  sub_239F6F710(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_currentPlacementStatus), self->contentAvailabilityClient[OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_currentPlacementStatus]);
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_display);
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter__fakeUnifiedMessagingPlacements;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF5F7F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_state);
  unsigned __int8 v6 = self->contentAvailabilityClient[OBJC_IVAR____TtC9SeymourUI31MarketingPaletteBannerPresenter_state];

  sub_239F6F980(v5, v6);
}

@end