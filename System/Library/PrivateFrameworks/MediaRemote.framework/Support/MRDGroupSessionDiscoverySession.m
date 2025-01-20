@interface MRDGroupSessionDiscoverySession
- (MRDGroupSession)session;
- (NSArray)availableOutputDevices;
- (NSString)description;
- (_TtC12mediaremoted31MRDGroupSessionDiscoverySession)init;
- (id)addOutputDevicesChangedCallback:(id)a3;
- (void)handleGroupSessionServerStart:(id)a3;
- (void)handleGroupSessionServerStop:(id)a3;
- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4;
- (void)manager:(id)a3 didJoinRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4;
- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4;
- (void)removeOutputDevicesChangedCallback:(id)a3;
- (void)session:(id)a3 didChangeState:(int64_t)a4;
- (void)session:(id)a3 didUpdateParticipants:(id)a4;
@end

@implementation MRDGroupSessionDiscoverySession

- (NSArray)availableOutputDevices
{
  v2 = self;
  sub_100013A80(&qword_1004782D8);
  sub_100289944((void (*)(void))sub_100190404);

  sub_1001924DC();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v3.super.isa;
}

- (MRDGroupSession)session
{
  v2 = self;
  sub_100013A80(&qword_100478340);
  sub_100289944((void (*)(void))sub_100190524);

  return (MRDGroupSession *)v4;
}

- (_TtC12mediaremoted31MRDGroupSessionDiscoverySession)init
{
  return (_TtC12mediaremoted31MRDGroupSessionDiscoverySession *)sub_10019053C();
}

- (id)addOutputDevicesChangedCallback:(id)a3
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  v9 = &v18[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  v11 = &v18[-v10];
  v12 = _Block_copy(a3);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  v14 = self;
  _Block_copy(v12);
  UUID.init()();
  v19 = v14;
  v20 = v9;
  v21 = sub_100194850;
  uint64_t v22 = v13;
  sub_100289944((void (*)(void))sub_100194AC0);
  (*(void (**)(void))((swift_isaMask & (uint64_t)v14->super.isa) + 0x88))();
  sub_1001924DC();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  (*((void (**)(void *, Class))v12 + 2))(v12, isa);
  swift_bridgeObjectRelease();

  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 32))(v11, v9, v5);
  swift_release();
  _Block_release(v12);

  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v6 + 16))(v9, v11, v5);
  v16 = (void *)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
  (*(void (**)(unsigned char *, uint64_t))(v6 + 8))(v11, v5);

  return v16;
}

- (void)removeOutputDevicesChangedCallback:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100190CDC((uint64_t)v5);

  sub_10018FD5C((uint64_t)v5);
}

- (NSString)description
{
  v2 = self;
  sub_100191004();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)manager:(id)a3 didStartHostedGroupSession:(id)a4
{
}

- (void)manager:(id)a3 didEndHostedGroupSession:(id)a4
{
}

- (void)manager:(id)a3 didJoinRemoteGroupSession:(id)a4
{
}

- (void)manager:(id)a3 didLeaveRemoteGroupSession:(id)a4
{
}

- (void)session:(id)a3 didChangeState:(int64_t)a4
{
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_1001913E4(a3);
  swift_unknownObjectRelease();
}

- (void)session:(id)a3 didUpdateParticipants:(id)a4
{
  sub_100013A80(&qword_10047A1C0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  sub_100191734(a3);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)handleGroupSessionServerStart:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_100194438();
}

- (void)handleGroupSessionServerStop:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10019460C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end