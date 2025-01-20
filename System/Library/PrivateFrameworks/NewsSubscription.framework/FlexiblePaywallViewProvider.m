@interface FlexiblePaywallViewProvider
- (_TtC16NewsSubscription27FlexiblePaywallViewProvider)init;
@end

@implementation FlexiblePaywallViewProvider

- (_TtC16NewsSubscription27FlexiblePaywallViewProvider)init
{
  result = (_TtC16NewsSubscription27FlexiblePaywallViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BFA51A44((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_hardPaywallGradientView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallCollectionView));
  long long v3 = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallModel + 64];
  v8[6] = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallModel
                                       + 48];
  v8[7] = v3;
  long long v4 = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallModel + 96];
  v8[8] = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallModel
                                       + 80];
  v8[9] = v4;
  long long v5 = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallModel];
  v8[2] = *(_OWORD *)&self->hardPaywallGradientView[OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallModel];
  v8[3] = v5;
  long long v6 = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallModel + 32];
  v8[4] = *(_OWORD *)&self->paywallModel[OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallModel
                                       + 16];
  v8[5] = v6;
  long long v7 = *(_OWORD *)&self->delegate[OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallModel + 8];
  v8[0] = *(_OWORD *)((char *)&self->super.isa
                    + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallModel);
  v8[1] = v7;
  sub_1BFA516CC((uint64_t)v8);
  swift_release();
  sub_1BFB5BA30((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_resolvedContent, &qword_1EBA86A90, MEMORY[0x1E4F80940]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_dataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_dataDelegate));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_layoutTaskQueue));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_paywallLayoutProvider);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_subscribeButtonTextProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_offerOverrideProvider);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription27FlexiblePaywallViewProvider_individualPurchaseMetadata));
}

@end