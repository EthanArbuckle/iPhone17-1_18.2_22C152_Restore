@interface JSUserNotificationAuthorizationViewModel
@end

@implementation JSUserNotificationAuthorizationViewModel

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC11MusicJSCore40JSUserNotificationAuthorizationViewModel_pendingUserNotificationAuthenticationContext);
  uint64_t v4 = *(void *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore40JSUserNotificationAuthorizationViewModel_pendingUserNotificationAuthenticationContext];
  uint64_t v5 = *(void *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore40JSUserNotificationAuthorizationViewModel_pendingUserNotificationAuthenticationContext
                                                          + 8];
  uint64_t v6 = *(void *)&self->super.super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore40JSUserNotificationAuthorizationViewModel_pendingUserNotificationAuthenticationContext];
  v7 = *(void **)&self->super.playActivityFeatureName[OBJC_IVAR____TtC11MusicJSCore40JSUserNotificationAuthorizationViewModel_pendingUserNotificationAuthenticationContext];

  sub_998FCC(v3, v4, v5, v6, v7);
}

@end