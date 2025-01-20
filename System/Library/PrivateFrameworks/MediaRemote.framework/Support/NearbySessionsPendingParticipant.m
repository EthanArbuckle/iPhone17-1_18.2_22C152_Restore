@interface NearbySessionsPendingParticipant
- (BOOL)connected;
- (BOOL)guest;
- (BOOL)hidden;
- (MRUserIdentity)identity;
- (NSString)identifier;
- (_TtC12mediaremoted32NearbySessionsPendingParticipant)init;
- (void)setConnected:(BOOL)a3;
- (void)setGuest:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIdentity:(id)a3;
@end

@implementation NearbySessionsPendingParticipant

- (NSString)identifier
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setIdentifier:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (MRUserIdentity)identity
{
  NSString v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identity);
  swift_beginAccess();
  return (MRUserIdentity *)*v2;
}

- (void)setIdentity:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identity);
  swift_beginAccess();
  uint64_t v5 = *v4;
  *uint64_t v4 = a3;
  id v6 = a3;
}

- (BOOL)connected
{
  NSString v2 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_connected;
  swift_beginAccess();
  return *v2;
}

- (void)setConnected:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_connected;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)guest
{
  NSString v2 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_guest;
  swift_beginAccess();
  return *v2;
}

- (void)setGuest:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_guest;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)hidden
{
  NSString v2 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_hidden;
  swift_beginAccess();
  return *v2;
}

- (void)setHidden:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_hidden;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (_TtC12mediaremoted32NearbySessionsPendingParticipant)init
{
  result = (_TtC12mediaremoted32NearbySessionsPendingParticipant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_identity));
  v3 = (char *)self + OBJC_IVAR____TtC12mediaremoted32NearbySessionsPendingParticipant_connectionRequest;
  uint64_t v4 = sub_100013A80(&qword_10047B6B0);
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end