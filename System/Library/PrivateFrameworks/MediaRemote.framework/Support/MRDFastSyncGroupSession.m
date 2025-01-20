@interface MRDFastSyncGroupSession
+ (id)createSessionWithNearbyGroup:(id)a3 asUser:(id)a4 delegate:(id)a5;
+ (id)joinSessionWithNearbyGroup:(id)a3 asUser:(id)a4 hostSigningKey:(id)a5 delegate:(id)a6;
+ (id)stateToString:(int64_t)a3;
- (BOOL)shouldAutomaticallyApproveWithIdentity:(id)a3;
- (MRDFastSyncGroupSession)init;
- (MRDFastSyncGroupSessionParticipant)leaderParticipant;
- (MRDFastSyncGroupSessionParticipant)localParticipant;
- (NSString)identifier;
- (id)prewarmForIdentity:(id)a3;
- (int64_t)state;
- (void)addPendingParticipant:(id)a3;
- (void)cancelPrewarmedIdentifier:(id)a3 forIdentity:(id)a4;
- (void)dealloc;
- (void)end;
- (void)enterLowPowerModeWithCompletion:(id)a3;
- (void)exitLowPowerModeWithCompletion:(id)a3;
- (void)markParticipantAsGuestIfNeeded:(id)a3;
- (void)prepareForAddedMember;
- (void)remoteApprovePendingParticipant:(id)a3;
- (void)remoteRejectPendingParticipant:(id)a3;
- (void)remoteRemoveAllParticipants;
- (void)remoteRemoveParticipantWithIdentifier:(id)a3;
- (void)removeParticipantWithIdentifier:(id)a3;
- (void)removePendingParticipant:(id)a3;
- (void)sendRemoteControlMessage:(id)a3 to:(id)a4 completion:(id)a5;
- (void)setLeaderParticipant:(id)a3;
- (void)start;
@end

@implementation MRDFastSyncGroupSession

- (int64_t)state
{
  v2 = self;
  int64_t v3 = MRDFastSyncGroupSession.state.getter();

  return v3;
}

- (MRDFastSyncGroupSessionParticipant)localParticipant
{
  v2 = self;
  int64_t v3 = (void *)MRDFastSyncGroupSession.localParticipant.getter();

  return (MRDFastSyncGroupSessionParticipant *)v3;
}

- (MRDFastSyncGroupSessionParticipant)leaderParticipant
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_leaderParticipant);
  swift_beginAccess();
  return (MRDFastSyncGroupSessionParticipant *)*v2;
}

- (void)setLeaderParticipant:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_leaderParticipant);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

+ (id)createSessionWithNearbyGroup:(id)a3 asUser:(id)a4 delegate:(id)a5
{
  v7 = *(uint64_t (**)(uint64_t))((swift_isaMask & *(void *)a3) + 0x68);
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  uint64_t v10 = swift_retain();
  uint64_t v11 = v7(v10);
  uint64_t v13 = v12;
  type metadata accessor for RemoteControlActivity();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v11;
  *(void *)(v14 + 24) = v13;
  sub_100013A80(&qword_1004799C0);
  swift_allocObject();
  v15 = (void *)NearbyGroupSessionProvider.init(nearbyGroup:activity:)();
  id v16 = objc_allocWithZone((Class)type metadata accessor for MRDFastSyncGroupSession());
  v17 = (void *)sub_1001F5744(1, v9, v15, (uint64_t)a5);

  return v17;
}

+ (id)joinSessionWithNearbyGroup:(id)a3 asUser:(id)a4 hostSigningKey:(id)a5 delegate:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  swift_unknownObjectRetain();
  uint64_t v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;

  v15 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v9) + 0x68);
  uint64_t v16 = swift_retain();
  uint64_t v17 = v15(v16);
  uint64_t v19 = v18;
  type metadata accessor for RemoteControlActivity();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v17;
  *(void *)(v20 + 24) = v19;
  sub_100013A80(&qword_1004799C0);
  swift_allocObject();
  v21 = (void *)NearbyGroupSessionProvider.init(nearbyGroup:activity:)();
  objc_allocWithZone((Class)type metadata accessor for MRDFastSyncGroupSession());
  id v22 = v10;
  swift_unknownObjectRetain();
  v23 = (void *)sub_1001F5744(0, v22, v21, (uint64_t)a6);
  sub_10018FE9C(v12, v14);

  swift_unknownObjectRelease();

  return v23;
}

+ (id)stateToString:(int64_t)a3
{
  if ((unint64_t)a3 >= 5)
  {
    id result = (id)_diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
    __break(1u);
  }
  else
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    return v3;
  }
  return result;
}

- (void)dealloc
{
  NSString v2 = self;
  MRDFastSyncGroupSession.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  sub_1001B9788((uint64_t)self + OBJC_IVAR___MRDFastSyncGroupSession_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  sub_1001924CC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MRDFastSyncGroupSession_lowPowerCompletion));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)start
{
  NSString v2 = self;
  MRDFastSyncGroupSession.start()();
}

- (void)end
{
  NSString v2 = self;
  MRDFastSyncGroupSession.end()();
}

- (id)prewarmForIdentity:(id)a3
{
  id v4 = a3;
  v5 = self;
  MRDFastSyncGroupSession.prewarm(for:)(v4);

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)cancelPrewarmedIdentifier:(id)a3 forIdentity:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a4;
  id v10 = self;
  MRDFastSyncGroupSession.cancel(prewarmedIdentifier:for:)(v6, v8, v9);

  swift_bridgeObjectRelease();
}

- (void)prepareForAddedMember
{
  NSString v2 = self;
  MRDFastSyncGroupSession.prepareForAddedMember()();
}

- (BOOL)shouldAutomaticallyApproveWithIdentity:(id)a3
{
  id v4 = a3;
  v5 = self;
  LOBYTE(self) = MRDFastSyncGroupSession.shouldAutomaticallyApprove(identity:)(v4);

  return self & 1;
}

- (void)removeParticipantWithIdentifier:(id)a3
{
}

- (void)markParticipantAsGuestIfNeeded:(id)a3
{
}

- (void)addPendingParticipant:(id)a3
{
}

- (void)removePendingParticipant:(id)a3
{
}

- (void)remoteApprovePendingParticipant:(id)a3
{
}

- (void)remoteRejectPendingParticipant:(id)a3
{
}

- (void)remoteRemoveParticipantWithIdentifier:(id)a3
{
}

- (void)remoteRemoveAllParticipants
{
  NSString v2 = self;
  MRDFastSyncGroupSession.remoteRemoveAllParticipants()();
}

- (void)enterLowPowerModeWithCompletion:(id)a3
{
}

- (void)exitLowPowerModeWithCompletion:(id)a3
{
}

- (void)sendRemoteControlMessage:(id)a3 to:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  uint64_t v16 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  uint64_t v14 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v8;
  MRDFastSyncGroupSession.sendRemoteControlMessage(_:to:completion:)(v11, v13, v14, (uint64_t)sub_100239790, v15);
  swift_bridgeObjectRelease();
  swift_release();
  sub_10018FE9C(v11, v13);
}

- (MRDFastSyncGroupSession)init
{
  id result = (MRDFastSyncGroupSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end