@interface NLTVConnectionManager
- (BOOL)isDiscoveryAllowed;
- (NLTVConnectionManager)init;
- (id)presenter:(id)a3 userNotificationCenter:(id)a4;
- (void)beginDiscovery;
- (void)connectAutomatically;
- (void)endDiscovery;
- (void)setIsDiscoveryAllowed:(BOOL)a3;
- (void)updateDiscoveryStateIfNeeded;
@end

@implementation NLTVConnectionManager

- (id)presenter:(id)a3 userNotificationCenter:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  id v7 = sub_100056EE0((uint64_t)a3, v6);
  swift_unknownObjectRelease();

  return v7;
}

- (void)updateDiscoveryStateIfNeeded
{
  v2 = self;
  sub_10006B35C();
}

- (void)setIsDiscoveryAllowed:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___NLTVConnectionManager_isDiscoveryAllowed) = a3;
}

- (BOOL)isDiscoveryAllowed
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___NLTVConnectionManager_isDiscoveryAllowed);
}

- (void)beginDiscovery
{
  v2 = self;
  sub_100036E58();
}

- (void)endDiscovery
{
  v2 = self;
  sub_10055DF08();
}

- (void)connectAutomatically
{
  v2 = self;
  sub_10055E5C4();
}

- (NLTVConnectionManager)init
{
  result = (NLTVConnectionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___NLTVConnectionManager_participantClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___NLTVConnectionManager_browsingClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___NLTVConnectionManager_sessionClient);
  swift_unknownObjectRelease();
  swift_release();
  sub_10019B9F8((uint64_t)self + OBJC_IVAR___NLTVConnectionManager_presenter);
  sub_10006B590((uint64_t)self + OBJC_IVAR___NLTVConnectionManager_state);
  swift_release();

  swift_release();
}

@end