@interface CHFitnessAppBadgeAggregator
- (BOOL)hasAmeliaBadge;
- (CHFitnessAppBadgeAggregator)init;
- (CHFitnessAppBadgeAggregator)initWithFitnessAppContext:(id)a3 activitySharingClient:(id)a4;
- (CHFitnessAppBadgeAggregatorDelegate)delegate;
- (void)onAvailabilityChange:(id)a3;
- (void)refreshBadgeCount;
- (void)setDelegate:(id)a3;
- (void)setHasAmeliaBadge:(BOOL)a3;
- (void)triggerFetch;
@end

@implementation CHFitnessAppBadgeAggregator

- (CHFitnessAppBadgeAggregator)initWithFitnessAppContext:(id)a3 activitySharingClient:(id)a4
{
  v5 = (char *)a3;
  id v6 = a4;
  return (CHFitnessAppBadgeAggregator *)sub_10001E7E0(v5, a4);
}

- (void)setDelegate:(id)a3
{
}

- (void)triggerFetch
{
  v2 = self;
  sub_100035104();
  sub_100041C60();
  sub_100055414();
}

- (BOOL)hasAmeliaBadge
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CHFitnessAppBadgeAggregator_hasAmeliaBadge);
}

- (CHFitnessAppBadgeAggregatorDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (CHFitnessAppBadgeAggregatorDelegate *)Strong;
}

- (void)setHasAmeliaBadge:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CHFitnessAppBadgeAggregator_hasAmeliaBadge) = a3;
}

- (void)onAvailabilityChange:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1000736F0(0, 0);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (CHFitnessAppBadgeAggregator)init
{
  result = (CHFitnessAppBadgeAggregator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10019B9F8((uint64_t)self + OBJC_IVAR___CHFitnessAppBadgeAggregator_delegate);

  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___CHFitnessAppBadgeAggregator_contentAvailabilityClient);
  swift_release();
  swift_unknownObjectRelease();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR___CHFitnessAppBadgeAggregator_privacyPreferenceClient);

  swift_bridgeObjectRelease();
}

- (void)refreshBadgeCount
{
  v2 = self;
  sub_100035104();
  sub_100041C60();
  sub_100055414();
}

@end