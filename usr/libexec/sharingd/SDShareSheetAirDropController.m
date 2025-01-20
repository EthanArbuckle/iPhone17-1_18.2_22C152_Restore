@interface SDShareSheetAirDropController
- (BOOL)hasActiveNearbySharingInteraction;
- (NSArray)availableNodes;
- (NSString)sessionID;
- (OS_dispatch_queue)queue;
- (SDShareSheetAirDropController)init;
- (SDShareSheetAirDropController)initWithSessionID:(id)a3 queue:(id)a4;
- (SDShareSheetAirDropControllerDelegate)delegate;
- (SDXPCHelperConnection)helperConnection;
- (id)availableNodesChangedHandler;
- (id)transferUpdateChangedHandler;
- (void)activateWithBundleID:(id)a3;
- (void)cancelCurrentSend;
- (void)invalidate;
- (void)send:(id)a3 to:(id)a4 itemPreviewData:(id)a5 requestSource:(id)a6;
- (void)setAvailableNodes:(id)a3;
- (void)setAvailableNodesChangedHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHelperConnection:(id)a3;
- (void)setTransferUpdateChangedHandler:(id)a3;
@end

@implementation SDShareSheetAirDropController

- (NSString)sessionID
{
  return (NSString *)sub_10060F6F0();
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___SDShareSheetAirDropController_queue));
}

- (SDXPCHelperConnection)helperConnection
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (SDXPCHelperConnection *)Strong;
}

- (void)setHelperConnection:(id)a3
{
}

- (SDShareSheetAirDropControllerDelegate)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (SDShareSheetAirDropControllerDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (id)transferUpdateChangedHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler))
  {
    uint64_t v2 = *(void *)&self->browser[OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_1002670F0;
    v5[3] = &unk_1008E2438;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setTransferUpdateChangedHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_100448C78;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler);
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;

  sub_1002CA430(v8);
}

- (id)availableNodesChangedHandler
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler))
  {
    uint64_t v2 = *(void *)&self->browser[OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler];
    v5[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler);
    v5[5] = v2;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 1107296256;
    v5[2] = sub_100606188;
    v5[3] = &unk_1008E23E8;
    v3 = _Block_copy(v5);
    swift_retain();
    swift_release();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setAvailableNodesChangedHandler:(id)a3
{
  uint64_t v4 = (uint64_t)_Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = v5;
    v6 = sub_100611AE4;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(uint64_t))((char *)self
                                     + OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler);
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler);
  *v7 = v6;
  v7[1] = (void (*)(uint64_t))v4;

  sub_1002CA430(v8);
}

- (NSArray)availableNodes
{
  swift_bridgeObjectRetain();
  sub_10000A844(&qword_10097C400);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setAvailableNodes:(id)a3
{
  sub_10000A844(&qword_10097C400);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SDShareSheetAirDropController_availableNodes) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (BOOL)hasActiveNearbySharingInteraction
{
  uint64_t v3 = sub_10000A844((uint64_t *)&unk_10096C2A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___SDShareSheetAirDropController_currentNearbySharingInteraction;
  swift_beginAccess();
  sub_10024A330((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_10096C2A0);
  uint64_t v7 = type metadata accessor for SFAirDrop.NearbySharingInteraction();
  LOBYTE(v6) = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 48))(v5, 1, v7) != 1;
  sub_10000A7E8((uint64_t)v5, (uint64_t *)&unk_10096C2A0);
  return (char)v6;
}

- (SDShareSheetAirDropController)initWithSessionID:(id)a3 queue:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (SDShareSheetAirDropController *)sub_1006064C0(v5, v6, a4);
}

