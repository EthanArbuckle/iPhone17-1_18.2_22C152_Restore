@interface AlacartePaywallViewProvider
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC16NewsSubscription27AlacartePaywallViewProvider)init;
@end

@implementation AlacartePaywallViewProvider

- (_TtC16NewsSubscription27AlacartePaywallViewProvider)init
{
  result = (_TtC16NewsSubscription27AlacartePaywallViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BFA51A44((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_delegate);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_styler);
  sub_1BFB1AC9C((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_viewModel, (uint64_t (*)(void))type metadata accessor for AlacartePaywallViewModel);
  long long v3 = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel + 32];
  v8[6] = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel
                                       + 16];
  v8[7] = v3;
  long long v4 = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel + 64];
  v8[8] = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel
                                       + 48];
  v8[9] = v4;
  long long v5 = *(_OWORD *)&self->styler[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel + 8];
  v8[2] = *(_OWORD *)&self->dataProvider[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel
                                       + 8];
  v8[3] = v5;
  long long v6 = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel];
  v8[4] = *(_OWORD *)&self->styler[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel + 24];
  v8[5] = v6;
  long long v7 = *(_OWORD *)&self->delegate[OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallModel);
  v8[1] = v7;
  sub_1BFA516CC((uint64_t)v8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_paywallView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_layoutAttributesFactory);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27AlacartePaywallViewProvider_subscribeButtonTextProvider);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9 = sub_1BFBD1DD8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD1D98();
  id v13 = a3;
  v14 = self;
  LOBYTE(a6) = sub_1BFB1ACFC((uint64_t)v12, a6);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return a6 & 1;
}

@end