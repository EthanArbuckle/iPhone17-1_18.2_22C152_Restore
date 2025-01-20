@interface SeymourDiscoverySheetCoordinator
- (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator)init;
- (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator)initWithAppContext:(id)a3 badgingProvider:(id)a4 delegate:(id)a5;
- (void)activate;
@end

@implementation SeymourDiscoverySheetCoordinator

- (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator)initWithAppContext:(id)a3 badgingProvider:(id)a4 delegate:(id)a5
{
  v7 = (char *)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator *)sub_1000269E0(v7, (uint64_t)a4, (uint64_t)a5);
}

- (void)activate
{
  v2 = self;
  sub_10003A7D4();
}

- (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator)init
{
  result = (_TtC10FitnessApp32SeymourDiscoverySheetCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_userDefaults));
  swift_unknownObjectRelease();
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_contentAvailabilityClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_engagementClient);
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_privacyPreferenceClient);
  sub_10019B9F8((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_delegate);
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_firstAppLaunchDate;
  uint64_t v4 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_lastIntroSheetViewDate, (uint64_t *)&unk_10095B890);
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_lastWhatsNewSheetViewDate, (uint64_t *)&unk_10095B890);
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_introSheetConfiguration, &qword_100959610);
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_whatsNewSheetConfiguraion, &qword_100959608);
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_contentAvailablity, &qword_100959630);
  sub_10008DB18((uint64_t)self + OBJC_IVAR____TtC10FitnessApp32SeymourDiscoverySheetCoordinator_noticePrivacyPreference, &qword_100959628);
}

@end