- (void)activateWithBundleID:(id)a3
{
  uint64_t v4 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  uint64_t v11 = qword_100969B90;
  v12 = self;
  swift_bridgeObjectRetain();
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = static AirDropActor.shared;
  uint64_t v14 = sub_10061044C((unint64_t *)&qword_1009744A0, (void (*)(uint64_t))type metadata accessor for AirDropActor);
  v15 = (void *)swift_allocObject();
  v15[2] = v13;
  v15[3] = v14;
  v15[4] = v12;
  v15[5] = v7;
  v15[6] = v9;
  swift_retain();
  sub_10028CFA8((uint64_t)v6, (uint64_t)&unk_10097C3E8, (uint64_t)v15);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)invalidate
{
  uint64_t v3 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = qword_100969B90;
  uint64_t v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = static AirDropActor.shared;
  uint64_t v10 = sub_10061044C((unint64_t *)&qword_1009744A0, (void (*)(uint64_t))type metadata accessor for AirDropActor);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v9;
  v11[3] = v10;
  v11[4] = v8;
  swift_retain();
  sub_10028CFA8((uint64_t)v5, (uint64_t)&unk_10097C3D0, (uint64_t)v11);
  swift_release();
}

- (void)send:(id)a3 to:(id)a4 itemPreviewData:(id)a5 requestSource:(id)a6
{
  uint64_t v9 = sub_10000A844(&qword_10096C920);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for UUID();
  uint64_t v45 = *(void *)(v12 - 8);
  uint64_t v13 = *(void *)(v45 + 64);
  uint64_t v14 = __chkstk_darwin(v12);
  v15 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v40 - v16;
  type metadata accessor for URL();
  uint64_t v46 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v47 = self;
  if (!a5)
  {
    id v24 = a6;
    v25 = self;
    unint64_t v43 = 0xF000000000000000;
    uint64_t v44 = 0;
    if (a6) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v41 = 0;
    uint64_t v42 = 0;
    goto LABEL_6;
  }
  id v18 = a6;
  v19 = self;
  id v20 = a5;
  uint64_t v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v43 = v22;
  uint64_t v44 = v21;

  if (!a6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v42 = v23;

LABEL_6:
  uint64_t v26 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v11, 1, 1, v26);
  uint64_t v27 = v45;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v15, v17, v12);
  unint64_t v28 = (*(unsigned __int8 *)(v27 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
  unint64_t v29 = (v13 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v30 = (v29 + 15) & 0xFFFFFFFFFFFFFFF8;
  v40 = v17;
  uint64_t v31 = v12;
  v32 = (char *)swift_allocObject();
  *((void *)v32 + 2) = 0;
  *((void *)v32 + 3) = 0;
  v33 = v47;
  *((void *)v32 + 4) = v47;
  (*(void (**)(char *, char *, uint64_t))(v27 + 32))(&v32[v28], v15, v12);
  *(void *)&v32[v29] = v46;
  v34 = (uint64_t *)&v32[v30];
  unint64_t v36 = v43;
  uint64_t v35 = v44;
  uint64_t *v34 = v44;
  v34[1] = v36;
  v37 = (uint64_t *)&v32[(v30 + 23) & 0xFFFFFFFFFFFFFFF8];
  uint64_t v38 = v42;
  uint64_t *v37 = v41;
  v37[1] = v38;
  v39 = v33;
  swift_bridgeObjectRetain();
  sub_100278C78(v35, v36);
  swift_bridgeObjectRetain();
  sub_10028CFA8((uint64_t)v11, (uint64_t)&unk_10097C340, (uint64_t)v32);
  swift_release();
  swift_bridgeObjectRelease();
  sub_100250CB0(v35, v36);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v27 + 8))(v40, v31);
}

- (void)cancelCurrentSend
{
  NSArray v2 = self;
  sub_10060B380();
}

- (SDShareSheetAirDropController)init
{
  result = (SDShareSheetAirDropController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_100261080((uint64_t)self + OBJC_IVAR___SDShareSheetAirDropController_delegate);
  swift_release();
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___SDShareSheetAirDropController_transferUpdateChangedHandler));
  sub_1002CA430(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___SDShareSheetAirDropController_availableNodesChangedHandler));
  swift_bridgeObjectRelease();
  swift_release();
  sub_10000A7E8((uint64_t)self + OBJC_IVAR___SDShareSheetAirDropController_currentNearbySharingInteraction, (uint64_t *)&unk_10096C2A0);
}

@end