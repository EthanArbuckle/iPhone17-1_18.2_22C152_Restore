@interface CSDConversationSpatialPersonaResolver
- (BOOL)upsertWithParticipantID:(unint64_t)a3 generationID:(unint64_t)a4 spatialPersonaState:(int64_t)a5;
- (NSString)description;
- (_TtC13callservicesd37CSDConversationSpatialPersonaResolver)init;
- (_TtC13callservicesd37CSDConversationSpatialPersonaResolver)initWithQueue:(id)a3;
- (id)participantStateStrWithTruncate:(BOOL)a3;
- (int64_t)conversationState;
- (int64_t)localParticipantState;
- (unint64_t)generationCounter;
- (unint64_t)localGenerationCounter;
- (unint64_t)setLocalSpatialPersonaWithEnabled:(BOOL)a3;
- (void)configWithLocalParticipantID:(unint64_t)a3 groupUUID:(id)a4 activeParticipantIdentifiers:(id)a5;
- (void)removeParticipantWithIdentifier:(unint64_t)a3;
- (void)reset;
- (void)setLocalGenerationCounter:(unint64_t)a3;
- (void)setLocalParticipantState:(int64_t)a3;
@end

@implementation CSDConversationSpatialPersonaResolver

- (unint64_t)localGenerationCounter
{
  return sub_1001FDF5C();
}

- (void)setLocalGenerationCounter:(unint64_t)a3
{
}

- (int64_t)localParticipantState
{
  return sub_1001FDFC8();
}

- (void)setLocalParticipantState:(int64_t)a3
{
}

- (_TtC13callservicesd37CSDConversationSpatialPersonaResolver)initWithQueue:(id)a3
{
  return (_TtC13callservicesd37CSDConversationSpatialPersonaResolver *)sub_1001FE078(a3);
}

- (_TtC13callservicesd37CSDConversationSpatialPersonaResolver)init
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13callservicesd37CSDConversationSpatialPersonaResolver_queue));
  sub_1002012F4((uint64_t)self + OBJC_IVAR____TtC13callservicesd37CSDConversationSpatialPersonaResolver_groupUUID);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (unint64_t)generationCounter
{
  v2 = self;
  v3 = sub_1001FE6FC();

  return (unint64_t)v3;
}

- (int64_t)conversationState
{
  v2 = self;
  sub_1001FE93C();
  int64_t v4 = v3;

  return v4;
}

- (void)reset
{
  v2 = self;
  sub_1001FF08C();
}

- (void)configWithLocalParticipantID:(unint64_t)a3 groupUUID:(id)a4 activeParticipantIdentifiers:(id)a5
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  static Set._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  sub_1001FF34C();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (unint64_t)setLocalSpatialPersonaWithEnabled:(BOOL)a3
{
  int64_t v3 = self;
  sub_1001FF8F4();
  unint64_t v5 = v4;

  return v5;
}

- (BOOL)upsertWithParticipantID:(unint64_t)a3 generationID:(unint64_t)a4 spatialPersonaState:(int64_t)a5
{
  unint64_t v5 = self;
  sub_1001FFF98();
  char v7 = v6;

  return v7 & 1;
}

- (void)removeParticipantWithIdentifier:(unint64_t)a3
{
  unint64_t v4 = self;
  sub_100200BF8(a3);
}

- (id)participantStateStrWithTruncate:(BOOL)a3
{
  unint64_t v4 = self;
  sub_100200C9C(a3);

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

- (NSString)description
{
  v2 = self;
  CSDConversationSpatialPersonaResolver.description.getter();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end