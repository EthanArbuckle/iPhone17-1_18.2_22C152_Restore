@interface SDAirDropNearFieldService
- (_TtC16DaemoniOSLibrary25SDAirDropNearFieldService)init;
- (void)dealloc;
- (void)didDetectDeviceNearbyForNearFieldController:(id)a3;
- (void)handleAirDropAllowedChanged;
- (void)handleBuddyExited;
- (void)handleProximityAppleIDSignInCompleted;
- (void)handleProximityAppleIDSignInStarted;
- (void)handleSystemUIChanged;
- (void)handleWifiStateChanged;
- (void)keyBagLockStateChangeWithNotification:(id)a3;
- (void)nearFieldController:(id)a3 didBeginTransaction:(id)a4;
- (void)nearFieldController:(id)a3 didDetectDeviceNearbyWithInitiatorRole:(BOOL)a4;
- (void)nearFieldController:(id)a3 didInterruptTransaction:(id)a4 error:(id)a5;
- (void)nearFieldController:(id)a3 didInvalidateWithError:(id)a4;
- (void)nearFieldController:(id)a3 transaction:(id)a4 didReceiveTapEvent:(id)a5;
- (void)screenStateChangedWithNotification:(id)a3;
@end

@implementation SDAirDropNearFieldService

- (void)handleSystemUIChanged
{
}

- (void)dealloc
{
  v2 = self;
  sub_10028DAEC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_deviceStatus));
  sub_100261080((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_nearFieldController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10024D338((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_airDropUISessionManager);
  swift_release();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_processingTap, (uint64_t *)&unk_10096C480);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_localExchangePayload, &qword_10096C478);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_notificationCenter));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService__nearbySharingInteraction;
  uint64_t v4 = sub_10000A844(&qword_10096C530);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_pendingNearbySharingInteraction, (uint64_t *)&unk_10096C2A0);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary25SDAirDropNearFieldService_activeAirDropTransactionID, &qword_100974EA0);
}

- (void)keyBagLockStateChangeWithNotification:(id)a3
{
}

- (void)screenStateChangedWithNotification:(id)a3
{
}

- (void)handleAirDropAllowedChanged
{
}

- (void)handleWifiStateChanged
{
}

- (void)handleBuddyExited
{
}

- (void)handleProximityAppleIDSignInStarted
{
}

- (void)handleProximityAppleIDSignInCompleted
{
}

- (_TtC16DaemoniOSLibrary25SDAirDropNearFieldService)init
{
  result = (_TtC16DaemoniOSLibrary25SDAirDropNearFieldService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)nearFieldController:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v8 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v8 - 8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  uint64_t v12 = qword_100969B90;
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  id v16 = v14;
  id v17 = v13;
  v18 = v15;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v19 = static AirDropActor.shared;
  uint64_t v20 = sub_10000B980((unint64_t *)&qword_1009744A0, (void (*)(uint64_t))type metadata accessor for AirDropActor);
  v21 = (void *)swift_allocObject();
  v21[2] = v19;
  v21[3] = v20;
  v21[4] = v16;
  v21[5] = v17;
  v21[6] = v18;
  v21[7] = ObjectType;
  swift_retain();
  sub_1000092EC((uint64_t)v10, (uint64_t)&unk_10096C740, (uint64_t)v21);

  swift_release();
}

- (void)didDetectDeviceNearbyForNearFieldController:(id)a3
{
  uint64_t v5 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = qword_100969B90;
  v10 = self;
  id v11 = a3;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v12 = static AirDropActor.shared;
  uint64_t v13 = sub_10000B980((unint64_t *)&qword_1009744A0, (void (*)(uint64_t))type metadata accessor for AirDropActor);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  *(void *)(v14 + 24) = v13;
  *(unsigned char *)(v14 + 32) = 0;
  *(void *)(v14 + 40) = v10;
  swift_retain();
  sub_1000092EC((uint64_t)v7, (uint64_t)&unk_10096C730, v14);

  swift_release();
}

- (void)nearFieldController:(id)a3 didDetectDeviceNearbyWithInitiatorRole:(BOOL)a4
{
  uint64_t v7 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  uint64_t v11 = qword_100969B90;
  uint64_t v12 = self;
  id v13 = a3;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v14 = static AirDropActor.shared;
  uint64_t v15 = sub_10000B980((unint64_t *)&qword_1009744A0, (void (*)(uint64_t))type metadata accessor for AirDropActor);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  *(void *)(v16 + 24) = v15;
  *(unsigned char *)(v16 + 32) = a4;
  *(void *)(v16 + 40) = v12;
  swift_retain();
  sub_1000092EC((uint64_t)v9, (uint64_t)&unk_10096C728, v16);

  swift_release();
}

- (void)nearFieldController:(id)a3 didBeginTransaction:(id)a4
{
  swift_getObjectType();
  id v7 = a3;
  swift_unknownObjectRetain();
  uint64_t v8 = self;
  sub_1002AFB24((uint64_t)a4, v8);

  swift_unknownObjectRelease();
}

- (void)nearFieldController:(id)a3 transaction:(id)a4 didReceiveTapEvent:(id)a5
{
  uint64_t v9 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = qword_100969B90;
  swift_unknownObjectRetain_n();
  id v14 = a5;
  uint64_t v15 = self;
  id v16 = v14;
  uint64_t v17 = v15;
  id v18 = a3;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v19 = static AirDropActor.shared;
  uint64_t v20 = sub_10000B980((unint64_t *)&qword_1009744A0, (void (*)(uint64_t))type metadata accessor for AirDropActor);
  v21 = (void *)swift_allocObject();
  v21[2] = v19;
  v21[3] = v20;
  v21[4] = a4;
  v21[5] = v16;
  v21[6] = v17;
  swift_retain();
  sub_1000092EC((uint64_t)v11, (uint64_t)&unk_10096C718, (uint64_t)v21);

  swift_unknownObjectRelease();
  swift_release();
}

- (void)nearFieldController:(id)a3 didInterruptTransaction:(id)a4 error:(id)a5
{
  uint64_t v9 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  uint64_t v13 = qword_100969B90;
  swift_unknownObjectRetain_n();
  id v14 = self;
  id v15 = a3;
  id v16 = a5;
  if (v13 != -1) {
    swift_once();
  }
  uint64_t v17 = static AirDropActor.shared;
  uint64_t v18 = sub_10000B980((unint64_t *)&qword_1009744A0, (void (*)(uint64_t))type metadata accessor for AirDropActor);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = v17;
  v19[3] = v18;
  v19[4] = a4;
  v19[5] = v14;
  swift_retain();
  sub_1000092EC((uint64_t)v11, (uint64_t)&unk_10096C708, (uint64_t)v19);

  swift_unknownObjectRelease();
  swift_release();
}

@end