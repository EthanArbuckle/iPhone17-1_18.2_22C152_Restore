@interface NearbyTransitDeparturesProvider
- (NSArray)storeSubscriptionTypes;
- (_TtC4Maps31NearbyTransitDeparturesProvider)init;
- (id)ticketForTransitMapItemUpdater:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4;
- (void)transitMapItemUpdater:(id)a3 updatedMapItem:(id)a4 error:(id)a5;
- (void)transitMapItemUpdater:(id)a3 willUpdateMapItem:(id)a4;
@end

@implementation NearbyTransitDeparturesProvider

- (NSArray)storeSubscriptionTypes
{
  swift_bridgeObjectRetain();
  sub_1000FF33C(&qword_1015CD300);
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  sub_1000FF33C(&qword_1015CD300);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_storeSubscriptionTypes) = (Class)static Array._unconditionallyBridgeFromObjectiveC(_:)();

  swift_bridgeObjectRelease();
}

- (_TtC4Maps31NearbyTransitDeparturesProvider)init
{
  return (_TtC4Maps31NearbyTransitDeparturesProvider *)sub_100135D68();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider__referenceDate;
  uint64_t v4 = sub_1000FF33C(&qword_1015CF290);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider__categories;
  uint64_t v6 = sub_1000FF33C((uint64_t *)&unk_1015CF280);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider__state;
  uint64_t v8 = sub_1000FF33C(&qword_1015CF298);
  (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_requestedLocation));
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_100123CE4((uint64_t)self + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_delegate);
  sub_1000FF2E0((uint64_t)self + OBJC_IVAR____TtC4Maps31NearbyTransitDeparturesProvider_viewDelegate, (uint64_t *)&unk_1015CF2A0);
}

- (id)ticketForTransitMapItemUpdater:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = sub_100143560();

  return v6;
}

- (void)transitMapItemUpdater:(id)a3 willUpdateMapItem:(id)a4
{
  uint64_t v6 = qword_1015CBD38;
  id v7 = a3;
  id v13 = a4;
  uint64_t v8 = self;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_1000F2248(v9, (uint64_t)qword_101611760);
  v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Will update mapItem", v12, 2u);
    swift_slowDealloc();
  }
}

- (void)transitMapItemUpdater:(id)a3 updatedMapItem:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_1001436CC(v9, (uint64_t)a5);
}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_100143A9C((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)storeDidChangeWithTypes:(id)a3
{
  uint64_t v4 = sub_1000FF33C(&qword_1015CD250);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v9 = (void *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  id v10 = self;
  sub_100042AF4((uint64_t)v6, (uint64_t)&unk_1015CF270, (uint64_t)v9);

  swift_release();
}

@end