@interface SDAuthenticationManager
+ (_TtC16DaemoniOSLibrary23SDAuthenticationManager)shared;
- (OS_dispatch_queue)queue;
- (_TtC16DaemoniOSLibrary23SDAuthenticationManager)init;
- (_TtC16DaemoniOSLibrary23SDAuthenticationManager)initWithQueue:(id)a3;
- (_TtP16DaemoniOSLibrary31SDAuthenticationManagerDelegate_)delegate;
- (void)addAuthenticationStateChangesObserver:(id)a3 identifier:(id)a4;
- (void)advertiseForUnlockClassCIfNecessaryWithIgnoreScreenState:(BOOL)a3;
- (void)authenticateFor:(unint64_t)a3 sessionID:(id)a4 options:(id)a5;
- (void)canAuthenticateFor:(unint64_t)a3 deviceID:(id)a4 sessionID:(id)a5;
- (void)cancel:(id)a3;
- (void)disableFor:(unint64_t)a3 idsDeviceID:(id)a4 sessionID:(id)a5;
- (void)enableFor:(unint64_t)a3 deviceID:(id)a4 passcode:(id)a5 sessionID:(id)a6;
- (void)handleDelegateInvalidated;
- (void)handleStateChanged;
- (void)listEligibleDevicesFor:(unint64_t)a3 completionHandler:(id)a4;
- (void)registerForApprovalRequestsFor:(unint64_t)a3;
- (void)removeAuthenticationStateChangesObserverFor:(id)a3;
- (void)reportApprovalResultWithAcmToken:(id)a3 error:(id)a4 sessionID:(id)a5;
- (void)requestEnablementFor:(unint64_t)a3 deviceID:(id)a4 sessionID:(id)a5;
- (void)setDelegate:(id)a3;
- (void)start;
@end

@implementation SDAuthenticationManager

- (_TtP16DaemoniOSLibrary31SDAuthenticationManagerDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP16DaemoniOSLibrary31SDAuthenticationManagerDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

+ (_TtC16DaemoniOSLibrary23SDAuthenticationManager)shared
{
  if (qword_10096A198 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100994D10;

  return (_TtC16DaemoniOSLibrary23SDAuthenticationManager *)v2;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_queue));
}

- (_TtC16DaemoniOSLibrary23SDAuthenticationManager)initWithQueue:(id)a3
{
  return (_TtC16DaemoniOSLibrary23SDAuthenticationManager *)sub_1006CE628(a3);
}

- (void)start
{
  v2 = self;
  sub_1006D72DC();
}

- (void)listEligibleDevicesFor:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10097FA70;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10096EB10;
  v14[5] = v13;
  v15 = self;
  sub_10070697C((uint64_t)v9, (uint64_t)&unk_10096EB18, (uint64_t)v14);
  swift_release();
}

- (void)enableFor:(unint64_t)a3 deviceID:(id)a4 passcode:(id)a5 sessionID:(id)a6
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v14 = v13;
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = self;
  sub_1006DAD10(a3, v12, v14, v15, v17, (uint64_t)v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)requestEnablementFor:(unint64_t)a3 deviceID:(id)a4 sessionID:(id)a5
{
}

- (void)disableFor:(unint64_t)a3 idsDeviceID:(id)a4 sessionID:(id)a5
{
}

- (void)canAuthenticateFor:(unint64_t)a3 deviceID:(id)a4 sessionID:(id)a5
{
}

- (void)authenticateFor:(unint64_t)a3 sessionID:(id)a4 options:(id)a5
{
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v12 = a5;
  unint64_t v13 = self;
  sub_1006E0838(a3, v11, a5);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)cancel:(id)a3
{
}

- (void)registerForApprovalRequestsFor:(unint64_t)a3
{
  v3 = self;
  sub_100710EA0();
}

- (void)reportApprovalResultWithAcmToken:(id)a3 error:(id)a4 sessionID:(id)a5
{
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = a4;
  id v14 = a5;
  uint64_t v15 = self;
  if (a3)
  {
    id v16 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v18 = v17;
  }
  else
  {
    unint64_t v18 = 0xF000000000000000;
  }
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1006E3AB8((uint64_t)a3, v18, (uint64_t)a4, (uint64_t)v12);
  sub_100250CB0((uint64_t)a3, v18);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)addAuthenticationStateChangesObserver:(id)a3 identifier:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  uint64_t v10 = self;
  sub_1006E4A84((uint64_t)a3, (uint64_t)v9);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)removeAuthenticationStateChangesObserverFor:(id)a3
{
}

- (void)handleStateChanged
{
  v2 = self;
  sub_1006E5BC0();
}

- (void)advertiseForUnlockClassCIfNecessaryWithIgnoreScreenState:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_1006D6720(v3);
}

- (_TtC16DaemoniOSLibrary23SDAuthenticationManager)init
{
  result = (_TtC16DaemoniOSLibrary23SDAuthenticationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_delegate);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10024D338((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_idsService);
  sub_10024D338((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_securityManager);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_transportManager));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10070EE60((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_metrics, type metadata accessor for StateMetrics);
  swift_release();
  if (*(void *)&self->pairingLockSessionGenerator[OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_bioArmKeyInitiatorDeviceStream]) {
    sub_10024D338((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_bioArmKeyInitiatorDeviceStream);
  }
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_previousUnlockClassCLockDevice, &qword_10097BB50);
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_lastMacThatDidMacUnlockPhone, &qword_10097BB50);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_macUnlockPhoneSessionIDThatNeedsArmingUI, &qword_100974EA0);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)handleDelegateInvalidated
{
  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16DaemoniOSLibrary23SDAuthenticationManager_approveNearbyInfoAdvertiser))
  {
    v2 = self;
    swift_retain();
    sub_100329520();

    swift_release();
  }
}

@end