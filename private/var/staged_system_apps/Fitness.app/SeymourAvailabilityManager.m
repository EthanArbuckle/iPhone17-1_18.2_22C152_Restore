@interface SeymourAvailabilityManager
+ (NSString)seymourAvailabilityDidChangeNotification;
- (BOOL)available;
- (BOOL)stateKnown;
- (BOOL)unavailable;
- (_TtC10FitnessApp26SeymourAvailabilityManager)init;
- (void)updateAvailability;
@end

@implementation SeymourAvailabilityManager

- (BOOL)available
{
  v2 = self;
  char v3 = sub_10007545C();

  return v3 & 1;
}

- (_TtC10FitnessApp26SeymourAvailabilityManager)init
{
  return (_TtC10FitnessApp26SeymourAvailabilityManager *)sub_10002A7C0();
}

+ (NSString)seymourAvailabilityDidChangeNotification
{
  if (qword_10094A690 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100997810;

  return (NSString *)v2;
}

- (void)updateAvailability
{
  v2 = self;
  sub_100049220();
}

- (BOOL)unavailable
{
  v2 = self;
  BOOL v3 = sub_10021247C();

  return v3;
}

- (BOOL)stateKnown
{
  uint64_t v3 = type metadata accessor for SeymourAvailabilityManager.State(0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC10FitnessApp26SeymourAvailabilityManager_state;
  swift_beginAccess();
  sub_100075760((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for ContentAvailability();
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_100074AF8((uint64_t)v5);
  return (char)v6;
}

- (void).cxx_destruct
{
  _s10FitnessApp24HistoryViewActionContextVwxx_0((uint64_t)self + OBJC_IVAR____TtC10FitnessApp26SeymourAvailabilityManager_contentAvailabilityClient);
  swift_unknownObjectRelease();
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp26SeymourAvailabilityManager_state;

  sub_100074AF8((uint64_t)v3);
}

@end