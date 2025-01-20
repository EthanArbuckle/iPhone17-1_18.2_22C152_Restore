@interface FollowingNotificationsDataManager
- (_TtC7NewsUI233FollowingNotificationsDataManager)init;
- (void)determineSystemNotificationSettingsStatus;
- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3;
- (void)userInfoDidChangeEndOfAudioTrackNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4;
- (void)userInfoDidChangeMarketingNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4;
- (void)userInfoDidChangeNewIssueNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4;
- (void)userInfoDidChangePuzzleNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4;
- (void)userInfoDidChangeSportsTopicNotificationsEnabledState:(id)a3 fromCloud:(BOOL)a4;
@end

@implementation FollowingNotificationsDataManager

- (void)determineSystemNotificationSettingsStatus
{
  swift_getObjectType();
  type metadata accessor for NotificationSettings();
  v3 = self;
  sub_1DFDEE090();
  v4 = (void *)sub_1DFDEDCE0();
  sub_1DFDEDE20();
  swift_release();

  v5 = (void *)sub_1DFDEDCE0();
  sub_1DFDEDE60();

  swift_release();
  swift_release();
}

- (_TtC7NewsUI233FollowingNotificationsDataManager)init
{
  result = (_TtC7NewsUI233FollowingNotificationsDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI233FollowingNotificationsDataManager_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI233FollowingNotificationsDataManager_notificationService);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI233FollowingNotificationsDataManager_sportsOnboardingManager;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)userInfoDidChangeMarketingNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1DF42C000(v5);
}

- (void)userInfoDidChangeNewIssueNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1DF42C11C(v5);
}

- (void)userInfoDidChangeEndOfAudioTrackNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1DF42C238(v5);
}

- (void)userInfoDidChangePuzzleNotificationsEnabled:(id)a3 fromCloud:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1DF42B500(v6, a4);
}

- (void)userInfoDidChangeSportsTopicNotificationsEnabledState:(id)a3 fromCloud:(BOOL)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1DF42C4A4(v5);
}

- (void)newsletterSubscriptionChangedFromSubscription:(int64_t)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC7NewsUI233FollowingNotificationsDataManager_delegate;
  if (MEMORY[0x1E01EFB70]((char *)self + OBJC_IVAR____TtC7NewsUI233FollowingNotificationsDataManager_delegate, a2, a3))
  {
    uint64_t v5 = *((void *)v4 + 1);
    swift_getObjectType();
    id v6 = *(void (**)(void))(v5 + 24);
    v7 = self;
    v6();

    swift_unknownObjectRelease();
  }
}

@end