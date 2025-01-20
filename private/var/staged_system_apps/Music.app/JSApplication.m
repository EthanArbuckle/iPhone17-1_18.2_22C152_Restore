@interface JSApplication
- (void)dealloc;
@end

@implementation JSApplication

- (void)dealloc
{
  v2 = self;
  JSApplication.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_100046744((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSApplication_scriptingMessageDelegate);
  sub_100046744((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSApplication_globalMessagePresentationDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore13JSApplication_sharedWithYouMetadata, &qword_1010D3EB8);
  swift_release();
  sub_100C551A0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingBecomingActiveContext), *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingBecomingActiveContext], *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingBecomingActiveContext+ 8], *(void *)&self->super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingBecomingActiveContext], *(void **)&self->scriptingMessageDelegate[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingBecomingActiveContext]);
  sub_100C551A0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingInitiateSubscriptionContext), *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingInitiateSubscriptionContext], *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingInitiateSubscriptionContext+ 8], *(void *)&self->super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingInitiateSubscriptionContext], *(void **)&self->scriptingMessageDelegate[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingInitiateSubscriptionContext]);
  swift_bridgeObjectRelease();
  sub_100C551A0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyOnboardingPresentationStatusChangedContext), *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyOnboardingPresentationStatusChangedContext], *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyOnboardingPresentationStatusChangedContext+ 8], *(void *)&self->super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyOnboardingPresentationStatusChangedContext], *(void **)&self->scriptingMessageDelegate[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyOnboardingPresentationStatusChangedContext]);
  sub_100C551A0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyTermsAcceptedContext), *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyTermsAcceptedContext], *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyTermsAcceptedContext+ 8], *(void *)&self->super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyTermsAcceptedContext], *(void **)&self->scriptingMessageDelegate[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingPrivacyTermsAcceptedContext]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingApplicationMessageSegueContext);
  uint64_t v4 = *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingApplicationMessageSegueContext];
  uint64_t v5 = *(void *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingApplicationMessageSegueContext
                                                    + 8];
  uint64_t v6 = *(void *)&self->super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingApplicationMessageSegueContext];
  v7 = *(void **)&self->scriptingMessageDelegate[OBJC_IVAR____TtC11MusicJSCore13JSApplication_pendingApplicationMessageSegueContext];

  sub_100C551A0(v3, v4, v5, v6, v7);
}

@end