@interface CRLBoardLibrary
- (_TtC8Freeform15CRLBoardLibrary)init;
- (void)dealloc;
- (void)highlightControllerHighlightsDidChange:(id)a3 highlights:(id)a4;
- (void)updateBoardMetadataForNotification:(id)a3;
- (void)updateStoreSnapshotForHierarchyNotification:(id)a3;
@end

@implementation CRLBoardLibrary

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_100EEA30C();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(CRLBoardLibrary *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_userDataDeletionRequestObserver));
  swift_unknownObjectRelease();
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_networkReachabilityListener, &qword_1016791E0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_realTimeCollaborationDelegate);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform15CRLBoardLibrary_shareErrorObservers);
}

- (_TtC8Freeform15CRLBoardLibrary)init
{
  result = (_TtC8Freeform15CRLBoardLibrary *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)highlightControllerHighlightsDidChange:(id)a3 highlights:(id)a4
{
  type metadata accessor for CRLSharedHighlight();
  uint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  sub_100F35F3C(v6);

  swift_bridgeObjectRelease();
}

- (void)updateBoardMetadataForNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  sub_100F1C8D8((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)updateStoreSnapshotForHierarchyNotification:(id)a3
{
  uint64_t v4 = sub_1005057FC(&qword_101672BB0);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Notification();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8, v11);
  v12 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13, v14);
  v16 = (char *)&v22 - v15;
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 1, 1, v17);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v16, v8);
  type metadata accessor for MainActor();
  v18 = self;
  uint64_t v19 = static MainActor.shared.getter();
  unint64_t v20 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v21 = (char *)swift_allocObject();
  *((void *)v21 + 2) = v19;
  *((void *)v21 + 3) = &protocol witness table for MainActor;
  *((void *)v21 + 4) = v18;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v21[v20], v12, v8);
  sub_1005912D0((uint64_t)v7, (uint64_t)&unk_1016A2348, (uint64_t)v21);

  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
}

@end