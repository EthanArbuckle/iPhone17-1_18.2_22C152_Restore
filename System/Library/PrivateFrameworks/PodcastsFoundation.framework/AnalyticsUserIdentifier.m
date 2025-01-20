@interface AnalyticsUserIdentifier
- (BOOL)userAllowsPersonalization;
- (BOOL)userIsManagedAccount;
- (BOOL)userUnder13YearsOld;
- (NSString)clientId;
- (NSString)userId;
- (_TtC18PodcastsFoundation23AnalyticsUserIdentifier)init;
@end

@implementation AnalyticsUserIdentifier

- (NSString)clientId
{
  return (NSString *)sub_1ACBFE350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18PodcastsFoundation23AnalyticsUserIdentifier_clientId);
}

- (NSString)userId
{
  return (NSString *)sub_1ACBFE350((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18PodcastsFoundation23AnalyticsUserIdentifier_userId);
}

- (BOOL)userAllowsPersonalization
{
  return *((unsigned char *)&self->super.isa
         + OBJC_IVAR____TtC18PodcastsFoundation23AnalyticsUserIdentifier_userAllowsPersonalization);
}

- (BOOL)userUnder13YearsOld
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation23AnalyticsUserIdentifier_userUnder13YearsOld);
}

- (BOOL)userIsManagedAccount
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation23AnalyticsUserIdentifier_userIsManagedAccount);
}

- (_TtC18PodcastsFoundation23AnalyticsUserIdentifier)init
{
  result = (_TtC18PodcastsFoundation23AnalyticsUserIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end